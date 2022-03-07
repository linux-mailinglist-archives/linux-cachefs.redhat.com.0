Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFC14CFEBB
	for <lists+linux-cachefs@lfdr.de>; Mon,  7 Mar 2022 13:33:47 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-LNx5kqAdOLyjyfyjFVSq0A-1; Mon, 07 Mar 2022 07:33:44 -0500
X-MC-Unique: LNx5kqAdOLyjyfyjFVSq0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57CF480B710;
	Mon,  7 Mar 2022 12:33:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1580DC08096;
	Mon,  7 Mar 2022 12:33:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D8A9119305B8;
	Mon,  7 Mar 2022 12:33:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 85D721931BE7 for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  7 Mar 2022 12:33:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6B356C07F5D; Mon,  7 Mar 2022 12:33:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66B7AC07F48
 for <linux-cachefs@redhat.com>; Mon,  7 Mar 2022 12:33:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A6CD80158E
 for <linux-cachefs@redhat.com>; Mon,  7 Mar 2022 12:33:40 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-frlh9KZfNNOhhsOuKVcITA-1; Mon, 07 Mar 2022 07:33:36 -0500
X-MC-Unique: frlh9KZfNNOhhsOuKVcITA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R441e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=15; SR=0; TI=SMTPD_---0V6VlXz9_1646656410
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V6VlXz9_1646656410) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 07 Mar 2022 20:33:31 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon,  7 Mar 2022 20:33:01 +0800
Message-Id: <20220307123305.79520-18-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Linux-cachefs] [PATCH v4 17/21] erofs: implement fscache-based
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
Cc: gregkh@linuxfoundation.org, tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch implements the data plane of reading data from bootstrap blob
file over fscache for inline layout.

For the heading non-inline part, the data plane for non-inline layout is
resued, while only the tail packing part needs special handling.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/fscache.c | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index ff69698948ad..4da148cc4484 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -85,8 +85,9 @@ static int erofs_fscache_readpage_noinline(struct page *page,
 {
 	struct fscache_cookie *cookie = fsmap->m_ctx->cookie;
 	/*
-	 * 1) For FLAT_PLAIN layout, the output map.m_la shall be equal to o_la,
-	 * and the output map.m_pa is exactly the physical address of o_la.
+	 * 1) For FLAT_PLAIN and FLAT_INLINE (the heading non tail packing part)
+	 * layout, the output map.m_la shall be equal to o_la, and the output
+	 * map.m_pa is exactly the physical address of o_la.
 	 * 2) For CHUNK_BASED layout, the output map.m_la is rounded down to the
 	 * nearest chunk boundary, and the output map.m_pa is actually the
 	 * physical address of this chunk boundary. So we need to recalculate
@@ -97,6 +98,40 @@ static int erofs_fscache_readpage_noinline(struct page *page,
 	return erofs_fscache_read_page(cookie, page, start);
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
+	 * For inline (tail packing) layout, the offset may be non-zero, which
+	 * can be calculated from corresponding physical address directly.
+	 * Currently only flat layout supports inline (FLAT_INLINE), and the
+	 * output map.m_pa is exactly the physical address of o_la in this case.
+	 */
+	offset = erofs_blkoff(fsmap->m_pa);
+	blknr = erofs_blknr(fsmap->m_pa);
+	len = fsmap->m_llen;
+
+	src = erofs_read_metabuf(&buf, sb, blknr, EROFS_KMAP);
+	if (IS_ERR(src))
+		return PTR_ERR(src);
+
+	dst = kmap(page);
+	memcpy(dst, src + offset, len);
+	memset(dst + len, 0, PAGE_SIZE - len);
+	kunmap(page);
+
+	erofs_put_metabuf(&buf);
+
+	return 0;
+}
+
 static int erofs_fscache_do_readpage(struct page *page)
 {
 	struct inode *inode = page->mapping->host;
@@ -126,8 +161,12 @@ static int erofs_fscache_do_readpage(struct page *page)
 	if (ret)
 		return ret;
 
+	if (map.m_flags & EROFS_MAP_META)
+		return erofs_fscache_readpage_inline(page, &fsmap);
+
 	switch (vi->datalayout) {
 	case EROFS_INODE_FLAT_PLAIN:
+	case EROFS_INODE_FLAT_INLINE:
 	case EROFS_INODE_CHUNK_BASED:
 		return erofs_fscache_readpage_noinline(page, &fsmap);
 	default:
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

