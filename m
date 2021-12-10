Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F8C46FBE4
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 08:38:38 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-11-p1pz4kt-MuO_7W-CeXXd3g-1; Fri, 10 Dec 2021 02:38:34 -0500
X-MC-Unique: p1pz4kt-MuO_7W-CeXXd3g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E32E18C89CC;
	Fri, 10 Dec 2021 07:38:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EBE8196F4;
	Fri, 10 Dec 2021 07:38:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2313E4BB7C;
	Fri, 10 Dec 2021 07:38:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BA7abev027824 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 10 Dec 2021 02:36:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 50D9E1410F39; Fri, 10 Dec 2021 07:36:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CC5C1410F35
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33D99397C08F
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:37 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
	(out30-56.freemail.mail.aliyun.com [115.124.30.56]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-277-E54W55LZPiiQHtqXRKUMdQ-1; Fri, 10 Dec 2021 02:36:33 -0500
X-MC-Unique: E54W55LZPiiQHtqXRKUMdQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V-8E0Pr_1639121788
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V-8E0Pr_1639121788) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 10 Dec 2021 15:36:28 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 10 Dec 2021 15:36:07 +0800
Message-Id: <20211210073619.21667-8-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [RFC 07/19] netfs: add netfs_readpage_demand()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

netfs_readpage_demand() is the demand-read version of
netfs_readpage().

When netfs API works in demand-read mode, fs using fscache shall call
netfs_readpage_demand() instead.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/netfs/read_helper.c | 63 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h  |  3 ++
 2 files changed, 66 insertions(+)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 9240b85548e4..26fa688f6300 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -1022,6 +1022,69 @@ int netfs_readpage(struct file *file,
 }
 EXPORT_SYMBOL(netfs_readpage);
 
+int netfs_readpage_demand(struct folio *folio,
+			  const struct netfs_read_request_ops *ops,
+			  void *netfs_priv)
+{
+	struct netfs_read_request *rreq;
+	unsigned int debug_index = 0;
+	int ret;
+
+	_enter("%lx", folio_index(folio));
+
+	rreq = __netfs_alloc_read_request(ops, netfs_priv, NULL);
+	if (!rreq) {
+		if (netfs_priv)
+			ops->cleanup(netfs_priv, folio_file_mapping(folio));
+		folio_unlock(folio);
+		return -ENOMEM;
+	}
+	rreq->type	= NETFS_TYPE_DEMAND;
+	rreq->folio	= folio;
+	rreq->start	= folio_file_pos(folio);
+	rreq->len	= folio_size(folio);
+	__set_bit(NETFS_RREQ_DONT_UNLOCK_FOLIOS, &rreq->flags);
+
+	if (ops->begin_cache_operation) {
+		ret = ops->begin_cache_operation(rreq);
+		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS) {
+			folio_unlock(folio);
+			goto out;
+		}
+	}
+
+	netfs_stat(&netfs_n_rh_readpage);
+	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
+
+	netfs_get_read_request(rreq);
+
+	atomic_set(&rreq->nr_rd_ops, 1);
+	do {
+		if (!netfs_rreq_submit_slice(rreq, &debug_index))
+			break;
+
+	} while (rreq->submitted < rreq->len);
+
+	/* Keep nr_rd_ops incremented so that the ref always belongs to us, and
+	 * the service code isn't punted off to a random thread pool to
+	 * process.
+	 */
+	do {
+		wait_var_event(&rreq->nr_rd_ops, atomic_read(&rreq->nr_rd_ops) == 1);
+		netfs_rreq_assess(rreq, false);
+	} while (test_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags));
+
+	ret = rreq->error;
+	if (ret == 0 && rreq->submitted < rreq->len) {
+		trace_netfs_failure(rreq, NULL, ret, netfs_fail_short_readpage);
+		ret = -EIO;
+	}
+out:
+	netfs_put_read_request(rreq, false);
+	return ret;
+}
+EXPORT_SYMBOL(netfs_readpage_demand);
+
 /*
  * Prepare a folio for writing without reading first
  * @folio: The folio being prepared
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 638ea5d63869..de6948bcc80a 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -261,6 +261,9 @@ extern int netfs_readpage(struct file *,
 			  struct folio *,
 			  const struct netfs_read_request_ops *,
 			  void *);
+extern int netfs_readpage_demand(struct folio *,
+				 const struct netfs_read_request_ops *,
+				 void *);
 extern int netfs_write_begin(struct file *, struct address_space *,
 			     loff_t, unsigned int, unsigned int, struct folio **,
 			     void **,
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

