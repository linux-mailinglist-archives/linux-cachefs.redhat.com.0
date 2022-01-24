Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD73498592
	for <lists+linux-cachefs@lfdr.de>; Mon, 24 Jan 2022 17:59:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643043540;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=I1gZ0QrJuvYa2I8rNaSbYITLK/tfwaDbZ0Q1JY+cxds=;
	b=Nytmz4uZKaH1basqkoM189boMM6vRVPtsOrphLb7j5leCFUjb6WzUlv+qz4dYcnWK/QljA
	QMEylYfSPkPexZt98R58wTLUmKTM8jscXrUuHuEP+4536J1pj5DSweH2hG8tUyc6jgE++l
	JI32WXeuFXM63i4/sRyqiLTmZkKn6fE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-CIzeEN2WPG6VXSut6AdygA-1; Mon, 24 Jan 2022 11:58:57 -0500
X-MC-Unique: CIzeEN2WPG6VXSut6AdygA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21D9E1B2C983;
	Mon, 24 Jan 2022 16:58:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1321C2C2C2;
	Mon, 24 Jan 2022 16:58:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB60E1809CB8;
	Mon, 24 Jan 2022 16:58:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OGwrKT025748 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 11:58:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 38FE37A413; Mon, 24 Jan 2022 16:58:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 915377A42E;
	Mon, 24 Jan 2022 16:58:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: smfrench@gmail.com, nspmangalore@gmail.com
Date: Mon, 24 Jan 2022 16:58:36 +0000
Message-ID: <164304351677.2349137.11658590526534563187.stgit@warthog.procyon.org.uk>
In-Reply-To: <164304348524.2349137.12280578401440758411.stgit@warthog.procyon.org.uk>
References: <164304348524.2349137.12280578401440758411.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
	linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH 2/2] cifs: Implement cache I/O by
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move cifs to using fscache DIO API instead of the old upstream I/O API as
that has been removed.  This is a stopgap solution as the intention is that
at sometime in the future, the cache will move to using larger blocks and
won't be able to store individual pages in order to deal with the potential
for data corruption due to the backing filesystem being able insert/remove
bridging blocks of zeros into its extent list[1].

cifs then reads and writes cache pages synchronously and one page at a time.

The preferred change would be to use the netfs lib, but the new I/O API can
be used directly.  It's just that as the cache now needs to track data for
itself, caching blocks may exceed page size...

This code is somewhat borrowed from my "fallback I/O" patchset[2].

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: linux-cifs@vger.kernel.org
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/YO17ZNOcq+9PajfQ@mit.edu [1]
Link: https://lore.kernel.org/r/202112100957.2oEDT20W-lkp@intel.com/ [2]
---

 fs/cachefiles/io.c    |   59 +++++++++++++++++++++++
 fs/cifs/file.c        |   55 +++++++++++++++++++--
 fs/cifs/fscache.c     |  126 ++++++++++++++++++++++++++++++++++++++++++-------
 fs/cifs/fscache.h     |   79 +++++++++++++++++++------------
 include/linux/netfs.h |    7 +++
 5 files changed, 273 insertions(+), 53 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 04eb52736990..753986ea1583 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -191,6 +191,64 @@ static int cachefiles_read(struct netfs_cache_resources *cres,
 	return ret;
 }
 
+/*
+ * Query the occupancy of the cache in a region, returning where the next chunk
+ * of data starts and how long it is.
+ */
+static int cachefiles_query_occupancy(struct netfs_cache_resources *cres,
+				      loff_t start, size_t len, size_t granularity,
+				      loff_t *_data_start, size_t *_data_len)
+{
+	struct cachefiles_object *object;
+	struct file *file;
+	loff_t off, off2;
+
+	*_data_start = -1;
+	*_data_len = 0;
+
+	if (!fscache_wait_for_operation(cres, FSCACHE_WANT_READ))
+		return -ENOBUFS;
+
+	object = cachefiles_cres_object(cres);
+	file = cachefiles_cres_file(cres);
+	granularity = max_t(size_t, object->volume->cache->bsize, granularity);
+
+	_enter("%pD,%li,%llx,%zx/%llx",
+	       file, file_inode(file)->i_ino, start, len,
+	       i_size_read(file_inode(file)));
+
+	off = cachefiles_inject_read_error();
+	if (off == 0)
+		off = vfs_llseek(file, start, SEEK_DATA);
+	if (off == -ENXIO)
+		return -ENODATA; /* Beyond EOF */
+	if (off < 0 && off >= (loff_t)-MAX_ERRNO)
+		return -ENOBUFS; /* Error. */
+	if (round_up(off, granularity) >= start + len)
+		return -ENODATA; /* No data in range */
+
+	off2 = cachefiles_inject_read_error();
+	if (off2 == 0)
+		off2 = vfs_llseek(file, off, SEEK_HOLE);
+	if (off2 == -ENXIO)
+		return -ENODATA; /* Beyond EOF */
+	if (off2 < 0 && off2 >= (loff_t)-MAX_ERRNO)
+		return -ENOBUFS; /* Error. */
+
+	/* Round away partial blocks */
+	off = round_up(off, granularity);
+	off2 = round_down(off2, granularity);
+	if (off2 <= off)
+		return -ENODATA;
+
+	*_data_start = off;
+	if (off2 > start + len)
+		*_data_len = len;
+	else
+		*_data_len = off2 - off;
+	return 0;
+}
+
 /*
  * Handle completion of a write to the cache.
  */
@@ -545,6 +603,7 @@ static const struct netfs_cache_ops cachefiles_netfs_cache_ops = {
 	.write			= cachefiles_write,
 	.prepare_read		= cachefiles_prepare_read,
 	.prepare_write		= cachefiles_prepare_write,
+	.query_occupancy	= cachefiles_query_occupancy,
 };
 
 /*
diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index 384a7323702f..492abe8f4213 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -4276,12 +4276,12 @@ cifs_readv_complete(struct work_struct *work)
 		} else
 			SetPageError(page);
 
-		unlock_page(page);
-
 		if (rdata->result == 0 ||
 		    (rdata->result == -EAGAIN && got_bytes))
 			cifs_readpage_to_fscache(rdata->mapping->host, page);
 
+		unlock_page(page);
+
 		got_bytes -= min_t(unsigned int, PAGE_SIZE, got_bytes);
 
 		put_page(page);
@@ -4396,7 +4396,11 @@ static void cifs_readahead(struct readahead_control *ractl)
 	struct cifs_sb_info *cifs_sb = CIFS_FILE_SB(ractl->file);
 	struct TCP_Server_Info *server;
 	pid_t pid;
-	unsigned int xid;
+	unsigned int xid, nr_pages, cache_nr_pages = 0;
+	pgoff_t next_cached = ULONG_MAX;
+	bool caching = fscache_cookie_enabled(cifs_inode_cookie(ractl->mapping->host)) &&
+		cifs_inode_cookie(ractl->mapping->host)->cache_priv;
+	bool check_cache = caching;
 
 	xid = get_xid();
 
@@ -4414,12 +4418,52 @@ static void cifs_readahead(struct readahead_control *ractl)
 	/*
 	 * Chop the readahead request up into rsize-sized read requests.
 	 */
-	while (readahead_count(ractl) - ractl->_batch_count) {
-		unsigned int i, nr_pages, got, rsize;
+	while ((nr_pages = readahead_count(ractl) - ractl->_batch_count)) {
+		unsigned int i, got, rsize;
 		struct page *page;
 		struct cifs_readdata *rdata;
 		struct cifs_credits credits_on_stack;
 		struct cifs_credits *credits = &credits_on_stack;
+		pgoff_t index = readahead_index(ractl) + ractl->_batch_count;
+
+		/*
+		 * Find out if we have anything cached in the range of
+		 * interest, and if so, where the next chunk of cached data is.
+		 */
+		if (caching) {
+			if (check_cache) {
+				rc = cifs_fscache_query_occupancy(
+					ractl->mapping->host, index, nr_pages,
+					&next_cached, &cache_nr_pages);
+				if (rc < 0)
+					caching = false;
+				check_cache = false;
+			}
+
+			if (index == next_cached) {
+				/*
+				 * TODO: Send a whole batch of pages to be read
+				 * by the cache.
+				 */
+				page = readahead_page(ractl);
+				BUG_ON(!page);
+				if (cifs_readpage_from_fscache(ractl->mapping->host,
+							       page) < 0) {
+					/*
+					 * TODO: Deal with cache read failure
+					 * here, but for the moment, delegate
+					 * that to readpage.
+					 */
+					caching = false;
+				}
+				unlock_page(page);
+				next_cached++;
+				cache_nr_pages--;
+				if (cache_nr_pages == 0)
+					check_cache = true;
+				continue;
+			}
+		}	
 
 		if (open_file->invalidHandle) {
 			rc = cifs_reopen_file(open_file, true);
@@ -4435,6 +4479,7 @@ static void cifs_readahead(struct readahead_control *ractl)
 		if (rc)
 			break;
 		nr_pages = min_t(size_t, rsize / PAGE_SIZE, readahead_count(ractl));
+		nr_pages = min_t(size_t, nr_pages, next_cached - index);
 
 		/*
 		 * Give up immediately if rsize is too small to read an entire
diff --git a/fs/cifs/fscache.c b/fs/cifs/fscache.c
index efaac4d5ff55..f98cfcc0d397 100644
--- a/fs/cifs/fscache.c
+++ b/fs/cifs/fscache.c
@@ -134,37 +134,127 @@ void cifs_fscache_release_inode_cookie(struct inode *inode)
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
 /*
- * Retrieve a page from FS-Cache
+ * Fallback page reading interface.
  */
-int __cifs_readpage_from_fscache(struct inode *inode, struct page *page)
+static int fscache_fallback_read_page(struct inode *inode, struct page *page)
 {
-	cifs_dbg(FYI, "%s: (fsc:%p, p:%p, i:0x%p\n",
-		 __func__, CIFS_I(inode)->fscache, page, inode);
-	return -ENOBUFS; // Needs conversion to using netfslib
+	struct netfs_cache_resources cres;
+	struct fscache_cookie *cookie = cifs_inode_cookie(inode);
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
 }
 
 /*
- * Retrieve a set of pages from FS-Cache
+ * Fallback page writing interface.
  */
-int __cifs_readpages_from_fscache(struct inode *inode,
-				struct address_space *mapping,
-				struct list_head *pages,
-				unsigned *nr_pages)
+static int fscache_fallback_write_page(struct inode *inode, struct page *page,
+				       bool no_space_allocated_yet)
 {
-	cifs_dbg(FYI, "%s: (0x%p/%u/0x%p)\n",
-		 __func__, CIFS_I(inode)->fscache, *nr_pages, inode);
-	return -ENOBUFS; // Needs conversion to using netfslib
+	struct netfs_cache_resources cres;
+	struct fscache_cookie *cookie = cifs_inode_cookie(inode);
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
 }
 
-void __cifs_readpage_to_fscache(struct inode *inode, struct page *page)
+/*
+ * Retrieve a page from FS-Cache
+ */
+int __cifs_readpage_from_fscache(struct inode *inode, struct page *page)
 {
-	struct cifsInodeInfo *cifsi = CIFS_I(inode);
+	int ret;
 
-	WARN_ON(!cifsi->fscache);
+	cifs_dbg(FYI, "%s: (fsc:%p, p:%p, i:0x%p\n",
+		 __func__, cifs_inode_cookie(inode), page, inode);
 
+	ret = fscache_fallback_read_page(inode, page);
+	if (ret < 0)
+		return ret;
+
+	/* Read completed synchronously */
+	SetPageUptodate(page);
+	return 0;
+}
+
+void __cifs_readpage_to_fscache(struct inode *inode, struct page *page)
+{
 	cifs_dbg(FYI, "%s: (fsc: %p, p: %p, i: %p)\n",
-		 __func__, cifsi->fscache, page, inode);
+		 __func__, cifs_inode_cookie(inode), page, inode);
+
+	fscache_fallback_write_page(inode, page, true);
+}
+
+/*
+ * Query the cache occupancy.
+ */
+int __cifs_fscache_query_occupancy(struct inode *inode,
+				   pgoff_t first, unsigned nr_pages,
+				   pgoff_t *_data_first,
+				   unsigned int *_data_nr_pages)
+{
+	struct netfs_cache_resources cres;
+	struct fscache_cookie *cookie = cifs_inode_cookie(inode);
+	loff_t start, data_start;
+	size_t len, data_len;
+	int ret;
 
-	// Needs conversion to using netfslib
+	ret = fscache_begin_read_operation(&cres, cookie);
+	if (ret < 0)
+		return ret;
+
+	start = first * PAGE_SIZE;
+	len = nr_pages * PAGE_SIZE;
+	ret = cres.ops->query_occupancy(&cres, start, len, PAGE_SIZE,
+					&data_start, &data_len);
+	if (ret == 0) {
+		*_data_first = data_start / PAGE_SIZE;
+		*_data_nr_pages = len / PAGE_SIZE;
+	}
+
+	fscache_end_operation(&cres);
+	return ret;
 }
diff --git a/fs/cifs/fscache.h b/fs/cifs/fscache.h
index c6ca49ac33d4..3896c95fe9ac 100644
--- a/fs/cifs/fscache.h
+++ b/fs/cifs/fscache.h
@@ -9,6 +9,7 @@
 #ifndef _CIFS_FSCACHE_H
 #define _CIFS_FSCACHE_H
 
+#include <linux/swap.h>
 #include <linux/fscache.h>
 
 #include "cifsglob.h"
@@ -58,14 +59,6 @@ void cifs_fscache_fill_coherency(struct inode *inode,
 }
 
 
-extern int cifs_fscache_release_page(struct page *page, gfp_t gfp);
-extern int __cifs_readpage_from_fscache(struct inode *, struct page *);
-extern int __cifs_readpages_from_fscache(struct inode *,
-					 struct address_space *,
-					 struct list_head *,
-					 unsigned *);
-extern void __cifs_readpage_to_fscache(struct inode *, struct page *);
-
 static inline struct fscache_cookie *cifs_inode_cookie(struct inode *inode)
 {
 	return CIFS_I(inode)->fscache;
@@ -80,33 +73,52 @@ static inline void cifs_invalidate_cache(struct inode *inode, unsigned int flags
 			   i_size_read(inode), flags);
 }
 
-static inline int cifs_readpage_from_fscache(struct inode *inode,
-					     struct page *page)
-{
-	if (CIFS_I(inode)->fscache)
-		return __cifs_readpage_from_fscache(inode, page);
+extern int __cifs_fscache_query_occupancy(struct inode *inode,
+					  pgoff_t first, unsigned nr_pages,
+					  pgoff_t *_data_first,
+					  unsigned int *_data_nr_pages);
 
-	return -ENOBUFS;
+static inline int cifs_fscache_query_occupancy(struct inode *inode,
+					       pgoff_t first, unsigned nr_pages,
+					       pgoff_t *_data_first,
+					       unsigned int *_data_nr_pages)
+{
+	if (!cifs_inode_cookie(inode))
+		return -ENOBUFS;
+	return __cifs_fscache_query_occupancy(inode, first, nr_pages,
+					      _data_first, _data_nr_pages);
 }
 
-static inline int cifs_readpages_from_fscache(struct inode *inode,
-					      struct address_space *mapping,
-					      struct list_head *pages,
-					      unsigned *nr_pages)
+extern int __cifs_readpage_from_fscache(struct inode *, struct page *);
+extern void __cifs_readpage_to_fscache(struct inode *, struct page *);
+
+
+static inline int cifs_readpage_from_fscache(struct inode *inode,
+					     struct page *page)
 {
-	if (CIFS_I(inode)->fscache)
-		return __cifs_readpages_from_fscache(inode, mapping, pages,
-						     nr_pages);
+	if (cifs_inode_cookie(inode))
+		return __cifs_readpage_from_fscache(inode, page);
 	return -ENOBUFS;
 }
 
 static inline void cifs_readpage_to_fscache(struct inode *inode,
 					    struct page *page)
 {
-	if (PageFsCache(page))
+	if (cifs_inode_cookie(inode))
 		__cifs_readpage_to_fscache(inode, page);
 }
 
+static inline int cifs_fscache_release_page(struct page *page, gfp_t gfp)
+{
+	if (PageFsCache(page)) {
+		if (current_is_kswapd() || !(gfp & __GFP_FS))
+			return false;
+		wait_on_page_fscache(page);
+		fscache_note_page_release(cifs_inode_cookie(page->mapping->host));
+	}
+	return true;
+}
+
 #else /* CONFIG_CIFS_FSCACHE */
 static inline
 void cifs_fscache_fill_coherency(struct inode *inode,
@@ -123,22 +135,29 @@ static inline void cifs_fscache_unuse_inode_cookie(struct inode *inode, bool upd
 static inline struct fscache_cookie *cifs_inode_cookie(struct inode *inode) { return NULL; }
 static inline void cifs_invalidate_cache(struct inode *inode, unsigned int flags) {}
 
-static inline int
-cifs_readpage_from_fscache(struct inode *inode, struct page *page)
+static inline int cifs_fscache_query_occupancy(struct inode *inode,
+					       pgoff_t first, unsigned nr_pages,
+					       pgoff_t *_data_first,
+					       unsigned int *_data_nr_pages)
 {
+	_data_first = ULONG_MAX;
+	_data_nr_pages = 0;
 	return -ENOBUFS;
 }
 
-static inline int cifs_readpages_from_fscache(struct inode *inode,
-					      struct address_space *mapping,
-					      struct list_head *pages,
-					      unsigned *nr_pages)
+static inline int
+cifs_readpage_from_fscache(struct inode *inode, struct page *page)
 {
 	return -ENOBUFS;
 }
 
-static inline void cifs_readpage_to_fscache(struct inode *inode,
-			struct page *page) {}
+static inline
+void cifs_readpage_to_fscache(struct inode *inode, struct page *page) {}
+
+static inline int nfs_fscache_release_page(struct page *page, gfp_t gfp)
+{
+	return true; /* May release page */
+}
 
 #endif /* CONFIG_CIFS_FSCACHE */
 
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index b46c39d98bbd..614f22213e21 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -244,6 +244,13 @@ struct netfs_cache_ops {
 	int (*prepare_write)(struct netfs_cache_resources *cres,
 			     loff_t *_start, size_t *_len, loff_t i_size,
 			     bool no_space_allocated_yet);
+
+	/* Query the occupancy of the cache in a region, returning where the
+	 * next chunk of data starts and how long it is.
+	 */
+	int (*query_occupancy)(struct netfs_cache_resources *cres,
+			       loff_t start, size_t len, size_t granularity,
+			       loff_t *_data_start, size_t *_data_len);
 };
 
 struct readahead_control;


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

