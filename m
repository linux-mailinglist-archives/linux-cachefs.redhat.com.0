Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 349A4234670
	for <lists+linux-cachefs@lfdr.de>; Fri, 31 Jul 2020 15:04:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-HJIkCam_O2OUlf-3D9b0JA-1; Fri, 31 Jul 2020 09:04:38 -0400
X-MC-Unique: HJIkCam_O2OUlf-3D9b0JA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 440AE8014D7;
	Fri, 31 Jul 2020 13:04:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1849B73039;
	Fri, 31 Jul 2020 13:04:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94C9395A6C;
	Fri, 31 Jul 2020 13:04:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06VD4UXl009877 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 31 Jul 2020 09:04:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F2F7F2029F82; Fri, 31 Jul 2020 13:04:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D23FB20182AB
	for <linux-cachefs@redhat.com>; Fri, 31 Jul 2020 13:04:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF07B1859172
	for <linux-cachefs@redhat.com>; Fri, 31 Jul 2020 13:04:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-2-kUKK5Fp8PHGdVQSTFffvog-1;
	Fri, 31 Jul 2020 09:04:26 -0400
X-MC-Unique: kUKK5Fp8PHGdVQSTFffvog-1
Received: from tleilax.com (68-20-15-154.lightspeed.rlghnc.sbcglobal.net
	[68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 286AA22B43;
	Fri, 31 Jul 2020 13:04:25 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 31 Jul 2020 09:04:14 -0400
Message-Id: <20200731130421.127022-5-jlayton@kernel.org>
In-Reply-To: <20200731130421.127022-1-jlayton@kernel.org>
References: <20200731130421.127022-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06VD4UXl009877
X-loop: linux-cachefs@redhat.com
Cc: idryomov@gmail.com, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v2 04/11] ceph: fold
	ceph_sync_writepages into writepage_nounlock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It's the only caller, and this will make it easier to refactor.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 93 +++++++++++++++++++-------------------------------
 1 file changed, 35 insertions(+), 58 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index a30e18495f70..a04eaf75480b 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -590,50 +590,6 @@ static u64 get_writepages_data_length(struct inode *inode,
 	return end > start ? end - start : 0;
 }
 
-/*
- * do a synchronous write on N pages
- */
-static int ceph_sync_writepages(struct ceph_fs_client *fsc,
-				struct ceph_vino vino,
-				struct ceph_file_layout *layout,
-				struct ceph_snap_context *snapc,
-				u64 off, u64 len,
-				u32 truncate_seq, u64 truncate_size,
-				struct timespec64 *mtime,
-				struct page **pages, int num_pages)
-{
-	struct ceph_osd_client *osdc = &fsc->client->osdc;
-	struct ceph_osd_request *req;
-	int rc = 0;
-	int page_align = off & ~PAGE_MASK;
-
-	req = ceph_osdc_new_request(osdc, layout, vino, off, &len, 0, 1,
-				    CEPH_OSD_OP_WRITE, CEPH_OSD_FLAG_WRITE,
-				    snapc, truncate_seq, truncate_size,
-				    true);
-	if (IS_ERR(req))
-		return PTR_ERR(req);
-
-	/* it may be a short write due to an object boundary */
-	osd_req_op_extent_osd_data_pages(req, 0, pages, len, page_align,
-				false, false);
-	dout("writepages %llu~%llu (%llu bytes)\n", off, len, len);
-
-	req->r_mtime = *mtime;
-	rc = ceph_osdc_start_request(osdc, req, true);
-	if (!rc)
-		rc = ceph_osdc_wait_request(osdc, req);
-
-	ceph_update_write_latency(&fsc->mdsc->metric, req->r_start_latency,
-				  req->r_end_latency, rc);
-
-	ceph_osdc_put_request(req);
-	if (rc == 0)
-		rc = len;
-	dout("writepages result %d\n", rc);
-	return rc;
-}
-
 /*
  * Write a single page, but leave the page locked.
  *
@@ -642,20 +598,19 @@ static int ceph_sync_writepages(struct ceph_fs_client *fsc,
  */
 static int writepage_nounlock(struct page *page, struct writeback_control *wbc)
 {
-	struct inode *inode;
-	struct ceph_inode_info *ci;
-	struct ceph_fs_client *fsc;
+	struct inode *inode = page->mapping->host;
+	struct ceph_inode_info *ci = ceph_inode(inode);
+	struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
 	struct ceph_snap_context *snapc, *oldest;
 	loff_t page_off = page_offset(page);
-	int err, len = PAGE_SIZE;
+	int err;
+	loff_t len = PAGE_SIZE;
 	struct ceph_writeback_ctl ceph_wbc;
+	struct ceph_osd_client *osdc = &fsc->client->osdc;
+	struct ceph_osd_request *req;
 
 	dout("writepage %p idx %lu\n", page, page->index);
 
-	inode = page->mapping->host;
-	ci = ceph_inode(inode);
-	fsc = ceph_inode_to_client(inode);
-
 	/* verify this is a writeable snap context */
 	snapc = page_snap_context(page);
 	if (!snapc) {
@@ -684,7 +639,7 @@ static int writepage_nounlock(struct page *page, struct writeback_control *wbc)
 	if (ceph_wbc.i_size < page_off + len)
 		len = ceph_wbc.i_size - page_off;
 
-	dout("writepage %p page %p index %lu on %llu~%u snapc %p seq %lld\n",
+	dout("writepage %p page %p index %lu on %llu~%llu snapc %p seq %lld\n",
 	     inode, page, page->index, page_off, len, snapc, snapc->seq);
 
 	if (atomic_long_inc_return(&fsc->writeback_count) >
@@ -692,11 +647,33 @@ static int writepage_nounlock(struct page *page, struct writeback_control *wbc)
 		set_bdi_congested(inode_to_bdi(inode), BLK_RW_ASYNC);
 
 	set_page_writeback(page);
-	err = ceph_sync_writepages(fsc, ceph_vino(inode),
-				   &ci->i_layout, snapc, page_off, len,
-				   ceph_wbc.truncate_seq,
-				   ceph_wbc.truncate_size,
-				   &inode->i_mtime, &page, 1);
+	req = ceph_osdc_new_request(osdc, &ci->i_layout, ceph_vino(inode), page_off, &len, 0, 1,
+				    CEPH_OSD_OP_WRITE, CEPH_OSD_FLAG_WRITE, snapc,
+				    ceph_wbc.truncate_seq, ceph_wbc.truncate_size,
+				    true);
+	if (IS_ERR(req)) {
+		redirty_page_for_writepage(wbc, page);
+		end_page_writeback(page);
+		return PTR_ERR(req);
+	}
+
+	/* it may be a short write due to an object boundary */
+	WARN_ON_ONCE(len > PAGE_SIZE);
+	osd_req_op_extent_osd_data_pages(req, 0, &page, len, 0, false, false);
+	dout("writepage %llu~%llu (%llu bytes)\n", page_off, len, len);
+
+	req->r_mtime = inode->i_mtime;
+	err = ceph_osdc_start_request(osdc, req, true);
+	if (!err)
+		err = ceph_osdc_wait_request(osdc, req);
+
+	ceph_update_write_latency(&fsc->mdsc->metric, req->r_start_latency,
+				  req->r_end_latency, err);
+
+	ceph_osdc_put_request(req);
+	if (err == 0)
+		err = len;
+
 	if (err < 0) {
 		struct writeback_control tmp_wbc;
 		if (!wbc)
-- 
2.26.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

