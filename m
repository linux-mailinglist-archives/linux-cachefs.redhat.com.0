Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6486F4F1013
	for <lists+linux-cachefs@lfdr.de>; Mon,  4 Apr 2022 09:40:46 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-CUzoIF9SNUWtM5FYDtFu9Q-1; Mon, 04 Apr 2022 03:40:42 -0400
X-MC-Unique: CUzoIF9SNUWtM5FYDtFu9Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFE928002BF;
	Mon,  4 Apr 2022 07:40:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0434643E3BA;
	Mon,  4 Apr 2022 07:40:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C1CAE1940364;
	Mon,  4 Apr 2022 07:40:40 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EB9591947BBB for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 31 Mar 2022 12:02:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D0335C08090; Thu, 31 Mar 2022 12:02:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC465C08087
 for <linux-cachefs@redhat.com>; Thu, 31 Mar 2022 12:02:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4005185A7BA
 for <linux-cachefs@redhat.com>; Thu, 31 Mar 2022 12:02:26 +0000 (UTC)
Received: from u04.bc.larksuite.com (u04.bc.larksuite.com [130.44.212.43])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-77t7YoyiOWKIdl1H7fi2Rw-3; Thu, 31 Mar 2022 08:02:23 -0400
X-MC-Unique: 77t7YoyiOWKIdl1H7fi2Rw-3
To: <dhowells@redhat.com>, <linux-cachefs@redhat.com>
Date: Thu, 31 Mar 2022 19:57:18 +0800
Message-Id: <20220331115452.6661-1-huyue2@coolpad.com>
Mime-Version: 1.0
From: "Yue Hu" <huyue2@coolpad.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mailman-Approved-At: Mon, 04 Apr 2022 07:40:39 +0000
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: [Linux-cachefs] [PATCH] fscache: remove FSCACHE_OLD_API Kconfig
 option
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
Cc: Yue Hu <huyue2@coolpad.com>, zhangwen@coolpad.com,
 linux-kernel@vger.kernel.org, zbestahu@163.com, zbestahu@gmail.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 01491a756578 ("fscache, cachefiles: Disable configuration") added
the FSCACHE_OLD_API configuration when rewritten. Now, it's not used any
more. Remove it.

Signed-off-by: Yue Hu <huyue2@coolpad.com>
---
 fs/fscache/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/fscache/Kconfig b/fs/fscache/Kconfig
index 76316c4a3fb7..b313a978ae0a 100644
--- a/fs/fscache/Kconfig
+++ b/fs/fscache/Kconfig
@@ -38,6 +38,3 @@ config FSCACHE_DEBUG
 	  enabled by setting bits in /sys/modules/fscache/parameter/debug.
 
 	  See Documentation/filesystems/caching/fscache.rst for more information.
-
-config FSCACHE_OLD_API
-	bool
-- 
2.17.1
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

