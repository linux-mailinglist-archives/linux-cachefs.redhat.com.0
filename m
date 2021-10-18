Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 888A543220D
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 17:08:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569716;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xtjeaJBPAMi01YF22tq89QPj54RPliUHd2CM17vLJGk=;
	b=WnBOS+NAKVAcL0nPbDuaozhMghazhFa+64614Pd4E2dLBYiCAlSjAfijJ3uiNZ2rm8NHfl
	vaSkEGEJpEnSHw1FOLnS/gGMRAao8IwFaOPzEc0GQcNWCw8zFY/2YAB1vxQJfxYL1GczkS
	ilHVyV811QYYCn3c1n6lQRfJkc/yXVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-w0xRT82ROe6SUGF8XRAZCQ-1; Mon, 18 Oct 2021 11:08:33 -0400
X-MC-Unique: w0xRT82ROe6SUGF8XRAZCQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AA2B8066F5;
	Mon, 18 Oct 2021 15:08:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2098417155;
	Mon, 18 Oct 2021 15:08:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 044521806D03;
	Mon, 18 Oct 2021 15:08:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IF8TKI030176 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 11:08:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 046BF5BB0D; Mon, 18 Oct 2021 15:08:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8060E60D30;
	Mon, 18 Oct 2021 15:08:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 16:08:24 +0100
Message-ID: <163456970473.2614702.16723673129113194320.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Steve French <sfrench@samba.org>,
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH 63/67] 9p: Copy local writes to the cache
 when writing to the server
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

When writing to the server from v9fs_vfs_writepage(), copy the data to the
cache object too.

To make this possible, the cookie must have its active users count
incremented when the page is dirtied and kept incremented until we manage
to clean up all the pages.  This allows the writeback to take place after
the last file struct is released.

This is done by taking a use on the cookie in v9fs_set_page_dirty() if we
haven't already done so (controlled by the I_PINNING_FSCACHE_WB flag) and
dropping the pin in v9fs_write_inode() if __writeback_single_inode() clears
all the outstanding dirty pages (conveyed by the unpinned_fscache_wb flag
in the writeback_control struct).

Inode eviction must also clear the flag after truncating away all the
outstanding pages.

In the future this will be handled more gracefully by netfslib.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Eric Van Hensbergen <ericvh@gmail.com>
cc: Latchesar Ionkov <lucho@ionkov.net>
cc: Dominique Martinet <asmadeus@codewreck.org>
cc: v9fs-developer@lists.sourceforge.net
---

 fs/9p/vfs_addr.c  |   53 ++++++++++++++++++++++++++++++++++++++++++++++++-----
 fs/9p/vfs_inode.c |    2 ++
 fs/9p/vfs_super.c |    3 +++
 3 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index de857fa4629b..2d1577538cde 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -132,15 +132,17 @@ static void v9fs_vfs_readahead(struct readahead_control *ractl)
 
 static int v9fs_release_page(struct page *page, gfp_t gfp)
 {
+	struct inode *inode = page->mapping->host;
+	struct v9fs_inode *v9inode = V9FS_I(inode);
+
 	if (PagePrivate(page))
 		return 0;
-#ifdef CONFIG_9P_FSCACHE
 	if (PageFsCache(page)) {
 		if (!(gfp & __GFP_DIRECT_RECLAIM) || !(gfp & __GFP_FS))
 			return 0;
 		wait_on_page_fscache(page);
 	}
-#endif
+	fscache_note_page_release(v9fs_inode_cookie(v9inode));
 	return 1;
 }
 
@@ -157,10 +159,23 @@ static void v9fs_invalidate_page(struct page *page, unsigned int offset,
 	wait_on_page_fscache(page);
 }
 
+static void v9fs_write_to_cache_done(void *priv, ssize_t transferred_or_error,
+				     bool was_async)
+{
+	struct v9fs_inode *v9inode = priv;
+
+	if (IS_ERR_VALUE(transferred_or_error) &&
+	    transferred_or_error != -ENOBUFS)
+		fscache_invalidate(v9fs_inode_cookie(v9inode),
+				   &v9inode->qid.version,
+				   i_size_read(&v9inode->vfs_inode), 0);
+}
+
 static int v9fs_vfs_writepage_locked(struct page *page)
 {
 	struct inode *inode = page->mapping->host;
 	struct v9fs_inode *v9inode = V9FS_I(inode);
+	struct fscache_cookie *cookie = v9fs_inode_cookie(v9inode);
 	loff_t start = page_offset(page);
 	loff_t size = i_size_read(inode);
 	struct iov_iter from;
@@ -176,10 +191,21 @@ static int v9fs_vfs_writepage_locked(struct page *page)
 	/* We should have writeback_fid always set */
 	BUG_ON(!v9inode->writeback_fid);
 
+	wait_on_page_fscache(page);
+
 	set_page_writeback(page);
 
 	p9_client_write(v9inode->writeback_fid, start, &from, &err);
 
+	if (err == 0 &&
+	    fscache_cookie_enabled(cookie) &&
+	    test_bit(FSCACHE_COOKIE_IS_CACHING, &cookie->flags)) {
+		set_page_fscache(page);
+		fscache_write_to_cache(v9fs_inode_cookie(v9inode),
+				       page->mapping, start, len, size,
+				       v9fs_write_to_cache_done, v9inode);
+	}
+
 	end_page_writeback(page);
 	return err;
 }
@@ -290,10 +316,12 @@ static int v9fs_write_begin(struct file *filp, struct address_space *mapping,
 
 static int v9fs_write_end(struct file *filp, struct address_space *mapping,
 			  loff_t pos, unsigned len, unsigned copied,
-			  struct page *page, void *fsdata)
+			  struct page *subpage, void *fsdata)
 {
+	struct page *page = thp_head(subpage);
 	loff_t last_pos = pos + copied;
-	struct inode *inode = page->mapping->host;
+	struct inode *inode = mapping->host;
+	struct v9fs_inode *v9inode = V9FS_I(inode);
 
 	p9_debug(P9_DEBUG_VFS, "filp %p, mapping %p\n", filp, mapping);
 
@@ -313,6 +341,7 @@ static int v9fs_write_end(struct file *filp, struct address_space *mapping,
 	if (last_pos > inode->i_size) {
 		inode_add_bytes(inode, last_pos - inode->i_size);
 		i_size_write(inode, last_pos);
+		fscache_update_cookie(v9fs_inode_cookie(v9inode), NULL, &last_pos);
 	}
 	set_page_dirty(page);
 out:
@@ -322,11 +351,25 @@ static int v9fs_write_end(struct file *filp, struct address_space *mapping,
 	return copied;
 }
 
+#ifdef CONFIG_9P_FSCACHE
+/*
+ * Mark a page as having been made dirty and thus needing writeback.  We also
+ * need to pin the cache object to write back to.
+ */
+static int v9fs_set_page_dirty(struct page *page)
+{
+	struct v9fs_inode *v9inode = V9FS_I(page->mapping->host);
+
+	return fscache_set_page_dirty(page, v9fs_inode_cookie(v9inode));
+}
+#else
+#define v9fs_set_page_dirty __set_page_dirty_nobuffers
+#endif
 
 const struct address_space_operations v9fs_addr_operations = {
 	.readpage = v9fs_vfs_readpage,
 	.readahead = v9fs_vfs_readahead,
-	.set_page_dirty = __set_page_dirty_nobuffers,
+	.set_page_dirty = v9fs_set_page_dirty,
 	.writepage = v9fs_vfs_writepage,
 	.write_begin = v9fs_write_begin,
 	.write_end = v9fs_write_end,
diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index 83db37bd4252..a990c50cc27d 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -377,6 +377,8 @@ void v9fs_evict_inode(struct inode *inode)
 	struct v9fs_inode *v9inode = V9FS_I(inode);
 
 	truncate_inode_pages_final(&inode->i_data);
+	fscache_clear_inode_writeback(v9fs_inode_cookie(v9inode), inode,
+				      &v9inode->qid.version);
 	clear_inode(inode);
 	filemap_fdatawrite(&inode->i_data);
 
diff --git a/fs/9p/vfs_super.c b/fs/9p/vfs_super.c
index 5fce6e30bc5a..3721098e0992 100644
--- a/fs/9p/vfs_super.c
+++ b/fs/9p/vfs_super.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/statfs.h>
 #include <linux/magic.h>
+#include <linux/fscache.h>
 #include <net/9p/9p.h>
 #include <net/9p/client.h>
 
@@ -307,6 +308,7 @@ static int v9fs_write_inode(struct inode *inode,
 		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
 		return ret;
 	}
+	fscache_unpin_writeback(wbc, v9fs_inode_cookie(v9inode));
 	return 0;
 }
 
@@ -330,6 +332,7 @@ static int v9fs_write_inode_dotl(struct inode *inode,
 		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
 		return ret;
 	}
+	fscache_unpin_writeback(wbc, v9fs_inode_cookie(v9inode));
 	return 0;
 }
 


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

