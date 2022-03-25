Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EBF4E7314
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Mar 2022 13:23:07 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-3pwIMgWDOQmeDUye2GoMOQ-1; Fri, 25 Mar 2022 08:23:03 -0400
X-MC-Unique: 3pwIMgWDOQmeDUye2GoMOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2ABFC3803925;
	Fri, 25 Mar 2022 12:23:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1EBC840D0166;
	Fri, 25 Mar 2022 12:23:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AAB8D1940352;
	Fri, 25 Mar 2022 12:23:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 150E61940352 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Mar 2022 12:23:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C246D5DF821; Fri, 25 Mar 2022 12:23:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEAA05B498B
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 12:23:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD1DA80419A
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 12:22:59 +0000 (UTC)
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-wJZj1973OLSh0xBeBMO37Q-1; Fri, 25 Mar 2022 08:22:55 -0400
X-MC-Unique: wJZj1973OLSh0xBeBMO37Q-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V89aFtZ_1648210968
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V89aFtZ_1648210968) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 25 Mar 2022 20:22:49 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 25 Mar 2022 20:22:17 +0800
Message-Id: <20220325122223.102958-17-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH v6 16/22] erofs: implement fscache-based
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
Cc: gregkh@linuxfoundation.org, fannaihao@baidu.com, tao.peng@linux.alibaba.com,
 willy@infradead.org, linux-kernel@vger.kernel.org, tianzichen@kuaishou.com,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implements the data plane of reading metadata from bootstrap blob file
over fscache.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/data.c     | 17 +++++++++++++++--
 fs/erofs/fscache.c  | 34 ++++++++++++++++++++++++++++++++++
 fs/erofs/internal.h |  8 ++++++++
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index 6e2a28242453..b4571bea93d5 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -31,15 +31,28 @@ void erofs_put_metabuf(struct erofs_buf *buf)
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
+		if (IS_ENABLED(CONFIG_EROFS_FS_ONDEMAND) &&
+		    erofs_is_nodev_mode(sb)) {
+			struct folio *folio;
+
+			folio = erofs_fscache_get_folio(sbi->bootstrap, index);
+			if (IS_ERR(folio))
+				page = (struct page *)folio;
+			else
+				page = folio_page(folio, 0);
+		} else {
+			mapping = sb->s_bdev->bd_inode->i_mapping;
+			page = read_cache_page_gfp(mapping, index,
 				mapping_gfp_constraint(mapping, ~__GFP_FS));
+		}
 		if (IS_ERR(page))
 			return page;
 		/* should already be PageUptodate, no need to lock page */
diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 6a55f7b5f883..91377939b4f7 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -46,9 +46,43 @@ static inline int erofs_fscache_read_folio(struct fscache_cookie *cookie,
 					 pstart);
 }
 
+static int erofs_fscache_readpage_blob(struct file *data, struct page *page)
+{
+	int ret;
+	struct erofs_fscache *ctx = (struct erofs_fscache *)data;
+	struct folio *folio = page_folio(page);
+
+	ret = erofs_fscache_read_folio(ctx->cookie, folio, folio_pos(folio));
+	if (!ret)
+		folio_mark_uptodate(folio);
+
+	folio_unlock(folio);
+	return ret;
+}
+
 static const struct address_space_operations erofs_fscache_blob_aops = {
+	.readpage = erofs_fscache_readpage_blob,
 };
 
+/*
+ * erofs_fscache_get_folio - find and read page cache of blob file
+ * @ctx:	the context of the blob file
+ * @index:	the page index
+ *
+ * Get the page cache of the blob file at the index offset. It will find the
+ * page through the address space of the anonymous inode. This function is only
+ * used to read page cache of bootstrap blob file (metadata), since currently
+ * only bootstrap blob file manages an anonymous inode inside the fscache
+ * context.
+ *
+ * Return: up to date page on success, ERR_PTR() on failure.
+ */
+struct folio *erofs_fscache_get_folio(struct erofs_fscache *ctx, pgoff_t index)
+{
+	DBG_BUGON(!ctx->inode);
+	return read_mapping_folio(ctx->inode->i_mapping, index, ctx);
+}
+
 static int erofs_fscache_init_cookie(struct erofs_fscache *ctx, char *path)
 {
 	struct fscache_cookie *cookie;
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index d8c886a7491e..fa89a1e3012f 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -632,6 +632,8 @@ void erofs_exit_fscache(void);
 struct erofs_fscache *erofs_fscache_get(struct super_block *sb, char *path,
 					bool need_inode);
 void erofs_fscache_put(struct erofs_fscache *ctx);
+
+struct folio *erofs_fscache_get_folio(struct erofs_fscache *ctx, pgoff_t index);
 #else
 static inline int erofs_init_fscache(void) { return 0; }
 static inline void erofs_exit_fscache(void) {}
@@ -643,6 +645,12 @@ static inline struct erofs_fscache *erofs_fscache_get(struct super_block *sb,
 	return ERR_PTR(-EOPNOTSUPP);
 }
 static inline void erofs_fscache_put(struct erofs_fscache *ctx) {}
+
+static inline struct folio *erofs_fscache_get_folio(struct erofs_fscache *ctx,
+						    pgoff_t index)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
 #endif
 
 #define EFSCORRUPTED    EUCLEAN         /* Filesystem is corrupted */
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

