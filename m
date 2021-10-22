Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E4388437E5C
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:12:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634929978;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UA7FIJxRcZfYz4RTXo+SJ8sA48vEHUSoU7f5taybsKA=;
	b=gVzK8y5y/n+ArJpAIKdzYDbhnHdZmY6u3w1aUHo5cicdtxGPlY7zYWgp9SlW/79VrYfTOA
	bhKq0y9+RJf7PpZu9VfjMgiMgi14oveCB2fGu5ZnPaEzbifZ7q/tg6GeZ/BEuGQdr1FOa9
	JLMwAVHIRiUFVOCsZEdV2+Rw2qd2vAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-zMEKn9UqPWaGNwZdJTD1-Q-1; Fri, 22 Oct 2021 15:12:55 -0400
X-MC-Unique: zMEKn9UqPWaGNwZdJTD1-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF3C836300;
	Fri, 22 Oct 2021 19:12:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1C23652AC;
	Fri, 22 Oct 2021 19:12:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE1794EA31;
	Fri, 22 Oct 2021 19:12:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJ82vW012883 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:08:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A80A45BAF8; Fri, 22 Oct 2021 19:08:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A4E913ABD;
	Fri, 22 Oct 2021 19:07:56 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Fri, 22 Oct 2021 20:07:55 +0100
Message-ID: <163492967580.1038219.14310300084876500421.stgit@warthog.procyon.org.uk>
In-Reply-To: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Subject: [Linux-cachefs] [PATCH v2 39/53] cachefiles: Implement begin and
	end I/O
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

Implement the routines for beginning and ending an I/O operation.

When beginning an I/O operation, we are guaranteed that the cookie has
reached a certain stage (we're called by fscache after it has done a
suitable wait).

If a file is available, we paste a ref over into the cache resources for
the I/O routines to use.  This means that the object can be invalidated
whilst the I/O is ongoing without needing to synchronise as the file
pointer in the object is replaced, but the file pointer in the cache
resources is unaffected.

Ending the operation just requires ditching any refs we have and dropping
the access guarantee that fscache got for us on the cookie.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/cachefiles/Makefile         |    1 +
 fs/cachefiles/interface.c      |    1 +
 fs/cachefiles/internal.h       |    6 ++++
 fs/cachefiles/io.c             |   57 ++++++++++++++++++++++++++++++++++++++++
 include/trace/events/fscache.h |    2 +
 5 files changed, 67 insertions(+)
 create mode 100644 fs/cachefiles/io.c

diff --git a/fs/cachefiles/Makefile b/fs/cachefiles/Makefile
index 5dd99ca8df05..c0df4c42cb09 100644
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
index b4a0bd2e803f..cfbae3ab66db 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -478,5 +478,6 @@ const struct fscache_cache_ops cachefiles_cache_ops = {
 	.withdraw_cookie	= cachefiles_withdraw_cookie,
 	.invalidate_cookie	= cachefiles_invalidate_cookie,
 	.resize_cookie		= cachefiles_resize_cookie,
+	.begin_operation	= cachefiles_begin_operation,
 	.prepare_to_write	= cachefiles_prepare_to_write,
 };
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 3fa23710fc6f..d3c7db3b058e 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -206,6 +206,12 @@ extern void cachefiles_put_object(struct cachefiles_object *object,
 				  enum cachefiles_obj_ref_trace why);
 extern void cachefiles_sync_cache(struct cachefiles_cache *cache);
 
+/*
+ * io.c
+ */
+extern bool cachefiles_begin_operation(struct netfs_cache_resources *cres,
+				       enum fscache_want_stage want_stage);
+
 /*
  * key.c
  */
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
new file mode 100644
index 000000000000..3839d0905a92
--- /dev/null
+++ b/fs/cachefiles/io.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* kiocb-using read/write
+ *
+ * Copyright (C) 2021 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/mount.h>
+#include <linux/slab.h>
+#include <linux/file.h>
+#include <linux/uio.h>
+#include <linux/falloc.h>
+#include <linux/sched/mm.h>
+#include <trace/events/fscache.h>
+#include "internal.h"
+
+/*
+ * Clean up an operation.
+ */
+static void cachefiles_end_operation(struct netfs_cache_resources *cres)
+{
+	struct file *file = cachefiles_cres_file(cres);
+
+	if (file)
+		fput(file);
+	fscache_end_cookie_access(fscache_cres_cookie(cres), fscache_access_io_end);
+}
+
+static const struct netfs_cache_ops cachefiles_netfs_cache_ops = {
+	.end_operation		= cachefiles_end_operation,
+};
+
+/*
+ * Open the cache file when beginning a cache operation.
+ */
+bool cachefiles_begin_operation(struct netfs_cache_resources *cres,
+				enum fscache_want_stage want_stage)
+{
+	struct cachefiles_object *object = cachefiles_cres_object(cres);
+
+	if (!cachefiles_cres_file(cres)) {
+		cres->ops = &cachefiles_netfs_cache_ops;
+		if (object->file) {
+			spin_lock(&object->lock);
+			if (!cres->cache_priv2 && object->file)
+				cres->cache_priv2 = get_file(object->file);
+			spin_unlock(&object->lock);
+		}
+	}
+
+	if (!cachefiles_cres_file(cres) && want_stage != FSCACHE_WANT_PARAMS) {
+		pr_err("failed to get cres->file\n");
+		return false;
+	}
+
+	return true;
+}
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index 3ebb874b5f0f..86bf79bd3df8 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -77,6 +77,7 @@ enum fscache_access_trace {
 	fscache_access_cache_unpin,
 	fscache_access_invalidate_cookie,
 	fscache_access_invalidate_cookie_end,
+	fscache_access_io_end,
 	fscache_access_io_not_live,
 	fscache_access_io_read,
 	fscache_access_io_resize,
@@ -149,6 +150,7 @@ enum fscache_access_trace {
 	EM(fscache_access_cache_unpin,		"UNPIN cache  ")	\
 	EM(fscache_access_invalidate_cookie,	"BEGIN inval  ")	\
 	EM(fscache_access_invalidate_cookie_end,"END   inval  ")	\
+	EM(fscache_access_io_end,		"END   io     ")	\
 	EM(fscache_access_io_not_live,		"END   io_notl")	\
 	EM(fscache_access_io_read,		"BEGIN io_read")	\
 	EM(fscache_access_io_resize,		"BEGIN io_resz")	\


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

