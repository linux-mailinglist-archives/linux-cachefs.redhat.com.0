Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C0D46F0A1
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Dec 2021 18:06:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639069618;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e0mk8pRjmAltV7jBdH/WDOOf5v5UvzoQk+uQ66jnzL0=;
	b=XzetaOEfZVLEZOvdj3zUfoll9sbUiWkQjn6yvtOfbv1jVLCWiRxDbjYRRDywjEOT3cPiow
	IzMIyDbzlLtO5pz/tdHAR8c/hgCv7rkYv/nmYffnKYfFw3+/37LF5SrbP+iCyTicea5YMd
	Rh3NrUQd/qTUN0pSnmwAe57B0RxH46w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-QKzpPN2TOheuZmX_9SdWgw-1; Thu, 09 Dec 2021 12:06:54 -0500
X-MC-Unique: QKzpPN2TOheuZmX_9SdWgw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 190A610168CC;
	Thu,  9 Dec 2021 17:06:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 055E76107F;
	Thu,  9 Dec 2021 17:06:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC72F4A71C;
	Thu,  9 Dec 2021 17:06:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B9H6mhf019977 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 9 Dec 2021 12:06:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9FEB960C9F; Thu,  9 Dec 2021 17:06:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88C2460BF1;
	Thu,  9 Dec 2021 17:06:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 09 Dec 2021 17:06:23 +0000
Message-ID: <163906958369.143852.7257100711818401748.stgit@warthog.procyon.org.uk>
In-Reply-To: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
References: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Subject: [Linux-cachefs] [PATCH v2 53/67] fscache,
 cachefiles: Display stats of no-space events
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add stat counters of no-space events that caused caching not to happen and
display in /proc/fs/fscache/stats.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819653216.215744.17210522251617386509.stgit@warthog.procyon.org.uk/ # v1
---

 fs/cachefiles/cache.c         |   18 +++++++++++++++---
 fs/cachefiles/daemon.c        |    2 +-
 fs/cachefiles/internal.h      |   11 +++++++++--
 fs/cachefiles/io.c            |    7 +++++--
 fs/cachefiles/namei.c         |    6 ++++--
 fs/fscache/stats.c            |    8 ++++++++
 include/linux/fscache-cache.h |    6 ++++++
 7 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/fs/cachefiles/cache.c b/fs/cachefiles/cache.c
index 2f7f5381afbe..327cea71557f 100644
--- a/fs/cachefiles/cache.c
+++ b/fs/cachefiles/cache.c
@@ -147,7 +147,7 @@ int cachefiles_add_cache(struct cachefiles_cache *cache)
 	pr_info("File cache on %s registered\n", cache_cookie->name);
 
 	/* check how much space the cache has */
-	cachefiles_has_space(cache, 0, 0);
+	cachefiles_has_space(cache, 0, 0, cachefiles_has_space_check);
 	cachefiles_end_secure(cache, saved_cred);
 	_leave(" = 0 [%px]", cache->cache);
 	return 0;
@@ -175,7 +175,8 @@ int cachefiles_add_cache(struct cachefiles_cache *cache)
  * cache
  */
 int cachefiles_has_space(struct cachefiles_cache *cache,
-			 unsigned fnr, unsigned bnr)
+			 unsigned fnr, unsigned bnr,
+			 enum cachefiles_has_space_for reason)
 {
 	struct kstatfs stats;
 	u64 b_avail, b_writing;
@@ -233,7 +234,7 @@ int cachefiles_has_space(struct cachefiles_cache *cache,
 	ret = -ENOBUFS;
 	if (stats.f_ffree < cache->fstop ||
 	    b_avail < cache->bstop)
-		goto begin_cull;
+		goto stop_and_begin_cull;
 
 	ret = 0;
 	if (stats.f_ffree < cache->fcull ||
@@ -252,6 +253,17 @@ int cachefiles_has_space(struct cachefiles_cache *cache,
 	//_leave(" = 0");
 	return 0;
 
+stop_and_begin_cull:
+	switch (reason) {
+	case cachefiles_has_space_for_write:
+		fscache_count_no_write_space();
+		break;
+	case cachefiles_has_space_for_create:
+		fscache_count_no_create_space();
+		break;
+	default:
+		break;
+	}
 begin_cull:
 	if (!test_and_set_bit(CACHEFILES_CULLING, &cache->flags)) {
 		_debug("### CULL CACHE ###");
diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 45af558a696e..40a792421fc1 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -170,7 +170,7 @@ static ssize_t cachefiles_daemon_read(struct file *file, char __user *_buffer,
 		return 0;
 
 	/* check how much space the cache has */
-	cachefiles_has_space(cache, 0, 0);
+	cachefiles_has_space(cache, 0, 0, cachefiles_has_space_check);
 
 	/* summarise */
 	f_released = atomic_xchg(&cache->f_released, 0);
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 77c899b3eaa5..5396baad45ed 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -130,10 +130,17 @@ static inline void cachefiles_state_changed(struct cachefiles_cache *cache)
  * cache.c
  */
 extern int cachefiles_add_cache(struct cachefiles_cache *cache);
-extern int cachefiles_has_space(struct cachefiles_cache *cache,
-				unsigned fnr, unsigned bnr);
 extern void cachefiles_withdraw_cache(struct cachefiles_cache *cache);
 
+enum cachefiles_has_space_for {
+	cachefiles_has_space_check,
+	cachefiles_has_space_for_write,
+	cachefiles_has_space_for_create,
+};
+extern int cachefiles_has_space(struct cachefiles_cache *cache,
+				unsigned fnr, unsigned bnr,
+				enum cachefiles_has_space_for reason);
+
 /*
  * daemon.c
  */
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 6f4dce0cfc36..60b1eac2ce78 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -468,7 +468,8 @@ static int __cachefiles_prepare_write(struct netfs_cache_resources *cres,
 	 * space, we need to see if it's fully allocated.  If it's not, we may
 	 * want to cull it.
 	 */
-	if (cachefiles_has_space(cache, 0, *_len / PAGE_SIZE) == 0)
+	if (cachefiles_has_space(cache, 0, *_len / PAGE_SIZE,
+				 cachefiles_has_space_check) == 0)
 		return 0; /* Enough space to simply overwrite the whole block */
 
 	pos = cachefiles_inject_read_error();
@@ -483,6 +484,7 @@ static int __cachefiles_prepare_write(struct netfs_cache_resources *cres,
 		return 0; /* Fully allocated */
 
 	/* Partially allocated, but insufficient space: cull. */
+	fscache_count_no_write_space();
 	ret = cachefiles_inject_remove_error();
 	if (ret == 0)
 		ret = vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
@@ -498,7 +500,8 @@ static int __cachefiles_prepare_write(struct netfs_cache_resources *cres,
 	return ret;
 
 check_space:
-	return cachefiles_has_space(cache, 0, *_len / PAGE_SIZE);
+	return cachefiles_has_space(cache, 0, *_len / PAGE_SIZE,
+				    cachefiles_has_space_for_write);
 }
 
 static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index 1e9845b8e939..f31d678159ac 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -115,7 +115,8 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 
 	/* we need to create the subdir if it doesn't exist yet */
 	if (d_is_negative(subdir)) {
-		ret = cachefiles_has_space(cache, 1, 0);
+		ret = cachefiles_has_space(cache, 1, 0,
+					   cachefiles_has_space_for_create);
 		if (ret < 0)
 			goto mkdir_error;
 
@@ -511,7 +512,8 @@ static bool cachefiles_create_file(struct cachefiles_object *object)
 	struct file *file;
 	int ret;
 
-	ret = cachefiles_has_space(object->volume->cache, 1, 0);
+	ret = cachefiles_has_space(object->volume->cache, 1, 0,
+				   cachefiles_has_space_for_create);
 	if (ret < 0)
 		return false;
 
diff --git a/fs/fscache/stats.c b/fs/fscache/stats.c
index 798ee68b3e9d..db2f4e225dd9 100644
--- a/fs/fscache/stats.c
+++ b/fs/fscache/stats.c
@@ -42,6 +42,10 @@ atomic_t fscache_n_read;
 EXPORT_SYMBOL(fscache_n_read);
 atomic_t fscache_n_write;
 EXPORT_SYMBOL(fscache_n_write);
+atomic_t fscache_n_no_write_space;
+EXPORT_SYMBOL(fscache_n_no_write_space);
+atomic_t fscache_n_no_create_space;
+EXPORT_SYMBOL(fscache_n_no_create_space);
 
 /*
  * display the general statistics
@@ -82,6 +86,10 @@ int fscache_stats_show(struct seq_file *m, void *v)
 		   atomic_read(&fscache_n_relinquishes_retire),
 		   atomic_read(&fscache_n_relinquishes_dropped));
 
+	seq_printf(m, "NoSpace: nwr=%u ncr=%u\n",
+		   atomic_read(&fscache_n_no_write_space),
+		   atomic_read(&fscache_n_no_create_space));
+
 	seq_printf(m, "IO     : rd=%u wr=%u\n",
 		   atomic_read(&fscache_n_read),
 		   atomic_read(&fscache_n_write));
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index 3fa4902dc87c..007e47f38610 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -186,11 +186,17 @@ static inline void fscache_wait_for_objects(struct fscache_cache *cache)
 #ifdef CONFIG_FSCACHE_STATS
 extern atomic_t fscache_n_read;
 extern atomic_t fscache_n_write;
+extern atomic_t fscache_n_no_write_space;
+extern atomic_t fscache_n_no_create_space;
 #define fscache_count_read() atomic_inc(&fscache_n_read)
 #define fscache_count_write() atomic_inc(&fscache_n_write)
+#define fscache_count_no_write_space() atomic_inc(&fscache_n_no_write_space)
+#define fscache_count_no_create_space() atomic_inc(&fscache_n_no_create_space)
 #else
 #define fscache_count_read() do {} while(0)
 #define fscache_count_write() do {} while(0)
+#define fscache_count_no_write_space() do {} while(0)
+#define fscache_count_no_create_space() do {} while(0)
 #endif
 
 #endif /* _LINUX_FSCACHE_CACHE_H */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

