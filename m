Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 951583506B8
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 Mar 2021 20:49:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-piJeT89sOsi6TW6TYTMgpA-1; Wed, 31 Mar 2021 14:49:35 -0400
X-MC-Unique: piJeT89sOsi6TW6TYTMgpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10EDC88127C;
	Wed, 31 Mar 2021 18:49:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2CBF614FD;
	Wed, 31 Mar 2021 18:49:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB7BF4BB7C;
	Wed, 31 Mar 2021 18:49:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12VInWTY003912 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 31 Mar 2021 14:49:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E54E72156A38; Wed, 31 Mar 2021 18:49:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDB452156A21
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 18:49:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8383210334AE
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 18:49:29 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-331-M6rTC0atN7CQx5b_c7U6mQ-1; Wed, 31 Mar 2021 14:49:26 -0400
X-MC-Unique: M6rTC0atN7CQx5b_c7U6mQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lRftp-004zE2-J4; Wed, 31 Mar 2021 18:49:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Wed, 31 Mar 2021 19:47:07 +0100
Message-Id: <20210331184728.1188084-7-willy@infradead.org>
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
Cc: linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-cachefs@redhat.com, Zi Yan <ziy@nvidia.com>,
	linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH v6 06/27] mm: Add put_folio
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

If we know we have a folio, we can call put_folio() instead of put_page()
and save the overhead of calling compound_head().  Also skips the
devmap checks.

This commit looks like it should be a no-op, but actually saves 1312 bytes
of text with the distro-derived config that I'm testing.  Some functions
grow a little while others shrink.  I presume the compiler is making
different inlining decisions.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/mm.h | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 195c4740522d..824acedc1253 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -737,6 +737,11 @@ static inline int put_page_testzero(struct page *page)
 	return page_ref_dec_and_test(page);
 }
 
+static inline int put_folio_testzero(struct folio *folio)
+{
+	return put_page_testzero(&folio->page);
+}
+
 /*
  * Try to grab a ref unless the page has a refcount of zero, return false if
  * that is the case.
@@ -1228,9 +1233,28 @@ static inline __must_check bool try_get_page(struct page *page)
 	return true;
 }
 
+/**
+ * put_folio - Decrement the reference count on a folio.
+ * @folio: The folio.
+ *
+ * If the folio's reference count reaches zero, the memory will be
+ * released back to the page allocator and may be used by another
+ * allocation immediately.  Do not access the memory or the struct folio
+ * after calling put_folio() unless you can be sure that it wasn't the
+ * last reference.
+ *
+ * Context: May be called in process or interrupt context, but not in NMI
+ * context.  May be called while holding a spinlock.
+ */
+static inline void put_folio(struct folio *folio)
+{
+	if (put_folio_testzero(folio))
+		__put_page(&folio->page);
+}
+
 static inline void put_page(struct page *page)
 {
-	page = compound_head(page);
+	struct folio *folio = page_folio(page);
 
 	/*
 	 * For devmap managed pages we need to catch refcount transition from
@@ -1238,13 +1262,12 @@ static inline void put_page(struct page *page)
 	 * need to inform the device driver through callback. See
 	 * include/linux/memremap.h and HMM for details.
 	 */
-	if (page_is_devmap_managed(page)) {
-		put_devmap_managed_page(page);
+	if (page_is_devmap_managed(&folio->page)) {
+		put_devmap_managed_page(&folio->page);
 		return;
 	}
 
-	if (put_page_testzero(page))
-		__put_page(page);
+	put_folio(folio);
 }
 
 /*
-- 
2.30.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

