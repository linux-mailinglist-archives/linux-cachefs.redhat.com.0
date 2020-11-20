Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 63B242BAD4D
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 16:18:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605885494;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H8lN8v9AzAT1cFbNv9C7C0dfMCX8VaifMS+LbefT+1Y=;
	b=Kqw+bIkUCAnmW+QyBiuKxRrxTSt/l2w9W6z3qFqhIlLv41ISGzjChIzO0JvalQtMcLI43H
	8R648Q+3khZXNu10jsvyEfEt8OyXPIXwl4KxDykFzLvaxCIy2bYJhnwxtMSbkDhUKyxAWF
	kRo8mxKza/11aPZfYzcUvgPbcdvq4iE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-XQz1PfpfOLiF6LatEY0muA-1; Fri, 20 Nov 2020 10:18:11 -0500
X-MC-Unique: XQz1PfpfOLiF6LatEY0muA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B5B38144E3;
	Fri, 20 Nov 2020 15:18:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BAB95D9D7;
	Fri, 20 Nov 2020 15:18:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4AB854EE7F;
	Fri, 20 Nov 2020 15:18:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKFI8tb015565 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 10:18:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 024581972B; Fri, 20 Nov 2020 15:18:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-246.rdu2.redhat.com
	[10.10.112.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDC8519C71;
	Fri, 20 Nov 2020 15:18:00 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Fri, 20 Nov 2020 15:18:00 +0000
Message-ID: <160588547998.3465195.14055966521328195914.stgit@warthog.procyon.org.uk>
In-Reply-To: <160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk>
References: <160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [RFC PATCH 71/76] afs: Copy local writes to the
 cache when writing to the server
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
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

When writing to the server from afs_writepage() or afs_writepages(), copy
the data to the cache object too.

To make this possible, the cookie must have its active users count
incremented when the page is dirtied and kept incremented until we manage
to clean up all the pages.  This allows the writeback to take place after
the last file struct is released.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/file.c     |    6 ++++
 fs/afs/inode.c    |   11 ++++++--
 fs/afs/internal.h |    1 +
 fs/afs/super.c    |    1 +
 fs/afs/write.c    |   74 +++++++++++++++++++++++++++++++++++++++++++++--------
 5 files changed, 79 insertions(+), 14 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 21c0ea627bd4..bd070684de53 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -403,6 +403,12 @@ static void afs_readahead(struct readahead_control *ractl)
 	netfs_readahead(ractl, &afs_req_ops, NULL);
 }
 
+int afs_write_inode(struct inode *inode, struct writeback_control *wbc)
+{
+	fscache_unpin_writeback(wbc, afs_vnode_cache(AFS_FS_I(inode)));
+	return 0;
+}
+
 /*
  * Adjust the dirty region of the page on truncation or full invalidation,
  * getting rid of the markers altogether if the region is entirely invalidated.
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 177baeea5a1e..51e55bfadb54 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -776,9 +776,7 @@ int afs_drop_inode(struct inode *inode)
  */
 void afs_evict_inode(struct inode *inode)
 {
-	struct afs_vnode *vnode;
-
-	vnode = AFS_FS_I(inode);
+	struct afs_vnode *vnode = AFS_FS_I(inode);
 
 	_enter("{%llx:%llu.%d}",
 	       vnode->fid.vid,
@@ -790,6 +788,13 @@ void afs_evict_inode(struct inode *inode)
 	ASSERTCMP(inode->i_ino, ==, vnode->fid.vnode);
 
 	truncate_inode_pages_final(&inode->i_data);
+
+	if (inode->i_state & I_PINNING_FSCACHE_WB) {
+		struct afs_vnode_cache_aux aux;
+		loff_t i_size = i_size_read(&vnode->vfs_inode);
+		aux.data_version = vnode->status.data_version;
+		fscache_unuse_cookie(afs_vnode_cache(vnode), &aux, &i_size);
+	}
 	clear_inode(inode);
 
 	while (!list_empty(&vnode->wb_keys)) {
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 7a76bedd19d9..bc76c08b9f38 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1045,6 +1045,7 @@ extern int afs_release(struct inode *, struct file *);
 extern int afs_fetch_data(struct afs_vnode *, struct afs_read *);
 extern struct afs_read *afs_alloc_read(gfp_t);
 extern void afs_put_read(struct afs_read *);
+extern int afs_write_inode(struct inode *, struct writeback_control *);
 
 static inline struct afs_read *afs_get_read(struct afs_read *req)
 {
diff --git a/fs/afs/super.c b/fs/afs/super.c
index d745e228961a..c95523e90fe6 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -61,6 +61,7 @@ int afs_net_id;
 static const struct super_operations afs_super_ops = {
 	.statfs		= afs_statfs,
 	.alloc_inode	= afs_alloc_inode,
+	.write_inode	= afs_write_inode,
 	.drop_inode	= afs_drop_inode,
 	.destroy_inode	= afs_destroy_inode,
 	.free_inode	= afs_free_inode,
diff --git a/fs/afs/write.c b/fs/afs/write.c
index b2e03de09c24..627b08d8de1f 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -15,13 +15,16 @@
 #include <linux/fscache.h>
 #include "internal.h"
 
+static void afs_write_to_cache(struct afs_vnode *vnode, loff_t start, size_t len,
+			       loff_t i_size);
+
 /*
- * mark a page as having been made dirty and thus needing writeback
+ * Mark a page as having been made dirty and thus needing writeback.  We also
+ * need to pin the cache object to write back to.
  */
 int afs_set_page_dirty(struct page *page)
 {
-	_enter("");
-	return __set_page_dirty_nobuffers(page);
+	return fscache_set_page_dirty(page, afs_vnode_cache(AFS_FS_I(page->mapping->host)));
 }
 
 /*
@@ -113,7 +116,7 @@ int afs_write_end(struct file *file, struct address_space *mapping,
 	unsigned long priv;
 	unsigned int f, from = pos & (thp_size(page) - 1);
 	unsigned int t, to = from + copied;
-	loff_t i_size, maybe_i_size;
+	loff_t i_size, write_end_pos;
 
 	_enter("{%llx:%llu},{%lx}",
 	       vnode->fid.vid, vnode->fid.vnode, page->index);
@@ -121,15 +124,16 @@ int afs_write_end(struct file *file, struct address_space *mapping,
 	if (copied == 0)
 		goto out;
 
-	maybe_i_size = pos + copied;
+	write_end_pos = pos + copied;
 
 	i_size = i_size_read(&vnode->vfs_inode);
-	if (maybe_i_size > i_size) {
+	if (write_end_pos > i_size) {
 		write_seqlock(&vnode->cb_lock);
 		i_size = i_size_read(&vnode->vfs_inode);
-		if (maybe_i_size > i_size)
-			i_size_write(&vnode->vfs_inode, maybe_i_size);
+		if (write_end_pos > i_size)
+			i_size_write(&vnode->vfs_inode, write_end_pos);
 		write_sequnlock(&vnode->cb_lock);
+		fscache_update_cookie(afs_vnode_cache(vnode), NULL, &write_end_pos);
 	}
 
 	ASSERT(PageUptodate(page));
@@ -468,7 +472,8 @@ static void afs_extend_writeback(struct address_space *mapping,
 
 			if (!trylock_page(page))
 				break;
-			if (!PageDirty(page) || PageWriteback(page)) {
+			if (!PageDirty(page) || PageWriteback(page) ||
+			    PageFsCache(page)) {
 				unlock_page(page);
 				break;
 			}
@@ -514,6 +519,8 @@ static void afs_extend_writeback(struct address_space *mapping,
 				BUG();
 			if (test_set_page_writeback(page))
 				BUG();
+			if (TestSetPageFsCache(page))
+				BUG();
 
 			*_count -= thp_nr_pages(page);
 			unlock_page(page);
@@ -548,6 +555,8 @@ static ssize_t afs_write_back_from_locked_page(struct address_space *mapping,
 
 	if (test_set_page_writeback(page))
 		BUG();
+	if (TestSetPageFsCache(page))
+		BUG();
 
 	count -= thp_nr_pages(page);
 
@@ -587,12 +596,18 @@ static ssize_t afs_write_back_from_locked_page(struct address_space *mapping,
 	if (start < i_size) {
 		_debug("write back %x @%llx [%llx]", len, start, i_size);
 
+		/* Speculatively write to the cache.  We have to fix this up
+		 * later if the store fails.
+		 */
+		afs_write_to_cache(vnode, start, len, i_size);
+
 		iov_iter_xarray(&iter, WRITE, &mapping->i_pages, start, len);
 		ret = afs_store_data(vnode, &iter, start, false);
 	} else {
 		_debug("write discard %x @%llx [%llx]", len, start, i_size);
 
 		/* The dirty region was entirely beyond the EOF. */
+		fscache_clear_page_bits(mapping, start, len);
 		afs_pages_written_back(vnode, start, len);
 		ret = 0;
 	}
@@ -650,6 +665,10 @@ int afs_writepage(struct page *page, struct writeback_control *wbc)
 
 	_enter("{%lx},", page->index);
 
+#ifdef CONFIG_AFS_FSCACHE
+	wait_on_page_fscache(page);
+#endif
+
 	start = page->index * PAGE_SIZE;
 	ret = afs_write_back_from_locked_page(page->mapping, wbc, page,
 					      start, LLONG_MAX - start);
@@ -712,10 +731,14 @@ static int afs_writepages_region(struct address_space *mapping,
 			continue;
 		}
 
-		if (PageWriteback(page)) {
+		if (PageWriteback(page) || PageFsCache(page)) {
 			unlock_page(page);
-			if (wbc->sync_mode != WB_SYNC_NONE)
+			if (wbc->sync_mode != WB_SYNC_NONE) {
 				wait_on_page_writeback(page);
+#ifdef CONFIG_AFS_FSCACHE
+				wait_on_page_fscache(page);
+#endif
+			}
 			put_page(page);
 			continue;
 		}
@@ -945,3 +968,32 @@ int afs_launder_page(struct page *page)
 	wait_on_page_fscache(page);
 	return ret;
 }
+
+/*
+ * Deal with the completion of writing the data to the cache.
+ */
+static void afs_write_to_cache_done(void *priv, ssize_t transferred_or_error)
+{
+	struct afs_vnode *vnode = priv;
+
+	if (IS_ERR_VALUE(transferred_or_error) &&
+	    transferred_or_error != -ENOBUFS) {
+		struct afs_vnode_cache_aux aux = {
+			.data_version = vnode->status.data_version,
+		};
+
+		fscache_invalidate(afs_vnode_cache(vnode), &aux,
+				   i_size_read(&vnode->vfs_inode), 0);
+	}
+}
+
+/*
+ * Save the write to the cache also.
+ */
+static void afs_write_to_cache(struct afs_vnode *vnode,
+			       loff_t start, size_t len, loff_t i_size)
+{
+	fscache_write_to_cache(afs_vnode_cache(vnode),
+			       vnode->vfs_inode.i_mapping, start, len, i_size,
+			       afs_write_to_cache_done, vnode);
+}


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

