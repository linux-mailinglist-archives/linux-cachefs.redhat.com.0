Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E9147FD37
	for <lists+linux-cachefs@lfdr.de>; Mon, 27 Dec 2021 14:05:32 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-_JxVXR1BPXGTwiG6nTfNeA-1; Mon, 27 Dec 2021 08:05:26 -0500
X-MC-Unique: _JxVXR1BPXGTwiG6nTfNeA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC5231006AA4;
	Mon, 27 Dec 2021 13:05:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EEA684D38;
	Mon, 27 Dec 2021 13:05:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 355324A7C8;
	Mon, 27 Dec 2021 13:05:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BRD5Lw2005044 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 27 Dec 2021 08:05:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0440D400D3CA; Mon, 27 Dec 2021 13:05:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3635401B28E
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 13:05:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9C9F1C05158
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 13:05:20 +0000 (UTC)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
	[47.88.44.36]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-622-fGP1UER1O9Wkb390scVPRA-1; Mon, 27 Dec 2021 08:05:17 -0500
X-MC-Unique: fGP1UER1O9Wkb390scVPRA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R461e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V.xJoQp_1640609696
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V.xJoQp_1640609696) by smtp.aliyun-inc.com(127.0.0.1);
	Mon, 27 Dec 2021 20:54:57 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon, 27 Dec 2021 20:54:31 +0800
Message-Id: <20211227125444.21187-11-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [PATCH v1 10/23] erofs: add anonymous inode
	managing page cache of blob file
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce one anonymous inode for managing page cache of corresponding
blob file. Then erofs could read directly from the address space of the
anonymous inode when cache hit.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/fscache.c  | 35 +++++++++++++++++++++++++++++++++++
 fs/erofs/internal.h |  1 +
 2 files changed, 36 insertions(+)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 15c5bb0f8ea5..4dfca7c95710 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -34,6 +34,33 @@ static void erofs_fscache_cleanup_cookie(struct erofs_cookie_ctx *ctx)
 	ctx->cookie = NULL;
 }
 
+static const struct address_space_operations erofs_fscache_aops = {
+};
+
+static int erofs_fscache_get_inode(struct erofs_cookie_ctx *ctx,
+				   struct super_block *sb)
+{
+	struct inode *const inode = new_inode(sb);
+
+	if (!inode)
+		return -ENOMEM;
+
+	set_nlink(inode, 1);
+	inode->i_size = OFFSET_MAX;
+
+	inode->i_mapping->a_ops = &erofs_fscache_aops;
+	mapping_set_gfp_mask(inode->i_mapping,
+			GFP_NOFS | __GFP_HIGHMEM | __GFP_MOVABLE);
+	ctx->inode = inode;
+	return 0;
+}
+
+static void erofs_fscache_put_inode(struct erofs_cookie_ctx *ctx)
+{
+	iput(ctx->inode);
+	ctx->inode = NULL;
+}
+
 static int erofs_fscahce_init_ctx(struct erofs_cookie_ctx *ctx,
 				  struct super_block *sb, char *path)
 {
@@ -45,12 +72,20 @@ static int erofs_fscahce_init_ctx(struct erofs_cookie_ctx *ctx,
 		return ret;
 	}
 
+	ret = erofs_fscache_get_inode(ctx, sb);
+	if (ret) {
+		erofs_err(sb, "failed to get anonymous inode\n");
+		erofs_fscache_cleanup_cookie(ctx);
+		return ret;
+	}
+
 	return 0;
 }
 
 static void erofs_fscache_cleanup_ctx(struct erofs_cookie_ctx *ctx)
 {
 	erofs_fscache_cleanup_cookie(ctx);
+	erofs_fscache_put_inode(ctx);
 }
 
 struct erofs_cookie_ctx *erofs_fscache_get_ctx(struct super_block *sb,
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 4179c3dcb7f9..2e4f267b37e7 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -93,6 +93,7 @@ struct erofs_sb_lz4_info {
 
 struct erofs_cookie_ctx {
 	struct fscache_cookie *cookie;
+	struct inode *inode;
 };
 
 struct erofs_sb_info {
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

