Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B3437E61
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:13:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634929979;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VpqdAV/5BcnSjjnREtTb+EYmvYoGmxAjQLg07iVj414=;
	b=SBo+gQmq3W6p4/InRwZObU7M99qecoXeQK/u05gAks2W9Vt68B2oheB3ZpyXmt0Czf3UId
	iSOF78lf9DxbqzTyso05y66nrYm5iS1j6rMqSzfHZ9Vg2evzIDVyv+rcxv/AflKf3XZTL5
	fVPUtlwUJj5f7XPpBn1+8ahpwZVocGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-n0hxZDmrO3WOwGDO9v1PHA-1; Fri, 22 Oct 2021 15:12:56 -0400
X-MC-Unique: n0hxZDmrO3WOwGDO9v1PHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B7F8806688;
	Fri, 22 Oct 2021 19:12:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C6455F4EA;
	Fri, 22 Oct 2021 19:12:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 69F5C181A1D0;
	Fri, 22 Oct 2021 19:12:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJB0gd013191 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:11:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D8BF60657; Fri, 22 Oct 2021 19:11:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C81E51346F;
	Fri, 22 Oct 2021 19:10:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Fri, 22 Oct 2021 20:10:49 +0100
Message-ID: <163492984937.1038219.8529018022197546593.stgit@warthog.procyon.org.uk>
In-Reply-To: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Subject: [Linux-cachefs] [PATCH v2 52/53] fscache,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
---

 fs/cachefiles/bind.c          |    2 +-
 fs/cachefiles/daemon.c        |   18 +++++++++++++++---
 fs/cachefiles/internal.h      |    8 +++++++-
 fs/cachefiles/io.c            |    9 ++++++---
 fs/cachefiles/namei.c         |    6 ++++--
 fs/fscache/stats.c            |    8 ++++++++
 include/linux/fscache-cache.h |    6 ++++++
 7 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
index 59c9d141f1fe..a62361e82b20 100644
--- a/fs/cachefiles/bind.c
+++ b/fs/cachefiles/bind.c
@@ -211,7 +211,7 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 	pr_info("File cache on %s registered\n", cache_cookie->name);
 
 	/* check how much space the cache has */
-	cachefiles_has_space(cache, 0, 0);
+	cachefiles_has_space(cache, 0, 0, cachefiles_has_space_check);
 	cachefiles_end_secure(cache, saved_cred);
 	_leave(" = 0 [%px]", cache->cache);
 	return 0;
diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 50ec292c7213..7a7d521aeb83 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -168,7 +168,7 @@ static ssize_t cachefiles_daemon_read(struct file *file, char __user *_buffer,
 		return 0;
 
 	/* check how much space the cache has */
-	cachefiles_has_space(cache, 0, 0);
+	cachefiles_has_space(cache, 0, 0, cachefiles_has_space_check);
 
 	/* summarise */
 	f_released = atomic_xchg(&cache->f_released, 0);
@@ -668,7 +668,8 @@ static int cachefiles_daemon_inuse(struct cachefiles_cache *cache, char *args)
  * cache
  */
 int cachefiles_has_space(struct cachefiles_cache *cache,
-			 unsigned fnr, unsigned bnr)
+			 unsigned fnr, unsigned bnr,
+			 enum cachefiles_has_space_for reason)
 {
 	struct kstatfs stats;
 	int ret;
@@ -720,7 +721,7 @@ int cachefiles_has_space(struct cachefiles_cache *cache,
 	ret = -ENOBUFS;
 	if (stats.f_ffree < cache->fstop ||
 	    stats.f_bavail < cache->bstop)
-		goto begin_cull;
+		goto stop_and_begin_cull;
 
 	ret = 0;
 	if (stats.f_ffree < cache->fcull ||
@@ -739,6 +740,17 @@ int cachefiles_has_space(struct cachefiles_cache *cache,
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
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index d3c7db3b058e..8d1b1347abb4 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -152,8 +152,14 @@ extern void cachefiles_daemon_unbind(struct cachefiles_cache *cache);
  */
 extern const struct file_operations cachefiles_daemon_fops;
 
+enum cachefiles_has_space_for {
+	cachefiles_has_space_check,
+	cachefiles_has_space_for_write,
+	cachefiles_has_space_for_create,
+};
 extern int cachefiles_has_space(struct cachefiles_cache *cache,
-				unsigned fnr, unsigned bnr);
+				unsigned fnr, unsigned bnr,
+				enum cachefiles_has_space_for reason);
 
 /*
  * error_inject.c
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 78e6ef781f73..cb531424a64f 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -461,7 +461,8 @@ static int __cachefiles_prepare_write(struct netfs_cache_resources *cres,
 	 * space, we need to see if it's fully allocated.  If it's not, we may
 	 * want to cull it.
 	 */
-	if (cachefiles_has_space(cache, 0, *_len / PAGE_SIZE) == 0)
+	if (cachefiles_has_space(cache, 0, *_len / PAGE_SIZE,
+				 cachefiles_has_space_check) == 0)
 		return 0; /* Enough space to simply overwrite the whole block */
 
 	pos = cachefiles_inject_read_error();
@@ -476,6 +477,7 @@ static int __cachefiles_prepare_write(struct netfs_cache_resources *cres,
 		return 0; /* Fully allocated */
 
 	/* Partially allocated, but insufficient space: cull. */
+	fscache_count_no_write_space();
 	pos = cachefiles_inject_remove_error();
 	if (pos == 0)
 		ret = vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
@@ -491,7 +493,8 @@ static int __cachefiles_prepare_write(struct netfs_cache_resources *cres,
 	return ret;
 
 check_space:
-	return cachefiles_has_space(cache, 0, *_len / PAGE_SIZE);
+	return cachefiles_has_space(cache, 0, *_len / PAGE_SIZE,
+				    cachefiles_has_space_for_write);
 }
 
 static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
@@ -528,7 +531,7 @@ static int cachefiles_prepare_fallback_write(struct netfs_cache_resources *cres,
 
 	_enter("%lx", index);
 
-	return cachefiles_has_space(cache, 0, 1);
+	return cachefiles_has_space(cache, 0, 1, cachefiles_has_space_for_write);
 }
 
 /*
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index ad87fb28b602..9b0a14e37cfa 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -309,7 +309,8 @@ static bool cachefiles_create_file(struct cachefiles_object *object)
 	struct file *file;
 	int ret;
 
-	ret = cachefiles_has_space(object->volume->cache, 1, 0);
+	ret = cachefiles_has_space(object->volume->cache, 1, 0,
+				   cachefiles_has_space_for_create);
 	if (ret < 0)
 		return false;
 
@@ -480,7 +481,8 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 	/* we need to create the subdir if it doesn't exist yet */
 	if (d_is_negative(subdir)) {
 		if (cache->store) {
-			ret = cachefiles_has_space(cache, 1, 0);
+			ret = cachefiles_has_space(cache, 1, 0,
+						   cachefiles_has_space_for_create);
 			if (ret < 0)
 				goto mkdir_error;
 		}
diff --git a/fs/fscache/stats.c b/fs/fscache/stats.c
index 225bba60b617..d34fb6e91d57 100644
--- a/fs/fscache/stats.c
+++ b/fs/fscache/stats.c
@@ -44,6 +44,10 @@ atomic_t fscache_n_read;
 EXPORT_SYMBOL(fscache_n_read);
 atomic_t fscache_n_write;
 EXPORT_SYMBOL(fscache_n_write);
+atomic_t fscache_n_no_write_space;
+EXPORT_SYMBOL(fscache_n_no_write_space);
+atomic_t fscache_n_no_create_space;
+EXPORT_SYMBOL(fscache_n_no_create_space);
 
 /*
  * display the general statistics
@@ -86,6 +90,10 @@ int fscache_stats_show(struct seq_file *m, void *v)
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
index d5f6b636175e..7b3225c6c22f 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -179,11 +179,17 @@ void fscache_end_operation(struct netfs_cache_resources *cres)
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
 
 extern struct workqueue_struct *fscache_wq;


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

