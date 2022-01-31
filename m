Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FF94A49F6
	for <lists+linux-cachefs@lfdr.de>; Mon, 31 Jan 2022 16:14:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643642042;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YUwVqKOcAFuwtgzlSugOwU/ewMfciV0byh5IsDBDobs=;
	b=gYd8S/2lnaDEIIEpSbaxY+onsdujI64Xgsk/R7+v1PyCTKoezf6Yg4IPoHjMtIcsJgBvEi
	EQfwCtd+fVNRXS+li7lGhl7/fwaq8oXVysYjGbi5zJ4/DMWbaNrPzxA2OK/HKtUly29mDc
	IMaeawe3t6GdYtyg3nCo6ebZ4tTZshw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-rdHgXVLlP4uNdSrcvNWwXA-1; Mon, 31 Jan 2022 10:13:58 -0500
X-MC-Unique: rdHgXVLlP4uNdSrcvNWwXA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBFAF1006AA7;
	Mon, 31 Jan 2022 15:13:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEDB772436;
	Mon, 31 Jan 2022 15:13:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C6924BB7C;
	Mon, 31 Jan 2022 15:13:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VFDtR9007261 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 10:13:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 01A9B72417; Mon, 31 Jan 2022 15:13:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D72C774EB9;
	Mon, 31 Jan 2022 15:13:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 31 Jan 2022 15:13:52 +0000
Message-ID: <164364203196.1476539.12557909603374068848.stgit@warthog.procyon.org.uk>
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
Subject: [Linux-cachefs] [PATCH 3/5] cachefiles: Split removal-prevention
 from S_KERNEL_FILE and extend effects
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

Split removal-prevention from the S_KERNEL_FILE flag as it's really a
separate job and it should affect unlnk and rename too, not just rmdir[1].
This new flag is called I_NO_REMOVE and moved to inode->i_state.

If this is set, the file or directory may not be removed, renamed or
unlinked.  This can then be used by cachefiles to prevent userspace
removing or renaming files and directories that the are being used.  It
could also be used by overlayfs to prevent fiddling in its work
directories.

The directory layout in its cache is very important to cachefiles as the
names are how it indexes the contents.  Removing objects can cause
cachefilesd to malfunction as it may find it can't reach bits of the
structure that it previously created and still has dentry pointers to.

This also closes a race between cachefilesd trying to cull an empty
directory and cachefiles trying to create something in it.

Amir Goldstein suggested that the check in vfs_rmdir() should be moved to
may_delete()[1], but it really needs to be done whilst the inode lock is
held.

I_NO_REMOVE should only be test/set/cleared under the inode lock without
the lock being dropped between that and the VFS operations that might be
affected by it lest races occur.

Note also that I_NO_REMOVE will prevent vfs_unlink() vfs_rmdir() and
vfs_rename() from operating on a file.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Amir Goldstein <amir73il@gmail.com>
cc: Miklos Szeredi <miklos@szeredi.hu>
cc: linux-unionfs@vger.kernel.org
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/CAOQ4uxjEcvffv=rNXS-r+NLz+=6yk4abRuX_AMq9v-M4nf_PtA@mail.gmail.com [1]
---

 fs/cachefiles/namei.c |   12 ++++++++++--
 fs/namei.c            |    8 +++++---
 include/linux/fs.h    |    4 ++++
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index f256c8aff7bb..8930c767d93a 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -20,8 +20,10 @@ static bool __cachefiles_mark_inode_in_use(struct cachefiles_object *object,
 	struct inode *inode = d_backing_inode(dentry);
 	bool can_use = false;
 
+	spin_lock(&inode->i_lock);
 	if (!(inode->i_flags & S_KERNEL_FILE)) {
 		inode->i_flags |= S_KERNEL_FILE;
+		inode->i_state |= I_NO_REMOVE;
 		trace_cachefiles_mark_active(object, inode);
 		can_use = true;
 	} else {
@@ -29,6 +31,7 @@ static bool __cachefiles_mark_inode_in_use(struct cachefiles_object *object,
 		pr_notice("cachefiles: Inode already in use: %pd (B=%lx)\n",
 			  dentry, inode->i_ino);
 	}
+	spin_unlock(&inode->i_lock);
 
 	return can_use;
 }
@@ -53,7 +56,10 @@ static void __cachefiles_unmark_inode_in_use(struct cachefiles_object *object,
 {
 	struct inode *inode = d_backing_inode(dentry);
 
+	spin_lock(&inode->i_lock);
 	inode->i_flags &= ~S_KERNEL_FILE;
+	inode->i_state &= ~I_NO_REMOVE;
+	spin_unlock(&inode->i_lock);
 	trace_cachefiles_mark_inactive(object, inode);
 }
 
@@ -392,8 +398,10 @@ int cachefiles_bury_object(struct cachefiles_cache *cache,
 		};
 		trace_cachefiles_rename(object, d_inode(rep)->i_ino, why);
 		ret = cachefiles_inject_read_error();
-		if (ret == 0)
+		if (ret == 0) {
+			__cachefiles_unmark_inode_in_use(object, rep);
 			ret = vfs_rename(&rd);
+		}
 		if (ret != 0)
 			trace_cachefiles_vfs_error(object, d_inode(dir), ret,
 						   cachefiles_trace_rename_error);
@@ -402,7 +410,6 @@ int cachefiles_bury_object(struct cachefiles_cache *cache,
 					    "Rename failed with error %d", ret);
 	}
 
-	__cachefiles_unmark_inode_in_use(object, rep);
 	unlock_rename(cache->graveyard, dir);
 	dput(grave);
 	_leave(" = 0");
@@ -426,6 +433,7 @@ int cachefiles_delete_object(struct cachefiles_object *object,
 	dget(dentry);
 
 	inode_lock_nested(d_backing_inode(fan), I_MUTEX_PARENT);
+	cachefiles_unmark_inode_in_use(object, object->file);
 	ret = cachefiles_unlink(volume->cache, object, fan, dentry, why);
 	inode_unlock(d_backing_inode(fan));
 	dput(dentry);
diff --git a/fs/namei.c b/fs/namei.c
index 3f1829b3ab5b..ea17377794d3 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -4009,7 +4009,7 @@ int vfs_rmdir(struct user_namespace *mnt_userns, struct inode *dir,
 
 	error = -EBUSY;
 	if (is_local_mountpoint(dentry) ||
-	    (dentry->d_inode->i_flags & S_KERNEL_FILE))
+	    (dentry->d_inode->i_flags & I_NO_REMOVE))
 		goto out;
 
 	error = security_inode_rmdir(dir, dentry);
@@ -4139,7 +4139,8 @@ int vfs_unlink(struct user_namespace *mnt_userns, struct inode *dir,
 	inode_lock(target);
 	if (IS_SWAPFILE(target))
 		error = -EPERM;
-	else if (is_local_mountpoint(dentry))
+	else if (is_local_mountpoint(dentry) ||
+		 (dentry->d_inode->i_flags & I_NO_REMOVE))
 		error = -EBUSY;
 	else {
 		error = security_inode_unlink(dir, dentry);
@@ -4653,7 +4654,8 @@ int vfs_rename(struct renamedata *rd)
 		goto out;
 
 	error = -EBUSY;
-	if (is_local_mountpoint(old_dentry) || is_local_mountpoint(new_dentry))
+	if (is_local_mountpoint(old_dentry) || is_local_mountpoint(new_dentry) ||
+	    (old_dentry->d_inode->i_flags & I_NO_REMOVE))
 		goto out;
 
 	if (max_links && new_dir != old_dir) {
diff --git a/include/linux/fs.h b/include/linux/fs.h
index f461883d66a8..a273d5cde731 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2332,6 +2332,9 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
  * I_SYNC_QUEUED	Inode is queued in b_io or b_more_io writeback lists.
  *			Used to detect that mark_inode_dirty() should not move
  * 			inode between dirty lists.
+ * I_NO_REMOVE		Unlink, rmdir and rename are not allowed to remove the
+ *			object or any of its hard links.
+ *
  *
  * I_PINNING_FSCACHE_WB	Inode is pinning an fscache object for writeback.
  *
@@ -2358,6 +2361,7 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
 #define I_DONTCACHE		(1 << 16)
 #define I_SYNC_QUEUED		(1 << 17)
 #define I_PINNING_FSCACHE_WB	(1 << 18)
+#define I_NO_REMOVE		(1 << 19)
 
 #define I_DIRTY_INODE (I_DIRTY_SYNC | I_DIRTY_DATASYNC)
 #define I_DIRTY (I_DIRTY_INODE | I_DIRTY_PAGES)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

