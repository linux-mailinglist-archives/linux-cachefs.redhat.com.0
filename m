Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E16E4F7CAD
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 12:25:26 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-euCSmZMcNmmRQoMpynpNbw-1; Thu, 07 Apr 2022 06:25:22 -0400
X-MC-Unique: euCSmZMcNmmRQoMpynpNbw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4722811E78;
	Thu,  7 Apr 2022 10:25:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F1FEC15D75;
	Thu,  7 Apr 2022 10:25:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BB32E1940340;
	Thu,  7 Apr 2022 10:25:19 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9A38C1947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 10:25:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 88F03407E241; Thu,  7 Apr 2022 10:25:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84F24407E1C3
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 10:25:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D8361801386
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 10:25:18 +0000 (UTC)
Received: from u03.bc.larksuite.com (u03.bc.larksuite.com [130.44.212.36])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-czrJSWmMOJOWzbrcsI202g-3; Thu, 07 Apr 2022 06:25:17 -0400
X-MC-Unique: czrJSWmMOJOWzbrcsI202g-3
Message-Id: <20220407102445.15081-1-huyue2@coolpad.com>
Mime-Version: 1.0
To: <dhowells@redhat.com>, <corbet@lwn.net>
From: "Yue Hu" <huyue2@coolpad.com>
Date: Thu, 07 Apr 2022 18:25:05 +0800
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: [Linux-cachefs] [PATCH] docs: filesystems: caching/backend-api.txt:
 correct two relinquish APIs use
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
Cc: zbestahu@gmail.com, Yue Hu <huyue2@coolpad.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, zhangwen@coolpad.com, linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

1. cache backend is using fscache_relinquish_cache() rather than
   fscache_relinquish_cookie() to reset the cache cookie.

2. No fscache_cache_relinquish() helper currently, it should be
   fscache_relinquish_cache().

Signed-off-by: Yue Hu <huyue2@coolpad.com>
---
 Documentation/filesystems/caching/backend-api.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/caching/backend-api.rst b/Documentation/filesystems/caching/backend-api.rst
index be793c49a772..d7b2df5fd607 100644
--- a/Documentation/filesystems/caching/backend-api.rst
+++ b/Documentation/filesystems/caching/backend-api.rst
@@ -73,7 +73,7 @@ busy.
 If successful, the cache backend can then start setting up the cache.  In the
 event that the initialisation fails, the cache backend should call::
 
-	void fscache_relinquish_cookie(struct fscache_cache *cache);
+	void fscache_relinquish_cache(struct fscache_cache *cache);
 
 to reset and discard the cookie.
 
@@ -125,7 +125,7 @@ outstanding accesses on the volume to complete before returning.
 When the the cache is completely withdrawn, fscache should be notified by
 calling::
 
-	void fscache_cache_relinquish(struct fscache_cache *cache);
+	void fscache_relinquish_cache(struct fscache_cache *cache);
 
 to clear fields in the cookie and discard the caller's ref on it.
 
-- 
2.17.1
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

