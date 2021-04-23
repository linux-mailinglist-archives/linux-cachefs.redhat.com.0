Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE2F369438
	for <lists+linux-cachefs@lfdr.de>; Fri, 23 Apr 2021 15:56:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619186169;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oMgZz/aG41fSkczClwmluFvVz+xy5tyGejfD29Xo1z0=;
	b=d4y3hDxcIxHaZNaKGmVurYZ2Z0ByPGloRnmAzaPVMqaR1cDUOU/MjcqSvc9P5hAhPju1O3
	+17nbIJs5rmyesv//9+/tInXeMu6HfvlTCC46lsqw+kY49MebbEN49HiMVaJzBdV9hFQ6t
	+vEo7D52BvWEaIqHOcNuwNSDxcDnKQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-zDEOcivjP6mQh0gpzfXlmg-1; Fri, 23 Apr 2021 09:56:06 -0400
X-MC-Unique: zDEOcivjP6mQh0gpzfXlmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FDB083DD34;
	Fri, 23 Apr 2021 13:56:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32E0450A8B;
	Fri, 23 Apr 2021 13:56:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D8071806D24;
	Fri, 23 Apr 2021 13:56:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13NDWiDQ023066 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 23 Apr 2021 09:32:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 023431B480; Fri, 23 Apr 2021 13:32:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-124.rdu2.redhat.com
	[10.10.112.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 929935DDAD;
	Fri, 23 Apr 2021 13:32:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-fsdevel@vger.kernel.org
Date: Fri, 23 Apr 2021 14:32:34 +0100
Message-ID: <161918475483.3145707.16895916870392318058.stgit@warthog.procyon.org.uk>
In-Reply-To: <161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
References: <161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 23 Apr 2021 09:55:53 -0400
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: [Linux-cachefs] [PATCH v7 20/31] afs: Print the operation debug_id
 when logging an unexpected data version
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

Print the afs_operation debug_id when logging an unexpected change in the
data version.  This allows the logged message to be matched against
tracelines.

Signed-off-by: David Howells <dhowells@redhat.com>
Tested-By: Marc Dionne <marc.dionne@auristor.com>
cc: linux-afs@lists.infradead.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
Link: https://lore.kernel.org/r/160588528377.3465195.2206051235095182302.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/161118146111.1232039.11398082422487058312.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/161161042180.2537118.2471333561661033316.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/161340405772.1303470.3877167548944248214.stgit@warthog.procyon.org.uk/ # v3
Link: https://lore.kernel.org/r/161539549628.286939.15234870409714613954.stgit@warthog.procyon.org.uk/ # v4
Link: https://lore.kernel.org/r/161653805530.2770958.15120507632529970934.stgit@warthog.procyon.org.uk/ # v5
Link: https://lore.kernel.org/r/161789088290.6155.3494369629853673866.stgit@warthog.procyon.org.uk/ # v6
---

 fs/afs/inode.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 8de6f05987b4..a4bb3ac762be 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -214,11 +214,12 @@ static void afs_apply_status(struct afs_operation *op,
 
 	if (vp->dv_before + vp->dv_delta != status->data_version) {
 		if (test_bit(AFS_VNODE_CB_PROMISED, &vnode->flags))
-			pr_warn("kAFS: vnode modified {%llx:%llu} %llx->%llx %s\n",
+			pr_warn("kAFS: vnode modified {%llx:%llu} %llx->%llx %s (op=%x)\n",
 				vnode->fid.vid, vnode->fid.vnode,
 				(unsigned long long)vp->dv_before + vp->dv_delta,
 				(unsigned long long)status->data_version,
-				op->type ? op->type->name : "???");
+				op->type ? op->type->name : "???",
+				op->debug_id);
 
 		vnode->invalid_before = status->data_version;
 		if (vnode->status.type == AFS_FTYPE_DIR) {


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

