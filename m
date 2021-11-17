Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B03455040
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Nov 2021 23:17:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637187458;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Dn56+nyq+sXXR3YKnVRyVvI4opJH1pNUlwWcZLVxMUU=;
	b=JB7KiOkSBsxjIhnRdJcq6kpxneTDlsy1HDPPO43+OgrBP5Mx42yTkx+H1kifKeK5KwrVlj
	kdO75xFQDWqT/tEfcR4RdgMRjiBO4Hhoi2ldT41IJ1LY1klNHkFhGq3wlVEZgxfEUJsXwp
	xUoWc9d19SzuLC3TNWwsvIJnSY13vHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-3T_2MtbMPAWDV63m_-mNJA-1; Wed, 17 Nov 2021 17:17:34 -0500
X-MC-Unique: 3T_2MtbMPAWDV63m_-mNJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24096420EF;
	Wed, 17 Nov 2021 22:17:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17CA114104;
	Wed, 17 Nov 2021 22:17:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D98BE1832DD2;
	Wed, 17 Nov 2021 22:17:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHMHQXW031002 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 17:17:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E8BD719811; Wed, 17 Nov 2021 22:17:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.32.4])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69F17604CC;
	Wed, 17 Nov 2021 22:17:26 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 17 Nov 2021 17:17:14 -0500
Message-Id: <1637187438-18858-4-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1637187438-18858-1-git-send-email-dwysocha@redhat.com>
References: <1637187438-18858-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 3/7] NFS: Rename fscache read and write
	pages functions
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
MIME-Version: 1.0
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename NFS fscache functions in a more consistent fashion
to better reflect when we read from and write to fscache.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/fscache.c | 32 ++++++++++++++++----------------
 fs/nfs/fscache.h | 25 ++++++++++++-------------
 fs/nfs/read.c    |  6 +++---
 3 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index ebc91e4b7655..cb701d9c4e47 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -377,12 +377,12 @@ void __nfs_fscache_invalidate_page(struct page *page, struct inode *inode)
  * Handle completion of a page being read from the cache.
  * - Called in process (keventd) context.
  */
-static void nfs_readpage_from_fscache_complete(struct page *page,
+static void nfs_fscache_read_page_complete(struct page *page,
 					       void *context,
 					       int error)
 {
 	dfprintk(FSCACHE,
-		 "NFS: readpage_from_fscache_complete (0x%p/0x%p/%d)\n",
+		 "NFS: fscache_read_page_complete (0x%p/0x%p/%d)\n",
 		 page, context, error);
 
 	/*
@@ -399,7 +399,7 @@ static void nfs_readpage_from_fscache_complete(struct page *page,
 /*
  * Retrieve a page from fscache
  */
-int __nfs_readpage_from_fscache(struct nfs_open_context *ctx,
+int __nfs_fscache_read_page(struct nfs_open_context *ctx,
 				struct inode *inode, struct page *page)
 {
 	int ret;
@@ -415,14 +415,14 @@ int __nfs_readpage_from_fscache(struct nfs_open_context *ctx,
 
 	ret = fscache_read_or_alloc_page(nfs_i_fscache(inode),
 					 page,
-					 nfs_readpage_from_fscache_complete,
+					 nfs_fscache_read_page_complete,
 					 ctx,
 					 GFP_KERNEL);
 
 	switch (ret) {
 	case 0: /* read BIO submitted (page in fscache) */
 		dfprintk(FSCACHE,
-			 "NFS:    readpage_from_fscache: BIO submitted\n");
+			 "NFS:    fscache_read_page: BIO submitted\n");
 		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_OK);
 		return ret;
 
@@ -430,11 +430,11 @@ int __nfs_readpage_from_fscache(struct nfs_open_context *ctx,
 	case -ENODATA: /* page not in cache */
 		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL);
 		dfprintk(FSCACHE,
-			 "NFS:    readpage_from_fscache %d\n", ret);
+			 "NFS:    fscache_read_page %d\n", ret);
 		return 1;
 
 	default:
-		dfprintk(FSCACHE, "NFS:    readpage_from_fscache %d\n", ret);
+		dfprintk(FSCACHE, "NFS:    fscache_read_page %d\n", ret);
 		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL);
 	}
 	return ret;
@@ -443,7 +443,7 @@ int __nfs_readpage_from_fscache(struct nfs_open_context *ctx,
 /*
  * Retrieve a set of pages from fscache
  */
-int __nfs_readpages_from_fscache(struct nfs_open_context *ctx,
+int __nfs_fscache_read_pages(struct nfs_open_context *ctx,
 				 struct inode *inode,
 				 struct address_space *mapping,
 				 struct list_head *pages,
@@ -452,12 +452,12 @@ int __nfs_readpages_from_fscache(struct nfs_open_context *ctx,
 	unsigned npages = *nr_pages;
 	int ret;
 
-	dfprintk(FSCACHE, "NFS: nfs_getpages_from_fscache (0x%p/%u/0x%p)\n",
+	dfprintk(FSCACHE, "NFS: fscache_read_pages (0x%p/%u/0x%p)\n",
 		 nfs_i_fscache(inode), npages, inode);
 
 	ret = fscache_read_or_alloc_pages(nfs_i_fscache(inode),
 					  mapping, pages, nr_pages,
-					  nfs_readpage_from_fscache_complete,
+					  nfs_fscache_read_page_complete,
 					  ctx,
 					  mapping_gfp_mask(mapping));
 	if (*nr_pages < npages)
@@ -472,19 +472,19 @@ int __nfs_readpages_from_fscache(struct nfs_open_context *ctx,
 		BUG_ON(!list_empty(pages));
 		BUG_ON(*nr_pages != 0);
 		dfprintk(FSCACHE,
-			 "NFS: nfs_getpages_from_fscache: submitted\n");
+			 "NFS: fscache_read_pages: submitted\n");
 
 		return ret;
 
 	case -ENOBUFS: /* some pages aren't cached and can't be */
 	case -ENODATA: /* some pages aren't cached */
 		dfprintk(FSCACHE,
-			 "NFS: nfs_getpages_from_fscache: no page: %d\n", ret);
+			 "NFS: fscache_read_pages: no page: %d\n", ret);
 		return 1;
 
 	default:
 		dfprintk(FSCACHE,
-			 "NFS: nfs_getpages_from_fscache: ret  %d\n", ret);
+			 "NFS: fscache_read_pages: ret  %d\n", ret);
 	}
 
 	return ret;
@@ -494,18 +494,18 @@ int __nfs_readpages_from_fscache(struct nfs_open_context *ctx,
  * Store a newly fetched page in fscache
  * - PG_fscache must be set on the page
  */
-void __nfs_readpage_to_fscache(struct inode *inode, struct page *page, int sync)
+void __nfs_fscache_write_page(struct inode *inode, struct page *page, int sync)
 {
 	int ret;
 
 	dfprintk(FSCACHE,
-		 "NFS: readpage_to_fscache(fsc:%p/p:%p(i:%lx f:%lx)/%d)\n",
+		 "NFS: fscache_write_page(fsc:%p/p:%p(i:%lx f:%lx)/%d)\n",
 		 nfs_i_fscache(inode), page, page->index, page->flags, sync);
 
 	ret = fscache_write_page(nfs_i_fscache(inode), page,
 				 inode->i_size, GFP_KERNEL);
 	dfprintk(FSCACHE,
-		 "NFS:     readpage_to_fscache: p:%p(i:%lu f:%lx) ret %d\n",
+		 "NFS:     nfs_fscache_write_page: p:%p(i:%lu f:%lx) ret %d\n",
 		 page, page->index, page->flags, ret);
 
 	if (ret != 0) {
diff --git a/fs/nfs/fscache.h b/fs/nfs/fscache.h
index 840608a38713..876edc4a5f37 100644
--- a/fs/nfs/fscache.h
+++ b/fs/nfs/fscache.h
@@ -96,12 +96,12 @@ struct nfs_fscache_inode_auxdata {
 extern void __nfs_fscache_invalidate_page(struct page *, struct inode *);
 extern int nfs_fscache_release_page(struct page *, gfp_t);
 
-extern int __nfs_readpage_from_fscache(struct nfs_open_context *,
+extern int __nfs_fscache_read_page(struct nfs_open_context *,
 				       struct inode *, struct page *);
-extern int __nfs_readpages_from_fscache(struct nfs_open_context *,
+extern int __nfs_fscache_read_pages(struct nfs_open_context *,
 					struct inode *, struct address_space *,
 					struct list_head *, unsigned *);
-extern void __nfs_readpage_to_fscache(struct inode *, struct page *, int);
+extern void __nfs_fscache_write_page(struct inode *, struct page *, int);
 
 /*
  * wait for a page to complete writing to the cache
@@ -127,26 +127,26 @@ static inline void nfs_fscache_invalidate_page(struct page *page,
 /*
  * Retrieve a page from an inode data storage object.
  */
-static inline int nfs_readpage_from_fscache(struct nfs_open_context *ctx,
+static inline int nfs_fscache_read_page(struct nfs_open_context *ctx,
 					    struct inode *inode,
 					    struct page *page)
 {
 	if (nfs_i_fscache(inode))
-		return __nfs_readpage_from_fscache(ctx, inode, page);
+		return __nfs_fscache_read_page(ctx, inode, page);
 	return -ENOBUFS;
 }
 
 /*
  * Retrieve a set of pages from an inode data storage object.
  */
-static inline int nfs_readpages_from_fscache(struct nfs_open_context *ctx,
+static inline int nfs_fscache_read_pages(struct nfs_open_context *ctx,
 					     struct inode *inode,
 					     struct address_space *mapping,
 					     struct list_head *pages,
 					     unsigned *nr_pages)
 {
 	if (nfs_i_fscache(inode))
-		return __nfs_readpages_from_fscache(ctx, inode, mapping, pages,
+		return __nfs_fscache_read_pages(ctx, inode, mapping, pages,
 						    nr_pages);
 	return -ENOBUFS;
 }
@@ -155,12 +155,12 @@ static inline int nfs_readpages_from_fscache(struct nfs_open_context *ctx,
  * Store a page newly fetched from the server in an inode data storage object
  * in the cache.
  */
-static inline void nfs_readpage_to_fscache(struct inode *inode,
+static inline void nfs_fscache_write_page(struct inode *inode,
 					   struct page *page,
 					   int sync)
 {
 	if (PageFsCache(page))
-		__nfs_readpage_to_fscache(inode, page, sync);
+		__nfs_fscache_write_page(inode, page, sync);
 }
 
 /*
@@ -212,13 +212,13 @@ static inline void nfs_fscache_invalidate_page(struct page *page,
 static inline void nfs_fscache_wait_on_page_write(struct nfs_inode *nfsi,
 						  struct page *page) {}
 
-static inline int nfs_readpage_from_fscache(struct nfs_open_context *ctx,
+static inline int nfs_fscache_read_page(struct nfs_open_context *ctx,
 					    struct inode *inode,
 					    struct page *page)
 {
 	return -ENOBUFS;
 }
-static inline int nfs_readpages_from_fscache(struct nfs_open_context *ctx,
+static inline int nfs_fscache_read_pages(struct nfs_open_context *ctx,
 					     struct inode *inode,
 					     struct address_space *mapping,
 					     struct list_head *pages,
@@ -226,10 +226,9 @@ static inline int nfs_readpages_from_fscache(struct nfs_open_context *ctx,
 {
 	return -ENOBUFS;
 }
-static inline void nfs_readpage_to_fscache(struct inode *inode,
+static inline void nfs_fscache_write_page(struct inode *inode,
 					   struct page *page, int sync) {}
 
-
 static inline void nfs_fscache_invalidate(struct inode *inode) {}
 static inline void nfs_fscache_wait_on_invalidate(struct inode *inode) {}
 
diff --git a/fs/nfs/read.c b/fs/nfs/read.c
index d11af2a9299c..7e8d80ba56a5 100644
--- a/fs/nfs/read.c
+++ b/fs/nfs/read.c
@@ -123,7 +123,7 @@ static void nfs_readpage_release(struct nfs_page *req, int error)
 		struct address_space *mapping = page_file_mapping(page);
 
 		if (PageUptodate(page))
-			nfs_readpage_to_fscache(inode, page, 0);
+			nfs_fscache_write_page(inode, page, 0);
 		else if (!PageError(page) && !PagePrivate(page))
 			generic_error_remove_page(mapping, page);
 		unlock_page(page);
@@ -367,7 +367,7 @@ int nfs_readpage(struct file *file, struct page *page)
 
 	xchg(&desc.ctx->error, 0);
 	if (!IS_SYNC(inode)) {
-		ret = nfs_readpage_from_fscache(desc.ctx, inode, page);
+		ret = nfs_fscache_read_page(desc.ctx, inode, page);
 		if (ret == 0)
 			goto out_wait;
 	}
@@ -422,7 +422,7 @@ int nfs_readpages(struct file *file, struct address_space *mapping,
 	/* attempt to read as many of the pages as possible from the cache
 	 * - this returns -ENOBUFS immediately if the cookie is negative
 	 */
-	ret = nfs_readpages_from_fscache(desc.ctx, inode, mapping,
+	ret = nfs_fscache_read_pages(desc.ctx, inode, mapping,
 					 pages, &nr_pages);
 	if (ret == 0)
 		goto read_complete; /* all pages were read */
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

