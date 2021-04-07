Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B1790356790
	for <lists+linux-cachefs@lfdr.de>; Wed,  7 Apr 2021 11:02:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-0NU17v2mMvOfa4V793sB3Q-1; Wed, 07 Apr 2021 05:02:40 -0400
X-MC-Unique: 0NU17v2mMvOfa4V793sB3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 897CB64083;
	Wed,  7 Apr 2021 09:02:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 797CF39A73;
	Wed,  7 Apr 2021 09:02:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E988C1806D06;
	Wed,  7 Apr 2021 09:02:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13792UXf022431 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 7 Apr 2021 05:02:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05C552026D64; Wed,  7 Apr 2021 09:02:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00FC12026D65
	for <linux-cachefs@redhat.com>; Wed,  7 Apr 2021 09:02:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A5861854CA2
	for <linux-cachefs@redhat.com>; Wed,  7 Apr 2021 09:02:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-288-9Icw5_IBM_iUWSjxIAKg1Q-1;
	Wed, 07 Apr 2021 05:02:24 -0400
X-MC-Unique: 9Icw5_IBM_iUWSjxIAKg1Q-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94E5661205;
	Wed,  7 Apr 2021 09:02:20 +0000 (UTC)
From: Christian Brauner <brauner@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Wed,  7 Apr 2021 11:02:07 +0200
Message-Id: <20210407090208.876920-1-brauner@kernel.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=eowlx1NntoC7VEw4p67kmsYshEbOr4Eu2ULNgq7j754=;
	m=2Fm9CC+jK5uAF6vPiYFh4E+Orhe2SMiIxerPMBwBPTs=;
	p=L7IxtciVyn3zbiHf6BWUkkC7t9WpxFa281SzqQqG28I=;
	g=6cd7f8f0c75a974e20e15df010a8c2fbf4973ef3
X-Patch-Sig: m=pgp; i=christian.brauner@ubuntu.com; s=0x0x91C61BC06578DCA2;
	b=iHUEABYKAB0WIQRAhzRXHqcMeLMyaSiRxhvAZXjcogUCYG11CAAKCRCRxhvAZXjcoiNyAP9tBY6
	GnvzELlh16RMCQTiGcMxvhW0y5PG0ZyWg6wCf7wEAgi8owolgnSv/gI8jdW1mBxKpl/jMamImVDAL
	fLtecwI=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13792UXf022431
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Amir Goldstein <amir73il@gmail.com>
Subject: [Linux-cachefs] [PATCH v2 1/2] cachefiles: use private mounts in
	cache->mnt
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
  Cookies: idx=148 dat=34 spc=0
  Objects: alc=40 nal=0 avl=40 ded=1
  Pages  : mrk=934 unc=203
  Acquire: n=182 nul=0 noc=0 ok=182 nbf=0 oom=0
  Lookups: n=40 neg=40 pos=0 crt=40 tmo=0
  Retrvls: n=19 ok=0 wt=2 nod=19 nbf=0 int=0 oom=0
  Retrvls: ops=19 owt=2 abt=0
  Stores : n=934 ok=934 agn=0 nbf=0 oom=0
  Stores : ops=21 run=955 pgs=934 rxd=934 olm=0
  VmScan : nos=203 gon=0 bsy=0 can=0 wt=0
  Ops    : pend=2 run=40 enq=955 can=0 rej=0
  Ops    : ini=953 dfr=0 rel=953 gc=0

umount /afs/grand.central.org
md5sum /afs/grand.central.org/software/openafs/1.9.0/openafs-1.9.0-doc.tar.bz2

cat /proc/fs/fscache/stats | grep [1-9]
  Cookies: idx=153 dat=58 spc=0
  Objects: alc=68 nal=0 avl=68 ded=39
  ChkAux : non=0 ok=24 upd=0 obs=0
  Pages  : mrk=1868 unc=934
  Acquire: n=211 nul=0 noc=0 ok=211 nbf=0 oom=0
  Lookups: n=68 neg=40 pos=28 crt=40 tmo=0
  Relinqs: n=39 nul=0 wcr=0 rtr=0
  Retrvls: n=38 ok=19 wt=3 nod=19 nbf=0 int=0 oom=0
  Retrvls: ops=38 owt=2 abt=0
  Stores : n=934 ok=934 agn=0 nbf=0 oom=0
  Stores : ops=21 run=955 pgs=934 rxd=934 olm=0
  VmScan : nos=203 gon=0 bsy=0 can=0 wt=0
  Ops    : pend=2 run=59 enq=955 can=0 rej=0
  Ops    : ini=972 dfr=0 rel=972 gc=0

[1]: c771d683a62e ("vfs: introduce clone_private_mount()")
Cc: Amir Goldstein <amir73il@gmail.com>
Cc: David Howells <dhowells@redhat.com>
Cc: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
/* v2 */
Thank you to David for helping with testing!
- David Howells <dhowells@redhat.com>:
  - Don't copy all of path into cache_path. Simply set both path.dentry
    and path.mnt to the desired values.
  - Check for idmapped mount before calling clone_private_mount().
  - Add paragraphs into commit message to make it easier to parse.
---
 fs/cachefiles/bind.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
index 38bb7764b454..bbace3e51f52 100644
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

