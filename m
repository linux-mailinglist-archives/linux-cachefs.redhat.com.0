Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 36A3221DC9D
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Jul 2020 18:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594658052;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yO2ZRNH5XKAs5uhM2049AN2hqihDswDTAx4xZdClCpM=;
	b=PH1P62P6Oueiflqc2MTa2QS6FRLoOmkFF/EnmiSuQFOVfWvEtHE6XJwwS8nWN3RDn+cZyd
	sOM5EY4B1bswDU4udfXqQXzwL2rFrZ4/2TTSQMsnd/WSQg+GALsCnwjPQQZlp3NGOqSnXL
	diDKHCFqjrqI8mX09kphu8Xe5EyF4k0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-wSJD4euSOgOcndE40BD6vg-1; Mon, 13 Jul 2020 12:34:10 -0400
X-MC-Unique: wSJD4euSOgOcndE40BD6vg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1266C1009448;
	Mon, 13 Jul 2020 16:34:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 008D45FC1A;
	Mon, 13 Jul 2020 16:34:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F79794EEF;
	Mon, 13 Jul 2020 16:34:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DGY5u8027668 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 12:34:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F0D91A914; Mon, 13 Jul 2020 16:34:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-113.rdu2.redhat.com
	[10.10.112.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E79BC19D7D;
	Mon, 13 Jul 2020 16:33:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>
Date: Mon, 13 Jul 2020 17:33:59 +0100
Message-ID: <159465803914.1376674.8451362224962725376.stgit@warthog.procyon.org.uk>
In-Reply-To: <159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk>
References: <159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 18/32] cachefiles: Merge object->backer into
	object->dentry
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Merge the object->backer pointer into the object->dentry pointer and assume
that data objects are always going to be just regular files.

object->dentry can then more easily be overridden later by invalidation
without having two different things to update the xattrs on.

object->old maintains a pointer to the old file so that we can unlink the
it later.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/interface.c |   35 +++++++++++++++++------------------
 fs/cachefiles/internal.h  |    2 +-
 fs/cachefiles/io.c        |    4 ++--
 fs/cachefiles/namei.c     |    4 +++-
 4 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 4ce7ab5c75db..6384fba652eb 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -171,16 +171,16 @@ static void cachefiles_update_object(struct fscache_object *_object)
 	cachefiles_begin_secure(cache, &saved_cred);
 
 	object_size = object->fscache.cookie->object_size;
-	if (i_size_read(d_inode(object->backer)) > object_size) {
+	if (i_size_read(d_inode(object->dentry)) > object_size) {
 		struct path path = {
 			.mnt	= cache->mnt,
-			.dentry	= object->backer
+			.dentry	= object->dentry
 		};
-		_debug("trunc %llx -> %llx", i_size_read(d_inode(object->backer)), object_size);
+		_debug("trunc %llx -> %llx", i_size_read(d_inode(object->dentry)), object_size);
 		ret = vfs_truncate(&path, object_size);
 		if (ret < 0) {
 			cachefiles_io_error_obj(object, "Trunc-to-size failed");
-			cachefiles_remove_object_xattr(cache, object->backer);
+			cachefiles_remove_object_xattr(cache, object->dentry);
 			goto out;
 		}
 	}
@@ -219,9 +219,8 @@ static void cachefiles_clean_up_object(struct cachefiles_object *object,
 		fput(object->backing_file);
 	object->backing_file = NULL;
 
-	if (object->backer != object->dentry)
-		dput(object->backer);
-	object->backer = NULL;
+	dput(object->old);
+	object->old = NULL;
 
 	cachefiles_unmark_inode_in_use(object, object->dentry);
 	dput(object->dentry);
@@ -295,7 +294,7 @@ static void cachefiles_put_object(struct fscache_object *_object,
 	if (u == 0) {
 		_debug("- kill object OBJ%x", object->fscache.debug_id);
 
-		ASSERTCMP(object->backer, ==, NULL);
+		ASSERTCMP(object->old, ==, NULL);
 		ASSERTCMP(object->dentry, ==, NULL);
 		ASSERTCMP(object->fscache.n_children, ==, 0);
 
@@ -360,17 +359,17 @@ static int cachefiles_attr_changed(struct cachefiles_object *object)
 	if (ni_size == object->i_size)
 		return 0;
 
-	if (!object->backer)
+	if (!object->dentry)
 		return -ENOBUFS;
 
-	ASSERT(d_is_reg(object->backer));
+	ASSERT(d_is_reg(object->dentry));
 
-	oi_size = i_size_read(d_backing_inode(object->backer));
+	oi_size = i_size_read(d_backing_inode(object->dentry));
 	if (oi_size == ni_size)
 		return 0;
 
 	cachefiles_begin_secure(cache, &saved_cred);
-	inode_lock(d_inode(object->backer));
+	inode_lock(d_inode(object->dentry));
 
 	/* if there's an extension to a partial page at the end of the backing
 	 * file, we need to discard the partial page so that we pick up new
@@ -379,17 +378,17 @@ static int cachefiles_attr_changed(struct cachefiles_object *object)
 		_debug("discard tail %llx", oi_size);
 		newattrs.ia_valid = ATTR_SIZE;
 		newattrs.ia_size = oi_size & PAGE_MASK;
-		ret = notify_change(object->backer, &newattrs, NULL);
+		ret = notify_change(object->dentry, &newattrs, NULL);
 		if (ret < 0)
 			goto truncate_failed;
 	}
 
 	newattrs.ia_valid = ATTR_SIZE;
 	newattrs.ia_size = ni_size;
-	ret = notify_change(object->backer, &newattrs, NULL);
+	ret = notify_change(object->dentry, &newattrs, NULL);
 
 truncate_failed:
-	inode_unlock(d_inode(object->backer));
+	inode_unlock(d_inode(object->dentry));
 	cachefiles_end_secure(cache, saved_cred);
 
 	if (ret == -EIO) {
@@ -422,10 +421,10 @@ static void cachefiles_invalidate_object(struct fscache_object *_object)
 	_enter("{OBJ%x},[%llu]",
 	       object->fscache.debug_id, (unsigned long long)ni_size);
 
-	if (object->backer) {
-		ASSERT(d_is_reg(object->backer));
+	if (object->dentry) {
+		ASSERT(d_is_reg(object->dentry));
 
-		path.dentry = object->backer;
+		path.dentry = object->dentry;
 		path.mnt = cache->mnt;
 
 		cachefiles_begin_secure(cache, &saved_cred);
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index b82e7f8b00bd..a00ffb63baf4 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -35,7 +35,7 @@ extern unsigned cachefiles_debug;
 struct cachefiles_object {
 	struct fscache_object		fscache;	/* fscache handle */
 	struct dentry			*dentry;	/* the file/dir representing this object */
-	struct dentry			*backer;	/* backing file */
+	struct dentry			*old;		/* backing file */
 	struct file			*backing_file;	/* File open on backing storage */
 	loff_t				i_size;		/* object size */
 	atomic_t			usage;		/* object usage count */
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 89fd4a24e613..d17734455af2 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -59,11 +59,11 @@ bool cachefiles_open_object(struct cachefiles_object *object)
 	struct path path;
 
 	path.mnt = cache->mnt;
-	path.dentry = object->backer;
+	path.dentry = object->dentry;
 
 	file = open_with_fake_path(&path,
 				   O_RDWR | O_LARGEFILE | O_DIRECT,
-				   d_backing_inode(object->backer),
+				   d_backing_inode(object->dentry),
 				   cache->cache_cred);
 	if (IS_ERR(file))
 		goto error;
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index d9c9a7d7eb8a..3dc64ae5dde8 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -488,7 +488,7 @@ bool cachefiles_walk_to_object(struct cachefiles_object *parent,
 				goto check_error;
 			}
 
-			object->backer = object->dentry;
+			object->old = dget(object->dentry);
 		} else {
 			BUG(); // TODO: open file in data-class subdir
 		}
@@ -523,7 +523,9 @@ bool cachefiles_walk_to_object(struct cachefiles_object *parent,
 		cachefiles_unmark_inode_in_use(object, object->dentry);
 	cachefiles_mark_object_inactive(cache, object);
 	dput(object->dentry);
+	dput(object->old);
 	object->dentry = NULL;
+	object->old = NULL;
 	goto error_out;
 
 lookup_error:


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

