Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4F647781F
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Dec 2021 17:18:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639671501;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IfUcBapC0VQBdtR/MDFz3c11flu9YPYnf0syes1Galo=;
	b=VtyBWBhr6cDekuTqArL2CraKr/PT6p7dQkn0TH5PT/0NWvdTqGCPnjTFtTnGcOw1F+3i2K
	jEEDSu0ckCAbi4P6K3zNflIVbeQc+bbf/n+hOENNKNi+XjUhx0rhSVQURIFRtpDmzeTsJa
	KhXnXUVHUqxIQFBofhIBTU4Uw8QAua8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-DCObk7rVONuO9kbCXDPWnA-1; Thu, 16 Dec 2021 11:18:18 -0500
X-MC-Unique: DCObk7rVONuO9kbCXDPWnA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9826981CCB7;
	Thu, 16 Dec 2021 16:18:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88C6157CD2;
	Thu, 16 Dec 2021 16:18:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76C4A1806D2B;
	Thu, 16 Dec 2021 16:18:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BGGIDsr007806 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 16 Dec 2021 11:18:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 095535BD02; Thu, 16 Dec 2021 16:18:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73E8257CD2;
	Thu, 16 Dec 2021 16:18:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 16 Dec 2021 16:18:08 +0000
Message-ID: <163967148857.1823006.6332962598220464364.stgit@warthog.procyon.org.uk>
In-Reply-To: <163967073889.1823006.12237147297060239168.stgit@warthog.procyon.org.uk>
References: <163967073889.1823006.12237147297060239168.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH v3 43/68] cachefiles: Implement object
	lifecycle funcs
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

Implement allocate, get, see and put functions for the cachefiles_object
struct.  The members of the struct we're going to need are also added.

Additionally, implement a lifecycle tracepoint.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819639457.215744.4600093239395728232.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/163906939569.143852.3594314410666551982.stgit@warthog.procyon.org.uk/ # v2
---

 fs/cachefiles/interface.c         |   86 +++++++++++++++++++++++++++++++++++++
 fs/cachefiles/internal.h          |   35 ++++++++++++++-
 fs/cachefiles/main.c              |   16 +++++++
 include/trace/events/cachefiles.h |   58 +++++++++++++++++++++++++
 include/trace/events/fscache.h    |    4 ++
 5 files changed, 197 insertions(+), 2 deletions(-)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 1793e46bd3e7..68bb7b6c4945 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -13,6 +13,92 @@
 #include <trace/events/fscache.h>
 #include "internal.h"
 
+static atomic_t cachefiles_object_debug_id;
+
+/*
+ * Allocate a cache object record.
+ */
+static
+struct cachefiles_object *cachefiles_alloc_object(struct fscache_cookie *cookie)
+{
+	struct fscache_volume *vcookie = cookie->volume;
+	struct cachefiles_volume *volume = vcookie->cache_priv;
+	struct cachefiles_object *object;
+
+	_enter("{%s},%x,", vcookie->key, cookie->debug_id);
+
+	object = kmem_cache_zalloc(cachefiles_object_jar, GFP_KERNEL);
+	if (!object)
+		return NULL;
+
+	refcount_set(&object->ref, 1);
+
+	spin_lock_init(&object->lock);
+	INIT_LIST_HEAD(&object->cache_link);
+	object->volume = volume;
+	object->debug_id = atomic_inc_return(&cachefiles_object_debug_id);
+	object->cookie = fscache_get_cookie(cookie, fscache_cookie_get_attach_object);
+
+	fscache_count_object(vcookie->cache);
+	trace_cachefiles_ref(object->debug_id, cookie->debug_id, 1,
+			     cachefiles_obj_new);
+	return object;
+}
+
+/*
+ * Note that an object has been seen.
+ */
+void cachefiles_see_object(struct cachefiles_object *object,
+			   enum cachefiles_obj_ref_trace why)
+{
+	trace_cachefiles_ref(object->debug_id, object->cookie->debug_id,
+			     refcount_read(&object->ref), why);
+}
+
+/*
+ * Increment the usage count on an object;
+ */
+struct cachefiles_object *cachefiles_grab_object(struct cachefiles_object *object,
+						 enum cachefiles_obj_ref_trace why)
+{
+	int r;
+
+	__refcount_inc(&object->ref, &r);
+	trace_cachefiles_ref(object->debug_id, object->cookie->debug_id, r, why);
+	return object;
+}
+
+/*
+ * dispose of a reference to an object
+ */
+void cachefiles_put_object(struct cachefiles_object *object,
+			   enum cachefiles_obj_ref_trace why)
+{
+	unsigned int object_debug_id = object->debug_id;
+	unsigned int cookie_debug_id = object->cookie->debug_id;
+	struct fscache_cache *cache;
+	bool done;
+	int r;
+
+	done = __refcount_dec_and_test(&object->ref, &r);
+	trace_cachefiles_ref(object_debug_id, cookie_debug_id, r, why);
+	if (done) {
+		_debug("- kill object OBJ%x", object_debug_id);
+
+		ASSERTCMP(object->file, ==, NULL);
+
+		kfree(object->d_name);
+
+		cache = object->volume->cache->cache;
+		fscache_put_cookie(object->cookie, fscache_cookie_put_object);
+		object->cookie = NULL;
+		kmem_cache_free(cachefiles_object_jar, object);
+		fscache_uncount_object(cache);
+	}
+
+	_leave("");
+}
+
 const struct fscache_cache_ops cachefiles_cache_ops = {
 	.name			= "cachefiles",
 	.acquire_volume		= cachefiles_acquire_volume,
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index ab0e9307be7b..8763ee4a0df2 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -19,6 +19,16 @@
 struct cachefiles_cache;
 struct cachefiles_object;
 
+enum cachefiles_content {
+	/* These values are saved on disk */
+	CACHEFILES_CONTENT_NO_DATA	= 0, /* No content stored */
+	CACHEFILES_CONTENT_SINGLE	= 1, /* Content is monolithic, all is present */
+	CACHEFILES_CONTENT_ALL		= 2, /* Content is all present, no map */
+	CACHEFILES_CONTENT_BACKFS_MAP	= 3, /* Content is piecemeal, mapped through backing fs */
+	CACHEFILES_CONTENT_DIRTY	= 4, /* Content is dirty (only seen on disk) */
+	nr__cachefiles_content
+};
+
 /*
  * Cached volume representation.
  */
@@ -31,10 +41,20 @@ struct cachefiles_volume {
 };
 
 /*
- * Data file records.
+ * Backing file state.
  */
 struct cachefiles_object {
-	int				debug_id;	/* debugging ID */
+	struct fscache_cookie		*cookie;	/* Netfs data storage object cookie */
+	struct cachefiles_volume	*volume;	/* Cache volume that holds this object */
+	struct list_head		cache_link;	/* Link in cache->*_list */
+	struct file			*file;		/* The file representing this object */
+	char				*d_name;	/* Backing file name */
+	int				debug_id;
+	spinlock_t			lock;
+	refcount_t			ref;
+	u8				d_name_len;	/* Length of filename */
+	enum cachefiles_content		content_info:8;	/* Info about content presence */
+	unsigned long			flags;
 };
 
 /*
@@ -146,6 +166,17 @@ static inline int cachefiles_inject_remove_error(void)
  * interface.c
  */
 extern const struct fscache_cache_ops cachefiles_cache_ops;
+extern void cachefiles_see_object(struct cachefiles_object *object,
+				  enum cachefiles_obj_ref_trace why);
+extern struct cachefiles_object *cachefiles_grab_object(struct cachefiles_object *object,
+							enum cachefiles_obj_ref_trace why);
+extern void cachefiles_put_object(struct cachefiles_object *object,
+				  enum cachefiles_obj_ref_trace why);
+
+/*
+ * main.c
+ */
+extern struct kmem_cache *cachefiles_object_jar;
 
 /*
  * namei.c
diff --git a/fs/cachefiles/main.c b/fs/cachefiles/main.c
index 533e3067d80f..3f369c6f816d 100644
--- a/fs/cachefiles/main.c
+++ b/fs/cachefiles/main.c
@@ -31,6 +31,8 @@ MODULE_DESCRIPTION("Mounted-filesystem based cache");
 MODULE_AUTHOR("Red Hat, Inc.");
 MODULE_LICENSE("GPL");
 
+struct kmem_cache *cachefiles_object_jar;
+
 static struct miscdevice cachefiles_dev = {
 	.minor	= MISC_DYNAMIC_MINOR,
 	.name	= "cachefiles",
@@ -51,9 +53,22 @@ static int __init cachefiles_init(void)
 	if (ret < 0)
 		goto error_dev;
 
+	/* create an object jar */
+	ret = -ENOMEM;
+	cachefiles_object_jar =
+		kmem_cache_create("cachefiles_object_jar",
+				  sizeof(struct cachefiles_object),
+				  0, SLAB_HWCACHE_ALIGN, NULL);
+	if (!cachefiles_object_jar) {
+		pr_notice("Failed to allocate an object jar\n");
+		goto error_object_jar;
+	}
+
 	pr_info("Loaded\n");
 	return 0;
 
+error_object_jar:
+	misc_deregister(&cachefiles_dev);
 error_dev:
 	cachefiles_unregister_error_injection();
 error_einj:
@@ -70,6 +85,7 @@ static void __exit cachefiles_exit(void)
 {
 	pr_info("Unloading\n");
 
+	kmem_cache_destroy(cachefiles_object_jar);
 	misc_deregister(&cachefiles_dev);
 	cachefiles_unregister_error_injection();
 }
diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index 5975ea4977b2..54815cc776ba 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -18,6 +18,21 @@
 #ifndef __CACHEFILES_DECLARE_TRACE_ENUMS_ONCE_ONLY
 #define __CACHEFILES_DECLARE_TRACE_ENUMS_ONCE_ONLY
 
+enum cachefiles_obj_ref_trace {
+	cachefiles_obj_get_ioreq,
+	cachefiles_obj_new,
+	cachefiles_obj_put_alloc_fail,
+	cachefiles_obj_put_detach,
+	cachefiles_obj_put_ioreq,
+	cachefiles_obj_see_clean_commit,
+	cachefiles_obj_see_clean_delete,
+	cachefiles_obj_see_clean_drop_tmp,
+	cachefiles_obj_see_lookup_cookie,
+	cachefiles_obj_see_lookup_failed,
+	cachefiles_obj_see_withdraw_cookie,
+	cachefiles_obj_see_withdrawal,
+};
+
 enum fscache_why_object_killed {
 	FSCACHE_OBJECT_IS_STALE,
 	FSCACHE_OBJECT_IS_WEIRD,
@@ -66,6 +81,20 @@ enum cachefiles_error_trace {
 	EM(FSCACHE_OBJECT_WAS_RETIRED,	"was_retired")		\
 	E_(FSCACHE_OBJECT_WAS_CULLED,	"was_culled")
 
+#define cachefiles_obj_ref_traces					\
+	EM(cachefiles_obj_get_ioreq,		"GET ioreq")		\
+	EM(cachefiles_obj_new,			"NEW obj")		\
+	EM(cachefiles_obj_put_alloc_fail,	"PUT alloc_fail")	\
+	EM(cachefiles_obj_put_detach,		"PUT detach")		\
+	EM(cachefiles_obj_put_ioreq,		"PUT ioreq")		\
+	EM(cachefiles_obj_see_clean_commit,	"SEE clean_commit")	\
+	EM(cachefiles_obj_see_clean_delete,	"SEE clean_delete")	\
+	EM(cachefiles_obj_see_clean_drop_tmp,	"SEE clean_drop_tmp")	\
+	EM(cachefiles_obj_see_lookup_cookie,	"SEE lookup_cookie")	\
+	EM(cachefiles_obj_see_lookup_failed,	"SEE lookup_failed")	\
+	EM(cachefiles_obj_see_withdraw_cookie,	"SEE withdraw_cookie")	\
+	E_(cachefiles_obj_see_withdrawal,	"SEE withdrawal")
+
 #define cachefiles_trunc_traces						\
 	EM(cachefiles_trunc_dio_adjust,		"DIOADJ")		\
 	EM(cachefiles_trunc_expand_tmpfile,	"EXPTMP")		\
@@ -100,6 +129,7 @@ enum cachefiles_error_trace {
 #define E_(a, b) TRACE_DEFINE_ENUM(a);
 
 cachefiles_obj_kill_traces;
+cachefiles_obj_ref_traces;
 cachefiles_trunc_traces;
 cachefiles_error_traces;
 
@@ -113,6 +143,34 @@ cachefiles_error_traces;
 #define E_(a, b)	{ a, b }
 
 
+TRACE_EVENT(cachefiles_ref,
+	    TP_PROTO(unsigned int object_debug_id,
+		     unsigned int cookie_debug_id,
+		     int usage,
+		     enum cachefiles_obj_ref_trace why),
+
+	    TP_ARGS(object_debug_id, cookie_debug_id, usage, why),
+
+	    /* Note that obj may be NULL */
+	    TP_STRUCT__entry(
+		    __field(unsigned int,			obj		)
+		    __field(unsigned int,			cookie		)
+		    __field(enum cachefiles_obj_ref_trace,	why		)
+		    __field(int,				usage		)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= object_debug_id;
+		    __entry->cookie	= cookie_debug_id;
+		    __entry->usage	= usage;
+		    __entry->why	= why;
+			   ),
+
+	    TP_printk("c=%08x o=%08x u=%d %s",
+		      __entry->cookie, __entry->obj, __entry->usage,
+		      __print_symbolic(__entry->why, cachefiles_obj_ref_traces))
+	    );
+
 TRACE_EVENT(cachefiles_lookup,
 	    TP_PROTO(struct cachefiles_object *obj,
 		     struct dentry *de),
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index 5fa37a8b4ec7..d9d830296ec3 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -49,6 +49,7 @@ enum fscache_volume_trace {
 enum fscache_cookie_trace {
 	fscache_cookie_collision,
 	fscache_cookie_discard,
+	fscache_cookie_get_attach_object,
 	fscache_cookie_get_end_access,
 	fscache_cookie_get_hash_collision,
 	fscache_cookie_get_inval_work,
@@ -57,6 +58,7 @@ enum fscache_cookie_trace {
 	fscache_cookie_new_acquire,
 	fscache_cookie_put_hash_collision,
 	fscache_cookie_put_lru,
+	fscache_cookie_put_object,
 	fscache_cookie_put_over_queued,
 	fscache_cookie_put_relinquish,
 	fscache_cookie_put_withdrawn,
@@ -122,6 +124,7 @@ enum fscache_access_trace {
 #define fscache_cookie_traces						\
 	EM(fscache_cookie_collision,		"*COLLIDE*")		\
 	EM(fscache_cookie_discard,		"DISCARD  ")		\
+	EM(fscache_cookie_get_attach_object,	"GET attch")		\
 	EM(fscache_cookie_get_hash_collision,	"GET hcoll")		\
 	EM(fscache_cookie_get_end_access,	"GQ  endac")		\
 	EM(fscache_cookie_get_inval_work,	"GQ  inval")		\
@@ -130,6 +133,7 @@ enum fscache_access_trace {
 	EM(fscache_cookie_new_acquire,		"NEW acq  ")		\
 	EM(fscache_cookie_put_hash_collision,	"PUT hcoll")		\
 	EM(fscache_cookie_put_lru,		"PUT lru  ")		\
+	EM(fscache_cookie_put_object,		"PUT obj  ")		\
 	EM(fscache_cookie_put_over_queued,	"PQ  overq")		\
 	EM(fscache_cookie_put_relinquish,	"PUT relnq")		\
 	EM(fscache_cookie_put_withdrawn,	"PUT wthdn")		\


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

