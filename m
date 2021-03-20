Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 17E05342B15
	for <lists+linux-cachefs@lfdr.de>; Sat, 20 Mar 2021 06:43:49 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-RByTiZnkMriwqV-EPlOQDw-1; Sat, 20 Mar 2021 01:43:46 -0400
X-MC-Unique: RByTiZnkMriwqV-EPlOQDw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDD608030B5;
	Sat, 20 Mar 2021 05:43:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCA7E5DAA5;
	Sat, 20 Mar 2021 05:43:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A53254BB7C;
	Sat, 20 Mar 2021 05:43:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12K5hgQH004299 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 20 Mar 2021 01:43:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4EA06103CC4; Sat, 20 Mar 2021 05:43:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47F23104832
	for <linux-cachefs@redhat.com>; Sat, 20 Mar 2021 05:43:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14FEF85A5A8
	for <linux-cachefs@redhat.com>; Sat, 20 Mar 2021 05:43:40 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-27-pQbeuHGNNrycOQ733qF71w-1; Sat, 20 Mar 2021 01:43:36 -0400
X-MC-Unique: pQbeuHGNNrycOQ733qF71w-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lNUON-005SeL-JX; Sat, 20 Mar 2021 05:43:22 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Sat, 20 Mar 2021 05:40:56 +0000
Message-Id: <20210320054104.1300774-20-willy@infradead.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH v5 19/27] mm/filemap: Add
	__lock_folio_or_retry
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

Convert __lock_page_or_retry() to __lock_folio_or_retry().  This actually
saves 4 bytes in the only caller of lock_page_or_retry() (due to better
register allocation) and saves the 20 byte cost of calling page_folio()
in __lock_folio_or_retry() for a total saving of 24 bytes.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/pagemap.h |  9 ++++++---
 mm/filemap.c            | 10 ++++------
 mm/memory.c             |  8 ++++----
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 3cd1b5e28593..38f4ee28a3a5 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -695,7 +695,7 @@ static inline bool wake_page_match(struct wait_page_queue *wait_page,
 
 void __lock_folio(struct folio *folio);
 int __lock_folio_killable(struct folio *folio);
-extern int __lock_page_or_retry(struct page *page, struct mm_struct *mm,
+int __lock_folio_or_retry(struct folio *folio, struct mm_struct *mm,
 				unsigned int flags);
 void unlock_page(struct page *page);
 void unlock_folio(struct folio *folio);
@@ -757,13 +757,16 @@ static inline int lock_page_killable(struct page *page)
  * caller indicated that it can handle a retry.
  *
  * Return value and mmap_lock implications depend on flags; see
- * __lock_page_or_retry().
+ * __lock_folio_or_retry().
  */
 static inline int lock_page_or_retry(struct page *page, struct mm_struct *mm,
 				     unsigned int flags)
 {
+	struct folio *folio;
 	might_sleep();
-	return trylock_page(page) || __lock_page_or_retry(page, mm, flags);
+
+	folio = page_folio(page);
+	return trylock_folio(folio) || __lock_folio_or_retry(folio, mm, flags);
 }
 
 /*
diff --git a/mm/filemap.c b/mm/filemap.c
index 12dc672adc2e..35e16db2e2be 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1582,20 +1582,18 @@ static int __lock_folio_async(struct folio *folio, struct wait_page_queue *wait)
 
 /*
  * Return values:
- * 1 - page is locked; mmap_lock is still held.
- * 0 - page is not locked.
+ * 1 - folio is locked; mmap_lock is still held.
+ * 0 - folio is not locked.
  *     mmap_lock has been released (mmap_read_unlock(), unless flags had both
  *     FAULT_FLAG_ALLOW_RETRY and FAULT_FLAG_RETRY_NOWAIT set, in
  *     which case mmap_lock is still held.
  *
  * If neither ALLOW_RETRY nor KILLABLE are set, will always return 1
- * with the page locked and the mmap_lock unperturbed.
+ * with the folio locked and the mmap_lock unperturbed.
  */
-int __lock_page_or_retry(struct page *page, struct mm_struct *mm,
+int __lock_folio_or_retry(struct folio *folio, struct mm_struct *mm,
 			 unsigned int flags)
 {
-	struct folio *folio = page_folio(page);
-
 	if (fault_flag_allow_retry_first(flags)) {
 		/*
 		 * CAUTION! In this case, mmap_lock is not released
diff --git a/mm/memory.c b/mm/memory.c
index d3273bd69dbb..9c3554972e2d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4056,7 +4056,7 @@ static vm_fault_t do_shared_fault(struct vm_fault *vmf)
  * We enter with non-exclusive mmap_lock (to exclude vma changes,
  * but allow concurrent faults).
  * The mmap_lock may have been released depending on flags and our
- * return value.  See filemap_fault() and __lock_page_or_retry().
+ * return value.  See filemap_fault() and __lock_folio_or_retry().
  * If mmap_lock is released, vma may become invalid (for example
  * by other thread calling munmap()).
  */
@@ -4288,7 +4288,7 @@ static vm_fault_t wp_huge_pud(struct vm_fault *vmf, pud_t orig_pud)
  * concurrent faults).
  *
  * The mmap_lock may have been released depending on flags and our return value.
- * See filemap_fault() and __lock_page_or_retry().
+ * See filemap_fault() and __lock_folio_or_retry().
  */
 static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
 {
@@ -4392,7 +4392,7 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
  * By the time we get here, we already hold the mm semaphore
  *
  * The mmap_lock may have been released depending on flags and our
- * return value.  See filemap_fault() and __lock_page_or_retry().
+ * return value.  See filemap_fault() and __lock_folio_or_retry().
  */
 static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 		unsigned long address, unsigned int flags)
@@ -4548,7 +4548,7 @@ static inline void mm_account_fault(struct pt_regs *regs,
  * By the time we get here, we already hold the mm semaphore
  *
  * The mmap_lock may have been released depending on flags and our
- * return value.  See filemap_fault() and __lock_page_or_retry().
+ * return value.  See filemap_fault() and __lock_folio_or_retry().
  */
 vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
 			   unsigned int flags, struct pt_regs *regs)
-- 
2.30.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

