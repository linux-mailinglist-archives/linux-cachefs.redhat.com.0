Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D5A7935868E
	for <lists+linux-cachefs@lfdr.de>; Thu,  8 Apr 2021 16:14:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617891282;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xCD1l9ywIJOK2tobB9PtMGM45MqUEYN2jc3BjKz83ss=;
	b=MpqV1gxH674OxGKsAvc4m570cMq12AhRfYYpbubENrg0uguWrdj7Wx2hEIF7hY5j8eocne
	lWtTjpJIXYLpb1ldCk0TBTkxPzVZElf35IYNN5Grq29Q0mpWVPuKMZx9PRk6mfMEw52QzX
	LeVUNJs8nAqgSJa7ITi/EiDX5qvuXFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-HucOqjuyMBCCocRj6t8NIQ-1; Thu, 08 Apr 2021 10:14:40 -0400
X-MC-Unique: HucOqjuyMBCCocRj6t8NIQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E90483DD25;
	Thu,  8 Apr 2021 14:14:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 909305B69B;
	Thu,  8 Apr 2021 14:14:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 799B055350;
	Thu,  8 Apr 2021 14:14:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 138E9fpC027731 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 8 Apr 2021 10:09:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DEEAE60C0F; Thu,  8 Apr 2021 14:09:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-35.rdu2.redhat.com
	[10.10.119.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2606460BF1;
	Thu,  8 Apr 2021 14:09:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-fsdevel@vger.kernel.org
Date: Thu, 08 Apr 2021 15:09:31 +0100
Message-ID: <161789097132.6155.4916609419912731964.stgit@warthog.procyon.org.uk>
In-Reply-To: <161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
References: <161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 08 Apr 2021 10:14:30 -0400
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: [Linux-cachefs] [PATCH v6 26/30] afs: Extract writeback extension
 into its own function
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Link: https://lore.kernel.org/r/160588538471.3465195.782513375683399583.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/161118154610.1232039.1765365632920504822.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/161161050546.2537118.2202554806419189453.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/161340414102.1303470.9078891484034668985.stgit@warthog.procyon.org.uk/ # v3
Link: https://lore.kernel.org/r/161539558417.286939.2879469588895925399.stgit@warthog.procyon.org.uk/ # v4
Link: https://lore.kernel.org/r/161653813972.2770958.12671731209438112378.stgit@warthog.procyon.org.uk/ # v5
---

 fs/afs/write.c |  109 ++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 67 insertions(+), 42 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index 1b8cabf5ac92..4ccd2c263983 100644
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

