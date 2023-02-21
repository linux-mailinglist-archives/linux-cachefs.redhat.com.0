Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D64E69DDEE
	for <lists+linux-cachefs@lfdr.de>; Tue, 21 Feb 2023 11:33:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676975607;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ubaJ2s4tZx2BpC4ZqcvGLuIkgO4nRz+xobLJO1LdO9I=;
	b=JkjVMNbuyvyP5hTwsPLKmwtR5XSE9vMggzH4kZHcR2TCVF1OiJ0+AHhftJptWFxay5JGmf
	c8sLPYQL8YePB2ymDLsEpcYW0tgik788ZyTEN9JxYoospl8EYpHYrV2RCNUIMB6qFGvP8c
	uX8kaVuPnZWv2VzkT0LSUZMT1oNmaJc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-HZz566ZyNe2gY8Ks7wq3iw-1; Tue, 21 Feb 2023 05:33:23 -0500
X-MC-Unique: HZz566ZyNe2gY8Ks7wq3iw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 488473C025AC;
	Tue, 21 Feb 2023 10:33:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B538F492B00;
	Tue, 21 Feb 2023 10:33:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 772BE1946594;
	Tue, 21 Feb 2023 10:33:22 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 343BC1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 21 Feb 2023 10:33:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 25C91492B01; Tue, 21 Feb 2023 10:33:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E0B9492B00
 for <linux-cachefs@redhat.com>; Tue, 21 Feb 2023 10:33:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05CD13C025AC
 for <linux-cachefs@redhat.com>; Tue, 21 Feb 2023 10:33:21 +0000 (UTC)
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-5-gUmMZOzLNZ2GbaSkrqQ9rg-1; Tue, 21 Feb 2023 05:33:18 -0500
X-MC-Unique: gUmMZOzLNZ2GbaSkrqQ9rg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R321e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0VcC1Vwm_1676975594
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VcC1Vwm_1676975594) by smtp.aliyun-inc.com;
 Tue, 21 Feb 2023 18:33:15 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Tue, 21 Feb 2023 18:33:12 +0800
Message-Id: <20230221103313.120834-2-jefflexu@linux.alibaba.com>
In-Reply-To: <20230221103313.120834-1-jefflexu@linux.alibaba.com>
References: <20230221103313.120834-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Linux-cachefs] [PATCH 1/2] cachefiles: don't align the write IO in
 ondemand mode
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If the write IO requested by the user daemon is not aligned with the
block size of the backing filesystem, it's expected to fail directly
rather than submit the aligned write IO (with expanded file range
unmatching with the given iov_iter).

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/ondemand.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 0254ed39f68c..c017aca2a8a2 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -52,7 +52,8 @@ static ssize_t cachefiles_ondemand_fd_write_iter(struct kiocb *kiocb,
 		return -ENOBUFS;
 
 	cachefiles_begin_secure(cache, &saved_cred);
-	ret = __cachefiles_prepare_write(object, file, &pos, &len, true);
+	ret = cachefiles_has_space(cache, 0, len >> cache->bshift,
+				   cachefiles_has_space_for_write);
 	cachefiles_end_secure(cache, saved_cred);
 	if (ret < 0)
 		return ret;
-- 
2.19.1.6.gb485710b

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

