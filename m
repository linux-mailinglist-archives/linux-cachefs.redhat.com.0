Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3438A234672
	for <lists+linux-cachefs@lfdr.de>; Fri, 31 Jul 2020 15:04:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-HVSNG6o6M-imzy2SRKYy2A-1; Fri, 31 Jul 2020 09:04:39 -0400
X-MC-Unique: HVSNG6o6M-imzy2SRKYy2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02AEAE91B;
	Fri, 31 Jul 2020 13:04:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9D04100239B;
	Fri, 31 Jul 2020 13:04:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C76CD95497;
	Fri, 31 Jul 2020 13:04:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06VD4WSF009921 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 31 Jul 2020 09:04:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3D9E72166B27; Fri, 31 Jul 2020 13:04:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A8A42166BA4
	for <linux-cachefs@redhat.com>; Fri, 31 Jul 2020 13:04:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62EA6805C20
	for <linux-cachefs@redhat.com>; Fri, 31 Jul 2020 13:04:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-379-a0uLJwnDOyCSrYHqF2JjxA-1;
	Fri, 31 Jul 2020 09:04:28 -0400
X-MC-Unique: a0uLJwnDOyCSrYHqF2JjxA-1
Received: from tleilax.com (68-20-15-154.lightspeed.rlghnc.sbcglobal.net
	[68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7045122B42;
	Fri, 31 Jul 2020 13:04:27 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 31 Jul 2020 09:04:18 -0400
Message-Id: <20200731130421.127022-9-jlayton@kernel.org>
In-Reply-To: <20200731130421.127022-1-jlayton@kernel.org>
References: <20200731130421.127022-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06VD4WSF009921
X-loop: linux-cachefs@redhat.com
Cc: idryomov@gmail.com, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v2 08/11] ceph: plug write_begin into
	read helper
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Plug write_begin into the read helper routine. This requires adding a
new is_req_valid op that we can use to vet whether there is an
incompatible snap context that needs to be flushed before we can fill
the page.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 253 ++++++++++++++++++++++++++-----------------------
 1 file changed, 132 insertions(+), 121 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 75cdd35f1d2e..cee497c108bb 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -185,6 +185,7 @@ static int ceph_releasepage(struct page *page, gfp_t g)
 
 struct ceph_fscache_req {
 	struct fscache_io_request	fscache_req;
+	struct ceph_snap_context	*snapc;
 	refcount_t			ref;
 };
 
@@ -376,77 +377,6 @@ static int ceph_readpage(struct file *filp, struct page *page)
 	return err;
 }
 
-/* read a single page, without unlocking it. */
-static int ceph_do_readpage(struct file *filp, struct page *page)
-{
-	struct inode *inode = file_inode(filp);
-	struct ceph_inode_info *ci = ceph_inode(inode);
-	struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
-	struct ceph_osd_client *osdc = &fsc->client->osdc;
-	struct ceph_osd_request *req;
-	struct ceph_vino vino = ceph_vino(inode);
-	int err = 0;
-	u64 off = page_offset(page);
-	u64 len = PAGE_SIZE;
-
-	if (off >= i_size_read(inode)) {
-		zero_user_segment(page, 0, PAGE_SIZE);
-		SetPageUptodate(page);
-		return 0;
-	}
-
-	if (ci->i_inline_version != CEPH_INLINE_NONE) {
-		/*
-		 * Uptodate inline data should have been added
-		 * into page cache while getting Fcr caps.
-		 */
-		if (off == 0)
-			return -EINVAL;
-		zero_user_segment(page, 0, PAGE_SIZE);
-		SetPageUptodate(page);
-		return 0;
-	}
-
-	dout("readpage ino %llx.%llx file %p off %llu len %llu page %p index %lu\n",
-	     vino.ino, vino.snap, filp, off, len, page, page->index);
-	req = ceph_osdc_new_request(osdc, &ci->i_layout, vino, off, &len, 0, 1,
-				    CEPH_OSD_OP_READ, CEPH_OSD_FLAG_READ, NULL,
-				    ci->i_truncate_seq, ci->i_truncate_size,
-				    false);
-	if (IS_ERR(req))
-		return PTR_ERR(req);
-
-	osd_req_op_extent_osd_data_pages(req, 0, &page, len, 0, false, false);
-
-	err = ceph_osdc_start_request(osdc, req, false);
-	if (!err)
-		err = ceph_osdc_wait_request(osdc, req);
-
-	ceph_update_read_latency(&fsc->mdsc->metric, req->r_start_latency,
-				 req->r_end_latency, err);
-
-	ceph_osdc_put_request(req);
-	dout("readpage result %d\n", err);
-
-	if (err == -ENOENT)
-		err = 0;
-	if (err < 0) {
-		SetPageError(page);
-		if (err == -EBLACKLISTED)
-			fsc->blacklisted = true;
-		goto out;
-	}
-	if (err < PAGE_SIZE)
-		/* zero fill remainder of page */
-		zero_user_segment(page, err, PAGE_SIZE);
-	else
-		flush_dcache_page(page);
-
-	SetPageUptodate(page);
-out:
-	return err < 0 ? err : 0;
-}
-
 /*
  * Finish an async read(ahead) op.
  */
@@ -1472,6 +1402,30 @@ ceph_find_incompatible(struct inode *inode, struct page *page)
 	return NULL;
 }
 
+static int ceph_fsreq_is_req_valid(struct fscache_io_request *fsreq)
+{
+	struct ceph_snap_context *snapc;
+	struct ceph_fscache_req *req = container_of(fsreq, struct ceph_fscache_req, fscache_req);
+
+	snapc = ceph_find_incompatible(fsreq->mapping->host, fsreq->no_unlock_page);
+	if (snapc) {
+		if (IS_ERR(snapc))
+			return PTR_ERR(snapc);
+		req->snapc = snapc;
+		return -EAGAIN;
+	}
+	return 0;
+}
+
+const struct fscache_io_request_ops ceph_read_for_write_fsreq_ops = {
+	.issue_op	= ceph_fsreq_issue_op,
+	.reshape	= ceph_fsreq_reshape,
+	.is_req_valid	= ceph_fsreq_is_req_valid,
+	.done		= ceph_fsreq_done,
+	.get		= ceph_fsreq_get,
+	.put		= ceph_fsreq_put,
+};
+
 /*
  * We are only allowed to write into/dirty the page if the page is
  * clean, or already dirty within the same snap context.
@@ -1482,76 +1436,133 @@ static int ceph_write_begin(struct file *file, struct address_space *mapping,
 {
 	struct inode *inode = file_inode(file);
 	struct ceph_inode_info *ci = ceph_inode(inode);
-	struct ceph_snap_context *snapc;
+	struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
+	struct fscache_cookie *cookie = ceph_fscache_cookie(ci);
 	struct page *page = NULL;
 	pgoff_t index = pos >> PAGE_SHIFT;
-	loff_t page_off = pos & PAGE_MASK;
 	int pos_in_page = pos & ~PAGE_MASK;
-	int end_in_page = pos_in_page + len;
-	loff_t i_size;
 	int r;
-refind:
-	/* get a page */
-	page = grab_cache_page_write_begin(mapping, index, 0);
-	if (!page)
-		return -ENOMEM;
 
-	dout("write_begin file %p inode %p page %p %d~%d\n", file,
-	     inode, page, (int)pos, (int)len);
+	if (ci->i_inline_version != CEPH_INLINE_NONE) {
+		/*
+		 * In principle, we should never get here, as the inode should have been uninlined
+		 * before we're allowed to write to the page (in write_iter or page_mkwrite).
+		 */
+		WARN_ONCE(1, "ceph: write_begin called on still-inlined inode!\n");
 
-	for (;;) {
-		snapc = ceph_find_incompatible(inode, page);
-		if (snapc) {
-			if (IS_ERR(snapc)) {
-				r = PTR_ERR(snapc);
-				break;
-			}
-			unlock_page(page);
-			ceph_queue_writeback(inode);
-			r = wait_event_killable(ci->i_cap_wq,
-						context_is_writeable_or_written(inode, snapc));
-			ceph_put_snap_context(snapc);
-			put_page(page);
-			goto refind;
+		/*
+		 * Uptodate inline data should have been added
+		 * into page cache while getting Fcr caps.
+		 */
+		if (index == 0) {
+			r = -EINVAL;
+			goto out;
 		}
 
-		if (PageUptodate(page)) {
-			dout(" page %p already uptodate\n", page);
-			break;
+		page = grab_cache_page_write_begin(mapping, index, 0);
+		if (!page)
+			return -ENOMEM;
+
+		zero_user_segment(page, 0, PAGE_SIZE);
+		SetPageUptodate(page);
+		r = 0;
+		goto out;
+	}
+
+	do {
+		struct ceph_fscache_req *req;
+		struct ceph_snap_context *snapc = NULL;
+
+		page = pagecache_get_page(mapping, index, FGP_WRITE, 0);
+		if (page) {
+			r = 0;
+			if (PageUptodate(page)) {
+				lock_page(page);
+				if (PageUptodate(page))
+					goto out;
+				unlock_page(page);
+			}
 		}
 
-		/* full page? */
-		if (pos_in_page == 0 && len == PAGE_SIZE)
-			break;
+		/*
+		 * In some cases we don't need to read at all:
+		 * - full page write
+		 * - write that lies completely beyond EOF
+		 * - write that covers the the page from start to EOF or beyond it
+		 */
+		if ((pos_in_page == 0 && len == PAGE_SIZE) ||
+		    (pos >= i_size_read(inode)) ||
+		    (pos_in_page == 0 && (pos + len) >= i_size_read(inode))) {
+			if (!page) {
+				page = grab_cache_page_write_begin(mapping, index, 0);
+				if (!page) {
+					r = -ENOMEM;
+					break;
+				}
+			} else {
+				lock_page(page);
+			}
+
+			snapc = ceph_find_incompatible(inode, page);
+			if (!snapc) {
+				zero_user_segments(page, 0, pos_in_page,
+							 pos_in_page + len, PAGE_SIZE);
+				r = 0;
+				goto out;
+			}
+
+			unlock_page(page);
+
+			if (IS_ERR(snapc)) {
+				r = PTR_ERR(snapc);
+				goto out;
+			}
+			goto flush_incompat;
+		}
 
-		/* past end of file? */
-		i_size = i_size_read(inode);
-		if (page_off >= i_size ||
-		    (pos_in_page == 0 && (pos+len) >= i_size &&
-		     end_in_page - pos_in_page != PAGE_SIZE)) {
-			dout(" zeroing %p 0 - %d and %d - %d\n",
-			     page, pos_in_page, end_in_page, (int)PAGE_SIZE);
-			zero_user_segments(page,
-					   0, pos_in_page,
-					   end_in_page, PAGE_SIZE);
+		req = ceph_fsreq_alloc();
+		if (!req) {
+			unlock_page(page);
+			r = -ENOMEM;
 			break;
 		}
 
-		/* we need to read it. */
-		r = ceph_do_readpage(file, page);
-		if (r) {
-			if (r == -EINPROGRESS)
-				continue;
+		/*
+		 * Do the read. If we find out that we need to wait on writeback, then kick that
+		 * off, wait for it and then resubmit the read.
+		 */
+		fscache_init_io_request(&req->fscache_req, cookie, &ceph_read_for_write_fsreq_ops);
+		req->fscache_req.mapping = inode->i_mapping;
+
+		r = fscache_read_helper_for_write(&req->fscache_req, &page, index,
+						  fsc->mount_options->rsize >> PAGE_SHIFT, 0);
+		if (r != -EAGAIN) {
+			if (r == 0) {
+				r = wait_on_bit(&req->fscache_req.flags,
+						FSCACHE_IO_READ_IN_PROGRESS, TASK_KILLABLE);
+				ceph_wait_on_page_fscache(page);
+			}
+			ceph_fsreq_put(&req->fscache_req);
 			break;
 		}
-	}
 
+		BUG_ON(!req->snapc);
+		snapc = ceph_get_snap_context(req->snapc);
+		ceph_fsreq_put(&req->fscache_req);
+flush_incompat:
+		put_page(page);
+		page = NULL;
+		ceph_queue_writeback(inode);
+		r = wait_event_killable(ci->i_cap_wq,
+					context_is_writeable_or_written(inode, snapc));
+		ceph_put_snap_context(snapc);
+	} while (r == 0);
+out:
 	if (r < 0) {
-		if (page) {
-			unlock_page(page);
+		if (page)
 			put_page(page);
-		}
 	} else {
+		WARN_ON_ONCE(!PageLocked(page));
 		*pagep = page;
 	}
 	return r;
-- 
2.26.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

