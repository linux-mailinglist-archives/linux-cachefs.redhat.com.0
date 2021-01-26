Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CFDD8303F18
	for <lists+linux-cachefs@lfdr.de>; Tue, 26 Jan 2021 14:45:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-HVuKCmb3OEyH4Zu2a4grrw-1; Tue, 26 Jan 2021 08:45:10 -0500
X-MC-Unique: HVuKCmb3OEyH4Zu2a4grrw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16DAC107ACE4;
	Tue, 26 Jan 2021 13:45:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 070E46F45C;
	Tue, 26 Jan 2021 13:45:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E50FD1809C9F;
	Tue, 26 Jan 2021 13:45:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QDfGfY003148 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 08:41:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2963F2166B29; Tue, 26 Jan 2021 13:41:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 244012166B28
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 13:41:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FEF080391A
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 13:41:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-193-uKjjlJRRME6PQeOj7RMnNQ-1;
	Tue, 26 Jan 2021 08:41:11 -0500
X-MC-Unique: uKjjlJRRME6PQeOj7RMnNQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C2072255F;
	Tue, 26 Jan 2021 13:41:09 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org, idryomov@gmail.com, dhowells@redhat.com
Date: Tue, 26 Jan 2021 08:41:02 -0500
Message-Id: <20210126134103.240031-6-jlayton@kernel.org>
In-Reply-To: <20210126134103.240031-1-jlayton@kernel.org>
References: <20210126134103.240031-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10QDfGfY003148
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, willy@infradead.org
Subject: [Linux-cachefs] [PATCH 5/6] ceph: plug write_begin into read helper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert ceph_write_begin to use the netfs_write_begin helper. Most of
the ops we need for it are already in place from the readpage conversion
but we do add a new check_write_begin op since ceph needs to be able to
vet whether there is an incompatible writeback already in flight before
reading in the page.

With this, we can also remove the old ceph_do_readpage helper.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 187 ++++++++++++++++---------------------------------
 1 file changed, 61 insertions(+), 126 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 9ae6c0fddb80..7f33418c5c6b 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -322,76 +322,6 @@ static int ceph_readpage(struct file *file, struct page *page)
 	return netfs_readpage(file, page, &ceph_readpage_netfs_ops, NULL);
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
-		if (err == -EBLOCKLISTED)
-			fsc->blocklisted = true;
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
@@ -1411,6 +1341,40 @@ ceph_find_incompatible(struct page *page)
 	return NULL;
 }
 
+static int ceph_netfs_check_write_begin(struct file *file, loff_t pos, unsigned int len,
+					struct page *page, void **_fsdata)
+{
+	struct inode *inode = file_inode(file);
+	struct ceph_inode_info *ci = ceph_inode(inode);
+	struct ceph_snap_context *snapc;
+
+	snapc = ceph_find_incompatible(page);
+	if (snapc) {
+		int r;
+
+		unlock_page(page);
+		put_page(page);
+		if (IS_ERR(snapc))
+			return PTR_ERR(snapc);
+
+		ceph_queue_writeback(inode);
+		r = wait_event_killable(ci->i_cap_wq,
+					context_is_writeable_or_written(inode, snapc));
+		ceph_put_snap_context(snapc);
+		return r == 0 ? -EAGAIN : r;
+	}
+	return 0;
+}
+
+const struct netfs_read_request_ops ceph_netfs_write_begin_ops = {
+	.init_rreq		= ceph_init_rreq,
+	.is_cache_enabled	= ceph_is_cache_enabled,
+	.begin_cache_operation	= ceph_begin_cache_operation,
+	.issue_op		= ceph_netfs_issue_op,
+	.clamp_length		= ceph_netfs_clamp_length,
+	.check_write_begin	= ceph_netfs_check_write_begin,
+};
+
 /*
  * We are only allowed to write into/dirty the page if the page is
  * clean, or already dirty within the same snap context.
@@ -1421,75 +1385,46 @@ static int ceph_write_begin(struct file *file, struct address_space *mapping,
 {
 	struct inode *inode = file_inode(file);
 	struct ceph_inode_info *ci = ceph_inode(inode);
-	struct ceph_snap_context *snapc;
 	struct page *page = NULL;
 	pgoff_t index = pos >> PAGE_SHIFT;
-	int pos_in_page = pos & ~PAGE_MASK;
-	int r = 0;
-
-	dout("write_begin file %p inode %p page %p %d~%d\n", file, inode, page, (int)pos, (int)len);
-
-	for (;;) {
-		page = grab_cache_page_write_begin(mapping, index, flags);
-		if (!page) {
-			r = -ENOMEM;
-			break;
-		}
-
-		snapc = ceph_find_incompatible(page);
-		if (snapc) {
-			if (IS_ERR(snapc)) {
-				r = PTR_ERR(snapc);
-				break;
-			}
-			unlock_page(page);
-			put_page(page);
-			page = NULL;
-			ceph_queue_writeback(inode);
-			r = wait_event_killable(ci->i_cap_wq,
-						context_is_writeable_or_written(inode, snapc));
-			ceph_put_snap_context(snapc);
-			if (r != 0)
-				break;
-			continue;
-		}
-
-		if (PageUptodate(page)) {
-			dout(" page %p already uptodate\n", page);
-			break;
-		}
+	int r;
 
+	if (ci->i_inline_version != CEPH_INLINE_NONE) {
 		/*
-		 * In some cases we don't need to read at all:
-		 * - full page write
-		 * - write that lies completely beyond EOF
-		 * - write that covers the the page from start to EOF or beyond it
+		 * In principle, we should never get here, as the inode should have been uninlined
+		 * before we're allowed to write to the page (in write_iter or page_mkwrite).
 		 */
-		if ((pos_in_page == 0 && len == PAGE_SIZE) ||
-		    (pos >= i_size_read(inode)) ||
-		    (pos_in_page == 0 && (pos + len) >= i_size_read(inode))) {
-			zero_user_segments(page, 0, pos_in_page,
-					   pos_in_page + len, PAGE_SIZE);
-			break;
-		}
+		WARN_ONCE(1, "ceph: write_begin called on still-inlined inode!\n");
 
 		/*
-		 * We need to read it. If we get back -EINPROGRESS, then the page was
-		 * handed off to fscache and it will be unlocked when the read completes.
-		 * Refind the page in that case so we can reacquire the page lock. Otherwise
-		 * we got a hard error or the read was completed synchronously.
+		 * Uptodate inline data should have been added
+		 * into page cache while getting Fcr caps.
 		 */
-		r = ceph_do_readpage(file, page);
-		if (r != -EINPROGRESS)
-			break;
+		if (index == 0) {
+			r = -EINVAL;
+			goto out;
+		}
+
+		page = grab_cache_page_write_begin(mapping, index, flags);
+		if (!page)
+			return -ENOMEM;
+
+		zero_user_segment(page, 0, PAGE_SIZE);
+		SetPageUptodate(page);
+		r = 0;
+		goto out;
 	}
 
+	r = netfs_write_begin(file, inode->i_mapping, pos, len, 0, &page, NULL,
+			      &ceph_netfs_write_begin_ops, NULL);
+out:
+	if (r == 0)
+		wait_on_page_fscache(page);
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
2.29.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

