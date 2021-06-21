Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB073AF7E2
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Jun 2021 23:46:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624312018;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ERFAowqsfBdfH0SxI7FgtR/CpVgG8iicB8ExzjGRvHI=;
	b=QiGUqSaq6hPWAc6INcCb/GvFaFDVtmT3PrbezK7O6wkW8uV+R2R3TL9p5uVwoZEKs4UrCk
	Q3KDYdlO/szkQztEY4iFZDI4Id4hAUxzQXhZtH+WmbZLIP8IPPNADmlbCFGZessWxy6dzH
	Wh0LVM7ojLg9zlEjlAgrVT71wHm2rBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-MP6hWUaPMw-Jx6JzTpYufg-1; Mon, 21 Jun 2021 17:46:56 -0400
X-MC-Unique: MP6hWUaPMw-Jx6JzTpYufg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F20150750;
	Mon, 21 Jun 2021 21:46:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8709319C79;
	Mon, 21 Jun 2021 21:46:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7166F1809C99;
	Mon, 21 Jun 2021 21:46:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15LLkrIA030916 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 17:46:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 396125FC08; Mon, 21 Jun 2021 21:46:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-65.rdu2.redhat.com
	[10.10.118.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8DF95C1C2;
	Mon, 21 Jun 2021 21:46:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 21 Jun 2021 22:46:46 +0100
Message-ID: <162431200692.2908479.9253374494073633778.stgit@warthog.procyon.org.uk>
In-Reply-To: <162431188431.2908479.14031376932042135080.stgit@warthog.procyon.org.uk>
References: <162431188431.2908479.14031376932042135080.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH 09/12] cachefiles: Change %p in format
 strings to something else
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

Change plain %p in format strings in cachefiles code to something more
useful, since %p is now hashed before printing and thus no longer matches
the contents of an oops register dump.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/bind.c      |    2 --
 fs/cachefiles/interface.c |    6 +++---
 fs/cachefiles/key.c       |    2 +-
 fs/cachefiles/namei.c     |   48 +++++++++++++++++++++------------------------
 fs/cachefiles/xattr.c     |    4 ++--
 5 files changed, 28 insertions(+), 34 deletions(-)

diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
index 38bb7764b454..d463d89f5db8 100644
--- a/fs/cachefiles/bind.c
+++ b/fs/cachefiles/bind.c
@@ -108,8 +108,6 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 	atomic_set(&fsdef->usage, 1);
 	fsdef->type = FSCACHE_COOKIE_TYPE_INDEX;
 
-	_debug("- fsdef %p", fsdef);
-
 	/* look up the directory at the root of the cache */
 	ret = kern_path(cache->rootdirname, LOOKUP_DIRECTORY, &path);
 	if (ret < 0)
diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index da3948fdb615..da28ac1fa225 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -33,7 +33,7 @@ static struct fscache_object *cachefiles_alloc_object(
 
 	cache = container_of(_cache, struct cachefiles_cache, cache);
 
-	_enter("{%s},%p,", cache->cache.identifier, cookie);
+	_enter("{%s},%x,", cache->cache.identifier, cookie->debug_id);
 
 	lookup_data = kmalloc(sizeof(*lookup_data), cachefiles_gfp);
 	if (!lookup_data)
@@ -96,7 +96,7 @@ static struct fscache_object *cachefiles_alloc_object(
 	lookup_data->key = key;
 	object->lookup_data = lookup_data;
 
-	_leave(" = %p [%p]", &object->fscache, lookup_data);
+	_leave(" = %x [%p]", object->fscache.debug_id, lookup_data);
 	return &object->fscache;
 
 nomem_key:
@@ -379,7 +379,7 @@ static void cachefiles_sync_cache(struct fscache_cache *_cache)
 	const struct cred *saved_cred;
 	int ret;
 
-	_enter("%p", _cache);
+	_enter("%s", _cache->tag->name);
 
 	cache = container_of(_cache, struct cachefiles_cache, cache);
 
diff --git a/fs/cachefiles/key.c b/fs/cachefiles/key.c
index be96f5fc5cac..7f94efc97e23 100644
--- a/fs/cachefiles/key.c
+++ b/fs/cachefiles/key.c
@@ -150,6 +150,6 @@ char *cachefiles_cook_key(const u8 *raw, int keylen, uint8_t type)
 	key[len++] = 0;
 	key[len] = 0;
 
-	_leave(" = %p %d", key, len);
+	_leave(" = %s %d", key, len);
 	return key;
 }
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index 92aa550dae7e..a9aca5ab5970 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -39,18 +39,18 @@ void __cachefiles_printk_object(struct cachefiles_object *object,
 	pr_err("%sops=%u inp=%u exc=%u\n",
 	       prefix, object->fscache.n_ops, object->fscache.n_in_progress,
 	       object->fscache.n_exclusive);
-	pr_err("%sparent=%p\n",
-	       prefix, object->fscache.parent);
+	pr_err("%sparent=%x\n",
+	       prefix, object->fscache.parent ? object->fscache.parent->debug_id : 0);
 
 	spin_lock(&object->fscache.lock);
 	cookie = object->fscache.cookie;
 	if (cookie) {
-		pr_err("%scookie=%p [pr=%p nd=%p fl=%lx]\n",
+		pr_err("%scookie=%x [pr=%x nd=%p fl=%lx]\n",
 		       prefix,
-		       object->fscache.cookie,
-		       object->fscache.cookie->parent,
-		       object->fscache.cookie->netfs_data,
-		       object->fscache.cookie->flags);
+		       cookie->debug_id,
+		       cookie->parent ? cookie->parent->debug_id : 0,
+		       cookie->netfs_data,
+		       cookie->flags);
 		pr_err("%skey=[%u] '", prefix, cookie->key_len);
 		k = (cookie->key_len <= sizeof(cookie->inline_key)) ?
 			cookie->inline_key : cookie->key;
@@ -110,7 +110,7 @@ static void cachefiles_mark_object_buried(struct cachefiles_cache *cache,
 
 	/* found the dentry for  */
 found_dentry:
-	kdebug("preemptive burial: OBJ%x [%s] %p",
+	kdebug("preemptive burial: OBJ%x [%s] %pd",
 	       object->fscache.debug_id,
 	       object->fscache.state->name,
 	       dentry);
@@ -140,7 +140,7 @@ static int cachefiles_mark_object_active(struct cachefiles_cache *cache,
 	struct rb_node **_p, *_parent = NULL;
 	struct dentry *dentry;
 
-	_enter(",%p", object);
+	_enter(",%x", object->fscache.debug_id);
 
 try_again:
 	write_lock(&cache->active_lock);
@@ -298,8 +298,6 @@ static int cachefiles_bury_object(struct cachefiles_cache *cache,
 
 	_enter(",'%pd','%pd'", dir, rep);
 
-	_debug("remove %p from %p", rep, dir);
-
 	/* non-directories can just be unlinked */
 	if (!d_is_dir(rep)) {
 		_debug("unlink stale object");
@@ -446,7 +444,7 @@ int cachefiles_delete_object(struct cachefiles_cache *cache,
 	struct dentry *dir;
 	int ret;
 
-	_enter(",OBJ%x{%p}", object->fscache.debug_id, object->dentry);
+	_enter(",OBJ%x{%pd}", object->fscache.debug_id, object->dentry);
 
 	ASSERT(object->dentry);
 	ASSERT(d_backing_inode(object->dentry));
@@ -499,7 +497,7 @@ int cachefiles_walk_to_object(struct cachefiles_object *parent,
 	const char *name;
 	int ret, nlen;
 
-	_enter("OBJ%x{%p},OBJ%x,%s,",
+	_enter("OBJ%x{%pd},OBJ%x,%s,",
 	       parent->fscache.debug_id, parent->dentry,
 	       object->fscache.debug_id, key);
 
@@ -542,7 +540,7 @@ int cachefiles_walk_to_object(struct cachefiles_object *parent,
 
 	inode = d_backing_inode(next);
 	trace_cachefiles_lookup(object, next, inode);
-	_debug("next -> %p %s", next, inode ? "positive" : "negative");
+	_debug("next -> %pd %s", next, inode ? "positive" : "negative");
 
 	if (!key)
 		object->new = !inode;
@@ -578,8 +576,8 @@ int cachefiles_walk_to_object(struct cachefiles_object *parent,
 			}
 			ASSERT(d_backing_inode(next));
 
-			_debug("mkdir -> %p{%p{ino=%lu}}",
-			       next, d_backing_inode(next), d_backing_inode(next)->i_ino);
+			_debug("mkdir -> %pd{ino=%lu}",
+			       next, d_backing_inode(next)->i_ino);
 
 		} else if (!d_can_lookup(next)) {
 			pr_err("inode %lu is not a directory\n",
@@ -607,8 +605,8 @@ int cachefiles_walk_to_object(struct cachefiles_object *parent,
 
 			ASSERT(d_backing_inode(next));
 
-			_debug("create -> %p{%p{ino=%lu}}",
-			       next, d_backing_inode(next), d_backing_inode(next)->i_ino);
+			_debug("create -> %pd{ino=%lu}",
+			       next, d_backing_inode(next)->i_ino);
 
 		} else if (!d_can_lookup(next) &&
 			   !d_is_reg(next)
@@ -774,7 +772,7 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 		goto lookup_error;
 	}
 
-	_debug("subdir -> %p %s",
+	_debug("subdir -> %pd %s",
 	       subdir, d_backing_inode(subdir) ? "positive" : "negative");
 
 	/* we need to create the subdir if it doesn't exist yet */
@@ -800,10 +798,8 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 		}
 		ASSERT(d_backing_inode(subdir));
 
-		_debug("mkdir -> %p{%p{ino=%lu}}",
-		       subdir,
-		       d_backing_inode(subdir),
-		       d_backing_inode(subdir)->i_ino);
+		_debug("mkdir -> %pd{ino=%lu}",
+		       subdir, d_backing_inode(subdir)->i_ino);
 	}
 
 	inode_unlock(d_inode(dir));
@@ -878,7 +874,7 @@ static struct dentry *cachefiles_check_active(struct cachefiles_cache *cache,
 	if (IS_ERR(victim))
 		goto lookup_error;
 
-	//_debug("victim -> %p %s",
+	//_debug("victim -> %pd %s",
 	//       victim, d_backing_inode(victim) ? "positive" : "negative");
 
 	/* if the object is no longer there then we probably retired the object
@@ -909,7 +905,7 @@ static struct dentry *cachefiles_check_active(struct cachefiles_cache *cache,
 
 	read_unlock(&cache->active_lock);
 
-	//_leave(" = %p", victim);
+	//_leave(" = %pd", victim);
 	return victim;
 
 object_in_use:
@@ -955,7 +951,7 @@ int cachefiles_cull(struct cachefiles_cache *cache, struct dentry *dir,
 	if (IS_ERR(victim))
 		return PTR_ERR(victim);
 
-	_debug("victim -> %p %s",
+	_debug("victim -> %pd %s",
 	       victim, d_backing_inode(victim) ? "positive" : "negative");
 
 	/* okay... the victim is not being used so we can cull it
diff --git a/fs/cachefiles/xattr.c b/fs/cachefiles/xattr.c
index a591b5e09637..9e82de668595 100644
--- a/fs/cachefiles/xattr.c
+++ b/fs/cachefiles/xattr.c
@@ -36,7 +36,7 @@ int cachefiles_check_object_type(struct cachefiles_object *object)
 	else
 		snprintf(type, 3, "%02x", object->fscache.cookie->def->type);
 
-	_enter("%p{%s}", object, type);
+	_enter("%x{%s}", object->fscache.debug_id, type);
 
 	/* attempt to install a type label directly */
 	ret = vfs_setxattr(&init_user_ns, dentry, cachefiles_xattr_cache, type,
@@ -134,7 +134,7 @@ int cachefiles_update_object_xattr(struct cachefiles_object *object,
 	if (!dentry)
 		return -ESTALE;
 
-	_enter("%p,#%d", object, auxdata->len);
+	_enter("%x,#%d", object->fscache.debug_id, auxdata->len);
 
 	/* attempt to install the cache metadata directly */
 	_debug("SET #%u", auxdata->len);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

