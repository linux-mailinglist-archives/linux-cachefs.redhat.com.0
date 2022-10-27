Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CC38E60F286
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Oct 2022 10:36:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666859785;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bAml+3yr/SlIBpVEQEqheTWiJFZXKMuurwIJsFp3neA=;
	b=f2aH7agB+10qGNgD4vFja42KY82Ik37ceHi+6DHQt21n1IipXaz/jx0A/TDfVlfRdQ5kn8
	am+LT5qE+wene3XMl3TPFOJJivDIQ3sehkoPh1o5WmhUAcCO1aXFZiNwm8VlAXH7ES27oE
	hA9DvvXekPY3nR8zWC2IMBA8PlreZ3M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-dQ1epO5LMsCrt289Y0LWYw-1; Thu, 27 Oct 2022 04:36:23 -0400
X-MC-Unique: dQ1epO5LMsCrt289Y0LWYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D9FB806021;
	Thu, 27 Oct 2022 08:36:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 38B601401C48;
	Thu, 27 Oct 2022 08:36:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 27A841947073;
	Thu, 27 Oct 2022 08:36:15 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 121B91947071 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 08:36:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B9AF81401C3A; Thu, 27 Oct 2022 08:36:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2A6D1401C3B
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C80C857F90
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:07 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-589-dRpvBF5hPieB1C3II6jt3w-1; Thu, 27 Oct 2022 04:36:04 -0400
X-MC-Unique: dRpvBF5hPieB1C3II6jt3w-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VTAlX3P_1666859759
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VTAlX3P_1666859759) by smtp.aliyun-inc.com;
 Thu, 27 Oct 2022 16:36:00 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, jlayton@kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org
Date: Thu, 27 Oct 2022 16:35:47 +0800
Message-Id: <20221027083547.46933-10-jefflexu@linux.alibaba.com>
In-Reply-To: <20221027083547.46933-1-jefflexu@linux.alibaba.com>
References: <20221027083547.46933-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH 9/9] fscache,
 netfs: move "fscache_" prefixed structures to fscache.h
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
Cc: linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since all related structures has been transformed with "fscache_"
prefix, move all these structures to fscache.h as a final cleanup.

Besides, make netfs.h include fscache.h rather than the other way
around.  This is an intuitive change since libnetfs lives one layer
above fscache, accessing backing files with facache.

This is a cleanup without logic change.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/afs/internal.h       |  2 +-
 fs/erofs/fscache.c      |  1 +
 fs/nfs/fscache.h        |  2 +-
 include/linux/fscache.h | 80 ++++++++++++++++++++++++++++++++++++++++-
 include/linux/netfs.h   | 80 +----------------------------------------
 5 files changed, 83 insertions(+), 82 deletions(-)

diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 723d162078a3..5d1314265e3d 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -14,7 +14,7 @@
 #include <linux/key.h>
 #include <linux/workqueue.h>
 #include <linux/sched.h>
-#include <linux/fscache.h>
+#include <linux/netfs.h>
 #include <linux/backing-dev.h>
 #include <linux/uuid.h>
 #include <linux/mm_types.h>
diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index e30a42a35ae7..69531be66b28 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2022, Bytedance Inc. All rights reserved.
  */
 #include <linux/fscache.h>
+#include <linux/netfs.h>
 #include "internal.h"
 
 static DEFINE_MUTEX(erofs_domain_list_lock);
diff --git a/fs/nfs/fscache.h b/fs/nfs/fscache.h
index 2a37af880978..a0715f83a529 100644
--- a/fs/nfs/fscache.h
+++ b/fs/nfs/fscache.h
@@ -12,7 +12,7 @@
 #include <linux/nfs_fs.h>
 #include <linux/nfs_mount.h>
 #include <linux/nfs4_mount.h>
-#include <linux/fscache.h>
+#include <linux/netfs.h>
 #include <linux/iversion.h>
 
 #ifdef CONFIG_NFS_FSCACHE
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 034d009c0de7..457226a396d2 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -15,7 +15,6 @@
 #define _LINUX_FSCACHE_H
 
 #include <linux/fs.h>
-#include <linux/netfs.h>
 #include <linux/writeback.h>
 #include <linux/pagemap.h>
 
@@ -151,6 +150,85 @@ struct fscache_cookie {
 #define FSCACHE_REQ_COPY_TO_CACHE	0	/* Set if should copy the data to the cache */
 #define FSCACHE_REQ_ONDEMAND		1	/* Set if it's from on-demand read mode */
 
+enum fscache_io_source {
+	FSCACHE_FILL_WITH_ZEROES,
+	FSCACHE_DOWNLOAD_FROM_SERVER,
+	FSCACHE_READ_FROM_CACHE,
+	FSCACHE_INVALID_READ,
+} __mode(byte);
+
+typedef void (*fscache_io_terminated_t)(void *priv, ssize_t transferred_or_error,
+				      bool was_async);
+
+/*
+ * Resources required to do operations on a cache.
+ */
+struct fscache_resources {
+	const struct fscache_ops	*ops;
+	void				*cache_priv;
+	void				*cache_priv2;
+	unsigned int			debug_id;	/* Cookie debug ID */
+	unsigned int			inval_counter;	/* object->inval_counter at begin_op */
+};
+
+/*
+ * How to handle reading from a hole.
+ */
+enum fscache_read_from_hole {
+	FSCACHE_READ_HOLE_IGNORE,
+	FSCACHE_READ_HOLE_CLEAR,
+	FSCACHE_READ_HOLE_FAIL,
+};
+
+/*
+ * Table of operations for access to a cache.  This is obtained by
+ * rreq->ops->begin_cache_operation().
+ */
+struct fscache_ops {
+	/* End an operation */
+	void (*end_operation)(struct fscache_resources *cres);
+
+	/* Read data from the cache */
+	int (*read)(struct fscache_resources *cres,
+		    loff_t start_pos,
+		    struct iov_iter *iter,
+		    enum fscache_read_from_hole read_hole,
+		    fscache_io_terminated_t term_func,
+		    void *term_func_priv);
+
+	/* Write data to the cache */
+	int (*write)(struct fscache_resources *cres,
+		     loff_t start_pos,
+		     struct iov_iter *iter,
+		     fscache_io_terminated_t term_func,
+		     void *term_func_priv);
+
+	/* Expand readahead request */
+	void (*expand_readahead)(struct fscache_resources *cres,
+				 loff_t *_start, size_t *_len, loff_t i_size);
+
+	/* Prepare a read operation, shortening it to a cached/uncached
+	 * boundary as appropriate.
+	 */
+	enum fscache_io_source (*prepare_read)(struct fscache_resources *cres,
+					     loff_t *_start, size_t *_len,
+					     unsigned long *_flags, loff_t i_size);
+
+	/* Prepare a write operation, working out what part of the write we can
+	 * actually do.
+	 */
+	int (*prepare_write)(struct fscache_resources *cres,
+			     loff_t *_start, size_t *_len, loff_t i_size,
+			     bool no_space_allocated_yet);
+
+	/* Query the occupancy of the cache in a region, returning where the
+	 * next chunk of data starts and how long it is.
+	 */
+	int (*query_occupancy)(struct fscache_resources *cres,
+			       loff_t start, size_t len, size_t granularity,
+			       loff_t *_data_start, size_t *_data_len);
+};
+
 /*
  * slow-path functions for when there is actually caching available, and the
  * netfs does actually have a valid token
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 2ad4e1e88106..1977f953633a 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -16,19 +16,10 @@
 
 #include <linux/workqueue.h>
 #include <linux/fs.h>
+#include <linux/fscache.h>
 
 enum netfs_sreq_ref_trace;
 
-enum fscache_io_source {
-	FSCACHE_FILL_WITH_ZEROES,
-	FSCACHE_DOWNLOAD_FROM_SERVER,
-	FSCACHE_READ_FROM_CACHE,
-	FSCACHE_INVALID_READ,
-} __mode(byte);
-
-typedef void (*fscache_io_terminated_t)(void *priv, ssize_t transferred_or_error,
-				      bool was_async);
-
 /*
  * Per-inode context.  This wraps the VFS inode.
  */
@@ -41,17 +32,6 @@ struct netfs_inode {
 	loff_t			remote_i_size;	/* Size of the remote file */
 };
 
-/*
- * Resources required to do operations on a cache.
- */
-struct fscache_resources {
-	const struct fscache_ops	*ops;
-	void				*cache_priv;
-	void				*cache_priv2;
-	unsigned int			debug_id;	/* Cookie debug ID */
-	unsigned int			inval_counter;	/* object->inval_counter at begin_op */
-};
-
 /*
  * Descriptor for a single component subrequest.
  */
@@ -128,64 +108,6 @@ struct netfs_request_ops {
 	void (*done)(struct netfs_io_request *rreq);
 };
 
-/*
- * How to handle reading from a hole.
- */
-enum fscache_read_from_hole {
-	FSCACHE_READ_HOLE_IGNORE,
-	FSCACHE_READ_HOLE_CLEAR,
-	FSCACHE_READ_HOLE_FAIL,
-};
-
-/*
- * Table of operations for access to a cache.  This is obtained by
- * rreq->ops->begin_cache_operation().
- */
-struct fscache_ops {
-	/* End an operation */
-	void (*end_operation)(struct fscache_resources *cres);
-
-	/* Read data from the cache */
-	int (*read)(struct fscache_resources *cres,
-		    loff_t start_pos,
-		    struct iov_iter *iter,
-		    enum fscache_read_from_hole read_hole,
-		    fscache_io_terminated_t term_func,
-		    void *term_func_priv);
-
-	/* Write data to the cache */
-	int (*write)(struct fscache_resources *cres,
-		     loff_t start_pos,
-		     struct iov_iter *iter,
-		     fscache_io_terminated_t term_func,
-		     void *term_func_priv);
-
-	/* Expand readahead request */
-	void (*expand_readahead)(struct fscache_resources *cres,
-				 loff_t *_start, size_t *_len, loff_t i_size);
-
-	/* Prepare a read operation, shortening it to a cached/uncached
-	 * boundary as appropriate.
-	 */
-	enum fscache_io_source (*prepare_read)(struct fscache_resources *cres,
-					     loff_t *_start, size_t *_len,
-					     unsigned long *_flags, loff_t i_size);
-
-	/* Prepare a write operation, working out what part of the write we can
-	 * actually do.
-	 */
-	int (*prepare_write)(struct fscache_resources *cres,
-			     loff_t *_start, size_t *_len, loff_t i_size,
-			     bool no_space_allocated_yet);
-
-	/* Query the occupancy of the cache in a region, returning where the
-	 * next chunk of data starts and how long it is.
-	 */
-	int (*query_occupancy)(struct fscache_resources *cres,
-			       loff_t start, size_t len, size_t granularity,
-			       loff_t *_data_start, size_t *_data_len);
-};
-
 struct readahead_control;
 void netfs_readahead(struct readahead_control *);
 int netfs_read_folio(struct file *, struct folio *);
-- 
2.19.1.6.gb485710b

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

