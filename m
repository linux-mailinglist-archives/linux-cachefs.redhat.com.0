Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 387CD546DBB
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Jun 2022 21:57:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654891029;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4NTd3xauFiYpH4/9RiCLsAN8AGhwO3+OVeC3z7zHJPQ=;
	b=YOGmyBv4749mYo1L1UTZ4G8/30cETM3R+AEIaB59JXhyHlIrsa/VXVZm0Ct7I/mDNww3un
	c7KoM0maS9aVgbWuxPLavuKWaJCncSmI7ONjeF9eB+fbCOcXS6Ui6jjII+nd7gZlZ6qP50
	JIXYsWf+mj9jTGsrd4clHbkpp+8Wi7k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-J6KeJ9tUNPKdGbtc17UWtQ-1; Fri, 10 Jun 2022 15:57:06 -0400
X-MC-Unique: J6KeJ9tUNPKdGbtc17UWtQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C098180029D;
	Fri, 10 Jun 2022 19:57:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B59C6C4C7A0;
	Fri, 10 Jun 2022 19:57:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 457E51947057;
	Fri, 10 Jun 2022 19:57:05 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D3F281947054 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 10 Jun 2022 19:57:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C78B8456CD9; Fri, 10 Jun 2022 19:57:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8E58492C3B;
 Fri, 10 Jun 2022 19:57:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
Date: Fri, 10 Jun 2022 20:57:01 +0100
Message-ID: <165489102120.703883.15459285330063780340.stgit@warthog.procyon.org.uk>
In-Reply-To: <165489100590.703883.11054313979289027590.stgit@warthog.procyon.org.uk>
References: <165489100590.703883.11054313979289027590.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Linux-cachefs] [PATCH 2/3] netfs: Further cleanups after struct
 netfs_inode wrapper introduced
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Linus Torvalds <torvalds@linux-foundation.org>

Change the signature of netfs helper functions to take a struct netfs_inode
pointer rather than a struct inode pointer where appropriate, thereby
relieving the need for the network filesystem to convert its internal inode
format down to the VFS inode only for netfslib to bounce it back up.  For
type safety, it's better not to do that (and it's less typing too).

Give netfs_write_begin() an extra argument to pass in a pointer to the
netfs_inode struct rather than deriving it internally from the file
pointer.  Note that the ->write_begin() and ->write_end() ops are intended
to be replaced in the future by netfslib code that manages this without the
need to call in twice for each page.

netfs_readpage() and similar are intended to be pointed at directly by the
address_space_operations table, so must stick to the signature dictated by
the function pointers there.

Changes
=======
- Updated the kerneldoc comments and documentation [DH].

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/CAHk-=wgkwKyNmNdKpQkqZ6DnmUL-x9hp0YBnUGjaPFEAdxDTbw@mail.gmail.com/
---

 Documentation/filesystems/netfs_library.rst |    9 +++++----
 fs/9p/v9fs.h                                |    2 +-
 fs/9p/vfs_addr.c                            |    2 +-
 fs/9p/vfs_inode.c                           |    3 ++-
 fs/afs/dynroot.c                            |    2 +-
 fs/afs/inode.c                              |    2 +-
 fs/afs/internal.h                           |    2 +-
 fs/afs/write.c                              |    2 +-
 fs/ceph/addr.c                              |    3 ++-
 fs/ceph/cache.h                             |    2 +-
 fs/ceph/inode.c                             |    2 +-
 fs/cifs/fscache.h                           |    2 +-
 fs/netfs/buffered_read.c                    |    5 +++--
 include/linux/netfs.h                       |   22 +++++++++-------------
 14 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/Documentation/filesystems/netfs_library.rst b/Documentation/filesystems/netfs_library.rst
index 3276c3d55142..9332f66373ee 100644
--- a/Documentation/filesystems/netfs_library.rst
+++ b/Documentation/filesystems/netfs_library.rst
@@ -79,7 +79,7 @@ To help deal with the per-inode context, a number helper functions are
 provided.  Firstly, a function to perform basic initialisation on a context and
 set the operations table pointer::
 
-	void netfs_inode_init(struct inode *inode,
+	void netfs_inode_init(struct netfs_inode *ctx,
 			      const struct netfs_request_ops *ops);
 
 then a function to cast from the VFS inode structure to the netfs context::
@@ -89,7 +89,7 @@ then a function to cast from the VFS inode structure to the netfs context::
 and finally, a function to get the cache cookie pointer from the context
 attached to an inode (or NULL if fscache is disabled)::
 
-	struct fscache_cookie *netfs_i_cookie(struct inode *inode);
+	struct fscache_cookie *netfs_i_cookie(struct netfs_inode *ctx);
 
 
 Buffered Read Helpers
@@ -136,8 +136,9 @@ Three read helpers are provided::
 
 	void netfs_readahead(struct readahead_control *ractl);
 	int netfs_read_folio(struct file *file,
-			   struct folio *folio);
-	int netfs_write_begin(struct file *file,
+			     struct folio *folio);
+	int netfs_write_begin(struct netfs_inode *ctx,
+			      struct file *file,
 			      struct address_space *mapping,
 			      loff_t pos,
 			      unsigned int len,
diff --git a/fs/9p/v9fs.h b/fs/9p/v9fs.h
index 1b219c21d15e..6acabc2e7dc9 100644
--- a/fs/9p/v9fs.h
+++ b/fs/9p/v9fs.h
@@ -124,7 +124,7 @@ static inline struct v9fs_inode *V9FS_I(const struct inode *inode)
 static inline struct fscache_cookie *v9fs_inode_cookie(struct v9fs_inode *v9inode)
 {
 #ifdef CONFIG_9P_FSCACHE
-	return netfs_i_cookie(&v9inode->netfs.inode);
+	return netfs_i_cookie(&v9inode->netfs);
 #else
 	return NULL;
 #endif
diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 90c6c1ba03ab..c004b9a73a92 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -274,7 +274,7 @@ static int v9fs_write_begin(struct file *filp, struct address_space *mapping,
 	 * file.  We need to do this before we get a lock on the page in case
 	 * there's more than one writer competing for the same cache block.
 	 */
-	retval = netfs_write_begin(filp, mapping, pos, len, &folio, fsdata);
+	retval = netfs_write_begin(&v9inode->netfs, filp, mapping, pos, len, &folio, fsdata);
 	if (retval < 0)
 		return retval;
 
diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index e660c6348b9d..419d2f3cf2c2 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -252,7 +252,8 @@ void v9fs_free_inode(struct inode *inode)
  */
 static void v9fs_set_netfs_context(struct inode *inode)
 {
-	netfs_inode_init(inode, &v9fs_req_ops);
+	struct v9fs_inode *v9inode = V9FS_I(inode);
+	netfs_inode_init(&v9inode->netfs, &v9fs_req_ops);
 }
 
 int v9fs_init_inode(struct v9fs_session_info *v9ses,
diff --git a/fs/afs/dynroot.c b/fs/afs/dynroot.c
index 3a5bbffdf053..d7d9402ff718 100644
--- a/fs/afs/dynroot.c
+++ b/fs/afs/dynroot.c
@@ -76,7 +76,7 @@ struct inode *afs_iget_pseudo_dir(struct super_block *sb, bool root)
 	/* there shouldn't be an existing inode */
 	BUG_ON(!(inode->i_state & I_NEW));
 
-	netfs_inode_init(inode, NULL);
+	netfs_inode_init(&vnode->netfs, NULL);
 	inode->i_size		= 0;
 	inode->i_mode		= S_IFDIR | S_IRUGO | S_IXUGO;
 	if (root) {
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 22811e9eacf5..89630acbc2cc 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -58,7 +58,7 @@ static noinline void dump_vnode(struct afs_vnode *vnode, struct afs_vnode *paren
  */
 static void afs_set_netfs_context(struct afs_vnode *vnode)
 {
-	netfs_inode_init(&vnode->netfs.inode, &afs_req_ops);
+	netfs_inode_init(&vnode->netfs, &afs_req_ops);
 }
 
 /*
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 984b113a9107..a6f25d9e75b5 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -670,7 +670,7 @@ struct afs_vnode {
 static inline struct fscache_cookie *afs_vnode_cache(struct afs_vnode *vnode)
 {
 #ifdef CONFIG_AFS_FSCACHE
-	return netfs_i_cookie(&vnode->netfs.inode);
+	return netfs_i_cookie(&vnode->netfs);
 #else
 	return NULL;
 #endif
diff --git a/fs/afs/write.c b/fs/afs/write.c
index f80a6096d91c..2c885b22de34 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -60,7 +60,7 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
 	 * file.  We need to do this before we get a lock on the page in case
 	 * there's more than one writer competing for the same cache block.
 	 */
-	ret = netfs_write_begin(file, mapping, pos, len, &folio, fsdata);
+	ret = netfs_write_begin(&vnode->netfs, file, mapping, pos, len, &folio, fsdata);
 	if (ret < 0)
 		return ret;
 
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index f5f116ed1b9e..9763e7ea8148 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1322,10 +1322,11 @@ static int ceph_write_begin(struct file *file, struct address_space *mapping,
 			    struct page **pagep, void **fsdata)
 {
 	struct inode *inode = file_inode(file);
+	struct ceph_inode_info *ci = ceph_inode(inode);
 	struct folio *folio = NULL;
 	int r;
 
-	r = netfs_write_begin(file, inode->i_mapping, pos, len, &folio, NULL);
+	r = netfs_write_begin(&ci->netfs, file, inode->i_mapping, pos, len, &folio, NULL);
 	if (r == 0)
 		folio_wait_fscache(folio);
 	if (r < 0) {
diff --git a/fs/ceph/cache.h b/fs/ceph/cache.h
index 26c6ae06e2f4..dc502daac49a 100644
--- a/fs/ceph/cache.h
+++ b/fs/ceph/cache.h
@@ -28,7 +28,7 @@ void ceph_fscache_invalidate(struct inode *inode, bool dio_write);
 
 static inline struct fscache_cookie *ceph_fscache_cookie(struct ceph_inode_info *ci)
 {
-	return netfs_i_cookie(&ci->netfs.inode);
+	return netfs_i_cookie(&ci->netfs);
 }
 
 static inline void ceph_fscache_resize(struct inode *inode, loff_t to)
diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
index 650746b3ba99..56c53ab3618e 100644
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -460,7 +460,7 @@ struct inode *ceph_alloc_inode(struct super_block *sb)
 	dout("alloc_inode %p\n", &ci->netfs.inode);
 
 	/* Set parameters for the netfs library */
-	netfs_inode_init(&ci->netfs.inode, &ceph_netfs_ops);
+	netfs_inode_init(&ci->netfs, &ceph_netfs_ops);
 
 	spin_lock_init(&ci->i_ceph_lock);
 
diff --git a/fs/cifs/fscache.h b/fs/cifs/fscache.h
index ab9a51d0125c..aa3b941a5555 100644
--- a/fs/cifs/fscache.h
+++ b/fs/cifs/fscache.h
@@ -61,7 +61,7 @@ void cifs_fscache_fill_coherency(struct inode *inode,
 
 static inline struct fscache_cookie *cifs_inode_cookie(struct inode *inode)
 {
-	return netfs_i_cookie(inode);
+	return netfs_i_cookie(&CIFS_I(inode)->netfs);
 }
 
 static inline void cifs_invalidate_cache(struct inode *inode, unsigned int flags)
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index d37e012386f3..42f892c5712e 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -297,6 +297,7 @@ static bool netfs_skip_folio_read(struct folio *folio, loff_t pos, size_t len,
 
 /**
  * netfs_write_begin - Helper to prepare for writing
+ * @ctx: The netfs context
  * @file: The file to read from
  * @mapping: The mapping to read from
  * @pos: File position at which the write will begin
@@ -326,12 +327,12 @@ static bool netfs_skip_folio_read(struct folio *folio, loff_t pos, size_t len,
  *
  * This is usable whether or not caching is enabled.
  */
-int netfs_write_begin(struct file *file, struct address_space *mapping,
+int netfs_write_begin(struct netfs_inode *ctx,
+		      struct file *file, struct address_space *mapping,
 		      loff_t pos, unsigned int len, struct folio **_folio,
 		      void **_fsdata)
 {
 	struct netfs_io_request *rreq;
-	struct netfs_inode *ctx = netfs_inode(file_inode(file ));
 	struct folio *folio;
 	unsigned int fgp_flags = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_STABLE;
 	pgoff_t index = pos >> PAGE_SHIFT;
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 6dbb4c9ce50d..a62739f3726b 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -277,7 +277,8 @@ struct netfs_cache_ops {
 struct readahead_control;
 extern void netfs_readahead(struct readahead_control *);
 int netfs_read_folio(struct file *, struct folio *);
-extern int netfs_write_begin(struct file *, struct address_space *,
+extern int netfs_write_begin(struct netfs_inode *,
+			     struct file *, struct address_space *,
 			     loff_t, unsigned int, struct folio **,
 			     void **);
 
@@ -302,19 +303,17 @@ static inline struct netfs_inode *netfs_inode(struct inode *inode)
 
 /**
  * netfs_inode_init - Initialise a netfslib inode context
- * @inode: The inode with which the context is associated
+ * @inode: The netfs inode to initialise
  * @ops: The netfs's operations list
  *
  * Initialise the netfs library context struct.  This is expected to follow on
  * directly from the VFS inode struct.
  */
-static inline void netfs_inode_init(struct inode *inode,
+static inline void netfs_inode_init(struct netfs_inode *ctx,
 				    const struct netfs_request_ops *ops)
 {
-	struct netfs_inode *ctx = netfs_inode(inode);
-
 	ctx->ops = ops;
-	ctx->remote_i_size = i_size_read(inode);
+	ctx->remote_i_size = i_size_read(&ctx->inode);
 #if IS_ENABLED(CONFIG_FSCACHE)
 	ctx->cache = NULL;
 #endif
@@ -322,28 +321,25 @@ static inline void netfs_inode_init(struct inode *inode,
 
 /**
  * netfs_resize_file - Note that a file got resized
- * @inode: The inode being resized
+ * @ctx: The netfs inode being resized
  * @new_i_size: The new file size
  *
  * Inform the netfs lib that a file got resized so that it can adjust its state.
  */
-static inline void netfs_resize_file(struct inode *inode, loff_t new_i_size)
+static inline void netfs_resize_file(struct netfs_inode *ctx, loff_t new_i_size)
 {
-	struct netfs_inode *ctx = netfs_inode(inode);
-
 	ctx->remote_i_size = new_i_size;
 }
 
 /**
  * netfs_i_cookie - Get the cache cookie from the inode
- * @inode: The inode to query
+ * @ctx: The netfs inode to query
  *
  * Get the caching cookie (if enabled) from the network filesystem's inode.
  */
-static inline struct fscache_cookie *netfs_i_cookie(struct inode *inode)
+static inline struct fscache_cookie *netfs_i_cookie(struct netfs_inode *ctx)
 {
 #if IS_ENABLED(CONFIG_FSCACHE)
-	struct netfs_inode *ctx = netfs_inode(inode);
 	return ctx->cache;
 #else
 	return NULL;


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

