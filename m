Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1894932284E
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Feb 2021 10:59:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614074389;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QyeEPu+dg/dIDA+gyvA1kxl2sfIsXKmYjXc1vCtNrjA=;
	b=PwxgTJ3BSy1ZJgNPzrwUu9Pg2DoiUfnXC477CcB9l2dq4Wcqx5gHO7HmvApGf8WFz9Litd
	ONJYqZy5MVNrp8Xct0pULEKMQAcJ9gTa26BHou3vtKO1EIrFc5DWAUwigUrxc7IZbpRG1/
	MMmh/A+OnAR8yjLA2Rx0j8QrQ//zSGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-iMPij-1lMwalZ58ar__low-1; Tue, 23 Feb 2021 04:59:45 -0500
X-MC-Unique: iMPij-1lMwalZ58ar__low-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C76F801AB0;
	Tue, 23 Feb 2021 09:59:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A6A2722CE;
	Tue, 23 Feb 2021 09:59:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53CB15807A;
	Tue, 23 Feb 2021 09:59:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11FFmI4I023283 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 15 Feb 2021 10:48:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1A0045DA2D; Mon, 15 Feb 2021 15:48:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com
	[10.10.119.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D6385D9CD;
	Mon, 15 Feb 2021 15:48:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Mon, 15 Feb 2021 15:48:11 +0000
Message-ID: <161340409118.1303470.17812607349396199116.stgit@warthog.procyon.org.uk>
In-Reply-To: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 23 Feb 2021 04:59:25 -0500
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 20/33] afs: Log remote unmarshalling errors
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Log unmarshalling errors reported by the peer (ie. it can't parse what we
sent it).  Limit the maximum number of messages to 3.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-afs@lists.infradead.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
---

 fs/afs/rxrpc.c |   34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index 0ec38b758f29..ae68576f822f 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -500,6 +500,39 @@ void afs_make_call(struct afs_addr_cursor *ac, struct afs_call *call, gfp_t gfp)
 	_leave(" = %d", ret);
 }
 
+/*
+ * Log remote abort codes that indicate that we have a protocol disagreement
+ * with the server.
+ */
+static void afs_log_error(struct afs_call *call, s32 remote_abort)
+{
+	static int max = 0;
+	const char *msg;
+	int m;
+
+	switch (remote_abort) {
+	case RX_EOF:		 msg = "unexpected EOF";	break;
+	case RXGEN_CC_MARSHAL:	 msg = "client marshalling";	break;
+	case RXGEN_CC_UNMARSHAL: msg = "client unmarshalling";	break;
+	case RXGEN_SS_MARSHAL:	 msg = "server marshalling";	break;
+	case RXGEN_SS_UNMARSHAL: msg = "server unmarshalling";	break;
+	case RXGEN_DECODE:	 msg = "opcode decode";		break;
+	case RXGEN_SS_XDRFREE:	 msg = "server XDR cleanup";	break;
+	case RXGEN_CC_XDRFREE:	 msg = "client XDR cleanup";	break;
+	case -32:		 msg = "insufficient data";	break;
+	default:
+		return;
+	}
+
+	m = max;
+	if (m < 3) {
+		max = m + 1;
+		pr_notice("kAFS: Peer reported %s failure on %s [%pISp]\n",
+			  msg, call->type->name,
+			  &call->alist->addrs[call->addr_ix].transport);
+	}
+}
+
 /*
  * deliver messages to a call
  */
@@ -563,6 +596,7 @@ static void afs_deliver_to_call(struct afs_call *call)
 			goto out;
 		case -ECONNABORTED:
 			ASSERTCMP(state, ==, AFS_CALL_COMPLETE);
+			afs_log_error(call, call->abort_code);
 			goto done;
 		case -ENOTSUPP:
 			abort_code = RXGEN_OPCODE;


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

