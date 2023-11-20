Return-Path: <linux-cachefs+bncBDKYBHUEQUPBBZF25OVAMGQEP2MSX4Y@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 149AD7F0B3E
	for <lists+linux-cachefs@lfdr.de>; Mon, 20 Nov 2023 05:15:34 +0100 (CET)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-41cca916954sf51468231cf.2
        for <lists+linux-cachefs@lfdr.de>; Sun, 19 Nov 2023 20:15:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700453733; cv=pass;
        d=google.com; s=arc-20160816;
        b=hv/84vfrSZytcEJic+MNQvzcORAZMyGroK7i/G/5e3IUjzB6VM1F1AnNzpsOrftM6G
         XjRzFlCRsVC16+UCP5w0AJIQ1zQRlUgXSxN3yKU6vpgSselk03aC9YFDr2SwIqHDOPGA
         Aed0on7sthVXK/II6/GDkI0x1CN0/mWzuBJUixewQN7PqlDsYiS2HP36noowSSl3xBJz
         PGdMCOgWBv8QZggmYhYgMQP0RFJHyByXoiHXQ3Q3jxZr8kFGsoxxG6mrhXSNjlBhvaiH
         Iwig2NyuhyMnwAol51K63VKccGsaG7ielsc8dwhzrNQO/JUUvLKs67sFw41kw9v/p56q
         PvqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:delivered-to;
        bh=38pX4GhHfpvNYA/RlUrbntqEg4T/k7NlMkvCErKSA4Y=;
        fh=2MjqSmE/Flr/Azt/mtnMNhZyMmjsqHVSxMPyjqy6YHI=;
        b=IAXQF4Cfxs67H7ojYkSiDnI4/AqvsWQ20X5hTJRqDklZ5rG5m//AH7NNaI2+NYf5rO
         grNfkRQG52r7lGlIVbq4aFNAGplKf3k+pY50oA3dHt8Wk4x6GNEEVlx/CG7+6iFWtPmL
         uvgFY/nVlrSa84MIcfBrpPPNGq6u0Fu/2eUI5i5AvhhubR1I5pQ8CcGHXctPYZ7DKSS1
         fFxPPjYkFFnvYCVhclV/kvq19OWd3KM2YZemPfCO4/SsYgLTOpdhEBeh+LdqFIYeYEBL
         yhRiDBH0uMwoH10rSv4CesKhzSAYNXE+U3IE6p9PUNvMESAzK/JRYN9N3jXA7fCEJp7F
         hD+A==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.214.172 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700453733; x=1701058533;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38pX4GhHfpvNYA/RlUrbntqEg4T/k7NlMkvCErKSA4Y=;
        b=UbS/Ba1X4qNG3VDqJVopZZza/+2wgc1UnXDWO9OWQfNwRBmFg0bWHDvc4RNqN2uBeB
         Nz3pT1Nuu9wlqPNp2zeQWFGOgL1zmCxJqZ8fl1Y6dkAYK0TkuObT1hdOyIcYvoGKcgAM
         UJrIQdHCraiLqkDuy8LQDAiW6vIjXXU0pXzYettwH/Lf3JiehNFcF11zzXlmCeSQIabU
         QyU1Jet0YFPXD1lO1cRrBdMUfTCw93XdDSEcDUBzkZYdtfbKmMtNJVzHBhYjs2q/xWR2
         CE1RKjJ9IgKAWFypG98jBIapLA58c36F41DxldH1/O0OwpHaZ7+MQkIfIXpCHelYr6qd
         vzxQ==
X-Gm-Message-State: AOJu0Yx2BaEaEKaVBMt1npubkm6pMQp3v5Q4UuHbv+L4m592ebyhA0UD
	ye8zHXOeHhQNmL4CYCGpnoZFTw==
X-Google-Smtp-Source: AGHT+IHwuHqt/2oIANHHR7Xg0lDJ2a4/wdQtL40z6Xas/pnAH/zSTHzNYAT3FkEiRNgiQx6PG1RB3g==
X-Received: by 2002:a05:622a:118e:b0:41e:2d4d:def7 with SMTP id m14-20020a05622a118e00b0041e2d4ddef7mr8535792qtk.5.1700453733032;
        Sun, 19 Nov 2023 20:15:33 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1a1b:b0:41c:b790:86d1 with SMTP id
 f27-20020a05622a1a1b00b0041cb79086d1ls3523418qtb.2.-pod-prod-06-us; Sun, 19
 Nov 2023 20:15:32 -0800 (PST)
X-Received: by 2002:ac8:7f05:0:b0:412:c2a:eaef with SMTP id f5-20020ac87f05000000b004120c2aeaefmr6530070qtk.11.1700453732368;
        Sun, 19 Nov 2023 20:15:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700453732; cv=none;
        d=google.com; s=arc-20160816;
        b=OWJ0j2alp9a8Oiq4MaHoaoeH9p8B/o4Y0UzXZTKz0n5bi+rGBpI2IOelz2sWd1IXF9
         8gzJKQx8gYEYHf1/nd1R4H/0vArUTnOVNV5VjsxlWKSyyL0FdzgVFrcUrE0JfMgf4k9X
         uBAirX4KH0vz79jW2y2D6tg5F8xgbT+pDYzcyd8JaEfa/Xq0EI9mtpfOHwpAG3Or2rF9
         zi9bW8PNALH+UzahE1N8lplnLvfOcqPI6QXhcpuf3LLpp7imsYnj9G3TIwYRaPbJcHYD
         v03A5uKoXqR+VU3O7YD4UPduFYt2hfJuwEz+BkBtbNRF+dY+dXNs0ZS4PyaPQ7QLwif7
         GP0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=bz3jIhYwuRIQTrKQv0iVXi5ds41jIbadiSwFXBU2nXU=;
        fh=2MjqSmE/Flr/Azt/mtnMNhZyMmjsqHVSxMPyjqy6YHI=;
        b=bsW9IkeLo9pOPnVhcAk7ztcrj17ue69gENUdjOxrYVGeOEXdMzVJ76NEqVmUsfFzvs
         Yz5TNDHOWKH5jH4X4DMluNqfRwaC2oJmqkdU/0xP/DGEb4dRJ0PNaeAM6gPSkeSS1mYJ
         LqNwnZQ7jvdkUnf6JJliQrEmFO5J4WzilHxldIn4zI1g8FpDfRyuR2INgnzY4PXAnzmJ
         XwFjg1bneG06m3w9WIKRNJsSF3buVmeBsgyB2HrTU+ooK3C2RcpQFk88YEMGCCY3JMsR
         KF0DEy/KAwDO2WuV1e6mADdVcKQuewbOJPQJ02w/XBHdPglkk/G/yTr5jhnwpfm2qZFz
         AYFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.214.172 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id o3-20020ac85a43000000b00417b42a9c52si6549041qta.6.2023.11.19.20.15.32
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 20:15:32 -0800 (PST)
Received-SPF: pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.214.172 as permitted sender) client-ip=209.85.214.172;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-YdFvIOf6OmehwEqGoTlmxA-1; Sun, 19 Nov 2023 23:15:30 -0500
X-MC-Unique: YdFvIOf6OmehwEqGoTlmxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DDFE185A780
	for <linux-cachefs@gapps.redhat.com>; Mon, 20 Nov 2023 04:15:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 9A7E81121308; Mon, 20 Nov 2023 04:15:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 927051121306
	for <linux-cachefs@redhat.com>; Mon, 20 Nov 2023 04:15:30 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DE382808FD3
	for <linux-cachefs@redhat.com>; Mon, 20 Nov 2023 04:15:30 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-Yj880pz9PrOcQlJwJ8odXQ-1; Sun, 19 Nov 2023 23:15:28 -0500
X-MC-Unique: Yj880pz9PrOcQlJwJ8odXQ-1
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cc1ee2d8dfso35223015ad.3
        for <linux-cachefs@redhat.com>; Sun, 19 Nov 2023 20:15:28 -0800 (PST)
X-Received: by 2002:a17:902:eecd:b0:1ca:1be4:bda4 with SMTP id h13-20020a170902eecd00b001ca1be4bda4mr6685850plb.4.1700453727298;
        Sun, 19 Nov 2023 20:15:27 -0800 (PST)
Received: from C02G705SMD6V.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001cc4e477861sm5065266plw.212.2023.11.19.20.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 20:15:27 -0800 (PST)
From: "'Jia Zhu' via linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Cc: linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jefflexu@linux.alibaba.com,
	hsiangkao@linux.alibaba.com,
	Jia Zhu <zhujia.zj@bytedance.com>
Subject: [PATCH V6 RESEND 2/5] cachefiles: extract ondemand info field from cachefiles_object
Date: Mon, 20 Nov 2023 12:14:19 +0800
Message-Id: <20231120041422.75170-3-zhujia.zj@bytedance.com>
In-Reply-To: <20231120041422.75170-1-zhujia.zj@bytedance.com>
References: <20231120041422.75170-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: zhujia.zj@bytedance.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of zhujia.zj@bytedance.com designates 209.85.214.172 as permitted
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

We'll introduce a @work_struct field for @object in subsequent patches,
it will enlarge the size of @object.
As the result of that, this commit extracts ondemand info field from
@object.

Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/interface.c |  7 ++++++-
 fs/cachefiles/internal.h  | 26 ++++++++++++++++++++++----
 fs/cachefiles/ondemand.c  | 34 ++++++++++++++++++++++++++++------
 3 files changed, 56 insertions(+), 11 deletions(-)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 40052bdb3365..35ba2117a6f6 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -31,6 +31,11 @@ struct cachefiles_object *cachefiles_alloc_object(struct fscache_cookie *cookie)
 	if (!object)
 		return NULL;
 
+	if (cachefiles_ondemand_init_obj_info(object, volume)) {
+		kmem_cache_free(cachefiles_object_jar, object);
+		return NULL;
+	}
+
 	refcount_set(&object->ref, 1);
 
 	spin_lock_init(&object->lock);
@@ -88,7 +93,7 @@ void cachefiles_put_object(struct cachefiles_object *object,
 		ASSERTCMP(object->file, ==, NULL);
 
 		kfree(object->d_name);
-
+		cachefiles_ondemand_deinit_obj_info(object);
 		cache = object->volume->cache->cache;
 		fscache_put_cookie(object->cookie, fscache_cookie_put_object);
 		object->cookie = NULL;
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 00beedeaec18..b0fe76964bc0 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -49,6 +49,12 @@ enum cachefiles_object_state {
 	CACHEFILES_ONDEMAND_OBJSTATE_OPEN, /* Anonymous fd associated with object is available */
 };
 
+struct cachefiles_ondemand_info {
+	int				ondemand_id;
+	enum cachefiles_object_state	state;
+	struct cachefiles_object	*object;
+};
+
 /*
  * Backing file state.
  */
@@ -66,8 +72,7 @@ struct cachefiles_object {
 	unsigned long			flags;
 #define CACHEFILES_OBJECT_USING_TMPFILE	0		/* Have an unlinked tmpfile */
 #ifdef CONFIG_CACHEFILES_ONDEMAND
-	int				ondemand_id;
-	enum cachefiles_object_state	state;
+	struct cachefiles_ondemand_info	*ondemand;
 #endif
 };
 
@@ -302,17 +307,21 @@ extern void cachefiles_ondemand_clean_object(struct cachefiles_object *object);
 extern int cachefiles_ondemand_read(struct cachefiles_object *object,
 				    loff_t pos, size_t len);
 
+extern int cachefiles_ondemand_init_obj_info(struct cachefiles_object *obj,
+					struct cachefiles_volume *volume);
+extern void cachefiles_ondemand_deinit_obj_info(struct cachefiles_object *obj);
+
 #define CACHEFILES_OBJECT_STATE_FUNCS(_state, _STATE)	\
 static inline bool								\
 cachefiles_ondemand_object_is_##_state(const struct cachefiles_object *object) \
 {												\
-	return object->state == CACHEFILES_ONDEMAND_OBJSTATE_##_STATE; \
+	return object->ondemand->state == CACHEFILES_ONDEMAND_OBJSTATE_##_STATE; \
 }												\
 												\
 static inline void								\
 cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
 {												\
-	object->state = CACHEFILES_ONDEMAND_OBJSTATE_##_STATE; \
+	object->ondemand->state = CACHEFILES_ONDEMAND_OBJSTATE_##_STATE; \
 }
 
 CACHEFILES_OBJECT_STATE_FUNCS(open, OPEN);
@@ -338,6 +347,15 @@ static inline int cachefiles_ondemand_read(struct cachefiles_object *object,
 {
 	return -EOPNOTSUPP;
 }
+
+static inline int cachefiles_ondemand_init_obj_info(struct cachefiles_object *obj,
+						struct cachefiles_volume *volume)
+{
+	return 0;
+}
+static inline void cachefiles_ondemand_deinit_obj_info(struct cachefiles_object *obj)
+{
+}
 #endif
 
 /*
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 90456b8a4b3e..deb7e3007aa1 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -9,12 +9,13 @@ static int cachefiles_ondemand_fd_release(struct inode *inode,
 {
 	struct cachefiles_object *object = file->private_data;
 	struct cachefiles_cache *cache = object->volume->cache;
-	int object_id = object->ondemand_id;
+	struct cachefiles_ondemand_info *info = object->ondemand;
+	int object_id = info->ondemand_id;
 	struct cachefiles_req *req;
 	XA_STATE(xas, &cache->reqs, 0);
 
 	xa_lock(&cache->reqs);
-	object->ondemand_id = CACHEFILES_ONDEMAND_ID_CLOSED;
+	info->ondemand_id = CACHEFILES_ONDEMAND_ID_CLOSED;
 	cachefiles_ondemand_set_object_close(object);
 
 	/*
@@ -222,7 +223,7 @@ static int cachefiles_ondemand_get_fd(struct cachefiles_req *req)
 	load = (void *)req->msg.data;
 	load->fd = fd;
 	req->msg.object_id = object_id;
-	object->ondemand_id = object_id;
+	object->ondemand->ondemand_id = object_id;
 
 	cachefiles_get_unbind_pincount(cache);
 	trace_cachefiles_ondemand_open(object, &req->msg, load);
@@ -368,7 +369,7 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
 
 		if (opcode != CACHEFILES_OP_OPEN &&
 			!cachefiles_ondemand_object_is_open(object)) {
-			WARN_ON_ONCE(object->ondemand_id == 0);
+			WARN_ON_ONCE(object->ondemand->ondemand_id == 0);
 			xas_unlock(&xas);
 			ret = -EIO;
 			goto out;
@@ -438,7 +439,7 @@ static int cachefiles_ondemand_init_close_req(struct cachefiles_req *req,
 	if (!cachefiles_ondemand_object_is_open(object))
 		return -ENOENT;
 
-	req->msg.object_id = object->ondemand_id;
+	req->msg.object_id = object->ondemand->ondemand_id;
 	trace_cachefiles_ondemand_close(object, &req->msg);
 	return 0;
 }
@@ -454,7 +455,7 @@ static int cachefiles_ondemand_init_read_req(struct cachefiles_req *req,
 	struct cachefiles_object *object = req->object;
 	struct cachefiles_read *load = (void *)req->msg.data;
 	struct cachefiles_read_ctx *read_ctx = private;
-	int object_id = object->ondemand_id;
+	int object_id = object->ondemand->ondemand_id;
 
 	/* Stop enqueuing requests when daemon has closed anon_fd. */
 	if (!cachefiles_ondemand_object_is_open(object)) {
@@ -500,6 +501,27 @@ void cachefiles_ondemand_clean_object(struct cachefiles_object *object)
 			cachefiles_ondemand_init_close_req, NULL);
 }
 
+int cachefiles_ondemand_init_obj_info(struct cachefiles_object *object,
+				struct cachefiles_volume *volume)
+{
+	if (!cachefiles_in_ondemand_mode(volume->cache))
+		return 0;
+
+	object->ondemand = kzalloc(sizeof(struct cachefiles_ondemand_info),
+					GFP_KERNEL);
+	if (!object->ondemand)
+		return -ENOMEM;
+
+	object->ondemand->object = object;
+	return 0;
+}
+
+void cachefiles_ondemand_deinit_obj_info(struct cachefiles_object *object)
+{
+	kfree(object->ondemand);
+	object->ondemand = NULL;
+}
+
 int cachefiles_ondemand_read(struct cachefiles_object *object,
 			     loff_t pos, size_t len)
 {
-- 
2.20.1

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

