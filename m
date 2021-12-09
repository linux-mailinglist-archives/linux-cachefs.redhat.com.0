Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C81846F0FD
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Dec 2021 18:09:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639069793;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DRXKb6jOv3pcwRNpTX9N/vuzCHk779c4lDremBMp2K0=;
	b=D5cdD6ZqFEwdvL3kKFO46V6haSpJDI6kmnlA++zDwCoUDP9g99rjPHz/FIglTO+ogkzzuM
	h74TNo2eINgtbw7Z+R+8Y2AUHJ+okJsMSPxVshbU/a3umNM6CU5W/KsaZHyfaAVYiOcJ1n
	ZqOyRtumwqcj4Nwntb6vA9Zl1MRqypk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-7Nb_1GrQOZSPl-yiZeiouQ-1; Thu, 09 Dec 2021 12:09:49 -0500
X-MC-Unique: 7Nb_1GrQOZSPl-yiZeiouQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AED310168C4;
	Thu,  9 Dec 2021 17:09:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A9F3694D9;
	Thu,  9 Dec 2021 17:09:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 794261806D1C;
	Thu,  9 Dec 2021 17:09:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B9H9iYM020380 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 9 Dec 2021 12:09:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C55E81000180; Thu,  9 Dec 2021 17:09:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 10D7110016FE;
	Thu,  9 Dec 2021 17:09:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 09 Dec 2021 17:09:40 +0000
Message-ID: <163906978015.143852.10646669694345706328.stgit@warthog.procyon.org.uk>
In-Reply-To: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
References: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Steve French <sfrench@samba.org>,
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	ceph-devel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH v2 61/67] 9p: Copy local writes to the cache
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Changes
=======
ver #2:
 - Fix an unused-var warning due to CONFIG_9P_FSCACHE=n[1].

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Eric Van Hensbergen <ericvh@gmail.com>
cc: Latchesar Ionkov <lucho@ionkov.net>
cc: Dominique Martinet <asmadeus@codewreck.org>
cc: v9fs-developer@lists.sourceforge.net
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819667027.215744.13815687931204222995.stgit@warthog.procyon.org.uk/ # v1
---

 fs/9p/vfs_addr.c  |   44 +++++++++++++++++++++++++++++++++++++++++++-
 fs/9p/vfs_inode.c |    2 ++
 fs/9p/vfs_super.c |    3 +++
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 4f5ce4aca317..88ccba3be98c 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -137,6 +137,7 @@ static void v9fs_vfs_readahead(struct readahead_control *ractl)
 static int v9fs_release_page(struct page *page, gfp_t gfp)
 {
 	struct folio *folio = page_folio(page);
+	struct inode *inode = folio_inode(folio);
 
 	if (folio_test_private(folio))
 		return 0;
@@ -147,6 +148,7 @@ static int v9fs_release_page(struct page *page, gfp_t gfp)
 		folio_wait_fscache(folio);
 	}
 #endif
+	fscache_note_page_release(v9fs_inode_cookie(V9FS_I(inode)));
 	return 1;
 }
 
@@ -165,10 +167,23 @@ static void v9fs_invalidate_page(struct page *page, unsigned int offset,
 	folio_wait_fscache(folio);
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
 static int v9fs_vfs_write_folio_locked(struct folio *folio)
 {
 	struct inode *inode = folio_inode(folio);
 	struct v9fs_inode *v9inode = V9FS_I(inode);
+	struct fscache_cookie *cookie = v9fs_inode_cookie(v9inode);
 	loff_t start = folio_pos(folio);
 	loff_t i_size = i_size_read(inode);
 	struct iov_iter from;
@@ -185,10 +200,21 @@ static int v9fs_vfs_write_folio_locked(struct folio *folio)
 	/* We should have writeback_fid always set */
 	BUG_ON(!v9inode->writeback_fid);
 
+	folio_wait_fscache(folio);
 	folio_start_writeback(folio);
 
 	p9_client_write(v9inode->writeback_fid, start, &from, &err);
 
+	if (err == 0 &&
+	    fscache_cookie_enabled(cookie) &&
+	    test_bit(FSCACHE_COOKIE_IS_CACHING, &cookie->flags)) {
+		folio_start_fscache(folio);
+		fscache_write_to_cache(v9fs_inode_cookie(v9inode),
+				       folio_mapping(folio), start, len, i_size,
+				       v9fs_write_to_cache_done, v9inode,
+				       true);
+	}
+
 	folio_end_writeback(folio);
 	return err;
 }
@@ -307,6 +333,7 @@ static int v9fs_write_end(struct file *filp, struct address_space *mapping,
 	loff_t last_pos = pos + copied;
 	struct folio *folio = page_folio(subpage);
 	struct inode *inode = mapping->host;
+	struct v9fs_inode *v9inode = V9FS_I(inode);
 
 	p9_debug(P9_DEBUG_VFS, "filp %p, mapping %p\n", filp, mapping);
 
@@ -326,6 +353,7 @@ static int v9fs_write_end(struct file *filp, struct address_space *mapping,
 	if (last_pos > inode->i_size) {
 		inode_add_bytes(inode, last_pos - inode->i_size);
 		i_size_write(inode, last_pos);
+		fscache_update_cookie(v9fs_inode_cookie(v9inode), NULL, &last_pos);
 	}
 	folio_mark_dirty(folio);
 out:
@@ -335,11 +363,25 @@ static int v9fs_write_end(struct file *filp, struct address_space *mapping,
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
index 00366bf1ac2c..fa7f69ef0852 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -382,6 +382,8 @@ void v9fs_evict_inode(struct inode *inode)
 	struct v9fs_inode *v9inode = V9FS_I(inode);
 
 	truncate_inode_pages_final(&inode->i_data);
+	fscache_clear_inode_writeback(v9fs_inode_cookie(v9inode), inode,
+				      &v9inode->qid.version);
 	clear_inode(inode);
 	filemap_fdatawrite(&inode->i_data);
 
diff --git a/fs/9p/vfs_super.c b/fs/9p/vfs_super.c
index b739e02f5ef7..97e23b4e6982 100644
--- a/fs/9p/vfs_super.c
+++ b/fs/9p/vfs_super.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 #include <linux/statfs.h>
 #include <linux/magic.h>
+#include <linux/fscache.h>
 #include <net/9p/9p.h>
 #include <net/9p/client.h>
 
@@ -309,6 +310,7 @@ static int v9fs_write_inode(struct inode *inode,
 		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
 		return ret;
 	}
+	fscache_unpin_writeback(wbc, v9fs_inode_cookie(v9inode));
 	return 0;
 }
 
@@ -332,6 +334,7 @@ static int v9fs_write_inode_dotl(struct inode *inode,
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

