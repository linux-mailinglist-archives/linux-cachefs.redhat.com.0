Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CF63D437D9E
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:05:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634929553;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dMKcBqtrwmmqZfLGDHbDrq3vF40yNR1aLGcaNEbWeww=;
	b=XLG4kgcfK+M+q2xjtuJaRnXmB+sGbzuw1k4DQ8tA2oWuSEPlmTogXOEHs6jKG9BOG10BvL
	ooRn+BHrpM9JoVnuaWcjLUTPQqoS7V4m51tf7vOS2dlmO7QByDNmU4Eibk+iMCiWHGJuSv
	DJsS1QZN0vZNshh2i/JU7CJGPuMk9Hw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-ye3HJwO9OzC0k67gXXCA5Q-1; Fri, 22 Oct 2021 15:05:50 -0400
X-MC-Unique: ye3HJwO9OzC0k67gXXCA5Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B535802B4F;
	Fri, 22 Oct 2021 19:05:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C9F35DEFA;
	Fri, 22 Oct 2021 19:05:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6AED41800B9E;
	Fri, 22 Oct 2021 19:05:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJ5kYh012622 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:05:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA2B719723; Fri, 22 Oct 2021 19:05:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F07F19D9B;
	Fri, 22 Oct 2021 19:05:38 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Fri, 22 Oct 2021 20:05:37 +0100
Message-ID: <163492953733.1038219.11623184093542414017.stgit@warthog.procyon.org.uk>
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
Subject: [Linux-cachefs] [PATCH v2 28/53] fscache: Provide a function to
	resize a cookie
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

Provide a function to change the size of the storage attached to a cookie,
to match the size of the file being cached when it's changed by truncate or
fallocate:

	void fscache_resize_cookie(struct fscache_cookie *cookie,
				   loff_t new_size);

This acts synchronously and is expected to run under the inode lock of the
caller.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/fscache/internal.h          |    3 +++
 fs/fscache/io.c                |   25 +++++++++++++++++++++++++
 fs/fscache/stats.c             |    9 +++++++--
 include/linux/fscache-cache.h  |    4 ++++
 include/linux/fscache.h        |   18 ++++++++++++++++++
 include/trace/events/fscache.h |   25 +++++++++++++++++++++++++
 6 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index 4c45d2af7160..9ccbbd793ea3 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -88,6 +88,9 @@ extern atomic_t fscache_n_relinquishes;
 extern atomic_t fscache_n_relinquishes_retire;
 extern atomic_t fscache_n_relinquishes_dropped;
 
+extern atomic_t fscache_n_resizes;
+extern atomic_t fscache_n_resizes_null;
+
 static inline void fscache_stat(atomic_t *stat)
 {
 	atomic_inc(stat);
diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index 5b7ecb8a205b..bc8d1ac0e85c 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -255,6 +255,31 @@ int fscache_set_page_dirty(struct page *page, struct fscache_cookie *cookie)
 }
 EXPORT_SYMBOL(fscache_set_page_dirty);
 
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
+
 struct fscache_write_request {
 	struct netfs_cache_resources cache_resources;
 	struct address_space	*mapping;
diff --git a/fs/fscache/stats.c b/fs/fscache/stats.c
index 8d5ad6771498..225bba60b617 100644
--- a/fs/fscache/stats.c
+++ b/fs/fscache/stats.c
@@ -37,6 +37,9 @@ atomic_t fscache_n_relinquishes;
 atomic_t fscache_n_relinquishes_retire;
 atomic_t fscache_n_relinquishes_dropped;
 
+atomic_t fscache_n_resizes;
+atomic_t fscache_n_resizes_null;
+
 atomic_t fscache_n_read;
 EXPORT_SYMBOL(fscache_n_read);
 atomic_t fscache_n_write;
@@ -73,8 +76,10 @@ int fscache_stats_show(struct seq_file *m, void *v)
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
index 6830f91ebaf4..d5f6b636175e 100644
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
index 2b118e517c1d..877594fc057b 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -167,6 +167,7 @@ extern struct fscache_cookie *__fscache_acquire_cookie(
 extern void __fscache_use_cookie(struct fscache_cookie *, bool);
 extern void __fscache_unuse_cookie(struct fscache_cookie *, const void *, const loff_t *);
 extern void __fscache_relinquish_cookie(struct fscache_cookie *, bool);
+extern void __fscache_resize_cookie(struct fscache_cookie *, loff_t);
 extern void __fscache_invalidate(struct fscache_cookie *, const void *, loff_t, unsigned int);
 #ifdef FSCACHE_USE_NEW_IO_API
 extern int __fscache_begin_read_operation(struct netfs_cache_resources *, struct fscache_cookie *);
@@ -368,6 +369,23 @@ void fscache_update_cookie(struct fscache_cookie *cookie, const void *aux_data,
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
  * fscache_invalidate - Notify cache that an object needs invalidation
  * @cookie: The cookie representing the cache object
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index 63820b807494..b01784370963 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -77,6 +77,7 @@ enum fscache_access_trace {
 	fscache_access_invalidate_cookie_end,
 	fscache_access_io_not_live,
 	fscache_access_io_read,
+	fscache_access_io_resize,
 	fscache_access_io_wait,
 	fscache_access_io_write,
 	fscache_access_lookup_cookie,
@@ -146,6 +147,7 @@ enum fscache_access_trace {
 	EM(fscache_access_invalidate_cookie_end,"END   inval  ")	\
 	EM(fscache_access_io_not_live,		"END   io_notl")	\
 	EM(fscache_access_io_read,		"BEGIN io_read")	\
+	EM(fscache_access_io_resize,		"BEGIN io_resz")	\
 	EM(fscache_access_io_wait,		"WAIT  io    ")		\
 	EM(fscache_access_io_write,		"BEGIN io_writ")	\
 	EM(fscache_access_lookup_cookie,	"BEGIN lookup ")	\
@@ -411,6 +413,29 @@ TRACE_EVENT(fscache_invalidate,
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

