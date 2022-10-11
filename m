Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5CB5FB317
	for <lists+linux-cachefs@lfdr.de>; Tue, 11 Oct 2022 15:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665494184;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qQo0jVkfxiiRV5sJwRwK9Q2wSIWIDOUbYMGiXptN0lQ=;
	b=HSWGyMLs9qGG4l8mpVSevQSQI1S77NdTeE3017dgCPhIrEHlFkfytB0n43rYXnyOfAVoBH
	CSuo6W4qDf5wjxnQ/rccbXnyhkvY3wN6lFpx2d/lrbBDg7hodh+G7Zio++Q1ufxyRSlGaH
	tNZq8Qy/AM7EtEA0LQ9tXCAyHltlkyU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-VjFc-Q4qPK24r7zgH9Hihw-1; Tue, 11 Oct 2022 09:16:20 -0400
X-MC-Unique: VjFc-Q4qPK24r7zgH9Hihw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38C7B101A52A;
	Tue, 11 Oct 2022 13:16:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DC4CE2034;
	Tue, 11 Oct 2022 13:16:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1021A1946A47;
	Tue, 11 Oct 2022 13:16:20 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 17F2119465A0 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 11 Oct 2022 13:16:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EBC4640C6FA2; Tue, 11 Oct 2022 13:16:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E456D40C6FA0
 for <linux-cachefs@redhat.com>; Tue, 11 Oct 2022 13:16:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C52F68027F5
 for <linux-cachefs@redhat.com>; Tue, 11 Oct 2022 13:16:18 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-gOo-YO0uO56Z94BE1TdkWw-1; Tue, 11 Oct 2022 09:16:17 -0400
X-MC-Unique: gOo-YO0uO56Z94BE1TdkWw-1
Received: by mail-pl1-f182.google.com with SMTP id c24so13178046plo.3
 for <linux-cachefs@redhat.com>; Tue, 11 Oct 2022 06:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=54QPvCbeqKVRwur1XuwQUipFUpWsraNrpJ/eYY/JquQ=;
 b=JB1u9D4zjfsvboTvCM0l0lI8vl9KMxB3o2RnCBNwkcrctZHp1NmbrradMSEWZBA2r2
 rbBkvejO466nb9e6hxO5s+NVe4bs9QRbNa+HbCUmcH7Y9mEJMCsARbQLSdPpM4oHozot
 g9+z/fU0hMrYivoWDOX722kFJL5bVUrrMN6BDIHqQ2zW8lm6/pRb7BD7FOKFoLQWVEQC
 XB/0D6oO5DGLXEA1qKS+OHu6zSrlDqknFhuNb5S6cwOyYDnxDL6z33sdB6arsvv/8OdV
 lgUYYeH5/qEGbUG9TETmZlsCMBbRlQuy2ECmluo7xQU6+AiD+TFUBmlOVNHtQa3Jdi9G
 xRqw==
X-Gm-Message-State: ACrzQf0sfRDGzqDNm2w3bJpcTYjnVfg8MjH7fOhNKAiqj0iMUX5YyeGM
 VrUPjJb4QZFOi3nkRor0l2Z8ug==
X-Google-Smtp-Source: AMsMyM6bBpjPDlFDeKIay+83r6b4fdHP3mB7r6nH7F3pEf8tYcfGGxB2LlnxzTUiMaQZw4Su7jvP1A==
X-Received: by 2002:a17:90b:2812:b0:205:cdc9:2ccf with SMTP id
 qb18-20020a17090b281200b00205cdc92ccfmr26144875pjb.97.1665494176123; 
 Tue, 11 Oct 2022 06:16:16 -0700 (PDT)
Received: from C02G705SMD6V.bytedance.net ([63.216.146.190])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a170902654e00b00181f8523f60sm4773415pln.225.2022.10.11.06.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 06:16:15 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	xiang@kernel.org,
	jefflexu@linux.alibaba.com
Date: Tue, 11 Oct 2022 21:15:50 +0800
Message-Id: <20221011131552.23833-4-zhujia.zj@bytedance.com>
In-Reply-To: <20221011131552.23833-1-zhujia.zj@bytedance.com>
References: <20221011131552.23833-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH 3/5] cachefiles: resend an open request if
 the read request's object is closed
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
Cc: linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When an anonymous fd is closed by user daemon, if there is a new read
request for this file comes up, the anonymous fd should be re-opened
to handle that read request rather than fail it directly.

1. Introduce reopening state for objects that are closed but have
   inflight/subsequent read requests.
2. No longer flush READ requests but only CLOSE requests when anonymous
   fd is closed.
3. Enqueue the reopen work to workqueue, thus user daemon could get rid
   of daemon_read context and handle that request smoothly. Otherwise,
   the user daemon will send a reopen request and wait for itself to
   process the request.

Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
Reviewed-by: Xin Yin <yinxin.x@bytedance.com>
---
 fs/cachefiles/internal.h |  3 ++
 fs/cachefiles/ondemand.c | 99 ++++++++++++++++++++++++++++------------
 2 files changed, 73 insertions(+), 29 deletions(-)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index f6cc9a89b6d4..a9f45972945d 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -48,9 +48,11 @@ struct cachefiles_volume {
 enum cachefiles_object_state {
 	CACHEFILES_ONDEMAND_OBJSTATE_close, /* Anonymous fd closed by daemon or initial state */
 	CACHEFILES_ONDEMAND_OBJSTATE_open, /* Anonymous fd associated with object is available */
+	CACHEFILES_ONDEMAND_OBJSTATE_reopening, /* Object that was closed and is being reopened. */
 };
 
 struct cachefiles_ondemand_info {
+	struct work_struct		work;
 	int				ondemand_id;
 	enum cachefiles_object_state	state;
 	struct cachefiles_object	*object;
@@ -337,6 +339,7 @@ cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
 
 CACHEFILES_OBJECT_STATE_FUNCS(open);
 CACHEFILES_OBJECT_STATE_FUNCS(close);
+CACHEFILES_OBJECT_STATE_FUNCS(reopening);
 #else
 static inline ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 					char __user *_buffer, size_t buflen)
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 54581d59847a..69bf5446cc9c 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -18,14 +18,10 @@ static int cachefiles_ondemand_fd_release(struct inode *inode,
 	info->ondemand_id = CACHEFILES_ONDEMAND_ID_CLOSED;
 	cachefiles_ondemand_set_object_close(object);
 
-	/*
-	 * Flush all pending READ requests since their completion depends on
-	 * anon_fd.
-	 */
-	xas_for_each(&xas, req, ULONG_MAX) {
+	/* Only flush CACHEFILES_REQ_NEW marked req to avoid race with daemon_read */
+	xas_for_each_marked(&xas, req, ULONG_MAX, CACHEFILES_REQ_NEW) {
 		if (req->msg.object_id == object_id &&
-		    req->msg.opcode == CACHEFILES_OP_READ) {
-			req->error = -EIO;
+		    req->msg.opcode == CACHEFILES_OP_CLOSE) {
 			complete(&req->done);
 			xas_store(&xas, NULL);
 		}
@@ -179,6 +175,7 @@ int cachefiles_ondemand_copen(struct cachefiles_cache *cache, char *args)
 	trace_cachefiles_ondemand_copen(req->object, id, size);
 
 	cachefiles_ondemand_set_object_open(req->object);
+	wake_up_all(&cache->daemon_pollwq);
 
 out:
 	complete(&req->done);
@@ -238,6 +235,36 @@ static int cachefiles_ondemand_get_fd(struct cachefiles_req *req)
 	return ret;
 }
 
+static void ondemand_object_worker(struct work_struct *work)
+{
+	struct cachefiles_object *object =
+		((struct cachefiles_ondemand_info *)work)->object;
+
+	cachefiles_ondemand_init_object(object);
+}
+
+/*
+ * Reopen the closed object with associated read request.
+ * Skip read requests whose related object are reopening.
+ */
+static bool cachefiles_ondemand_skip_req(struct cachefiles_req *req)
+{
+	struct cachefiles_ondemand_info *info = req->object->private;
+
+	if (!req || req->msg.opcode != CACHEFILES_OP_READ)
+		return false;
+
+	if (info->state == CACHEFILES_ONDEMAND_OBJSTATE_close) {
+		cachefiles_ondemand_set_object_reopening(req->object);
+		queue_work(fscache_wq, &info->work);
+		return true;
+	} else if (info->state == CACHEFILES_ONDEMAND_OBJSTATE_reopening) {
+		return true;
+	}
+
+	return false;
+}
+
 ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 					char __user *_buffer, size_t buflen)
 {
@@ -247,6 +274,7 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 	size_t n;
 	int ret = 0;
 	XA_STATE(xas, &cache->reqs, cache->req_id_next);
+	unsigned long xa_max = ULONG_MAX;
 
 	/*
 	 * Cyclically search for a request that has not ever been processed,
@@ -254,12 +282,18 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 	 * request distribution fair.
 	 */
 	xa_lock(&cache->reqs);
-	req = xas_find_marked(&xas, UINT_MAX, CACHEFILES_REQ_NEW);
-	if (!req && cache->req_id_next > 0) {
-		xas_set(&xas, 0);
-		req = xas_find_marked(&xas, cache->req_id_next - 1, CACHEFILES_REQ_NEW);
+retry:
+	xas_for_each_marked(&xas, req, xa_max, CACHEFILES_REQ_NEW) {
+		if (cachefiles_ondemand_skip_req(req))
+			continue;
+		break;
 	}
 	if (!req) {
+		if (cache->req_id_next > 0 && xa_max == ULONG_MAX) {
+			xas_set(&xas, 0);
+			xa_max = cache->req_id_next - 1;
+			goto retry;
+		}
 		xa_unlock(&cache->reqs);
 		return 0;
 	}
@@ -277,14 +311,18 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 	xa_unlock(&cache->reqs);
 
 	id = xas.xa_index;
-	msg->msg_id = id;
 
 	if (msg->opcode == CACHEFILES_OP_OPEN) {
 		ret = cachefiles_ondemand_get_fd(req);
-		if (ret)
+		if (ret) {
+			cachefiles_ondemand_set_object_close(req->object);
 			goto error;
+		}
 	}
 
+	msg->msg_id = id;
+	msg->object_id = req->object->private->ondemand_id;
+
 	if (copy_to_user(_buffer, msg, n) != 0) {
 		ret = -EFAULT;
 		goto err_put_fd;
@@ -317,19 +355,23 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
 					void *private)
 {
 	struct cachefiles_cache *cache = object->volume->cache;
-	struct cachefiles_req *req;
+	struct cachefiles_req *req = NULL;
 	XA_STATE(xas, &cache->reqs, 0);
 	int ret;
 
 	if (!test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags))
 		return 0;
 
-	if (test_bit(CACHEFILES_DEAD, &cache->flags))
-		return -EIO;
+	if (test_bit(CACHEFILES_DEAD, &cache->flags)) {
+		ret = -EIO;
+		goto out;
+	}
 
 	req = kzalloc(sizeof(*req) + data_len, GFP_KERNEL);
-	if (!req)
-		return -ENOMEM;
+	if (!req) {
+		ret = -ENOMEM;
+		goto out;
+	}
 
 	req->object = object;
 	init_completion(&req->done);
@@ -367,7 +409,7 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
 		/* coupled with the barrier in cachefiles_flush_reqs() */
 		smp_mb();
 
-		if (opcode != CACHEFILES_OP_OPEN &&
+		if (opcode == CACHEFILES_OP_CLOSE &&
 			!cachefiles_ondemand_object_is_open(object)) {
 			WARN_ON_ONCE(object->private->ondemand_id == 0);
 			xas_unlock(&xas);
@@ -392,8 +434,16 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
 	wake_up_all(&cache->daemon_pollwq);
 	wait_for_completion(&req->done);
 	ret = req->error;
+	kfree(req);
+	return ret;
 out:
 	kfree(req);
+	/* Reset the object to close state in error handling path.
+	 * If error occurs after creating the anonymous fd,
+	 * cachefiles_ondemand_fd_release() will set object to close.
+	 */
+	if (opcode == CACHEFILES_OP_OPEN)
+		cachefiles_ondemand_set_object_close(req->object);
 	return ret;
 }
 
@@ -445,7 +495,6 @@ static int cachefiles_ondemand_init_close_req(struct cachefiles_req *req,
 	if (!cachefiles_ondemand_object_is_open(object))
 		return -ENOENT;
 
-	req->msg.object_id = object->private->ondemand_id;
 	trace_cachefiles_ondemand_close(object, &req->msg);
 	return 0;
 }
@@ -461,16 +510,7 @@ static int cachefiles_ondemand_init_read_req(struct cachefiles_req *req,
 	struct cachefiles_object *object = req->object;
 	struct cachefiles_read *load = (void *)req->msg.data;
 	struct cachefiles_read_ctx *read_ctx = private;
-	int object_id = object->private->ondemand_id;
-
-	/* Stop enqueuing requests when daemon has closed anon_fd. */
-	if (!cachefiles_ondemand_object_is_open(object)) {
-		WARN_ON_ONCE(object_id == 0);
-		pr_info_once("READ: anonymous fd closed prematurely.\n");
-		return -EIO;
-	}
 
-	req->msg.object_id = object_id;
 	load->off = read_ctx->off;
 	load->len = read_ctx->len;
 	trace_cachefiles_ondemand_read(object, &req->msg, load);
@@ -519,6 +559,7 @@ int cachefiles_ondemand_init_obj_info(struct cachefiles_object *object,
 		return -ENOMEM;
 
 	object->private->object = object;
+	INIT_WORK(&object->private->work, ondemand_object_worker);
 	return 0;
 }
 
-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

