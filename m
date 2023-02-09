Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B18F468FE21
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Feb 2023 04:52:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675914759;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l2dzpdJ5/vkNDMv9oxI07o6NC41+R3y2onuw0h6zyP0=;
	b=FyWbe2wtSh/Os2MbBycgQgRtbY3hGGVZ7XhLxZE23qoTm+dcix/LouZFbshVpDoFUEAUL0
	PgPxSAjfMedlqjUVicZ3ys+RyqHg4yow6A8vznAhC+yv3ZzXHlaO0gzDJGZF4cXADFdCdX
	dVMGNXAhZSafL7nWeHIMsrpG3dDqEhY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-DyJNTsCEMAKNtzHD4BnInA-1; Wed, 08 Feb 2023 22:52:36 -0500
X-MC-Unique: DyJNTsCEMAKNtzHD4BnInA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA48B29AA39C;
	Thu,  9 Feb 2023 03:52:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9085A35454;
	Thu,  9 Feb 2023 03:52:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3449F1946594;
	Thu,  9 Feb 2023 03:52:33 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EDCFA1946589 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  9 Feb 2023 03:52:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D9AAA2026D76; Thu,  9 Feb 2023 03:52:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D17E32026D4B
 for <linux-cachefs@redhat.com>; Thu,  9 Feb 2023 03:52:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAC4B3811F3A
 for <linux-cachefs@redhat.com>; Thu,  9 Feb 2023 03:52:32 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-120-UKjyeo2EMdOERSJ0ocviaw-1; Wed, 08 Feb 2023 22:52:27 -0500
X-MC-Unique: UKjyeo2EMdOERSJ0ocviaw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R281e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0VbENU2w_1675914744
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VbENU2w_1675914744) by smtp.aliyun-inc.com;
 Thu, 09 Feb 2023 11:52:24 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Thu,  9 Feb 2023 11:52:24 +0800
Message-Id: <20230209035224.8317-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Linux-cachefs] [PATCH] fscache: offer the right volume key when
 printing
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a trivial fix as the first slot of volume->key[] actually stores
the length of the volume key.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/fscache/cookie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index bce2492186d0..ea13697a8556 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -46,7 +46,7 @@ void fscache_print_cookie(struct fscache_cookie *cookie, char prefix)
 	pr_err("%c-cookie V=%08x [%s]\n",
 	       prefix,
 	       cookie->volume->debug_id,
-	       cookie->volume->key);
+	       cookie->volume->key + 1);
 
 	k = (cookie->key_len <= sizeof(cookie->inline_key)) ?
 		cookie->inline_key : cookie->key;
-- 
2.19.1.6.gb485710b

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

