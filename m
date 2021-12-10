Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A511846FBE6
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 08:38:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-zMP_bhbvPEONK4a0nENTiQ-1; Fri, 10 Dec 2021 02:38:35 -0500
X-MC-Unique: zMP_bhbvPEONK4a0nENTiQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79F67802C98;
	Fri, 10 Dec 2021 07:38:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A0BD60BF1;
	Fri, 10 Dec 2021 07:38:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 236AD1806D03;
	Fri, 10 Dec 2021 07:38:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BA7anru027945 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 10 Dec 2021 02:36:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 43079400E12D; Fri, 10 Dec 2021 07:36:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F4FD400F3F1
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 291371078461
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:49 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
	(out30-43.freemail.mail.aliyun.com [115.124.30.43]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-376-CUdTWexWOu69-l7Tbtn6nA-1; Fri, 10 Dec 2021 02:36:45 -0500
X-MC-Unique: CUdTWexWOu69-l7Tbtn6nA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V-8ADFS_1639121800
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V-8ADFS_1639121800) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 10 Dec 2021 15:36:40 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 10 Dec 2021 15:36:17 +0800
Message-Id: <20211210073619.21667-18-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [RFC 17/19] netfs: support on demand read
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add demand_read() callback to netfs_cache_ops to implement demand read.

To implement demand-read semantics, the data blob file is a sparse file
on the first beginning. When fs starts to access the data blob file, it
will "cache miss" (hit the  hole) and then .issue_op() callback will be
called to prepare the data.

.issue_op() callback could call netfs_demand_read() helper function
introduced in this patch to prepare the data, which will in turn call
.demand_read() callback of fscache backend.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/netfs/read_helper.c | 26 ++++++++++++++++++++++++++
 include/linux/netfs.h  |  4 ++++
 2 files changed, 30 insertions(+)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index ade1523fc180..3460cfd7a570 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -1125,6 +1125,32 @@ int netfs_readpage_demand(struct folio *folio,
 }
 EXPORT_SYMBOL(netfs_readpage_demand);
 
+void netfs_demand_read(struct netfs_read_subrequest *subreq)
+{
+	struct netfs_read_request *rreq = subreq->rreq;
+	struct netfs_cache_resources *cres = &rreq->cache_resources;
+	loff_t start_pos;
+	size_t len;
+	int ret;
+
+	start_pos = subreq->start + subreq->transferred;
+	len = subreq->len - subreq->transferred;
+
+	/*
+	 * In success case (ret == 0), user daemon has downloaded data for us,
+	 * thus transform to NETFS_READ_FROM_CACHE state and advertise that 0
+	 * byte readed, so that the request will enter into INCOMPLETE state and
+	 * re-read from backing file.
+	 */
+	ret = cres->ops->demand_read(cres, start_pos, len);
+	if (!ret) {
+		subreq->source = NETFS_READ_FROM_CACHE;
+		__clear_bit(NETFS_SREQ_WRITE_TO_CACHE, &subreq->flags);
+	}
+
+	netfs_subreq_terminated(subreq, ret, false);
+}
+
 /*
  * Prepare a folio for writing without reading first
  * @folio: The folio being prepared
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 5f45eb31defd..8a9dae361f07 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -253,6 +253,9 @@ struct netfs_cache_ops {
 	int (*prepare_write)(struct netfs_cache_resources *cres,
 			     loff_t *_start, size_t *_len, loff_t i_size,
 			     bool no_space_allocated_yet);
+
+	int (*demand_read)(struct netfs_cache_resources *cres,
+			   loff_t start_pos, size_t len);
 };
 
 struct readahead_control;
@@ -271,6 +274,7 @@ extern int netfs_write_begin(struct file *, struct address_space *,
 			     void **,
 			     const struct netfs_read_request_ops *,
 			     void *);
+extern void netfs_demand_read(struct netfs_read_subrequest *);
 
 extern void netfs_subreq_terminated(struct netfs_read_subrequest *, ssize_t, bool);
 extern void netfs_stats_show(struct seq_file *);
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

