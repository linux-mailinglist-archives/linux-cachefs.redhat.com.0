Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D633C21DBF3
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Jul 2020 18:29:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594657768;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TZ5XPY16fQXEbsGQC6ZXquVYgSics3nh6Enw8QIUoZs=;
	b=XvTR1AdGxgtcawl5JaKNSBi+cINJrTKE2QkV8ZoQi4jt7fHH4hGoeW9u4ainceXZTPVrYZ
	zNysgwlu8giTsYyunDUeTnREAiVCa/7cS343+q7SoaNgySkpJoJtApnTHu2yQ7FirC51/S
	XObiQ8RtfkuoAQew5yB868nkXynDZUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-h8Q5Cv82PQWrz_XtI_vkRA-1; Mon, 13 Jul 2020 12:29:26 -0400
X-MC-Unique: h8Q5Cv82PQWrz_XtI_vkRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 675DA10CE781;
	Mon, 13 Jul 2020 16:29:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55A5C5C1D0;
	Mon, 13 Jul 2020 16:29:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F33194EF4;
	Mon, 13 Jul 2020 16:29:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DGTNcw026339 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 12:29:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1CA9F7620D; Mon, 13 Jul 2020 16:29:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-113.rdu2.redhat.com
	[10.10.112.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44AF976219;
	Mon, 13 Jul 2020 16:29:17 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>
Date: Mon, 13 Jul 2020 17:29:16 +0100
Message-ID: <159465775643.1376105.9458216906255192661.stgit@warthog.procyon.org.uk>
In-Reply-To: <159465766378.1376105.11619976251039287525.stgit@warthog.procyon.org.uk>
References: <159465766378.1376105.11619976251039287525.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 08/14] fscache: Remove store_limit* from
	struct fscache_object
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

Remove the store_limit values from struct fscache_object and store the
object size in the cookie.  The netfs can update this at will, and we don't
want to call back into the netfs to fetch it.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/interface.c     |   10 ++--------
 fs/fscache/cookie.c           |   14 ++++++--------
 fs/fscache/object.c           |    2 --
 include/linux/fscache-cache.h |   22 ----------------------
 include/linux/fscache.h       |    1 +
 5 files changed, 9 insertions(+), 40 deletions(-)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index b7aa5c733cb7..a5d348581bcc 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -359,7 +359,7 @@ static int cachefiles_attr_changed(struct fscache_object *_object)
 	loff_t oi_size;
 	int ret;
 
-	ni_size = _object->store_limit_l;
+	ni_size = _object->cookie->object_size;
 
 	_enter("{OBJ%x},[%llu]",
 	       _object->debug_id, (unsigned long long) ni_size);
@@ -376,8 +376,6 @@ static int cachefiles_attr_changed(struct fscache_object *_object)
 
 	ASSERT(d_is_reg(object->backer));
 
-	fscache_set_store_limit(&object->fscache, ni_size);
-
 	oi_size = i_size_read(d_backing_inode(object->backer));
 	if (oi_size == ni_size)
 		return 0;
@@ -406,7 +404,6 @@ static int cachefiles_attr_changed(struct fscache_object *_object)
 	cachefiles_end_secure(cache, saved_cred);
 
 	if (ret == -EIO) {
-		fscache_set_store_limit(&object->fscache, 0);
 		cachefiles_io_error_obj(object, "Size set failed");
 		ret = -ENOBUFS;
 	}
@@ -431,7 +428,7 @@ static void cachefiles_invalidate_object(struct fscache_operation *op)
 	cache = container_of(object->fscache.cache,
 			     struct cachefiles_cache, cache);
 
-	ni_size = op->object->store_limit_l;
+	ni_size = op->object->cookie->object_size;
 
 	_enter("{OBJ%x},[%llu]",
 	       op->object->debug_id, (unsigned long long)ni_size);
@@ -439,8 +436,6 @@ static void cachefiles_invalidate_object(struct fscache_operation *op)
 	if (object->backer) {
 		ASSERT(d_is_reg(object->backer));
 
-		fscache_set_store_limit(&object->fscache, ni_size);
-
 		path.dentry = object->backer;
 		path.mnt = cache->mnt;
 
@@ -451,7 +446,6 @@ static void cachefiles_invalidate_object(struct fscache_operation *op)
 		cachefiles_end_secure(cache, saved_cred);
 
 		if (ret != 0) {
-			fscache_set_store_limit(&object->fscache, 0);
 			if (ret == -EIO)
 				cachefiles_io_error_obj(object,
 							"Invalidate failed");
diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 32c070c929b9..7811fe935b47 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -22,8 +22,7 @@ static struct hlist_bl_head fscache_cookie_hash[1 << fscache_cookie_hash_shift];
 static LIST_HEAD(fscache_cookies);
 static DEFINE_RWLOCK(fscache_cookies_lock);
 
-static int fscache_acquire_non_index_cookie(struct fscache_cookie *cookie,
-					    loff_t object_size);
+static int fscache_acquire_non_index_cookie(struct fscache_cookie *cookie);
 static int fscache_alloc_object(struct fscache_cache *cache,
 				struct fscache_cookie *cookie);
 static int fscache_attach_object(struct fscache_cookie *cookie,
@@ -167,6 +166,7 @@ struct fscache_cookie *fscache_alloc_cookie(
 	cookie->advice = advice;
 	cookie->key_len = index_key_len;
 	cookie->aux_len = aux_data_len;
+	cookie->object_size = object_size;
 	strlcpy(cookie->type_name, type_name, sizeof(cookie->type_name));
 
 	if (fscache_set_key(cookie, index_key, index_key_len) < 0)
@@ -337,7 +337,7 @@ struct fscache_cookie *__fscache_acquire_cookie(
 		 * - we create indices on disk when we need them as an index
 		 * may exist in multiple caches */
 		if (cookie->type != FSCACHE_COOKIE_TYPE_INDEX) {
-			if (fscache_acquire_non_index_cookie(cookie, object_size) == 0) {
+			if (fscache_acquire_non_index_cookie(cookie) == 0) {
 				set_bit(FSCACHE_COOKIE_ENABLED, &cookie->flags);
 			} else {
 				atomic_dec(&parent->n_children);
@@ -376,6 +376,7 @@ void __fscache_enable_cookie(struct fscache_cookie *cookie,
 	wait_on_bit_lock(&cookie->flags, FSCACHE_COOKIE_ENABLEMENT_LOCK,
 			 TASK_UNINTERRUPTIBLE);
 
+	cookie->object_size = object_size;
 	fscache_update_aux(cookie, aux_data);
 
 	if (test_bit(FSCACHE_COOKIE_ENABLED, &cookie->flags))
@@ -387,7 +388,7 @@ void __fscache_enable_cookie(struct fscache_cookie *cookie,
 		/* Wait for outstanding disablement to complete */
 		__fscache_wait_on_invalidate(cookie);
 
-		if (fscache_acquire_non_index_cookie(cookie, object_size) == 0)
+		if (fscache_acquire_non_index_cookie(cookie) == 0)
 			set_bit(FSCACHE_COOKIE_ENABLED, &cookie->flags);
 	} else {
 		set_bit(FSCACHE_COOKIE_ENABLED, &cookie->flags);
@@ -404,8 +405,7 @@ EXPORT_SYMBOL(__fscache_enable_cookie);
  * - this must make sure the index chain is instantiated and instantiate the
  *   object representation too
  */
-static int fscache_acquire_non_index_cookie(struct fscache_cookie *cookie,
-					    loff_t object_size)
+static int fscache_acquire_non_index_cookie(struct fscache_cookie *cookie)
 {
 	struct fscache_object *object;
 	struct fscache_cache *cache;
@@ -456,8 +456,6 @@ static int fscache_acquire_non_index_cookie(struct fscache_cookie *cookie,
 	object = hlist_entry(cookie->backing_objects.first,
 			     struct fscache_object, cookie_link);
 
-	fscache_set_store_limit(object, object_size);
-
 	/* initiate the process of looking up all the objects in the chain
 	 * (done by fscache_initialise_object()) */
 	fscache_raise_event(object, FSCACHE_OBJECT_EV_NEW_CHILD);
diff --git a/fs/fscache/object.c b/fs/fscache/object.c
index bb551e29454d..e2e04ac2c0a1 100644
--- a/fs/fscache/object.c
+++ b/fs/fscache/object.c
@@ -319,8 +319,6 @@ void fscache_object_init(struct fscache_object *object,
 	object->n_children = 0;
 	object->n_ops = object->n_in_progress = object->n_exclusive = 0;
 	object->events = 0;
-	object->store_limit = 0;
-	object->store_limit_l = 0;
 	object->cache = cache;
 	object->cookie = cookie;
 	fscache_cookie_get(cookie, fscache_cookie_get_attach_object);
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index 0b395bcb4b16..fd07843e3d69 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -274,8 +274,6 @@ struct fscache_object {
 #ifdef CONFIG_FSCACHE_OBJECT_LIST
 	struct rb_node		objlist_link;	/* link in global object list */
 #endif
-	pgoff_t			store_limit;	/* current storage limit */
-	loff_t			store_limit_l;	/* current storage limit */
 };
 
 extern void fscache_object_init(struct fscache_object *, struct fscache_cookie *,
@@ -336,26 +334,6 @@ static inline void fscache_object_lookup_error(struct fscache_object *object)
 	set_bit(FSCACHE_OBJECT_EV_ERROR, &object->events);
 }
 
-/**
- * fscache_set_store_limit - Set the maximum size to be stored in an object
- * @object: The object to set the maximum on
- * @i_size: The limit to set in bytes
- *
- * Set the maximum size an object is permitted to reach, implying the highest
- * byte that may be written.  Intended to be called by the attr_changed() op.
- *
- * See Documentation/filesystems/caching/backend-api.rst for a complete
- * description.
- */
-static inline
-void fscache_set_store_limit(struct fscache_object *object, loff_t i_size)
-{
-	object->store_limit_l = i_size;
-	object->store_limit = i_size >> PAGE_SHIFT;
-	if (i_size & ~PAGE_MASK)
-		object->store_limit++;
-}
-
 static inline void __fscache_use_cookie(struct fscache_cookie *cookie)
 {
 	atomic_inc(&cookie->n_active);
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index a930532a39d0..f855f6d04667 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -83,6 +83,7 @@ struct fscache_cookie {
 	struct hlist_bl_node		hash_link;	/* Link in hash table */
 	struct list_head		proc_link;	/* Link in proc list */
 	char				type_name[8];	/* Cookie type name */
+	loff_t				object_size;	/* Size of the netfs object */
 
 	unsigned long			flags;
 #define FSCACHE_COOKIE_LOOKING_UP	0	/* T if non-index cookie being looked up still */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

