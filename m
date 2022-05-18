Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9766C52B299
	for <lists+linux-cachefs@lfdr.de>; Wed, 18 May 2022 08:48:23 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-HSboZcDxMeuC9we9fmOUUw-1; Wed, 18 May 2022 02:48:19 -0400
X-MC-Unique: HSboZcDxMeuC9we9fmOUUw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDF033C16186;
	Wed, 18 May 2022 06:48:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9D08492C3B;
	Wed, 18 May 2022 06:48:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8DDE61947B90;
	Wed, 18 May 2022 06:48:16 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E31B91947B84 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 18 May 2022 06:48:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 789D940336C; Wed, 18 May 2022 06:48:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73CB8403373
 for <linux-cachefs@redhat.com>; Wed, 18 May 2022 06:48:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DB99185A7A4
 for <linux-cachefs@redhat.com>; Wed, 18 May 2022 06:48:14 +0000 (UTC)
Received: from u03.bc.larksuite.com (u03.bc.larksuite.com [130.44.212.37])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-PwRSydq1MGm8r9pVIfbrbQ-3; Wed, 18 May 2022 02:48:10 -0400
X-MC-Unique: PwRSydq1MGm8r9pVIfbrbQ-3
Message-Id: <20220518064759.26684-1-huyue2@coolpad.com>
From: "Yue Hu" <huyue2@coolpad.com>
Date: Wed, 18 May 2022 14:48:07 +0800
To: <dhowells@redhat.com>, <linux-cachefs@redhat.com>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+2628496a7+ab8e0d+redhat.com+huyue2@coolpad.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: [Linux-cachefs] [PATCH] fscache: Remove the lock field in struct
 fscache_volume
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
Cc: zbestahu@gmail.com, Yue Hu <huyue2@coolpad.com>,
 linux-kernel@vger.kernel.org, zhangwen@coolpad.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

No one uses this lock when manipulating volume cookie.

Signed-off-by: Yue Hu <huyue2@coolpad.com>
---
 fs/fscache/volume.c     | 1 -
 include/linux/fscache.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/fs/fscache/volume.c b/fs/fscache/volume.c
index f2aa7dbad766..71d3a6d6d72c 100644
--- a/fs/fscache/volume.c
+++ b/fs/fscache/volume.c
@@ -224,7 +224,6 @@ static struct fscache_volume *fscache_alloc_volume(const char *volume_key,
 	INIT_LIST_HEAD(&volume->proc_link);
 	INIT_WORK(&volume->work, fscache_create_volume_work);
 	refcount_set(&volume->ref, 1);
-	spin_lock_init(&volume->lock);
 
 	/* Stick the length on the front of the key and pad it out to make
 	 * hashing easier.
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 8045497c6515..2bd63041e989 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -81,7 +81,6 @@ struct fscache_volume {
 	struct work_struct		work;
 	struct fscache_cache		*cache;		/* The cache in which this resides */
 	void				*cache_priv;	/* Cache private data */
-	spinlock_t			lock;
 	unsigned long			flags;
 #define FSCACHE_VOLUME_RELINQUISHED	0	/* Volume is being cleaned up */
 #define FSCACHE_VOLUME_INVALIDATE	1	/* Volume was invalidated */
-- 
2.17.1
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

