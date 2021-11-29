Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D0C461847
	for <lists+linux-cachefs@lfdr.de>; Mon, 29 Nov 2021 15:27:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638196039;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D9yUoPHNtUw3U68ushVXMqqGKGA6LlDDQ0XqVfWXp6Y=;
	b=QYiaCepycBqC7JDEW9VC1cJ4QchnWssYeTcsQSvC883WYmXpjl/Wvgj7DoQULLPlGD9qge
	KzKlMZNZmGzychW1JVrpQMZHOdUPLy/cAOvzRbajfxe7eEeGiSGo2O0aIbTZupaxMh2JIf
	jug7H0uC9PdUrJYiy1eWVwhMUzSSARE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-88N_ZWIONpa6qeEA7wCrPQ-1; Mon, 29 Nov 2021 09:27:15 -0500
X-MC-Unique: 88N_ZWIONpa6qeEA7wCrPQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D80F8101F002;
	Mon, 29 Nov 2021 14:27:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA40D5D9DE;
	Mon, 29 Nov 2021 14:27:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B86FA1809C89;
	Mon, 29 Nov 2021 14:27:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ATERBiP000508 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 29 Nov 2021 09:27:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AB9C0ADD5; Mon, 29 Nov 2021 14:27:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23F925D9C0;
	Mon, 29 Nov 2021 14:27:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 29 Nov 2021 14:27:02 +0000
Message-ID: <163819602231.215744.11206598147269491575.stgit@warthog.procyon.org.uk>
In-Reply-To: <163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
References: <163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH 19/64] fscache: Implement cookie invalidation
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

Add a function to invalidate the cache behind a cookie:

	void fscache_invalidate(struct fscache_cookie *cookie,
				const void *aux_data,
				loff_t size,
				unsigned int flags)

This causes any cached data for the specified cookie to be discarded.  If
the cookie is marked as being in use, a new cache object will be created if
possible and future I/O will use that instead.  In-flight I/O should be
abandoned (writes) or reconsidered (reads).  Each time it is called
cookie->inval_counter is incremented and this can be used to detect
invalidation at the end of an I/O operation.

The coherency data attached to the cookie can be updated and the cookie
size should be reset.  One flag is available, FSCACHE_INVAL_DIO_WRITE,
which should be used to indicate invalidation due to a DIO write on a
file.  This will temporarily disable caching for this cookie.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/fscache/cookie.c            |   87 ++++++++++++++++++++++++++++++++++++++++
 fs/fscache/internal.h          |    2 +
 fs/fscache/stats.c             |    5 ++
 include/linux/fscache-cache.h  |    4 ++
 include/linux/fscache.h        |   31 ++++++++++++++
 include/linux/netfs.h          |    1 
 include/trace/events/fscache.h |   25 +++++++++++
 7 files changed, 154 insertions(+), 1 deletion(-)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index f056f834639b..7919d7f5747b 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -19,6 +19,7 @@ static void fscache_cookie_lru_timed_out(struct timer_list *timer);
 static void fscache_cookie_lru_worker(struct work_struct *work);
 static void fscache_cookie_worker(struct work_struct *work);
 static void fscache_unhash_cookie(struct fscache_cookie *cookie);
+static void fscache_perform_invalidation(struct fscache_cookie *cookie);
 
 #define fscache_cookie_hash_shift 15
 static struct hlist_bl_head fscache_cookie_hash[1 << fscache_cookie_hash_shift];
@@ -28,7 +29,7 @@ static LIST_HEAD(fscache_cookie_lru);
 static DEFINE_SPINLOCK(fscache_cookie_lru_lock);
 DEFINE_TIMER(fscache_cookie_lru_timer, fscache_cookie_lru_timed_out);
 static DECLARE_WORK(fscache_cookie_lru_work, fscache_cookie_lru_worker);
-static const char fscache_cookie_states[FSCACHE_COOKIE_STATE__NR] = "-LCAFUWRD";
+static const char fscache_cookie_states[FSCACHE_COOKIE_STATE__NR] = "-LCAIFUWRD";
 unsigned int fscache_lru_cookie_timeout = 10 * HZ;
 
 void fscache_print_cookie(struct fscache_cookie *cookie, char prefix)
@@ -228,6 +229,19 @@ void fscache_cookie_lookup_negative(struct fscache_cookie *cookie)
 }
 EXPORT_SYMBOL(fscache_cookie_lookup_negative);
 
+/**
+ * fscache_resume_after_invalidation - Allow I/O to resume after invalidation
+ * @cookie: The cookie that was invalidated
+ *
+ * Tell fscache that invalidation is sufficiently complete that I/O can be
+ * allowed again.
+ */
+void fscache_resume_after_invalidation(struct fscache_cookie *cookie)
+{
+	fscache_set_cookie_state(cookie, FSCACHE_COOKIE_STATE_ACTIVE);
+}
+EXPORT_SYMBOL(fscache_resume_after_invalidation);
+
 /**
  * fscache_caching_failed - Report that a failure stopped caching on a cookie
  * @cookie: The cookie that was affected
@@ -558,6 +572,7 @@ void __fscache_use_cookie(struct fscache_cookie *cookie, bool will_modify)
 			set_bit(FSCACHE_COOKIE_LOCAL_WRITE, &cookie->flags);
 		break;
 	case FSCACHE_COOKIE_STATE_ACTIVE:
+	case FSCACHE_COOKIE_STATE_INVALIDATING:
 		if (will_modify &&
 		    !test_and_set_bit(FSCACHE_COOKIE_LOCAL_WRITE, &cookie->flags)) {
 			set_bit(FSCACHE_COOKIE_DO_PREP_TO_WRITE, &cookie->flags);
@@ -663,6 +678,11 @@ static void fscache_cookie_state_machine(struct fscache_cookie *cookie)
 		fscache_perform_lookup(cookie);
 		goto again;
 
+	case FSCACHE_COOKIE_STATE_INVALIDATING:
+		spin_unlock(&cookie->lock);
+		fscache_perform_invalidation(cookie);
+		goto again;
+
 	case FSCACHE_COOKIE_STATE_ACTIVE:
 		if (test_and_clear_bit(FSCACHE_COOKIE_DO_PREP_TO_WRITE, &cookie->flags)) {
 			spin_unlock(&cookie->lock);
@@ -939,6 +959,71 @@ struct fscache_cookie *fscache_get_cookie(struct fscache_cookie *cookie,
 }
 EXPORT_SYMBOL(fscache_get_cookie);
 
+/*
+ * Ask the cache to effect invalidation of a cookie.
+ */
+static void fscache_perform_invalidation(struct fscache_cookie *cookie)
+{
+	if (!cookie->volume->cache->ops->invalidate_cookie(cookie))
+		fscache_caching_failed(cookie);
+	fscache_end_cookie_access(cookie, fscache_access_invalidate_cookie_end);
+}
+
+/*
+ * Invalidate an object.
+ */
+void __fscache_invalidate(struct fscache_cookie *cookie,
+			  const void *aux_data, loff_t new_size,
+			  unsigned int flags)
+{
+	bool is_caching;
+
+	_enter("c=%x", cookie->debug_id);
+
+	fscache_stat(&fscache_n_invalidates);
+
+	if (WARN(test_bit(FSCACHE_COOKIE_RELINQUISHED, &cookie->flags),
+		 "Trying to invalidate relinquished cookie\n"))
+		return;
+
+	if ((flags & FSCACHE_INVAL_DIO_WRITE) &&
+	    test_and_set_bit(FSCACHE_COOKIE_DISABLED, &cookie->flags))
+		return;
+
+	spin_lock(&cookie->lock);
+	set_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
+	fscache_update_aux(cookie, aux_data, &new_size);
+	cookie->inval_counter++;
+	trace_fscache_invalidate(cookie, new_size);
+
+	switch (cookie->state) {
+	case FSCACHE_COOKIE_STATE_INVALIDATING: /* is_still_valid will catch it */
+	default:
+		spin_unlock(&cookie->lock);
+		_leave(" [no %u]", cookie->state);
+		return;
+
+	case FSCACHE_COOKIE_STATE_LOOKING_UP:
+	case FSCACHE_COOKIE_STATE_CREATING:
+		spin_unlock(&cookie->lock);
+		_leave(" [look %x]", cookie->inval_counter);
+		return;
+
+	case FSCACHE_COOKIE_STATE_ACTIVE:
+		__fscache_set_cookie_state(cookie, FSCACHE_COOKIE_STATE_INVALIDATING);
+		is_caching = fscache_begin_cookie_access(
+			cookie, fscache_access_invalidate_cookie);
+		spin_unlock(&cookie->lock);
+		wake_up_cookie_state(cookie);
+
+		if (is_caching)
+			fscache_queue_cookie(cookie, fscache_cookie_get_inval_work);
+		_leave(" [inv]");
+		return;
+	}
+}
+EXPORT_SYMBOL(__fscache_invalidate);
+
 /*
  * Generate a list of extant cookies in /proc/fs/fscache/cookies
  */
diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index 9af8de906bf0..e4f3a1a993f6 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -105,6 +105,8 @@ extern atomic_t fscache_n_acquires;
 extern atomic_t fscache_n_acquires_ok;
 extern atomic_t fscache_n_acquires_oom;
 
+extern atomic_t fscache_n_invalidates;
+
 extern atomic_t fscache_n_relinquishes;
 extern atomic_t fscache_n_relinquishes_retire;
 extern atomic_t fscache_n_relinquishes_dropped;
diff --git a/fs/fscache/stats.c b/fs/fscache/stats.c
index 5aa4bd9fe207..cdbb672a274f 100644
--- a/fs/fscache/stats.c
+++ b/fs/fscache/stats.c
@@ -26,6 +26,8 @@ atomic_t fscache_n_acquires;
 atomic_t fscache_n_acquires_ok;
 atomic_t fscache_n_acquires_oom;
 
+atomic_t fscache_n_invalidates;
+
 atomic_t fscache_n_updates;
 EXPORT_SYMBOL(fscache_n_updates);
 
@@ -59,6 +61,9 @@ int fscache_stats_show(struct seq_file *m, void *v)
 		   timer_pending(&fscache_cookie_lru_timer) ?
 		   fscache_cookie_lru_timer.expires - jiffies : 0);
 
+	seq_printf(m, "Invals : n=%u\n",
+		   atomic_read(&fscache_n_invalidates));
+
 	seq_printf(m, "Updates: n=%u\n",
 		   atomic_read(&fscache_n_updates));
 
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index ae6a75976450..1ad56bfd9d72 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -64,6 +64,9 @@ struct fscache_cache_ops {
 	/* Withdraw an object without any cookie access counts held */
 	void (*withdraw_cookie)(struct fscache_cookie *cookie);
 
+	/* Invalidate an object */
+	bool (*invalidate_cookie)(struct fscache_cookie *cookie);
+
 	/* Prepare to write to a live cache object */
 	void (*prepare_to_write)(struct fscache_cookie *cookie);
 };
@@ -96,6 +99,7 @@ extern void fscache_put_cookie(struct fscache_cookie *cookie,
 extern void fscache_end_cookie_access(struct fscache_cookie *cookie,
 				      enum fscache_access_trace why);
 extern void fscache_cookie_lookup_negative(struct fscache_cookie *cookie);
+extern void fscache_resume_after_invalidation(struct fscache_cookie *cookie);
 extern void fscache_caching_failed(struct fscache_cookie *cookie);
 
 /**
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index c5b7eeb76835..cfbace3bdc88 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -39,6 +39,8 @@ struct fscache_cookie;
 #define FSCACHE_ADV_WRITE_CACHE		0x00 /* Do cache if written to locally */
 #define FSCACHE_ADV_WRITE_NOCACHE	0x02 /* Don't cache if written to locally */
 
+#define FSCACHE_INVAL_DIO_WRITE		0x01 /* Invalidate due to DIO write */
+
 /*
  * Data object state.
  */
@@ -47,6 +49,7 @@ enum fscache_cookie_state {
 	FSCACHE_COOKIE_STATE_LOOKING_UP,	/* The cache object is being looked up */
 	FSCACHE_COOKIE_STATE_CREATING,		/* The cache object is being created */
 	FSCACHE_COOKIE_STATE_ACTIVE,		/* The cache is active, readable and writable */
+	FSCACHE_COOKIE_STATE_INVALIDATING,	/* The cache is being invalidated */
 	FSCACHE_COOKIE_STATE_FAILED,		/* The cache failed, withdraw to clear */
 	FSCACHE_COOKIE_STATE_LRU_DISCARDING,	/* The cookie is being discarded by the LRU */
 	FSCACHE_COOKIE_STATE_WITHDRAWING,	/* The cookie is being withdrawn */
@@ -152,6 +155,7 @@ extern struct fscache_cookie *__fscache_acquire_cookie(
 extern void __fscache_use_cookie(struct fscache_cookie *, bool);
 extern void __fscache_unuse_cookie(struct fscache_cookie *, const void *, const loff_t *);
 extern void __fscache_relinquish_cookie(struct fscache_cookie *, bool);
+extern void __fscache_invalidate(struct fscache_cookie *, const void *, loff_t, unsigned int);
 
 /**
  * fscache_acquire_volume - Register a volume as desiring caching services
@@ -319,4 +323,31 @@ void __fscache_update_cookie(struct fscache_cookie *cookie, const void *aux_data
 	set_bit(FSCACHE_COOKIE_NEEDS_UPDATE, &cookie->flags);
 }
 
+/**
+ * fscache_invalidate - Notify cache that an object needs invalidation
+ * @cookie: The cookie representing the cache object
+ * @aux_data: The updated auxiliary data for the cookie (may be NULL)
+ * @size: The revised size of the object.
+ * @flags: Invalidation flags (FSCACHE_INVAL_*)
+ *
+ * Notify the cache that an object is needs to be invalidated and that it
+ * should abort any retrievals or stores it is doing on the cache.  This
+ * increments inval_counter on the cookie which can be used by the caller to
+ * reconsider I/O requests as they complete.
+ *
+ * If @flags has FSCACHE_INVAL_DIO_WRITE set, this indicates that this is due
+ * to a direct I/O write and will cause caching to be disabled on this cookie
+ * until it is completely unused.
+ *
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
+ * description.
+ */
+static inline
+void fscache_invalidate(struct fscache_cookie *cookie,
+			const void *aux_data, loff_t size, unsigned int flags)
+{
+	if (fscache_cookie_enabled(cookie))
+		__fscache_invalidate(cookie, aux_data, size, flags);
+}
+
 #endif /* _LINUX_FSCACHE_H */
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 1ea22fc48818..5a46fde65759 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -124,6 +124,7 @@ struct netfs_cache_resources {
 	void				*cache_priv;
 	void				*cache_priv2;
 	unsigned int			debug_id;	/* Cookie debug ID */
+	unsigned int			inval_counter;	/* object->inval_counter at begin_op */
 };
 
 /*
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index 17654fa657a6..5f88479fb06a 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -51,6 +51,7 @@ enum fscache_cookie_trace {
 	fscache_cookie_discard,
 	fscache_cookie_get_end_access,
 	fscache_cookie_get_hash_collision,
+	fscache_cookie_get_inval_work,
 	fscache_cookie_get_lru,
 	fscache_cookie_get_use_work,
 	fscache_cookie_new_acquire,
@@ -73,6 +74,8 @@ enum fscache_access_trace {
 	fscache_access_acquire_volume_end,
 	fscache_access_cache_pin,
 	fscache_access_cache_unpin,
+	fscache_access_invalidate_cookie,
+	fscache_access_invalidate_cookie_end,
 	fscache_access_lookup_cookie,
 	fscache_access_lookup_cookie_end,
 	fscache_access_lookup_cookie_end_failed,
@@ -116,6 +119,7 @@ enum fscache_access_trace {
 	EM(fscache_cookie_discard,		"DISCARD  ")		\
 	EM(fscache_cookie_get_hash_collision,	"GET hcoll")		\
 	EM(fscache_cookie_get_end_access,	"GQ  endac")		\
+	EM(fscache_cookie_get_inval_work,	"GQ  inval")		\
 	EM(fscache_cookie_get_lru,		"GET lru  ")		\
 	EM(fscache_cookie_get_use_work,		"GQ  use  ")		\
 	EM(fscache_cookie_new_acquire,		"NEW acq  ")		\
@@ -137,6 +141,8 @@ enum fscache_access_trace {
 	EM(fscache_access_acquire_volume_end,	"END   acq_vol")	\
 	EM(fscache_access_cache_pin,		"PIN   cache  ")	\
 	EM(fscache_access_cache_unpin,		"UNPIN cache  ")	\
+	EM(fscache_access_invalidate_cookie,	"BEGIN inval  ")	\
+	EM(fscache_access_invalidate_cookie_end,"END   inval  ")	\
 	EM(fscache_access_lookup_cookie,	"BEGIN lookup ")	\
 	EM(fscache_access_lookup_cookie_end,	"END   lookup ")	\
 	EM(fscache_access_lookup_cookie_end_failed,"END   lookupf")	\
@@ -386,6 +392,25 @@ TRACE_EVENT(fscache_relinquish,
 		      __entry->n_active, __entry->flags, __entry->retire)
 	    );
 
+TRACE_EVENT(fscache_invalidate,
+	    TP_PROTO(struct fscache_cookie *cookie, loff_t new_size),
+
+	    TP_ARGS(cookie, new_size),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,		cookie		)
+		    __field(loff_t,			new_size	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->cookie	= cookie->debug_id;
+		    __entry->new_size	= new_size;
+			   ),
+
+	    TP_printk("c=%08x sz=%llx",
+		      __entry->cookie, __entry->new_size)
+	    );
+
 #endif /* _TRACE_FSCACHE_H */
 
 /* This part must be outside protection */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

