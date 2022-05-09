Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FC351F583
	for <lists+linux-cachefs@lfdr.de>; Mon,  9 May 2022 09:41:20 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-pnwjIPv1N-aWZk1rK7GS5w-1; Mon, 09 May 2022 03:41:16 -0400
X-MC-Unique: pnwjIPv1N-aWZk1rK7GS5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9A7B101AA45;
	Mon,  9 May 2022 07:41:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DDA6040CF8FF;
	Mon,  9 May 2022 07:41:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BA1CA1947066;
	Mon,  9 May 2022 07:41:15 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 022B91947042 for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  9 May 2022 07:41:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C79CA416386; Mon,  9 May 2022 07:41:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3B70403152
 for <linux-cachefs@redhat.com>; Mon,  9 May 2022 07:41:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7FED80B712
 for <linux-cachefs@redhat.com>; Mon,  9 May 2022 07:41:13 +0000 (UTC)
Received: from out199-2.us.a.mail.aliyun.com (out199-2.us.a.mail.aliyun.com
 [47.90.199.2]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-BiVmyWiRPlGL5XDxsUC8pg-1; Mon, 09 May 2022 03:41:11 -0400
X-MC-Unique: BiVmyWiRPlGL5XDxsUC8pg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=20; SR=0; TI=SMTPD_---0VCgwzGy_1652082063
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VCgwzGy_1652082063) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 09 May 2022 15:41:04 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon,  9 May 2022 15:40:28 +0800
Message-Id: <20220509074028.74954-23-jefflexu@linux.alibaba.com>
In-Reply-To: <20220509074028.74954-1-jefflexu@linux.alibaba.com>
References: <20220509074028.74954-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Linux-cachefs] [PATCH v11 22/22] erofs: change to use asynchronous
 io for fscache readpage/readahead
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
Cc: zhujia.zj@bytedance.com, gregkh@linuxfoundation.org,
 tao.peng@linux.alibaba.com, willy@infradead.org, linux-kernel@vger.kernel.org,
 tianzichen@kuaishou.com, joseph.qi@linux.alibaba.com,
 zhangjiachen.jaycee@bytedance.com, bo.liu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org, yinxin.x@bytedance.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Xin Yin <yinxin.x@bytedance.com>

Use asynchronous io to read data from fscache may greatly improve IO
bandwidth for sequential buffer read scenario.

Change erofs_fscache_read_folios to erofs_fscache_read_folios_async,
and read data from fscache asynchronously.
Make .readpage()/.readahead() to use this new helper.

Signed-off-by: Xin Yin <yinxin.x@bytedance.com>
Reviewed-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/fscache.c | 239 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 199 insertions(+), 40 deletions(-)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index a402d8f0a063..f23fde003c6d 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -5,57 +5,203 @@
 #include <linux/fscache.h>
 #include "internal.h"
 
+static struct netfs_io_request *erofs_fscache_alloc_request(struct address_space *mapping,
+					     loff_t start, size_t len)
+{
+	struct netfs_io_request *rreq;
+
+	rreq = kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
+	if (!rreq)
+		return ERR_PTR(-ENOMEM);
+
+	rreq->start	= start;
+	rreq->len	= len;
+	rreq->mapping	= mapping;
+	INIT_LIST_HEAD(&rreq->subrequests);
+	refcount_set(&rreq->ref, 1);
+
+	return rreq;
+}
+
+static void erofs_fscache_put_request(struct netfs_io_request *rreq)
+{
+	if (refcount_dec_and_test(&rreq->ref)) {
+		if (rreq->cache_resources.ops)
+			rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
+		kfree(rreq);
+	}
+}
+
+static void erofs_fscache_put_subrequest(struct netfs_io_subrequest *subreq)
+{
+	if (refcount_dec_and_test(&subreq->ref)) {
+		erofs_fscache_put_request(subreq->rreq);
+		kfree(subreq);
+	}
+}
+
+static void erofs_fscache_clear_subrequests(struct netfs_io_request *rreq)
+{
+	struct netfs_io_subrequest *subreq;
+
+	while (!list_empty(&rreq->subrequests)) {
+		subreq = list_first_entry(&rreq->subrequests,
+				struct netfs_io_subrequest, rreq_link);
+		list_del(&subreq->rreq_link);
+		erofs_fscache_put_subrequest(subreq);
+	}
+}
+
+static void erofs_fscache_rreq_unlock_folios(struct netfs_io_request *rreq)
+{
+	struct netfs_io_subrequest *subreq;
+	struct folio *folio;
+	unsigned int iopos;
+	pgoff_t start_page = rreq->start / PAGE_SIZE;
+	pgoff_t last_page = ((rreq->start + rreq->len) / PAGE_SIZE) - 1;
+	bool subreq_failed = false;
+
+	XA_STATE(xas, &rreq->mapping->i_pages, start_page);
+
+	subreq = list_first_entry(&rreq->subrequests,
+				  struct netfs_io_subrequest, rreq_link);
+	iopos = 0;
+	subreq_failed = (subreq->error < 0);
+
+	rcu_read_lock();
+	xas_for_each(&xas, folio, last_page) {
+		unsigned int pgpos = (folio_index(folio) - start_page) * PAGE_SIZE;
+		unsigned int pgend = pgpos + folio_size(folio);
+		bool pg_failed = false;
+
+		for (;;) {
+			if (!subreq) {
+				pg_failed = true;
+				break;
+			}
+
+			pg_failed |= subreq_failed;
+			if (pgend < iopos + subreq->len)
+				break;
+
+			iopos += subreq->len;
+			if (!list_is_last(&subreq->rreq_link, &rreq->subrequests)) {
+				subreq = list_next_entry(subreq, rreq_link);
+				subreq_failed = (subreq->error < 0);
+			} else {
+				subreq = NULL;
+				subreq_failed = false;
+			}
+			if (pgend == iopos)
+				break;
+		}
+
+		if (!pg_failed)
+			folio_mark_uptodate(folio);
+
+		folio_unlock(folio);
+	}
+	rcu_read_unlock();
+}
+
+static void erofs_fscache_rreq_complete(struct netfs_io_request *rreq)
+{
+	erofs_fscache_rreq_unlock_folios(rreq);
+	erofs_fscache_clear_subrequests(rreq);
+	erofs_fscache_put_request(rreq);
+}
+
+static void erofc_fscache_subreq_complete(void *priv,
+		ssize_t transferred_or_error, bool was_async)
+{
+	struct netfs_io_subrequest *subreq = priv;
+	struct netfs_io_request *rreq = subreq->rreq;
+
+	if (IS_ERR_VALUE(transferred_or_error))
+		subreq->error = transferred_or_error;
+
+	if (atomic_dec_and_test(&rreq->nr_outstanding))
+		erofs_fscache_rreq_complete(rreq);
+
+	erofs_fscache_put_subrequest(subreq);
+}
+
 /*
  * Read data from fscache and fill the read data into page cache described by
- * @start/len, which shall be both aligned with PAGE_SIZE. @pstart describes
+ * @rreq, which shall be both aligned with PAGE_SIZE. @pstart describes
  * the start physical address in the cache file.
  */
-static int erofs_fscache_read_folios(struct fscache_cookie *cookie,
-				     struct address_space *mapping,
-				     loff_t start, size_t len,
+static int erofs_fscache_read_folios_async(struct fscache_cookie *cookie,
+				     struct netfs_io_request *rreq,
 				     loff_t pstart)
 {
 	enum netfs_io_source source;
-	struct netfs_io_request rreq = {};
-	struct netfs_io_subrequest subreq = { .rreq = &rreq, };
-	struct netfs_cache_resources *cres = &rreq.cache_resources;
-	struct super_block *sb = mapping->host->i_sb;
+	struct super_block *sb = rreq->mapping->host->i_sb;
+	struct netfs_io_subrequest *subreq;
+	struct netfs_cache_resources *cres = &rreq->cache_resources;
 	struct iov_iter iter;
+	loff_t start = rreq->start;
+	size_t len = rreq->len;
 	size_t done = 0;
 	int ret;
 
+	atomic_set(&rreq->nr_outstanding, 1);
+
 	ret = fscache_begin_read_operation(cres, cookie);
 	if (ret)
-		return ret;
+		goto out;
 
 	while (done < len) {
-		subreq.start = pstart + done;
-		subreq.len = len - done;
-		subreq.flags = 1 << NETFS_SREQ_ONDEMAND;
+		subreq = kzalloc(sizeof(struct netfs_io_subrequest), GFP_KERNEL);
+		if (subreq) {
+			INIT_LIST_HEAD(&subreq->rreq_link);
+			refcount_set(&subreq->ref, 2);
+			subreq->rreq = rreq;
+			refcount_inc(&rreq->ref);
+		} else {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		subreq->start = pstart + done;
+		subreq->len	=  len - done;
+		subreq->flags = 1 << NETFS_SREQ_ONDEMAND;
 
-		source = cres->ops->prepare_read(&subreq, LLONG_MAX);
-		if (WARN_ON(subreq.len == 0))
+		list_add_tail(&subreq->rreq_link, &rreq->subrequests);
+
+		source = cres->ops->prepare_read(subreq, LLONG_MAX);
+		if (WARN_ON(subreq->len == 0))
 			source = NETFS_INVALID_READ;
 		if (source != NETFS_READ_FROM_CACHE) {
 			erofs_err(sb, "failed to fscache prepare_read (source %d)",
 				  source);
 			ret = -EIO;
+			subreq->error = ret;
+			erofs_fscache_put_subrequest(subreq);
 			goto out;
 		}
 
-		iov_iter_xarray(&iter, READ, &mapping->i_pages,
-				start + done, subreq.len);
-		ret = fscache_read(cres, subreq.start, &iter,
-				   NETFS_READ_HOLE_FAIL, NULL, NULL);
+		atomic_inc(&rreq->nr_outstanding);
+
+		iov_iter_xarray(&iter, READ, &rreq->mapping->i_pages,
+				start + done, subreq->len);
+
+		ret = fscache_read(cres, subreq->start, &iter,
+				   NETFS_READ_HOLE_FAIL,
+				   erofc_fscache_subreq_complete, subreq);
+		if (ret == -EIOCBQUEUED)
+			ret = 0;
 		if (ret) {
 			erofs_err(sb, "failed to fscache_read (ret %d)", ret);
 			goto out;
 		}
 
-		done += subreq.len;
+		done += subreq->len;
 	}
 out:
-	fscache_end_operation(cres);
+	if (atomic_dec_and_test(&rreq->nr_outstanding))
+		erofs_fscache_rreq_complete(rreq);
+
 	return ret;
 }
 
@@ -64,6 +210,7 @@ static int erofs_fscache_meta_readpage(struct file *data, struct page *page)
 	int ret;
 	struct folio *folio = page_folio(page);
 	struct super_block *sb = folio_mapping(folio)->host->i_sb;
+	struct netfs_io_request *rreq;
 	struct erofs_map_dev mdev = {
 		.m_deviceid = 0,
 		.m_pa = folio_pos(folio),
@@ -73,11 +220,13 @@ static int erofs_fscache_meta_readpage(struct file *data, struct page *page)
 	if (ret)
 		goto out;
 
-	ret = erofs_fscache_read_folios(mdev.m_fscache->cookie,
-			folio_mapping(folio), folio_pos(folio),
-			folio_size(folio), mdev.m_pa);
-	if (!ret)
-		folio_mark_uptodate(folio);
+	rreq = erofs_fscache_alloc_request(folio_mapping(folio),
+				folio_pos(folio), folio_size(folio));
+	if (IS_ERR(rreq))
+		goto out;
+
+	return erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
+				rreq, mdev.m_pa);
 out:
 	folio_unlock(folio);
 	return ret;
@@ -117,6 +266,7 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
 	struct super_block *sb = inode->i_sb;
 	struct erofs_map_blocks map;
 	struct erofs_map_dev mdev;
+	struct netfs_io_request *rreq;
 	erofs_off_t pos;
 	loff_t pstart;
 	int ret;
@@ -149,10 +299,15 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
 	if (ret)
 		goto out_unlock;
 
+
+	rreq = erofs_fscache_alloc_request(folio_mapping(folio),
+				folio_pos(folio), folio_size(folio));
+	if (IS_ERR(rreq))
+		goto out_unlock;
+
 	pstart = mdev.m_pa + (pos - map.m_la);
-	ret = erofs_fscache_read_folios(mdev.m_fscache->cookie,
-			folio_mapping(folio), folio_pos(folio),
-			folio_size(folio), pstart);
+	return erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
+				rreq, pstart);
 
 out_uptodate:
 	if (!ret)
@@ -162,15 +317,16 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
 	return ret;
 }
 
-static void erofs_fscache_unlock_folios(struct readahead_control *rac,
-					size_t len)
+static void erofs_fscache_advance_folios(struct readahead_control *rac,
+					size_t len, bool unlock)
 {
 	while (len) {
 		struct folio *folio = readahead_folio(rac);
-
 		len -= folio_size(folio);
-		folio_mark_uptodate(folio);
-		folio_unlock(folio);
+		if (unlock) {
+			folio_mark_uptodate(folio);
+			folio_unlock(folio);
+		}
 	}
 }
 
@@ -192,6 +348,7 @@ static void erofs_fscache_readahead(struct readahead_control *rac)
 	do {
 		struct erofs_map_blocks map;
 		struct erofs_map_dev mdev;
+		struct netfs_io_request *rreq;
 
 		pos = start + done;
 		map.m_la = pos;
@@ -211,7 +368,7 @@ static void erofs_fscache_readahead(struct readahead_control *rac)
 					offset, count);
 			iov_iter_zero(count, &iter);
 
-			erofs_fscache_unlock_folios(rac, count);
+			erofs_fscache_advance_folios(rac, count, true);
 			ret = count;
 			continue;
 		}
@@ -237,15 +394,17 @@ static void erofs_fscache_readahead(struct readahead_control *rac)
 		if (ret)
 			return;
 
-		ret = erofs_fscache_read_folios(mdev.m_fscache->cookie,
-				rac->mapping, offset, count,
-				mdev.m_pa + (pos - map.m_la));
+		rreq = erofs_fscache_alloc_request(rac->mapping, offset, count);
+		if (IS_ERR(rreq))
+			return;
 		/*
-		 * For the error cases, the folios will be unlocked when
-		 * .readahead() returns.
+		 * Drop the ref of folios here. Unlock them in
+		 * rreq_unlock_folios() when rreq complete.
 		 */
+		erofs_fscache_advance_folios(rac, count, false);
+		ret = erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
+					rreq, mdev.m_pa + (pos - map.m_la));
 		if (!ret) {
-			erofs_fscache_unlock_folios(rac, count);
 			ret = count;
 		}
 	} while (ret > 0 && ((done += ret) < len));
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

