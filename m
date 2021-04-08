Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0FC358F0B
	for <lists+linux-cachefs@lfdr.de>; Thu,  8 Apr 2021 23:15:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617916544;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zVtcw1lc14OjdMkgA35J+kZsoH41+ht/erMa6OISn5Y=;
	b=JACeNDlYNXLhmwpXxO5/6SsxQuf8PswDfhCxVbYhQdLswr47PeiC7zwmPYWfRiG2DHYdJq
	Z38ldTfugNy5L7sZFgKPRQAdaPewCexdklOt9BmRystFD+MmXZxtv4smShexSMzG2BQYuN
	KPloGExDqY7xlz2a55C2dlN6MOC/jzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-ePtzV3FMOr29mAKoCyRM8w-1; Thu, 08 Apr 2021 17:15:42 -0400
X-MC-Unique: ePtzV3FMOr29mAKoCyRM8w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACA0A83DD21;
	Thu,  8 Apr 2021 21:15:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A82B5C1C4;
	Thu,  8 Apr 2021 21:15:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8CCF55345;
	Thu,  8 Apr 2021 21:15:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 138LFXO9010699 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 8 Apr 2021 17:15:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C5F3B60636; Thu,  8 Apr 2021 21:15:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-35.rdu2.redhat.com
	[10.10.119.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 752EF19CB4;
	Thu,  8 Apr 2021 21:15:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <46017.1617897451@warthog.procyon.org.uk>
References: <46017.1617897451@warthog.procyon.org.uk>
	<20210408145057.GN2531743@casper.infradead.org>
	<161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
	<161789066013.6155.9816857201817288382.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Thu, 08 Apr 2021 22:15:29 +0100
Message-ID: <136646.1617916529@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 138LFXO9010699
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [RFC][PATCH] mm: Split page_has_private() in two to
	better handle PG_private_2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <136645.1617916529.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Willy, Linus,

How about this to handle the situation with PG_private_2?  I think it handles
things according to Linus's suggestion.

David
---
mm: Split page_has_private() in two to better handle PG_private_2

Split page_has_private() into two functions:

 (1) page_needs_cleanup() to find out if a page needs the ->releasepage(),
     ->invalidatepage(), etc. address space ops calling upon it.

     This returns true when either PG_private or PG_private_2 are set.

 (2) page_private_count() which returns a count of the number of refs
     contributed to a page for attached private data.

     This returns 1 if PG_private is set and 0 otherwise.

I think the suggestion[1] is that PG_private_2 should just have a ref on
the page, but this isn't accounted in the same way as PG_private's ref.

Notes:

 (*) The following:

        btrfs_migratepage()
        iomap_set_range_uptodate()
        iomap_migrate_page()
        to_iomap_page()

     should probably all use PagePrivate() rather than page_has_private()
     since they're interested in what's attached to page->private when
     they're doing this, and not PG_private_2.

     It may not matter in these cases since page->private is probably NULL
     if PG_private is not set.

 (*) Do we actually need PG_private, or is it possible just to see if
     page->private is NULL?

 (*) There's a lot of "if (page_has_private()) try_to_release_page()"
     combos.  Does it make sense to create a inline function for this?

Signed-off-by: David Howells <dhowells@redhat.com>
Link: https://lore.kernel.org/linux-fsdevel/CAHk-=whWoJhGeMn85LOh9FX-5d2-Upzmv1m2ZmYxvD31TKpUTA@mail.gmail.com/ [1]
---
 fs/btrfs/disk-io.c             |    2 +-
 fs/btrfs/inode.c               |    2 +-
 fs/ext4/move_extent.c          |    8 ++++----
 fs/fuse/dev.c                  |    2 +-
 fs/iomap/buffered-io.c         |    6 +++---
 fs/splice.c                    |    2 +-
 include/linux/page-flags.h     |   17 +++++++++++++++--
 include/trace/events/pagemap.h |    2 +-
 mm/khugepaged.c                |    4 ++--
 mm/migrate.c                   |   10 +++++-----
 mm/readahead.c                 |    2 +-
 mm/truncate.c                  |   12 ++++++------
 mm/vmscan.c                    |   12 ++++++------
 13 files changed, 47 insertions(+), 34 deletions(-)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 41b718cfea40..d95f8d4b3004 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -936,7 +936,7 @@ static int btree_migratepage(struct address_space *mapping,
 	 * Buffers may be managed in a filesystem specific way.
 	 * We must have no buffers or drop them.
 	 */
-	if (page_has_private(page) &&
+	if (page_needs_cleanup(page) &&
 	    !try_to_release_page(page, GFP_KERNEL))
 		return -EAGAIN;
 	return migrate_page(mapping, newpage, page, mode);
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 7cdf65be3707..94f038d34f16 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -8333,7 +8333,7 @@ static int btrfs_migratepage(struct address_space *mapping,
 	if (ret != MIGRATEPAGE_SUCCESS)
 		return ret;
 
-	if (page_has_private(page))
+	if (PagePrivate(page))
 		attach_page_private(newpage, detach_page_private(page));
 
 	if (PagePrivate2(page)) {
diff --git a/fs/ext4/move_extent.c b/fs/ext4/move_extent.c
index 64a579734f93..16d0a7a73191 100644
--- a/fs/ext4/move_extent.c
+++ b/fs/ext4/move_extent.c
@@ -329,9 +329,9 @@ move_extent_per_page(struct file *o_filp, struct inode *donor_inode,
 			ext4_double_up_write_data_sem(orig_inode, donor_inode);
 			goto data_copy;
 		}
-		if ((page_has_private(pagep[0]) &&
+		if ((page_needs_cleanup(pagep[0]) &&
 		     !try_to_release_page(pagep[0], 0)) ||
-		    (page_has_private(pagep[1]) &&
+		    (page_needs_cleanup(pagep[1]) &&
 		     !try_to_release_page(pagep[1], 0))) {
 			*err = -EBUSY;
 			goto drop_data_sem;
@@ -351,8 +351,8 @@ move_extent_per_page(struct file *o_filp, struct inode *donor_inode,
 
 	/* At this point all buffers in range are uptodate, old mapping layout
 	 * is no longer required, try to drop it now. */
-	if ((page_has_private(pagep[0]) && !try_to_release_page(pagep[0], 0)) ||
-	    (page_has_private(pagep[1]) && !try_to_release_page(pagep[1], 0))) {
+	if ((page_needs_cleanup(pagep[0]) && !try_to_release_page(pagep[0], 0)) ||
+	    (page_needs_cleanup(pagep[1]) && !try_to_release_page(pagep[1], 0))) {
 		*err = -EBUSY;
 		goto unlock_pages;
 	}
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index c0fee830a34e..76e8ca9e47fa 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -837,7 +837,7 @@ static int fuse_try_move_page(struct fuse_copy_state *cs, struct page **pagep)
 	 */
 	if (WARN_ON(page_mapped(oldpage)))
 		goto out_fallback_unlock;
-	if (WARN_ON(page_has_private(oldpage)))
+	if (WARN_ON(page_needs_cleanup(oldpage)))
 		goto out_fallback_unlock;
 	if (WARN_ON(PageDirty(oldpage) || PageWriteback(oldpage)))
 		goto out_fallback_unlock;
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 414769a6ad11..9c89db033548 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -41,7 +41,7 @@ static inline struct iomap_page *to_iomap_page(struct page *page)
 	 */
 	VM_BUG_ON_PGFLAGS(PageTail(page), page);
 
-	if (page_has_private(page))
+	if (page_needs_cleanup(page))
 		return (struct iomap_page *)page_private(page);
 	return NULL;
 }
@@ -163,7 +163,7 @@ iomap_set_range_uptodate(struct page *page, unsigned off, unsigned len)
 	if (PageError(page))
 		return;
 
-	if (page_has_private(page))
+	if (PagePrivate(page))
 		iomap_iop_set_range_uptodate(page, off, len);
 	else
 		SetPageUptodate(page);
@@ -502,7 +502,7 @@ iomap_migrate_page(struct address_space *mapping, struct page *newpage,
 	if (ret != MIGRATEPAGE_SUCCESS)
 		return ret;
 
-	if (page_has_private(page))
+	if (PagePrivate(page))
 		attach_page_private(newpage, detach_page_private(page));
 
 	if (mode != MIGRATE_SYNC_NO_COPY)
diff --git a/fs/splice.c b/fs/splice.c
index 5dbce4dcc1a7..bf102bc947bb 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -65,7 +65,7 @@ static bool page_cache_pipe_buf_try_steal(struct pipe_inode_info *pipe,
 		 */
 		wait_on_page_writeback(page);
 
-		if (page_has_private(page) &&
+		if (page_needs_cleanup(page) &&
 		    !try_to_release_page(page, GFP_KERNEL))
 			goto out_unlock;
 
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 04a34c08e0a6..04cb440ce06e 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -832,14 +832,27 @@ static inline void ClearPageSlabPfmemalloc(struct page *page)
 
 #define PAGE_FLAGS_PRIVATE				\
 	(1UL << PG_private | 1UL << PG_private_2)
+
+/**
+ * page_private_count - Find out how many refs a page's private data contribute
+ * @page: The page to be checked
+ *
+ * Return the contribution to the pagecount of the private data attached to a
+ * page.
+ */
+static inline int page_private_count(struct page *page)
+{
+	return test_bit(PG_private, &page->flags) ? 1 : 0;
+}
+
 /**
- * page_has_private - Determine if page has private stuff
+ * page_needs_cleanup - Determine if page has private stuff that needs cleaning
  * @page: The page to be checked
  *
  * Determine if a page has private stuff, indicating that release routines
  * should be invoked upon it.
  */
-static inline int page_has_private(struct page *page)
+static inline int page_needs_cleanup(struct page *page)
 {
 	return !!(page->flags & PAGE_FLAGS_PRIVATE);
 }
diff --git a/include/trace/events/pagemap.h b/include/trace/events/pagemap.h
index e1735fe7c76a..3ff3404cc399 100644
--- a/include/trace/events/pagemap.h
+++ b/include/trace/events/pagemap.h
@@ -22,7 +22,7 @@
 	(PageSwapCache(page)	? PAGEMAP_SWAPCACHE  : 0) | \
 	(PageSwapBacked(page)	? PAGEMAP_SWAPBACKED : 0) | \
 	(PageMappedToDisk(page)	? PAGEMAP_MAPPEDDISK : 0) | \
-	(page_has_private(page) ? PAGEMAP_BUFFERS    : 0) \
+	(page_needs_cleanup(page) ? PAGEMAP_BUFFERS    : 0) \
 	)
 
 TRACE_EVENT(mm_lru_insertion,
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index a7d6cb912b05..d3b60a31aae2 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1822,7 +1822,7 @@ static void collapse_file(struct mm_struct *mm,
 			goto out_unlock;
 		}
 
-		if (page_has_private(page) &&
+		if (page_needs_cleanup(page) &&
 		    !try_to_release_page(page, GFP_KERNEL)) {
 			result = SCAN_PAGE_HAS_PRIVATE;
 			putback_lru_page(page);
@@ -2019,7 +2019,7 @@ static void khugepaged_scan_file(struct mm_struct *mm,
 		}
 
 		if (page_count(page) !=
-		    1 + page_mapcount(page) + page_has_private(page)) {
+		    1 + page_mapcount(page) + page_private_count(page)) {
 			result = SCAN_PAGE_COUNT;
 			break;
 		}
diff --git a/mm/migrate.c b/mm/migrate.c
index 62b81d5257aa..eafd73bea945 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -382,7 +382,7 @@ static int expected_page_refs(struct address_space *mapping, struct page *page)
 	 */
 	expected_count += is_device_private_page(page);
 	if (mapping)
-		expected_count += thp_nr_pages(page) + page_has_private(page);
+		expected_count += thp_nr_pages(page) + page_private_count(page);
 
 	return expected_count;
 }
@@ -530,7 +530,7 @@ int migrate_huge_page_move_mapping(struct address_space *mapping,
 	int expected_count;
 
 	xas_lock_irq(&xas);
-	expected_count = 2 + page_has_private(page);
+	expected_count = 2 + page_private_count(page);
 	if (page_count(page) != expected_count || xas_load(&xas) != page) {
 		xas_unlock_irq(&xas);
 		return -EAGAIN;
@@ -924,7 +924,7 @@ static int fallback_migrate_page(struct address_space *mapping,
 	 * Buffers may be managed in a filesystem specific way.
 	 * We must have no buffers or drop them.
 	 */
-	if (page_has_private(page) &&
+	if (page_needs_cleanup(page) &&
 	    !try_to_release_page(page, GFP_KERNEL))
 		return mode == MIGRATE_SYNC ? -EAGAIN : -EBUSY;
 
@@ -1117,7 +1117,7 @@ static int __unmap_and_move(struct page *page, struct page *newpage,
 	 */
 	if (!page->mapping) {
 		VM_BUG_ON_PAGE(PageAnon(page), page);
-		if (page_has_private(page)) {
+		if (page_needs_cleanup(page)) {
 			try_to_free_buffers(page);
 			goto out_unlock_both;
 		}
@@ -2618,7 +2618,7 @@ static bool migrate_vma_check_page(struct page *page)
 
 	/* For file back page */
 	if (page_mapping(page))
-		extra += 1 + page_has_private(page);
+		extra += 1 + page_private_count(page);
 
 	if ((page_count(page) - extra) > page_mapcount(page))
 		return false;
diff --git a/mm/readahead.c b/mm/readahead.c
index f02dbebf1cef..661295ec4669 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -48,7 +48,7 @@ EXPORT_SYMBOL_GPL(file_ra_state_init);
 static void read_cache_pages_invalidate_page(struct address_space *mapping,
 					     struct page *page)
 {
-	if (page_has_private(page)) {
+	if (page_needs_cleanup(page)) {
 		if (!trylock_page(page))
 			BUG();
 		page->mapping = mapping;
diff --git a/mm/truncate.c b/mm/truncate.c
index 455944264663..7cad4c79686b 100644
--- a/mm/truncate.c
+++ b/mm/truncate.c
@@ -176,7 +176,7 @@ truncate_cleanup_page(struct address_space *mapping, struct page *page)
 		unmap_mapping_pages(mapping, page->index, nr, false);
 	}
 
-	if (page_has_private(page))
+	if (page_needs_cleanup(page))
 		do_invalidatepage(page, 0, thp_size(page));
 
 	/*
@@ -204,7 +204,7 @@ invalidate_complete_page(struct address_space *mapping, struct page *page)
 	if (page->mapping != mapping)
 		return 0;
 
-	if (page_has_private(page) && !try_to_release_page(page, 0))
+	if (page_needs_cleanup(page) && !try_to_release_page(page, 0))
 		return 0;
 
 	ret = remove_mapping(mapping, page);
@@ -346,7 +346,7 @@ void truncate_inode_pages_range(struct address_space *mapping,
 			wait_on_page_writeback(page);
 			zero_user_segment(page, partial_start, top);
 			cleancache_invalidate_page(mapping, page);
-			if (page_has_private(page))
+			if (page_needs_cleanup(page))
 				do_invalidatepage(page, partial_start,
 						  top - partial_start);
 			unlock_page(page);
@@ -359,7 +359,7 @@ void truncate_inode_pages_range(struct address_space *mapping,
 			wait_on_page_writeback(page);
 			zero_user_segment(page, 0, partial_end);
 			cleancache_invalidate_page(mapping, page);
-			if (page_has_private(page))
+			if (page_needs_cleanup(page))
 				do_invalidatepage(page, 0,
 						  partial_end);
 			unlock_page(page);
@@ -581,14 +581,14 @@ invalidate_complete_page2(struct address_space *mapping, struct page *page)
 	if (page->mapping != mapping)
 		return 0;
 
-	if (page_has_private(page) && !try_to_release_page(page, GFP_KERNEL))
+	if (page_needs_cleanup(page) && !try_to_release_page(page, GFP_KERNEL))
 		return 0;
 
 	xa_lock_irqsave(&mapping->i_pages, flags);
 	if (PageDirty(page))
 		goto failed;
 
-	BUG_ON(page_has_private(page));
+	BUG_ON(page_needs_cleanup(page));
 	__delete_from_page_cache(page, NULL);
 	xa_unlock_irqrestore(&mapping->i_pages, flags);
 
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 562e87cbd7a1..4d9928e3446d 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -725,7 +725,7 @@ static inline int is_page_cache_freeable(struct page *page)
 	 * heads at page->private.
 	 */
 	int page_cache_pins = thp_nr_pages(page);
-	return page_count(page) - page_has_private(page) == 1 + page_cache_pins;
+	return page_count(page) - page_private_count(page) == 1 + page_cache_pins;
 }
 
 static int may_write_to_inode(struct inode *inode)
@@ -801,7 +801,7 @@ static pageout_t pageout(struct page *page, struct address_space *mapping)
 		 * Some data journaling orphaned pages can have
 		 * page->mapping == NULL while being dirty with clean buffers.
 		 */
-		if (page_has_private(page)) {
+		if (page_needs_cleanup(page)) {
 			if (try_to_free_buffers(page)) {
 				ClearPageDirty(page);
 				pr_info("%s: orphaned page\n", __func__);
@@ -1057,7 +1057,7 @@ static void page_check_dirty_writeback(struct page *page,
 	*writeback = PageWriteback(page);
 
 	/* Verify dirty/writeback state if the filesystem supports it */
-	if (!page_has_private(page))
+	if (!page_needs_cleanup(page))
 		return;
 
 	mapping = page_mapping(page);
@@ -1399,7 +1399,7 @@ static unsigned int shrink_page_list(struct list_head *page_list,
 		 * process address space (page_count == 1) it can be freed.
 		 * Otherwise, leave the page on the LRU so it is swappable.
 		 */
-		if (page_has_private(page)) {
+		if (page_needs_cleanup(page)) {
 			if (!try_to_release_page(page, sc->gfp_mask))
 				goto activate_locked;
 			if (!mapping && page_count(page) == 1) {
@@ -2050,8 +2050,8 @@ static void shrink_active_list(unsigned long nr_to_scan,
 		}
 
 		if (unlikely(buffer_heads_over_limit)) {
-			if (page_has_private(page) && trylock_page(page)) {
-				if (page_has_private(page))
+			if (page_needs_cleanup(page) && trylock_page(page)) {
+				if (page_needs_cleanup(page))
 					try_to_release_page(page, 0);
 				unlock_page(page);
 			}

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

