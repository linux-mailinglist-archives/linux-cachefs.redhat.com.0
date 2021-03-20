Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3D5342B18
	for <lists+linux-cachefs@lfdr.de>; Sat, 20 Mar 2021 06:44:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-F6qVkTVDMQGYhNeMa31h8A-1; Sat, 20 Mar 2021 01:44:17 -0400
X-MC-Unique: F6qVkTVDMQGYhNeMa31h8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88591180FCAB;
	Sat, 20 Mar 2021 05:44:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7973660C04;
	Sat, 20 Mar 2021 05:44:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6523E4BB7C;
	Sat, 20 Mar 2021 05:44:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12K5iEMd004378 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 20 Mar 2021 01:44:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 19B40103406; Sat, 20 Mar 2021 05:44:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1413B103CC4
	for <linux-cachefs@redhat.com>; Sat, 20 Mar 2021 05:44:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3F04811E7A
	for <linux-cachefs@redhat.com>; Sat, 20 Mar 2021 05:44:11 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-120-fIo0KmVJO52xPSij9uyz3w-1; Sat, 20 Mar 2021 01:44:08 -0400
X-MC-Unique: fIo0KmVJO52xPSij9uyz3w-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lNUOi-005Sgx-3Z; Sat, 20 Mar 2021 05:43:42 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Sat, 20 Mar 2021 05:40:59 +0000
Message-Id: <20210320054104.1300774-23-willy@infradead.org>
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
Subject: [Linux-cachefs] [PATCH v5 22/27] mm/writeback: Add
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 fs/afs/write.c          |  2 +-
 include/linux/pagemap.h |  3 ++-
 mm/folio-compat.c       |  6 ++++++
 mm/page-writeback.c     | 43 +++++++++++++++++++++++++++--------------
 4 files changed, 38 insertions(+), 16 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index 106a864b6a93..4b70b0e7fcfa 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -850,7 +850,7 @@ vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
 		return VM_FAULT_RETRY;
 #endif
 
-	if (wait_on_page_writeback_killable(page))
+	if (wait_on_folio_writeback_killable(page_folio(page)))
 		return VM_FAULT_RETRY;
 
 	if (lock_page_killable(page) < 0)
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 2ee6b1b9561c..a6adf69ea5c5 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -808,7 +808,8 @@ static inline int wait_on_page_locked_killable(struct page *page)
 
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
index 5e761fb62800..a08e77abcf12 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2818,33 +2818,48 @@ int __test_set_page_writeback(struct page *page, bool keep_write)
 }
 EXPORT_SYMBOL(__test_set_page_writeback);
 
-/*
- * Wait for a page to complete writeback
+/**
+ * wait_on_folio_writeback - Wait for a folio to complete writeback.
+ * @folio: The folio to wait for.
+ *
+ * If the folio is currently being written back to storage, wait for the
+ * I/O to complete.
+ *
+ * Context: Sleeps; must be called in process context and with no spinlocks
+ * held.
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
+/**
+ * wait_on_folio_writeback_killable - Wait for a folio to complete writeback.
+ * @folio: The folio to wait for.
+ *
+ * If the folio is currently being written back to storage, wait for the
+ * I/O to complete or a fatal signal to arrive.
+ *
+ * Context: Sleeps; must be called in process context and with no spinlocks
+ * held.
+ * Return: 0 if the folio has completed writeback.  -EINTR if we get a
  * fatal signal while waiting.
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

