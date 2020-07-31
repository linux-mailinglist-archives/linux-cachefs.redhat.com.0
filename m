Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0DACD234678
	for <lists+linux-cachefs@lfdr.de>; Fri, 31 Jul 2020 15:04:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-KuVLr9ZoNeG4ddr5tSOY7w-1; Fri, 31 Jul 2020 09:04:42 -0400
X-MC-Unique: KuVLr9ZoNeG4ddr5tSOY7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 586EDE91C;
	Fri, 31 Jul 2020 13:04:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49A106932A;
	Fri, 31 Jul 2020 13:04:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 345211809561;
	Fri, 31 Jul 2020 13:04:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06VD4bx7009979 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 31 Jul 2020 09:04:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A608B110F74A; Fri, 31 Jul 2020 13:04:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BBBA10144F3
	for <linux-cachefs@redhat.com>; Fri, 31 Jul 2020 13:04:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 956C91859164
	for <linux-cachefs@redhat.com>; Fri, 31 Jul 2020 13:04:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-285-7eLBOANuNhacFmAojQ36lQ-1;
	Fri, 31 Jul 2020 09:04:30 -0400
X-MC-Unique: 7eLBOANuNhacFmAojQ36lQ-1
Received: from tleilax.com (68-20-15-154.lightspeed.rlghnc.sbcglobal.net
	[68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 962F522B49;
	Fri, 31 Jul 2020 13:04:28 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 31 Jul 2020 09:04:20 -0400
Message-Id: <20200731130421.127022-11-jlayton@kernel.org>
In-Reply-To: <20200731130421.127022-1-jlayton@kernel.org>
References: <20200731130421.127022-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06VD4bx7009979
X-loop: linux-cachefs@redhat.com
Cc: idryomov@gmail.com, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v2 10/11] ceph: add fscache writeback
	support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When updating the backing store from the pagecache (a'la writepage or
writepages), write to the cache first. This allows us to keep caching
files even when they are open for write. If the OSD write fails,
invalidate the cache.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 122 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 116 insertions(+), 6 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 8905fe4a0930..a21aec8ac0f1 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -435,6 +435,98 @@ static int ceph_readpages(struct file *file, struct address_space *mapping,
 	return ret;
 }
 
+#ifdef CONFIG_CEPH_FSCACHE
+const struct fscache_io_request_ops ceph_write_fsreq_ops = {
+	.get		= ceph_fsreq_get,
+	.put		= ceph_fsreq_put,
+};
+
+/*
+ * Clear the PG_fscache flag from a sequence of pages and wake up anyone who's
+ * waiting.  The last page is included in the sequence. Poached from afs_clear_fscache_bits.
+ */
+static void ceph_clear_fscache_bits(struct address_space *mapping,
+				   pgoff_t start, pgoff_t last)
+{
+	struct page *page;
+
+	XA_STATE(xas, &mapping->i_pages, start);
+
+	rcu_read_lock();
+	xas_for_each(&xas, page, last) {
+		unlock_page_fscache(page);
+	}
+	rcu_read_unlock();
+}
+
+static void ceph_write_to_cache_done(struct fscache_io_request *fsreq)
+{
+	pgoff_t start = fsreq->pos >> PAGE_SHIFT;
+	pgoff_t last = start + fsreq->nr_pages - 1;
+
+	ceph_clear_fscache_bits(fsreq->mapping, start, last);
+	if (fsreq->error && fsreq->error != -ENOBUFS)
+		ceph_fscache_invalidate(fsreq->mapping->host, 0);
+}
+
+static void ceph_write_to_cache(struct inode *inode, u64 off, u64 len)
+{
+	struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
+	struct iov_iter iter;
+	struct ceph_fscache_req *req;
+	struct fscache_cookie *cookie = ceph_inode(inode)->fscache;
+	pgoff_t start = off >> PAGE_SHIFT;
+	struct fscache_request_shape shape = {
+		.proposed_start		= start,
+		.proposed_nr_pages	= calc_pages_for(off, len),
+		.max_io_pages		= fsc->mount_options->wsize >> PAGE_SHIFT,
+		.i_size			= i_size_read(inode),
+		.for_write		= true,
+	};
+	pgoff_t last = start + shape.proposed_nr_pages - 1;
+
+	/* Don't do anything if cache is disabled */
+	if (!fscache_cookie_enabled(cookie))
+		goto abandon;
+
+	fscache_shape_request(cookie, &shape);
+	if (!(shape.to_be_done & FSCACHE_WRITE_TO_CACHE) ||
+	    shape.actual_nr_pages == 0 ||
+	    shape.actual_start != shape.proposed_start)
+		goto abandon;
+
+	if (shape.actual_nr_pages < shape.proposed_nr_pages) {
+		ceph_clear_fscache_bits(inode->i_mapping, start + shape.actual_nr_pages,
+					start + shape.proposed_nr_pages - 1);
+		last = shape.proposed_start + shape.actual_nr_pages - 1;
+		len = (u64)(last + 1 - start) << PAGE_SHIFT;
+	}
+
+	req = ceph_fsreq_alloc();
+	if (!req)
+		goto abandon;
+
+	fscache_init_io_request(&req->fscache_req, cookie, &ceph_write_fsreq_ops);
+	req->fscache_req.pos = round_down(off, shape.dio_block_size);
+	req->fscache_req.len = round_up(len, shape.dio_block_size);
+	req->fscache_req.nr_pages = shape.actual_nr_pages;
+	req->fscache_req.mapping = inode->i_mapping;
+	req->fscache_req.io_done = ceph_write_to_cache_done;
+
+	iov_iter_mapping(&iter, WRITE, inode->i_mapping, req->fscache_req.pos,
+			 req->fscache_req.len);
+	fscache_write(&req->fscache_req, &iter);
+	ceph_fsreq_put(&req->fscache_req);
+	return;
+abandon:
+	ceph_clear_fscache_bits(inode->i_mapping, start, last);
+}
+#else
+static inline void ceph_write_to_cache(struct inode *inode, u64 off, u64 len)
+{
+}
+#endif /* CONFIG_CEPH_FSCACHE */
+
 struct ceph_writeback_ctl
 {
 	loff_t i_size;
@@ -588,16 +680,17 @@ static int writepage_nounlock(struct page *page, struct writeback_control *wbc)
 	    CONGESTION_ON_THRESH(fsc->mount_options->congestion_kb))
 		set_bdi_congested(inode_to_bdi(inode), BLK_RW_ASYNC);
 
-	set_page_writeback(page);
 	req = ceph_osdc_new_request(osdc, &ci->i_layout, ceph_vino(inode), page_off, &len, 0, 1,
 				    CEPH_OSD_OP_WRITE, CEPH_OSD_FLAG_WRITE, snapc,
 				    ceph_wbc.truncate_seq, ceph_wbc.truncate_size,
 				    true);
-	if (IS_ERR(req)) {
-		redirty_page_for_writepage(wbc, page);
-		end_page_writeback(page);
+	if (IS_ERR(req))
 		return PTR_ERR(req);
-	}
+
+	set_page_writeback(page);
+	if (TestSetPageFsCache(page))
+		BUG();
+	ceph_write_to_cache(inode, page_off, len);
 
 	/* it may be a short write due to an object boundary */
 	WARN_ON_ONCE(len > PAGE_SIZE);
@@ -656,6 +749,9 @@ static int ceph_writepage(struct page *page, struct writeback_control *wbc)
 	struct inode *inode = page->mapping->host;
 	BUG_ON(!inode);
 	ihold(inode);
+
+	ceph_wait_on_page_fscache(page);
+
 	err = writepage_nounlock(page, wbc);
 	if (err == -ERESTARTSYS) {
 		/* direct memory reclaimer was killed by SIGKILL. return 0
@@ -901,7 +997,7 @@ static int ceph_writepages_start(struct address_space *mapping,
 				unlock_page(page);
 				break;
 			}
-			if (PageWriteback(page)) {
+			if (PageWriteback(page) || PageFsCache(page)) {
 				if (wbc->sync_mode == WB_SYNC_NONE) {
 					dout("%p under writeback\n", page);
 					unlock_page(page);
@@ -909,6 +1005,7 @@ static int ceph_writepages_start(struct address_space *mapping,
 				}
 				dout("waiting on writeback %p\n", page);
 				wait_on_page_writeback(page);
+				ceph_wait_on_page_fscache(page);
 			}
 
 			if (!clear_page_dirty_for_io(page)) {
@@ -1041,9 +1138,19 @@ static int ceph_writepages_start(struct address_space *mapping,
 		op_idx = 0;
 		for (i = 0; i < locked_pages; i++) {
 			u64 cur_offset = page_offset(pages[i]);
+			/*
+			 * Discontinuity in page range? Ceph can handle that by just passing
+			 * multiple extents in the write op.
+			 */
 			if (offset + len != cur_offset) {
+				/* If it's full, stop here */
 				if (op_idx + 1 == req->r_num_ops)
 					break;
+
+				/* Kick off an fscache write with what we have so far. */
+				ceph_write_to_cache(inode, offset, len);
+
+				/* Start a new extent */
 				osd_req_op_extent_dup_last(req, op_idx,
 							   cur_offset - offset);
 				dout("writepages got pages at %llu~%llu\n",
@@ -1060,8 +1167,11 @@ static int ceph_writepages_start(struct address_space *mapping,
 			}
 
 			set_page_writeback(pages[i]);
+			if (TestSetPageFsCache(pages[i]))
+				BUG();
 			len += PAGE_SIZE;
 		}
+		ceph_write_to_cache(inode, offset, len);
 
 		if (ceph_wbc.size_stable) {
 			len = min(len, ceph_wbc.i_size - offset);
-- 
2.26.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

