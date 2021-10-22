Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFFD437E34
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:11:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634929885;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VVBt3ikYJTMxEIKgp63R5lMuaz3v3HutQCJSdjz4ghU=;
	b=b1tc3CU4ItjCqKu6DXtWc1NtH14GZ/NPISrptY3cU/Me5zrNt5VJl6nOBU3xNpNCjav0Ac
	L/bY47zMqdYtmUa9wPmw4awRJsrrJiBxHipGRoLA8pIU0bMpVDbbgWq5xRo7eAVc1BlFV7
	JXQ33sHqioRga4n6iKviw9olxC7IAs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-6uVTzRB6OJKSOjHSo9rIVg-1; Fri, 22 Oct 2021 15:11:21 -0400
X-MC-Unique: 6uVTzRB6OJKSOjHSo9rIVg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FE2410A8E02;
	Fri, 22 Oct 2021 19:11:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F5CD19D9B;
	Fri, 22 Oct 2021 19:11:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 429831806D04;
	Fri, 22 Oct 2021 19:11:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJ722n012787 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:07:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 83C9AADF9; Fri, 22 Oct 2021 19:07:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 67F3217CDB;
	Fri, 22 Oct 2021 19:06:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Fri, 22 Oct 2021 20:06:54 +0100
Message-ID: <163492961456.1038219.2922367243827932852.stgit@warthog.procyon.org.uk>
In-Reply-To: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Subject: [Linux-cachefs] [PATCH v2 34/53] cachefiles: Provide a function to
 check how much space there is
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

Provide a function to check how much space there is.  This also flips the
state on the cache and will signal the daemon to inform it of the change
and to ask it to do some culling if necessary.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/cachefiles/Makefile   |    1 
 fs/cachefiles/daemon.c   |  108 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/cachefiles/internal.h |   15 ++++++
 3 files changed, 124 insertions(+)
 create mode 100644 fs/cachefiles/daemon.c

diff --git a/fs/cachefiles/Makefile b/fs/cachefiles/Makefile
index 183fb5f3b8b1..4c80d9af151f 100644
--- a/fs/cachefiles/Makefile
+++ b/fs/cachefiles/Makefile
@@ -4,6 +4,7 @@
 #
 
 cachefiles-y := \
+	daemon.o \
 	main.o
 
 cachefiles-$(CONFIG_CACHEFILES_ERROR_INJECTION) += error_inject.o
diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
new file mode 100644
index 000000000000..dca2520a14ee
--- /dev/null
+++ b/fs/cachefiles/daemon.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Daemon interface
+ *
+ * Copyright (C) 2021 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/sched.h>
+#include <linux/completion.h>
+#include <linux/slab.h>
+#include <linux/fs.h>
+#include <linux/file.h>
+#include <linux/namei.h>
+#include <linux/poll.h>
+#include <linux/mount.h>
+#include <linux/statfs.h>
+#include <linux/ctype.h>
+#include <linux/string.h>
+#include <linux/fs_struct.h>
+#include "internal.h"
+
+/*
+ * see if we have space for a number of pages and/or a number of files in the
+ * cache
+ */
+int cachefiles_has_space(struct cachefiles_cache *cache,
+			 unsigned fnr, unsigned bnr)
+{
+	struct kstatfs stats;
+	int ret;
+
+	struct path path = {
+		.mnt	= cache->mnt,
+		.dentry	= cache->store,
+	};
+
+	//_enter("{%llu,%llu,%llu,%llu,%llu,%llu},%u,%u",
+	//       (unsigned long long) cache->frun,
+	//       (unsigned long long) cache->fcull,
+	//       (unsigned long long) cache->fstop,
+	//       (unsigned long long) cache->brun,
+	//       (unsigned long long) cache->bcull,
+	//       (unsigned long long) cache->bstop,
+	//       fnr, bnr);
+
+	/* find out how many pages of blockdev are available */
+	memset(&stats, 0, sizeof(stats));
+
+	ret = vfs_statfs(&path, &stats);
+	if (ret < 0) {
+		trace_cachefiles_vfs_error(NULL, d_inode(cache->store), ret,
+					   cachefiles_trace_statfs_error);
+		if (ret == -EIO)
+			cachefiles_io_error(cache, "statfs failed");
+		_leave(" = %d", ret);
+		return ret;
+	}
+
+	stats.f_bavail >>= cache->bshift;
+
+	//_debug("avail %llu,%llu",
+	//       (unsigned long long) stats.f_ffree,
+	//       (unsigned long long) stats.f_bavail);
+
+	/* see if there is sufficient space */
+	if (stats.f_ffree > fnr)
+		stats.f_ffree -= fnr;
+	else
+		stats.f_ffree = 0;
+
+	if (stats.f_bavail > bnr)
+		stats.f_bavail -= bnr;
+	else
+		stats.f_bavail = 0;
+
+	ret = -ENOBUFS;
+	if (stats.f_ffree < cache->fstop ||
+	    stats.f_bavail < cache->bstop)
+		goto begin_cull;
+
+	ret = 0;
+	if (stats.f_ffree < cache->fcull ||
+	    stats.f_bavail < cache->bcull)
+		goto begin_cull;
+
+	if (test_bit(CACHEFILES_CULLING, &cache->flags) &&
+	    stats.f_ffree >= cache->frun &&
+	    stats.f_bavail >= cache->brun &&
+	    test_and_clear_bit(CACHEFILES_CULLING, &cache->flags)
+	    ) {
+		_debug("cease culling");
+		cachefiles_state_changed(cache);
+	}
+
+	//_leave(" = 0");
+	return 0;
+
+begin_cull:
+	if (!test_and_set_bit(CACHEFILES_CULLING, &cache->flags)) {
+		_debug("### CULL CACHE ###");
+		cachefiles_state_changed(cache);
+	}
+
+	_leave(" = %d", ret);
+	return ret;
+}
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 230a1a2bf01d..3ccc8411c502 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -114,6 +114,21 @@ struct cachefiles_cache {
 
 #include <trace/events/cachefiles.h>
 
+/*
+ * note change of state for daemon
+ */
+static inline void cachefiles_state_changed(struct cachefiles_cache *cache)
+{
+	set_bit(CACHEFILES_STATE_CHANGED, &cache->flags);
+	wake_up_all(&cache->daemon_pollwq);
+}
+
+/*
+ * daemon.c
+ */
+extern int cachefiles_has_space(struct cachefiles_cache *cache,
+				unsigned fnr, unsigned bnr);
+
 /*
  * error_inject.c
  */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

