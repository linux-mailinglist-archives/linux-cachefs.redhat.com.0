Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8021D46FBBF
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 08:37:01 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-143-wVSC6yTRN8m_HxisWQ_XYw-1; Fri, 10 Dec 2021 02:36:57 -0500
X-MC-Unique: wVSC6yTRN8m_HxisWQ_XYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 111393E746;
	Fri, 10 Dec 2021 07:36:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E80665BE14;
	Fri, 10 Dec 2021 07:36:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD5434BB7B;
	Fri, 10 Dec 2021 07:36:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BA7acDu027839 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 10 Dec 2021 02:36:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5A9EB4010FDD; Fri, 10 Dec 2021 07:36:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55CDB40CFD0A
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ED42800B21
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:38 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
	(out30-130.freemail.mail.aliyun.com [115.124.30.130]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-513-H34hsLBmPSaEcz5TGU3R5g-1; Fri, 10 Dec 2021 02:36:34 -0500
X-MC-Unique: H34hsLBmPSaEcz5TGU3R5g-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R791e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V-8PLPo_1639121789
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V-8PLPo_1639121789) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 10 Dec 2021 15:36:29 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 10 Dec 2021 15:36:08 +0800
Message-Id: <20211210073619.21667-9-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [RFC 08/19] netfs: refactor netfs_clear_unread()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In demand-read case, the input folio of netfs API is may not the page
cache inside the address space of the netfs file. Instead it may be just
a temporary page used to contain the data.

In this case, use bvec based iov_iter.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/netfs/read_helper.c | 33 +++++++++++++++++++++++++++------
 include/linux/netfs.h  |  2 ++
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 26fa688f6300..04d0cc2fca83 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -157,6 +157,18 @@ static void __netfs_put_subrequest(struct netfs_read_subrequest *subreq,
 	netfs_put_read_request(rreq, was_async);
 }
 
+static void netfs_init_iov_iter_bvec(struct netfs_read_subrequest *subreq,
+				     struct iov_iter *iter)
+{
+	struct bio_vec *bvec = &subreq->bvec;
+
+	bvec->bv_page	= folio_page(subreq->rreq->folio, 0);
+	bvec->bv_offset	= subreq->start + subreq->transferred;
+	bvec->bv_len	= subreq->len   - subreq->transferred;
+
+	iov_iter_bvec(iter, READ, bvec, 1, bvec->bv_len);
+}
+
 /*
  * Clear the unread part of an I/O request.
  */
@@ -164,9 +176,14 @@ static void netfs_clear_unread(struct netfs_read_subrequest *subreq)
 {
 	struct iov_iter iter;
 
-	iov_iter_xarray(&iter, READ, &subreq->rreq->mapping->i_pages,
-			subreq->start + subreq->transferred,
-			subreq->len   - subreq->transferred);
+	if (subreq->rreq->type == NETFS_TYPE_CACHE) {
+		iov_iter_xarray(&iter, READ, &subreq->rreq->mapping->i_pages,
+				subreq->start + subreq->transferred,
+				subreq->len   - subreq->transferred);
+	} else { /* type == NETFS_TYPE_DEMAND */
+		netfs_init_iov_iter_bvec(subreq, &iter);
+	}
+
 	iov_iter_zero(iov_iter_count(&iter), &iter);
 }
 
@@ -190,9 +207,13 @@ static void netfs_read_from_cache(struct netfs_read_request *rreq,
 	struct iov_iter iter;
 
 	netfs_stat(&netfs_n_rh_read);
-	iov_iter_xarray(&iter, READ, &rreq->mapping->i_pages,
-			subreq->start + subreq->transferred,
-			subreq->len   - subreq->transferred);
+	if (subreq->rreq->type == NETFS_TYPE_CACHE) {
+		iov_iter_xarray(&iter, READ, &subreq->rreq->mapping->i_pages,
+				subreq->start + subreq->transferred,
+				subreq->len   - subreq->transferred);
+	} else { /* type == NETFS_TYPE_DEMAND */
+		netfs_init_iov_iter_bvec(subreq, &iter);
+	}
 
 	cres->ops->read(cres, subreq->start, &iter, read_hole,
 			netfs_cache_read_terminated, subreq);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index de6948bcc80a..5f45eb31defd 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -17,6 +17,7 @@
 #include <linux/workqueue.h>
 #include <linux/fs.h>
 #include <linux/pagemap.h>
+#include <linux/bvec.h>
 
 /*
  * Overload PG_private_2 to give us PG_fscache - this is used to indicate that
@@ -146,6 +147,7 @@ struct netfs_read_subrequest {
 #define NETFS_SREQ_SHORT_READ		2	/* Set if there was a short read from the cache */
 #define NETFS_SREQ_SEEK_DATA_READ	3	/* Set if ->read() should SEEK_DATA first */
 #define NETFS_SREQ_NO_PROGRESS		4	/* Set if we didn't manage to read any data */
+	struct bio_vec 		bvec;
 };
 
 enum netfs_read_request_type {
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

