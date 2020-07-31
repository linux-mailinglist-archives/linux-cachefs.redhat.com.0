Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 54A80234674
	for <lists+linux-cachefs@lfdr.de>; Fri, 31 Jul 2020 15:04:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-VyjLeJInMsK5M9kFgtRj1w-1; Fri, 31 Jul 2020 09:04:40 -0400
X-MC-Unique: VyjLeJInMsK5M9kFgtRj1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9D88106B242;
	Fri, 31 Jul 2020 13:04:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9E2D5D9F1;
	Fri, 31 Jul 2020 13:04:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 904851809557;
	Fri, 31 Jul 2020 13:04:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06VD4YgU009960 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 31 Jul 2020 09:04:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A4C7DFED4F; Fri, 31 Jul 2020 13:04:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E9BBFED41
	for <linux-cachefs@redhat.com>; Fri, 31 Jul 2020 13:04:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B88808007D6
	for <linux-cachefs@redhat.com>; Fri, 31 Jul 2020 13:04:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-264-vek0jg5jPz6DPEeNSfUCRw-1;
	Fri, 31 Jul 2020 09:04:27 -0400
X-MC-Unique: vek0jg5jPz6DPEeNSfUCRw-1
Received: from tleilax.com (68-20-15-154.lightspeed.rlghnc.sbcglobal.net
	[68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B356722B49;
	Fri, 31 Jul 2020 13:04:25 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 31 Jul 2020 09:04:15 -0400
Message-Id: <20200731130421.127022-6-jlayton@kernel.org>
In-Reply-To: <20200731130421.127022-1-jlayton@kernel.org>
References: <20200731130421.127022-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06VD4YgU009960
X-loop: linux-cachefs@redhat.com
Cc: idryomov@gmail.com, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v2 05/11] ceph: fold
	ceph_update_writeable_page into ceph_write_begin
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

...and reorganize the loop for better clarity.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 141 ++++++++++++++++++++++---------------------------
 1 file changed, 62 insertions(+), 79 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index a04eaf75480b..f4df04769761 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1252,6 +1252,8 @@ static int context_is_writeable_or_written(struct inode *inode,
  * @inode: inode associated with page
  * @page: page being dirtied
  *
+ * We are only allowed to write into/dirty the page if the page is
+ * clean, or already dirty within the same snap context.
  * Returns NULL on success, negative error code on error, and a snapc ref that should be
  * waited on otherwise.
  */
@@ -1308,104 +1310,85 @@ ceph_find_incompatible(struct inode *inode, struct page *page)
 /*
  * We are only allowed to write into/dirty the page if the page is
  * clean, or already dirty within the same snap context.
- *
- * called with page locked.
- * return success with page locked,
- * or any failure (incl -EAGAIN) with page unlocked.
  */
-static int ceph_update_writeable_page(struct file *file,
-			    loff_t pos, unsigned len,
-			    struct page *page)
+static int ceph_write_begin(struct file *file, struct address_space *mapping,
+			    loff_t pos, unsigned len, unsigned flags,
+			    struct page **pagep, void **fsdata)
 {
 	struct inode *inode = file_inode(file);
 	struct ceph_inode_info *ci = ceph_inode(inode);
 	struct ceph_snap_context *snapc;
+	struct page *page = NULL;
+	pgoff_t index = pos >> PAGE_SHIFT;
 	loff_t page_off = pos & PAGE_MASK;
 	int pos_in_page = pos & ~PAGE_MASK;
 	int end_in_page = pos_in_page + len;
 	loff_t i_size;
 	int r;
+refind:
+	/* get a page */
+	page = grab_cache_page_write_begin(mapping, index, 0);
+	if (!page)
+		return -ENOMEM;
 
-retry_locked:
-	snapc = ceph_find_incompatible(inode, page);
-	if (snapc) {
-		if (IS_ERR(snapc)) {
-			r = PTR_ERR(snapc);
-			goto fail_unlock;
+	dout("write_begin file %p inode %p page %p %d~%d\n", file,
+	     inode, page, (int)pos, (int)len);
+
+	for (;;) {
+		snapc = ceph_find_incompatible(inode, page);
+		if (snapc) {
+			if (IS_ERR(snapc)) {
+				r = PTR_ERR(snapc);
+				break;
+			}
+			unlock_page(page);
+			ceph_queue_writeback(inode);
+			r = wait_event_killable(ci->i_cap_wq,
+						context_is_writeable_or_written(inode, snapc));
+			ceph_put_snap_context(snapc);
+			put_page(page);
+			goto refind;
 		}
-		unlock_page(page);
-		ceph_queue_writeback(inode);
-		r = wait_event_killable(ci->i_cap_wq,
-					context_is_writeable_or_written(inode, snapc));
-		ceph_put_snap_context(snapc);
-		return -EAGAIN;
-	}
 
-	if (PageUptodate(page)) {
-		dout(" page %p already uptodate\n", page);
-		return 0;
-	}
+		if (PageUptodate(page)) {
+			dout(" page %p already uptodate\n", page);
+			break;
+		}
 
-	/* full page? */
-	if (pos_in_page == 0 && len == PAGE_SIZE)
-		return 0;
+		/* full page? */
+		if (pos_in_page == 0 && len == PAGE_SIZE)
+			break;
 
-	/* past end of file? */
-	i_size = i_size_read(inode);
-
-	if (page_off >= i_size ||
-	    (pos_in_page == 0 && (pos+len) >= i_size &&
-	     end_in_page - pos_in_page != PAGE_SIZE)) {
-		dout(" zeroing %p 0 - %d and %d - %d\n",
-		     page, pos_in_page, end_in_page, (int)PAGE_SIZE);
-		zero_user_segments(page,
-				   0, pos_in_page,
-				   end_in_page, PAGE_SIZE);
-		return 0;
-	}
+		/* past end of file? */
+		i_size = i_size_read(inode);
+		if (page_off >= i_size ||
+		    (pos_in_page == 0 && (pos+len) >= i_size &&
+		     end_in_page - pos_in_page != PAGE_SIZE)) {
+			dout(" zeroing %p 0 - %d and %d - %d\n",
+			     page, pos_in_page, end_in_page, (int)PAGE_SIZE);
+			zero_user_segments(page,
+					   0, pos_in_page,
+					   end_in_page, PAGE_SIZE);
+			break;
+		}
 
-	/* we need to read it. */
-	r = ceph_do_readpage(file, page);
-	if (r < 0) {
-		if (r == -EINPROGRESS)
-			return -EAGAIN;
-		goto fail_unlock;
+		/* we need to read it. */
+		r = ceph_do_readpage(file, page);
+		if (r) {
+			if (r == -EINPROGRESS)
+				continue;
+			break;
+		}
 	}
-	goto retry_locked;
-fail_unlock:
-	unlock_page(page);
-	return r;
-}
 
-/*
- * We are only allowed to write into/dirty the page if the page is
- * clean, or already dirty within the same snap context.
- */
-static int ceph_write_begin(struct file *file, struct address_space *mapping,
-			    loff_t pos, unsigned len, unsigned flags,
-			    struct page **pagep, void **fsdata)
-{
-	struct inode *inode = file_inode(file);
-	struct page *page;
-	pgoff_t index = pos >> PAGE_SHIFT;
-	int r;
-
-	do {
-		/* get a page */
-		page = grab_cache_page_write_begin(mapping, index, 0);
-		if (!page)
-			return -ENOMEM;
-
-		dout("write_begin file %p inode %p page %p %d~%d\n", file,
-		     inode, page, (int)pos, (int)len);
-
-		r = ceph_update_writeable_page(file, pos, len, page);
-		if (r < 0)
+	if (r < 0) {
+		if (page) {
+			unlock_page(page);
 			put_page(page);
-		else
-			*pagep = page;
-	} while (r == -EAGAIN);
-
+		}
+	} else {
+		*pagep = page;
+	}
 	return r;
 }
 
-- 
2.26.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

