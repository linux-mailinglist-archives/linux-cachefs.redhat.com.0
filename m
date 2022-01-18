Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6503D4926C3
	for <lists+linux-cachefs@lfdr.de>; Tue, 18 Jan 2022 14:13:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-3GNhosksMhKRQF1OfwnGvQ-1; Tue, 18 Jan 2022 08:13:18 -0500
X-MC-Unique: 3GNhosksMhKRQF1OfwnGvQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84A5510247AB;
	Tue, 18 Jan 2022 13:12:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 729855DB96;
	Tue, 18 Jan 2022 13:12:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 39C901806D1C;
	Tue, 18 Jan 2022 13:12:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IDCqMc010261 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 08:12:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B340BC159F6; Tue, 18 Jan 2022 13:12:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFBF6C08088
	for <linux-cachefs@redhat.com>; Tue, 18 Jan 2022 13:12:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98CE43C61347
	for <linux-cachefs@redhat.com>; Tue, 18 Jan 2022 13:12:52 +0000 (UTC)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
	[47.88.44.36]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-147-_A2U9_ZZP0ugZT18eybscA-1; Tue, 18 Jan 2022 08:12:50 -0500
X-MC-Unique: _A2U9_ZZP0ugZT18eybscA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V2C5Cov_1642511555
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V2C5Cov_1642511555) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 18 Jan 2022 21:12:36 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Tue, 18 Jan 2022 21:12:12 +0800
Message-Id: <20220118131216.85338-17-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [PATCH v2 16/20] erofs: implement fscache-based
	data read for inline layout
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

This patch implements the data plane of reading data from bootstrap blob
file over fscache for inline layout.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/fscache.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 588c33ab6a90..8c56bd54b2af 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -100,6 +100,45 @@ static int erofs_fscache_readpage_noinline(struct page *page,
 	return netfs_readpage(NULL, folio, &erofs_req_ops, &priv);
 }
 
+static int erofs_fscache_readpage_inline(struct page *page,
+					 struct erofs_fscache_map *fsmap)
+{
+	struct inode *inode = page->mapping->host;
+	struct super_block *sb = inode->i_sb;
+	struct erofs_buf buf = __EROFS_BUF_INITIALIZER;
+	erofs_blk_t blknr;
+	size_t offset, len;
+	void *src, *dst;
+
+	/*
+	 * For inline (tail packing) layout, the offset may be non-zero, while
+	 * the offset can be calculated from corresponding physical address
+	 * directly.
+	 * Currently only flat layout supports inline (FLAT_INLINE), and the
+	 * output map.m_pa is exactly the physical address of o_la in this case.
+	 */
+	offset = erofs_blkoff(fsmap->m_pa);
+	blknr = erofs_blknr(fsmap->m_pa);
+	len = fsmap->m_llen;
+
+	src = erofs_read_metabuf(&buf, sb, blknr, EROFS_KMAP);
+	if (IS_ERR(src)) {
+		SetPageError(page);
+		unlock_page(page);
+		return PTR_ERR(src);
+	}
+
+	dst = kmap(page);
+	memcpy(dst, src + offset, len);
+	kunmap(page);
+
+	erofs_put_metabuf(&buf);
+
+	SetPageUptodate(page);
+	unlock_page(page);
+	return 0;
+}
+
 static int erofs_fscache_readpage(struct file *file, struct page *page)
 {
 	struct inode *inode = page->mapping->host;
@@ -138,6 +177,8 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
 	case EROFS_INODE_FLAT_PLAIN:
 	case EROFS_INODE_CHUNK_BASED:
 		return erofs_fscache_readpage_noinline(page, &fsmap);
+	case EROFS_INODE_FLAT_INLINE:
+		return erofs_fscache_readpage_inline(page, &fsmap);
 	default:
 		DBG_BUGON(1);
 		ret = -EOPNOTSUPP;
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

