Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 838F04926B4
	for <lists+linux-cachefs@lfdr.de>; Tue, 18 Jan 2022 14:13:03 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-gCbGWT-LPdqwlrsuMgncIQ-1; Tue, 18 Jan 2022 08:12:48 -0500
X-MC-Unique: gCbGWT-LPdqwlrsuMgncIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44B4A760C9;
	Tue, 18 Jan 2022 13:12:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D0657E11B;
	Tue, 18 Jan 2022 13:12:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C7911806D03;
	Tue, 18 Jan 2022 13:12:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IDChvU010162 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 08:12:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 220D1400E13A; Tue, 18 Jan 2022 13:12:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DF3940D1B9E
	for <linux-cachefs@redhat.com>; Tue, 18 Jan 2022 13:12:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 074A185A5B5
	for <linux-cachefs@redhat.com>; Tue, 18 Jan 2022 13:12:43 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
	(out30-130.freemail.mail.aliyun.com [115.124.30.130]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-245-DsRUMSZXPXqyYJj1hpkkBQ-1; Tue, 18 Jan 2022 08:12:39 -0500
X-MC-Unique: DsRUMSZXPXqyYJj1hpkkBQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V2C1oyi_1642511554
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V2C1oyi_1642511554) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 18 Jan 2022 21:12:35 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Tue, 18 Jan 2022 21:12:11 +0800
Message-Id: <20220118131216.85338-16-jefflexu@linux.alibaba.com>
In-Reply-To: <20220118131216.85338-1-jefflexu@linux.alibaba.com>
References: <20220118131216.85338-1-jefflexu@linux.alibaba.com>
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
Subject: [Linux-cachefs] [PATCH v2 15/20] erofs: implement fscache-based
	data read for non-inline layout
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 fs/erofs/fscache.c  | 111 ++++++++++++++++++++++++++++++++++++++++++++
 fs/erofs/inode.c    |   6 ++-
 fs/erofs/internal.h |   1 +
 3 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 5a25ae523e5e..588c33ab6a90 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -4,6 +4,17 @@
  */
 #include "internal.h"
 
+struct erofs_fscache_map {
+	struct erofs_fscache_context *m_ctx;
+	erofs_off_t m_pa, m_la, o_la;
+	u64 m_llen;
+};
+
+struct erofs_fscache_priv {
+	struct fscache_cookie *cookie;
+	loff_t offset;
+};
+
 static struct fscache_volume *volume;
 
 static int erofs_blob_begin_cache_operation(struct netfs_read_request *rreq)
@@ -22,6 +33,33 @@ static const struct netfs_read_request_ops erofs_blob_req_ops = {
 	.cleanup		= erofs_noop_cleanup,
 };
 
+static int erofs_begin_cache_operation(struct netfs_read_request *rreq)
+{
+	struct erofs_fscache_priv *priv = rreq->netfs_priv;
+
+	rreq->p_start = priv->offset;
+	return fscache_begin_read_operation(&rreq->cache_resources,
+					    priv->cookie);
+}
+
+static bool erofs_clamp_length(struct netfs_read_subrequest *subreq)
+{
+	/*
+	 * For non-inline layout, rreq->i_size is actually the size of upper
+	 * file in erofs rather than that of blob file. Thus when cache miss,
+	 * subreq->len can be restricted to the upper file size, while we hope
+	 * blob file can be filled in a EROFS_BLKSIZ granule.
+	 */
+	subreq->len = round_up(subreq->len, EROFS_BLKSIZ);
+	return true;
+}
+
+static const struct netfs_read_request_ops erofs_req_ops = {
+	.begin_cache_operation  = erofs_begin_cache_operation,
+	.cleanup		= erofs_noop_cleanup,
+	.clamp_length		= erofs_clamp_length,
+};
+
 static int erofs_fscache_blob_readpage(struct file *data, struct page *page)
 {
 	struct folio *folio = page_folio(page);
@@ -42,6 +80,79 @@ struct page *erofs_fscache_read_cache_page(struct erofs_fscache_context *ctx,
 	return read_mapping_page(ctx->inode->i_mapping, index, ctx);
 }
 
+static int erofs_fscache_readpage_noinline(struct page *page,
+					   struct erofs_fscache_map *fsmap)
+{
+	struct folio *folio = page_folio(page);
+	struct erofs_fscache_priv priv;
+
+	/*
+	 * 1) For FLAT_PLAIN layout, the output map.m_la shall be equal to o_la,
+	 * and the output map.m_pa is exactly the physical address of o_la.
+	 * 2) For CHUNK_BASED layout, the output map.m_la is rounded down to the
+	 * nearest chunk boundary, and the output map.m_pa is actually the
+	 * physical address of this chunk boundary. So we need to recalculate
+	 * the actual physical address of o_la.
+	 */
+	priv.offset = fsmap->m_pa + fsmap->o_la - fsmap->m_la;
+	priv.cookie = fsmap->m_ctx->cookie;
+
+	return netfs_readpage(NULL, folio, &erofs_req_ops, &priv);
+}
+
+static int erofs_fscache_readpage(struct file *file, struct page *page)
+{
+	struct inode *inode = page->mapping->host;
+	struct erofs_inode *vi = EROFS_I(inode);
+	struct super_block *sb = inode->i_sb;
+	struct erofs_sb_info *sbi = EROFS_SB(sb);
+	struct erofs_map_blocks map;
+	struct erofs_fscache_map fsmap;
+	int ret;
+
+	if (erofs_inode_is_data_compressed(vi->datalayout)) {
+		erofs_info(sb, "compressed layout not supported yet");
+		ret = -EOPNOTSUPP;
+		goto err_out;
+	}
+
+	map.m_la = fsmap.o_la = page_offset(page);
+
+	ret = erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
+	if (ret)
+		goto err_out;
+
+	if (!(map.m_flags & EROFS_MAP_MAPPED)) {
+		zero_user(page, 0, PAGE_SIZE);
+		SetPageUptodate(page);
+		unlock_page(page);
+		return 0;
+	}
+
+	fsmap.m_ctx  = sbi->bootstrap;
+	fsmap.m_la   = map.m_la;
+	fsmap.m_pa   = map.m_pa;
+	fsmap.m_llen = map.m_llen;
+
+	switch (vi->datalayout) {
+	case EROFS_INODE_FLAT_PLAIN:
+	case EROFS_INODE_CHUNK_BASED:
+		return erofs_fscache_readpage_noinline(page, &fsmap);
+	default:
+		DBG_BUGON(1);
+		ret = -EOPNOTSUPP;
+	}
+
+err_out:
+	SetPageError(page);
+	unlock_page(page);
+	return ret;
+}
+
+const struct address_space_operations erofs_fscache_access_aops = {
+	.readpage = erofs_fscache_readpage,
+};
+
 static int erofs_fscache_init_cookie(struct erofs_fscache_context *ctx,
 				     char *path)
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
index fca706cfaf72..548f928b0ded 100644
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

