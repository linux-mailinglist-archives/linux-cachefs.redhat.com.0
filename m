Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D27C1699853
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Feb 2023 16:07:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676560036;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fWi51Z70+2oMAkzkJP0j9RY/G/3mvU4/dIsPanrAoT4=;
	b=SpQn9kVU4ksXCQI7ODQR4RKhIWwdmbC+wAdg5X6ATG5Vx/YAnfH2YKC1zqWMVfDlPSO/A/
	M5Rx7Ec9k0OPrmb0ycj+pQNbNuPNbIF6N+L4TXtI7BNIB4pl5uETWmbkfALMKLU4yd8pgM
	/FP4OzQM6P4Q4AT0wB0zbdgYZ588Xog=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-zRFiaWkhOoyRRPo1Hdrt4g-1; Thu, 16 Feb 2023 10:07:13 -0500
X-MC-Unique: zRFiaWkhOoyRRPo1Hdrt4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A56DE38012F2;
	Thu, 16 Feb 2023 15:07:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B739140EBF6;
	Thu, 16 Feb 2023 15:07:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 87C61194658D;
	Thu, 16 Feb 2023 15:07:12 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AB2861946588 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 16 Feb 2023 15:07:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9BE1C2166B33; Thu, 16 Feb 2023 15:07:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAD9E2166B30;
 Thu, 16 Feb 2023 15:07:07 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Matthew Wilcox <willy@infradead.org>
Date: Thu, 16 Feb 2023 15:07:00 +0000
Message-Id: <20230216150701.3654894-2-dhowells@redhat.com>
In-Reply-To: <20230216150701.3654894-1-dhowells@redhat.com>
References: <20230216150701.3654894-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH v6 1/2] mm: Merge
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
 Christoph Hellwig <hch@infradead.org>, linux-cachefs@redhat.com,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Rohith Surabattula <rohiths.msft@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
index 8dbb87edf24c..dedc9d445f24 100644
--- a/fs/ext4/move_extent.c
+++ b/fs/ext4/move_extent.c
@@ -339,10 +339,8 @@ move_extent_per_page(struct file *o_filp, struct inode *donor_inode,
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
@@ -361,10 +359,8 @@ move_extent_per_page(struct file *o_filp, struct inode *donor_inode,
 
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
index 5969b7a1d353..e69eddaf9d7c 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -65,8 +65,7 @@ static bool page_cache_pipe_buf_try_steal(struct pipe_inode_info *pipe,
 		 */
 		folio_wait_writeback(folio);
 
-		if (folio_has_private(folio) &&
-		    !filemap_release_folio(folio, GFP_KERNEL))
+		if (!filemap_release_folio(folio, GFP_KERNEL))
 			goto out_unlock;
 
 		/*
diff --git a/mm/filemap.c b/mm/filemap.c
index c4d4ace9cc70..344146c170b0 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3960,6 +3960,8 @@ bool filemap_release_folio(struct folio *folio, gfp_t gfp)
 	struct address_space * const mapping = folio->mapping;
 
 	BUG_ON(!folio_test_locked(folio));
+	if (!folio_needs_release(folio))
+		return true;
 	if (folio_test_writeback(folio))
 		return false;
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index abe6cfd92ffa..8490c42dedb3 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2702,8 +2702,7 @@ int split_huge_page_to_list(struct page *page, struct list_head *list)
 		gfp = current_gfp_context(mapping_gfp_mask(mapping) &
 							GFP_RECLAIM_MASK);
 
-		if (folio_test_private(folio) &&
-				!filemap_release_folio(folio, gfp)) {
+		if (!filemap_release_folio(folio, gfp)) {
 			ret = -EBUSY;
 			goto out;
 		}
diff --git a/mm/internal.h b/mm/internal.h
index bcf75a8b032d..c4c8e58e1d12 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -163,6 +163,14 @@ static inline void set_page_refcounted(struct page *page)
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
index 90acfea40c13..e257e0a13ad1 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1944,8 +1944,7 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
 			goto out_unlock;
 		}
 
-		if (folio_has_private(folio) &&
-		    !filemap_release_folio(folio, GFP_KERNEL)) {
+		if (!filemap_release_folio(folio, GFP_KERNEL)) {
 			result = SCAN_PAGE_HAS_PRIVATE;
 			folio_putback_lru(folio);
 			goto out_unlock;
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index c77a9e37e27e..a4f809c11ae9 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -843,14 +843,12 @@ static int truncate_error_page(struct page *p, unsigned long pfn,
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
index a4d3fc65085f..db867bb80128 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -915,8 +915,7 @@ static int fallback_migrate_folio(struct address_space *mapping,
 	 * Buffers may be managed in a filesystem specific way.
 	 * We must have no buffers or drop them.
 	 */
-	if (folio_test_private(src) &&
-	    !filemap_release_folio(src, GFP_KERNEL))
+	if (!filemap_release_folio(src, GFP_KERNEL))
 		return mode == MIGRATE_SYNC ? -EAGAIN : -EBUSY;
 
 	return migrate_folio(mapping, dst, src, mode);
diff --git a/mm/truncate.c b/mm/truncate.c
index 7b4ea4c4a46b..8378aabb5294 100644
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
@@ -573,8 +572,7 @@ static int invalidate_complete_folio2(struct address_space *mapping,
 	if (folio->mapping != mapping)
 		return 0;
 
-	if (folio_has_private(folio) &&
-	    !filemap_release_folio(folio, GFP_KERNEL))
+	if (!filemap_release_folio(folio, GFP_KERNEL))
 		return 0;
 
 	spin_lock(&mapping->host->i_lock);
diff --git a/mm/vmscan.c b/mm/vmscan.c
index bf3eedf0209c..0fd6623adccb 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1996,7 +1996,7 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 		 * (refcount == 1) it can be freed.  Otherwise, leave
 		 * the folio on the LRU so it is swappable.
 		 */
-		if (folio_has_private(folio)) {
+		if (folio_needs_release(folio)) {
 			if (!filemap_release_folio(folio, sc->gfp_mask))
 				goto activate_locked;
 			if (!mapping && folio_ref_count(folio) == 1) {
@@ -2641,9 +2641,9 @@ static void shrink_active_list(unsigned long nr_to_scan,
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

