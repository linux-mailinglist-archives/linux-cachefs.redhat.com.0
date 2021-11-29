Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2090346186B
	for <lists+linux-cachefs@lfdr.de>; Mon, 29 Nov 2021 15:28:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638196089;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mecV1jLO9uk7r7Swv/Zi7jLMQru0d/aZkSI9SbfA/zs=;
	b=Y6rD2azM1ZozTsIrxaHmMywYGWKGyprKxKRAYel0V6pM+XxaFHfuMkiusvU8Gy28P27eQW
	ueTThgxUgfA1/KeMP64qnGZW7n83BWzTpkn/YuATxcnB57qMG6z5IIoCwiFAPk3jK17e/D
	PqRhorqdLPJCqCOIKDZNmwPk9nz+pss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-105-SvN1zlnYM7uezZHFdLCIXA-1; Mon, 29 Nov 2021 09:28:05 -0500
X-MC-Unique: SvN1zlnYM7uezZHFdLCIXA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E3E71015DA6;
	Mon, 29 Nov 2021 14:28:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40A90100EBC1;
	Mon, 29 Nov 2021 14:28:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 021294BB7C;
	Mon, 29 Nov 2021 14:28:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ATES0qR000568 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 29 Nov 2021 09:28:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B15F67ACE2; Mon, 29 Nov 2021 14:28:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B970E72FA9;
	Mon, 29 Nov 2021 14:27:17 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 29 Nov 2021 14:27:16 +0000
Message-ID: <163819603692.215744.146724961588817028.stgit@warthog.procyon.org.uk>
In-Reply-To: <163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
References: <163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Subject: [Linux-cachefs] [PATCH 20/64] fscache: Provide a means to begin an
	operation
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

Provide a function to begin a read operation:

	int fscache_begin_read_operation(
		struct netfs_cache_resources *cres,
		struct fscache_cookie *cookie)

This is primarily intended to be called by network filesystems on behalf of
netfslib, but may also be called to use the I/O access functions directly.
It attaches the resources required by the cache to cres struct from the
supplied cookie.

This holds access to the cache behind the cookie for the duration of the
operation and forces cache withdrawal and cookie invalidation to perform
synchronisation on the operation.  cres->inval_counter is set from the
cookie at this point so that it can be compared at the end of the
operation.

Note that this does not guarantee that the cache state is fully set up and
able to perform I/O immediately; looking up and creation may be left in
progress in the background.  The operations intended to be called by the
network filesystem, such as reading and writing, are expected to wait for
the cookie to move to the correct state.

This will, however, potentially sleep, waiting for a certain minimum state
to be set or for operations such as invalidate to advance far enough that
I/O can resume.


Also provide a function for the cache to call to wait for the cache object
to get to a state where it can be used for certain things:

	bool fscache_wait_for_operation(struct netfs_cache_resources *cres,
					enum fscache_want_stage stage);

This looks at the cache resources provided by the begin function and waits
for them to get to an appropriate stage.  There's a choice of wanting just
some parameters (FSCACHE_WANT_PARAM) or the ability to do I/O
(FSCACHE_WANT_READ or FSCACHE_WANT_WRITE).

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/fscache/Makefile            |    1 
 fs/fscache/internal.h          |   11 +++
 fs/fscache/io.c                |  151 ++++++++++++++++++++++++++++++++++++++++
 include/linux/fscache-cache.h  |   11 +++
 include/linux/fscache.h        |   49 +++++++++++++
 include/trace/events/fscache.h |    6 ++
 6 files changed, 229 insertions(+)
 create mode 100644 fs/fscache/io.c

diff --git a/fs/fscache/Makefile b/fs/fscache/Makefile
index bcc79615f93a..afb090ea16c4 100644
--- a/fs/fscache/Makefile
+++ b/fs/fscache/Makefile
@@ -6,6 +6,7 @@
 fscache-y := \
 	cache.o \
 	cookie.o \
+	io.o \
 	main.o \
 	volume.o
 
diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index e4f3a1a993f6..1308bfff94fb 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -70,6 +70,17 @@ static inline void fscache_see_cookie(struct fscache_cookie *cookie,
 			     where);
 }
 
+/*
+ * io.c
+ */
+static inline void fscache_end_operation(struct netfs_cache_resources *cres)
+{
+	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
+
+	if (ops)
+		ops->end_operation(cres);
+}
+
 /*
  * main.c
  */
diff --git a/fs/fscache/io.c b/fs/fscache/io.c
new file mode 100644
index 000000000000..460a43473019
--- /dev/null
+++ b/fs/fscache/io.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Cache data I/O routines
+ *
+ * Copyright (C) 2021 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+#define FSCACHE_DEBUG_LEVEL OPERATION
+#include <linux/fscache-cache.h>
+#include <linux/uio.h>
+#include <linux/bvec.h>
+#include <linux/slab.h>
+#include <linux/uio.h>
+#include "internal.h"
+
+/**
+ * fscache_wait_for_operation - Wait for an object become accessible
+ * @cres: The cache resources for the operation being performed
+ * @want_state: The minimum state the object must be at
+ *
+ * See if the target cache object is at the specified minimum state of
+ * accessibility yet, and if not, wait for it.
+ */
+bool fscache_wait_for_operation(struct netfs_cache_resources *cres,
+				enum fscache_want_state want_state)
+{
+	struct fscache_cookie *cookie = fscache_cres_cookie(cres);
+	enum fscache_cookie_state state;
+
+again:
+	if (!fscache_cache_is_live(cookie->volume->cache)) {
+		_leave(" [broken]");
+		return false;
+	}
+
+	state = fscache_cookie_state(cookie);
+	_enter("c=%08x{%u},%x", cookie->debug_id, state, want_state);
+
+	switch (state) {
+	case FSCACHE_COOKIE_STATE_CREATING:
+	case FSCACHE_COOKIE_STATE_INVALIDATING:
+		if (want_state == FSCACHE_WANT_PARAMS)
+			goto ready; /* There can be no content */
+		fallthrough;
+	case FSCACHE_COOKIE_STATE_LOOKING_UP:
+	case FSCACHE_COOKIE_STATE_LRU_DISCARDING:
+		wait_var_event(&cookie->state,
+			       fscache_cookie_state(cookie) != state);
+		goto again;
+
+	case FSCACHE_COOKIE_STATE_ACTIVE:
+		goto ready;
+	case FSCACHE_COOKIE_STATE_DROPPED:
+	case FSCACHE_COOKIE_STATE_RELINQUISHING:
+	default:
+		_leave(" [not live]");
+		return false;
+	}
+
+ready:
+	if (!cres->cache_priv2)
+		return cookie->volume->cache->ops->begin_operation(cres, want_state);
+	return true;
+}
+EXPORT_SYMBOL(fscache_wait_for_operation);
+
+/*
+ * Begin an I/O operation on the cache, waiting till we reach the right state.
+ *
+ * Attaches the resources required to the operation resources record.
+ */
+static int fscache_begin_operation(struct netfs_cache_resources *cres,
+				   struct fscache_cookie *cookie,
+				   enum fscache_want_state want_state,
+				   enum fscache_access_trace why)
+{
+	enum fscache_cookie_state state;
+	long timeo;
+	bool once_only = false;
+
+	cres->ops		= NULL;
+	cres->cache_priv	= cookie;
+	cres->cache_priv2	= NULL;
+	cres->debug_id		= cookie->debug_id;
+	cres->inval_counter	= cookie->inval_counter;
+
+	if (!fscache_begin_cookie_access(cookie, why))
+		return -ENOBUFS;
+
+again:
+	spin_lock(&cookie->lock);
+
+	state = fscache_cookie_state(cookie);
+	_enter("c=%08x{%u},%x", cookie->debug_id, state, want_state);
+
+	switch (state) {
+	case FSCACHE_COOKIE_STATE_LOOKING_UP:
+	case FSCACHE_COOKIE_STATE_LRU_DISCARDING:
+	case FSCACHE_COOKIE_STATE_INVALIDATING:
+		goto wait_for_file_wrangling;
+	case FSCACHE_COOKIE_STATE_CREATING:
+		if (want_state == FSCACHE_WANT_PARAMS)
+			goto ready; /* There can be no content */
+		goto wait_for_file_wrangling;
+	case FSCACHE_COOKIE_STATE_ACTIVE:
+		goto ready;
+	case FSCACHE_COOKIE_STATE_DROPPED:
+	case FSCACHE_COOKIE_STATE_RELINQUISHING:
+		WARN(1, "Can't use cookie in state %u\n", cookie->state);
+		goto not_live;
+	default:
+		goto not_live;
+	}
+
+ready:
+	spin_unlock(&cookie->lock);
+	if (!cookie->volume->cache->ops->begin_operation(cres, want_state))
+		goto failed;
+	return 0;
+
+wait_for_file_wrangling:
+	spin_unlock(&cookie->lock);
+	trace_fscache_access(cookie->debug_id, refcount_read(&cookie->ref),
+			     atomic_read(&cookie->n_accesses),
+			     fscache_access_io_wait);
+	timeo = wait_var_event_timeout(&cookie->state,
+				       fscache_cookie_state(cookie) != state, 20 * HZ);
+	if (timeo <= 1 && !once_only) {
+		pr_warn("%s: cookie state change wait timed out: cookie->state=%u state=%u",
+			__func__, fscache_cookie_state(cookie), state);
+		fscache_print_cookie(cookie, 'O');
+		once_only = true;
+	}
+	goto again;
+
+not_live:
+	spin_unlock(&cookie->lock);
+failed:
+	cres->cache_priv = NULL;
+	cres->ops = NULL;
+	fscache_end_cookie_access(cookie, fscache_access_io_not_live);
+	_leave(" = -ENOBUFS");
+	return -ENOBUFS;
+}
+
+int __fscache_begin_read_operation(struct netfs_cache_resources *cres,
+				   struct fscache_cookie *cookie)
+{
+	return fscache_begin_operation(cres, cookie, FSCACHE_WANT_PARAMS,
+				       fscache_access_io_read);
+}
+EXPORT_SYMBOL(__fscache_begin_read_operation);
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index 1ad56bfd9d72..566497cf5f13 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -67,6 +67,10 @@ struct fscache_cache_ops {
 	/* Invalidate an object */
 	bool (*invalidate_cookie)(struct fscache_cookie *cookie);
 
+	/* Begin an operation for the netfs lib */
+	bool (*begin_operation)(struct netfs_cache_resources *cres,
+				enum fscache_want_state want_state);
+
 	/* Prepare to write to a live cache object */
 	void (*prepare_to_write)(struct fscache_cookie *cookie);
 };
@@ -101,6 +105,8 @@ extern void fscache_end_cookie_access(struct fscache_cookie *cookie,
 extern void fscache_cookie_lookup_negative(struct fscache_cookie *cookie);
 extern void fscache_resume_after_invalidation(struct fscache_cookie *cookie);
 extern void fscache_caching_failed(struct fscache_cookie *cookie);
+extern bool fscache_wait_for_operation(struct netfs_cache_resources *cred,
+				       enum fscache_want_state state);
 
 /**
  * fscache_cookie_state - Read the state of a cookie
@@ -129,4 +135,9 @@ static inline void *fscache_get_key(struct fscache_cookie *cookie)
 		return cookie->key;
 }
 
+static inline struct fscache_cookie *fscache_cres_cookie(struct netfs_cache_resources *cres)
+{
+	return cres->cache_priv;
+}
+
 #endif /* _LINUX_FSCACHE_CACHE_H */
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index cfbace3bdc88..b60be20107e1 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -41,6 +41,12 @@ struct fscache_cookie;
 
 #define FSCACHE_INVAL_DIO_WRITE		0x01 /* Invalidate due to DIO write */
 
+enum fscache_want_state {
+	FSCACHE_WANT_PARAMS,
+	FSCACHE_WANT_WRITE,
+	FSCACHE_WANT_READ,
+};
+
 /*
  * Data object state.
  */
@@ -156,6 +162,7 @@ extern void __fscache_use_cookie(struct fscache_cookie *, bool);
 extern void __fscache_unuse_cookie(struct fscache_cookie *, const void *, const loff_t *);
 extern void __fscache_relinquish_cookie(struct fscache_cookie *, bool);
 extern void __fscache_invalidate(struct fscache_cookie *, const void *, loff_t, unsigned int);
+extern int __fscache_begin_read_operation(struct netfs_cache_resources *, struct fscache_cookie *);
 
 /**
  * fscache_acquire_volume - Register a volume as desiring caching services
@@ -350,4 +357,46 @@ void fscache_invalidate(struct fscache_cookie *cookie,
 		__fscache_invalidate(cookie, aux_data, size, flags);
 }
 
+/**
+ * fscache_operation_valid - Return true if operations resources are usable
+ * @cres: The resources to check.
+ *
+ * Returns a pointer to the operations table if usable or NULL if not.
+ */
+static inline
+const struct netfs_cache_ops *fscache_operation_valid(const struct netfs_cache_resources *cres)
+{
+	return fscache_resources_valid(cres) ? cres->ops : NULL;
+}
+
+/**
+ * fscache_begin_read_operation - Begin a read operation for the netfs lib
+ * @cres: The cache resources for the read being performed
+ * @cookie: The cookie representing the cache object
+ *
+ * Begin a read operation on behalf of the netfs helper library.  @cres
+ * indicates the cache resources to which the operation state should be
+ * attached; @cookie indicates the cache object that will be accessed.
+ *
+ * This is intended to be called from the ->begin_cache_operation() netfs lib
+ * operation as implemented by the network filesystem.
+ *
+ * @cres->inval_counter is set from @cookie->inval_counter for comparison at
+ * the end of the operation.  This allows invalidation during the operation to
+ * be detected by the caller.
+ *
+ * Returns:
+ * * 0		- Success
+ * * -ENOBUFS	- No caching available
+ * * Other error code from the cache, such as -ENOMEM.
+ */
+static inline
+int fscache_begin_read_operation(struct netfs_cache_resources *cres,
+				 struct fscache_cookie *cookie)
+{
+	if (fscache_cookie_enabled(cookie))
+		return __fscache_begin_read_operation(cres, cookie);
+	return -ENOBUFS;
+}
+
 #endif /* _LINUX_FSCACHE_H */
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index 5f88479fb06a..d8a8c56eb5d6 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -76,6 +76,9 @@ enum fscache_access_trace {
 	fscache_access_cache_unpin,
 	fscache_access_invalidate_cookie,
 	fscache_access_invalidate_cookie_end,
+	fscache_access_io_not_live,
+	fscache_access_io_read,
+	fscache_access_io_wait,
 	fscache_access_lookup_cookie,
 	fscache_access_lookup_cookie_end,
 	fscache_access_lookup_cookie_end_failed,
@@ -143,6 +146,9 @@ enum fscache_access_trace {
 	EM(fscache_access_cache_unpin,		"UNPIN cache  ")	\
 	EM(fscache_access_invalidate_cookie,	"BEGIN inval  ")	\
 	EM(fscache_access_invalidate_cookie_end,"END   inval  ")	\
+	EM(fscache_access_io_not_live,		"END   io_notl")	\
+	EM(fscache_access_io_read,		"BEGIN io_read")	\
+	EM(fscache_access_io_wait,		"WAIT  io     ")	\
 	EM(fscache_access_lookup_cookie,	"BEGIN lookup ")	\
 	EM(fscache_access_lookup_cookie_end,	"END   lookup ")	\
 	EM(fscache_access_lookup_cookie_end_failed,"END   lookupf")	\


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

