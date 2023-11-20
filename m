Return-Path: <linux-cachefs+bncBDKYBHUEQUPBB4F25OVAMGQESEB22RA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF447F0B49
	for <lists+linux-cachefs@lfdr.de>; Mon, 20 Nov 2023 05:15:45 +0100 (CET)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-41cdffe4d1csf48768351cf.0
        for <lists+linux-cachefs@lfdr.de>; Sun, 19 Nov 2023 20:15:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700453744; cv=pass;
        d=google.com; s=arc-20160816;
        b=TcmyDLAcj+chb/mG32QmWnxbbLchgphito2A1pwELbTHhe8O2PAEslg7zhRmulksPE
         CfWgbFvC6J78RIeFqDocpkXr+PVgRKf2SqwC8vzPCx0ZxbXvuvDelNGKlYvLT3RyW0SL
         B680qXERqObgatuBkwQkyz2fT31VijpVc3dCGnZEsPvTQMxbDrTtsW7rxYte3l7nK4kU
         3SpCfllT7sRQDW3FOfC7k2NGA7mRQpgUDIr4BArCVU5bVCClmSNX8iwXiStLu4tJwov4
         wgmRKH45Nq6mRSgtQwpH+2pU8JUiWeTxad/Q6cb0VG9Tkr6fgqvG3Aw1MZ5PJW1zdes1
         t4fQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:delivered-to;
        bh=gOAk12bRnnl5qD6WbCanppuf6Fy7yvIFEsknd74FUa0=;
        fh=gTY9Ttsg2h15YfzLiYhbw6/47QPOSTuIOvkuo3BASSw=;
        b=imoJzeXtkELkrkMoMM6LuYOc2bat70htYr1VEOoFACinIoSvkyv4KpfwTPojOtFehR
         ThCqRN5bVBmQ+SNqCrWGS357ep0Fga7L9d4vGJlZRkVT6p+pvxmStQI4SRP9nSpR9m/i
         OJXeCucmiMq2DvIrh2zIRrLIeoyq9Jmljv1sISxGyzSgQ8LYcjDQTmdiRbp26/UCzUyn
         PNljyCvfXS+deQc44ESV9PnedXFckuh0lHRk7C3zXQA3AE0ZwV7cqmBRzggqOkyUpZ5a
         bJZ2LRHZitXoW1Oze1A0RtepuwM7Dlmbc0+X5mHavlNiZeYuEnu2WYuR1vpvvYx1r3UH
         rUUg==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.214.172 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700453744; x=1701058544;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOAk12bRnnl5qD6WbCanppuf6Fy7yvIFEsknd74FUa0=;
        b=cScHp6XT/rcAQU5gPD9n1HfuTkNBOlhr90djRKc7PZauKpcnOTjDTa+gZpSwgWxfh/
         KL/TeT8n2YeIzma6hj5JbXjt21URw6UOnJTTHKWgYFsl/b5rcIaV+mNOUUBS6PvXuQo3
         9L43j6GH0JOmKghDRaUHYn6Dc6fxd2Mx8cWfcaxfXUUBu6yBdqNyXBWgWyYvkXH0rWIV
         yWw6UKFR1SfPGVqO8DiEKUFVovVVXW8sGuvUvsf+om0Qrfj84smdOUWmqQfEQpbEStkx
         hcQ1LNqt9B0Z9qFNikNJnMZQo4FLnBhzy6Gg+O0JawSXWnqszjEvlv5sKdF/1IfdF16w
         W0RQ==
X-Gm-Message-State: AOJu0YxYKicF8SbVkjuhEZOwDxype/mt0PhxYMyo7nZkDGkjIz487gzR
	CVw2pzFuT4z6m1yqB8rMfCciig==
X-Google-Smtp-Source: AGHT+IGhq+mZX9k7hhs1Sq9TOH7qFXQ2iq/9ZOpO/r0SmeLu64V+NxeeOUD+qxWZB3LNbf7GGGLvjg==
X-Received: by 2002:ac8:7c47:0:b0:41e:1ead:aa35 with SMTP id o7-20020ac87c47000000b0041e1eadaa35mr9248024qtv.31.1700453744697;
        Sun, 19 Nov 2023 20:15:44 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1350:b0:421:96d0:ef42 with SMTP id
 w16-20020a05622a135000b0042196d0ef42ls1774180qtk.2.-pod-prod-01-us; Sun, 19
 Nov 2023 20:15:44 -0800 (PST)
X-Received: by 2002:a05:622a:247:b0:418:c8e9:45e5 with SMTP id c7-20020a05622a024700b00418c8e945e5mr8981807qtx.24.1700453744171;
        Sun, 19 Nov 2023 20:15:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700453744; cv=none;
        d=google.com; s=arc-20160816;
        b=DtyqIJWivJWw0iGtawfBMblpZ17NvEwq99CQsWO1DjtvLGPXjKIZRXPYSx6zSvMkGb
         Lk431Ih51boyxDtNRR3MJSxUiFP8OqzCFc7WBVFbSUfPxe6NbvbfhxNReCgNF2/cOMii
         NoaXOvsA4SDI8XJcFgSrBwExvmqvAxRH12gQ27EYOYQ2SRcLBkOLuD8MMQPr4yqMbQt2
         raLZcE9vwU0zJQxLWMeecJcqiU+VWpakT2I7rvJIaI8rfqOR63BroVFLuRwD7B++3NcR
         WSIlY1nVYoNLc4sVqOhPVnAVD1EHCntbGFayMiTZutC/mtlzsLxUQtZaqUGVSBd6Un5Y
         EC/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=g1pCEGuj3QlPT+22tLUxveNeazv04i3uHRdJIvmcJDY=;
        fh=gTY9Ttsg2h15YfzLiYhbw6/47QPOSTuIOvkuo3BASSw=;
        b=wwQv6kPKCTsxXn0hQROjZkwkyzCDSAj0kjWuIF5ByX/VgGW77E2kGBazSryMD90qyM
         gK6+M3H7pEIGg8NULwORrF01N83CQAMXRhAoS8lhR1gvSfLT8GlaosFLr8NAYzVb0nO3
         aU1M/ScBjRBdMu/ShOuyMBSaOcvpiL7FKDPT/6UInkG8fgX/ea1MBStPZvVt0ILHNAnI
         7d0+tdEz7nUm6qxscDlIpTb+6ysq5bRe00+BcW78Q45QopRxoDQUqqEqoRFN9JOzQIC4
         +io9nFoirkMhX6WrkB4B0eT0N1KqzKUgwYs7vzQNdpXpGIjWiyuo3sWxOApxpQ5jAQJq
         qWTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.214.172 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id b7-20020ac85bc7000000b0041cbb5e5a86si6721509qtb.428.2023.11.19.20.15.44
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 20:15:44 -0800 (PST)
Received-SPF: pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.214.172 as permitted sender) client-ip=209.85.214.172;
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-399-UCUwJoL9OfOvcp8yIoN22Q-1; Sun,
 19 Nov 2023 23:15:42 -0500
X-MC-Unique: UCUwJoL9OfOvcp8yIoN22Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8633C38062A4
	for <linux-cachefs@gapps.redhat.com>; Mon, 20 Nov 2023 04:15:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 8273D1121308; Mon, 20 Nov 2023 04:15:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A71A1121306
	for <linux-cachefs@redhat.com>; Mon, 20 Nov 2023 04:15:42 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AFCA8007B3
	for <linux-cachefs@redhat.com>; Mon, 20 Nov 2023 04:15:42 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-YOX7UxX3NgSlk5Md3AeB6w-1; Sun, 19 Nov 2023 23:15:40 -0500
X-MC-Unique: YOX7UxX3NgSlk5Md3AeB6w-1
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cc3542e328so28477715ad.1
        for <linux-cachefs@redhat.com>; Sun, 19 Nov 2023 20:15:39 -0800 (PST)
X-Received: by 2002:a17:902:d2d2:b0:1ce:67fa:b398 with SMTP id n18-20020a170902d2d200b001ce67fab398mr4710323plc.16.1700453739021;
        Sun, 19 Nov 2023 20:15:39 -0800 (PST)
Received: from C02G705SMD6V.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001cc4e477861sm5065266plw.212.2023.11.19.20.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 20:15:38 -0800 (PST)
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
Subject: [PATCH V6 RESEND 5/5] cachefiles: add restore command to recover inflight ondemand read requests
Date: Mon, 20 Nov 2023 12:14:22 +0800
Message-Id: <20231120041422.75170-6-zhujia.zj@bytedance.com>
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

Previously, in ondemand read scenario, if the anonymous fd was closed by
user daemon, inflight and subsequent read requests would return EIO.
As long as the device connection is not released, user daemon can hold
and restore inflight requests by setting the request flag to
CACHEFILES_REQ_NEW.

Suggested-by: Gao Xiang <hsiangkao@linux.alibaba.com>
Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
Signed-off-by: Xin Yin <yinxin.x@bytedance.com>
Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/daemon.c   |  1 +
 fs/cachefiles/internal.h |  3 +++
 fs/cachefiles/ondemand.c | 23 +++++++++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 70caa1946207..3f24905f4066 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -77,6 +77,7 @@ static const struct cachefiles_daemon_cmd cachefiles_daemon_cmds[] = {
 	{ "tag",	cachefiles_daemon_tag		},
 #ifdef CONFIG_CACHEFILES_ONDEMAND
 	{ "copen",	cachefiles_ondemand_copen	},
+	{ "restore",	cachefiles_ondemand_restore	},
 #endif
 	{ "",		NULL				}
 };
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 26e5f8f123ef..4a87c9d714a9 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -303,6 +303,9 @@ extern ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 extern int cachefiles_ondemand_copen(struct cachefiles_cache *cache,
 				     char *args);
 
+extern int cachefiles_ondemand_restore(struct cachefiles_cache *cache,
+					char *args);
+
 extern int cachefiles_ondemand_init_object(struct cachefiles_object *object);
 extern void cachefiles_ondemand_clean_object(struct cachefiles_object *object);
 
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 8e130de952f7..b8fbbb1961bb 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -182,6 +182,29 @@ int cachefiles_ondemand_copen(struct cachefiles_cache *cache, char *args)
 	return ret;
 }
 
+int cachefiles_ondemand_restore(struct cachefiles_cache *cache, char *args)
+{
+	struct cachefiles_req *req;
+
+	XA_STATE(xas, &cache->reqs, 0);
+
+	if (!test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags))
+		return -EOPNOTSUPP;
+
+	/*
+	 * Reset the requests to CACHEFILES_REQ_NEW state, so that the
+	 * requests have been processed halfway before the crash of the
+	 * user daemon could be reprocessed after the recovery.
+	 */
+	xas_lock(&xas);
+	xas_for_each(&xas, req, ULONG_MAX)
+		xas_set_mark(&xas, CACHEFILES_REQ_NEW);
+	xas_unlock(&xas);
+
+	wake_up_all(&cache->daemon_pollwq);
+	return 0;
+}
+
 static int cachefiles_ondemand_get_fd(struct cachefiles_req *req)
 {
 	struct cachefiles_object *object;
-- 
2.20.1

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

