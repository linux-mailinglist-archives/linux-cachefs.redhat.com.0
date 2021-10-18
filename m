Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 795BE432117
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 16:58:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569134;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WmqHHD0+wdiyo/mZcgw0ONcCUEpIpYU6DuF1Z6dfuX4=;
	b=DOZqwiY/yyOx87SdbEY7XINwcfzhEFT+LbxGTU/poGSYuwwHLwWhsliiJDIXc+qAth3kBI
	42odVku9HF2UzBpnIu+ao6ZqdrxAJggP8eyYKHQcHyaR9oBiGcjDJrDCyowUIDQ2h9zSzc
	XBM+zWfivCe4fziJ2imxpCgdtcPJgwQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-Bh3kDeRjMpCBPdBGWr_JfA-1; Mon, 18 Oct 2021 10:58:51 -0400
X-MC-Unique: Bh3kDeRjMpCBPdBGWr_JfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1525210A8E00;
	Mon, 18 Oct 2021 14:58:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07AA86911C;
	Mon, 18 Oct 2021 14:58:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 151241806D03;
	Mon, 18 Oct 2021 14:58:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IEwkxE028791 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 10:58:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C9882C6ED; Mon, 18 Oct 2021 14:58:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B9076788F;
	Mon, 18 Oct 2021 14:58:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 15:58:04 +0100
Message-ID: <163456908429.2614702.18199815281243741948.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH 30/67] cachefiles: Round the cachefile size
 up to DIO block size
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

Round the size of a cachefile up to DIO block size so that we can always
read back the last partial page of a file using direct I/O.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/bind.c      |    3 ++-
 fs/cachefiles/interface.c |    2 ++
 fs/cachefiles/internal.h  |    2 ++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
index af7386ad14af..4ea8c93e14d8 100644
--- a/fs/cachefiles/bind.c
+++ b/fs/cachefiles/bind.c
@@ -126,7 +126,8 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 	    !d_backing_inode(root)->i_op->mkdir ||
 	    !(d_backing_inode(root)->i_opflags & IOP_XATTR) ||
 	    !root->d_sb->s_op->statfs ||
-	    !root->d_sb->s_op->sync_fs)
+	    !root->d_sb->s_op->sync_fs ||
+	    root->d_sb->s_blocksize > PAGE_SIZE)
 		goto error_unsupported;
 
 	ret = -EROFS;
diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 8f98e5c27d66..3e678ab14c85 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -268,6 +268,7 @@ static int cachefiles_attr_changed(struct cachefiles_object *object)
 	int ret;
 
 	ni_size = object->cookie->object_size;
+	ni_size = round_up(ni_size, CACHEFILES_DIO_BLOCK_SIZE);
 
 	_enter("{OBJ%x},[%llu]",
 	       object->debug_id, (unsigned long long) ni_size);
@@ -346,6 +347,7 @@ static void cachefiles_invalidate_object(struct cachefiles_object *object)
 				       cachefiles_trunc_invalidate);
 		ret = vfs_truncate(&file->f_path, 0);
 		if (ret == 0) {
+			ni_size = round_up(ni_size, CACHEFILES_DIO_BLOCK_SIZE);
 			trace_cachefiles_trunc(object, file_inode(file),
 					       0, ni_size,
 					       cachefiles_trunc_set_size);
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 4705f968e661..ff00c5249f4f 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -19,6 +19,8 @@
 #include <linux/workqueue.h>
 #include <linux/security.h>
 
+#define CACHEFILES_DIO_BLOCK_SIZE 4096
+
 struct cachefiles_cache;
 struct cachefiles_object;
 


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

