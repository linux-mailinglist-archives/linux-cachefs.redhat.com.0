Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FB04CFEC0
	for <lists+linux-cachefs@lfdr.de>; Mon,  7 Mar 2022 13:33:50 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-kewUQof4MTq0PAbXs6x-ow-1; Mon, 07 Mar 2022 07:33:46 -0500
X-MC-Unique: kewUQof4MTq0PAbXs6x-ow-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB139101AA45;
	Mon,  7 Mar 2022 12:33:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29BB2401E2C;
	Mon,  7 Mar 2022 12:33:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D1ED019305B9;
	Mon,  7 Mar 2022 12:33:44 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9F5F21931BE9 for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  7 Mar 2022 12:33:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8273B401E2C; Mon,  7 Mar 2022 12:33:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D91740146E
 for <linux-cachefs@redhat.com>; Mon,  7 Mar 2022 12:33:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6453185A5BC
 for <linux-cachefs@redhat.com>; Mon,  7 Mar 2022 12:33:43 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-FEMCM7-HPyWlk2T_oJT0Mg-1; Mon, 07 Mar 2022 07:33:41 -0500
X-MC-Unique: FEMCM7-HPyWlk2T_oJT0Mg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R631e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=15; SR=0; TI=SMTPD_---0V6VlXzk_1646656415
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V6VlXzk_1646656415) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 07 Mar 2022 20:33:36 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon,  7 Mar 2022 20:33:04 +0800
Message-Id: <20220307123305.79520-21-jefflexu@linux.alibaba.com>
In-Reply-To: <20220307123305.79520-1-jefflexu@linux.alibaba.com>
References: <20220307123305.79520-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Linux-cachefs] [PATCH v4 20/21] erofs: implement fscache-based
 data readahead
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
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch implements fscache-based data readahead. Also registers an
individual bdi for each erofs instance to enable readahead.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/fscache.c | 153 +++++++++++++++++++++++++++++++++++++++++++++
 fs/erofs/super.c   |   4 ++
 2 files changed, 157 insertions(+)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 89c533ad965e..19f44ee01852 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -10,6 +10,13 @@ struct erofs_fscache_map {
 	u64 m_llen;
 };
 
+struct erofs_fscahce_ra_ctx {
+	struct readahead_control *rac;
+	struct address_space *mapping;
+	loff_t start;
+	size_t len, done;
+};
+
 static struct fscache_volume *volume;
 
 /*
@@ -199,12 +206,158 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
 	return ret;
 }
 
+static inline size_t erofs_fscache_calc_len(struct erofs_fscahce_ra_ctx *ractx,
+					    struct erofs_fscache_map *fsmap)
+{
+	/*
+	 * 1) For CHUNK_BASED layout, the output m_la is rounded down to the
+	 * nearest chunk boundary, and the output m_llen actually starts from
+	 * the start of the containing chunk.
+	 * 2) For other cases, the output m_la is equal to o_la.
+	 */
+	size_t len = fsmap->m_llen - (fsmap->o_la - fsmap->m_la);
+
+	return min_t(size_t, len, ractx->len - ractx->done);
+}
+
+static inline void erofs_fscache_unlock_pages(struct readahead_control *rac,
+					      size_t len)
+{
+	while (len) {
+		struct page *page = readahead_page(rac);
+
+		SetPageUptodate(page);
+		unlock_page(page);
+		put_page(page);
+
+		len -= PAGE_SIZE;
+	}
+}
+
+static int erofs_fscache_ra_hole(struct erofs_fscahce_ra_ctx *ractx,
+				 struct erofs_fscache_map *fsmap)
+{
+	struct iov_iter iter;
+	loff_t start = ractx->start + ractx->done;
+	size_t length = erofs_fscache_calc_len(ractx, fsmap);
+
+	iov_iter_xarray(&iter, READ, &ractx->mapping->i_pages, start, length);
+	iov_iter_zero(length, &iter);
+
+	erofs_fscache_unlock_pages(ractx->rac, length);
+	return length;
+}
+
+static int erofs_fscache_ra_noinline(struct erofs_fscahce_ra_ctx *ractx,
+				     struct erofs_fscache_map *fsmap)
+{
+	struct fscache_cookie *cookie = fsmap->m_ctx->cookie;
+	loff_t start = ractx->start + ractx->done;
+	size_t length = erofs_fscache_calc_len(ractx, fsmap);
+	loff_t pstart = fsmap->m_pa + (fsmap->o_la - fsmap->m_la);
+	int ret;
+
+	ret = erofs_fscache_read_pages(cookie, ractx->mapping,
+				       start, length, pstart);
+	if (!ret) {
+		erofs_fscache_unlock_pages(ractx->rac, length);
+		ret = length;
+	}
+
+	return ret;
+}
+
+static int erofs_fscache_ra_inline(struct erofs_fscahce_ra_ctx *ractx,
+				   struct erofs_fscache_map *fsmap)
+{
+	struct page *page = readahead_page(ractx->rac);
+	int ret;
+
+	ret = erofs_fscache_readpage_inline(page, fsmap);
+	if (!ret) {
+		SetPageUptodate(page);
+		ret = PAGE_SIZE;
+	}
+
+	unlock_page(page);
+	put_page(page);
+	return ret;
+}
+
+static void erofs_fscache_readahead(struct readahead_control *rac)
+{
+	struct inode *inode = rac->mapping->host;
+	struct erofs_inode *vi = EROFS_I(inode);
+	struct super_block *sb = inode->i_sb;
+	struct erofs_fscahce_ra_ctx ractx;
+	int ret;
+
+	if (erofs_inode_is_data_compressed(vi->datalayout)) {
+		erofs_info(sb, "compressed layout not supported yet");
+		return;
+	}
+
+	if (!readahead_count(rac))
+		return;
+
+	ractx = (struct erofs_fscahce_ra_ctx) {
+		.rac = rac,
+		.mapping = rac->mapping,
+		.start = readahead_pos(rac),
+		.len = readahead_length(rac),
+	};
+
+	do {
+		struct erofs_map_blocks map;
+		struct erofs_fscache_map fsmap;
+
+		map.m_la = fsmap.o_la = ractx.start + ractx.done;
+
+		ret = erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
+		if (ret)
+			return;
+
+		if (!(map.m_flags & EROFS_MAP_MAPPED)) {
+			/*
+			 * Two cases will hit this:
+			 * 1) EOF. Imposibble in readahead routine;
+			 * 2) hole. Only CHUNK_BASED layout supports hole.
+			 */
+			fsmap.m_la   = map.m_la;
+			fsmap.m_llen = map.m_llen;
+			ret = erofs_fscache_ra_hole(&ractx, &fsmap);
+			continue;
+		}
+
+		ret = erofs_fscache_get_map(&fsmap, &map, sb);
+		if (ret)
+			return;
+
+		if (map.m_flags & EROFS_MAP_META) {
+			ret = erofs_fscache_ra_inline(&ractx, &fsmap);
+			continue;
+		}
+
+		switch (vi->datalayout) {
+		case EROFS_INODE_FLAT_PLAIN:
+		case EROFS_INODE_FLAT_INLINE:
+		case EROFS_INODE_CHUNK_BASED:
+			ret = erofs_fscache_ra_noinline(&ractx, &fsmap);
+			break;
+		default:
+			DBG_BUGON(1);
+			return;
+		}
+	} while (ret > 0 && ((ractx.done += ret) < ractx.len));
+}
+
 static const struct address_space_operations erofs_fscache_blob_aops = {
 	.readpage = erofs_fscache_readpage_blob,
 };
 
 const struct address_space_operations erofs_fscache_access_aops = {
 	.readpage = erofs_fscache_readpage,
+	.readahead = erofs_fscache_readahead,
 };
 
 struct page *erofs_fscache_read_cache_page(struct erofs_fscache_context *ctx,
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index f058a04a00c7..2942029a7049 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -616,6 +616,10 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 			return PTR_ERR(bootstrap);
 
 		sbi->bootstrap = bootstrap;
+
+		err = super_setup_bdi(sb);
+		if (err)
+			return err;
 	}
 
 	err = erofs_read_superblock(sb);
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

