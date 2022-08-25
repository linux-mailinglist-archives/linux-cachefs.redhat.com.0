Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A57D5A072F
	for <lists+linux-cachefs@lfdr.de>; Thu, 25 Aug 2022 04:13:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661393581;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MCVydH8ow6p6eMJdigloHARGZ+gkTsnD9WMC/xqKh3U=;
	b=RqNXgk4nx4LbwqK3JsslyNdUaOMa/J6b7r0+1bSZzXxBCfEs6g3Pl03bjssj5XvDehxRpz
	4OCZyOpZUEnVqUNR1WHBFNQ4Pmn7A+QImmpfweiEUW/jdCcE64kWvi+AFBVW24VOWb9iwf
	zFTgrut8nynzaiByuGz2h/jbTHdGbG8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-ima94hVEOBWR6mhOAfTTZA-1; Wed, 24 Aug 2022 22:13:00 -0400
X-MC-Unique: ima94hVEOBWR6mhOAfTTZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF7F51857F02;
	Thu, 25 Aug 2022 02:12:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C55482166B29;
	Thu, 25 Aug 2022 02:12:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 75EA01946A5E;
	Thu, 25 Aug 2022 02:12:59 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 331F21946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 25 Aug 2022 02:09:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 24E1D409B3E6; Thu, 25 Aug 2022 02:09:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 204D7409B3E3
 for <linux-cachefs@redhat.com>; Thu, 25 Aug 2022 02:09:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D4A1293249B
 for <linux-cachefs@redhat.com>; Thu, 25 Aug 2022 02:09:57 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-580-svKtjZaOMaC6Jc0BDzAozg-1; Wed, 24 Aug 2022 22:09:55 -0400
X-MC-Unique: svKtjZaOMaC6Jc0BDzAozg-1
Received: by mail-pl1-f169.google.com with SMTP id y4so17280422plb.2
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 19:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=YpGUv3UA3bPfO8cA3tEzw2kofy/fEmqVCKzZz0F+/I8=;
 b=54rYoDQA87OzLho97qKo9DyPklpeCGFlR3+BvWPFllZFilf8pWqhZfMqOmC3uonQ8U
 VfzRL3ZXJ9JoCBMPgG558BMiWiR+t4DUVlvSpUWJPBcRwZwOhByBexDiA52yfoYs/5aD
 o7GAsZU33OkhzBITAsGRFp1XWunjVxnyF1BPn9bn6KDJJr92yhNXwLIKt0Ihzm04wLu4
 72j5sPxVYxE27es6pPeh4/0N4EVCBy8j8Zq/d8tyASNiS4xBrtgyWZCuefZU/uasSFc7
 Jv9I+qse/2Dj7v/9vi8Xtp+mnAwNyV19fMfECIjff/TAw8sBfapLR6PmZ1nRmnwI4JcR
 8Vxw==
X-Gm-Message-State: ACgBeo2OqKFXyIpGJfk0PUL4gK3BUu2CUno6pIz+K1lGD1w3byr8x3Vi
 q0vMxjRCP/PgIu6vwMrLwRfm1A==
X-Google-Smtp-Source: AA6agR6IU1tJEU0pMOJ4yXJCZh4RrwqIfQlQ0TbaDyt8SHKTQ8S9hm/Ui0b0icofrmdW4LPBzWxOXg==
X-Received: by 2002:a17:90b:4ad1:b0:1fb:eba:9977 with SMTP id
 mh17-20020a17090b4ad100b001fb0eba9977mr2030245pjb.182.1661393394478; 
 Wed, 24 Aug 2022 19:09:54 -0700 (PDT)
Received: from yinxin.bytedance.net ([139.177.225.239])
 by smtp.gmail.com with ESMTPSA id
 x16-20020aa79570000000b0052e6d6f3cb7sm4116186pfq.189.2022.08.24.19.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 19:09:53 -0700 (PDT)
From: Xin Yin <yinxin.x@bytedance.com>
To: dhowells@redhat.com, hsiangkao@linux.alibaba.com,
 jefflexu@linux.alibaba.com
Date: Thu, 25 Aug 2022 10:09:45 +0800
Message-Id: <20220825020945.2293-1-yinxin.x@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Linux-cachefs] [PATCH v2] cachefiles: make on-demand request
 distribution fairer
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
Cc: linux-fsdevel@vger.kernel.org, zhujia.zj@bytedance.com,
 linux-cachefs@redhat.com, Yongqing Li <liyongqing@bytedance.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For now, enqueuing and dequeuing on-demand requests all start from
idx 0, this makes request distribution unfair. In the weighty
concurrent I/O scenario, the request stored in higher idx will starve.

Searching requests cyclically in cachefiles_ondemand_daemon_read,
makes distribution fairer.

Fixes: c8383054506c ("cachefiles: notify the user daemon when looking up cookie")
Reported-by: Yongqing Li <liyongqing@bytedance.com>
Signed-off-by: Xin Yin <yinxin.x@bytedance.com>
Reviewed-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
changes form v1:
add Reviewed-by for Jeffle and Gao
add Fixes line
---
 fs/cachefiles/internal.h |  1 +
 fs/cachefiles/ondemand.c | 12 +++++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 6cba2c6de2f9..2ad58c465208 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -111,6 +111,7 @@ struct cachefiles_cache {
 	char				*tag;		/* cache binding tag */
 	refcount_t			unbind_pincount;/* refcount to do daemon unbind */
 	struct xarray			reqs;		/* xarray of pending on-demand requests */
+	unsigned long			req_id_next;
 	struct xarray			ondemand_ids;	/* xarray for ondemand_id allocation */
 	u32				ondemand_id_next;
 };
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 1fee702d5529..247961d65369 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -238,14 +238,19 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 	unsigned long id = 0;
 	size_t n;
 	int ret = 0;
-	XA_STATE(xas, &cache->reqs, 0);
+	XA_STATE(xas, &cache->reqs, cache->req_id_next);
 
 	/*
-	 * Search for a request that has not ever been processed, to prevent
-	 * requests from being processed repeatedly.
+	 * Cyclically search for a request that has not ever been processed,
+	 * to prevent requests from being processed repeatedly, and make
+	 * request distribution fair.
 	 */
 	xa_lock(&cache->reqs);
 	req = xas_find_marked(&xas, UINT_MAX, CACHEFILES_REQ_NEW);
+	if (!req && cache->req_id_next > 0) {
+		xas_set(&xas, 0);
+		req = xas_find_marked(&xas, cache->req_id_next - 1, CACHEFILES_REQ_NEW);
+	}
 	if (!req) {
 		xa_unlock(&cache->reqs);
 		return 0;
@@ -260,6 +265,7 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 	}
 
 	xas_clear_mark(&xas, CACHEFILES_REQ_NEW);
+	cache->req_id_next = xas.xa_index + 1;
 	xa_unlock(&cache->reqs);
 
 	id = xas.xa_index;
-- 
2.25.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

