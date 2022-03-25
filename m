Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C824E7311
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Mar 2022 13:23:06 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-2SeN-nRXPBWI9bAjhzaiGA-1; Fri, 25 Mar 2022 08:23:04 -0400
X-MC-Unique: 2SeN-nRXPBWI9bAjhzaiGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED034811E7A;
	Fri, 25 Mar 2022 12:23:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2C99111F3C7;
	Fri, 25 Mar 2022 12:23:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B82331940358;
	Fri, 25 Mar 2022 12:23:03 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E7BF7194034E for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Mar 2022 12:23:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C0DE05B2563; Fri, 25 Mar 2022 12:23:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD1E25DF821
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 12:23:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2FC63C11C7D
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 12:23:00 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-Q5FW1VJlPpqv2KgiE4Jgyg-1; Fri, 25 Mar 2022 08:22:51 -0400
X-MC-Unique: Q5FW1VJlPpqv2KgiE4Jgyg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V89aFt._1648210964
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V89aFt._1648210964) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 25 Mar 2022 20:22:45 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 25 Mar 2022 20:22:14 +0800
Message-Id: <20220325122223.102958-14-jefflexu@linux.alibaba.com>
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
Subject: [Linux-cachefs] [PATCH v6 13/22] erofs: add anonymous inode
 managing page cache of blob file
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
 fs/erofs/fscache.c  | 41 ++++++++++++++++++++++++++++++++++++++++-
 fs/erofs/internal.h |  7 +++++--
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 73235fd43bf6..30383d9adb62 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -7,6 +7,9 @@
 
 static struct fscache_volume *volume;
 
+static const struct address_space_operations erofs_fscache_blob_aops = {
+};
+
 static int erofs_fscache_init_cookie(struct erofs_fscache *ctx, char *path)
 {
 	struct fscache_cookie *cookie;
@@ -31,6 +34,29 @@ static inline void erofs_fscache_cleanup_cookie(struct erofs_fscache *ctx)
 	ctx->cookie = NULL;
 }
 
+static int erofs_fscache_get_inode(struct erofs_fscache *ctx,
+				   struct super_block *sb)
+{
+	struct inode *const inode = new_inode(sb);
+
+	if (!inode)
+		return -ENOMEM;
+
+	set_nlink(inode, 1);
+	inode->i_size = OFFSET_MAX;
+	inode->i_mapping->a_ops = &erofs_fscache_blob_aops;
+	mapping_set_gfp_mask(inode->i_mapping, GFP_NOFS);
+
+	ctx->inode = inode;
+	return 0;
+}
+
+static inline void erofs_fscache_put_inode(struct erofs_fscache *ctx)
+{
+	iput(ctx->inode);
+	ctx->inode = NULL;
+}
+
 /*
  * erofs_fscache_get - create an fscache context for blob file
  * @sb:		superblock
@@ -38,7 +64,8 @@ static inline void erofs_fscache_cleanup_cookie(struct erofs_fscache *ctx)
  *
  * Return: fscache context on success, ERR_PTR() on failure.
  */
-struct erofs_fscache *erofs_fscache_get(struct super_block *sb, char *path)
+struct erofs_fscache *erofs_fscache_get(struct super_block *sb, char *path,
+					bool need_inode)
 {
 	struct erofs_fscache *ctx;
 	int ret;
@@ -53,7 +80,18 @@ struct erofs_fscache *erofs_fscache_get(struct super_block *sb, char *path)
 		goto err;
 	}
 
+	if (need_inode) {
+		ret = erofs_fscache_get_inode(ctx, sb);
+		if (ret) {
+			erofs_err(sb, "failed to get anonymous inode");
+			goto err_cookie;
+		}
+	}
+
 	return ctx;
+
+err_cookie:
+	erofs_fscache_cleanup_cookie(ctx);
 err:
 	kfree(ctx);
 	return ERR_PTR(ret);
@@ -65,6 +103,7 @@ void erofs_fscache_put(struct erofs_fscache *ctx)
 		return;
 
 	erofs_fscache_cleanup_cookie(ctx);
+	erofs_fscache_put_inode(ctx);
 	kfree(ctx);
 }
 
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index d4f2b43cedae..459f31803c3b 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -98,6 +98,7 @@ struct erofs_sb_lz4_info {
 
 struct erofs_fscache {
 	struct fscache_cookie *cookie;
+	struct inode *inode;
 };
 
 struct erofs_sb_info {
@@ -625,14 +626,16 @@ static inline int z_erofs_load_lzma_config(struct super_block *sb,
 int erofs_init_fscache(void);
 void erofs_exit_fscache(void);
 
-struct erofs_fscache *erofs_fscache_get(struct super_block *sb, char *path);
+struct erofs_fscache *erofs_fscache_get(struct super_block *sb, char *path,
+					bool need_inode);
 void erofs_fscache_put(struct erofs_fscache *ctx);
 #else
 static inline int erofs_init_fscache(void) { return 0; }
 static inline void erofs_exit_fscache(void) {}
 
 static inline struct erofs_fscache *erofs_fscache_get(struct super_block *sb,
-						      char *path)
+						      char *path,
+						      bool need_inode)
 {
 	return ERR_PTR(-EOPNOTSUPP);
 }
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

