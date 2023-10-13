Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 621797C89A1
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Oct 2023 18:05:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697213113;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HAe3U6TUnHaUluUXVQak52rLUkaaJDqhjFsr2zFOyeA=;
	b=DwYODuqaSLpVv6/c2V9QBiKz0oR78oj/rTLEt1ftanjtHPc5KcUUfMlkMgMcF5fom6nFQz
	Q/KecI68rn21SrTK4+HpbZlOkfhpkQFAcj4YZZtO/39QSk3d8qwncTNFH7XP2mGFy4gvus
	xKJl2ddJIELvdbTTSDT2MkLL4UDd2NE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-y3aFj0K7PHKUeNrTtZ3v4Q-1; Fri, 13 Oct 2023 12:04:55 -0400
X-MC-Unique: y3aFj0K7PHKUeNrTtZ3v4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DB24857ABD;
	Fri, 13 Oct 2023 16:04:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22C3F1C06536;
	Fri, 13 Oct 2023 16:04:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0570019465A2;
	Fri, 13 Oct 2023 16:04:53 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9D79A1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Oct 2023 16:04:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6E1D5C15978; Fri, 13 Oct 2023 16:04:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E94CC15BBC;
 Fri, 13 Oct 2023 16:04:48 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Date: Fri, 13 Oct 2023 17:03:36 +0100
Message-ID: <20231013160423.2218093-8-dhowells@redhat.com>
In-Reply-To: <20231013160423.2218093-1-dhowells@redhat.com>
References: <20231013160423.2218093-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Subject: [Linux-cachefs] [RFC PATCH 07/53] netfs: Provide invalidate_folio
 and release_folio calls
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 netdev@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com, linux-mm@kvack.org,
 Marc Dionne <marc.dionne@auristor.com>, v9fs@lists.linux.dev,
 Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
 Christian Brauner <christian@brauner.io>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide default invalidate_folio and release_folio calls.  These will need
to interact with invalidation correctly at some point.  They will be needed
if netfslib is to make use of folio->private for its own purposes.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/9p/vfs_addr.c      | 33 ++-------------------------
 fs/afs/file.c         | 53 ++++---------------------------------------
 fs/ceph/addr.c        | 24 ++------------------
 fs/netfs/Makefile     |  1 +
 fs/netfs/misc.c       | 51 +++++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h |  6 +++--
 6 files changed, 64 insertions(+), 104 deletions(-)
 create mode 100644 fs/netfs/misc.c

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 8a635999a7d6..18a666c43e4a 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -104,35 +104,6 @@ const struct netfs_request_ops v9fs_req_ops = {
 	.issue_read		= v9fs_issue_read,
 };
 
-/**
- * v9fs_release_folio - release the private state associated with a folio
- * @folio: The folio to be released
- * @gfp: The caller's allocation restrictions
- *
- * Returns true if the page can be released, false otherwise.
- */
-
-static bool v9fs_release_folio(struct folio *folio, gfp_t gfp)
-{
-	if (folio_test_private(folio))
-		return false;
-#ifdef CONFIG_9P_FSCACHE
-	if (folio_test_fscache(folio)) {
-		if (current_is_kswapd() || !(gfp & __GFP_FS))
-			return false;
-		folio_wait_fscache(folio);
-	}
-	fscache_note_page_release(v9fs_inode_cookie(V9FS_I(folio_inode(folio))));
-#endif
-	return true;
-}
-
-static void v9fs_invalidate_folio(struct folio *folio, size_t offset,
-				 size_t length)
-{
-	folio_wait_fscache(folio);
-}
-
 #ifdef CONFIG_9P_FSCACHE
 static void v9fs_write_to_cache_done(void *priv, ssize_t transferred_or_error,
 				     bool was_async)
@@ -355,8 +326,8 @@ const struct address_space_operations v9fs_addr_operations = {
 	.writepage = v9fs_vfs_writepage,
 	.write_begin = v9fs_write_begin,
 	.write_end = v9fs_write_end,
-	.release_folio = v9fs_release_folio,
-	.invalidate_folio = v9fs_invalidate_folio,
+	.release_folio = netfs_release_folio,
+	.invalidate_folio = netfs_invalidate_folio,
 	.launder_folio = v9fs_launder_folio,
 	.direct_IO = v9fs_direct_IO,
 };
diff --git a/fs/afs/file.c b/fs/afs/file.c
index 0c49b3b6f214..3fea5cd8ef13 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -20,9 +20,6 @@
 
 static int afs_file_mmap(struct file *file, struct vm_area_struct *vma);
 static int afs_symlink_read_folio(struct file *file, struct folio *folio);
-static void afs_invalidate_folio(struct folio *folio, size_t offset,
-			       size_t length);
-static bool afs_release_folio(struct folio *folio, gfp_t gfp_flags);
 
 static ssize_t afs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter);
 static ssize_t afs_file_splice_read(struct file *in, loff_t *ppos,
@@ -57,8 +54,8 @@ const struct address_space_operations afs_file_aops = {
 	.readahead	= netfs_readahead,
 	.dirty_folio	= afs_dirty_folio,
 	.launder_folio	= afs_launder_folio,
-	.release_folio	= afs_release_folio,
-	.invalidate_folio = afs_invalidate_folio,
+	.release_folio	= netfs_release_folio,
+	.invalidate_folio = netfs_invalidate_folio,
 	.write_begin	= afs_write_begin,
 	.write_end	= afs_write_end,
 	.writepages	= afs_writepages,
@@ -67,8 +64,8 @@ const struct address_space_operations afs_file_aops = {
 
 const struct address_space_operations afs_symlink_aops = {
 	.read_folio	= afs_symlink_read_folio,
-	.release_folio	= afs_release_folio,
-	.invalidate_folio = afs_invalidate_folio,
+	.release_folio	= netfs_release_folio,
+	.invalidate_folio = netfs_invalidate_folio,
 	.migrate_folio	= filemap_migrate_folio,
 };
 
@@ -405,48 +402,6 @@ int afs_write_inode(struct inode *inode, struct writeback_control *wbc)
 	return 0;
 }
 
-/*
- * invalidate part or all of a page
- * - release a page and clean up its private data if offset is 0 (indicating
- *   the entire page)
- */
-static void afs_invalidate_folio(struct folio *folio, size_t offset,
-			       size_t length)
-{
-	_enter("{%lu},%zu,%zu", folio->index, offset, length);
-
-	folio_wait_fscache(folio);
-	_leave("");
-}
-
-/*
- * release a page and clean up its private state if it's not busy
- * - return true if the page can now be released, false if not
- */
-static bool afs_release_folio(struct folio *folio, gfp_t gfp)
-{
-	struct afs_vnode *vnode = AFS_FS_I(folio_inode(folio));
-
-	_enter("{{%llx:%llu}[%lu],%lx},%x",
-	       vnode->fid.vid, vnode->fid.vnode, folio_index(folio), folio->flags,
-	       gfp);
-
-	/* deny if folio is being written to the cache and the caller hasn't
-	 * elected to wait */
-#ifdef CONFIG_AFS_FSCACHE
-	if (folio_test_fscache(folio)) {
-		if (current_is_kswapd() || !(gfp & __GFP_FS))
-			return false;
-		folio_wait_fscache(folio);
-	}
-	fscache_note_page_release(afs_vnode_cache(vnode));
-#endif
-
-	/* Indicate that the folio can be released */
-	_leave(" = T");
-	return true;
-}
-
 static void afs_add_open_mmap(struct afs_vnode *vnode)
 {
 	if (atomic_inc_return(&vnode->cb_nr_mmap) == 1) {
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index f4863078f7fe..ced19ff08988 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -160,27 +160,7 @@ static void ceph_invalidate_folio(struct folio *folio, size_t offset,
 		ceph_put_snap_context(snapc);
 	}
 
-	folio_wait_fscache(folio);
-}
-
-static bool ceph_release_folio(struct folio *folio, gfp_t gfp)
-{
-	struct inode *inode = folio->mapping->host;
-
-	dout("%llx:%llx release_folio idx %lu (%sdirty)\n",
-	     ceph_vinop(inode),
-	     folio->index, folio_test_dirty(folio) ? "" : "not ");
-
-	if (folio_test_private(folio))
-		return false;
-
-	if (folio_test_fscache(folio)) {
-		if (current_is_kswapd() || !(gfp & __GFP_FS))
-			return false;
-		folio_wait_fscache(folio);
-	}
-	ceph_fscache_note_page_release(inode);
-	return true;
+	netfs_invalidate_folio(folio, offset, length);
 }
 
 static void ceph_netfs_expand_readahead(struct netfs_io_request *rreq)
@@ -1563,7 +1543,7 @@ const struct address_space_operations ceph_aops = {
 	.write_end = ceph_write_end,
 	.dirty_folio = ceph_dirty_folio,
 	.invalidate_folio = ceph_invalidate_folio,
-	.release_folio = ceph_release_folio,
+	.release_folio = netfs_release_folio,
 	.direct_IO = noop_direct_IO,
 };
 
diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index 386d6fb92793..cd22554d9048 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -5,6 +5,7 @@ netfs-y := \
 	io.o \
 	iterator.o \
 	main.o \
+	misc.o \
 	objects.o
 
 netfs-$(CONFIG_NETFS_STATS) += stats.o
diff --git a/fs/netfs/misc.c b/fs/netfs/misc.c
new file mode 100644
index 000000000000..c3baf2b247d9
--- /dev/null
+++ b/fs/netfs/misc.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Miscellaneous routines.
+ *
+ * Copyright (C) 2022 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/swap.h>
+#include "internal.h"
+
+/**
+ * netfs_invalidate_folio - Invalidate or partially invalidate a folio
+ * @folio: Folio proposed for release
+ * @offset: Offset of the invalidated region
+ * @length: Length of the invalidated region
+ *
+ * Invalidate part or all of a folio for a network filesystem.  The folio will
+ * be removed afterwards if the invalidated region covers the entire folio.
+ */
+void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
+{
+	_enter("{%lx},%zx,%zx", folio_index(folio), offset, length);
+
+	folio_wait_fscache(folio);
+}
+EXPORT_SYMBOL(netfs_invalidate_folio);
+
+/**
+ * netfs_release_folio - Try to release a folio
+ * @folio: Folio proposed for release
+ * @gfp: Flags qualifying the release
+ *
+ * Request release of a folio and clean up its private state if it's not busy.
+ * Returns true if the folio can now be released, false if not
+ */
+bool netfs_release_folio(struct folio *folio, gfp_t gfp)
+{
+	struct netfs_inode *ctx = netfs_inode(folio_inode(folio));
+
+	if (folio_test_private(folio))
+		return false;
+	if (folio_test_fscache(folio)) {
+		if (current_is_kswapd() || !(gfp & __GFP_FS))
+			return false;
+		folio_wait_fscache(folio);
+	}
+
+	fscache_note_page_release(netfs_i_cookie(ctx));
+	return true;
+}
+EXPORT_SYMBOL(netfs_release_folio);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index ed64d1034afa..daa431c4148d 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -299,8 +299,10 @@ struct readahead_control;
 void netfs_readahead(struct readahead_control *);
 int netfs_read_folio(struct file *, struct folio *);
 int netfs_write_begin(struct netfs_inode *, struct file *,
-		struct address_space *, loff_t pos, unsigned int len,
-		struct folio **, void **fsdata);
+		      struct address_space *, loff_t pos, unsigned int len,
+		      struct folio **, void **fsdata);
+void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
+bool netfs_release_folio(struct folio *folio, gfp_t gfp);
 
 void netfs_subreq_terminated(struct netfs_io_subrequest *, ssize_t, bool);
 void netfs_get_subrequest(struct netfs_io_subrequest *subreq,
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

