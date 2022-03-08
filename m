Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6240C4D24D1
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 00:26:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646781994;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mTizRa74cccRgaJidM/ahHpt1aXJ+y2bLKIYW7Fr1KU=;
	b=R4TEdMJMTaG3kqakFczh5VdRhftg3zs0SovnPjMe2WZSiCnHKvmayTcwScMk9wYl8OIrv6
	yzyOPs4m2X88xvLNJHn9lYZT24okeaDS8YrGCoyS+mfMW/fdE981zeXeZPCFl7+NSoW4HE
	c5Vppuz/+rloH3l6tObwxZZ7bskHLhc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-kkO4RQh5PVO4hubtQVrcjQ-1; Tue, 08 Mar 2022 18:26:31 -0500
X-MC-Unique: kkO4RQh5PVO4hubtQVrcjQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0793802809;
	Tue,  8 Mar 2022 23:26:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1A9340CFD23;
	Tue,  8 Mar 2022 23:26:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7F149193213D;
	Tue,  8 Mar 2022 23:26:30 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B99E4194F4AE for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  8 Mar 2022 23:26:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6FE0E78C0F; Tue,  8 Mar 2022 23:26:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FB9A78C12;
 Tue,  8 Mar 2022 23:26:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Tue, 08 Mar 2022 23:26:10 +0000
Message-ID: <164678197044.1200972.11511937252083343775.stgit@warthog.procyon.org.uk>
In-Reply-To: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
References: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Subject: [Linux-cachefs] [PATCH v2 05/19] netfs: Split netfs_io_* object
 handling out
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
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 Dominique Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Split netfs_io_* object handling out into a file that's going to contain
object allocation, get and put routines.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com

Link: https://lore.kernel.org/r/164622995118.3564931.6089530629052064470.stgit@warthog.procyon.org.uk/ # v1
---

 fs/netfs/Makefile      |    6 ++
 fs/netfs/internal.h    |   18 +++++++
 fs/netfs/objects.c     |  123 ++++++++++++++++++++++++++++++++++++++++++++++++
 fs/netfs/read_helper.c |  118 ----------------------------------------------
 4 files changed, 147 insertions(+), 118 deletions(-)
 create mode 100644 fs/netfs/objects.c

diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index c15bfc966d96..939fd00a1fc9 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -1,5 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
-netfs-y := read_helper.o stats.o
+netfs-y := \
+	objects.o \
+	read_helper.o
+
+netfs-$(CONFIG_NETFS_STATS) += stats.o
 
 obj-$(CONFIG_NETFS_SUPPORT) := netfs.o
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index b7f2c4459f33..cf7a3ddb16a4 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -5,17 +5,35 @@
  * Written by David Howells (dhowells@redhat.com)
  */
 
+#include <linux/netfs.h>
+#include <trace/events/netfs.h>
+
 #ifdef pr_fmt
 #undef pr_fmt
 #endif
 
 #define pr_fmt(fmt) "netfs: " fmt
 
+/*
+ * objects.c
+ */
+struct netfs_io_request *netfs_alloc_request(const struct netfs_request_ops *ops,
+					     void *netfs_priv,
+					     struct file *file);
+void netfs_get_request(struct netfs_io_request *rreq);
+void netfs_clear_subrequests(struct netfs_io_request *rreq, bool was_async);
+void netfs_put_request(struct netfs_io_request *rreq, bool was_async);
+struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq);
+void netfs_put_subrequest(struct netfs_io_subrequest *subreq, bool was_async);
+void netfs_get_subrequest(struct netfs_io_subrequest *subreq);
+
 /*
  * read_helper.c
  */
 extern unsigned int netfs_debug;
 
+void netfs_rreq_work(struct work_struct *work);
+
 /*
  * stats.c
  */
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
new file mode 100644
index 000000000000..f7383c28dc6e
--- /dev/null
+++ b/fs/netfs/objects.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Object lifetime handling and tracing.
+ *
+ * Copyright (C) 2022 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/slab.h>
+#include "internal.h"
+
+/*
+ * Allocate an I/O request and initialise it.
+ */
+struct netfs_io_request *netfs_alloc_request(
+	const struct netfs_request_ops *ops, void *netfs_priv,
+	struct file *file)
+{
+	static atomic_t debug_ids;
+	struct netfs_io_request *rreq;
+
+	rreq = kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
+	if (rreq) {
+		rreq->netfs_ops	= ops;
+		rreq->netfs_priv = netfs_priv;
+		rreq->inode	= file_inode(file);
+		rreq->i_size	= i_size_read(rreq->inode);
+		rreq->debug_id	= atomic_inc_return(&debug_ids);
+		INIT_LIST_HEAD(&rreq->subrequests);
+		INIT_WORK(&rreq->work, netfs_rreq_work);
+		refcount_set(&rreq->usage, 1);
+		__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
+		if (ops->init_request)
+			ops->init_request(rreq, file);
+		netfs_stat(&netfs_n_rh_rreq);
+	}
+
+	return rreq;
+}
+
+void netfs_get_request(struct netfs_io_request *rreq)
+{
+	refcount_inc(&rreq->usage);
+}
+
+void netfs_clear_subrequests(struct netfs_io_request *rreq, bool was_async)
+{
+	struct netfs_io_subrequest *subreq;
+
+	while (!list_empty(&rreq->subrequests)) {
+		subreq = list_first_entry(&rreq->subrequests,
+					  struct netfs_io_subrequest, rreq_link);
+		list_del(&subreq->rreq_link);
+		netfs_put_subrequest(subreq, was_async);
+	}
+}
+
+static void netfs_free_request(struct work_struct *work)
+{
+	struct netfs_io_request *rreq =
+		container_of(work, struct netfs_io_request, work);
+	netfs_clear_subrequests(rreq, false);
+	if (rreq->netfs_priv)
+		rreq->netfs_ops->cleanup(rreq->mapping, rreq->netfs_priv);
+	trace_netfs_rreq(rreq, netfs_rreq_trace_free);
+	if (rreq->cache_resources.ops)
+		rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
+	kfree(rreq);
+	netfs_stat_d(&netfs_n_rh_rreq);
+}
+
+void netfs_put_request(struct netfs_io_request *rreq, bool was_async)
+{
+	if (refcount_dec_and_test(&rreq->usage)) {
+		if (was_async) {
+			rreq->work.func = netfs_free_request;
+			if (!queue_work(system_unbound_wq, &rreq->work))
+				BUG();
+		} else {
+			netfs_free_request(&rreq->work);
+		}
+	}
+}
+
+/*
+ * Allocate and partially initialise an I/O request structure.
+ */
+struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq)
+{
+	struct netfs_io_subrequest *subreq;
+
+	subreq = kzalloc(sizeof(struct netfs_io_subrequest), GFP_KERNEL);
+	if (subreq) {
+		INIT_LIST_HEAD(&subreq->rreq_link);
+		refcount_set(&subreq->usage, 2);
+		subreq->rreq = rreq;
+		netfs_get_request(rreq);
+		netfs_stat(&netfs_n_rh_sreq);
+	}
+
+	return subreq;
+}
+
+void netfs_get_subrequest(struct netfs_io_subrequest *subreq)
+{
+	refcount_inc(&subreq->usage);
+}
+
+static void __netfs_put_subrequest(struct netfs_io_subrequest *subreq,
+				   bool was_async)
+{
+	struct netfs_io_request *rreq = subreq->rreq;
+
+	trace_netfs_sreq(subreq, netfs_sreq_trace_free);
+	kfree(subreq);
+	netfs_stat_d(&netfs_n_rh_sreq);
+	netfs_put_request(rreq, was_async);
+}
+
+void netfs_put_subrequest(struct netfs_io_subrequest *subreq, bool was_async)
+{
+	if (refcount_dec_and_test(&subreq->usage))
+		__netfs_put_subrequest(subreq, was_async);
+}
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 26d54055b17e..ef23ef9889d5 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -27,122 +27,6 @@ unsigned netfs_debug;
 module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
 MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
 
-static void netfs_rreq_work(struct work_struct *);
-static void __netfs_put_subrequest(struct netfs_io_subrequest *, bool);
-
-static void netfs_put_subrequest(struct netfs_io_subrequest *subreq,
-				 bool was_async)
-{
-	if (refcount_dec_and_test(&subreq->usage))
-		__netfs_put_subrequest(subreq, was_async);
-}
-
-static struct netfs_io_request *netfs_alloc_request(
-	const struct netfs_request_ops *ops, void *netfs_priv,
-	struct file *file)
-{
-	static atomic_t debug_ids;
-	struct netfs_io_request *rreq;
-
-	rreq = kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
-	if (rreq) {
-		rreq->netfs_ops	= ops;
-		rreq->netfs_priv = netfs_priv;
-		rreq->inode	= file_inode(file);
-		rreq->i_size	= i_size_read(rreq->inode);
-		rreq->debug_id	= atomic_inc_return(&debug_ids);
-		INIT_LIST_HEAD(&rreq->subrequests);
-		INIT_WORK(&rreq->work, netfs_rreq_work);
-		refcount_set(&rreq->usage, 1);
-		__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
-		if (ops->init_request)
-			ops->init_request(rreq, file);
-		netfs_stat(&netfs_n_rh_rreq);
-	}
-
-	return rreq;
-}
-
-static void netfs_get_request(struct netfs_io_request *rreq)
-{
-	refcount_inc(&rreq->usage);
-}
-
-static void netfs_clear_subrequests(struct netfs_io_request *rreq, bool was_async)
-{
-	struct netfs_io_subrequest *subreq;
-
-	while (!list_empty(&rreq->subrequests)) {
-		subreq = list_first_entry(&rreq->subrequests,
-					  struct netfs_io_subrequest, rreq_link);
-		list_del(&subreq->rreq_link);
-		netfs_put_subrequest(subreq, was_async);
-	}
-}
-
-static void netfs_free_request(struct work_struct *work)
-{
-	struct netfs_io_request *rreq =
-		container_of(work, struct netfs_io_request, work);
-	netfs_clear_subrequests(rreq, false);
-	if (rreq->netfs_priv)
-		rreq->netfs_ops->cleanup(rreq->mapping, rreq->netfs_priv);
-	trace_netfs_rreq(rreq, netfs_rreq_trace_free);
-	if (rreq->cache_resources.ops)
-		rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
-	kfree(rreq);
-	netfs_stat_d(&netfs_n_rh_rreq);
-}
-
-static void netfs_put_request(struct netfs_io_request *rreq, bool was_async)
-{
-	if (refcount_dec_and_test(&rreq->usage)) {
-		if (was_async) {
-			rreq->work.func = netfs_free_request;
-			if (!queue_work(system_unbound_wq, &rreq->work))
-				BUG();
-		} else {
-			netfs_free_request(&rreq->work);
-		}
-	}
-}
-
-/*
- * Allocate and partially initialise an I/O request structure.
- */
-static struct netfs_io_subrequest *netfs_alloc_subrequest(
-	struct netfs_io_request *rreq)
-{
-	struct netfs_io_subrequest *subreq;
-
-	subreq = kzalloc(sizeof(struct netfs_io_subrequest), GFP_KERNEL);
-	if (subreq) {
-		INIT_LIST_HEAD(&subreq->rreq_link);
-		refcount_set(&subreq->usage, 2);
-		subreq->rreq = rreq;
-		netfs_get_request(rreq);
-		netfs_stat(&netfs_n_rh_sreq);
-	}
-
-	return subreq;
-}
-
-static void netfs_get_subrequest(struct netfs_io_subrequest *subreq)
-{
-	refcount_inc(&subreq->usage);
-}
-
-static void __netfs_put_subrequest(struct netfs_io_subrequest *subreq,
-				   bool was_async)
-{
-	struct netfs_io_request *rreq = subreq->rreq;
-
-	trace_netfs_sreq(subreq, netfs_sreq_trace_free);
-	kfree(subreq);
-	netfs_stat_d(&netfs_n_rh_sreq);
-	netfs_put_request(rreq, was_async);
-}
-
 /*
  * Clear the unread part of an I/O request.
  */
@@ -558,7 +442,7 @@ static void netfs_rreq_assess(struct netfs_io_request *rreq, bool was_async)
 	netfs_rreq_completed(rreq, was_async);
 }
 
-static void netfs_rreq_work(struct work_struct *work)
+void netfs_rreq_work(struct work_struct *work)
 {
 	struct netfs_io_request *rreq =
 		container_of(work, struct netfs_io_request, work);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

