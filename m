Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE4B5FEA16
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Oct 2022 10:06:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665734817;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gBB/Vl5OW6KfHvqRxmOCMhTQj5c2wE2AE4J1QVWh910=;
	b=hMU7jTphDrEbuS8fdEdxV2zwmXANVHFDXr77jKm6urX51FT95viQWtUbqA9qYvMBp04lut
	khKKwBRgmg6i2laJHpmhvutfTTSO1vEUcCfKo8XQc2/NoPrd5ttIKPZ7kknhWHRygGzbGJ
	sXDueetZwdOvwZZUF9DG0nQ6O2xETzI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-vZ2LS6scO5iOEMdGJpaR0Q-1; Fri, 14 Oct 2022 04:06:56 -0400
X-MC-Unique: vZ2LS6scO5iOEMdGJpaR0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F80A85A5B6;
	Fri, 14 Oct 2022 08:06:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 760742144B2D;
	Fri, 14 Oct 2022 08:06:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 370CA194658F;
	Fri, 14 Oct 2022 08:06:55 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5CA781946587 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 14 Oct 2022 08:06:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3D23245390A; Fri, 14 Oct 2022 08:06:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35BA7453908
 for <linux-cachefs@redhat.com>; Fri, 14 Oct 2022 08:06:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8BCA1C05EC0
 for <linux-cachefs@redhat.com>; Fri, 14 Oct 2022 08:06:43 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-417-_oXMmr4DNiKhXiFy3CH0OQ-1; Fri, 14 Oct 2022 04:06:42 -0400
X-MC-Unique: _oXMmr4DNiKhXiFy3CH0OQ-1
Received: by mail-pl1-f181.google.com with SMTP id b2so4063476plc.7
 for <linux-cachefs@redhat.com>; Fri, 14 Oct 2022 01:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BUNmB6S9jkYzZMjtNGXZtdFizVu+vOEWVlJtmuAd/sM=;
 b=n3XDl83XgUrJHQC72hHhmc871LDRY7OWJfjnpd+vZgg96NKUrEmKf9aFpwUo+0CeNa
 5nJLViHZjn6VzUvnV4VsUZ91xsDBrocQjMv55hC388CJpQkGZ4C0Q7PBZTZRfGbdOlK2
 w7x0X+ESkIU802eOs/dm7GM0wSI39l4Lg0EXWLg2rs+N2GCzxC4Zgf3wR/Hf9XHWe+/j
 y4qOW63RH9zwr7I8prldxpohSc0fFTwBolN7sZ/PD7/wf/goWo/YSrU0GSjxjG9CJEyG
 sk+jfYRdmpidG18vX7mWFtpzd4srmEvq5T9yCpnY5ijx/reMXnChalwYHkPZizWv3xRg
 BGEA==
X-Gm-Message-State: ACrzQf0oi5wPoB4El1W97SrGH5J1CRkWw6DXCDDuW62aPmYqRZHmJnv4
 cwlXL7pEzsQsDEG7g9CdeHcv5g==
X-Google-Smtp-Source: AMsMyM4+QTDVe0PSOfko1jnOnb99TRszP8FZFZUtSLXmLusfUA1j9vn62i4e9tauPA02Mw0XOV3/EA==
X-Received: by 2002:a17:903:11cc:b0:178:aec1:18c3 with SMTP id
 q12-20020a17090311cc00b00178aec118c3mr4226294plh.91.1665734800983; 
 Fri, 14 Oct 2022 01:06:40 -0700 (PDT)
Received: from C02G705SMD6V.bytedance.net ([63.216.146.188])
 by smtp.gmail.com with ESMTPSA id
 ik20-20020a170902ab1400b001730a1af0fbsm1119196plb.23.2022.10.14.01.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:06:40 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	xiang@kernel.org,
	jefflexu@linux.alibaba.com
Date: Fri, 14 Oct 2022 16:05:56 +0800
Message-Id: <20221014080559.42108-3-zhujia.zj@bytedance.com>
In-Reply-To: <20221014080559.42108-1-zhujia.zj@bytedance.com>
References: <20221014080559.42108-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Linux-cachefs] [PATCH V3 2/5] cachefiles: extract ondemand info
 field from cachefiles_object
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

We'll introduce a @work_struct field for @object in subsequent patches,
it will enlarge the size of @object.
As the result of that, this commit extracts ondemand info field from
@object.

Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/interface.c |  6 ++++++
 fs/cachefiles/internal.h  | 24 ++++++++++++++++++------
 fs/cachefiles/ondemand.c  | 28 ++++++++++++++++++++++------
 3 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index a69073a1d3f0..690e3e1ee661 100644
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
@@ -88,6 +93,7 @@ void cachefiles_put_object(struct cachefiles_object *object,
 		ASSERTCMP(object->file, ==, NULL);
 
 		kfree(object->d_name);
+		kfree(object->private);
 
 		cache = object->volume->cache->cache;
 		fscache_put_cookie(object->cookie, fscache_cookie_put_object);
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index b9c76a935ecd..beaf3a8785ce 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -49,6 +49,12 @@ enum cachefiles_object_state {
 	CACHEFILES_ONDEMAND_OBJSTATE_open, /* Anonymous fd associated with object is available */
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
@@ -65,10 +71,7 @@ struct cachefiles_object {
 	enum cachefiles_content		content_info:8;	/* Info about content presence */
 	unsigned long			flags;
 #define CACHEFILES_OBJECT_USING_TMPFILE	0		/* Have an unlinked tmpfile */
-#ifdef CONFIG_CACHEFILES_ONDEMAND
-	int				ondemand_id;
-	enum cachefiles_object_state	state;
-#endif
+	struct cachefiles_ondemand_info	*private;
 };
 
 #define CACHEFILES_ONDEMAND_ID_CLOSED	-1
@@ -302,17 +305,20 @@ extern void cachefiles_ondemand_clean_object(struct cachefiles_object *object);
 extern int cachefiles_ondemand_read(struct cachefiles_object *object,
 				    loff_t pos, size_t len);
 
+extern int cachefiles_ondemand_init_obj_info(struct cachefiles_object *object,
+					struct cachefiles_volume *volume);
+
 #define CACHEFILES_OBJECT_STATE_FUNCS(_state)	\
 static inline bool								\
 cachefiles_ondemand_object_is_##_state(const struct cachefiles_object *object) \
 {												\
-	return object->state == CACHEFILES_ONDEMAND_OBJSTATE_##_state; \
+	return object->private->state == CACHEFILES_ONDEMAND_OBJSTATE_##_state; \
 }												\
 												\
 static inline void								\
 cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
 {												\
-	object->state = CACHEFILES_ONDEMAND_OBJSTATE_##_state; \
+	object->private->state = CACHEFILES_ONDEMAND_OBJSTATE_##_state; \
 }
 
 CACHEFILES_OBJECT_STATE_FUNCS(open);
@@ -338,6 +344,12 @@ static inline int cachefiles_ondemand_read(struct cachefiles_object *object,
 {
 	return -EOPNOTSUPP;
 }
+
+static inline int cachefiles_ondemand_init_obj_info(struct cachefiles_object *object,
+						struct cachefiles_volume *volume)
+{
+	return 0;
+}
 #endif
 
 /*
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 90456b8a4b3e..6e47667c6690 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -9,12 +9,13 @@ static int cachefiles_ondemand_fd_release(struct inode *inode,
 {
 	struct cachefiles_object *object = file->private_data;
 	struct cachefiles_cache *cache = object->volume->cache;
-	int object_id = object->ondemand_id;
+	struct cachefiles_ondemand_info *info = object->private;
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
+	object->private->ondemand_id = object_id;
 
 	cachefiles_get_unbind_pincount(cache);
 	trace_cachefiles_ondemand_open(object, &req->msg, load);
@@ -368,7 +369,7 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
 
 		if (opcode != CACHEFILES_OP_OPEN &&
 			!cachefiles_ondemand_object_is_open(object)) {
-			WARN_ON_ONCE(object->ondemand_id == 0);
+			WARN_ON_ONCE(object->private->ondemand_id == 0);
 			xas_unlock(&xas);
 			ret = -EIO;
 			goto out;
@@ -438,7 +439,7 @@ static int cachefiles_ondemand_init_close_req(struct cachefiles_req *req,
 	if (!cachefiles_ondemand_object_is_open(object))
 		return -ENOENT;
 
-	req->msg.object_id = object->ondemand_id;
+	req->msg.object_id = object->private->ondemand_id;
 	trace_cachefiles_ondemand_close(object, &req->msg);
 	return 0;
 }
@@ -454,7 +455,7 @@ static int cachefiles_ondemand_init_read_req(struct cachefiles_req *req,
 	struct cachefiles_object *object = req->object;
 	struct cachefiles_read *load = (void *)req->msg.data;
 	struct cachefiles_read_ctx *read_ctx = private;
-	int object_id = object->ondemand_id;
+	int object_id = object->private->ondemand_id;
 
 	/* Stop enqueuing requests when daemon has closed anon_fd. */
 	if (!cachefiles_ondemand_object_is_open(object)) {
@@ -500,6 +501,21 @@ void cachefiles_ondemand_clean_object(struct cachefiles_object *object)
 			cachefiles_ondemand_init_close_req, NULL);
 }
 
+int cachefiles_ondemand_init_obj_info(struct cachefiles_object *object,
+				struct cachefiles_volume *volume)
+{
+	if (!cachefiles_in_ondemand_mode(volume->cache))
+		return 0;
+
+	object->private = kzalloc(sizeof(struct cachefiles_ondemand_info),
+					GFP_KERNEL);
+	if (!object->private)
+		return -ENOMEM;
+
+	object->private->object = object;
+	return 0;
+}
+
 int cachefiles_ondemand_read(struct cachefiles_object *object,
 			     loff_t pos, size_t len)
 {
-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

