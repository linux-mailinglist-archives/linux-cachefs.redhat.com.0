Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B8247DA63
	for <lists+linux-cachefs@lfdr.de>; Thu, 23 Dec 2021 00:21:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640215313;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tGRIedCMKvJSZwrS3JQZnRIY6Rev59uKW+QR49khuTE=;
	b=LQCzplMx7hmk2iZZY69aKsEk6g8Vavi1BhrU/cDca62nFpE71s2LrVZGlaOolkVI5HrTbX
	tk+7SJQX08sZzsn5iacymB6FQsZWPMRDlfAeHSxc2g2ABgpeRZyPElg/w33aht0hrWGlNb
	wcjt6FpOAyuxm23uJVKi/Rdh9lI//tk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-AV0MCYFpM6ugY3yQv-0ssw-1; Wed, 22 Dec 2021 18:21:50 -0500
X-MC-Unique: AV0MCYFpM6ugY3yQv-0ssw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62EDB180FCB0;
	Wed, 22 Dec 2021 23:21:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A01D79A27;
	Wed, 22 Dec 2021 23:21:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EAB164BB7C;
	Wed, 22 Dec 2021 23:21:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BMNLe4B000667 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 22 Dec 2021 18:21:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D5AF0798DC; Wed, 22 Dec 2021 23:21:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C8634798D5;
	Wed, 22 Dec 2021 23:21:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 22 Dec 2021 23:21:29 +0000
Message-ID: <164021528993.640689.9069695476048171884.stgit@warthog.procyon.org.uk>
In-Reply-To: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Subject: [Linux-cachefs] [PATCH v4 30/68] cachefiles: Introduce rewritten
	driver
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce basic skeleton of the rewritten cachefiles driver including
config options so that it can be enabled for compilation.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819622766.215744.9108359326983195047.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/163906923341.143852.3856498104256721447.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/163967130320.1823006.15791456613198441566.stgit@warthog.procyon.org.uk/ # v3
---

 fs/Kconfig                        |    1 
 fs/Makefile                       |    1 
 fs/cachefiles/Kconfig             |   21 +++++++
 fs/cachefiles/Makefile            |    9 +++
 fs/cachefiles/internal.h          |  115 +++++++++++++++++++++++++++++++++++++
 fs/cachefiles/main.c              |   53 +++++++++++++++++
 include/trace/events/cachefiles.h |   49 ++++++++++++++++
 7 files changed, 249 insertions(+)
 create mode 100644 fs/cachefiles/Kconfig
 create mode 100644 fs/cachefiles/Makefile
 create mode 100644 fs/cachefiles/internal.h
 create mode 100644 fs/cachefiles/main.c
 create mode 100644 include/trace/events/cachefiles.h

diff --git a/fs/Kconfig b/fs/Kconfig
index 86e311377e6e..a6313a969bc5 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -132,6 +132,7 @@ menu "Caches"
 
 source "fs/netfs/Kconfig"
 source "fs/fscache/Kconfig"
+source "fs/cachefiles/Kconfig"
 
 endmenu
 
diff --git a/fs/Makefile b/fs/Makefile
index 290815f3fd31..84c5e4cdfee5 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -125,6 +125,7 @@ obj-$(CONFIG_AFS_FS)		+= afs/
 obj-$(CONFIG_NILFS2_FS)		+= nilfs2/
 obj-$(CONFIG_BEFS_FS)		+= befs/
 obj-$(CONFIG_HOSTFS)		+= hostfs/
+obj-$(CONFIG_CACHEFILES)	+= cachefiles/
 obj-$(CONFIG_DEBUG_FS)		+= debugfs/
 obj-$(CONFIG_TRACING)		+= tracefs/
 obj-$(CONFIG_OCFS2_FS)		+= ocfs2/
diff --git a/fs/cachefiles/Kconfig b/fs/cachefiles/Kconfig
new file mode 100644
index 000000000000..6827b40f7ddc
--- /dev/null
+++ b/fs/cachefiles/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CACHEFILES
+	tristate "Filesystem caching on files"
+	depends on FSCACHE && BLOCK
+	help
+	  This permits use of a mounted filesystem as a cache for other
+	  filesystems - primarily networking filesystems - thus allowing fast
+	  local disk to enhance the speed of slower devices.
+
+	  See Documentation/filesystems/caching/cachefiles.rst for more
+	  information.
+
+config CACHEFILES_DEBUG
+	bool "Debug CacheFiles"
+	depends on CACHEFILES
+	help
+	  This permits debugging to be dynamically enabled in the filesystem
+	  caching on files module.  If this is set, the debugging output may be
+	  enabled by setting bits in /sys/modules/cachefiles/parameter/debug or
+	  by including a debugging specifier in /etc/cachefilesd.conf.
diff --git a/fs/cachefiles/Makefile b/fs/cachefiles/Makefile
new file mode 100644
index 000000000000..a7f3e982e249
--- /dev/null
+++ b/fs/cachefiles/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for caching in a mounted filesystem
+#
+
+cachefiles-y := \
+	main.o
+
+obj-$(CONFIG_CACHEFILES) := cachefiles.o
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
new file mode 100644
index 000000000000..26e0e23d7702
--- /dev/null
+++ b/fs/cachefiles/internal.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* General netfs cache on cache files internal defs
+ *
+ * Copyright (C) 2021 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#ifdef pr_fmt
+#undef pr_fmt
+#endif
+
+#define pr_fmt(fmt) "CacheFiles: " fmt
+
+
+#include <linux/fscache-cache.h>
+#include <linux/cred.h>
+#include <linux/security.h>
+
+
+/*
+ * Debug tracing.
+ */
+extern unsigned cachefiles_debug;
+#define CACHEFILES_DEBUG_KENTER	1
+#define CACHEFILES_DEBUG_KLEAVE	2
+#define CACHEFILES_DEBUG_KDEBUG	4
+
+#define dbgprintk(FMT, ...) \
+	printk(KERN_DEBUG "[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
+
+#define kenter(FMT, ...) dbgprintk("==> %s("FMT")", __func__, ##__VA_ARGS__)
+#define kleave(FMT, ...) dbgprintk("<== %s()"FMT"", __func__, ##__VA_ARGS__)
+#define kdebug(FMT, ...) dbgprintk(FMT, ##__VA_ARGS__)
+
+
+#if defined(__KDEBUG)
+#define _enter(FMT, ...) kenter(FMT, ##__VA_ARGS__)
+#define _leave(FMT, ...) kleave(FMT, ##__VA_ARGS__)
+#define _debug(FMT, ...) kdebug(FMT, ##__VA_ARGS__)
+
+#elif defined(CONFIG_CACHEFILES_DEBUG)
+#define _enter(FMT, ...)				\
+do {							\
+	if (cachefiles_debug & CACHEFILES_DEBUG_KENTER)	\
+		kenter(FMT, ##__VA_ARGS__);		\
+} while (0)
+
+#define _leave(FMT, ...)				\
+do {							\
+	if (cachefiles_debug & CACHEFILES_DEBUG_KLEAVE)	\
+		kleave(FMT, ##__VA_ARGS__);		\
+} while (0)
+
+#define _debug(FMT, ...)				\
+do {							\
+	if (cachefiles_debug & CACHEFILES_DEBUG_KDEBUG)	\
+		kdebug(FMT, ##__VA_ARGS__);		\
+} while (0)
+
+#else
+#define _enter(FMT, ...) no_printk("==> %s("FMT")", __func__, ##__VA_ARGS__)
+#define _leave(FMT, ...) no_printk("<== %s()"FMT"", __func__, ##__VA_ARGS__)
+#define _debug(FMT, ...) no_printk(FMT, ##__VA_ARGS__)
+#endif
+
+#if 1 /* defined(__KDEBUGALL) */
+
+#define ASSERT(X)							\
+do {									\
+	if (unlikely(!(X))) {						\
+		pr_err("\n");						\
+		pr_err("Assertion failed\n");		\
+		BUG();							\
+	}								\
+} while (0)
+
+#define ASSERTCMP(X, OP, Y)						\
+do {									\
+	if (unlikely(!((X) OP (Y)))) {					\
+		pr_err("\n");						\
+		pr_err("Assertion failed\n");		\
+		pr_err("%lx " #OP " %lx is false\n",			\
+		       (unsigned long)(X), (unsigned long)(Y));		\
+		BUG();							\
+	}								\
+} while (0)
+
+#define ASSERTIF(C, X)							\
+do {									\
+	if (unlikely((C) && !(X))) {					\
+		pr_err("\n");						\
+		pr_err("Assertion failed\n");		\
+		BUG();							\
+	}								\
+} while (0)
+
+#define ASSERTIFCMP(C, X, OP, Y)					\
+do {									\
+	if (unlikely((C) && !((X) OP (Y)))) {				\
+		pr_err("\n");						\
+		pr_err("Assertion failed\n");		\
+		pr_err("%lx " #OP " %lx is false\n",			\
+		       (unsigned long)(X), (unsigned long)(Y));		\
+		BUG();							\
+	}								\
+} while (0)
+
+#else
+
+#define ASSERT(X)			do {} while (0)
+#define ASSERTCMP(X, OP, Y)		do {} while (0)
+#define ASSERTIF(C, X)			do {} while (0)
+#define ASSERTIFCMP(C, X, OP, Y)	do {} while (0)
+
+#endif
diff --git a/fs/cachefiles/main.c b/fs/cachefiles/main.c
new file mode 100644
index 000000000000..47bc1cc078de
--- /dev/null
+++ b/fs/cachefiles/main.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Network filesystem caching backend to use cache files on a premounted
+ * filesystem
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
+#include <linux/mount.h>
+#include <linux/statfs.h>
+#include <linux/sysctl.h>
+#include <linux/miscdevice.h>
+#include <linux/netfs.h>
+#include <trace/events/netfs.h>
+#define CREATE_TRACE_POINTS
+#include "internal.h"
+
+unsigned cachefiles_debug;
+module_param_named(debug, cachefiles_debug, uint, S_IWUSR | S_IRUGO);
+MODULE_PARM_DESC(cachefiles_debug, "CacheFiles debugging mask");
+
+MODULE_DESCRIPTION("Mounted-filesystem based cache");
+MODULE_AUTHOR("Red Hat, Inc.");
+MODULE_LICENSE("GPL");
+
+/*
+ * initialise the fs caching module
+ */
+static int __init cachefiles_init(void)
+{
+	pr_info("Loaded\n");
+	return 0;
+}
+
+fs_initcall(cachefiles_init);
+
+/*
+ * clean up on module removal
+ */
+static void __exit cachefiles_exit(void)
+{
+	pr_info("Unloading\n");
+}
+
+module_exit(cachefiles_exit);
diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
new file mode 100644
index 000000000000..5ee0aabb20be
--- /dev/null
+++ b/include/trace/events/cachefiles.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* CacheFiles tracepoints
+ *
+ * Copyright (C) 2021 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM cachefiles
+
+#if !defined(_TRACE_CACHEFILES_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_CACHEFILES_H
+
+#include <linux/tracepoint.h>
+
+/*
+ * Define enums for tracing information.
+ */
+#ifndef __CACHEFILES_DECLARE_TRACE_ENUMS_ONCE_ONLY
+#define __CACHEFILES_DECLARE_TRACE_ENUMS_ONCE_ONLY
+
+#endif
+
+/*
+ * Define enum -> string mappings for display.
+ */
+
+
+/*
+ * Export enum symbols via userspace.
+ */
+#undef EM
+#undef E_
+#define EM(a, b) TRACE_DEFINE_ENUM(a);
+#define E_(a, b) TRACE_DEFINE_ENUM(a);
+
+/*
+ * Now redefine the EM() and E_() macros to map the enums to the strings that
+ * will be printed in the output.
+ */
+#undef EM
+#undef E_
+#define EM(a, b)	{ a, b },
+#define E_(a, b)	{ a, b }
+
+
+#endif /* _TRACE_CACHEFILES_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

