Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFD043207E
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 16:54:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634568853;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4pAbsDXojxbUqbi2iDs3RMb3IkiEzBY8kPRWqTriqI0=;
	b=h6XLqkD+54AdqDBRZ6tpwcXUs6HOVZNImAqP0l8vLbbaXJ1dnZgdopiyjXgjrUAuO432pc
	zUPSS62MGc6xcp56NlOqeexhUqGAX2f6zBheAi+HzvJDQOB7mNp9SItU1JYe+XUKwSph6R
	V2Z66/Xlbvs0QxhMu4RjuQbDJWtLNFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-Xx4Hp-ujMlStJV9-6luX2Q-1; Mon, 18 Oct 2021 10:54:12 -0400
X-MC-Unique: Xx4Hp-ujMlStJV9-6luX2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E30A80363B;
	Mon, 18 Oct 2021 14:54:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CCE5E2E8;
	Mon, 18 Oct 2021 14:54:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72B514E58E;
	Mon, 18 Oct 2021 14:54:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IEs3mi027886 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 10:54:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 381561037F3C; Mon, 18 Oct 2021 14:54:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 38867100EBBF;
	Mon, 18 Oct 2021 14:53:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 15:53:42 +0100
Message-ID: <163456882235.2614702.16403136063544166351.stgit@warthog.procyon.org.uk>
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
Subject: [Linux-cachefs] [PATCH 11/67] fscache: Remove fscache_attr_changed()
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

Remove fscache_attr_changed() as it's unused.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/interface.c     |   13 ++----
 fs/fscache/page.c             |   84 -----------------------------------------
 include/linux/fscache-cache.h |    4 --
 include/linux/fscache.h       |   21 ----------
 4 files changed, 5 insertions(+), 117 deletions(-)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 460dd190dad5..4a813a490ffe 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -10,7 +10,7 @@
 #include <linux/xattr.h>
 #include "internal.h"
 
-static int cachefiles_attr_changed(struct fscache_object *_object);
+static int cachefiles_attr_changed(struct cachefiles_object *object);
 
 /*
  * allocate an object record for a cookie lookup and prepare the lookup data
@@ -110,7 +110,7 @@ static int cachefiles_lookup_object(struct fscache_object *_object)
 	/* polish off by setting the attributes of non-index files */
 	if (ret == 0 &&
 	    object->fscache.cookie->type != FSCACHE_COOKIE_TYPE_INDEX)
-		cachefiles_attr_changed(&object->fscache);
+		cachefiles_attr_changed(object);
 
 	if (ret < 0 && ret != -ETIMEDOUT) {
 		if (ret != -ENOBUFS)
@@ -324,9 +324,8 @@ static void cachefiles_sync_cache(struct fscache_cache *_cache)
  * notification the attributes on an object have changed
  * - called with reads/writes excluded by FS-Cache
  */
-static int cachefiles_attr_changed(struct fscache_object *_object)
+static int cachefiles_attr_changed(struct cachefiles_object *object)
 {
-	struct cachefiles_object *object;
 	struct cachefiles_cache *cache;
 	const struct cred *saved_cred;
 	struct iattr newattrs;
@@ -334,12 +333,11 @@ static int cachefiles_attr_changed(struct fscache_object *_object)
 	loff_t oi_size;
 	int ret;
 
-	ni_size = _object->cookie->object_size;
+	ni_size = object->fscache.cookie->object_size;
 
 	_enter("{OBJ%x},[%llu]",
-	       _object->debug_id, (unsigned long long) ni_size);
+	       object->fscache.debug_id, (unsigned long long) ni_size);
 
-	object = container_of(_object, struct cachefiles_object, fscache);
 	cache = container_of(object->fscache.cache,
 			     struct cachefiles_cache, cache);
 
@@ -442,6 +440,5 @@ const struct fscache_cache_ops cachefiles_cache_ops = {
 	.drop_object		= cachefiles_drop_object,
 	.put_object		= cachefiles_put_object,
 	.sync_cache		= cachefiles_sync_cache,
-	.attr_changed		= cachefiles_attr_changed,
 	.begin_operation	= cachefiles_begin_operation,
 };
diff --git a/fs/fscache/page.c b/fs/fscache/page.c
index 2883d661f972..1d86c8a2a8c4 100644
--- a/fs/fscache/page.c
+++ b/fs/fscache/page.c
@@ -13,90 +13,6 @@
 #include <linux/slab.h>
 #include "internal.h"
 
-/*
- * actually apply the changed attributes to a cache object
- */
-static void fscache_attr_changed_op(struct fscache_operation *op)
-{
-	struct fscache_object *object = op->object;
-	int ret;
-
-	_enter("{OBJ%x OP%x}", object->debug_id, op->debug_id);
-
-	fscache_stat(&fscache_n_attr_changed_calls);
-
-	if (fscache_object_is_active(object)) {
-		fscache_stat(&fscache_n_cop_attr_changed);
-		ret = object->cache->ops->attr_changed(object);
-		fscache_stat_d(&fscache_n_cop_attr_changed);
-		if (ret < 0)
-			fscache_abort_object(object);
-		fscache_op_complete(op, ret < 0);
-	} else {
-		fscache_op_complete(op, true);
-	}
-
-	_leave("");
-}
-
-/*
- * notification that the attributes on an object have changed
- */
-int __fscache_attr_changed(struct fscache_cookie *cookie)
-{
-	struct fscache_operation *op;
-	struct fscache_object *object;
-	bool wake_cookie = false;
-
-	_enter("%p", cookie);
-
-	ASSERTCMP(cookie->type, !=, FSCACHE_COOKIE_TYPE_INDEX);
-
-	fscache_stat(&fscache_n_attr_changed);
-
-	op = kzalloc(sizeof(*op), GFP_KERNEL);
-	if (!op) {
-		fscache_stat(&fscache_n_attr_changed_nomem);
-		_leave(" = -ENOMEM");
-		return -ENOMEM;
-	}
-
-	fscache_operation_init(cookie, op, fscache_attr_changed_op, NULL, NULL);
-	trace_fscache_page_op(cookie, NULL, op, fscache_page_op_attr_changed);
-	op->flags = FSCACHE_OP_ASYNC |
-		(1 << FSCACHE_OP_EXCLUSIVE) |
-		(1 << FSCACHE_OP_UNUSE_COOKIE);
-
-	spin_lock(&cookie->lock);
-
-	if (!fscache_cookie_enabled(cookie) ||
-	    hlist_empty(&cookie->backing_objects))
-		goto nobufs;
-	object = hlist_entry(cookie->backing_objects.first,
-			     struct fscache_object, cookie_link);
-
-	__fscache_use_cookie(cookie);
-	if (fscache_submit_exclusive_op(object, op) < 0)
-		goto nobufs_dec;
-	spin_unlock(&cookie->lock);
-	fscache_stat(&fscache_n_attr_changed_ok);
-	fscache_put_operation(op);
-	_leave(" = 0");
-	return 0;
-
-nobufs_dec:
-	wake_cookie = __fscache_unuse_cookie(cookie);
-nobufs:
-	spin_unlock(&cookie->lock);
-	fscache_put_operation(op);
-	if (wake_cookie)
-		__fscache_wake_unused_cookie(cookie);
-	fscache_stat(&fscache_n_attr_changed_nobufs);
-	_leave(" = %d", -ENOBUFS);
-	return -ENOBUFS;
-}
-EXPORT_SYMBOL(__fscache_attr_changed);
-
 /*
  * wait for a deferred lookup to complete
  */
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index 15683b7876ff..d0c6c09bb5a1 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -184,10 +184,6 @@ struct fscache_cache_ops {
 	/* sync a cache */
 	void (*sync_cache)(struct fscache_cache *cache);
 
-	/* notification that the attributes of a non-index object (such as
-	 * i_size) have changed */
-	int (*attr_changed)(struct fscache_object *object);
-
 	/* reserve space for an object's data and associated metadata */
 	int (*reserve_space)(struct fscache_object *object, loff_t i_size);
 
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 75ca4fda93d5..1dba014e848f 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -132,7 +132,6 @@ extern struct fscache_cookie *__fscache_acquire_cookie(
 	loff_t, bool);
 extern void __fscache_relinquish_cookie(struct fscache_cookie *, const void *, bool);
 extern void __fscache_update_cookie(struct fscache_cookie *, const void *);
-extern int __fscache_attr_changed(struct fscache_cookie *);
 extern void __fscache_invalidate(struct fscache_cookie *);
 extern void __fscache_wait_on_invalidate(struct fscache_cookie *);
 #ifdef FSCACHE_USE_NEW_IO_API
@@ -337,26 +336,6 @@ void fscache_unpin_cookie(struct fscache_cookie *cookie)
 {
 }
 
-/**
- * fscache_attr_changed - Notify cache that an object's attributes changed
- * @cookie: The cookie representing the cache object
- *
- * Send a notification to the cache indicating that an object's attributes have
- * changed.  This includes the data size.  These attributes will be obtained
- * through the get_attr() cookie definition op.
- *
- * See Documentation/filesystems/caching/netfs-api.rst for a complete
- * description.
- */
-static inline
-int fscache_attr_changed(struct fscache_cookie *cookie)
-{
-	if (fscache_cookie_valid(cookie) && fscache_cookie_enabled(cookie))
-		return __fscache_attr_changed(cookie);
-	else
-		return -ENOBUFS;
-}
-
 /**
  * fscache_invalidate - Notify cache that an object needs invalidation
  * @cookie: The cookie representing the cache object


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

