Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3A04ED8F2
	for <lists+linux-cachefs@lfdr.de>; Thu, 31 Mar 2022 13:58:53 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-G2ZSXW1QPUSWoC_H3SxFTg-1; Thu, 31 Mar 2022 07:58:44 -0400
X-MC-Unique: G2ZSXW1QPUSWoC_H3SxFTg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7CEE8FFD97;
	Thu, 31 Mar 2022 11:58:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA0DE40D0166;
	Thu, 31 Mar 2022 11:58:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7FE1F1947BBD;
	Thu, 31 Mar 2022 11:58:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 16C7B19451F3 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 31 Mar 2022 11:58:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EEED840CFD05; Thu, 31 Mar 2022 11:58:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E574640CFD06
 for <linux-cachefs@redhat.com>; Thu, 31 Mar 2022 11:58:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC3F380418C
 for <linux-cachefs@redhat.com>; Thu, 31 Mar 2022 11:58:23 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-00SLIIpINmWIDYPgsKLBsw-1; Thu, 31 Mar 2022 07:58:21 -0400
X-MC-Unique: 00SLIIpINmWIDYPgsKLBsw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R491e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V8imT9M_1648727890
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V8imT9M_1648727890) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 31 Mar 2022 19:58:11 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Thu, 31 Mar 2022 19:57:45 +0800
Message-Id: <20220331115753.89431-12-jefflexu@linux.alibaba.com>
In-Reply-To: <20220331115753.89431-1-jefflexu@linux.alibaba.com>
References: <20220331115753.89431-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Linux-cachefs] [PATCH v7 11/19] erofs: add anonymous inode
 managing page cache for data blob
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

Introduce one anonymous inode managing page cache for data blob. Then
erofs could read directly from the address space of the anonymous inode
when cache hit.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/fscache.c  | 39 ++++++++++++++++++++++++++++++++++++---
 fs/erofs/internal.h |  6 ++++--
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 67a3c4935245..1c88614203d2 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -5,17 +5,22 @@
 #include <linux/fscache.h>
 #include "internal.h"
 
+static const struct address_space_operations erofs_fscache_meta_aops = {
+};
+
 /*
  * Create an fscache context for data blob.
  * Return: 0 on success and allocated fscache context is assigned to @fscache,
  *	   negative error number on failure.
  */
 int erofs_fscache_register_cookie(struct super_block *sb,
-				  struct erofs_fscache **fscache, char *name)
+				  struct erofs_fscache **fscache,
+				  char *name, bool need_inode)
 {
 	struct fscache_volume *volume = EROFS_SB(sb)->volume;
 	struct erofs_fscache *ctx;
 	struct fscache_cookie *cookie;
+	int ret;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -25,15 +30,40 @@ int erofs_fscache_register_cookie(struct super_block *sb,
 					name, strlen(name), NULL, 0, 0);
 	if (!cookie) {
 		erofs_err(sb, "failed to get cookie for %s", name);
-		kfree(name);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err;
 	}
 
 	fscache_use_cookie(cookie, false);
 	ctx->cookie = cookie;
 
+	if (need_inode) {
+		struct inode *const inode = new_inode(sb);
+
+		if (!inode) {
+			erofs_err(sb, "failed to get anon inode for %s", name);
+			ret = -ENOMEM;
+			goto err_cookie;
+		}
+
+		set_nlink(inode, 1);
+		inode->i_size = OFFSET_MAX;
+		inode->i_mapping->a_ops = &erofs_fscache_meta_aops;
+		mapping_set_gfp_mask(inode->i_mapping, GFP_NOFS);
+
+		ctx->inode = inode;
+	}
+
 	*fscache = ctx;
 	return 0;
+
+err_cookie:
+	fscache_unuse_cookie(ctx->cookie, NULL, NULL);
+	fscache_relinquish_cookie(ctx->cookie, false);
+	ctx->cookie = NULL;
+err:
+	kfree(ctx);
+	return ret;
 }
 
 void erofs_fscache_unregister_cookie(struct erofs_fscache **fscache)
@@ -47,6 +77,9 @@ void erofs_fscache_unregister_cookie(struct erofs_fscache **fscache)
 	fscache_relinquish_cookie(ctx->cookie, false);
 	ctx->cookie = NULL;
 
+	iput(ctx->inode);
+	ctx->inode = NULL;
+
 	kfree(ctx);
 	*fscache = NULL;
 }
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index c6a3351a4d7d..3a4a344cfed3 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -99,6 +99,7 @@ struct erofs_sb_lz4_info {
 
 struct erofs_fscache {
 	struct fscache_cookie *cookie;
+	struct inode *inode;
 };
 
 struct erofs_sb_info {
@@ -632,7 +633,8 @@ int erofs_fscache_register_fs(struct super_block *sb);
 void erofs_fscache_unregister_fs(struct super_block *sb);
 
 int erofs_fscache_register_cookie(struct super_block *sb,
-				  struct erofs_fscache **fscache, char *name);
+				  struct erofs_fscache **fscache,
+				  char *name, bool need_inode);
 void erofs_fscache_unregister_cookie(struct erofs_fscache **fscache);
 #else
 static inline int erofs_fscache_register_fs(struct super_block *sb) { return 0; }
@@ -640,7 +642,7 @@ static inline void erofs_fscache_unregister_fs(struct super_block *sb) {}
 
 static inline int erofs_fscache_register_cookie(struct super_block *sb,
 						struct erofs_fscache **fscache,
-						char *name)
+						char *name, bool need_inode)
 {
 	return -EOPNOTSUPP;
 }
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

