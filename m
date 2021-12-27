Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7196947FCDE
	for <lists+linux-cachefs@lfdr.de>; Mon, 27 Dec 2021 13:55:14 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-kqFVxhbYPa-RrJdYiE9sew-1; Mon, 27 Dec 2021 07:55:10 -0500
X-MC-Unique: kqFVxhbYPa-RrJdYiE9sew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C634D1023F4E;
	Mon, 27 Dec 2021 12:55:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 897CD79590;
	Mon, 27 Dec 2021 12:55:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 218B34A7C8;
	Mon, 27 Dec 2021 12:55:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BRCt1bc003071 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 27 Dec 2021 07:55:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C6D91492CAC; Mon, 27 Dec 2021 12:55:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2044492CA4
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 12:55:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A870585A5A8
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 12:55:01 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
	(out30-56.freemail.mail.aliyun.com [115.124.30.56]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-417-zRn-rw_CNkye1XUEJJ6S3w-1; Mon, 27 Dec 2021 07:54:57 -0500
X-MC-Unique: zRn-rw_CNkye1XUEJJ6S3w-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R901e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V.wXYUC_1640609692
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V.wXYUC_1640609692) by smtp.aliyun-inc.com(127.0.0.1);
	Mon, 27 Dec 2021 20:54:53 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon, 27 Dec 2021 20:54:28 +0800
Message-Id: <20211227125444.21187-8-jefflexu@linux.alibaba.com>
In-Reply-To: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [PATCH v1 07/23] erofs: add nodev mode
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

Until then erofs is exactly blockdev based filesystem. In other using
scenarios (e.g. container image), erofs needs to run upon files.

This patch introduces a new nodev mode, in which erofs could be mounted
from a bootstrap blob file containing the complete erofs image.

The following patch will introduce a new mount option "uuid", by which
users could specify the bootstrap blob file.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/data.c     | 13 ++++++++---
 fs/erofs/internal.h |  1 +
 fs/erofs/super.c    | 56 +++++++++++++++++++++++++++++++++------------
 3 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index 477aaff0c832..61fa431d0713 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -11,11 +11,18 @@
 
 struct page *erofs_get_meta_page(struct super_block *sb, erofs_blk_t blkaddr)
 {
-	struct address_space *const mapping = sb->s_bdev->bd_inode->i_mapping;
+	struct address_space *mapping;
 	struct page *page;
 
-	page = read_cache_page_gfp(mapping, blkaddr,
-				   mapping_gfp_constraint(mapping, ~__GFP_FS));
+	if (sb->s_bdev) {
+		mapping = sb->s_bdev->bd_inode->i_mapping;
+		page = read_cache_page_gfp(mapping, blkaddr,
+				mapping_gfp_constraint(mapping, ~__GFP_FS));
+	} else {
+		/* TODO: data path in nodev mode */
+		page = ERR_PTR(-EINVAL);
+	}
+
 	/* should already be PageUptodate */
 	if (!IS_ERR(page))
 		lock_page(page);
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 45fb6f5d11b5..c9ee8c247202 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -67,6 +67,7 @@ struct erofs_mount_opts {
 	unsigned int max_sync_decompress_pages;
 #endif
 	unsigned int mount_opt;
+	char *uuid;
 };
 
 struct erofs_dev_context {
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 6a969b1e0ee6..80c00c34eafc 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -304,15 +304,19 @@ static int erofs_init_devices(struct super_block *sb,
 		}
 		dis = ptr + erofs_blkoff(pos);
 
-		bdev = blkdev_get_by_path(dif->path,
-					  FMODE_READ | FMODE_EXCL,
-					  sb->s_type);
-		if (IS_ERR(bdev)) {
-			err = PTR_ERR(bdev);
-			goto err_out;
+		if (sb->s_bdev) {
+			bdev = blkdev_get_by_path(dif->path,
+					FMODE_READ | FMODE_EXCL,
+					sb->s_type);
+			if (IS_ERR(bdev)) {
+				err = PTR_ERR(bdev);
+				goto err_out;
+			}
+			dif->bdev = bdev;
+			dif->dax_dev = fs_dax_get_by_bdev(bdev);
+		} else {
+			/* TODO: multi devs in nodev mode */
 		}
-		dif->bdev = bdev;
-		dif->dax_dev = fs_dax_get_by_bdev(bdev);
 		dif->blocks = le32_to_cpu(dis->blocks);
 		dif->mapped_blkaddr = le32_to_cpu(dis->mapped_blkaddr);
 		sbi->total_blocks += dif->blocks;
@@ -337,7 +341,11 @@ static int erofs_read_superblock(struct super_block *sb)
 	void *data;
 	int ret;
 
-	page = read_mapping_page(sb->s_bdev->bd_inode->i_mapping, 0, NULL);
+	/* TODO: metadata path in nodev mode */
+	if (sb->s_bdev)
+		page = read_mapping_page(sb->s_bdev->bd_inode->i_mapping, 0, NULL);
+	else
+		page = ERR_PTR(-EOPNOTSUPP);
 	if (IS_ERR(page)) {
 		erofs_err(sb, "cannot read erofs superblock");
 		return PTR_ERR(page);
@@ -633,9 +641,12 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 
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
@@ -644,16 +655,22 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 
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
+	     !dax_supported(sbi->dax_dev, sb->s_bdev, EROFS_BLKSIZ, 0,
+			    bdev_nr_sectors(sb->s_bdev)))) {
 		errorfc(fc, "DAX unsupported by block device. Turning off DAX.");
 		clear_opt(&sbi->opt, DAX_ALWAYS);
 	}
@@ -701,6 +718,10 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 
 static int erofs_fc_get_tree(struct fs_context *fc)
 {
+	struct erofs_fs_context *ctx = fc->fs_private;
+
+	if (ctx->opt.uuid)
+		return get_tree_nodev(fc, erofs_fc_fill_super);
 	return get_tree_bdev(fc, erofs_fc_fill_super);
 }
 
@@ -789,7 +810,10 @@ static void erofs_kill_sb(struct super_block *sb)
 
 	WARN_ON(sb->s_magic != EROFS_SUPER_MAGIC);
 
-	kill_block_super(sb);
+	if (sb->s_bdev)
+		kill_block_super(sb);
+	else
+		generic_shutdown_super(sb);
 
 	sbi = EROFS_SB(sb);
 	if (!sbi)
@@ -889,7 +913,11 @@ static int erofs_statfs(struct dentry *dentry, struct kstatfs *buf)
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

