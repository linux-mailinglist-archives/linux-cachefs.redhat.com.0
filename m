Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B8F50DFED
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Apr 2022 14:22:20 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-ImvHDbdKPseXSLCU6EbsTg-1; Mon, 25 Apr 2022 08:22:16 -0400
X-MC-Unique: ImvHDbdKPseXSLCU6EbsTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49909381D8BB;
	Mon, 25 Apr 2022 12:22:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3FFE6145BA72;
	Mon, 25 Apr 2022 12:22:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EB4CD1940342;
	Mon, 25 Apr 2022 12:22:15 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C9E031947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 25 Apr 2022 12:22:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BB1F9C27EAE; Mon, 25 Apr 2022 12:22:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6F41C27EA6
 for <linux-cachefs@redhat.com>; Mon, 25 Apr 2022 12:22:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CD16800B28
 for <linux-cachefs@redhat.com>; Mon, 25 Apr 2022 12:22:14 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-an81diilPkCQD3T6rhhF8Q-1; Mon, 25 Apr 2022 08:22:08 -0400
X-MC-Unique: an81diilPkCQD3T6rhhF8Q-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=20; SR=0; TI=SMTPD_---0VBE4bHK_1650889322
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VBE4bHK_1650889322) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 25 Apr 2022 20:22:03 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon, 25 Apr 2022 20:21:33 +0800
Message-Id: <20220425122143.56815-12-jefflexu@linux.alibaba.com>
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
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Linux-cachefs] [PATCH v10 11/21] erofs: register fscache volume
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A new fscache based mode is going to be introduced for erofs, in which
case on-demand read semantics is implemented through fscache.

As the first step, register fscache volume for each erofs filesystem.
That means, data blobs can not be shared among erofs filesystems. In the
following iteration, we are going to introduce the domain semantics, in
which case several erofs filesystems can belong to one domain, and data
blobs can be shared among these erofs filesystems of one domain.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/Kconfig    | 10 ++++++++++
 fs/erofs/Makefile   |  1 +
 fs/erofs/fscache.c  | 37 +++++++++++++++++++++++++++++++++++++
 fs/erofs/internal.h | 16 ++++++++++++++++
 fs/erofs/super.c    |  5 +++++
 5 files changed, 69 insertions(+)
 create mode 100644 fs/erofs/fscache.c

diff --git a/fs/erofs/Kconfig b/fs/erofs/Kconfig
index f57255ab88ed..85490370e0ca 100644
--- a/fs/erofs/Kconfig
+++ b/fs/erofs/Kconfig
@@ -98,3 +98,13 @@ config EROFS_FS_ZIP_LZMA
 	  systems will be readable without selecting this option.
 
 	  If unsure, say N.
+
+config EROFS_FS_ONDEMAND
+	bool "EROFS fscache-based on-demand read support"
+	depends on CACHEFILES_ONDEMAND && (EROFS_FS=m && FSCACHE || EROFS_FS=y && FSCACHE=y)
+	default n
+	help
+	  This permits EROFS to use fscache-backed data blobs with on-demand
+	  read support.
+
+	  If unsure, say N.
diff --git a/fs/erofs/Makefile b/fs/erofs/Makefile
index 8a3317e38e5a..99bbc597a3e9 100644
--- a/fs/erofs/Makefile
+++ b/fs/erofs/Makefile
@@ -5,3 +5,4 @@ erofs-objs := super.o inode.o data.o namei.o dir.o utils.o pcpubuf.o sysfs.o
 erofs-$(CONFIG_EROFS_FS_XATTR) += xattr.o
 erofs-$(CONFIG_EROFS_FS_ZIP) += decompressor.o zmap.o zdata.o
 erofs-$(CONFIG_EROFS_FS_ZIP_LZMA) += decompressor_lzma.o
+erofs-$(CONFIG_EROFS_FS_ONDEMAND) += fscache.o
diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
new file mode 100644
index 000000000000..7a6d0239ebb1
--- /dev/null
+++ b/fs/erofs/fscache.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2022, Alibaba Cloud
+ */
+#include <linux/fscache.h>
+#include "internal.h"
+
+int erofs_fscache_register_fs(struct super_block *sb)
+{
+	struct erofs_sb_info *sbi = EROFS_SB(sb);
+	struct fscache_volume *volume;
+	char *name;
+	int ret = 0;
+
+	name = kasprintf(GFP_KERNEL, "erofs,%s", sbi->opt.fsid);
+	if (!name)
+		return -ENOMEM;
+
+	volume = fscache_acquire_volume(name, NULL, NULL, 0);
+	if (IS_ERR_OR_NULL(volume)) {
+		erofs_err(sb, "failed to register volume for %s", name);
+		ret = volume ? PTR_ERR(volume) : -EOPNOTSUPP;
+		volume = NULL;
+	}
+
+	sbi->volume = volume;
+	kfree(name);
+	return ret;
+}
+
+void erofs_fscache_unregister_fs(struct super_block *sb)
+{
+	struct erofs_sb_info *sbi = EROFS_SB(sb);
+
+	fscache_relinquish_volume(sbi->volume, NULL, false);
+	sbi->volume = NULL;
+}
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 05a97533b1e9..e4f6a13f161f 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -74,6 +74,7 @@ struct erofs_mount_opts {
 	unsigned int max_sync_decompress_pages;
 #endif
 	unsigned int mount_opt;
+	char *fsid;
 };
 
 struct erofs_dev_context {
@@ -146,6 +147,9 @@ struct erofs_sb_info {
 	/* sysfs support */
 	struct kobject s_kobj;		/* /sys/fs/erofs/<devname> */
 	struct completion s_kobj_unregister;
+
+	/* fscache support */
+	struct fscache_volume *volume;
 };
 
 #define EROFS_SB(sb) ((struct erofs_sb_info *)(sb)->s_fs_info)
@@ -618,6 +622,18 @@ static inline int z_erofs_load_lzma_config(struct super_block *sb,
 }
 #endif	/* !CONFIG_EROFS_FS_ZIP */
 
+/* fscache.c */
+#ifdef CONFIG_EROFS_FS_ONDEMAND
+int erofs_fscache_register_fs(struct super_block *sb);
+void erofs_fscache_unregister_fs(struct super_block *sb);
+#else
+static inline int erofs_fscache_register_fs(struct super_block *sb)
+{
+	return 0;
+}
+static inline void erofs_fscache_unregister_fs(struct super_block *sb) {}
+#endif
+
 #define EFSCORRUPTED    EUCLEAN         /* Filesystem is corrupted */
 
 #endif	/* __EROFS_INTERNAL_H */
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 724d5ff0d78c..fd8daa447237 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -602,6 +602,10 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (erofs_is_fscache_mode(sb)) {
 		sb->s_blocksize = EROFS_BLKSIZ;
 		sb->s_blocksize_bits = LOG_BLOCK_SIZE;
+
+		err = erofs_fscache_register_fs(sb);
+		if (err)
+			return err;
 	} else {
 		if (!sb_set_blocksize(sb, EROFS_BLKSIZ)) {
 			erofs_err(sb, "failed to set erofs blksize");
@@ -768,6 +772,7 @@ static void erofs_kill_sb(struct super_block *sb)
 
 	erofs_free_dev_context(sbi->devs);
 	fs_put_dax(sbi->dax_dev);
+	erofs_fscache_unregister_fs(sb);
 	kfree(sbi);
 	sb->s_fs_info = NULL;
 }
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

