Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ED73C47DA92
	for <lists+linux-cachefs@lfdr.de>; Thu, 23 Dec 2021 00:24:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640215466;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iP3q2dNkTYhzc4bySJbNvEiuHcLetBnQxgRWKb5Hwjg=;
	b=XYzx9zY8UARlfcG+s+NXo+ZsHtsLz9xugm20CrUR9IV7eTa7yEuYmhN2zx+eoaxQV7P7VJ
	BytPfIIPSp8u2dGYUY+nMiMM6YbsQLo3jXQCpu0F+/mF/YkLwNr9yEbq/MancRqA+n3b1x
	hfFZNpw78tzlxPdZlOj/Ar2/xrqA4zM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-Bbcq8UiPNVGCN9k_5V5qrA-1; Wed, 22 Dec 2021 18:24:21 -0500
X-MC-Unique: Bbcq8UiPNVGCN9k_5V5qrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FE801080865;
	Wed, 22 Dec 2021 23:24:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 393862E17C;
	Wed, 22 Dec 2021 23:24:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F32384CA93;
	Wed, 22 Dec 2021 23:24:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BMNOHJp001222 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 22 Dec 2021 18:24:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9DA137EA26; Wed, 22 Dec 2021 23:24:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 040817ED7A;
	Wed, 22 Dec 2021 23:24:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 22 Dec 2021 23:24:12 +0000
Message-ID: <164021545212.640689.5064821392307582927.stgit@warthog.procyon.org.uk>
In-Reply-To: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Subject: [Linux-cachefs] [PATCH v4 41/68] cachefiles: Implement volume
	support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement support for creating the directory layout for a volume on disk
and setting up and withdrawing volume caching.

Each volume has a directory named for the volume key under the root of the
cache (prefixed with an 'I' to indicate to cachefilesd that it's an index)
and then creates a bunch of hash bucket subdirectories under that (named as
'@' plus a hex number) in which cookie files will be created.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819635314.215744.13081522301564537723.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/163906936397.143852.17788457778396467161.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/163967143860.1823006.7185205806080225038.stgit@warthog.procyon.org.uk/ # v3
---

 fs/cachefiles/Makefile    |    3 +
 fs/cachefiles/cache.c     |   28 ++++++++++-
 fs/cachefiles/daemon.c    |    2 +
 fs/cachefiles/interface.c |    2 +
 fs/cachefiles/internal.h  |   20 ++++++++
 fs/cachefiles/volume.c    |  118 +++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 171 insertions(+), 2 deletions(-)
 create mode 100644 fs/cachefiles/volume.c

diff --git a/fs/cachefiles/Makefile b/fs/cachefiles/Makefile
index 92af5daee8ce..d67210ece9cd 100644
--- a/fs/cachefiles/Makefile
+++ b/fs/cachefiles/Makefile
@@ -9,7 +9,8 @@ cachefiles-y := \
 	interface.o \
 	main.o \
 	namei.o \
-	security.o
+	security.o \
+	volume.o
 
 cachefiles-$(CONFIG_CACHEFILES_ERROR_INJECTION) += error_inject.o
 
diff --git a/fs/cachefiles/cache.c b/fs/cachefiles/cache.c
index 0462e7af87fb..c4b9280ca0cd 100644
--- a/fs/cachefiles/cache.c
+++ b/fs/cachefiles/cache.c
@@ -262,6 +262,32 @@ int cachefiles_has_space(struct cachefiles_cache *cache,
 	return ret;
 }
 
+/*
+ * Withdraw volumes.
+ */
+static void cachefiles_withdraw_volumes(struct cachefiles_cache *cache)
+{
+	_enter("");
+
+	for (;;) {
+		struct cachefiles_volume *volume = NULL;
+
+		spin_lock(&cache->object_list_lock);
+		if (!list_empty(&cache->volumes)) {
+			volume = list_first_entry(&cache->volumes,
+						  struct cachefiles_volume, cache_link);
+			list_del_init(&volume->cache_link);
+		}
+		spin_unlock(&cache->object_list_lock);
+		if (!volume)
+			break;
+
+		cachefiles_withdraw_volume(volume);
+	}
+
+	_leave("");
+}
+
 /*
  * Sync a cache to backing disk.
  */
@@ -303,7 +329,7 @@ void cachefiles_withdraw_cache(struct cachefiles_cache *cache)
 	// PLACEHOLDER: Withdraw objects
 	fscache_wait_for_objects(fscache);
 
-	// PLACEHOLDER: Withdraw volume
+	cachefiles_withdraw_volumes(cache);
 	cachefiles_sync_cache(cache);
 	cache->cache = NULL;
 	fscache_relinquish_cache(fscache);
diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index a449ee661987..337597a4e30c 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -105,6 +105,8 @@ static int cachefiles_daemon_open(struct inode *inode, struct file *file)
 
 	mutex_init(&cache->daemon_mutex);
 	init_waitqueue_head(&cache->daemon_pollwq);
+	INIT_LIST_HEAD(&cache->volumes);
+	spin_lock_init(&cache->object_list_lock);
 
 	/* set default caching limits
 	 * - limit at 1% free space and/or free files
diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 564ea8fa6641..1793e46bd3e7 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -15,4 +15,6 @@
 
 const struct fscache_cache_ops cachefiles_cache_ops = {
 	.name			= "cachefiles",
+	.acquire_volume		= cachefiles_acquire_volume,
+	.free_volume		= cachefiles_free_volume,
 };
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 77e874c2bbe7..ab0e9307be7b 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -19,6 +19,17 @@
 struct cachefiles_cache;
 struct cachefiles_object;
 
+/*
+ * Cached volume representation.
+ */
+struct cachefiles_volume {
+	struct cachefiles_cache		*cache;
+	struct list_head		cache_link;	/* Link in cache->volumes */
+	struct fscache_volume		*vcookie;	/* The netfs's representation */
+	struct dentry			*dentry;	/* The volume dentry */
+	struct dentry			*fanout[256];	/* Fanout subdirs */
+};
+
 /*
  * Data file records.
  */
@@ -35,6 +46,8 @@ struct cachefiles_cache {
 	struct dentry			*store;		/* Directory into which live objects go */
 	struct dentry			*graveyard;	/* directory into which dead objects go */
 	struct file			*cachefilesd;	/* manager daemon handle */
+	struct list_head		volumes;	/* List of volume objects */
+	spinlock_t			object_list_lock; /* Lock for volumes and object_list */
 	const struct cred		*cache_cred;	/* security override for accessing cache */
 	struct mutex			daemon_mutex;	/* command serialisation mutex */
 	wait_queue_head_t		daemon_pollwq;	/* poll waitqueue for daemon */
@@ -163,6 +176,13 @@ static inline void cachefiles_end_secure(struct cachefiles_cache *cache,
 	revert_creds(saved_cred);
 }
 
+/*
+ * volume.c
+ */
+void cachefiles_acquire_volume(struct fscache_volume *volume);
+void cachefiles_free_volume(struct fscache_volume *volume);
+void cachefiles_withdraw_volume(struct cachefiles_volume *volume);
+
 /*
  * Error handling
  */
diff --git a/fs/cachefiles/volume.c b/fs/cachefiles/volume.c
new file mode 100644
index 000000000000..4a14f5e72764
--- /dev/null
+++ b/fs/cachefiles/volume.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Volume handling.
+ *
+ * Copyright (C) 2021 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/fs.h>
+#include <linux/slab.h>
+#include "internal.h"
+#include <trace/events/fscache.h>
+
+/*
+ * Allocate and set up a volume representation.  We make sure all the fanout
+ * directories are created and pinned.
+ */
+void cachefiles_acquire_volume(struct fscache_volume *vcookie)
+{
+	struct cachefiles_volume *volume;
+	struct cachefiles_cache *cache = vcookie->cache->cache_priv;
+	const struct cred *saved_cred;
+	struct dentry *vdentry, *fan;
+	size_t len;
+	char *name;
+	int n_accesses, i;
+
+	_enter("");
+
+	volume = kzalloc(sizeof(struct cachefiles_volume), GFP_KERNEL);
+	if (!volume)
+		return;
+	volume->vcookie = vcookie;
+	volume->cache = cache;
+	INIT_LIST_HEAD(&volume->cache_link);
+
+	cachefiles_begin_secure(cache, &saved_cred);
+
+	len = vcookie->key[0];
+	name = kmalloc(len + 3, GFP_NOFS);
+	if (!name)
+		goto error_vol;
+	name[0] = 'I';
+	memcpy(name + 1, vcookie->key + 1, len);
+	name[len + 1] = 0;
+
+	vdentry = cachefiles_get_directory(cache, cache->store, name, NULL);
+	if (IS_ERR(vdentry))
+		goto error_name;
+	volume->dentry = vdentry;
+
+	for (i = 0; i < 256; i++) {
+		sprintf(name, "@%02x", i);
+		fan = cachefiles_get_directory(cache, vdentry, name, NULL);
+		if (IS_ERR(fan))
+			goto error_fan;
+		volume->fanout[i] = fan;
+	}
+
+	cachefiles_end_secure(cache, saved_cred);
+
+	vcookie->cache_priv = volume;
+	n_accesses = atomic_inc_return(&vcookie->n_accesses); /* Stop wakeups on dec-to-0 */
+	trace_fscache_access_volume(vcookie->debug_id, 0,
+				    refcount_read(&vcookie->ref),
+				    n_accesses, fscache_access_cache_pin);
+
+	spin_lock(&cache->object_list_lock);
+	list_add(&volume->cache_link, &volume->cache->volumes);
+	spin_unlock(&cache->object_list_lock);
+
+	kfree(name);
+	return;
+
+error_fan:
+	for (i = 0; i < 256; i++)
+		cachefiles_put_directory(volume->fanout[i]);
+	cachefiles_put_directory(volume->dentry);
+error_name:
+	kfree(name);
+error_vol:
+	kfree(volume);
+	cachefiles_end_secure(cache, saved_cred);
+}
+
+/*
+ * Release a volume representation.
+ */
+static void __cachefiles_free_volume(struct cachefiles_volume *volume)
+{
+	int i;
+
+	_enter("");
+
+	volume->vcookie->cache_priv = NULL;
+
+	for (i = 0; i < 256; i++)
+		cachefiles_put_directory(volume->fanout[i]);
+	cachefiles_put_directory(volume->dentry);
+	kfree(volume);
+}
+
+void cachefiles_free_volume(struct fscache_volume *vcookie)
+{
+	struct cachefiles_volume *volume = vcookie->cache_priv;
+
+	if (volume) {
+		spin_lock(&volume->cache->object_list_lock);
+		list_del_init(&volume->cache_link);
+		spin_unlock(&volume->cache->object_list_lock);
+		__cachefiles_free_volume(volume);
+	}
+}
+
+void cachefiles_withdraw_volume(struct cachefiles_volume *volume)
+{
+	fscache_withdraw_volume(volume->vcookie);
+	__cachefiles_free_volume(volume);
+}


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

