Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4573AF7F0
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Jun 2021 23:47:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624312043;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+hGXGLFxMNzCU5LOXiXQlMcqlC5zqVNI+JprZNLPrkI=;
	b=S+C3QB8ZRTJoNlKUyqrHLe90UAhpWmKtU3R86kx7+khsfEs4NMzApzlym7Y6BqOsI1Pbg8
	zLgqUrDk1qSZZUtU71hz0Cv+u0SKvSNiFmgDjIgXGlmr01n2h2wgNTTbH8UHrU2N99AO64
	hH9r3CLdVb4Nvbwehb1d/MNGSxwnKVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-ktQ2j-5oNxa_f5uIwy6dPQ-1; Mon, 21 Jun 2021 17:47:21 -0400
X-MC-Unique: ktQ2j-5oNxa_f5uIwy6dPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A439F10C1ADC;
	Mon, 21 Jun 2021 21:47:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9857C69CB9;
	Mon, 21 Jun 2021 21:47:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8352E4A712;
	Mon, 21 Jun 2021 21:47:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15LLlInP030957 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 17:47:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 551B660C58; Mon, 21 Jun 2021 21:47:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-65.rdu2.redhat.com
	[10.10.118.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF753608BA;
	Mon, 21 Jun 2021 21:47:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 21 Jun 2021 22:47:11 +0100
Message-ID: <162431203107.2908479.3259582550347000088.stgit@warthog.procyon.org.uk>
In-Reply-To: <162431188431.2908479.14031376932042135080.stgit@warthog.procyon.org.uk>
References: <162431188431.2908479.14031376932042135080.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH 11/12] fscache: Fix fscache_cookie_put() to
 not deref after dec
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

fscache_cookie_put() accesses the cookie it has just put inside the
tracepoint that monitors the change - but this is something it's not
allowed to do if we didn't reduce the count to zero.

Fix this by dropping most of those values from the tracepoint and grabbing
the cookie debug ID before doing the dec.

Also take the opportunity to switch over the usage and where arguments on
the tracepoint to put the reason last.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/fscache/cookie.c            |   10 ++++++----
 fs/fscache/internal.h          |    2 +-
 fs/fscache/netfs.c             |    2 +-
 include/trace/events/fscache.h |   24 +++++++-----------------
 4 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 2558814193e9..6df3732cf1b4 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -225,8 +225,8 @@ struct fscache_cookie *fscache_hash_cookie(struct fscache_cookie *candidate)
 
 collision:
 	if (test_and_set_bit(FSCACHE_COOKIE_ACQUIRED, &cursor->flags)) {
-		trace_fscache_cookie(cursor, fscache_cookie_collision,
-				     atomic_read(&cursor->usage));
+		trace_fscache_cookie(cursor->debug_id, atomic_read(&cursor->usage),
+				     fscache_cookie_collision);
 		pr_err("Duplicate cookie detected\n");
 		fscache_print_cookie(cursor, 'O');
 		fscache_print_cookie(candidate, 'N');
@@ -305,7 +305,8 @@ struct fscache_cookie *__fscache_acquire_cookie(
 
 	cookie = fscache_hash_cookie(candidate);
 	if (!cookie) {
-		trace_fscache_cookie(candidate, fscache_cookie_discard, 1);
+		trace_fscache_cookie(candidate->debug_id, 1,
+				     fscache_cookie_discard);
 		goto out;
 	}
 
@@ -866,8 +867,9 @@ void fscache_cookie_put(struct fscache_cookie *cookie,
 	_enter("%x", cookie->debug_id);
 
 	do {
+		unsigned int cookie_debug_id = cookie->debug_id;
 		usage = atomic_dec_return(&cookie->usage);
-		trace_fscache_cookie(cookie, where, usage);
+		trace_fscache_cookie(cookie_debug_id, usage, where);
 
 		if (usage > 0)
 			return;
diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index a49136c63e4b..345105dbbfd1 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -291,7 +291,7 @@ static inline void fscache_cookie_get(struct fscache_cookie *cookie,
 {
 	int usage = atomic_inc_return(&cookie->usage);
 
-	trace_fscache_cookie(cookie, where, usage);
+	trace_fscache_cookie(cookie->debug_id, usage, where);
 }
 
 /*
diff --git a/fs/fscache/netfs.c b/fs/fscache/netfs.c
index cce92216fa28..d6bdb7b5e723 100644
--- a/fs/fscache/netfs.c
+++ b/fs/fscache/netfs.c
@@ -37,7 +37,7 @@ int __fscache_register_netfs(struct fscache_netfs *netfs)
 	if (!cookie)
 		goto already_registered;
 	if (cookie != candidate) {
-		trace_fscache_cookie(candidate, fscache_cookie_discard, 1);
+		trace_fscache_cookie(candidate->debug_id, 1, fscache_cookie_discard);
 		fscache_free_cookie(candidate);
 	}
 
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index 0b9e058aba4d..55b8802740fa 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -160,37 +160,27 @@ fscache_cookie_traces;
 
 
 TRACE_EVENT(fscache_cookie,
-	    TP_PROTO(struct fscache_cookie *cookie,
-		     enum fscache_cookie_trace where,
-		     int usage),
+	    TP_PROTO(unsigned int cookie_debug_id,
+		     int usage,
+		     enum fscache_cookie_trace where),
 
-	    TP_ARGS(cookie, where, usage),
+	    TP_ARGS(cookie_debug_id, usage, where),
 
 	    TP_STRUCT__entry(
 		    __field(unsigned int,		cookie		)
-		    __field(unsigned int,		parent		)
 		    __field(enum fscache_cookie_trace,	where		)
 		    __field(int,			usage		)
-		    __field(int,			n_children	)
-		    __field(int,			n_active	)
-		    __field(u8,				flags		)
 			     ),
 
 	    TP_fast_assign(
-		    __entry->cookie	= cookie->debug_id;
-		    __entry->parent	= cookie->parent ? cookie->parent->debug_id : 0;
+		    __entry->cookie	= cookie_debug_id;
 		    __entry->where	= where;
 		    __entry->usage	= usage;
-		    __entry->n_children	= atomic_read(&cookie->n_children);
-		    __entry->n_active	= atomic_read(&cookie->n_active);
-		    __entry->flags	= cookie->flags;
 			   ),
 
-	    TP_printk("%s c=%08x u=%d p=%08x Nc=%d Na=%d f=%02x",
+	    TP_printk("%s c=%08x u=%d",
 		      __print_symbolic(__entry->where, fscache_cookie_traces),
-		      __entry->cookie, __entry->usage,
-		      __entry->parent, __entry->n_children, __entry->n_active,
-		      __entry->flags)
+		      __entry->cookie, __entry->usage)
 	    );
 
 TRACE_EVENT(fscache_netfs,


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

