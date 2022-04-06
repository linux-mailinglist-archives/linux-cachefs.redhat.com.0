Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C2D4F571D
	for <lists+linux-cachefs@lfdr.de>; Wed,  6 Apr 2022 09:57:08 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-tbNFHmbUM8e_sNcRXXAl3g-1; Wed, 06 Apr 2022 03:57:03 -0400
X-MC-Unique: tbNFHmbUM8e_sNcRXXAl3g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC57D899ECB;
	Wed,  6 Apr 2022 07:57:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E5FC141512B;
	Wed,  6 Apr 2022 07:56:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0A636193F6E8;
	Wed,  6 Apr 2022 07:56:57 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0D3FC1940376 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 07:56:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E259A7AF5; Wed,  6 Apr 2022 07:56:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD8F37AF0
 for <linux-cachefs@redhat.com>; Wed,  6 Apr 2022 07:56:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E43A61C0150F
 for <linux-cachefs@redhat.com>; Wed,  6 Apr 2022 07:56:45 +0000 (UTC)
Received: from out199-10.us.a.mail.aliyun.com
 (out199-10.us.a.mail.aliyun.com [47.90.199.10]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-mm1eSvIZPLK2wOgb9I8YGg-1; Wed, 06 Apr 2022 03:56:43 -0400
X-MC-Unique: mm1eSvIZPLK2wOgb9I8YGg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V9LC88e_1649231796
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V9LC88e_1649231796) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 06 Apr 2022 15:56:37 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Wed,  6 Apr 2022 15:56:07 +0800
Message-Id: <20220406075612.60298-16-jefflexu@linux.alibaba.com>
In-Reply-To: <20220406075612.60298-1-jefflexu@linux.alibaba.com>
References: <20220406075612.60298-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Linux-cachefs] [PATCH v8 15/20] erofs: register fscache context
 for extra data blobs
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Similar to the multi device mode, erofs could be mounted from one
primary data blob (mandatory) and multiple extra data blobs (optional).

Register fscache context for each extra data blob.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/data.c     |  3 +++
 fs/erofs/internal.h |  2 ++
 fs/erofs/super.c    | 25 +++++++++++++++++--------
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index bc22642358ec..14b64d960541 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -199,6 +199,7 @@ int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *map)
 	map->m_bdev = sb->s_bdev;
 	map->m_daxdev = EROFS_SB(sb)->dax_dev;
 	map->m_dax_part_off = EROFS_SB(sb)->dax_part_off;
+	map->m_fscache = EROFS_SB(sb)->s_fscache;
 
 	if (map->m_deviceid) {
 		down_read(&devs->rwsem);
@@ -210,6 +211,7 @@ int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *map)
 		map->m_bdev = dif->bdev;
 		map->m_daxdev = dif->dax_dev;
 		map->m_dax_part_off = dif->dax_part_off;
+		map->m_fscache = dif->fscache;
 		up_read(&devs->rwsem);
 	} else if (devs->extra_devices) {
 		down_read(&devs->rwsem);
@@ -227,6 +229,7 @@ int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *map)
 				map->m_bdev = dif->bdev;
 				map->m_daxdev = dif->dax_dev;
 				map->m_dax_part_off = dif->dax_part_off;
+				map->m_fscache = dif->fscache;
 				break;
 			}
 		}
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index eb37b33bce37..90f7d6286a4f 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -49,6 +49,7 @@ typedef u32 erofs_blk_t;
 
 struct erofs_device_info {
 	char *path;
+	struct erofs_fscache *fscache;
 	struct block_device *bdev;
 	struct dax_device *dax_dev;
 	u64 dax_part_off;
@@ -482,6 +483,7 @@ static inline int z_erofs_map_blocks_iter(struct inode *inode,
 #endif	/* !CONFIG_EROFS_FS_ZIP */
 
 struct erofs_map_dev {
+	struct erofs_fscache *m_fscache;
 	struct block_device *m_bdev;
 	struct dax_device *m_daxdev;
 	u64 m_dax_part_off;
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 9498b899b73b..8c7181cd37e6 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -259,15 +259,23 @@ static int erofs_init_devices(struct super_block *sb,
 		}
 		dis = ptr + erofs_blkoff(pos);
 
-		bdev = blkdev_get_by_path(dif->path,
-					  FMODE_READ | FMODE_EXCL,
-					  sb->s_type);
-		if (IS_ERR(bdev)) {
-			err = PTR_ERR(bdev);
-			break;
+		if (erofs_is_fscache_mode(sb)) {
+			err = erofs_fscache_register_cookie(sb, &dif->fscache,
+							    dif->path, false);
+			if (err)
+				break;
+		} else {
+			bdev = blkdev_get_by_path(dif->path,
+						  FMODE_READ | FMODE_EXCL,
+						  sb->s_type);
+			if (IS_ERR(bdev)) {
+				err = PTR_ERR(bdev);
+				break;
+			}
+			dif->bdev = bdev;
+			dif->dax_dev = fs_dax_get_by_bdev(bdev, &dif->dax_part_off);
 		}
-		dif->bdev = bdev;
-		dif->dax_dev = fs_dax_get_by_bdev(bdev, &dif->dax_part_off);
+
 		dif->blocks = le32_to_cpu(dis->blocks);
 		dif->mapped_blkaddr = le32_to_cpu(dis->mapped_blkaddr);
 		sbi->total_blocks += dif->blocks;
@@ -701,6 +709,7 @@ static int erofs_release_device_info(int id, void *ptr, void *data)
 	fs_put_dax(dif->dax_dev);
 	if (dif->bdev)
 		blkdev_put(dif->bdev, FMODE_READ | FMODE_EXCL);
+	erofs_fscache_unregister_cookie(&dif->fscache);
 	kfree(dif->path);
 	kfree(dif);
 	return 0;
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

