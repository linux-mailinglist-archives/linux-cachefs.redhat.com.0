Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E93293506B7
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 Mar 2021 20:49:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-bgvye-OlMyK_hi5IoJ3V1Q-1; Wed, 31 Mar 2021 14:49:28 -0400
X-MC-Unique: bgvye-OlMyK_hi5IoJ3V1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62A3310866A3;
	Wed, 31 Mar 2021 18:49:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 522A56EF76;
	Wed, 31 Mar 2021 18:49:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 302811809C83;
	Wed, 31 Mar 2021 18:49:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12VInN5T003901 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 31 Mar 2021 14:49:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7144A2156A23; Wed, 31 Mar 2021 18:49:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ABB72156A3B
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 18:49:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44FFD81DAAE
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 18:49:20 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-155-SDMUK6QQPe25CJxddeN6EQ-1; Wed, 31 Mar 2021 14:49:15 -0400
X-MC-Unique: SDMUK6QQPe25CJxddeN6EQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lRftP-004zB9-36; Wed, 31 Mar 2021 18:48:51 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Wed, 31 Mar 2021 19:47:06 +0100
Message-Id: <20210331184728.1188084-6-willy@infradead.org>
In-Reply-To: <20210331184728.1188084-1-willy@infradead.org>
References: <20210331184728.1188084-1-willy@infradead.org>
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
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH v6 05/27] mm: Add folio reference count
	functions
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

These functions mirror their page reference counterparts.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 Documentation/core-api/mm-api.rst |  1 +
 include/linux/page_ref.h          | 88 ++++++++++++++++++++++++++++++-
 2 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index 34f46df91a8b..1ead2570b217 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -97,3 +97,4 @@ More Memory Management Functions
    :internal:
 .. kernel-doc:: include/linux/mm.h
    :internal:
+.. kernel-doc:: include/linux/page_ref.h
diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
index f3318f34fc54..f27005e760fd 100644
--- a/include/linux/page_ref.h
+++ b/include/linux/page_ref.h
@@ -69,7 +69,29 @@ static inline int page_ref_count(struct page *page)
 
 static inline int page_count(struct page *page)
 {
-	return atomic_read(&compound_head(page)->_refcount);
+	return page_ref_count(compound_head(page));
+}
+
+/**
+ * folio_ref_count - The reference count on this folio.
+ * @folio: The folio.
+ *
+ * The refcount is usually incremented by calls to get_folio() and
+ * decremented by calls to put_folio().  Some typical users of the
+ * folio refcount:
+ *
+ * - Each reference from a page table
+ * - The page cache
+ * - Filesystem private data
+ * - The LRU list
+ * - Pipes
+ * - Direct IO which references this page in the process address space
+ *
+ * Return: The number of references to this folio.
+ */
+static inline int folio_ref_count(struct folio *folio)
+{
+	return page_ref_count(&folio->page);
 }
 
 static inline void set_page_count(struct page *page, int v)
@@ -79,6 +101,11 @@ static inline void set_page_count(struct page *page, int v)
 		__page_ref_set(page, v);
 }
 
+static inline void set_folio_count(struct folio *folio, int v)
+{
+	set_page_count(&folio->page, v);
+}
+
 /*
  * Setup the page count before being freed into the page allocator for
  * the first time (boot or memory hotplug)
@@ -95,6 +122,11 @@ static inline void page_ref_add(struct page *page, int nr)
 		__page_ref_mod(page, nr);
 }
 
+static inline void folio_ref_add(struct folio *folio, int nr)
+{
+	page_ref_add(&folio->page, nr);
+}
+
 static inline void page_ref_sub(struct page *page, int nr)
 {
 	atomic_sub(nr, &page->_refcount);
@@ -102,6 +134,11 @@ static inline void page_ref_sub(struct page *page, int nr)
 		__page_ref_mod(page, -nr);
 }
 
+static inline void folio_ref_sub(struct folio *folio, int nr)
+{
+	page_ref_sub(&folio->page, nr);
+}
+
 static inline int page_ref_sub_return(struct page *page, int nr)
 {
 	int ret = atomic_sub_return(nr, &page->_refcount);
@@ -111,6 +148,11 @@ static inline int page_ref_sub_return(struct page *page, int nr)
 	return ret;
 }
 
+static inline int folio_ref_sub_return(struct folio *folio, int nr)
+{
+	return page_ref_sub_return(&folio->page, nr);
+}
+
 static inline void page_ref_inc(struct page *page)
 {
 	atomic_inc(&page->_refcount);
@@ -118,6 +160,11 @@ static inline void page_ref_inc(struct page *page)
 		__page_ref_mod(page, 1);
 }
 
+static inline void folio_ref_inc(struct folio *folio)
+{
+	page_ref_inc(&folio->page);
+}
+
 static inline void page_ref_dec(struct page *page)
 {
 	atomic_dec(&page->_refcount);
@@ -125,6 +172,11 @@ static inline void page_ref_dec(struct page *page)
 		__page_ref_mod(page, -1);
 }
 
+static inline void folio_ref_dec(struct folio *folio)
+{
+	page_ref_dec(&folio->page);
+}
+
 static inline int page_ref_sub_and_test(struct page *page, int nr)
 {
 	int ret = atomic_sub_and_test(nr, &page->_refcount);
@@ -134,6 +186,11 @@ static inline int page_ref_sub_and_test(struct page *page, int nr)
 	return ret;
 }
 
+static inline int folio_ref_sub_and_test(struct folio *folio, int nr)
+{
+	return page_ref_sub_and_test(&folio->page, nr);
+}
+
 static inline int page_ref_inc_return(struct page *page)
 {
 	int ret = atomic_inc_return(&page->_refcount);
@@ -143,6 +200,11 @@ static inline int page_ref_inc_return(struct page *page)
 	return ret;
 }
 
+static inline int folio_ref_inc_return(struct folio *folio)
+{
+	return page_ref_inc_return(&folio->page);
+}
+
 static inline int page_ref_dec_and_test(struct page *page)
 {
 	int ret = atomic_dec_and_test(&page->_refcount);
@@ -152,6 +214,11 @@ static inline int page_ref_dec_and_test(struct page *page)
 	return ret;
 }
 
+static inline int folio_ref_dec_and_test(struct folio *folio)
+{
+	return page_ref_dec_and_test(&folio->page);
+}
+
 static inline int page_ref_dec_return(struct page *page)
 {
 	int ret = atomic_dec_return(&page->_refcount);
@@ -161,6 +228,11 @@ static inline int page_ref_dec_return(struct page *page)
 	return ret;
 }
 
+static inline int folio_ref_dec_return(struct folio *folio)
+{
+	return page_ref_dec_return(&folio->page);
+}
+
 static inline int page_ref_add_unless(struct page *page, int nr, int u)
 {
 	int ret = atomic_add_unless(&page->_refcount, nr, u);
@@ -170,6 +242,11 @@ static inline int page_ref_add_unless(struct page *page, int nr, int u)
 	return ret;
 }
 
+static inline int folio_ref_add_unless(struct folio *folio, int nr, int u)
+{
+	return page_ref_add_unless(&folio->page, nr, u);
+}
+
 static inline int page_ref_freeze(struct page *page, int count)
 {
 	int ret = likely(atomic_cmpxchg(&page->_refcount, count, 0) == count);
@@ -179,6 +256,11 @@ static inline int page_ref_freeze(struct page *page, int count)
 	return ret;
 }
 
+static inline int folio_ref_freeze(struct folio *folio, int count)
+{
+	return page_ref_freeze(&folio->page, count);
+}
+
 static inline void page_ref_unfreeze(struct page *page, int count)
 {
 	VM_BUG_ON_PAGE(page_count(page) != 0, page);
@@ -189,4 +271,8 @@ static inline void page_ref_unfreeze(struct page *page, int count)
 		__page_ref_unfreeze(page, count);
 }
 
+static inline void folio_ref_unfreeze(struct folio *folio, int count)
+{
+	page_ref_unfreeze(&folio->page, count);
+}
 #endif
-- 
2.30.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

