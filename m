Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6353A477902
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Dec 2021 17:28:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639672134;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J8I9hp6KkejsMkX/sKgEVQhBpcaXrUnR66cvxyYjNAA=;
	b=YzvLgiUkJJbv4IqDeLo+0mrGaVmjLZEulwi7ruOI56rvOSCxkSrVVD1s/7OLBeLZdn3WnE
	sAbMWMvTA9D+5oJ6b12I4meOJgq3KYU3K1iM488vIjHdiWdEaKdBY8ltXn0pGKaZmjUOFi
	IOFzC1aiF6ObWVJ/Iun30LhWCSRK6zQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-qA500hHOOT2SgoF7PLSgZA-1; Thu, 16 Dec 2021 11:28:38 -0500
X-MC-Unique: qA500hHOOT2SgoF7PLSgZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC8DF593C6;
	Thu, 16 Dec 2021 16:28:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA96B5E483;
	Thu, 16 Dec 2021 16:28:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C5E4B1806D1C;
	Thu, 16 Dec 2021 16:28:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BGGOQka008615 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 16 Dec 2021 11:24:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9D58DE2D5; Thu, 16 Dec 2021 16:24:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CE10194B9;
	Thu, 16 Dec 2021 16:24:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 16 Dec 2021 16:24:04 +0000
Message-ID: <163967184451.1823006.6450645559828329590.stgit@warthog.procyon.org.uk>
In-Reply-To: <163967073889.1823006.12237147297060239168.stgit@warthog.procyon.org.uk>
References: <163967073889.1823006.12237147297060239168.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Subject: [Linux-cachefs] [PATCH v3 64/68] nfs: Implement cache I/O by
 accessing the cache directly
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move NFS to using fscache DIO API instead of the old upstream I/O API as
that has been removed.  This is a stopgap solution as the intention is that
at sometime in the future, the cache will move to using larger blocks and
won't be able to store individual pages in order to deal with the potential
for data corruption due to the backing filesystem being able insert/remove
bridging blocks of zeros into its extent list[1].

NFS then reads and writes cache pages synchronously and one page at a time.

The preferred change would be to use the netfs lib, but the new I/O API can
be used directly.  It's just that as the cache now needs to track data for
itself, caching blocks may exceed page size...

This code is somewhat borrowed from my "fallback I/O" patchset[2].

Changes
=======
ver #3:
 - Restore lost =n fallback for nfs_fscache_release_page()[2].

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Dave Wysochanski <dwysocha@redhat.com>
cc: Trond Myklebust <trond.myklebust@hammerspace.com>
cc: Anna Schumaker <anna.schumaker@netapp.com>
cc: linux-nfs@vger.kernel.org
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/YO17ZNOcq+9PajfQ@mit.edu [1]
Link: https://lore.kernel.org/r/202112100957.2oEDT20W-lkp@intel.com/ [2]
Link: https://lore.kernel.org/r/163189108292.2509237.12615909591150927232.stgit@warthog.procyon.org.uk/ [2]
Link: https://lore.kernel.org/r/163906981318.143852.17220018647843475985.stgit@warthog.procyon.org.uk/ # v2
---

 fs/fscache/io.c         |    8 +++
 fs/nfs/fscache.c        |  126 ++++++++++++++++++++++++++++++++++++++---------
 fs/nfs/fscache.h        |   52 ++++---------------
 fs/nfs/read.c           |   25 +++------
 fs/nfs/write.c          |    7 ++-
 include/linux/fscache.h |   28 ++++++++++
 6 files changed, 163 insertions(+), 83 deletions(-)

diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index bed7628a5a9d..7a769ea57720 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -150,6 +150,14 @@ int __fscache_begin_read_operation(struct netfs_cache_resources *cres,
 }
 EXPORT_SYMBOL(__fscache_begin_read_operation);
 
+int __fscache_begin_write_operation(struct netfs_cache_resources *cres,
+				    struct fscache_cookie *cookie)
+{
+	return fscache_begin_operation(cres, cookie, FSCACHE_WANT_PARAMS,
+				       fscache_access_io_write);
+}
+EXPORT_SYMBOL(__fscache_begin_write_operation);
+
 /**
  * fscache_set_page_dirty - Mark page dirty and pin a cache object for writeback
  * @page: The page being dirtied
diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index fac6438477a0..cfe901650ab0 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -249,48 +249,128 @@ void nfs_fscache_release_file(struct inode *inode, struct file *filp)
 	}
 }
 
+static inline void fscache_end_operation(struct netfs_cache_resources *cres)
+{
+	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
+
+	if (ops)
+		ops->end_operation(cres);
+}
+
+/*
+ * Fallback page reading interface.
+ */
+static int fscache_fallback_read_page(struct inode *inode, struct page *page)
+{
+	struct netfs_cache_resources cres;
+	struct fscache_cookie *cookie = nfs_i_fscache(inode);
+	struct iov_iter iter;
+	struct bio_vec bvec[1];
+	int ret;
+
+	memset(&cres, 0, sizeof(cres));
+	bvec[0].bv_page		= page;
+	bvec[0].bv_offset	= 0;
+	bvec[0].bv_len		= PAGE_SIZE;
+	iov_iter_bvec(&iter, READ, bvec, ARRAY_SIZE(bvec), PAGE_SIZE);
+
+	ret = fscache_begin_read_operation(&cres, cookie);
+	if (ret < 0)
+		return ret;
+
+	ret = fscache_read(&cres, page_offset(page), &iter, NETFS_READ_HOLE_FAIL,
+			   NULL, NULL);
+	fscache_end_operation(&cres);
+	return ret;
+}
+
+/*
+ * Fallback page writing interface.
+ */
+static int fscache_fallback_write_page(struct inode *inode, struct page *page,
+				       bool no_space_allocated_yet)
+{
+	struct netfs_cache_resources cres;
+	struct fscache_cookie *cookie = nfs_i_fscache(inode);
+	struct iov_iter iter;
+	struct bio_vec bvec[1];
+	loff_t start = page_offset(page);
+	size_t len = PAGE_SIZE;
+	int ret;
+
+	memset(&cres, 0, sizeof(cres));
+	bvec[0].bv_page		= page;
+	bvec[0].bv_offset	= 0;
+	bvec[0].bv_len		= PAGE_SIZE;
+	iov_iter_bvec(&iter, WRITE, bvec, ARRAY_SIZE(bvec), PAGE_SIZE);
+
+	ret = fscache_begin_write_operation(&cres, cookie);
+	if (ret < 0)
+		return ret;
+
+	ret = cres.ops->prepare_write(&cres, &start, &len, i_size_read(inode),
+				      no_space_allocated_yet);
+	if (ret == 0)
+		ret = fscache_write(&cres, page_offset(page), &iter, NULL, NULL);
+	fscache_end_operation(&cres);
+	return ret;
+}
+
 /*
  * Retrieve a page from fscache
  */
-int __nfs_readpage_from_fscache(struct nfs_open_context *ctx,
-				struct inode *inode, struct page *page)
+int __nfs_readpage_from_fscache(struct inode *inode, struct page *page)
 {
+	int ret;
+
 	dfprintk(FSCACHE,
 		 "NFS: readpage_from_fscache(fsc:%p/p:%p(i:%lx f:%lx)/0x%p)\n",
 		 nfs_i_fscache(inode), page, page->index, page->flags, inode);
 
 	if (PageChecked(page)) {
+		dfprintk(FSCACHE, "NFS:    readpage_from_fscache: PageChecked\n");
 		ClearPageChecked(page);
 		return 1;
 	}
 
-	return -ENOBUFS; // TODO: Use netfslib
-}
-
-/*
- * Retrieve a set of pages from fscache
- */
-int __nfs_readpages_from_fscache(struct nfs_open_context *ctx,
-				 struct inode *inode,
-				 struct address_space *mapping,
-				 struct list_head *pages,
-				 unsigned *nr_pages)
-{
-	dfprintk(FSCACHE, "NFS: nfs_getpages_from_fscache (0x%p/%u/0x%p)\n",
-		 nfs_i_fscache(inode), *nr_pages, inode);
+	ret = fscache_fallback_read_page(inode, page);
+	if (ret < 0) {
+		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL);
+		dfprintk(FSCACHE,
+			 "NFS:    readpage_from_fscache failed %d\n", ret);
+		SetPageChecked(page);
+		return ret;
+	}
 
-	return -ENOBUFS; // TODO: Use netfslib
+	/* Read completed synchronously */
+	dfprintk(FSCACHE, "NFS:    readpage_from_fscache: read successful\n");
+	nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_OK);
+	SetPageUptodate(page);
+	return 0;
 }
 
 /*
- * Store a newly fetched page in fscache
- * - PG_fscache must be set on the page
+ * Store a newly fetched page in fscache.  We can be certain there's no page
+ * stored in the cache as yet otherwise we would've read it from there.
  */
-void __nfs_readpage_to_fscache(struct inode *inode, struct page *page, int sync)
+void __nfs_readpage_to_fscache(struct inode *inode, struct page *page)
 {
+	int ret;
+
 	dfprintk(FSCACHE,
-		 "NFS: readpage_to_fscache(fsc:%p/p:%p(i:%lx f:%lx)/%d)\n",
-		 nfs_i_fscache(inode), page, page->index, page->flags, sync);
+		 "NFS: readpage_to_fscache(fsc:%p/p:%p(i:%lx f:%lx))\n",
+		 nfs_i_fscache(inode), page, page->index, page->flags);
 
-	return; // TODO: Use netfslib
+	ret = fscache_fallback_write_page(inode, page, true);
+
+	dfprintk(FSCACHE,
+		 "NFS:     readpage_to_fscache: p:%p(i:%lu f:%lx) ret %d\n",
+		 page, page->index, page->flags, ret);
+
+	if (ret != 0) {
+		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_WRITTEN_FAIL);
+		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_UNCACHED);
+	} else {
+		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_WRITTEN_OK);
+	}
 }
diff --git a/fs/nfs/fscache.h b/fs/nfs/fscache.h
index 0fa267243d26..e0220fc40366 100644
--- a/fs/nfs/fscache.h
+++ b/fs/nfs/fscache.h
@@ -44,14 +44,10 @@ extern void nfs_fscache_clear_inode(struct inode *);
 extern void nfs_fscache_open_file(struct inode *, struct file *);
 extern void nfs_fscache_release_file(struct inode *, struct file *);
 
-extern void __nfs_fscache_invalidate_page(struct page *, struct inode *);
-
-extern int __nfs_readpage_from_fscache(struct nfs_open_context *,
-				       struct inode *, struct page *);
-extern int __nfs_readpages_from_fscache(struct nfs_open_context *,
-					struct inode *, struct address_space *,
-					struct list_head *, unsigned *);
-extern void __nfs_readpage_to_fscache(struct inode *, struct page *, int);
+extern int __nfs_readpage_from_fscache(struct inode *, struct page *);
+extern void __nfs_read_completion_to_fscache(struct nfs_pgio_header *hdr,
+					     unsigned long bytes);
+extern void __nfs_readpage_to_fscache(struct inode *, struct page *);
 
 static inline int nfs_fscache_release_page(struct page *page, gfp_t gfp)
 {
@@ -69,27 +65,11 @@ static inline int nfs_fscache_release_page(struct page *page, gfp_t gfp)
 /*
  * Retrieve a page from an inode data storage object.
  */
-static inline int nfs_readpage_from_fscache(struct nfs_open_context *ctx,
-					    struct inode *inode,
+static inline int nfs_readpage_from_fscache(struct inode *inode,
 					    struct page *page)
 {
 	if (NFS_I(inode)->fscache)
-		return __nfs_readpage_from_fscache(ctx, inode, page);
-	return -ENOBUFS;
-}
-
-/*
- * Retrieve a set of pages from an inode data storage object.
- */
-static inline int nfs_readpages_from_fscache(struct nfs_open_context *ctx,
-					     struct inode *inode,
-					     struct address_space *mapping,
-					     struct list_head *pages,
-					     unsigned *nr_pages)
-{
-	if (NFS_I(inode)->fscache)
-		return __nfs_readpages_from_fscache(ctx, inode, mapping, pages,
-						    nr_pages);
+		return __nfs_readpage_from_fscache(inode, page);
 	return -ENOBUFS;
 }
 
@@ -98,11 +78,10 @@ static inline int nfs_readpages_from_fscache(struct nfs_open_context *ctx,
  * in the cache.
  */
 static inline void nfs_readpage_to_fscache(struct inode *inode,
-					   struct page *page,
-					   int sync)
+					   struct page *page)
 {
-	if (PageFsCache(page))
-		__nfs_readpage_to_fscache(inode, page, sync);
+	if (NFS_I(inode)->fscache)
+		__nfs_readpage_to_fscache(inode, page);
 }
 
 static inline void nfs_fscache_update_auxdata(struct nfs_fscache_inode_auxdata *auxdata,
@@ -156,22 +135,13 @@ static inline int nfs_fscache_release_page(struct page *page, gfp_t gfp)
 {
 	return 1; /* True: may release page */
 }
-static inline int nfs_readpage_from_fscache(struct nfs_open_context *ctx,
-					    struct inode *inode,
+static inline int nfs_readpage_from_fscache(struct inode *inode,
 					    struct page *page)
 {
 	return -ENOBUFS;
 }
-static inline int nfs_readpages_from_fscache(struct nfs_open_context *ctx,
-					     struct inode *inode,
-					     struct address_space *mapping,
-					     struct list_head *pages,
-					     unsigned *nr_pages)
-{
-	return -ENOBUFS;
-}
 static inline void nfs_readpage_to_fscache(struct inode *inode,
-					   struct page *page, int sync) {}
+					   struct page *page) {}
 
 
 static inline void nfs_fscache_invalidate(struct inode *inode, int flags) {}
diff --git a/fs/nfs/read.c b/fs/nfs/read.c
index d11af2a9299c..eb00229c1a50 100644
--- a/fs/nfs/read.c
+++ b/fs/nfs/read.c
@@ -123,7 +123,7 @@ static void nfs_readpage_release(struct nfs_page *req, int error)
 		struct address_space *mapping = page_file_mapping(page);
 
 		if (PageUptodate(page))
-			nfs_readpage_to_fscache(inode, page, 0);
+			nfs_readpage_to_fscache(inode, page);
 		else if (!PageError(page) && !PagePrivate(page))
 			generic_error_remove_page(mapping, page);
 		unlock_page(page);
@@ -305,6 +305,12 @@ readpage_async_filler(void *data, struct page *page)
 
 	aligned_len = min_t(unsigned int, ALIGN(len, rsize), PAGE_SIZE);
 
+	if (!IS_SYNC(page->mapping->host)) {
+		error = nfs_readpage_from_fscache(page->mapping->host, page);
+		if (error == 0)
+			goto out_unlock;
+	}
+
 	new = nfs_create_request(desc->ctx, page, 0, aligned_len);
 	if (IS_ERR(new))
 		goto out_error;
@@ -320,6 +326,7 @@ readpage_async_filler(void *data, struct page *page)
 	return 0;
 out_error:
 	error = PTR_ERR(new);
+out_unlock:
 	unlock_page(page);
 out:
 	return error;
@@ -366,12 +373,6 @@ int nfs_readpage(struct file *file, struct page *page)
 		desc.ctx = get_nfs_open_context(nfs_file_open_context(file));
 
 	xchg(&desc.ctx->error, 0);
-	if (!IS_SYNC(inode)) {
-		ret = nfs_readpage_from_fscache(desc.ctx, inode, page);
-		if (ret == 0)
-			goto out_wait;
-	}
-
 	nfs_pageio_init_read(&desc.pgio, inode, false,
 			     &nfs_async_read_completion_ops);
 
@@ -381,7 +382,6 @@ int nfs_readpage(struct file *file, struct page *page)
 
 	nfs_pageio_complete_read(&desc.pgio);
 	ret = desc.pgio.pg_error < 0 ? desc.pgio.pg_error : 0;
-out_wait:
 	if (!ret) {
 		ret = wait_on_page_locked_killable(page);
 		if (!PageUptodate(page) && !ret)
@@ -419,14 +419,6 @@ int nfs_readpages(struct file *file, struct address_space *mapping,
 	} else
 		desc.ctx = get_nfs_open_context(nfs_file_open_context(file));
 
-	/* attempt to read as many of the pages as possible from the cache
-	 * - this returns -ENOBUFS immediately if the cookie is negative
-	 */
-	ret = nfs_readpages_from_fscache(desc.ctx, inode, mapping,
-					 pages, &nr_pages);
-	if (ret == 0)
-		goto read_complete; /* all pages were read */
-
 	nfs_pageio_init_read(&desc.pgio, inode, false,
 			     &nfs_async_read_completion_ops);
 
@@ -434,7 +426,6 @@ int nfs_readpages(struct file *file, struct address_space *mapping,
 
 	nfs_pageio_complete_read(&desc.pgio);
 
-read_complete:
 	put_nfs_open_context(desc.ctx);
 out:
 	trace_nfs_aop_readahead_done(inode, nr_pages, ret);
diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index 2b322170372a..987a187bd39a 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -2126,8 +2126,11 @@ int nfs_migrate_page(struct address_space *mapping, struct page *newpage,
 	if (PagePrivate(page))
 		return -EBUSY;
 
-	if (!nfs_fscache_release_page(page, GFP_KERNEL))
-		return -EBUSY;
+	if (PageFsCache(page)) {
+		if (mode == MIGRATE_ASYNC)
+			return -EBUSY;
+		wait_on_page_fscache(page);
+	}
 
 	return migrate_page(mapping, newpage, page, mode);
 }
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 9ad3e44418d2..a2c6ab8c9c74 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -168,6 +168,7 @@ extern void __fscache_relinquish_cookie(struct fscache_cookie *, bool);
 extern void __fscache_resize_cookie(struct fscache_cookie *, loff_t);
 extern void __fscache_invalidate(struct fscache_cookie *, const void *, loff_t, unsigned int);
 extern int __fscache_begin_read_operation(struct netfs_cache_resources *, struct fscache_cookie *);
+extern int __fscache_begin_write_operation(struct netfs_cache_resources *, struct fscache_cookie *);
 
 extern void __fscache_write_to_cache(struct fscache_cookie *, struct address_space *,
 				     loff_t, size_t, loff_t, netfs_io_terminated_t, void *,
@@ -500,6 +501,33 @@ int fscache_read(struct netfs_cache_resources *cres,
 			 term_func, term_func_priv);
 }
 
+/**
+ * fscache_begin_write_operation - Begin a write operation for the netfs lib
+ * @cres: The cache resources for the write being performed
+ * @cookie: The cookie representing the cache object
+ *
+ * Begin a write operation on behalf of the netfs helper library.  @cres
+ * indicates the cache resources to which the operation state should be
+ * attached; @cookie indicates the cache object that will be accessed.
+ *
+ * @cres->inval_counter is set from @cookie->inval_counter for comparison at
+ * the end of the operation.  This allows invalidation during the operation to
+ * be detected by the caller.
+ *
+ * Returns:
+ * * 0		- Success
+ * * -ENOBUFS	- No caching available
+ * * Other error code from the cache, such as -ENOMEM.
+ */
+static inline
+int fscache_begin_write_operation(struct netfs_cache_resources *cres,
+				  struct fscache_cookie *cookie)
+{
+	if (fscache_cookie_enabled(cookie))
+		return __fscache_begin_write_operation(cres, cookie);
+	return -ENOBUFS;
+}
+
 /**
  * fscache_write - Start a write to the cache.
  * @cres: The cache resources to use


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

