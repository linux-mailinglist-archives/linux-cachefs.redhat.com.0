Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C4EBB34D013
	for <lists+linux-cachefs@lfdr.de>; Mon, 29 Mar 2021 14:30:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-BKwKjxx2Mq2GcefF1VgmXA-1; Mon, 29 Mar 2021 08:30:26 -0400
X-MC-Unique: BKwKjxx2Mq2GcefF1VgmXA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A253107B7C5;
	Mon, 29 Mar 2021 12:30:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36F7E60843;
	Mon, 29 Mar 2021 12:30:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4860F1809C84;
	Mon, 29 Mar 2021 12:30:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12T8Q3Ao007870 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 29 Mar 2021 04:26:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C13F21CAC71; Mon, 29 Mar 2021 08:26:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 214812166B44
	for <linux-cachefs@redhat.com>; Mon, 29 Mar 2021 08:26:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D349805F44
	for <linux-cachefs@redhat.com>; Mon, 29 Mar 2021 08:26:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-75-dh1rW2NtPEewJ4N1G_q4hA-1; 
	Mon, 29 Mar 2021 04:25:57 -0400
X-MC-Unique: dh1rW2NtPEewJ4N1G_q4hA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95E5D61477;
	Mon, 29 Mar 2021 08:25:55 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Mon, 29 Mar 2021 09:59:01 +0200
Message-Id: <20210329075636.118348118@linuxfoundation.org>
In-Reply-To: <20210329075629.172032742@linuxfoundation.org>
References: <20210329075629.172032742@linuxfoundation.org>
User-Agent: quilt/0.66
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
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12T8Q3Ao007870
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 29 Mar 2021 08:30:16 -0400
Cc: kafs-testing@auristor.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	stable@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH 5.10 210/221] fs/cachefiles: Remove
	wait_bit_key layout dependency
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



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

