Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 43F093195E7
	for <lists+linux-cachefs@lfdr.de>; Thu, 11 Feb 2021 23:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613083159;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q26HW5wjDPYKg+2nPcUrcQvIjd2nUGtL2GjV5FBX6dE=;
	b=BEJ4KbAhdZE7OM4gVcvhZ+by9O3wg8RvnT3tn3POpLnOTgaZQ7NaQTODd5DQwRQyxmplep
	gz9WXU+BsuwzTiWmHRnuOKqdgv74FvWTUs5BeNcGLrjjoRWoAz5qZW1BWSU9hvyvJVhiD+
	oy6FdfYYkM4QkKJYXyIYfqbCe6flnPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-SMaUE1IsPn-jrjhMjUwS8A-1; Thu, 11 Feb 2021 17:39:16 -0500
X-MC-Unique: SMaUE1IsPn-jrjhMjUwS8A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA2C780402E;
	Thu, 11 Feb 2021 22:39:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E61045D9C2;
	Thu, 11 Feb 2021 22:39:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D562F4E58D;
	Thu, 11 Feb 2021 22:39:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11BMd4uZ003439 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 11 Feb 2021 17:39:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0CEBB100239A; Thu, 11 Feb 2021 22:39:04 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com
	[10.10.119.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 981F710013D7;
	Thu, 11 Feb 2021 22:38:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wjgA-74ddehziVk=XAEMTKswPu1Yw4uaro1R3ibs27ztw@mail.gmail.com>
References: <CAHk-=wjgA-74ddehziVk=XAEMTKswPu1Yw4uaro1R3ibs27ztw@mail.gmail.com>
	<CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
	<591237.1612886997@warthog.procyon.org.uk>
	<1330473.1612974547@warthog.procyon.org.uk>
	<1330751.1612974783@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Thu, 11 Feb 2021 22:38:56 +0000
Message-ID: <25541.1613083136@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11BMd4uZ003439
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <25540.1613083136.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> ...
> IOW, I'm not against "wait_on_page_fscache()" as a function, but I
> *am* against the odd _mixing_ of things without a big explanation,
> where the code itself looks very odd and questionable.
> 
> And I think the "fscache" waiting functions should not be visible to
> any core VM or filesystem code - it should be limited explicitly to
> those filesystems that use fscache, and include that header file.

Okay...  How about the attached then?

I've also discarded the patch that just moves towards completely getting rid
of PG_fscache and adjusted the third patch that takes a ref on the page for
the duration to handle the change of names.

Speaking of the ref-taking patch, is the one I posted yesterday the sort of
thing you wanted for that?  I wonder if I should drop the ref in the unlock
function, though doing it afterwards does allow for the possibility of using a
pagevec to do mass-release.

> Wouldn't that make sense?

Well, that's the current principle, but I was wondering if the alias was
causing confusion.

David
---
commit c723f0232c9f8928b3b15786499637bda3121f41
Author: David Howells <dhowells@redhat.com>
Date:   Wed Feb 10 10:53:02 2021 +0000

    netfs: Rename unlock_page_fscache() and move wait_on_page_fscache()
    
    Rename unlock_page_fscache() to unlock_page_private_2() and change the
    references to PG_fscache to PG_private_2 also.  This makes it look more
    generic and doesn't mix the terminology.
    
    Fix the kdoc comment on the above as the wake up mechanism doesn't wake up
    all the sleepers.  Note the example usage case for the function in
    conjunction with the cache also.
    
    Place unlock_page_fscache() as an alias in linux/netfs.h.
    
    Move wait_on_page_fscache() to linux/netfs.h.
    
    [v2: Implement suggestion by Linus to move the wait function into netfs.h]
    
    Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
    Signed-off-by: David Howells <dhowells@redhat.com>
    Tested-by: Jeff Layton <jlayton@kernel.org>
    Link: https://lore.kernel.org/linux-fsdevel/1330473.1612974547@warthog.procyon.org.uk/
    Link: https://lore.kernel.org/linux-fsdevel/CAHk-=wjgA-74ddehziVk=XAEMTKswPu1Yw4uaro1R3ibs27ztw@mail.gmail.com/

diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 2ffdef1ded91..59c2623dc408 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -14,6 +14,7 @@
 
 #include <linux/workqueue.h>
 #include <linux/fs.h>
+#include <linux/pagemap.h>
 
 /*
  * Overload PG_private_2 to give us PG_fscache - this is used to indicate that
@@ -25,6 +26,35 @@
 #define TestSetPageFsCache(page)	TestSetPagePrivate2((page))
 #define TestClearPageFsCache(page)	TestClearPagePrivate2((page))
 
+/**
+ * unlock_page_fscache - Unlock a page that's locked with PG_fscache
+ * @page: The page
+ *
+ * Unlocks a page that's locked with PG_fscache and wakes up sleepers in
+ * wait_on_page_fscache().  This page bit is used by the netfs helpers when a
+ * netfs page is being written to a local disk cache, thereby allowing writes
+ * to the cache for the same page to be serialised.
+ */
+static inline void unlock_page_fscache(struct page *page)
+{
+	unlock_page_private_2(page);
+}
+
+/**
+ * wait_on_page_fscache - Wait for PG_fscache to be cleared on a page
+ * @page: The page
+ *
+ * Wait for the PG_fscache (PG_private_2) page bit to be removed from a page.
+ * This is, for example, used to handle a netfs page being written to a local
+ * disk cache, thereby allowing writes to the cache for the same page to be
+ * serialised.
+ */
+static inline void wait_on_page_fscache(struct page *page)
+{
+	if (PageFsCache(page))
+		wait_on_page_bit(compound_head(page), PG_fscache);
+}
+
 enum netfs_read_source {
 	NETFS_FILL_WITH_ZEROES,
 	NETFS_DOWNLOAD_FROM_SERVER,
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 4935ad6171c1..d2786607d297 100644
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
@@ -682,19 +682,6 @@ static inline int wait_on_page_locked_killable(struct page *page)
 	return wait_on_page_bit_killable(compound_head(page), PG_locked);
 }
 
-/**
- * wait_on_page_fscache - Wait for PG_fscache to be cleared on a page
- * @page: The page
- *
- * Wait for the fscache mark to be removed from a page, usually signifying the
- * completion of a write from that page to the cache.
- */
-static inline void wait_on_page_fscache(struct page *page)
-{
-	if (PagePrivate2(page))
-		wait_on_page_bit(compound_head(page), PG_fscache);
-}
-
 extern void put_and_wait_on_page_locked(struct page *page);
 
 void wait_on_page_writeback(struct page *page);
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

