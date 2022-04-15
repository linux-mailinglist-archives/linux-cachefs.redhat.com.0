Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 61572502A1A
	for <lists+linux-cachefs@lfdr.de>; Fri, 15 Apr 2022 14:36:58 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-plTmQ_8fPdmfX223ksWD9g-1; Fri, 15 Apr 2022 08:36:52 -0400
X-MC-Unique: plTmQ_8fPdmfX223ksWD9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E040A1C06915;
	Fri, 15 Apr 2022 12:36:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D68BE9E64;
	Fri, 15 Apr 2022 12:36:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B58A81940352;
	Fri, 15 Apr 2022 12:36:51 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 28F6119451EF for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 15 Apr 2022 12:36:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0CE60463EEE; Fri, 15 Apr 2022 12:36:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08E98463EF4
 for <linux-cachefs@redhat.com>; Fri, 15 Apr 2022 12:36:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5683805F46
 for <linux-cachefs@redhat.com>; Fri, 15 Apr 2022 12:36:48 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-Gz9eR8ZnOiGimsxVCM9Ocg-1; Fri, 15 Apr 2022 08:36:45 -0400
X-MC-Unique: Gz9eR8ZnOiGimsxVCM9Ocg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R281e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0VA7Cc3m_1650026199
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VA7Cc3m_1650026199) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 15 Apr 2022 20:36:40 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 15 Apr 2022 20:36:08 +0800
Message-Id: <20220415123614.54024-16-jefflexu@linux.alibaba.com>
In-Reply-To: <20220415123614.54024-1-jefflexu@linux.alibaba.com>
References: <20220415123614.54024-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Linux-cachefs] [PATCH v9 15/21] erofs: register fscache context
 for primary data blob
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
 joseph.qi@linux.alibaba.com, zhangjiachen.jaycee@bytedance.com,
 bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
 luodaowen.backend@bytedance.com, eguan@linux.alibaba.com,
 gerry@linux.alibaba.com, torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Registers fscache context for primary data blob. Also move the
initialization of s_op and related fields forward, since anonymous
inode will be allocated under the super block when registering the
fscache context.

Something worth mentioning about the cleanup routine.

1. The fscache context will instantiate anonymous inodes under the super
block. Release these anonymous inodes when .put_super() is called, or
we'll get "VFS: Busy inodes after unmount." warning.

2. The fscache context is initialized prior to the root inode. If
.kill_sb() is called when mount failed, .put_super() won't be called
when root inode has not been initialized yet. Thus .kill_sb() shall
also contain the cleanup routine.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/internal.h |  1 +
 fs/erofs/super.c    | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 5867cb63fd74..386658416159 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -155,6 +155,7 @@ struct erofs_sb_info {
 
 	/* fscache support */
 	struct fscache_volume *volume;
+	struct erofs_fscache *s_fscache;
 };
 
 #define EROFS_SB(sb) ((struct erofs_sb_info *)(sb)->s_fs_info)
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index fd8daa447237..61dc900295f9 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -589,6 +589,9 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 	int err;
 
 	sb->s_magic = EROFS_SUPER_MAGIC;
+	sb->s_flags |= SB_RDONLY | SB_NOATIME;
+	sb->s_maxbytes = MAX_LFS_FILESIZE;
+	sb->s_op = &erofs_sops;
 
 	sbi = kzalloc(sizeof(*sbi), GFP_KERNEL);
 	if (!sbi)
@@ -606,6 +609,11 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 		err = erofs_fscache_register_fs(sb);
 		if (err)
 			return err;
+
+		err = erofs_fscache_register_cookie(sb, &sbi->s_fscache,
+						    sbi->opt.fsid, true);
+		if (err)
+			return err;
 	} else {
 		if (!sb_set_blocksize(sb, EROFS_BLKSIZ)) {
 			erofs_err(sb, "failed to set erofs blksize");
@@ -628,11 +636,8 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 			clear_opt(&sbi->opt, DAX_ALWAYS);
 		}
 	}
-	sb->s_flags |= SB_RDONLY | SB_NOATIME;
-	sb->s_maxbytes = MAX_LFS_FILESIZE;
-	sb->s_time_gran = 1;
 
-	sb->s_op = &erofs_sops;
+	sb->s_time_gran = 1;
 	sb->s_xattr = erofs_xattr_handlers;
 
 	if (test_opt(&sbi->opt, POSIX_ACL))
@@ -772,6 +777,7 @@ static void erofs_kill_sb(struct super_block *sb)
 
 	erofs_free_dev_context(sbi->devs);
 	fs_put_dax(sbi->dax_dev);
+	erofs_fscache_unregister_cookie(&sbi->s_fscache);
 	erofs_fscache_unregister_fs(sb);
 	kfree(sbi);
 	sb->s_fs_info = NULL;
@@ -790,6 +796,7 @@ static void erofs_put_super(struct super_block *sb)
 	iput(sbi->managed_cache);
 	sbi->managed_cache = NULL;
 #endif
+	erofs_fscache_unregister_cookie(&sbi->s_fscache);
 }
 
 static struct file_system_type erofs_fs_type = {
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

