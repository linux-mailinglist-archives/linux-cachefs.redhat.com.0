Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F855432064
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 16:52:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634568771;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aFn+zFFuq8WicE/FEG/Hig3/HW/5+m+3KkAD5FyRmXg=;
	b=Vge/teVDW/o4QhgTLissT+2ab3AMTKErmRoFUkMUGQ3zt2YE17YaEYfxa7zaqggBqyy9Od
	s5jwS458PoTCHH12iAstiKGnlnV/nWeR5Q6mLvQzKvViWSZ2PZdbNqUFqSPnryhNI9W7GN
	OHin+z/h0RfMSY0CkkIoE54UVkw+SJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-3jySGl1KMki8V90OjikS8A-1; Mon, 18 Oct 2021 10:52:50 -0400
X-MC-Unique: 3jySGl1KMki8V90OjikS8A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ED1810059DF;
	Mon, 18 Oct 2021 14:52:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F8D45DF35;
	Mon, 18 Oct 2021 14:52:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2AC781806D03;
	Mon, 18 Oct 2021 14:52:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IEql6e027763 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 10:52:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2E0F260CC4; Mon, 18 Oct 2021 14:52:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1A2160BF4;
	Mon, 18 Oct 2021 14:52:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 15:52:39 +0100
Message-ID: <163456875996.2614702.9722290305463927351.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Subject: [Linux-cachefs] [PATCH 08/67] fscache: Remove struct
	fscache_cookie_def
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

Remove the cookie definition structure so that there's no pointers from
that back into the network filesystem.  All of the method pointers that
were in there have been removed anyway.  Any remaining information is
stashed in the cookie.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/cache.c                 |   15 ------------
 fs/afs/cell.c                  |    4 ++-
 fs/afs/inode.c                 |   15 +++++++-----
 fs/afs/internal.h              |    7 -----
 fs/afs/volume.c                |    5 ++--
 fs/cachefiles/interface.c      |    4 ++-
 fs/cachefiles/xattr.c          |    6 ++---
 fs/fscache/cookie.c            |   51 ++++++++++++++++++----------------------
 fs/fscache/fsdef.c             |   17 +------------
 fs/fscache/internal.h          |    5 ++--
 fs/fscache/io.c                |    2 +-
 fs/fscache/netfs.c             |    5 ++--
 fs/fscache/object.c            |    2 +-
 fs/fscache/page.c              |    2 +-
 include/linux/fscache.h        |   37 +++++++++++++++--------------
 include/trace/events/fscache.h |    2 +-
 16 files changed, 73 insertions(+), 106 deletions(-)

diff --git a/fs/afs/cache.c b/fs/afs/cache.c
index 9b2de3014dbf..0ee9ede6fc67 100644
--- a/fs/afs/cache.c
+++ b/fs/afs/cache.c
@@ -12,18 +12,3 @@ struct fscache_netfs afs_cache_netfs = {
 	.name			= "afs",
 	.version		= 2,
 };
-
-struct fscache_cookie_def afs_cell_cache_index_def = {
-	.name		= "AFS.cell",
-	.type		= FSCACHE_COOKIE_TYPE_INDEX,
-};
-
-struct fscache_cookie_def afs_volume_cache_index_def = {
-	.name		= "AFS.volume",
-	.type		= FSCACHE_COOKIE_TYPE_INDEX,
-};
-
-struct fscache_cookie_def afs_vnode_cache_index_def = {
-	.name		= "AFS.vnode",
-	.type		= FSCACHE_COOKIE_TYPE_DATAFILE,
-};
diff --git a/fs/afs/cell.c b/fs/afs/cell.c
index 416f9bd638a5..ebf140317232 100644
--- a/fs/afs/cell.c
+++ b/fs/afs/cell.c
@@ -682,7 +682,9 @@ static int afs_activate_cell(struct afs_net *net, struct afs_cell *cell)
 
 #ifdef CONFIG_AFS_FSCACHE
 	cell->cache = fscache_acquire_cookie(afs_cache_netfs.primary_index,
-					     &afs_cell_cache_index_def,
+					     FSCACHE_COOKIE_TYPE_INDEX,
+					     "AFS.cell",
+					     0,
 					     NULL,
 					     cell->name, strlen(cell->name),
 					     NULL, 0,
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 3b696ac7c05a..f761c9a5067f 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -430,12 +430,15 @@ static void afs_get_inode_cache(struct afs_vnode *vnode)
 	key.vnode_id_ext[1]	= vnode->fid.vnode_hi;
 	aux.data_version	= vnode->status.data_version;
 
-	vnode->cache = fscache_acquire_cookie(vnode->volume->cache,
-					      &afs_vnode_cache_index_def,
-					      NULL,
-					      &key, sizeof(key),
-					      &aux, sizeof(aux),
-					      vnode->status.size, true);
+	vnode->cache = fscache_acquire_cookie(
+		vnode->volume->cache,
+		FSCACHE_COOKIE_TYPE_DATAFILE,
+		"AFS.vnode",
+		vnode->status.type == AFS_FTYPE_FILE ? 0 : FSCACHE_ADV_SINGLE_CHUNK,
+		NULL,
+		&key, sizeof(key),
+		&aux, sizeof(aux),
+		vnode->status.size, true);
 #endif
 }
 
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 0ad97a8fc0d4..bdcc677338fb 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -962,13 +962,6 @@ extern void afs_merge_fs_addr6(struct afs_addr_list *, __be32 *, u16);
  */
 #ifdef CONFIG_AFS_FSCACHE
 extern struct fscache_netfs afs_cache_netfs;
-extern struct fscache_cookie_def afs_cell_cache_index_def;
-extern struct fscache_cookie_def afs_volume_cache_index_def;
-extern struct fscache_cookie_def afs_vnode_cache_index_def;
-#else
-#define afs_cell_cache_index_def	(*(struct fscache_cookie_def *) NULL)
-#define afs_volume_cache_index_def	(*(struct fscache_cookie_def *) NULL)
-#define afs_vnode_cache_index_def	(*(struct fscache_cookie_def *) NULL)
 #endif
 
 /*
diff --git a/fs/afs/volume.c b/fs/afs/volume.c
index 9ca246ab1a86..5eaaa762fbd9 100644
--- a/fs/afs/volume.c
+++ b/fs/afs/volume.c
@@ -272,8 +272,9 @@ void afs_activate_volume(struct afs_volume *volume)
 {
 #ifdef CONFIG_AFS_FSCACHE
 	volume->cache = fscache_acquire_cookie(volume->cell->cache,
-					       &afs_volume_cache_index_def,
-					       NULL,
+					       FSCACHE_COOKIE_TYPE_INDEX,
+					       "AFS.vol",
+					       0, NULL,
 					       &volume->vid, sizeof(volume->vid),
 					       NULL, 0, 0, true);
 #endif
diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 6c48e81deccc..4de22ab53d73 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -41,7 +41,7 @@ static struct fscache_object *cachefiles_alloc_object(
 
 	fscache_object_init(&object->fscache, cookie, &cache->cache);
 
-	object->type = cookie->def->type;
+	object->type = cookie->type;
 
 	/* get hold of the raw key
 	 * - stick the length on the front and leave space on the back for the
@@ -109,7 +109,7 @@ static int cachefiles_lookup_object(struct fscache_object *_object)
 
 	/* polish off by setting the attributes of non-index files */
 	if (ret == 0 &&
-	    object->fscache.cookie->def->type != FSCACHE_COOKIE_TYPE_INDEX)
+	    object->fscache.cookie->type != FSCACHE_COOKIE_TYPE_INDEX)
 		cachefiles_attr_changed(&object->fscache);
 
 	if (ret < 0 && ret != -ETIMEDOUT) {
diff --git a/fs/cachefiles/xattr.c b/fs/cachefiles/xattr.c
index c99952404932..bcc4a2dfe1e8 100644
--- a/fs/cachefiles/xattr.c
+++ b/fs/cachefiles/xattr.c
@@ -39,7 +39,7 @@ int cachefiles_check_object_type(struct cachefiles_object *object)
 	if (!object->fscache.cookie)
 		strcpy(type, "C3");
 	else
-		snprintf(type, 3, "%02x", object->fscache.cookie->def->type);
+		snprintf(type, 3, "%02x", object->fscache.cookie->type);
 
 	_enter("%x{%s}", object->fscache.debug_id, type);
 
@@ -119,7 +119,7 @@ int cachefiles_set_object_xattr(struct cachefiles_object *object,
 	if (!buf)
 		return -ENOMEM;
 
-	buf->type = object->fscache.cookie->def->type;
+	buf->type = object->fscache.cookie->type;
 	if (len > 0)
 		memcpy(buf->data, fscache_get_aux(object->fscache.cookie), len);
 
@@ -158,7 +158,7 @@ int cachefiles_check_auxdata(struct cachefiles_object *object)
 
 	ret = vfs_getxattr(&init_user_ns, dentry, cachefiles_xattr_cache, buf, tlen);
 	if (ret == tlen &&
-	    buf->type == object->fscache.cookie->def->type &&
+	    buf->type == object->fscache.cookie->type &&
 	    memcmp(buf->data, p, len) == 0)
 		ret = 0;
 	else
diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index a772d4b6cacd..63e4a7db5804 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -43,10 +43,9 @@ static void fscache_print_cookie(struct fscache_cookie *cookie, char prefix)
 	       cookie->flags,
 	       atomic_read(&cookie->n_children),
 	       atomic_read(&cookie->n_active));
-	pr_err("%c-cookie d=%p{%s}\n",
+	pr_err("%c-cookie d=%s\n",
 	       prefix,
-	       cookie->def,
-	       cookie->def ? cookie->def->name : "?");
+	       cookie->type_name);
 
 	o = READ_ONCE(cookie->backing_objects.first);
 	if (o) {
@@ -137,7 +136,9 @@ static atomic_t fscache_cookie_debug_id = ATOMIC_INIT(1);
  */
 struct fscache_cookie *fscache_alloc_cookie(
 	struct fscache_cookie *parent,
-	const struct fscache_cookie_def *def,
+	enum fscache_cookie_type type,
+	const char *type_name,
+	u8 advice,
 	struct fscache_cache_tag *preferred_cache,
 	const void *index_key, size_t index_key_len,
 	const void *aux_data, size_t aux_data_len,
@@ -150,8 +151,11 @@ struct fscache_cookie *fscache_alloc_cookie(
 	if (!cookie)
 		return NULL;
 
+	cookie->type = type;
+	cookie->advice = advice;
 	cookie->key_len = index_key_len;
 	cookie->aux_len = aux_data_len;
+	strlcpy(cookie->type_name, type_name, sizeof(cookie->type_name));
 
 	if (fscache_set_key(cookie, index_key, index_key_len) < 0)
 		goto nomem;
@@ -173,13 +177,10 @@ struct fscache_cookie *fscache_alloc_cookie(
 	 */
 	atomic_set(&cookie->n_active, 1);
 
-	cookie->def		= def;
 	cookie->parent		= parent;
-
 	cookie->preferred_cache	= fscache_get_cache_tag(preferred_cache);
 
 	cookie->flags		= (1 << FSCACHE_COOKIE_NO_DATA_YET);
-	cookie->type		= def->type;
 	spin_lock_init(&cookie->lock);
 	INIT_HLIST_HEAD(&cookie->backing_objects);
 
@@ -241,7 +242,6 @@ struct fscache_cookie *fscache_hash_cookie(struct fscache_cookie *candidate)
  * - parent specifies the parent object
  *   - the top level index cookie for each netfs is stored in the fscache_netfs
  *     struct upon registration
- * - def points to the definition
  * - all attached caches will be searched to see if they contain this object
  * - index objects aren't stored on disk until there's a dependent file that
  *   needs storing
@@ -252,7 +252,9 @@ struct fscache_cookie *fscache_hash_cookie(struct fscache_cookie *candidate)
  */
 struct fscache_cookie *__fscache_acquire_cookie(
 	struct fscache_cookie *parent,
-	const struct fscache_cookie_def *def,
+	enum fscache_cookie_type type,
+	const char *type_name,
+	u8 advice,
 	struct fscache_cache_tag *preferred_cache,
 	const void *index_key, size_t index_key_len,
 	const void *aux_data, size_t aux_data_len,
@@ -261,11 +263,8 @@ struct fscache_cookie *__fscache_acquire_cookie(
 {
 	struct fscache_cookie *candidate, *cookie;
 
-	BUG_ON(!def);
-
 	_enter("{%s},{%s},%u",
-	       parent ? (char *) parent->def->name : "<no-parent>",
-	       def->name, enable);
+	       parent ? parent->type_name : "<no-parent>", type_name, enable);
 
 	if (!index_key || !index_key_len || index_key_len > 255 || aux_data_len > 255)
 		return NULL;
@@ -284,12 +283,11 @@ struct fscache_cookie *__fscache_acquire_cookie(
 	}
 
 	/* validate the definition */
-	BUG_ON(!def->name[0]);
-
-	BUG_ON(def->type == FSCACHE_COOKIE_TYPE_INDEX &&
+	BUG_ON(type == FSCACHE_COOKIE_TYPE_INDEX &&
 	       parent->type != FSCACHE_COOKIE_TYPE_INDEX);
 
-	candidate = fscache_alloc_cookie(parent, def, preferred_cache,
+	candidate = fscache_alloc_cookie(parent, type, type_name, advice,
+					 preferred_cache,
 					 index_key, index_key_len,
 					 aux_data, aux_data_len,
 					 object_size);
@@ -483,7 +481,7 @@ static int fscache_alloc_object(struct fscache_cache *cache,
 	struct fscache_object *object;
 	int ret;
 
-	_enter("%s,%x{%s}", cache->tag->name, cookie->debug_id, cookie->def->name);
+	_enter("%s,%x{%s}", cache->tag->name, cookie->debug_id, cookie->type_name);
 
 	spin_lock(&cookie->lock);
 	hlist_for_each_entry(object, &cookie->backing_objects,
@@ -510,7 +508,7 @@ static int fscache_alloc_object(struct fscache_cache *cache,
 	object->debug_id = atomic_inc_return(&fscache_object_debug_id);
 
 	_debug("ALLOC OBJ%x: %s {%lx}",
-	       object->debug_id, cookie->def->name, object->events);
+	       object->debug_id, cookie->type_name, object->events);
 
 	ret = fscache_alloc_object(cache, cookie->parent);
 	if (ret < 0)
@@ -558,7 +556,7 @@ static int fscache_attach_object(struct fscache_cookie *cookie,
 	struct fscache_cache *cache = object->cache;
 	int ret;
 
-	_enter("{%s},{OBJ%x}", cookie->def->name, object->debug_id);
+	_enter("{%s},{OBJ%x}", cookie->type_name, object->debug_id);
 
 	ASSERTCMP(object->cookie, ==, cookie);
 
@@ -618,7 +616,7 @@ void __fscache_invalidate(struct fscache_cookie *cookie)
 {
 	struct fscache_object *object;
 
-	_enter("{%s}", cookie->def->name);
+	_enter("{%s}", cookie->type_name);
 
 	fscache_stat(&fscache_n_invalidates);
 
@@ -683,7 +681,7 @@ void __fscache_update_cookie(struct fscache_cookie *cookie, const void *aux_data
 		return;
 	}
 
-	_enter("{%s}", cookie->def->name);
+	_enter("{%s}", cookie->type_name);
 
 	spin_lock(&cookie->lock);
 
@@ -722,7 +720,7 @@ void __fscache_disable_cookie(struct fscache_cookie *cookie,
 
 	if (atomic_read(&cookie->n_children) != 0) {
 		pr_err("Cookie '%s' still has children\n",
-		       cookie->def->name);
+		       cookie->type_name);
 		BUG();
 	}
 
@@ -801,7 +799,7 @@ void __fscache_relinquish_cookie(struct fscache_cookie *cookie,
 	}
 
 	_enter("%x{%s,%d},%d",
-	       cookie->debug_id, cookie->def->name,
+	       cookie->debug_id, cookie->type_name,
 	       atomic_read(&cookie->n_active), retire);
 
 	trace_fscache_relinquish(cookie, retire);
@@ -812,9 +810,6 @@ void __fscache_relinquish_cookie(struct fscache_cookie *cookie,
 
 	__fscache_disable_cookie(cookie, aux_data, retire);
 
-	/* Clear pointers back to the netfs */
-	cookie->def		= NULL;
-
 	if (cookie->parent) {
 		ASSERTCMP(refcount_read(&cookie->parent->ref), >, 0);
 		ASSERTCMP(atomic_read(&cookie->parent->n_children), >, 0);
@@ -1009,7 +1004,7 @@ static int fscache_cookies_seq_show(struct seq_file *m, void *v)
 		   atomic_read(&cookie->n_active),
 		   type,
 		   cookie->flags,
-		   cookie->def->name);
+		   cookie->type_name);
 
 	keylen = cookie->key_len;
 	auxlen = cookie->aux_len;
diff --git a/fs/fscache/fsdef.c b/fs/fscache/fsdef.c
index 111946ba9ce1..15312f15848b 100644
--- a/fs/fscache/fsdef.c
+++ b/fs/fscache/fsdef.c
@@ -33,29 +33,14 @@
  * cache.  It can create whatever objects it likes in that index, including
  * further indices.
  */
-static struct fscache_cookie_def fscache_fsdef_index_def = {
-	.name		= ".FS-Cache",
-	.type		= FSCACHE_COOKIE_TYPE_INDEX,
-};
-
 struct fscache_cookie fscache_fsdef_index = {
 	.debug_id	= 1,
 	.ref		= REFCOUNT_INIT(1),
 	.n_active	= ATOMIC_INIT(1),
 	.lock		= __SPIN_LOCK_UNLOCKED(fscache_fsdef_index.lock),
 	.backing_objects = HLIST_HEAD_INIT,
-	.def		= &fscache_fsdef_index_def,
+	.type_name	= ".fscach",
 	.flags		= 1 << FSCACHE_COOKIE_ENABLED,
 	.type		= FSCACHE_COOKIE_TYPE_INDEX,
 };
 EXPORT_SYMBOL(fscache_fsdef_index);
-
-/*
- * Definition of an entry in the root index.  Each entry is an index, keyed to
- * a specific netfs and only applicable to a particular version of the index
- * structure used by that netfs.
- */
-struct fscache_cookie_def fscache_fsdef_netfs_def = {
-	.name		= "FSDEF.netfs",
-	.type		= FSCACHE_COOKIE_TYPE_INDEX,
-};
diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index 29f21fbd5b5d..bff83b14398b 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -64,7 +64,9 @@ extern const struct seq_operations fscache_cookies_seq_ops;
 
 extern void fscache_free_cookie(struct fscache_cookie *);
 extern struct fscache_cookie *fscache_alloc_cookie(struct fscache_cookie *,
-						   const struct fscache_cookie_def *,
+						   enum fscache_cookie_type,
+						   const char *,
+						   u8,
 						   struct fscache_cache_tag *,
 						   const void *, size_t,
 						   const void *, size_t,
@@ -86,7 +88,6 @@ static inline void fscache_cookie_see(struct fscache_cookie *cookie,
  * fsdef.c
  */
 extern struct fscache_cookie fscache_fsdef_index;
-extern struct fscache_cookie_def fscache_fsdef_netfs_def;
 
 /*
  * main.c
diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index e633808ba813..41f56a11b1a9 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -51,7 +51,7 @@ int __fscache_begin_operation(struct netfs_cache_resources *cres,
 		return -ENOBUFS;
 	}
 
-	ASSERTCMP(cookie->def->type, !=, FSCACHE_COOKIE_TYPE_INDEX);
+	ASSERTCMP(cookie->type, !=, FSCACHE_COOKIE_TYPE_INDEX);
 
 	if (fscache_wait_for_deferred_lookup(cookie) < 0)
 		return -ERESTARTSYS;
diff --git a/fs/fscache/netfs.c b/fs/fscache/netfs.c
index b8db06804876..8b0f303a7715 100644
--- a/fs/fscache/netfs.c
+++ b/fs/fscache/netfs.c
@@ -21,8 +21,9 @@ int __fscache_register_netfs(struct fscache_netfs *netfs)
 
 	/* allocate a cookie for the primary index */
 	candidate = fscache_alloc_cookie(&fscache_fsdef_index,
-					 &fscache_fsdef_netfs_def,
-					 NULL,
+					 FSCACHE_COOKIE_TYPE_INDEX,
+					 ".netfs",
+					 0, NULL,
 					 netfs->name, strlen(netfs->name),
 					 &netfs->version, sizeof(netfs->version),
 					 0);
diff --git a/fs/fscache/object.c b/fs/fscache/object.c
index cdcf6720d748..1a061df7cdcd 100644
--- a/fs/fscache/object.c
+++ b/fs/fscache/object.c
@@ -469,7 +469,7 @@ static const struct fscache_state *fscache_look_up_object(struct fscache_object
 	}
 
 	_debug("LOOKUP \"%s\" in \"%s\"",
-	       cookie->def->name, object->cache->tag->name);
+	       cookie->type_name, object->cache->tag->name);
 
 	fscache_stat(&fscache_n_object_lookups);
 	fscache_stat(&fscache_n_cop_lookup_object);
diff --git a/fs/fscache/page.c b/fs/fscache/page.c
index 3fd6a2b45fed..2883d661f972 100644
--- a/fs/fscache/page.c
+++ b/fs/fscache/page.c
@@ -50,7 +50,7 @@ int __fscache_attr_changed(struct fscache_cookie *cookie)
 
 	_enter("%p", cookie);
 
-	ASSERTCMP(cookie->def->type, !=, FSCACHE_COOKIE_TYPE_INDEX);
+	ASSERTCMP(cookie->type, !=, FSCACHE_COOKIE_TYPE_INDEX);
 
 	fscache_stat(&fscache_n_attr_changed);
 
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index cedab654dc79..166e0f0a6e44 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -32,25 +32,18 @@
 #define fscache_resources_valid(cres) (false)
 #endif
 
-struct pagevec;
 struct fscache_cache_tag;
 struct fscache_cookie;
 struct fscache_netfs;
 struct netfs_read_request;
 
-/*
- * fscache cookie definition
- */
-struct fscache_cookie_def {
-	/* name of cookie type */
-	char name[16];
-
-	/* cookie type */
-	uint8_t type;
-#define FSCACHE_COOKIE_TYPE_INDEX	0
-#define FSCACHE_COOKIE_TYPE_DATAFILE	1
+enum fscache_cookie_type {
+	FSCACHE_COOKIE_TYPE_INDEX,
+	FSCACHE_COOKIE_TYPE_DATAFILE,
 };
 
+#define FSCACHE_ADV_SINGLE_CHUNK	0x01 /* The object is a single chunk of data */
+
 /*
  * fscache cached network filesystem type
  * - name, version and ops must be filled in before registration
@@ -76,11 +69,11 @@ struct fscache_cookie {
 	unsigned int			debug_id;
 	spinlock_t			lock;
 	struct hlist_head		backing_objects; /* object(s) backing this file/index */
-	const struct fscache_cookie_def	*def;		/* definition */
 	struct fscache_cookie		*parent;	/* parent of this entry */
 	struct fscache_cache_tag	*preferred_cache; /* The preferred cache or NULL */
 	struct hlist_bl_node		hash_link;	/* Link in hash table */
 	struct list_head		proc_link;	/* Link in proc list */
+	char				type_name[8];	/* Cookie type name */
 
 	unsigned long			flags;
 #define FSCACHE_COOKIE_LOOKING_UP	0	/* T if non-index cookie being looked up still */
@@ -94,7 +87,8 @@ struct fscache_cookie {
 #define FSCACHE_COOKIE_ACQUIRED		9	/* T if cookie is in use */
 #define FSCACHE_COOKIE_RELINQUISHING	10	/* T if cookie is being relinquished */
 
-	u8				type;		/* Type of object */
+	enum fscache_cookie_type	type:8;
+	u8				advice;		/* FSCACHE_COOKIE_ADV_* */
 	u8				key_len;	/* Length of index key */
 	u8				aux_len;	/* Length of auxiliary data */
 	u32				key_hash;	/* Hash of parent, type, key, len */
@@ -128,7 +122,9 @@ extern void __fscache_release_cache_tag(struct fscache_cache_tag *);
 
 extern struct fscache_cookie *__fscache_acquire_cookie(
 	struct fscache_cookie *,
-	const struct fscache_cookie_def *,
+	enum fscache_cookie_type,
+	const char *,
+	u8,
 	struct fscache_cache_tag *,
 	const void *, size_t,
 	const void *, size_t,
@@ -225,7 +221,9 @@ void fscache_release_cache_tag(struct fscache_cache_tag *tag)
 /**
  * fscache_acquire_cookie - Acquire a cookie to represent a cache object
  * @parent: The cookie that's to be the parent of this one
- * @def: A description of the cache object, including callback operations
+ * @type: Type of the cookie
+ * @type_name: Name of cookie type (max 7 chars)
+ * @advice: Advice flags (FSCACHE_COOKIE_ADV_*)
  * @preferred_cache: The cache to use (or NULL)
  * @index_key: The index key for this cookie
  * @index_key_len: Size of the index key
@@ -246,7 +244,9 @@ void fscache_release_cache_tag(struct fscache_cache_tag *tag)
 static inline
 struct fscache_cookie *fscache_acquire_cookie(
 	struct fscache_cookie *parent,
-	const struct fscache_cookie_def *def,
+	enum fscache_cookie_type type,
+	const char *type_name,
+	u8 advice,
 	struct fscache_cache_tag *preferred_cache,
 	const void *index_key,
 	size_t index_key_len,
@@ -256,7 +256,8 @@ struct fscache_cookie *fscache_acquire_cookie(
 	bool enable)
 {
 	if (fscache_cookie_valid(parent) && fscache_cookie_enabled(parent))
-		return __fscache_acquire_cookie(parent, def, preferred_cache,
+		return __fscache_acquire_cookie(parent, type, type_name, advice,
+						preferred_cache,
 						index_key, index_key_len,
 						aux_data, aux_data_len,
 						object_size, enable);
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index 446392f5ba83..ccff379db5e0 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -223,7 +223,7 @@ TRACE_EVENT(fscache_acquire,
 		    __entry->p_ref		= refcount_read(&cookie->parent->ref);
 		    __entry->p_n_children	= atomic_read(&cookie->parent->n_children);
 		    __entry->p_flags		= cookie->parent->flags;
-		    memcpy(__entry->name, cookie->def->name, 8);
+		    memcpy(__entry->name, cookie->type_name, 8);
 		    __entry->name[7]		= 0;
 			   ),
 


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

