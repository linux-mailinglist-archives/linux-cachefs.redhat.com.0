Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 179F62FDC62
	for <lists+linux-cachefs@lfdr.de>; Wed, 20 Jan 2021 23:24:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611181471;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2tCMSgGTT+FSjGC7t8bKdyXRhnL/UUAkSuyGCHMZ9mc=;
	b=bGNOlER9gr9GirTnW12izzKf9wFmn0YJPWgnJHcaDlDAH9P5QphoOyZQDXIXdP+I2cCWzp
	SFPMUM+WllQKlQlMWhuzCb+biyk52wkkEOb+bFIEmKLMNraN8rykKVRakRMVtqRi0ldQnz
	WknTOLPFqCQmHIxfLmZtG4MOUyN+Afw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-LrLXtzgvPdGTWzdm4pu6_Q-1; Wed, 20 Jan 2021 17:24:29 -0500
X-MC-Unique: LrLXtzgvPdGTWzdm4pu6_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61521806662;
	Wed, 20 Jan 2021 22:24:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0199E1002EE6;
	Wed, 20 Jan 2021 22:24:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA624180954D;
	Wed, 20 Jan 2021 22:24:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10KMLqfH007593 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 20 Jan 2021 17:21:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A34852C15A; Wed, 20 Jan 2021 22:21:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE53972161;
	Wed, 20 Jan 2021 22:21:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Wed, 20 Jan 2021 22:21:49 +0000
Message-ID: <161118130899.1232039.12854903243561277618.stgit@warthog.procyon.org.uk>
In-Reply-To: <161118128472.1232039.11746799833066425131.stgit@warthog.procyon.org.uk>
References: <161118128472.1232039.11746799833066425131.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 02/25] vm: Add wait/unlock functions for
	PG_fscache
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add functions to unlock and wait for unlock of PG_fscache analogously with
those for PG_lock.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/linux/pagemap.h |   14 ++++++++++++++
 mm/filemap.c            |   18 ++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index d5570deff400..1fa160e682fa 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -591,6 +591,7 @@ extern int __lock_page_async(struct page *page, struct wait_page_queue *wait);
 extern int __lock_page_or_retry(struct page *page, struct mm_struct *mm,
 				unsigned int flags);
 extern void unlock_page(struct page *page);
+extern void unlock_page_fscache(struct page *page);
 
 /*
  * Return true if the page was successfully locked
@@ -681,6 +682,19 @@ static inline int wait_on_page_locked_killable(struct page *page)
 	return wait_on_page_bit_killable(compound_head(page), PG_locked);
 }
 
+/**
+ * wait_on_page_fscache - Wait for PG_fscache to be cleared on a page
+ * @page: The page
+ *
+ * Wait for the fscache mark to be removed from a page, usually signifying the
+ * completion of a write from that page to the cache.
+ */
+static inline void wait_on_page_fscache(struct page *page)
+{
+	if (PagePrivate2(page))
+		wait_on_page_bit(compound_head(page), PG_fscache);
+}
+
 extern void put_and_wait_on_page_locked(struct page *page);
 
 void wait_on_page_writeback(struct page *page);
diff --git a/mm/filemap.c b/mm/filemap.c
index 5c9d564317a5..91fcae006d64 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1466,6 +1466,24 @@ void unlock_page(struct page *page)
 }
 EXPORT_SYMBOL(unlock_page);
 
+/**
+ * unlock_page_fscache - Unlock a page pinned with PG_fscache
+ * @page: The page
+ *
+ * Unlocks the page and wakes up sleepers in wait_on_page_fscache().  Also
+ * wakes those waiting for the lock and writeback bits because the wakeup
+ * mechanism is shared.  But that's OK - those sleepers will just go back to
+ * sleep.
+ */
+void unlock_page_fscache(struct page *page)
+{
+	page = compound_head(page);
+	VM_BUG_ON_PAGE(!PagePrivate2(page), page);
+	clear_bit_unlock(PG_fscache, &page->flags);
+	wake_up_page_bit(page, PG_fscache);
+}
+EXPORT_SYMBOL(unlock_page_fscache);
+
 /**
  * end_page_writeback - end writeback against a page
  * @page: the page


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

