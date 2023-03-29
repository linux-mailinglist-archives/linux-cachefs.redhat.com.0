Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8246CDB83
	for <lists+linux-cachefs@lfdr.de>; Wed, 29 Mar 2023 16:06:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680098798;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QfdVVreZ5LBtn6BWRmbMIa2hYjIUvgx9S2SuJNZmcNw=;
	b=ci7c+TBPxH20RulehQszObdki2r+5riQr0AZ8jCaAzZ+AlAGxuyoW7Lw63UhrnBVfJlTZq
	SHbhC0twd5vapeytMZ6H7BAUbllK6XTD2wSUVgBZHhSj+ZRc6UaccTsRGhpyJJYH0S1NiI
	bOahUcNkgCICWTi5ZycgQ55AqyQItBU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-qLxkX-KAOJigF3_MTwDwiQ-1; Wed, 29 Mar 2023 10:06:35 -0400
X-MC-Unique: qLxkX-KAOJigF3_MTwDwiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 039AC185A7A4;
	Wed, 29 Mar 2023 14:06:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED7DB18EC2;
	Wed, 29 Mar 2023 14:06:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DA6E119465A4;
	Wed, 29 Mar 2023 14:06:32 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7A5D41946587 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 14:02:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6FC44492B02; Wed, 29 Mar 2023 14:02:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67D59492B00
 for <linux-cachefs@redhat.com>; Wed, 29 Mar 2023 14:02:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CE5E855332
 for <linux-cachefs@redhat.com>; Wed, 29 Mar 2023 14:02:30 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658--6XuhZeCOfW3TcXI4S7eVQ-1; Wed, 29 Mar 2023 10:02:27 -0400
X-MC-Unique: -6XuhZeCOfW3TcXI4S7eVQ-1
Received: by mail-pg1-f179.google.com with SMTP id z18so9303327pgj.13
 for <linux-cachefs@redhat.com>; Wed, 29 Mar 2023 07:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680098546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=201B13UZk/ur2kBlvNBkJlC5f80F32l3qYGjPhn9UGk=;
 b=KNEU18D2ytEd0c/nrw8Ccebrdz71sjXtf57UljSLgRaDPfx34kG5vvW5m23wSwbqog
 XHQBNluJNzAT90KOgxwJcxLHhXWobzVVJSHsKc2GsycJiRpdAPM7icL7Dfy3wUKCzZaa
 qoFQduwQ44kYDUlnn4vEVO7Hi0rmp/8/MF2qcDQhC48GrRg6FitmD+aYv1hqyzl81y1n
 TnQBqrVrocgEOtsN302E0iUyMZk0h/sXgFXo5wZB8x+IYbXzKuk4dy7haDAbXWXl3lj9
 Gj9yRGmNhoo1/9igncRNJfdH/xXG0Wfc3/Eyw+JkUSp7bUz1vU6gIKdOncebEhi0FK93
 Bv6g==
X-Gm-Message-State: AAQBX9crMn4QlNNcCdr5EasM7mCn8kgAkSESJ33efzNujkUmxox5epmg
 CbQ9ETuHqdVjWZwX3dVsW6X4ng==
X-Google-Smtp-Source: AKy350aS4UxXoOIsHELZC+pNvz0Orc/jDx6TWEB+8m6gvhUkHKqYrpdjkPrCG/VD3G35YcxyACiV1Q==
X-Received: by 2002:a05:6a00:1d0f:b0:629:3f28:ead1 with SMTP id
 a15-20020a056a001d0f00b006293f28ead1mr2194928pfx.12.1680098545899; 
 Wed, 29 Mar 2023 07:02:25 -0700 (PDT)
Received: from C02G705SMD6V.bytedance.net ([61.213.176.14])
 by smtp.gmail.com with ESMTPSA id
 y17-20020aa78051000000b006288ca3cadfsm5399468pfm.35.2023.03.29.07.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 07:02:25 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Wed, 29 Mar 2023 22:01:54 +0800
Message-Id: <20230329140155.53272-5-zhujia.zj@bytedance.com>
In-Reply-To: <20230329140155.53272-1-zhujia.zj@bytedance.com>
References: <20230329140155.53272-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH V5 4/5] cachefiles: narrow the scope of
 triggering EPOLLIN events in ondemand mode
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
Cc: linux-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't trigger EPOLLIN when there are only reopening read requests in
xarray.

Suggested-by: Xin Yin <yinxin.x@bytedance.com>
Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
---
 fs/cachefiles/daemon.c   | 15 +++++++++++++--
 fs/cachefiles/internal.h | 12 ++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index aa4efcabb5e37..86892f471e761 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -355,14 +355,25 @@ static __poll_t cachefiles_daemon_poll(struct file *file,
 					   struct poll_table_struct *poll)
 {
 	struct cachefiles_cache *cache = file->private_data;
+	struct xarray *xa = &cache->reqs;
+	struct cachefiles_req *req;
+	unsigned long index;
 	__poll_t mask;
 
 	poll_wait(file, &cache->daemon_pollwq, poll);
 	mask = 0;
 
 	if (cachefiles_in_ondemand_mode(cache)) {
-		if (!xa_empty(&cache->reqs))
-			mask |= EPOLLIN;
+		if (!xa_empty(xa)) {
+			rcu_read_lock();
+			xa_for_each_marked(xa, index, req, CACHEFILES_REQ_NEW) {
+				if (!cachefiles_ondemand_is_reopening_read(req)) {
+					mask |= EPOLLIN;
+					break;
+				}
+			}
+			rcu_read_unlock();
+		}
 	} else {
 		if (test_bit(CACHEFILES_STATE_CHANGED, &cache->flags))
 			mask |= EPOLLIN;
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index b9a90f1a0c015..26e5f8f123ef1 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -329,6 +329,13 @@ cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
 CACHEFILES_OBJECT_STATE_FUNCS(open, OPEN);
 CACHEFILES_OBJECT_STATE_FUNCS(close, CLOSE);
 CACHEFILES_OBJECT_STATE_FUNCS(reopening, REOPENING);
+
+static inline bool cachefiles_ondemand_is_reopening_read(struct cachefiles_req *req)
+{
+	return cachefiles_ondemand_object_is_reopening(req->object) &&
+			req->msg.opcode == CACHEFILES_OP_READ;
+}
+
 #else
 static inline ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 					char __user *_buffer, size_t buflen)
@@ -359,6 +366,11 @@ static inline int cachefiles_ondemand_init_obj_info(struct cachefiles_object *ob
 static inline void cachefiles_ondemand_deinit_obj_info(struct cachefiles_object *obj)
 {
 }
+
+static inline bool cachefiles_ondemand_is_reopening_read(struct cachefiles_req *req)
+{
+	return false;
+}
 #endif
 
 /*
-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

