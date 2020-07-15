Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CD4EE22106F
	for <lists+linux-cachefs@lfdr.de>; Wed, 15 Jul 2020 17:11:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594825910;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gbY7bJ7GenxukssK4MCRRTL59lIaH728iIMHKY2I1Zg=;
	b=F45NYgm9JbBEpLto/FIPi1VmYsoDkB31sGnGTV2w7NnYZl41d8sPSizU5jS8VLqZPLHmJW
	qQeXCDkw1USjzrhtYDsZSJmGoW7YaNms4Bmlu6Rfr/C8OGraMMRdtlS1usEg47bESfso1j
	Ej/A0M5QPFL54/D/AKPcNmUVZxcfFgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-NsTL6KRaMeiJ6upVHbVt8A-1; Wed, 15 Jul 2020 11:11:47 -0400
X-MC-Unique: NsTL6KRaMeiJ6upVHbVt8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85130804B76;
	Wed, 15 Jul 2020 15:10:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 741CD79CF3;
	Wed, 15 Jul 2020 15:10:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A5521809561;
	Wed, 15 Jul 2020 15:10:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06FFAsQg021714 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 11:10:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ECB4B60BF4; Wed, 15 Jul 2020 15:10:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (ovpn-118-79.rdu2.redhat.com [10.10.118.79])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8234460BF1;
	Wed, 15 Jul 2020 15:10:54 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 15 Jul 2020 11:10:42 -0400
Message-Id: <1594825849-24991-7-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1594825849-24991-1-git-send-email-dwysocha@redhat.com>
References: <1594825849-24991-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v1 06/13] NFS: Rename
	readpage_async_filler() to nfs_pageio_add_page_read()
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename the function that handles adding a page to an existing
nfs_pageio_descriptor and export for future use.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/internal.h |  3 +++
 fs/nfs/read.c     | 13 ++++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index 6673a77884d9..df4ffe9afb6a 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -446,6 +446,9 @@ extern char *nfs_path(char **p, struct dentry *dentry,
 extern void nfs_pageio_init_read(struct nfs_pageio_descriptor *pgio,
 			struct inode *inode, bool force_mds,
 			const struct nfs_pgio_completion_ops *compl_ops);
+extern int nfs_pageio_add_page_read(void *data, struct page *page);
+extern void nfs_pageio_complete_read(struct nfs_pageio_descriptor *pgio,
+				     struct inode *inode);
 extern void nfs_read_prepare(struct rpc_task *task, void *calldata);
 extern void nfs_pageio_reset_read_mds(struct nfs_pageio_descriptor *pgio);
 
diff --git a/fs/nfs/read.c b/fs/nfs/read.c
index 32d359604220..de57bb692a4b 100644
--- a/fs/nfs/read.c
+++ b/fs/nfs/read.c
@@ -74,8 +74,8 @@ void nfs_pageio_init_read(struct nfs_pageio_descriptor *pgio,
 }
 EXPORT_SYMBOL_GPL(nfs_pageio_init_read);
 
-static void nfs_pageio_complete_read(struct nfs_pageio_descriptor *pgio,
-				     struct inode *inode)
+void nfs_pageio_complete_read(struct nfs_pageio_descriptor *pgio,
+			      struct inode *inode)
 {
 	struct nfs_pgio_mirror *pgm;
 	unsigned long npages;
@@ -158,7 +158,7 @@ static void nfs_read_completion(struct nfs_pgio_header *hdr)
 
 		if (test_bit(NFS_IOHDR_EOF, &hdr->flags)) {
 			/* note: regions of the page not covered by a
-			 * request are zeroed in readpage_async_filler */
+			 * request are zeroed in nfs_pageio_add_page_read */
 			if (bytes > hdr->good_bytes) {
 				/* nothing in this request was good, so zero
 				 * the full extent of the request */
@@ -290,8 +290,7 @@ static void nfs_readpage_result(struct rpc_task *task,
 		nfs_readpage_retry(task, hdr);
 }
 
-static int
-readpage_async_filler(void *data, struct page *page)
+int nfs_pageio_add_page_read(void *data, struct page *page)
 {
 	struct nfs_readdesc *desc = (struct nfs_readdesc *)data;
 	struct nfs_page *new;
@@ -375,7 +374,7 @@ int nfs_readpage(struct file *filp, struct page *page)
 	nfs_pageio_init_read(desc.pgio, inode, false,
 			     &nfs_async_read_completion_ops);
 
-	ret = readpage_async_filler(desc.pgio, page);
+	ret = nfs_pageio_add_page_read(desc.pgio, page);
 
 	if (!ret)
 		nfs_pageio_complete_read(desc.pgio, inode);
@@ -432,7 +431,7 @@ int nfs_readpages(struct file *filp, struct address_space *mapping,
 	nfs_pageio_init_read(&pgio, inode, false,
 			     &nfs_async_read_completion_ops);
 
-	ret = read_cache_pages(mapping, pages, readpage_async_filler, &desc);
+	ret = read_cache_pages(mapping, pages, nfs_pageio_add_page_read, &desc);
 
 	nfs_pageio_complete_read(desc.pgio, inode);
 
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

