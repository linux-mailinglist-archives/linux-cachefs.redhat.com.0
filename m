Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B73B346EED1
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Dec 2021 17:58:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639069127;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q9/a7gawT8pLcp/akCFZjDkoikBdPEZMe9i6NauBmx8=;
	b=aWyR2T1sAnfQo3quEcW6+o5pspd7ZGO+DgXUzCELJqDNcSYOTuIttCRq6QAMy/g4lMN59I
	xZTS6/9RC1hpXVCxzG7xkiuwaFunQKm63PQ02lDDy7FikY33aumXQaNj1BU7AnqQHpD1ec
	I4piG3UkkuXfKsofi7uC1SCfOegzSPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-9C2Gjk9vONyYDYfmOh-1xg-1; Thu, 09 Dec 2021 11:58:44 -0500
X-MC-Unique: 9C2Gjk9vONyYDYfmOh-1xg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAAAF192CC44;
	Thu,  9 Dec 2021 16:58:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9EDC5C23A;
	Thu,  9 Dec 2021 16:58:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 975844CA93;
	Thu,  9 Dec 2021 16:58:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B9GweRi018828 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 9 Dec 2021 11:58:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B86795BE07; Thu,  9 Dec 2021 16:58:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C12F5D6D5;
	Thu,  9 Dec 2021 16:58:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 09 Dec 2021 16:58:36 +0000
Message-ID: <163906911646.143852.168184059935530127.stgit@warthog.procyon.org.uk>
In-Reply-To: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
References: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Subject: [Linux-cachefs] [PATCH v2 21/67] fscache: Count data storage
	objects in a cache
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Count the data storage objects that are currently allocated in a cache.
This is used to pin certain cache structures until cache withdrawal is
complete.

Three helpers are provided to manage and make use of the count:

 (1) void fscache_count_object(struct fscache_cache *cache);

     This should be called by the cache backend to note that an object has
     been allocated and attached to the cache.

 (2) void fscache_uncount_object(struct fscache_cache *cache);

     This should be called by the backend to note that an object has been
     destroyed.  This sends a wakeup event that allows cache withdrawal to
     proceed if it was waiting for that object.

 (3) void fscache_wait_for_objects(struct fscache_cache *cache);

     This can be used by the backend to wait for all outstanding cache
     object to be destroyed.

Each cache's counter is displayed as part of /proc/fs/fscache/caches.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819608594.215744.1812706538117388252.stgit@warthog.procyon.org.uk/ # v1
---

 fs/fscache/cache.c            |    2 ++
 include/linux/fscache-cache.h |   39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/fs/fscache/cache.c b/fs/fscache/cache.c
index 25eac61f1c29..2749933852a9 100644
--- a/fs/fscache/cache.c
+++ b/fs/fscache/cache.c
@@ -13,6 +13,8 @@
 static LIST_HEAD(fscache_caches);
 DECLARE_RWSEM(fscache_addremove_sem);
 EXPORT_SYMBOL(fscache_addremove_sem);
+DECLARE_WAIT_QUEUE_HEAD(fscache_clearance_waiters);
+EXPORT_SYMBOL(fscache_clearance_waiters);
 
 static atomic_t fscache_cache_debug_id;
 
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index 566497cf5f13..337335d7a5e2 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -76,6 +76,7 @@ struct fscache_cache_ops {
 };
 
 extern struct workqueue_struct *fscache_wq;
+extern wait_queue_head_t fscache_clearance_waiters;
 
 /*
  * out-of-line cache backend functions
@@ -140,4 +141,42 @@ static inline struct fscache_cookie *fscache_cres_cookie(struct netfs_cache_reso
 	return cres->cache_priv;
 }
 
+/**
+ * fscache_count_object - Tell fscache that an object has been added
+ * @cache: The cache to account to
+ *
+ * Tell fscache that an object has been added to the cache.  This prevents the
+ * cache from tearing down the cache structure until the object is uncounted.
+ */
+static inline void fscache_count_object(struct fscache_cache *cache)
+{
+	atomic_inc(&cache->object_count);
+}
+
+/**
+ * fscache_uncount_object - Tell fscache that an object has been removed
+ * @cache: The cache to account to
+ *
+ * Tell fscache that an object has been removed from the cache and will no
+ * longer be accessed.  After this point, the cache cookie may be destroyed.
+ */
+static inline void fscache_uncount_object(struct fscache_cache *cache)
+{
+	if (atomic_dec_and_test(&cache->object_count))
+		wake_up_all(&fscache_clearance_waiters);
+}
+
+/**
+ * fscache_wait_for_objects - Wait for all objects to be withdrawn
+ * @cache: The cache to query
+ *
+ * Wait for all extant objects in a cache to finish being withdrawn
+ * and go away.
+ */
+static inline void fscache_wait_for_objects(struct fscache_cache *cache)
+{
+	wait_event(fscache_clearance_waiters,
+		   atomic_read(&cache->object_count) == 0);
+}
+
 #endif /* _LINUX_FSCACHE_CACHE_H */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

