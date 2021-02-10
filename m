Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 607D0316B43
	for <lists+linux-cachefs@lfdr.de>; Wed, 10 Feb 2021 17:33:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612974798;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0rWAFNsiCWCg2Un1JGP33BMacQsEeGRGiJHJfuKW8gM=;
	b=fhZ7RjnJHEQm6Zs3ZUzp665Cb5P7zct8G/TNunll7GTqV9OYcrFTfeuvZpGaMdmnfbbXER
	4H8xKZv7NyIMM1w51qsOOV429FbhIEF5cncyINtdx6rttkeEytMMBKiBazP+CemqW1SMmh
	AkDBdEZJPysP+ZdJcwdtB7nckgQBwTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-lbT6zaV9OYiGKioAORkl_g-1; Wed, 10 Feb 2021 11:33:15 -0500
X-MC-Unique: lbT6zaV9OYiGKioAORkl_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 275FE107ACED;
	Wed, 10 Feb 2021 16:33:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15DB9679FD;
	Wed, 10 Feb 2021 16:33:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62FA358074;
	Wed, 10 Feb 2021 16:33:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11AGXADf011031 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 10 Feb 2021 11:33:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 730FC2B0AC; Wed, 10 Feb 2021 16:33:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 05DA760622;
	Wed, 10 Feb 2021 16:33:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1330473.1612974547@warthog.procyon.org.uk>
References: <1330473.1612974547@warthog.procyon.org.uk>
	<CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
	<591237.1612886997@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Wed, 10 Feb 2021 16:33:03 +0000
Message-ID: <1330751.1612974783@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11AGXADf011031
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1330750.1612974783.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> > The PG_fscache bit waiting functions are completely crazy. The comment
> > about "this will wake up others" is actively wrong, and the waiting
> > function looks insane, because you're mixing the two names for
> > "fscache" which makes the code look totally incomprehensible. Why
> > would we wait for PF_fscache, when PG_private_2 was set? Yes, I know
> > why, but the code looks entirely nonsensical.
> 
> How about the attached change to make it more coherent and fix the doc
> comment?

Then I could follow it up with this patch here, moving towards dropping the
PG_fscache alias for the new API.

David
---
commit b415fafb07166732933242e938626fc6cdbdbc5b
Author: David Howells <dhowells@redhat.com>
Date:   Wed Feb 10 11:22:59 2021 +0000

    netfs: Move towards dropping the PG_fscache alias for PG_private_2
    
    Move towards dropping the PG_fscache alias for PG_private_2 with the new
    fscache I/O API and netfs helper lib (this does not alter the old API).
    
    Signed-off-by: David Howells <dhowells@redhat.com>

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 8f28d4f4cfd7..bb8c6d501292 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -438,7 +438,7 @@ static void afs_invalidatepage(struct page *page, unsigned int offset,
 	if (PagePrivate(page))
 		afs_invalidate_dirty(page, offset, length);
 
-	wait_on_page_fscache(page);
+	wait_on_page_private_2(page);
 	_leave("");
 }
 
@@ -457,10 +457,10 @@ static int afs_releasepage(struct page *page, gfp_t gfp_flags)
 	/* deny if page is being written to the cache and the caller hasn't
 	 * elected to wait */
 #ifdef CONFIG_AFS_FSCACHE
-	if (PageFsCache(page)) {
+	if (PagePrivate2(page)) {
 		if (!(gfp_flags & __GFP_DIRECT_RECLAIM) || !(gfp_flags & __GFP_FS))
 			return false;
-		wait_on_page_fscache(page);
+		wait_on_page_private_2(page);
 	}
 #endif
 
diff --git a/fs/afs/write.c b/fs/afs/write.c
index e672833c99bc..9c554981f53b 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -118,7 +118,7 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
 	}
 
 #ifdef CONFIG_AFS_FSCACHE
-	wait_on_page_fscache(page);
+	wait_on_page_private_2(page);
 #endif
 
 	index = page->index;
@@ -929,8 +929,8 @@ vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
 	 * be modified.  We then assume the entire page will need writing back.
 	 */
 #ifdef CONFIG_AFS_FSCACHE
-	if (PageFsCache(page) &&
-	    wait_on_page_bit_killable(page, PG_fscache) < 0)
+	if (PagePrivate2(page) &&
+	    wait_on_page_bit_killable(page, PG_private_2) < 0)
 		return VM_FAULT_RETRY;
 #endif
 
@@ -1026,6 +1026,6 @@ int afs_launder_page(struct page *page)
 
 	trace_afs_page_dirty(vnode, tracepoint_string("laundered"), page);
 	detach_page_private(page);
-	wait_on_page_fscache(page);
+	wait_on_page_private_2(page);
 	return ret;
 }
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 0dd64d31eff6..fd2498567b49 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -147,7 +147,7 @@ static void ceph_invalidatepage(struct page *page, unsigned int offset,
 	struct ceph_inode_info *ci;
 	struct ceph_snap_context *snapc = page_snap_context(page);
 
-	wait_on_page_fscache(page);
+	wait_on_page_private_2(page);
 
 	inode = page->mapping->host;
 	ci = ceph_inode(inode);
@@ -176,10 +176,10 @@ static int ceph_releasepage(struct page *page, gfp_t gfp_flags)
 	dout("%p releasepage %p idx %lu (%sdirty)\n", page->mapping->host,
 	     page, page->index, PageDirty(page) ? "" : "not ");
 
-	if (PageFsCache(page)) {
+	if (PagePrivate2(page)) {
 		if (!(gfp_flags & __GFP_DIRECT_RECLAIM) || !(gfp_flags & __GFP_FS))
 			return 0;
-		wait_on_page_fscache(page);
+		wait_on_page_private_2(page);
 	}
 	return !PagePrivate(page);
 }
@@ -1258,7 +1258,7 @@ static int ceph_write_begin(struct file *file, struct address_space *mapping,
 			      &ceph_netfs_write_begin_ops, NULL);
 out:
 	if (r == 0)
-		wait_on_page_fscache(page);
+		wait_on_page_private_2(page);
 	if (r < 0) {
 		if (page)
 			put_page(page);
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 156941e0de61..9018224693e9 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -223,7 +223,7 @@ static void netfs_rreq_completed(struct netfs_read_request *rreq)
 
 /*
  * Deal with the completion of writing the data to the cache.  We have to clear
- * the PG_fscache bits on the pages involved and release the caller's ref.
+ * the PG_private_2 bits on the pages involved and release the caller's ref.
  *
  * May be called in softirq mode and we inherit a ref from the caller.
  */
@@ -246,7 +246,7 @@ static void netfs_rreq_unmark_after_write(struct netfs_read_request *rreq)
 			if (have_unlocked && page->index <= unlocked)
 				continue;
 			unlocked = page->index;
-			unlock_page_fscache(page);
+			unlock_page_private_2(page);
 			have_unlocked = true;
 		}
 	}
@@ -357,7 +357,7 @@ static void netfs_rreq_write_to_cache(struct netfs_read_request *rreq)
 }
 
 /*
- * Unlock the pages in a read operation.  We need to set PG_fscache on any
+ * Unlock the pages in a read operation.  We need to set PG_private_2 on any
  * pages we're going to write back before we unlock them.
  */
 static void netfs_rreq_unlock(struct netfs_read_request *rreq)
@@ -404,7 +404,7 @@ static void netfs_rreq_unlock(struct netfs_read_request *rreq)
 				break;
 			}
 			if (test_bit(NETFS_SREQ_WRITE_TO_CACHE, &subreq->flags))
-				SetPageFsCache(page);
+				SetPagePrivate2(page);
 			pg_failed |= subreq_failed;
 			if (pgend < iopos + subreq->len)
 				break;
@@ -1142,7 +1142,7 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 		goto error;
 
 have_page:
-	wait_on_page_fscache(page);
+	wait_on_page_private_2(page);
 have_page_no_wait:
 	if (netfs_priv)
 		ops->cleanup(netfs_priv, mapping);
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 3f177faa0ac2..ccf533288291 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -29,6 +29,17 @@
 #define fscache_cookie_valid(cookie) (0)
 #endif
 
+#ifndef FSCACHE_USE_NEW_IO_API
+/*
+ * Overload PG_private_2 to give us PG_fscache - this is used to indicate that
+ * a page is currently backed by a local disk cache
+ */
+#define PageFsCache(page)		PagePrivate2((page))
+#define SetPageFsCache(page)		SetPagePrivate2((page))
+#define ClearPageFsCache(page)		ClearPagePrivate2((page))
+#define TestSetPageFsCache(page)	TestSetPagePrivate2((page))
+#define TestClearPageFsCache(page)	TestClearPagePrivate2((page))
+#endif
 
 /* pattern used to fill dead space in an index entry */
 #define FSCACHE_INDEX_DEADFILL_PATTERN 0x79
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index d4cb6e6f704c..be03c3b6f0dc 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -15,18 +15,6 @@
 #include <linux/workqueue.h>
 #include <linux/fs.h>
 
-/*
- * Overload PG_private_2 to give us PG_fscache - this is used to indicate that
- * a page is currently backed by a local disk cache
- */
-#define PageFsCache(page)		PagePrivate2((page))
-#define SetPageFsCache(page)		SetPagePrivate2((page))
-#define ClearPageFsCache(page)		ClearPagePrivate2((page))
-#define TestSetPageFsCache(page)	TestSetPagePrivate2((page))
-#define TestClearPageFsCache(page)	TestClearPagePrivate2((page))
-#define wait_on_page_fscache(page)	wait_on_page_private_2((page))
-#define unlock_page_fscache(page)	unlock_page_private_2((page))
-
 enum netfs_read_source {
 	NETFS_FILL_WITH_ZEROES,
 	NETFS_DOWNLOAD_FROM_SERVER,
diff --git a/mm/filemap.c b/mm/filemap.c
index 7d321152d579..e7b2a1e2c40b 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3604,7 +3604,7 @@ EXPORT_SYMBOL(generic_file_write_iter);
  * The address_space is to try to release any data against the page
  * (presumably at page->private).
  *
- * This may also be called if PG_fscache is set on a page, indicating that the
+ * This may also be called if PG_private_2 is set on a page, indicating that the
  * page is known to the local caching routines.
  *
  * The @gfp_mask argument specifies whether I/O may be performed to release
diff --git a/mm/readahead.c b/mm/readahead.c
index 4446dada0bc2..01209a46e834 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -40,7 +40,7 @@ EXPORT_SYMBOL_GPL(file_ra_state_init);
 
 /*
  * see if a page needs releasing upon read_cache_pages() failure
- * - the caller of read_cache_pages() may have set PG_private or PG_fscache
+ * - the caller of read_cache_pages() may have set PG_private or PG_private_2
  *   before calling, such as the NFS fs marking pages that are cached locally
  *   on disk, thus we need to give the fs a chance to clean up in the event of
  *   an error

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

