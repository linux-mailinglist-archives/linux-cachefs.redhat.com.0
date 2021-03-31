Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id AD8083506EB
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 Mar 2021 20:54:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-jpfIlq-NOJi1Q-dDWqpkbA-1; Wed, 31 Mar 2021 14:54:34 -0400
X-MC-Unique: jpfIlq-NOJi1Q-dDWqpkbA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D293C1922961;
	Wed, 31 Mar 2021 18:54:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B568C5D72F;
	Wed, 31 Mar 2021 18:54:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F3F21809C83;
	Wed, 31 Mar 2021 18:54:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12VIsTxr004479 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 31 Mar 2021 14:54:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6CF23114B9C5; Wed, 31 Mar 2021 18:54:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 689A51012C6F
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 18:54:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1C008027E6
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 18:54:24 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-81-cwrhHj_1Pzyxu2sp_SB2kQ-1; Wed, 31 Mar 2021 14:54:20 -0400
X-MC-Unique: cwrhHj_1Pzyxu2sp_SB2kQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lRfya-004zl2-Iw; Wed, 31 Mar 2021 18:54:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Wed, 31 Mar 2021 19:47:24 +0100
Message-Id: <20210331184728.1188084-24-willy@infradead.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH v6 23/27] mm/writeback: Add
	wait_on_folio_writeback
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

wait_on_page_writeback_killable() only has one caller, so convert it to
call wait_on_folio_writeback_killable().  For the wait_on_page_writeback()
callers, add a compatibility wrapper around wait_on_folio_writeback().

Turning PageWriteback() into FolioWriteback() eliminates a call to
compound_head() which saves 8 bytes and 15 bytes in the two functions.
That is more than offset by adding the wait_on_page_writeback
compatibility wrapper for a net increase in text of 15 bytes.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/afs/write.c          |  5 +++--
 include/linux/pagemap.h |  3 ++-
 mm/folio-compat.c       |  6 ++++++
 mm/page-writeback.c     | 48 ++++++++++++++++++++++++++++-------------
 4 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index 106a864b6a93..7af2b57e601b 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -831,7 +831,8 @@ int afs_fsync(struct file *file, loff_t start, loff_t end, int datasync)
  */
 vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
 {
-	struct page *page = thp_head(vmf->page);
+	struct folio *folio = page_folio(vmf->page);
+	struct page *page = &folio->page;
 	struct file *file = vmf->vma->vm_file;
 	struct inode *inode = file_inode(file);
 	struct afs_vnode *vnode = AFS_FS_I(inode);
@@ -850,7 +851,7 @@ vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
 		return VM_FAULT_RETRY;
 #endif
 
-	if (wait_on_page_writeback_killable(page))
+	if (wait_on_folio_writeback_killable(folio))
 		return VM_FAULT_RETRY;
 
 	if (lock_page_killable(page) < 0)
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 36c31cfa3e64..2be3a028eb3d 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -829,7 +829,8 @@ static inline int wait_on_page_locked_killable(struct page *page)
 
 int put_and_wait_on_page_locked(struct page *page, int state);
 void wait_on_page_writeback(struct page *page);
-int wait_on_page_writeback_killable(struct page *page);
+void wait_on_folio_writeback(struct folio *folio);
+int wait_on_folio_writeback_killable(struct folio *folio);
 void end_page_writeback(struct page *page);
 void end_folio_writeback(struct folio *folio);
 void wait_for_stable_page(struct page *page);
diff --git a/mm/folio-compat.c b/mm/folio-compat.c
index d1a1dfe52589..6aadecc39fba 100644
--- a/mm/folio-compat.c
+++ b/mm/folio-compat.c
@@ -23,3 +23,9 @@ void end_page_writeback(struct page *page)
 	return end_folio_writeback(page_folio(page));
 }
 EXPORT_SYMBOL(end_page_writeback);
+
+void wait_on_page_writeback(struct page *page)
+{
+	return wait_on_folio_writeback(page_folio(page));
+}
+EXPORT_SYMBOL_GPL(wait_on_page_writeback);
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 0062d5c57d41..8271f9b24b69 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2818,33 +2818,51 @@ int __test_set_page_writeback(struct page *page, bool keep_write)
 }
 EXPORT_SYMBOL(__test_set_page_writeback);
 
-/*
- * Wait for a page to complete writeback
+/**
+ * wait_on_folio_writeback - Wait for a folio to finish writeback.
+ * @folio: The folio to wait for.
+ *
+ * If the folio is currently being written back to storage, wait for the
+ * I/O to complete.
+ *
+ * Context: Sleeps.  Must be called in process context and with
+ * no spinlocks held.  Caller should hold a reference on the folio.
+ * If the folio is not locked, writeback may start again after writeback
+ * has finished.
  */
-void wait_on_page_writeback(struct page *page)
+void wait_on_folio_writeback(struct folio *folio)
 {
-	while (PageWriteback(page)) {
-		trace_wait_on_page_writeback(page, page_mapping(page));
-		wait_on_page_bit(page, PG_writeback);
+	while (FolioWriteback(folio)) {
+		trace_wait_on_page_writeback(&folio->page, folio_mapping(folio));
+		wait_on_page_bit(&folio->page, PG_writeback);
 	}
 }
-EXPORT_SYMBOL_GPL(wait_on_page_writeback);
+EXPORT_SYMBOL_GPL(wait_on_folio_writeback);
 
-/*
- * Wait for a page to complete writeback.  Returns -EINTR if we get a
- * fatal signal while waiting.
+/**
+ * wait_on_folio_writeback_killable - Wait for a folio to finish writeback.
+ * @folio: The folio to wait for.
+ *
+ * If the folio is currently being written back to storage, wait for the
+ * I/O to complete or a fatal signal to arrive.
+ *
+ * Context: Sleeps.  Must be called in process context and with
+ * no spinlocks held.  Caller should hold a reference on the folio.
+ * If the folio is not locked, writeback may start again after writeback
+ * has finished.
+ * Return: 0 on success, -EINTR if we get a fatal signal while waiting.
  */
-int wait_on_page_writeback_killable(struct page *page)
+int wait_on_folio_writeback_killable(struct folio *folio)
 {
-	while (PageWriteback(page)) {
-		trace_wait_on_page_writeback(page, page_mapping(page));
-		if (wait_on_page_bit_killable(page, PG_writeback))
+	while (FolioWriteback(folio)) {
+		trace_wait_on_page_writeback(&folio->page, folio_mapping(folio));
+		if (wait_on_page_bit_killable(&folio->page, PG_writeback))
 			return -EINTR;
 	}
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(wait_on_page_writeback_killable);
+EXPORT_SYMBOL_GPL(wait_on_folio_writeback_killable);
 
 /**
  * wait_for_stable_page() - wait for writeback to finish, if necessary.
-- 
2.30.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

