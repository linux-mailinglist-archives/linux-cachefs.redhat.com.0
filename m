Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 88B7D35A692
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 21:02:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-bqfpQifVNaeaNbb4PM32tg-1; Fri, 09 Apr 2021 15:02:27 -0400
X-MC-Unique: bqfpQifVNaeaNbb4PM32tg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AFE9107ACC7;
	Fri,  9 Apr 2021 19:02:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB9B95C26D;
	Fri,  9 Apr 2021 19:02:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D471F5533E;
	Fri,  9 Apr 2021 19:02:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139IxvXu018966 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 14:59:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3674721B38AD; Fri,  9 Apr 2021 18:59:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3049221B38B6
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 18:59:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6485D811E9B
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 18:59:54 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-484-cZAvnzFgM3SV7hxuKWaVuw-1; Fri, 09 Apr 2021 14:59:52 -0400
X-MC-Unique: cZAvnzFgM3SV7hxuKWaVuw-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lUwKQ-000ng3-Ad; Fri, 09 Apr 2021 18:58:14 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Fri,  9 Apr 2021 19:50:47 +0100
Message-Id: <20210409185105.188284-11-willy@infradead.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH v7 10/28] mm: Handle per-folio private data
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

Add folio_private() and set_folio_private() which mirror page_private()
and set_page_private() -- ie folio private data is the same as page
private data.  The only difference is that these return a void *
instead of an unsigned long, which matches the majority of users.

Turn attach_page_private() into attach_folio_private() and reimplement
attach_page_private() as a wrapper.  No filesystem which uses page private
data currently supports compound pages, so we're free to define the rules.
attach_page_private() may only be called on a head page; if you want
to add private data to a tail page, you can call set_page_private()
directly (and shouldn't increment the page refcount!  That should be
done when adding private data to the head page / folio).

This saves 597 bytes of text with the distro-derived config that I'm
testing due to removing the calls to compound_head() in get_page()
& put_page().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Jeff Layton <jlayton@kernel.org>
---
 include/linux/mm_types.h | 16 ++++++++++++++
 include/linux/pagemap.h  | 48 ++++++++++++++++++++++++----------------
 2 files changed, 45 insertions(+), 19 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index d65050851037..1210a8e41fad 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -322,6 +322,12 @@ static inline atomic_t *compound_pincount_ptr(struct page *page)
 #define PAGE_FRAG_CACHE_MAX_SIZE	__ALIGN_MASK(32768, ~PAGE_MASK)
 #define PAGE_FRAG_CACHE_MAX_ORDER	get_order(PAGE_FRAG_CACHE_MAX_SIZE)
 
+/*
+ * page_private can be used on tail pages.  However, PagePrivate is only
+ * checked by the VM on the head page.  So page_private on the tail pages
+ * should be used for data that's ancillary to the head page (eg attaching
+ * buffer heads to tail pages after attaching buffer heads to the head page)
+ */
 #define page_private(page)		((page)->private)
 
 static inline void set_page_private(struct page *page, unsigned long private)
@@ -329,6 +335,16 @@ static inline void set_page_private(struct page *page, unsigned long private)
 	page->private = private;
 }
 
+static inline void *folio_private(struct folio *folio)
+{
+	return (void *)folio->private;
+}
+
+static inline void set_folio_private(struct folio *folio, void *v)
+{
+	folio->private = (unsigned long)v;
+}
+
 struct page_frag_cache {
 	void * va;
 #if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE)
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 350e1c9726f2..f2fd0b811c1b 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -260,42 +260,52 @@ static inline int page_cache_add_speculative(struct page *page, int count)
 }
 
 /**
- * attach_page_private - Attach private data to a page.
- * @page: Page to attach data to.
- * @data: Data to attach to page.
+ * attach_folio_private - Attach private data to a folio.
+ * @folio: Folio to attach data to.
+ * @data: Data to attach to folio.
  *
- * Attaching private data to a page increments the page's reference count.
- * The data must be detached before the page will be freed.
+ * Attaching private data to a folio increments the page's reference count.
+ * The data must be detached before the folio will be freed.
  */
-static inline void attach_page_private(struct page *page, void *data)
+static inline void attach_folio_private(struct folio *folio, void *data)
 {
-	get_page(page);
-	set_page_private(page, (unsigned long)data);
-	SetPagePrivate(page);
+	get_folio(folio);
+	set_folio_private(folio, data);
+	SetFolioPrivate(folio);
 }
 
 /**
- * detach_page_private - Detach private data from a page.
- * @page: Page to detach data from.
+ * detach_folio_private - Detach private data from a folio.
+ * @folio: Folio to detach data from.
  *
- * Removes the data that was previously attached to the page and decrements
+ * Removes the data that was previously attached to the folio and decrements
  * the refcount on the page.
  *
- * Return: Data that was attached to the page.
+ * Return: Data that was attached to the folio.
  */
-static inline void *detach_page_private(struct page *page)
+static inline void *detach_folio_private(struct folio *folio)
 {
-	void *data = (void *)page_private(page);
+	void *data = folio_private(folio);
 
-	if (!PagePrivate(page))
+	if (!FolioPrivate(folio))
 		return NULL;
-	ClearPagePrivate(page);
-	set_page_private(page, 0);
-	put_page(page);
+	ClearFolioPrivate(folio);
+	set_folio_private(folio, NULL);
+	put_folio(folio);
 
 	return data;
 }
 
+static inline void attach_page_private(struct page *page, void *data)
+{
+	attach_folio_private(page_folio(page), data);
+}
+
+static inline void *detach_page_private(struct page *page)
+{
+	return detach_folio_private(page_folio(page));
+}
+
 #ifdef CONFIG_NUMA
 extern struct page *__page_cache_alloc(gfp_t gfp);
 #else
-- 
2.30.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

