Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB15047FCE4
	for <lists+linux-cachefs@lfdr.de>; Mon, 27 Dec 2021 13:55:17 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-XXRkTDl1MZK4HF1AL7rX0Q-1; Mon, 27 Dec 2021 07:55:13 -0500
X-MC-Unique: XXRkTDl1MZK4HF1AL7rX0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D6E681CCB5;
	Mon, 27 Dec 2021 12:55:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D90D7B6C6;
	Mon, 27 Dec 2021 12:55:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4A1E180BAD1;
	Mon, 27 Dec 2021 12:55:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BRCt7ei003102 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 27 Dec 2021 07:55:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D928440D2969; Mon, 27 Dec 2021 12:55:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D49BF40D1B9F
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 12:55:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBFEC811E78
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 12:55:07 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
	(out30-130.freemail.mail.aliyun.com [115.124.30.130]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-435-vRnYLo0GOJektng69jAWvw-1; Mon, 27 Dec 2021 07:55:03 -0500
X-MC-Unique: vRnYLo0GOJektng69jAWvw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V.vxTJW_1640609698
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V.vxTJW_1640609698) by smtp.aliyun-inc.com(127.0.0.1);
	Mon, 27 Dec 2021 20:54:59 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon, 27 Dec 2021 20:54:33 +0800
Message-Id: <20211227125444.21187-13-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [PATCH v1 12/23] erofs: implement fscache-based
	metadata read
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

This patch implements the data plane of reading metadata from bootstrap
blob file over fscache.

Be noted that currently it only supports the scenario where the backing
file has no hole. Once it hits a hole of the backing file, erofs will
fail the IO with -EOPNOTSUPP for now. The following patch will fix this
issue, i.e. implementing the demand reading mode.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/data.c     |  4 +--
 fs/erofs/fscache.c  | 59 +++++++++++++++++++++++++++++++++++++++++++++
 fs/erofs/internal.h |  3 +++
 fs/erofs/super.c    |  7 ++----
 4 files changed, 66 insertions(+), 7 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index 61fa431d0713..f0857c285fac 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -19,8 +19,8 @@ struct page *erofs_get_meta_page(struct super_block *sb, erofs_blk_t blkaddr)
 		page = read_cache_page_gfp(mapping, blkaddr,
 				mapping_gfp_constraint(mapping, ~__GFP_FS));
 	} else {
-		/* TODO: data path in nodev mode */
-		page = ERR_PTR(-EINVAL);
+		page = erofs_readpage_from_fscache(EROFS_SB(sb)->bootstrap,
+						   blkaddr);
 	}
 
 	/* should already be PageUptodate */
diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 4dfca7c95710..325f5663836b 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -6,6 +6,65 @@
 
 static struct fscache_volume *volume;
 
+static int erofs_begin_cache_operation(struct netfs_read_request *rreq)
+{
+	return fscache_begin_read_operation(&rreq->cache_resources,
+					    rreq->netfs_priv);
+}
+
+static void erofs_priv_cleanup(struct address_space *mapping, void *netfs_priv)
+{
+}
+
+static void erofs_issue_op(struct netfs_read_subrequest *subreq)
+{
+	/*
+	 * TODO: implement demand-read logic later.
+	 * We rely on user daemon to prepare blob files under corresponding
+	 * directory, and we can reach here if blob files don't exist.
+	 */
+
+	netfs_subreq_terminated(subreq, -EOPNOTSUPP, false);
+}
+
+const struct netfs_read_request_ops erofs_req_ops = {
+	.begin_cache_operation  = erofs_begin_cache_operation,
+	.cleanup		= erofs_priv_cleanup,
+	.issue_op		= erofs_issue_op,
+};
+
+struct page *erofs_readpage_from_fscache(struct erofs_cookie_ctx *ctx,
+					 pgoff_t index)
+{
+	struct folio *folio;
+	struct page *page;
+	struct super_block *sb = ctx->inode->i_sb;
+	int ret;
+
+	page = find_or_create_page(ctx->inode->i_mapping, index, GFP_KERNEL);
+	if (unlikely(!page)) {
+		erofs_err(sb, "failed to allocate page");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/* The content is already buffered in the address space */
+	if (PageUptodate(page)) {
+		unlock_page(page);
+		return page;
+	}
+
+	/* Or a new page cache is created, then read the content from fscache */
+	folio = page_folio(page);
+
+	ret = netfs_readpage(NULL, folio, &erofs_req_ops, ctx->cookie);
+	if (unlikely(ret || !PageUptodate(page))) {
+		erofs_err(sb, "failed to read from fscache");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return page;
+}
+
 static int erofs_fscache_init_cookie(struct erofs_cookie_ctx *ctx, char *path)
 {
 	struct fscache_cookie *cookie;
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 4ee4ff6774ba..10fb7ef26ddf 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -585,6 +585,9 @@ struct erofs_cookie_ctx *erofs_fscache_get_ctx(struct super_block *sb,
 					       char *path);
 void erofs_fscache_put_ctx(struct erofs_cookie_ctx *ctx);
 
+struct page *erofs_readpage_from_fscache(struct erofs_cookie_ctx *ctx,
+					 pgoff_t index);
+
 #define EFSCORRUPTED    EUCLEAN         /* Filesystem is corrupted */
 
 #endif	/* __EROFS_INTERNAL_H */
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 141cabd01d32..0e5964d8b24b 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -334,25 +334,22 @@ static int erofs_init_devices(struct super_block *sb,
 
 static int erofs_read_superblock(struct super_block *sb)
 {
-	struct erofs_sb_info *sbi;
+	struct erofs_sb_info *sbi = EROFS_SB(sb);
 	struct page *page;
 	struct erofs_super_block *dsb;
 	unsigned int blkszbits;
 	void *data;
 	int ret;
 
-	/* TODO: metadata path in nodev mode */
 	if (sb->s_bdev)
 		page = read_mapping_page(sb->s_bdev->bd_inode->i_mapping, 0, NULL);
 	else
-		page = ERR_PTR(-EOPNOTSUPP);
+		page = erofs_readpage_from_fscache(sbi->bootstrap, 0);
 	if (IS_ERR(page)) {
 		erofs_err(sb, "cannot read erofs superblock");
 		return PTR_ERR(page);
 	}
 
-	sbi = EROFS_SB(sb);
-
 	data = kmap(page);
 	dsb = (struct erofs_super_block *)(data + EROFS_SUPER_OFFSET);
 
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

