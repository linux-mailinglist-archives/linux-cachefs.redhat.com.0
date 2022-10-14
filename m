Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8AF5FE747
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Oct 2022 05:08:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665716924;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sqop6KeeS1ifvcAFZgoMECCNfomF3WCD+RHCb4fksWI=;
	b=U3YbvyCsqJd7dWhtdoAlIwIccQ9zjXsp0NueSw6Ban4+W0Xmw0WL7K6aR42Mei28+nQmUY
	WFMV1ChrMZdY59Los6Z0Td5VS+apIgk1ujcBOzSVFm3Fnx7sJaJbaE72knql+r5JNWlJiy
	DdV7Z8jMROrzYZf/SKb8aFx7r4GXoeQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-FPunMmCUOcqpCsap5EhVBA-1; Thu, 13 Oct 2022 23:08:41 -0400
X-MC-Unique: FPunMmCUOcqpCsap5EhVBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A2C6800186;
	Fri, 14 Oct 2022 03:08:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1046D2094D00;
	Fri, 14 Oct 2022 03:08:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CF8891946594;
	Fri, 14 Oct 2022 03:08:40 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E20831946587 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 14 Oct 2022 03:08:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D5CD52144B2B; Fri, 14 Oct 2022 03:08:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDE922144B2A
 for <linux-cachefs@redhat.com>; Fri, 14 Oct 2022 03:08:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF367811E81
 for <linux-cachefs@redhat.com>; Fri, 14 Oct 2022 03:08:39 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-cWscNriVMfOOTqcY_6LTKw-1; Thu, 13 Oct 2022 23:08:37 -0400
X-MC-Unique: cWscNriVMfOOTqcY_6LTKw-1
Received: by mail-qv1-f48.google.com with SMTP id h10so2503899qvq.7
 for <linux-cachefs@redhat.com>; Thu, 13 Oct 2022 20:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i1R7QPYLS3htwC9+m+eMmhkdxMHPXqw45xmXhqmncaA=;
 b=gasN8KahVfxG6i77hHWM2ru5YYL8LGF2bQo/fWFoj/cHs7Q3mRriA5pTA27HIQzL58
 MUnyk1O/dr2FybV6GPLD/76AlRdQKOs4OAPHFnl7yfmHurvGhC4aSH17jylKRtuwjodu
 jrDxvebtlL4aTAGDosyGgLH+hPhXtDn+v3eWiVLz1N9K5/vk99OcZSBMgTPFtxPYSKs3
 lznEBalm7K0x3P0CVIj2V2Hr7KZd5Kp8e0DZbOmXrUMv2ryuzLzptNeOTDqjhgdpgFom
 0F7a3zLqrn0rbC7uXheBo6snitEUMdbzlI+bv2LksrtMwK7foq9yMQ1naXOr7+LQJU2U
 cuzQ==
X-Gm-Message-State: ACrzQf1Wq4ezLgkpPSFANmsGZZd95bbYiLq7GCrNBA/Tnas9dDSydc8W
 h5BV6bXtUmkEbAFY3bwBLF7BzznBgW5b7SMe
X-Google-Smtp-Source: AMsMyM5Ejyc0D+AQNsiKQu3QB+Vg9yCW8ZNFcTSVKsMfVupUu0uJQ3sNLvSheHGNJWaShgZirb4OmA==
X-Received: by 2002:a17:903:1003:b0:181:6c26:1114 with SMTP id
 a3-20020a170903100300b001816c261114mr2921922plb.75.1665716906763; 
 Thu, 13 Oct 2022 20:08:26 -0700 (PDT)
Received: from C02G705SMD6V.bytedance.net ([63.216.146.183])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a17090a710400b0020ae09e9724sm425524pjk.53.2022.10.13.20.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 20:08:26 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	xiang@kernel.org,
	jefflexu@linux.alibaba.com
Date: Fri, 14 Oct 2022 11:07:44 +0800
Message-Id: <20221014030745.25748-5-zhujia.zj@bytedance.com>
In-Reply-To: <20221014030745.25748-1-zhujia.zj@bytedance.com>
References: <20221014030745.25748-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH V2 4/5] cachefiles: narrow the scope of
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
index 21ef5007f488..98d6cf58db11 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -327,6 +327,13 @@ cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
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
@@ -354,6 +361,11 @@ static inline int cachefiles_ondemand_init_obj_info(struct cachefiles_object *ob
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

