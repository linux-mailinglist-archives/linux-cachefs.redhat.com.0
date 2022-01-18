Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6EF492691
	for <lists+linux-cachefs@lfdr.de>; Tue, 18 Jan 2022 14:12:40 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-sX3-FbLQOSaYTfe1o2kLyQ-1; Tue, 18 Jan 2022 08:12:36 -0500
X-MC-Unique: sX3-FbLQOSaYTfe1o2kLyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF00A64141;
	Tue, 18 Jan 2022 13:12:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D18DB6E1E0;
	Tue, 18 Jan 2022 13:12:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A7301809CB8;
	Tue, 18 Jan 2022 13:12:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IDCTm3010034 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 08:12:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E548D400F3EC; Tue, 18 Jan 2022 13:12:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E18E7400E13A
	for <linux-cachefs@redhat.com>; Tue, 18 Jan 2022 13:12:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C930E805F46
	for <linux-cachefs@redhat.com>; Tue, 18 Jan 2022 13:12:28 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
	(out30-42.freemail.mail.aliyun.com [115.124.30.42]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-665-WSGoxyYUNPq3BZvEbgW1Gw-1; Tue, 18 Jan 2022 08:12:26 -0500
X-MC-Unique: WSGoxyYUNPq3BZvEbgW1Gw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V2C5CnK_1642511540
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V2C5CnK_1642511540) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 18 Jan 2022 21:12:20 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Tue, 18 Jan 2022 21:11:59 +0800
Message-Id: <20220118131216.85338-4-jefflexu@linux.alibaba.com>
In-Reply-To: <20220118131216.85338-1-jefflexu@linux.alibaba.com>
References: <20220118131216.85338-1-jefflexu@linux.alibaba.com>
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
Subject: [Linux-cachefs] [PATCH v2 03/20] netfs,
	fscache: support on-demand reading
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add ondemand_read() callback to netfs_cache_ops to implement on-demand
reading.

The precondition for implementing on-demand reading semantic is that,
all blob files have been placed under corresponding directory with
correct file size (sparse files) on the first beginning. When upper fs
starts to access the blob file, it will "cache miss" (hit the hole) and
then .issue_op() callback will be called to prepare the data.

The following working flow is described as below. The .issue_op()
callback could be implemented by netfs_ondemand_read() helper, which
will in turn call .ondemand_read() callback of corresponding fscache
backend to prepare the data.

The implementation of .ondemand_read() callback can be backend specific.
The following patch will introduce an implementation of .ondemand_read()
callback for cachefiles, which will notify user daemon the requested
file range to read. The .ondemand_read() callback will get blocked until
the user daemon has prepared the corresponding data.

Then once .ondemand_read() callback returns with 0, it is guaranteed
that the requested data has been ready. In this case, transform this IO
request to NETFS_READ_FROM_CACHE state, initiate an incomplete
completion and then retry to read from backing file.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/fscache/Kconfig     |  8 ++++++++
 fs/netfs/Kconfig       |  8 ++++++++
 fs/netfs/read_helper.c | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h  |  8 ++++++++
 4 files changed, 61 insertions(+)

diff --git a/fs/fscache/Kconfig b/fs/fscache/Kconfig
index 76316c4a3fb7..f6b5396759ee 100644
--- a/fs/fscache/Kconfig
+++ b/fs/fscache/Kconfig
@@ -41,3 +41,11 @@ config FSCACHE_DEBUG
 
 config FSCACHE_OLD_API
 	bool
+
+config FSCACHE_ONDEMAND
+	bool "Support for on-demand reading"
+	depends on FSCACHE
+	select NETFS_ONDEMAND
+	help
+	  This permits on-demand reading with fscache.
+	  If unsure, say N.
diff --git a/fs/netfs/Kconfig b/fs/netfs/Kconfig
index b4db21022cb4..c4bdd0b032dd 100644
--- a/fs/netfs/Kconfig
+++ b/fs/netfs/Kconfig
@@ -21,3 +21,11 @@ config NETFS_STATS
 	  multi-CPU system these may be on cachelines that keep bouncing
 	  between CPUs.  On the other hand, the stats are very useful for
 	  debugging purposes.  Saying 'Y' here is recommended.
+
+config NETFS_ONDEMAND
+	bool "Support for on-demand reading"
+	depends on NETFS_SUPPORT
+	default n
+	help
+	  This enables on-demand reading with netfs API.
+	  If unsure, say N.
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 077c0ca96612..b84c184c365d 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -1013,6 +1013,43 @@ int netfs_readpage(struct file *file,
 }
 EXPORT_SYMBOL(netfs_readpage);
 
+#ifdef CONFIG_NETFS_ONDEMAND
+void netfs_ondemand_read(struct netfs_read_subrequest *subreq)
+{
+	struct netfs_read_request *rreq = subreq->rreq;
+	struct netfs_cache_resources *cres = &rreq->cache_resources;
+	loff_t start_pos;
+	size_t len;
+	int ret = -ENOBUFS;
+
+	/* The cache backend may not be accessible at this moment. */
+	if (!cres->ops)
+		goto out;
+
+	if (!cres->ops->ondemand_read) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
+	start_pos = subreq->p_start + subreq->transferred;
+	len = subreq->len - subreq->transferred;
+
+	/*
+	 * In success case (ret == 0), user daemon has prepared data for
+	 * us, thus transform to NETFS_READ_FROM_CACHE state and
+	 * advertise that 0 byte readed, so that the request will enter
+	 * into INCOMPLETE state and retry to read from backing file.
+	 */
+	ret = cres->ops->ondemand_read(cres, start_pos, len);
+	if (!ret) {
+		subreq->source = NETFS_READ_FROM_CACHE;
+		__clear_bit(NETFS_SREQ_WRITE_TO_CACHE, &subreq->flags);
+	}
+out:
+	netfs_subreq_terminated(subreq, ret, false);
+}
+#endif
+
 /*
  * Prepare a folio for writing without reading first
  * @folio: The folio being prepared
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index a17740b3b9d6..d6e041293dcc 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -246,6 +246,11 @@ struct netfs_cache_ops {
 	int (*prepare_write)(struct netfs_cache_resources *cres,
 			     loff_t *_start, size_t *_len, loff_t i_size,
 			     bool no_space_allocated_yet);
+
+#ifdef CONFIG_NETFS_ONDEMAND
+	int (*ondemand_read)(struct netfs_cache_resources *cres,
+			     loff_t start_pos, size_t len);
+#endif
 };
 
 struct readahead_control;
@@ -261,6 +266,9 @@ extern int netfs_write_begin(struct file *, struct address_space *,
 			     void **,
 			     const struct netfs_read_request_ops *,
 			     void *);
+#ifdef CONFIG_NETFS_ONDEMAND
+extern void netfs_ondemand_read(struct netfs_read_subrequest *);
+#endif
 
 extern void netfs_subreq_terminated(struct netfs_read_subrequest *, ssize_t, bool);
 extern void netfs_stats_show(struct seq_file *);
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

