Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E3D740F36
	for <lists+linux-cachefs@lfdr.de>; Wed, 28 Jun 2023 12:49:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687949365;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PPapdYe62ZcVlbUMlApogENcPAjfI4zk5fe9/Vho1hk=;
	b=dIxS1LGXKUGMIRUz6gWsJXZEwwLCNB+4U6YrBMJvR9rNx9mKgolMyTvs06avP7l3yJAF4i
	x69WFo0Q5Jy16qk/FxfyyNjHR+VKO6LBzlrxRib2es/m182Q1MjDOewcTMEWr6vta02G0D
	ZYf4RnSb4xvd2o90F5TPf1nhBXHFqp4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-wuBjRQ7dOgawi0CubaHs3g-1; Wed, 28 Jun 2023 06:49:22 -0400
X-MC-Unique: wuBjRQ7dOgawi0CubaHs3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 564523C01DF0;
	Wed, 28 Jun 2023 10:49:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D8A9111F3B0;
	Wed, 28 Jun 2023 10:49:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5FC3019465B8;
	Wed, 28 Jun 2023 10:49:11 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4F7AE1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 28 Jun 2023 10:49:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3644140C2071; Wed, 28 Jun 2023 10:49:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6153F40C2063;
 Wed, 28 Jun 2023 10:48:57 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 28 Jun 2023 11:48:51 +0100
Message-ID: <20230628104852.3391651-2-dhowells@redhat.com>
In-Reply-To: <20230628104852.3391651-1-dhowells@redhat.com>
References: <20230628104852.3391651-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Linux-cachefs] [PATCH v7 1/2] mm: Merge
 folio_has_private()/filemap_release_folio() call pairs
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
Cc: Dominique Martinet <asmadeus@codewreck.org>, linux-mm@kvack.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-afs@lists.infradead.org,
 Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 linux-cachefs@redhat.com, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Rohith Surabattula <rohiths.msft@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jeff Layton <jlayton@kernel.org>, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make filemap_release_folio() check folio_has_private().  Then, in most
cases, where a call to folio_has_private() is immediately followed by a
call to filemap_release_folio(), we can get rid of the test in the pair.

There are a couple of sites in mm/vscan.c that this can't so easily be
done.  In shrink_folio_list(), there are actually three cases (something
different is done for incompletely invalidated buffers), but
filemap_release_folio() elides two of them.

In shrink_active_list(), we don't have have the folio lock yet, so the
check allows us to avoid locking the page unnecessarily.

A wrapper function to check if a folio needs release is provided for those
places that still need to do it in the mm/ directory.  This will acquire
additional parts to the condition in a future patch.

After this, the only remaining caller of folio_has_private() outside of mm/
is a check in fuse.

Reported-by: Rohith Surabattula <rohiths.msft@gmail.com>
Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Matthew Wilcox <willy@infradead.org>
cc: Linus Torvalds <torvalds@linux-foundation.org>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Dave Wysochanski <dwysocha@redhat.com>
cc: Dominique Martinet <asmadeus@codewreck.org>
cc: Ilya Dryomov <idryomov@gmail.com>
cc: "Theodore Ts'o" <tytso@mit.edu>
cc: Andreas Dilger <adilger.kernel@dilger.ca>
cc: linux-cachefs@redhat.com
cc: linux-cifs@vger.kernel.org
cc: linux-afs@lists.infradead.org
cc: v9fs-developer@lists.sourceforge.net
cc: ceph-devel@vger.kernel.org
cc: linux-nfs@vger.kernel.org
cc: linux-ext4@vger.kernel.org
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---

Notes:
    ver #5)
     - Rebased on linus/master.  try_to_release_page() has now been entirely
       replaced by filemap_release_folio(), barring one comment.
     - Cleaned up some pairs in ext4.
    
    ver #4)
     - Split from fscache fix.
     - Moved folio_needs_release() to mm/internal.h and removed open-coded
       version from filemap_release_folio().
    
    ver #3)
     - Fixed mapping_clear_release_always() to use clear_bit() not set_bit().
     - Moved a '&&' to the correct line.
    
    ver #2)
     - Rewrote entirely according to Willy's suggestion[1].

 fs/ext4/move_extent.c | 12 ++++--------
 fs/splice.c           |  3 +--
 mm/filemap.c          |  2 ++
 mm/huge_memory.c      |  3 +--
 mm/internal.h         |  8 ++++++++
 mm/khugepaged.c       |  3 +--
 mm/memory-failure.c   |  8 +++-----
 mm/migrate.c          |  3 +--
 mm/truncate.c         |  6 ++----
 mm/vmscan.c           |  8 ++++----
 10 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/fs/ext4/move_extent.c b/fs/ext4/move_extent.c
index b5af2fc03b2f..251584a23d05 100644
--- a/fs/ext4/move_extent.c
+++ b/fs/ext4/move_extent.c
@@ -340,10 +340,8 @@ move_extent_per_page(struct file *o_filp, struct inode *donor_inode,
 			ext4_double_up_write_data_sem(orig_inode, donor_inode);
 			goto data_copy;
 		}
-		if ((folio_has_private(folio[0]) &&
-		     !filemap_release_folio(folio[0], 0)) ||
-		    (folio_has_private(folio[1]) &&
-		     !filemap_release_folio(folio[1], 0))) {
+		if (!filemap_release_folio(folio[0], 0) ||
+		    !filemap_release_folio(folio[1], 0)) {
 			*err = -EBUSY;
 			goto drop_data_sem;
 		}
@@ -362,10 +360,8 @@ move_extent_per_page(struct file *o_filp, struct inode *donor_inode,
 
 	/* At this point all buffers in range are uptodate, old mapping layout
 	 * is no longer required, try to drop it now. */
-	if ((folio_has_private(folio[0]) &&
-		!filemap_release_folio(folio[0], 0)) ||
-	    (folio_has_private(folio[1]) &&
-		!filemap_release_folio(folio[1], 0))) {
+	if (!filemap_release_folio(folio[0], 0) ||
+	    !filemap_release_folio(folio[1], 0)) {
 		*err = -EBUSY;
 		goto unlock_folios;
 	}
diff --git a/fs/splice.c b/fs/splice.c
index 7a9565d8ec4f..6412848891df 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -82,8 +82,7 @@ static bool page_cache_pipe_buf_try_steal(struct pipe_inode_info *pipe,
 		 */
 		folio_wait_writeback(folio);
 
-		if (folio_has_private(folio) &&
-		    !filemap_release_folio(folio, GFP_KERNEL))
+		if (!filemap_release_folio(folio, GFP_KERNEL))
 			goto out_unlock;
 
 		/*
diff --git a/mm/filemap.c b/mm/filemap.c
index 00f01d8ead47..31d07c2f8d32 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -4134,6 +4134,8 @@ bool filemap_release_folio(struct folio *folio, gfp_t gfp)
 	struct address_space * const mapping = folio->mapping;
 
 	BUG_ON(!folio_test_locked(folio));
+	if (!folio_needs_release(folio))
+		return true;
 	if (folio_test_writeback(folio))
 		return false;
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 624671aaa60d..a14b3d1af9d7 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2688,8 +2688,7 @@ int split_huge_page_to_list(struct page *page, struct list_head *list)
 		gfp = current_gfp_context(mapping_gfp_mask(mapping) &
 							GFP_RECLAIM_MASK);
 
-		if (folio_test_private(folio) &&
-				!filemap_release_folio(folio, gfp)) {
+		if (!filemap_release_folio(folio, gfp)) {
 			ret = -EBUSY;
 			goto out;
 		}
diff --git a/mm/internal.h b/mm/internal.h
index e6029d94bdb2..a76314764d8c 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -170,6 +170,14 @@ static inline void set_page_refcounted(struct page *page)
 	set_page_count(page, 1);
 }
 
+/*
+ * Return true if a folio needs ->release_folio() calling upon it.
+ */
+static inline bool folio_needs_release(struct folio *folio)
+{
+	return folio_has_private(folio);
+}
+
 extern unsigned long highest_memmap_pfn;
 
 /*
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 2d0d58fb4e7f..1e6e6a25cd52 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2058,8 +2058,7 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
 			goto out_unlock;
 		}
 
-		if (folio_has_private(folio) &&
-		    !filemap_release_folio(folio, GFP_KERNEL)) {
+		if (!filemap_release_folio(folio, GFP_KERNEL)) {
 			result = SCAN_PAGE_HAS_PRIVATE;
 			folio_putback_lru(folio);
 			goto out_unlock;
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 5b663eca1f29..38321eb85fb2 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -944,14 +944,12 @@ static int truncate_error_page(struct page *p, unsigned long pfn,
 		struct folio *folio = page_folio(p);
 		int err = mapping->a_ops->error_remove_page(mapping, p);
 
-		if (err != 0) {
+		if (err != 0)
 			pr_info("%#lx: Failed to punch page: %d\n", pfn, err);
-		} else if (folio_has_private(folio) &&
-			   !filemap_release_folio(folio, GFP_NOIO)) {
+		else if (!filemap_release_folio(folio, GFP_NOIO))
 			pr_info("%#lx: failed to release buffers\n", pfn);
-		} else {
+		else
 			ret = MF_RECOVERED;
-		}
 	} else {
 		/*
 		 * If the file system doesn't support it just invalidate
diff --git a/mm/migrate.c b/mm/migrate.c
index 01cac26a3127..5fc27d1a7eaf 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -929,8 +929,7 @@ static int fallback_migrate_folio(struct address_space *mapping,
 	 * Buffers may be managed in a filesystem specific way.
 	 * We must have no buffers or drop them.
 	 */
-	if (folio_test_private(src) &&
-	    !filemap_release_folio(src, GFP_KERNEL))
+	if (!filemap_release_folio(src, GFP_KERNEL))
 		return mode == MIGRATE_SYNC ? -EAGAIN : -EBUSY;
 
 	return migrate_folio(mapping, dst, src, mode);
diff --git a/mm/truncate.c b/mm/truncate.c
index 86de31ed4d32..6fb830369829 100644
--- a/mm/truncate.c
+++ b/mm/truncate.c
@@ -19,7 +19,6 @@
 #include <linux/highmem.h>
 #include <linux/pagevec.h>
 #include <linux/task_io_accounting_ops.h>
-#include <linux/buffer_head.h>	/* grr. try_to_release_page */
 #include <linux/shmem_fs.h>
 #include <linux/rmap.h>
 #include "internal.h"
@@ -276,7 +275,7 @@ static long mapping_evict_folio(struct address_space *mapping,
 	if (folio_ref_count(folio) >
 			folio_nr_pages(folio) + folio_has_private(folio) + 1)
 		return 0;
-	if (folio_has_private(folio) && !filemap_release_folio(folio, 0))
+	if (!filemap_release_folio(folio, 0))
 		return 0;
 
 	return remove_mapping(mapping, folio);
@@ -574,8 +573,7 @@ static int invalidate_complete_folio2(struct address_space *mapping,
 	if (folio->mapping != mapping)
 		return 0;
 
-	if (folio_has_private(folio) &&
-	    !filemap_release_folio(folio, GFP_KERNEL))
+	if (!filemap_release_folio(folio, GFP_KERNEL))
 		return 0;
 
 	spin_lock(&mapping->host->i_lock);
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 5bf98d0a22c9..49bc412b31a2 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2058,7 +2058,7 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 		 * (refcount == 1) it can be freed.  Otherwise, leave
 		 * the folio on the LRU so it is swappable.
 		 */
-		if (folio_has_private(folio)) {
+		if (folio_needs_release(folio)) {
 			if (!filemap_release_folio(folio, sc->gfp_mask))
 				goto activate_locked;
 			if (!mapping && folio_ref_count(folio) == 1) {
@@ -2703,9 +2703,9 @@ static void shrink_active_list(unsigned long nr_to_scan,
 		}
 
 		if (unlikely(buffer_heads_over_limit)) {
-			if (folio_test_private(folio) && folio_trylock(folio)) {
-				if (folio_test_private(folio))
-					filemap_release_folio(folio, 0);
+			if (folio_needs_release(folio) &&
+			    folio_trylock(folio)) {
+				filemap_release_folio(folio, 0);
 				folio_unlock(folio);
 			}
 		}
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

