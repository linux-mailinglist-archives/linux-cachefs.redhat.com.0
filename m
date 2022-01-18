Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D19C149269E
	for <lists+linux-cachefs@lfdr.de>; Tue, 18 Jan 2022 14:12:47 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-94Tr-cgUMzOsHUMKbdqmhg-1; Tue, 18 Jan 2022 08:12:43 -0500
X-MC-Unique: 94Tr-cgUMzOsHUMKbdqmhg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D0D583DD29;
	Tue, 18 Jan 2022 13:12:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CE8E2B5BD;
	Tue, 18 Jan 2022 13:12:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CE2C4BB7C;
	Tue, 18 Jan 2022 13:12:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IDCdsY010130 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 08:12:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B3E42401E3D; Tue, 18 Jan 2022 13:12:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0688401E3C
	for <linux-cachefs@redhat.com>; Tue, 18 Jan 2022 13:12:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A5683C61341
	for <linux-cachefs@redhat.com>; Tue, 18 Jan 2022 13:12:39 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
	(out30-131.freemail.mail.aliyun.com [115.124.30.131]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-196-rdlyobgAN-SKH1Tr-biszA-1; Tue, 18 Jan 2022 08:12:36 -0500
X-MC-Unique: rdlyobgAN-SKH1Tr-biszA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R411e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V2C1Qxj_1642511548
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V2C1Qxj_1642511548) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 18 Jan 2022 21:12:29 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Tue, 18 Jan 2022 21:12:06 +0800
Message-Id: <20220118131216.85338-11-jefflexu@linux.alibaba.com>
In-Reply-To: <20220118131216.85338-1-jefflexu@linux.alibaba.com>
References: <20220118131216.85338-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [PATCH v2 10/20] erofs: register global fscache
	volume
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

All erofs instances will share one global fscache volume.

In this using scenario, one erofs instance could be mounted from one (or
multiple) blob files instead of blkdev. The number of blob files that
each erofs instance could correspond to is limited, since these blob
files are quite large in size. For example, when used for container
image distribution, one erofs instance used for container image for
node.js will correspond to ~20 blob files in total. Thus in densely
employed environment, there could be as many as hundreds of containers
and thus thousands of fscache cookies under one fscache volume.

Then as for cachefiles backend, the hash table managing all cookies
under one volume contains 32K slots. Thus the hashing functionality shall
scale well in this case. Besides, cachefiles backend will scatter
backing files under 256 fan sub-directoris, and thus the scalability of
looking up backing files shall also not be an issue.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/Makefile   |  3 ++-
 fs/erofs/fscache.c  | 21 +++++++++++++++++++++
 fs/erofs/internal.h |  5 +++++
 fs/erofs/super.c    |  7 +++++++
 4 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 fs/erofs/fscache.c

diff --git a/fs/erofs/Makefile b/fs/erofs/Makefile
index 8a3317e38e5a..21999e8a4728 100644
--- a/fs/erofs/Makefile
+++ b/fs/erofs/Makefile
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_EROFS_FS) += erofs.o
-erofs-objs := super.o inode.o data.o namei.o dir.o utils.o pcpubuf.o sysfs.o
+erofs-objs := super.o inode.o data.o namei.o dir.o utils.o pcpubuf.o sysfs.o \
+	      fscache.o
 erofs-$(CONFIG_EROFS_FS_XATTR) += xattr.o
 erofs-$(CONFIG_EROFS_FS_ZIP) += decompressor.o zmap.o zdata.o
 erofs-$(CONFIG_EROFS_FS_ZIP_LZMA) += decompressor_lzma.o
diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
new file mode 100644
index 000000000000..9c32f42e1056
--- /dev/null
+++ b/fs/erofs/fscache.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021, Alibaba Cloud
+ */
+#include "internal.h"
+
+static struct fscache_volume *volume;
+
+int __init erofs_init_fscache(void)
+{
+	volume = fscache_acquire_volume("erofs", NULL, NULL, 0);
+	if (!volume)
+		return -EINVAL;
+
+	return 0;
+}
+
+void erofs_exit_fscache(void)
+{
+	fscache_relinquish_volume(volume, NULL, false);
+}
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 2b9337d385ce..c2608a469107 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/iomap.h>
+#include <linux/fscache.h>
 #include "erofs_fs.h"
 
 /* redefine pr_fmt "erofs: " */
@@ -616,6 +617,10 @@ static inline int z_erofs_load_lzma_config(struct super_block *sb,
 }
 #endif	/* !CONFIG_EROFS_FS_ZIP */
 
+/* fscache.c */
+int erofs_init_fscache(void);
+void erofs_exit_fscache(void);
+
 #define EFSCORRUPTED    EUCLEAN         /* Filesystem is corrupted */
 
 #endif	/* __EROFS_INTERNAL_H */
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 12755217631f..798f0c379e35 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -814,6 +814,10 @@ static int __init erofs_module_init(void)
 	if (err)
 		goto sysfs_err;
 
+	err = erofs_init_fscache();
+	if (err)
+		goto fscache_err;
+
 	err = register_filesystem(&erofs_fs_type);
 	if (err)
 		goto fs_err;
@@ -821,6 +825,8 @@ static int __init erofs_module_init(void)
 	return 0;
 
 fs_err:
+	erofs_exit_fscache();
+fscache_err:
 	erofs_exit_sysfs();
 sysfs_err:
 	z_erofs_exit_zip_subsystem();
@@ -841,6 +847,7 @@ static void __exit erofs_module_exit(void)
 	/* Ensure all RCU free inodes / pclusters are safe to be destroyed. */
 	rcu_barrier();
 
+	erofs_exit_fscache();
 	erofs_exit_sysfs();
 	z_erofs_exit_zip_subsystem();
 	z_erofs_lzma_exit();
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

