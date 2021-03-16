Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC0233D31C
	for <lists+linux-cachefs@lfdr.de>; Tue, 16 Mar 2021 12:35:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615894508;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SfYPwgBngd+PMbQfmNTWwtU8b/P6Z5vO0bMWsnbw3js=;
	b=UqaNoJ7hRuuGaNDlEEciBxF5x+CJdl/O0DOntK8Xa0NzqOVliMpNtHGJ8bWHXkO+rDkwnS
	89qVn1i52kZZ28FaEU0nApZpJoQcXantDSSQJofhPyPr4J0/Brp3rplI2tqEvZOElaBSQp
	J6HD1z/oHFzow8j1Wvo3gG18SkzYqOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-5DOekdJ8N2yFmC4K8a0F0A-1; Tue, 16 Mar 2021 07:35:06 -0400
X-MC-Unique: 5DOekdJ8N2yFmC4K8a0F0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61680801817;
	Tue, 16 Mar 2021 11:35:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF5B85C3E6;
	Tue, 16 Mar 2021 11:35:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4DB831800657;
	Tue, 16 Mar 2021 11:34:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12GBYqJQ022578 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Mar 2021 07:34:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0411E610AF; Tue, 16 Mar 2021 11:34:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-152.rdu2.redhat.com
	[10.10.118.152])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 96C3C60C0F;
	Tue, 16 Mar 2021 11:34:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <161539537375.286939.16642940088716990995.stgit@warthog.procyon.org.uk>
References: <161539537375.286939.16642940088716990995.stgit@warthog.procyon.org.uk>
	<161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
To: Trond Myklebust <trondmy@hammerspace.com>
MIME-Version: 1.0
Date: Tue, 16 Mar 2021 11:34:44 +0000
Message-ID: <3184204.1615894484@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12GBYqJQ022578
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 08/28] netfs: Provide readahead and
	readpage netfs helpers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3184203.1615894484.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I'm going to make the code generate more information when warning about a
subread reporting having over-read (see attached).

David
---
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index ce11ca4c32e4..765e88ee132d 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -641,7 +641,10 @@ void netfs_subreq_terminated(struct netfs_read_subrequest *subreq,
 		goto failed;
 	}
 
-	if (WARN_ON(transferred_or_error > subreq->len - subreq->transferred))
+	if (WARN(transferred_or_error > subreq->len - subreq->transferred,
+		 "R%x[%x] %zd > %zu - %zu",
+		 rreq->debug_id, subreq->debug_index,
+		 transferred_or_error, subreq->len, subreq->transferred))
 		transferred_or_error = subreq->len - subreq->transferred;
 
 	subreq->error = 0;

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

