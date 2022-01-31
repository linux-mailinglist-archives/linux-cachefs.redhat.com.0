Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E404A49EE
	for <lists+linux-cachefs@lfdr.de>; Mon, 31 Jan 2022 16:13:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643642027;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ih1U98zbWtdo9XRLfb07wI3SmbGVuh9wrnW55npgvpA=;
	b=bdqkTvWzTNdEyBQ66RS40iCjR/iGTzTuKzW3ijJAtAODo/tm2Dsjyz6v9d5xZgAvK5eMyA
	UVdf7PibVwPvJBjB0DGDI+mXCZJbiAq6svNDvL0T4jJ/oVPBRu08Nvgkz4HsD3UoLiX0ZE
	dGSl3a/8g5UIDsYBGzGwcgoyH2FQEEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-vc4W9BWBOKWxE7hz2k2LyQ-1; Mon, 31 Jan 2022 10:13:46 -0500
X-MC-Unique: vc4W9BWBOKWxE7hz2k2LyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EDF68519E2;
	Mon, 31 Jan 2022 15:13:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1041F798B3;
	Mon, 31 Jan 2022 15:13:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1FC01809CB8;
	Mon, 31 Jan 2022 15:13:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VFDcn8006988 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 10:13:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7685F77448; Mon, 31 Jan 2022 15:13:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6594374E8D;
	Mon, 31 Jan 2022 15:12:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 31 Jan 2022 15:12:56 +0000
Message-ID: <164364197646.1476539.3635698398603811895.stgit@warthog.procyon.org.uk>
In-Reply-To: <164364196407.1476539.8450117784231043601.stgit@warthog.procyon.org.uk>
References: <164364196407.1476539.8450117784231043601.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, Miklos Szeredi <miklos@szeredi.hu>,
	Jeff Layton <jlayton@kernel.org>, linux-unionfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org
Subject: [Linux-cachefs] [PATCH 1/5] vfs, overlayfs,
 cachefiles: Turn I_OVL_INUSE into something generic
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Turn overlayfs's I_OVL_INUSE into something generic that cachefiles can
also use for excluding access to its own cache files by renaming it to
I_EXCL_INUSE as suggested by Amir[1] and hoisting the helpers to generic
code.

Suggested-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Amir Goldstein <amir73il@gmail.com>
cc: Miklos Szeredi <miklos@szeredi.hu>
cc: linux-unionfs@vger.kernel.org
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/CAOQ4uxhRS3MGEnCUDcsB1RL0d1Oy0g0Rzm75hVFAJw2dJ7uKSA@mail.gmail.com/ [1]
---

 fs/inode.c               |   43 +++++++++++++++++++++++++++++++++++++++++++
 fs/overlayfs/overlayfs.h |    3 ---
 fs/overlayfs/super.c     |   12 ++++++------
 fs/overlayfs/util.c      |   43 -------------------------------------------
 include/linux/fs.h       |   22 +++++++++++++++++++---
 5 files changed, 68 insertions(+), 55 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 63324df6fa27..954719f66113 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2405,3 +2405,46 @@ struct timespec64 current_time(struct inode *inode)
 	return timestamp_truncate(now, inode);
 }
 EXPORT_SYMBOL(current_time);
+
+/**
+ * inode_excl_inuse_trylock - Try to exclusively lock an inode for kernel access
+ * @dentry: Reference to the inode to be locked
+ *
+ * Try to gain exclusive access to an inode for a kernel service, returning
+ * true if successful.
+ */
+bool inode_excl_inuse_trylock(struct dentry *dentry)
+{
+	struct inode *inode = d_inode(dentry);
+	bool locked = false;
+
+	spin_lock(&inode->i_lock);
+	if (!(inode->i_state & I_EXCL_INUSE)) {
+		inode->i_state |= I_EXCL_INUSE;
+		locked = true;
+	}
+	spin_unlock(&inode->i_lock);
+
+	return locked;
+}
+EXPORT_SYMBOL(inode_excl_inuse_trylock);
+
+/**
+ * inode_excl_inuse_unlock - Unlock exclusive kernel access to an inode
+ * @dentry: Reference to the inode to be unlocked
+ *
+ * Drop exclusive access to an inode for a kernel service.  A warning is given
+ * if the inode was not marked for exclusive access.
+ */
+void inode_excl_inuse_unlock(struct dentry *dentry)
+{
+	if (dentry) {
+		struct inode *inode = d_inode(dentry);
+
+		spin_lock(&inode->i_lock);
+		WARN_ON(!(inode->i_state & I_EXCL_INUSE));
+		inode->i_state &= ~I_EXCL_INUSE;
+		spin_unlock(&inode->i_lock);
+	}
+}
+EXPORT_SYMBOL(inode_excl_inuse_unlock);
diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index 2cd5741c873b..8415c0c6d40c 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -337,9 +337,6 @@ int ovl_check_setxattr(struct ovl_fs *ofs, struct dentry *upperdentry,
 		       enum ovl_xattr ox, const void *value, size_t size,
 		       int xerr);
 int ovl_set_impure(struct dentry *dentry, struct dentry *upperdentry);
-bool ovl_inuse_trylock(struct dentry *dentry);
-void ovl_inuse_unlock(struct dentry *dentry);
-bool ovl_is_inuse(struct dentry *dentry);
 bool ovl_need_index(struct dentry *dentry);
 int ovl_nlink_start(struct dentry *dentry);
 void ovl_nlink_end(struct dentry *dentry);
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 7bb0a47cb615..5c3361a2dc7c 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -224,10 +224,10 @@ static void ovl_free_fs(struct ovl_fs *ofs)
 	dput(ofs->indexdir);
 	dput(ofs->workdir);
 	if (ofs->workdir_locked)
-		ovl_inuse_unlock(ofs->workbasedir);
+		inode_excl_inuse_unlock(ofs->workbasedir);
 	dput(ofs->workbasedir);
 	if (ofs->upperdir_locked)
-		ovl_inuse_unlock(ovl_upper_mnt(ofs)->mnt_root);
+		inode_excl_inuse_unlock(ovl_upper_mnt(ofs)->mnt_root);
 
 	/* Hack!  Reuse ofs->layers as a vfsmount array before freeing it */
 	mounts = (struct vfsmount **) ofs->layers;
@@ -1239,7 +1239,7 @@ static int ovl_get_upper(struct super_block *sb, struct ovl_fs *ofs,
 	if (upper_mnt->mnt_sb->s_flags & SB_NOSEC)
 		sb->s_flags |= SB_NOSEC;
 
-	if (ovl_inuse_trylock(ovl_upper_mnt(ofs)->mnt_root)) {
+	if (inode_excl_inuse_trylock(ovl_upper_mnt(ofs)->mnt_root)) {
 		ofs->upperdir_locked = true;
 	} else {
 		err = ovl_report_in_use(ofs, "upperdir");
@@ -1499,7 +1499,7 @@ static int ovl_get_workdir(struct super_block *sb, struct ovl_fs *ofs,
 
 	ofs->workbasedir = dget(workpath.dentry);
 
-	if (ovl_inuse_trylock(ofs->workbasedir)) {
+	if (inode_excl_inuse_trylock(ofs->workbasedir)) {
 		ofs->workdir_locked = true;
 	} else {
 		err = ovl_report_in_use(ofs, "workdir");
@@ -1722,7 +1722,7 @@ static int ovl_get_layers(struct super_block *sb, struct ovl_fs *ofs,
 		if (err)
 			goto out;
 
-		if (ovl_is_inuse(stack[i].dentry)) {
+		if (inode_is_excl_inuse(stack[i].dentry)) {
 			err = ovl_report_in_use(ofs, "lowerdir");
 			if (err) {
 				iput(trap);
@@ -1872,7 +1872,7 @@ static int ovl_check_layer(struct super_block *sb, struct ovl_fs *ofs,
 		if (is_lower && ovl_lookup_trap_inode(sb, parent)) {
 			err = -ELOOP;
 			pr_err("overlapping %s path\n", name);
-		} else if (ovl_is_inuse(parent)) {
+		} else if (inode_is_excl_inuse(parent)) {
 			err = ovl_report_in_use(ofs, name);
 		}
 		next = parent;
diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
index f48284a2a896..748c4b22deb3 100644
--- a/fs/overlayfs/util.c
+++ b/fs/overlayfs/util.c
@@ -724,49 +724,6 @@ int ovl_set_protattr(struct inode *inode, struct dentry *upper,
 	return 0;
 }
 
-/**
- * Caller must hold a reference to inode to prevent it from being freed while
- * it is marked inuse.
- */
-bool ovl_inuse_trylock(struct dentry *dentry)
-{
-	struct inode *inode = d_inode(dentry);
-	bool locked = false;
-
-	spin_lock(&inode->i_lock);
-	if (!(inode->i_state & I_OVL_INUSE)) {
-		inode->i_state |= I_OVL_INUSE;
-		locked = true;
-	}
-	spin_unlock(&inode->i_lock);
-
-	return locked;
-}
-
-void ovl_inuse_unlock(struct dentry *dentry)
-{
-	if (dentry) {
-		struct inode *inode = d_inode(dentry);
-
-		spin_lock(&inode->i_lock);
-		WARN_ON(!(inode->i_state & I_OVL_INUSE));
-		inode->i_state &= ~I_OVL_INUSE;
-		spin_unlock(&inode->i_lock);
-	}
-}
-
-bool ovl_is_inuse(struct dentry *dentry)
-{
-	struct inode *inode = d_inode(dentry);
-	bool inuse;
-
-	spin_lock(&inode->i_lock);
-	inuse = (inode->i_state & I_OVL_INUSE);
-	spin_unlock(&inode->i_lock);
-
-	return inuse;
-}
-
 /*
  * Does this overlay dentry need to be indexed on copy up?
  */
diff --git a/include/linux/fs.h b/include/linux/fs.h
index f3daaea16554..4c15e270f1ac 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2320,8 +2320,10 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
  *			wb stat updates to grab the i_pages lock.  See
  *			inode_switch_wbs_work_fn() for details.
  *
- * I_OVL_INUSE		Used by overlayfs to get exclusive ownership on upper
- *			and work dirs among overlayfs mounts.
+ * I_EXCL_INUSE		Marked for exclusive use by a kernel service.  Used by
+ *			overlayfs to get exclusive ownership on upper and work
+ *			dirs among overlayfs mounts and by cachefiles to prevent
+ *			multiple access to a cache file.
  *
  * I_CREATING		New object's inode in the middle of setting up.
  *
@@ -2351,7 +2353,7 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
 #define I_LINKABLE		(1 << 10)
 #define I_DIRTY_TIME		(1 << 11)
 #define I_WB_SWITCH		(1 << 13)
-#define I_OVL_INUSE		(1 << 14)
+#define I_EXCL_INUSE		(1 << 14)
 #define I_CREATING		(1 << 15)
 #define I_DONTCACHE		(1 << 16)
 #define I_SYNC_QUEUED		(1 << 17)
@@ -2387,6 +2389,20 @@ static inline bool inode_is_dirtytime_only(struct inode *inode)
 				  I_FREEING | I_WILL_FREE)) == I_DIRTY_TIME;
 }
 
+bool inode_excl_inuse_trylock(struct dentry *dentry);
+void inode_excl_inuse_unlock(struct dentry *dentry);
+
+static inline bool inode_is_excl_inuse(struct dentry *dentry)
+{
+	struct inode *inode = d_inode(dentry);
+	bool inuse;
+
+	spin_lock(&inode->i_lock);
+	inuse = (inode->i_state & I_EXCL_INUSE);
+	spin_unlock(&inode->i_lock);
+	return inuse;
+}
+
 extern void inc_nlink(struct inode *inode);
 extern void drop_nlink(struct inode *inode);
 extern void clear_nlink(struct inode *inode);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

