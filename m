Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 764264E7321
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Mar 2022 13:23:12 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-6re3Vn6iMj-EkrNrkEvGPg-1; Fri, 25 Mar 2022 08:23:08 -0400
X-MC-Unique: 6re3Vn6iMj-EkrNrkEvGPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F37F1066558;
	Fri, 25 Mar 2022 12:23:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 93F7C2166B5E;
	Fri, 25 Mar 2022 12:23:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5D210194035D;
	Fri, 25 Mar 2022 12:23:07 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4820D194034E for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Mar 2022 12:23:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2B3F41457F07; Fri, 25 Mar 2022 12:23:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 188B7142B94E
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 12:23:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED60E3C11C78
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 12:22:55 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-n_LpQc2TNjeNdnPKEkIYHQ-1; Fri, 25 Mar 2022 08:22:51 -0400
X-MC-Unique: n_LpQc2TNjeNdnPKEkIYHQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V89aFsk_1648210962
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V89aFsk_1648210962) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 25 Mar 2022 20:22:43 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 25 Mar 2022 20:22:13 +0800
Message-Id: <20220325122223.102958-13-jefflexu@linux.alibaba.com>
In-Reply-To: <20220325122223.102958-1-jefflexu@linux.alibaba.com>
References: <20220325122223.102958-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH v6 12/22] erofs: add cookie context helper
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce "struct erofs_fscache" for managing cookie for backinig file,
and helper functions for initializing and cleaning up this context
structure.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/fscache.c  | 61 +++++++++++++++++++++++++++++++++++++++++++++
 fs/erofs/internal.h | 14 +++++++++++
 2 files changed, 75 insertions(+)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 08cf570a0810..73235fd43bf6 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -7,6 +7,67 @@
 
 static struct fscache_volume *volume;
 
+static int erofs_fscache_init_cookie(struct erofs_fscache *ctx, char *path)
+{
+	struct fscache_cookie *cookie;
+
+	cookie = fscache_acquire_cookie(volume, FSCACHE_ADV_WANT_CACHE_SIZE,
+					path, strlen(path),
+					NULL, 0, 0);
+	if (!cookie)
+		return -EINVAL;
+
+	fscache_use_cookie(cookie, false);
+	ctx->cookie = cookie;
+	return 0;
+}
+
+static inline void erofs_fscache_cleanup_cookie(struct erofs_fscache *ctx)
+{
+	struct fscache_cookie *cookie = ctx->cookie;
+
+	fscache_unuse_cookie(cookie, NULL, NULL);
+	fscache_relinquish_cookie(cookie, false);
+	ctx->cookie = NULL;
+}
+
+/*
+ * erofs_fscache_get - create an fscache context for blob file
+ * @sb:		superblock
+ * @path:	name of blob file
+ *
+ * Return: fscache context on success, ERR_PTR() on failure.
+ */
+struct erofs_fscache *erofs_fscache_get(struct super_block *sb, char *path)
+{
+	struct erofs_fscache *ctx;
+	int ret;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	ret = erofs_fscache_init_cookie(ctx, path);
+	if (ret) {
+		erofs_err(sb, "failed to init cookie");
+		goto err;
+	}
+
+	return ctx;
+err:
+	kfree(ctx);
+	return ERR_PTR(ret);
+}
+
+void erofs_fscache_put(struct erofs_fscache *ctx)
+{
+	if (!ctx)
+		return;
+
+	erofs_fscache_cleanup_cookie(ctx);
+	kfree(ctx);
+}
+
 int __init erofs_init_fscache(void)
 {
 	volume = fscache_acquire_volume("erofs", NULL, NULL, 0);
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 45b8b0dd8a27..d4f2b43cedae 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -96,6 +96,10 @@ struct erofs_sb_lz4_info {
 	u16 max_pclusterblks;
 };
 
+struct erofs_fscache {
+	struct fscache_cookie *cookie;
+};
+
 struct erofs_sb_info {
 	struct erofs_mount_opts opt;	/* options */
 #ifdef CONFIG_EROFS_FS_ZIP
@@ -620,9 +624,19 @@ static inline int z_erofs_load_lzma_config(struct super_block *sb,
 #ifdef CONFIG_EROFS_FS_ONDEMAND
 int erofs_init_fscache(void);
 void erofs_exit_fscache(void);
+
+struct erofs_fscache *erofs_fscache_get(struct super_block *sb, char *path);
+void erofs_fscache_put(struct erofs_fscache *ctx);
 #else
 static inline int erofs_init_fscache(void) { return 0; }
 static inline void erofs_exit_fscache(void) {}
+
+static inline struct erofs_fscache *erofs_fscache_get(struct super_block *sb,
+						      char *path)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+static inline void erofs_fscache_put(struct erofs_fscache *ctx) {}
 #endif
 
 #define EFSCORRUPTED    EUCLEAN         /* Filesystem is corrupted */
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

