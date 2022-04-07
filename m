Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA154F7D78
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 13:03:08 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-zAEpPN48Phm9i1BY1gEDhg-1; Thu, 07 Apr 2022 07:03:04 -0400
X-MC-Unique: zAEpPN48Phm9i1BY1gEDhg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A32AF80159B;
	Thu,  7 Apr 2022 11:02:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 254A6145B97D;
	Thu,  7 Apr 2022 11:02:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1550E1940340;
	Thu,  7 Apr 2022 11:02:47 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7C4BF1949763 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 11:02:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B5F7DC28115; Thu,  7 Apr 2022 11:02:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1AAFC27E9B
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 11:02:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F4CC802809
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 11:02:44 +0000 (UTC)
Received: from u04.bc.larksuite.com (u04.bc.larksuite.com [130.44.212.46])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-hThKWKOXN7-k_hF3hEcmbA-3; Thu, 07 Apr 2022 07:02:41 -0400
X-MC-Unique: hThKWKOXN7-k_hF3hEcmbA-3
Date: Thu, 07 Apr 2022 19:02:39 +0800
Message-Id: <20220407110204.15819-1-huyue2@coolpad.com>
Mime-Version: 1.0
To: <dhowells@redhat.com>, <corbet@lwn.net>
From: "Yue Hu" <huyue2@coolpad.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: [Linux-cachefs] [PATCH] docs: filesystems: caching/backend-api.rst:
 fix an object withdrawn API
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There's no fscache_are_objects_withdrawn() helper at all to test if
cookie withdrawal is completed currently. The cache backend is using
fscache_wait_for_objects() to wait all objects to be withdrawn.

Signed-off-by: Yue Hu <huyue2@coolpad.com>
---
 Documentation/filesystems/caching/backend-api.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/caching/backend-api.rst b/Documentation/filesystems/caching/backend-api.rst
index d7b2df5fd607..d7507becf674 100644
--- a/Documentation/filesystems/caching/backend-api.rst
+++ b/Documentation/filesystems/caching/backend-api.rst
@@ -110,9 +110,9 @@ to withdraw them, calling::
 
 on the cookie that each object belongs to.  This schedules the specified cookie
 for withdrawal.  This gets offloaded to a workqueue.  The cache backend can
-test for completion by calling::
+wait for completion by calling::
 
-	bool fscache_are_objects_withdrawn(struct fscache_cookie *cache);
+	void fscache_wait_for_objects(struct fscache_cache *cache);
 
 Once all the cookies are withdrawn, a cache backend can withdraw all the
 volumes, calling::
-- 
2.17.1
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

