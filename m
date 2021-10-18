Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA9143213E
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 17:00:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569232;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cliRkNyt4LDD4CUILAH+R1Np/0zh6x2lAN637nvokHs=;
	b=VTgnvVJPdMujU7iiaJKf0ahuYeTJihKXAhQd63Ws5CoOe94bqSbEGPRMo31vL8xhiaXKua
	UyccJcwt5UlATEemPlIhEkst1mvqo16NrKJ+ca348hU/dmav/gfSBxR/PjIJDwiZzL+vOi
	Ez44xDLa0jAV1/ObrmtJsHCMIAZFauA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-fw4QnqEzNZmOLLzxSZ5Npw-1; Mon, 18 Oct 2021 11:00:28 -0400
X-MC-Unique: fw4QnqEzNZmOLLzxSZ5Npw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A315802575;
	Mon, 18 Oct 2021 15:00:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9F754180;
	Mon, 18 Oct 2021 15:00:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B68F4EA2F;
	Mon, 18 Oct 2021 15:00:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IF0Nv1029103 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 11:00:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AAA466FEED; Mon, 18 Oct 2021 15:00:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73D9360D30;
	Mon, 18 Oct 2021 15:00:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 16:00:19 +0100
Message-ID: <163456921953.2614702.8851027265019457749.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Subject: [Linux-cachefs] [PATCH 37/67] fscache: Move fscache_update_cookie()
	complete inline
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


---

 fs/fscache/cookie.c           |   18 -----------------
 fs/fscache/internal.h         |   18 -----------------
 fs/fscache/stats.c            |    9 +++------
 include/linux/fscache-cache.h |   11 ----------
 include/linux/fscache.h       |   43 ++++++++++++++++++++++++++++++++++++++++-
 5 files changed, 45 insertions(+), 54 deletions(-)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index c6b553609f33..94976f90dc71 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -748,24 +748,6 @@ void __fscache_invalidate(struct fscache_cookie *cookie)
 }
 EXPORT_SYMBOL(__fscache_invalidate);
 
-/*
- * Update the index entries backing a cookie.  The writeback is done lazily.
- */
-void __fscache_update_cookie(struct fscache_cookie *cookie,
-			     const void *aux_data, const loff_t *object_size)
-{
-	fscache_stat(&fscache_n_updates);
-
-	spin_lock(&cookie->lock);
-
-	fscache_update_aux(cookie, aux_data, object_size);
-	set_bit(FSCACHE_COOKIE_NEEDS_UPDATE, &cookie->flags);
-
-	spin_unlock(&cookie->lock);
-	_leave("");
-}
-EXPORT_SYMBOL(__fscache_update_cookie);
-
 /*
  * Remove a cookie from the hash table.
  */
diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index 62e6a5bbef8e..1cb1effa7cba 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -107,10 +107,6 @@ extern atomic_t fscache_n_acquires_oom;
 extern atomic_t fscache_n_invalidates;
 extern atomic_t fscache_n_invalidates_run;
 
-extern atomic_t fscache_n_updates;
-extern atomic_t fscache_n_updates_null;
-extern atomic_t fscache_n_updates_run;
-
 extern atomic_t fscache_n_relinquishes;
 extern atomic_t fscache_n_relinquishes_null;
 extern atomic_t fscache_n_relinquishes_retire;
@@ -152,20 +148,6 @@ bool fscache_begin_volume_access(struct fscache_volume *volume,
 				 enum fscache_access_trace why);
 void fscache_create_volume(struct fscache_volume *volume, bool wait);
 
-/*
- * Update the auxiliary data on a cookie.
- */
-static inline
-void fscache_update_aux(struct fscache_cookie *cookie,
-			const void *aux_data, const loff_t *object_size)
-{
-	void *p = fscache_get_aux(cookie);
-
-	if (aux_data && p)
-		memcpy(p, aux_data, cookie->aux_len);
-	if (object_size)
-		cookie->object_size = *object_size;
-}
 
 /*****************************************************************************/
 /*
diff --git a/fs/fscache/stats.c b/fs/fscache/stats.c
index 5700e5712018..a16473df8be0 100644
--- a/fs/fscache/stats.c
+++ b/fs/fscache/stats.c
@@ -55,8 +55,7 @@ atomic_t fscache_n_invalidates;
 atomic_t fscache_n_invalidates_run;
 
 atomic_t fscache_n_updates;
-atomic_t fscache_n_updates_null;
-atomic_t fscache_n_updates_run;
+EXPORT_SYMBOL(fscache_n_updates);
 
 atomic_t fscache_n_relinquishes;
 atomic_t fscache_n_relinquishes_null;
@@ -105,10 +104,8 @@ int fscache_stats_show(struct seq_file *m, void *v)
 		   atomic_read(&fscache_n_invalidates),
 		   atomic_read(&fscache_n_invalidates_run));
 
-	seq_printf(m, "Updates: n=%u nul=%u run=%u\n",
-		   atomic_read(&fscache_n_updates),
-		   atomic_read(&fscache_n_updates_null),
-		   atomic_read(&fscache_n_updates_run));
+	seq_printf(m, "Updates: n=%u\n",
+		   atomic_read(&fscache_n_updates));
 
 	seq_printf(m, "Relinqs: n=%u rtr=%u drop=%u\n",
 		   atomic_read(&fscache_n_relinquishes),
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index 657e54b4cd90..bf0d3e862915 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -139,17 +139,6 @@ static inline void *fscache_get_key(struct fscache_cookie *cookie)
 		return cookie->key;
 }
 
-/*
- * Find the auxiliary data on a cookie.
- */
-static inline void *fscache_get_aux(struct fscache_cookie *cookie)
-{
-	if (cookie->aux_len <= sizeof(cookie->inline_aux))
-		return cookie->inline_aux;
-	else
-		return cookie->aux;
-}
-
 /**
  * fscache_cookie_lookup_negative - Note negative lookup
  * @cookie: The cookie that was being looked up
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index c6ee09661351..41e579ff65ee 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -159,7 +159,6 @@ extern struct fscache_cookie *__fscache_acquire_cookie(
 extern void __fscache_use_cookie(struct fscache_cookie *, bool);
 extern void __fscache_unuse_cookie(struct fscache_cookie *, const void *, const loff_t *);
 extern void __fscache_relinquish_cookie(struct fscache_cookie *, bool);
-extern void __fscache_update_cookie(struct fscache_cookie *, const void *, const loff_t *);
 extern void __fscache_invalidate(struct fscache_cookie *);
 #ifdef FSCACHE_USE_NEW_IO_API
 extern int __fscache_begin_read_operation(struct netfs_cache_resources *, struct fscache_cookie *);
@@ -293,6 +292,48 @@ void fscache_relinquish_cookie(struct fscache_cookie *cookie, bool retire)
 		__fscache_relinquish_cookie(cookie, retire);
 }
 
+/*
+ * Find the auxiliary data on a cookie.
+ */
+static inline void *fscache_get_aux(struct fscache_cookie *cookie)
+{
+	if (cookie->aux_len <= sizeof(cookie->inline_aux))
+		return cookie->inline_aux;
+	else
+		return cookie->aux;
+}
+
+/*
+ * Update the auxiliary data on a cookie.
+ */
+static inline
+void fscache_update_aux(struct fscache_cookie *cookie,
+			const void *aux_data, const loff_t *object_size)
+{
+	void *p = fscache_get_aux(cookie);
+
+	if (aux_data && p)
+		memcpy(p, aux_data, cookie->aux_len);
+	if (object_size)
+		cookie->object_size = *object_size;
+}
+
+#ifdef CONFIG_FSCACHE_STATS
+extern atomic_t fscache_n_updates;
+#endif
+
+static inline
+void __fscache_update_cookie(struct fscache_cookie *cookie, const void *aux_data,
+			     const loff_t *object_size)
+{
+#ifdef CONFIG_FSCACHE_STATS
+	atomic_inc(&fscache_n_updates);
+#endif
+	fscache_update_aux(cookie, aux_data, object_size);
+	smp_wmb();
+	set_bit(FSCACHE_COOKIE_NEEDS_UPDATE, &cookie->flags);
+}
+
 /**
  * fscache_update_cookie - Request that a cache object be updated
  * @cookie: The cookie representing the cache object


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

