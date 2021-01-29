Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CEA8B3089A5
	for <lists+linux-cachefs@lfdr.de>; Fri, 29 Jan 2021 16:02:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-9oRbbJiAPpSQ8SKo33-ZNg-1; Fri, 29 Jan 2021 10:02:49 -0500
X-MC-Unique: 9oRbbJiAPpSQ8SKo33-ZNg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14B861842143;
	Fri, 29 Jan 2021 15:02:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 474CB60CC5;
	Fri, 29 Jan 2021 15:02:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C1AD5003B;
	Fri, 29 Jan 2021 15:02:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10TF2dW1000628 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 29 Jan 2021 10:02:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1A6EB2166B27; Fri, 29 Jan 2021 15:02:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 151C62166B2A
	for <linux-cachefs@redhat.com>; Fri, 29 Jan 2021 15:02:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC749101A531
	for <linux-cachefs@redhat.com>; Fri, 29 Jan 2021 15:02:36 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-528-hwcxiu7lNauahwLX_eQzQQ-1; Fri, 29 Jan 2021 10:02:29 -0500
X-MC-Unique: hwcxiu7lNauahwLX_eQzQQ-1
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
	by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <colin.king@canonical.com>)
	id 1l5VI4-0005fG-Cv; Fri, 29 Jan 2021 15:02:28 +0000
From: Colin King <colin.king@canonical.com>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Fri, 29 Jan 2021 15:02:28 +0000
Message-Id: <20210129150228.384188-1-colin.king@canonical.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH][next] fs: cachefiles: remove redundant
	initialization of variable ret
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
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/cachefiles/rdwr2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cachefiles/rdwr2.c b/fs/cachefiles/rdwr2.c
index 4cea5a2a2d6e..c7000d01b47a 100644
--- a/fs/cachefiles/rdwr2.c
+++ b/fs/cachefiles/rdwr2.c
@@ -193,7 +193,7 @@ static int cachefiles_write(struct netfs_cache_resources *cres,
 	struct inode *inode;
 	struct file *file = cres->cache_priv2;
 	unsigned int old_nofs;
-	ssize_t ret = -ENOBUFS;
+	ssize_t ret;
 	size_t len = iov_iter_count(iter);
 
 	_enter("%pD,%li,%llx,%zx/%llx",
-- 
2.29.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

