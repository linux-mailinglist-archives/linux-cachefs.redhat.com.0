Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EC5437D48
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634929375;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/iHFtYmQZZbJlWjUO9Bla7ZyN23ZdaF9iKqbZI3M5j8=;
	b=QM59SH+N/dT7oxWc4fOhZEE9IGOO1Mgp34+Bz7RBQSDXQlKFssAek2+Rd3oAk/PWCWV1HF
	NfeMdITKyJS646/Tp+ncZcSaf2+H1Wc0Z1y2oLfIv6TurCYpznbIGz6rYyb7WQ09J2YOFD
	0RJobORDtzTv3U4fik9I3tLEu0Rpvlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-Jt1T4YgXOfaI4Ey4jZFe4A-1; Fri, 22 Oct 2021 15:02:54 -0400
X-MC-Unique: Jt1T4YgXOfaI4Ey4jZFe4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B53F802B78;
	Fri, 22 Oct 2021 19:02:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DC0D5DF21;
	Fri, 22 Oct 2021 19:02:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B38D1800B9C;
	Fri, 22 Oct 2021 19:02:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJ2oJP012203 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:02:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B392719D9D; Fri, 22 Oct 2021 19:02:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4C1119D9B;
	Fri, 22 Oct 2021 19:02:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Fri, 22 Oct 2021 20:02:43 +0100
Message-ID: <163492936300.1038219.11883870846619314835.stgit@warthog.procyon.org.uk>
In-Reply-To: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Jeff Layton <jlayton@kernel.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH v2 15/53] fscache: Implement functions
	add/remove a cache
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

Implement functions to allow the cache backend to add or remove a cache.

Signed-off-by: David Howells <dhowells@redhat.com>cc: linux-cachefs@redhat.com
---

 fs/fscache/cache.c             |   67 ++++++++++++++++++++++++++++++++++++++++
 include/linux/fscache-cache.h  |   14 ++++++++
 include/trace/events/fscache.h |    6 +++-
 3 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/fs/fscache/cache.c b/fs/fscache/cache.c
index 3cde698c5015..bed491c99834 100644
--- a/fs/fscache/cache.c
+++ b/fs/fscache/cache.c
@@ -171,6 +171,48 @@ void fscache_put_cache(struct fscache_cache *cache,
 }
 EXPORT_SYMBOL(fscache_put_cache);
 
+/**
+ * fscache_add_cache - Declare a cache as being open for business
+ * @cache: The record describing the cache
+ * @ops: Table of cache operations to use
+ * @cache_priv: Private data for the cache record
+ *
+ * Add a cache to the system, making it available for netfs's to use.
+ *
+ * See Documentation/filesystems/caching/backend-api.rst for a complete
+ * description.
+ */
+int fscache_add_cache(struct fscache_cache *cache,
+		      const struct fscache_cache_ops *ops,
+		      void *cache_priv)
+{
+	int n_accesses;
+
+	_enter("{%s,%s}", ops->name, cache->name);
+
+	BUG_ON(fscache_cache_state(cache) != FSCACHE_CACHE_IS_PREPARING);
+
+	/* Get a ref on the cache cookie and keep its n_accesses counter raised
+	 * by 1 to prevent wakeups from transitioning it to 0 until we're
+	 * withdrawing caching services from it.
+	 */
+	n_accesses = atomic_inc_return(&cache->n_accesses);
+	trace_fscache_access_cache(cache->debug_id, refcount_read(&cache->ref),
+				   n_accesses, fscache_access_cache_pin);
+
+	down_write(&fscache_addremove_sem);
+
+	cache->ops = ops;
+	cache->cache_priv = cache_priv;
+	fscache_set_cache_state(cache, FSCACHE_CACHE_IS_ACTIVE);
+
+	up_write(&fscache_addremove_sem);
+	pr_notice("Cache \"%s\" added (type %s)\n", cache->name, ops->name);
+	_leave(" = 0 [%s]", cache->name);
+	return 0;
+}
+EXPORT_SYMBOL(fscache_add_cache);
+
 /*
  * Get an increment on a cache's access counter if the cache is live to prevent
  * it from going away whilst we're accessing it.
@@ -208,6 +250,31 @@ void fscache_end_cache_access(struct fscache_cache *cache, enum fscache_access_t
 		wake_up_var(&cache->n_accesses);
 }
 
+/**
+ * fscache_withdraw_cache - Withdraw a cache from the active service
+ * @cache: The cache cookie
+ *
+ * Begin the process of withdrawing a cache from service.
+ */
+void fscache_withdraw_cache(struct fscache_cache *cache)
+{
+	int n_accesses;
+
+	pr_notice("Withdrawing cache \"%s\" (%u objs)\n",
+		  cache->name, atomic_read(&cache->object_count));
+
+	fscache_set_cache_state(cache, FSCACHE_CACHE_IS_WITHDRAWN);
+
+	/* Allow wakeups on dec-to-0 */
+	n_accesses = atomic_dec_return(&cache->n_accesses);
+	trace_fscache_access_cache(cache->debug_id, refcount_read(&cache->ref),
+				   n_accesses, fscache_access_cache_unpin);
+
+	wait_var_event(&cache->n_accesses,
+		       atomic_read(&cache->n_accesses) == 0);
+}
+EXPORT_SYMBOL(fscache_withdraw_cache);
+
 #ifdef CONFIG_PROC_FS
 static const char fscache_cache_states[NR__FSCACHE_CACHE_STATE] = "-PAEW";
 
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index a10f87421438..d2301ec88ff9 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -17,6 +17,7 @@
 #include <linux/fscache.h>
 
 struct fscache_cache;
+struct fscache_cache_ops;
 enum fscache_cache_trace;
 enum fscache_cookie_trace;
 enum fscache_access_trace;
@@ -34,6 +35,7 @@ enum fscache_cache_state {
  * Cache cookie.
  */
 struct fscache_cache {
+	const struct fscache_cache_ops *ops;
 	struct list_head	cache_link;	/* Link in cache list */
 	void			*cache_priv;	/* Private cache data (or NULL) */
 	refcount_t		ref;
@@ -45,6 +47,14 @@ struct fscache_cache {
 	char			*name;
 };
 
+/*
+ * cache operations
+ */
+struct fscache_cache_ops {
+	/* name of cache provider */
+	const char *name;
+};
+
 static inline enum fscache_cache_state fscache_cache_state(const struct fscache_cache *cache)
 {
 	return smp_load_acquire(&cache->state);
@@ -74,8 +84,12 @@ static inline bool fscache_set_cache_state_maybe(struct fscache_cache *cache,
  */
 extern struct rw_semaphore fscache_addremove_sem;
 extern struct fscache_cache *fscache_acquire_cache(const char *name);
+extern int fscache_add_cache(struct fscache_cache *cache,
+			     const struct fscache_cache_ops *ops,
+			     void *cache_priv);
 extern void fscache_put_cache(struct fscache_cache *cache,
 			      enum fscache_cache_trace where);
+extern void fscache_withdraw_cache(struct fscache_cache *cache);
 
 extern void fscache_end_volume_access(struct fscache_volume *volume,
 				      enum fscache_access_trace why);
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index 132381921be9..c256f30d4dd4 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -24,7 +24,9 @@ enum fscache_cache_trace {
 	fscache_cache_get_acquire,
 	fscache_cache_new_acquire,
 	fscache_cache_put_alloc_volume,
+	fscache_cache_put_cache,
 	fscache_cache_put_volume,
+	fscache_cache_put_withdraw,
 };
 
 enum fscache_volume_trace {
@@ -76,7 +78,9 @@ enum fscache_access_trace {
 	EM(fscache_cache_get_acquire,		"GET acq  ")		\
 	EM(fscache_cache_new_acquire,		"NEW acq  ")		\
 	EM(fscache_cache_put_alloc_volume,	"PUT alvol")		\
-	E_(fscache_cache_put_volume,		"PUT vol  ")
+	EM(fscache_cache_put_cache,		"PUT cache")		\
+	EM(fscache_cache_put_volume,		"PUT vol  ")		\
+	E_(fscache_cache_put_withdraw,		"PUT withd")
 
 #define fscache_volume_traces						\
 	EM(fscache_volume_collision,		"*COLLIDE*")		\


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

