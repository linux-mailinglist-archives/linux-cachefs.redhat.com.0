Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 692DC21DC9A
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Jul 2020 18:34:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594658042;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rOr/4NJyr9NXfPjKB/NP11WxnrAhdY2IMfURQm5g7vo=;
	b=NVlARwBTbx5wL4OiQPy2cJmcD3ll8RA5ydhxQL4QKIQWlvatLqrNtxbs9NI5jv/UrwhQpK
	zMkBh8MsJb3DJRM4mlUiafp1mDW6lmycZvor9jO9FDT3HVw3YysQG4gZHT06wc66TqDVh3
	oM/mRhCazTcKjQpWPBzxq8Ptbe9zBHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-9nMKZ5kLMG28BdI3HN3FNQ-1; Mon, 13 Jul 2020 12:34:00 -0400
X-MC-Unique: 9nMKZ5kLMG28BdI3HN3FNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59AB5800FED;
	Mon, 13 Jul 2020 16:33:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D915772E47;
	Mon, 13 Jul 2020 16:33:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12D9F94EEF;
	Mon, 13 Jul 2020 16:33:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DGXr9O027600 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 12:33:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E23261A836; Mon, 13 Jul 2020 16:33:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-113.rdu2.redhat.com
	[10.10.112.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 251E819D61;
	Mon, 13 Jul 2020 16:33:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>
Date: Mon, 13 Jul 2020 17:33:50 +0100
Message-ID: <159465803035.1376674.12906653212889524200.stgit@warthog.procyon.org.uk>
In-Reply-To: <159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk>
References: <159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 17/32] cachefiles: Implement new fscache I/O
	backend API
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement the new fscache I/O backend API in cachefiles.  The
cachefiles_object struct carries a non-accounted file to the cachefiles
object (so that it doesn't cause ENFILE).

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/Makefile    |    1 +
 fs/cachefiles/interface.c |    3 ++
 fs/cachefiles/internal.h  |   13 +++++++
 fs/cachefiles/io.c        |   87 +++++++++++++++++++++++++++++++++++++++++++++
 fs/cachefiles/namei.c     |    3 ++
 5 files changed, 107 insertions(+)
 create mode 100644 fs/cachefiles/io.c

diff --git a/fs/cachefiles/Makefile b/fs/cachefiles/Makefile
index 3455d3646547..d894d317d6e7 100644
--- a/fs/cachefiles/Makefile
+++ b/fs/cachefiles/Makefile
@@ -7,6 +7,7 @@ cachefiles-y := \
 	bind.o \
 	daemon.o \
 	interface.o \
+	io.o \
 	key.o \
 	main.o \
 	namei.o \
diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 56ed6f203e1c..4ce7ab5c75db 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -465,4 +465,7 @@ const struct fscache_cache_ops cachefiles_cache_ops = {
 	.put_object		= cachefiles_put_object,
 	.get_object_usage	= cachefiles_get_object_usage,
 	.sync_cache		= cachefiles_sync_cache,
+	.shape_request		= cachefiles_shape_request,
+	.read			= cachefiles_read,
+	.write			= cachefiles_write,
 };
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 16d15291a629..b82e7f8b00bd 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -115,6 +115,19 @@ extern const struct fscache_cache_ops cachefiles_cache_ops;
 extern struct fscache_object *cachefiles_grab_object(struct fscache_object *_object,
 						     enum fscache_obj_ref_trace why);
 
+/*
+ * io.c
+ */
+extern void cachefiles_shape_request(struct fscache_object *object,
+				     struct fscache_request_shape *shape);
+extern int cachefiles_read(struct fscache_object *object,
+			   struct fscache_io_request *req,
+			   struct iov_iter *iter);
+extern int cachefiles_write(struct fscache_object *object,
+			    struct fscache_io_request *req,
+			    struct iov_iter *iter);
+extern bool cachefiles_open_object(struct cachefiles_object *obj);
+
 /*
  * key.c
  */
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
new file mode 100644
index 000000000000..89fd4a24e613
--- /dev/null
+++ b/fs/cachefiles/io.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Data I/O routines
+ *
+ * Copyright (C) 2020 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/mount.h>
+#include <linux/slab.h>
+#include <linux/file.h>
+#include <linux/uio.h>
+#include <linux/xattr.h>
+#include "internal.h"
+
+/*
+ * Determine the size of a data extent in a cache object.  This must be written
+ * as a whole unit, but can be read piecemeal.
+ */
+void cachefiles_shape_request(struct fscache_object *object,
+			      struct fscache_request_shape *shape)
+{
+	return 0;
+}
+
+/*
+ * Initiate a read from the cache.
+ */
+int cachefiles_read(struct fscache_object *object,
+		    struct fscache_io_request *req,
+		    struct iov_iter *iter)
+{
+	req->error = -ENODATA;
+	if (req->io_done)
+		req->io_done(req);
+	return -ENODATA;
+}
+
+/*
+ * Initiate a write to the cache.
+ */
+int cachefiles_write(struct fscache_object *object,
+		     struct fscache_io_request *req,
+		     struct iov_iter *iter)
+{
+	req->error = -ENOBUFS;
+	if (req->io_done)
+		req->io_done(req);
+	return -ENOBUFS;
+}
+
+/*
+ * Open a cache object.
+ */
+bool cachefiles_open_object(struct cachefiles_object *object)
+{
+	struct cachefiles_cache *cache =
+		container_of(object->fscache.cache, struct cachefiles_cache, cache);
+	struct file *file;
+	struct path path;
+
+	path.mnt = cache->mnt;
+	path.dentry = object->backer;
+
+	file = open_with_fake_path(&path,
+				   O_RDWR | O_LARGEFILE | O_DIRECT,
+				   d_backing_inode(object->backer),
+				   cache->cache_cred);
+	if (IS_ERR(file))
+		goto error;
+
+	if (!S_ISREG(file_inode(file)->i_mode))
+		goto error_file;
+
+	if (unlikely(!file->f_op->read_iter) ||
+	    unlikely(!file->f_op->write_iter)) {
+		pr_notice("Cache does not support read_iter and write_iter\n");
+		goto error_file;
+	}
+
+	object->backing_file = file;
+	return true;
+
+error_file:
+	fput(file);
+error:
+	return false;
+}
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index d1c8828ebbbb..d9c9a7d7eb8a 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -492,6 +492,9 @@ bool cachefiles_walk_to_object(struct cachefiles_object *parent,
 		} else {
 			BUG(); // TODO: open file in data-class subdir
 		}
+
+		if (!cachefiles_open_object(object))
+			goto check_error;
 	}
 
 	if (object->new)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

