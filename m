Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 895795984BC
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Aug 2022 15:52:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660830777;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uFvC6POgXzSijdo2uNwkuin9L5H8O2/t1qs5RIiwEwA=;
	b=ZnVOgOhr64pGbm7OXIv28783ohT0GpWS5vL/0B2/gvLT941ysTEks6LqjynBlt+4A3heNQ
	2z3LNf5BaKbsFq4AMygOWc/0SPDob4JcoUPPcbZ4DWabgwpaEWGYbyCk1HbhqpU3fiSopL
	qiLh8oN0zAyj+lvteeaG0a+xFVxKP7k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-IjshOvK7P9CJvx9samDDAA-1; Thu, 18 Aug 2022 09:52:53 -0400
X-MC-Unique: IjshOvK7P9CJvx9samDDAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6B698032E3;
	Thu, 18 Aug 2022 13:52:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9990240D2827;
	Thu, 18 Aug 2022 13:52:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6B10F194E11C;
	Thu, 18 Aug 2022 13:52:52 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CBD2B1946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 13:52:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BEEB815230A0; Thu, 18 Aug 2022 13:52:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB65E15230A1
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 13:52:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B822299E75F
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 13:52:50 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-488-VsHmwDIzPe2IKFQG2V9CXQ-1; Thu, 18 Aug 2022 09:52:49 -0400
X-MC-Unique: VsHmwDIzPe2IKFQG2V9CXQ-1
Received: by mail-pj1-f50.google.com with SMTP id e19so549295pju.1
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 06:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=AO4PYjCx0vXpaCKfQl5aDcYdKlf6Zm6zj4mxVrexpEo=;
 b=SqOdz2ig8jh+kymgDy+KgtAnxfUIXt5CFc+cHHNbOZjmmmANEcXFNBpOyOLyLaK8VT
 PeM/XcitN9QmNYIV/wA6VDP1b2dsZ3+k31sUPsaY6I1tl1bQ6MSPVGbshnJYl1yyU8HW
 4A/raRNrYH4oi3e+tgl8qdq8l1IERtSQA1V2bw0Sla7oPvmzr5NK/nFCozbvYOisRtxW
 VMS/Ks+fIKiLRoHxfFrYqnibzvbEbcM4IPwfBlHzGjJjifeLXaC54TFoqKfLiF288GT4
 bIjOnm20M27r8Iq3olUmdFvZuYT+tNO6ShzFG9IcvXIZcuGwPxLhDNSLH+7L5sgrJ1cr
 QXHg==
X-Gm-Message-State: ACgBeo2AW+bp+JHcczEgAr/Eiw6wlE5sg+fSFfjqrBL6O0VmPdah+zFV
 A+rVbmiiDr3/8KTF3IGkN8IL0A==
X-Google-Smtp-Source: AA6agR6Prqv2loglSrJuFS5LnkbzxN6+zNWILCKh5CNTaNFa7imFiGHdHiZIU75qH8+TDRaSFves3g==
X-Received: by 2002:a17:90b:314e:b0:1f3:189c:518f with SMTP id
 ip14-20020a17090b314e00b001f3189c518fmr3195014pjb.193.1660830767981; 
 Thu, 18 Aug 2022 06:52:47 -0700 (PDT)
Received: from C02G705SMD6V.bytedance.net ([139.177.225.242])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a170902ce1100b0016db0d877e4sm1385697plg.221.2022.08.18.06.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:52:47 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	xiang@kernel.org,
	jefflexu@linux.alibaba.com
Date: Thu, 18 Aug 2022 21:52:01 +0800
Message-Id: <20220818135204.49878-3-zhujia.zj@bytedance.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Linux-cachefs] [RFC PATCH 2/5] cachefiles: extract ondemand info
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

We'll introduce a @work_struct field for @object in subsequent patches,
it will enlarge the size of @object.
As the result of that, this commit extracts ondemand info field from
@object.

Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
---
 fs/cachefiles/interface.c |  6 ++++++
 fs/cachefiles/internal.h  | 29 +++++++++++++++++++++++++----
 fs/cachefiles/ondemand.c  | 28 ++++++++++++++++++++++------
 3 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index a69073a1d3f0..f21f5660ea7f 100644
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
+		kfree(CACHEFILES_ONDEMAND_OBJINFO(object));
 
 		cache = object->volume->cache->cache;
 		fscache_put_cookie(object->cookie, fscache_cookie_put_object);
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 6661b3e361da..cdf4ec781933 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -50,6 +50,12 @@ enum cachefiles_object_state {
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
@@ -67,8 +73,7 @@ struct cachefiles_object {
 	unsigned long			flags;
 #define CACHEFILES_OBJECT_USING_TMPFILE	0		/* Have an unlinked tmpfile */
 #ifdef CONFIG_CACHEFILES_ONDEMAND
-	int				ondemand_id;
-	enum cachefiles_object_state	state;
+	void				*private;
 #endif
 };
 
@@ -302,6 +307,12 @@ extern void cachefiles_ondemand_clean_object(struct cachefiles_object *object);
 extern int cachefiles_ondemand_read(struct cachefiles_object *object,
 				    loff_t pos, size_t len);
 
+extern int cachefiles_ondemand_init_obj_info(struct cachefiles_object *object,
+					struct cachefiles_volume *volume);
+
+#define CACHEFILES_ONDEMAND_OBJINFO(object)	\
+		((struct cachefiles_ondemand_info *)(object)->private)
+
 #define CACHEFILES_OBJECT_STATE_FUNCS(_state)	\
 static inline bool								\
 cachefiles_ondemand_object_is_##_state(const struct cachefiles_object *object) \
@@ -312,7 +323,8 @@ cachefiles_ondemand_object_is_##_state(const struct cachefiles_object *object) \
 	 * a RELEASE barrier. We need to use smp_load_acquire() here
 	 * to safely ACQUIRE the memory the other task published.
 	 */											\
-	return smp_load_acquire(&object->state) == CACHEFILES_ONDEMAND_OBJSTATE_##_state; \
+	return smp_load_acquire(&(CACHEFILES_ONDEMAND_OBJINFO(object)->state)) == \
+			CACHEFILES_ONDEMAND_OBJSTATE_##_state; \
 }												\
 												\
 static inline void								\
@@ -323,12 +335,15 @@ cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
 	 * I.e. here we publish a state with a RELEASE barrier
 	 * so that concurrent tasks can ACQUIRE it.
 	 */											\
-	smp_store_release(&object->state, CACHEFILES_ONDEMAND_OBJSTATE_##_state); \
+	smp_store_release(&(CACHEFILES_ONDEMAND_OBJINFO(object)->state),	\
+		CACHEFILES_ONDEMAND_OBJSTATE_##_state); \
 }
 
 CACHEFILES_OBJECT_STATE_FUNCS(open);
 CACHEFILES_OBJECT_STATE_FUNCS(close);
 #else
+#define CACHEFILES_ONDEMAND_OBJINFO(object)	NULL
+
 static inline ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 					char __user *_buffer, size_t buflen)
 {
@@ -349,6 +364,12 @@ static inline int cachefiles_ondemand_read(struct cachefiles_object *object,
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
index e3155a5f32e4..f51266554e4d 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -9,12 +9,13 @@ static int cachefiles_ondemand_fd_release(struct inode *inode,
 {
 	struct cachefiles_object *object = file->private_data;
 	struct cachefiles_cache *cache = object->volume->cache;
-	int object_id = object->ondemand_id;
+	struct cachefiles_ondemand_info *info = CACHEFILES_ONDEMAND_OBJINFO(object);
+	int object_id = info->ondemand_id;
 	struct cachefiles_req *req;
 	XA_STATE(xas, &cache->reqs, 0);
 
 	xa_lock(&cache->reqs);
-	object->ondemand_id = CACHEFILES_ONDEMAND_ID_CLOSED;
+	info->ondemand_id = CACHEFILES_ONDEMAND_ID_CLOSED;
 	cachefiles_ondemand_set_object_close(object);
 
 	/*
@@ -218,7 +219,7 @@ static int cachefiles_ondemand_get_fd(struct cachefiles_req *req)
 	load = (void *)req->msg.data;
 	load->fd = fd;
 	req->msg.object_id = object_id;
-	object->ondemand_id = object_id;
+	CACHEFILES_ONDEMAND_OBJINFO(object)->ondemand_id = object_id;
 
 	cachefiles_get_unbind_pincount(cache);
 	trace_cachefiles_ondemand_open(object, &req->msg, load);
@@ -358,7 +359,7 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
 
 		if (opcode != CACHEFILES_OP_OPEN &&
 			!cachefiles_ondemand_object_is_open(object)) {
-			WARN_ON_ONCE(object->ondemand_id == 0);
+			WARN_ON_ONCE(CACHEFILES_ONDEMAND_OBJINFO(object)->ondemand_id == 0);
 			xas_unlock(&xas);
 			ret = -EIO;
 			goto out;
@@ -434,7 +435,7 @@ static int cachefiles_ondemand_init_close_req(struct cachefiles_req *req,
 	if (!cachefiles_ondemand_object_is_open(object))
 		return -ENOENT;
 
-	req->msg.object_id = object->ondemand_id;
+	req->msg.object_id = CACHEFILES_ONDEMAND_OBJINFO(object)->ondemand_id;
 	trace_cachefiles_ondemand_close(object, &req->msg);
 	return 0;
 }
@@ -450,7 +451,7 @@ static int cachefiles_ondemand_init_read_req(struct cachefiles_req *req,
 	struct cachefiles_object *object = req->object;
 	struct cachefiles_read *load = (void *)req->msg.data;
 	struct cachefiles_read_ctx *read_ctx = private;
-	int object_id = object->ondemand_id;
+	int object_id = CACHEFILES_ONDEMAND_OBJINFO(object)->ondemand_id;
 
 	/* Stop enqueuing requests when daemon has closed anon_fd. */
 	if (!cachefiles_ondemand_object_is_open(object)) {
@@ -496,6 +497,21 @@ void cachefiles_ondemand_clean_object(struct cachefiles_object *object)
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
+	CACHEFILES_ONDEMAND_OBJINFO(object)->object = object;
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

