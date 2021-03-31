Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7452835070B
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 Mar 2021 20:58:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-c4FZEOVSOESV3Pk10q0KZg-1; Wed, 31 Mar 2021 14:57:59 -0400
X-MC-Unique: c4FZEOVSOESV3Pk10q0KZg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26CCE1005D64;
	Wed, 31 Mar 2021 18:57:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 172615D72F;
	Wed, 31 Mar 2021 18:57:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC55B1809C83;
	Wed, 31 Mar 2021 18:57:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12VIvs6x005034 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 31 Mar 2021 14:57:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 58FD22157F23; Wed, 31 Mar 2021 18:57:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53C192166B44
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 18:57:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5F5985A5B9
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 18:57:51 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-407--vpkRSuiMOKlYru_q7qN2w-1; Wed, 31 Mar 2021 14:57:49 -0400
X-MC-Unique: -vpkRSuiMOKlYru_q7qN2w-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lRg01-00502h-Qo; Wed, 31 Mar 2021 18:55:44 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Wed, 31 Mar 2021 19:47:28 +0100
Message-Id: <20210331184728.1188084-28-willy@infradead.org>
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
Subject: [Linux-cachefs] [PATCH v6 27/27] mm/filemap: Convert page wait
	queues to be folios
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

Reinforce that if we're waiting for a bit in a struct page, that's
actually in the head page by changing the type from page to folio.
Increases the size of cachefiles by two bytes, but the kernel core
is unchanged in size.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/cachefiles/rdwr.c    | 16 ++++++++--------
 include/linux/pagemap.h |  8 ++++----
 mm/filemap.c            | 38 +++++++++++++++++++-------------------
 3 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/fs/cachefiles/rdwr.c b/fs/cachefiles/rdwr.c
index 8ffc40e84a59..364af267ebaa 100644
--- a/fs/cachefiles/rdwr.c
+++ b/fs/cachefiles/rdwr.c
@@ -25,20 +25,20 @@ static int cachefiles_read_waiter(wait_queue_entry_t *wait, unsigned mode,
 	struct cachefiles_object *object;
 	struct fscache_retrieval *op = monitor->op;
 	struct wait_page_key *key = _key;
-	struct page *page = wait->private;
+	struct folio *folio = wait->private;
 
 	ASSERT(key);
 
 	_enter("{%lu},%u,%d,{%p,%u}",
 	       monitor->netfs_page->index, mode, sync,
-	       key->page, key->bit_nr);
+	       key->folio, key->bit_nr);
 
-	if (key->page != page || key->bit_nr != PG_locked)
+	if (key->folio != folio || key->bit_nr != PG_locked)
 		return 0;
 
-	_debug("--- monitor %p %lx ---", page, page->flags);
+	_debug("--- monitor %p %lx ---", folio, folio->flags);
 
-	if (!PageUptodate(page) && !PageError(page)) {
+	if (!FolioUptodate(folio) && !FolioError(folio)) {
 		/* unlocked, not uptodate and not erronous? */
 		_debug("page probably truncated");
 	}
@@ -107,7 +107,7 @@ static int cachefiles_read_reissue(struct cachefiles_object *object,
 	put_page(backpage2);
 
 	INIT_LIST_HEAD(&monitor->op_link);
-	add_page_wait_queue(backpage, &monitor->monitor);
+	add_folio_wait_queue(page_folio(backpage), &monitor->monitor);
 
 	if (trylock_page(backpage)) {
 		ret = -EIO;
@@ -294,7 +294,7 @@ static int cachefiles_read_backing_file_one(struct cachefiles_object *object,
 	get_page(backpage);
 	monitor->back_page = backpage;
 	monitor->monitor.private = backpage;
-	add_page_wait_queue(backpage, &monitor->monitor);
+	add_folio_wait_queue(page_folio(backpage), &monitor->monitor);
 	monitor = NULL;
 
 	/* but the page may have been read before the monitor was installed, so
@@ -548,7 +548,7 @@ static int cachefiles_read_backing_file(struct cachefiles_object *object,
 		get_page(backpage);
 		monitor->back_page = backpage;
 		monitor->monitor.private = backpage;
-		add_page_wait_queue(backpage, &monitor->monitor);
+		add_folio_wait_queue(page_folio(backpage), &monitor->monitor);
 		monitor = NULL;
 
 		/* but the page may have been read before the monitor was
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index d800fae55f98..bf38ce40694d 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -690,13 +690,13 @@ static inline pgoff_t linear_page_index(struct vm_area_struct *vma,
 }
 
 struct wait_page_key {
-	struct page *page;
+	struct folio *folio;
 	int bit_nr;
 	int page_match;
 };
 
 struct wait_page_queue {
-	struct page *page;
+	struct folio *folio;
 	int bit_nr;
 	wait_queue_entry_t wait;
 };
@@ -704,7 +704,7 @@ struct wait_page_queue {
 static inline bool wake_page_match(struct wait_page_queue *wait_page,
 				  struct wait_page_key *key)
 {
-	if (wait_page->page != key->page)
+	if (wait_page->folio != key->folio)
 	       return false;
 	key->page_match = 1;
 
@@ -841,7 +841,7 @@ void page_endio(struct page *page, bool is_write, int err);
 /*
  * Add an arbitrary waiter to a page's wait queue
  */
-extern void add_page_wait_queue(struct page *page, wait_queue_entry_t *waiter);
+void add_folio_wait_queue(struct folio *folio, wait_queue_entry_t *waiter);
 
 /*
  * Fault everything in given userspace address range in.
diff --git a/mm/filemap.c b/mm/filemap.c
index 51b2091d402c..b93ea19afd89 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1019,11 +1019,11 @@ EXPORT_SYMBOL(__page_cache_alloc);
  */
 #define PAGE_WAIT_TABLE_BITS 8
 #define PAGE_WAIT_TABLE_SIZE (1 << PAGE_WAIT_TABLE_BITS)
-static wait_queue_head_t page_wait_table[PAGE_WAIT_TABLE_SIZE] __cacheline_aligned;
+static wait_queue_head_t folio_wait_table[PAGE_WAIT_TABLE_SIZE] __cacheline_aligned;
 
-static wait_queue_head_t *page_waitqueue(struct page *page)
+static wait_queue_head_t *folio_waitqueue(struct folio *folio)
 {
-	return &page_wait_table[hash_ptr(page, PAGE_WAIT_TABLE_BITS)];
+	return &folio_wait_table[hash_ptr(folio, PAGE_WAIT_TABLE_BITS)];
 }
 
 void __init pagecache_init(void)
@@ -1031,7 +1031,7 @@ void __init pagecache_init(void)
 	int i;
 
 	for (i = 0; i < PAGE_WAIT_TABLE_SIZE; i++)
-		init_waitqueue_head(&page_wait_table[i]);
+		init_waitqueue_head(&folio_wait_table[i]);
 
 	page_writeback_init();
 }
@@ -1086,10 +1086,10 @@ static int wake_page_function(wait_queue_entry_t *wait, unsigned mode, int sync,
 	 */
 	flags = wait->flags;
 	if (flags & WQ_FLAG_EXCLUSIVE) {
-		if (test_bit(key->bit_nr, &key->page->flags))
+		if (test_bit(key->bit_nr, &key->folio->flags))
 			return -1;
 		if (flags & WQ_FLAG_CUSTOM) {
-			if (test_and_set_bit(key->bit_nr, &key->page->flags))
+			if (test_and_set_bit(key->bit_nr, &key->folio->flags))
 				return -1;
 			flags |= WQ_FLAG_DONE;
 		}
@@ -1123,12 +1123,12 @@ static int wake_page_function(wait_queue_entry_t *wait, unsigned mode, int sync,
 
 static void wake_up_folio_bit(struct folio *folio, int bit_nr)
 {
-	wait_queue_head_t *q = page_waitqueue(&folio->page);
+	wait_queue_head_t *q = folio_waitqueue(folio);
 	struct wait_page_key key;
 	unsigned long flags;
 	wait_queue_entry_t bookmark;
 
-	key.page = &folio->page;
+	key.folio = folio;
 	key.bit_nr = bit_nr;
 	key.page_match = 0;
 
@@ -1220,7 +1220,7 @@ int sysctl_page_lock_unfairness = 5;
 static inline int wait_on_folio_bit_common(struct folio *folio, int bit_nr,
 		int state, enum behavior behavior)
 {
-	wait_queue_head_t *q = page_waitqueue(&folio->page);
+	wait_queue_head_t *q = folio_waitqueue(folio);
 	int unfairness = sysctl_page_lock_unfairness;
 	struct wait_page_queue wait_page;
 	wait_queue_entry_t *wait = &wait_page.wait;
@@ -1240,7 +1240,7 @@ static inline int wait_on_folio_bit_common(struct folio *folio, int bit_nr,
 
 	init_wait(wait);
 	wait->func = wake_page_function;
-	wait_page.page = &folio->page;
+	wait_page.folio = folio;
 	wait_page.bit_nr = bit_nr;
 
 repeat:
@@ -1389,23 +1389,23 @@ int put_and_wait_on_page_locked(struct page *page, int state)
 }
 
 /**
- * add_page_wait_queue - Add an arbitrary waiter to a page's wait queue
- * @page: Page defining the wait queue of interest
+ * add_folio_wait_queue - Add an arbitrary waiter to a folio's wait queue
+ * @folio: Folio defining the wait queue of interest
  * @waiter: Waiter to add to the queue
  *
- * Add an arbitrary @waiter to the wait queue for the nominated @page.
+ * Add an arbitrary @waiter to the wait queue for the nominated @folio.
  */
-void add_page_wait_queue(struct page *page, wait_queue_entry_t *waiter)
+void add_folio_wait_queue(struct folio *folio, wait_queue_entry_t *waiter)
 {
-	wait_queue_head_t *q = page_waitqueue(page);
+	wait_queue_head_t *q = folio_waitqueue(folio);
 	unsigned long flags;
 
 	spin_lock_irqsave(&q->lock, flags);
 	__add_wait_queue_entry_tail(q, waiter);
-	SetPageWaiters(page);
+	SetFolioWaiters(folio);
 	spin_unlock_irqrestore(&q->lock, flags);
 }
-EXPORT_SYMBOL_GPL(add_page_wait_queue);
+EXPORT_SYMBOL_GPL(add_folio_wait_queue);
 
 #ifndef clear_bit_unlock_is_negative_byte
 
@@ -1550,10 +1550,10 @@ EXPORT_SYMBOL_GPL(__lock_folio_killable);
 
 static int __lock_folio_async(struct folio *folio, struct wait_page_queue *wait)
 {
-	struct wait_queue_head *q = page_waitqueue(&folio->page);
+	struct wait_queue_head *q = folio_waitqueue(folio);
 	int ret = 0;
 
-	wait->page = &folio->page;
+	wait->folio = folio;
 	wait->bit_nr = PG_locked;
 
 	spin_lock_irq(&q->lock);
-- 
2.30.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

