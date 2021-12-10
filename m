Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B55746FBBE
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 08:37:01 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-MEx_q8SgOWCRjRuFlRN5vQ-1; Fri, 10 Dec 2021 02:36:57 -0500
X-MC-Unique: MEx_q8SgOWCRjRuFlRN5vQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A49D8801B2A;
	Fri, 10 Dec 2021 07:36:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7374E604CC;
	Fri, 10 Dec 2021 07:36:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E7731809CBF;
	Fri, 10 Dec 2021 07:36:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BA7aZRQ027809 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 10 Dec 2021 02:36:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2C4F5400F3EC; Fri, 10 Dec 2021 07:36:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28A0E400E12D
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1061E397C08E
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:35 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
	(out30-130.freemail.mail.aliyun.com [115.124.30.130]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-510-V-Nxf-PpPkmP9lCiPQdlWQ-1; Fri, 10 Dec 2021 02:36:30 -0500
X-MC-Unique: V-Nxf-PpPkmP9lCiPQdlWQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V-80.nN_1639121785
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V-80.nN_1639121785) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 10 Dec 2021 15:36:26 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 10 Dec 2021 15:36:05 +0800
Message-Id: <20211210073619.21667-6-jefflexu@linux.alibaba.com>
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
Subject: [Linux-cachefs] [RFC 05/19] netfs: refactor netfs_alloc_read_request
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

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/netfs/read_helper.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 4247916c7100..9240b85548e4 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -37,7 +37,7 @@ static void netfs_put_subrequest(struct netfs_read_subrequest *subreq,
 		__netfs_put_subrequest(subreq, was_async);
 }
 
-static struct netfs_read_request *netfs_alloc_read_request(
+static struct netfs_read_request *__netfs_alloc_read_request(
 	const struct netfs_read_request_ops *ops, void *netfs_priv,
 	struct file *file)
 {
@@ -48,8 +48,6 @@ static struct netfs_read_request *netfs_alloc_read_request(
 	if (rreq) {
 		rreq->netfs_ops	= ops;
 		rreq->netfs_priv = netfs_priv;
-		rreq->inode	= file_inode(file);
-		rreq->i_size	= i_size_read(rreq->inode);
 		rreq->debug_id	= atomic_inc_return(&debug_ids);
 		INIT_LIST_HEAD(&rreq->subrequests);
 		INIT_WORK(&rreq->work, netfs_rreq_work);
@@ -63,6 +61,21 @@ static struct netfs_read_request *netfs_alloc_read_request(
 	return rreq;
 }
 
+static struct netfs_read_request *netfs_alloc_read_request(
+	const struct netfs_read_request_ops *ops, void *netfs_priv,
+	struct file *file)
+{
+	struct netfs_read_request *rreq;
+
+	rreq = __netfs_alloc_read_request(ops, netfs_priv, file);
+	if (rreq) {
+		rreq->inode	= file_inode(file);
+		rreq->i_size	= i_size_read(rreq->inode);
+	}
+
+	return rreq;
+}
+
 static void netfs_get_read_request(struct netfs_read_request *rreq)
 {
 	refcount_inc(&rreq->usage);
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

