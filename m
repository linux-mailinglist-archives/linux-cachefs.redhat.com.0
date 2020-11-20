Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AAFB22BAED9
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 16:30:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-8hSU3gOsP123LEzkMYL8pQ-1; Fri, 20 Nov 2020 10:30:48 -0500
X-MC-Unique: 8hSU3gOsP123LEzkMYL8pQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D34A48797E6;
	Fri, 20 Nov 2020 15:30:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C339660C17;
	Fri, 20 Nov 2020 15:30:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF67F5002C;
	Fri, 20 Nov 2020 15:30:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKFUJlk017655 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 10:30:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0BB342166B2B; Fri, 20 Nov 2020 15:30:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 069582166B28
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 15:30:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B339C811E86
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 15:30:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-232-6mam-99TO6ajUVbjTHL6cQ-1;
	Fri, 20 Nov 2020 10:30:14 -0500
X-MC-Unique: 6mam-99TO6ajUVbjTHL6cQ-1
Received: from tleilax.com (68-20-15-154.lightspeed.rlghnc.sbcglobal.net
	[68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C5DB12245A;
	Fri, 20 Nov 2020 15:30:11 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 20 Nov 2020 10:30:06 -0500
Message-Id: <20201120153006.304296-6-jlayton@kernel.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AKFUJlk017655
X-loop: linux-cachefs@redhat.com
Cc: idryomov@redhat.com, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 5/5] ceph: add fscache writeback support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When updating the backing store from the pagecache (a'la writepage or
writepages), write to the cache first. This allows us to keep caching
files even when they are open for write.

With this change we we can now re-enable CEPH_FSCACHE in Kconfig.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/Kconfig |  2 +-
 fs/ceph/addr.c  | 64 +++++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 58 insertions(+), 8 deletions(-)

diff --git a/fs/ceph/Kconfig b/fs/ceph/Kconfig
index 77ad452337ee..94df854147d3 100644
--- a/fs/ceph/Kconfig
+++ b/fs/ceph/Kconfig
@@ -21,7 +21,7 @@ config CEPH_FS
 if CEPH_FS
 config CEPH_FSCACHE
 	bool "Enable Ceph client caching support"
-	depends on CEPH_FS=m && FSCACHE_OLD || CEPH_FS=y && FSCACHE_OLD=y
+	depends on CEPH_FS=m && FSCACHE || CEPH_FS=y && FSCACHE=y
 	help
 	  Choose Y here to enable persistent, read-only local
 	  caching support for Ceph clients using FS-Cache
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index ea17ee7d7218..3bd9a2922e4f 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -5,7 +5,6 @@
 #include <linux/fs.h>
 #include <linux/mm.h>
 #include <linux/pagemap.h>
-#include <linux/writeback.h>	/* generic_writepages */
 #include <linux/slab.h>
 #include <linux/pagevec.h>
 #include <linux/task_io_accounting_ops.h>
@@ -391,6 +390,39 @@ static void ceph_readahead(struct readahead_control *ractl)
 	netfs_readahead(ractl, &ceph_readahead_netfs_ops, (void *)(uintptr_t)got);
 }
 
+#ifdef CONFIG_CEPH_FSCACHE
+static void ceph_fscache_write_terminated(void *priv, ssize_t error)
+{
+	struct inode *inode = priv;
+
+	if (IS_ERR_VALUE(error) && error != -ENOBUFS)
+		ceph_fscache_invalidate(inode, 0);
+}
+
+static void ceph_fscache_write_to_cache(struct inode *inode, u64 off, u64 len)
+{
+	struct ceph_inode_info *ci = ceph_inode(inode);
+	struct fscache_cookie *cookie = ceph_fscache_cookie(ci);
+
+	fscache_write_to_cache(cookie, inode->i_mapping, off, len, i_size_read(inode),
+			       ceph_fscache_write_terminated, inode);
+}
+
+static inline bool CephTestSetPageFsCache(struct page *page)
+{
+	return TestSetPageFsCache(page);
+}
+#else
+static inline void ceph_fscache_write_to_cache(struct inode *inode, u64 off, u64 len)
+{
+}
+
+static inline bool CephTestSetPageFsCache(struct page *page)
+{
+	return false;
+}
+#endif /* CONFIG_CEPH_FSCACHE */
+
 struct ceph_writeback_ctl
 {
 	loff_t i_size;
@@ -544,16 +576,17 @@ static int writepage_nounlock(struct page *page, struct writeback_control *wbc)
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
+	if (CephTestSetPageFsCache(page))
+		BUG();
+	ceph_fscache_write_to_cache(inode, page_off, len);
 
 	/* it may be a short write due to an object boundary */
 	WARN_ON_ONCE(len > PAGE_SIZE);
@@ -612,6 +645,9 @@ static int ceph_writepage(struct page *page, struct writeback_control *wbc)
 	struct inode *inode = page->mapping->host;
 	BUG_ON(!inode);
 	ihold(inode);
+
+	ceph_wait_on_page_fscache(page);
+
 	err = writepage_nounlock(page, wbc);
 	if (err == -ERESTARTSYS) {
 		/* direct memory reclaimer was killed by SIGKILL. return 0
@@ -856,7 +892,7 @@ static int ceph_writepages_start(struct address_space *mapping,
 				unlock_page(page);
 				break;
 			}
-			if (PageWriteback(page)) {
+			if (PageWriteback(page) || PageFsCache(page)) {
 				if (wbc->sync_mode == WB_SYNC_NONE) {
 					dout("%p under writeback\n", page);
 					unlock_page(page);
@@ -864,6 +900,7 @@ static int ceph_writepages_start(struct address_space *mapping,
 				}
 				dout("waiting on writeback %p\n", page);
 				wait_on_page_writeback(page);
+				ceph_wait_on_page_fscache(page);
 			}
 
 			if (!clear_page_dirty_for_io(page)) {
@@ -996,9 +1033,19 @@ static int ceph_writepages_start(struct address_space *mapping,
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
+				ceph_fscache_write_to_cache(inode, offset, len);
+
+				/* Start a new extent */
 				osd_req_op_extent_dup_last(req, op_idx,
 							   cur_offset - offset);
 				dout("writepages got pages at %llu~%llu\n",
@@ -1015,8 +1062,11 @@ static int ceph_writepages_start(struct address_space *mapping,
 			}
 
 			set_page_writeback(pages[i]);
+			if (CephTestSetPageFsCache(pages[i]))
+				BUG();
 			len += PAGE_SIZE;
 		}
+		ceph_fscache_write_to_cache(inode, offset, len);
 
 		if (ceph_wbc.size_stable) {
 			len = min(len, ceph_wbc.i_size - offset);
-- 
2.28.0


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

