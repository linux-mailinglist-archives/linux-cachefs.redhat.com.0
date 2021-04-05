Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 28AD3354E51
	for <lists+linux-cachefs@lfdr.de>; Tue,  6 Apr 2021 10:09:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-3fbD97NTMiCw5VVA4qlw-A-1; Tue, 06 Apr 2021 04:09:26 -0400
X-MC-Unique: 3fbD97NTMiCw5VVA4qlw-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21EA91966326;
	Tue,  6 Apr 2021 08:09:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C94145D9D0;
	Tue,  6 Apr 2021 08:09:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 832AE4BB7C;
	Tue,  6 Apr 2021 08:09:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 135Gr89V023633 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 5 Apr 2021 12:53:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D2ED51111A67; Mon,  5 Apr 2021 16:53:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD0C71111A64
	for <linux-cachefs@redhat.com>; Mon,  5 Apr 2021 16:53:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFF2785A5BC
	for <linux-cachefs@redhat.com>; Mon,  5 Apr 2021 16:53:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-173-nFQBDJ7eNvCEdzAd3bN6Mg-1;
	Mon, 05 Apr 2021 12:53:03 -0400
X-MC-Unique: nFQBDJ7eNvCEdzAd3bN6Mg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 284FB610CB;
	Mon,  5 Apr 2021 16:46:10 +0000 (UTC)
From: Christian Brauner <brauner@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Mon,  5 Apr 2021 18:46:03 +0200
Message-Id: <20210405164603.281189-1-brauner@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 135Gr89V023633
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 06 Apr 2021 04:09:17 -0400
Cc: linux-fsdevel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Amir Goldstein <amir73il@gmail.com>
Subject: [Linux-cachefs] [PATCH] cachefiles: use private mounts in cache->mnt
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

From: Christian Brauner <christian.brauner@ubuntu.com>

Since [1] we support creating private mounts from a given path's
vfsmount. This makes them very suitable for any filesystem or
filesystem functionality that piggybacks on paths of another filesystem.
Overlayfs and ecryptfs (which I'll port next) are just two such
examples.
Without trying to imply to many similarities cachefiles have one thing
in common with stacking filesystems namely that they also stack on top
of existing paths. These paths are then used as caches for a netfs.
Since private mounts aren't attached in the filesystem the aren't
affected by mount property changes after cachefiles makes use of them.
This seems a rather desirable property as the underlying path can't e.g.
suddenly go from read-write to read-only and in general it means that
cachefiles is always in full control of the underlying mount after the
user has allowed it to be used as a cache.
Besides that - and probably irrelevant from the perspective of a
cachefiles developer - it also makes things simpler for a variety of
other vfs features. One concrete example is fanotify. When the path->mnt
of the path that is used as a cache has been marked with FAN_MARK_MOUNT
the semantics get tricky as it isn't clear whether the watchers of
path->mnt should get notified about fsnotify events when files are
created by cachefilesd via path->mnt. Using a private mount let's us
elegantly handle this case too and aligns the behavior of stacks created
by overlayfs.

Reading through the codebase cachefiles currently takes path->mnt and
stashes it in cache->mnt. Everytime a cache object needs to be created,
looked-up, or in some other form interacted with cachefiles will create
a custom path comprised of cache->mnt and the relevant dentry it is
interested in:

struct path cachefiles_path = {
        .mnt = cache->mnt,
        .dentry = dentry,
};

So cachefiles already passes the cache->mnt through everywhere so
supporting private mounts with cachefiles is pretty simply. Instead of
recording path->mnt in cache->mnt we simply record a new private mount
we created as a copy of path->mnt via clone_private_mount() in
cache->mnt. The rest is cleanly handled by cachefiles already.

I have tested this patch with an nfs v4 export. Server on host:

/srv/nfs        10.103.182.1/24(rw,sync,crossmnt,fsid=0)
/srv/nfs/mnt 	10.103.182.1/24(rw,sync)

In a vm running a kernel with this patch I first created a separate
bind-mount for /var/cache/fscache:

mount --bind /var/cache/fscache /var/cache/fscache

Then I enabled and ran cachefilesd.

and mounted the server:

mount 10.103.182.1:/mnt /mnt

and the cache worked fine! I then tried

mount -o bind,remount,ro /var/cache/fscache

and the cache continued to be working fine due to the private mount. I
don't have access to a test-suite for cachefiles though and I haven't
found one so far. If someone has a local test-suite I would very much
appreciate a test-run.

[1]: c771d683a62e ("vfs: introduce clone_private_mount()")
Cc: Amir Goldstein <amir73il@gmail.com>
Cc: David Howells <dhowells@redhat.com>
Cc: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/cachefiles/bind.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
index 38bb7764b454..ac03af93437b 100644
--- a/fs/cachefiles/bind.c
+++ b/fs/cachefiles/bind.c
@@ -81,7 +81,7 @@ int cachefiles_daemon_bind(struct cachefiles_cache *cache, char *args)
 static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 {
 	struct cachefiles_object *fsdef;
-	struct path path;
+	struct path path, cache_path;
 	struct kstatfs stats;
 	struct dentry *graveyard, *cachedir, *root;
 	const struct cred *saved_cred;
@@ -115,16 +115,22 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 	if (ret < 0)
 		goto error_open_root;
 
-	cache->mnt = path.mnt;
-	root = path.dentry;
+	cache->mnt = clone_private_mount(&path);
+	if (IS_ERR(cache->mnt)) {
+		ret = PTR_ERR(cache->mnt);
+		cache->mnt = NULL;
+		pr_warn("Failed to create private mount for file cache\n");
+		goto error_unsupported;
+	}
 
 	ret = -EINVAL;
-	if (mnt_user_ns(path.mnt) != &init_user_ns) {
+	if (mnt_user_ns(cache->mnt) != &init_user_ns) {
 		pr_warn("File cache on idmapped mounts not supported");
 		goto error_unsupported;
 	}
 
 	/* check parameters */
+	root = path.dentry;
 	ret = -EOPNOTSUPP;
 	if (d_is_negative(root) ||
 	    !d_backing_inode(root)->i_op->lookup ||
@@ -144,8 +150,10 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 	if (ret < 0)
 		goto error_unsupported;
 
+	cache_path = path;
+	cache_path.mnt = cache->mnt;
 	/* get the cache size and blocksize */
-	ret = vfs_statfs(&path, &stats);
+	ret = vfs_statfs(&cache_path, &stats);
 	if (ret < 0)
 		goto error_unsupported;
 
@@ -229,7 +237,12 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 
 	/* done */
 	set_bit(CACHEFILES_READY, &cache->flags);
-	dput(root);
+
+	/*
+	 * We've created a private mount and we've stashed our "cache" and
+	 * "graveyard" dentries so we don't need the path anymore.
+	 */
+	path_put(&path);
 
 	pr_info("File cache on %s registered\n", cache->cache.identifier);
 
@@ -242,11 +255,11 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 	dput(cache->graveyard);
 	cache->graveyard = NULL;
 error_unsupported:
+	path_put(&path);
 	mntput(cache->mnt);
 	cache->mnt = NULL;
 	dput(fsdef->dentry);
 	fsdef->dentry = NULL;
-	dput(root);
 error_open_root:
 	kmem_cache_free(cachefiles_object_jar, fsdef);
 error_root_object:

base-commit: a5e13c6df0e41702d2b2c77c8ad41677ebb065b3
-- 
2.27.0


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

