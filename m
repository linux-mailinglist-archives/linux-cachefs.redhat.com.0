Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5717437E35
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:11:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634929885;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P5aObsNyub5oM3l7XbKzLtXmhSZubbh09sXYZZWOLIw=;
	b=F9zqKwHswIzi/J3EYgJgmwoWLHYmgK796375l/Qc89kJoMs6MdhhWs6tMftbINoAwbwyfJ
	OMws6FSzcJxbA4RrNiFp6hi8gzkNOqnRVGTKJ4xSYqxpPr+PkWgfJYpNJurYr2mYLdidHG
	c2Z0dewoBDdplOzKnQ6rx6fN5ykqUcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-2Oi7IRfzM3OgHbxi6vATOw-1; Fri, 22 Oct 2021 15:11:22 -0400
X-MC-Unique: 2Oi7IRfzM3OgHbxi6vATOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56C7B80668B;
	Fri, 22 Oct 2021 19:11:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4860C19D9B;
	Fri, 22 Oct 2021 19:11:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 356ED4EA2F;
	Fri, 22 Oct 2021 19:11:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJ7btU012842 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:07:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DD24D17155; Fri, 22 Oct 2021 19:07:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 579C65C1A3;
	Fri, 22 Oct 2021 19:07:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Fri, 22 Oct 2021 20:07:31 +0100
Message-ID: <163492965148.1038219.9649181508116300227.stgit@warthog.procyon.org.uk>
In-Reply-To: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Subject: [Linux-cachefs] [PATCH v2 37/53] cachefiles: Implement volume
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
---

 fs/cachefiles/Makefile    |    3 +
 fs/cachefiles/bind.c      |   28 +++++++++-
 fs/cachefiles/interface.c |    2 +
 fs/cachefiles/internal.h  |    7 ++
 fs/cachefiles/volume.c    |  128 +++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 166 insertions(+), 2 deletions(-)
 create mode 100644 fs/cachefiles/volume.c

diff --git a/fs/cachefiles/Makefile b/fs/cachefiles/Makefile
index 7017c9113074..607f7c684a97 100644
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
 
diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
index 9ca10290064b..70924997b0cc 100644
--- a/fs/cachefiles/bind.c
+++ b/fs/cachefiles/bind.c
@@ -236,6 +236,32 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
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
  * Withdraw cache objects.
  */
@@ -259,7 +285,7 @@ static void cachefiles_withdraw_cache(struct cachefiles_cache *cache)
 		   atomic_read(&fscache->object_count) == 0);
 	_debug("cleared");
 
-	// PLACEHOLDER: Withdraw volume
+	cachefiles_withdraw_volumes(cache);
 
 	/* make sure all outstanding data is written to disk */
 	cachefiles_sync_cache(cache);
diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 236d55c13fb1..8624ee52b98b 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -39,4 +39,6 @@ void cachefiles_sync_cache(struct cachefiles_cache *cache)
 
 const struct fscache_cache_ops cachefiles_cache_ops = {
 	.name			= "cachefiles",
+	.acquire_volume		= cachefiles_acquire_volume,
+	.free_volume		= cachefiles_free_volume,
 };
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index c472766cdce3..828b888a8bf3 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -211,6 +211,13 @@ static inline void cachefiles_end_secure(struct cachefiles_cache *cache,
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
  * error handling
  */
diff --git a/fs/cachefiles/volume.c b/fs/cachefiles/volume.c
new file mode 100644
index 000000000000..f5e527b56228
--- /dev/null
+++ b/fs/cachefiles/volume.c
@@ -0,0 +1,128 @@
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
+	vdentry = cachefiles_get_directory(cache, cache->store, name);
+	if (IS_ERR(vdentry))
+		goto error_name;
+	volume->dentry = vdentry;
+
+	for (i = 0; i < 256; i++) {
+		sprintf(name, "@%02x", i);
+		fan = cachefiles_get_directory(cache, vdentry, name);
+		if (IS_ERR(fan))
+			goto error_fan;
+		volume->fanout[i] = fan;
+	}
+
+	cachefiles_end_secure(cache, saved_cred);
+
+	vcookie->cache_priv = volume;
+	n_accesses = atomic_inc_return(&vcookie->n_accesses); /* Stop wakeups on dec-to-0 */
+	trace_fscache_access_volume(vcookie->debug_id, refcount_read(&vcookie->ref),
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
+		dput(volume->fanout[i]);
+	dput(volume->dentry);
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
+		dput(volume->fanout[i]);
+	dput(volume->dentry);
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
+	struct fscache_volume *vcookie = volume->vcookie;
+	int n_accesses;
+
+	_debug("withdraw V=%x", vcookie->debug_id);
+
+	/* Allow wakeups on dec-to-0 */
+	n_accesses = atomic_dec_return(&vcookie->n_accesses);
+	trace_fscache_access_volume(vcookie->debug_id, refcount_read(&vcookie->ref),
+				    n_accesses, fscache_access_cache_unpin);
+
+	wait_var_event(&vcookie->n_accesses,
+		       atomic_read(&vcookie->n_accesses) == 0);
+	__cachefiles_free_volume(volume);
+}


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

