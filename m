Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 70C792BAED8
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 16:30:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-8Xi9Q274MKuznG76QxXtYg-1; Fri, 20 Nov 2020 10:30:47 -0500
X-MC-Unique: 8Xi9Q274MKuznG76QxXtYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F00AC10151E7;
	Fri, 20 Nov 2020 15:30:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEABD5C1D5;
	Fri, 20 Nov 2020 15:30:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C85275002E;
	Fri, 20 Nov 2020 15:30:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKFUHOC017647 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 10:30:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ADD242026D76; Fri, 20 Nov 2020 15:30:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8DEC2026D5D
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 15:30:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DC1B800B3B
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 15:30:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-258-JJdUTxAvPyaXJCO8TcwMMg-1;
	Fri, 20 Nov 2020 10:30:13 -0500
X-MC-Unique: JJdUTxAvPyaXJCO8TcwMMg-1
Received: from tleilax.com (68-20-15-154.lightspeed.rlghnc.sbcglobal.net
	[68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 064B5223FD;
	Fri, 20 Nov 2020 15:30:10 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 20 Nov 2020 10:30:05 -0500
Message-Id: <20201120153006.304296-5-jlayton@kernel.org>
In-Reply-To: <20201120153006.304296-1-jlayton@kernel.org>
References: <20201120153006.304296-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AKFUHOC017647
X-loop: linux-cachefs@redhat.com
Cc: idryomov@redhat.com, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 4/5] ceph: convert ceph_readpages to
	ceph_readahead
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert ceph_readpages to ceph_readahead and make it use
netfs_readahead. With this we can rip out a lot of the old
readpage/readpages infrastructure.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 230 ++++++++-----------------------------------------
 1 file changed, 34 insertions(+), 196 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index dfd9fa05e0e1..ea17ee7d7218 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -342,215 +342,53 @@ static int ceph_readpage(struct file *filp, struct page *page)
 	return netfs_readpage(filp, page, &ceph_readpage_netfs_ops, NULL);
 }
 
-/*
- * Finish an async read(ahead) op.
- */
-static void finish_read(struct ceph_osd_request *req)
-{
-	struct inode *inode = req->r_inode;
-	struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
-	struct ceph_osd_data *osd_data;
-	int rc = req->r_result <= 0 ? req->r_result : 0;
-	int bytes = req->r_result >= 0 ? req->r_result : 0;
-	int num_pages;
-	int i;
-
-	dout("finish_read %p req %p rc %d bytes %d\n", inode, req, rc, bytes);
-	if (rc == -EBLOCKLISTED)
-		ceph_inode_to_client(inode)->blocklisted = true;
-
-	/* unlock all pages, zeroing any data we didn't read */
-	osd_data = osd_req_op_extent_osd_data(req, 0);
-	BUG_ON(osd_data->type != CEPH_OSD_DATA_TYPE_PAGES);
-	num_pages = calc_pages_for((u64)osd_data->alignment,
-					(u64)osd_data->length);
-	for (i = 0; i < num_pages; i++) {
-		struct page *page = osd_data->pages[i];
-
-		if (rc < 0 && rc != -ENOENT)
-			goto unlock;
-		if (bytes < (int)PAGE_SIZE) {
-			/* zero (remainder of) page */
-			int s = bytes < 0 ? 0 : bytes;
-			zero_user_segment(page, s, PAGE_SIZE);
-		}
- 		dout("finish_read %p uptodate %p idx %lu\n", inode, page,
-		     page->index);
-		flush_dcache_page(page);
-		SetPageUptodate(page);
-unlock:
-		unlock_page(page);
-		put_page(page);
-		bytes -= PAGE_SIZE;
-	}
-
-	ceph_update_read_latency(&fsc->mdsc->metric, req->r_start_latency,
-				 req->r_end_latency, rc);
-
-	kfree(osd_data->pages);
-}
-
-/*
- * start an async read(ahead) operation.  return nr_pages we submitted
- * a read for on success, or negative error code.
- */
-static int start_read(struct inode *inode, struct ceph_rw_context *rw_ctx,
-		      struct list_head *page_list, int max)
+static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
 {
-	struct ceph_osd_client *osdc =
-		&ceph_inode_to_client(inode)->client->osdc;
+	struct inode *inode = mapping->host;
 	struct ceph_inode_info *ci = ceph_inode(inode);
-	struct page *page = lru_to_page(page_list);
-	struct ceph_vino vino;
-	struct ceph_osd_request *req;
-	u64 off;
-	u64 len;
-	int i;
-	struct page **pages;
-	pgoff_t next_index;
-	int nr_pages = 0;
-	int got = 0;
-	int ret = 0;
+	int got = (int)(uintptr_t)priv;
 
-	if (!rw_ctx) {
-		/* caller of readpages does not hold buffer and read caps
-		 * (fadvise, madvise and readahead cases) */
-		int want = CEPH_CAP_FILE_CACHE;
-		ret = ceph_try_get_caps(inode, CEPH_CAP_FILE_RD, want,
-					true, &got);
-		if (ret < 0) {
-			dout("start_read %p, error getting cap\n", inode);
-		} else if (!(got & want)) {
-			dout("start_read %p, no cache cap\n", inode);
-			ret = 0;
-		}
-		if (ret <= 0) {
-			if (got)
-				ceph_put_cap_refs(ci, got);
-			while (!list_empty(page_list)) {
-				page = lru_to_page(page_list);
-				list_del(&page->lru);
-				put_page(page);
-			}
-			return ret;
-		}
-	}
-
-	off = (u64) page_offset(page);
-
-	/* count pages */
-	next_index = page->index;
-	list_for_each_entry_reverse(page, page_list, lru) {
-		if (page->index != next_index)
-			break;
-		nr_pages++;
-		next_index++;
-		if (max && nr_pages == max)
-			break;
-	}
-	len = nr_pages << PAGE_SHIFT;
-	dout("start_read %p nr_pages %d is %lld~%lld\n", inode, nr_pages,
-	     off, len);
-	vino = ceph_vino(inode);
-	req = ceph_osdc_new_request(osdc, &ci->i_layout, vino, off, &len,
-				    0, 1, CEPH_OSD_OP_READ,
-				    CEPH_OSD_FLAG_READ, NULL,
-				    ci->i_truncate_seq, ci->i_truncate_size,
-				    false);
-	if (IS_ERR(req)) {
-		ret = PTR_ERR(req);
-		goto out;
-	}
-
-	/* build page vector */
-	nr_pages = calc_pages_for(0, len);
-	pages = kmalloc_array(nr_pages, sizeof(*pages), GFP_KERNEL);
-	if (!pages) {
-		ret = -ENOMEM;
-		goto out_put;
-	}
-	for (i = 0; i < nr_pages; ++i) {
-		page = list_entry(page_list->prev, struct page, lru);
-		BUG_ON(PageLocked(page));
-		list_del(&page->lru);
-
- 		dout("start_read %p adding %p idx %lu\n", inode, page,
-		     page->index);
-		if (add_to_page_cache_lru(page, &inode->i_data, page->index,
-					  GFP_KERNEL)) {
-			put_page(page);
-			dout("start_read %p add_to_page_cache failed %p\n",
-			     inode, page);
-			nr_pages = i;
-			if (nr_pages > 0) {
-				len = nr_pages << PAGE_SHIFT;
-				osd_req_op_extent_update(req, 0, len);
-				break;
-			}
-			goto out_pages;
-		}
-		pages[i] = page;
-	}
-	osd_req_op_extent_osd_data_pages(req, 0, pages, len, 0, false, false);
-	req->r_callback = finish_read;
-	req->r_inode = inode;
-
-	dout("start_read %p starting %p %lld~%lld\n", inode, req, off, len);
-	ret = ceph_osdc_start_request(osdc, req, false);
-	if (ret < 0)
-		goto out_pages;
-	ceph_osdc_put_request(req);
-
-	/* After adding locked pages to page cache, the inode holds cache cap.
-	 * So we can drop our cap refs. */
 	if (got)
 		ceph_put_cap_refs(ci, got);
-
-	return nr_pages;
-
-out_pages:
-	for (i = 0; i < nr_pages; ++i) {
-		unlock_page(pages[i]);
-	}
-	ceph_put_page_vector(pages, nr_pages, false);
-out_put:
-	ceph_osdc_put_request(req);
-out:
-	if (got)
-		ceph_put_cap_refs(ci, got);
-	return ret;
 }
+const struct netfs_read_request_ops ceph_readahead_netfs_ops = {
+	.init_rreq		= ceph_init_rreq,
+	.is_cache_enabled	= ceph_is_cache_enabled,
+	.begin_cache_operation	= ceph_begin_cache_operation,
+	.issue_op		= ceph_netfs_issue_op,
+	.clamp_length		= ceph_netfs_clamp_length,
+	.cleanup		= ceph_readahead_cleanup,
+};
 
-
-/*
- * Read multiple pages.  Leave pages we don't read + unlock in page_list;
- * the caller (VM) cleans them up.
- */
-static int ceph_readpages(struct file *file, struct address_space *mapping,
-			  struct list_head *page_list, unsigned nr_pages)
+static void ceph_readahead(struct readahead_control *ractl)
 {
-	struct inode *inode = file_inode(file);
-	struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
-	struct ceph_file_info *fi = file->private_data;
+	struct inode *inode = file_inode(ractl->file);
+	struct ceph_file_info *fi = ractl->file->private_data;
 	struct ceph_rw_context *rw_ctx;
-	int rc = 0;
-	int max = 0;
+	int got = 0;
+	int ret = 0;
 
 	if (ceph_inode(inode)->i_inline_version != CEPH_INLINE_NONE)
-		return -EINVAL;
+		return;
 
 	rw_ctx = ceph_find_rw_context(fi);
-	max = fsc->mount_options->rsize >> PAGE_SHIFT;
-	dout("readpages %p file %p ctx %p nr_pages %d max %d\n",
-	     inode, file, rw_ctx, nr_pages, max);
-	while (!list_empty(page_list)) {
-		rc = start_read(inode, rw_ctx, page_list, max);
-		if (rc < 0)
-			goto out;
+	if (!rw_ctx) {
+		/*
+		 * readahead callers do not necessarily hold Fcb caps
+		 * (e.g. fadvise, madvise).
+		 */
+		int want = CEPH_CAP_FILE_CACHE;
+
+		ret = ceph_try_get_caps(inode, CEPH_CAP_FILE_RD, want, true, &got);
+		if (ret < 0)
+			dout("start_read %p, error getting cap\n", inode);
+		else if (!(got & want))
+			dout("start_read %p, no cache cap\n", inode);
+
+		if (ret <= 0)
+			return;
 	}
-out:
-	dout("readpages %p file %p ret %d\n", inode, file, rc);
-	return rc;
+	netfs_readahead(ractl, &ceph_readahead_netfs_ops, (void *)(uintptr_t)got);
 }
 
 struct ceph_writeback_ctl
@@ -1503,7 +1341,7 @@ static ssize_t ceph_direct_io(struct kiocb *iocb, struct iov_iter *iter)
 
 const struct address_space_operations ceph_aops = {
 	.readpage = ceph_readpage,
-	.readpages = ceph_readpages,
+	.readahead = ceph_readahead,
 	.writepage = ceph_writepage,
 	.writepages = ceph_writepages_start,
 	.write_begin = ceph_write_begin,
-- 
2.28.0


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

