Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9434F7E93
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 14:03:04 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-Y4NfiEIyPruZWngOAH-bLg-1; Thu, 07 Apr 2022 08:03:00 -0400
X-MC-Unique: Y4NfiEIyPruZWngOAH-bLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1ED0F8C72D1;
	Thu,  7 Apr 2022 12:02:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8677E407DEC7;
	Thu,  7 Apr 2022 12:02:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 62FD41940341;
	Thu,  7 Apr 2022 12:02:49 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7593F1947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 12:02:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 34FA54029A6; Thu,  7 Apr 2022 12:02:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 307AD401E1C
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 12:02:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB4671C01724
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 12:02:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-V_loc08NORORCn22uEXCZQ-1; Thu, 07 Apr 2022 08:02:34 -0400
X-MC-Unique: V_loc08NORORCn22uEXCZQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6DF01617A0;
 Thu,  7 Apr 2022 12:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2115CC385A8;
 Thu,  7 Apr 2022 12:02:30 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org,
	dhowells@redhat.com
Date: Thu,  7 Apr 2022 08:02:24 -0400
Message-Id: <20220407120224.76156-6-jlayton@kernel.org>
In-Reply-To: <20220407120224.76156-1-jlayton@kernel.org>
References: <20220407120224.76156-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Linux-cachefs] [RFC PATCH 5/5] ceph: switch to
 netfs_direct_read_iter
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-cachefs@redhat.com, idryomov@gmail.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 41 +++++++++++++++++++++++++++++------------
 fs/ceph/file.c |  3 +--
 2 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 0726494a0981..bc575bbbf8b7 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -201,7 +201,6 @@ static void finish_netfs_read(struct ceph_osd_request *req)
 	struct ceph_fs_client *fsc = ceph_inode_to_client(req->r_inode);
 	struct ceph_osd_data *osd_data = osd_req_op_extent_osd_data(req, 0);
 	struct netfs_io_subrequest *subreq = req->r_priv;
-	int num_pages;
 	int err = req->r_result;
 
 	ceph_update_read_metrics(&fsc->mdsc->metric, req->r_start_latency,
@@ -216,13 +215,18 @@ static void finish_netfs_read(struct ceph_osd_request *req)
 	else if (err == -EBLOCKLISTED)
 		fsc->blocklisted = true;
 
-	if (err >= 0 && err < subreq->len)
-		__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
+	if (err >= 0) {
+		if (err < subreq->len)
+			__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
+		iov_iter_advance(&subreq->iter, err);
+	}
+	if (!iov_iter_is_bvec(&subreq->iter))
+		ceph_put_page_vector(osd_data->pages,
+				     calc_pages_for(osd_data->alignment,
+				     osd_data->length),
+				     false);
 
 	netfs_subreq_terminated(subreq, err, true);
-
-	num_pages = calc_pages_for(osd_data->alignment, osd_data->length);
-	ceph_put_page_vector(osd_data->pages, num_pages, false);
 	iput(req->r_inode);
 }
 
@@ -285,6 +289,7 @@ static void ceph_netfs_issue_read(struct netfs_io_subrequest *subreq)
 	struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
 	struct ceph_osd_request *req;
 	struct ceph_vino vino = ceph_vino(inode);
+	struct iov_iter *iter = &subreq->iter;
 	struct page **pages;
 	size_t page_off;
 	int err = 0;
@@ -308,16 +313,28 @@ static void ceph_netfs_issue_read(struct netfs_io_subrequest *subreq)
 		__func__, subreq->start, subreq->len, len, rreq->debug_id,
 		subreq->debug_index, iov_iter_count(&subreq->iter));
 
-	err = iov_iter_get_pages_alloc(&subreq->iter, &pages, len, &page_off);
-	if (err < 0) {
-		dout("%s: iov_ter_get_pages_alloc returned %d\n", __func__, err);
-		goto out;
+	if (iov_iter_is_bvec(iter)) {
+		/*
+		 * FIXME: remove force cast, ideally by plumbing an IOV_ITER osd_data
+		 * 	  variant.
+		 */
+		osd_req_op_extent_osd_data_bvecs(req, 0, (__force struct bio_vec *)iter->bvec,
+				iter->nr_segs, len);
+		goto submit;
 	}
 
-	/* FIXME: adjust the len in req downward if necessary */
-	len = err;
+	err = iov_iter_get_pages_alloc(&subreq->iter, &pages, len, &page_off);
+	if (err < len) {
+		if (err < 0) {
+			dout("%s: iov_ter_get_pages_alloc returned %d\n", __func__, err);
+			goto out;
+		}
+		len = err;
+		req->r_ops[0].extent.length = err;
+	}
 
 	osd_req_op_extent_osd_data_pages(req, 0, pages, len, 0, false, false);
+submit:
 	req->r_callback = finish_netfs_read;
 	req->r_priv = subreq;
 	req->r_inode = inode;
diff --git a/fs/ceph/file.c b/fs/ceph/file.c
index 6c9e837aa1d3..8271459b36dc 100644
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -1624,8 +1624,7 @@ static ssize_t ceph_read_iter(struct kiocb *iocb, struct iov_iter *to)
 
 		if (ci->i_inline_version == CEPH_INLINE_NONE) {
 			if (!retry_op && (iocb->ki_flags & IOCB_DIRECT)) {
-				ret = ceph_direct_read_write(iocb, to,
-							     NULL, NULL);
+				ret = netfs_direct_read_iter(iocb, to);
 				if (ret >= 0 && ret < len)
 					retry_op = CHECK_EOF;
 			} else {
-- 
2.35.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

