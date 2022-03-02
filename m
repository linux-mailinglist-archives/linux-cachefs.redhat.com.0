Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DCC4CA7A3
	for <lists+linux-cachefs@lfdr.de>; Wed,  2 Mar 2022 15:10:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646230246;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1sk6zmP9MztmZwr1K6a6i+BZurGhJB4fTbIz2TrlWyM=;
	b=dLCsci7Z1FuNw07SDRr+0iCKszI0OQ2ZnKrQvtunGF01GeeZdOlp16njNK3soM1EQ24uYJ
	i4oMLwTKnENdNisWxb1AiD7tSC3ddo9KBuX7v8Mtgz8fkC8fF9ZKO1bFVIlcW9CUW1RJ9d
	sH7rzq/+Hz/z/jR8CTg3KMcmInIFwgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-dX7w6JqqMh2KV94zpbCdmw-1; Wed, 02 Mar 2022 09:10:41 -0500
X-MC-Unique: dX7w6JqqMh2KV94zpbCdmw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B28619253F5;
	Wed,  2 Mar 2022 14:10:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DD5883599;
	Wed,  2 Mar 2022 14:10:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B8F846F98;
	Wed,  2 Mar 2022 14:10:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 222E7vSX021108 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 2 Mar 2022 09:07:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4A47A7B8CD; Wed,  2 Mar 2022 14:07:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3EFF77B61E;
	Wed,  2 Mar 2022 14:07:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 02 Mar 2022 14:07:49 +0000
Message-ID: <164623006934.3564931.17932680017894039748.stgit@warthog.procyon.org.uk>
In-Reply-To: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
References: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [Linux-cachefs] [PATCH 15/19] netfs: Split some core bits out into
	their own file
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

Split some core bits out into their own file.  More bits will be added to
this file later.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/netfs/Makefile      |    1 +
 fs/netfs/internal.h    |    7 +++++--
 fs/netfs/main.c        |   20 ++++++++++++++++++++
 fs/netfs/read_helper.c |   10 ----------
 4 files changed, 26 insertions(+), 12 deletions(-)
 create mode 100644 fs/netfs/main.c

diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index 0466159b8222..029657b6db63 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -2,6 +2,7 @@
 
 netfs-y := \
 	buffered_read.o \
+	main.o \
 	objects.o \
 	read_helper.o
 
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 7d8e83deaf81..f9dd64521fe6 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -20,6 +20,11 @@
  */
 void netfs_rreq_unlock_folios(struct netfs_io_request *rreq);
 
+/*
+ * main.c
+ */
+extern unsigned int netfs_debug;
+
 /*
  * objects.c
  */
@@ -42,8 +47,6 @@ static inline void netfs_see_request(struct netfs_io_request *rreq,
 /*
  * read_helper.c
  */
-extern unsigned int netfs_debug;
-
 int netfs_begin_read(struct netfs_io_request *rreq, bool sync);
 
 /*
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
new file mode 100644
index 000000000000..068568702957
--- /dev/null
+++ b/fs/netfs/main.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Miscellaneous bits for the netfs support library.
+ *
+ * Copyright (C) 2022 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/module.h>
+#include <linux/export.h>
+#include "internal.h"
+#define CREATE_TRACE_POINTS
+#include <trace/events/netfs.h>
+
+MODULE_DESCRIPTION("Network fs support");
+MODULE_AUTHOR("Red Hat, Inc.");
+MODULE_LICENSE("GPL");
+
+unsigned netfs_debug;
+module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
+MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 78843820d9f1..3db9356eb7c2 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -15,16 +15,6 @@
 #include <linux/sched/mm.h>
 #include <linux/task_io_accounting_ops.h>
 #include "internal.h"
-#define CREATE_TRACE_POINTS
-#include <trace/events/netfs.h>
-
-MODULE_DESCRIPTION("Network fs support");
-MODULE_AUTHOR("Red Hat, Inc.");
-MODULE_LICENSE("GPL");
-
-unsigned netfs_debug;
-module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
-MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
 
 /*
  * Clear the unread part of an I/O request.


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

