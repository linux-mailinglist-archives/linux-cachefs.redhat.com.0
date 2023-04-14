Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EED76E293C
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Apr 2023 19:24:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681493054;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=94LRld6rOsmRZpqHRSYEWypcnca1Wl7lExldrYw567g=;
	b=ZYBj5AwICG7Dp1v7dx4Pje49oYrl9SJlTgXrmfa+mGLsUssaOkcwxwK5mwr2Agowj+VWQX
	bnBLyyCUOLETqAaLLQiW3bg9+C2K9n87Yd3UHqilhRRSthbOF/fJd3t5EdfhCRX//kupc4
	Ec+fPVpwNYyZ1Ge+Qvc1jOSZkFR+xRU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-aB1k6-EWOgeKWFWsNXUy6g-1; Fri, 14 Apr 2023 13:24:07 -0400
X-MC-Unique: aB1k6-EWOgeKWFWsNXUy6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1F9F899719;
	Fri, 14 Apr 2023 17:23:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A731F2166B26;
	Fri, 14 Apr 2023 17:23:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9241719472CD;
	Fri, 14 Apr 2023 17:23:58 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D691B1946589 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 14 Apr 2023 17:23:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CC7392166B29; Fri, 14 Apr 2023 17:23:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4EF02166B26
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 17:23:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5E2F1C08998
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 17:23:57 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-93D7SnhJM8aRjUMQSF49dQ-1; Fri, 14 Apr 2023 13:23:35 -0400
X-MC-Unique: 93D7SnhJM8aRjUMQSF49dQ-1
Received: by mail-pj1-f42.google.com with SMTP id
 x8-20020a17090a6b4800b002474c5d3367so1205684pjl.2
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 10:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681493009; x=1684085009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ySOXSnP6FL6oSMQRzhqbuOuGsOFMLOtSkAgA+zIYAhs=;
 b=ZxPINFmvvqzvS0topPMwDgtV6T751ki17fkks+KlI/QUXlyLDgBHknQB7R1x3rjfEf
 pfDEpUzrgFvqLVl3MGLTvd5wLuOnjt0NIkOF8AkWpx/WP5PAGbOUo6XCwj+U6MmwjcdI
 N/2g7iikrzCDSRyQqBMg2hcACGbCBrfmw7DBlEBO414Vvnu7L26sIgBbmtJOM4Ap9MWk
 jBheIvFKMfPhJpy3k+ezCUuKYrgN8HAh/KDSlVgUrQEM6Wwh+lziVTbEfknn8Xn+Wwfr
 7+/1aSoA/KB0FPN+QK9H+zMtMbZUCOc72KJjsRS+vtZHPtHBMZjtmFbNIgotdRc0ufnc
 Zwug==
X-Gm-Message-State: AAQBX9cm6AXXtTadQeH9dTS7HpzjxhhoZrjYqAX1MCVwPEIcoTNMiNhs
 aleFHt9cGpWRKgWvTHkkVBUJbQ==
X-Google-Smtp-Source: AKy350aUIfhABV2qJLYSpnCZf5HFsHPszz3L9dpjR1MFYKPvX5SrRzhJXnuQwExqdOthzsjNm9reyg==
X-Received: by 2002:a17:90a:460e:b0:23f:7e2e:fe13 with SMTP id
 w14-20020a17090a460e00b0023f7e2efe13mr6442173pjg.0.1681493009218; 
 Fri, 14 Apr 2023 10:23:29 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.243])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a631f4c000000b0051b8172fa68sm370315pgm.38.2023.04.14.10.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 10:23:28 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Sat, 15 Apr 2023 01:22:37 +0800
Message-Id: <20230414172239.33743-4-zhujia.zj@bytedance.com>
In-Reply-To: <20230414172239.33743-1-zhujia.zj@bytedance.com>
References: <20230414172239.33743-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH V6 3/5] cachefiles: resend an open request
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
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
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
---
 fs/cachefiles/internal.h |  3 ++
 fs/cachefiles/ondemand.c | 98 ++++++++++++++++++++++++++++------------
 2 files changed, 72 insertions(+), 29 deletions(-)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index b0fe76964bc0d..b9a90f1a0c015 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -47,9 +47,11 @@ struct cachefiles_volume {
 enum cachefiles_object_state {
 	CACHEFILES_ONDEMAND_OBJSTATE_CLOSE, /* Anonymous fd closed by daemon or initial state */
 	CACHEFILES_ONDEMAND_OBJSTATE_OPEN, /* Anonymous fd associated with object is available */
+	CACHEFILES_ONDEMAND_OBJSTATE_REOPENING, /* Object that was closed and is being reopened. */
 };
 
 struct cachefiles_ondemand_info {
+	struct work_struct		ondemand_work;
 	int				ondemand_id;
 	enum cachefiles_object_state	state;
 	struct cachefiles_object	*object;
@@ -326,6 +328,7 @@ cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
 
 CACHEFILES_OBJECT_STATE_FUNCS(open, OPEN);
 CACHEFILES_OBJECT_STATE_FUNCS(close, CLOSE);
+CACHEFILES_OBJECT_STATE_FUNCS(reopening, REOPENING);
 #else
 static inline ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 					char __user *_buffer, size_t buflen)
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index deb7e3007aa1d..8e130de952f7d 100644
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
 	object->ondemand->ondemand_id = object_id;
 
 	cachefiles_get_unbind_pincount(cache);
@@ -238,6 +234,43 @@ static int cachefiles_ondemand_get_fd(struct cachefiles_req *req)
 	return ret;
 }
 
+static void ondemand_object_worker(struct work_struct *work)
+{
+	struct cachefiles_ondemand_info *info =
+		container_of(work, struct cachefiles_ondemand_info, ondemand_work);
+
+	cachefiles_ondemand_init_object(info->object);
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
+		info = object->ondemand;
+		if (cachefiles_ondemand_object_is_close(object)) {
+			cachefiles_ondemand_set_object_reopening(object);
+			queue_work(fscache_wq, &info->ondemand_work);
+			continue;
+		}
+		if (cachefiles_ondemand_object_is_reopening(object))
+			continue;
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
+	msg->object_id = req->object->ondemand->ondemand_id;
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
 			WARN_ON_ONCE(object->ondemand->ondemand_id == 0);
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
 
-	req->msg.object_id = object->ondemand->ondemand_id;
 	trace_cachefiles_ondemand_close(object, &req->msg);
 	return 0;
 }
@@ -455,16 +503,7 @@ static int cachefiles_ondemand_init_read_req(struct cachefiles_req *req,
 	struct cachefiles_object *object = req->object;
 	struct cachefiles_read *load = (void *)req->msg.data;
 	struct cachefiles_read_ctx *read_ctx = private;
-	int object_id = object->ondemand->ondemand_id;
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
 
 	object->ondemand->object = object;
+	INIT_WORK(&object->ondemand->ondemand_work, ondemand_object_worker);
 	return 0;
 }
 
-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

