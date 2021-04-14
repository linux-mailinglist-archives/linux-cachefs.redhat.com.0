Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D2C9935F3F4
	for <lists+linux-cachefs@lfdr.de>; Wed, 14 Apr 2021 14:39:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-g6hDLWdBN4SK5nSiZ0kImQ-1; Wed, 14 Apr 2021 08:38:59 -0400
X-MC-Unique: g6hDLWdBN4SK5nSiZ0kImQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE2081084422;
	Wed, 14 Apr 2021 12:38:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC40019C78;
	Wed, 14 Apr 2021 12:38:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0204180B617;
	Wed, 14 Apr 2021 12:38:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13ECcrGC018059 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 14 Apr 2021 08:38:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05F25E30BD; Wed, 14 Apr 2021 12:38:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0098FE2A68
	for <linux-cachefs@redhat.com>; Wed, 14 Apr 2021 12:38:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCC738028BE
	for <linux-cachefs@redhat.com>; Wed, 14 Apr 2021 12:38:52 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-35-ml62zlwEOzae8RouVnSbQw-1; 
	Wed, 14 Apr 2021 08:38:50 -0400
X-MC-Unique: ml62zlwEOzae8RouVnSbQw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1E306120E;
	Wed, 14 Apr 2021 12:38:45 +0000 (UTC)
From: Christian Brauner <brauner@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 14 Apr 2021 14:37:48 +0200
Message-Id: <20210414123750.2110159-5-brauner@kernel.org>
In-Reply-To: <20210414123750.2110159-1-brauner@kernel.org>
References: <20210414123750.2110159-1-brauner@kernel.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=hwgEpKcxUilZoaiqT+JyzcfGZMf0soWkM4bdQYDkDvg=;
	m=a96r3v8RwrL4g/1sNPrC4UOIIAEXCc3CS0b2sRZc7RU=;
	p=XSHAjaTFwV7pvjIGkKhBUdgpl7JgMk4Nu6tl4Wc2ihs=;
	g=a078b6b4a1967b5b7c037666db37f7e1bb3fbf08
X-Patch-Sig: m=pgp; i=christian.brauner@ubuntu.com; s=0x0x91C61BC06578DCA2;
	b=iHUEABYKAB0WIQRAhzRXHqcMeLMyaSiRxhvAZXjcogUCYHbh3wAKCRCRxhvAZXjcovMtAP0fOOS
	sfiJHpJFidXGpKFaz7TF3d0dQVdFZeNLrC7XQ3wD/Ucs2xBHxI30BSsyuxfTXI6WrzKNW4uv7hMiW
	2ksOCAk=
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13ECcrGC018059
X-loop: linux-cachefs@redhat.com
Cc: Miklos Szeredi <mszeredi@redhat.com>, ecryptfs@vger.kernel.org,
	Amir Goldstein <amir73il@gmail.com>,
	Tyler Hicks <code@tyhicks.com>, linux-cachefs@redhat.com,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH 4/7] cachefiles: switch to using a private
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
user has allowed it to be used as a cache (apart from operations that
affect the superblock of course).

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

I have tested this patch with afs:

systemctl stop cachefilesd
sudo mount --bind /var/cache/fscache /var/cache/fscache
systemctl start cachefilesd

sudo apt install kafs-client
systemctl start afs.mount
ls -al /afs
ls -al /afs/grand.central.org/software/openafs/1.9.0
md5sum /afs/grand.central.org/software/openafs/1.9.0/openafs-1.9.0-doc.tar.bz2

cat /proc/fs/fscache/stats | grep [1-9]
  Cookies: idx=148 dat=35 spc=0
  Objects: alc=41 nal=0 avl=41 ded=0
  Pages  : mrk=934 unc=0
  Acquire: n=183 nul=0 noc=0 ok=183 nbf=0 oom=0
  Lookups: n=41 neg=41 pos=0 crt=41 tmo=0
  Retrvls: n=19 ok=0 wt=1 nod=19 nbf=0 int=0 oom=0
  Retrvls: ops=19 owt=0 abt=0
  Stores : n=934 ok=934 agn=0 nbf=0 oom=0
  Stores : ops=62 run=996 pgs=934 rxd=934 olm=0
  Ops    : pend=0 run=81 enq=996 can=0 rej=0
  Ops    : ini=953 dfr=0 rel=953 gc=0

umount /afs/grand.central.org
md5sum /afs/grand.central.org/software/openafs/1.9.0/openafs-1.9.0-doc.tar.bz2

cat /proc/fs/fscache/stats | grep [1-9]
  Cookies: idx=152 dat=60 spc=0
  Objects: alc=70 nal=0 avl=70 ded=39
  ChkAux : non=0 ok=25 upd=0 obs=0
  Pages  : mrk=1868 unc=934
  Acquire: n=212 nul=0 noc=0 ok=212 nbf=0 oom=0
  Lookups: n=70 neg=41 pos=29 crt=41 tmo=0
  Relinqs: n=39 nul=0 wcr=0 rtr=0
  Retrvls: n=38 ok=19 wt=2 nod=19 nbf=0 int=0 oom=0
  Retrvls: ops=38 owt=0 abt=0
  Stores : n=934 ok=934 agn=0 nbf=0 oom=0
  Stores : ops=62 run=996 pgs=934 rxd=934 olm=0
  Ops    : pend=0 run=100 enq=996 can=0 rej=0
  Ops    : ini=972 dfr=0 rel=972 gc=0

[1]: c771d683a62e ("vfs: introduce clone_private_mount()")
Cc: Amir Goldstein <amir73il@gmail.com>
Cc: David Howells <dhowells@redhat.com>
Cc: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/cachefiles/bind.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
index 38bb7764b454..7ef572d698f0 100644
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
@@ -115,16 +115,23 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 	if (ret < 0)
 		goto error_open_root;
 
-	cache->mnt = path.mnt;
-	root = path.dentry;
-
-	ret = -EINVAL;
 	if (mnt_user_ns(path.mnt) != &init_user_ns) {
+		ret = -EINVAL;
+		cache->mnt = NULL;
 		pr_warn("File cache on idmapped mounts not supported");
 		goto error_unsupported;
 	}
 
+	cache->mnt = clone_private_mount(&path);
+	if (IS_ERR(cache->mnt)) {
+		ret = PTR_ERR(cache->mnt);
+		cache->mnt = NULL;
+		pr_warn("Failed to create private mount for file cache\n");
+		goto error_unsupported;
+	}
+
 	/* check parameters */
+	root = path.dentry;
 	ret = -EOPNOTSUPP;
 	if (d_is_negative(root) ||
 	    !d_backing_inode(root)->i_op->lookup ||
@@ -144,8 +151,10 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 	if (ret < 0)
 		goto error_unsupported;
 
+	cache_path.dentry = path.dentry;
+	cache_path.mnt = cache->mnt;
 	/* get the cache size and blocksize */
-	ret = vfs_statfs(&path, &stats);
+	ret = vfs_statfs(&cache_path, &stats);
 	if (ret < 0)
 		goto error_unsupported;
 
@@ -229,7 +238,12 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 
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
 
@@ -242,11 +256,11 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 	dput(cache->graveyard);
 	cache->graveyard = NULL;
 error_unsupported:
-	mntput(cache->mnt);
+	path_put(&path);
+	kern_unmount(cache->mnt);
 	cache->mnt = NULL;
 	dput(fsdef->dentry);
 	fsdef->dentry = NULL;
-	dput(root);
 error_open_root:
 	kmem_cache_free(cachefiles_object_jar, fsdef);
 error_root_object:
@@ -270,7 +284,7 @@ void cachefiles_daemon_unbind(struct cachefiles_cache *cache)
 	}
 
 	dput(cache->graveyard);
-	mntput(cache->mnt);
+	kern_unmount(cache->mnt);
 
 	kfree(cache->rootdirname);
 	kfree(cache->secctx);
-- 
2.27.0


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

