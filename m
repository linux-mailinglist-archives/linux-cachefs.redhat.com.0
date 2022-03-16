Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB944DB127
	for <lists+linux-cachefs@lfdr.de>; Wed, 16 Mar 2022 14:18:56 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-ijQ596ozNx2o5X1iHlu2_w-1; Wed, 16 Mar 2022 09:18:52 -0400
X-MC-Unique: ijQ596ozNx2o5X1iHlu2_w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEF6180281D;
	Wed, 16 Mar 2022 13:18:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E287E401E60;
	Wed, 16 Mar 2022 13:18:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8F34A193F517;
	Wed, 16 Mar 2022 13:18:51 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8EC8519451ED for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 16 Mar 2022 13:17:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 83C8AC44AE6; Wed, 16 Mar 2022 13:17:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F9F9C44AE3
 for <linux-cachefs@redhat.com>; Wed, 16 Mar 2022 13:17:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66CE33C23FAF
 for <linux-cachefs@redhat.com>; Wed, 16 Mar 2022 13:17:57 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-mRSJYJH0O-SF_nxAyGbsqA-1; Wed, 16 Mar 2022 09:17:53 -0400
X-MC-Unique: mRSJYJH0O-SF_nxAyGbsqA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=16; SR=0; TI=SMTPD_---0V7NEPrI_1647436667
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V7NEPrI_1647436667) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 16 Mar 2022 21:17:48 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Wed, 16 Mar 2022 21:17:17 +0800
Message-Id: <20220316131723.111553-17-jefflexu@linux.alibaba.com>
In-Reply-To: <20220316131723.111553-1-jefflexu@linux.alibaba.com>
References: <20220316131723.111553-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Linux-cachefs] [PATCH v5 16/22] erofs: implement fscache-based
 metadata read
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
Cc: gregkh@linuxfoundation.org, tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
 luodaowen.backend@bytedance.com, eguan@linux.alibaba.com,
 gerry@linux.alibaba.com, torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch implements the data plane of reading metadata from bootstrap
blob file over fscache.

Be noted that currently it only supports the scenario where the backing
file has no hole. Once it hits a hole of the backing file, erofs will
fail the IO with -EOPNOTSUPP for now. The following patch will fix this
issue, i.e. implementing the demand reading mode.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/data.c     | 11 +++++++++--
 fs/erofs/fscache.c  | 24 ++++++++++++++++++++++++
 fs/erofs/internal.h |  3 +++
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index 6e2a28242453..1bff99576883 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -31,15 +31,22 @@ void erofs_put_metabuf(struct erofs_buf *buf)
 void *erofs_read_metabuf(struct erofs_buf *buf, struct super_block *sb,
 			erofs_blk_t blkaddr, enum erofs_kmap_type type)
 {
-	struct address_space *const mapping = sb->s_bdev->bd_inode->i_mapping;
+	struct address_space *mapping;
+	struct erofs_sb_info *sbi = EROFS_SB(sb);
 	erofs_off_t offset = blknr_to_addr(blkaddr);
 	pgoff_t index = offset >> PAGE_SHIFT;
 	struct page *page = buf->page;
 
 	if (!page || page->index != index) {
 		erofs_put_metabuf(buf);
-		page = read_cache_page_gfp(mapping, index,
+		if (erofs_bdev_mode(sb)) {
+			mapping = sb->s_bdev->bd_inode->i_mapping;
+			page = read_cache_page_gfp(mapping, index,
 				mapping_gfp_constraint(mapping, ~__GFP_FS));
+		} else {
+			page = erofs_fscache_read_cache_page(sbi->bootstrap,
+				index);
+		}
 		if (IS_ERR(page))
 			return page;
 		/* should already be PageUptodate, no need to lock page */
diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 38b5a9380092..654414aa87ad 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -44,9 +44,33 @@ static inline int erofs_fscache_read_page(struct fscache_cookie *cookie,
 					page_offset(page), PAGE_SIZE, pstart);
 }
 
+static int erofs_fscache_readpage_blob(struct file *data, struct page *page)
+{
+	int ret;
+	struct erofs_fscache_context *ctx =
+		(struct erofs_fscache_context *)data;
+
+	ret = erofs_fscache_read_page(ctx->cookie, page, page_offset(page));
+	if (!ret)
+		SetPageUptodate(page);
+	else
+		SetPageError(page);
+
+	unlock_page(page);
+	return ret;
+}
+
 static const struct address_space_operations erofs_fscache_blob_aops = {
+	.readpage = erofs_fscache_readpage_blob,
 };
 
+struct page *erofs_fscache_read_cache_page(struct erofs_fscache_context *ctx,
+					   pgoff_t index)
+{
+	DBG_BUGON(!ctx->inode);
+	return read_mapping_page(ctx->inode->i_mapping, index, ctx);
+}
+
 static int erofs_fscache_init_cookie(struct erofs_fscache_context *ctx,
 				     char *path)
 {
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index cce39339c08e..35e7c330e59e 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -633,6 +633,9 @@ struct erofs_fscache_context *erofs_fscache_get_ctx(struct super_block *sb,
 						char *path, bool need_inode);
 void erofs_fscache_put_ctx(struct erofs_fscache_context *ctx);
 
+struct page *erofs_fscache_read_cache_page(struct erofs_fscache_context *ctx,
+					   pgoff_t index);
+
 #define EFSCORRUPTED    EUCLEAN         /* Filesystem is corrupted */
 
 #endif	/* __EROFS_INTERNAL_H */
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

