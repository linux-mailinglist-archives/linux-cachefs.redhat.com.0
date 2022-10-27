Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1396960F297
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Oct 2022 10:37:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666859824;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2Qd144zJ2pl3tcdavs7+TbzAxyAJFFhTlxWeQXbvEJ4=;
	b=VZfWFxK/ckudVNVrga4ReNUjyiRoi+wDadfGK5Zaha2lWTxpXsSXzKhYaeKZOR0Qe/7CNh
	CNuoqv0ipAear0Tn+1px4riNHkCERpHjRmnX/OIFZscMGeXdA7NrlmWnatJUVWbC748Hm9
	sT9Qp6YfwTRFCCiMYz4BBKfO64H+qTg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263--jIGuNXzM_Wsw7vAbgyYNg-1; Thu, 27 Oct 2022 04:37:01 -0400
X-MC-Unique: -jIGuNXzM_Wsw7vAbgyYNg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6B0E86F142;
	Thu, 27 Oct 2022 08:36:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5A55492B1E;
	Thu, 27 Oct 2022 08:36:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 51F901946A40;
	Thu, 27 Oct 2022 08:36:45 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D572B19465A4 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 08:36:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C6EAB1401C30; Thu, 27 Oct 2022 08:36:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEAF61401C2C
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84E66827981
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:15 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-581-EiXw5cg8OdCv6BDV3uOYZQ-1; Thu, 27 Oct 2022 04:36:02 -0400
X-MC-Unique: EiXw5cg8OdCv6BDV3uOYZQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VTAkmCy_1666859758
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VTAkmCy_1666859758) by smtp.aliyun-inc.com;
 Thu, 27 Oct 2022 16:35:59 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, jlayton@kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org
Date: Thu, 27 Oct 2022 16:35:46 +0800
Message-Id: <20221027083547.46933-9-jefflexu@linux.alibaba.com>
In-Reply-To: <20221027083547.46933-1-jefflexu@linux.alibaba.com>
References: <20221027083547.46933-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH 8/9] fscache,
 netfs: move PageFsCache() family helpers to fscache.h
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
Cc: linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Later all structures transformed with "fscache_" prefix will be moved to
fscache.h from netfs.h, and then netfs.h will include fscache.h rather
than the other way around.  If that's the case, the PageFsCache() family
helpers also needs to be moved to fscache.h, since end_page_fscache() is
referenced inside fscache.

Besides, it's also quite reasonable to move these helpers to fscache.h
given their names.

This is a cleanup without logic change.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 include/linux/fscache.h | 90 +++++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h   | 89 ----------------------------------------
 2 files changed, 90 insertions(+), 89 deletions(-)

diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 9df2988be804..034d009c0de7 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -17,6 +17,7 @@
 #include <linux/fs.h>
 #include <linux/netfs.h>
 #include <linux/writeback.h>
+#include <linux/pagemap.h>
 
 #if defined(CONFIG_FSCACHE) || defined(CONFIG_FSCACHE_MODULE)
 #define __fscache_available (1)
@@ -695,4 +696,93 @@ void fscache_note_page_release(struct fscache_cookie *cookie)
 		clear_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
 }
 
+/*
+ * Overload PG_private_2 to give us PG_fscache - this is used to indicate that
+ * a page is currently backed by a local disk cache
+ */
+#define folio_test_fscache(folio)	folio_test_private_2(folio)
+#define PageFsCache(page)		PagePrivate2((page))
+#define SetPageFsCache(page)		SetPagePrivate2((page))
+#define ClearPageFsCache(page)		ClearPagePrivate2((page))
+#define TestSetPageFsCache(page)	TestSetPagePrivate2((page))
+#define TestClearPageFsCache(page)	TestClearPagePrivate2((page))
+
+/**
+ * folio_start_fscache - Start an fscache write on a folio.
+ * @folio: The folio.
+ *
+ * Call this function before writing a folio to a local cache.  Starting a
+ * second write before the first one finishes is not allowed.
+ */
+static inline void folio_start_fscache(struct folio *folio)
+{
+	VM_BUG_ON_FOLIO(folio_test_private_2(folio), folio);
+	folio_get(folio);
+	folio_set_private_2(folio);
+}
+
+/**
+ * folio_end_fscache - End an fscache write on a folio.
+ * @folio: The folio.
+ *
+ * Call this function after the folio has been written to the local cache.
+ * This will wake any sleepers waiting on this folio.
+ */
+static inline void folio_end_fscache(struct folio *folio)
+{
+	folio_end_private_2(folio);
+}
+
+/**
+ * folio_wait_fscache - Wait for an fscache write on this folio to end.
+ * @folio: The folio.
+ *
+ * If this folio is currently being written to a local cache, wait for
+ * the write to finish.  Another write may start after this one finishes,
+ * unless the caller holds the folio lock.
+ */
+static inline void folio_wait_fscache(struct folio *folio)
+{
+	folio_wait_private_2(folio);
+}
+
+/**
+ * folio_wait_fscache_killable - Wait for an fscache write on this folio to end.
+ * @folio: The folio.
+ *
+ * If this folio is currently being written to a local cache, wait
+ * for the write to finish or for a fatal signal to be received.
+ * Another write may start after this one finishes, unless the caller
+ * holds the folio lock.
+ *
+ * Return:
+ * - 0 if successful.
+ * - -EINTR if a fatal signal was encountered.
+ */
+static inline int folio_wait_fscache_killable(struct folio *folio)
+{
+	return folio_wait_private_2_killable(folio);
+}
+
+static inline void set_page_fscache(struct page *page)
+{
+	folio_start_fscache(page_folio(page));
+}
+
+static inline void end_page_fscache(struct page *page)
+{
+	folio_end_private_2(page_folio(page));
+}
+
+static inline void wait_on_page_fscache(struct page *page)
+{
+	folio_wait_private_2(page_folio(page));
+}
+
+static inline int wait_on_page_fscache_killable(struct page *page)
+{
+	return folio_wait_private_2_killable(page_folio(page));
+}
+
+
 #endif /* _LINUX_FSCACHE_H */
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 146a13e6a9d2..2ad4e1e88106 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -16,98 +16,9 @@
 
 #include <linux/workqueue.h>
 #include <linux/fs.h>
-#include <linux/pagemap.h>
 
 enum netfs_sreq_ref_trace;
 
-/*
- * Overload PG_private_2 to give us PG_fscache - this is used to indicate that
- * a page is currently backed by a local disk cache
- */
-#define folio_test_fscache(folio)	folio_test_private_2(folio)
-#define PageFsCache(page)		PagePrivate2((page))
-#define SetPageFsCache(page)		SetPagePrivate2((page))
-#define ClearPageFsCache(page)		ClearPagePrivate2((page))
-#define TestSetPageFsCache(page)	TestSetPagePrivate2((page))
-#define TestClearPageFsCache(page)	TestClearPagePrivate2((page))
-
-/**
- * folio_start_fscache - Start an fscache write on a folio.
- * @folio: The folio.
- *
- * Call this function before writing a folio to a local cache.  Starting a
- * second write before the first one finishes is not allowed.
- */
-static inline void folio_start_fscache(struct folio *folio)
-{
-	VM_BUG_ON_FOLIO(folio_test_private_2(folio), folio);
-	folio_get(folio);
-	folio_set_private_2(folio);
-}
-
-/**
- * folio_end_fscache - End an fscache write on a folio.
- * @folio: The folio.
- *
- * Call this function after the folio has been written to the local cache.
- * This will wake any sleepers waiting on this folio.
- */
-static inline void folio_end_fscache(struct folio *folio)
-{
-	folio_end_private_2(folio);
-}
-
-/**
- * folio_wait_fscache - Wait for an fscache write on this folio to end.
- * @folio: The folio.
- *
- * If this folio is currently being written to a local cache, wait for
- * the write to finish.  Another write may start after this one finishes,
- * unless the caller holds the folio lock.
- */
-static inline void folio_wait_fscache(struct folio *folio)
-{
-	folio_wait_private_2(folio);
-}
-
-/**
- * folio_wait_fscache_killable - Wait for an fscache write on this folio to end.
- * @folio: The folio.
- *
- * If this folio is currently being written to a local cache, wait
- * for the write to finish or for a fatal signal to be received.
- * Another write may start after this one finishes, unless the caller
- * holds the folio lock.
- *
- * Return:
- * - 0 if successful.
- * - -EINTR if a fatal signal was encountered.
- */
-static inline int folio_wait_fscache_killable(struct folio *folio)
-{
-	return folio_wait_private_2_killable(folio);
-}
-
-static inline void set_page_fscache(struct page *page)
-{
-	folio_start_fscache(page_folio(page));
-}
-
-static inline void end_page_fscache(struct page *page)
-{
-	folio_end_private_2(page_folio(page));
-}
-
-static inline void wait_on_page_fscache(struct page *page)
-{
-	folio_wait_private_2(page_folio(page));
-}
-
-static inline int wait_on_page_fscache_killable(struct page *page)
-{
-	return folio_wait_private_2_killable(page_folio(page));
-}
-
 enum fscache_io_source {
 	FSCACHE_FILL_WITH_ZEROES,
 	FSCACHE_DOWNLOAD_FROM_SERVER,
-- 
2.19.1.6.gb485710b

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

