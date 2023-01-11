Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E4D6653B1
	for <lists+linux-cachefs@lfdr.de>; Wed, 11 Jan 2023 06:26:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673414769;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sYqLFp1AqFv0n+QUfc2tlzY5TIqK75G6hPv+7gtp2uE=;
	b=LID7R94EoxJS0sWsveif3slfrJzsEkIhHeHNqdB+Z3N679PHoF0UjTQ0SmuuhJp9hzuImS
	o8aEVS3yhdEv18rc/fY4Y+GoY1IRfRUIJLhCYWxOpvNC27ZsozSpwb+P7l2u9Ktk5YTiUr
	2BPz9m+M+P9w0av6GZ6Ip8An7kXon6k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-XNlmLyfEPA64y-6VwhWO5Q-1; Wed, 11 Jan 2023 00:26:05 -0500
X-MC-Unique: XNlmLyfEPA64y-6VwhWO5Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C2D4811E6E;
	Wed, 11 Jan 2023 05:26:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32ED82026D68;
	Wed, 11 Jan 2023 05:26:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E25F41947051;
	Wed, 11 Jan 2023 05:25:54 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 66BCC1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 11 Jan 2023 05:25:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4254D2166B29; Wed, 11 Jan 2023 05:25:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B7E22166B26
 for <linux-cachefs@redhat.com>; Wed, 11 Jan 2023 05:25:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DE0C85CBE0
 for <linux-cachefs@redhat.com>; Wed, 11 Jan 2023 05:25:44 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-298-wvAFhMbxPom-aWjUnQQVmg-2; Wed, 11 Jan 2023 00:25:40 -0500
X-MC-Unique: wvAFhMbxPom-aWjUnQQVmg-2
Received: by mail-pl1-f170.google.com with SMTP id b17so8127484pld.7
 for <linux-cachefs@redhat.com>; Tue, 10 Jan 2023 21:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pDYD8kdF4QcIxV+XVTzksOOF3bsvD3XSTsyoZ+oU6es=;
 b=B7nfGiM9ZB0/Tg6AXTlyn7NhAIa8AnbRfilIgC9rot6ChhoJLU5o800xDwvdmc1dWA
 ovY/J5FEDeGhZt67aMn8tRIo618kuYT6JaAcV8bF7gtizek+9F6zgL+OX3kbeT8wcGwd
 dnqHayTQeOXAwHsQlsz/TpU1/qo0iCAeI4FEYsty8DdWrDucef5cMy5LbmggPrLRNNJ6
 ZVSo5Gk7A3y/0P9oRWJE9G6O/sAJmeulp59HSgp2IwZQrUgFH2xisEOPERBd6yJC3vgJ
 kjvetFvd6Y1mhJqDsu/e2egaGxdt1yWDBgWwdqzKVbw2vGjt3U3oQkdSqLWFEmI2l7Ku
 8P5A==
X-Gm-Message-State: AFqh2krNSbWgO7Egpixc6G+nwj7/EM57AguGQhFZ0M39P5hdEHf2d9xF
 DI3DXU0tFPHEplBqhQ60u4dksw==
X-Google-Smtp-Source: AMrXdXv2i/melO+AoHL3yfAagLR5DbuQwlvc40wWx8sbnZnmAu95AVugnppbuaMQoO1kuzhzYqENDQ==
X-Received: by 2002:a17:902:968d:b0:192:8d74:99e0 with SMTP id
 n13-20020a170902968d00b001928d7499e0mr46324926plp.4.1673414739479; 
 Tue, 10 Jan 2023 21:25:39 -0800 (PST)
Received: from C02G705SMD6V.bytedance.net ([61.213.176.10])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a170903244a00b0019334350ce6sm4934520pls.244.2023.01.10.21.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 21:25:39 -0800 (PST)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com
Date: Wed, 11 Jan 2023 13:25:14 +0800
Message-Id: <20230111052515.53941-5-zhujia.zj@bytedance.com>
In-Reply-To: <20230111052515.53941-1-zhujia.zj@bytedance.com>
References: <20230111052515.53941-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH V4 4/5] cachefiles: narrow the scope of
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
Cc: linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't trigger EPOLLIN when there are only reopening read requests in
xarray.

Suggested-by: Xin Yin <yinxin.x@bytedance.com>
Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/daemon.c   | 15 +++++++++++++--
 fs/cachefiles/internal.h | 12 ++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index aa4efcabb5e3..b8d8f280fb7a 100644
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
+			xa_lock(xa);
+			xa_for_each_marked(xa, index, req, CACHEFILES_REQ_NEW) {
+				if (!cachefiles_ondemand_is_reopening_read(req)) {
+					mask |= EPOLLIN;
+					break;
+				}
+			}
+			xa_unlock(xa);
+		}
 	} else {
 		if (test_bit(CACHEFILES_STATE_CHANGED, &cache->flags))
 			mask |= EPOLLIN;
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 2ed836d4169e..3d94990a8b38 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -326,6 +326,13 @@ cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
 CACHEFILES_OBJECT_STATE_FUNCS(open);
 CACHEFILES_OBJECT_STATE_FUNCS(close);
 CACHEFILES_OBJECT_STATE_FUNCS(reopening);
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
@@ -353,6 +360,11 @@ static inline int cachefiles_ondemand_init_obj_info(struct cachefiles_object *ob
 {
 	return 0;
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

