Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1135F35A647
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 20:53:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-cj773ChJMuOE1OuVF6Qs8g-1; Fri, 09 Apr 2021 14:53:39 -0400
X-MC-Unique: cj773ChJMuOE1OuVF6Qs8g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D07D802B40;
	Fri,  9 Apr 2021 18:53:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C48A5D9E3;
	Fri,  9 Apr 2021 18:53:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 414F744A5B;
	Fri,  9 Apr 2021 18:53:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139IrYfe018301 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 14:53:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ADD07106A4B; Fri,  9 Apr 2021 18:53:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7923106A42
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 18:53:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41FF680331A
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 18:53:32 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-202-eKcbsMRfPUieTXLQo87mZA-1; Fri, 09 Apr 2021 14:53:29 -0400
X-MC-Unique: eKcbsMRfPUieTXLQo87mZA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lUwES-000n1Q-As; Fri, 09 Apr 2021 18:52:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Fri,  9 Apr 2021 19:50:39 +0100
Message-Id: <20210409185105.188284-3-willy@infradead.org>
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
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH v7 02/28] mm: Introduce struct folio
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A struct folio is a new abstraction to replace the venerable struct page.
A function which takes a struct folio argument declares that it will
operate on the entire (possibly compound) page, not just PAGE_SIZE bytes.
In return, the caller guarantees that the pointer it is passing does
not point to a tail page.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: Jeff Layton <jlayton@kernel.org>
---
 include/linux/mm.h       | 74 +++++++++++++++++++++++++++++++++++++
 include/linux/mm_types.h | 80 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 154 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 036f63a44a5c..4ece80aa8d05 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -950,6 +950,20 @@ static inline unsigned int compound_order(struct page *page)
 	return page[1].compound_order;
 }
 
+/**
+ * folio_order - The allocation order of a folio.
+ * @folio: The folio.
+ *
+ * A folio is composed of 2^order pages.  See get_order() for the definition
+ * of order.
+ *
+ * Return: The order of the folio.
+ */
+static inline unsigned int folio_order(struct folio *folio)
+{
+	return compound_order(&folio->page);
+}
+
 static inline bool hpage_pincount_available(struct page *page)
 {
 	/*
@@ -1595,6 +1609,65 @@ static inline void set_page_links(struct page *page, enum zone_type zone,
 #endif
 }
 
+/**
+ * folio_nr_pages - The number of pages in the folio.
+ * @folio: The folio.
+ *
+ * Return: A number which is a power of two.
+ */
+static inline unsigned long folio_nr_pages(struct folio *folio)
+{
+	return compound_nr(&folio->page);
+}
+
+/**
+ * folio_next - Move to the next physical folio.
+ * @folio: The folio we're currently operating on.
+ *
+ * If you have physically contiguous memory which may span more than
+ * one folio (eg a &struct bio_vec), use this function to move from one
+ * folio to the next.  Do not use it if the memory is only virtually
+ * contiguous as the folios are almost certainly not adjacent to each
+ * other.  This is the folio equivalent to writing ``page++``.
+ *
+ * Context: We assume that the folios are refcounted and/or locked at a
+ * higher level and do not adjust the reference counts.
+ * Return: The next struct folio.
+ */
+static inline struct folio *folio_next(struct folio *folio)
+{
+	return (struct folio *)nth_page(&folio->page, folio_nr_pages(folio));
+}
+
+/**
+ * folio_shift - The number of bits covered by this folio.
+ * @folio: The folio.
+ *
+ * A folio contains a number of bytes which is a power-of-two in size.
+ * This function tells you which power-of-two the folio is.
+ *
+ * Context: The caller should have a reference on the folio to prevent
+ * it from being split.  It is not necessary for the folio to be locked.
+ * Return: The base-2 logarithm of the size of this folio.
+ */
+static inline unsigned int folio_shift(struct folio *folio)
+{
+	return PAGE_SHIFT + folio_order(folio);
+}
+
+/**
+ * folio_size - The number of bytes in a folio.
+ * @folio: The folio.
+ *
+ * Context: The caller should have a reference on the folio to prevent
+ * it from being split.  It is not necessary for the folio to be locked.
+ * Return: The number of bytes in this folio.
+ */
+static inline size_t folio_size(struct folio *folio)
+{
+	return PAGE_SIZE << folio_order(folio);
+}
+
 /*
  * Some inline functions in vmstat.h depend on page_zone()
  */
@@ -1699,6 +1772,7 @@ extern void pagefault_out_of_memory(void);
 
 #define offset_in_page(p)	((unsigned long)(p) & ~PAGE_MASK)
 #define offset_in_thp(page, p)	((unsigned long)(p) & (thp_size(page) - 1))
+#define offset_in_folio(folio, p) ((unsigned long)(p) & (folio_size(folio) - 1))
 
 /*
  * Flags passed to show_mem() and show_free_areas() to suppress output in
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 6613b26a8894..d65050851037 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -224,6 +224,86 @@ struct page {
 #endif
 } _struct_page_alignment;
 
+/**
+ * struct folio - Represents a contiguous set of bytes.
+ * @flags: Identical to the page flags.
+ * @lru: Least Recently Used list; tracks how recently this folio was used.
+ * @mapping: The file this page belongs to, or refers to the anon_vma for
+ *    anonymous pages.
+ * @index: Offset within the file, in units of pages.  For anonymous pages,
+ *    this is the index from the beginning of the mmap.
+ * @private: Filesystem per-folio data (see attach_folio_private()).
+ *    Used for swp_entry_t if FolioSwapCache().
+ * @_mapcount: How many times this folio is mapped to userspace.  Use
+ *    folio_mapcount() to access it.
+ * @_refcount: Number of references to this folio.  Use folio_ref_count()
+ *    to read it.
+ * @memcg_data: Memory Control Group data.
+ *
+ * A folio is a physically, virtually and logically contiguous set
+ * of bytes.  It is a power-of-two in size, and it is aligned to that
+ * same power-of-two.  It is at least as large as %PAGE_SIZE.  If it is
+ * in the page cache, it is at a file offset which is a multiple of that
+ * power-of-two.
+ */
+struct folio {
+	/* private: don't document the anon union */
+	union {
+		struct {
+	/* public: */
+			unsigned long flags;
+			struct list_head lru;
+			struct address_space *mapping;
+			pgoff_t index;
+			unsigned long private;
+			atomic_t _mapcount;
+			atomic_t _refcount;
+#ifdef CONFIG_MEMCG
+			unsigned long memcg_data;
+#endif
+	/* private: the union with struct page is transitional */
+		};
+		struct page page;
+	};
+};
+
+static_assert(sizeof(struct page) == sizeof(struct folio));
+#define FOLIO_MATCH(pg, fl)						\
+	static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
+FOLIO_MATCH(flags, flags);
+FOLIO_MATCH(lru, lru);
+FOLIO_MATCH(compound_head, lru);
+FOLIO_MATCH(index, index);
+FOLIO_MATCH(private, private);
+FOLIO_MATCH(_mapcount, _mapcount);
+FOLIO_MATCH(_refcount, _refcount);
+#ifdef CONFIG_MEMCG
+FOLIO_MATCH(memcg_data, memcg_data);
+#endif
+#undef FOLIO_MATCH
+
+/**
+ * page_folio - Converts from page to folio.
+ * @page: The page.
+ *
+ * Every page is part of a folio.  This function cannot be called on a
+ * NULL pointer.
+ *
+ * Context: No reference, nor lock is required on @page.  If the caller
+ * does not hold a reference, this call may race with a folio split, so
+ * it should re-check the folio still contains this page after gaining
+ * a reference on the folio.
+ * Return: The folio which contains this page.
+ */
+static inline struct folio *page_folio(struct page *page)
+{
+	unsigned long head = READ_ONCE(page->compound_head);
+
+	if (unlikely(head & 1))
+		return (struct folio *)(head - 1);
+	return (struct folio *)page;
+}
+
 static inline atomic_t *compound_mapcount_ptr(struct page *page)
 {
 	return &page[1].compound_mapcount;
-- 
2.30.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

