Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6E26135A691
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 21:02:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-R7mo2qAeNXu3gNCiKpbizg-1; Fri, 09 Apr 2021 15:02:25 -0400
X-MC-Unique: R7mo2qAeNXu3gNCiKpbizg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 921BB6D4E8;
	Fri,  9 Apr 2021 19:02:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7340C19705;
	Fri,  9 Apr 2021 19:02:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55FFA1806D0E;
	Fri,  9 Apr 2021 19:02:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139IugG4018659 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 14:56:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E4932219B8B5; Fri,  9 Apr 2021 18:56:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE9F8219B8B2
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 18:56:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EA3A800883
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 18:56:39 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-280-Aqcl76Z3M6-6he9_mzNSLQ-1; Fri, 09 Apr 2021 14:56:37 -0400
X-MC-Unique: Aqcl76Z3M6-6he9_mzNSLQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lUwHa-000nKF-W9; Fri, 09 Apr 2021 18:55:34 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Fri,  9 Apr 2021 19:50:43 +0100
Message-Id: <20210409185105.188284-7-willy@infradead.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH v7 06/28] mm: Add folio reference count
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These functions mirror their page reference counterparts.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Jeff Layton <jlayton@kernel.org>
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
index f3318f34fc54..47f0070dc508 100644
--- a/include/linux/page_ref.h
+++ b/include/linux/page_ref.h
@@ -67,9 +67,31 @@ static inline int page_ref_count(struct page *page)
 	return atomic_read(&page->_refcount);
 }
 
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
+}
+
 static inline int page_count(struct page *page)
 {
-	return atomic_read(&compound_head(page)->_refcount);
+	return folio_ref_count(page_folio(page));
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

