Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF4A4320E0
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 16:57:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569033;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3eUSObEV0CskmhfLFsll7UfxUQwOpz+sbZd6Cb3UObI=;
	b=PnRvYw6Op9KGJYHfe2ln+Yqi9Aw3xQ7mdGXcDozrzd8VuaOr7P8ZBFCuZNQJmo2gWZsbt+
	MauoQcz1zq8IbusPHfd1/v70f6BAwZfHZW+uD90xv640etfh8Lmqc/vNBfmYl28+ZpLbV5
	rTRa1HfO13Tb6ATuf5RvQvs43E/AvJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-KK4BAFkYNG-ojI0WQCN-Yw-1; Mon, 18 Oct 2021 10:57:09 -0400
X-MC-Unique: KK4BAFkYNG-ojI0WQCN-Yw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE3F28066F3;
	Mon, 18 Oct 2021 14:57:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F25A60D30;
	Mon, 18 Oct 2021 14:57:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A3B71806D03;
	Mon, 18 Oct 2021 14:57:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IEuwFP028496 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 10:56:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1F231017CE5; Mon, 18 Oct 2021 14:56:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A39C3100E809;
	Mon, 18 Oct 2021 14:56:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 15:56:54 +0100
Message-ID: <163456901488.2614702.3877237088238450861.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH 24/67] cachefiles: Remove separate backer
 dentry from cachefiles_object
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

The cachefiles_object struct has two dentry pointers - one for the
file/directory representing the object and a second one in case a data
object is a directory with a file inside of it that contains the data (the
idea being that there might be another file, say, containing a journal of
local changes that need committing or a list of cached xattrs).

At the moment, this isn't implemented, so remove it and always use the main
dentry pointer.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/bind.c      |    2 --
 fs/cachefiles/interface.c |   28 +++++++++-------------------
 fs/cachefiles/internal.h  |    1 -
 fs/cachefiles/io.c        |    4 ++--
 fs/cachefiles/namei.c     |    1 -
 5 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
index fbc8577477c1..cb3296814056 100644
--- a/fs/cachefiles/bind.c
+++ b/fs/cachefiles/bind.c
@@ -101,8 +101,6 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 	if (!fsdef)
 		goto error_root_object;
 
-	ASSERTCMP(fsdef->backer, ==, NULL);
-
 	atomic_set(&fsdef->usage, 1);
 	fsdef->type = FSCACHE_COOKIE_TYPE_INDEX;
 
diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 2083aca6bd0c..92bb3ba78c41 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -31,8 +31,6 @@ static struct fscache_object *cachefiles_alloc_object(
 	if (!object)
 		goto nomem_object;
 
-	ASSERTCMP(object->backer, ==, NULL);
-
 	atomic_set(&object->usage, 1);
 
 	fscache_object_init(&object->fscache, cookie, &cache->cache);
@@ -191,10 +189,6 @@ static void cachefiles_drop_object(struct fscache_object *_object)
 		}
 
 		/* close the filesystem stuff attached to the object */
-		if (object->backer != object->dentry)
-			dput(object->backer);
-		object->backer = NULL;
-
 		cachefiles_unmark_inode_in_use(object);
 		dput(object->dentry);
 		object->dentry = NULL;
@@ -235,7 +229,6 @@ void cachefiles_put_object(struct fscache_object *_object,
 		_debug("- kill object OBJ%x", object->fscache.debug_id);
 
 		ASSERTCMP(object->fscache.parent, ==, NULL);
-		ASSERTCMP(object->backer, ==, NULL);
 		ASSERTCMP(object->dentry, ==, NULL);
 		ASSERTCMP(object->fscache.n_ops, ==, 0);
 		ASSERTCMP(object->fscache.n_children, ==, 0);
@@ -303,17 +296,14 @@ static int cachefiles_attr_changed(struct cachefiles_object *object)
 	if (ni_size == object->i_size)
 		return 0;
 
-	if (!object->backer)
-		return -ENOBUFS;
+	ASSERT(d_is_reg(object->dentry));
 
-	ASSERT(d_is_reg(object->backer));
-
-	oi_size = i_size_read(d_backing_inode(object->backer));
+	oi_size = i_size_read(d_backing_inode(object->dentry));
 	if (oi_size == ni_size)
 		return 0;
 
 	cachefiles_begin_secure(cache, &saved_cred);
-	inode_lock(d_inode(object->backer));
+	inode_lock(d_inode(object->dentry));
 
 	/* if there's an extension to a partial page at the end of the backing
 	 * file, we need to discard the partial page so that we pick up new
@@ -322,17 +312,17 @@ static int cachefiles_attr_changed(struct cachefiles_object *object)
 		_debug("discard tail %llx", oi_size);
 		newattrs.ia_valid = ATTR_SIZE;
 		newattrs.ia_size = oi_size & PAGE_MASK;
-		ret = notify_change(&init_user_ns, object->backer, &newattrs, NULL);
+		ret = notify_change(&init_user_ns, object->dentry, &newattrs, NULL);
 		if (ret < 0)
 			goto truncate_failed;
 	}
 
 	newattrs.ia_valid = ATTR_SIZE;
 	newattrs.ia_size = ni_size;
-	ret = notify_change(&init_user_ns, object->backer, &newattrs, NULL);
+	ret = notify_change(&init_user_ns, object->dentry, &newattrs, NULL);
 
 truncate_failed:
-	inode_unlock(d_inode(object->backer));
+	inode_unlock(d_inode(object->dentry));
 	cachefiles_end_secure(cache, saved_cred);
 
 	if (ret == -EIO) {
@@ -365,10 +355,10 @@ static void cachefiles_invalidate_object(struct fscache_object *_object)
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
index 83911cf24769..9f2f837027e0 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -36,7 +36,6 @@ struct cachefiles_object {
 	struct fscache_object		fscache;	/* fscache handle */
 	char				*d_name;	/* Filename */
 	struct dentry			*dentry;	/* the file/dir representing this object */
-	struct dentry			*backer;	/* backing file */
 	loff_t				i_size;		/* object size */
 	atomic_t			usage;		/* object usage count */
 	uint8_t				type;		/* object type */
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 534c81a05918..920ca48eecfa 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -426,9 +426,9 @@ int cachefiles_begin_operation(struct netfs_cache_resources *cres)
 			     struct cachefiles_cache, cache);
 
 	path.mnt = cache->mnt;
-	path.dentry = object->backer;
+	path.dentry = object->dentry;
 	file = open_with_fake_path(&path, O_RDWR | O_LARGEFILE | O_DIRECT,
-				   d_inode(object->backer), cache->cache_cred);
+				   d_inode(object->dentry), cache->cache_cred);
 	if (IS_ERR(file))
 		return PTR_ERR(file);
 	if (!S_ISREG(file_inode(file)->i_mode))
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index b5a0aec529af..7f02fcb34b1e 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -459,7 +459,6 @@ int cachefiles_walk_to_object(struct cachefiles_object *parent,
 	if (ret < 0)
 		goto check_error;
 
-	object->backer = object->dentry;
 	object->new = false;
 	fscache_obtained_object(&object->fscache);
 	_leave(" = 0 [%lu]", d_backing_inode(object->dentry)->i_ino);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

