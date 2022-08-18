Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CD15984BA
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Aug 2022 15:52:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660830772;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1dj95ym7jZJJ9AJbqUCb9PkOhFjaDam0pD0HBl2C6w0=;
	b=eRgGUl97yiDorUN1BPmL9oB9EpmuPG8qMe0NJWBLIz0qrZye35M9LBDW3/VL5YlkqF12Zt
	APtOh41s6+w+GLHjJ5Ibut1PEB57Gz3mRa7rECN4nbVk+VDC8DJnFNZy53Jxgj2nY+jMTY
	nQyUxwY9f2EZK9O6xnB3zxOdib6Czok=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-zHWzzroOP1OxHWO2rXqQLA-1; Thu, 18 Aug 2022 09:52:50 -0400
X-MC-Unique: zHWzzroOP1OxHWO2rXqQLA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 588F480231E;
	Thu, 18 Aug 2022 13:52:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4EA06403342;
	Thu, 18 Aug 2022 13:52:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 330D8194E11C;
	Thu, 18 Aug 2022 13:52:49 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 53BC91946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 13:52:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 37BA9400EAB2; Thu, 18 Aug 2022 13:52:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2732404C6ED
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 13:52:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA697811E81
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 13:52:46 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-30-MBpqX9qiOTq__3ENieV9oA-1; Thu, 18 Aug 2022 09:52:45 -0400
X-MC-Unique: MBpqX9qiOTq__3ENieV9oA-1
Received: by mail-pj1-f43.google.com with SMTP id
 t11-20020a17090a510b00b001fac77e9d1fso2113515pjh.5
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 06:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=RqIFS3uQuz8ZCr2lEZPiUaSyj69GXTkqlo83y6u621E=;
 b=U7wH0wUM3Cus4Bm1cQqlSvPPABh/ABRarwRTVksFU/z+qUFONv3mc8DFgE+C0kdnNB
 p5GH48Gh6RxvvToj18q5ab9H8EQ9RvzahWcyxZvchx7VDUilnnWYBsIGuE9xtamiOrad
 51m5YnVEgQknYiwMZUpJf6NbbBEaXqTPuPi7PpQihsfa3Lbp14bJ9XJp841GLsplYGei
 /PlDWze4ifgzf7GhiUbZgfYtL/shfiCWivC209wPyn7rhbr11AaxSNS+LlrTx8Dw0Sdn
 FcBrZzJhpbXlmOro0XvOpCTQC4cPSNAt/GUkdfbJMM1q68rYhQt9Me3JLCDvww8wW5mn
 0tFg==
X-Gm-Message-State: ACgBeo2PzqThhyfkqV7rLcUjJXKvTI9/4OQfwPrW2ByFUGzq5fvPpzTp
 FnlPd1sfX35/PtGaJAEyqCRbT40+U7VASQ==
X-Google-Smtp-Source: AA6agR4SjEpLT0u/4ZBNuQ8cCRUtgkNLidJHqdyeYP8+AO/WKZHP6NeAErRqiv9WYEWSQg06XXdwFg==
X-Received: by 2002:a17:90b:3ec2:b0:1f7:3f49:17c3 with SMTP id
 rm2-20020a17090b3ec200b001f73f4917c3mr8674863pjb.203.1660830763941; 
 Thu, 18 Aug 2022 06:52:43 -0700 (PDT)
Received: from C02G705SMD6V.bytedance.net ([139.177.225.242])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a170902ce1100b0016db0d877e4sm1385697plg.221.2022.08.18.06.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:52:43 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	xiang@kernel.org,
	jefflexu@linux.alibaba.com
Date: Thu, 18 Aug 2022 21:52:00 +0800
Message-Id: <20220818135204.49878-2-zhujia.zj@bytedance.com>
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
Subject: [Linux-cachefs] [RFC PATCH 1/5] cachefiles: introduce object
 ondemand state
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Previously, @ondemand_id field was used not only to identify ondemand
state of the object, but also to represent the index of the xarray.
This commit introduces @state field to decouple the role of @ondemand_id
and adds helpers to access it.

Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
Reviewed-by: Xin Yin <yinxin.x@bytedance.com>
---
 fs/cachefiles/internal.h | 33 +++++++++++++++++++++++++++++++++
 fs/cachefiles/ondemand.c | 15 +++++++++------
 2 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 6cba2c6de2f9..6661b3e361da 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -17,6 +17,7 @@
 #include <linux/security.h>
 #include <linux/xarray.h>
 #include <linux/cachefiles.h>
+#include <linux/atomic.h>
 
 #define CACHEFILES_DIO_BLOCK_SIZE 4096
 
@@ -44,6 +45,11 @@ struct cachefiles_volume {
 	struct dentry			*fanout[256];	/* Fanout subdirs */
 };
 
+enum cachefiles_object_state {
+	CACHEFILES_ONDEMAND_OBJSTATE_close, /* Anonymous fd closed by daemon or initial state */
+	CACHEFILES_ONDEMAND_OBJSTATE_open, /* Anonymous fd associated with object is available */
+};
+
 /*
  * Backing file state.
  */
@@ -62,6 +68,7 @@ struct cachefiles_object {
 #define CACHEFILES_OBJECT_USING_TMPFILE	0		/* Have an unlinked tmpfile */
 #ifdef CONFIG_CACHEFILES_ONDEMAND
 	int				ondemand_id;
+	enum cachefiles_object_state	state;
 #endif
 };
 
@@ -295,6 +302,32 @@ extern void cachefiles_ondemand_clean_object(struct cachefiles_object *object);
 extern int cachefiles_ondemand_read(struct cachefiles_object *object,
 				    loff_t pos, size_t len);
 
+#define CACHEFILES_OBJECT_STATE_FUNCS(_state)	\
+static inline bool								\
+cachefiles_ondemand_object_is_##_state(const struct cachefiles_object *object) \
+{												\
+	/*
+	 * Pairs with smp_store_release() in set_object_##_state()
+	 * I.e. another task can publish state concurrently, by executing
+	 * a RELEASE barrier. We need to use smp_load_acquire() here
+	 * to safely ACQUIRE the memory the other task published.
+	 */											\
+	return smp_load_acquire(&object->state) == CACHEFILES_ONDEMAND_OBJSTATE_##_state; \
+}												\
+												\
+static inline void								\
+cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
+{												\
+	/*
+	 * Pairs with smp_load_acquire() in object_is_##_state()
+	 * I.e. here we publish a state with a RELEASE barrier
+	 * so that concurrent tasks can ACQUIRE it.
+	 */											\
+	smp_store_release(&object->state, CACHEFILES_ONDEMAND_OBJSTATE_##_state); \
+}
+
+CACHEFILES_OBJECT_STATE_FUNCS(open);
+CACHEFILES_OBJECT_STATE_FUNCS(close);
 #else
 static inline ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 					char __user *_buffer, size_t buflen)
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 1fee702d5529..e3155a5f32e4 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -15,6 +15,7 @@ static int cachefiles_ondemand_fd_release(struct inode *inode,
 
 	xa_lock(&cache->reqs);
 	object->ondemand_id = CACHEFILES_ONDEMAND_ID_CLOSED;
+	cachefiles_ondemand_set_object_close(object);
 
 	/*
 	 * Flush all pending READ requests since their completion depends on
@@ -172,6 +173,8 @@ int cachefiles_ondemand_copen(struct cachefiles_cache *cache, char *args)
 		set_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
 	trace_cachefiles_ondemand_copen(req->object, id, size);
 
+	cachefiles_ondemand_set_object_open(req->object);
+
 out:
 	complete(&req->done);
 	return ret;
@@ -353,7 +356,8 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
 		/* coupled with the barrier in cachefiles_flush_reqs() */
 		smp_mb();
 
-		if (opcode != CACHEFILES_OP_OPEN && object->ondemand_id <= 0) {
+		if (opcode != CACHEFILES_OP_OPEN &&
+			!cachefiles_ondemand_object_is_open(object)) {
 			WARN_ON_ONCE(object->ondemand_id == 0);
 			xas_unlock(&xas);
 			ret = -EIO;
@@ -420,7 +424,6 @@ static int cachefiles_ondemand_init_close_req(struct cachefiles_req *req,
 					      void *private)
 {
 	struct cachefiles_object *object = req->object;
-	int object_id = object->ondemand_id;
 
 	/*
 	 * It's possible that object id is still 0 if the cookie looking up
@@ -428,10 +431,10 @@ static int cachefiles_ondemand_init_close_req(struct cachefiles_req *req,
 	 * sending CLOSE request for CACHEFILES_ONDEMAND_ID_CLOSED, which means
 	 * anon_fd has already been closed.
 	 */
-	if (object_id <= 0)
+	if (!cachefiles_ondemand_object_is_open(object))
 		return -ENOENT;
 
-	req->msg.object_id = object_id;
+	req->msg.object_id = object->ondemand_id;
 	trace_cachefiles_ondemand_close(object, &req->msg);
 	return 0;
 }
@@ -450,7 +453,7 @@ static int cachefiles_ondemand_init_read_req(struct cachefiles_req *req,
 	int object_id = object->ondemand_id;
 
 	/* Stop enqueuing requests when daemon has closed anon_fd. */
-	if (object_id <= 0) {
+	if (!cachefiles_ondemand_object_is_open(object)) {
 		WARN_ON_ONCE(object_id == 0);
 		pr_info_once("READ: anonymous fd closed prematurely.\n");
 		return -EIO;
@@ -475,7 +478,7 @@ int cachefiles_ondemand_init_object(struct cachefiles_object *object)
 	 * creating a new tmpfile as the cache file. Reuse the previously
 	 * allocated object ID if any.
 	 */
-	if (object->ondemand_id > 0)
+	if (cachefiles_ondemand_object_is_open(object))
 		return 0;
 
 	volume_key_size = volume->key[0] + 1;
-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

