Return-Path: <linux-cachefs+bncBDLIXLMFVAERBU7TYOYQMGQEXNK6N2I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 9030A8B77DF
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:01:56 +0200 (CEST)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-437618fda71sf3870211cf.2
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:01:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485715; cv=pass;
        d=google.com; s=arc-20160816;
        b=GgkktKZlSttpR1J9niA5ym7ecHccbXbXDJ1PAOv5fGntp7jigumRlPZ+diRXsQFwnx
         +DP+tYmluEC1qenIeYx0m5yfCjEjjQalQ/nzppunkcFFiFEWM7rZA6Cy7L3VzrlFKFOu
         fQJmrMwZmBnJRyEeCfiKDreR9l55d1c93ABYpRlU36I4eFp4+ADim8IVB8G3OGzTku4l
         ibdx2MPbElvh2/YvgqXhQ7kkOG30xdJXgEmUYNkoam89sWAtcEz64rvlkK3X3xq55zyD
         ZT1i4/e6ouzKEZcWvsf7sVBv+meXiZpTCvxIpyMetkZG+ekd+uIgfCj1irbgjOfRFUun
         oVrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=ZQebI2FNMulPrmtmZGhgYchGpoSIbtU4JLmykekpT/s=;
        fh=XMH1guqVnzNJvB1PUJWUmOcvFmlLD9TDuHICtr0RO2c=;
        b=AbTfV3zlcpwETFOjTqpmeNkJtHaPaBXn2QRwvZhvcz2kvGrQA0eUOypLxBJRIvXRyC
         Z1heRW9egKYRwT91tJHOYIgDu14vy4NfQF6Rk4Nowy9cWXzc5G+FkrP47hXjNyCBW9Wt
         AQSYy9rNULe3riZKgPhM+pz6ssNZQygI9XuqsWwtG+fsklaZtKMqP25Ts/WbH13ls3l3
         R8L3VTXYIQJnwRNKexBqu+NcD4pbcTJMC5Dp9QU2uMEL6H8QjBw9Wv4e+B2uU3ZyR7Gn
         qp+PFxpjUjE3+RKqLlRX5ekBXn959EUkgxAPS1VGKLeZfDPVgs67xUUC4vxnHigtAadY
         kINQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485715; x=1715090515;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQebI2FNMulPrmtmZGhgYchGpoSIbtU4JLmykekpT/s=;
        b=gW9unmecChywMOl9H2HwHkGUxVPZUeYZ6ut8G1FdFbkjt2UyKae1LJe6rMSYgPynw9
         AZ71dN4VFphPiTNrJXwAztEGyMugc9ujUCBki6A8MV2F6d5sg3sKlskjX1433X7D4yTv
         rLoDHf/lepkS4UMjGX/ZuYBeTTdXbwMR0A/cfCiVZeHnR4kwVeVqWUod/nmAcQMjgf2x
         7zQwkAvHCaA+1KLY3+sNaaBqw5QggWO+sAbg85vp5/Mz2omRYIbMDZcjlENw/qthqs69
         bYEPhKT0BDonGWWNxM4S3U7SrgvErr1V6nd1chaZlmtL0rdA+Av8fDEggc9ZXSN7TSwa
         m/8w==
X-Forwarded-Encrypted: i=2; AJvYcCXb9D2N5M7eQb1J5cv4jR78spV0ddhkYZVoXYV/+nI3Dr7x+rf4njnTNQspyz5dWU7RnZB29auQFy546tCXM80rauOuQs/3Mmo1m1A=
X-Gm-Message-State: AOJu0YzZQCwUV44ZHMiYA8Dpg02CSlZCBe9whRbJVb7Y0i+RHgawmUyw
	gNkQUEdxLvbvV0EhI07wf9bqY46n+q9Nhnl9mM8Z2eVDV0BrISMLyt2DBXiCRGE=
X-Google-Smtp-Source: AGHT+IESnray7O6cl+DmMm9UBLJyYVHloWB39ffbC14paumg6g1mfyHGu9wn2tgxkQA4bD5lEd/4RA==
X-Received: by 2002:a05:622a:a090:b0:43a:5595:7410 with SMTP id jv16-20020a05622aa09000b0043a55957410mr12644013qtb.2.1714485715449;
        Tue, 30 Apr 2024 07:01:55 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:5a8f:b0:439:80de:9876 with SMTP id
 d75a77b69052e-43a3aa6710als11567601cf.0.-pod-prod-00-us; Tue, 30 Apr 2024
 07:01:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXzXR/5ZcZxJDD+qtKlrAdyAoyFvhPYdCrqKHRMT0+05bYn0BHOJP1c2kNmZpf0ImnVLDNL7uEbZ39bFjn+McmfVM5FKsFKQB/gza1J0pk=
X-Received: by 2002:a05:622a:6119:b0:43a:9071:7f5b with SMTP id hg25-20020a05622a611900b0043a90717f5bmr3283350qtb.14.1714485713178;
        Tue, 30 Apr 2024 07:01:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485713; cv=none;
        d=google.com; s=arc-20160816;
        b=ADm8X/dwXFj/9Bql6LP5RlcrNqtKuoH6MRZ4+o3CqcDzk8vcZotH4nXU1O2h+Q40GZ
         IkMoSH7H3+bP5lum1bAG5KrxwdKaPT1COoUT4+vrEGDar5iDSIG0dUGOObfah+qIhx9q
         FnBqdOXvqNenHH0Ej+yILmUzy4XLPASUcu/cVGL/BymBrFzB3a63vWI0mv//PDca8ax1
         iKOa8BrAKW+N6EqnC64NeGpHPvdjVypYH39GjTymKKnk6FRZaa09ZVERdDhsm3ePatdC
         L6PQ+4mjhue+vuJp7PY5JZdQZf4bvPj9OO+QUa4VvDVX5hck11W1umCAyYFuHEXu2U0B
         XITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=gjD+U3QAvMJsWp5JWtEGQmPuhzWaXONmtLXPtsHvH4g=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=RzS3o1q710uBGd5c9O0dSJwpFzMjeiV8UFrMr6KwEl7dEilkYwjMNXZRAbvG7G2lS8
         0S4xC6VUxeRM+Y/O8F7hdWzDb1JNfc2300ievCkZ4qlhC0GTcgudbWMQS8B2yTpHxOoy
         paecDm5ppr5ibxKAUGUeklWQvS43TZEmc1vNssq8zy8ygQ1azD/NFb6Yc00mBgE4PZVS
         wo/vM3ac/4LNZYTT4o93T0fFYv166z524FwGi2oBbV7VF4VmIR7btifjZGl06DnzI/Va
         AZ2CwRuuUlbx/FPG6ykazjH59XL/euoUHY4T/m8tUJPsuMWLctGtPUsLsntCFU5qLxDH
         yXkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id c17-20020ab06ed1000000b007efd002f011si1504958uav.169.2024.04.30.07.01.53
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:01:53 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-yoZTwP5UOXeTpTsRrT7TzA-1; Tue, 30 Apr 2024 10:01:51 -0400
X-MC-Unique: yoZTwP5UOXeTpTsRrT7TzA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58152104B513
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:01:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 5529940C5C3; Tue, 30 Apr 2024 14:01:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 38BD1492BC7;
	Tue, 30 Apr 2024 14:01:45 +0000 (UTC)
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
Subject: [PATCH v2 11/22] netfs: Use mempools for allocating requests and subrequests
Date: Tue, 30 Apr 2024 15:00:42 +0100
Message-ID: <20240430140056.261997-12-dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-1-dhowells@redhat.com>
References: <20240430140056.261997-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
Reviewed-by: Jeff Layton <jlayton@kernel.org>
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

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

