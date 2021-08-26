Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 289E03F88BE
	for <lists+linux-cachefs@lfdr.de>; Thu, 26 Aug 2021 15:25:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-rPFFBflZOjWNjYOlL1KNQg-1; Thu, 26 Aug 2021 09:24:56 -0400
X-MC-Unique: rPFFBflZOjWNjYOlL1KNQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17593193248A;
	Thu, 26 Aug 2021 13:24:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 490AF1ACC7;
	Thu, 26 Aug 2021 13:24:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0F3C4BB7C;
	Thu, 26 Aug 2021 13:24:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17QDOm2B023486 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 26 Aug 2021 09:24:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 72861F97C5; Thu, 26 Aug 2021 13:24:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D89AEE853
	for <linux-cachefs@redhat.com>; Thu, 26 Aug 2021 13:24:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55E23811E7A
	for <linux-cachefs@redhat.com>; Thu, 26 Aug 2021 13:24:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-559-PdD5ZLNNOTSLJ9NF2JAW1w-1;
	Thu, 26 Aug 2021 09:24:46 -0400
X-MC-Unique: PdD5ZLNNOTSLJ9NF2JAW1w-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id B651E610A3;
	Thu, 26 Aug 2021 13:24:44 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com, linux-cachefs@redhat.com
Date: Thu, 26 Aug 2021 09:24:42 -0400
Message-Id: <20210826132443.64047-2-jlayton@kernel.org>
In-Reply-To: <20210826132443.64047-1-jlayton@kernel.org>
References: <20210826132443.64047-1-jlayton@kernel.org>
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
Subject: [Linux-cachefs] [PATCH 1/2] netfs: refactor arguments for
	netfs_alloc_read_request
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

Pass start and len to the rreq allocator. This should ensure that the
fields are set so that init_rreq can use them.

Also pass in a readhead bool that indicates that the request is for a
readahead.  Add a new rreq flag to indicate that the request is for a
readahead. Ceph can use this to tell whether to get caps.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/netfs/read_helper.c | 37 ++++++++++++++++++++++---------------
 include/linux/netfs.h  |  1 +
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 7623a04ac7a6..d7129d2229e2 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -32,7 +32,8 @@ static void netfs_rreq_work(struct work_struct *);
 static void netfs_rreq_clear_buffer(struct netfs_read_request *);
 
 static struct netfs_read_request *netfs_alloc_read_request(struct address_space *mapping,
-							   struct file *file)
+							   struct file *file, loff_t start,
+							   size_t len, bool readahead)
 {
 	static atomic_t debug_ids;
 	struct inode *inode = file ? file_inode(file) : mapping->host;
@@ -41,6 +42,8 @@ static struct netfs_read_request *netfs_alloc_read_request(struct address_space
 
 	rreq = kzalloc(sizeof(struct netfs_read_request), GFP_KERNEL);
 	if (rreq) {
+		rreq->start = start;
+		rreq->len = len;
 		rreq->mapping	= mapping;
 		rreq->inode	= inode;
 		rreq->netfs_ops	= ctx->ops;
@@ -50,6 +53,8 @@ static struct netfs_read_request *netfs_alloc_read_request(struct address_space
 		INIT_LIST_HEAD(&rreq->subrequests);
 		INIT_WORK(&rreq->work, netfs_rreq_work);
 		refcount_set(&rreq->usage, 1);
+		if (readahead)
+			__set_bit(NETFS_RREQ_READAHEAD, &rreq->flags);
 		__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
 		if (test_bit(NETFS_ICTX_ENCRYPTED, &ctx->flags))
 			__set_bit(NETFS_RREQ_DECRYPT, &rreq->flags);
@@ -916,11 +921,10 @@ void netfs_readahead(struct readahead_control *ractl)
 	if (readahead_count(ractl) == 0)
 		return;
 
-	rreq = netfs_alloc_read_request(ractl->mapping, ractl->file);
+	rreq = netfs_alloc_read_request(ractl->mapping, ractl->file, readahead_pos(ractl),
+					readahead_length(ractl), true);
 	if (!rreq)
 		return;
-	rreq->start	= readahead_pos(ractl);
-	rreq->len	= readahead_length(ractl);
 
 	ret = netfs_begin_cache_operation(rreq, ctx);
 	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
@@ -981,11 +985,10 @@ int netfs_readpage(struct file *file, struct page *subpage)
 
 	_enter("%lx", folio_index(folio));
 
-	rreq = netfs_alloc_read_request(mapping, file);
+	rreq = netfs_alloc_read_request(mapping, file, folio_file_pos(folio),
+					folio_size(folio), false);
 	if (!rreq)
 		goto nomem;
-	rreq->start	= folio_file_pos(folio);
-	rreq->len	= folio_size(folio);
 
 	ret = netfs_begin_cache_operation(rreq, ctx);
 	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS) {
@@ -1172,7 +1175,8 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	}
 
 	ret = -ENOMEM;
-	rreq = netfs_alloc_read_request(mapping, file);
+	rreq = netfs_alloc_read_request(mapping, file, folio_file_pos(folio),
+					folio_size(folio), false);
 	if (!rreq)
 		goto error;
 	rreq->start		= folio_file_pos(folio);
@@ -1263,16 +1267,13 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 	struct netfs_i_context *ctx = netfs_i_context(mapping->host);
 	unsigned long long i_size, end;
 	unsigned int debug_index = 0;
+	loff_t rstart;
+	size_t rlen;
 	int ret;
 
 	DEFINE_READAHEAD(ractl, file, NULL, mapping, folio_index(folio));
 
 	ret = -ENOMEM;
-	rreq = netfs_alloc_read_request(mapping, file);
-	if (!rreq)
-		goto error;
-	rreq->no_unlock_folio	= folio_index(folio);
-	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
 
 	i_size = i_size_read(mapping->host);
 	end = round_up((unsigned long long)pos + len, 1U << ctx->min_bshift);
@@ -1280,9 +1281,15 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 		unsigned long long limit = round_up(pos + len, PAGE_SIZE);
 		end = max(limit, round_up(i_size, PAGE_SIZE));
 	}
-	rreq->start = round_down((unsigned long long)pos, 1U << ctx->min_bshift);
-	rreq->len   = end - rreq->start;
+	rstart = round_down((unsigned long long)pos, 1U << ctx->min_bshift);
+	rlen   = end - rstart;
 
+	rreq = netfs_alloc_read_request(mapping, file, rstart, rlen, false);
+	if (!rreq)
+		goto error;
+
+	rreq->no_unlock_folio	= folio_index(folio);
+	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
 	ret = netfs_begin_cache_operation(rreq, ctx);
 	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
 		goto error_put;
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 40b2805b8d20..8361db18d572 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -208,6 +208,7 @@ struct netfs_read_request {
 #define NETFS_RREQ_FAILED		4	/* The request failed */
 #define NETFS_RREQ_IN_PROGRESS		5	/* Unlocked when the request completes */
 #define NETFS_RREQ_DECRYPT		6	/* Decrypted when the request completes */
+#define NETFS_RREQ_READAHEAD		7	/* This is a readahead op */
 	const struct netfs_request_ops *netfs_ops;
 };
 
-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

