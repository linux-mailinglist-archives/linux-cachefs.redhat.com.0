Return-Path: <linux-cachefs+bncBDKYBHUEQUPBB3F25OVAMGQEWMRCMYA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCB47F0B44
	for <lists+linux-cachefs@lfdr.de>; Mon, 20 Nov 2023 05:15:41 +0100 (CET)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-7c3f35a21b5sf378570241.2
        for <lists+linux-cachefs@lfdr.de>; Sun, 19 Nov 2023 20:15:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700453740; cv=pass;
        d=google.com; s=arc-20160816;
        b=dI/UB3Gmt+SBWwtcdfQWe5OQlmGCZqhRmsMeN1zwTzm2CHUWhaAkpLSnUVodnw16CF
         UInQjtadcJYLh7wQrAIL2x0n1nlZmJQztnDXeryawa2Lcm0fOKp76CoyQKHTSE9S230m
         G3hfiJI/rb/2HEoKsi6dJ3LbifpedWV9W+NImMG/XHt63q2lR60sdugfERP/E4GSIgXH
         gS5NIky43TS6zFQV7DAD0PqUQh3YFxox7XNL6Edlovk5A8dg5qdAp6Lfor2gQB1paDoK
         fQ9FAF1aWVncI8D/3K5Ms4V5tkX69m+CPGtuv610J81bWaUDCRU3V1V49uEMqFhhFwmt
         u9wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:delivered-to;
        bh=R2uhnJwYzoo8WU0oKpkRqZOU8mIwK9KuT4YmX2Sho7w=;
        fh=gTY9Ttsg2h15YfzLiYhbw6/47QPOSTuIOvkuo3BASSw=;
        b=RYwXuJz5wBXBfMY0TPjp5X5EAyYVaLOzjU0TZd7HRgbT/hw5wzjxtSzDUfY4mpHea8
         Lgyvz767Unugh2NC/c3zYJ/YMzTVp5hTjdrHyfGsoQogKWb7ykObfMMWk7hCajFp7wLD
         YkbL3wq2AQ7GchHR2p+l4LhHey0aPE7uVg2UwRldHVip3nrb7+vYk6MAI3IGBvepqmgp
         tSSUuTH9T9OWIRM2ALxwacPf6iFhecaTh16tiXPEFiaoSLxx2TOnNsOkbvS1xt6Z3zwf
         cgY1HKOG87ERZ1T181hL+4bSb+jH9sKjN6IQ6GIJmsDsC1la9gczY2DUItNpFtWcLw8s
         SQbw==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.215.169 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700453740; x=1701058540;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2uhnJwYzoo8WU0oKpkRqZOU8mIwK9KuT4YmX2Sho7w=;
        b=hUWMrjrtQovk1x1/Bwubr+2oKGnzmbuv1o21r++rKSFZ1Qg6KHT398BTXh3SWFj53W
         0rcL3CyVtwk/Chp2KsnzyOtEvig6LcTebHLev58vNgn12PKvIoPLswNBhEBMSAZggt+5
         c93HeJvwfYRCxW6aaiTkgiGxZnaeJRY0pRhDLI8IjwiY2XUPjm+e3veKuefwxd+YvGSR
         r74EoKZSr+6kt4Ag1rnKPWhK+VkhYZk8jTgQW2CMgjHmVqGRjw+RbrCT5G/AujDctiZ8
         FvlZy/vRsu0tYIQdO7kh7ZGV1WsVYxG+8bPMcMGptnWhQsvYAxg2vRb9h9VoCh+oAiPT
         Nf3g==
X-Gm-Message-State: AOJu0YyFXvjinhATUO6hrtWcoOdT3cXpM/TljULCEF8f2ba0lducVVP2
	xT53AXhm5qLrViYMjRJ+qtHLvA==
X-Google-Smtp-Source: AGHT+IFYbROuCSwN0SWjYYx3CNe7vuxF+m6a6q2CCt19+qJyOahayA+0y4VISeoO2ytqsE95CBB3IA==
X-Received: by 2002:a05:6102:2a59:b0:45f:bab9:4414 with SMTP id gt25-20020a0561022a5900b0045fbab94414mr5953582vsb.24.1700453740522;
        Sun, 19 Nov 2023 20:15:40 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:1ec:b0:65a:fb9d:b123 with SMTP id
 c12-20020a05621401ec00b0065afb9db123ls1589153qvu.1.-pod-prod-02-us; Sun, 19
 Nov 2023 20:15:40 -0800 (PST)
X-Received: by 2002:a05:6102:20ca:b0:462:a86a:53d8 with SMTP id i10-20020a05610220ca00b00462a86a53d8mr565166vsr.19.1700453739860;
        Sun, 19 Nov 2023 20:15:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700453739; cv=none;
        d=google.com; s=arc-20160816;
        b=V4ZhqXMGasTd9jp+fXHo3029cthf/OFpeiFDnblzSh8SIGm5EjRcBjZQTHia4p53RO
         NcISfWfZ2HHGrPJjvcXFDnoW0hLhCVrz0MXi6SVkYfU8UAm8YQjUmJVJNAJgta5plbiU
         ExDUX+7q/yawVAADKOK4J+lxRkHPD80fEjBxJ58ixdp0nKw88rEOjENS8GhuR2w9e68q
         iquZX8CL9qScfimC1+TsTw0Ypzl28UPkIH1+tHIzbUA4QJhbU60uu+I8mJ3ASW01gQax
         Erj6iagvApmPzYVRw5pHivPoizMwKDbRwr2V8R9qZaIKkq0S3aKCLzquJf2QRH/EnG/5
         dZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=I3yQNAV5i9i/OMA9ll/UNVMs7Fn6oZ5qFKK0D5McEKU=;
        fh=gTY9Ttsg2h15YfzLiYhbw6/47QPOSTuIOvkuo3BASSw=;
        b=S/Pw5qc6MTmy70r56X/5IPCoi/OgneXp86fc7Q9yc9rnwoM+C1ObpuHZ+hFZ/16TVR
         7gXC0kztt6cD2WA04EhQV2ogS7n8HasH4zkxFhO7V/eXSTvb3uJ/lg3GiirJw0a8Gf3D
         3XLhJOxU/QaHf15D23gj9fWyL8uD13F6DlwS/aZMeugieo8wjdN+/UdEPUjSdtgGZPru
         rFmv8WL6yG2C7ltMJZEbDCWpi9TWGbzRiUJ/N9e9KgyLg8Ot5JQdKZkUU75eRbC4wBgc
         zfFvOS6fDdPvz3ZEPdeiH0l0D/IfXbIzDyfxkoLoD8NhoGGiS+F5cdp7hD21luXX2bES
         gtvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.215.169 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id s28-20020a05621412dc00b0066e0c9c71cdsi6422805qvv.297.2023.11.19.20.15.39
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 20:15:39 -0800 (PST)
Received-SPF: pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.215.169 as permitted sender) client-ip=209.85.215.169;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-HU976ZLpNcWV8CERZYlqmw-1; Sun, 19 Nov 2023 23:15:38 -0500
X-MC-Unique: HU976ZLpNcWV8CERZYlqmw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 544DF185A782
	for <linux-cachefs@gapps.redhat.com>; Mon, 20 Nov 2023 04:15:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 51628492BFC; Mon, 20 Nov 2023 04:15:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A0E9492BFA
	for <linux-cachefs@redhat.com>; Mon, 20 Nov 2023 04:15:38 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com [205.139.110.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A75338062AC
	for <linux-cachefs@redhat.com>; Mon, 20 Nov 2023 04:15:38 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-M3g2CE6tPaq1zA1qhtQcKg-1; Sun, 19 Nov 2023 23:15:36 -0500
X-MC-Unique: M3g2CE6tPaq1zA1qhtQcKg-1
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5bd6ac9833fso2096649a12.0
        for <linux-cachefs@redhat.com>; Sun, 19 Nov 2023 20:15:35 -0800 (PST)
X-Received: by 2002:a05:6a20:438d:b0:187:b4f2:b025 with SMTP id i13-20020a056a20438d00b00187b4f2b025mr5073423pzl.27.1700453734859;
        Sun, 19 Nov 2023 20:15:34 -0800 (PST)
Received: from C02G705SMD6V.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001cc4e477861sm5065266plw.212.2023.11.19.20.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 20:15:34 -0800 (PST)
From: "'Jia Zhu' via linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Cc: linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jefflexu@linux.alibaba.com,
	hsiangkao@linux.alibaba.com,
	Jia Zhu <zhujia.zj@bytedance.com>,
	Xin Yin <yinxin.x@bytedance.com>
Subject: [PATCH V6 RESEND 4/5] cachefiles: narrow the scope of triggering EPOLLIN events in ondemand mode
Date: Mon, 20 Nov 2023 12:14:21 +0800
Message-Id: <20231120041422.75170-5-zhujia.zj@bytedance.com>
In-Reply-To: <20231120041422.75170-1-zhujia.zj@bytedance.com>
References: <20231120041422.75170-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: zhujia.zj@bytedance.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of zhujia.zj@bytedance.com designates 209.85.215.169 as permitted
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

Don't trigger EPOLLIN when there are only reopening read requests in
xarray.

Suggested-by: Xin Yin <yinxin.x@bytedance.com>
Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/daemon.c   | 14 ++++++++++++--
 fs/cachefiles/internal.h | 12 ++++++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index aa4efcabb5e3..70caa1946207 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -355,14 +355,24 @@ static __poll_t cachefiles_daemon_poll(struct file *file,
 					   struct poll_table_struct *poll)
 {
 	struct cachefiles_cache *cache = file->private_data;
+	XA_STATE(xas, &cache->reqs, 0);
+	struct cachefiles_req *req;
 	__poll_t mask;
 
 	poll_wait(file, &cache->daemon_pollwq, poll);
 	mask = 0;
 
 	if (cachefiles_in_ondemand_mode(cache)) {
-		if (!xa_empty(&cache->reqs))
-			mask |= EPOLLIN;
+		if (!xa_empty(&cache->reqs)) {
+			rcu_read_lock();
+			xas_for_each_marked(&xas, req, ULONG_MAX, CACHEFILES_REQ_NEW) {
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
index b9a90f1a0c01..26e5f8f123ef 100644
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
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

