Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 079CC46FBC1
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 08:37:02 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-Rbu9YxxRMfiGSvsLkEu0OA-1; Fri, 10 Dec 2021 02:36:58 -0500
X-MC-Unique: Rbu9YxxRMfiGSvsLkEu0OA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8714F81CCB7;
	Fri, 10 Dec 2021 07:36:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B028604CC;
	Fri, 10 Dec 2021 07:36:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B5FC1809CBA;
	Fri, 10 Dec 2021 07:36:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BA7ak0i027917 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 10 Dec 2021 02:36:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1F97B2026D60; Fri, 10 Dec 2021 07:36:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B99E2026D46
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0285E811E76
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:46 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
	(out30-56.freemail.mail.aliyun.com [115.124.30.56]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-191-0JcvJb9pO5uKw015ynOaww-1; Fri, 10 Dec 2021 02:36:42 -0500
X-MC-Unique: 0JcvJb9pO5uKw015ynOaww-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V-8E0RZ_1639121797
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V-8E0RZ_1639121797) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 10 Dec 2021 15:36:38 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 10 Dec 2021 15:36:15 +0800
Message-Id: <20211210073619.21667-16-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [RFC 15/19] erofs: implement fscache-based metadata
	read
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

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/data.c     |  5 +++--
 fs/erofs/fscache.c  | 45 +++++++++++++++++++++++++++++++++++++++++++++
 fs/erofs/internal.h |  3 +++
 fs/erofs/super.c    | 10 ++++++----
 4 files changed, 57 insertions(+), 6 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index cf71082bd52f..47bd3d0ae94c 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -12,6 +12,7 @@
 struct page *erofs_get_meta_page(struct super_block *sb, erofs_blk_t blkaddr)
 {
 	struct address_space * mapping;
+	struct erofs_sb_info *sbi;
 	struct page *page;
 
 	if (sb->s_bdev) {
@@ -19,8 +20,8 @@ struct page *erofs_get_meta_page(struct super_block *sb, erofs_blk_t blkaddr)
 		page = read_cache_page_gfp(mapping, blkaddr,
 				mapping_gfp_constraint(mapping, ~__GFP_FS));
 	} else {
-		/* TODO: fscache based data path */
-		page = ERR_PTR(-EINVAL);
+		sbi = EROFS_SB(sb);
+		page = erofs_readpage_from_fscache(sbi->bootstrap, blkaddr);
 	}
 
 	/* should already be PageUptodate */
diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index cf550fdedd1e..6fe31d410cbd 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -1,5 +1,50 @@
 #include "internal.h"
 
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
+const struct netfs_read_request_ops erofs_req_ops = {
+	.begin_cache_operation  = erofs_begin_cache_operation,
+	.cleanup		= erofs_priv_cleanup,
+};
+
+struct page *erofs_readpage_from_fscache(struct fscache_cookie *cookie,
+					 pgoff_t index)
+{
+	int ret = -ENOMEM;
+	struct folio *folio;
+	struct page *page;
+
+	page = alloc_page(GFP_KERNEL);
+	if (unlikely(!page)) {
+		printk("failed to allocate page\n");
+		goto err;
+	}
+
+	page->index = index;
+	folio = page_folio(page);
+
+	ret = netfs_readpage_demand(folio, &erofs_req_ops, cookie);
+	if (unlikely(ret || !PageUptodate(page))) {
+		printk("failed to read from fscache\n");
+		goto err_page;
+	}
+
+	return page;
+
+err_page:
+	__free_page(page);
+err:
+	return ERR_PTR(ret);
+}
+
 int erofs_fscache_init(struct erofs_sb_info *sbi, char *bootstrap_path)
 {
 	sbi->volume = fscache_acquire_volume("erofs", NULL, 0);
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 8136ec63a9de..d60d9ffaef2a 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -577,6 +577,9 @@ static inline int z_erofs_load_lzma_config(struct super_block *sb,
 int erofs_fscache_init(struct erofs_sb_info *sbi, char *bootstrap_path);
 void erofs_fscache_cleanup(struct erofs_sb_info *sbi);
 
+struct page *erofs_readpage_from_fscache(struct fscache_cookie *cookie,
+					 pgoff_t index);
+
 #define EFSCORRUPTED    EUCLEAN         /* Filesystem is corrupted */
 
 #endif	/* __EROFS_INTERNAL_H */
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index f2a5f4cd53fd..bb68bc81a1a7 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -330,21 +330,23 @@ static int erofs_init_devices(struct super_block *sb,
 
 static int erofs_read_superblock(struct super_block *sb)
 {
-	struct erofs_sb_info *sbi;
+	struct erofs_sb_info *sbi = EROFS_SB(sb);
 	struct page *page;
 	struct erofs_super_block *dsb;
 	unsigned int blkszbits;
 	void *data;
 	int ret;
 
-	page = read_mapping_page(sb->s_bdev->bd_inode->i_mapping, 0, NULL);
+	if (sb->s_bdev)
+		page = read_mapping_page(sb->s_bdev->bd_inode->i_mapping, 0, NULL);
+	else
+		page = erofs_readpage_from_fscache(sbi->bootstrap, 0);
+
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

