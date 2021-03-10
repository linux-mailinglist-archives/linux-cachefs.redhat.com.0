Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 25D343344B4
	for <lists+linux-cachefs@lfdr.de>; Wed, 10 Mar 2021 18:05:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615395916;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7O+jsmihBC29GolMZB6L0U0RGntjMb2hpY5P1B+gq1Y=;
	b=XjXwOlyeLGZzR/M4ngTlixENWnt2RVOhCTja9ikJhOlOZJH3C633clyha29lxS/xsgw80q
	qEqICrBFMBN+hv7XGwx5Odp83PMXvz/bFCauD7gyzbOZm63AlTggTimMrDtPb0ZRDtfsf0
	2dpdBzJY54eMwcoPdhvaj3h31UAHb8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-ifSQ8Y1RMgiHPuR6T27Guw-1; Wed, 10 Mar 2021 12:05:13 -0500
X-MC-Unique: ifSQ8Y1RMgiHPuR6T27Guw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFD2F107465C;
	Wed, 10 Mar 2021 17:05:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD0015D9DE;
	Wed, 10 Mar 2021 17:05:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFA6457DCA;
	Wed, 10 Mar 2021 17:05:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12AGxBBo024420 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 10 Mar 2021 11:59:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1658560C05; Wed, 10 Mar 2021 16:59:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-152.rdu2.redhat.com
	[10.10.118.152])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EAC7360CE9;
	Wed, 10 Mar 2021 16:59:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Wed, 10 Mar 2021 16:59:01 +0000
Message-ID: <161539554187.286939.15305559004905459852.stgit@warthog.procyon.org.uk>
In-Reply-To: <161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
References: <161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Wed, 10 Mar 2021 12:05:02 -0500
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH v4 21/28] afs: Set up the iov_iter before
 calling afs_extract_data()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

afs_extract_data() sets up a temporary iov_iter and passes it to AF_RXRPC
each time it is called to describe the remaining buffer to be filled.

Instead:

 (1) Put an iterator in the afs_call struct.

 (2) Set the iterator for each marshalling stage to load data into the
     appropriate places.  A number of convenience functions are provided to
     this end (eg. afs_extract_to_buf()).

     This iterator is then passed to afs_extract_data().

 (3) Use the new ITER_MAPPING iterator when reading data to load directly
     into the inode's pages without needing to create a list of them.

This will allow O_DIRECT calls to be supported in future patches.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-afs@lists.infradead.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
Link: https://lore.kernel.org/r/152898380012.11616.12094591785228251717.stgit@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/153685394431.14766.3178466345696987059.stgit@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/153999787395.866.11218209749223643998.stgit@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/154033911195.12041.3882700371848894587.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/158861250059.340223.1248231474865140653.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/159465827399.1377938.11181327349704960046.stgit@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/160588533776.3465195.3612752083351956948.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/161118151238.1232039.17015723405750601161.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/161161047240.2537118.14721975104810564022.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/161340410333.1303470.16260122230371140878.stgit@warthog.procyon.org.uk/ # v3
---

 fs/afs/dir.c       |  222 +++++++++++++++++++++++++++++++++++-----------------
 fs/afs/file.c      |  190 ++++++++++++++++++++++++++-------------------
 fs/afs/fsclient.c  |   54 +++----------
 fs/afs/internal.h  |   16 ++--
 fs/afs/write.c     |   27 ++++--
 fs/afs/yfsclient.c |   54 +++----------
 6 files changed, 314 insertions(+), 249 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 30c769efee26..021489497801 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -103,6 +103,35 @@ struct afs_lookup_cookie {
 	struct afs_fid		fids[50];
 };
 
+/*
+ * Drop the refs that we're holding on the pages we were reading into.  We've
+ * got refs on the first nr_pages pages.
+ */
+static void afs_dir_read_cleanup(struct afs_read *req)
+{
+	struct address_space *mapping = req->vnode->vfs_inode.i_mapping;
+	struct page *page;
+	pgoff_t last = req->nr_pages - 1;
+
+	XA_STATE(xas, &mapping->i_pages, 0);
+
+	if (unlikely(!req->nr_pages))
+		return;
+
+	rcu_read_lock();
+	xas_for_each(&xas, page, last) {
+		if (xas_retry(&xas, page))
+			continue;
+		BUG_ON(xa_is_value(page));
+		BUG_ON(PageCompound(page));
+		ASSERTCMP(page->mapping, ==, mapping);
+
+		put_page(page);
+	}
+
+	rcu_read_unlock();
+}
+
 /*
  * check that a directory page is valid
  */
@@ -128,7 +157,7 @@ static bool afs_dir_check_page(struct afs_vnode *dvnode, struct page *page,
 	qty /= sizeof(union afs_xdr_dir_block);
 
 	/* check them */
-	dbuf = kmap(page);
+	dbuf = kmap_atomic(page);
 	for (tmp = 0; tmp < qty; tmp++) {
 		if (dbuf->blocks[tmp].hdr.magic != AFS_DIR_MAGIC) {
 			printk("kAFS: %s(%lx): bad magic %d/%d is %04hx\n",
@@ -147,7 +176,7 @@ static bool afs_dir_check_page(struct afs_vnode *dvnode, struct page *page,
 		((u8 *)&dbuf->blocks[tmp])[AFS_DIR_BLOCK_SIZE - 1] = 0;
 	}
 
-	kunmap(page);
+	kunmap_atomic(dbuf);
 
 checked:
 	afs_stat_v(dvnode, n_read_dir);
@@ -158,35 +187,74 @@ static bool afs_dir_check_page(struct afs_vnode *dvnode, struct page *page,
 }
 
 /*
- * Check the contents of a directory that we've just read.
+ * Dump the contents of a directory.
  */
-static bool afs_dir_check_pages(struct afs_vnode *dvnode, struct afs_read *req)
+static void afs_dir_dump(struct afs_vnode *dvnode, struct afs_read *req)
 {
 	struct afs_xdr_dir_page *dbuf;
-	unsigned int i, j, qty = PAGE_SIZE / sizeof(union afs_xdr_dir_block);
+	struct address_space *mapping = dvnode->vfs_inode.i_mapping;
+	struct page *page;
+	unsigned int i, qty = PAGE_SIZE / sizeof(union afs_xdr_dir_block);
+	pgoff_t last = req->nr_pages - 1;
 
-	for (i = 0; i < req->nr_pages; i++)
-		if (!afs_dir_check_page(dvnode, req->pages[i], req->actual_len))
-			goto bad;
-	return true;
+	XA_STATE(xas, &mapping->i_pages, 0);
 
-bad:
-	pr_warn("DIR %llx:%llx f=%llx l=%llx al=%llx r=%llx\n",
+	pr_warn("DIR %llx:%llx f=%llx l=%llx al=%llx\n",
 		dvnode->fid.vid, dvnode->fid.vnode,
-		req->file_size, req->len, req->actual_len, req->remain);
-	pr_warn("DIR %llx %x %x %x\n",
-		req->pos, req->index, req->nr_pages, req->offset);
+		req->file_size, req->len, req->actual_len);
+	pr_warn("DIR %llx %x %zx %zx\n",
+		req->pos, req->nr_pages,
+		req->iter->iov_offset,  iov_iter_count(req->iter));
 
-	for (i = 0; i < req->nr_pages; i++) {
-		dbuf = kmap(req->pages[i]);
-		for (j = 0; j < qty; j++) {
-			union afs_xdr_dir_block *block = &dbuf->blocks[j];
+	xas_for_each(&xas, page, last) {
+		if (xas_retry(&xas, page))
+			continue;
+
+		BUG_ON(PageCompound(page));
+		BUG_ON(page->mapping != mapping);
+
+		dbuf = kmap_atomic(page);
+		for (i = 0; i < qty; i++) {
+			union afs_xdr_dir_block *block = &dbuf->blocks[i];
 
-			pr_warn("[%02x] %32phN\n", i * qty + j, block);
+			pr_warn("[%02lx] %32phN\n", page->index * qty + i, block);
 		}
-		kunmap(req->pages[i]);
+		kunmap_atomic(dbuf);
 	}
-	return false;
+}
+
+/*
+ * Check all the pages in a directory.  All the pages are held pinned.
+ */
+static int afs_dir_check(struct afs_vnode *dvnode, struct afs_read *req)
+{
+	struct address_space *mapping = dvnode->vfs_inode.i_mapping;
+	struct page *page;
+	pgoff_t last = req->nr_pages - 1;
+	int ret = 0;
+
+	XA_STATE(xas, &mapping->i_pages, 0);
+
+	if (unlikely(!req->nr_pages))
+		return 0;
+
+	rcu_read_lock();
+	xas_for_each(&xas, page, last) {
+		if (xas_retry(&xas, page))
+			continue;
+
+		BUG_ON(PageCompound(page));
+		BUG_ON(page->mapping != mapping);
+
+		if (!afs_dir_check_page(dvnode, page, req->file_size)) {
+			afs_dir_dump(dvnode, req);
+			ret = -EIO;
+			break;
+		}
+	}
+
+	rcu_read_unlock();
+	return ret;
 }
 
 /*
@@ -215,58 +283,57 @@ static struct afs_read *afs_read_dir(struct afs_vnode *dvnode, struct key *key)
 {
 	struct afs_read *req;
 	loff_t i_size;
-	int nr_pages, nr_inline, i, n;
-	int ret = -ENOMEM;
+	int nr_pages, i, n;
+	int ret;
+
+	_enter("");
 
-retry:
+	req = kzalloc(sizeof(*req), GFP_KERNEL);
+	if (!req)
+		return ERR_PTR(-ENOMEM);
+
+	refcount_set(&req->usage, 1);
+	req->vnode = dvnode;
+	req->key = key_get(key);
+	req->cleanup = afs_dir_read_cleanup;
+
+expand:
 	i_size = i_size_read(&dvnode->vfs_inode);
-	if (i_size < 2048)
-		return ERR_PTR(afs_bad(dvnode, afs_file_error_dir_small));
+	if (i_size < 2048) {
+		ret = afs_bad(dvnode, afs_file_error_dir_small);
+		goto error;
+	}
 	if (i_size > 2048 * 1024) {
 		trace_afs_file_error(dvnode, -EFBIG, afs_file_error_dir_big);
-		return ERR_PTR(-EFBIG);
+		ret = -EFBIG;
+		goto error;
 	}
 
 	_enter("%llu", i_size);
 
-	/* Get a request record to hold the page list.  We want to hold it
-	 * inline if we can, but we don't want to make an order 1 allocation.
-	 */
 	nr_pages = (i_size + PAGE_SIZE - 1) / PAGE_SIZE;
-	nr_inline = nr_pages;
-	if (nr_inline > (PAGE_SIZE - sizeof(*req)) / sizeof(struct page *))
-		nr_inline = 0;
 
-	req = kzalloc(struct_size(req, array, nr_inline), GFP_KERNEL);
-	if (!req)
-		return ERR_PTR(-ENOMEM);
-
-	refcount_set(&req->usage, 1);
-	req->key = key_get(key);
-	req->nr_pages = nr_pages;
 	req->actual_len = i_size; /* May change */
 	req->len = nr_pages * PAGE_SIZE; /* We can ask for more than there is */
 	req->data_version = dvnode->status.data_version; /* May change */
-	if (nr_inline > 0) {
-		req->pages = req->array;
-	} else {
-		req->pages = kcalloc(nr_pages, sizeof(struct page *),
-				     GFP_KERNEL);
-		if (!req->pages)
-			goto error;
-	}
+	iov_iter_xarray(&req->def_iter, READ, &dvnode->vfs_inode.i_mapping->i_pages,
+			0, i_size);
+	req->iter = &req->def_iter;
 
-	/* Get a list of all the pages that hold or will hold the directory
-	 * content.  We need to fill in any gaps that we might find where the
-	 * memory reclaimer has been at work.  If there are any gaps, we will
+	/* Fill in any gaps that we might find where the memory reclaimer has
+	 * been at work and pin all the pages.  If there are any gaps, we will
 	 * need to reread the entire directory contents.
 	 */
-	i = 0;
-	do {
+	i = req->nr_pages;
+	while (i < nr_pages) {
+		struct page *pages[8], *page;
+
 		n = find_get_pages_contig(dvnode->vfs_inode.i_mapping, i,
-					  req->nr_pages - i,
-					  req->pages + i);
-		_debug("find %u at %u/%u", n, i, req->nr_pages);
+					  min_t(unsigned int, nr_pages - i,
+						ARRAY_SIZE(pages)),
+					  pages);
+		_debug("find %u at %u/%u", n, i, nr_pages);
+
 		if (n == 0) {
 			gfp_t gfp = dvnode->vfs_inode.i_mapping->gfp_mask;
 
@@ -274,22 +341,24 @@ static struct afs_read *afs_read_dir(struct afs_vnode *dvnode, struct key *key)
 				afs_stat_v(dvnode, n_inval);
 
 			ret = -ENOMEM;
-			req->pages[i] = __page_cache_alloc(gfp);
-			if (!req->pages[i])
+			page = __page_cache_alloc(gfp);
+			if (!page)
 				goto error;
-			ret = add_to_page_cache_lru(req->pages[i],
+			ret = add_to_page_cache_lru(page,
 						    dvnode->vfs_inode.i_mapping,
 						    i, gfp);
 			if (ret < 0)
 				goto error;
 
-			attach_page_private(req->pages[i], (void *)1);
-			unlock_page(req->pages[i]);
+			attach_page_private(page, (void *)1);
+			unlock_page(page);
+			req->nr_pages++;
 			i++;
 		} else {
+			req->nr_pages += n;
 			i += n;
 		}
-	} while (i < req->nr_pages);
+	}
 
 	/* If we're going to reload, we need to lock all the pages to prevent
 	 * races.
@@ -313,12 +382,17 @@ static struct afs_read *afs_read_dir(struct afs_vnode *dvnode, struct key *key)
 
 		task_io_account_read(PAGE_SIZE * req->nr_pages);
 
-		if (req->len < req->file_size)
-			goto content_has_grown;
+		if (req->len < req->file_size) {
+			/* The content has grown, so we need to expand the
+			 * buffer.
+			 */
+			up_write(&dvnode->validate_lock);
+			goto expand;
+		}
 
 		/* Validate the data we just read. */
-		ret = -EIO;
-		if (!afs_dir_check_pages(dvnode, req))
+		ret = afs_dir_check(dvnode, req);
+		if (ret < 0)
 			goto error_unlock;
 
 		// TODO: Trim excess pages
@@ -336,11 +410,6 @@ static struct afs_read *afs_read_dir(struct afs_vnode *dvnode, struct key *key)
 	afs_put_read(req);
 	_leave(" = %d", ret);
 	return ERR_PTR(ret);
-
-content_has_grown:
-	up_write(&dvnode->validate_lock);
-	afs_put_read(req);
-	goto retry;
 }
 
 /*
@@ -450,6 +519,7 @@ static int afs_dir_iterate(struct inode *dir, struct dir_context *ctx,
 	struct afs_read *req;
 	struct page *page;
 	unsigned blkoff, limit;
+	void __rcu **slot;
 	int ret;
 
 	_enter("{%lu},%u,,", dir->i_ino, (unsigned)ctx->pos);
@@ -474,9 +544,15 @@ static int afs_dir_iterate(struct inode *dir, struct dir_context *ctx,
 		blkoff = ctx->pos & ~(sizeof(union afs_xdr_dir_block) - 1);
 
 		/* Fetch the appropriate page from the directory and re-add it
-		 * to the LRU.
+		 * to the LRU.  We have all the pages pinned with an extra ref.
 		 */
-		page = req->pages[blkoff / PAGE_SIZE];
+		rcu_read_lock();
+		page = NULL;
+		slot = radix_tree_lookup_slot(&dvnode->vfs_inode.i_mapping->i_pages,
+					      blkoff / PAGE_SIZE);
+		if (slot)
+			page = radix_tree_deref_slot(slot);
+		rcu_read_unlock();
 		if (!page) {
 			ret = afs_bad(dvnode, afs_file_error_dir_missing_page);
 			break;
diff --git a/fs/afs/file.c b/fs/afs/file.c
index d23192b3b933..f1bab69e99d4 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -184,21 +184,72 @@ int afs_release(struct inode *inode, struct file *file)
 	return ret;
 }
 
+/*
+ * Handle completion of a read operation.
+ */
+static void afs_file_read_done(struct afs_read *req)
+{
+	struct afs_vnode *vnode = req->vnode;
+	struct page *page;
+	pgoff_t index = req->pos >> PAGE_SHIFT;
+	pgoff_t last = index + req->nr_pages - 1;
+
+	XA_STATE(xas, &vnode->vfs_inode.i_mapping->i_pages, index);
+
+	if (iov_iter_count(req->iter) > 0) {
+		/* The read was short - clear the excess buffer. */
+		_debug("afterclear %zx %zx %llx/%llx",
+		       req->iter->iov_offset,
+		       iov_iter_count(req->iter),
+		       req->actual_len, req->len);
+		iov_iter_zero(iov_iter_count(req->iter), req->iter);
+	}
+
+	rcu_read_lock();
+	xas_for_each(&xas, page, last) {
+		page_endio(page, false, 0);
+		put_page(page);
+	}
+	rcu_read_unlock();
+
+	task_io_account_read(req->len);
+	req->cleanup = NULL;
+}
+
+/*
+ * Dispose of our locks and refs on the pages if the read failed.
+ */
+static void afs_file_read_cleanup(struct afs_read *req)
+{
+	struct page *page;
+	pgoff_t index = req->pos >> PAGE_SHIFT;
+	pgoff_t last = index + req->nr_pages - 1;
+
+	if (req->iter) {
+		XA_STATE(xas, &req->vnode->vfs_inode.i_mapping->i_pages, index);
+
+		_enter("%lu,%u,%zu", index, req->nr_pages, iov_iter_count(req->iter));
+
+		rcu_read_lock();
+		xas_for_each(&xas, page, last) {
+			BUG_ON(xa_is_value(page));
+			BUG_ON(PageCompound(page));
+
+			page_endio(page, false, req->error);
+			put_page(page);
+		}
+		rcu_read_unlock();
+	}
+}
+
 /*
  * Dispose of a ref to a read record.
  */
 void afs_put_read(struct afs_read *req)
 {
-	int i;
-
 	if (refcount_dec_and_test(&req->usage)) {
-		if (req->pages) {
-			for (i = 0; i < req->nr_pages; i++)
-				if (req->pages[i])
-					put_page(req->pages[i]);
-			if (req->pages != req->array)
-				kfree(req->pages);
-		}
+		if (req->cleanup)
+			req->cleanup(req);
 		key_put(req->key);
 		kfree(req);
 	}
@@ -216,6 +267,7 @@ static void afs_fetch_data_success(struct afs_operation *op)
 
 static void afs_fetch_data_put(struct afs_operation *op)
 {
+	op->fetch.req->error = op->error;
 	afs_put_read(op->fetch.req);
 }
 
@@ -255,12 +307,11 @@ int afs_fetch_data(struct afs_vnode *vnode, struct afs_read *req)
 /*
  * read page from file, directory or symlink, given a key to use
  */
-int afs_page_filler(void *data, struct page *page)
+static int afs_page_filler(struct key *key, struct page *page)
 {
 	struct inode *inode = page->mapping->host;
 	struct afs_vnode *vnode = AFS_FS_I(inode);
 	struct afs_read *req;
-	struct key *key = data;
 	int ret;
 
 	_enter("{%x},{%lu},{%lu}", key_serial(key), inode->i_ino, page->index);
@@ -271,53 +322,52 @@ int afs_page_filler(void *data, struct page *page)
 	if (test_bit(AFS_VNODE_DELETED, &vnode->flags))
 		goto error;
 
-	req = kzalloc(struct_size(req, array, 1), GFP_KERNEL);
+	req = kzalloc(sizeof(struct afs_read), GFP_KERNEL);
 	if (!req)
 		goto enomem;
 
-	/* We request a full page.  If the page is a partial one at the
-	 * end of the file, the server will return a short read and the
-	 * unmarshalling code will clear the unfilled space.
-	 */
 	refcount_set(&req->usage, 1);
-	req->key = key_get(key);
-	req->pos = (loff_t)page->index << PAGE_SHIFT;
-	req->len = PAGE_SIZE;
-	req->nr_pages = 1;
-	req->pages = req->array;
-	req->pages[0] = page;
+	req->vnode		= vnode;
+	req->key		= key_get(key);
+	req->pos		= (loff_t)page->index << PAGE_SHIFT;
+	req->len		= PAGE_SIZE;
+	req->nr_pages		= 1;
+	req->done		= afs_file_read_done;
+	req->cleanup		= afs_file_read_cleanup;
+
 	get_page(page);
+	iov_iter_xarray(&req->def_iter, READ, &page->mapping->i_pages,
+			req->pos, req->len);
+	req->iter = &req->def_iter;
 
-	/* read the contents of the file from the server into the
-	 * page */
 	ret = afs_fetch_data(vnode, req);
-	afs_put_read(req);
-
-	if (ret < 0) {
-		if (ret == -ENOENT) {
-			_debug("got NOENT from server"
-			       " - marking file deleted and stale");
-			set_bit(AFS_VNODE_DELETED, &vnode->flags);
-			ret = -ESTALE;
-		}
-
-		if (ret == -EINTR ||
-		    ret == -ENOMEM ||
-		    ret == -ERESTARTSYS ||
-		    ret == -EAGAIN)
-			goto error;
-		goto io_error;
-	}
-
-	SetPageUptodate(page);
-	unlock_page(page);
+	if (ret < 0)
+		goto fetch_error;
 
+	afs_put_read(req);
 	_leave(" = 0");
 	return 0;
 
-io_error:
-	SetPageError(page);
-	goto error;
+fetch_error:
+	switch (ret) {
+	case -EINTR:
+	case -ENOMEM:
+	case -ERESTARTSYS:
+	case -EAGAIN:
+		afs_put_read(req);
+		goto error;
+	case -ENOENT:
+		_debug("got NOENT from server - marking file deleted and stale");
+		set_bit(AFS_VNODE_DELETED, &vnode->flags);
+		ret = -ESTALE;
+		/* Fall through */
+	default:
+		page_endio(page, false, ret);
+		afs_put_read(req);
+		_leave(" = %d", ret);
+		return ret;
+	}
+
 enomem:
 	ret = -ENOMEM;
 error:
@@ -352,19 +402,6 @@ static int afs_readpage(struct file *file, struct page *page)
 	return ret;
 }
 
-/*
- * Make pages available as they're filled.
- */
-static void afs_readpages_page_done(struct afs_read *req)
-{
-	struct page *page = req->pages[req->index];
-
-	req->pages[req->index] = NULL;
-	SetPageUptodate(page);
-	unlock_page(page);
-	put_page(page);
-}
-
 /*
  * Read a contiguous set of pages.
  */
@@ -376,7 +413,7 @@ static int afs_readpages_one(struct file *file, struct address_space *mapping,
 	struct list_head *p;
 	struct page *first, *page;
 	pgoff_t index;
-	int ret, n, i;
+	int ret, n;
 
 	/* Count the number of contiguous pages at the front of the list.  Note
 	 * that the list goes prev-wards rather than next-wards.
@@ -392,21 +429,20 @@ static int afs_readpages_one(struct file *file, struct address_space *mapping,
 		n++;
 	}
 
-	req = kzalloc(struct_size(req, array, n), GFP_NOFS);
+	req = kzalloc(sizeof(struct afs_read), GFP_NOFS);
 	if (!req)
 		return -ENOMEM;
 
 	refcount_set(&req->usage, 1);
 	req->vnode = vnode;
 	req->key = key_get(afs_file_key(file));
-	req->page_done = afs_readpages_page_done;
+	req->done = afs_file_read_done;
+	req->cleanup = afs_file_read_cleanup;
 	req->pos = first->index;
 	req->pos <<= PAGE_SHIFT;
-	req->pages = req->array;
 
-	/* Transfer the pages to the request.  We add them in until one fails
-	 * to add to the LRU and then we stop (as that'll make a hole in the
-	 * contiguous run.
+	/* Add pages to the LRU until it fails.  We keep the pages ref'd and
+	 * locked until the read is complete.
 	 *
 	 * Note that it's possible for the file size to change whilst we're
 	 * doing this, but we rely on the server returning less than we asked
@@ -423,8 +459,7 @@ static int afs_readpages_one(struct file *file, struct address_space *mapping,
 			break;
 		}
 
-		req->pages[req->nr_pages++] = page;
-		req->len += PAGE_SIZE;
+		req->nr_pages++;
 	} while (req->nr_pages < n);
 
 	if (req->nr_pages == 0) {
@@ -432,30 +467,25 @@ static int afs_readpages_one(struct file *file, struct address_space *mapping,
 		return 0;
 	}
 
+	req->len = req->nr_pages * PAGE_SIZE;
+	iov_iter_xarray(&req->def_iter, READ, &file->f_mapping->i_pages,
+			req->pos, req->len);
+	req->iter = &req->def_iter;
+
 	ret = afs_fetch_data(vnode, req);
 	if (ret < 0)
 		goto error;
 
-	task_io_account_read(PAGE_SIZE * req->nr_pages);
 	afs_put_read(req);
 	return 0;
 
 error:
 	if (ret == -ENOENT) {
-		_debug("got NOENT from server"
-		       " - marking file deleted and stale");
+		_debug("got NOENT from server - marking file deleted and stale");
 		set_bit(AFS_VNODE_DELETED, &vnode->flags);
 		ret = -ESTALE;
 	}
 
-	for (i = 0; i < req->nr_pages; i++) {
-		page = req->pages[i];
-		if (page) {
-			SetPageError(page);
-			unlock_page(page);
-		}
-	}
-
 	afs_put_read(req);
 	return ret;
 }
diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 4a57c6c6f12b..897b37301851 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -302,7 +302,6 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_read *req = op->fetch.req;
 	const __be32 *bp;
-	unsigned int size;
 	int ret;
 
 	_enter("{%u,%zu,%zu/%llu}",
@@ -312,8 +311,6 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 	switch (call->unmarshall) {
 	case 0:
 		req->actual_len = 0;
-		req->index = 0;
-		req->offset = req->pos & (PAGE_SIZE - 1);
 		call->unmarshall++;
 		if (call->operation_ID == FSFETCHDATA64) {
 			afs_extract_to_tmp64(call);
@@ -323,7 +320,10 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 		}
 		fallthrough;
 
-		/* extract the returned data length */
+		/* Extract the returned data length into
+		 * ->actual_len.  This may indicate more or less data than was
+		 * requested will be returned.
+		 */
 	case 1:
 		_debug("extract data length");
 		ret = afs_extract_data(call, true);
@@ -332,45 +332,25 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 
 		req->actual_len = be64_to_cpu(call->tmp64);
 		_debug("DATA length: %llu", req->actual_len);
-		req->remain = min(req->len, req->actual_len);
-		if (req->remain == 0)
+
+		if (req->actual_len == 0)
 			goto no_more_data;
 
+		call->iter = req->iter;
+		call->iov_len = min(req->actual_len, req->len);
 		call->unmarshall++;
-
-	begin_page:
-		ASSERTCMP(req->index, <, req->nr_pages);
-		if (req->remain > PAGE_SIZE - req->offset)
-			size = PAGE_SIZE - req->offset;
-		else
-			size = req->remain;
-		call->iov_len = size;
-		call->bvec[0].bv_len = size;
-		call->bvec[0].bv_offset = req->offset;
-		call->bvec[0].bv_page = req->pages[req->index];
-		iov_iter_bvec(&call->def_iter, READ, call->bvec, 1, size);
-		ASSERTCMP(size, <=, PAGE_SIZE);
 		fallthrough;
 
 		/* extract the returned data */
 	case 2:
 		_debug("extract data %zu/%llu",
-		       iov_iter_count(call->iter), req->remain);
+		       iov_iter_count(call->iter), req->actual_len);
 
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
-		req->remain -= call->bvec[0].bv_len;
-		req->offset += call->bvec[0].bv_len;
-		ASSERTCMP(req->offset, <=, PAGE_SIZE);
-		if (req->offset == PAGE_SIZE) {
-			req->offset = 0;
-			req->index++;
-			if (req->remain > 0)
-				goto begin_page;
-		}
 
-		ASSERTCMP(req->remain, ==, 0);
+		call->iter = &call->def_iter;
 		if (req->actual_len <= req->len)
 			goto no_more_data;
 
@@ -412,16 +392,8 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 		break;
 	}
 
-	for (; req->index < req->nr_pages; req->index++) {
-		if (req->offset < PAGE_SIZE)
-			zero_user_segment(req->pages[req->index],
-					  req->offset, PAGE_SIZE);
-		req->offset = 0;
-	}
-
-	if (req->page_done)
-		for (req->index = 0; req->index < req->nr_pages; req->index++)
-			req->page_done(req);
+	if (req->done)
+		req->done(req);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -496,6 +468,8 @@ void afs_fs_fetch_data(struct afs_operation *op)
 	if (!call)
 		return afs_op_nomem(op);
 
+	req->call_debug_id = call->debug_id;
+
 	/* marshall the parameters */
 	bp = call->request;
 	bp[0] = htonl(FSFETCHDATA);
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 4725cfc4aaef..0ed1793949dd 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -31,6 +31,7 @@
 
 struct pagevec;
 struct afs_call;
+struct afs_vnode;
 
 /*
  * Partial file-locking emulation mode.  (The problem being that AFS3 only
@@ -203,18 +204,18 @@ struct afs_read {
 	loff_t			pos;		/* Where to start reading */
 	loff_t			len;		/* How much we're asking for */
 	loff_t			actual_len;	/* How much we're actually getting */
-	loff_t			remain;		/* Amount remaining */
 	loff_t			file_size;	/* File size returned by server */
 	struct key		*key;		/* The key to use to reissue the read */
+	struct afs_vnode	*vnode;		/* The file being read into. */
 	afs_dataversion_t	data_version;	/* Version number returned by server */
 	refcount_t		usage;
-	unsigned int		index;		/* Which page we're reading into */
+	unsigned int		call_debug_id;
 	unsigned int		nr_pages;
-	unsigned int		offset;		/* offset into current page */
-	struct afs_vnode	*vnode;
-	void (*page_done)(struct afs_read *);
-	struct page		**pages;
-	struct page		*array[];
+	int			error;
+	void (*done)(struct afs_read *);
+	void (*cleanup)(struct afs_read *);
+	struct iov_iter		*iter;		/* Iterator representing the buffer */
+	struct iov_iter		def_iter;	/* Default iterator */
 };
 
 /*
@@ -1048,7 +1049,6 @@ extern void afs_put_wb_key(struct afs_wb_key *);
 extern int afs_open(struct inode *, struct file *);
 extern int afs_release(struct inode *, struct file *);
 extern int afs_fetch_data(struct afs_vnode *, struct afs_read *);
-extern int afs_page_filler(void *, struct page *);
 extern void afs_put_read(struct afs_read *);
 
 static inline struct afs_read *afs_get_read(struct afs_read *req)
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 7eba0d3201ba..e78a9bc3b02d 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -22,6 +22,16 @@ int afs_set_page_dirty(struct page *page)
 	return __set_page_dirty_nobuffers(page);
 }
 
+/*
+ * Handle completion of a read operation to fill a page.
+ */
+static void afs_fill_hole(struct afs_read *req)
+{
+	if (iov_iter_count(req->iter) > 0)
+		/* The read was short - clear the excess buffer. */
+		iov_iter_zero(iov_iter_count(req->iter), req->iter);
+}
+
 /*
  * partly or wholly fill a page that's under preparation for writing
  */
@@ -45,18 +55,19 @@ static int afs_fill_page(struct file *file,
 		return 0;
 	}
 
-	req = kzalloc(struct_size(req, array, 1), GFP_KERNEL);
+	req = kzalloc(sizeof(struct afs_read), GFP_KERNEL);
 	if (!req)
 		return -ENOMEM;
 
 	refcount_set(&req->usage, 1);
-	req->key = key_get(afs_file_key(file));
-	req->pos = pos;
-	req->len = len;
-	req->nr_pages = 1;
-	req->pages = req->array;
-	req->pages[0] = page;
-	get_page(page);
+	req->vnode	= vnode;
+	req->done	= afs_fill_hole;
+	req->key	= key_get(afs_file_key(file));
+	req->pos	= pos;
+	req->len	= len;
+	req->nr_pages	= 1;
+	req->iter	= &req->def_iter;
+	iov_iter_xarray(&req->def_iter, READ, &file->f_mapping->i_pages, pos, len);
 
 	ret = afs_fetch_data(vnode, req);
 	afs_put_read(req);
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index 6c45d32da13c..abcec145db4b 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -360,7 +360,6 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_read *req = op->fetch.req;
 	const __be32 *bp;
-	unsigned int size;
 	int ret;
 
 	_enter("{%u,%zu, %zu/%llu}",
@@ -370,13 +369,14 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 	switch (call->unmarshall) {
 	case 0:
 		req->actual_len = 0;
-		req->index = 0;
-		req->offset = req->pos & (PAGE_SIZE - 1);
 		afs_extract_to_tmp64(call);
 		call->unmarshall++;
 		fallthrough;
 
-		/* extract the returned data length */
+		/* Extract the returned data length into ->actual_len.  This
+		 * may indicate more or less data than was requested will be
+		 * returned.
+		 */
 	case 1:
 		_debug("extract data length");
 		ret = afs_extract_data(call, true);
@@ -385,45 +385,25 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 
 		req->actual_len = be64_to_cpu(call->tmp64);
 		_debug("DATA length: %llu", req->actual_len);
-		req->remain = min(req->len, req->actual_len);
-		if (req->remain == 0)
+
+		if (req->actual_len == 0)
 			goto no_more_data;
 
+		call->iter = req->iter;
+		call->iov_len = min(req->actual_len, req->len);
 		call->unmarshall++;
-
-	begin_page:
-		ASSERTCMP(req->index, <, req->nr_pages);
-		if (req->remain > PAGE_SIZE - req->offset)
-			size = PAGE_SIZE - req->offset;
-		else
-			size = req->remain;
-		call->iov_len = size;
-		call->bvec[0].bv_len = size;
-		call->bvec[0].bv_offset = req->offset;
-		call->bvec[0].bv_page = req->pages[req->index];
-		iov_iter_bvec(&call->def_iter, READ, call->bvec, 1, size);
-		ASSERTCMP(size, <=, PAGE_SIZE);
 		fallthrough;
 
 		/* extract the returned data */
 	case 2:
 		_debug("extract data %zu/%llu",
-		       iov_iter_count(call->iter), req->remain);
+		       iov_iter_count(call->iter), req->actual_len);
 
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
-		req->remain -= call->bvec[0].bv_len;
-		req->offset += call->bvec[0].bv_len;
-		ASSERTCMP(req->offset, <=, PAGE_SIZE);
-		if (req->offset == PAGE_SIZE) {
-			req->offset = 0;
-			req->index++;
-			if (req->remain > 0)
-				goto begin_page;
-		}
 
-		ASSERTCMP(req->remain, ==, 0);
+		call->iter = &call->def_iter;
 		if (req->actual_len <= req->len)
 			goto no_more_data;
 
@@ -469,16 +449,8 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 		break;
 	}
 
-	for (; req->index < req->nr_pages; req->index++) {
-		if (req->offset < PAGE_SIZE)
-			zero_user_segment(req->pages[req->index],
-					  req->offset, PAGE_SIZE);
-		req->offset = 0;
-	}
-
-	if (req->page_done)
-		for (req->index = 0; req->index < req->nr_pages; req->index++)
-			req->page_done(req);
+	if (req->done)
+		req->done(req);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -518,6 +490,8 @@ void yfs_fs_fetch_data(struct afs_operation *op)
 	if (!call)
 		return afs_op_nomem(op);
 
+	req->call_debug_id = call->debug_id;
+
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSFETCHDATA64);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

