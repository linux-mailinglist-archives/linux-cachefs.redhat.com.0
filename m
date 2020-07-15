Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E2E92221073
	for <lists+linux-cachefs@lfdr.de>; Wed, 15 Jul 2020 17:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594825914;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xrRuEhdPHHn0zbit/ajStC0xy0tVnjkCopb/x6W+e6I=;
	b=daUyEKJphtO92ZGWgGTpmLUln7aKGiZVTnEsxLm8jvEGAxI/t4HYOYP57+FbLEHStnVshd
	mkX6wjqO7TzNEI8If3fpYkXhMCq2IBbi8BsOMlLlUP5FGsKMacAJyJFZdxlbowf8gtdrgA
	RtOM2xclmg3a05Ks7jfEs4p/9F4mHGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-624UH4PsN8ClKfupNQmLrw-1; Wed, 15 Jul 2020 11:11:50 -0400
X-MC-Unique: 624UH4PsN8ClKfupNQmLrw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0907CD9142;
	Wed, 15 Jul 2020 15:10:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECC9E5FC2E;
	Wed, 15 Jul 2020 15:10:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7F8A94F1A;
	Wed, 15 Jul 2020 15:10:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06FFArAf021683 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 11:10:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4013460BF4; Wed, 15 Jul 2020 15:10:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (ovpn-118-79.rdu2.redhat.com [10.10.118.79])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9C9360BF1;
	Wed, 15 Jul 2020 15:10:52 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 15 Jul 2020 11:10:39 -0400
Message-Id: <1594825849-24991-4-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1594825849-24991-1-git-send-email-dwysocha@redhat.com>
References: <1594825849-24991-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v1 03/13] NFS: Refactor nfs_readpage()
	and nfs_readpage_async() to use nfs_readdesc
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Both nfs_readpage() and nfs_readpages() use similar code.
This patch should be no functional change, and refactors
nfs_readpage_async() to use nfs_readdesc to enable future
merging of nfs_readpage_async() and nfs_readpage_async_filler().

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/read.c          | 50 ++++++++++++++++++++++++++------------------------
 include/linux/nfs_fs.h |  3 +--
 2 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/fs/nfs/read.c b/fs/nfs/read.c
index 1153c4e0a155..d635f635d8e3 100644
--- a/fs/nfs/read.c
+++ b/fs/nfs/read.c
@@ -114,18 +114,23 @@ static void nfs_readpage_release(struct nfs_page *req, int error)
 	nfs_release_request(req);
 }
 
-int nfs_readpage_async(struct nfs_open_context *ctx, struct inode *inode,
+struct nfs_readdesc {
+	struct nfs_pageio_descriptor *pgio;
+	struct nfs_open_context *ctx;
+};
+
+int nfs_readpage_async(void *data, struct inode *inode,
 		       struct page *page)
 {
+	struct nfs_readdesc *desc = (struct nfs_readdesc *)data;
 	struct nfs_page	*new;
 	unsigned int len;
-	struct nfs_pageio_descriptor pgio;
 	struct nfs_pgio_mirror *pgm;
 
 	len = nfs_page_length(page);
 	if (len == 0)
 		return nfs_return_empty_page(page);
-	new = nfs_create_request(ctx, page, 0, len);
+	new = nfs_create_request(desc->ctx, page, 0, len);
 	if (IS_ERR(new)) {
 		unlock_page(page);
 		return PTR_ERR(new);
@@ -133,21 +138,21 @@ int nfs_readpage_async(struct nfs_open_context *ctx, struct inode *inode,
 	if (len < PAGE_SIZE)
 		zero_user_segment(page, len, PAGE_SIZE);
 
-	nfs_pageio_init_read(&pgio, inode, false,
+	nfs_pageio_init_read(desc->pgio, inode, false,
 			     &nfs_async_read_completion_ops);
-	if (!nfs_pageio_add_request(&pgio, new)) {
+	if (!nfs_pageio_add_request(desc->pgio, new)) {
 		nfs_list_remove_request(new);
-		nfs_readpage_release(new, pgio.pg_error);
+		nfs_readpage_release(new, desc->pgio->pg_error);
 	}
-	nfs_pageio_complete(&pgio);
+	nfs_pageio_complete(desc->pgio);
 
 	/* It doesn't make sense to do mirrored reads! */
-	WARN_ON_ONCE(pgio.pg_mirror_count != 1);
+	WARN_ON_ONCE(desc->pgio->pg_mirror_count != 1);
 
-	pgm = &pgio.pg_mirrors[0];
+	pgm = &desc->pgio->pg_mirrors[0];
 	NFS_I(inode)->read_io += pgm->pg_bytes_written;
 
-	return pgio.pg_error < 0 ? pgio.pg_error : 0;
+	return desc->pgio->pg_error < 0 ? desc->pgio->pg_error : 0;
 }
 
 static void nfs_page_group_set_uptodate(struct nfs_page *req)
@@ -312,7 +317,8 @@ static void nfs_readpage_result(struct rpc_task *task,
  */
 int nfs_readpage(struct file *filp, struct page *page)
 {
-	struct nfs_open_context *ctx;
+	struct nfs_pageio_descriptor pgio;
+	struct nfs_readdesc desc;
 	struct inode *inode = page_file_mapping(page)->host;
 	int ret;
 
@@ -339,39 +345,35 @@ int nfs_readpage(struct file *filp, struct page *page)
 
 	if (filp == NULL) {
 		ret = -EBADF;
-		ctx = nfs_find_open_context(inode, NULL, FMODE_READ);
-		if (ctx == NULL)
+		desc.ctx = nfs_find_open_context(inode, NULL, FMODE_READ);
+		if (desc.ctx == NULL)
 			goto out_unlock;
 	} else
-		ctx = get_nfs_open_context(nfs_file_open_context(filp));
+		desc.ctx = get_nfs_open_context(nfs_file_open_context(filp));
 
 	if (!IS_SYNC(inode)) {
-		ret = nfs_readpage_from_fscache(ctx, inode, page);
+		ret = nfs_readpage_from_fscache(desc.ctx, inode, page);
 		if (ret == 0)
 			goto out;
 	}
 
-	xchg(&ctx->error, 0);
-	ret = nfs_readpage_async(ctx, inode, page);
+	desc.pgio = &pgio;
+	xchg(&desc.ctx->error, 0);
+	ret = nfs_readpage_async(&desc, inode, page);
 	if (!ret) {
 		ret = wait_on_page_locked_killable(page);
 		if (!PageUptodate(page) && !ret)
-			ret = xchg(&ctx->error, 0);
+			ret = xchg(&desc.ctx->error, 0);
 	}
 	nfs_add_stats(inode, NFSIOS_READPAGES, 1);
 out:
-	put_nfs_open_context(ctx);
+	put_nfs_open_context(desc.ctx);
 	return ret;
 out_unlock:
 	unlock_page(page);
 	return ret;
 }
 
-struct nfs_readdesc {
-	struct nfs_pageio_descriptor *pgio;
-	struct nfs_open_context *ctx;
-};
-
 static int
 readpage_async_filler(void *data, struct page *page)
 {
diff --git a/include/linux/nfs_fs.h b/include/linux/nfs_fs.h
index 6ee9119acc5d..7e5b9df9cfe6 100644
--- a/include/linux/nfs_fs.h
+++ b/include/linux/nfs_fs.h
@@ -553,8 +553,7 @@ extern int nfs_instantiate(struct dentry *dentry, struct nfs_fh *fh,
 extern int  nfs_readpage(struct file *, struct page *);
 extern int  nfs_readpages(struct file *, struct address_space *,
 		struct list_head *, unsigned);
-extern int  nfs_readpage_async(struct nfs_open_context *, struct inode *,
-			       struct page *);
+extern int  nfs_readpage_async(void *, struct inode *, struct page *);
 
 /*
  * inline functions
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

