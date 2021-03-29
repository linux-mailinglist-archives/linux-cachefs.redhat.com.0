Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DC32D34D00F
	for <lists+linux-cachefs@lfdr.de>; Mon, 29 Mar 2021 14:30:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-pzOW5mpCNEOQNQt2eM0rQg-1; Mon, 29 Mar 2021 08:30:25 -0400
X-MC-Unique: pzOW5mpCNEOQNQt2eM0rQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35C2010866A4;
	Mon, 29 Mar 2021 12:30:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E2085C239;
	Mon, 29 Mar 2021 12:30:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 27CCC4BB7C;
	Mon, 29 Mar 2021 12:30:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12T6No13026834 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 29 Mar 2021 02:23:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 20034111285A; Mon, 29 Mar 2021 06:23:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BCAF1112C3F
	for <linux-cachefs@redhat.com>; Mon, 29 Mar 2021 06:23:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53262101A52C
	for <linux-cachefs@redhat.com>; Mon, 29 Mar 2021 06:23:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-512-IykimrwVMxyvSxJvjOBfGA-1;
	Mon, 29 Mar 2021 02:23:45 -0400
X-MC-Unique: IykimrwVMxyvSxJvjOBfGA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36DC361964;
	Mon, 29 Mar 2021 06:15:19 +0000 (UTC)
To: dhowells@redhat.com, gregkh@linuxfoundation.org, hch@lst.de,
	kafs-testing@auristor.com, linux-cachefs@redhat.com,
	linux-mm@kvack.org, willy@infradead.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 29 Mar 2021 08:15:03 +0200
Message-ID: <16169985039077@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12T6No13026834
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 29 Mar 2021 08:30:16 -0400
Cc: stable-commits@vger.kernel.org
Subject: [Linux-cachefs] Patch "fs/cachefiles: Remove wait_bit_key layout
	dependency" has been added to the 5.11-stable tree
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


This is a note to let you know that I've just added the patch titled

    fs/cachefiles: Remove wait_bit_key layout dependency

to the 5.11-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fs-cachefiles-remove-wait_bit_key-layout-dependency.patch
and it can be found in the queue-5.11 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From 39f985c8f667c80a3d1eb19d31138032fa36b09e Mon Sep 17 00:00:00 2001
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Date: Sat, 20 Mar 2021 05:40:38 +0000
Subject: fs/cachefiles: Remove wait_bit_key layout dependency

From: Matthew Wilcox (Oracle) <willy@infradead.org>

commit 39f985c8f667c80a3d1eb19d31138032fa36b09e upstream.

Cachefiles was relying on wait_page_key and wait_bit_key being the
same layout, which is fragile.  Now that wait_page_key is exposed in
the pagemap.h header, we can remove that fragility

A comment on the need to maintain structure layout equivalence was added by
Linus[1] and that is no longer applicable.

Fixes: 62906027091f ("mm: add PageWaiters indicating tasks are waiting for a page bit")
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: David Howells <dhowells@redhat.com>
Tested-by: kafs-testing@auristor.com
cc: linux-cachefs@redhat.com
cc: linux-mm@kvack.org
Link: https://lore.kernel.org/r/20210320054104.1300774-2-willy@infradead.org/
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3510ca20ece0150af6b10c77a74ff1b5c198e3e2 [1]
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/cachefiles/rdwr.c    |    7 +++----
 include/linux/pagemap.h |    1 -
 2 files changed, 3 insertions(+), 5 deletions(-)

--- a/fs/cachefiles/rdwr.c
+++ b/fs/cachefiles/rdwr.c
@@ -24,17 +24,16 @@ static int cachefiles_read_waiter(wait_q
 		container_of(wait, struct cachefiles_one_read, monitor);
 	struct cachefiles_object *object;
 	struct fscache_retrieval *op = monitor->op;
-	struct wait_bit_key *key = _key;
+	struct wait_page_key *key = _key;
 	struct page *page = wait->private;
 
 	ASSERT(key);
 
 	_enter("{%lu},%u,%d,{%p,%u}",
 	       monitor->netfs_page->index, mode, sync,
-	       key->flags, key->bit_nr);
+	       key->page, key->bit_nr);
 
-	if (key->flags != &page->flags ||
-	    key->bit_nr != PG_locked)
+	if (key->page != page || key->bit_nr != PG_locked)
 		return 0;
 
 	_debug("--- monitor %p %lx ---", page, page->flags);
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -559,7 +559,6 @@ static inline pgoff_t linear_page_index(
 	return pgoff;
 }
 
-/* This has the same layout as wait_bit_key - see fs/cachefiles/rdwr.c */
 struct wait_page_key {
 	struct page *page;
 	int bit_nr;


Patches currently in stable-queue which might be from willy@infradead.org are

queue-5.11/fs-cachefiles-remove-wait_bit_key-layout-dependency.patch


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

