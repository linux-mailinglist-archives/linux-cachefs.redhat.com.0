Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ACE43216E
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 17:02:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569324;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=26jBwXX4QXDN8J+sH9IUV6v1ijvxBK1mqQuCja5oRDM=;
	b=dEuhBTSdenNNFVeBI0oSHiPp9c6Ny2D4S2TIAzpQ9TPmVw6eO5d8HBz16XbxwPbXMMdJ9H
	czcH95jFf3leII6CYIc2EvA9W76emPdQ1YKikS2thK533Ik9aXvp1bzxjBEGcEv0lv9C18
	hiWWrwxZXdtwb5z3OQGbh2xastc1ZqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-zVQ6p0BeODCe0v73wI2WmA-1; Mon, 18 Oct 2021 11:02:01 -0400
X-MC-Unique: zVQ6p0BeODCe0v73wI2WmA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E646BAF92;
	Mon, 18 Oct 2021 15:01:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0ADC69CBD;
	Mon, 18 Oct 2021 15:01:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6A5A4EA2A;
	Mon, 18 Oct 2021 15:01:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IF1uFg029388 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 11:01:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8FADB5FC23; Mon, 18 Oct 2021 15:01:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A7465C1D0;
	Mon, 18 Oct 2021 15:01:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 16:01:52 +0100
Message-ID: <163456931245.2614702.16508050783449263388.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Subject: [Linux-cachefs] [PATCH 46/67] fscache: Provide resize operation
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

Provide a cache operation to resize an object.  This is intended to be run
synchronously rather than being deferred as it really needs to run inside
the inode lock on the netfs inode from ->setattr() to correctly order with
respect to other truncates and writes.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/interface.c      |   93 ++++++++++++++++++++++++----------------
 fs/fscache/io.c                |   25 +++++++++++
 fs/fscache/stats.c             |    6 ++-
 include/linux/fscache-cache.h  |    4 ++
 include/linux/fscache.h        |   18 ++++++++
 include/trace/events/fscache.h |   23 ++++++++++
 6 files changed, 130 insertions(+), 39 deletions(-)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 38ae34b7aaf4..f90f6ddd07a5 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -9,6 +9,7 @@
 #include <linux/mount.h>
 #include <linux/xattr.h>
 #include <linux/file.h>
+#include <linux/falloc.h>
 #include <trace/events/fscache.h>
 #include "internal.h"
 
@@ -134,55 +135,72 @@ struct cachefiles_object *cachefiles_grab_object(struct cachefiles_object *objec
 }
 
 /*
- * update the auxiliary data for an object object on disk
+ * Shorten the backing object to discard any dirty data and free up
+ * any unused granules.
  */
-static void cachefiles_update_object(struct cachefiles_object *object)
+static bool cachefiles_shorten_object(struct cachefiles_object *object,
+				      struct file *file, loff_t new_size)
 {
 	struct cachefiles_cache *cache = object->volume->cache;
-	const struct cred *saved_cred;
-	struct file *file = object->file;
-	loff_t object_size, i_size;
+	struct inode *inode = file_inode(file);
+	loff_t i_size, dio_size;
 	int ret;
 
-	_enter("{OBJ%x}", object->debug_id);
+	dio_size = round_up(new_size, CACHEFILES_DIO_BLOCK_SIZE);
+	i_size = i_size_read(inode);
 
-	cachefiles_begin_secure(cache, &saved_cred);
+	trace_cachefiles_trunc(object, inode, i_size, dio_size,
+			       cachefiles_trunc_shrink);
+	ret = vfs_truncate(&file->f_path, dio_size);
+	if (ret < 0) {
+		cachefiles_io_error_obj(object, "Trunc-to-size failed %d", ret);
+		cachefiles_remove_object_xattr(cache, file->f_path.dentry);
+		return false;
+	}
 
-	object_size = object->cookie->object_size;
-	i_size = i_size_read(file_inode(file));
-	if (i_size > object_size) {
-		_debug("trunc %llx -> %llx", i_size, object_size);
-		trace_cachefiles_trunc(object, file_inode(file),
-				       i_size, object_size,
-				       cachefiles_trunc_shrink);
-		ret = vfs_truncate(&file->f_path, object_size);
+	if (new_size < dio_size) {
+		trace_cachefiles_trunc(object, inode, dio_size, new_size,
+				       cachefiles_trunc_dio_adjust);
+		ret = vfs_fallocate(file, FALLOC_FL_ZERO_RANGE,
+				    new_size, dio_size);
 		if (ret < 0) {
-			cachefiles_io_error_obj(object, "Trunc-to-size failed");
+			cachefiles_io_error_obj(object, "Trunc-to-dio-size failed %d", ret);
 			cachefiles_remove_object_xattr(cache, file->f_path.dentry);
-			goto out;
-		}
-
-		object_size = round_up(object_size, CACHEFILES_DIO_BLOCK_SIZE);
-		i_size = i_size_read(file_inode(file));
-		_debug("trunc %llx -> %llx", i_size, object_size);
-		if (i_size < object_size) {
-			trace_cachefiles_trunc(object, file_inode(file),
-					       i_size, object_size,
-					       cachefiles_trunc_dio_adjust);
-			ret = vfs_truncate(&file->f_path, object_size);
-			if (ret < 0) {
-				cachefiles_io_error_obj(object, "Trunc-to-dio-size failed");
-				cachefiles_remove_object_xattr(cache, file->f_path.dentry);
-				goto out;
-			}
+			return false;
 		}
 	}
 
-	cachefiles_set_object_xattr(object);
+	return true;
+}
 
-out:
-	cachefiles_end_secure(cache, saved_cred);
-	_leave("");
+/*
+ * Resize the backing object.
+ */
+static void cachefiles_resize_cookie(struct netfs_cache_resources *cres,
+				     loff_t new_size)
+{
+	struct cachefiles_object *object = cachefiles_cres_object(cres);
+	struct cachefiles_cache *cache = object->volume->cache;
+	struct fscache_cookie *cookie = object->cookie;
+	const struct cred *saved_cred;
+	struct file *file = cachefiles_cres_file(cres);
+	loff_t old_size = cookie->object_size;
+
+	_enter("%llu->%llu", old_size, new_size);
+
+	if (new_size < old_size) {
+		cachefiles_begin_secure(cache, &saved_cred);
+		cachefiles_shorten_object(object, file, new_size);
+		cachefiles_end_secure(cache, saved_cred);
+		object->cookie->object_size = new_size;
+		return;
+	}
+
+	/* The file is being expanded.  We don't need to do anything
+	 * particularly.  cookie->initial_size doesn't change and so the point
+	 * at which we have to download before doesn't change.
+	 */
+	cookie->object_size = new_size;
 }
 
 /*
@@ -196,7 +214,7 @@ static void cachefiles_commit_object(struct cachefiles_object *object,
 	if (test_and_clear_bit(FSCACHE_COOKIE_NEEDS_UPDATE, &object->cookie->flags))
 		update = true;
 	if (update)
-		cachefiles_update_object(object);
+		cachefiles_set_object_xattr(object);
 
 	if (test_bit(CACHEFILES_OBJECT_USING_TMPFILE, &object->flags))
 		cachefiles_commit_tmpfile(cache, object);
@@ -440,5 +458,6 @@ const struct fscache_cache_ops cachefiles_cache_ops = {
 	.lookup_cookie		= cachefiles_lookup_cookie,
 	.withdraw_cookie	= cachefiles_withdraw_cookie,
 	.invalidate_cookie	= cachefiles_invalidate_cookie,
+	.resize_cookie		= cachefiles_resize_cookie,
 	.begin_operation	= cachefiles_begin_operation,
 };
diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index ad9798f0c850..8b1a865a0847 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -253,3 +253,28 @@ int fscache_set_page_dirty(struct page *page, struct fscache_cookie *cookie)
 	return 1;
 }
 EXPORT_SYMBOL(fscache_set_page_dirty);
+
+/*
+ * Change the size of a backing object.
+ */
+void __fscache_resize_cookie(struct fscache_cookie *cookie, loff_t new_size)
+{
+	struct netfs_cache_resources cres;
+
+	trace_fscache_resize(cookie, new_size);
+	if (fscache_begin_operation(&cres, cookie, FSCACHE_WANT_WRITE,
+				    fscache_access_io_resize) == 0) {
+		fscache_stat(&fscache_n_resizes);
+		set_bit(FSCACHE_COOKIE_NEEDS_UPDATE, &cookie->flags);
+
+		/* We cannot defer a resize as we need to do it inside the
+		 * netfs's inode lock so that we're serialised with respect to
+		 * writes.
+		 */
+		cookie->volume->cache->ops->resize_cookie(&cres, new_size);
+		fscache_end_operation(&cres);
+	} else {
+		fscache_stat(&fscache_n_resizes_null);
+	}
+}
+EXPORT_SYMBOL(__fscache_resize_cookie);
diff --git a/fs/fscache/stats.c b/fs/fscache/stats.c
index 44b3b901e191..b1174d0dac3e 100644
--- a/fs/fscache/stats.c
+++ b/fs/fscache/stats.c
@@ -97,8 +97,10 @@ int fscache_stats_show(struct seq_file *m, void *v)
 	seq_printf(m, "Invals : n=%u\n",
 		   atomic_read(&fscache_n_invalidates));
 
-	seq_printf(m, "Updates: n=%u\n",
-		   atomic_read(&fscache_n_updates));
+	seq_printf(m, "Updates: n=%u rsz=%u rsn=%u\n",
+		   atomic_read(&fscache_n_updates),
+		   atomic_read(&fscache_n_resizes),
+		   atomic_read(&fscache_n_resizes_null));
 
 	seq_printf(m, "Relinqs: n=%u rtr=%u drop=%u\n",
 		   atomic_read(&fscache_n_relinquishes),
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index 22064611d182..2e7265e24df6 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -66,6 +66,10 @@ struct fscache_cache_ops {
 	/* Withdraw an object without any cookie access counts held */
 	void (*withdraw_cookie)(struct fscache_cookie *cookie);
 
+	/* Change the size of a data object */
+	void (*resize_cookie)(struct netfs_cache_resources *cres,
+			      loff_t new_size);
+
 	/* Invalidate an object */
 	bool (*invalidate_cookie)(struct fscache_cookie *cookie);
 
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 08663ad7feed..8148193045cd 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -164,6 +164,7 @@ extern struct fscache_cookie *__fscache_acquire_cookie(
 extern void __fscache_use_cookie(struct fscache_cookie *, bool);
 extern void __fscache_unuse_cookie(struct fscache_cookie *, const void *, const loff_t *);
 extern void __fscache_relinquish_cookie(struct fscache_cookie *, bool);
+extern void __fscache_resize_cookie(struct fscache_cookie *, loff_t);
 extern void __fscache_invalidate(struct fscache_cookie *, const void *, loff_t, unsigned int);
 #ifdef FSCACHE_USE_NEW_IO_API
 extern int __fscache_begin_read_operation(struct netfs_cache_resources *, struct fscache_cookie *);
@@ -361,6 +362,23 @@ void fscache_update_cookie(struct fscache_cookie *cookie, const void *aux_data,
 		__fscache_update_cookie(cookie, aux_data, object_size);
 }
 
+/**
+ * fscache_resize_cookie - Request that a cache object be resized
+ * @cookie: The cookie representing the cache object
+ * @new_size: The new size of the object (may be NULL)
+ *
+ * Request that the size of an object be changed.
+ *
+ * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * description.
+ */
+static inline
+void fscache_resize_cookie(struct fscache_cookie *cookie, loff_t new_size)
+{
+	if (fscache_cookie_enabled(cookie))
+		__fscache_resize_cookie(cookie, new_size);
+}
+
 /**
  * fscache_pin_cookie - Pin a data-storage cache object in its cache
  * @cookie: The cookie representing the cache object
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index adde3bb61f0f..9554b43e6fdf 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -429,6 +429,29 @@ TRACE_EVENT(fscache_invalidate,
 		      __entry->cookie, __entry->new_size)
 	    );
 
+TRACE_EVENT(fscache_resize,
+	    TP_PROTO(struct fscache_cookie *cookie, loff_t new_size),
+
+	    TP_ARGS(cookie, new_size),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,		cookie		)
+		    __field(loff_t,			old_size	)
+		    __field(loff_t,			new_size	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->cookie	= cookie->debug_id;
+		    __entry->old_size	= cookie->object_size;
+		    __entry->new_size	= new_size;
+			   ),
+
+	    TP_printk("c=%08x os=%08llx sz=%08llx",
+		      __entry->cookie,
+		      __entry->old_size,
+		      __entry->new_size)
+	    );
+
 #endif /* _TRACE_FSCACHE_H */
 
 /* This part must be outside protection */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

