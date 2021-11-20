Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E87C45D7C8
	for <lists+linux-cachefs@lfdr.de>; Thu, 25 Nov 2021 10:57:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-mWrGgXhtMP2p4kx2fihdJg-1; Thu, 25 Nov 2021 04:57:50 -0500
X-MC-Unique: mWrGgXhtMP2p4kx2fihdJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1FA4760C4;
	Thu, 25 Nov 2021 09:57:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3E731007623;
	Thu, 25 Nov 2021 09:57:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C16A84A7C8;
	Thu, 25 Nov 2021 09:57:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AKIUJtY013347 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 20 Nov 2021 13:30:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BC91C51E2; Sat, 20 Nov 2021 18:30:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4BF351E1
	for <linux-cachefs@redhat.com>; Sat, 20 Nov 2021 18:30:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D68A480122B
	for <linux-cachefs@redhat.com>; Sat, 20 Nov 2021 18:30:16 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
	[80.12.242.130]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	us-mta-573-2Yt-BdpNPGSNrGmR__r_Ew-1; Sat, 20 Nov 2021 13:30:15 -0500
X-MC-Unique: 2Yt-BdpNPGSNrGmR__r_Ew-1
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
	id oV0dmDpwsozlioV0dmJ4wJ; Sat, 20 Nov 2021 19:22:43 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 20 Nov 2021 19:22:43 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: dhowells@redhat.com
Date: Sat, 20 Nov 2021 19:22:42 +0100
Message-Id: <92718c86a836f0d730a96b11cfc94b85edf32c19.1637432444.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <495d769a2b90ebad5f21bdfb4df3800cb5d9a627.1637432444.git.christophe.jaillet@wanadoo.fr>
References: <495d769a2b90ebad5f21bdfb4df3800cb5d9a627.1637432444.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 25 Nov 2021 04:57:42 -0500
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-cachefs@redhat.com, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH 2/2] CacheFiles: Slightly optimize
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

There is no need to clear the 'struct kstatfs' buffer when calling
'vfs_statfs()', it is already be done in 'statfs_by_dentry()'. So a few
cycles can be saved here.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/cachefiles/daemon.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index be8f2ec453b6..45bfc5643615 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -688,8 +688,6 @@ int cachefiles_has_space(struct cachefiles_cache *cache,
 	//       fnr, bnr);
 
 	/* find out how many pages of blockdev are available */
-	memset(&stats, 0, sizeof(stats));
-
 	ret = vfs_statfs(&path, &stats);
 	if (ret < 0) {
 		if (ret == -EIO)
-- 
2.30.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

