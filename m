Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DE04E7325
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Mar 2022 13:23:14 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-FW6HMuJpN629CK780iL3Zw-1; Fri, 25 Mar 2022 08:23:05 -0400
X-MC-Unique: FW6HMuJpN629CK780iL3Zw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D74DD28078EB;
	Fri, 25 Mar 2022 12:23:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83D724AE6E2;
	Fri, 25 Mar 2022 12:22:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 37C38194036C;
	Fri, 25 Mar 2022 12:22:53 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 687B3194036B for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Mar 2022 12:22:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A979D2166B16; Fri, 25 Mar 2022 12:22:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A52642166B5E
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 12:22:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7657899EDA
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 12:22:49 +0000 (UTC)
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-_AZPzWrEPom4pJamxIx5pQ-1; Fri, 25 Mar 2022 08:22:42 -0400
X-MC-Unique: _AZPzWrEPom4pJamxIx5pQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R551e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V89qR.F_1648210956
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V89qR.F_1648210956) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 25 Mar 2022 20:22:37 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 25 Mar 2022 20:22:09 +0800
Message-Id: <20220325122223.102958-9-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH v6 08/22] erofs: use meta buffers for
 erofs_read_superblock()
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The only change is that, meta buffers read cache page without __GFP_FS
flag, which shall not matter.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/super.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 915eefe0d7e2..12755217631f 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -281,21 +281,19 @@ static int erofs_init_devices(struct super_block *sb,
 static int erofs_read_superblock(struct super_block *sb)
 {
 	struct erofs_sb_info *sbi;
-	struct page *page;
+	struct erofs_buf buf = __EROFS_BUF_INITIALIZER;
 	struct erofs_super_block *dsb;
 	unsigned int blkszbits;
 	void *data;
 	int ret;
 
-	page = read_mapping_page(sb->s_bdev->bd_inode->i_mapping, 0, NULL);
-	if (IS_ERR(page)) {
+	data = erofs_read_metabuf(&buf, sb, 0, EROFS_KMAP);
+	if (IS_ERR(data)) {
 		erofs_err(sb, "cannot read erofs superblock");
-		return PTR_ERR(page);
+		return PTR_ERR(data);
 	}
 
 	sbi = EROFS_SB(sb);
-
-	data = kmap(page);
 	dsb = (struct erofs_super_block *)(data + EROFS_SUPER_OFFSET);
 
 	ret = -EINVAL;
@@ -365,8 +363,7 @@ static int erofs_read_superblock(struct super_block *sb)
 	if (erofs_sb_has_ztailpacking(sbi))
 		erofs_info(sb, "EXPERIMENTAL compressed inline data feature in use. Use at your own risk!");
 out:
-	kunmap(page);
-	put_page(page);
+	erofs_put_metabuf(&buf);
 	return ret;
 }
 
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

