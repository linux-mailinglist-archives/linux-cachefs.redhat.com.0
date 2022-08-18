Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C355984BD
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Aug 2022 15:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660830780;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aYGd5Zx9D2kbxRMKt+USAPMoEWhhj/nsTRUdfNrYVz0=;
	b=QE6lu2qyL+G4wluF3rG64gQ2N0c8+VVlm9w1ujw49eAgfKHu6bcjzJdNh1/2zO7TndSKLn
	gtGBRk92T00H4OXh6sPCZvoMxq35sxxShHunNj4AJ8aT0tsl+1TrJD1koxBHNAu6IcYAFe
	K5vRvoM0gcSPyS1oBsolqhEcXuZX/s8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-_ljC7R27N4SEoImZnIxHdg-1; Thu, 18 Aug 2022 09:52:57 -0400
X-MC-Unique: _ljC7R27N4SEoImZnIxHdg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B41E1824600;
	Thu, 18 Aug 2022 13:52:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F26540D2827;
	Thu, 18 Aug 2022 13:52:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3F63A194E127;
	Thu, 18 Aug 2022 13:52:56 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0B27B1946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 13:52:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D4E3440CFD05; Thu, 18 Aug 2022 13:52:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0D14400EAB2
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 13:52:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B623F811E76
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 13:52:54 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-462-PgQza45-O32kq7zs-p4iqw-1; Thu, 18 Aug 2022 09:52:53 -0400
X-MC-Unique: PgQza45-O32kq7zs-p4iqw-1
Received: by mail-pf1-f179.google.com with SMTP id 130so1597670pfy.6
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 06:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gOTOSimzRInzIF9tRyR7wLEvlpNDEpWviLzVhGKpvgs=;
 b=tc7dBT10jKNyVbh9WqLHn3DohOSFBzlAuMmxjhpYpH7xmY3VfZ0yLdnHYXlSK3oh96
 yHp/nRDGHKPw9tMVn2dgLLNzzbYAhSCNdvYwbyzxj1Mdhek6NE6ZyD7qIf/3m+E+9IN/
 lUmsI+88LqdYDymhFFleF7aElFHLH8q/Rrdgegi6YHmsO6RA1Tfl+pUiakQkMgEMBNGP
 /CQU54jTQkqGTooeI2k+noNqZ+z0pb4Ge4KurAoAopZ0SFqpdv7o58QyLoIkJBtcs+Qs
 SCK0U1+xRhyE5UD3Kp2Yuv46uKBb5bf/SgSxmN8DjN8xV/SRevijAHLcPj3r8K2pvFrZ
 t1FQ==
X-Gm-Message-State: ACgBeo1SsQGLvHdsJbiiQ/U+Lh7l1Y9l1TMYir6D1Yz0sZRzWKwE37Kh
 g6g/D90/7RX9nK06wf823+ji6g==
X-Google-Smtp-Source: AA6agR6P7ElV4nXCTIaBHrH8KRLneoCsGKc20E9YjNNkU13UpJdntmJ71RwZSeWCFQtAb7zJsZNqMA==
X-Received: by 2002:a63:1624:0:b0:41a:9dea:1c80 with SMTP id
 w36-20020a631624000000b0041a9dea1c80mr2531645pgl.400.1660830772110; 
 Thu, 18 Aug 2022 06:52:52 -0700 (PDT)
Received: from C02G705SMD6V.bytedance.net ([139.177.225.242])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a170902ce1100b0016db0d877e4sm1385697plg.221.2022.08.18.06.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:52:51 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	xiang@kernel.org,
	jefflexu@linux.alibaba.com
Date: Thu, 18 Aug 2022 21:52:02 +0800
Message-Id: <20220818135204.49878-4-zhujia.zj@bytedance.com>
In-Reply-To: <20220818135204.49878-1-zhujia.zj@bytedance.com>
References: <20220818135204.49878-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Linux-cachefs] [RFC PATCH 3/5] cachefiles: resend an open request
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
Cc: Jia Zhu <zhujia.zj@bytedance.com>, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
 fs/cachefiles/ondemand.c | 79 +++++++++++++++++++++++++++-------------
 2 files changed, 56 insertions(+), 26 deletions(-)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index cdf4ec781933..66bbd4f1d22a 100644
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
@@ -341,6 +343,7 @@ cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
 
 CACHEFILES_OBJECT_STATE_FUNCS(open);
 CACHEFILES_OBJECT_STATE_FUNCS(close);
+CACHEFILES_OBJECT_STATE_FUNCS(reopening);
 #else
 #define CACHEFILES_ONDEMAND_OBJINFO(object)	NULL
 
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index f51266554e4d..79ffb19380cd 100644
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
@@ -175,6 +171,7 @@ int cachefiles_ondemand_copen(struct cachefiles_cache *cache, char *args)
 	trace_cachefiles_ondemand_copen(req->object, id, size);
 
 	cachefiles_ondemand_set_object_open(req->object);
+	wake_up_all(&cache->daemon_pollwq);
 
 out:
 	complete(&req->done);
@@ -234,6 +231,14 @@ static int cachefiles_ondemand_get_fd(struct cachefiles_req *req)
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
 ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 					char __user *_buffer, size_t buflen)
 {
@@ -249,7 +254,27 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 	 * requests from being processed repeatedly.
 	 */
 	xa_lock(&cache->reqs);
-	req = xas_find_marked(&xas, UINT_MAX, CACHEFILES_REQ_NEW);
+	xas_for_each_marked(&xas, req, UINT_MAX, CACHEFILES_REQ_NEW) {
+		/*
+		 * Reopen the closed object with associated read request.
+		 * Skip read requests whose related object are reopening.
+		 */
+		if (req->msg.opcode == CACHEFILES_OP_READ) {
+			ret = cmpxchg(&CACHEFILES_ONDEMAND_OBJINFO(req->object)->state,
+						  CACHEFILES_ONDEMAND_OBJSTATE_close,
+						  CACHEFILES_ONDEMAND_OBJSTATE_reopening);
+			if (ret == CACHEFILES_ONDEMAND_OBJSTATE_close) {
+				INIT_WORK(&CACHEFILES_ONDEMAND_OBJINFO(req->object)->work,
+						ondemand_object_worker);
+				queue_work(fscache_wq,
+					&CACHEFILES_ONDEMAND_OBJINFO(req->object)->work);
+				continue;
+			} else if (ret == CACHEFILES_ONDEMAND_OBJSTATE_reopening) {
+				continue;
+			}
+		}
+		break;
+	}
 	if (!req) {
 		xa_unlock(&cache->reqs);
 		return 0;
@@ -267,14 +292,18 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
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
+	msg->object_id = CACHEFILES_ONDEMAND_OBJINFO(req->object)->ondemand_id;
+
 	if (copy_to_user(_buffer, msg, n) != 0) {
 		ret = -EFAULT;
 		goto err_put_fd;
@@ -307,19 +336,23 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
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
@@ -357,7 +390,7 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
 		/* coupled with the barrier in cachefiles_flush_reqs() */
 		smp_mb();
 
-		if (opcode != CACHEFILES_OP_OPEN &&
+		if (opcode == CACHEFILES_OP_CLOSE &&
 			!cachefiles_ondemand_object_is_open(object)) {
 			WARN_ON_ONCE(CACHEFILES_ONDEMAND_OBJINFO(object)->ondemand_id == 0);
 			xas_unlock(&xas);
@@ -382,8 +415,12 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
 	wake_up_all(&cache->daemon_pollwq);
 	wait_for_completion(&req->done);
 	ret = req->error;
+	kfree(req);
+	return ret;
 out:
 	kfree(req);
+	if (opcode == CACHEFILES_OP_OPEN)
+		cachefiles_ondemand_set_object_close(req->object);
 	return ret;
 }
 
@@ -435,7 +472,6 @@ static int cachefiles_ondemand_init_close_req(struct cachefiles_req *req,
 	if (!cachefiles_ondemand_object_is_open(object))
 		return -ENOENT;
 
-	req->msg.object_id = CACHEFILES_ONDEMAND_OBJINFO(object)->ondemand_id;
 	trace_cachefiles_ondemand_close(object, &req->msg);
 	return 0;
 }
@@ -451,16 +487,7 @@ static int cachefiles_ondemand_init_read_req(struct cachefiles_req *req,
 	struct cachefiles_object *object = req->object;
 	struct cachefiles_read *load = (void *)req->msg.data;
 	struct cachefiles_read_ctx *read_ctx = private;
-	int object_id = CACHEFILES_ONDEMAND_OBJINFO(object)->ondemand_id;
 
-	/* Stop enqueuing requests when daemon has closed anon_fd. */
-	if (!cachefiles_ondemand_object_is_open(object)) {
-		WARN_ON_ONCE(object_id == 0);
-		pr_info_once("READ: anonymous fd closed prematurely.\n");
-		return -EIO;
-	}
-
-	req->msg.object_id = object_id;
 	load->off = read_ctx->off;
 	load->len = read_ctx->len;
 	trace_cachefiles_ondemand_read(object, &req->msg, load);
-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

