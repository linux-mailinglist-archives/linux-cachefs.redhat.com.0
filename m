Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E90146FBE5
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 08:38:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-Qpl7cruTOuOvF5PHaQ7WSQ-1; Fri, 10 Dec 2021 02:38:35 -0500
X-MC-Unique: Qpl7cruTOuOvF5PHaQ7WSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F182D800FF3;
	Fri, 10 Dec 2021 07:38:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E31737AB49;
	Fri, 10 Dec 2021 07:38:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D06DC4A7C9;
	Fri, 10 Dec 2021 07:38:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BA7aknV027918 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 10 Dec 2021 02:36:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3C33A1121315; Fri, 10 Dec 2021 07:36:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 385D71121314
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C84A85A5A8
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:43 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
	(out30-57.freemail.mail.aliyun.com [115.124.30.57]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-172-TrrSQpSMP8WZ5PK756jVeg-1; Fri, 10 Dec 2021 02:36:41 -0500
X-MC-Unique: TrrSQpSMP8WZ5PK756jVeg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R711e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1;
	HT=alimailimapcm10staff010182156082;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V-8E0RI_1639121796
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V-8E0RI_1639121796) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 10 Dec 2021 15:36:37 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 10 Dec 2021 15:36:14 +0800
Message-Id: <20211210073619.21667-15-jefflexu@linux.alibaba.com>
In-Reply-To: <20211210073619.21667-1-jefflexu@linux.alibaba.com>
References: <20211210073619.21667-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [RFC 14/19] erofs: introduce fscache support
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch only handles the volume cookie and data file cookie for
bootstrap. The corresponding IO path is remained to be implemented in
the following patch.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/Makefile   |  2 +-
 fs/erofs/fscache.c  | 37 +++++++++++++++++++++++++++++++++++++
 fs/erofs/internal.h |  8 ++++++++
 fs/erofs/super.c    |  5 +++++
 4 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 fs/erofs/fscache.c

diff --git a/fs/erofs/Makefile b/fs/erofs/Makefile
index 756fe2d65272..f9a3609625aa 100644
--- a/fs/erofs/Makefile
+++ b/fs/erofs/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_EROFS_FS) += erofs.o
-erofs-objs := super.o inode.o data.o namei.o dir.o utils.o pcpubuf.o
+erofs-objs := super.o inode.o data.o namei.o dir.o utils.o pcpubuf.o fscache.o
 erofs-$(CONFIG_EROFS_FS_XATTR) += xattr.o
 erofs-$(CONFIG_EROFS_FS_ZIP) += decompressor.o zmap.o zdata.o
 erofs-$(CONFIG_EROFS_FS_ZIP_LZMA) += decompressor_lzma.o
diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
new file mode 100644
index 000000000000..cf550fdedd1e
--- /dev/null
+++ b/fs/erofs/fscache.c
@@ -0,0 +1,37 @@
+#include "internal.h"
+
+int erofs_fscache_init(struct erofs_sb_info *sbi, char *bootstrap_path)
+{
+	sbi->volume = fscache_acquire_volume("erofs", NULL, 0);
+	if (!sbi->volume) {
+		printk("fscache_acquire_volume() failed\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * TODO: @object_size is 0 since erofs can not get size of bootstrap
+	 * file.
+	 */
+	sbi->bootstrap = fscache_acquire_cookie(sbi->volume, 0,
+			 bootstrap_path, strlen(bootstrap_path),
+			 NULL, 0,
+			 1 /*TODO: we don't want FSCACHE_COOKIE_NO_DATA_TO_READ set */
+			 );
+
+	if (!sbi->bootstrap) {
+		printk("fscache_acquire_cookie() for bootstrap failed\n");
+		/* cleanup for sbi->volume is delayed to erofs_fscache_cleanup() */
+		return -EINVAL;
+	}
+
+	fscache_use_cookie(sbi->bootstrap, false);
+
+	return 0;
+}
+
+void erofs_fscache_cleanup(struct erofs_sb_info *sbi)
+{
+	fscache_unuse_cookie(sbi->bootstrap, NULL, NULL);
+	fscache_relinquish_cookie(sbi->bootstrap, false);
+	fscache_relinquish_volume(sbi->volume, 0, false);
+}
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index cf69d9c9cbed..8136ec63a9de 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/iomap.h>
+#include <linux/fscache.h>
 #include "erofs_fs.h"
 
 /* redefine pr_fmt "erofs: " */
@@ -106,6 +107,9 @@ struct erofs_sb_info {
 	/* pseudo inode to manage cached pages */
 	struct inode *managed_cache;
 
+	struct fscache_volume *volume;
+	struct fscache_cookie *bootstrap;
+
 	struct erofs_sb_lz4_info lz4;
 #endif	/* CONFIG_EROFS_FS_ZIP */
 	struct erofs_dev_context *devs;
@@ -569,6 +573,10 @@ static inline int z_erofs_load_lzma_config(struct super_block *sb,
 }
 #endif	/* !CONFIG_EROFS_FS_ZIP */
 
+/* fscache.c */
+int erofs_fscache_init(struct erofs_sb_info *sbi, char *bootstrap_path);
+void erofs_fscache_cleanup(struct erofs_sb_info *sbi);
+
 #define EFSCORRUPTED    EUCLEAN         /* Filesystem is corrupted */
 
 #endif	/* __EROFS_INTERNAL_H */
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 51695f6d4449..f2a5f4cd53fd 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -665,6 +665,10 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 	else
 		sbi->dax_dev = NULL;
 
+	err = erofs_fscache_init(sbi, ctx->opt.bootstrap_path);
+	if (err)
+		return err;
+
 	err = erofs_read_superblock(sb);
 	if (err)
 		return err;
@@ -823,6 +827,7 @@ static void erofs_kill_sb(struct super_block *sb)
 
 	erofs_free_dev_context(sbi->devs);
 	fs_put_dax(sbi->dax_dev);
+	erofs_fscache_cleanup(sbi);
 	kfree(sbi);
 	sb->s_fs_info = NULL;
 }
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

