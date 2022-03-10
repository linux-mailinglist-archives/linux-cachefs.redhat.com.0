Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 172FC4D4ECA
	for <lists+linux-cachefs@lfdr.de>; Thu, 10 Mar 2022 17:20:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646929219;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ImzFWxKpJ7xIbHO0QnOSYi+n7yIDgvBy8tZjJyVNYfs=;
	b=ZgRQJ6i6kCr41y01MjAOnf7V/SFo+1rUo1b+lP1bLkkNfjzdVJ6sz32mtTLuvJRdu9Hopl
	Ehi7zKDP5gxqPyGPgZxpSoKdDisrYb2cCf72s5x79CGB8xSynBWBwGF1N/Rh1lHcgjauw+
	F2WUUo5AwcS936Ms+09/4YroPEYvFZM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-MqfFVAg6Nb6mYqzW5qWi4A-1; Thu, 10 Mar 2022 11:20:16 -0500
X-MC-Unique: MqfFVAg6Nb6mYqzW5qWi4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52B5D185A7B2;
	Thu, 10 Mar 2022 16:20:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D1E041136E0;
	Thu, 10 Mar 2022 16:20:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B1D12194E012;
	Thu, 10 Mar 2022 16:20:14 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9B32819452D2 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 10 Mar 2022 16:20:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 652827C042; Thu, 10 Mar 2022 16:20:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E4637C038;
 Thu, 10 Mar 2022 16:20:10 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 10 Mar 2022 16:20:09 +0000
Message-ID: <164692920944.2099075.11990502173226013856.stgit@warthog.procyon.org.uk>
In-Reply-To: <164692883658.2099075.5745824552116419504.stgit@warthog.procyon.org.uk>
References: <164692883658.2099075.5745824552116419504.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Subject: [Linux-cachefs] [PATCH v3 18/20] netfs: Split some core bits out
 into their own file
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Split some core bits out into their own file.  More bits will be added to
this file later.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/164623006934.3564931.17932680017894039748.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/164678218407.1200972.1731208226140990280.stgit@warthog.procyon.org.uk/ # v2
---

 fs/netfs/Makefile   |    1 +
 fs/netfs/internal.h |    7 +++++--
 fs/netfs/io.c       |   10 ----------
 fs/netfs/main.c     |   20 ++++++++++++++++++++
 4 files changed, 26 insertions(+), 12 deletions(-)
 create mode 100644 fs/netfs/main.c

diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index 88b904532bc7..f684c0cd1ec5 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -3,6 +3,7 @@
 netfs-y := \
 	buffered_read.o \
 	io.o \
+	main.o \
 	objects.o
 
 netfs-$(CONFIG_NETFS_STATS) += stats.o
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 1cd2778bfa7d..622b421d4753 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -23,10 +23,13 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq);
 /*
  * io.c
  */
-extern unsigned int netfs_debug;
-
 int netfs_begin_read(struct netfs_io_request *rreq, bool sync);
 
+/*
+ * main.c
+ */
+extern unsigned int netfs_debug;
+
 /*
  * objects.c
  */
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 6d43f9ea1b5a..428925899282 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
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


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

