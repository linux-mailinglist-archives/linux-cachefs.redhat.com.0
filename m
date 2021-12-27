Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C738747FD32
	for <lists+linux-cachefs@lfdr.de>; Mon, 27 Dec 2021 14:01:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-2CSNFzKrOxijU3yMq6ppiw-1; Mon, 27 Dec 2021 08:01:49 -0500
X-MC-Unique: 2CSNFzKrOxijU3yMq6ppiw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF393102CB2A;
	Mon, 27 Dec 2021 13:01:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF49822E1C;
	Mon, 27 Dec 2021 13:01:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A07E61832B19;
	Mon, 27 Dec 2021 13:01:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BRD1k6m004315 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 27 Dec 2021 08:01:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8134053C6; Mon, 27 Dec 2021 13:01:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C1EA53D0
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 13:01:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BE00185A7B2
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 13:01:43 +0000 (UTC)
Received: from out30-44.freemail.mail.aliyun.com
	(out30-44.freemail.mail.aliyun.com [115.124.30.44]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-387-jUWF21NIP_-6LcGbtVC7dA-1; Mon, 27 Dec 2021 08:01:40 -0500
X-MC-Unique: jUWF21NIP_-6LcGbtVC7dA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R781e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V.wXYTl_1640609690
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V.wXYTl_1640609690) by smtp.aliyun-inc.com(127.0.0.1);
	Mon, 27 Dec 2021 20:54:50 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon, 27 Dec 2021 20:54:26 +0800
Message-Id: <20211227125444.21187-6-jefflexu@linux.alibaba.com>
In-Reply-To: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [PATCH v1 05/23] netfs: add inode parameter to
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When working as the local cache, the @file parameter of
netfs_alloc_read_request() represents the backed file inside netfs. It
is for two use: 1) we can derive the corresponding inode from file,
2) works as the argument for ops->init_rreq().

In the new introduced demand-read mode, netfs_readpage() will be called
by the upper fs to read from backing files. However in this new mode,
the backed file may not be opened, and thus the @file argument is NULL
in this case.

For netfs_readpage(), @file parameter represents the backed file inside
netfs, while @folio parameter represents one page cache inside the
address space of this backed file. We can still derive the inode from
the @folio parameter, even when @file parameter is NULL.

Thus refactor netfs_alloc_read_request() somewhat for this change.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
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

