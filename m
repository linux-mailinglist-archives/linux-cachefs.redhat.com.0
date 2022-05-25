Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA4D533559
	for <lists+linux-cachefs@lfdr.de>; Wed, 25 May 2022 04:32:48 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-hhQVpYeUNu-dwErSP59SEg-1; Tue, 24 May 2022 22:32:46 -0400
X-MC-Unique: hhQVpYeUNu-dwErSP59SEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41A3C811E76;
	Wed, 25 May 2022 02:32:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42B641410DD5;
	Wed, 25 May 2022 02:32:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CC1861932126;
	Wed, 25 May 2022 02:32:43 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3B49D19466DF for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 25 May 2022 02:32:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 15BF52166B2A; Wed, 25 May 2022 02:32:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 116102166B29
 for <linux-cachefs@redhat.com>; Wed, 25 May 2022 02:32:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9BED101A54E
 for <linux-cachefs@redhat.com>; Wed, 25 May 2022 02:32:27 +0000 (UTC)
Received: from u03.bc.larksuite.com (u03.bc.larksuite.com [130.44.212.35])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-5N200pKiPzyZVox8-kWQ4w-3; Tue, 24 May 2022 22:32:23 -0400
X-MC-Unique: 5N200pKiPzyZVox8-kWQ4w-3
X-Lms-Return-Path: <lba+2628d9536+6ec844+redhat.com+huyue2@coolpad.com>
From: "Yue Hu" <huyue2@coolpad.com>
Message-Id: <20220525023212.32642-1-huyue2@coolpad.com>
Date: Wed, 25 May 2022 10:32:22 +0800
Mime-Version: 1.0
To: <dhowells@redhat.com>, <linux-cachefs@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: [Linux-cachefs] [PATCH] fscache: Fix if condition in
 fscache_wait_on_volume_collision()
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
Cc: zhangwen@coolpad.com, huyue2@coolpad.com, linux-kernel@vger.kernel.org,
 zbestahu@gmail.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

After waiting for the volume to complete the acquisition with timeout,
the if condition under which potential volume collision occurs should be
acquire the volume is still pending rather than not pending so that we
will continue to wait until the pending flag is cleared. Also, use the
existing test pending wrapper directly instead of test_bit().

Signed-off-by: Yue Hu <huyue2@coolpad.com>
---
 fs/fscache/volume.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/fscache/volume.c b/fs/fscache/volume.c
index 71d3a6d6d72c..f2009cc22002 100644
--- a/fs/fscache/volume.c
+++ b/fs/fscache/volume.c
@@ -143,7 +143,7 @@ static void fscache_wait_on_volume_collision(struct fscache_volume *candidate,
 {
 	wait_var_event_timeout(&candidate->flags,
 			       !fscache_is_acquire_pending(candidate), 20 * HZ);
-	if (!fscache_is_acquire_pending(candidate)) {
+	if (fscache_is_acquire_pending(candidate)) {
 		pr_notice("Potential volume collision new=%08x old=%08x",
 			  candidate->debug_id, collidee_debug_id);
 		fscache_stat(&fscache_n_volumes_collision);
@@ -182,7 +182,7 @@ static bool fscache_hash_volume(struct fscache_volume *candidate)
 	hlist_bl_add_head(&candidate->hash_link, h);
 	hlist_bl_unlock(h);
 
-	if (test_bit(FSCACHE_VOLUME_ACQUIRE_PENDING, &candidate->flags))
+	if (fscache_is_acquire_pending(candidate))
 		fscache_wait_on_volume_collision(candidate, collidee_debug_id);
 	return true;
 
-- 
2.17.1
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

