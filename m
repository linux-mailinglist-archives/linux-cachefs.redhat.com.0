Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D18A514C3C
	for <lists+linux-cachefs@lfdr.de>; Fri, 29 Apr 2022 16:06:08 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-j2vPz2b2On-AUwLSkm89CQ-1; Fri, 29 Apr 2022 10:06:06 -0400
X-MC-Unique: j2vPz2b2On-AUwLSkm89CQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3598E3C0FEAD;
	Fri, 29 Apr 2022 14:06:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0770407E1C1;
	Fri, 29 Apr 2022 14:06:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B315A194705D;
	Fri, 29 Apr 2022 14:05:59 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5C75D194704B for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 29 Apr 2022 10:26:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4F7BE407E243; Fri, 29 Apr 2022 10:26:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AC3C407E242
 for <linux-cachefs@redhat.com>; Fri, 29 Apr 2022 10:26:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3037638378A3
 for <linux-cachefs@redhat.com>; Fri, 29 Apr 2022 10:26:21 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-eCIs7cs9PUSNqIQfhiaPaA-1; Fri, 29 Apr 2022 06:26:19 -0400
X-MC-Unique: eCIs7cs9PUSNqIQfhiaPaA-1
Received: by mail-pl1-f171.google.com with SMTP id c23so6804800plo.0
 for <linux-cachefs@redhat.com>; Fri, 29 Apr 2022 03:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7v46THN9FW5FCtzg2pkw8vTHUChlhQMuA6c8DpWkVlI=;
 b=O3YCqDuhWginC66PpseZ0/gd68IJio+QBQAntIaoxTkwLYmODAMJJQhSgSzZrmpqoj
 b2UqhD3zkA7DT+mHKrHHFmXSi6Sv/0/JPdu0h52K8nBk5RMHDbye8hDPeROqxLKF2fzP
 80b+HlyPDyshs6AReceV8mxgZbwQSy/JOqUUTZYj6lP9wtHVUC1O9pzLRbewgwDpqxSK
 /lTvTo5xZ3pHE2rbOd4vKp9flrMs2JqSMroQT0B/lPUMZejuMTw4JxuyzsU7uhMFfUpf
 q/LX7R/0Cpyl0H/nCyX9CnwNQ83M03WNyO+JF4hsVultQUiKwGbUn5klAk4QiPB9dL6V
 p8Zg==
X-Gm-Message-State: AOAM530OA1zdZoeup1Dppf+ODpz2alKkYCZ82+8onfpqNHFPL9UGCpph
 LSM4BvxBtDkp/UZDrIRFtFzIKg==
X-Google-Smtp-Source: ABdhPJwbs+BsnrXencDJYY7fXsOiBR5tkGzb+MXY1lSDTrJ3nAc6riAD7LUMe2iAvSm0446/tTgIeg==
X-Received: by 2002:a17:90b:1a8f:b0:1d2:acdc:71d2 with SMTP id
 ng15-20020a17090b1a8f00b001d2acdc71d2mr3106237pjb.41.1651227978278; 
 Fri, 29 Apr 2022 03:26:18 -0700 (PDT)
Received: from yinxin.bytedance.net ([139.177.225.228])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a63ea45000000b003c1b2bea056sm1042659pgk.84.2022.04.29.03.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 03:26:17 -0700 (PDT)
From: Xin Yin <yinxin.x@bytedance.com>
To: jefflexu@linux.alibaba.com,
	xiang@kernel.org,
	dhowells@redhat.com
Date: Fri, 29 Apr 2022 07:38:49 +0800
Message-Id: <20220428233849.321495-2-yinxin.x@bytedance.com>
In-Reply-To: <20220428233849.321495-1-yinxin.x@bytedance.com>
References: <20220428233849.321495-1-yinxin.x@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Fri, 29 Apr 2022 14:05:58 +0000
Subject: [Linux-cachefs] [RFC PATCH 1/1] erofs: change to use asynchronous
 io for fscache readahead
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org, Xin Yin <yinxin.x@bytedance.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add erofs_fscache_read_folios_async helper which has same on-demand
read logic with erofs_fscache_read_folios, also support asynchronously
read data from fscache.And change .readahead() to use this new helper.

Signed-off-by: Xin Yin <yinxin.x@bytedance.com>
---
 fs/erofs/fscache.c | 256 ++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 245 insertions(+), 11 deletions(-)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index eaa50692ddba..4241f1cdc30b 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -5,6 +5,231 @@
 #include <linux/fscache.h>
 #include "internal.h"
 
+static void erofs_fscache_put_subrequest(struct netfs_io_subrequest *subreq);
+
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
+static void erofs_fscache_clear_subrequests(struct netfs_io_request *rreq)
+{
+	struct netfs_io_subrequest *subreq;
+
+	while (!list_empty(&rreq->subrequests)) {
+		subreq = list_first_entry(&rreq->subrequests,
+					  struct netfs_io_subrequest, rreq_link);
+		list_del(&subreq->rreq_link);
+		erofs_fscache_put_subrequest(subreq);
+	}
+}
+
+static void erofs_fscache_free_request(struct netfs_io_request *rreq)
+{
+	erofs_fscache_clear_subrequests(rreq);
+	if (rreq->cache_resources.ops)
+		rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
+	kfree(rreq);
+}
+
+static void erofs_fscache_put_request(struct netfs_io_request *rreq)
+{
+	bool dead;
+
+	dead = refcount_dec_and_test(&rreq->ref);
+	if (dead)
+		erofs_fscache_free_request(rreq);
+}
+
+
+static struct netfs_io_subrequest *
+	erofs_fscache_alloc_subrequest(struct netfs_io_request *rreq)
+{
+	struct netfs_io_subrequest *subreq;
+
+	subreq = kzalloc(sizeof(struct netfs_io_subrequest), GFP_KERNEL);
+	if (subreq) {
+		INIT_LIST_HEAD(&subreq->rreq_link);
+		refcount_set(&subreq->ref, 2);
+		subreq->rreq = rreq;
+		refcount_inc(&rreq->ref);
+	}
+
+	return subreq;
+}
+
+static void erofs_fscache_free_subrequest(struct netfs_io_subrequest *subreq)
+{
+	struct netfs_io_request *rreq = subreq->rreq;
+
+	kfree(subreq);
+	erofs_fscache_put_request(rreq);
+}
+
+static void erofs_fscache_put_subrequest(struct netfs_io_subrequest *subreq)
+{
+	bool dead;
+
+	dead = refcount_dec_and_test(&subreq->ref);
+	if (dead)
+		erofs_fscache_free_subrequest(subreq);
+}
+
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
+
+static void erofs_fscache_rreq_complete(struct netfs_io_request *rreq)
+{
+	erofs_fscache_rreq_unlock_folios(rreq);
+	erofs_fscache_clear_subrequests(rreq);
+	erofs_fscache_put_request(rreq);
+}
+
+static void erofc_fscache_subreq_complete(void *priv, ssize_t transferred_or_error,
+					bool was_async)
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
+static int erofs_fscache_read_folios_async(struct fscache_cookie *cookie,
+				     struct netfs_io_request *rreq,
+				     loff_t start, size_t len,
+				     loff_t pstart)
+{
+	enum netfs_io_source source;
+	struct netfs_io_subrequest *subreq;
+	struct netfs_cache_resources *cres;
+	struct iov_iter iter;
+	size_t done = 0;
+	int ret;
+
+	atomic_set(&rreq->nr_outstanding, 1);
+
+	cres = &rreq->cache_resources;
+	ret = fscache_begin_read_operation(cres, cookie);
+	if (ret)
+		goto out;
+
+	while (done < len) {
+		subreq = erofs_fscache_alloc_subrequest(rreq);
+		if (!subreq) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		subreq->start = pstart + done;
+		subreq->len	=  len - done;
+		subreq->flags = 1 << NETFS_SREQ_ONDEMAND;
+
+		list_add_tail(&subreq->rreq_link, &rreq->subrequests);
+
+		source = cres->ops->prepare_read(subreq, LLONG_MAX);
+		if (WARN_ON(subreq->len == 0))
+			source = NETFS_INVALID_READ;
+		if (source != NETFS_READ_FROM_CACHE) {
+			ret = -EIO;
+			erofs_fscache_put_subrequest(subreq);
+			goto out;
+		}
+
+		atomic_inc(&rreq->nr_outstanding);
+
+		iov_iter_xarray(&iter, READ, &rreq->mapping->i_pages,
+				start + done, subreq->len);
+
+		ret = fscache_read(cres, subreq->start, &iter,
+				   NETFS_READ_HOLE_FAIL, erofc_fscache_subreq_complete, subreq);
+
+		if (ret == -EIOCBQUEUED)
+			ret = 0;
+
+		if (ret) {
+			erofs_fscache_put_subrequest(subreq);
+			goto out;
+		}
+
+		done += subreq->len;
+	}
+out:
+	if (atomic_dec_and_test(&rreq->nr_outstanding))
+		erofs_fscache_rreq_complete(rreq);
+
+	return ret;
+}
+
 /*
  * Read data from fscache and fill the read data into page cache described by
  * @start/len, which shall be both aligned with PAGE_SIZE. @pstart describes
@@ -163,15 +388,16 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
 	return ret;
 }
 
-static void erofs_fscache_unlock_folios(struct readahead_control *rac,
-					size_t len)
+static void erofs_fscache_readahead_folios(struct readahead_control *rac,
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
 
@@ -193,6 +419,7 @@ static void erofs_fscache_readahead(struct readahead_control *rac)
 	do {
 		struct erofs_map_blocks map;
 		struct erofs_map_dev mdev;
+		struct netfs_io_request *rreq;
 
 		pos = start + done;
 		map.m_la = pos;
@@ -212,7 +439,7 @@ static void erofs_fscache_readahead(struct readahead_control *rac)
 					offset, count);
 			iov_iter_zero(count, &iter);
 
-			erofs_fscache_unlock_folios(rac, count);
+			erofs_fscache_readahead_folios(rac, count, true);
 			ret = count;
 			continue;
 		}
@@ -238,13 +465,20 @@ static void erofs_fscache_readahead(struct readahead_control *rac)
 		if (ret)
 			return;
 
-		ret = erofs_fscache_read_folios(mdev.m_fscache->cookie,
-				rac->mapping, offset, count,
+		rreq = erofs_fscache_alloc_request(rac->mapping, offset, count);
+		if (IS_ERR(rreq))
+			return;
+		/*
+		 * Drop the ref of folios here. Unlock them in
+		 * rreq_unlock_folios() when rreq complete.
+		 */
+		erofs_fscache_readahead_folios(rac, count, false);
+		ret = erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
+				rreq, offset, count,
 				mdev.m_pa + (pos - map.m_la));
-		if (!ret) {
-			erofs_fscache_unlock_folios(rac, count);
+
+		if (!ret)
 			ret = count;
-		}
 	} while (ret > 0 && ((done += ret) < len));
 }
 
-- 
2.11.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

