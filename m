Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ECD5FB316
	for <lists+linux-cachefs@lfdr.de>; Tue, 11 Oct 2022 15:16:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665494181;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x8+Ag/jdp7VvAM9msgFbnCjmFmeh8pR6Q9eNFeXscAA=;
	b=Ux/l5s1N68zeUzS72c8HGDvKed3Uokt1sKT7JKfrY2Zo1sVr1JU1EJbjbiAMD+VMxAQX/b
	q34POqbUAbcwYplvPFC03w1qN7WHGUXPMaSVdsGLXoG6AcBNvjLjy7xK4i9wNbaZiyF9xs
	OT5ydWMt3rVuwXFXhYoRx0V5SoZ9Rko=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-Of7VQ9-7MkSFyKu_Gzz0fw-1; Tue, 11 Oct 2022 09:16:18 -0400
X-MC-Unique: Of7VQ9-7MkSFyKu_Gzz0fw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69B1787B2A2;
	Tue, 11 Oct 2022 13:16:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AE3F2166B26;
	Tue, 11 Oct 2022 13:16:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E74DA1946A45;
	Tue, 11 Oct 2022 13:16:13 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5FB9019465A0 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 11 Oct 2022 13:16:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3DF542144B20; Tue, 11 Oct 2022 13:16:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36D322166B26
 for <linux-cachefs@redhat.com>; Tue, 11 Oct 2022 13:16:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16B083C30500
 for <linux-cachefs@redhat.com>; Tue, 11 Oct 2022 13:16:12 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-163-PaNfJ28bMLWElLq6wyg0gg-1; Tue, 11 Oct 2022 09:16:10 -0400
X-MC-Unique: PaNfJ28bMLWElLq6wyg0gg-1
Received: by mail-pj1-f43.google.com with SMTP id
 v10-20020a17090a634a00b00205e48cf845so15962838pjs.4
 for <linux-cachefs@redhat.com>; Tue, 11 Oct 2022 06:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cJfl8b4fc5aHHIhFWhzN2k2LY2nGC5nCZll+W9C835A=;
 b=CWZg3GMG2hUfLcpopLXilSWzZOzfCBtIBBUAnTMlgJcgjwI0bke8ef2r7ApLh8Vulg
 59pVTDGlysl20fJQvQSGbVFutWDaBEOTlrlLYVgljPuAAUQNV5vg81agZKr+O/NPuVaM
 fhtlAFrgRKuus37VBCqyl4dUKoEf+Cw8xUFgya2lazlRKeQCJ4x/TKJwpoIQUtWEam3p
 BW4jq8JHd8GNhiMPgqzoOtkk+ZCjP4ahNB5nexiFOjFBjaf58dZ5s/EiEsd52tMgDzxd
 LeCH7T6NB7mgX7/DSmbnPQKTXmk1Ky3O0cyJPqSEx3qtx9rala2uujbqACsANFKS4Mve
 XwSw==
X-Gm-Message-State: ACrzQf0tcR1I+fRVusievktMxrQPTK8lBTZmFhvyI+c0pwK+bPLypTbk
 cFdMGaGR/V9x/hnNEn58xrA3rA==
X-Google-Smtp-Source: AMsMyM4bERKRfHpegTRstSNduCPP4P/YDOsG9rkyWHCwP9qmDoL4zBWQ/GXsIDwjiawN6FCg/OzgWg==
X-Received: by 2002:a17:90a:4d4d:b0:20b:1f3f:f19a with SMTP id
 l13-20020a17090a4d4d00b0020b1f3ff19amr26256108pjh.36.1665494169071; 
 Tue, 11 Oct 2022 06:16:09 -0700 (PDT)
Received: from C02G705SMD6V.bytedance.net ([63.216.146.190])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a170902654e00b00181f8523f60sm4773415pln.225.2022.10.11.06.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 06:16:08 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	xiang@kernel.org,
	jefflexu@linux.alibaba.com
Date: Tue, 11 Oct 2022 21:15:48 +0800
Message-Id: <20221011131552.23833-2-zhujia.zj@bytedance.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH 1/5] cachefiles: introduce object ondemand
 state
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
index 2ad58c465208..2dcc8b6ad536 100644
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
 
@@ -296,6 +303,32 @@ extern void cachefiles_ondemand_clean_object(struct cachefiles_object *object);
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
index 0254ed39f68c..e81d72c7bb4c 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -15,6 +15,7 @@ static int cachefiles_ondemand_fd_release(struct inode *inode,
 
 	xa_lock(&cache->reqs);
 	object->ondemand_id = CACHEFILES_ONDEMAND_ID_CLOSED;
+	cachefiles_ondemand_set_object_close(object);
 
 	/*
 	 * Flush all pending READ requests since their completion depends on
@@ -176,6 +177,8 @@ int cachefiles_ondemand_copen(struct cachefiles_cache *cache, char *args)
 		set_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
 	trace_cachefiles_ondemand_copen(req->object, id, size);
 
+	cachefiles_ondemand_set_object_open(req->object);
+
 out:
 	complete(&req->done);
 	return ret;
@@ -363,7 +366,8 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
 		/* coupled with the barrier in cachefiles_flush_reqs() */
 		smp_mb();
 
-		if (opcode != CACHEFILES_OP_OPEN && object->ondemand_id <= 0) {
+		if (opcode != CACHEFILES_OP_OPEN &&
+			!cachefiles_ondemand_object_is_open(object)) {
 			WARN_ON_ONCE(object->ondemand_id == 0);
 			xas_unlock(&xas);
 			ret = -EIO;
@@ -430,7 +434,6 @@ static int cachefiles_ondemand_init_close_req(struct cachefiles_req *req,
 					      void *private)
 {
 	struct cachefiles_object *object = req->object;
-	int object_id = object->ondemand_id;
 
 	/*
 	 * It's possible that object id is still 0 if the cookie looking up
@@ -438,10 +441,10 @@ static int cachefiles_ondemand_init_close_req(struct cachefiles_req *req,
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
@@ -460,7 +463,7 @@ static int cachefiles_ondemand_init_read_req(struct cachefiles_req *req,
 	int object_id = object->ondemand_id;
 
 	/* Stop enqueuing requests when daemon has closed anon_fd. */
-	if (object_id <= 0) {
+	if (!cachefiles_ondemand_object_is_open(object)) {
 		WARN_ON_ONCE(object_id == 0);
 		pr_info_once("READ: anonymous fd closed prematurely.\n");
 		return -EIO;
@@ -485,7 +488,7 @@ int cachefiles_ondemand_init_object(struct cachefiles_object *object)
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

