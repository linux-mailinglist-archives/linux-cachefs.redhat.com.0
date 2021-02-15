Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 758DE322845
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Feb 2021 10:59:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614074385;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pSqBfAj5G3KpSAgWk2uCsJKUlweG8x0JEajvYCjogPE=;
	b=AfR1Ky96wqw8LRw2mEXvMIsx3Aueitw9dNKzmOOumnj2Sy5IPts7FAq69KMrUEdHmpfLmp
	d9rxdyuC3YB9hX5FiwCVMqwN7MFUt6/SZC0mBlERX3CQIsWBdlodp/c80JIOK2z4nh9eeM
	k9/ej6owWze/7TRKrAxCWj7iIkjZaXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-i2dp5176O1K-iBKS8qyUUg-1; Tue, 23 Feb 2021 04:59:43 -0500
X-MC-Unique: i2dp5176O1K-iBKS8qyUUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB4FC81470A;
	Tue, 23 Feb 2021 09:59:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4D941972B;
	Tue, 23 Feb 2021 09:59:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8A8058079;
	Tue, 23 Feb 2021 09:59:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11FFnDwo023377 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 15 Feb 2021 10:49:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 703145D9CD; Mon, 15 Feb 2021 15:49:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com
	[10.10.119.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBA995D9C0;
	Mon, 15 Feb 2021 15:49:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Mon, 15 Feb 2021 15:49:01 +0000
Message-ID: <161340414102.1303470.9078891484034668985.stgit@warthog.procyon.org.uk>
In-Reply-To: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 23 Feb 2021 04:59:25 -0500
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 24/33] afs: Extract writeback extension into
	its own function
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Extract writeback extension into its own function to break up the writeback
function a bit.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-afs@lists.infradead.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
---

 fs/afs/write.c |  109 ++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 67 insertions(+), 42 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index e1791de90478..89c804bfe253 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -490,47 +490,25 @@ static int afs_store_data(struct afs_vnode *vnode, struct iov_iter *iter,
 }
 
 /*
- * Synchronously write back the locked page and any subsequent non-locked dirty
- * pages.
+ * Extend the region to be written back to include subsequent contiguously
+ * dirty pages if possible, but don't sleep while doing so.
+ *
+ * If this page holds new content, then we can include filler zeros in the
+ * writeback.
  */
-static int afs_write_back_from_locked_page(struct address_space *mapping,
-					   struct writeback_control *wbc,
-					   struct page *primary_page,
-					   pgoff_t final_page)
+static void afs_extend_writeback(struct address_space *mapping,
+				 struct afs_vnode *vnode,
+				 long *_count,
+				 pgoff_t start,
+				 pgoff_t final_page,
+				 unsigned *_offset,
+				 unsigned *_to,
+				 bool new_content)
 {
-	struct afs_vnode *vnode = AFS_FS_I(mapping->host);
-	struct iov_iter iter;
 	struct page *pages[8], *page;
-	unsigned long count, priv;
-	unsigned n, offset, to, f, t;
-	pgoff_t start, first, last;
-	loff_t i_size, pos, end;
-	int loop, ret;
-
-	_enter(",%lx", primary_page->index);
-
-	count = 1;
-	if (test_set_page_writeback(primary_page))
-		BUG();
-
-	/* Find all consecutive lockable dirty pages that have contiguous
-	 * written regions, stopping when we find a page that is not
-	 * immediately lockable, is not dirty or is missing, or we reach the
-	 * end of the range.
-	 */
-	start = primary_page->index;
-	priv = page_private(primary_page);
-	offset = afs_page_dirty_from(primary_page, priv);
-	to = afs_page_dirty_to(primary_page, priv);
-	trace_afs_page_dirty(vnode, tracepoint_string("store"), primary_page);
-
-	WARN_ON(offset == to);
-	if (offset == to)
-		trace_afs_page_dirty(vnode, tracepoint_string("WARN"), primary_page);
-
-	if (start >= final_page ||
-	    (to < PAGE_SIZE && !test_bit(AFS_VNODE_NEW_CONTENT, &vnode->flags)))
-		goto no_more;
+	unsigned long count = *_count, priv;
+	unsigned offset = *_offset, to = *_to, n, f, t;
+	int loop;
 
 	start++;
 	do {
@@ -551,8 +529,7 @@ static int afs_write_back_from_locked_page(struct address_space *mapping,
 
 		for (loop = 0; loop < n; loop++) {
 			page = pages[loop];
-			if (to != PAGE_SIZE &&
-			    !test_bit(AFS_VNODE_NEW_CONTENT, &vnode->flags))
+			if (to != PAGE_SIZE && !new_content)
 				break;
 			if (page->index > final_page)
 				break;
@@ -566,8 +543,7 @@ static int afs_write_back_from_locked_page(struct address_space *mapping,
 			priv = page_private(page);
 			f = afs_page_dirty_from(page, priv);
 			t = afs_page_dirty_to(page, priv);
-			if (f != 0 &&
-			    !test_bit(AFS_VNODE_NEW_CONTENT, &vnode->flags)) {
+			if (f != 0 && !new_content) {
 				unlock_page(page);
 				break;
 			}
@@ -593,6 +569,55 @@ static int afs_write_back_from_locked_page(struct address_space *mapping,
 	} while (start <= final_page && count < 65536);
 
 no_more:
+	*_count = count;
+	*_offset = offset;
+	*_to = to;
+}
+
+/*
+ * Synchronously write back the locked page and any subsequent non-locked dirty
+ * pages.
+ */
+static int afs_write_back_from_locked_page(struct address_space *mapping,
+					   struct writeback_control *wbc,
+					   struct page *primary_page,
+					   pgoff_t final_page)
+{
+	struct afs_vnode *vnode = AFS_FS_I(mapping->host);
+	struct iov_iter iter;
+	unsigned long count, priv;
+	unsigned offset, to;
+	pgoff_t start, first, last;
+	loff_t i_size, pos, end;
+	bool new_content = test_bit(AFS_VNODE_NEW_CONTENT, &vnode->flags);
+	int ret;
+
+	_enter(",%lx", primary_page->index);
+
+	count = 1;
+	if (test_set_page_writeback(primary_page))
+		BUG();
+
+	/* Find all consecutive lockable dirty pages that have contiguous
+	 * written regions, stopping when we find a page that is not
+	 * immediately lockable, is not dirty or is missing, or we reach the
+	 * end of the range.
+	 */
+	start = primary_page->index;
+	priv = page_private(primary_page);
+	offset = afs_page_dirty_from(primary_page, priv);
+	to = afs_page_dirty_to(primary_page, priv);
+	trace_afs_page_dirty(vnode, tracepoint_string("store"), primary_page);
+
+	WARN_ON(offset == to);
+	if (offset == to)
+		trace_afs_page_dirty(vnode, tracepoint_string("WARN"), primary_page);
+
+	if (start < final_page &&
+	    (to == PAGE_SIZE || new_content))
+		afs_extend_writeback(mapping, vnode, &count, start, final_page,
+				     &offset, &to, new_content);
+
 	/* We now have a contiguous set of dirty pages, each with writeback
 	 * set; the first page is still locked at this point, but all the rest
 	 * have been unlocked.


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

