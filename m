Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id BA79535F3F7
	for <lists+linux-cachefs@lfdr.de>; Wed, 14 Apr 2021 14:39:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-jUgSIsupMoiQswFHfYV1tA-1; Wed, 14 Apr 2021 08:39:10 -0400
X-MC-Unique: jUgSIsupMoiQswFHfYV1tA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5E001020C21;
	Wed, 14 Apr 2021 12:39:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4BA41899A;
	Wed, 14 Apr 2021 12:39:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BCCA91806D0F;
	Wed, 14 Apr 2021 12:39:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13ECd5UT018102 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 14 Apr 2021 08:39:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5F309E2A68; Wed, 14 Apr 2021 12:39:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59CE3E2053
	for <linux-cachefs@redhat.com>; Wed, 14 Apr 2021 12:39:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F18180A1D2
	for <linux-cachefs@redhat.com>; Wed, 14 Apr 2021 12:39:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-272-WVYheefyPIGajdv3oTG0_Q-1;
	Wed, 14 Apr 2021 08:39:00 -0400
X-MC-Unique: WVYheefyPIGajdv3oTG0_Q-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id E447961222;
	Wed, 14 Apr 2021 12:38:52 +0000 (UTC)
From: Christian Brauner <brauner@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 14 Apr 2021 14:37:50 +0200
Message-Id: <20210414123750.2110159-7-brauner@kernel.org>
In-Reply-To: <20210414123750.2110159-1-brauner@kernel.org>
References: <20210414123750.2110159-1-brauner@kernel.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=i5quYyun8czxLRZDdxT24V6D/9GbgPuJDPP9COSpA2g=;
	m=+2d+ocNPdMCe8GC9GnGjlv0wWqrqX3vSwHbWLBXFwSI=;
	p=Py3KZeGpAEWh2+GxH6M/MTccIrFuJBbFGSxvJl8Og24=;
	g=4087f9cc29878418c1f6c9bd42db7c7e798cbe0f
X-Patch-Sig: m=pgp; i=christian.brauner@ubuntu.com; s=0x0x91C61BC06578DCA2;
	b=iHQEABYKAB0WIQRAhzRXHqcMeLMyaSiRxhvAZXjcogUCYHbh3wAKCRCRxhvAZXjcomN4AQDUz7P
	ixmxUMLJ57EBcy8VFI7HrqGjYQezz6S9wgCKmxQD2NhcyfJOAWwE9uK4ncOC9SATknjSdFgtJCTKp
	kT6TBg==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13ECd5UT018102
X-loop: linux-cachefs@redhat.com
Cc: Miklos Szeredi <mszeredi@redhat.com>, ecryptfs@vger.kernel.org,
	Amir Goldstein <amir73il@gmail.com>,
	Tyler Hicks <code@tyhicks.com>, linux-cachefs@redhat.com,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH 6/7] ecryptfs: switch to using a private
	mount
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Christian Brauner <christian.brauner@ubuntu.com>

Since [1] we support creating private mounts from a given path's
vfsmount. This makes them very suitable for any filesystem or
filesystem functionality that piggybacks on paths of another filesystem.
Overlayfs, cachefiles, and ecryptfs are three prime examples.

Since private mounts aren't attached in the filesystem they aren't
affected by mount property changes after ecryptfs makes use of them.
This seems a rather desirable property as the underlying path can't e.g.
suddenly go from read-write to read-only and in general it means that
ecryptfs is always in full control of the underlying mount after the
user has allowed it to be used (apart from operations that affect the
superblock of course).

Besides that it also makes things simpler for a variety of other vfs
features. One concrete example is fanotify. When the path->mnt of the
path that is used as a cache has been marked with FAN_MARK_MOUNT the
semantics get tricky as it isn't clear whether the watchers of path->mnt
should get notified about fsnotify events when files are created by
ecryptfs via path->mnt. Using a private mount let's us elegantly
handle this case too and aligns the behavior of stacks created by
overlayfs and cachefiles.

This change comes with a proper simplification in how ecryptfs currently
handles the lower_path it stashes as private information in its
dentries. Currently it always does:

        ecryptfs_set_dentry_private(dentry, dentry_info);
        dentry_info->lower_path.mnt = mntget(path->mnt);
        dentry_info->lower_path.dentry = lower_dentry;

and then during .d_relase() in ecryptfs_d_release():

        path_put(&p->lower_path);

which is odd since afaict path->mnt is guaranteed to be the mnt stashed
during ecryptfs_mount():

        ecryptfs_set_dentry_private(s->s_root, root_info);
        root_info->lower_path = path;

So that mntget() seems somewhat pointless but there might be reasons
that I'm missing in how the interpose logic for ecryptfs works.

While switching to a long-term private mount via clone_private_mount()
let's get rid of the gratuitous mntget() and mntput()/path_put().
Instead, stash away the private mount in ecryptfs' s_fs_info and call
kern_unmount() in .kill_sb() so we only take the mntput() hit once.

I've added a WARN_ON_ONCE() into ecryptfs_lookup_interpose() triggering
if the stashed private mount and the path's mount don't match. I think
that would be a proper bug even without that clone_private_mount()
change in this patch.

[1]: c771d683a62e ("vfs: introduce clone_private_mount()")
Cc: Amir Goldstein <amir73il@gmail.com>
Cc: Tyler Hicks <code@tyhicks.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>
Cc: ecryptfs@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/ecryptfs/dentry.c          |  6 +++++-
 fs/ecryptfs/ecryptfs_kernel.h |  9 +++++++++
 fs/ecryptfs/inode.c           |  5 ++++-
 fs/ecryptfs/main.c            | 29 ++++++++++++++++++++++++-----
 4 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/fs/ecryptfs/dentry.c b/fs/ecryptfs/dentry.c
index 44606f079efb..e5edafa165d4 100644
--- a/fs/ecryptfs/dentry.c
+++ b/fs/ecryptfs/dentry.c
@@ -67,7 +67,11 @@ static void ecryptfs_d_release(struct dentry *dentry)
 {
 	struct ecryptfs_dentry_info *p = dentry->d_fsdata;
 	if (p) {
-		path_put(&p->lower_path);
+		/*
+		 * p->lower_path.mnt is a private mount which will be released
+		 * when the superblock shuts down so we only need to dput here.
+		 */
+		dput(p->lower_path.dentry);
 		call_rcu(&p->rcu, ecryptfs_dentry_free_rcu);
 	}
 }
diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index e6ac78c62ca4..f89d0f7bb3fe 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -352,6 +352,7 @@ struct ecryptfs_mount_crypt_stat {
 struct ecryptfs_sb_info {
 	struct super_block *wsi_sb;
 	struct ecryptfs_mount_crypt_stat mount_crypt_stat;
+	struct vfsmount *mnt;
 };
 
 /* file private data. */
@@ -496,6 +497,14 @@ ecryptfs_set_superblock_lower(struct super_block *sb,
 	((struct ecryptfs_sb_info *)sb->s_fs_info)->wsi_sb = lower_sb;
 }
 
+static inline void
+ecryptfs_set_superblock_lower_mnt(struct super_block *sb,
+				  struct vfsmount *mnt)
+{
+	struct ecryptfs_sb_info *sbi = sb->s_fs_info;
+	sbi->mnt = mnt;
+}
+
 static inline struct ecryptfs_dentry_info *
 ecryptfs_dentry_to_private(struct dentry *dentry)
 {
diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 18e9285fbb4c..204df4bf476d 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -324,6 +324,7 @@ static struct dentry *ecryptfs_lookup_interpose(struct dentry *dentry,
 				     struct dentry *lower_dentry)
 {
 	struct path *path = ecryptfs_dentry_to_lower_path(dentry->d_parent);
+	struct ecryptfs_sb_info *sb_info = ecryptfs_superblock_to_private(dentry->d_sb);
 	struct inode *inode, *lower_inode;
 	struct ecryptfs_dentry_info *dentry_info;
 	int rc = 0;
@@ -339,7 +340,9 @@ static struct dentry *ecryptfs_lookup_interpose(struct dentry *dentry,
 	BUG_ON(!d_count(lower_dentry));
 
 	ecryptfs_set_dentry_private(dentry, dentry_info);
-	dentry_info->lower_path.mnt = mntget(path->mnt);
+	/* Warn if we somehow ended up with an unexpected path. */
+	WARN_ON_ONCE(path->mnt != sb_info->mnt);
+	dentry_info->lower_path.mnt = path->mnt;
 	dentry_info->lower_path.dentry = lower_dentry;
 
 	/*
diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index cdf40a54a35d..3ba2c0f349a3 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -476,6 +476,7 @@ static struct file_system_type ecryptfs_fs_type;
 static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags,
 			const char *dev_name, void *raw_data)
 {
+	struct vfsmount *mnt;
 	struct super_block *s;
 	struct ecryptfs_sb_info *sbi;
 	struct ecryptfs_mount_crypt_stat *mount_crypt_stat;
@@ -537,6 +538,16 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
 		goto out_free;
 	}
 
+	mnt = clone_private_mount(&path);
+	if (IS_ERR(mnt)) {
+		rc = PTR_ERR(mnt);
+		pr_warn("Failed to create private mount for ecryptfs\n");
+		goto out_free;
+	}
+
+	/* Record our long-term lower mount. */
+	ecryptfs_set_superblock_lower_mnt(s, mnt);
+
 	if (check_ruid && !uid_eq(d_inode(path.dentry)->i_uid, current_uid())) {
 		rc = -EPERM;
 		printk(KERN_ERR "Mount of device (uid: %d) not owned by "
@@ -590,9 +601,15 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
 	if (!root_info)
 		goto out_free;
 
+	/* Use our private mount from now on. */
+	root_info->lower_path.mnt = mnt;
+	root_info->lower_path.dentry = dget(path.dentry);
+
+	/* We created a private clone of this mount above so drop the path. */
+	path_put(&path);
+
 	/* ->kill_sb() will take care of root_info */
 	ecryptfs_set_dentry_private(s->s_root, root_info);
-	root_info->lower_path = path;
 
 	s->s_flags |= SB_ACTIVE;
 	return dget(s->s_root);
@@ -619,11 +636,13 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
 static void ecryptfs_kill_block_super(struct super_block *sb)
 {
 	struct ecryptfs_sb_info *sb_info = ecryptfs_superblock_to_private(sb);
+
 	kill_anon_super(sb);
-	if (!sb_info)
-		return;
-	ecryptfs_destroy_mount_crypt_stat(&sb_info->mount_crypt_stat);
-	kmem_cache_free(ecryptfs_sb_info_cache, sb_info);
+	if (sb_info) {
+		kern_unmount(sb_info->mnt);
+		ecryptfs_destroy_mount_crypt_stat(&sb_info->mount_crypt_stat);
+		kmem_cache_free(ecryptfs_sb_info_cache, sb_info);
+	}
 }
 
 static struct file_system_type ecryptfs_fs_type = {
-- 
2.27.0


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

