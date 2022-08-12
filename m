Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B309590DE6
	for <lists+linux-cachefs@lfdr.de>; Fri, 12 Aug 2022 11:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660295424;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SGD2/N2ckuvGHuV5Mq77oLH5knhexDbYaP9hgz5X5W8=;
	b=MU0tT0rTZ7XY/JQ4/0HsKkkdSxXtYoQtcYu5SeM3P93vD3dKT8ezWrELd+lYs8qiz1w9qw
	Bbwk/eDTmsonkNWOo+h7bqKdJK0Z8NEJOX7hWxUNrLcggpZF0VNNga7x1CC54Lcv/Q9BOp
	WH2xMKmJcIAk6ctxMXVjSPO9SPohHec=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-wxCG81dMM9GGJ7d_X3A5_w-1; Fri, 12 Aug 2022 05:10:21 -0400
X-MC-Unique: wxCG81dMM9GGJ7d_X3A5_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82B2E185A794;
	Fri, 12 Aug 2022 09:10:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC345C15BA8;
	Fri, 12 Aug 2022 09:10:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0C9081946A46;
	Fri, 12 Aug 2022 09:10:17 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A1BAC1946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 12 Aug 2022 09:10:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 81DAA492CA4; Fri, 12 Aug 2022 09:10:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E0F2492C3B
 for <linux-cachefs@redhat.com>; Fri, 12 Aug 2022 09:10:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5314729DD9BC
 for <linux-cachefs@redhat.com>; Fri, 12 Aug 2022 09:10:15 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-145-X-ULz8ujMKe83rwQsvw4Fw-1; Fri, 12 Aug 2022 05:10:10 -0400
X-MC-Unique: X-ULz8ujMKe83rwQsvw4Fw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R881e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VM17qn1_1660295406
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VM17qn1_1660295406) by smtp.aliyun-inc.com;
 Fri, 12 Aug 2022 17:10:07 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Fri, 12 Aug 2022 17:10:05 +0800
Message-Id: <20220812091005.65540-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH] cachefiles: support multiple daemons
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently CacheFiles can work in either the original mode caching for
network filesystems, or on-demand mode for container scenarios. Due to
the limit of singleton daemon, these two modes can not co-exist.

The current implementation can already work well in multiple daemon
mode. This patch only removes the explicit limitation, and thus enabling
the multiple daemon mdoe.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
PS:
Currently all filessytems using fscache (including network filesystems
and erofs) call fscache_acquire_volume() with @cache_name is NULL, and
thus they will be bound to the first registered cache. In this case, if
the first registered cache is in the original mode, mounting erofs will
fail since the boudn cache is not in on-demand mode.

This can be fixed by specifying the name of the cache to be bound when
calling fscache_acquire_volume(). Or adds a flag field to
fscache_acquire_volume(), specifying if the caller wants to bind a cache
in on-demand mode or not.

---
 fs/cachefiles/daemon.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index aa4efcabb5e3..a4f70516d250 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -44,8 +44,6 @@ static int cachefiles_daemon_tag(struct cachefiles_cache *, char *);
 static int cachefiles_daemon_bind(struct cachefiles_cache *, char *);
 static void cachefiles_daemon_unbind(struct cachefiles_cache *);
 
-static unsigned long cachefiles_open;
-
 const struct file_operations cachefiles_daemon_fops = {
 	.owner		= THIS_MODULE,
 	.open		= cachefiles_daemon_open,
@@ -95,16 +93,10 @@ static int cachefiles_daemon_open(struct inode *inode, struct file *file)
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	/* the cachefiles device may only be open once at a time */
-	if (xchg(&cachefiles_open, 1) == 1)
-		return -EBUSY;
-
 	/* allocate a cache record */
 	cache = kzalloc(sizeof(struct cachefiles_cache), GFP_KERNEL);
-	if (!cache) {
-		cachefiles_open = 0;
+	if (!cache)
 		return -ENOMEM;
-	}
 
 	mutex_init(&cache->daemon_mutex);
 	init_waitqueue_head(&cache->daemon_pollwq);
@@ -169,7 +161,6 @@ void cachefiles_put_unbind_pincount(struct cachefiles_cache *cache)
 {
 	if (refcount_dec_and_test(&cache->unbind_pincount)) {
 		cachefiles_daemon_unbind(cache);
-		cachefiles_open = 0;
 		kfree(cache);
 	}
 }
-- 
2.24.4

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

