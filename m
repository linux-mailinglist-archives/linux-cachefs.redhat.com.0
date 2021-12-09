Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5989146EE38
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Dec 2021 17:55:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639068944;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VCEpqMQC6KU9ys5UZAdn+cAxoElM/B6uiGoHICo5pyw=;
	b=bAkrFsyxGCQwDeGaYebA/5sPjujl0e3/aAwYM0sSoecESHiENPR1W+GbKA/65+kHG4S1yN
	wTVioD4S37rYMEJVol9DaKE+Ezo2+rcOWerrb1OkIheoeTCuCnGMtu1YJMU6RA5hsg8f5T
	DGWmTNUopv7BrVRzTAEK8YBwByTE2FE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-wi-sJYEbOmG-5EqbwJjvTA-1; Thu, 09 Dec 2021 11:55:41 -0500
X-MC-Unique: wi-sJYEbOmG-5EqbwJjvTA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 748AB3E741;
	Thu,  9 Dec 2021 16:55:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EF1710016F5;
	Thu,  9 Dec 2021 16:55:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 023784BB7C;
	Thu,  9 Dec 2021 16:55:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B9Gtbse018578 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 9 Dec 2021 11:55:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E25F319D9F; Thu,  9 Dec 2021 16:55:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 814DF19C59;
	Thu,  9 Dec 2021 16:55:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 09 Dec 2021 16:55:33 +0000
Message-ID: <163906893368.143852.14164004598465617981.stgit@warthog.procyon.org.uk>
In-Reply-To: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
References: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
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
Subject: [Linux-cachefs] [PATCH v2 11/67] fscache: Implement cache-level
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

Add a pair of functions to pin/unpin a cache that we're wanting to do a
high-level access to (such as creating or removing a volume):

	bool fscache_begin_cache_access(struct fscache_cache *cache,
					enum fscache_access_trace why);
	void fscache_end_cache_access(struct fscache_cache *cache,
				      enum fscache_access_trace why);

The way the access gate works/will work is:

 (1) If the cache tests as not live (state is not FSCACHE_CACHE_IS_ACTIVE),
     then we return false to indicate access was not permitted.

 (2) If the cache tests as live, then we increment the n_accesses count and
     then recheck the liveness, ending the access if it ceased to be live.

 (3) When we end the access, we decrement n_accesses and wake up the any
     waiters if it reaches 0.

 (4) Whilst the cache is caching, n_accesses is kept artificially
     incremented to prevent wakeups from happening.

 (5) When the cache is taken offline, the state is changed to prevent new
     accesses, n_accesses is decremented and we wait for n_accesses to
     become 0.

Note that some of this is implemented in a later patch.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819593239.215744.7537428720603638088.stgit@warthog.procyon.org.uk/ # v1
---

 fs/fscache/cache.c             |   62 ++++++++++++++++++++++++++++++++++++++++
 fs/fscache/internal.h          |    2 +
 fs/fscache/main.c              |    2 +
 include/trace/events/fscache.h |   41 ++++++++++++++++++++++++++
 4 files changed, 107 insertions(+)

diff --git a/fs/fscache/cache.c b/fs/fscache/cache.c
index 8db77bb9f8e2..e867cff53a70 100644
--- a/fs/fscache/cache.c
+++ b/fs/fscache/cache.c
@@ -216,6 +216,68 @@ void fscache_relinquish_cache(struct fscache_cache *cache)
 }
 EXPORT_SYMBOL(fscache_relinquish_cache);
 
+/**
+ * fscache_begin_cache_access - Pin a cache so it can be accessed
+ * @cache: The cache-level cookie
+ * @why: An indication of the circumstances of the access for tracing
+ *
+ * Attempt to pin the cache to prevent it from going away whilst we're
+ * accessing it and returns true if successful.  This works as follows:
+ *
+ *  (1) If the cache tests as not live (state is not FSCACHE_CACHE_IS_ACTIVE),
+ *      then we return false to indicate access was not permitted.
+ *
+ *  (2) If the cache tests as live, then we increment the n_accesses count and
+ *      then recheck the liveness, ending the access if it ceased to be live.
+ *
+ *  (3) When we end the access, we decrement n_accesses and wake up the any
+ *      waiters if it reaches 0.
+ *
+ *  (4) Whilst the cache is caching, n_accesses is kept artificially
+ *      incremented to prevent wakeups from happening.
+ *
+ *  (5) When the cache is taken offline, the state is changed to prevent new
+ *      accesses, n_accesses is decremented and we wait for n_accesses to
+ *      become 0.
+ */
+bool fscache_begin_cache_access(struct fscache_cache *cache, enum fscache_access_trace why)
+{
+	int n_accesses;
+
+	if (!fscache_cache_is_live(cache))
+		return false;
+
+	n_accesses = atomic_inc_return(&cache->n_accesses);
+	smp_mb__after_atomic(); /* Reread live flag after n_accesses */
+	trace_fscache_access_cache(cache->debug_id, refcount_read(&cache->ref),
+				   n_accesses, why);
+	if (!fscache_cache_is_live(cache)) {
+		fscache_end_cache_access(cache, fscache_access_unlive);
+		return false;
+	}
+	return true;
+}
+
+/**
+ * fscache_end_cache_access - Unpin a cache at the end of an access.
+ * @cache: The cache-level cookie
+ * @why: An indication of the circumstances of the access for tracing
+ *
+ * Unpin a cache after we've accessed it.  The @why indicator is merely
+ * provided for tracing purposes.
+ */
+void fscache_end_cache_access(struct fscache_cache *cache, enum fscache_access_trace why)
+{
+	int n_accesses;
+
+	smp_mb__before_atomic();
+	n_accesses = atomic_dec_return(&cache->n_accesses);
+	trace_fscache_access_cache(cache->debug_id, refcount_read(&cache->ref),
+				   n_accesses, why);
+	if (n_accesses == 0)
+		wake_up_var(&cache->n_accesses);
+}
+
 #ifdef CONFIG_PROC_FS
 static const char fscache_cache_states[NR__FSCACHE_CACHE_STATE] = "-PAEW";
 
diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index c9bd4bcd4485..ca035d6be7f9 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -23,6 +23,8 @@
 #ifdef CONFIG_PROC_FS
 extern const struct seq_operations fscache_caches_seq_ops;
 #endif
+bool fscache_begin_cache_access(struct fscache_cache *cache, enum fscache_access_trace why);
+void fscache_end_cache_access(struct fscache_cache *cache, enum fscache_access_trace why);
 struct fscache_cache *fscache_lookup_cache(const char *name, bool is_cache);
 void fscache_put_cache(struct fscache_cache *cache, enum fscache_cache_trace where);
 
diff --git a/fs/fscache/main.c b/fs/fscache/main.c
index fad9c1933987..e1f14b29cff4 100644
--- a/fs/fscache/main.c
+++ b/fs/fscache/main.c
@@ -21,6 +21,8 @@ module_param_named(debug, fscache_debug, uint,
 MODULE_PARM_DESC(fscache_debug,
 		 "FS-Cache debugging mask");
 
+EXPORT_TRACEPOINT_SYMBOL(fscache_access_cache);
+
 struct workqueue_struct *fscache_wq;
 EXPORT_SYMBOL(fscache_wq);
 
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index 9286e1c4b2ac..734966bc49e1 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -62,6 +62,12 @@ enum fscache_cookie_trace {
 	fscache_cookie_see_work,
 };
 
+enum fscache_access_trace {
+	fscache_access_cache_pin,
+	fscache_access_cache_unpin,
+	fscache_access_unlive,
+};
+
 #endif
 
 /*
@@ -107,6 +113,11 @@ enum fscache_cookie_trace {
 	EM(fscache_cookie_see_withdraw,		"-   x-wth")		\
 	E_(fscache_cookie_see_work,		"-   work ")
 
+#define fscache_access_traces		\
+	EM(fscache_access_cache_pin,		"PIN   cache  ")	\
+	EM(fscache_access_cache_unpin,		"UNPIN cache  ")	\
+	E_(fscache_access_unlive,		"END   unlive ")
+
 /*
  * Export enum symbols via userspace.
  */
@@ -118,6 +129,7 @@ enum fscache_cookie_trace {
 fscache_cache_traces;
 fscache_volume_traces;
 fscache_cookie_traces;
+fscache_access_traces;
 
 /*
  * Now redefine the EM() and E_() macros to map the enums to the strings that
@@ -204,6 +216,35 @@ TRACE_EVENT(fscache_cookie,
 		      __entry->ref)
 	    );
 
+TRACE_EVENT(fscache_access_cache,
+	    TP_PROTO(unsigned int cache_debug_id,
+		     int ref,
+		     int n_accesses,
+		     enum fscache_access_trace why),
+
+	    TP_ARGS(cache_debug_id, ref, n_accesses, why),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,		cache		)
+		    __field(int,			ref		)
+		    __field(int,			n_accesses	)
+		    __field(enum fscache_access_trace,	why		)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->cache	= cache_debug_id;
+		    __entry->ref	= ref;
+		    __entry->n_accesses	= n_accesses;
+		    __entry->why	= why;
+			   ),
+
+	    TP_printk("C=%08x %s r=%d a=%d",
+		      __entry->cache,
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

