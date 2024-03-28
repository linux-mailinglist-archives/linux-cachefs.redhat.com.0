Return-Path: <linux-cachefs+bncBDLIXLMFVAERBVNZS2YAMGQESKXEBBQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E5D89057E
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:37:42 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-69173411419sf15142226d6.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:37:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643861; cv=pass;
        d=google.com; s=arc-20160816;
        b=yWm6GvOm7cQ53JPxweehrNDSOs4NSTM97rr7rXdV0wouwIXLDviyN3NAUz13Spz3tf
         HkpVLJbjEkYvCd2kDUDOmni0194tCZKH411fggUwSdXewc6u2NFyNsOaveK6CcuU8+yw
         bwMRqApj7ZD0s3S9aISR/6H5tJ34lSalIKiyU37ZW4M/rGu4dL/vNyC4cJ28VfWtt/tn
         ANzR23g+j/z32h+8+6Q3mz3HxTkrTN6rstbhLW8NfyBP4dJrevzC/PBJVMjuD6XsCRnH
         mSD+mfsxgkKjIQscOadXHxQJL84sMDdPkZvcSPCyoBm8dN7fcCZKaRi2qx7gzi15LIFE
         W5Uw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=oGh7k7nuIwhOMtNTdlO8EhBODqtlL5cTp6YRTHbq0MY=;
        fh=5crfkSML4Iv6GW2SY28TAESckjNOJZPC10u+YZYQfxI=;
        b=gdyttV49qzWSsFKm18j42cRmEdgpeNtY4+/ntULDDU/xJyDkZwFdP0gdzuln0NtlcU
         IHictFJcbXdsRjIOpzHqaXFPutlPbItbGO0n2s4OKGa8vSTInx8tmX4kFRgKAuTi1KPF
         CZEEUnhyr3FJgNH8kzE6+OHc8Kw4OWCom4D25JwxijhNO/P65445qgNDB3jFhCAZ/bn4
         chZ2LA/AXFhfYdL1PRXB8afs6XJze8pK08amh/Lex76F/UnYfeuuLvxK+LtIrN54IQBg
         nxChqE7ElMiW7p7Y+lH2DGPNf11t+mHgsEWMriQJFlTwXKa9BwsH8NOPww7d7cQKj5wy
         yVrQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643861; x=1712248661;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGh7k7nuIwhOMtNTdlO8EhBODqtlL5cTp6YRTHbq0MY=;
        b=ItY+AHm4lVrNpwgoQYxaQL6Ra1SYl+9EApw6b5vbt8ucjqTiEvwSTW/kZ883o1OUxz
         Rivy9Arw5LOpR4sy3kXW3z7OqpsklhYS3N5qkrDINpIs6JwMrw4MnFq1i/yt9n9Rd/wY
         D0JhKL912OOHUZmdUgTwWvU42od8UzLy6ar3ohKzDex8+z5XbTmzunmAa+cLWpKvSnAh
         gBXlNidssLgElbLgiLwhyaFR7aFvwZP8HON382jX4XmCWdSMM7NpG3E8GNBEuKWfmHEW
         gZRJFW1CAIh+YaS3Bmhn1zHYIu/KuNkJH7QLXZqfyUCTqczsgxAAM55/9pCEv634raK3
         VsbA==
X-Forwarded-Encrypted: i=2; AJvYcCXbMskwnAtj8T03I7a7+ejegd/ZcsEI39Vz2E7GQR1FKH2ZhniT1nG3sGqzVwvvu6c/VKIATFkKpSjuVwRm/lewzxPHSgPf9XsJe2w=
X-Gm-Message-State: AOJu0YzkP2iFhBC524VuF0RjeQvJ5K/ROvfMSx+WMzuJ1ULrRauS0JbV
	+87zfaMzFkyUUCdvUgQ5edEx1oSspcrbqPsns4BjNAPyUDmNmj1/SnNMEbhs8f4=
X-Google-Smtp-Source: AGHT+IENJsRcXFIKqPhZMyp3i8MMAW1AAYZGecG6aJx3oiLuzV9niNV5hJA5q1vmG7PSp8MRfMYsSw==
X-Received: by 2002:a05:6214:3008:b0:690:299:1909 with SMTP id ke8-20020a056214300800b0069002991909mr4199625qvb.50.1711643861389;
        Thu, 28 Mar 2024 09:37:41 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:5c8a:0:b0:698:7a54:d877 with SMTP id o10-20020ad45c8a000000b006987a54d877ls895979qvh.2.-pod-prod-05-us;
 Thu, 28 Mar 2024 09:37:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGR/CGOhr1kSMqOxabakL2NU3c1KzG5SuNndMItrbJ6S8FQFHJGYHZOsy49cKP9Pz0+kF0EbpJCj2fDW+JzJcVURABghAY1SqnUmCSVOE=
X-Received: by 2002:ad4:424d:0:b0:698:ec67:aa6f with SMTP id l13-20020ad4424d000000b00698ec67aa6fmr335575qvq.0.1711643860747;
        Thu, 28 Mar 2024 09:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643860; cv=none;
        d=google.com; s=arc-20160816;
        b=pBRkX2AqWvLSsVXM6M1SU1J2SSA7GfF66lU+GsOyeoR8qUMf+GUqStUUfhxfPEU9nv
         MO3vJ56vuUMGNu3gt/D19wA4qho5UbFn/bqEmIbAVeoupYLzOrkJR+y3QoBshtkW5M6x
         dFagBgCmj1P0b7Te8Eq+XZ4ZiGt4zO0ZnDSdrHC1wZXzFLhC/rhVK8MKW9e78ZAomviS
         Yzelw1R1DWrJr8cTMOf0azh+xWt9E6TrgHYhGgBrPXdvSVHHW9RNWa3HbyMBGG7oy8V/
         LLAZu7ISGWqY19xZlcyw28QoP9dKQWc6rFDGXLigRJZ3UxTLxTRIstvT9ksggjklWiuz
         YlvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=UDqhr06HS33V6vFM7dYIX30CATG7yaNP9QU79jSdPNo=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=c4f+8Bf+iLfUkFi4BGKDv9fB3JxWNJCfOxxkMfJ5LSED+56SMmPvN3RHrVyPO61ShE
         oDstMIQ3ZljklGgJyUiXmsbZ6sWhWjUrxd4MmP5uVjxff8q7GuZhECfUy57eohjVm/2W
         x/KzZT/wNRnQwicUBgmqEQGicRTLhXp1BGc1gxmJxGh/yTsmdrH/gWItzyxnjyTiTUy0
         2beYRI4SUamKA2E8C1DntvneJg5lQ4kWdfrWFOfodIBywiU45nGEiKNJl2t2ejBUqiWS
         ic469fNlwT9/qoWtrYxI+1cyjP1yxCoj8qc48mFysK+F2G0C2t9n3alYpS+If2icbGpX
         QdRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id q2-20020a0c8cc2000000b006901ae3295bsi1776305qvb.299.2024.03.28.09.37.40
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-532-SFwYMRucOFqgkzJaY0byKw-1; Thu,
 28 Mar 2024 12:37:38 -0400
X-MC-Unique: SFwYMRucOFqgkzJaY0byKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75F891C008CB
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:37:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 72A3D3C85; Thu, 28 Mar 2024 16:37:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 509B03C20;
	Thu, 28 Mar 2024 16:37:35 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steve French <smfrench@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/26] netfs: Use mempools for allocating requests and subrequests
Date: Thu, 28 Mar 2024 16:34:06 +0000
Message-ID: <20240328163424.2781320-15-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Use mempools for allocating requests and subrequests in an effort to make
sure that allocation always succeeds so that when performing writeback we
can always make progress.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/internal.h   |  2 ++
 fs/netfs/main.c       | 51 ++++++++++++++++++++++++++++++++-----
 fs/netfs/objects.c    | 59 ++++++++++++++++++++++++++++---------------
 include/linux/netfs.h |  5 ++--
 4 files changed, 89 insertions(+), 28 deletions(-)

diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 156ab138e224..c67da478cd2b 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -37,6 +37,8 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync);
 extern unsigned int netfs_debug;
 extern struct list_head netfs_io_requests;
 extern spinlock_t netfs_proc_lock;
+extern mempool_t netfs_request_pool;
+extern mempool_t netfs_subrequest_pool;
 
 #ifdef CONFIG_PROC_FS
 static inline void netfs_proc_add_rreq(struct netfs_io_request *rreq)
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 844efbb2e7a2..4805b9377364 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -7,6 +7,7 @@
 
 #include <linux/module.h>
 #include <linux/export.h>
+#include <linux/mempool.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
 #include "internal.h"
@@ -23,6 +24,11 @@ unsigned netfs_debug;
 module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
 MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
 
+static struct kmem_cache *netfs_request_slab;
+static struct kmem_cache *netfs_subrequest_slab;
+mempool_t netfs_request_pool;
+mempool_t netfs_subrequest_pool;
+
 #ifdef CONFIG_PROC_FS
 LIST_HEAD(netfs_io_requests);
 DEFINE_SPINLOCK(netfs_proc_lock);
@@ -98,25 +104,54 @@ static int __init netfs_init(void)
 {
 	int ret = -ENOMEM;
 
+	netfs_request_slab = kmem_cache_create("netfs_request",
+					       sizeof(struct netfs_io_request), 0,
+					       SLAB_HWCACHE_ALIGN | SLAB_ACCOUNT,
+					       NULL);
+	if (!netfs_request_slab)
+		goto error_req;
+
+	if (mempool_init_slab_pool(&netfs_request_pool, 100, netfs_request_slab) < 0)
+		goto error_reqpool;
+
+	netfs_subrequest_slab = kmem_cache_create("netfs_subrequest",
+						  sizeof(struct netfs_io_subrequest), 0,
+						  SLAB_HWCACHE_ALIGN | SLAB_ACCOUNT,
+						  NULL);
+	if (!netfs_subrequest_slab)
+		goto error_subreq;
+
+	if (mempool_init_slab_pool(&netfs_subrequest_pool, 100, netfs_subrequest_slab) < 0)
+		goto error_subreqpool;
+
 	if (!proc_mkdir("fs/netfs", NULL))
-		goto error;
+		goto error_proc;
 	if (!proc_create_seq("fs/netfs/requests", S_IFREG | 0444, NULL,
 			     &netfs_requests_seq_ops))
-		goto error_proc;
+		goto error_procfile;
 #ifdef CONFIG_FSCACHE_STATS
 	if (!proc_create_single("fs/netfs/stats", S_IFREG | 0444, NULL,
 				netfs_stats_show))
-		goto error_proc;
+		goto error_procfile;
 #endif
 
 	ret = fscache_init();
 	if (ret < 0)
-		goto error_proc;
+		goto error_fscache;
 	return 0;
 
-error_proc:
+error_fscache:
+error_procfile:
 	remove_proc_entry("fs/netfs", NULL);
-error:
+error_proc:
+	mempool_exit(&netfs_subrequest_pool);
+error_subreqpool:
+	kmem_cache_destroy(netfs_subrequest_slab);
+error_subreq:
+	mempool_exit(&netfs_request_pool);
+error_reqpool:
+	kmem_cache_destroy(netfs_request_slab);
+error_req:
 	return ret;
 }
 fs_initcall(netfs_init);
@@ -125,5 +160,9 @@ static void __exit netfs_exit(void)
 {
 	fscache_exit();
 	remove_proc_entry("fs/netfs", NULL);
+	mempool_exit(&netfs_subrequest_pool);
+	kmem_cache_destroy(netfs_subrequest_slab);
+	mempool_exit(&netfs_request_pool);
+	kmem_cache_destroy(netfs_request_slab);
 }
 module_exit(netfs_exit);
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 8acc03a64059..1a4e2ce735ce 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -6,6 +6,8 @@
  */
 
 #include <linux/slab.h>
+#include <linux/mempool.h>
+#include <linux/delay.h>
 #include "internal.h"
 
 /*
@@ -20,17 +22,22 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	struct inode *inode = file ? file_inode(file) : mapping->host;
 	struct netfs_inode *ctx = netfs_inode(inode);
 	struct netfs_io_request *rreq;
+	mempool_t *mempool = ctx->ops->request_pool ?: &netfs_request_pool;
+	struct kmem_cache *cache = mempool->pool_data;
 	bool is_unbuffered = (origin == NETFS_UNBUFFERED_WRITE ||
 			      origin == NETFS_DIO_READ ||
 			      origin == NETFS_DIO_WRITE);
 	bool cached = !is_unbuffered && netfs_is_cache_enabled(ctx);
 	int ret;
 
-	rreq = kzalloc(ctx->ops->io_request_size ?: sizeof(struct netfs_io_request),
-		       GFP_KERNEL);
-	if (!rreq)
-		return ERR_PTR(-ENOMEM);
+	for (;;) {
+		rreq = mempool_alloc(mempool, GFP_KERNEL);
+		if (rreq)
+			break;
+		msleep(10);
+	}
 
+	memset(rreq, 0, kmem_cache_size(cache));
 	rreq->start	= start;
 	rreq->len	= len;
 	rreq->upper_len	= len;
@@ -56,7 +63,7 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	if (rreq->netfs_ops->init_request) {
 		ret = rreq->netfs_ops->init_request(rreq, file);
 		if (ret < 0) {
-			kfree(rreq);
+			mempool_free(rreq, rreq->netfs_ops->request_pool ?: &netfs_request_pool);
 			return ERR_PTR(ret);
 		}
 	}
@@ -88,6 +95,14 @@ void netfs_clear_subrequests(struct netfs_io_request *rreq, bool was_async)
 	}
 }
 
+static void netfs_free_request_rcu(struct rcu_head *rcu)
+{
+	struct netfs_io_request *rreq = container_of(rcu, struct netfs_io_request, rcu);
+
+	mempool_free(rreq, rreq->netfs_ops->request_pool ?: &netfs_request_pool);
+	netfs_stat_d(&netfs_n_rh_rreq);
+}
+
 static void netfs_free_request(struct work_struct *work)
 {
 	struct netfs_io_request *rreq =
@@ -110,8 +125,7 @@ static void netfs_free_request(struct work_struct *work)
 		}
 		kvfree(rreq->direct_bv);
 	}
-	kfree_rcu(rreq, rcu);
-	netfs_stat_d(&netfs_n_rh_rreq);
+	call_rcu(&rreq->rcu, netfs_free_request_rcu);
 }
 
 void netfs_put_request(struct netfs_io_request *rreq, bool was_async,
@@ -143,20 +157,25 @@ void netfs_put_request(struct netfs_io_request *rreq, bool was_async,
 struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq)
 {
 	struct netfs_io_subrequest *subreq;
-
-	subreq = kzalloc(rreq->netfs_ops->io_subrequest_size ?:
-			 sizeof(struct netfs_io_subrequest),
-			 GFP_KERNEL);
-	if (subreq) {
-		INIT_WORK(&subreq->work, NULL);
-		INIT_LIST_HEAD(&subreq->rreq_link);
-		refcount_set(&subreq->ref, 2);
-		subreq->rreq = rreq;
-		subreq->debug_index = atomic_inc_return(&rreq->subreq_counter);
-		netfs_get_request(rreq, netfs_rreq_trace_get_subreq);
-		netfs_stat(&netfs_n_rh_sreq);
+	mempool_t *mempool = rreq->netfs_ops->subrequest_pool ?: &netfs_subrequest_pool;
+	struct kmem_cache *cache = mempool->pool_data;
+
+	for (;;) {
+		subreq = mempool_alloc(rreq->netfs_ops->subrequest_pool ?: &netfs_subrequest_pool,
+				       GFP_KERNEL);
+		if (subreq)
+			break;
+		msleep(10);
 	}
 
+	memset(subreq, 0, kmem_cache_size(cache));
+	INIT_WORK(&subreq->work, NULL);
+	INIT_LIST_HEAD(&subreq->rreq_link);
+	refcount_set(&subreq->ref, 2);
+	subreq->rreq = rreq;
+	subreq->debug_index = atomic_inc_return(&rreq->subreq_counter);
+	netfs_get_request(rreq, netfs_rreq_trace_get_subreq);
+	netfs_stat(&netfs_n_rh_sreq);
 	return subreq;
 }
 
@@ -178,7 +197,7 @@ static void netfs_free_subrequest(struct netfs_io_subrequest *subreq,
 	trace_netfs_sreq(subreq, netfs_sreq_trace_free);
 	if (rreq->netfs_ops->free_subrequest)
 		rreq->netfs_ops->free_subrequest(subreq);
-	kfree(subreq);
+	mempool_free(subreq, rreq->netfs_ops->subrequest_pool ?: &netfs_subrequest_pool);
 	netfs_stat_d(&netfs_n_rh_sreq);
 	netfs_put_request(rreq, was_async, netfs_rreq_trace_put_subreq);
 }
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 3af589dabd7f..0b6c2c2d3c23 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -20,6 +20,7 @@
 #include <linux/uio.h>
 
 enum netfs_sreq_ref_trace;
+typedef struct mempool_s mempool_t;
 
 /**
  * folio_start_private_2 - Start an fscache write on a folio.  [DEPRECATED]
@@ -236,8 +237,8 @@ struct netfs_io_request {
  * Operations the network filesystem can/must provide to the helpers.
  */
 struct netfs_request_ops {
-	unsigned int	io_request_size;	/* Alloc size for netfs_io_request struct */
-	unsigned int	io_subrequest_size;	/* Alloc size for netfs_io_subrequest struct */
+	mempool_t *request_pool;
+	mempool_t *subrequest_pool;
 	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
 	void (*free_request)(struct netfs_io_request *rreq);
 	void (*free_subrequest)(struct netfs_io_subrequest *rreq);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

