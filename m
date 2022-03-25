Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8434E731D
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Mar 2022 13:23:10 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-Vm3LRL17OuCjnLMzD6C0xQ-1; Fri, 25 Mar 2022 08:23:06 -0400
X-MC-Unique: Vm3LRL17OuCjnLMzD6C0xQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C2D9811E80;
	Fri, 25 Mar 2022 12:23:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A772C27DBC;
	Fri, 25 Mar 2022 12:23:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C5B0F194035B;
	Fri, 25 Mar 2022 12:23:04 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 48EF81940341 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Mar 2022 12:23:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1B410142B94D; Fri, 25 Mar 2022 12:23:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 174CB1400C2B
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 12:23:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CE1D106656D
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 12:23:00 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-7-8APtSmMGayAIsjOZyfYg-1; Fri, 25 Mar 2022 08:22:52 -0400
X-MC-Unique: 7-8APtSmMGayAIsjOZyfYg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V89zY3j_1648210967
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V89zY3j_1648210967) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 25 Mar 2022 20:22:48 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 25 Mar 2022 20:22:16 +0800
Message-Id: <20220325122223.102958-16-jefflexu@linux.alibaba.com>
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
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH v6 15/22] erofs: register cookie context for
 bootstrap blob
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

Registers fscache_cookie for the bootstrap blob file. The bootstrap blob
file can be specified by a new mount option, which is going to be
introduced by a following patch.

Something worth mentioning about the cleanup routine.

1. The init routine is prior to when the root inode gets initialized,
and thus the corresponding cleanup routine shall be placed inside
.kill_sb() callback.

2. The init routine will instantiate anonymous inodes under the
super_block, and thus .put_super() callback shall also contain the
cleanup routine. Or we'll get "VFS: Busy inodes after unmount." warning.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/internal.h |  3 +++
 fs/erofs/super.c    | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 459f31803c3b..d8c886a7491e 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -73,6 +73,7 @@ struct erofs_mount_opts {
 	/* threshold for decompression synchronously */
 	unsigned int max_sync_decompress_pages;
 #endif
+	char *tag;
 	unsigned int mount_opt;
 };
 
@@ -151,6 +152,8 @@ struct erofs_sb_info {
 	/* sysfs support */
 	struct kobject s_kobj;		/* /sys/fs/erofs/<devname> */
 	struct completion s_kobj_unregister;
+
+	struct erofs_fscache *bootstrap;
 };
 
 #define EROFS_SB(sb) ((struct erofs_sb_info *)(sb)->s_fs_info)
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 798f0c379e35..de5aeda4aea0 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -598,6 +598,16 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 	sbi->devs = ctx->devs;
 	ctx->devs = NULL;
 
+	if (IS_ENABLED(CONFIG_EROFS_FS_ONDEMAND) && erofs_is_nodev_mode(sb)) {
+		struct erofs_fscache *bootstrap;
+
+		bootstrap = erofs_fscache_get(sb, ctx->opt.tag, true);
+		if (IS_ERR(bootstrap))
+			return PTR_ERR(bootstrap);
+
+		sbi->bootstrap = bootstrap;
+	}
+
 	err = erofs_read_superblock(sb);
 	if (err)
 		return err;
@@ -753,6 +763,7 @@ static void erofs_kill_sb(struct super_block *sb)
 		return;
 
 	erofs_free_dev_context(sbi->devs);
+	erofs_fscache_put(sbi->bootstrap);
 	fs_put_dax(sbi->dax_dev);
 	kfree(sbi);
 	sb->s_fs_info = NULL;
@@ -771,6 +782,12 @@ static void erofs_put_super(struct super_block *sb)
 	iput(sbi->managed_cache);
 	sbi->managed_cache = NULL;
 #endif
+	erofs_fscache_put(sbi->bootstrap);
+	/*
+	 * Set sbi->bootstrap to NULL, so that the following cleanup routine
+	 * inside .kill_sb() could be skipped then.
+	 */
+	sbi->bootstrap = NULL;
 }
 
 static struct file_system_type erofs_fs_type = {
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

