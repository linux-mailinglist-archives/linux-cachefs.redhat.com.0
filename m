Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 974275984BE
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Aug 2022 15:53:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660830784;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gL4k6tSGpprePrkBpLPUAO2tuJS7OvwPhw1scWbnoQ8=;
	b=QuEiFfV1x86cDrCFZrbUTpWR/bAifA8abfkRsM0uQbzL+5SEElCIOji5FFsFOaFVgV7weF
	xsgk/ReiAIUCZYebQlfeaPasrjEhqByjo8t1eGr3SUz0LRz26OAOqT+u5qYzvvTf7dwsig
	EjtK6VW3nlCjlresWoiNYMUTxOWii+8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-0EsepQ_9N5yc9QodlG7sDQ-1; Thu, 18 Aug 2022 09:53:01 -0400
X-MC-Unique: 0EsepQ_9N5yc9QodlG7sDQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E02B293248D;
	Thu, 18 Aug 2022 13:53:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73B4D40334B;
	Thu, 18 Aug 2022 13:53:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4B00F194E11C;
	Thu, 18 Aug 2022 13:53:00 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 25D921946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 13:52:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DAA5E15230A1; Thu, 18 Aug 2022 13:52:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6F8C15230A0
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 13:52:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C14201824600
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 13:52:58 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-618-UwTpY4kqOqWQ5DiFDPOXhw-1; Thu, 18 Aug 2022 09:52:57 -0400
X-MC-Unique: UwTpY4kqOqWQ5DiFDPOXhw-1
Received: by mail-pj1-f52.google.com with SMTP id
 s36-20020a17090a69a700b001faad0a7a34so4794344pjj.4
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 06:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gH5/oCi30DEBEz19XNsVtoVzaMHu/eBGPrlN2e1Y2h0=;
 b=MROmLu9X/nrN4qHOTUoPxKmJ5mD3Rk6WEyYX598B7ck0WbIhDa0J6iUGfJ3rd/ahk0
 pLH+0N01MluAgXWzkpYtkxIeKDEaND3O+WKKHnNffingKaeV+mARu6hy3E2rrgAUG79y
 VBbnWd8szqBzfmzt/g88SDvc6//JBKEx6ccXsyTrHQLUqYUW7m0iByvD1SpSkNE8kaXG
 LKfvAClAa2lYUcjHislknvxpygNo06/9GTjzck8V6N34NFPHrXW+MlZ8f1lh4wGOh28Q
 730KcN+68QazSvSr/h5gccreFqaH+busNh99Ol7Ix9KLrGJl04XdsAQi6Yt1IswmNlHU
 p+Aw==
X-Gm-Message-State: ACgBeo07EME/UT3bpBWbZiK5FnJ3MQBGVb+d0N36ZQxY6OX9rURlQxaH
 WIWXrPkbN0GzOG8Mg0b0cssurA==
X-Google-Smtp-Source: AA6agR4vq2EHchwptoVCg1mL3pnZdHv9shuA3Z4UdpvUSOc05rSXrUr55WTmmTrNbpL0lo6Pne9Iow==
X-Received: by 2002:a17:90b:3a85:b0:1fa:bf98:5e3e with SMTP id
 om5-20020a17090b3a8500b001fabf985e3emr3183373pjb.102.1660830776207; 
 Thu, 18 Aug 2022 06:52:56 -0700 (PDT)
Received: from C02G705SMD6V.bytedance.net ([139.177.225.242])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a170902ce1100b0016db0d877e4sm1385697plg.221.2022.08.18.06.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:52:55 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	xiang@kernel.org,
	jefflexu@linux.alibaba.com
Date: Thu, 18 Aug 2022 21:52:03 +0800
Message-Id: <20220818135204.49878-5-zhujia.zj@bytedance.com>
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
Subject: [Linux-cachefs] [RFC PATCH 4/5] cachefiles: narrow the scope of
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

Don't trigger EPOLLIN when there are only reopening read requests in
xarray.

Suggested-by: Xin Yin <yinxin.x@bytedance.com>
Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
---
 fs/cachefiles/daemon.c   | 13 +++++++++++--
 fs/cachefiles/internal.h | 12 ++++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index aa4efcabb5e3..c74bd1f4ecf5 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -355,14 +355,23 @@ static __poll_t cachefiles_daemon_poll(struct file *file,
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
+			xa_for_each_marked(xa, index, req, CACHEFILES_REQ_NEW) {
+				if (!cachefiles_ondemand_is_reopening_read(req)) {
+					mask |= EPOLLIN;
+					break;
+				}
+			}
+		}
 	} else {
 		if (test_bit(CACHEFILES_STATE_CHANGED, &cache->flags))
 			mask |= EPOLLIN;
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 66bbd4f1d22a..b4af67f1cbd6 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -344,6 +344,13 @@ cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
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
 #define CACHEFILES_ONDEMAND_OBJINFO(object)	NULL
 
@@ -373,6 +380,11 @@ static inline int cachefiles_ondemand_init_obj_info(struct cachefiles_object *ob
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

