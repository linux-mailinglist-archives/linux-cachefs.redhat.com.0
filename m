Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A8F47FD35
	for <lists+linux-cachefs@lfdr.de>; Mon, 27 Dec 2021 14:01:58 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-UNikqTK0MwCktXp0-VoXTA-1; Mon, 27 Dec 2021 08:01:54 -0500
X-MC-Unique: UNikqTK0MwCktXp0-VoXTA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53FAB802C96;
	Mon, 27 Dec 2021 13:01:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46552703B7;
	Mon, 27 Dec 2021 13:01:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1568D1832B18;
	Mon, 27 Dec 2021 13:01:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BRD1n6K004327 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 27 Dec 2021 08:01:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D32C01410F38; Mon, 27 Dec 2021 13:01:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9351140EBFE
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 13:01:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FCB7185A7B2
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 13:01:49 +0000 (UTC)
Received: from out30-45.freemail.mail.aliyun.com
	(out30-45.freemail.mail.aliyun.com [115.124.30.45]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-374-aX3MKL2GOKSgZ_meHbMKLQ-1; Mon, 27 Dec 2021 08:01:45 -0500
X-MC-Unique: aX3MKL2GOKSgZ_meHbMKLQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R231e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V.w7GZ4_1640609706
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V.w7GZ4_1640609706) by smtp.aliyun-inc.com(127.0.0.1);
	Mon, 27 Dec 2021 20:55:07 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon, 27 Dec 2021 20:54:40 +0800
Message-Id: <20211227125444.21187-20-jefflexu@linux.alibaba.com>
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
Subject: [Linux-cachefs] [PATCH v1 19/23] cachefiles: implement
	.demand_read() for demand read
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

Implement .demand_read() callback for cachefiels backend.

.demand_read() callback is responsible for notifying user daemon the
pending request to process, and will get blocked until user daemon has
prepared data and filled the hole.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/internal.h | 12 +++++++++
 fs/cachefiles/io.c       | 56 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index af8ac8107f77..eeb6ad7dcd49 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -61,6 +61,18 @@ struct cachefiles_object {
 #define CACHEFILES_OBJECT_USING_TMPFILE	0		/* Have an unlinked tmpfile */
 };
 
+struct cachefiles_req_in {
+	uint64_t id;
+	uint64_t off;
+	uint64_t len;
+	char path[NAME_MAX];
+};
+
+struct cachefiles_req {
+	struct completion done;
+	struct cachefiles_req_in req_in;
+};
+
 /*
  * Cache files cache definition
  */
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 60b1eac2ce78..376603e5ed99 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -539,12 +539,68 @@ static void cachefiles_end_operation(struct netfs_cache_resources *cres)
 	fscache_end_cookie_access(fscache_cres_cookie(cres), fscache_access_io_end);
 }
 
+static struct cachefiles_req *cachefiles_alloc_req(struct cachefiles_object *object,
+						   loff_t start_pos,
+						   size_t len)
+{
+	struct cachefiles_req *req;
+	struct cachefiles_req_in *req_in;
+
+	req = kzalloc(sizeof(*req), GFP_KERNEL);
+	if (!req)
+		return NULL;
+
+	req_in = &req->req_in;
+
+	req_in->off = start_pos;
+	req_in->len = len;
+	strncpy(req_in->path, object->d_name, sizeof(req_in->path));
+
+	init_completion(&req->done);
+
+	return req;
+}
+
+int cachefiles_demand_read(struct netfs_cache_resources *cres,
+			   loff_t start_pos, size_t len)
+{
+	struct cachefiles_object *object;
+	struct cachefiles_cache *cache;
+	struct cachefiles_req *req;
+	int ret;
+
+	object = cachefiles_cres_object(cres);
+	cache = object->volume->cache;
+
+	req = cachefiles_alloc_req(object, start_pos, len);
+	if (!req)
+		return -ENOMEM;
+
+	spin_lock(&cache->reqs_lock);
+	ret = idr_alloc(&cache->reqs, req, 0, 0, GFP_KERNEL);
+	if (ret >= 0)
+		req->req_in.id = ret;
+	spin_unlock(&cache->reqs_lock);
+	if (ret < 0) {
+		kfree(req);
+		return -ENOMEM;
+	}
+
+	wake_up_all(&cache->daemon_pollwq);
+
+	wait_for_completion(&req->done);
+	kfree(req);
+
+	return 0;
+}
+
 static const struct netfs_cache_ops cachefiles_netfs_cache_ops = {
 	.end_operation		= cachefiles_end_operation,
 	.read			= cachefiles_read,
 	.write			= cachefiles_write,
 	.prepare_read		= cachefiles_prepare_read,
 	.prepare_write		= cachefiles_prepare_write,
+	.demand_read		= cachefiles_demand_read,
 };
 
 /*
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

