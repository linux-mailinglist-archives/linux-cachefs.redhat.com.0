Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AE94A69CCC4
	for <lists+linux-cachefs@lfdr.de>; Mon, 20 Feb 2023 14:43:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676900605;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tlNrZcKkv1ddNCKLKwGA+e9Eagfybcc6mFJlhj5h+F4=;
	b=MwdaVnOVY0YUoJ62x2lJg+49Xo/RMBXJz2jhKvn0ZJX8N+tOVSQg2TO4nhCSZhFJqCvAqC
	h7thAaT6kpig18KF3IG+ZfBjzMHIIiLBVP/Bjc8aliuOMdqqYRzEldXfcv68Kcx3IzyyP9
	a96Eh+FGOZVOBOtpqjjOKtFGQBAwwzo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-L5ixz86nOJqtEBcGkuieNw-1; Mon, 20 Feb 2023 08:43:20 -0500
X-MC-Unique: L5ixz86nOJqtEBcGkuieNw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E1733815EE5;
	Mon, 20 Feb 2023 13:43:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5EAF2166B26;
	Mon, 20 Feb 2023 13:43:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 272DC1946597;
	Mon, 20 Feb 2023 13:43:11 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 13526194658D for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 20 Feb 2023 13:43:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 06FA0404CD85; Mon, 20 Feb 2023 13:43:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9207404CD84;
 Mon, 20 Feb 2023 13:43:09 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 David Howells <dhowells@redhat.com>,
 Benjamin Maynard <benmaynard@google.com>,
 Daire Byrne <daire.byrne@gmail.com>
Date: Mon, 20 Feb 2023 08:43:04 -0500
Message-Id: <20230220134308.1193219-2-dwysocha@redhat.com>
In-Reply-To: <20230220134308.1193219-1-dwysocha@redhat.com>
References: <20230220134308.1193219-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH v11 1/5] NFS: Rename readpage_async_filler
 to nfs_read_add_folio
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename readpage_async_filler to nfs_read_add_folio to
better reflect what this function does (add a folio to
the nfs_pageio_descriptor), and simplify arguments to
this function by removing struct nfs_readdesc.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/read.c | 54 +++++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/fs/nfs/read.c b/fs/nfs/read.c
index c380cff4108e..4cb3991c4735 100644
--- a/fs/nfs/read.c
+++ b/fs/nfs/read.c
@@ -126,11 +126,6 @@ static void nfs_readpage_release(struct nfs_page *req, int error)
 	nfs_release_request(req);
 }
 
-struct nfs_readdesc {
-	struct nfs_pageio_descriptor pgio;
-	struct nfs_open_context *ctx;
-};
-
 static void nfs_page_group_set_uptodate(struct nfs_page *req)
 {
 	if (nfs_page_group_sync_on_bit(req, PG_UPTODATE))
@@ -152,7 +147,8 @@ static void nfs_read_completion(struct nfs_pgio_header *hdr)
 
 		if (test_bit(NFS_IOHDR_EOF, &hdr->flags)) {
 			/* note: regions of the page not covered by a
-			 * request are zeroed in readpage_async_filler */
+			 * request are zeroed in nfs_read_add_folio
+			 */
 			if (bytes > hdr->good_bytes) {
 				/* nothing in this request was good, so zero
 				 * the full extent of the request */
@@ -280,7 +276,9 @@ static void nfs_readpage_result(struct rpc_task *task,
 		nfs_readpage_retry(task, hdr);
 }
 
-static int readpage_async_filler(struct nfs_readdesc *desc, struct folio *folio)
+static int nfs_read_add_folio(struct nfs_pageio_descriptor *pgio,
+			      struct nfs_open_context *ctx,
+			      struct folio *folio)
 {
 	struct inode *inode = folio_file_mapping(folio)->host;
 	struct nfs_server *server = NFS_SERVER(inode);
@@ -302,15 +300,15 @@ static int readpage_async_filler(struct nfs_readdesc *desc, struct folio *folio)
 			goto out_unlock;
 	}
 
-	new = nfs_page_create_from_folio(desc->ctx, folio, 0, aligned_len);
+	new = nfs_page_create_from_folio(ctx, folio, 0, aligned_len);
 	if (IS_ERR(new))
 		goto out_error;
 
 	if (len < fsize)
 		folio_zero_segment(folio, len, fsize);
-	if (!nfs_pageio_add_request(&desc->pgio, new)) {
+	if (!nfs_pageio_add_request(pgio, new)) {
 		nfs_list_remove_request(new);
-		error = desc->pgio.pg_error;
+		error = pgio->pg_error;
 		nfs_readpage_release(new, error);
 		goto out;
 	}
@@ -331,8 +329,9 @@ static int readpage_async_filler(struct nfs_readdesc *desc, struct folio *folio)
  */
 int nfs_read_folio(struct file *file, struct folio *folio)
 {
-	struct nfs_readdesc desc;
 	struct inode *inode = file_inode(file);
+	struct nfs_pageio_descriptor pgio;
+	struct nfs_open_context *ctx;
 	int ret;
 
 	trace_nfs_aop_readpage(inode, folio);
@@ -355,25 +354,25 @@ int nfs_read_folio(struct file *file, struct folio *folio)
 	if (NFS_STALE(inode))
 		goto out_unlock;
 
-	desc.ctx = get_nfs_open_context(nfs_file_open_context(file));
+	ctx = get_nfs_open_context(nfs_file_open_context(file));
 
-	xchg(&desc.ctx->error, 0);
-	nfs_pageio_init_read(&desc.pgio, inode, false,
+	xchg(&ctx->error, 0);
+	nfs_pageio_init_read(&pgio, inode, false,
 			     &nfs_async_read_completion_ops);
 
-	ret = readpage_async_filler(&desc, folio);
+	ret = nfs_read_add_folio(&pgio, ctx, folio);
 	if (ret)
 		goto out;
 
-	nfs_pageio_complete_read(&desc.pgio);
-	ret = desc.pgio.pg_error < 0 ? desc.pgio.pg_error : 0;
+	nfs_pageio_complete_read(&pgio);
+	ret = pgio.pg_error < 0 ? pgio.pg_error : 0;
 	if (!ret) {
 		ret = folio_wait_locked_killable(folio);
 		if (!folio_test_uptodate(folio) && !ret)
-			ret = xchg(&desc.ctx->error, 0);
+			ret = xchg(&ctx->error, 0);
 	}
 out:
-	put_nfs_open_context(desc.ctx);
+	put_nfs_open_context(ctx);
 	trace_nfs_aop_readpage_done(inode, folio, ret);
 	return ret;
 out_unlock:
@@ -384,9 +383,10 @@ int nfs_read_folio(struct file *file, struct folio *folio)
 
 void nfs_readahead(struct readahead_control *ractl)
 {
+	struct nfs_pageio_descriptor pgio;
+	struct nfs_open_context *ctx;
 	unsigned int nr_pages = readahead_count(ractl);
 	struct file *file = ractl->file;
-	struct nfs_readdesc desc;
 	struct inode *inode = ractl->mapping->host;
 	struct folio *folio;
 	int ret;
@@ -400,24 +400,24 @@ void nfs_readahead(struct readahead_control *ractl)
 
 	if (file == NULL) {
 		ret = -EBADF;
-		desc.ctx = nfs_find_open_context(inode, NULL, FMODE_READ);
-		if (desc.ctx == NULL)
+		ctx = nfs_find_open_context(inode, NULL, FMODE_READ);
+		if (ctx == NULL)
 			goto out;
 	} else
-		desc.ctx = get_nfs_open_context(nfs_file_open_context(file));
+		ctx = get_nfs_open_context(nfs_file_open_context(file));
 
-	nfs_pageio_init_read(&desc.pgio, inode, false,
+	nfs_pageio_init_read(&pgio, inode, false,
 			     &nfs_async_read_completion_ops);
 
 	while ((folio = readahead_folio(ractl)) != NULL) {
-		ret = readpage_async_filler(&desc, folio);
+		ret = nfs_read_add_folio(&pgio, ctx, folio);
 		if (ret)
 			break;
 	}
 
-	nfs_pageio_complete_read(&desc.pgio);
+	nfs_pageio_complete_read(&pgio);
 
-	put_nfs_open_context(desc.ctx);
+	put_nfs_open_context(ctx);
 out:
 	trace_nfs_aop_readahead_done(inode, nr_pages, ret);
 }
-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

