Return-Path: <linux-cachefs+bncBDKYBHUEQUPBB2N25OVAMGQE2FGN2UI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 685207F0B41
	for <lists+linux-cachefs@lfdr.de>; Mon, 20 Nov 2023 05:15:38 +0100 (CET)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-41cc5b9d26esf109826701cf.0
        for <lists+linux-cachefs@lfdr.de>; Sun, 19 Nov 2023 20:15:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700453737; cv=pass;
        d=google.com; s=arc-20160816;
        b=GPwSlckHX2VrtoRrP3zhJGdGlCNKo9E9RZKPEx5P5C3tZpOUTMODTT/J7vfvbYbXZT
         i+W1rifz6HrWrPpaMh609/p0Zx4MhmamoGoDQsrwGVGH+GfpEePfby4wyjwKUQDhZzW7
         ADomAXBgMcfObAKRsW2JCBNNLEhDKl1P/ZLB8wmKeBdls0qW6Boj+ZjVJcPkO5RVjU0G
         OgiAYCNhZaCUOlDtR+sNJQW03LWoaHGBsf/lc91K5YCNU4/YTF1TmxpYokentEILLiGn
         Rz/e5wzGMoJNfUa6zSGiVM9/PVziI8e4SC2gjjhvUzQxLgb7OwfphHvaUhxGYv+GCdGP
         moyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:delivered-to;
        bh=sK/20Yewoy55w46BstKvhKaowOFpCZWFkoPgeW99bMU=;
        fh=2MjqSmE/Flr/Azt/mtnMNhZyMmjsqHVSxMPyjqy6YHI=;
        b=e2a8PET7p39ZG4bOVPcW42e7MJa4D4PA6NL5CWfhCuU2tUbF7NUsswxYdlWmnIUYj5
         vKTambANb93qapPZuV+Rw3HrXDQrh1WqtPZmDl6zuGDpzqCxLAVmkbzusZ4zF1fnL12k
         wbYb/ytQBlvhw41IQSvDSfGrg/bxMZ33k1qHc1UZpATgo9Fc74ZOdeoCc8S6M2Wt6g++
         r3j/LNCg8NGJNwYUS33Fd+pgH7W0tXXBPiEf/nPOTRZdJbtO4y9KUVfRasZgR3RAoiHf
         LVQn2wOzky/0wOL9QFjwgzHD42mAjJajOtrWn2aTjdV+7cO+oa+ptnQLtdyU5F+lb0ff
         EraA==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.214.181 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700453737; x=1701058537;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK/20Yewoy55w46BstKvhKaowOFpCZWFkoPgeW99bMU=;
        b=mWbsQ14SKW8xB+1SwBlHshSyR8ho8IPsEolTIkaa5YsEFiOG62MCSkgCQo5pXNt3Il
         RZCLQVyfH/V69mjQIJKQ9VGSwVXu9yShy1Mp134kxYVPv6RKycaiDFVivBxJRPvvM8Mj
         IhwmGkzhyR4UGAvaLHurzH24qWD++4E7MnEVN1fNDCfunrv6duM2XpLaYRdG57LbcPyN
         2Gi3kcpyQKt2HAdT6+YtqhpGMeaTRFwzthwAF6DWNRJPRu/s/7qA9xlfybIb4KhlN/Mj
         dM8uwHoBEjsXXiG632b60oTftQiWkcQiCqzbIJHLgRprsjDT6G5EwbIpF5QbYGJC3uOY
         4bSw==
X-Gm-Message-State: AOJu0Ywif9Kky6Nk+vQBN6+gLh5r3eozoZp9Wfszk3sEwwtYkdlzRLC+
	nzKvqL7Qrqd3+FSQrzxwInB1CQ==
X-Google-Smtp-Source: AGHT+IE9XnFaTGBXH25adp0ogeBmsbJC6ZUFJU/70fE7j3wAOkHMpvKEon27NKcLainhIB6+E7ytqA==
X-Received: by 2002:a05:622a:44e:b0:417:fa13:a8f7 with SMTP id o14-20020a05622a044e00b00417fa13a8f7mr10888208qtx.4.1700453737279;
        Sun, 19 Nov 2023 20:15:37 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:7d13:0:b0:41f:f013:e433 with SMTP id g19-20020ac87d13000000b0041ff013e433ls2446472qtb.0.-pod-prod-00-us;
 Sun, 19 Nov 2023 20:15:36 -0800 (PST)
X-Received: by 2002:a05:622a:251:b0:41c:c588:b821 with SMTP id c17-20020a05622a025100b0041cc588b821mr8584232qtx.25.1700453736698;
        Sun, 19 Nov 2023 20:15:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700453736; cv=none;
        d=google.com; s=arc-20160816;
        b=eRmOoceBGGP9SA8+g4FIp1+CfeYtvO+qNbI+YXCFfmDoFVU+MC5vYZaNe+j3VLYs/x
         i26AmgJQ5ylyGLWV5wHdPSrRXDgeZjPP5AlRbbMhmPO16+b9P4sQ7FnXq5HpDICsV7qR
         aTTpStEC1+FyhGxKKqk/3Vusk+QDcHhpGpdS4VUlRwiNp8HY1DuY3ZIzpORoitnmLgw9
         KmpcH55uuZyTwlu4RV0t5qCvQMVd7QgaxxoTRFYdv/NFI9r/d50gSyaTSgmdhMxtQ/aE
         4IALCylvy9EoDZS6TtNjDURdMhVxoljh4g88P7slQFCPrbXMkZYHxbA7OXsAvMyXEjpx
         ZaKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=aS5flV+CfxePU4FZE8c9ZQB+Fy6Gmv6dv/iJq9bZJTo=;
        fh=2MjqSmE/Flr/Azt/mtnMNhZyMmjsqHVSxMPyjqy6YHI=;
        b=yZM80xesBClFTwDtJPJs1rQlFZef7EIRHSaoteY89bQDtwv/HpHIFTWsNoSDuzeLVi
         c6B9YjKyU7vU2MpwHfrGavuZXdlWGtN6bUqY3MM3yY1JnHW3zB6ctr+5ypG0xLLimO3N
         zxdMvLZghcu5VqUzVnAIMadnS3rzhqYMxMDY1wfbHVUE7F7svw3LqtQJFYBAd3AvjJPL
         DcDcxJ70H4eK3f3FPsGD6SBUDeuo91DP/hV0PVzURjVLUqp0EQwz+HzvMh+RUgR6aCUZ
         TsPMVvPxwTfgtqAoQvk84251Sot4bsvhXEsdYu+gEs55mgHVf8IHX4HnWtRf+g5kvPmZ
         MckQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.214.181 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id z12-20020ac87f8c000000b00421ae955e53si6792323qtj.107.2023.11.19.20.15.36
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 20:15:36 -0800 (PST)
Received-SPF: pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.214.181 as permitted sender) client-ip=209.85.214.181;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-6df4rbNTP5e4636i3YsAwA-1; Sun, 19 Nov 2023 23:15:35 -0500
X-MC-Unique: 6df4rbNTP5e4636i3YsAwA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DBE7811E7D
	for <linux-cachefs@gapps.redhat.com>; Mon, 20 Nov 2023 04:15:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 1A7E640C6EBB; Mon, 20 Nov 2023 04:15:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1316D40C6EB9
	for <linux-cachefs@redhat.com>; Mon, 20 Nov 2023 04:15:34 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com [205.139.110.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C71FC101A529
	for <linux-cachefs@redhat.com>; Mon, 20 Nov 2023 04:15:34 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-T8_LXL82OtG3HpHkJcp1dg-1; Sun, 19 Nov 2023 23:15:32 -0500
X-MC-Unique: T8_LXL82OtG3HpHkJcp1dg-1
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cf52e5e07eso7620085ad.0
        for <linux-cachefs@redhat.com>; Sun, 19 Nov 2023 20:15:31 -0800 (PST)
X-Received: by 2002:a17:902:fac4:b0:1cc:4b3d:1a8d with SMTP id ld4-20020a170902fac400b001cc4b3d1a8dmr14850687plb.17.1700453731015;
        Sun, 19 Nov 2023 20:15:31 -0800 (PST)
Received: from C02G705SMD6V.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001cc4e477861sm5065266plw.212.2023.11.19.20.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 20:15:30 -0800 (PST)
From: "'Jia Zhu' via linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Cc: linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jefflexu@linux.alibaba.com,
	hsiangkao@linux.alibaba.com,
	Jia Zhu <zhujia.zj@bytedance.com>
Subject: [PATCH V6 RESEND 3/5] cachefiles: resend an open request if the read request's object is closed
Date: Mon, 20 Nov 2023 12:14:20 +0800
Message-Id: <20231120041422.75170-4-zhujia.zj@bytedance.com>
In-Reply-To: <20231120041422.75170-1-zhujia.zj@bytedance.com>
References: <20231120041422.75170-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: zhujia.zj@bytedance.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of zhujia.zj@bytedance.com designates 209.85.214.181 as permitted
 sender) smtp.mailfrom=zhujia.zj@bytedance.com
X-Original-From: Jia Zhu <zhujia.zj@bytedance.com>
Reply-To: Jia Zhu <zhujia.zj@bytedance.com>
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
Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/internal.h |  3 ++
 fs/cachefiles/ondemand.c | 98 ++++++++++++++++++++++++++++------------
 2 files changed, 72 insertions(+), 29 deletions(-)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index b0fe76964bc0..b9a90f1a0c01 100644
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
index deb7e3007aa1..8e130de952f7 100644
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
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

