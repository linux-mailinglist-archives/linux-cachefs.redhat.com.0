Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9D448D768
	for <lists+linux-cachefs@lfdr.de>; Thu, 13 Jan 2022 13:22:15 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-W5r45h7GOzqC5RhAWvqxLQ-1; Thu, 13 Jan 2022 07:22:11 -0500
X-MC-Unique: W5r45h7GOzqC5RhAWvqxLQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25FA6100CE84;
	Thu, 13 Jan 2022 12:22:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A539F105C72C;
	Thu, 13 Jan 2022 12:22:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 064191806D1D;
	Thu, 13 Jan 2022 12:22:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20DCM3Qs008484 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 13 Jan 2022 07:22:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DD951141DEDC; Thu, 13 Jan 2022 12:22:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9C921402408
	for <linux-cachefs@redhat.com>; Thu, 13 Jan 2022 12:22:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE8253C00116
	for <linux-cachefs@redhat.com>; Thu, 13 Jan 2022 12:22:03 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
	(out30-133.freemail.mail.aliyun.com [115.124.30.133]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-314-FLX0y-xBMpuAzHV4KI-mbQ-1; Thu, 13 Jan 2022 07:21:59 -0500
X-MC-Unique: FLX0y-xBMpuAzHV4KI-mbQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
	TI=SMTPD_---0V1k7FEs_1642076515
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V1k7FEs_1642076515) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 13 Jan 2022 20:21:55 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com
Date: Thu, 13 Jan 2022 20:21:55 +0800
Message-Id: <20220113122155.125320-1-jefflexu@linux.alibaba.com>
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
Cc: xiang@kernel.org, jlayton@kernel.org
Subject: [Linux-cachefs] [PATCH v2] netfs: Make @file optional in
	netfs_alloc_read_request()
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

Make the @file parameter optional, and derive inode from the @folio
parameter instead in order to support file system internal requests.

@file parameter can't be removed completely, since it also works as
the private data of ops->init_rreq().

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
changes since v2:
  simplify and improve commit message

v1: https://lore.kernel.org/lkml/47831875-4bdd-8398-9f2d-0466b31a4382@linux.alibaba.com/T/#m7a4be2ca1e993ff3fdb64d1b16c4f91977f91465
---
 fs/netfs/read_helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 8c58cff420ba..ca84918b6b5d 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -39,7 +39,7 @@ static void netfs_put_subrequest(struct netfs_read_subrequest *subreq,
 
 static struct netfs_read_request *netfs_alloc_read_request(
 	const struct netfs_read_request_ops *ops, void *netfs_priv,
-	struct file *file)
+	struct inode *inode, struct file *file)
 {
 	static atomic_t debug_ids;
 	struct netfs_read_request *rreq;
@@ -48,7 +48,7 @@ static struct netfs_read_request *netfs_alloc_read_request(
 	if (rreq) {
 		rreq->netfs_ops	= ops;
 		rreq->netfs_priv = netfs_priv;
-		rreq->inode	= file_inode(file);
+		rreq->inode	= inode;
 		rreq->i_size	= i_size_read(rreq->inode);
 		rreq->debug_id	= atomic_inc_return(&debug_ids);
 		INIT_LIST_HEAD(&rreq->subrequests);
@@ -870,6 +870,7 @@ void netfs_readahead(struct readahead_control *ractl,
 		     void *netfs_priv)
 {
 	struct netfs_read_request *rreq;
+	struct inode *inode = file_inode(ractl->file);
 	unsigned int debug_index = 0;
 	int ret;
 
@@ -878,7 +879,7 @@ void netfs_readahead(struct readahead_control *ractl,
 	if (readahead_count(ractl) == 0)
 		goto cleanup;
 
-	rreq = netfs_alloc_read_request(ops, netfs_priv, ractl->file);
+	rreq = netfs_alloc_read_request(ops, netfs_priv, inode, ractl->file);
 	if (!rreq)
 		goto cleanup;
 	rreq->mapping	= ractl->mapping;
@@ -948,12 +949,13 @@ int netfs_readpage(struct file *file,
 		   void *netfs_priv)
 {
 	struct netfs_read_request *rreq;
+	struct inode *inode = folio_file_mapping(folio)->host;
 	unsigned int debug_index = 0;
 	int ret;
 
 	_enter("%lx", folio_index(folio));
 
-	rreq = netfs_alloc_read_request(ops, netfs_priv, file);
+	rreq = netfs_alloc_read_request(ops, netfs_priv, inode, file);
 	if (!rreq) {
 		if (netfs_priv)
 			ops->cleanup(folio_file_mapping(folio), netfs_priv);
@@ -1122,7 +1124,7 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	}
 
 	ret = -ENOMEM;
-	rreq = netfs_alloc_read_request(ops, netfs_priv, file);
+	rreq = netfs_alloc_read_request(ops, netfs_priv, inode, file);
 	if (!rreq)
 		goto error;
 	rreq->mapping		= folio_file_mapping(folio);
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

