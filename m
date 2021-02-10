Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 83781316B31
	for <lists+linux-cachefs@lfdr.de>; Wed, 10 Feb 2021 17:29:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612974566;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bj67R4nLa1Zerz455rh18SBDnMmJGQRrJv0+zxB2L1o=;
	b=QCFNvkFnIMdm9oRw++0vyRRun/tXvxsARl+wA9nQcb0ZKp31ORcRhQcH0cyLM6Klejzx53
	3MTkAAUPgW6PKFGzT03K10vMMIEqJEK+sgpz5NxboU4U2Ey1qycN+zkd43lXFFT0vVk/fZ
	+EkVRP665Pq8Ie+nPNaI+o2/rrijLSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-sxoCMgRiMrWb-xa3GNFTYQ-1; Wed, 10 Feb 2021 11:29:24 -0500
X-MC-Unique: sxoCMgRiMrWb-xa3GNFTYQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B60D3801979;
	Wed, 10 Feb 2021 16:29:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DBD819D7C;
	Wed, 10 Feb 2021 16:29:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 203F118095C9;
	Wed, 10 Feb 2021 16:29:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11AGTEUB010477 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 10 Feb 2021 11:29:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8DD9A60C64; Wed, 10 Feb 2021 16:29:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4622660C0F;
	Wed, 10 Feb 2021 16:29:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
References: <CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
	<591237.1612886997@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Wed, 10 Feb 2021 16:29:07 +0000
Message-ID: <1330473.1612974547@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11AGTEUB010477
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: [Linux-cachefs] [GIT PULL] fscache: I/O API modernisation and
	netfs helper library
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1330472.1612974547.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> The PG_fscache bit waiting functions are completely crazy. The comment
> about "this will wake up others" is actively wrong, and the waiting
> function looks insane, because you're mixing the two names for
> "fscache" which makes the code look totally incomprehensible. Why
> would we wait for PF_fscache, when PG_private_2 was set? Yes, I know
> why, but the code looks entirely nonsensical.

How about the attached change to make it more coherent and fix the doc
comment?

David
---
commit 9a28f7e68602193ce020a41f855f71cc55f693b9
Author: David Howells <dhowells@redhat.com>
Date:   Wed Feb 10 10:53:02 2021 +0000

    netfs: Rename unlock_page_fscache() and wait_on_page_fscache()
    
    Rename unlock_page_fscache() to unlock_page_private_2() and
    wait_on_page_fscache() to wait_on_page_private_2() and change the
    references to PG_fscache to PG_private_2 also.  This makes these functions
    look more generic and doesn't mix the terminology.
    
    Fix the kdoc comment as the wake up mechanism doesn't wake up all the
    sleepers.  Note the example usage case for the functions in conjunction
    with the cache also.
    
    Alias the functions in linux/netfs.h.
    
    Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
    Signed-off-by: David Howells <dhowells@redhat.com>

diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 2ffdef1ded91..d4cb6e6f704c 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -24,6 +24,8 @@
 #define ClearPageFsCache(page)		ClearPagePrivate2((page))
 #define TestSetPageFsCache(page)	TestSetPagePrivate2((page))
 #define TestClearPageFsCache(page)	TestClearPagePrivate2((page))
+#define wait_on_page_fscache(page)	wait_on_page_private_2((page))
+#define unlock_page_fscache(page)	unlock_page_private_2((page))
 
 enum netfs_read_source {
 	NETFS_FILL_WITH_ZEROES,
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 4935ad6171c1..a88ccc9ab0b1 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -591,7 +591,7 @@ extern int __lock_page_async(struct page *page, struct wait_page_queue *wait);
 extern int __lock_page_or_retry(struct page *page, struct mm_struct *mm,
 				unsigned int flags);
 extern void unlock_page(struct page *page);
-extern void unlock_page_fscache(struct page *page);
+extern void unlock_page_private_2(struct page *page);
 
 /*
  * Return true if the page was successfully locked
@@ -683,16 +683,17 @@ static inline int wait_on_page_locked_killable(struct page *page)
 }
 
 /**
- * wait_on_page_fscache - Wait for PG_fscache to be cleared on a page
+ * wait_on_page_private_2 - Wait for PG_private_2 to be cleared on a page
  * @page: The page
  *
- * Wait for the fscache mark to be removed from a page, usually signifying the
- * completion of a write from that page to the cache.
+ * Wait for the PG_private_2 page bit to be removed from a page.  This is, for
+ * example, used to handle a netfs page being written to a local disk cache,
+ * thereby allowing writes to the cache for the same page to be serialised.
  */
-static inline void wait_on_page_fscache(struct page *page)
+static inline void wait_on_page_private_2(struct page *page)
 {
 	if (PagePrivate2(page))
-		wait_on_page_bit(compound_head(page), PG_fscache);
+		wait_on_page_bit(compound_head(page), PG_private_2);
 }
 
 extern void put_and_wait_on_page_locked(struct page *page);
diff --git a/mm/filemap.c b/mm/filemap.c
index 91fcae006d64..7d321152d579 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1467,22 +1467,24 @@ void unlock_page(struct page *page)
 EXPORT_SYMBOL(unlock_page);
 
 /**
- * unlock_page_fscache - Unlock a page pinned with PG_fscache
+ * unlock_page_private_2 - Unlock a page that's locked with PG_private_2
  * @page: The page
  *
- * Unlocks the page and wakes up sleepers in wait_on_page_fscache().  Also
- * wakes those waiting for the lock and writeback bits because the wakeup
- * mechanism is shared.  But that's OK - those sleepers will just go back to
- * sleep.
+ * Unlocks a page that's locked with PG_private_2 and wakes up sleepers in
+ * wait_on_page_private_2().
+ *
+ * This is, for example, used when a netfs page is being written to a local
+ * disk cache, thereby allowing writes to the cache for the same page to be
+ * serialised.
  */
-void unlock_page_fscache(struct page *page)
+void unlock_page_private_2(struct page *page)
 {
 	page = compound_head(page);
 	VM_BUG_ON_PAGE(!PagePrivate2(page), page);
-	clear_bit_unlock(PG_fscache, &page->flags);
-	wake_up_page_bit(page, PG_fscache);
+	clear_bit_unlock(PG_private_2, &page->flags);
+	wake_up_page_bit(page, PG_private_2);
 }
-EXPORT_SYMBOL(unlock_page_fscache);
+EXPORT_SYMBOL(unlock_page_private_2);
 
 /**
  * end_page_writeback - end writeback against a page

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

