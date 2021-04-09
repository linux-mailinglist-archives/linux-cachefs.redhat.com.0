Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2687E35A695
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 21:03:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-LbnMeTvKP7SNDSmk7_3Haw-1; Fri, 09 Apr 2021 15:03:20 -0400
X-MC-Unique: LbnMeTvKP7SNDSmk7_3Haw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8EEC10074CB;
	Fri,  9 Apr 2021 19:03:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65D7384410;
	Fri,  9 Apr 2021 19:03:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32D4F18095C9;
	Fri,  9 Apr 2021 19:03:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139J3BbN019425 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 15:03:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0DA35106A4B; Fri,  9 Apr 2021 19:03:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 084741032BB
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 19:03:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3812811E7F
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 19:03:08 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-407-pESqZ2wNPvyQa4T92RZnnA-1; Fri, 09 Apr 2021 15:03:04 -0400
X-MC-Unique: pESqZ2wNPvyQa4T92RZnnA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lUwNI-000nwF-Re; Fri, 09 Apr 2021 19:01:19 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Fri,  9 Apr 2021 19:50:51 +0100
Message-Id: <20210409185105.188284-15-willy@infradead.org>
In-Reply-To: <20210409185105.188284-1-willy@infradead.org>
References: <20210409185105.188284-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH v7 14/28] mm/util: Add folio_mapping and
	folio_file_mapping
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These are the folio equivalent of page_mapping() and page_file_mapping().
Add an out-of-line page_mapping() wrapper around folio_mapping()
in order to prevent the page_folio() call from bloating every caller
of page_mapping().  Adjust page_file_mapping() and page_mapping_file()
to use folios internally.  Rename __page_file_mapping() to
swapcache_mapping() and change it to take a folio.

This ends up saving 186 bytes of text overall.  folio_mapping() is
45 bytes shorter than page_mapping() was, but the new page_mapping()
wrapper is 30 bytes.  The major reduction is a few bytes less in dozens
of nfs functions (which call page_file_mapping()).  Most of these appear
to be a slight change in gcc's register allocation decisions, which allow:

   48 8b 56 08         mov    0x8(%rsi),%rdx
   48 8d 42 ff         lea    -0x1(%rdx),%rax
   83 e2 01            and    $0x1,%edx
   48 0f 44 c6         cmove  %rsi,%rax

to become:

   48 8b 46 08         mov    0x8(%rsi),%rax
   48 8d 78 ff         lea    -0x1(%rax),%rdi
   a8 01               test   $0x1,%al
   48 0f 44 fe         cmove  %rsi,%rdi

for a reduction of a single byte.  Once the NFS client is converted to
use folios, this entire sequence will disappear.

Also add folio_mapping() documentation.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Jeff Layton <jlayton@kernel.org>
---
 Documentation/core-api/mm-api.rst |  2 ++
 include/linux/mm.h                | 14 -------------
 include/linux/pagemap.h           | 35 +++++++++++++++++++++++++++++--
 include/linux/swap.h              |  6 ++++++
 mm/Makefile                       |  2 +-
 mm/folio-compat.c                 | 13 ++++++++++++
 mm/swapfile.c                     |  8 +++----
 mm/util.c                         | 30 +++++++++++++++-----------
 8 files changed, 77 insertions(+), 33 deletions(-)
 create mode 100644 mm/folio-compat.c

diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index 1ead2570b217..b1f4e6d52199 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -98,3 +98,5 @@ More Memory Management Functions
 .. kernel-doc:: include/linux/mm.h
    :internal:
 .. kernel-doc:: include/linux/page_ref.h
+.. kernel-doc:: mm/util.c
+   :functions: folio_mapping
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 67d9104c1cc1..143b354c3f4a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1749,19 +1749,6 @@ void page_address_init(void);
 
 extern void *page_rmapping(struct page *page);
 extern struct anon_vma *page_anon_vma(struct page *page);
-extern struct address_space *page_mapping(struct page *page);
-
-extern struct address_space *__page_file_mapping(struct page *);
-
-static inline
-struct address_space *page_file_mapping(struct page *page)
-{
-	if (unlikely(PageSwapCache(page)))
-		return __page_file_mapping(page);
-
-	return page->mapping;
-}
-
 extern pgoff_t __page_file_index(struct page *page);
 
 /*
@@ -1776,7 +1763,6 @@ static inline pgoff_t page_index(struct page *page)
 }
 
 bool page_mapped(struct page *page);
-struct address_space *page_mapping(struct page *page);
 
 /*
  * Return true only if the page has been allocated with
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index c15e72ee9ea8..f8150dfbf110 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -162,14 +162,45 @@ static inline void filemap_nr_thps_dec(struct address_space *mapping)
 
 void release_pages(struct page **pages, int nr);
 
+struct address_space *page_mapping(struct page *);
+struct address_space *folio_mapping(struct folio *);
+struct address_space *swapcache_mapping(struct folio *);
+
+/**
+ * folio_file_mapping - Find the mapping this folio belongs to.
+ * @folio: The folio.
+ *
+ * For folios which are in the page cache, return the mapping that this
+ * page belongs to.  Folios in the swap cache return the mapping of the
+ * swap file or swap device where the data is stored.  This is different
+ * from the mapping returned by folio_mapping().  The only reason to
+ * use it is if, like NFS, you return 0 from ->activate_swapfile.
+ *
+ * Do not call this for folios which aren't in the page cache or swap cache.
+ */
+static inline struct address_space *folio_file_mapping(struct folio *folio)
+{
+	if (unlikely(FolioSwapCache(folio)))
+		return swapcache_mapping(folio);
+
+	return folio->mapping;
+}
+
+static inline struct address_space *page_file_mapping(struct page *page)
+{
+	return folio_file_mapping(page_folio(page));
+}
+
 /*
  * For file cache pages, return the address_space, otherwise return NULL
  */
 static inline struct address_space *page_mapping_file(struct page *page)
 {
-	if (unlikely(PageSwapCache(page)))
+	struct folio *folio = page_folio(page);
+
+	if (unlikely(FolioSwapCache(folio)))
 		return NULL;
-	return page_mapping(page);
+	return folio_mapping(folio);
 }
 
 /*
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 144727041e78..20766342845b 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -314,6 +314,12 @@ struct vma_swap_readahead {
 #endif
 };
 
+static inline swp_entry_t folio_swap_entry(struct folio *folio)
+{
+	swp_entry_t entry = { .val = page_private(&folio->page) };
+	return entry;
+}
+
 /* linux/mm/workingset.c */
 void workingset_age_nonresident(struct lruvec *lruvec, unsigned long nr_pages);
 void *workingset_eviction(struct page *page, struct mem_cgroup *target_memcg);
diff --git a/mm/Makefile b/mm/Makefile
index a9ad6122d468..434c2a46b6c5 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -46,7 +46,7 @@ mmu-$(CONFIG_MMU)	+= process_vm_access.o
 endif
 
 obj-y			:= filemap.o mempool.o oom_kill.o fadvise.o \
-			   maccess.o page-writeback.o \
+			   maccess.o page-writeback.o folio-compat.o \
 			   readahead.o swap.o truncate.o vmscan.o shmem.o \
 			   util.o mmzone.o vmstat.o backing-dev.o \
 			   mm_init.o percpu.o slab_common.o \
diff --git a/mm/folio-compat.c b/mm/folio-compat.c
new file mode 100644
index 000000000000..5e107aa30a62
--- /dev/null
+++ b/mm/folio-compat.c
@@ -0,0 +1,13 @@
+/*
+ * Compatibility functions which bloat the callers too much to make inline.
+ * All of the callers of these functions should be converted to use folios
+ * eventually.
+ */
+
+#include <linux/pagemap.h>
+
+struct address_space *page_mapping(struct page *page)
+{
+	return folio_mapping(page_folio(page));
+}
+EXPORT_SYMBOL(page_mapping);
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 149e77454e3c..d0ee24239a83 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3533,13 +3533,13 @@ struct swap_info_struct *page_swap_info(struct page *page)
 }
 
 /*
- * out-of-line __page_file_ methods to avoid include hell.
+ * out-of-line methods to avoid include hell.
  */
-struct address_space *__page_file_mapping(struct page *page)
+struct address_space *swapcache_mapping(struct folio *folio)
 {
-	return page_swap_info(page)->swap_file->f_mapping;
+	return page_swap_info(&folio->page)->swap_file->f_mapping;
 }
-EXPORT_SYMBOL_GPL(__page_file_mapping);
+EXPORT_SYMBOL_GPL(swapcache_mapping);
 
 pgoff_t __page_file_index(struct page *page)
 {
diff --git a/mm/util.c b/mm/util.c
index 0b6dd9d81da7..f9e04471a8d9 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -686,30 +686,36 @@ struct anon_vma *page_anon_vma(struct page *page)
 	return __page_rmapping(page);
 }
 
-struct address_space *page_mapping(struct page *page)
+/**
+ * folio_mapping - Find the mapping where this folio is stored.
+ * @folio: The folio.
+ *
+ * For folios which are in the page cache, return the mapping that this
+ * page belongs to.  Folios in the swap cache return the swap mapping
+ * this page is stored in (which is different from the mapping for the
+ * swap file or swap device where the data is stored).
+ *
+ * You can call this for folios which aren't in the swap cache or page
+ * cache and it will return NULL.
+ */
+struct address_space *folio_mapping(struct folio *folio)
 {
 	struct address_space *mapping;
 
-	page = compound_head(page);
-
 	/* This happens if someone calls flush_dcache_page on slab page */
-	if (unlikely(PageSlab(page)))
+	if (unlikely(FolioSlab(folio)))
 		return NULL;
 
-	if (unlikely(PageSwapCache(page))) {
-		swp_entry_t entry;
-
-		entry.val = page_private(page);
-		return swap_address_space(entry);
-	}
+	if (unlikely(FolioSwapCache(folio)))
+		return swap_address_space(folio_swap_entry(folio));
 
-	mapping = page->mapping;
+	mapping = folio->mapping;
 	if ((unsigned long)mapping & PAGE_MAPPING_ANON)
 		return NULL;
 
 	return (void *)((unsigned long)mapping & ~PAGE_MAPPING_FLAGS);
 }
-EXPORT_SYMBOL(page_mapping);
+EXPORT_SYMBOL(folio_mapping);
 
 /* Slow path of page_mapcount() for compound pages */
 int __page_mapcount(struct page *page)
-- 
2.30.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

