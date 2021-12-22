Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD5447DA70
	for <lists+linux-cachefs@lfdr.de>; Thu, 23 Dec 2021 00:22:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640215342;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c72RNr2BSd0FJBZljklTV3CLNm8k3Ov27P934303Bp4=;
	b=S5iwXhQW5ylAX8AwYLP9sxncx86v5QsgOts+FBy0HbF3bYEWv2HrzyOX554ZkyDFVq+S9y
	tXL8VsFL5oOOeTGU2bbXcU+SiaInQUmElhx9Na4DUtzFjq+OK9Jzo4XCdyFbXi+1h8XV0G
	sqrE5vH5/FEBr269RPuXQ84FwUkJs8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-_a1hSPYnNV6-tjpDQeX4qg-1; Wed, 22 Dec 2021 18:22:19 -0500
X-MC-Unique: _a1hSPYnNV6-tjpDQeX4qg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B5E21006AA4;
	Wed, 22 Dec 2021 23:22:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0344477459;
	Wed, 22 Dec 2021 23:22:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADE224BB7C;
	Wed, 22 Dec 2021 23:22:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BMNMFh3000754 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 22 Dec 2021 18:22:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0F90D2BCDA; Wed, 22 Dec 2021 23:22:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46FDB2BE7D;
	Wed, 22 Dec 2021 23:22:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 22 Dec 2021 23:22:03 +0000
Message-ID: <164021532340.640689.18209494225772443698.stgit@warthog.procyon.org.uk>
In-Reply-To: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Subject: [Linux-cachefs] [PATCH v4 32/68] cachefiles: Add some error
	injection support
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

Add support for injecting ENOSPC or EIO errors.  This needs to be enabled
by CONFIG_CACHEFILES_ERROR_INJECTION=y.  Once enabled, ENOSPC on things
like write and mkdir can be triggered by:

        echo 1 >/proc/sys/cachefiles/error_injection

and EIO can be triggered on most operations by:

        echo 2 >/proc/sys/cachefiles/error_injection

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819624706.215744.6911916249119962943.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/163906925343.143852.5465695512984025812.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/163967134412.1823006.7354285948280296595.stgit@warthog.procyon.org.uk/ # v3
---

 fs/cachefiles/Kconfig        |    7 ++++++
 fs/cachefiles/Makefile       |    2 ++
 fs/cachefiles/error_inject.c |   46 ++++++++++++++++++++++++++++++++++++++++++
 fs/cachefiles/internal.h     |   42 +++++++++++++++++++++++++++++++++++++-
 fs/cachefiles/main.c         |   12 +++++++++++
 5 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 fs/cachefiles/error_inject.c

diff --git a/fs/cachefiles/Kconfig b/fs/cachefiles/Kconfig
index 6827b40f7ddc..719faeeda168 100644
--- a/fs/cachefiles/Kconfig
+++ b/fs/cachefiles/Kconfig
@@ -19,3 +19,10 @@ config CACHEFILES_DEBUG
 	  caching on files module.  If this is set, the debugging output may be
 	  enabled by setting bits in /sys/modules/cachefiles/parameter/debug or
 	  by including a debugging specifier in /etc/cachefilesd.conf.
+
+config CACHEFILES_ERROR_INJECTION
+	bool "Provide error injection for cachefiles"
+	depends on CACHEFILES && SYSCTL
+	help
+	  This permits error injection to be enabled in cachefiles whilst a
+	  cache is in service.
diff --git a/fs/cachefiles/Makefile b/fs/cachefiles/Makefile
index a7f3e982e249..183fb5f3b8b1 100644
--- a/fs/cachefiles/Makefile
+++ b/fs/cachefiles/Makefile
@@ -6,4 +6,6 @@
 cachefiles-y := \
 	main.o
 
+cachefiles-$(CONFIG_CACHEFILES_ERROR_INJECTION) += error_inject.o
+
 obj-$(CONFIG_CACHEFILES) := cachefiles.o
diff --git a/fs/cachefiles/error_inject.c b/fs/cachefiles/error_inject.c
new file mode 100644
index 000000000000..58f8aec964e4
--- /dev/null
+++ b/fs/cachefiles/error_inject.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Error injection handling.
+ *
+ * Copyright (C) 2021 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/sysctl.h>
+#include "internal.h"
+
+unsigned int cachefiles_error_injection_state;
+
+static struct ctl_table_header *cachefiles_sysctl;
+static struct ctl_table cachefiles_sysctls[] = {
+	{
+		.procname	= "error_injection",
+		.data		= &cachefiles_error_injection_state,
+		.maxlen		= sizeof(unsigned int),
+		.mode		= 0644,
+		.proc_handler	= proc_douintvec,
+	},
+	{}
+};
+
+static struct ctl_table cachefiles_sysctls_root[] = {
+	{
+		.procname	= "cachefiles",
+		.mode		= 0555,
+		.child		= cachefiles_sysctls,
+	},
+	{}
+};
+
+int __init cachefiles_register_error_injection(void)
+{
+	cachefiles_sysctl = register_sysctl_table(cachefiles_sysctls_root);
+	if (!cachefiles_sysctl)
+		return -ENOMEM;
+	return 0;
+
+}
+
+void cachefiles_unregister_error_injection(void)
+{
+	unregister_sysctl_table(cachefiles_sysctl);
+}
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index cff4b2a5f928..1f2fea902d3e 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -64,7 +64,47 @@ struct cachefiles_cache {
 
 
 /*
- * Debug tracing.
+ * error_inject.c
+ */
+#ifdef CONFIG_CACHEFILES_ERROR_INJECTION
+extern unsigned int cachefiles_error_injection_state;
+extern int cachefiles_register_error_injection(void);
+extern void cachefiles_unregister_error_injection(void);
+
+#else
+#define cachefiles_error_injection_state 0
+
+static inline int cachefiles_register_error_injection(void)
+{
+	return 0;
+}
+
+static inline void cachefiles_unregister_error_injection(void)
+{
+}
+#endif
+
+
+static inline int cachefiles_inject_read_error(void)
+{
+	return cachefiles_error_injection_state & 2 ? -EIO : 0;
+}
+
+static inline int cachefiles_inject_write_error(void)
+{
+	return cachefiles_error_injection_state & 2 ? -EIO :
+		cachefiles_error_injection_state & 1 ? -ENOSPC :
+		0;
+}
+
+static inline int cachefiles_inject_remove_error(void)
+{
+	return cachefiles_error_injection_state & 2 ? -EIO : 0;
+}
+
+
+/*
+ * Debug tracing
  */
 extern unsigned cachefiles_debug;
 #define CACHEFILES_DEBUG_KENTER	1
diff --git a/fs/cachefiles/main.c b/fs/cachefiles/main.c
index 47bc1cc078de..387d42c7185f 100644
--- a/fs/cachefiles/main.c
+++ b/fs/cachefiles/main.c
@@ -36,8 +36,18 @@ MODULE_LICENSE("GPL");
  */
 static int __init cachefiles_init(void)
 {
+	int ret;
+
+	ret = cachefiles_register_error_injection();
+	if (ret < 0)
+		goto error_einj;
+
 	pr_info("Loaded\n");
 	return 0;
+
+error_einj:
+	pr_err("failed to register: %d\n", ret);
+	return ret;
 }
 
 fs_initcall(cachefiles_init);
@@ -48,6 +58,8 @@ fs_initcall(cachefiles_init);
 static void __exit cachefiles_exit(void)
 {
 	pr_info("Unloading\n");
+
+	cachefiles_unregister_error_injection();
 }
 
 module_exit(cachefiles_exit);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

