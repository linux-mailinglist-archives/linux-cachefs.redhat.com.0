Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 310BF44B4E8
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Nov 2021 22:50:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636494642;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=duzOCK+WMSkT0cwCuLu+LB3s6DzOPoXZrTb9eqERGNg=;
	b=Qr0ig0hOOQLtUmiOrS4y2WCW0/QGC/fixIEk17xSNz5ciOn063S3VcJM1Ss75CTNjSduAd
	Js7PiKgv3tXVe88HjBy7iooXfQdvD44N4T8kk8DHMgZO8zrzJzA1sOxLl7xXsES6lIPz1H
	PJ1CRBNMoBtGJfkNnreJkVWfJ9UV9Wk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-Wp14BswiOjaOLSXwcoZckQ-1; Tue, 09 Nov 2021 16:50:38 -0500
X-MC-Unique: Wp14BswiOjaOLSXwcoZckQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADAC987D543;
	Tue,  9 Nov 2021 21:50:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19AA656A91;
	Tue,  9 Nov 2021 21:50:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79FB84EA2A;
	Tue,  9 Nov 2021 21:50:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A9LSIfI007576 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 9 Nov 2021 16:28:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 364D75BAE6; Tue,  9 Nov 2021 21:28:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 288A060843;
	Tue,  9 Nov 2021 21:28:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Date: Tue, 09 Nov 2021 21:28:00 +0000
Message-ID: <163649328026.309189.1124218109373941936.stgit@warthog.procyon.org.uk>
In-Reply-To: <163649323416.309189.4637503793406396694.stgit@warthog.procyon.org.uk>
References: <163649323416.309189.4637503793406396694.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	kafs-testing@auristor.com, linux-mm@kvack.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
	devel@lists.orangefs.org
Subject: [Linux-cachefs] [PATCH v4 4/5] netfs, 9p, afs, ceph: Use folios
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert the netfs helper library to use folios throughout, convert the 9p
and afs filesystems to use folios in their file I/O paths and convert the
ceph filesystem to use just enough folios to compile.

With these changes, afs passes -g quick xfstests.

Changes
=======
ver #4:
 - Fixed a bug in afs_redirty_page() whereby it didn't set the next page
   index in the loop and returned too early.
 - Simplified a check in v9fs_vfs_write_folio_locked()[1].
 - Undid a change to afs_symlink_readpage()[1].
 - Used offset_in_folio() in afs_write_end()[1].
 - Changed from using page_endio() to folio_end{io,_read,_write}()[1].

ver #2:
 - Add 9p foliation.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Tested-by: Jeff Layton <jlayton@kernel.org>
Tested-by: Dominique Martinet <asmadeus@codewreck.org>
Tested-by: kafs-testing@auristor.com
cc: Matthew Wilcox (Oracle) <willy@infradead.org>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Ilya Dryomov <idryomov@gmail.com>
cc: Dominique Martinet <asmadeus@codewreck.org>
cc: v9fs-developer@lists.sourceforge.net
cc: linux-afs@lists.infradead.org
cc: ceph-devel@vger.kernel.org
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/YYKa3bfQZxK5/wDN@casper.infradead.org/ [1]
Link: https://lore.kernel.org/r/2408234.1628687271@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/162877311459.3085614.10601478228012245108.stgit@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/162981153551.1901565.3124454657133703341.stgit@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/163005745264.2472992.9852048135392188995.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/163584187452.4023316.500389675405550116.stgit@warthog.procyon.org.uk/ # v3
---

 fs/9p/vfs_addr.c           |   83 ++++++-----
 fs/9p/vfs_file.c           |   20 +--
 fs/afs/file.c              |   68 +++++----
 fs/afs/internal.h          |   46 +++---
 fs/afs/write.c             |  347 +++++++++++++++++++++-----------------------
 fs/ceph/addr.c             |   80 +++++-----
 fs/netfs/read_helper.c     |  165 +++++++++++----------
 include/linux/netfs.h      |   12 +-
 include/trace/events/afs.h |   21 +--
 9 files changed, 426 insertions(+), 416 deletions(-)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index adafdf86f42f..fac918ccb305 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -108,7 +108,9 @@ static const struct netfs_read_request_ops v9fs_req_ops = {
  */
 static int v9fs_vfs_readpage(struct file *file, struct page *page)
 {
-	return netfs_readpage(file, page, &v9fs_req_ops, NULL);
+	struct folio *folio = page_folio(page);
+
+	return netfs_readpage(file, folio, &v9fs_req_ops, NULL);
 }
 
 /**
@@ -130,13 +132,15 @@ static void v9fs_vfs_readahead(struct readahead_control *ractl)
 
 static int v9fs_release_page(struct page *page, gfp_t gfp)
 {
-	if (PagePrivate(page))
+	struct folio *folio = page_folio(page);
+
+	if (folio_test_private(folio))
 		return 0;
 #ifdef CONFIG_9P_FSCACHE
-	if (PageFsCache(page)) {
+	if (folio_test_fscache(folio)) {
 		if (!(gfp & __GFP_DIRECT_RECLAIM) || !(gfp & __GFP_FS))
 			return 0;
-		wait_on_page_fscache(page);
+		folio_wait_fscache(folio);
 	}
 #endif
 	return 1;
@@ -152,55 +156,58 @@ static int v9fs_release_page(struct page *page, gfp_t gfp)
 static void v9fs_invalidate_page(struct page *page, unsigned int offset,
 				 unsigned int length)
 {
-	wait_on_page_fscache(page);
+	struct folio *folio = page_folio(page);
+
+	folio_wait_fscache(folio);
 }
 
-static int v9fs_vfs_writepage_locked(struct page *page)
+static int v9fs_vfs_write_folio_locked(struct folio *folio)
 {
-	struct inode *inode = page->mapping->host;
+	struct inode *inode = folio_inode(folio);
 	struct v9fs_inode *v9inode = V9FS_I(inode);
-	loff_t start = page_offset(page);
-	loff_t size = i_size_read(inode);
+	loff_t start = folio_pos(folio);
+	loff_t i_size = i_size_read(inode);
 	struct iov_iter from;
-	int err, len;
+	size_t len = folio_size(folio);
+	int err;
+
+	if (start >= i_size)
+		return 0; /* Simultaneous truncation occurred */
 
-	if (page->index == size >> PAGE_SHIFT)
-		len = size & ~PAGE_MASK;
-	else
-		len = PAGE_SIZE;
+	len = min_t(loff_t, i_size - start, len);
 
-	iov_iter_xarray(&from, WRITE, &page->mapping->i_pages, start, len);
+	iov_iter_xarray(&from, WRITE, &folio_mapping(folio)->i_pages, start, len);
 
 	/* We should have writeback_fid always set */
 	BUG_ON(!v9inode->writeback_fid);
 
-	set_page_writeback(page);
+	folio_start_writeback(folio);
 
 	p9_client_write(v9inode->writeback_fid, start, &from, &err);
 
-	end_page_writeback(page);
+	folio_end_writeback(folio);
 	return err;
 }
 
 static int v9fs_vfs_writepage(struct page *page, struct writeback_control *wbc)
 {
+	struct folio *folio = page_folio(page);
 	int retval;
 
-	p9_debug(P9_DEBUG_VFS, "page %p\n", page);
+	p9_debug(P9_DEBUG_VFS, "folio %p\n", folio);
 
-	retval = v9fs_vfs_writepage_locked(page);
+	retval = v9fs_vfs_write_folio_locked(folio);
 	if (retval < 0) {
 		if (retval == -EAGAIN) {
-			redirty_page_for_writepage(wbc, page);
+			folio_redirty_for_writepage(wbc, folio);
 			retval = 0;
 		} else {
-			SetPageError(page);
-			mapping_set_error(page->mapping, retval);
+			mapping_set_error(folio_mapping(folio), retval);
 		}
 	} else
 		retval = 0;
 
-	unlock_page(page);
+	folio_unlock(folio);
 	return retval;
 }
 
@@ -213,14 +220,15 @@ static int v9fs_vfs_writepage(struct page *page, struct writeback_control *wbc)
 
 static int v9fs_launder_page(struct page *page)
 {
+	struct folio *folio = page_folio(page);
 	int retval;
 
-	if (clear_page_dirty_for_io(page)) {
-		retval = v9fs_vfs_writepage_locked(page);
+	if (folio_clear_dirty_for_io(folio)) {
+		retval = v9fs_vfs_write_folio_locked(folio);
 		if (retval)
 			return retval;
 	}
-	wait_on_page_fscache(page);
+	folio_wait_fscache(folio);
 	return 0;
 }
 
@@ -265,10 +273,10 @@ v9fs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 
 static int v9fs_write_begin(struct file *filp, struct address_space *mapping,
 			    loff_t pos, unsigned int len, unsigned int flags,
-			    struct page **pagep, void **fsdata)
+			    struct page **subpagep, void **fsdata)
 {
 	int retval;
-	struct page *page;
+	struct folio *folio;
 	struct v9fs_inode *v9inode = V9FS_I(mapping->host);
 
 	p9_debug(P9_DEBUG_VFS, "filp %p, mapping %p\n", filp, mapping);
@@ -279,31 +287,32 @@ static int v9fs_write_begin(struct file *filp, struct address_space *mapping,
 	 * file.  We need to do this before we get a lock on the page in case
 	 * there's more than one writer competing for the same cache block.
 	 */
-	retval = netfs_write_begin(filp, mapping, pos, len, flags, &page, fsdata,
+	retval = netfs_write_begin(filp, mapping, pos, len, flags, &folio, fsdata,
 				   &v9fs_req_ops, NULL);
 	if (retval < 0)
 		return retval;
 
-	*pagep = find_subpage(page, pos / PAGE_SIZE);
+	*subpagep = &folio->page;
 	return retval;
 }
 
 static int v9fs_write_end(struct file *filp, struct address_space *mapping,
 			  loff_t pos, unsigned int len, unsigned int copied,
-			  struct page *page, void *fsdata)
+			  struct page *subpage, void *fsdata)
 {
 	loff_t last_pos = pos + copied;
-	struct inode *inode = page->mapping->host;
+	struct folio *folio = page_folio(subpage);
+	struct inode *inode = mapping->host;
 
 	p9_debug(P9_DEBUG_VFS, "filp %p, mapping %p\n", filp, mapping);
 
-	if (!PageUptodate(page)) {
+	if (!folio_test_uptodate(folio)) {
 		if (unlikely(copied < len)) {
 			copied = 0;
 			goto out;
 		}
 
-		SetPageUptodate(page);
+		folio_mark_uptodate(folio);
 	}
 
 	/*
@@ -314,10 +323,10 @@ static int v9fs_write_end(struct file *filp, struct address_space *mapping,
 		inode_add_bytes(inode, last_pos - inode->i_size);
 		i_size_write(inode, last_pos);
 	}
-	set_page_dirty(page);
+	folio_mark_dirty(folio);
 out:
-	unlock_page(page);
-	put_page(page);
+	folio_unlock(folio);
+	folio_put(folio);
 
 	return copied;
 }
diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
index 4244d48398ef..612e297f3763 100644
--- a/fs/9p/vfs_file.c
+++ b/fs/9p/vfs_file.c
@@ -528,13 +528,13 @@ static vm_fault_t
 v9fs_vm_page_mkwrite(struct vm_fault *vmf)
 {
 	struct v9fs_inode *v9inode;
-	struct page *page = vmf->page;
+	struct folio *folio = page_folio(vmf->page);
 	struct file *filp = vmf->vma->vm_file;
 	struct inode *inode = file_inode(filp);
 
 
-	p9_debug(P9_DEBUG_VFS, "page %p fid %lx\n",
-		 page, (unsigned long)filp->private_data);
+	p9_debug(P9_DEBUG_VFS, "folio %p fid %lx\n",
+		 folio, (unsigned long)filp->private_data);
 
 	v9inode = V9FS_I(inode);
 
@@ -542,24 +542,24 @@ v9fs_vm_page_mkwrite(struct vm_fault *vmf)
 	 * be modified.  We then assume the entire page will need writing back.
 	 */
 #ifdef CONFIG_9P_FSCACHE
-	if (PageFsCache(page) &&
-	    wait_on_page_fscache_killable(page) < 0)
-		return VM_FAULT_RETRY;
+	if (folio_test_fscache(folio) &&
+	    folio_wait_fscache_killable(folio) < 0)
+		return VM_FAULT_NOPAGE;
 #endif
 
 	/* Update file times before taking page lock */
 	file_update_time(filp);
 
 	BUG_ON(!v9inode->writeback_fid);
-	if (lock_page_killable(page) < 0)
+	if (folio_lock_killable(folio) < 0)
 		return VM_FAULT_RETRY;
-	if (page->mapping != inode->i_mapping)
+	if (folio_mapping(folio) != inode->i_mapping)
 		goto out_unlock;
-	wait_for_stable_page(page);
+	folio_wait_stable(folio);
 
 	return VM_FAULT_LOCKED;
 out_unlock:
-	unlock_page(page);
+	folio_unlock(folio);
 	return VM_FAULT_NOPAGE;
 }
 
diff --git a/fs/afs/file.c b/fs/afs/file.c
index eb11d047c0ae..b6b7e9aa626c 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -324,21 +324,22 @@ static int afs_symlink_readpage(struct file *file, struct page *page)
 {
 	struct afs_vnode *vnode = AFS_FS_I(page->mapping->host);
 	struct afs_read *fsreq;
+	struct folio *folio = page_folio(page);
 	int ret;
 
 	fsreq = afs_alloc_read(GFP_NOFS);
 	if (!fsreq)
 		return -ENOMEM;
 
-	fsreq->pos	= page->index * PAGE_SIZE;
-	fsreq->len	= PAGE_SIZE;
+	fsreq->pos	= folio_pos(folio);
+	fsreq->len	= folio_size(folio);
 	fsreq->vnode	= vnode;
 	fsreq->iter	= &fsreq->def_iter;
 	iov_iter_xarray(&fsreq->def_iter, READ, &page->mapping->i_pages,
 			fsreq->pos, fsreq->len);
 
 	ret = afs_fetch_data(fsreq->vnode, fsreq);
-	page_endio(page, false, ret);
+	folio_end_read(folio, ret);
 	return ret;
 }
 
@@ -362,7 +363,7 @@ static int afs_begin_cache_operation(struct netfs_read_request *rreq)
 }
 
 static int afs_check_write_begin(struct file *file, loff_t pos, unsigned len,
-				 struct page *page, void **_fsdata)
+				 struct folio *folio, void **_fsdata)
 {
 	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
 
@@ -385,7 +386,9 @@ const struct netfs_read_request_ops afs_req_ops = {
 
 static int afs_readpage(struct file *file, struct page *page)
 {
-	return netfs_readpage(file, page, &afs_req_ops, NULL);
+	struct folio *folio = page_folio(page);
+
+	return netfs_readpage(file, folio, &afs_req_ops, NULL);
 }
 
 static void afs_readahead(struct readahead_control *ractl)
@@ -397,29 +400,29 @@ static void afs_readahead(struct readahead_control *ractl)
  * Adjust the dirty region of the page on truncation or full invalidation,
  * getting rid of the markers altogether if the region is entirely invalidated.
  */
-static void afs_invalidate_dirty(struct page *page, unsigned int offset,
+static void afs_invalidate_dirty(struct folio *folio, unsigned int offset,
 				 unsigned int length)
 {
-	struct afs_vnode *vnode = AFS_FS_I(page->mapping->host);
+	struct afs_vnode *vnode = AFS_FS_I(folio_inode(folio));
 	unsigned long priv;
 	unsigned int f, t, end = offset + length;
 
-	priv = page_private(page);
+	priv = (unsigned long)folio_get_private(folio);
 
 	/* we clean up only if the entire page is being invalidated */
-	if (offset == 0 && length == thp_size(page))
+	if (offset == 0 && length == folio_size(folio))
 		goto full_invalidate;
 
 	 /* If the page was dirtied by page_mkwrite(), the PTE stays writable
 	  * and we don't get another notification to tell us to expand it
 	  * again.
 	  */
-	if (afs_is_page_dirty_mmapped(priv))
+	if (afs_is_folio_dirty_mmapped(priv))
 		return;
 
 	/* We may need to shorten the dirty region */
-	f = afs_page_dirty_from(page, priv);
-	t = afs_page_dirty_to(page, priv);
+	f = afs_folio_dirty_from(folio, priv);
+	t = afs_folio_dirty_to(folio, priv);
 
 	if (t <= offset || f >= end)
 		return; /* Doesn't overlap */
@@ -437,17 +440,17 @@ static void afs_invalidate_dirty(struct page *page, unsigned int offset,
 	if (f == t)
 		goto undirty;
 
-	priv = afs_page_dirty(page, f, t);
-	set_page_private(page, priv);
-	trace_afs_page_dirty(vnode, tracepoint_string("trunc"), page);
+	priv = afs_folio_dirty(folio, f, t);
+	folio_change_private(folio, (void *)priv);
+	trace_afs_folio_dirty(vnode, tracepoint_string("trunc"), folio);
 	return;
 
 undirty:
-	trace_afs_page_dirty(vnode, tracepoint_string("undirty"), page);
-	clear_page_dirty_for_io(page);
+	trace_afs_folio_dirty(vnode, tracepoint_string("undirty"), folio);
+	folio_clear_dirty_for_io(folio);
 full_invalidate:
-	trace_afs_page_dirty(vnode, tracepoint_string("inval"), page);
-	detach_page_private(page);
+	trace_afs_folio_dirty(vnode, tracepoint_string("inval"), folio);
+	folio_detach_private(folio);
 }
 
 /*
@@ -458,14 +461,16 @@ static void afs_invalidate_dirty(struct page *page, unsigned int offset,
 static void afs_invalidatepage(struct page *page, unsigned int offset,
 			       unsigned int length)
 {
-	_enter("{%lu},%u,%u", page->index, offset, length);
+	struct folio *folio = page_folio(page);
+
+	_enter("{%lu},%u,%u", folio_index(folio), offset, length);
 
 	BUG_ON(!PageLocked(page));
 
 	if (PagePrivate(page))
-		afs_invalidate_dirty(page, offset, length);
+		afs_invalidate_dirty(folio, offset, length);
 
-	wait_on_page_fscache(page);
+	folio_wait_fscache(folio);
 	_leave("");
 }
 
@@ -475,30 +480,31 @@ static void afs_invalidatepage(struct page *page, unsigned int offset,
  */
 static int afs_releasepage(struct page *page, gfp_t gfp_flags)
 {
-	struct afs_vnode *vnode = AFS_FS_I(page->mapping->host);
+	struct folio *folio = page_folio(page);
+	struct afs_vnode *vnode = AFS_FS_I(folio_inode(folio));
 
 	_enter("{{%llx:%llu}[%lu],%lx},%x",
-	       vnode->fid.vid, vnode->fid.vnode, page->index, page->flags,
+	       vnode->fid.vid, vnode->fid.vnode, folio_index(folio), folio->flags,
 	       gfp_flags);
 
 	/* deny if page is being written to the cache and the caller hasn't
 	 * elected to wait */
 #ifdef CONFIG_AFS_FSCACHE
-	if (PageFsCache(page)) {
+	if (folio_test_fscache(folio)) {
 		if (!(gfp_flags & __GFP_DIRECT_RECLAIM) || !(gfp_flags & __GFP_FS))
 			return false;
-		wait_on_page_fscache(page);
+		folio_wait_fscache(folio);
 	}
 #endif
 
-	if (PagePrivate(page)) {
-		trace_afs_page_dirty(vnode, tracepoint_string("rel"), page);
-		detach_page_private(page);
+	if (folio_test_private(folio)) {
+		trace_afs_folio_dirty(vnode, tracepoint_string("rel"), folio);
+		folio_detach_private(folio);
 	}
 
-	/* indicate that the page can be released */
+	/* Indicate that the folio can be released */
 	_leave(" = T");
-	return 1;
+	return true;
 }
 
 static void afs_add_open_mmap(struct afs_vnode *vnode)
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 9357c53faa69..aa4c0d6c9780 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -876,59 +876,59 @@ struct afs_vnode_cache_aux {
 } __packed;
 
 /*
- * We use page->private to hold the amount of the page that we've written to,
+ * We use folio->private to hold the amount of the folio that we've written to,
  * splitting the field into two parts.  However, we need to represent a range
- * 0...PAGE_SIZE, so we reduce the resolution if the size of the page
+ * 0...FOLIO_SIZE, so we reduce the resolution if the size of the folio
  * exceeds what we can encode.
  */
 #ifdef CONFIG_64BIT
-#define __AFS_PAGE_PRIV_MASK	0x7fffffffUL
-#define __AFS_PAGE_PRIV_SHIFT	32
-#define __AFS_PAGE_PRIV_MMAPPED	0x80000000UL
+#define __AFS_FOLIO_PRIV_MASK		0x7fffffffUL
+#define __AFS_FOLIO_PRIV_SHIFT		32
+#define __AFS_FOLIO_PRIV_MMAPPED	0x80000000UL
 #else
-#define __AFS_PAGE_PRIV_MASK	0x7fffUL
-#define __AFS_PAGE_PRIV_SHIFT	16
-#define __AFS_PAGE_PRIV_MMAPPED	0x8000UL
+#define __AFS_FOLIO_PRIV_MASK		0x7fffUL
+#define __AFS_FOLIO_PRIV_SHIFT		16
+#define __AFS_FOLIO_PRIV_MMAPPED	0x8000UL
 #endif
 
-static inline unsigned int afs_page_dirty_resolution(struct page *page)
+static inline unsigned int afs_folio_dirty_resolution(struct folio *folio)
 {
-	int shift = thp_order(page) + PAGE_SHIFT - (__AFS_PAGE_PRIV_SHIFT - 1);
+	int shift = folio_shift(folio) - (__AFS_FOLIO_PRIV_SHIFT - 1);
 	return (shift > 0) ? shift : 0;
 }
 
-static inline size_t afs_page_dirty_from(struct page *page, unsigned long priv)
+static inline size_t afs_folio_dirty_from(struct folio *folio, unsigned long priv)
 {
-	unsigned long x = priv & __AFS_PAGE_PRIV_MASK;
+	unsigned long x = priv & __AFS_FOLIO_PRIV_MASK;
 
 	/* The lower bound is inclusive */
-	return x << afs_page_dirty_resolution(page);
+	return x << afs_folio_dirty_resolution(folio);
 }
 
-static inline size_t afs_page_dirty_to(struct page *page, unsigned long priv)
+static inline size_t afs_folio_dirty_to(struct folio *folio, unsigned long priv)
 {
-	unsigned long x = (priv >> __AFS_PAGE_PRIV_SHIFT) & __AFS_PAGE_PRIV_MASK;
+	unsigned long x = (priv >> __AFS_FOLIO_PRIV_SHIFT) & __AFS_FOLIO_PRIV_MASK;
 
 	/* The upper bound is immediately beyond the region */
-	return (x + 1) << afs_page_dirty_resolution(page);
+	return (x + 1) << afs_folio_dirty_resolution(folio);
 }
 
-static inline unsigned long afs_page_dirty(struct page *page, size_t from, size_t to)
+static inline unsigned long afs_folio_dirty(struct folio *folio, size_t from, size_t to)
 {
-	unsigned int res = afs_page_dirty_resolution(page);
+	unsigned int res = afs_folio_dirty_resolution(folio);
 	from >>= res;
 	to = (to - 1) >> res;
-	return (to << __AFS_PAGE_PRIV_SHIFT) | from;
+	return (to << __AFS_FOLIO_PRIV_SHIFT) | from;
 }
 
-static inline unsigned long afs_page_dirty_mmapped(unsigned long priv)
+static inline unsigned long afs_folio_dirty_mmapped(unsigned long priv)
 {
-	return priv | __AFS_PAGE_PRIV_MMAPPED;
+	return priv | __AFS_FOLIO_PRIV_MMAPPED;
 }
 
-static inline bool afs_is_page_dirty_mmapped(unsigned long priv)
+static inline bool afs_is_folio_dirty_mmapped(unsigned long priv)
 {
-	return priv & __AFS_PAGE_PRIV_MMAPPED;
+	return priv & __AFS_FOLIO_PRIV_MMAPPED;
 }
 
 #include <trace/events/afs.h>
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 8b1d9c2f6bec..5a81a082e163 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -32,7 +32,7 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
 		    struct page **_page, void **fsdata)
 {
 	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
-	struct page *page;
+	struct folio *folio;
 	unsigned long priv;
 	unsigned f, from;
 	unsigned t, to;
@@ -46,12 +46,12 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
 	 * file.  We need to do this before we get a lock on the page in case
 	 * there's more than one writer competing for the same cache block.
 	 */
-	ret = netfs_write_begin(file, mapping, pos, len, flags, &page, fsdata,
+	ret = netfs_write_begin(file, mapping, pos, len, flags, &folio, fsdata,
 				&afs_req_ops, NULL);
 	if (ret < 0)
 		return ret;
 
-	index = page->index;
+	index = folio_index(folio);
 	from = pos - index * PAGE_SIZE;
 	to = from + len;
 
@@ -59,14 +59,14 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
 	/* See if this page is already partially written in a way that we can
 	 * merge the new write with.
 	 */
-	if (PagePrivate(page)) {
-		priv = page_private(page);
-		f = afs_page_dirty_from(page, priv);
-		t = afs_page_dirty_to(page, priv);
+	if (folio_test_private(folio)) {
+		priv = (unsigned long)folio_get_private(folio);
+		f = afs_folio_dirty_from(folio, priv);
+		t = afs_folio_dirty_to(folio, priv);
 		ASSERTCMP(f, <=, t);
 
-		if (PageWriteback(page)) {
-			trace_afs_page_dirty(vnode, tracepoint_string("alrdy"), page);
+		if (folio_test_writeback(folio)) {
+			trace_afs_folio_dirty(vnode, tracepoint_string("alrdy"), folio);
 			goto flush_conflicting_write;
 		}
 		/* If the file is being filled locally, allow inter-write
@@ -78,7 +78,7 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
 			goto flush_conflicting_write;
 	}
 
-	*_page = page;
+	*_page = &folio->page;
 	_leave(" = 0");
 	return 0;
 
@@ -87,17 +87,17 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
 	 */
 flush_conflicting_write:
 	_debug("flush conflict");
-	ret = write_one_page(page);
+	ret = folio_write_one(folio);
 	if (ret < 0)
 		goto error;
 
-	ret = lock_page_killable(page);
+	ret = folio_lock_killable(folio);
 	if (ret < 0)
 		goto error;
 	goto try_again;
 
 error:
-	put_page(page);
+	folio_put(folio);
 	_leave(" = %d", ret);
 	return ret;
 }
@@ -107,24 +107,25 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
  */
 int afs_write_end(struct file *file, struct address_space *mapping,
 		  loff_t pos, unsigned len, unsigned copied,
-		  struct page *page, void *fsdata)
+		  struct page *subpage, void *fsdata)
 {
+	struct folio *folio = page_folio(subpage);
 	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
 	unsigned long priv;
-	unsigned int f, from = pos & (thp_size(page) - 1);
+	unsigned int f, from = offset_in_folio(folio, pos);
 	unsigned int t, to = from + copied;
 	loff_t i_size, maybe_i_size;
 
 	_enter("{%llx:%llu},{%lx}",
-	       vnode->fid.vid, vnode->fid.vnode, page->index);
+	       vnode->fid.vid, vnode->fid.vnode, folio_index(folio));
 
-	if (!PageUptodate(page)) {
+	if (!folio_test_uptodate(folio)) {
 		if (copied < len) {
 			copied = 0;
 			goto out;
 		}
 
-		SetPageUptodate(page);
+		folio_mark_uptodate(folio);
 	}
 
 	if (copied == 0)
@@ -141,29 +142,29 @@ int afs_write_end(struct file *file, struct address_space *mapping,
 		write_sequnlock(&vnode->cb_lock);
 	}
 
-	if (PagePrivate(page)) {
-		priv = page_private(page);
-		f = afs_page_dirty_from(page, priv);
-		t = afs_page_dirty_to(page, priv);
+	if (folio_test_private(folio)) {
+		priv = (unsigned long)folio_get_private(folio);
+		f = afs_folio_dirty_from(folio, priv);
+		t = afs_folio_dirty_to(folio, priv);
 		if (from < f)
 			f = from;
 		if (to > t)
 			t = to;
-		priv = afs_page_dirty(page, f, t);
-		set_page_private(page, priv);
-		trace_afs_page_dirty(vnode, tracepoint_string("dirty+"), page);
+		priv = afs_folio_dirty(folio, f, t);
+		folio_change_private(folio, (void *)priv);
+		trace_afs_folio_dirty(vnode, tracepoint_string("dirty+"), folio);
 	} else {
-		priv = afs_page_dirty(page, from, to);
-		attach_page_private(page, (void *)priv);
-		trace_afs_page_dirty(vnode, tracepoint_string("dirty"), page);
+		priv = afs_folio_dirty(folio, from, to);
+		folio_attach_private(folio, (void *)priv);
+		trace_afs_folio_dirty(vnode, tracepoint_string("dirty"), folio);
 	}
 
-	if (set_page_dirty(page))
-		_debug("dirtied %lx", page->index);
+	if (folio_mark_dirty(folio))
+		_debug("dirtied %lx", folio_index(folio));
 
 out:
-	unlock_page(page);
-	put_page(page);
+	folio_unlock(folio);
+	folio_put(folio);
 	return copied;
 }
 
@@ -174,40 +175,32 @@ static void afs_kill_pages(struct address_space *mapping,
 			   loff_t start, loff_t len)
 {
 	struct afs_vnode *vnode = AFS_FS_I(mapping->host);
-	struct pagevec pv;
-	unsigned int loop, psize;
+	struct folio *folio;
+	pgoff_t index = start / PAGE_SIZE;
+	pgoff_t last = (start + len - 1) / PAGE_SIZE, next;
 
 	_enter("{%llx:%llu},%llx @%llx",
 	       vnode->fid.vid, vnode->fid.vnode, len, start);
 
-	pagevec_init(&pv);
-
 	do {
-		_debug("kill %llx @%llx", len, start);
-
-		pv.nr = find_get_pages_contig(mapping, start / PAGE_SIZE,
-					      PAGEVEC_SIZE, pv.pages);
-		if (pv.nr == 0)
-			break;
+		_debug("kill %lx (to %lx)", index, last);
 
-		for (loop = 0; loop < pv.nr; loop++) {
-			struct page *page = pv.pages[loop];
+		folio = filemap_get_folio(mapping, index);
+		if (!folio) {
+			next = index + 1;
+			continue;
+		}
 
-			if (page->index * PAGE_SIZE >= start + len)
-				break;
+		next = folio_next_index(folio);
 
-			psize = thp_size(page);
-			start += psize;
-			len -= psize;
-			ClearPageUptodate(page);
-			end_page_writeback(page);
-			lock_page(page);
-			generic_error_remove_page(mapping, page);
-			unlock_page(page);
-		}
+		folio_clear_uptodate(folio);
+		folio_end_writeback(folio);
+		folio_lock(folio);
+		generic_error_remove_page(mapping, &folio->page);
+		folio_unlock(folio);
+		folio_put(folio);
 
-		__pagevec_release(&pv);
-	} while (len > 0);
+	} while (index = next, index <= last);
 
 	_leave("");
 }
@@ -220,37 +213,27 @@ static void afs_redirty_pages(struct writeback_control *wbc,
 			      loff_t start, loff_t len)
 {
 	struct afs_vnode *vnode = AFS_FS_I(mapping->host);
-	struct pagevec pv;
-	unsigned int loop, psize;
+	struct folio *folio;
+	pgoff_t index = start / PAGE_SIZE;
+	pgoff_t last = (start + len - 1) / PAGE_SIZE, next;
 
 	_enter("{%llx:%llu},%llx @%llx",
 	       vnode->fid.vid, vnode->fid.vnode, len, start);
 
-	pagevec_init(&pv);
-
 	do {
 		_debug("redirty %llx @%llx", len, start);
 
-		pv.nr = find_get_pages_contig(mapping, start / PAGE_SIZE,
-					      PAGEVEC_SIZE, pv.pages);
-		if (pv.nr == 0)
-			break;
-
-		for (loop = 0; loop < pv.nr; loop++) {
-			struct page *page = pv.pages[loop];
-
-			if (page->index * PAGE_SIZE >= start + len)
-				break;
-
-			psize = thp_size(page);
-			start += psize;
-			len -= psize;
-			redirty_page_for_writepage(wbc, page);
-			end_page_writeback(page);
+		folio = filemap_get_folio(mapping, index);
+		if (!folio) {
+			next = index + 1;
+			continue;
 		}
 
-		__pagevec_release(&pv);
-	} while (len > 0);
+		next = index + folio_nr_pages(folio);
+		folio_redirty_for_writepage(wbc, folio);
+		folio_end_writeback(folio);
+		folio_put(folio);
+	} while (index = next, index <= last);
 
 	_leave("");
 }
@@ -261,7 +244,7 @@ static void afs_redirty_pages(struct writeback_control *wbc,
 static void afs_pages_written_back(struct afs_vnode *vnode, loff_t start, unsigned int len)
 {
 	struct address_space *mapping = vnode->vfs_inode.i_mapping;
-	struct page *page;
+	struct folio *folio;
 	pgoff_t end;
 
 	XA_STATE(xas, &mapping->i_pages, start / PAGE_SIZE);
@@ -272,15 +255,16 @@ static void afs_pages_written_back(struct afs_vnode *vnode, loff_t start, unsign
 	rcu_read_lock();
 
 	end = (start + len - 1) / PAGE_SIZE;
-	xas_for_each(&xas, page, end) {
-		if (!PageWriteback(page)) {
-			kdebug("bad %x @%llx page %lx %lx", len, start, page->index, end);
-			ASSERT(PageWriteback(page));
+	xas_for_each(&xas, folio, end) {
+		if (!folio_test_writeback(folio)) {
+			kdebug("bad %x @%llx page %lx %lx",
+			       len, start, folio_index(folio), end);
+			ASSERT(folio_test_writeback(folio));
 		}
 
-		trace_afs_page_dirty(vnode, tracepoint_string("clear"), page);
-		detach_page_private(page);
-		page_endio(page, true, 0);
+		trace_afs_folio_dirty(vnode, tracepoint_string("clear"), folio);
+		folio_detach_private(folio);
+		folio_end_write(folio, 0);
 	}
 
 	rcu_read_unlock();
@@ -437,7 +421,7 @@ static void afs_extend_writeback(struct address_space *mapping,
 				 unsigned int *_len)
 {
 	struct pagevec pvec;
-	struct page *page;
+	struct folio *folio;
 	unsigned long priv;
 	unsigned int psize, filler = 0;
 	unsigned int f, t;
@@ -456,43 +440,43 @@ static void afs_extend_writeback(struct address_space *mapping,
 		 */
 		rcu_read_lock();
 
-		xas_for_each(&xas, page, ULONG_MAX) {
+		xas_for_each(&xas, folio, ULONG_MAX) {
 			stop = true;
-			if (xas_retry(&xas, page))
+			if (xas_retry(&xas, folio))
 				continue;
-			if (xa_is_value(page))
+			if (xa_is_value(folio))
 				break;
-			if (page->index != index)
+			if (folio_index(folio) != index)
 				break;
 
-			if (!page_cache_get_speculative(page)) {
+			if (!folio_try_get_rcu(folio)) {
 				xas_reset(&xas);
 				continue;
 			}
 
 			/* Has the page moved or been split? */
-			if (unlikely(page != xas_reload(&xas))) {
-				put_page(page);
+			if (unlikely(folio != xas_reload(&xas))) {
+				folio_put(folio);
 				break;
 			}
 
-			if (!trylock_page(page)) {
-				put_page(page);
+			if (!folio_trylock(folio)) {
+				folio_put(folio);
 				break;
 			}
-			if (!PageDirty(page) || PageWriteback(page)) {
-				unlock_page(page);
-				put_page(page);
+			if (!folio_test_dirty(folio) || folio_test_writeback(folio)) {
+				folio_unlock(folio);
+				folio_put(folio);
 				break;
 			}
 
-			psize = thp_size(page);
-			priv = page_private(page);
-			f = afs_page_dirty_from(page, priv);
-			t = afs_page_dirty_to(page, priv);
+			psize = folio_size(folio);
+			priv = (unsigned long)folio_get_private(folio);
+			f = afs_folio_dirty_from(folio, priv);
+			t = afs_folio_dirty_to(folio, priv);
 			if (f != 0 && !new_content) {
-				unlock_page(page);
-				put_page(page);
+				folio_unlock(folio);
+				folio_put(folio);
 				break;
 			}
 
@@ -503,8 +487,8 @@ static void afs_extend_writeback(struct address_space *mapping,
 			else if (t == psize || new_content)
 				stop = false;
 
-			index += thp_nr_pages(page);
-			if (!pagevec_add(&pvec, page))
+			index += folio_nr_pages(folio);
+			if (!pagevec_add(&pvec, &folio->page))
 				break;
 			if (stop)
 				break;
@@ -521,16 +505,16 @@ static void afs_extend_writeback(struct address_space *mapping,
 			break;
 
 		for (i = 0; i < pagevec_count(&pvec); i++) {
-			page = pvec.pages[i];
-			trace_afs_page_dirty(vnode, tracepoint_string("store+"), page);
+			folio = page_folio(pvec.pages[i]);
+			trace_afs_folio_dirty(vnode, tracepoint_string("store+"), folio);
 
-			if (!clear_page_dirty_for_io(page))
+			if (!folio_clear_dirty_for_io(folio))
 				BUG();
-			if (test_set_page_writeback(page))
+			if (folio_start_writeback(folio))
 				BUG();
 
-			*_count -= thp_nr_pages(page);
-			unlock_page(page);
+			*_count -= folio_nr_pages(folio);
+			folio_unlock(folio);
 		}
 
 		pagevec_release(&pvec);
@@ -544,10 +528,10 @@ static void afs_extend_writeback(struct address_space *mapping,
  * Synchronously write back the locked page and any subsequent non-locked dirty
  * pages.
  */
-static ssize_t afs_write_back_from_locked_page(struct address_space *mapping,
-					       struct writeback_control *wbc,
-					       struct page *page,
-					       loff_t start, loff_t end)
+static ssize_t afs_write_back_from_locked_folio(struct address_space *mapping,
+						struct writeback_control *wbc,
+						struct folio *folio,
+						loff_t start, loff_t end)
 {
 	struct afs_vnode *vnode = AFS_FS_I(mapping->host);
 	struct iov_iter iter;
@@ -558,22 +542,22 @@ static ssize_t afs_write_back_from_locked_page(struct address_space *mapping,
 	long count = wbc->nr_to_write;
 	int ret;
 
-	_enter(",%lx,%llx-%llx", page->index, start, end);
+	_enter(",%lx,%llx-%llx", folio_index(folio), start, end);
 
-	if (test_set_page_writeback(page))
+	if (folio_start_writeback(folio))
 		BUG();
 
-	count -= thp_nr_pages(page);
+	count -= folio_nr_pages(folio);
 
 	/* Find all consecutive lockable dirty pages that have contiguous
 	 * written regions, stopping when we find a page that is not
 	 * immediately lockable, is not dirty or is missing, or we reach the
 	 * end of the range.
 	 */
-	priv = page_private(page);
-	offset = afs_page_dirty_from(page, priv);
-	to = afs_page_dirty_to(page, priv);
-	trace_afs_page_dirty(vnode, tracepoint_string("store"), page);
+	priv = (unsigned long)folio_get_private(folio);
+	offset = afs_folio_dirty_from(folio, priv);
+	to = afs_folio_dirty_to(folio, priv);
+	trace_afs_folio_dirty(vnode, tracepoint_string("store"), folio);
 
 	len = to - offset;
 	start += offset;
@@ -586,7 +570,7 @@ static ssize_t afs_write_back_from_locked_page(struct address_space *mapping,
 		max_len = min_t(unsigned long long, max_len, i_size - start);
 
 		if (len < max_len &&
-		    (to == thp_size(page) || new_content))
+		    (to == folio_size(folio) || new_content))
 			afs_extend_writeback(mapping, vnode, &count,
 					     start, max_len, new_content, &len);
 		len = min_t(loff_t, len, max_len);
@@ -596,7 +580,7 @@ static ssize_t afs_write_back_from_locked_page(struct address_space *mapping,
 	 * set; the first page is still locked at this point, but all the rest
 	 * have been unlocked.
 	 */
-	unlock_page(page);
+	folio_unlock(folio);
 
 	if (start < i_size) {
 		_debug("write back %x @%llx [%llx]", len, start, i_size);
@@ -657,16 +641,17 @@ static ssize_t afs_write_back_from_locked_page(struct address_space *mapping,
  * write a page back to the server
  * - the caller locked the page for us
  */
-int afs_writepage(struct page *page, struct writeback_control *wbc)
+int afs_writepage(struct page *subpage, struct writeback_control *wbc)
 {
+	struct folio *folio = page_folio(subpage);
 	ssize_t ret;
 	loff_t start;
 
-	_enter("{%lx},", page->index);
+	_enter("{%lx},", folio_index(folio));
 
-	start = page->index * PAGE_SIZE;
-	ret = afs_write_back_from_locked_page(page->mapping, wbc, page,
-					      start, LLONG_MAX - start);
+	start = folio_index(folio) * PAGE_SIZE;
+	ret = afs_write_back_from_locked_folio(folio_mapping(folio), wbc,
+					       folio, start, LLONG_MAX - start);
 	if (ret < 0) {
 		_leave(" = %zd", ret);
 		return ret;
@@ -683,7 +668,8 @@ static int afs_writepages_region(struct address_space *mapping,
 				 struct writeback_control *wbc,
 				 loff_t start, loff_t end, loff_t *_next)
 {
-	struct page *page;
+	struct folio *folio;
+	struct page *head_page;
 	ssize_t ret;
 	int n;
 
@@ -693,13 +679,14 @@ static int afs_writepages_region(struct address_space *mapping,
 		pgoff_t index = start / PAGE_SIZE;
 
 		n = find_get_pages_range_tag(mapping, &index, end / PAGE_SIZE,
-					     PAGECACHE_TAG_DIRTY, 1, &page);
+					     PAGECACHE_TAG_DIRTY, 1, &head_page);
 		if (!n)
 			break;
 
-		start = (loff_t)page->index * PAGE_SIZE; /* May regress with THPs */
+		folio = page_folio(head_page);
+		start = folio_pos(folio); /* May regress with THPs */
 
-		_debug("wback %lx", page->index);
+		_debug("wback %lx", folio_index(folio));
 
 		/* At this point we hold neither the i_pages lock nor the
 		 * page lock: the page may be truncated or invalidated
@@ -707,37 +694,38 @@ static int afs_writepages_region(struct address_space *mapping,
 		 * back from swapper_space to tmpfs file mapping
 		 */
 		if (wbc->sync_mode != WB_SYNC_NONE) {
-			ret = lock_page_killable(page);
+			ret = folio_lock_killable(folio);
 			if (ret < 0) {
-				put_page(page);
+				folio_put(folio);
 				return ret;
 			}
 		} else {
-			if (!trylock_page(page)) {
-				put_page(page);
+			if (!folio_trylock(folio)) {
+				folio_put(folio);
 				return 0;
 			}
 		}
 
-		if (page->mapping != mapping || !PageDirty(page)) {
-			start += thp_size(page);
-			unlock_page(page);
-			put_page(page);
+		if (folio_mapping(folio) != mapping ||
+		    !folio_test_dirty(folio)) {
+			start += folio_size(folio);
+			folio_unlock(folio);
+			folio_put(folio);
 			continue;
 		}
 
-		if (PageWriteback(page)) {
-			unlock_page(page);
+		if (folio_test_writeback(folio)) {
+			folio_unlock(folio);
 			if (wbc->sync_mode != WB_SYNC_NONE)
-				wait_on_page_writeback(page);
-			put_page(page);
+				folio_wait_writeback(folio);
+			folio_put(folio);
 			continue;
 		}
 
-		if (!clear_page_dirty_for_io(page))
+		if (!folio_clear_dirty_for_io(folio))
 			BUG();
-		ret = afs_write_back_from_locked_page(mapping, wbc, page, start, end);
-		put_page(page);
+		ret = afs_write_back_from_locked_folio(mapping, wbc, folio, start, end);
+		folio_put(folio);
 		if (ret < 0) {
 			_leave(" = %zd", ret);
 			return ret;
@@ -862,7 +850,6 @@ int afs_fsync(struct file *file, loff_t start, loff_t end, int datasync)
 vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
 {
 	struct folio *folio = page_folio(vmf->page);
-	struct page *page = &folio->page;
 	struct file *file = vmf->vma->vm_file;
 	struct inode *inode = file_inode(file);
 	struct afs_vnode *vnode = AFS_FS_I(inode);
@@ -870,7 +857,7 @@ vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
 	unsigned long priv;
 	vm_fault_t ret = VM_FAULT_RETRY;
 
-	_enter("{{%llx:%llu}},{%lx}", vnode->fid.vid, vnode->fid.vnode, page->index);
+	_enter("{{%llx:%llu}},{%lx}", vnode->fid.vid, vnode->fid.vnode, folio_index(folio));
 
 	afs_validate(vnode, af->key);
 
@@ -880,18 +867,18 @@ vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
 	 * be modified.  We then assume the entire page will need writing back.
 	 */
 #ifdef CONFIG_AFS_FSCACHE
-	if (PageFsCache(page) &&
-	    wait_on_page_fscache_killable(page) < 0)
+	if (folio_test_fscache(folio) &&
+	    folio_wait_fscache_killable(folio) < 0)
 		goto out;
 #endif
 
 	if (folio_wait_writeback_killable(folio))
 		goto out;
 
-	if (lock_page_killable(page) < 0)
+	if (folio_lock_killable(folio) < 0)
 		goto out;
 
-	/* We mustn't change page->private until writeback is complete as that
+	/* We mustn't change folio->private until writeback is complete as that
 	 * details the portion of the page we need to write back and we might
 	 * need to redirty the page if there's a problem.
 	 */
@@ -900,14 +887,14 @@ vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
 		goto out;
 	}
 
-	priv = afs_page_dirty(page, 0, thp_size(page));
-	priv = afs_page_dirty_mmapped(priv);
-	if (PagePrivate(page)) {
-		set_page_private(page, priv);
-		trace_afs_page_dirty(vnode, tracepoint_string("mkwrite+"), page);
+	priv = afs_folio_dirty(folio, 0, folio_size(folio));
+	priv = afs_folio_dirty_mmapped(priv);
+	if (folio_test_private(folio)) {
+		folio_change_private(folio, (void *)priv);
+		trace_afs_folio_dirty(vnode, tracepoint_string("mkwrite+"), folio);
 	} else {
-		attach_page_private(page, (void *)priv);
-		trace_afs_page_dirty(vnode, tracepoint_string("mkwrite"), page);
+		folio_attach_private(folio, (void *)priv);
+		trace_afs_folio_dirty(vnode, tracepoint_string("mkwrite"), folio);
 	}
 	file_update_time(file);
 
@@ -948,38 +935,38 @@ void afs_prune_wb_keys(struct afs_vnode *vnode)
 /*
  * Clean up a page during invalidation.
  */
-int afs_launder_page(struct page *page)
+int afs_launder_page(struct page *subpage)
 {
-	struct address_space *mapping = page->mapping;
-	struct afs_vnode *vnode = AFS_FS_I(mapping->host);
+	struct folio *folio = page_folio(subpage);
+	struct afs_vnode *vnode = AFS_FS_I(folio_inode(folio));
 	struct iov_iter iter;
 	struct bio_vec bv[1];
 	unsigned long priv;
 	unsigned int f, t;
 	int ret = 0;
 
-	_enter("{%lx}", page->index);
+	_enter("{%lx}", folio_index(folio));
 
-	priv = page_private(page);
-	if (clear_page_dirty_for_io(page)) {
+	priv = (unsigned long)folio_get_private(folio);
+	if (folio_clear_dirty_for_io(folio)) {
 		f = 0;
-		t = thp_size(page);
-		if (PagePrivate(page)) {
-			f = afs_page_dirty_from(page, priv);
-			t = afs_page_dirty_to(page, priv);
+		t = folio_size(folio);
+		if (folio_test_private(folio)) {
+			f = afs_folio_dirty_from(folio, priv);
+			t = afs_folio_dirty_to(folio, priv);
 		}
 
-		bv[0].bv_page = page;
+		bv[0].bv_page = &folio->page;
 		bv[0].bv_offset = f;
 		bv[0].bv_len = t - f;
 		iov_iter_bvec(&iter, WRITE, bv, 1, bv[0].bv_len);
 
-		trace_afs_page_dirty(vnode, tracepoint_string("launder"), page);
-		ret = afs_store_data(vnode, &iter, page_offset(page) + f, true);
+		trace_afs_folio_dirty(vnode, tracepoint_string("launder"), folio);
+		ret = afs_store_data(vnode, &iter, folio_pos(folio) + f, true);
 	}
 
-	trace_afs_page_dirty(vnode, tracepoint_string("laundered"), page);
-	detach_page_private(page);
-	wait_on_page_fscache(page);
+	trace_afs_folio_dirty(vnode, tracepoint_string("laundered"), folio);
+	folio_detach_private(folio);
+	folio_wait_fscache(folio);
 	return ret;
 }
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 99b80b5c7a93..04bbe853bcb1 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -63,7 +63,7 @@
 	 (CONGESTION_ON_THRESH(congestion_kb) >> 2))
 
 static int ceph_netfs_check_write_begin(struct file *file, loff_t pos, unsigned int len,
-					struct page *page, void **_fsdata);
+					struct folio *folio, void **_fsdata);
 
 static inline struct ceph_snap_context *page_snap_context(struct page *page)
 {
@@ -317,13 +317,14 @@ static const struct netfs_read_request_ops ceph_netfs_read_ops = {
 };
 
 /* read a single page, without unlocking it. */
-static int ceph_readpage(struct file *file, struct page *page)
+static int ceph_readpage(struct file *file, struct page *subpage)
 {
+	struct folio *folio = page_folio(subpage);
 	struct inode *inode = file_inode(file);
 	struct ceph_inode_info *ci = ceph_inode(inode);
 	struct ceph_vino vino = ceph_vino(inode);
-	u64 off = page_offset(page);
-	u64 len = thp_size(page);
+	size_t len = folio_size(folio);
+	u64 off = folio_file_pos(folio);
 
 	if (ci->i_inline_version != CEPH_INLINE_NONE) {
 		/*
@@ -331,19 +332,19 @@ static int ceph_readpage(struct file *file, struct page *page)
 		 * into page cache while getting Fcr caps.
 		 */
 		if (off == 0) {
-			unlock_page(page);
+			folio_unlock(folio);
 			return -EINVAL;
 		}
-		zero_user_segment(page, 0, thp_size(page));
-		SetPageUptodate(page);
-		unlock_page(page);
+		zero_user_segment(&folio->page, 0, folio_size(folio));
+		folio_mark_uptodate(folio);
+		folio_unlock(folio);
 		return 0;
 	}
 
-	dout("readpage ino %llx.%llx file %p off %llu len %llu page %p index %lu\n",
-	     vino.ino, vino.snap, file, off, len, page, page->index);
+	dout("readpage ino %llx.%llx file %p off %llu len %zu folio %p index %lu\n",
+	     vino.ino, vino.snap, file, off, len, folio, folio_index(folio));
 
-	return netfs_readpage(file, page, &ceph_netfs_read_ops, NULL);
+	return netfs_readpage(file, folio, &ceph_netfs_read_ops, NULL);
 }
 
 static void ceph_readahead(struct readahead_control *ractl)
@@ -1187,18 +1188,18 @@ ceph_find_incompatible(struct page *page)
 }
 
 static int ceph_netfs_check_write_begin(struct file *file, loff_t pos, unsigned int len,
-					struct page *page, void **_fsdata)
+					struct folio *folio, void **_fsdata)
 {
 	struct inode *inode = file_inode(file);
 	struct ceph_inode_info *ci = ceph_inode(inode);
 	struct ceph_snap_context *snapc;
 
-	snapc = ceph_find_incompatible(page);
+	snapc = ceph_find_incompatible(folio_page(folio, 0));
 	if (snapc) {
 		int r;
 
-		unlock_page(page);
-		put_page(page);
+		folio_unlock(folio);
+		folio_put(folio);
 		if (IS_ERR(snapc))
 			return PTR_ERR(snapc);
 
@@ -1216,12 +1217,12 @@ static int ceph_netfs_check_write_begin(struct file *file, loff_t pos, unsigned
  * clean, or already dirty within the same snap context.
  */
 static int ceph_write_begin(struct file *file, struct address_space *mapping,
-			    loff_t pos, unsigned len, unsigned flags,
+			    loff_t pos, unsigned len, unsigned aop_flags,
 			    struct page **pagep, void **fsdata)
 {
 	struct inode *inode = file_inode(file);
 	struct ceph_inode_info *ci = ceph_inode(inode);
-	struct page *page = NULL;
+	struct folio *folio = NULL;
 	pgoff_t index = pos >> PAGE_SHIFT;
 	int r;
 
@@ -1230,39 +1231,43 @@ static int ceph_write_begin(struct file *file, struct address_space *mapping,
 	 * for inline_version sent to the MDS.
 	 */
 	if (ci->i_inline_version != CEPH_INLINE_NONE) {
-		page = grab_cache_page_write_begin(mapping, index, flags);
-		if (!page)
+		unsigned int fgp_flags = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_STABLE;
+		if (aop_flags & AOP_FLAG_NOFS)
+			fgp_flags |= FGP_NOFS;
+		folio = __filemap_get_folio(mapping, index, fgp_flags,
+					    mapping_gfp_mask(mapping));
+		if (!folio)
 			return -ENOMEM;
 
 		/*
 		 * The inline_version on a new inode is set to 1. If that's the
-		 * case, then the page is brand new and isn't yet Uptodate.
+		 * case, then the folio is brand new and isn't yet Uptodate.
 		 */
 		r = 0;
 		if (index == 0 && ci->i_inline_version != 1) {
-			if (!PageUptodate(page)) {
+			if (!folio_test_uptodate(folio)) {
 				WARN_ONCE(1, "ceph: write_begin called on still-inlined inode (inline_version %llu)!\n",
 					  ci->i_inline_version);
 				r = -EINVAL;
 			}
 			goto out;
 		}
-		zero_user_segment(page, 0, thp_size(page));
-		SetPageUptodate(page);
+		zero_user_segment(&folio->page, 0, folio_size(folio));
+		folio_mark_uptodate(folio);
 		goto out;
 	}
 
-	r = netfs_write_begin(file, inode->i_mapping, pos, len, 0, &page, NULL,
+	r = netfs_write_begin(file, inode->i_mapping, pos, len, 0, &folio, NULL,
 			      &ceph_netfs_read_ops, NULL);
 out:
 	if (r == 0)
-		wait_on_page_fscache(page);
+		folio_wait_fscache(folio);
 	if (r < 0) {
-		if (page)
-			put_page(page);
+		if (folio)
+			folio_put(folio);
 	} else {
-		WARN_ON_ONCE(!PageLocked(page));
-		*pagep = page;
+		WARN_ON_ONCE(!folio_test_locked(folio));
+		*pagep = &folio->page;
 	}
 	return r;
 }
@@ -1273,32 +1278,33 @@ static int ceph_write_begin(struct file *file, struct address_space *mapping,
  */
 static int ceph_write_end(struct file *file, struct address_space *mapping,
 			  loff_t pos, unsigned len, unsigned copied,
-			  struct page *page, void *fsdata)
+			  struct page *subpage, void *fsdata)
 {
+	struct folio *folio = page_folio(subpage);
 	struct inode *inode = file_inode(file);
 	bool check_cap = false;
 
-	dout("write_end file %p inode %p page %p %d~%d (%d)\n", file,
-	     inode, page, (int)pos, (int)copied, (int)len);
+	dout("write_end file %p inode %p folio %p %d~%d (%d)\n", file,
+	     inode, folio, (int)pos, (int)copied, (int)len);
 
-	if (!PageUptodate(page)) {
+	if (!folio_test_uptodate(folio)) {
 		/* just return that nothing was copied on a short copy */
 		if (copied < len) {
 			copied = 0;
 			goto out;
 		}
-		SetPageUptodate(page);
+		folio_mark_uptodate(folio);
 	}
 
 	/* did file size increase? */
 	if (pos+copied > i_size_read(inode))
 		check_cap = ceph_inode_set_size(inode, pos+copied);
 
-	set_page_dirty(page);
+	folio_mark_dirty(folio);
 
 out:
-	unlock_page(page);
-	put_page(page);
+	folio_unlock(folio);
+	folio_put(folio);
 
 	if (check_cap)
 		ceph_check_caps(ceph_inode(inode), CHECK_CAPS_AUTHONLY, NULL);
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 994ec22d4040..9320a42dfaf9 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -230,7 +230,7 @@ static void netfs_rreq_completed(struct netfs_read_request *rreq, bool was_async
 
 /*
  * Deal with the completion of writing the data to the cache.  We have to clear
- * the PG_fscache bits on the pages involved and release the caller's ref.
+ * the PG_fscache bits on the folios involved and release the caller's ref.
  *
  * May be called in softirq mode and we inherit a ref from the caller.
  */
@@ -238,7 +238,7 @@ static void netfs_rreq_unmark_after_write(struct netfs_read_request *rreq,
 					  bool was_async)
 {
 	struct netfs_read_subrequest *subreq;
-	struct page *page;
+	struct folio *folio;
 	pgoff_t unlocked = 0;
 	bool have_unlocked = false;
 
@@ -247,14 +247,14 @@ static void netfs_rreq_unmark_after_write(struct netfs_read_request *rreq,
 	list_for_each_entry(subreq, &rreq->subrequests, rreq_link) {
 		XA_STATE(xas, &rreq->mapping->i_pages, subreq->start / PAGE_SIZE);
 
-		xas_for_each(&xas, page, (subreq->start + subreq->len - 1) / PAGE_SIZE) {
+		xas_for_each(&xas, folio, (subreq->start + subreq->len - 1) / PAGE_SIZE) {
 			/* We might have multiple writes from the same huge
-			 * page, but we mustn't unlock a page more than once.
+			 * folio, but we mustn't unlock a folio more than once.
 			 */
-			if (have_unlocked && page->index <= unlocked)
+			if (have_unlocked && folio_index(folio) <= unlocked)
 				continue;
-			unlocked = page->index;
-			end_page_fscache(page);
+			unlocked = folio_index(folio);
+			folio_end_fscache(folio);
 			have_unlocked = true;
 		}
 	}
@@ -367,18 +367,17 @@ static void netfs_rreq_write_to_cache(struct netfs_read_request *rreq,
 }
 
 /*
- * Unlock the pages in a read operation.  We need to set PG_fscache on any
- * pages we're going to write back before we unlock them.
+ * Unlock the folios in a read operation.  We need to set PG_fscache on any
+ * folios we're going to write back before we unlock them.
  */
 static void netfs_rreq_unlock(struct netfs_read_request *rreq)
 {
 	struct netfs_read_subrequest *subreq;
-	struct page *page;
+	struct folio *folio;
 	unsigned int iopos, account = 0;
 	pgoff_t start_page = rreq->start / PAGE_SIZE;
 	pgoff_t last_page = ((rreq->start + rreq->len) / PAGE_SIZE) - 1;
 	bool subreq_failed = false;
-	int i;
 
 	XA_STATE(xas, &rreq->mapping->i_pages, start_page);
 
@@ -403,9 +402,9 @@ static void netfs_rreq_unlock(struct netfs_read_request *rreq)
 	trace_netfs_rreq(rreq, netfs_rreq_trace_unlock);
 
 	rcu_read_lock();
-	xas_for_each(&xas, page, last_page) {
-		unsigned int pgpos = (page->index - start_page) * PAGE_SIZE;
-		unsigned int pgend = pgpos + thp_size(page);
+	xas_for_each(&xas, folio, last_page) {
+		unsigned int pgpos = (folio_index(folio) - start_page) * PAGE_SIZE;
+		unsigned int pgend = pgpos + folio_size(folio);
 		bool pg_failed = false;
 
 		for (;;) {
@@ -414,7 +413,7 @@ static void netfs_rreq_unlock(struct netfs_read_request *rreq)
 				break;
 			}
 			if (test_bit(NETFS_SREQ_WRITE_TO_CACHE, &subreq->flags))
-				set_page_fscache(page);
+				folio_start_fscache(folio);
 			pg_failed |= subreq_failed;
 			if (pgend < iopos + subreq->len)
 				break;
@@ -433,17 +432,16 @@ static void netfs_rreq_unlock(struct netfs_read_request *rreq)
 		}
 
 		if (!pg_failed) {
-			for (i = 0; i < thp_nr_pages(page); i++)
-				flush_dcache_page(page);
-			SetPageUptodate(page);
+			flush_dcache_folio(folio);
+			folio_mark_uptodate(folio);
 		}
 
-		if (!test_bit(NETFS_RREQ_DONT_UNLOCK_PAGES, &rreq->flags)) {
-			if (page->index == rreq->no_unlock_page &&
-			    test_bit(NETFS_RREQ_NO_UNLOCK_PAGE, &rreq->flags))
+		if (!test_bit(NETFS_RREQ_DONT_UNLOCK_FOLIOS, &rreq->flags)) {
+			if (folio_index(folio) == rreq->no_unlock_folio &&
+			    test_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags))
 				_debug("no unlock");
 			else
-				unlock_page(page);
+				folio_unlock(folio);
 		}
 	}
 	rcu_read_unlock();
@@ -876,7 +874,6 @@ void netfs_readahead(struct readahead_control *ractl,
 		     void *netfs_priv)
 {
 	struct netfs_read_request *rreq;
-	struct page *page;
 	unsigned int debug_index = 0;
 	int ret;
 
@@ -911,11 +908,11 @@ void netfs_readahead(struct readahead_control *ractl,
 
 	} while (rreq->submitted < rreq->len);
 
-	/* Drop the refs on the pages here rather than in the cache or
+	/* Drop the refs on the folios here rather than in the cache or
 	 * filesystem.  The locks will be dropped in netfs_rreq_unlock().
 	 */
-	while ((page = readahead_page(ractl)))
-		put_page(page);
+	while (readahead_folio(ractl))
+		;
 
 	/* If we decrement nr_rd_ops to 0, the ref belongs to us. */
 	if (atomic_dec_and_test(&rreq->nr_rd_ops))
@@ -935,7 +932,7 @@ EXPORT_SYMBOL(netfs_readahead);
 /**
  * netfs_readpage - Helper to manage a readpage request
  * @file: The file to read from
- * @page: The page to read
+ * @folio: The folio to read
  * @ops: The network filesystem's operations for the helper to use
  * @netfs_priv: Private netfs data to be retained in the request
  *
@@ -950,7 +947,7 @@ EXPORT_SYMBOL(netfs_readahead);
  * This is usable whether or not caching is enabled.
  */
 int netfs_readpage(struct file *file,
-		   struct page *page,
+		   struct folio *folio,
 		   const struct netfs_read_request_ops *ops,
 		   void *netfs_priv)
 {
@@ -958,23 +955,23 @@ int netfs_readpage(struct file *file,
 	unsigned int debug_index = 0;
 	int ret;
 
-	_enter("%lx", page_index(page));
+	_enter("%lx", folio_index(folio));
 
 	rreq = netfs_alloc_read_request(ops, netfs_priv, file);
 	if (!rreq) {
 		if (netfs_priv)
-			ops->cleanup(netfs_priv, page_file_mapping(page));
-		unlock_page(page);
+			ops->cleanup(netfs_priv, folio_file_mapping(folio));
+		folio_unlock(folio);
 		return -ENOMEM;
 	}
-	rreq->mapping	= page_file_mapping(page);
-	rreq->start	= page_file_offset(page);
-	rreq->len	= thp_size(page);
+	rreq->mapping	= folio_file_mapping(folio);
+	rreq->start	= folio_file_pos(folio);
+	rreq->len	= folio_size(folio);
 
 	if (ops->begin_cache_operation) {
 		ret = ops->begin_cache_operation(rreq);
 		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS) {
-			unlock_page(page);
+			folio_unlock(folio);
 			goto out;
 		}
 	}
@@ -1012,40 +1009,40 @@ int netfs_readpage(struct file *file,
 EXPORT_SYMBOL(netfs_readpage);
 
 /**
- * netfs_skip_page_read - prep a page for writing without reading first
- * @page: page being prepared
+ * netfs_skip_folio_read - prep a folio for writing without reading first
+ * @folio: The folio being prepared
  * @pos: starting position for the write
  * @len: length of write
  *
  * In some cases, write_begin doesn't need to read at all:
- * - full page write
- * - write that lies in a page that is completely beyond EOF
- * - write that covers the the page from start to EOF or beyond it
+ * - full folio write
+ * - write that lies in a folio that is completely beyond EOF
+ * - write that covers the folio from start to EOF or beyond it
  *
  * If any of these criteria are met, then zero out the unwritten parts
- * of the page and return true. Otherwise, return false.
+ * of the folio and return true. Otherwise, return false.
  */
-static bool netfs_skip_page_read(struct page *page, loff_t pos, size_t len)
+static bool netfs_skip_folio_read(struct folio *folio, loff_t pos, size_t len)
 {
-	struct inode *inode = page->mapping->host;
+	struct inode *inode = folio_inode(folio);
 	loff_t i_size = i_size_read(inode);
-	size_t offset = offset_in_thp(page, pos);
+	size_t offset = offset_in_folio(folio, pos);
 
-	/* Full page write */
-	if (offset == 0 && len >= thp_size(page))
+	/* Full folio write */
+	if (offset == 0 && len >= folio_size(folio))
 		return true;
 
-	/* pos beyond last page in the file */
+	/* pos beyond last folio in the file */
 	if (pos - offset >= i_size)
 		goto zero_out;
 
-	/* Write that covers from the start of the page to EOF or beyond */
+	/* Write that covers from the start of the folio to EOF or beyond */
 	if (offset == 0 && (pos + len) >= i_size)
 		goto zero_out;
 
 	return false;
 zero_out:
-	zero_user_segments(page, 0, offset, offset + len, thp_size(page));
+	zero_user_segments(&folio->page, 0, offset, offset + len, folio_size(folio));
 	return true;
 }
 
@@ -1054,9 +1051,9 @@ static bool netfs_skip_page_read(struct page *page, loff_t pos, size_t len)
  * @file: The file to read from
  * @mapping: The mapping to read from
  * @pos: File position at which the write will begin
- * @len: The length of the write (may extend beyond the end of the page chosen)
- * @flags: AOP_* flags
- * @_page: Where to put the resultant page
+ * @len: The length of the write (may extend beyond the end of the folio chosen)
+ * @aop_flags: AOP_* flags
+ * @_folio: Where to put the resultant folio
  * @_fsdata: Place for the netfs to store a cookie
  * @ops: The network filesystem's operations for the helper to use
  * @netfs_priv: Private netfs data to be retained in the request
@@ -1072,37 +1069,41 @@ static bool netfs_skip_page_read(struct page *page, loff_t pos, size_t len)
  * issue_op, is mandatory.
  *
  * The check_write_begin() operation can be provided to check for and flush
- * conflicting writes once the page is grabbed and locked.  It is passed a
+ * conflicting writes once the folio is grabbed and locked.  It is passed a
  * pointer to the fsdata cookie that gets returned to the VM to be passed to
  * write_end.  It is permitted to sleep.  It should return 0 if the request
- * should go ahead; unlock the page and return -EAGAIN to cause the page to be
- * regot; or return an error.
+ * should go ahead; unlock the folio and return -EAGAIN to cause the folio to
+ * be regot; or return an error.
  *
  * This is usable whether or not caching is enabled.
  */
 int netfs_write_begin(struct file *file, struct address_space *mapping,
-		      loff_t pos, unsigned int len, unsigned int flags,
-		      struct page **_page, void **_fsdata,
+		      loff_t pos, unsigned int len, unsigned int aop_flags,
+		      struct folio **_folio, void **_fsdata,
 		      const struct netfs_read_request_ops *ops,
 		      void *netfs_priv)
 {
 	struct netfs_read_request *rreq;
-	struct page *page, *xpage;
+	struct folio *folio;
 	struct inode *inode = file_inode(file);
-	unsigned int debug_index = 0;
+	unsigned int debug_index = 0, fgp_flags;
 	pgoff_t index = pos >> PAGE_SHIFT;
 	int ret;
 
 	DEFINE_READAHEAD(ractl, file, NULL, mapping, index);
 
 retry:
-	page = grab_cache_page_write_begin(mapping, index, flags);
-	if (!page)
+	fgp_flags = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_STABLE;
+	if (aop_flags & AOP_FLAG_NOFS)
+		fgp_flags |= FGP_NOFS;
+	folio = __filemap_get_folio(mapping, index, fgp_flags,
+				    mapping_gfp_mask(mapping));
+	if (!folio)
 		return -ENOMEM;
 
 	if (ops->check_write_begin) {
 		/* Allow the netfs (eg. ceph) to flush conflicts. */
-		ret = ops->check_write_begin(file, pos, len, page, _fsdata);
+		ret = ops->check_write_begin(file, pos, len, folio, _fsdata);
 		if (ret < 0) {
 			trace_netfs_failure(NULL, NULL, ret, netfs_fail_check_write_begin);
 			if (ret == -EAGAIN)
@@ -1111,28 +1112,28 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 		}
 	}
 
-	if (PageUptodate(page))
-		goto have_page;
+	if (folio_test_uptodate(folio))
+		goto have_folio;
 
 	/* If the page is beyond the EOF, we want to clear it - unless it's
 	 * within the cache granule containing the EOF, in which case we need
 	 * to preload the granule.
 	 */
 	if (!ops->is_cache_enabled(inode) &&
-	    netfs_skip_page_read(page, pos, len)) {
+	    netfs_skip_folio_read(folio, pos, len)) {
 		netfs_stat(&netfs_n_rh_write_zskip);
-		goto have_page_no_wait;
+		goto have_folio_no_wait;
 	}
 
 	ret = -ENOMEM;
 	rreq = netfs_alloc_read_request(ops, netfs_priv, file);
 	if (!rreq)
 		goto error;
-	rreq->mapping		= page->mapping;
-	rreq->start		= page_offset(page);
-	rreq->len		= thp_size(page);
-	rreq->no_unlock_page	= page->index;
-	__set_bit(NETFS_RREQ_NO_UNLOCK_PAGE, &rreq->flags);
+	rreq->mapping		= folio_file_mapping(folio);
+	rreq->start		= folio_file_pos(folio);
+	rreq->len		= folio_size(folio);
+	rreq->no_unlock_folio	= folio_index(folio);
+	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
 	netfs_priv = NULL;
 
 	if (ops->begin_cache_operation) {
@@ -1147,14 +1148,14 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	/* Expand the request to meet caching requirements and download
 	 * preferences.
 	 */
-	ractl._nr_pages = thp_nr_pages(page);
+	ractl._nr_pages = folio_nr_pages(folio);
 	netfs_rreq_expand(rreq, &ractl);
 	netfs_get_read_request(rreq);
 
-	/* We hold the page locks, so we can drop the references */
-	while ((xpage = readahead_page(&ractl)))
-		if (xpage != page)
-			put_page(xpage);
+	/* We hold the folio locks, so we can drop the references */
+	folio_get(folio);
+	while (readahead_folio(&ractl))
+		;
 
 	atomic_set(&rreq->nr_rd_ops, 1);
 	do {
@@ -1184,22 +1185,22 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	if (ret < 0)
 		goto error;
 
-have_page:
-	ret = wait_on_page_fscache_killable(page);
+have_folio:
+	ret = folio_wait_fscache_killable(folio);
 	if (ret < 0)
 		goto error;
-have_page_no_wait:
+have_folio_no_wait:
 	if (netfs_priv)
 		ops->cleanup(netfs_priv, mapping);
-	*_page = page;
+	*_folio = folio;
 	_leave(" = 0");
 	return 0;
 
 error_put:
 	netfs_put_read_request(rreq, false);
 error:
-	unlock_page(page);
-	put_page(page);
+	folio_unlock(folio);
+	folio_put(folio);
 	if (netfs_priv)
 		ops->cleanup(netfs_priv, mapping);
 	_leave(" = %d", ret);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 12c4177f7703..ca0683b9e3d1 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -166,13 +166,13 @@ struct netfs_read_request {
 	short			error;		/* 0 or error that occurred */
 	loff_t			i_size;		/* Size of the file */
 	loff_t			start;		/* Start position */
-	pgoff_t			no_unlock_page;	/* Don't unlock this page after read */
+	pgoff_t			no_unlock_folio; /* Don't unlock this folio after read */
 	refcount_t		usage;
 	unsigned long		flags;
 #define NETFS_RREQ_INCOMPLETE_IO	0	/* Some ioreqs terminated short or with error */
 #define NETFS_RREQ_WRITE_TO_CACHE	1	/* Need to write to the cache */
-#define NETFS_RREQ_NO_UNLOCK_PAGE	2	/* Don't unlock no_unlock_page on completion */
-#define NETFS_RREQ_DONT_UNLOCK_PAGES	3	/* Don't unlock the pages on completion */
+#define NETFS_RREQ_NO_UNLOCK_FOLIO	2	/* Don't unlock no_unlock_folio on completion */
+#define NETFS_RREQ_DONT_UNLOCK_FOLIOS	3	/* Don't unlock the folios on completion */
 #define NETFS_RREQ_FAILED		4	/* The request failed */
 #define NETFS_RREQ_IN_PROGRESS		5	/* Unlocked when the request completes */
 	const struct netfs_read_request_ops *netfs_ops;
@@ -190,7 +190,7 @@ struct netfs_read_request_ops {
 	void (*issue_op)(struct netfs_read_subrequest *subreq);
 	bool (*is_still_valid)(struct netfs_read_request *rreq);
 	int (*check_write_begin)(struct file *file, loff_t pos, unsigned len,
-				 struct page *page, void **_fsdata);
+				 struct folio *folio, void **_fsdata);
 	void (*done)(struct netfs_read_request *rreq);
 	void (*cleanup)(struct address_space *mapping, void *netfs_priv);
 };
@@ -240,11 +240,11 @@ extern void netfs_readahead(struct readahead_control *,
 			    const struct netfs_read_request_ops *,
 			    void *);
 extern int netfs_readpage(struct file *,
-			  struct page *,
+			  struct folio *,
 			  const struct netfs_read_request_ops *,
 			  void *);
 extern int netfs_write_begin(struct file *, struct address_space *,
-			     loff_t, unsigned int, unsigned int, struct page **,
+			     loff_t, unsigned int, unsigned int, struct folio **,
 			     void **,
 			     const struct netfs_read_request_ops *,
 			     void *);
diff --git a/include/trace/events/afs.h b/include/trace/events/afs.h
index bca73e8c8cde..499f5fabd20f 100644
--- a/include/trace/events/afs.h
+++ b/include/trace/events/afs.h
@@ -1016,31 +1016,32 @@ TRACE_EVENT(afs_dir_check_failed,
 		      __entry->vnode, __entry->off, __entry->i_size)
 	    );
 
-TRACE_EVENT(afs_page_dirty,
-	    TP_PROTO(struct afs_vnode *vnode, const char *where, struct page *page),
+TRACE_EVENT(afs_folio_dirty,
+	    TP_PROTO(struct afs_vnode *vnode, const char *where, struct folio *folio),
 
-	    TP_ARGS(vnode, where, page),
+	    TP_ARGS(vnode, where, folio),
 
 	    TP_STRUCT__entry(
 		    __field(struct afs_vnode *,		vnode		)
 		    __field(const char *,		where		)
-		    __field(pgoff_t,			page		)
+		    __field(pgoff_t,			index		)
 		    __field(unsigned long,		from		)
 		    __field(unsigned long,		to		)
 			     ),
 
 	    TP_fast_assign(
+		    unsigned long priv = (unsigned long)folio_get_private(folio);
 		    __entry->vnode = vnode;
 		    __entry->where = where;
-		    __entry->page = page->index;
-		    __entry->from = afs_page_dirty_from(page, page->private);
-		    __entry->to = afs_page_dirty_to(page, page->private);
-		    __entry->to |= (afs_is_page_dirty_mmapped(page->private) ?
-				    (1UL << (BITS_PER_LONG - 1)) : 0);
+		    __entry->index = folio_index(folio);
+		    __entry->from  = afs_folio_dirty_from(folio, priv);
+		    __entry->to    = afs_folio_dirty_to(folio, priv);
+		    __entry->to   |= (afs_is_folio_dirty_mmapped(priv) ?
+				      (1UL << (BITS_PER_LONG - 1)) : 0);
 			   ),
 
 	    TP_printk("vn=%p %lx %s %lx-%lx%s",
-		      __entry->vnode, __entry->page, __entry->where,
+		      __entry->vnode, __entry->index, __entry->where,
 		      __entry->from,
 		      __entry->to & ~(1UL << (BITS_PER_LONG - 1)),
 		      __entry->to & (1UL << (BITS_PER_LONG - 1)) ? " M" : "")


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

