Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7EB56A35F
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Jul 2022 15:21:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657200117;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iEofi+NBrKIe/4b3e1yIIyUYY4FD06xt0kSDTNwPyYE=;
	b=hfLCQfJEyI3iksjkA4ePyP/MR3vHP3gqM0DqvpMFBcK/d7bxSRXpq1Wn+M4OE/q7RyTOT4
	sb69IWbLPiGh2/WLwiDBXHsdiqSeLWFOOxYRJ/+L3S7K+1LFjvXv9ECdaReJvrDcIQDuif
	QFZI66919ck1fFdxvycerQ/Is5ybaao=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-ROn-oD9YNVGK_e4xp-RGPA-1; Thu, 07 Jul 2022 09:21:53 -0400
X-MC-Unique: ROn-oD9YNVGK_e4xp-RGPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EC99185A794;
	Thu,  7 Jul 2022 13:21:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 691211121315;
	Thu,  7 Jul 2022 13:21:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 01EA1194706C;
	Thu,  7 Jul 2022 13:21:49 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A4C601947069 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Jul 2022 13:21:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 836592166B2A; Thu,  7 Jul 2022 13:21:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE4542166B29;
 Thu,  7 Jul 2022 13:21:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220707045112.10177-1-xiubli@redhat.com>
References: <20220707045112.10177-1-xiubli@redhat.com>
To: xiubli@redhat.com
MIME-Version: 1.0
Date: Thu, 07 Jul 2022 14:21:45 +0100
Message-ID: <2520851.1657200105@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH v4] netfs: do not unlock and put the folio
 twice
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: keescook@chromium.org, jlayton@kernel.org, linux-kernel@vger.kernel.org,
 willy@infradead.org, william.kucharski@oracle.com, linux-cachefs@redhat.com,
 vshankar@redhat.com, marc.dionne@auristor.com, ceph-devel@vger.kernel.org,
 idryomov@gmail.com, linux-afs@lists.infradead.org,
 kirill.shutemov@linux.intel.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2520850.1657200105.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Here's my take on this.  I've made the error: path handle folio == NULL, so
you don't need to split that error case.  I've also changed
->check_write_begin() so that it returns 0, not -EAGAIN, if we drop the folio;
the process is retried then if the folio pointer got cleared.

As a result, you don't have to discard the page if you want to return an error
and thus don't need the additional afs patch

David
---
commit 8489c89f6a186272593ab5e3fffbd47ea21185b7
Author: Xiubo Li <xiubli@redhat.com>
Date:   Thu Jul 7 12:51:11 2022 +0800

    netfs: do not unlock and put the folio twice
    
    check_write_begin() will unlock and put the folio when return
    non-zero.  So we should avoid unlocking and putting it twice in
    netfs layer.
    
    Change the way ->check_write_begin() works in the following two ways:
    
     (1) Pass it a pointer to the folio pointer, allowing it to unlock and put
         the folio prior to doing the stuff it wants to do, provided it clears
         the folio pointer.
    
     (2) Change the return values such that 0 with folio pointer set means
         continue, 0 with folio pointer cleared means re-get and all error
         codes indicating an error (no special treatment for -EAGAIN).
    
    Link: https://tracker.ceph.com/issues/56423
    Link: https://lore.kernel.org/r/20220707045112.10177-2-xiubli@redhat.com/
    Signed-off-by: Xiubo Li <xiubli@redhat.com>
    Co-developed-by: David Howells <dhowells@redhat.com>
    Signed-off-by: David Howells <dhowells@redhat.com>

diff --git a/Documentation/filesystems/netfs_library.rst b/Documentation/filesystems/netfs_library.rst
index 4d19b19bcc08..89085e1c22db 100644
--- a/Documentation/filesystems/netfs_library.rst
+++ b/Documentation/filesystems/netfs_library.rst
@@ -301,7 +301,7 @@ through which it can issue requests and negotiate::
 		void (*issue_read)(struct netfs_io_subrequest *subreq);
 		bool (*is_still_valid)(struct netfs_io_request *rreq);
 		int (*check_write_begin)(struct file *file, loff_t pos, unsigned len,
-					 struct folio *folio, void **_fsdata);
+					 struct folio **_folio, void **_fsdata);
 		void (*done)(struct netfs_io_request *rreq);
 	};
 
@@ -381,8 +381,10 @@ The operations are as follows:
    allocated/grabbed the folio to be modified to allow the filesystem to flush
    conflicting state before allowing it to be modified.
 
-   It should return 0 if everything is now fine, -EAGAIN if the folio should be
-   regrabbed and any other error code to abort the operation.
+   It may unlock and discard the folio it was given and set the caller's folio
+   pointer to NULL.  It should return 0 if everything is now fine (*_folio
+   left set) or the op should be retried (*_folio cleared) and any other error
+   code to abort the operation.
 
  * ``done``
 
diff --git a/fs/afs/file.c b/fs/afs/file.c
index 42118a4f3383..afacce797fb9 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -375,7 +375,7 @@ static int afs_begin_cache_operation(struct netfs_io_request *rreq)
 }
 
 static int afs_check_write_begin(struct file *file, loff_t pos, unsigned len,
-				 struct folio *folio, void **_fsdata)
+				 struct folio **folio, void **_fsdata)
 {
 	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
 
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 6dee88815491..ab070a24ca23 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -63,7 +63,7 @@
 	 (CONGESTION_ON_THRESH(congestion_kb) >> 2))
 
 static int ceph_netfs_check_write_begin(struct file *file, loff_t pos, unsigned int len,
-					struct folio *folio, void **_fsdata);
+					struct folio **folio, void **_fsdata);
 
 static inline struct ceph_snap_context *page_snap_context(struct page *page)
 {
@@ -1288,18 +1288,19 @@ ceph_find_incompatible(struct page *page)
 }
 
 static int ceph_netfs_check_write_begin(struct file *file, loff_t pos, unsigned int len,
-					struct folio *folio, void **_fsdata)
+					struct folio **folio, void **_fsdata)
 {
 	struct inode *inode = file_inode(file);
 	struct ceph_inode_info *ci = ceph_inode(inode);
 	struct ceph_snap_context *snapc;
 
-	snapc = ceph_find_incompatible(folio_page(folio, 0));
+	snapc = ceph_find_incompatible(folio_page(*folio, 0));
 	if (snapc) {
 		int r;
 
-		folio_unlock(folio);
-		folio_put(folio);
+		folio_unlock(*folio);
+		folio_put(*folio);
+		*folio = NULL;
 		if (IS_ERR(snapc))
 			return PTR_ERR(snapc);
 
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 42f892c5712e..69bbf1c25cf4 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -319,8 +319,9 @@ static bool netfs_skip_folio_read(struct folio *folio, loff_t pos, size_t len,
  * conflicting writes once the folio is grabbed and locked.  It is passed a
  * pointer to the fsdata cookie that gets returned to the VM to be passed to
  * write_end.  It is permitted to sleep.  It should return 0 if the request
- * should go ahead; unlock the folio and return -EAGAIN to cause the folio to
- * be regot; or return an error.
+ * should go ahead or it may return an error.  It may also unlock and put the
+ * folio, provided it sets *_folio to NULL, in which case a return of 0 will
+ * cause the folio to be re-got and the process to be retried.
  *
  * The calling netfs must initialise a netfs context contiguous to the vfs
  * inode before calling this.
@@ -348,13 +349,13 @@ int netfs_write_begin(struct netfs_inode *ctx,
 
 	if (ctx->ops->check_write_begin) {
 		/* Allow the netfs (eg. ceph) to flush conflicts. */
-		ret = ctx->ops->check_write_begin(file, pos, len, folio, _fsdata);
+		ret = ctx->ops->check_write_begin(file, pos, len, &folio, _fsdata);
 		if (ret < 0) {
 			trace_netfs_failure(NULL, NULL, ret, netfs_fail_check_write_begin);
-			if (ret == -EAGAIN)
-				goto retry;
 			goto error;
 		}
+		if (!folio)
+			goto retry;
 	}
 
 	if (folio_test_uptodate(folio))
@@ -416,8 +417,10 @@ int netfs_write_begin(struct netfs_inode *ctx,
 error_put:
 	netfs_put_request(rreq, false, netfs_rreq_trace_put_failed);
 error:
-	folio_unlock(folio);
-	folio_put(folio);
+	if (folio) {
+		folio_unlock(folio);
+		folio_put(folio);
+	}
 	_leave(" = %d", ret);
 	return ret;
 }
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 1773e5df8e65..6ab5d56dac74 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -214,7 +214,7 @@ struct netfs_request_ops {
 	void (*issue_read)(struct netfs_io_subrequest *subreq);
 	bool (*is_still_valid)(struct netfs_io_request *rreq);
 	int (*check_write_begin)(struct file *file, loff_t pos, unsigned len,
-				 struct folio *folio, void **_fsdata);
+				 struct folio **_folio, void **_fsdata);
 	void (*done)(struct netfs_io_request *rreq);
 };
 
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

