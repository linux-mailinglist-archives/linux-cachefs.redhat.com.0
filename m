Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B8EE82BAD45
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 16:16:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605885402;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gLVDIjbxClbMzBes1U/WOki1nz92H4lNvS88RP3A3zo=;
	b=Y5Qb1QCTMYmNNmG7UN2dp+391wTrLEOFoN/XFzuAP0ATWxAkiJR9vxJ7DBadcO/XmFs+iG
	AUEwzOonztdZkM9oeH2zv5/uTmhCus88CDNrhDZ+tUh7KLt6SjiN1r6vDw/t4K9XbZJ4QO
	I7tHOUyUr9RNwM84xnOqKUXh4YWPbmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-gKyKqTnyMB-A0Agxg2XKpw-1; Fri, 20 Nov 2020 10:16:41 -0500
X-MC-Unique: gKyKqTnyMB-A0Agxg2XKpw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C6E481E24C;
	Fri, 20 Nov 2020 15:16:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AF0960BD8;
	Fri, 20 Nov 2020 15:16:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66FD74EE7F;
	Fri, 20 Nov 2020 15:16:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKFGbmg015319 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 10:16:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 08DA05C22A; Fri, 20 Nov 2020 15:16:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-246.rdu2.redhat.com
	[10.10.112.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FA155C233;
	Fri, 20 Nov 2020 15:16:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Fri, 20 Nov 2020 15:16:24 +0000
Message-ID: <160588538471.3465195.782513375683399583.stgit@warthog.procyon.org.uk>
In-Reply-To: <160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk>
References: <160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [RFC PATCH 64/76] afs: Extract writeback extension
 into its own function
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

Extract writeback extension into its own function to break up the writeback
function a bit.

Signed-off-by: David Howells <dhowells@redhat.com>
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
https://www.redhat.com/mailman/listinfo/linux-cachefs

