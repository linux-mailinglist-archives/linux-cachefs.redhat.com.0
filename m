Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D80C8502A1C
	for <lists+linux-cachefs@lfdr.de>; Fri, 15 Apr 2022 14:36:59 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-ef8NlHpeONKThaNvplptXw-1; Fri, 15 Apr 2022 08:36:56 -0400
X-MC-Unique: ef8NlHpeONKThaNvplptXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66BB7185A79C;
	Fri, 15 Apr 2022 12:36:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5CE1E145830C;
	Fri, 15 Apr 2022 12:36:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 26AE9194035B;
	Fri, 15 Apr 2022 12:36:55 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AD8C419451EF for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 15 Apr 2022 12:36:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A0AC9463EF1; Fri, 15 Apr 2022 12:36:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CE6E463EEE
 for <linux-cachefs@redhat.com>; Fri, 15 Apr 2022 12:36:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8442C83396A
 for <linux-cachefs@redhat.com>; Fri, 15 Apr 2022 12:36:54 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-dfxISVngOd28yAufSo51rA-1; Fri, 15 Apr 2022 08:36:52 -0400
X-MC-Unique: dfxISVngOd28yAufSo51rA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R721e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0VA7VPV2_1650026207
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VA7VPV2_1650026207) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 15 Apr 2022 20:36:48 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 15 Apr 2022 20:36:13 +0800
Message-Id: <20220415123614.54024-21-jefflexu@linux.alibaba.com>
In-Reply-To: <20220415123614.54024-1-jefflexu@linux.alibaba.com>
References: <20220415123614.54024-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Linux-cachefs] [PATCH v9 20/21] erofs: implement fscache-based
 data readahead
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
 joseph.qi@linux.alibaba.com, zhangjiachen.jaycee@bytedance.com,
 bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
 luodaowen.backend@bytedance.com, eguan@linux.alibaba.com,
 gerry@linux.alibaba.com, torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement fscache-based data readahead. Also registers an individual
bdi for each erofs instance to enable readahead.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/fscache.c | 86 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/erofs/super.c   |  4 +++
 2 files changed, 90 insertions(+)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 08849c15500f..eaa50692ddba 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -163,12 +163,98 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
 	return ret;
 }
 
+static void erofs_fscache_unlock_folios(struct readahead_control *rac,
+					size_t len)
+{
+	while (len) {
+		struct folio *folio = readahead_folio(rac);
+
+		len -= folio_size(folio);
+		folio_mark_uptodate(folio);
+		folio_unlock(folio);
+	}
+}
+
+static void erofs_fscache_readahead(struct readahead_control *rac)
+{
+	struct inode *inode = rac->mapping->host;
+	struct super_block *sb = inode->i_sb;
+	size_t len, count, done = 0;
+	erofs_off_t pos;
+	loff_t start, offset;
+	int ret;
+
+	if (!readahead_count(rac))
+		return;
+
+	start = readahead_pos(rac);
+	len = readahead_length(rac);
+
+	do {
+		struct erofs_map_blocks map;
+		struct erofs_map_dev mdev;
+
+		pos = start + done;
+		map.m_la = pos;
+
+		ret = erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
+		if (ret)
+			return;
+
+		offset = start + done;
+		count = min_t(size_t, map.m_llen - (pos - map.m_la),
+			      len - done);
+
+		if (!(map.m_flags & EROFS_MAP_MAPPED)) {
+			struct iov_iter iter;
+
+			iov_iter_xarray(&iter, READ, &rac->mapping->i_pages,
+					offset, count);
+			iov_iter_zero(count, &iter);
+
+			erofs_fscache_unlock_folios(rac, count);
+			ret = count;
+			continue;
+		}
+
+		if (map.m_flags & EROFS_MAP_META) {
+			struct folio *folio = readahead_folio(rac);
+
+			ret = erofs_fscache_readpage_inline(folio, &map);
+			if (!ret) {
+				folio_mark_uptodate(folio);
+				ret = folio_size(folio);
+			}
+
+			folio_unlock(folio);
+			continue;
+		}
+
+		mdev = (struct erofs_map_dev) {
+			.m_deviceid = map.m_deviceid,
+			.m_pa = map.m_pa,
+		};
+		ret = erofs_map_dev(sb, &mdev);
+		if (ret)
+			return;
+
+		ret = erofs_fscache_read_folios(mdev.m_fscache->cookie,
+				rac->mapping, offset, count,
+				mdev.m_pa + (pos - map.m_la));
+		if (!ret) {
+			erofs_fscache_unlock_folios(rac, count);
+			ret = count;
+		}
+	} while (ret > 0 && ((done += ret) < len));
+}
+
 static const struct address_space_operations erofs_fscache_meta_aops = {
 	.readpage = erofs_fscache_meta_readpage,
 };
 
 const struct address_space_operations erofs_fscache_access_aops = {
 	.readpage = erofs_fscache_readpage,
+	.readahead = erofs_fscache_readahead,
 };
 
 /*
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index c6755bcae4a6..f68ba929100d 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -619,6 +619,10 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 						    sbi->opt.fsid, true);
 		if (err)
 			return err;
+
+		err = super_setup_bdi(sb);
+		if (err)
+			return err;
 	} else {
 		if (!sb_set_blocksize(sb, EROFS_BLKSIZ)) {
 			erofs_err(sb, "failed to set erofs blksize");
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

