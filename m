Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.153.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE3545D7C7
	for <lists+linux-cachefs@lfdr.de>; Thu, 25 Nov 2021 10:57:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-4-7EslMNT9M12MBgqqHmduBg-1; Thu, 25 Nov 2021 04:57:50 -0500
X-MC-Unique: 7EslMNT9M12MBgqqHmduBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B655839A43;
	Thu, 25 Nov 2021 09:57:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E1DB1007623;
	Thu, 25 Nov 2021 09:57:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54CF54BB7B;
	Thu, 25 Nov 2021 09:57:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AKIUBHD013338 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 20 Nov 2021 13:30:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9A5EF218013E; Sat, 20 Nov 2021 18:30:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94278218013A
	for <linux-cachefs@redhat.com>; Sat, 20 Nov 2021 18:30:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A45BC185A7B4
	for <linux-cachefs@redhat.com>; Sat, 20 Nov 2021 18:30:08 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
	[80.12.242.130]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	us-mta-283-7TEbe-lHOgCKRhsU8pTUug-1; Sat, 20 Nov 2021 13:30:07 -0500
X-MC-Unique: 7TEbe-lHOgCKRhsU8pTUug-1
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
	id oV0UmDpuNozlioV0UmJ4vf; Sat, 20 Nov 2021 19:22:34 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 20 Nov 2021 19:22:34 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: dhowells@redhat.com
Date: Sat, 20 Nov 2021 19:22:32 +0100
Message-Id: <495d769a2b90ebad5f21bdfb4df3800cb5d9a627.1637432444.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 25 Nov 2021 04:57:42 -0500
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-cachefs@redhat.com, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH 1/2] CacheFiles: Slightly simplify
	'cachefiles_has_space()'
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The "CACHEFILES_CULLING" bit is tested twice. Once with 'test_bit()' and
once with 'test_and_clear_bit()'.
Remove the first test.

While at it, bring back a ')' at the end of a line to be more compliant
with Linux coding style.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
If testing the bit first was a kind of optimization, a few words shoul
explained it.
---
 fs/cachefiles/daemon.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 752c1e43416f..be8f2ec453b6 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -725,11 +725,9 @@ int cachefiles_has_space(struct cachefiles_cache *cache,
 	    stats.f_bavail < cache->bcull)
 		goto begin_cull;
 
-	if (test_bit(CACHEFILES_CULLING, &cache->flags) &&
-	    stats.f_ffree >= cache->frun &&
+	if (stats.f_ffree >= cache->frun &&
 	    stats.f_bavail >= cache->brun &&
-	    test_and_clear_bit(CACHEFILES_CULLING, &cache->flags)
-	    ) {
+	    test_and_clear_bit(CACHEFILES_CULLING, &cache->flags)) {
 		_debug("cease culling");
 		cachefiles_state_changed(cache);
 	}
-- 
2.30.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

