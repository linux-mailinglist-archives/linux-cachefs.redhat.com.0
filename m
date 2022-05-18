Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC1C52B5B0
	for <lists+linux-cachefs@lfdr.de>; Wed, 18 May 2022 11:22:26 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-OT35z2AjMd2W9nCCwiZeDg-1; Wed, 18 May 2022 05:22:23 -0400
X-MC-Unique: OT35z2AjMd2W9nCCwiZeDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96F9E803D47;
	Wed, 18 May 2022 09:22:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C32981410DD9;
	Wed, 18 May 2022 09:22:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9A32519259F7;
	Wed, 18 May 2022 09:22:17 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 808AC194F4BB for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 18 May 2022 09:22:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6CCC140C1244; Wed, 18 May 2022 09:22:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67E2840C1438
 for <linux-cachefs@redhat.com>; Wed, 18 May 2022 09:22:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E74E185A7B2
 for <linux-cachefs@redhat.com>; Wed, 18 May 2022 09:22:16 +0000 (UTC)
Received: from u03.bc.larksuite.com (u03.bc.larksuite.com [130.44.212.35])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-9yj6JSpcMken5b2RdfOtEg-3; Wed, 18 May 2022 05:22:11 -0400
X-MC-Unique: 9yj6JSpcMken5b2RdfOtEg-3
X-Lms-Return-Path: <lba+26284bac1+d5671e+redhat.com+huyue2@coolpad.com>
To: <dhowells@redhat.com>, <linux-cachefs@redhat.com>
From: "Yue Hu" <huyue2@coolpad.com>
Date: Wed, 18 May 2022 17:22:09 +0800
Message-Id: <20220518092150.4883-1-huyue2@coolpad.com>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: [Linux-cachefs] [PATCH] fscache: Indicate fscache_cache_get_acquire
 directly in fscache_get_cache_maybe()
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
 linux-kernel@vger.kernel.org, zbestahu@163.com, zhangwen@coolpad.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, fscache_get_cache_maybe() has a where parameter passed only
by fscache_lookup_cache(). And it is always fscache_cache_get_acquire
due to not using the candidate cache. So, do not pass the where
indication in, we use fscache_cache_get_acquire directly instead.

Signed-off-by: Yue Hu <huyue2@coolpad.com>
---
 fs/fscache/cache.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/fs/fscache/cache.c b/fs/fscache/cache.c
index d645f8b302a2..70c953e82fa0 100644
--- a/fs/fscache/cache.c
+++ b/fs/fscache/cache.c
@@ -41,15 +41,15 @@ static struct fscache_cache *fscache_alloc_cache(const char *name)
 	return cache;
 }
 
-static bool fscache_get_cache_maybe(struct fscache_cache *cache,
-				    enum fscache_cache_trace where)
+static bool fscache_get_cache_maybe(struct fscache_cache *cache)
 {
 	bool success;
 	int ref;
 
 	success = __refcount_inc_not_zero(&cache->ref, &ref);
 	if (success)
-		trace_fscache_cache(cache->debug_id, ref + 1, where);
+		trace_fscache_cache(cache->debug_id, ref + 1,
+				    fscache_cache_get_acquire);
 	return success;
 }
 
@@ -65,17 +65,15 @@ struct fscache_cache *fscache_lookup_cache(const char *name, bool is_cache)
 
 	list_for_each_entry(cache, &fscache_caches, cache_link) {
 		if (cache->name && name && strcmp(cache->name, name) == 0 &&
-		    fscache_get_cache_maybe(cache, fscache_cache_get_acquire))
+		    fscache_get_cache_maybe(cache))
 			goto got_cache_r;
-		if (!cache->name && !name &&
-		    fscache_get_cache_maybe(cache, fscache_cache_get_acquire))
+		if (!cache->name && !name && fscache_get_cache_maybe(cache))
 			goto got_cache_r;
 	}
 
 	if (!name) {
 		list_for_each_entry(cache, &fscache_caches, cache_link) {
-			if (cache->name &&
-			    fscache_get_cache_maybe(cache, fscache_cache_get_acquire))
+			if (cache->name && fscache_get_cache_maybe(cache))
 				goto got_cache_r;
 		}
 	}
@@ -92,24 +90,21 @@ struct fscache_cache *fscache_lookup_cache(const char *name, bool is_cache)
 
 	list_for_each_entry(cache, &fscache_caches, cache_link) {
 		if (cache->name && name && strcmp(cache->name, name) == 0 &&
-		    fscache_get_cache_maybe(cache, fscache_cache_get_acquire))
+		    fscache_get_cache_maybe(cache))
 			goto got_cache_w;
 		if (!cache->name) {
 			unnamed = cache;
-			if (!name &&
-			    fscache_get_cache_maybe(cache, fscache_cache_get_acquire))
+			if (!name && fscache_get_cache_maybe(cache))
 				goto got_cache_w;
 		}
 	}
 
-	if (unnamed && is_cache &&
-	    fscache_get_cache_maybe(unnamed, fscache_cache_get_acquire))
+	if (unnamed && is_cache && fscache_get_cache_maybe(unnamed))
 		goto use_unnamed_cache;
 
 	if (!name) {
 		list_for_each_entry(cache, &fscache_caches, cache_link) {
-			if (cache->name &&
-			    fscache_get_cache_maybe(cache, fscache_cache_get_acquire))
+			if (cache->name && fscache_get_cache_maybe(cache))
 				goto got_cache_w;
 		}
 	}
-- 
2.17.1
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

