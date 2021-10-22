Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E19C6437D3D
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634929364;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qU+h+zr4i7eeR8pcop41e7IDPt5AYQIzQX4FA9hb4qc=;
	b=WqF36S5M7ZhXFgQdQsN1/4yKV5ZngaHEv66F4cPYqnLxmabhkJNpvxjkSM40XNCDK4l6E2
	FuBoSvb32LhE7ZhT3i37JHH7DGoJOrV/KKnClI/eIzcm1oA5bhpQgmpC7eioSJ5X1HWFg7
	zbm5RWW15/7WB5dDT2MMWlEjkhrT1vE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-dBYv8gJ9PM20IVGDIKEyMw-1; Fri, 22 Oct 2021 15:02:41 -0400
X-MC-Unique: dBYv8gJ9PM20IVGDIKEyMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A70DE1006AA8;
	Fri, 22 Oct 2021 19:02:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A86D10023B8;
	Fri, 22 Oct 2021 19:02:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88DBD4E58F;
	Fri, 22 Oct 2021 19:02:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJ2bHh012173 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:02:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD9BC60C04; Fri, 22 Oct 2021 19:02:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4028060C13;
	Fri, 22 Oct 2021 19:02:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Fri, 22 Oct 2021 20:02:31 +0100
Message-ID: <163492935136.1038219.11707612718347288119.stgit@warthog.procyon.org.uk>
In-Reply-To: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Subject: [Linux-cachefs] [PATCH v2 14/53] fscache: Implement cookie-level
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

Add a pair of helper functions to manage access to a cookie, pinning the
cache object in place for the duration to prevent cache withdrawal from
removing it:

	bool fscache_begin_cookie_access(struct fscache_cookie *cookie,
					 enum fscache_access_trace why);
	void fscache_end_cookie_access(struct fscache_cookie *cookie,
				       enum fscache_access_trace why);

The first is intended for internal use only, but the second will be used by
the cache backend also.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/fscache/cookie.c            |   60 ++++++++++++++++++++++++++++++++++++++++
 fs/fscache/internal.h          |    3 ++
 fs/fscache/main.c              |    1 +
 include/linux/fscache-cache.h  |    2 +
 include/trace/events/fscache.h |   29 +++++++++++++++++++
 5 files changed, 95 insertions(+)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 87ee8b666765..9b6ddbc01825 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -57,6 +57,66 @@ static void fscache_free_cookie(struct fscache_cookie *cookie)
 	kmem_cache_free(fscache_cookie_jar, cookie);
 }
 
+static void __fscache_end_cookie_access(struct fscache_cookie *cookie)
+{
+	if (test_bit(FSCACHE_COOKIE_DO_RELINQUISH, &cookie->flags))
+		fscache_set_cookie_stage(cookie, FSCACHE_COOKIE_STAGE_RELINQUISHING);
+	else if (test_bit(FSCACHE_COOKIE_DO_WITHDRAW, &cookie->flags))
+		fscache_set_cookie_stage(cookie, FSCACHE_COOKIE_STAGE_WITHDRAWING);
+	// PLACEHOLDER: Schedule cookie cleanup
+}
+
+/*
+ * Mark the end of an access on a cookie.  This brings a deferred
+ * relinquishment or withdrawal stage into effect.
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
+	if (n_accesses == 0)
+		__fscache_end_cookie_access(cookie);
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
+	smp_mb__after_atomic(); /* (Future) read stage after is-caching.
+				 * Reread n_accesses after is-caching
+				 */
+	trace_fscache_access(cookie->debug_id, refcount_read(&cookie->ref),
+			     n_accesses, why);
+}
+
+/*
+ * Pin the cache behind a cookie so that we can access it.
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
 static inline void wake_up_cookie_stage(struct fscache_cookie *cookie)
 {
 	/* Use a barrier to ensure that waiters see the stage variable
diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index 18f9a408a4f4..5669ba4bc8a9 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -34,6 +34,9 @@ extern struct kmem_cache *fscache_cookie_jar;
 extern const struct seq_operations fscache_cookies_seq_ops;
 
 extern void fscache_print_cookie(struct fscache_cookie *cookie, char prefix);
+extern bool fscache_begin_cookie_access(struct fscache_cookie *cookie,
+					enum fscache_access_trace why);
+
 static inline void fscache_see_cookie(struct fscache_cookie *cookie,
 				      enum fscache_cookie_trace where)
 {
diff --git a/fs/fscache/main.c b/fs/fscache/main.c
index 6a024c45eb0b..01d57433702c 100644
--- a/fs/fscache/main.c
+++ b/fs/fscache/main.c
@@ -23,6 +23,7 @@ MODULE_PARM_DESC(fscache_debug,
 
 EXPORT_TRACEPOINT_SYMBOL(fscache_access_cache);
 EXPORT_TRACEPOINT_SYMBOL(fscache_access_volume);
+EXPORT_TRACEPOINT_SYMBOL(fscache_access);
 
 struct workqueue_struct *fscache_wq;
 EXPORT_SYMBOL(fscache_wq);
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index 7db4dda74951..a10f87421438 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -84,6 +84,8 @@ extern struct fscache_cookie *fscache_get_cookie(struct fscache_cookie *cookie,
 						 enum fscache_cookie_trace where);
 extern void fscache_put_cookie(struct fscache_cookie *cookie,
 			       enum fscache_cookie_trace where);
+extern void fscache_end_cookie_access(struct fscache_cookie *cookie,
+				      enum fscache_access_trace why);
 extern void fscache_set_cookie_stage(struct fscache_cookie *cookie,
 				     enum fscache_cookie_stage stage);
 
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index 4b35fe9cd906..132381921be9 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -269,6 +269,35 @@ TRACE_EVENT(fscache_access_volume,
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

