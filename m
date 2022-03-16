Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8144DB0FF
	for <lists+linux-cachefs@lfdr.de>; Wed, 16 Mar 2022 14:18:04 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-62ZtOT1UOjy9ghPgEVZ9zQ-1; Wed, 16 Mar 2022 09:18:00 -0400
X-MC-Unique: 62ZtOT1UOjy9ghPgEVZ9zQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48EDD381AA06;
	Wed, 16 Mar 2022 13:18:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C130401E47;
	Wed, 16 Mar 2022 13:18:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F2FB91940359;
	Wed, 16 Mar 2022 13:17:59 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8B5C619451ED for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 16 Mar 2022 13:17:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6CE4F400E54B; Wed, 16 Mar 2022 13:17:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68D2640CFD10
 for <linux-cachefs@redhat.com>; Wed, 16 Mar 2022 13:17:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52C391C04B46
 for <linux-cachefs@redhat.com>; Wed, 16 Mar 2022 13:17:58 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-qB_LJcA2PyeHVfmy7ZZauQ-1; Wed, 16 Mar 2022 09:17:54 -0400
X-MC-Unique: qB_LJcA2PyeHVfmy7ZZauQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R671e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=16; SR=0; TI=SMTPD_---0V7NEPrX_1647436668
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V7NEPrX_1647436668) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 16 Mar 2022 21:17:49 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Wed, 16 Mar 2022 21:17:18 +0800
Message-Id: <20220316131723.111553-18-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Linux-cachefs] [PATCH v5 17/22] erofs: implement fscache-based
 data read for non-inline layout
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

This patch implements the data plane of reading data from bootstrap blob
file over fscache for non-inline layout.

Be noted that compressed layout is not supported yet.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/fscache.c  | 94 +++++++++++++++++++++++++++++++++++++++++++++
 fs/erofs/inode.c    |  6 ++-
 fs/erofs/internal.h |  1 +
 3 files changed, 100 insertions(+), 1 deletion(-)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 654414aa87ad..df56562f33c4 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -4,6 +4,12 @@
  */
 #include "internal.h"
 
+struct erofs_fscache_map {
+	struct erofs_fscache_context *m_ctx;
+	erofs_off_t m_pa, m_la, o_la;
+	u64 m_llen;
+};
+
 static struct fscache_volume *volume;
 
 /*
@@ -60,10 +66,98 @@ static int erofs_fscache_readpage_blob(struct file *data, struct page *page)
 	return ret;
 }
 
+static inline int erofs_fscache_get_map(struct erofs_fscache_map *fsmap,
+					struct erofs_map_blocks *map,
+					struct super_block *sb)
+{
+	struct erofs_sb_info *sbi = EROFS_SB(sb);
+
+	fsmap->m_ctx  = sbi->bootstrap;
+	fsmap->m_la   = map->m_la;
+	fsmap->m_pa   = map->m_pa;
+	fsmap->m_llen = map->m_llen;
+
+	return 0;
+}
+
+static int erofs_fscache_readpage_noinline(struct page *page,
+					   struct erofs_fscache_map *fsmap)
+{
+	struct fscache_cookie *cookie = fsmap->m_ctx->cookie;
+	/*
+	 * 1) For FLAT_PLAIN layout, the output map.m_la shall be equal to o_la,
+	 * and the output map.m_pa is exactly the physical address of o_la.
+	 * 2) For CHUNK_BASED layout, the output map.m_la is rounded down to the
+	 * nearest chunk boundary, and the output map.m_pa is actually the
+	 * physical address of this chunk boundary. So we need to recalculate
+	 * the actual physical address of o_la.
+	 */
+	loff_t start = fsmap->m_pa + (fsmap->o_la - fsmap->m_la);
+
+	return erofs_fscache_read_page(cookie, page, start);
+}
+
+static int erofs_fscache_do_readpage(struct page *page)
+{
+	struct inode *inode = page->mapping->host;
+	struct erofs_inode *vi = EROFS_I(inode);
+	struct super_block *sb = inode->i_sb;
+	struct erofs_map_blocks map;
+	struct erofs_fscache_map fsmap;
+	int ret;
+
+	if (erofs_inode_is_data_compressed(vi->datalayout)) {
+		erofs_info(sb, "compressed layout not supported yet");
+		return -EOPNOTSUPP;
+	}
+
+	map.m_la = fsmap.o_la = page_offset(page);
+
+	ret = erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
+	if (ret)
+		return ret;
+
+	if (!(map.m_flags & EROFS_MAP_MAPPED)) {
+		zero_user(page, 0, PAGE_SIZE);
+		return 0;
+	}
+
+	ret = erofs_fscache_get_map(&fsmap, &map, sb);
+	if (ret)
+		return ret;
+
+	switch (vi->datalayout) {
+	case EROFS_INODE_FLAT_PLAIN:
+	case EROFS_INODE_CHUNK_BASED:
+		return erofs_fscache_readpage_noinline(page, &fsmap);
+	default:
+		DBG_BUGON(1);
+		return -EOPNOTSUPP;
+	}
+}
+
+static int erofs_fscache_readpage(struct file *file, struct page *page)
+{
+	int ret;
+
+	ret = erofs_fscache_do_readpage(page);
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
 	.readpage = erofs_fscache_readpage_blob,
 };
 
+const struct address_space_operations erofs_fscache_access_aops = {
+	.readpage = erofs_fscache_readpage,
+};
+
 struct page *erofs_fscache_read_cache_page(struct erofs_fscache_context *ctx,
 					   pgoff_t index)
 {
diff --git a/fs/erofs/inode.c b/fs/erofs/inode.c
index ff62f84f47d3..2f450cb3a7b9 100644
--- a/fs/erofs/inode.c
+++ b/fs/erofs/inode.c
@@ -296,7 +296,11 @@ static int erofs_fill_inode(struct inode *inode, int isdir)
 		err = z_erofs_fill_inode(inode);
 		goto out_unlock;
 	}
-	inode->i_mapping->a_ops = &erofs_raw_access_aops;
+
+	if (erofs_bdev_mode(inode->i_sb))
+		inode->i_mapping->a_ops = &erofs_raw_access_aops;
+	else
+		inode->i_mapping->a_ops = &erofs_fscache_access_aops;
 
 out_unlock:
 	erofs_put_metabuf(&buf);
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 35e7c330e59e..f94a921eff98 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -393,6 +393,7 @@ struct page *erofs_grab_cache_page_nowait(struct address_space *mapping,
 extern const struct super_operations erofs_sops;
 
 extern const struct address_space_operations erofs_raw_access_aops;
+extern const struct address_space_operations erofs_fscache_access_aops;
 extern const struct address_space_operations z_erofs_aops;
 
 /*
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

