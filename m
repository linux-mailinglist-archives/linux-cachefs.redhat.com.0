Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D7905342AEB
	for <lists+linux-cachefs@lfdr.de>; Sat, 20 Mar 2021 06:42:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-wGt78WQZOAO8K2rraonPRQ-1; Sat, 20 Mar 2021 01:42:48 -0400
X-MC-Unique: wGt78WQZOAO8K2rraonPRQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E39171007477;
	Sat, 20 Mar 2021 05:42:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3E8A5D9E3;
	Sat, 20 Mar 2021 05:42:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF24A4BB7C;
	Sat, 20 Mar 2021 05:42:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12K5girU004117 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 20 Mar 2021 01:42:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 804581054E35; Sat, 20 Mar 2021 05:42:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BB6F10545B8
	for <linux-cachefs@redhat.com>; Sat, 20 Mar 2021 05:42:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 265B6800883
	for <linux-cachefs@redhat.com>; Sat, 20 Mar 2021 05:42:42 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-149-QNnEnV0YPQ-g2iTLGfVNGQ-1; Sat, 20 Mar 2021 01:42:39 -0400
X-MC-Unique: QNnEnV0YPQ-g2iTLGfVNGQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lNUNQ-005SXN-9w; Sat, 20 Mar 2021 05:42:22 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Sat, 20 Mar 2021 05:40:47 +0000
Message-Id: <20210320054104.1300774-11-willy@infradead.org>
In-Reply-To: <20210320054104.1300774-1-willy@infradead.org>
References: <20210320054104.1300774-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH v5 10/27] mm: Create FolioFlags
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

These new functions are the folio analogues of the PageFlags functions.
If CONFIG_DEBUG_VM_PGFLAGS is enabled, we check the folio is not a tail
page at every invocation.  Note that this will also catch the PagePoisoned
case as a poisoned page has every bit set, which would include PageTail.

This saves 1727 bytes of text with the distro-derived config that
I'm testing due to removing a double call to compound_head() in
PageSwapCache().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/page-flags.h | 120 ++++++++++++++++++++++++++++++-------
 1 file changed, 100 insertions(+), 20 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 04a34c08e0a6..ec0e3eb6b85a 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -212,6 +212,15 @@ static inline void page_init_poison(struct page *page, size_t size)
 }
 #endif
 
+static unsigned long *folio_flags(struct folio *folio, unsigned n)
+{
+	struct page *page = &folio->page;
+
+	VM_BUG_ON_PGFLAGS(PageTail(page), page);
+	VM_BUG_ON_PGFLAGS(n > 0 && !test_bit(PG_head, &page->flags), page);
+	return &page[n].flags;
+}
+
 /*
  * Page flags policies wrt compound pages
  *
@@ -256,34 +265,56 @@ static inline void page_init_poison(struct page *page, size_t size)
 		VM_BUG_ON_PGFLAGS(!PageHead(page), page);		\
 		PF_POISONED_CHECK(&page[1]); })
 
+/* Which page is the flag stored in */
+#define FOLIO_PF_ANY		0
+#define FOLIO_PF_HEAD		0
+#define FOLIO_PF_ONLY_HEAD	0
+#define FOLIO_PF_NO_TAIL	0
+#define FOLIO_PF_NO_COMPOUND	0
+#define FOLIO_PF_SECOND		1
+
 /*
  * Macros to create function definitions for page flags
  */
 #define TESTPAGEFLAG(uname, lname, policy)				\
+static __always_inline int Folio##uname(struct folio *folio)		\
+	{ return test_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); } \
 static __always_inline int Page##uname(struct page *page)		\
 	{ return test_bit(PG_##lname, &policy(page, 0)->flags); }
 
 #define SETPAGEFLAG(uname, lname, policy)				\
+static __always_inline void SetFolio##uname(struct folio *folio)	\
+	{ set_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); }	\
 static __always_inline void SetPage##uname(struct page *page)		\
 	{ set_bit(PG_##lname, &policy(page, 1)->flags); }
 
 #define CLEARPAGEFLAG(uname, lname, policy)				\
+static __always_inline void ClearFolio##uname(struct folio *folio)	\
+	{ clear_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); }	\
 static __always_inline void ClearPage##uname(struct page *page)		\
 	{ clear_bit(PG_##lname, &policy(page, 1)->flags); }
 
 #define __SETPAGEFLAG(uname, lname, policy)				\
+static __always_inline void __SetFolio##uname(struct folio *folio)	\
+	{ __set_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); }	\
 static __always_inline void __SetPage##uname(struct page *page)		\
 	{ __set_bit(PG_##lname, &policy(page, 1)->flags); }
 
 #define __CLEARPAGEFLAG(uname, lname, policy)				\
+static __always_inline void __ClearFolio##uname(struct folio *folio)	\
+	{ __clear_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); } \
 static __always_inline void __ClearPage##uname(struct page *page)	\
 	{ __clear_bit(PG_##lname, &policy(page, 1)->flags); }
 
 #define TESTSETFLAG(uname, lname, policy)				\
+static __always_inline int TestSetFolio##uname(struct folio *folio)	\
+	{ return test_and_set_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); } \
 static __always_inline int TestSetPage##uname(struct page *page)	\
 	{ return test_and_set_bit(PG_##lname, &policy(page, 1)->flags); }
 
 #define TESTCLEARFLAG(uname, lname, policy)				\
+static __always_inline int TestClearFolio##uname(struct folio *folio)	\
+	{ return test_and_clear_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); } \
 static __always_inline int TestClearPage##uname(struct page *page)	\
 	{ return test_and_clear_bit(PG_##lname, &policy(page, 1)->flags); }
 
@@ -302,21 +333,27 @@ static __always_inline int TestClearPage##uname(struct page *page)	\
 	TESTCLEARFLAG(uname, lname, policy)
 
 #define TESTPAGEFLAG_FALSE(uname)					\
+static inline int Folio##uname(const struct folio *folio) { return 0; }	\
 static inline int Page##uname(const struct page *page) { return 0; }
 
 #define SETPAGEFLAG_NOOP(uname)						\
+static inline void SetFolio##uname(struct folio *folio) { }		\
 static inline void SetPage##uname(struct page *page) {  }
 
 #define CLEARPAGEFLAG_NOOP(uname)					\
+static inline void ClearFolio##uname(struct folio *folio) { }		\
 static inline void ClearPage##uname(struct page *page) {  }
 
 #define __CLEARPAGEFLAG_NOOP(uname)					\
+static inline void __ClearFolio##uname(struct folio *folio) { }		\
 static inline void __ClearPage##uname(struct page *page) {  }
 
 #define TESTSETFLAG_FALSE(uname)					\
+static inline int TestSetFolio##uname(struct folio *folio) { return 0; } \
 static inline int TestSetPage##uname(struct page *page) { return 0; }
 
 #define TESTCLEARFLAG_FALSE(uname)					\
+static inline int TestClearFolio##uname(struct folio *folio) { return 0; } \
 static inline int TestClearPage##uname(struct page *page) { return 0; }
 
 #define PAGEFLAG_FALSE(uname) TESTPAGEFLAG_FALSE(uname)			\
@@ -393,14 +430,18 @@ PAGEFLAG_FALSE(HighMem)
 #endif
 
 #ifdef CONFIG_SWAP
-static __always_inline int PageSwapCache(struct page *page)
+static __always_inline bool FolioSwapCache(struct folio *folio)
 {
-#ifdef CONFIG_THP_SWAP
-	page = compound_head(page);
-#endif
-	return PageSwapBacked(page) && test_bit(PG_swapcache, &page->flags);
+	return FolioSwapBacked(folio) &&
+			test_bit(PG_swapcache, folio_flags(folio, 0));
+
+}
 
+static __always_inline bool PageSwapCache(struct page *page)
+{
+	return FolioSwapCache(page_folio(page));
 }
+
 SETPAGEFLAG(SwapCache, swapcache, PF_NO_TAIL)
 CLEARPAGEFLAG(SwapCache, swapcache, PF_NO_TAIL)
 #else
@@ -478,10 +519,14 @@ static __always_inline int PageMappingFlags(struct page *page)
 	return ((unsigned long)page->mapping & PAGE_MAPPING_FLAGS) != 0;
 }
 
-static __always_inline int PageAnon(struct page *page)
+static __always_inline bool FolioAnon(struct folio *folio)
 {
-	page = compound_head(page);
-	return ((unsigned long)page->mapping & PAGE_MAPPING_ANON) != 0;
+	return ((unsigned long)folio->page.mapping & PAGE_MAPPING_ANON) != 0;
+}
+
+static __always_inline bool PageAnon(struct page *page)
+{
+	return FolioAnon(page_folio(page));
 }
 
 static __always_inline int __PageMovable(struct page *page)
@@ -509,18 +554,16 @@ TESTPAGEFLAG_FALSE(Ksm)
 
 u64 stable_page_flags(struct page *page);
 
-static inline int PageUptodate(struct page *page)
+static inline int FolioUptodate(struct folio *folio)
 {
-	int ret;
-	page = compound_head(page);
-	ret = test_bit(PG_uptodate, &(page)->flags);
+	int ret = test_bit(PG_uptodate, folio_flags(folio, 0));
 	/*
 	 * Must ensure that the data we read out of the page is loaded
 	 * _after_ we've loaded page->flags to check for PageUptodate.
 	 * We can skip the barrier if the page is not uptodate, because
 	 * we wouldn't be reading anything from it.
 	 *
-	 * See SetPageUptodate() for the other side of the story.
+	 * See SetFolioUptodate() for the other side of the story.
 	 */
 	if (ret)
 		smp_rmb();
@@ -528,23 +571,36 @@ static inline int PageUptodate(struct page *page)
 	return ret;
 }
 
-static __always_inline void __SetPageUptodate(struct page *page)
+static inline int PageUptodate(struct page *page)
+{
+	return FolioUptodate(page_folio(page));
+}
+
+static __always_inline void __SetFolioUptodate(struct folio *folio)
 {
-	VM_BUG_ON_PAGE(PageTail(page), page);
 	smp_wmb();
-	__set_bit(PG_uptodate, &page->flags);
+	__set_bit(PG_uptodate, folio_flags(folio, 0));
 }
 
-static __always_inline void SetPageUptodate(struct page *page)
+static __always_inline void SetFolioUptodate(struct folio *folio)
 {
-	VM_BUG_ON_PAGE(PageTail(page), page);
 	/*
 	 * Memory barrier must be issued before setting the PG_uptodate bit,
 	 * so that all previous stores issued in order to bring the page
 	 * uptodate are actually visible before PageUptodate becomes true.
 	 */
 	smp_wmb();
-	set_bit(PG_uptodate, &page->flags);
+	set_bit(PG_uptodate, folio_flags(folio, 0));
+}
+
+static __always_inline void __SetPageUptodate(struct page *page)
+{
+	__SetFolioUptodate((struct folio *)page);
+}
+
+static __always_inline void SetPageUptodate(struct page *page)
+{
+	SetFolioUptodate((struct folio *)page);
 }
 
 CLEARPAGEFLAG(Uptodate, uptodate, PF_NO_TAIL)
@@ -569,6 +625,17 @@ static inline void set_page_writeback_keepwrite(struct page *page)
 
 __PAGEFLAG(Head, head, PF_ANY) CLEARPAGEFLAG(Head, head, PF_ANY)
 
+/* Whether there are one or multiple pages in a folio */
+static inline bool FolioSingle(struct folio *folio)
+{
+	return !FolioHead(folio);
+}
+
+static inline bool FolioMulti(struct folio *folio)
+{
+	return FolioHead(folio);
+}
+
 static __always_inline void set_compound_head(struct page *page, struct page *head)
 {
 	WRITE_ONCE(page->compound_head, (unsigned long)head + 1);
@@ -592,12 +659,15 @@ static inline void ClearPageCompound(struct page *page)
 #ifdef CONFIG_HUGETLB_PAGE
 int PageHuge(struct page *page);
 int PageHeadHuge(struct page *page);
+static inline bool FolioHuge(struct folio *folio)
+{
+	return PageHeadHuge(&folio->page);
+}
 #else
 TESTPAGEFLAG_FALSE(Huge)
 TESTPAGEFLAG_FALSE(HeadHuge)
 #endif
 
-
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 /*
  * PageHuge() only returns true for hugetlbfs pages, but not for
@@ -613,6 +683,11 @@ static inline int PageTransHuge(struct page *page)
 	return PageHead(page);
 }
 
+static inline bool FolioTransHuge(struct folio *folio)
+{
+	return FolioHead(folio);
+}
+
 /*
  * PageTransCompound returns true for both transparent huge pages
  * and hugetlbfs pages, so it should only be called when it's known
@@ -844,6 +919,11 @@ static inline int page_has_private(struct page *page)
 	return !!(page->flags & PAGE_FLAGS_PRIVATE);
 }
 
+static inline bool folio_has_private(struct folio *folio)
+{
+	return page_has_private(&folio->page);
+}
+
 #undef PF_ANY
 #undef PF_HEAD
 #undef PF_ONLY_HEAD
-- 
2.30.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

