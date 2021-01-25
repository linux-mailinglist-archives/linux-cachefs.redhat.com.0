Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A28FA302E24
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Jan 2021 22:42:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611610948;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MEh1NFui7B7vhzlCsBlioRVW1X3YEcF2wb3+R0Ed3rE=;
	b=UM8nvxLD3P8u6el3ar4aBH+CTvnS5Pk6SaEc+2gUwHem427oUpRXAKbjOIoszIXA0xogVb
	FP4ZFkWAVqSLc0MqYBsMlsPt2/oiavFmtgp1nrnCSH+htFY4pAYmIGz/JNendZaG8B4Y4y
	enJABQ60Z0/r8RhVoIhGGx4ZIdUWg90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-LTxZ_NinOci6xaZkTPY16g-1; Mon, 25 Jan 2021 16:42:26 -0500
X-MC-Unique: LTxZ_NinOci6xaZkTPY16g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 298131934100;
	Mon, 25 Jan 2021 21:42:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE96F6F965;
	Mon, 25 Jan 2021 21:42:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D86164BB7B;
	Mon, 25 Jan 2021 21:42:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10PLb7BH028294 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 16:37:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CAD061042A7F; Mon, 25 Jan 2021 21:37:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F456105C722;
	Mon, 25 Jan 2021 21:36:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Mon, 25 Jan 2021 21:36:38 +0000
Message-ID: <161161059859.2537118.3305621799356778773.stgit@warthog.procyon.org.uk>
In-Reply-To: <161161025063.2537118.2009249444682241405.stgit@warthog.procyon.org.uk>
References: <161161025063.2537118.2009249444682241405.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 29/32] NFS: Add nfs_pageio_complete_read()
 and remove nfs_readpage_async()
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
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Dave Wysochanski <dwysocha@redhat.com>

Add nfs_pageio_complete_read() and call this from both nfs_readpage()
and nfs_readpages(), since the submission and accounting is the same
for both functions.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---

 fs/nfs/read.c          |  137 +++++++++++++++++++++---------------------------
 include/linux/nfs_fs.h |    1 
 2 files changed, 61 insertions(+), 77 deletions(-)

diff --git a/fs/nfs/read.c b/fs/nfs/read.c
index 1401f1c734c0..c2df4040f26c 100644
--- a/fs/nfs/read.c
+++ b/fs/nfs/read.c
@@ -74,6 +74,24 @@ void nfs_pageio_init_read(struct nfs_pageio_descriptor *pgio,
 }
 EXPORT_SYMBOL_GPL(nfs_pageio_init_read);
 
+static void nfs_pageio_complete_read(struct nfs_pageio_descriptor *pgio,
+				     struct inode *inode)
+{
+	struct nfs_pgio_mirror *pgm;
+	unsigned long npages;
+
+	nfs_pageio_complete(pgio);
+
+	/* It doesn't make sense to do mirrored reads! */
+	WARN_ON_ONCE(pgio->pg_mirror_count != 1);
+
+	pgm = &pgio->pg_mirrors[0];
+	NFS_I(inode)->read_io += pgm->pg_bytes_written;
+	npages = (pgm->pg_bytes_written + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	nfs_add_stats(inode, NFSIOS_READPAGES, npages);
+}
+
+
 void nfs_pageio_reset_read_mds(struct nfs_pageio_descriptor *pgio)
 {
 	struct nfs_pgio_mirror *mirror;
@@ -119,36 +137,6 @@ struct nfs_readdesc {
 	struct nfs_open_context *ctx;
 };
 
-static int readpage_async_filler(void *data, struct page *page);
-
-int nfs_readpage_async(void *data, struct inode *inode,
-		       struct page *page)
-{
-	struct nfs_readdesc *desc = (struct nfs_readdesc *)data;
-	struct nfs_pgio_mirror *pgm;
-	int error;
-
-	nfs_pageio_init_read(&desc->pgio, inode, false,
-			     &nfs_async_read_completion_ops);
-
-	error = readpage_async_filler(desc, page);
-	if (error)
-		goto out;
-
-	nfs_pageio_complete(&desc->pgio);
-
-	/* It doesn't make sense to do mirrored reads! */
-	WARN_ON_ONCE(desc->pgio.pg_mirror_count != 1);
-
-	pgm = &desc->pgio.pg_mirrors[0];
-	NFS_I(inode)->read_io += pgm->pg_bytes_written;
-
-	return desc->pgio.pg_error < 0 ? desc->pgio.pg_error : 0;
-
-out:
-	return error;
-}
-
 static void nfs_page_group_set_uptodate(struct nfs_page *req)
 {
 	if (nfs_page_group_sync_on_bit(req, PG_UPTODATE))
@@ -170,8 +158,7 @@ static void nfs_read_completion(struct nfs_pgio_header *hdr)
 
 		if (test_bit(NFS_IOHDR_EOF, &hdr->flags)) {
 			/* note: regions of the page not covered by a
-			 * request are zeroed in nfs_readpage_async /
-			 * readpage_async_filler */
+			 * request are zeroed in readpage_async_filler */
 			if (bytes > hdr->good_bytes) {
 				/* nothing in this request was good, so zero
 				 * the full extent of the request */
@@ -303,6 +290,38 @@ static void nfs_readpage_result(struct rpc_task *task,
 		nfs_readpage_retry(task, hdr);
 }
 
+static int
+readpage_async_filler(void *data, struct page *page)
+{
+	struct nfs_readdesc *desc = (struct nfs_readdesc *)data;
+	struct nfs_page *new;
+	unsigned int len;
+	int error;
+
+	len = nfs_page_length(page);
+	if (len == 0)
+		return nfs_return_empty_page(page);
+
+	new = nfs_create_request(desc->ctx, page, 0, len);
+	if (IS_ERR(new))
+		goto out_error;
+
+	if (len < PAGE_SIZE)
+		zero_user_segment(page, len, PAGE_SIZE);
+	if (!nfs_pageio_add_request(&desc->pgio, new)) {
+		nfs_list_remove_request(new);
+		error = desc->pgio.pg_error;
+		nfs_readpage_release(new, error);
+		goto out;
+	}
+	return 0;
+out_error:
+	error = PTR_ERR(new);
+	unlock_page(page);
+out:
+	return error;
+}
+
 /*
  * Read a page over NFS.
  * We read the page synchronously in the following case:
@@ -351,13 +370,20 @@ int nfs_readpage(struct file *filp, struct page *page)
 	}
 
 	xchg(&desc.ctx->error, 0);
-	ret = nfs_readpage_async(&desc, inode, page);
+	nfs_pageio_init_read(&desc.pgio, inode, false,
+			     &nfs_async_read_completion_ops);
+
+	ret = readpage_async_filler(&desc, page);
+
+	if (!ret)
+		nfs_pageio_complete_read(&desc.pgio, inode);
+
+	ret = desc.pgio.pg_error < 0 ? desc.pgio.pg_error : 0;
 	if (!ret) {
 		ret = wait_on_page_locked_killable(page);
 		if (!PageUptodate(page) && !ret)
 			ret = xchg(&desc.ctx->error, 0);
 	}
-	nfs_add_stats(inode, NFSIOS_READPAGES, 1);
 out:
 	put_nfs_open_context(desc.ctx);
 	return ret;
@@ -366,45 +392,11 @@ int nfs_readpage(struct file *filp, struct page *page)
 	return ret;
 }
 
-static int
-readpage_async_filler(void *data, struct page *page)
-{
-	struct nfs_readdesc *desc = (struct nfs_readdesc *)data;
-	struct nfs_page *new;
-	unsigned int len;
-	int error;
-
-	len = nfs_page_length(page);
-	if (len == 0)
-		return nfs_return_empty_page(page);
-
-	new = nfs_create_request(desc->ctx, page, 0, len);
-	if (IS_ERR(new))
-		goto out_error;
-
-	if (len < PAGE_SIZE)
-		zero_user_segment(page, len, PAGE_SIZE);
-	if (!nfs_pageio_add_request(&desc->pgio, new)) {
-		nfs_list_remove_request(new);
-		error = desc->pgio.pg_error;
-		nfs_readpage_release(new, error);
-		goto out;
-	}
-	return 0;
-out_error:
-	error = PTR_ERR(new);
-	unlock_page(page);
-out:
-	return error;
-}
-
 int nfs_readpages(struct file *filp, struct address_space *mapping,
 		struct list_head *pages, unsigned nr_pages)
 {
-	struct nfs_pgio_mirror *pgm;
 	struct nfs_readdesc desc;
 	struct inode *inode = mapping->host;
-	unsigned long npages;
 	int ret;
 
 	dprintk("NFS: nfs_readpages (%s/%Lu %d)\n",
@@ -437,16 +429,9 @@ int nfs_readpages(struct file *filp, struct address_space *mapping,
 			     &nfs_async_read_completion_ops);
 
 	ret = read_cache_pages(mapping, pages, readpage_async_filler, &desc);
-	nfs_pageio_complete(&desc.pgio);
 
-	/* It doesn't make sense to do mirrored reads! */
-	WARN_ON_ONCE(desc.pgio.pg_mirror_count != 1);
+	nfs_pageio_complete_read(&desc.pgio, inode);
 
-	pgm = &desc.pgio.pg_mirrors[0];
-	NFS_I(inode)->read_io += pgm->pg_bytes_written;
-	npages = (pgm->pg_bytes_written + PAGE_SIZE - 1) >>
-		 PAGE_SHIFT;
-	nfs_add_stats(inode, NFSIOS_READPAGES, npages);
 read_complete:
 	put_nfs_open_context(desc.ctx);
 out:
diff --git a/include/linux/nfs_fs.h b/include/linux/nfs_fs.h
index cb0248a34518..3cfcf219e96b 100644
--- a/include/linux/nfs_fs.h
+++ b/include/linux/nfs_fs.h
@@ -570,7 +570,6 @@ nfs_have_writebacks(struct inode *inode)
 extern int  nfs_readpage(struct file *, struct page *);
 extern int  nfs_readpages(struct file *, struct address_space *,
 		struct list_head *, unsigned);
-extern int  nfs_readpage_async(void *, struct inode *, struct page *);
 
 /*
  * inline functions


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

