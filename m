Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CA90147D9E7
	for <lists+linux-cachefs@lfdr.de>; Thu, 23 Dec 2021 00:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640215056;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/kLivKVY2wXl2rr7qlcJw0eWMBp2QTTSSLTc7hDpq6o=;
	b=U471zGpxNmsGIlp4wg77WkK0Az8VY1LkDOFXx50NE9Zc9Hz45BUzoiV4Nvfv4JEFhkE20n
	hQ6A/ZX+YeizbKukOq3/tXZenar50T7HtnTcM70lW6n50YJuDRR3wIXI/NZltHtM02m5VG
	8GEnxhN6qJ17XXTt+b+Xpp5kQ5ZeUIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-70Ys6_DVNOW8fLsPGXmfCQ-1; Wed, 22 Dec 2021 18:17:33 -0500
X-MC-Unique: 70Ys6_DVNOW8fLsPGXmfCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 996A12F47;
	Wed, 22 Dec 2021 23:17:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BCD010911A9;
	Wed, 22 Dec 2021 23:17:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 505A34BB7C;
	Wed, 22 Dec 2021 23:17:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BMNHUHA031992 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 22 Dec 2021 18:17:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2C60E2E020; Wed, 22 Dec 2021 23:17:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80B822B5AC;
	Wed, 22 Dec 2021 23:17:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 22 Dec 2021 23:17:10 +0000
Message-ID: <164021503063.640689.8870918985269528670.stgit@warthog.procyon.org.uk>
In-Reply-To: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Subject: [Linux-cachefs] [PATCH v4 13/68] fscache: Implement cookie-level
	access helpers
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a number of helper functions to manage access to a cookie, pinning the
cache object in place for the duration to prevent cache withdrawal from
removing it:

 (1) void fscache_init_access_gate(struct fscache_cookie *cookie);

     This function initialises the access count when a cache binds to a
     cookie.  An extra ref is taken on the access count to prevent wakeups
     while the cache is active.  We're only interested in the wakeup when a
     cookie is being withdrawn and we're waiting for it to quiesce - at
     which point the counter will be decremented before the wait.

     The FSCACHE_COOKIE_NACC_ELEVATED flag is set on the cookie to keep
     track of the extra ref in order to handle a race between
     relinquishment and withdrawal both trying to drop the extra ref.

 (2) bool fscache_begin_cookie_access(struct fscache_cookie *cookie,
				      enum fscache_access_trace why);

     This function attempts to begin access upon a cookie, pinning it in
     place if it's cached.  If successful, it returns true and leaves a the
     access count incremented.

 (3) void fscache_end_cookie_access(struct fscache_cookie *cookie,
				    enum fscache_access_trace why);

     This function drops the access count obtained by (2), permitting
     object withdrawal to take place when it reaches zero.

A tracepoint is provided to track changes to the access counter on a
cookie.

Changes
=======
ver #2:
 - Don't hold n_accesses elevated whilst cache is bound to a cookie, but
   rather add a flag that prevents the state machine from being queued when
   n_accesses reaches 0.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819595085.215744.1706073049250505427.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/163906895313.143852.10141619544149102193.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/163967095980.1823006.1133648159424418877.stgit@warthog.procyon.org.uk/ # v3
---

 fs/fscache/cookie.c            |   98 ++++++++++++++++++++++++++++++++++++++++
 fs/fscache/internal.h          |    3 +
 fs/fscache/main.c              |    1 
 include/linux/fscache-cache.h  |    2 +
 include/trace/events/fscache.h |   29 ++++++++++++
 5 files changed, 133 insertions(+)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 438b0098aa73..04d2127bd354 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -62,6 +62,104 @@ static void fscache_free_cookie(struct fscache_cookie *cookie)
 	kmem_cache_free(fscache_cookie_jar, cookie);
 }
 
+/*
+ * Initialise the access gate on a cookie by setting a flag to prevent the
+ * state machine from being queued when the access counter transitions to 0.
+ * We're only interested in this when we withdraw caching services from the
+ * cookie.
+ */
+static void fscache_init_access_gate(struct fscache_cookie *cookie)
+{
+	int n_accesses;
+
+	n_accesses = atomic_read(&cookie->n_accesses);
+	trace_fscache_access(cookie->debug_id, refcount_read(&cookie->ref),
+			     n_accesses, fscache_access_cache_pin);
+	set_bit(FSCACHE_COOKIE_NO_ACCESS_WAKE, &cookie->flags);
+}
+
+/**
+ * fscache_end_cookie_access - Unpin a cache at the end of an access.
+ * @cookie: A data file cookie
+ * @why: An indication of the circumstances of the access for tracing
+ *
+ * Unpin a cache cookie after we've accessed it and bring a deferred
+ * relinquishment or withdrawal state into effect.
+ *
+ * The @why indicator is provided for tracing purposes.
+ */
+void fscache_end_cookie_access(struct fscache_cookie *cookie,
+			       enum fscache_access_trace why)
+{
+	int n_accesses;
+
+	smp_mb__before_atomic();
+	n_accesses = atomic_dec_return(&cookie->n_accesses);
+	trace_fscache_access(cookie->debug_id, refcount_read(&cookie->ref),
+			     n_accesses, why);
+	if (n_accesses == 0 &&
+	    !test_bit(FSCACHE_COOKIE_NO_ACCESS_WAKE, &cookie->flags)) {
+		// PLACEHOLDER: Need to poke the state machine
+	}
+}
+EXPORT_SYMBOL(fscache_end_cookie_access);
+
+/*
+ * Pin the cache behind a cookie so that we can access it.
+ */
+static void __fscache_begin_cookie_access(struct fscache_cookie *cookie,
+					  enum fscache_access_trace why)
+{
+	int n_accesses;
+
+	n_accesses = atomic_inc_return(&cookie->n_accesses);
+	smp_mb__after_atomic(); /* (Future) read state after is-caching.
+				 * Reread n_accesses after is-caching
+				 */
+	trace_fscache_access(cookie->debug_id, refcount_read(&cookie->ref),
+			     n_accesses, why);
+}
+
+/**
+ * fscache_begin_cookie_access - Pin a cache so data can be accessed
+ * @cookie: A data file cookie
+ * @why: An indication of the circumstances of the access for tracing
+ *
+ * Attempt to pin the cache to prevent it from going away whilst we're
+ * accessing data and returns true if successful.  This works as follows:
+ *
+ *  (1) If the cookie is not being cached (ie. FSCACHE_COOKIE_IS_CACHING is not
+ *      set), we return false to indicate access was not permitted.
+ *
+ *  (2) If the cookie is being cached, we increment its n_accesses count and
+ *      then recheck the IS_CACHING flag, ending the access if it got cleared.
+ *
+ *  (3) When we end the access, we decrement the cookie's n_accesses and wake
+ *      up the any waiters if it reaches 0.
+ *
+ *  (4) Whilst the cookie is actively being cached, its n_accesses is kept
+ *      artificially incremented to prevent wakeups from happening.
+ *
+ *  (5) When the cache is taken offline or if the cookie is culled, the flag is
+ *      cleared to prevent new accesses, the cookie's n_accesses is decremented
+ *      and we wait for it to become 0.
+ *
+ * The @why indicator are merely provided for tracing purposes.
+ */
+bool fscache_begin_cookie_access(struct fscache_cookie *cookie,
+				 enum fscache_access_trace why)
+{
+	if (!test_bit(FSCACHE_COOKIE_IS_CACHING, &cookie->flags))
+		return false;
+	__fscache_begin_cookie_access(cookie, why);
+	if (!test_bit(FSCACHE_COOKIE_IS_CACHING, &cookie->flags) ||
+	    !fscache_cache_is_live(cookie->volume->cache)) {
+		fscache_end_cookie_access(cookie, fscache_access_unlive);
+		return false;
+	}
+	return true;
+}
+
 static inline void wake_up_cookie_state(struct fscache_cookie *cookie)
 {
 	/* Use a barrier to ensure that waiters see the state variable
diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index 91a4ea08ec0b..e0d8ef212e82 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -59,6 +59,9 @@ extern struct kmem_cache *fscache_cookie_jar;
 extern const struct seq_operations fscache_cookies_seq_ops;
 
 extern void fscache_print_cookie(struct fscache_cookie *cookie, char prefix);
+extern bool fscache_begin_cookie_access(struct fscache_cookie *cookie,
+					enum fscache_access_trace why);
+
 static inline void fscache_see_cookie(struct fscache_cookie *cookie,
 				      enum fscache_cookie_trace where)
 {
diff --git a/fs/fscache/main.c b/fs/fscache/main.c
index 6cab5d99ba4c..dad85fd84f6f 100644
--- a/fs/fscache/main.c
+++ b/fs/fscache/main.c
@@ -23,6 +23,7 @@ MODULE_PARM_DESC(fscache_debug,
 
 EXPORT_TRACEPOINT_SYMBOL(fscache_access_cache);
 EXPORT_TRACEPOINT_SYMBOL(fscache_access_volume);
+EXPORT_TRACEPOINT_SYMBOL(fscache_access);
 
 struct workqueue_struct *fscache_wq;
 EXPORT_SYMBOL(fscache_wq);
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index fbbd8a2afe12..66624407ba84 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -61,6 +61,8 @@ extern struct fscache_cookie *fscache_get_cookie(struct fscache_cookie *cookie,
 						 enum fscache_cookie_trace where);
 extern void fscache_put_cookie(struct fscache_cookie *cookie,
 			       enum fscache_cookie_trace where);
+extern void fscache_end_cookie_access(struct fscache_cookie *cookie,
+				      enum fscache_access_trace why);
 extern void fscache_set_cookie_state(struct fscache_cookie *cookie,
 				     enum fscache_cookie_state state);
 
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index 4f40cfa52469..b1a962adfd16 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -279,6 +279,35 @@ TRACE_EVENT(fscache_access_volume,
 		      __entry->n_accesses)
 	    );
 
+TRACE_EVENT(fscache_access,
+	    TP_PROTO(unsigned int cookie_debug_id,
+		     int ref,
+		     int n_accesses,
+		     enum fscache_access_trace why),
+
+	    TP_ARGS(cookie_debug_id, ref, n_accesses, why),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,		cookie		)
+		    __field(int,			ref		)
+		    __field(int,			n_accesses	)
+		    __field(enum fscache_access_trace,	why		)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->cookie	= cookie_debug_id;
+		    __entry->ref	= ref;
+		    __entry->n_accesses	= n_accesses;
+		    __entry->why	= why;
+			   ),
+
+	    TP_printk("c=%08x %s r=%d a=%d",
+		      __entry->cookie,
+		      __print_symbolic(__entry->why, fscache_access_traces),
+		      __entry->ref,
+		      __entry->n_accesses)
+	    );
+
 TRACE_EVENT(fscache_acquire,
 	    TP_PROTO(struct fscache_cookie *cookie),
 


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

