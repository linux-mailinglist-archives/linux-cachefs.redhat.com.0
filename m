Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C363F47FD36
	for <lists+linux-cachefs@lfdr.de>; Mon, 27 Dec 2021 14:03:16 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-_KDrl1xJOn6kjDiFLo4TIQ-1; Mon, 27 Dec 2021 08:03:14 -0500
X-MC-Unique: _KDrl1xJOn6kjDiFLo4TIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B6B3801B25;
	Mon, 27 Dec 2021 13:03:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BE5223084;
	Mon, 27 Dec 2021 13:03:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E9764A7C8;
	Mon, 27 Dec 2021 13:03:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BRD3Amd004396 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 27 Dec 2021 08:03:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D5EF951598E; Mon, 27 Dec 2021 13:03:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1E2C401E37
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 13:03:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C8D1811E78
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 13:03:10 +0000 (UTC)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
	[47.88.44.36]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-609-Q22KXOH6MaO20oBc-o4HaA-1; Mon, 27 Dec 2021 08:03:08 -0500
X-MC-Unique: Q22KXOH6MaO20oBc-o4HaA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V.w7GYT_1640609702
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V.w7GYT_1640609702) by smtp.aliyun-inc.com(127.0.0.1);
	Mon, 27 Dec 2021 20:55:02 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon, 27 Dec 2021 20:54:36 +0800
Message-Id: <20211227125444.21187-16-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [PATCH v1 15/23] erofs: implement fscache-based
	data read for data blobs
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch implements the data plane of reading data from data blob file
over fscache.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/data.c     |  3 +++
 fs/erofs/fscache.c  | 25 +++++++++++++++++++++++--
 fs/erofs/internal.h |  1 +
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index f0857c285fac..621769ab5753 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -166,6 +166,7 @@ int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *map)
 	/* primary device by default */
 	map->m_bdev = sb->s_bdev;
 	map->m_daxdev = EROFS_SB(sb)->dax_dev;
+	map->m_ctx = EROFS_SB(sb)->bootstrap;
 
 	if (map->m_deviceid) {
 		down_read(&devs->rwsem);
@@ -176,6 +177,7 @@ int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *map)
 		}
 		map->m_bdev = dif->bdev;
 		map->m_daxdev = dif->dax_dev;
+		map->m_ctx = dif->ctx;
 		up_read(&devs->rwsem);
 	} else if (devs->extra_devices) {
 		down_read(&devs->rwsem);
@@ -192,6 +194,7 @@ int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *map)
 				map->m_pa -= startoff;
 				map->m_bdev = dif->bdev;
 				map->m_daxdev = dif->dax_dev;
+				map->m_ctx = dif->ctx;
 				break;
 			}
 		}
diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index bfcec831d58a..7d4f6682e521 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -77,12 +77,24 @@ static inline void do_copy_page(struct page *from, struct page *to,
 	kunmap_atomic(vfrom);
 }
 
+static struct page *erofs_fscache_get_page(struct erofs_cookie_ctx *ctx,
+					   erofs_blk_t blkaddr)
+{
+	struct page *page;
+
+	page = erofs_readpage_from_fscache(ctx, blkaddr);
+	if (!IS_ERR(page))
+		lock_page(page);
+	return page;
+}
+
 static int erofs_fscache_do_readpage(struct file *file, struct page *page)
 {
 	struct inode *inode = page->mapping->host;
 	struct erofs_inode *vi = EROFS_I(inode);
 	struct super_block *sb = inode->i_sb;
 	struct erofs_map_blocks map;
+	struct erofs_map_dev mdev;
 	erofs_off_t o_la, pa;
 	size_t offset, len;
 	struct page *ipage;
@@ -105,6 +117,15 @@ static int erofs_fscache_do_readpage(struct file *file, struct page *page)
 		return 0;
 	}
 
+	mdev = (struct erofs_map_dev) {
+		.m_deviceid = map.m_deviceid,
+		.m_pa = map.m_pa,
+	};
+
+	ret = erofs_map_dev(inode->i_sb, &mdev);
+	if (ret)
+		return ret;
+
 	/*
 	 * 1) For FLAT_PLAIN/FLAT_INLINE layout, the output map.m_la shall be
 	 * equal to o_la, and the output map.m_pa is exactly the physical
@@ -114,9 +135,9 @@ static int erofs_fscache_do_readpage(struct file *file, struct page *page)
 	 * physical address of this chunk boundary. So we need to recalculate
 	 * the actual physical address of o_la.
 	 */
-	pa = map.m_pa + o_la - map.m_la;
+	pa = mdev.m_pa + o_la - map.m_la;
 
-	ipage = erofs_get_meta_page(sb, erofs_blknr(pa));
+	ipage = erofs_fscache_get_page(mdev.m_ctx, erofs_blknr(pa));
 	if (IS_ERR(ipage))
 		return PTR_ERR(ipage);
 
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index f60577a7aade..b21c3751e88d 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -447,6 +447,7 @@ static inline int z_erofs_map_blocks_iter(struct inode *inode,
 struct erofs_map_dev {
 	struct block_device *m_bdev;
 	struct dax_device *m_daxdev;
+	struct erofs_cookie_ctx *m_ctx;
 
 	erofs_off_t m_pa;
 	unsigned int m_deviceid;
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

