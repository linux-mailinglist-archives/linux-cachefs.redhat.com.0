Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CCB4ED8E6
	for <lists+linux-cachefs@lfdr.de>; Thu, 31 Mar 2022 13:58:45 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-ISCzuM6_Pgy2nF3KjFLHAA-1; Thu, 31 Mar 2022 07:58:42 -0400
X-MC-Unique: ISCzuM6_Pgy2nF3KjFLHAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89D5289CCA3;
	Thu, 31 Mar 2022 11:58:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14856C4C7CB;
	Thu, 31 Mar 2022 11:58:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5EBFC1947BBD;
	Thu, 31 Mar 2022 11:58:34 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EA11819451F3 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 31 Mar 2022 11:58:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B2719C27EAE; Thu, 31 Mar 2022 11:58:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC8EBC27EA5
 for <linux-cachefs@redhat.com>; Thu, 31 Mar 2022 11:58:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C96D718E53B3
 for <linux-cachefs@redhat.com>; Thu, 31 Mar 2022 11:58:31 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-s1D1iCtkMGugvSZwXWxoRA-1; Thu, 31 Mar 2022 07:58:16 -0400
X-MC-Unique: s1D1iCtkMGugvSZwXWxoRA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R981e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V8imrsv_1648727888
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V8imrsv_1648727888) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 31 Mar 2022 19:58:09 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Thu, 31 Mar 2022 19:57:44 +0800
Message-Id: <20220331115753.89431-11-jefflexu@linux.alibaba.com>
In-Reply-To: <20220331115753.89431-1-jefflexu@linux.alibaba.com>
References: <20220331115753.89431-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Linux-cachefs] [PATCH v7 10/19] erofs: add fscache context helper
 functions
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
Cc: gregkh@linuxfoundation.org, fannaihao@baidu.com, tao.peng@linux.alibaba.com,
 willy@infradead.org, linux-kernel@vger.kernel.org, tianzichen@kuaishou.com,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce a context structure for managing data blobs, and helper
functions for initializing and cleaning up this context structure.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/fscache.c  | 46 +++++++++++++++++++++++++++++++++++++++++++++
 fs/erofs/internal.h | 19 +++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 7a6d0239ebb1..67a3c4935245 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -5,6 +5,52 @@
 #include <linux/fscache.h>
 #include "internal.h"
 
+/*
+ * Create an fscache context for data blob.
+ * Return: 0 on success and allocated fscache context is assigned to @fscache,
+ *	   negative error number on failure.
+ */
+int erofs_fscache_register_cookie(struct super_block *sb,
+				  struct erofs_fscache **fscache, char *name)
+{
+	struct fscache_volume *volume = EROFS_SB(sb)->volume;
+	struct erofs_fscache *ctx;
+	struct fscache_cookie *cookie;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	cookie = fscache_acquire_cookie(volume, FSCACHE_ADV_WANT_CACHE_SIZE,
+					name, strlen(name), NULL, 0, 0);
+	if (!cookie) {
+		erofs_err(sb, "failed to get cookie for %s", name);
+		kfree(name);
+		return -EINVAL;
+	}
+
+	fscache_use_cookie(cookie, false);
+	ctx->cookie = cookie;
+
+	*fscache = ctx;
+	return 0;
+}
+
+void erofs_fscache_unregister_cookie(struct erofs_fscache **fscache)
+{
+	struct erofs_fscache *ctx = *fscache;
+
+	if (!ctx)
+		return;
+
+	fscache_unuse_cookie(ctx->cookie, NULL, NULL);
+	fscache_relinquish_cookie(ctx->cookie, false);
+	ctx->cookie = NULL;
+
+	kfree(ctx);
+	*fscache = NULL;
+}
+
 int erofs_fscache_register_fs(struct super_block *sb)
 {
 	struct erofs_sb_info *sbi = EROFS_SB(sb);
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 952a2f483f94..c6a3351a4d7d 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -97,6 +97,10 @@ struct erofs_sb_lz4_info {
 	u16 max_pclusterblks;
 };
 
+struct erofs_fscache {
+	struct fscache_cookie *cookie;
+};
+
 struct erofs_sb_info {
 	struct erofs_mount_opts opt;	/* options */
 #ifdef CONFIG_EROFS_FS_ZIP
@@ -626,9 +630,24 @@ static inline int z_erofs_load_lzma_config(struct super_block *sb,
 #ifdef CONFIG_EROFS_FS_ONDEMAND
 int erofs_fscache_register_fs(struct super_block *sb);
 void erofs_fscache_unregister_fs(struct super_block *sb);
+
+int erofs_fscache_register_cookie(struct super_block *sb,
+				  struct erofs_fscache **fscache, char *name);
+void erofs_fscache_unregister_cookie(struct erofs_fscache **fscache);
 #else
 static inline int erofs_fscache_register_fs(struct super_block *sb) { return 0; }
 static inline void erofs_fscache_unregister_fs(struct super_block *sb) {}
+
+static inline int erofs_fscache_register_cookie(struct super_block *sb,
+						struct erofs_fscache **fscache,
+						char *name)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void erofs_fscache_unregister_cookie(struct erofs_fscache **fscache)
+{
+}
 #endif
 
 #define EFSCORRUPTED    EUCLEAN         /* Filesystem is corrupted */
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

