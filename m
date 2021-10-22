Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7971C437D4E
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:03:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634929386;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=exRVA2e5n9bHvRG7orLoaFv9CnBhjZfzg0pCbcFZUdg=;
	b=OsubxIO4TBKRazdlLslVgRP0Koei5c8eAecFDs/3L2+f9Oh18uuo8btzAASWtUgCw4CzlH
	FR9XR+t0C8eX3pczgk6UNxHlGMJLTX/zfTy6LzE+cHocbD7z5F1omxxy1LU4+lYOH4iRAc
	eJHvaAo3w3PqUccwfYOa/eT9ZMarzVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-uXj65Gr7N2apFnocstQ3Yg-1; Fri, 22 Oct 2021 15:03:03 -0400
X-MC-Unique: uXj65Gr7N2apFnocstQ3Yg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75FC81006AA2;
	Fri, 22 Oct 2021 19:03:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6890C60C04;
	Fri, 22 Oct 2021 19:03:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 558461800B9E;
	Fri, 22 Oct 2021 19:03:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJ30Fv012230 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:03:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 16D8219D9D; Fri, 22 Oct 2021 19:03:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C819719D9B;
	Fri, 22 Oct 2021 19:02:56 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Fri, 22 Oct 2021 20:02:55 +0100
Message-ID: <163492937595.1038219.9738239576937322270.stgit@warthog.procyon.org.uk>
In-Reply-To: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Subject: [Linux-cachefs] [PATCH v2 16/53] fscache: Provide and use cache
 methods to lookup/create/free a volume
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

Add cache methods to lookup, create and remove a volume.

Looking up or creating the volume requires the cache pinning for access;
freeing the volume requires the volume pinning for access.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/fscache/volume.c            |   66 ++++++++++++++++++++++++++++++++++++++--
 include/linux/fscache-cache.h  |    6 ++++
 include/trace/events/fscache.h |   11 ++++++-
 3 files changed, 79 insertions(+), 4 deletions(-)

diff --git a/fs/fscache/volume.c b/fs/fscache/volume.c
index d539d6ec2664..d1e57ce95b72 100644
--- a/fs/fscache/volume.c
+++ b/fs/fscache/volume.c
@@ -15,6 +15,8 @@ static struct hlist_bl_head fscache_volume_hash[1 << fscache_volume_hash_shift];
 static atomic_t fscache_volume_debug_id;
 static LIST_HEAD(fscache_volumes);
 
+static void fscache_create_volume_work(struct work_struct *work);
+
 struct fscache_volume *fscache_get_volume(struct fscache_volume *volume,
 					  enum fscache_volume_trace where)
 {
@@ -179,7 +181,7 @@ static struct fscache_volume *fscache_alloc_volume(const char *volume_key,
 	volume->cache = cache;
 	volume->coherency = coherency_data;
 	INIT_LIST_HEAD(&volume->proc_link);
-	INIT_WORK(&volume->work, NULL /* PLACEHOLDER */);
+	INIT_WORK(&volume->work, fscache_create_volume_work);
 	refcount_set(&volume->ref, 1);
 	spin_lock_init(&volume->lock);
 
@@ -216,6 +218,58 @@ static struct fscache_volume *fscache_alloc_volume(const char *volume_key,
 	return NULL;
 }
 
+/*
+ * Create a volume's representation on disk.  Have a volume ref and a cache
+ * access we have to release.
+ */
+static void fscache_create_volume_work(struct work_struct *work)
+{
+	const struct fscache_cache_ops *ops;
+	struct fscache_volume *volume =
+		container_of(work, struct fscache_volume, work);
+
+	fscache_see_volume(volume, fscache_volume_see_create_work);
+
+	ops = volume->cache->ops;
+	if (ops->acquire_volume)
+		ops->acquire_volume(volume);
+	fscache_end_cache_access(volume->cache,
+				 fscache_access_acquire_volume_end);
+
+	clear_bit_unlock(FSCACHE_VOLUME_CREATING, &volume->flags);
+	wake_up_bit(&volume->flags, FSCACHE_VOLUME_CREATING);
+	fscache_put_volume(volume, fscache_volume_put_create_work);
+}
+
+/*
+ * Dispatch a worker thread to create a volume's representation on disk.
+ */
+void fscache_create_volume(struct fscache_volume *volume, bool wait)
+{
+	if (test_and_set_bit(FSCACHE_VOLUME_CREATING, &volume->flags))
+		goto maybe_wait;
+	if (volume->cache_priv)
+		goto no_wait; /* We raced */
+	if (!fscache_begin_cache_access(volume->cache,
+					fscache_access_acquire_volume))
+		goto no_wait;
+
+	fscache_get_volume(volume, fscache_volume_get_create_work);
+	if (!schedule_work(&volume->work))
+		fscache_put_volume(volume, fscache_volume_put_create_work);
+
+maybe_wait:
+	if (wait) {
+		fscache_see_volume(volume, fscache_volume_wait_create_work);
+		wait_on_bit(&volume->flags, FSCACHE_VOLUME_CREATING,
+			    TASK_UNINTERRUPTIBLE);
+	}
+	return;
+no_wait:
+	clear_bit_unlock(FSCACHE_VOLUME_CREATING, &volume->flags);
+	wake_up_bit(&volume->flags, FSCACHE_VOLUME_CREATING);
+}
+
 /*
  * Acquire a volume representation cookie and link it to a (proposed) cache.
  */
@@ -234,7 +288,7 @@ struct fscache_volume *__fscache_acquire_volume(const char *volume_key,
 		return NULL;
 	}
 
-	// PLACEHOLDER: Create the volume if we have a cache available
+	fscache_create_volume(volume, false);
 	return volume;
 }
 EXPORT_SYMBOL(__fscache_acquire_volume);
@@ -281,7 +335,13 @@ static void fscache_free_volume(struct fscache_volume *volume)
 	struct fscache_cache *cache = volume->cache;
 
 	if (volume->cache_priv) {
-		// PLACEHOLDER: Detach any attached cache
+		__fscache_begin_volume_access(volume, fscache_access_relinquish_volume);
+		if (volume->cache_priv) {
+			const struct fscache_cache_ops *ops = cache->ops;
+			if (ops->free_volume)
+				ops->free_volume(volume);
+		}
+		fscache_end_volume_access(volume, fscache_access_relinquish_volume_end);
 	}
 
 	down_write(&fscache_addremove_sem);
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index d2301ec88ff9..558d4bbbe486 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -53,6 +53,12 @@ struct fscache_cache {
 struct fscache_cache_ops {
 	/* name of cache provider */
 	const char *name;
+
+	/* Acquire a volume */
+	void (*acquire_volume)(struct fscache_volume *volume);
+
+	/* Free the cache's data attached to a volume */
+	void (*free_volume)(struct fscache_volume *volume);
 };
 
 static inline enum fscache_cache_state fscache_cache_state(const struct fscache_cache *cache)
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index c256f30d4dd4..3476cc7fdb25 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -63,8 +63,12 @@ enum fscache_cookie_trace {
 };
 
 enum fscache_access_trace {
+	fscache_access_acquire_volume,
+	fscache_access_acquire_volume_end,
 	fscache_access_cache_pin,
 	fscache_access_cache_unpin,
+	fscache_access_relinquish_volume,
+	fscache_access_relinquish_volume_end,
 	fscache_access_unlive,
 };
 
@@ -94,7 +98,8 @@ enum fscache_access_trace {
 	EM(fscache_volume_put_hash_collision,	"PUT hcoll")		\
 	EM(fscache_volume_put_relinquish,	"PUT relnq")		\
 	EM(fscache_volume_see_create_work,	"SEE creat")		\
-	E_(fscache_volume_see_hash_wake,	"SEE hwake")
+	EM(fscache_volume_see_hash_wake,	"SEE hwake")		\
+	E_(fscache_volume_wait_create_work,	"WAIT crea")
 
 #define fscache_cookie_traces						\
 	EM(fscache_cookie_collision,		"*COLLIDE*")		\
@@ -113,8 +118,12 @@ enum fscache_access_trace {
 	E_(fscache_cookie_see_work,		"-   work ")
 
 #define fscache_access_traces		\
+	EM(fscache_access_acquire_volume,	"BEGIN acq_vol")	\
+	EM(fscache_access_acquire_volume_end,	"END   acq_vol")	\
 	EM(fscache_access_cache_pin,		"PIN   cache  ")	\
 	EM(fscache_access_cache_unpin,		"UNPIN cache  ")	\
+	EM(fscache_access_relinquish_volume,	"BEGIN rlq_vol")	\
+	EM(fscache_access_relinquish_volume_end,"END   rlq_vol")	\
 	E_(fscache_access_unlive,		"END   unlive ")
 
 /*


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

