Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 92C6A345D5F
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Mar 2021 12:53:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616500429;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rZIk047wOrjduFFon3TtwAEFq6wk13KHjJZALYLiF7o=;
	b=EDSD6pREcf762pkJ7s+JoAtvI//Qw7mLkg/chKpoVPxh1w19xPF7tOGqnzSoCD4bct9Pxi
	vQu7LHfQmDBlFpzxAX0IosXiXHDCyFHgNMUKeRmwDZbv2QAXBNdFewkBFFV+j5PMEKn8hK
	T0wBvL7Wbi2ZevxzEHIYc4OwBBk9kmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-mx0m7rBONTqYMj1V8Ep7DA-1; Tue, 23 Mar 2021 07:53:47 -0400
X-MC-Unique: mx0m7rBONTqYMj1V8Ep7DA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4075839A44;
	Tue, 23 Mar 2021 11:53:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80C3C5D6AD;
	Tue, 23 Mar 2021 11:53:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 903311809C83;
	Tue, 23 Mar 2021 11:53:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NBrfQF025395 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 07:53:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C25BC5D6BA; Tue, 23 Mar 2021 11:53:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-58.rdu2.redhat.com
	[10.10.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 123875D6AD;
	Tue, 23 Mar 2021 11:53:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com, linux-afs@lists.infradead.org
Date: Tue, 23 Mar 2021 11:53:36 +0000
Message-ID: <161650041625.2445805.664163782892781172.stgit@warthog.procyon.org.uk>
In-Reply-To: <161650040278.2445805.7652115256944270457.stgit@warthog.procyon.org.uk>
References: <161650040278.2445805.7652115256944270457.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH 1/3] fs/cachefiles: Remove wait_bit_key
	layout dependency
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

From: Matthew Wilcox (Oracle) <willy@infradead.org>

Cachefiles was relying on wait_page_key and wait_bit_key being the
same layout, which is fragile.  Now that wait_page_key is exposed in
the pagemap.h header, we can remove that fragility

A comment on the need to maintain structure layout equivalence was added by
Linus[1] and that is no longer applicable.

Fixes: 62906027091f ("mm: add PageWaiters indicating tasks are waiting for a page bit")
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
cc: linux-mm@kvack.org
Link: https://lore.kernel.org/r/20210320054104.1300774-2-willy@infradead.org/
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3510ca20ece0150af6b10c77a74ff1b5c198e3e2 [1]
---

 fs/cachefiles/rdwr.c    |    7 +++----
 include/linux/pagemap.h |    1 -
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/cachefiles/rdwr.c b/fs/cachefiles/rdwr.c
index e027c718ca01..8ffc40e84a59 100644
--- a/fs/cachefiles/rdwr.c
+++ b/fs/cachefiles/rdwr.c
@@ -24,17 +24,16 @@ static int cachefiles_read_waiter(wait_queue_entry_t *wait, unsigned mode,
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
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 20225b067583..8f4daac6eb4b 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -559,7 +559,6 @@ static inline pgoff_t linear_page_index(struct vm_area_struct *vma,
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

