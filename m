Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C106653AC
	for <lists+linux-cachefs@lfdr.de>; Wed, 11 Jan 2023 06:25:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673414750;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JMKEoY/tHMVJPeoRKI0zmObyQ8e9LQhJ1zJbzzelDUs=;
	b=hzLFlKKQnLvqPOK0WMqM3QOg5GMgkzrGx6mEpcIx1Jlk77ZBNLnbY6el7TUZD15adgSc7J
	InuB1krFDXaQPZ2USmlsjO2cQD0YWvcuafkbA+kCpdkNKgw97FKdqj6AIa+X2GTquO0xYw
	DgNjGooTQa/n2rswN5m1fND16GaZGBY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-venRjdMzNDiE7fdnspgokQ-1; Wed, 11 Jan 2023 00:25:47 -0500
X-MC-Unique: venRjdMzNDiE7fdnspgokQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DBD5185A78B;
	Wed, 11 Jan 2023 05:25:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 818042166B26;
	Wed, 11 Jan 2023 05:25:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2E495194E11E;
	Wed, 11 Jan 2023 05:25:41 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4BD2F194E125 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 11 Jan 2023 05:25:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3174EC16031; Wed, 11 Jan 2023 05:25:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A725C15BA0
 for <linux-cachefs@redhat.com>; Wed, 11 Jan 2023 05:25:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BF5038123B5
 for <linux-cachefs@redhat.com>; Wed, 11 Jan 2023 05:25:39 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-0JqsyouDPrOz9EnTvgNhVw-1; Wed, 11 Jan 2023 00:25:37 -0500
X-MC-Unique: 0JqsyouDPrOz9EnTvgNhVw-1
Received: by mail-pl1-f181.google.com with SMTP id w3so15644508ply.3
 for <linux-cachefs@redhat.com>; Tue, 10 Jan 2023 21:25:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NxesNgIdPvkYanE3SX5ef2YSm8oaM0kD5UaXuDy462Q=;
 b=2ntxGCUxazN8gNDKaaMxtyPXvAm7eF63L9zjt4itDynGGpyvIej1I3DaXAAbaV3ODC
 wtPLd6Pk4G7w2tKFNnFCA2yyUBey6N9iaXqC9zsn/Ewqga1uzwA5Kda4cCSMZRabCDuw
 9WDTRGQJT+B8kEfjMtu7pt25y9WmnnQI2QWZPMcBD/8EXLMSuN3Rl/2ydTQUnVu6toJx
 fQokVA59ECIWUdtDc1ABRb0KSUSXKYbMxuiXM9tBcbyRhBAiFLpo9d67RT1RGnbXLdwK
 RqRxmkxxFwyc1uwfUGmnbvNm/oIK607BHDhxc4MnOLShMSpdyAM8Y4+HPmRFcZe9c5oj
 rHoQ==
X-Gm-Message-State: AFqh2koukbCiCqGDwSAz51d6HEDHv9JkBWmi7MluLsl7X8GrrOHOL+Xf
 bwHofZXLfSAf6pIeoXXZ/bAY2Q==
X-Google-Smtp-Source: AMrXdXuO0ZPDXMIOMbCD/Hi/5+FHuAkaicXDahG3V2hxMA5wMMfhntKWagfgbD4/xkr/5xmDfgV4dQ==
X-Received: by 2002:a17:902:aa82:b0:193:2f1a:65b1 with SMTP id
 d2-20020a170902aa8200b001932f1a65b1mr1257700plr.59.1673414736334; 
 Tue, 10 Jan 2023 21:25:36 -0800 (PST)
Received: from C02G705SMD6V.bytedance.net ([61.213.176.10])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a170903244a00b0019334350ce6sm4934520pls.244.2023.01.10.21.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 21:25:36 -0800 (PST)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com
Date: Wed, 11 Jan 2023 13:25:13 +0800
Message-Id: <20230111052515.53941-4-zhujia.zj@bytedance.com>
In-Reply-To: <20230111052515.53941-1-zhujia.zj@bytedance.com>
References: <20230111052515.53941-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Linux-cachefs] [PATCH V4 3/5] cachefiles: resend an open request
 if the read request's object is closed
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/internal.h |  3 ++
 fs/cachefiles/ondemand.c | 98 ++++++++++++++++++++++++++++------------
 2 files changed, 72 insertions(+), 29 deletions(-)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index beaf3a8785ce..2ed836d4169e 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -47,9 +47,11 @@ struct cachefiles_volume {
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
@@ -323,6 +325,7 @@ cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
 
 CACHEFILES_OBJECT_STATE_FUNCS(open);
 CACHEFILES_OBJECT_STATE_FUNCS(close);
+CACHEFILES_OBJECT_STATE_FUNCS(reopening);
 #else
 static inline ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 					char __user *_buffer, size_t buflen)
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 6e47667c6690..8e7f8c152a5b 100644
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
@@ -222,7 +219,6 @@ static int cachefiles_ondemand_get_fd(struct cachefiles_req *req)
 
 	load = (void *)req->msg.data;
 	load->fd = fd;
-	req->msg.object_id = object_id;
 	object->private->ondemand_id = object_id;
 
 	cachefiles_get_unbind_pincount(cache);
@@ -238,6 +234,43 @@ static int cachefiles_ondemand_get_fd(struct cachefiles_req *req)
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
+ * If there are any inflight or subsequent READ requests on the
+ * closed object, reopen it.
+ * Skip read requests whose related object is reopening.
+ */
+static struct cachefiles_req *cachefiles_ondemand_select_req(struct xa_state *xas,
+							      unsigned long xa_max)
+{
+	struct cachefiles_req *req;
+	struct cachefiles_object *object;
+	struct cachefiles_ondemand_info *info;
+
+	xas_for_each_marked(xas, req, xa_max, CACHEFILES_REQ_NEW) {
+		if (req->msg.opcode != CACHEFILES_OP_READ)
+			return req;
+		object = req->object;
+		info = object->private;
+		if (cachefiles_ondemand_object_is_close(object)) {
+			cachefiles_ondemand_set_object_reopening(object);
+			queue_work(fscache_wq, &info->work);
+			continue;
+		} else if (cachefiles_ondemand_object_is_reopening(object)) {
+			continue;
+		}
+		return req;
+	}
+	return NULL;
+}
+
 ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 					char __user *_buffer, size_t buflen)
 {
@@ -248,16 +281,16 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 	int ret = 0;
 	XA_STATE(xas, &cache->reqs, cache->req_id_next);
 
+	xa_lock(&cache->reqs);
 	/*
 	 * Cyclically search for a request that has not ever been processed,
 	 * to prevent requests from being processed repeatedly, and make
 	 * request distribution fair.
 	 */
-	xa_lock(&cache->reqs);
-	req = xas_find_marked(&xas, UINT_MAX, CACHEFILES_REQ_NEW);
+	req = cachefiles_ondemand_select_req(&xas, ULONG_MAX);
 	if (!req && cache->req_id_next > 0) {
 		xas_set(&xas, 0);
-		req = xas_find_marked(&xas, cache->req_id_next - 1, CACHEFILES_REQ_NEW);
+		req = cachefiles_ondemand_select_req(&xas, cache->req_id_next - 1);
 	}
 	if (!req) {
 		xa_unlock(&cache->reqs);
@@ -277,14 +310,18 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
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
@@ -317,19 +354,23 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
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
@@ -367,7 +408,7 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
 		/* coupled with the barrier in cachefiles_flush_reqs() */
 		smp_mb();
 
-		if (opcode != CACHEFILES_OP_OPEN &&
+		if (opcode == CACHEFILES_OP_CLOSE &&
 			!cachefiles_ondemand_object_is_open(object)) {
 			WARN_ON_ONCE(object->private->ondemand_id == 0);
 			xas_unlock(&xas);
@@ -392,7 +433,15 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
 	wake_up_all(&cache->daemon_pollwq);
 	wait_for_completion(&req->done);
 	ret = req->error;
+	kfree(req);
+	return ret;
 out:
+	/* Reset the object to close state in error handling path.
+	 * If error occurs after creating the anonymous fd,
+	 * cachefiles_ondemand_fd_release() will set object to close.
+	 */
+	if (opcode == CACHEFILES_OP_OPEN)
+		cachefiles_ondemand_set_object_close(object);
 	kfree(req);
 	return ret;
 }
@@ -439,7 +488,6 @@ static int cachefiles_ondemand_init_close_req(struct cachefiles_req *req,
 	if (!cachefiles_ondemand_object_is_open(object))
 		return -ENOENT;
 
-	req->msg.object_id = object->private->ondemand_id;
 	trace_cachefiles_ondemand_close(object, &req->msg);
 	return 0;
 }
@@ -455,16 +503,7 @@ static int cachefiles_ondemand_init_read_req(struct cachefiles_req *req,
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
@@ -513,6 +552,7 @@ int cachefiles_ondemand_init_obj_info(struct cachefiles_object *object,
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

