Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B3146FBF8
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 08:42:11 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-mCJKIPNuO7exlUAMAKSIIw-1; Fri, 10 Dec 2021 02:42:07 -0500
X-MC-Unique: mCJKIPNuO7exlUAMAKSIIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE4FA100C662;
	Fri, 10 Dec 2021 07:42:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A9F2100164A;
	Fri, 10 Dec 2021 07:42:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2DDF31806D1C;
	Fri, 10 Dec 2021 07:42:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BA7g1FN028468 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 10 Dec 2021 02:42:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 08713C08095; Fri, 10 Dec 2021 07:42:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 047ABC159F6
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:42:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D36273D2CE8C
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:42:00 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
	(out30-56.freemail.mail.aliyun.com [115.124.30.56]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-314-pSvDNtYcOTuPBYF9jBEAdA-1; Fri, 10 Dec 2021 02:41:59 -0500
X-MC-Unique: pSvDNtYcOTuPBYF9jBEAdA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R821e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V-83nvu_1639121798
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V-83nvu_1639121798) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 10 Dec 2021 15:36:39 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 10 Dec 2021 15:36:16 +0800
Message-Id: <20211210073619.21667-17-jefflexu@linux.alibaba.com>
In-Reply-To: <20211210073619.21667-1-jefflexu@linux.alibaba.com>
References: <20211210073619.21667-1-jefflexu@linux.alibaba.com>
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
Subject: [Linux-cachefs] [RFC 16/19] erofs: implement fscache-based data read
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/fscache.c  | 73 +++++++++++++++++++++++++++++++++++++++++++++
 fs/erofs/inode.c    |  6 +++-
 fs/erofs/internal.h |  1 +
 3 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 6fe31d410cbd..c849d3a89520 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -1,5 +1,78 @@
 #include "internal.h"
 
+/*
+ * erofs_fscache_readpage
+ *
+ * Copy data from backpage (bootstrap) to page of files among erofs.
+ */
+static int erofs_fscache_readpage(struct file *file, struct page *page)
+{
+	struct inode *inode = page->mapping->host;
+	struct super_block *sb = inode->i_sb;
+	erofs_off_t pos = page->index << PAGE_SHIFT;
+	struct erofs_map_blocks map = { .m_la = pos };
+	erofs_blk_t blkaddr;
+	struct page *backpage;
+	u64 total, batch, copied = 0;
+	char *vsrc, *vdst; /* virtual address of mapped src/dst page */
+	char *psrc, *pdst; /* cursor inside src/dst page */
+	u64 osrc;	   /* offset inside src page */
+	int err;
+
+	err = erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
+	if (err)
+		goto out;
+
+	total = min_t(u64, PAGE_SIZE, map.m_plen - (pos - map.m_la));
+	blkaddr = map.m_pa >> PAGE_SHIFT;
+	osrc = map.m_pa & (PAGE_SIZE - 1);
+
+	while (total) {
+		backpage = erofs_get_meta_page(sb, blkaddr);
+		if (IS_ERR(backpage)) {
+			err = PTR_ERR(backpage);
+			goto out;
+		}
+
+		vsrc = psrc = kmap_atomic(backpage);
+		vdst = pdst = kmap_atomic(page);
+
+		psrc += osrc;
+		pdst += copied;
+		batch = min_t(u64, PAGE_SIZE - osrc, total);
+
+		memcpy(pdst, psrc, batch);
+
+		copied += batch;
+		total  -= batch;
+		blkaddr++;
+		osrc = 0; /* copy from the beginning of the next backpage */
+
+		/*
+		 * Avoid 'scheduling while atomic' error. Unmap before going
+		 * into the next turn, since we may schedule inside
+		 * erofs_get_meta_page().
+		 * */
+		kunmap_atomic(vsrc);
+		kunmap_atomic(vdst);
+
+		unlock_page(backpage);
+		put_page(backpage);
+	}
+
+out:
+	if (err)
+		SetPageError(page);
+	else
+		SetPageUptodate(page);
+	unlock_page(page);
+	return err;
+}
+
+const struct address_space_operations erofs_fscache_access_aops = {
+	.readpage = erofs_fscache_readpage,
+};
+
 static int erofs_begin_cache_operation(struct netfs_read_request *rreq)
 {
 	return fscache_begin_read_operation(&rreq->cache_resources,
diff --git a/fs/erofs/inode.c b/fs/erofs/inode.c
index 2345f1de438e..452d147277c4 100644
--- a/fs/erofs/inode.c
+++ b/fs/erofs/inode.c
@@ -299,7 +299,11 @@ static int erofs_fill_inode(struct inode *inode, int isdir)
 		err = z_erofs_fill_inode(inode);
 		goto out_unlock;
 	}
-	inode->i_mapping->a_ops = &erofs_raw_access_aops;
+
+	if (inode->i_sb->s_bdev)
+		inode->i_mapping->a_ops = &erofs_raw_access_aops;
+	else
+		inode->i_mapping->a_ops = &erofs_fscache_access_aops;
 
 out_unlock:
 	unlock_page(page);
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index d60d9ffaef2a..dd3f2edae603 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -353,6 +353,7 @@ struct page *erofs_grab_cache_page_nowait(struct address_space *mapping,
 extern const struct super_operations erofs_sops;
 
 extern const struct address_space_operations erofs_raw_access_aops;
+extern const struct address_space_operations erofs_fscache_access_aops;
 extern const struct address_space_operations z_erofs_aops;
 
 /*
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

