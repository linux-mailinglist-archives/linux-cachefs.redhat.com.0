Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 405DD50DFFE
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Apr 2022 14:22:33 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-lQ0avt6VNZ6nvi8waaP_vw-1; Mon, 25 Apr 2022 08:22:29 -0400
X-MC-Unique: lQ0avt6VNZ6nvi8waaP_vw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACB17811E78;
	Mon, 25 Apr 2022 12:22:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1089C27EA6;
	Mon, 25 Apr 2022 12:22:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5D8521940346;
	Mon, 25 Apr 2022 12:22:28 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 15A8B1947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 25 Apr 2022 12:22:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E4FE22166BA3; Mon, 25 Apr 2022 12:22:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E01AC2167D65
 for <linux-cachefs@redhat.com>; Mon, 25 Apr 2022 12:22:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20E8A1014A62
 for <linux-cachefs@redhat.com>; Mon, 25 Apr 2022 12:22:22 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54--fS4IJerMUiEcs7NE45FhQ-1; Mon, 25 Apr 2022 08:22:19 -0400
X-MC-Unique: -fS4IJerMUiEcs7NE45FhQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R921e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=20; SR=0; TI=SMTPD_---0VBGH8HR_1650889333
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VBGH8HR_1650889333) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 25 Apr 2022 20:22:14 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon, 25 Apr 2022 20:21:40 +0800
Message-Id: <20220425122143.56815-19-jefflexu@linux.alibaba.com>
In-Reply-To: <20220425122143.56815-1-jefflexu@linux.alibaba.com>
References: <20220425122143.56815-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH v10 18/21] erofs: implement fscache-based
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
Cc: zhujia.zj@bytedance.com, gregkh@linuxfoundation.org, fannaihao@baidu.com,
 tao.peng@linux.alibaba.com, willy@infradead.org, linux-kernel@vger.kernel.org,
 tianzichen@kuaishou.com, joseph.qi@linux.alibaba.com,
 zhangjiachen.jaycee@bytedance.com, bo.liu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
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

Implement the data plane of reading data from data blobs over fscache
for non-inline layout.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/fscache.c  | 51 +++++++++++++++++++++++++++++++++++++++++++++
 fs/erofs/inode.c    |  4 ++++
 fs/erofs/internal.h |  2 ++
 3 files changed, 57 insertions(+)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 23d7e862eed8..b3af72af7c88 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -83,10 +83,61 @@ static int erofs_fscache_meta_readpage(struct file *data, struct page *page)
 	return ret;
 }
 
+static int erofs_fscache_readpage(struct file *file, struct page *page)
+{
+	struct folio *folio = page_folio(page);
+	struct inode *inode = folio_mapping(folio)->host;
+	struct super_block *sb = inode->i_sb;
+	struct erofs_map_blocks map;
+	struct erofs_map_dev mdev;
+	erofs_off_t pos;
+	loff_t pstart;
+	int ret;
+
+	DBG_BUGON(folio_size(folio) != EROFS_BLKSIZ);
+
+	pos = folio_pos(folio);
+	map.m_la = pos;
+
+	ret = erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
+	if (ret)
+		goto out_unlock;
+
+	if (!(map.m_flags & EROFS_MAP_MAPPED)) {
+		folio_zero_range(folio, 0, folio_size(folio));
+		goto out_uptodate;
+	}
+
+	mdev = (struct erofs_map_dev) {
+		.m_deviceid = map.m_deviceid,
+		.m_pa = map.m_pa,
+	};
+
+	ret = erofs_map_dev(sb, &mdev);
+	if (ret)
+		goto out_unlock;
+
+	pstart = mdev.m_pa + (pos - map.m_la);
+	ret = erofs_fscache_read_folios(mdev.m_fscache->cookie,
+			folio_mapping(folio), folio_pos(folio),
+			folio_size(folio), pstart);
+
+out_uptodate:
+	if (!ret)
+		folio_mark_uptodate(folio);
+out_unlock:
+	folio_unlock(folio);
+	return ret;
+}
+
 static const struct address_space_operations erofs_fscache_meta_aops = {
 	.readpage = erofs_fscache_meta_readpage,
 };
 
+const struct address_space_operations erofs_fscache_access_aops = {
+	.readpage = erofs_fscache_readpage,
+};
+
 int erofs_fscache_register_cookie(struct super_block *sb,
 				  struct erofs_fscache **fscache,
 				  char *name, bool need_inode)
diff --git a/fs/erofs/inode.c b/fs/erofs/inode.c
index e8b37ba5e9ad..8d3f56c6469b 100644
--- a/fs/erofs/inode.c
+++ b/fs/erofs/inode.c
@@ -297,6 +297,10 @@ static int erofs_fill_inode(struct inode *inode, int isdir)
 		goto out_unlock;
 	}
 	inode->i_mapping->a_ops = &erofs_raw_access_aops;
+#ifdef CONFIG_EROFS_FS_ONDEMAND
+	if (erofs_is_fscache_mode(inode->i_sb))
+		inode->i_mapping->a_ops = &erofs_fscache_access_aops;
+#endif
 
 out_unlock:
 	erofs_put_metabuf(&buf);
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index fa488af8dfcf..c8f6ac910976 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -639,6 +639,8 @@ int erofs_fscache_register_cookie(struct super_block *sb,
 				  struct erofs_fscache **fscache,
 				  char *name, bool need_inode);
 void erofs_fscache_unregister_cookie(struct erofs_fscache **fscache);
+
+extern const struct address_space_operations erofs_fscache_access_aops;
 #else
 static inline int erofs_fscache_register_fs(struct super_block *sb)
 {
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

