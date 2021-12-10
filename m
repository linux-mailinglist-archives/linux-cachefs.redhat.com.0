Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F9F46FBC8
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 08:37:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-G-iILgxdM9qfiTl05RSJhQ-1; Fri, 10 Dec 2021 02:37:09 -0500
X-MC-Unique: G-iILgxdM9qfiTl05RSJhQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4267D81CCB7;
	Fri, 10 Dec 2021 07:37:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B88267840;
	Fri, 10 Dec 2021 07:37:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BAC1A1809CB8;
	Fri, 10 Dec 2021 07:37:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BA7aj7Y027906 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 10 Dec 2021 02:36:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 066F7C08095; Fri, 10 Dec 2021 07:36:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 023E5C202C6
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE58C2B7604E
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:44 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
	(out30-54.freemail.mail.aliyun.com [115.124.30.54]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-491-HOpIUS25MHW6SgzgXxqZmw-1; Fri, 10 Dec 2021 02:36:42 -0500
X-MC-Unique: HOpIUS25MHW6SgzgXxqZmw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V-83nvA_1639121795
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V-83nvA_1639121795) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 10 Dec 2021 15:36:36 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 10 Dec 2021 15:36:13 +0800
Message-Id: <20211210073619.21667-14-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [RFC 13/19] erofs: add bootstrap_path mount option
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Until then erofs is exactly blockdev based filesystem. In other using
scenarios (e.g. container image), erofs needs to run upon files.

This patch introduces a new mount option "bootstrap_path", which is used
to specify the bootstrap blob file containing the complete erofs image.
Then erofs could be mounted from the bootstrap blob file.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/data.c     | 13 ++++++++++---
 fs/erofs/internal.h |  1 +
 fs/erofs/super.c    | 40 +++++++++++++++++++++++++++++++++++-----
 3 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index 477aaff0c832..cf71082bd52f 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -11,11 +11,18 @@
 
 struct page *erofs_get_meta_page(struct super_block *sb, erofs_blk_t blkaddr)
 {
-	struct address_space *const mapping = sb->s_bdev->bd_inode->i_mapping;
+	struct address_space * mapping;
 	struct page *page;
 
-	page = read_cache_page_gfp(mapping, blkaddr,
-				   mapping_gfp_constraint(mapping, ~__GFP_FS));
+	if (sb->s_bdev) {
+		mapping = sb->s_bdev->bd_inode->i_mapping;
+		page = read_cache_page_gfp(mapping, blkaddr,
+				mapping_gfp_constraint(mapping, ~__GFP_FS));
+	} else {
+		/* TODO: fscache based data path */
+		page = ERR_PTR(-EINVAL);
+	}
+
 	/* should already be PageUptodate */
 	if (!IS_ERR(page))
 		lock_page(page);
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 45fb6f5d11b5..cf69d9c9cbed 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -67,6 +67,7 @@ struct erofs_mount_opts {
 	unsigned int max_sync_decompress_pages;
 #endif
 	unsigned int mount_opt;
+	char *bootstrap_path;
 };
 
 struct erofs_dev_context {
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 6a969b1e0ee6..51695f6d4449 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -440,6 +440,7 @@ enum {
 	Opt_dax,
 	Opt_dax_enum,
 	Opt_device,
+	Opt_bootstrap_path,
 	Opt_err
 };
 
@@ -464,6 +465,7 @@ static const struct fs_parameter_spec erofs_fs_parameters[] = {
 	fsparam_flag("dax",             Opt_dax),
 	fsparam_enum("dax",		Opt_dax_enum, erofs_dax_param_enums),
 	fsparam_string("device",	Opt_device),
+	fsparam_string("bootstrap_path",Opt_bootstrap_path),
 	{}
 };
 
@@ -559,6 +561,14 @@ static int erofs_fc_parse_param(struct fs_context *fc,
 		}
 		++ctx->devs->extra_devices;
 		break;
+	case Opt_bootstrap_path:
+		kfree(ctx->opt.bootstrap_path);
+		ctx->opt.bootstrap_path = kstrdup(param->string, GFP_KERNEL);
+		if (!ctx->opt.bootstrap_path)
+			return -ENOMEM;
+		infofc(fc, "RAFS bootstrap_path %s", ctx->opt.bootstrap_path);
+		break;
+
 	default:
 		return -ENOPARAM;
 	}
@@ -633,9 +643,12 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	sb->s_magic = EROFS_SUPER_MAGIC;
 
-	if (!sb_set_blocksize(sb, EROFS_BLKSIZ)) {
+	if (sb->s_bdev && !sb_set_blocksize(sb, EROFS_BLKSIZ)) {
 		erofs_err(sb, "failed to set erofs blksize");
 		return -EINVAL;
+	} else {
+		sb->s_blocksize = EROFS_BLKSIZ;
+		sb->s_blocksize_bits = LOG_BLOCK_SIZE;
 	}
 
 	sbi = kzalloc(sizeof(*sbi), GFP_KERNEL);
@@ -644,16 +657,21 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	sb->s_fs_info = sbi;
 	sbi->opt = ctx->opt;
-	sbi->dax_dev = fs_dax_get_by_bdev(sb->s_bdev);
 	sbi->devs = ctx->devs;
 	ctx->devs = NULL;
 
+	if (sb->s_bdev)
+		sbi->dax_dev = fs_dax_get_by_bdev(sb->s_bdev);
+	else
+		sbi->dax_dev = NULL;
+
 	err = erofs_read_superblock(sb);
 	if (err)
 		return err;
 
 	if (test_opt(&sbi->opt, DAX_ALWAYS) &&
-	    !dax_supported(sbi->dax_dev, sb->s_bdev, EROFS_BLKSIZ, 0, bdev_nr_sectors(sb->s_bdev))) {
+	    (!sbi->dax_dev ||
+	     !dax_supported(sbi->dax_dev, sb->s_bdev, EROFS_BLKSIZ, 0, bdev_nr_sectors(sb->s_bdev)))) {
 		errorfc(fc, "DAX unsupported by block device. Turning off DAX.");
 		clear_opt(&sbi->opt, DAX_ALWAYS);
 	}
@@ -701,6 +719,10 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 
 static int erofs_fc_get_tree(struct fs_context *fc)
 {
+	struct erofs_fs_context *ctx = fc->fs_private;
+
+	if (ctx->opt.bootstrap_path)
+		return get_tree_nodev(fc, erofs_fc_fill_super);
 	return get_tree_bdev(fc, erofs_fc_fill_super);
 }
 
@@ -749,6 +771,7 @@ static void erofs_fc_free(struct fs_context *fc)
 	struct erofs_fs_context *ctx = fc->fs_private;
 
 	erofs_free_dev_context(ctx->devs);
+	kfree(ctx->opt.bootstrap_path);
 	kfree(ctx);
 }
 
@@ -789,7 +812,10 @@ static void erofs_kill_sb(struct super_block *sb)
 
 	WARN_ON(sb->s_magic != EROFS_SUPER_MAGIC);
 
-	kill_block_super(sb);
+	if (sb->s_bdev)
+		kill_block_super(sb);
+	else
+		generic_shutdown_super(sb);
 
 	sbi = EROFS_SB(sb);
 	if (!sbi)
@@ -889,7 +915,11 @@ static int erofs_statfs(struct dentry *dentry, struct kstatfs *buf)
 {
 	struct super_block *sb = dentry->d_sb;
 	struct erofs_sb_info *sbi = EROFS_SB(sb);
-	u64 id = huge_encode_dev(sb->s_bdev->bd_dev);
+	u64 id = 0;
+
+	/* TODO: fsid in nodev mode */
+	if (sb->s_bdev)
+		id = huge_encode_dev(sb->s_bdev->bd_dev);
 
 	buf->f_type = sb->s_magic;
 	buf->f_bsize = EROFS_BLKSIZ;
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

