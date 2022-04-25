Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AE950DFEE
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Apr 2022 14:22:21 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-ZMPn5BRcMU-DYkNEngZA2Q-1; Mon, 25 Apr 2022 08:22:17 -0400
X-MC-Unique: ZMPn5BRcMU-DYkNEngZA2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A800D185A7BA;
	Mon, 25 Apr 2022 12:22:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D46C2166BA3;
	Mon, 25 Apr 2022 12:22:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 082E01940352;
	Mon, 25 Apr 2022 12:22:16 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0C60D1947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 25 Apr 2022 12:22:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E30C740C1241; Mon, 25 Apr 2022 12:22:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF4C7401A992
 for <linux-cachefs@redhat.com>; Mon, 25 Apr 2022 12:22:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C700485A5A8
 for <linux-cachefs@redhat.com>; Mon, 25 Apr 2022 12:22:14 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-DPxi5f6HO1CQfFdxhCmOiA-1; Mon, 25 Apr 2022 08:22:09 -0400
X-MC-Unique: DPxi5f6HO1CQfFdxhCmOiA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=20; SR=0; TI=SMTPD_---0VBE4bHg_1650889323
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VBE4bHg_1650889323) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 25 Apr 2022 20:22:04 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon, 25 Apr 2022 20:21:34 +0800
Message-Id: <20220425122143.56815-13-jefflexu@linux.alibaba.com>
In-Reply-To: <20220425122143.56815-1-jefflexu@linux.alibaba.com>
References: <20220425122143.56815-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH v10 12/21] erofs: add fscache context helper
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
Cc: zhujia.zj@bytedance.com, gregkh@linuxfoundation.org, fannaihao@baidu.com,
 tao.peng@linux.alibaba.com, willy@infradead.org, linux-kernel@vger.kernel.org,
 tianzichen@kuaishou.com, joseph.qi@linux.alibaba.com,
 zhangjiachen.jaycee@bytedance.com, bo.liu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce a context structure for managing data blobs, and helper
functions for initializing and cleaning up this context structure.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/fscache.c  | 41 +++++++++++++++++++++++++++++++++++++++++
 fs/erofs/internal.h | 19 +++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 7a6d0239ebb1..dfff245b006b 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -5,6 +5,47 @@
 #include <linux/fscache.h>
 #include "internal.h"
 
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
index e4f6a13f161f..b1f19f058503 100644
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
@@ -626,12 +630,27 @@ static inline int z_erofs_load_lzma_config(struct super_block *sb,
 #ifdef CONFIG_EROFS_FS_ONDEMAND
 int erofs_fscache_register_fs(struct super_block *sb);
 void erofs_fscache_unregister_fs(struct super_block *sb);
+
+int erofs_fscache_register_cookie(struct super_block *sb,
+				  struct erofs_fscache **fscache, char *name);
+void erofs_fscache_unregister_cookie(struct erofs_fscache **fscache);
 #else
 static inline int erofs_fscache_register_fs(struct super_block *sb)
 {
 	return 0;
 }
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

