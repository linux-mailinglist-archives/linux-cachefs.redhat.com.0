Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECEA3AF7F7
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Jun 2021 23:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624312055;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZCjX8bviHCc8/Zp0t9XBlJXahg36j7KLMlDxkFqzzpM=;
	b=i7TJRfLl7aj0X9X6zXH2ueFAR3NjfwqEUb9p6y89WZ1nFetuhpBNPIgD003NzUsmM4A9CP
	Ynbqt/WaTRhdFx6BWWWHI4C6mNV2b3g5uy7+zwYgvb1FpOMwkMWiPs5GYeoxrDJXejpcke
	VVBp0+jYXKR0XDcvK17bFaHCIZsOlN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-e_e4HzaLNuaCIwtlCwMcMw-1; Mon, 21 Jun 2021 17:47:33 -0400
X-MC-Unique: e_e4HzaLNuaCIwtlCwMcMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96858100C61B;
	Mon, 21 Jun 2021 21:47:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A0A969CB4;
	Mon, 21 Jun 2021 21:47:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7797F4EA29;
	Mon, 21 Jun 2021 21:47:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15LLlU3q030983 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 17:47:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 686D85D705; Mon, 21 Jun 2021 21:47:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-65.rdu2.redhat.com
	[10.10.118.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AE5A5D6AD;
	Mon, 21 Jun 2021 21:47:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 21 Jun 2021 22:47:23 +0100
Message-ID: <162431204358.2908479.8006938388213098079.stgit@warthog.procyon.org.uk>
In-Reply-To: <162431188431.2908479.14031376932042135080.stgit@warthog.procyon.org.uk>
References: <162431188431.2908479.14031376932042135080.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH 12/12] fscache: Use refcount_t for the
 cookie refcount instead of atomic_t
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

Use refcount_t for the fscache_cookie refcount instead of atomic_t and
rename the 'usage' member to 'ref' in such cases.  The tracepoints that
reference it change from showing "u=%d" to "r=%d".

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/fscache/cache.c             |    2 +-
 fs/fscache/cookie.c            |   31 +++++++++++++++++++---------
 fs/fscache/fsdef.c             |    2 +-
 fs/fscache/internal.h          |   17 ++++++++-------
 include/linux/fscache.h        |    2 +-
 include/trace/events/fscache.h |   44 ++++++++++++++++++++--------------------
 6 files changed, 55 insertions(+), 43 deletions(-)

diff --git a/fs/fscache/cache.c b/fs/fscache/cache.c
index e7a5d7ab4085..bd4f44c1cce0 100644
--- a/fs/fscache/cache.c
+++ b/fs/fscache/cache.c
@@ -269,7 +269,7 @@ int fscache_add_cache(struct fscache_cache *cache,
 	hlist_add_head(&ifsdef->cookie_link,
 		       &fscache_fsdef_index.backing_objects);
 
-	atomic_inc(&fscache_fsdef_index.usage);
+	refcount_inc(&fscache_fsdef_index.ref);
 
 	/* done */
 	spin_unlock(&fscache_fsdef_index.lock);
diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 6df3732cf1b4..cd42be646ed3 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -164,7 +164,7 @@ struct fscache_cookie *fscache_alloc_cookie(
 			goto nomem;
 	}
 
-	atomic_set(&cookie->usage, 1);
+	refcount_set(&cookie->ref, 1);
 	atomic_set(&cookie->n_children, 0);
 	cookie->debug_id = atomic_inc_return(&fscache_cookie_debug_id);
 
@@ -225,7 +225,7 @@ struct fscache_cookie *fscache_hash_cookie(struct fscache_cookie *candidate)
 
 collision:
 	if (test_and_set_bit(FSCACHE_COOKIE_ACQUIRED, &cursor->flags)) {
-		trace_fscache_cookie(cursor->debug_id, atomic_read(&cursor->usage),
+		trace_fscache_cookie(cursor->debug_id, refcount_read(&cursor->ref),
 				     fscache_cookie_collision);
 		pr_err("Duplicate cookie detected\n");
 		fscache_print_cookie(cursor, 'O');
@@ -826,13 +826,12 @@ void __fscache_relinquish_cookie(struct fscache_cookie *cookie,
 	BUG_ON(!radix_tree_empty(&cookie->stores));
 
 	if (cookie->parent) {
-		ASSERTCMP(atomic_read(&cookie->parent->usage), >, 0);
+		ASSERTCMP(refcount_read(&cookie->parent->ref), >, 0);
 		ASSERTCMP(atomic_read(&cookie->parent->n_children), >, 0);
 		atomic_dec(&cookie->parent->n_children);
 	}
 
 	/* Dispose of the netfs's link to the cookie */
-	ASSERTCMP(atomic_read(&cookie->usage), >, 0);
 	fscache_cookie_put(cookie, fscache_cookie_put_relinquish);
 
 	_leave("");
@@ -862,18 +861,17 @@ void fscache_cookie_put(struct fscache_cookie *cookie,
 			enum fscache_cookie_trace where)
 {
 	struct fscache_cookie *parent;
-	int usage;
+	int ref;
 
 	_enter("%x", cookie->debug_id);
 
 	do {
 		unsigned int cookie_debug_id = cookie->debug_id;
-		usage = atomic_dec_return(&cookie->usage);
-		trace_fscache_cookie(cookie_debug_id, usage, where);
+		bool zero = __refcount_dec_and_test(&cookie->ref, &ref);
 
-		if (usage > 0)
+		trace_fscache_cookie(cookie_debug_id, ref - 1, where);
+		if (!zero)
 			return;
-		BUG_ON(usage < 0);
 
 		parent = cookie->parent;
 		fscache_unhash_cookie(cookie);
@@ -886,6 +884,19 @@ void fscache_cookie_put(struct fscache_cookie *cookie,
 	_leave("");
 }
 
+/*
+ * Get a reference to a cookie.
+ */
+struct fscache_cookie *fscache_cookie_get(struct fscache_cookie *cookie,
+					  enum fscache_cookie_trace where)
+{
+	int ref;
+
+	__refcount_inc(&cookie->ref, &ref);
+	trace_fscache_cookie(cookie->debug_id, ref + 1, where);
+	return cookie;
+}
+
 /*
  * check the consistency between the netfs inode and the backing cache
  *
@@ -1003,7 +1014,7 @@ static int fscache_cookies_seq_show(struct seq_file *m, void *v)
 		   "%08x %08x %5u %5u %3u %s %03lx %-16s %px",
 		   cookie->debug_id,
 		   cookie->parent ? cookie->parent->debug_id : 0,
-		   atomic_read(&cookie->usage),
+		   refcount_read(&cookie->ref),
 		   atomic_read(&cookie->n_children),
 		   atomic_read(&cookie->n_active),
 		   type,
diff --git a/fs/fscache/fsdef.c b/fs/fscache/fsdef.c
index 5f8f6fe243fe..0402673c680e 100644
--- a/fs/fscache/fsdef.c
+++ b/fs/fscache/fsdef.c
@@ -46,7 +46,7 @@ static struct fscache_cookie_def fscache_fsdef_index_def = {
 
 struct fscache_cookie fscache_fsdef_index = {
 	.debug_id	= 1,
-	.usage		= ATOMIC_INIT(1),
+	.ref		= REFCOUNT_INIT(1),
 	.n_active	= ATOMIC_INIT(1),
 	.lock		= __SPIN_LOCK_UNLOCKED(fscache_fsdef_index.lock),
 	.backing_objects = HLIST_HEAD_INIT,
diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index 345105dbbfd1..c3e4804b8fcb 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -54,9 +54,18 @@ extern struct fscache_cookie *fscache_alloc_cookie(struct fscache_cookie *,
 						   const void *, size_t,
 						   void *, loff_t);
 extern struct fscache_cookie *fscache_hash_cookie(struct fscache_cookie *);
+extern struct fscache_cookie *fscache_cookie_get(struct fscache_cookie *,
+						 enum fscache_cookie_trace);
 extern void fscache_cookie_put(struct fscache_cookie *,
 			       enum fscache_cookie_trace);
 
+static inline void fscache_cookie_see(struct fscache_cookie *cookie,
+				      enum fscache_cookie_trace where)
+{
+	trace_fscache_cookie(cookie->debug_id, refcount_read(&cookie->ref),
+			     where);
+}
+
 /*
  * fsdef.c
  */
@@ -286,14 +295,6 @@ static inline void fscache_raise_event(struct fscache_object *object,
 		fscache_enqueue_object(object);
 }
 
-static inline void fscache_cookie_get(struct fscache_cookie *cookie,
-				      enum fscache_cookie_trace where)
-{
-	int usage = atomic_inc_return(&cookie->usage);
-
-	trace_fscache_cookie(cookie->debug_id, usage, where);
-}
-
 /*
  * get an extra reference to a netfs retrieval context
  */
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index ea61e54a6bc5..a4dab5998613 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -123,7 +123,7 @@ struct fscache_netfs {
  * - indices are created on disk just-in-time
  */
 struct fscache_cookie {
-	atomic_t			usage;		/* number of users of this cookie */
+	refcount_t			ref;		/* number of users of this cookie */
 	atomic_t			n_children;	/* number of children of this cookie */
 	atomic_t			n_active;	/* number of active users of netfs ptrs */
 	unsigned int			debug_id;
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index 55b8802740fa..51f2b492b9eb 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -161,26 +161,26 @@ fscache_cookie_traces;
 
 TRACE_EVENT(fscache_cookie,
 	    TP_PROTO(unsigned int cookie_debug_id,
-		     int usage,
+		     int ref,
 		     enum fscache_cookie_trace where),
 
-	    TP_ARGS(cookie_debug_id, usage, where),
+	    TP_ARGS(cookie_debug_id, ref, where),
 
 	    TP_STRUCT__entry(
 		    __field(unsigned int,		cookie		)
 		    __field(enum fscache_cookie_trace,	where		)
-		    __field(int,			usage		)
+		    __field(int,			ref		)
 			     ),
 
 	    TP_fast_assign(
 		    __entry->cookie	= cookie_debug_id;
 		    __entry->where	= where;
-		    __entry->usage	= usage;
+		    __entry->ref	= ref;
 			   ),
 
-	    TP_printk("%s c=%08x u=%d",
+	    TP_printk("%s c=%08x r=%d",
 		      __print_symbolic(__entry->where, fscache_cookie_traces),
-		      __entry->cookie, __entry->usage)
+		      __entry->cookie, __entry->ref)
 	    );
 
 TRACE_EVENT(fscache_netfs,
@@ -212,7 +212,7 @@ TRACE_EVENT(fscache_acquire,
 		    __field(unsigned int,		cookie		)
 		    __field(unsigned int,		parent		)
 		    __array(char,			name, 8		)
-		    __field(int,			p_usage		)
+		    __field(int,			p_ref		)
 		    __field(int,			p_n_children	)
 		    __field(u8,				p_flags		)
 			     ),
@@ -220,15 +220,15 @@ TRACE_EVENT(fscache_acquire,
 	    TP_fast_assign(
 		    __entry->cookie		= cookie->debug_id;
 		    __entry->parent		= cookie->parent->debug_id;
-		    __entry->p_usage		= atomic_read(&cookie->parent->usage);
+		    __entry->p_ref		= refcount_read(&cookie->parent->ref);
 		    __entry->p_n_children	= atomic_read(&cookie->parent->n_children);
 		    __entry->p_flags		= cookie->parent->flags;
 		    memcpy(__entry->name, cookie->def->name, 8);
 		    __entry->name[7]		= 0;
 			   ),
 
-	    TP_printk("c=%08x p=%08x pu=%d pc=%d pf=%02x n=%s",
-		      __entry->cookie, __entry->parent, __entry->p_usage,
+	    TP_printk("c=%08x p=%08x pr=%d pc=%d pf=%02x n=%s",
+		      __entry->cookie, __entry->parent, __entry->p_ref,
 		      __entry->p_n_children, __entry->p_flags, __entry->name)
 	    );
 
@@ -240,7 +240,7 @@ TRACE_EVENT(fscache_relinquish,
 	    TP_STRUCT__entry(
 		    __field(unsigned int,		cookie		)
 		    __field(unsigned int,		parent		)
-		    __field(int,			usage		)
+		    __field(int,			ref		)
 		    __field(int,			n_children	)
 		    __field(int,			n_active	)
 		    __field(u8,				flags		)
@@ -250,15 +250,15 @@ TRACE_EVENT(fscache_relinquish,
 	    TP_fast_assign(
 		    __entry->cookie	= cookie->debug_id;
 		    __entry->parent	= cookie->parent->debug_id;
-		    __entry->usage	= atomic_read(&cookie->usage);
+		    __entry->ref	= refcount_read(&cookie->ref);
 		    __entry->n_children	= atomic_read(&cookie->n_children);
 		    __entry->n_active	= atomic_read(&cookie->n_active);
 		    __entry->flags	= cookie->flags;
 		    __entry->retire	= retire;
 			   ),
 
-	    TP_printk("c=%08x u=%d p=%08x Nc=%d Na=%d f=%02x r=%u",
-		      __entry->cookie, __entry->usage,
+	    TP_printk("c=%08x r=%d p=%08x Nc=%d Na=%d f=%02x r=%u",
+		      __entry->cookie, __entry->ref,
 		      __entry->parent, __entry->n_children, __entry->n_active,
 		      __entry->flags, __entry->retire)
 	    );
@@ -270,7 +270,7 @@ TRACE_EVENT(fscache_enable,
 
 	    TP_STRUCT__entry(
 		    __field(unsigned int,		cookie		)
-		    __field(int,			usage		)
+		    __field(int,			ref		)
 		    __field(int,			n_children	)
 		    __field(int,			n_active	)
 		    __field(u8,				flags		)
@@ -278,14 +278,14 @@ TRACE_EVENT(fscache_enable,
 
 	    TP_fast_assign(
 		    __entry->cookie	= cookie->debug_id;
-		    __entry->usage	= atomic_read(&cookie->usage);
+		    __entry->ref	= refcount_read(&cookie->ref);
 		    __entry->n_children	= atomic_read(&cookie->n_children);
 		    __entry->n_active	= atomic_read(&cookie->n_active);
 		    __entry->flags	= cookie->flags;
 			   ),
 
-	    TP_printk("c=%08x u=%d Nc=%d Na=%d f=%02x",
-		      __entry->cookie, __entry->usage,
+	    TP_printk("c=%08x r=%d Nc=%d Na=%d f=%02x",
+		      __entry->cookie, __entry->ref,
 		      __entry->n_children, __entry->n_active, __entry->flags)
 	    );
 
@@ -296,7 +296,7 @@ TRACE_EVENT(fscache_disable,
 
 	    TP_STRUCT__entry(
 		    __field(unsigned int,		cookie		)
-		    __field(int,			usage		)
+		    __field(int,			ref		)
 		    __field(int,			n_children	)
 		    __field(int,			n_active	)
 		    __field(u8,				flags		)
@@ -304,14 +304,14 @@ TRACE_EVENT(fscache_disable,
 
 	    TP_fast_assign(
 		    __entry->cookie	= cookie->debug_id;
-		    __entry->usage	= atomic_read(&cookie->usage);
+		    __entry->ref	= refcount_read(&cookie->ref);
 		    __entry->n_children	= atomic_read(&cookie->n_children);
 		    __entry->n_active	= atomic_read(&cookie->n_active);
 		    __entry->flags	= cookie->flags;
 			   ),
 
-	    TP_printk("c=%08x u=%d Nc=%d Na=%d f=%02x",
-		      __entry->cookie, __entry->usage,
+	    TP_printk("c=%08x r=%d Nc=%d Na=%d f=%02x",
+		      __entry->cookie, __entry->ref,
 		      __entry->n_children, __entry->n_active, __entry->flags)
 	    );
 


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

