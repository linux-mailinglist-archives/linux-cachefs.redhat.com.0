Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9605969EA
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Aug 2022 09:00:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660719644;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KngkyWfjuslFL5aU6mxBUHcLhhLUF3TKaWnqxBw5Dvo=;
	b=XHLo8B4W/3UhfbHzWd2FGvUlaYJSkM9sv8TDPGguiSmxbtUnJYuHlQisu3XtoaZmoilPty
	WRzcDtPMLMhcbT5O6cpgZDVOL7SI+nMhykxbMFP64JAXVVflsAnMMkxZqxC9mtKLEmG+x3
	Ofvf25FChqeFbj4vPlUrUA9pOsckOK4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-77PNZFRFPLOJ3IjaljGBwg-1; Wed, 17 Aug 2022 03:00:41 -0400
X-MC-Unique: 77PNZFRFPLOJ3IjaljGBwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA92A8039A1;
	Wed, 17 Aug 2022 07:00:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 163AA945D7;
	Wed, 17 Aug 2022 07:00:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 84F8B1946A78;
	Wed, 17 Aug 2022 07:00:38 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5805C1946A44 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 17 Aug 2022 07:00:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ECC052166B29; Wed, 17 Aug 2022 07:00:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E72C92166B26
 for <linux-cachefs@redhat.com>; Wed, 17 Aug 2022 07:00:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0DBA3802BA0
 for <linux-cachefs@redhat.com>; Wed, 17 Aug 2022 07:00:36 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-HjQ0fZ-tNpScMghD-wvNfQ-1; Wed, 17 Aug 2022 03:00:34 -0400
X-MC-Unique: HjQ0fZ-tNpScMghD-wvNfQ-1
Received: by mail-pj1-f44.google.com with SMTP id
 s5-20020a17090a13c500b001f4da9ffe5fso994677pjf.5
 for <linux-cachefs@redhat.com>; Wed, 17 Aug 2022 00:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Xbm/wyqskz5snHxq2g1yeZAZ3+AJBvaKvNU9/dTWKU8=;
 b=FANXAWbJa5n1g8v7/d9rrrtGVb+NK9hihEcvfu5VqC5FP/V39FaCUmbYS18L/hjIIU
 gf1Du1IgWoUJpHyGZmSptTGGdwEXVr29MDbq56wu4H5VQKXRX+JYpJChOh7szFY5xBus
 QQVzPn8Y4+fDzVO7fEMbK7PGYqNEdzWoxjkZ6DrU5NcMZGcH9MvjYCOasdPoqN7sXjzk
 4/AiGfA3USTrQtnSSgeAEv2bQeD2gtB7Ee51xaVJVact3vC8sXqXnIEcKCBBNxP2AkWV
 e8nPEi69NkuEHkQA7gvG4TCQtUga2QRFwSFBEePIkUKUK8osOLIHHbkMB7tklTp711ev
 37cg==
X-Gm-Message-State: ACgBeo3SKyzfDgZKbWlaGtGsIS1j0kgRl1swGd1zHfQ8S/MBtRxNbQNT
 v2UlYkUKAkrNzXQk0jgiMDT2DQ==
X-Google-Smtp-Source: AA6agR7MR1nDPn694Df7E6dSO8plWbt83o/ItWckji2Jh6DpRFkl2sbG0GzwTd39dbt+uXJ/h2LThQ==
X-Received: by 2002:a17:90a:ac0f:b0:1f5:555:c37 with SMTP id
 o15-20020a17090aac0f00b001f505550c37mr2347114pjq.37.1660719633747; 
 Wed, 17 Aug 2022 00:00:33 -0700 (PDT)
Received: from yinxin.bytedance.net ([139.177.225.239])
 by smtp.gmail.com with ESMTPSA id
 ja19-20020a170902efd300b0016d4f05eb95sm581779plb.272.2022.08.17.00.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 00:00:33 -0700 (PDT)
From: Xin Yin <yinxin.x@bytedance.com>
To: dhowells@redhat.com,
	xiang@kernel.org,
	jefflexu@linux.alibaba.com
Date: Wed, 17 Aug 2022 14:52:00 +0800
Message-Id: <20220817065200.11543-1-yinxin.x@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH] cachefiles: make on-demand request
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For now, enqueuing and dequeuing on-demand requests all start from
idx 0, this makes request distribution unfair. In the weighty
concurrent I/O scenario, the request stored in higher idx will starve.

Searching requests cyclically in cachefiles_ondemand_daemon_read,
makes distribution fairer.

Reported-by: Yongqing Li <liyongqing@bytedance.com>
Signed-off-by: Xin Yin <yinxin.x@bytedance.com>
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

