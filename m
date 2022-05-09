Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2C151F585
	for <lists+linux-cachefs@lfdr.de>; Mon,  9 May 2022 09:41:25 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-62Ym_pnTPsuWZQfFX8mblw-1; Mon, 09 May 2022 03:41:23 -0400
X-MC-Unique: 62Ym_pnTPsuWZQfFX8mblw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 027EB80A0B9;
	Mon,  9 May 2022 07:41:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB3F02166B2F;
	Mon,  9 May 2022 07:41:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BFCCB1947055;
	Mon,  9 May 2022 07:41:22 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 457621947042 for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  9 May 2022 07:41:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 26AE22166B4B; Mon,  9 May 2022 07:41:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 227842166B4A
 for <linux-cachefs@redhat.com>; Mon,  9 May 2022 07:41:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D536B29AB3EA
 for <linux-cachefs@redhat.com>; Mon,  9 May 2022 07:41:08 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-LlZM88dKMDWMw5AFiuJutw-1; Mon, 09 May 2022 03:41:05 -0400
X-MC-Unique: LlZM88dKMDWMw5AFiuJutw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R711e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=20; SR=0; TI=SMTPD_---0VCfUcRK_1652082058
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VCfUcRK_1652082058) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 09 May 2022 15:40:59 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon,  9 May 2022 15:40:25 +0800
Message-Id: <20220509074028.74954-20-jefflexu@linux.alibaba.com>
In-Reply-To: <20220509074028.74954-1-jefflexu@linux.alibaba.com>
References: <20220509074028.74954-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH v11 19/22] erofs: implement fscache-based
 data read for inline layout
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
Cc: zhujia.zj@bytedance.com, gregkh@linuxfoundation.org,
 tao.peng@linux.alibaba.com, willy@infradead.org, linux-kernel@vger.kernel.org,
 tianzichen@kuaishou.com, joseph.qi@linux.alibaba.com,
 zhangjiachen.jaycee@bytedance.com, bo.liu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org, yinxin.x@bytedance.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement the data plane of reading data from data blobs over fscache
for inline layout.

For the heading non-inline part, the data plane for non-inline layout is
reused, while only the tail packing part needs special handling.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/fscache.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index b3af72af7c88..5b779812a5ee 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -83,6 +83,33 @@ static int erofs_fscache_meta_readpage(struct file *data, struct page *page)
 	return ret;
 }
 
+static int erofs_fscache_readpage_inline(struct folio *folio,
+					 struct erofs_map_blocks *map)
+{
+	struct super_block *sb = folio_mapping(folio)->host->i_sb;
+	struct erofs_buf buf = __EROFS_BUF_INITIALIZER;
+	erofs_blk_t blknr;
+	size_t offset, len;
+	void *src, *dst;
+
+	/* For tail packing layout, the offset may be non-zero. */
+	offset = erofs_blkoff(map->m_pa);
+	blknr = erofs_blknr(map->m_pa);
+	len = map->m_llen;
+
+	src = erofs_read_metabuf(&buf, sb, blknr, EROFS_KMAP);
+	if (IS_ERR(src))
+		return PTR_ERR(src);
+
+	dst = kmap_local_folio(folio, 0);
+	memcpy(dst, src + offset, len);
+	memset(dst + len, 0, PAGE_SIZE - len);
+	kunmap_local(dst);
+
+	erofs_put_metabuf(&buf);
+	return 0;
+}
+
 static int erofs_fscache_readpage(struct file *file, struct page *page)
 {
 	struct folio *folio = page_folio(page);
@@ -108,6 +135,11 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
 		goto out_uptodate;
 	}
 
+	if (map.m_flags & EROFS_MAP_META) {
+		ret = erofs_fscache_readpage_inline(folio, &map);
+		goto out_uptodate;
+	}
+
 	mdev = (struct erofs_map_dev) {
 		.m_deviceid = map.m_deviceid,
 		.m_pa = map.m_pa,
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

