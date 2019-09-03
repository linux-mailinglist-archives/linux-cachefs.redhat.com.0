Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E6331A81E9
	for <lists+linux-cachefs@lfdr.de>; Wed,  4 Sep 2019 14:11:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7DC02300C72A;
	Wed,  4 Sep 2019 12:11:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60B4A1001284;
	Wed,  4 Sep 2019 12:11:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2FA3F180221D;
	Wed,  4 Sep 2019 12:11:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x831aSx1016578 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 2 Sep 2019 21:36:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BFAAB5D6D0; Tue,  3 Sep 2019 01:36:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A29355D6B7;
	Tue,  3 Sep 2019 01:36:26 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DE3B10A8152;
	Tue,  3 Sep 2019 01:36:24 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 1322E80E0CB914755622;
	Tue,  3 Sep 2019 09:36:22 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS409-HUB.china.huawei.com
	(10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Sep 2019
	09:36:13 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <dhowells@redhat.com>, <jrdr.linux@gmail.com>, <akpm@linux-foundation.org>,
	<linux-cachefs@redhat.com>
Date: Tue, 3 Sep 2019 09:42:56 +0800
Message-ID: <1567474977-114734-2-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1567474977-114734-1-git-send-email-zhengbin13@huawei.com>
References: <1567474977-114734-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.64]); Tue, 03 Sep 2019 01:36:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Tue, 03 Sep 2019 01:36:24 +0000 (UTC) for IP:'45.249.212.191'
	DOMAIN:'szxga05-in.huawei.com' HELO:'huawei.com'
	FROM:'zhengbin13@huawei.com' RCPT:''
X-RedHat-Spam-Score: -2.302  (RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.191 szxga05-in.huawei.com
	45.249.212.191 szxga05-in.huawei.com <zhengbin13@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Wed, 04 Sep 2019 08:10:33 -0400
Cc: zhengbin13@huawei.com
Subject: [Linux-cachefs] [PATCH 1/2] fs/cachefiles/bind.c: remove always
	true comparison
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 04 Sep 2019 12:11:36 +0000 (UTC)

Fixes gcc warning:

fs/cachefiles/bind.c:39:30: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
fs/cachefiles/bind.c:44:30: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 fs/cachefiles/bind.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
index dfb14db..5c818ba 100644
--- a/fs/cachefiles/bind.c
+++ b/fs/cachefiles/bind.c
@@ -36,13 +36,11 @@ int cachefiles_daemon_bind(struct cachefiles_cache *cache, char *args)
 	       args);

 	/* start by checking things over */
-	ASSERT(cache->fstop_percent >= 0 &&
-	       cache->fstop_percent < cache->fcull_percent &&
+	ASSERT(cache->fstop_percent < cache->fcull_percent &&
 	       cache->fcull_percent < cache->frun_percent &&
 	       cache->frun_percent  < 100);

-	ASSERT(cache->bstop_percent >= 0 &&
-	       cache->bstop_percent < cache->bcull_percent &&
+	ASSERT(cache->bstop_percent < cache->bcull_percent &&
 	       cache->bcull_percent < cache->brun_percent &&
 	       cache->brun_percent  < 100);

--
2.7.4

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs
