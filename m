Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FB547FCEE
	for <lists+linux-cachefs@lfdr.de>; Mon, 27 Dec 2021 13:55:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-99YV5V-xP1aWsYDMpTwY3Q-1; Mon, 27 Dec 2021 07:55:22 -0500
X-MC-Unique: 99YV5V-xP1aWsYDMpTwY3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAA901800D50;
	Mon, 27 Dec 2021 12:55:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0CE084D1E;
	Mon, 27 Dec 2021 12:55:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 835EC4A7CB;
	Mon, 27 Dec 2021 12:55:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BRCtH19003140 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 27 Dec 2021 07:55:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BEFF51410F38; Mon, 27 Dec 2021 12:55:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA4A8140EBFE
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 12:55:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A03731C05158
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 12:55:16 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
	(out30-57.freemail.mail.aliyun.com [115.124.30.57]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-631-7xXYNVCwNTyE8UBaH9CAzg-1; Mon, 27 Dec 2021 07:55:12 -0500
X-MC-Unique: 7xXYNVCwNTyE8UBaH9CAzg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V.vxTKl_1640609705
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V.vxTKl_1640609705) by smtp.aliyun-inc.com(127.0.0.1);
	Mon, 27 Dec 2021 20:55:06 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon, 27 Dec 2021 20:54:39 +0800
Message-Id: <20211227125444.21187-19-jefflexu@linux.alibaba.com>
In-Reply-To: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [PATCH v1 18/23] cachefiles: use idr tree managing
	pending demand read
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is in prep for implementing .demand_read() callback for cachefiles.

In the following patch, .demand_read() callback is responsible for
notifying user daemon the requested file range (hole) to read. Then
.demand_read() callback will get blocked until user daemon has prepared
data and filled the hole.

This patch introduces an idr tree to manage all these pending
demand-read IO.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/daemon.c   | 3 +++
 fs/cachefiles/internal.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 892a9bdba53f..01496fa8c263 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -118,6 +118,8 @@ static int cachefiles_daemon_open(struct inode *inode, struct file *file)
 	INIT_LIST_HEAD(&cache->volumes);
 	INIT_LIST_HEAD(&cache->object_list);
 	spin_lock_init(&cache->object_list_lock);
+	idr_init(&cache->reqs);
+	spin_lock_init(&cache->reqs_lock);
 
 	/* set default caching limits
 	 * - limit at 1% free space and/or free files
@@ -152,6 +154,7 @@ static int cachefiles_daemon_release(struct inode *inode, struct file *file)
 	cachefiles_daemon_unbind(cache);
 
 	/* clean up the control file interface */
+	idr_destroy(&cache->reqs);
 	cache->cachefilesd = NULL;
 	file->private_data = NULL;
 	cachefiles_open = 0;
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index a8e6500889d7..af8ac8107f77 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -15,6 +15,7 @@
 #include <linux/fscache-cache.h>
 #include <linux/cred.h>
 #include <linux/security.h>
+#include <linux/idr.h>
 
 #define CACHEFILES_DIO_BLOCK_SIZE 4096
 
@@ -102,6 +103,9 @@ struct cachefiles_cache {
 	char				*rootdirname;	/* name of cache root directory */
 	char				*secctx;	/* LSM security context */
 	char				*tag;		/* cache binding tag */
+
+	struct idr			reqs;
+	spinlock_t			reqs_lock;
 };
 
 #include <trace/events/cachefiles.h>
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

