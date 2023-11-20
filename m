Return-Path: <linux-cachefs+bncBDKYBHUEQUPBBYN25OVAMGQE5COUE2Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id B96C67F0B3C
	for <lists+linux-cachefs@lfdr.de>; Mon, 20 Nov 2023 05:15:30 +0100 (CET)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-41cdffe4d1csf48766801cf.0
        for <lists+linux-cachefs@lfdr.de>; Sun, 19 Nov 2023 20:15:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700453729; cv=pass;
        d=google.com; s=arc-20160816;
        b=ME7HMmi9FyqZj7+8eIq/YOCp0u3NZphyhbXsXntteUVX2aChFQgQA8Afh4o40F9NyQ
         0PrLDr0rQsqsru92yY0RgYzQ+a8z1NX3cNDfgJgFKP3pDtVulVe85skkyli1X1/QyMED
         IG1j0oT5F44as0CSYadw0fa18LvzaV3OzFXFeazfiZ0HnuqattA4HQ1qWbe24oWEOYtP
         fuSCntHfwAtoLnyXC54EZHI8RvyavCAN7fOfiL+rxzTS8lkF3yjPNk1hWLmrlokvTYzO
         cipwyTHPWCLBCDS8ZBDdA+XEbY6onzP2nTLmndcpZZYxNUjbj94x5r8ImxT31exn/Gtp
         KcyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:delivered-to;
        bh=s1Q7hGvriZNzZrsESm5QFPPgTwzlK/kOxHmJIGkdyVM=;
        fh=2MjqSmE/Flr/Azt/mtnMNhZyMmjsqHVSxMPyjqy6YHI=;
        b=J93gtIEzfq6Vecg3Njd7QiSee/7yBPlrU1zWOVMsFa4FsiBlTFTphwJf/hykEQUN1d
         fx3tWJaMp3th8Lkt13y1nCnqJS4ctRYIk8XQUnaH/54za5JwVPdgRUo/l3JilEZY5aLG
         LiJ3B2JLKGjKCe/KtmNJX+W3AruTzDU61p/A96B3FvVNWhMsRr7U+Yoh5algDkE0oIjh
         wU17W4TgTp8TeKn1x/Gex9zC6pY4lGnuvOARR1I6zZ9ELKMz+xBSRN1tic5Q0T0bgdhH
         7fT+dXMohYXgvqwtrkFk3Y/ia+fXWzMVl0ZpJ2yWdmNepbiD2WxPdINguerfoIhyt2RL
         JDfg==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.214.169 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700453729; x=1701058529;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1Q7hGvriZNzZrsESm5QFPPgTwzlK/kOxHmJIGkdyVM=;
        b=F39M6PAC90IaIwRFEYWGJ72kfzbxIGIbxQkBtrG2vJm2ONYFkhHWkvRGcxGxuTcK1Q
         idXNXlGDURu7Ub9KR6uW3ULcIlh/FyzrXKKiHmX7d2Evq/+l40UGhewLyfxdt2Q5Iv74
         Y4RWzbbQ915UksCZYpLN7nfmOt6nj9MAk0BcY1KFus7Kyk7oUjQeqX6R9DCEgPSKdI1N
         71F5NwAUkg3j3SGy/Cbkg8kCs2xsOYwaphRHUbH0H1yBFPcK+VY4K4Ql+drATD5PkP1/
         O/j6sl7vI/OUdee8wgPP02+3SywRt/r8+BrT9uPLwgTekLA9I9aU3du8G0ggc7iZw7Ju
         FQ7g==
X-Gm-Message-State: AOJu0YwPZROCaRNc1JyF5cjLZF9nfsBiOtBt/DPSDqILMCOU4HElsooH
	AX2IcYFBzI0kqSGQM3rUymjOKQ==
X-Google-Smtp-Source: AGHT+IEAOcHAhe76PlYpmxmRWUj7OaFeHBRdy+I9gs+A93eZqhIL97YR/UQVA5vYWBHYV4MwHBoZSA==
X-Received: by 2002:a05:622a:1921:b0:41c:e129:87dc with SMTP id w33-20020a05622a192100b0041ce12987dcmr7464349qtc.36.1700453729718;
        Sun, 19 Nov 2023 20:15:29 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:5d12:0:b0:421:c71a:9295 with SMTP id f18-20020ac85d12000000b00421c71a9295ls1776018qtx.0.-pod-prod-01-us;
 Sun, 19 Nov 2023 20:15:29 -0800 (PST)
X-Received: by 2002:a05:620a:628f:b0:779:e22e:1fc with SMTP id ov15-20020a05620a628f00b00779e22e01fcmr7822897qkn.62.1700453729087;
        Sun, 19 Nov 2023 20:15:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700453729; cv=none;
        d=google.com; s=arc-20160816;
        b=WB0w9fNUCB6exfCBJPWcKYvMzrcMIDfoaY8np/StmcD54CX+CUDO6TGhy9P5X+YJD6
         JcNL0Js6DV4UIUWrkfA/Rk7o0TPQdixQfhOTHaUW2Pbw2pBCYQSgG5/4msQI2MHr9YBO
         Xdcy6bcyj7Pq4tEfMitdxyckGCMBdWZomf7oYMHsGtJnCWWVlFvXJMCIJAHb2ktXdh6D
         0RwbJbJ/q8i2ej+a5WQm0xsw5+tqL5g5IMGSZqI1iHViHdi2gqmg/P16tPG41Nt+B/LE
         TSR7XyxIl9Z8h/ZmveLKQrC4ZW7fC16L+Wf65k+r9+Gst7SQycLcScMfEaO3N/gEO2Yh
         UWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=NBYMzx+0ghq9rZyVtiAqDaDvPyfZ7l/tXiv5hFDBJO0=;
        fh=2MjqSmE/Flr/Azt/mtnMNhZyMmjsqHVSxMPyjqy6YHI=;
        b=j1XGS3G7rHBvTwql+zMsN5S1KiiOtliJn3+54Ab+MhpBn8m85Ch7qehy8zArLafYTl
         y//Rasn4E1Rsp36u9vOceivs5uDrbQlkPRpnr4s5y7HFYIBxncbsyj/U4QFVLbdVFTdD
         7WWC16XYeelBUnc8ocvV8+dGjQ4AETetW8kV02KSKkQQpAzvt01S7Z51mUh19aWo73kT
         LjUnQhcJX18Plbfsk1yUO+2c+ZJr06zaHejifdPMBJAXYAJ0r/WW9MaLQWQPY37wMQLH
         ZPuNTnoqqNodCbhrbbD+Kkkyd0SPz49N2qhtI0NtpuoA0mRQiKH/qzJ1aH5jF3jh2H4D
         U6Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.214.169 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id i6-20020a05620a248600b007756924fe18si6941445qkn.681.2023.11.19.20.15.28
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 20:15:29 -0800 (PST)
Received-SPF: pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.214.169 as permitted sender) client-ip=209.85.214.169;
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-76-ebMz-3GbNbCNo7I5IhLh8Q-1; Sun,
 19 Nov 2023 23:15:27 -0500
X-MC-Unique: ebMz-3GbNbCNo7I5IhLh8Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A7A23C0D185
	for <linux-cachefs@gapps.redhat.com>; Mon, 20 Nov 2023 04:15:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 37635492BE7; Mon, 20 Nov 2023 04:15:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 300B8492BE0
	for <linux-cachefs@redhat.com>; Mon, 20 Nov 2023 04:15:27 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FAEB1C04180
	for <linux-cachefs@redhat.com>; Mon, 20 Nov 2023 04:15:27 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-R8atjV3VP463shm6GnDjbg-1; Sun, 19 Nov 2023 23:15:24 -0500
X-MC-Unique: R8atjV3VP463shm6GnDjbg-1
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ccbb7f79cdso28421135ad.3
        for <linux-cachefs@redhat.com>; Sun, 19 Nov 2023 20:15:24 -0800 (PST)
X-Received: by 2002:a17:902:e54e:b0:1cc:636f:f376 with SMTP id n14-20020a170902e54e00b001cc636ff376mr4712244plf.44.1700453723651;
        Sun, 19 Nov 2023 20:15:23 -0800 (PST)
Received: from C02G705SMD6V.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001cc4e477861sm5065266plw.212.2023.11.19.20.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 20:15:23 -0800 (PST)
From: "'Jia Zhu' via linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Cc: linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jefflexu@linux.alibaba.com,
	hsiangkao@linux.alibaba.com,
	Jia Zhu <zhujia.zj@bytedance.com>
Subject: [PATCH V6 RESEND 1/5] cachefiles: introduce object ondemand state
Date: Mon, 20 Nov 2023 12:14:18 +0800
Message-Id: <20231120041422.75170-2-zhujia.zj@bytedance.com>
In-Reply-To: <20231120041422.75170-1-zhujia.zj@bytedance.com>
References: <20231120041422.75170-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: zhujia.zj@bytedance.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of zhujia.zj@bytedance.com designates 209.85.214.169 as permitted
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

Previously, @ondemand_id field was used not only to identify ondemand
state of the object, but also to represent the index of the xarray.
This commit introduces @state field to decouple the role of @ondemand_id
and adds helpers to access it.

Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/internal.h | 21 +++++++++++++++++++++
 fs/cachefiles/ondemand.c | 21 +++++++++------------
 2 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 2ad58c465208..00beedeaec18 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -44,6 +44,11 @@ struct cachefiles_volume {
 	struct dentry			*fanout[256];	/* Fanout subdirs */
 };
 
+enum cachefiles_object_state {
+	CACHEFILES_ONDEMAND_OBJSTATE_CLOSE, /* Anonymous fd closed by daemon or initial state */
+	CACHEFILES_ONDEMAND_OBJSTATE_OPEN, /* Anonymous fd associated with object is available */
+};
+
 /*
  * Backing file state.
  */
@@ -62,6 +67,7 @@ struct cachefiles_object {
 #define CACHEFILES_OBJECT_USING_TMPFILE	0		/* Have an unlinked tmpfile */
 #ifdef CONFIG_CACHEFILES_ONDEMAND
 	int				ondemand_id;
+	enum cachefiles_object_state	state;
 #endif
 };
 
@@ -296,6 +302,21 @@ extern void cachefiles_ondemand_clean_object(struct cachefiles_object *object);
 extern int cachefiles_ondemand_read(struct cachefiles_object *object,
 				    loff_t pos, size_t len);
 
+#define CACHEFILES_OBJECT_STATE_FUNCS(_state, _STATE)	\
+static inline bool								\
+cachefiles_ondemand_object_is_##_state(const struct cachefiles_object *object) \
+{												\
+	return object->state == CACHEFILES_ONDEMAND_OBJSTATE_##_STATE; \
+}												\
+												\
+static inline void								\
+cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
+{												\
+	object->state = CACHEFILES_ONDEMAND_OBJSTATE_##_STATE; \
+}
+
+CACHEFILES_OBJECT_STATE_FUNCS(open, OPEN);
+CACHEFILES_OBJECT_STATE_FUNCS(close, CLOSE);
 #else
 static inline ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 					char __user *_buffer, size_t buflen)
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 0254ed39f68c..90456b8a4b3e 100644
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
@@ -430,18 +434,11 @@ static int cachefiles_ondemand_init_close_req(struct cachefiles_req *req,
 					      void *private)
 {
 	struct cachefiles_object *object = req->object;
-	int object_id = object->ondemand_id;
 
-	/*
-	 * It's possible that object id is still 0 if the cookie looking up
-	 * phase failed before OPEN request has ever been sent. Also avoid
-	 * sending CLOSE request for CACHEFILES_ONDEMAND_ID_CLOSED, which means
-	 * anon_fd has already been closed.
-	 */
-	if (object_id <= 0)
+	if (!cachefiles_ondemand_object_is_open(object))
 		return -ENOENT;
 
-	req->msg.object_id = object_id;
+	req->msg.object_id = object->ondemand_id;
 	trace_cachefiles_ondemand_close(object, &req->msg);
 	return 0;
 }
@@ -460,7 +457,7 @@ static int cachefiles_ondemand_init_read_req(struct cachefiles_req *req,
 	int object_id = object->ondemand_id;
 
 	/* Stop enqueuing requests when daemon has closed anon_fd. */
-	if (object_id <= 0) {
+	if (!cachefiles_ondemand_object_is_open(object)) {
 		WARN_ON_ONCE(object_id == 0);
 		pr_info_once("READ: anonymous fd closed prematurely.\n");
 		return -EIO;
@@ -485,7 +482,7 @@ int cachefiles_ondemand_init_object(struct cachefiles_object *object)
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
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

