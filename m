Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 118E9234675
	for <lists+linux-cachefs@lfdr.de>; Fri, 31 Jul 2020 15:04:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-gCeyvyp3NQKgBNx2kErtRQ-1; Fri, 31 Jul 2020 09:04:41 -0400
X-MC-Unique: gCeyvyp3NQKgBNx2kErtRQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C8CA18839E1;
	Fri, 31 Jul 2020 13:04:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F5956932D;
	Fri, 31 Jul 2020 13:04:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BBF095A6C;
	Fri, 31 Jul 2020 13:04:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06VD4WQV009907 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 31 Jul 2020 09:04:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CE009FED49; Fri, 31 Jul 2020 13:04:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5B11FED27
	for <linux-cachefs@redhat.com>; Fri, 31 Jul 2020 13:04:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4DE58001E2
	for <linux-cachefs@redhat.com>; Fri, 31 Jul 2020 13:04:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-141-WfuJc0nNOmyozQEf4kUhCQ-1;
	Fri, 31 Jul 2020 09:04:26 -0400
X-MC-Unique: WfuJc0nNOmyozQEf4kUhCQ-1
Received: from tleilax.com (68-20-15-154.lightspeed.rlghnc.sbcglobal.net
	[68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9202A22B42;
	Fri, 31 Jul 2020 13:04:24 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 31 Jul 2020 09:04:13 -0400
Message-Id: <20200731130421.127022-4-jlayton@kernel.org>
In-Reply-To: <20200731130421.127022-1-jlayton@kernel.org>
References: <20200731130421.127022-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06VD4WQV009907
X-loop: linux-cachefs@redhat.com
Cc: idryomov@gmail.com, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v2 03/11] ceph: fold ceph_sync_readpages
	into ceph_readpage
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

It's the only caller and this will make reorg easier.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 79 ++++++++++++++++----------------------------------
 1 file changed, 25 insertions(+), 54 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index e02d8915376f..a30e18495f70 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -182,58 +182,15 @@ static int ceph_releasepage(struct page *page, gfp_t g)
 	return !PagePrivate(page);
 }
 
-/*
- * Read some contiguous pages.  If we cross a stripe boundary, shorten
- * *plen.  Return number of bytes read, or error.
- */
-static int ceph_sync_readpages(struct ceph_fs_client *fsc,
-			       struct ceph_vino vino,
-			       struct ceph_file_layout *layout,
-			       u64 off, u64 *plen,
-			       u32 truncate_seq, u64 truncate_size,
-			       struct page **pages, int num_pages,
-			       int page_align)
-{
-	struct ceph_osd_client *osdc = &fsc->client->osdc;
-	struct ceph_osd_request *req;
-	int rc = 0;
-
-	dout("readpages on ino %llx.%llx on %llu~%llu\n", vino.ino,
-	     vino.snap, off, *plen);
-	req = ceph_osdc_new_request(osdc, layout, vino, off, plen, 0, 1,
-				    CEPH_OSD_OP_READ, CEPH_OSD_FLAG_READ,
-				    NULL, truncate_seq, truncate_size,
-				    false);
-	if (IS_ERR(req))
-		return PTR_ERR(req);
-
-	/* it may be a short read due to an object boundary */
-	osd_req_op_extent_osd_data_pages(req, 0,
-				pages, *plen, page_align, false, false);
-
-	dout("readpages  final extent is %llu~%llu (%llu bytes align %d)\n",
-	     off, *plen, *plen, page_align);
-
-	rc = ceph_osdc_start_request(osdc, req, false);
-	if (!rc)
-		rc = ceph_osdc_wait_request(osdc, req);
-
-	ceph_update_read_latency(&fsc->mdsc->metric, req->r_start_latency,
-				 req->r_end_latency, rc);
-
-	ceph_osdc_put_request(req);
-	dout("readpages result %d\n", rc);
-	return rc;
-}
-
-/*
- * read a single page, without unlocking it.
- */
+/* read a single page, without unlocking it. */
 static int ceph_do_readpage(struct file *filp, struct page *page)
 {
 	struct inode *inode = file_inode(filp);
 	struct ceph_inode_info *ci = ceph_inode(inode);
 	struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
+	struct ceph_osd_client *osdc = &fsc->client->osdc;
+	struct ceph_osd_request *req;
+	struct ceph_vino vino = ceph_vino(inode);
 	int err = 0;
 	u64 off = page_offset(page);
 	u64 len = PAGE_SIZE;
@@ -260,12 +217,27 @@ static int ceph_do_readpage(struct file *filp, struct page *page)
 	if (err == 0)
 		return -EINPROGRESS;
 
-	dout("readpage inode %p file %p page %p index %lu\n",
-	     inode, filp, page, page->index);
-	err = ceph_sync_readpages(fsc, ceph_vino(inode),
-				  &ci->i_layout, off, &len,
-				  ci->i_truncate_seq, ci->i_truncate_size,
-				  &page, 1, 0);
+	dout("readpage ino %llx.%llx file %p off %llu len %llu page %p index %lu\n",
+	     vino.ino, vino.snap, filp, off, len, page, page->index);
+	req = ceph_osdc_new_request(osdc, &ci->i_layout, vino, off, &len, 0, 1,
+				    CEPH_OSD_OP_READ, CEPH_OSD_FLAG_READ, NULL,
+				    ci->i_truncate_seq, ci->i_truncate_size,
+				    false);
+	if (IS_ERR(req))
+		return PTR_ERR(req);
+
+	osd_req_op_extent_osd_data_pages(req, 0, &page, len, 0, false, false);
+
+	err = ceph_osdc_start_request(osdc, req, false);
+	if (!err)
+		err = ceph_osdc_wait_request(osdc, req);
+
+	ceph_update_read_latency(&fsc->mdsc->metric, req->r_start_latency,
+				 req->r_end_latency, err);
+
+	ceph_osdc_put_request(req);
+	dout("readpage result %d\n", err);
+
 	if (err == -ENOENT)
 		err = 0;
 	if (err < 0) {
@@ -283,7 +255,6 @@ static int ceph_do_readpage(struct file *filp, struct page *page)
 
 	SetPageUptodate(page);
 	ceph_readpage_to_fscache(inode, page);
-
 out:
 	return err < 0 ? err : 0;
 }
-- 
2.26.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

