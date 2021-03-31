Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B06A33506E8
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 Mar 2021 20:54:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-mKSDeQyRPDu2QdRRXa1E1A-1; Wed, 31 Mar 2021 14:54:11 -0400
X-MC-Unique: mKSDeQyRPDu2QdRRXa1E1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B93410074A3;
	Wed, 31 Mar 2021 18:54:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AB155C1BB;
	Wed, 31 Mar 2021 18:54:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE7281800216;
	Wed, 31 Mar 2021 18:54:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12VIs6l5004417 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 31 Mar 2021 14:54:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3E5A52157F25; Wed, 31 Mar 2021 18:54:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38A492157F23
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 18:54:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FA61858EEE
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 18:54:06 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-351-sNe-eZMrMw2Zv4zBJighmw-1; Wed, 31 Mar 2021 14:54:03 -0400
X-MC-Unique: sNe-eZMrMw2Zv4zBJighmw-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lRfy1-004zeT-MT; Wed, 31 Mar 2021 18:53:26 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Wed, 31 Mar 2021 19:47:17 +0100
Message-Id: <20210331184728.1188084-17-willy@infradead.org>
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
Subject: [Linux-cachefs] [PATCH v6 16/27] mm/filemap: Add unlock_folio
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert unlock_page() to call unlock_folio().  By using a folio we
avoid a call to compound_head().  This shortens the function from 39
bytes to 25 and removes 4 instructions on x86-64.  Because we still
have unlock_page(), it's a net increase of 24 bytes of text for the
kernel as a whole, but any path that uses unlock_folio() will execute
4 fewer instructions.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/pagemap.h |  3 ++-
 mm/filemap.c            | 27 ++++++++++-----------------
 mm/folio-compat.c       |  6 ++++++
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 01082cda7e72..ee83ada556e0 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -719,7 +719,8 @@ extern int __lock_page_killable(struct page *page);
 extern int __lock_page_async(struct page *page, struct wait_page_queue *wait);
 extern int __lock_page_or_retry(struct page *page, struct mm_struct *mm,
 				unsigned int flags);
-extern void unlock_page(struct page *page);
+void unlock_page(struct page *page);
+void unlock_folio(struct folio *folio);
 void unlock_page_private_2(struct page *page);
 
 /*
diff --git a/mm/filemap.c b/mm/filemap.c
index c03463cb72d6..6d320264e5e0 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1435,29 +1435,22 @@ static inline bool clear_bit_unlock_is_negative_byte(long nr, volatile void *mem
 #endif
 
 /**
- * unlock_page - unlock a locked page
- * @page: the page
+ * unlock_folio - Unlock a locked folio.
+ * @folio: The folio.
  *
- * Unlocks the page and wakes up sleepers in wait_on_page_locked().
- * Also wakes sleepers in wait_on_page_writeback() because the wakeup
- * mechanism between PageLocked pages and PageWriteback pages is shared.
- * But that's OK - sleepers in wait_on_page_writeback() just go back to sleep.
+ * Unlocks the folio and wakes up any thread sleeping on the page lock.
  *
- * Note that this depends on PG_waiters being the sign bit in the byte
- * that contains PG_locked - thus the BUILD_BUG_ON(). That allows us to
- * clear the PG_locked bit and test PG_waiters at the same time fairly
- * portably (architectures that do LL/SC can test any bit, while x86 can
- * test the sign bit).
+ * Context: May be called from interrupt or process context.  May not be
+ * called from NMI context.
  */
-void unlock_page(struct page *page)
+void unlock_folio(struct folio *folio)
 {
 	BUILD_BUG_ON(PG_waiters != 7);
-	page = compound_head(page);
-	VM_BUG_ON_PAGE(!PageLocked(page), page);
-	if (clear_bit_unlock_is_negative_byte(PG_locked, &page->flags))
-		wake_up_page_bit(page, PG_locked);
+	VM_BUG_ON_FOLIO(!FolioLocked(folio), folio);
+	if (clear_bit_unlock_is_negative_byte(PG_locked, folio_flags(folio, 0)))
+		wake_up_page_bit(&folio->page, PG_locked);
 }
-EXPORT_SYMBOL(unlock_page);
+EXPORT_SYMBOL(unlock_folio);
 
 /**
  * unlock_page_private_2 - Unlock a page that's locked with PG_private_2
diff --git a/mm/folio-compat.c b/mm/folio-compat.c
index 5e107aa30a62..02798abf19a1 100644
--- a/mm/folio-compat.c
+++ b/mm/folio-compat.c
@@ -11,3 +11,9 @@ struct address_space *page_mapping(struct page *page)
 	return folio_mapping(page_folio(page));
 }
 EXPORT_SYMBOL(page_mapping);
+
+void unlock_page(struct page *page)
+{
+	return unlock_folio(page_folio(page));
+}
+EXPORT_SYMBOL(unlock_page);
-- 
2.30.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

