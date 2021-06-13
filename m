Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3383A5B15
	for <lists+linux-cachefs@lfdr.de>; Mon, 14 Jun 2021 01:38:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-fI4UutvJMNuEgjwsVMD_LQ-1; Sun, 13 Jun 2021 19:38:08 -0400
X-MC-Unique: fI4UutvJMNuEgjwsVMD_LQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE1121084F42;
	Sun, 13 Jun 2021 23:38:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFD9560871;
	Sun, 13 Jun 2021 23:38:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5BB1746F82;
	Sun, 13 Jun 2021 23:38:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15DNXtVm013242 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 13 Jun 2021 19:33:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 22A4621677FC; Sun, 13 Jun 2021 23:33:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E63C21677FA
	for <linux-cachefs@redhat.com>; Sun, 13 Jun 2021 23:33:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5CB5811E9C
	for <linux-cachefs@redhat.com>; Sun, 13 Jun 2021 23:33:52 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-49-ONtP2ZN9MMSP5vMXD7V5YA-1; 
	Sun, 13 Jun 2021 19:33:48 -0400
X-MC-Unique: ONtP2ZN9MMSP5vMXD7V5YA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F65261159;
	Sun, 13 Jun 2021 23:33:46 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com
Date: Sun, 13 Jun 2021 19:33:45 -0400
Message-Id: <20210613233345.113565-1-jlayton@kernel.org>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 15DNXtVm013242
X-loop: linux-cachefs@redhat.com
Cc: Andrew W Elble <aweits@rit.edu>, willy@infradead.org,
	linux-cachefs@redhat.com, pfmeec@rit.edu, idryomov@gmail.com,
	ceph-devel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH] netfs: fix test for whether we can skip
	read when writing beyond EOF
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It's not sufficient to skip reading when the pos is beyond the EOF.
There may be data at the head of the page that we need to fill in
before the write.

Add a new helper function that corrects and clarifies the logic of
when we can skip reads, and have it only zero out the part of the page
that won't have data copied in for the write.

Finally, don't set the page Uptodate after zeroing. It's not up to date
since the write data won't have been copied in yet.

Fixes: e1b1240c1ff5f ("netfs: Add write_begin helper")
Reported-by: Andrew W Elble <aweits@rit.edu>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/netfs/read_helper.c | 53 ++++++++++++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 12 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 725614625ed4..fcf3a8a09a00 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -1011,12 +1011,48 @@ int netfs_readpage(struct file *file,
 }
 EXPORT_SYMBOL(netfs_readpage);
 
-static void netfs_clear_thp(struct page *page)
+/**
+ * prep_noread_page - prep a page for writing without reading first
+ * @page: page being prepared
+ * @pos: starting position for the write
+ * @len: length of write
+ *
+ * In some cases, write_begin doesn't need to read at all:
+ * - full page write
+ * - file is currently zero-length
+ * - write that lies in a page that is completely beyond EOF
+ * - write that covers the the page from start to EOF or beyond it
+ *
+ * If any of these criteria are met, then zero out the unwritten parts
+ * of the page and return true. Otherwise, return false.
+ */
+static bool prep_noread_page(struct page *page, loff_t pos, size_t len)
 {
-	unsigned int i;
+	struct inode *inode = page->mapping->host;
+	loff_t i_size = i_size_read(inode);
+	pgoff_t index = pos / thp_size(page);
+	size_t offset = offset_in_page(pos);
+
+	/* full page write */
+	if (offset == 0 && len >= thp_size(page))
+		goto zero_out;
 
-	for (i = 0; i < thp_nr_pages(page); i++)
-		clear_highpage(page + i);
+	/* zero-length file */
+	if (i_size == 0)
+		goto zero_out;
+
+	/* pos beyond last page in the file */
+	if (index > ((i_size - 1) / thp_size(page)))
+		goto zero_out;
+
+	/* write that covers the whole page from start to EOF or beyond it */
+	if (offset == 0 && (pos + len) >= i_size)
+		goto zero_out;
+
+	return false;
+zero_out:
+	zero_user_segments(page, 0, offset, offset + len, thp_size(page));
+	return true;
 }
 
 /**
@@ -1061,8 +1097,6 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	struct inode *inode = file_inode(file);
 	unsigned int debug_index = 0;
 	pgoff_t index = pos >> PAGE_SHIFT;
-	int pos_in_page = pos & ~PAGE_MASK;
-	loff_t size;
 	int ret;
 
 	DEFINE_READAHEAD(ractl, file, NULL, mapping, index);
@@ -1090,13 +1124,8 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	 * within the cache granule containing the EOF, in which case we need
 	 * to preload the granule.
 	 */
-	size = i_size_read(inode);
 	if (!ops->is_cache_enabled(inode) &&
-	    ((pos_in_page == 0 && len == thp_size(page)) ||
-	     (pos >= size) ||
-	     (pos_in_page == 0 && (pos + len) >= size))) {
-		netfs_clear_thp(page);
-		SetPageUptodate(page);
+	    prep_noread_page(page, pos, len)) {
 		netfs_stat(&netfs_n_rh_write_zskip);
 		goto have_page_no_wait;
 	}
-- 
2.31.1


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

