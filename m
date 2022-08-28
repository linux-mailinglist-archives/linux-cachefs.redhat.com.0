Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A005A3F9E
	for <lists+linux-cachefs@lfdr.de>; Sun, 28 Aug 2022 22:39:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661719165;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SU5YAnhg78I+F/ASPEX+nZwwxNSUYYt/cAlgMjvY2BM=;
	b=LNCOy/cLttcBFOU7d7EDTMCXYWWSIsAvAXc5s6So+7/jCG6NjgJ4FfqxJjv5RyD6hp2cCY
	mrOVzG/AU01w6ivC7mAzOkuGAqrJw0p5IGd70o/oG3hXIXCKVvQQcwTol2/TSZuecwfKfn
	f0iN8OJUqh94GiRM9So3SaGy4oJR9lw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-WGZ4WapMOMq-GMCrTimqsg-1; Sun, 28 Aug 2022 16:39:22 -0400
X-MC-Unique: WGZ4WapMOMq-GMCrTimqsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 806E23806700;
	Sun, 28 Aug 2022 20:39:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0BA511410DD5;
	Sun, 28 Aug 2022 20:39:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E519A1946A51;
	Sun, 28 Aug 2022 20:39:18 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 07C8B1946A45 for <linux-cachefs@listman.corp.redhat.com>;
 Sun, 28 Aug 2022 20:39:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F29BB4010FA1; Sun, 28 Aug 2022 20:39:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB34B40D282E;
 Sun, 28 Aug 2022 20:39:16 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 David Howells <dhowells@redhat.com>
Date: Sun, 28 Aug 2022 16:39:13 -0400
Message-Id: <20220828203913.956306-4-dwysocha@redhat.com>
In-Reply-To: <20220828203913.956306-1-dwysocha@redhat.com>
References: <20220828203913.956306-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Linux-cachefs] [RFC PATCH v2 3/3] NFS: Convert buffered read paths
 to use netfs when fscache is enabled
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com,
 Benjamin Maynard <benmaynard@google.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert the NFS buffered read code paths to corresponding netfs APIs,
but only when fscache is configured and enabled.

The netfs API defines struct netfs_request_ops which must be filled
in by the network filesystem.  For NFS, we only need to define 5 of
the functions, the main one being the issue_read() function.
The issue_read() function is called by the netfs layer when a read
cannot be fulfilled locally, and must be sent to the server (either
the cache is not active, or it is active but the data is not available).
Once the read from the server is complete, netfs requires a call to
netfs_subreq_terminated() which conveys either how many bytes were read
successfully, or an error.  Note that issue_read() is called with a
structure, netfs_io_subrequest, which defines the IO requested, and
contains a start and a length (both in bytes), and assumes the underlying
netfs will return a either an error on the whole region, or the number
of bytes successfully read.

The NFS IO path is page based and the main APIs are the pgio APIs defined
in pagelist.c.  For the pgio APIs, there is no way for the caller to
know how many RPCs will be sent and how the pages will be broken up
into underlying RPCs, each of which will have their own return code.
Thus, NFS needs some way to accommodate the netfs API requirement on
the single response to the whole request, while also minimizing
disruptive changes to the NFS pgio layer.  The approach taken with this
patch is to allocate a small structure for each call to nfs_issue_read()
to keep some accounting information for the outstanding RPCs, as well as
the final error value or the number of bytes successfully read.  The
accounting data is updated inside the pgio layer, when a nfs_pgio_header
contains a valid pointer to this data.  In the NFS read completion
function, nfs_read_completion(), the final error value and bytes read
is updated, and the accounting data is used to determine whether this
completion represents the last RPC.  If this is the last RPC, call
netfs_subreq_terminated() with the final error value or the number
of bytes transferred.

Link: https://lore.kernel.org/linux-nfs/9cfd5bc3cfc6abc2d3316b0387222e708d67f595.camel@hammerspace.com/

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/fscache.c         | 176 ++++++++++++++++++---------------------
 fs/nfs/fscache.h         |  69 ++++++++-------
 fs/nfs/inode.c           |   3 +
 fs/nfs/internal.h        |   9 ++
 fs/nfs/pagelist.c        |  22 +++++
 fs/nfs/read.c            |  78 ++++++++++++-----
 include/linux/nfs_page.h |   3 +
 include/linux/nfs_xdr.h  |   3 +
 8 files changed, 217 insertions(+), 146 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index a6fc1c8b6644..14524e7a0c39 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -15,6 +15,9 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/iversion.h>
+#include <linux/xarray.h>
+#include <linux/fscache.h>
+#include <linux/netfs.h>
 
 #include "internal.h"
 #include "iostat.h"
@@ -235,112 +238,97 @@ void nfs_fscache_release_file(struct inode *inode, struct file *filp)
 	fscache_unuse_cookie(cookie, &auxdata, &i_size);
 }
 
-/*
- * Fallback page reading interface.
- */
-static int fscache_fallback_read_page(struct inode *inode, struct page *page)
+
+atomic_t nfs_netfs_debug_id;
+static int nfs_netfs_init_request(struct netfs_io_request *rreq, struct file *file)
 {
-	struct netfs_cache_resources cres;
-	struct fscache_cookie *cookie = netfs_i_cookie(&NFS_I(inode)->netfs);
-	struct iov_iter iter;
-	struct bio_vec bvec[1];
-	int ret;
-
-	memset(&cres, 0, sizeof(cres));
-	bvec[0].bv_page		= page;
-	bvec[0].bv_offset	= 0;
-	bvec[0].bv_len		= PAGE_SIZE;
-	iov_iter_bvec(&iter, READ, bvec, ARRAY_SIZE(bvec), PAGE_SIZE);
-
-	ret = fscache_begin_read_operation(&cres, cookie);
-	if (ret < 0)
-		return ret;
-
-	ret = fscache_read(&cres, page_offset(page), &iter, NETFS_READ_HOLE_FAIL,
-			   NULL, NULL);
-	fscache_end_operation(&cres);
-	return ret;
+	struct nfs_open_context *ctx;
+
+	if (file == NULL) {
+		ctx = nfs_find_open_context(rreq->inode, NULL, FMODE_READ);
+		if (!ctx)
+			return -ENOMEM;
+	} else
+		ctx = get_nfs_open_context(nfs_file_open_context(file));
+
+	rreq->netfs_priv = ctx;
+
+	if (netfs_i_cookie(&NFS_I(rreq->inode)->netfs))
+		rreq->debug_id = atomic_inc_return(&nfs_netfs_debug_id);
+
+	return 0;
 }
 
-/*
- * Fallback page writing interface.
- */
-static int fscache_fallback_write_page(struct inode *inode, struct page *page,
-				       bool no_space_allocated_yet)
+static void nfs_netfs_free_request(struct netfs_io_request *rreq)
 {
-	struct netfs_cache_resources cres;
-	struct fscache_cookie *cookie = netfs_i_cookie(&NFS_I(inode)->netfs);
-	struct iov_iter iter;
-	struct bio_vec bvec[1];
-	loff_t start = page_offset(page);
-	size_t len = PAGE_SIZE;
-	int ret;
-
-	memset(&cres, 0, sizeof(cres));
-	bvec[0].bv_page		= page;
-	bvec[0].bv_offset	= 0;
-	bvec[0].bv_len		= PAGE_SIZE;
-	iov_iter_bvec(&iter, WRITE, bvec, ARRAY_SIZE(bvec), PAGE_SIZE);
-
-	ret = fscache_begin_write_operation(&cres, cookie);
-	if (ret < 0)
-		return ret;
-
-	ret = cres.ops->prepare_write(&cres, &start, &len, i_size_read(inode),
-				      no_space_allocated_yet);
-	if (ret == 0)
-		ret = fscache_write(&cres, page_offset(page), &iter, NULL, NULL);
-	fscache_end_operation(&cres);
-	return ret;
+	put_nfs_open_context(rreq->netfs_priv);
 }
 
-/*
- * Retrieve a page from fscache
- */
-int __nfs_fscache_read_page(struct inode *inode, struct page *page)
+static inline int nfs_begin_cache_operation(struct netfs_io_request *rreq)
 {
-	int ret;
-
-	trace_nfs_fscache_read_page(inode, page);
-	if (PageChecked(page)) {
-		ClearPageChecked(page);
-		ret = 1;
-		goto out;
-	}
-
-	ret = fscache_fallback_read_page(inode, page);
-	if (ret < 0) {
-		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL);
-		SetPageChecked(page);
-		goto out;
-	}
-
-	/* Read completed synchronously */
-	nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_OK);
-	SetPageUptodate(page);
-	ret = 0;
-out:
-	trace_nfs_fscache_read_page_exit(inode, page, ret);
-	return ret;
+	return fscache_begin_read_operation(&rreq->cache_resources,
+					    netfs_i_cookie(&NFS_I(rreq->inode)->netfs));
 }
 
-/*
- * Store a newly fetched page in fscache.  We can be certain there's no page
- * stored in the cache as yet otherwise we would've read it from there.
- */
-void __nfs_fscache_write_page(struct inode *inode, struct page *page)
+static struct nfs_netfs_io_data *nfs_netfs_alloc(struct netfs_io_subrequest *sreq)
 {
-	int ret;
+	struct nfs_netfs_io_data *netfs;
+
+	netfs = kzalloc(sizeof(*netfs), GFP_KERNEL_ACCOUNT);
+	if (!netfs)
+		return NULL;
+	netfs->sreq = sreq;
+	refcount_set(&netfs->refcount, 1);
+	spin_lock_init(&netfs->lock);
+	return netfs;
+}
 
-	trace_nfs_fscache_write_page(inode, page);
+static bool nfs_netfs_clamp_length(struct netfs_io_subrequest *sreq)
+{
+	size_t	rsize = NFS_SB(sreq->rreq->inode->i_sb)->rsize;
 
-	ret = fscache_fallback_write_page(inode, page, true);
+	sreq->len = min(sreq->len, rsize);
+	return true;
+}
 
-	if (ret != 0) {
-		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_WRITTEN_FAIL);
-		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_UNCACHED);
-	} else {
-		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_WRITTEN_OK);
+static void nfs_issue_read(struct netfs_io_subrequest *sreq)
+{
+	struct nfs_pageio_descriptor pgio;
+	struct inode *inode = sreq->rreq->inode;
+	struct nfs_open_context *ctx = sreq->rreq->netfs_priv;
+	struct page *page;
+	int err;
+	pgoff_t start = (sreq->start + sreq->transferred) >> PAGE_SHIFT;
+	pgoff_t last = ((sreq->start + sreq->len -
+			 sreq->transferred - 1) >> PAGE_SHIFT);
+	XA_STATE(xas, &sreq->rreq->mapping->i_pages, start);
+
+	nfs_pageio_init_read(&pgio, inode, false,
+			     &nfs_async_read_completion_ops);
+
+	pgio.pg_netfs = nfs_netfs_alloc(sreq); /* used in completion */
+	if (!pgio.pg_netfs)
+		return netfs_subreq_terminated(sreq, -ENOMEM, false);
+
+	xas_lock(&xas);
+	xas_for_each(&xas, page, last) {
+		/* nfs_pageio_add_page() may schedule() due to pNFS layout and other RPCs  */
+		xas_pause(&xas);
+		xas_unlock(&xas);
+		err = nfs_pageio_add_page(&pgio, ctx, page);
+		if (err < 0)
+			return netfs_subreq_terminated(sreq, err, false);
+		xas_lock(&xas);
 	}
-	trace_nfs_fscache_write_page_exit(inode, page, ret);
+	xas_unlock(&xas);
+	nfs_pageio_complete_read(&pgio);
+	nfs_netfs_put(pgio.pg_netfs);
 }
+
+const struct netfs_request_ops nfs_netfs_ops = {
+	.init_request		= nfs_netfs_init_request,
+	.free_request		= nfs_netfs_free_request,
+	.begin_cache_operation	= nfs_begin_cache_operation,
+	.issue_read		= nfs_issue_read,
+	.clamp_length		= nfs_netfs_clamp_length
+};
diff --git a/fs/nfs/fscache.h b/fs/nfs/fscache.h
index 38614ed8f951..46eb11b5557e 100644
--- a/fs/nfs/fscache.h
+++ b/fs/nfs/fscache.h
@@ -34,6 +34,42 @@ struct nfs_fscache_inode_auxdata {
 	u64	change_attr;
 };
 
+struct nfs_netfs_io_data {
+	refcount_t			refcount;
+	struct netfs_io_subrequest	*sreq;
+
+	/*
+	 * NFS may split a netfs_io_subrequest into multiple RPCs, each
+	 * with their own read completion.  In netfs, we can only call
+	 * netfs_subreq_terminated() once for each subrequest.  So we
+	 * must keep track of the rpcs and rpc_byte_count for what has
+	 * been submitted, and only call netfs via netfs_subreq_terminated()
+	 * when the final RPC has completed.
+	 */
+	atomic_t	rpcs;
+	unsigned long	rpc_byte_count;
+
+	/*
+	 * Final dispostion of the netfs_io_subrequest, sent in
+	 * netfs_subreq_terminated()
+	 */
+	spinlock_t	lock;
+	ssize_t		transferred;
+	int		error;
+};
+
+static inline void nfs_netfs_get(struct nfs_netfs_io_data *netfs)
+{
+	refcount_inc(&netfs->refcount);
+}
+
+static inline void nfs_netfs_put(struct nfs_netfs_io_data *netfs)
+{
+	if (!refcount_dec_and_test(&netfs->refcount))
+		return;
+	kfree(netfs);
+}
+
 /*
  * fscache.c
  */
@@ -45,43 +81,17 @@ extern void nfs_fscache_clear_inode(struct inode *);
 extern void nfs_fscache_open_file(struct inode *, struct file *);
 extern void nfs_fscache_release_file(struct inode *, struct file *);
 
-extern int __nfs_fscache_read_page(struct inode *, struct page *);
-extern void __nfs_fscache_write_page(struct inode *, struct page *);
-
 static inline bool nfs_fscache_release_folio(struct folio *folio, gfp_t gfp)
 {
 	if (folio_test_fscache(folio)) {
 		if (current_is_kswapd() || !(gfp & __GFP_FS))
 			return false;
 		folio_wait_fscache(folio);
-		fscache_note_page_release(netfs_i_cookie(&NFS_I(folio->mapping->host)->netfs));
-		nfs_inc_fscache_stats(folio->mapping->host,
-				      NFSIOS_FSCACHE_PAGES_UNCACHED);
 	}
+	fscache_note_page_release(netfs_i_cookie(&NFS_I(folio->mapping->host)->netfs));
 	return true;
 }
 
-/*
- * Retrieve a page from an inode data storage object.
- */
-static inline int nfs_fscache_read_page(struct inode *inode, struct page *page)
-{
-	if (netfs_inode(inode)->cache)
-		return __nfs_fscache_read_page(inode, page);
-	return -ENOBUFS;
-}
-
-/*
- * Store a page newly fetched from the server in an inode data storage object
- * in the cache.
- */
-static inline void nfs_fscache_write_page(struct inode *inode,
-					   struct page *page)
-{
-	if (netfs_inode(inode)->cache)
-		__nfs_fscache_write_page(inode, page);
-}
-
 static inline void nfs_fscache_update_auxdata(struct nfs_fscache_inode_auxdata *auxdata,
 					      struct inode *inode)
 {
@@ -130,11 +140,6 @@ static inline bool nfs_fscache_release_folio(struct folio *folio, gfp_t gfp)
 {
 	return true; /* may release folio */
 }
-static inline int nfs_fscache_read_page(struct inode *inode, struct page *page)
-{
-	return -ENOBUFS;
-}
-static inline void nfs_fscache_write_page(struct inode *inode, struct page *page) {}
 static inline void nfs_fscache_invalidate(struct inode *inode, int flags) {}
 
 static inline const char *nfs_server_fscache_state(struct nfs_server *server)
diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index 94b7ed2a9b8b..5d01827a4571 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -2247,6 +2247,9 @@ struct inode *nfs_alloc_inode(struct super_block *sb)
 #endif /* CONFIG_NFS_V4 */
 #ifdef CONFIG_NFS_V4_2
 	nfsi->xattr_cache = NULL;
+#endif
+#ifdef CONFIG_NFS_FSCACHE
+	netfs_inode_init(&nfsi->netfs, &nfs_netfs_ops);
 #endif
 	return NFSI_TO_INODE(nfsi);
 }
diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index 78d945f5f97f..6b1870382cea 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -453,6 +453,10 @@ extern void nfs_sb_deactive(struct super_block *sb);
 extern int nfs_client_for_each_server(struct nfs_client *clp,
 				      int (*fn)(struct nfs_server *, void *),
 				      void *data);
+#ifdef CONFIG_NFS_FSCACHE
+extern const struct netfs_request_ops nfs_netfs_ops;
+#endif
+
 /* io.c */
 extern void nfs_start_io_read(struct inode *inode);
 extern void nfs_end_io_read(struct inode *inode);
@@ -482,9 +486,14 @@ extern int nfs4_get_rootfh(struct nfs_server *server, struct nfs_fh *mntfh, bool
 
 struct nfs_pgio_completion_ops;
 /* read.c */
+extern const struct nfs_pgio_completion_ops nfs_async_read_completion_ops;
 extern void nfs_pageio_init_read(struct nfs_pageio_descriptor *pgio,
 			struct inode *inode, bool force_mds,
 			const struct nfs_pgio_completion_ops *compl_ops);
+extern int nfs_pageio_add_page(struct nfs_pageio_descriptor *pgio,
+			       struct nfs_open_context *ctx,
+			       struct page *page);
+extern void nfs_pageio_complete_read(struct nfs_pageio_descriptor *pgio);
 extern void nfs_read_prepare(struct rpc_task *task, void *calldata);
 extern void nfs_pageio_reset_read_mds(struct nfs_pageio_descriptor *pgio);
 
diff --git a/fs/nfs/pagelist.c b/fs/nfs/pagelist.c
index 317cedfa52bf..2a988bdd9937 100644
--- a/fs/nfs/pagelist.c
+++ b/fs/nfs/pagelist.c
@@ -25,6 +25,7 @@
 #include "internal.h"
 #include "pnfs.h"
 #include "nfstrace.h"
+#include "fscache.h"
 
 #define NFSDBG_FACILITY		NFSDBG_PAGECACHE
 
@@ -68,6 +69,12 @@ void nfs_pgheader_init(struct nfs_pageio_descriptor *desc,
 	hdr->good_bytes = mirror->pg_count;
 	hdr->io_completion = desc->pg_io_completion;
 	hdr->dreq = desc->pg_dreq;
+#ifdef CONFIG_NFS_FSCACHE
+	if (desc->pg_netfs) {
+		hdr->netfs = desc->pg_netfs;
+		nfs_netfs_get(desc->pg_netfs);
+	}
+#endif
 	hdr->release = release;
 	hdr->completion_ops = desc->pg_completion_ops;
 	if (hdr->completion_ops->init_hdr)
@@ -846,6 +853,9 @@ void nfs_pageio_init(struct nfs_pageio_descriptor *desc,
 	desc->pg_lseg = NULL;
 	desc->pg_io_completion = NULL;
 	desc->pg_dreq = NULL;
+#ifdef CONFIG_NFS_FSCACHE
+	desc->pg_netfs = NULL;
+#endif
 	desc->pg_bsize = bsize;
 
 	desc->pg_mirror_count = 1;
@@ -940,6 +950,15 @@ int nfs_generic_pgio(struct nfs_pageio_descriptor *desc,
 	/* Set up the argument struct */
 	nfs_pgio_rpcsetup(hdr, mirror->pg_count, desc->pg_ioflags, &cinfo);
 	desc->pg_rpc_callops = &nfs_pgio_common_ops;
+
+#ifdef CONFIG_NFS_FSCACHE
+	if (hdr->netfs) {
+		struct nfs_netfs_io_data        *netfs = hdr->netfs;
+
+		netfs->rpc_byte_count += hdr->args.count;
+		atomic_inc(&netfs->rpcs);
+	}
+#endif
 	return 0;
 }
 EXPORT_SYMBOL_GPL(nfs_generic_pgio);
@@ -1360,6 +1379,9 @@ int nfs_pageio_resend(struct nfs_pageio_descriptor *desc,
 
 	desc->pg_io_completion = hdr->io_completion;
 	desc->pg_dreq = hdr->dreq;
+#ifdef CONFIG_NFS_FSCACHE
+	desc->pg_netfs = hdr->netfs;
+#endif
 	list_splice_init(&hdr->pages, &pages);
 	while (!list_empty(&pages)) {
 		struct nfs_page *req = nfs_list_entry(pages.next);
diff --git a/fs/nfs/read.c b/fs/nfs/read.c
index 525e82ea9a9e..3a7223072bf7 100644
--- a/fs/nfs/read.c
+++ b/fs/nfs/read.c
@@ -30,7 +30,7 @@
 
 #define NFSDBG_FACILITY		NFSDBG_PAGECACHE
 
-static const struct nfs_pgio_completion_ops nfs_async_read_completion_ops;
+const struct nfs_pgio_completion_ops nfs_async_read_completion_ops;
 static const struct nfs_rw_ops nfs_rw_read_ops;
 
 static struct kmem_cache *nfs_rdata_cachep;
@@ -74,7 +74,7 @@ void nfs_pageio_init_read(struct nfs_pageio_descriptor *pgio,
 }
 EXPORT_SYMBOL_GPL(nfs_pageio_init_read);
 
-static void nfs_pageio_complete_read(struct nfs_pageio_descriptor *pgio)
+void nfs_pageio_complete_read(struct nfs_pageio_descriptor *pgio)
 {
 	struct nfs_pgio_mirror *pgm;
 	unsigned long npages;
@@ -119,11 +119,17 @@ static void nfs_readpage_release(struct nfs_page *req, int error)
 
 	if (nfs_error_is_fatal_on_server(error) && error != -ETIMEDOUT)
 		SetPageError(page);
-	if (nfs_page_group_sync_on_bit(req, PG_UNLOCKPAGE)) {
-		if (PageUptodate(page))
-			nfs_fscache_write_page(inode, page);
+	if (nfs_page_group_sync_on_bit(req, PG_UNLOCKPAGE))
+#ifndef CONFIG_NFS_FSCACHE
 		unlock_page(page);
-	}
+#else
+		/*
+		 * If fscache is enabled, netfs will unlock pages.
+		 * Otherwise, we have to unlock the page here
+		 */
+		if (!netfs_inode(inode)->cache)
+			unlock_page(page);
+#endif
 	nfs_release_request(req);
 }
 
@@ -177,6 +183,31 @@ static void nfs_read_completion(struct nfs_pgio_header *hdr)
 		nfs_list_remove_request(req);
 		nfs_readpage_release(req, error);
 	}
+#ifdef CONFIG_NFS_FSCACHE
+	if (hdr->netfs) {
+		struct nfs_netfs_io_data        *netfs = hdr->netfs;
+		struct netfs_io_subrequest      *sreq = netfs->sreq;
+
+		if (test_bit(NFS_IOHDR_EOF, &hdr->flags))
+			__set_bit(NETFS_SREQ_CLEAR_TAIL, &sreq->flags);
+
+		spin_lock(&netfs->lock);
+		if (hdr->error)
+			netfs->error = hdr->error;
+		else
+			netfs->transferred += hdr->res.count;
+		spin_unlock(&netfs->lock);
+
+		/* Only the last RPC completion should call netfs_subreq_terminated() */
+		if (atomic_dec_and_test(&netfs->rpcs) &&
+		    (netfs->rpc_byte_count >= sreq->len)) { /* Could have EOF */
+			netfs_subreq_terminated(sreq, netfs->error ?: netfs->transferred, false);
+			nfs_netfs_put(netfs);
+			hdr->netfs = NULL;
+		}
+	}
+#endif
+
 out:
 	hdr->release(hdr);
 }
@@ -202,7 +233,7 @@ nfs_async_read_error(struct list_head *head, int error)
 	}
 }
 
-static const struct nfs_pgio_completion_ops nfs_async_read_completion_ops = {
+const struct nfs_pgio_completion_ops nfs_async_read_completion_ops = {
 	.error_cleanup = nfs_async_read_error,
 	.completion = nfs_read_completion,
 };
@@ -294,12 +325,6 @@ nfs_pageio_add_page(struct nfs_pageio_descriptor *pgio,
 
 	aligned_len = min_t(unsigned int, ALIGN(len, rsize), PAGE_SIZE);
 
-	if (!IS_SYNC(page->mapping->host)) {
-		error = nfs_fscache_read_page(page->mapping->host, page);
-		if (error == 0)
-			goto out_unlock;
-	}
-
 	new = nfs_create_request(ctx, page, 0, aligned_len);
 	if (IS_ERR(new))
 		goto out_error;
@@ -315,8 +340,6 @@ nfs_pageio_add_page(struct nfs_pageio_descriptor *pgio,
 	return 0;
 out_error:
 	error = PTR_ERR(new);
-out_unlock:
-	unlock_page(page);
 out:
 	return error;
 }
@@ -355,6 +378,12 @@ int nfs_read_folio(struct file *file, struct folio *folio)
 	if (NFS_STALE(inode))
 		goto out_unlock;
 
+#ifdef CONFIG_NFS_FSCACHE
+	if (netfs_inode(inode)->cache) {
+		ret = netfs_read_folio(file, folio);
+		goto out;
+	}
+#endif
 	if (file == NULL) {
 		ret = -EBADF;
 		ctx = nfs_find_open_context(inode, NULL, FMODE_READ);
@@ -368,8 +397,10 @@ int nfs_read_folio(struct file *file, struct folio *folio)
 			     &nfs_async_read_completion_ops);
 
 	ret = nfs_pageio_add_page(&pgio, ctx, page);
-	if (ret)
-		goto out;
+	if (ret) {
+		put_nfs_open_context(ctx);
+		goto out_unlock;
+	}
 
 	nfs_pageio_complete_read(&pgio);
 	ret = pgio.pg_error < 0 ? pgio.pg_error : 0;
@@ -378,12 +409,12 @@ int nfs_read_folio(struct file *file, struct folio *folio)
 		if (!PageUptodate(page) && !ret)
 			ret = xchg(&ctx->error, 0);
 	}
-out:
 	put_nfs_open_context(ctx);
-	trace_nfs_aop_readpage_done(inode, page, ret);
-	return ret;
+	goto out;
+
 out_unlock:
 	unlock_page(page);
+out:
 	trace_nfs_aop_readpage_done(inode, page, ret);
 	return ret;
 }
@@ -405,6 +436,13 @@ void nfs_readahead(struct readahead_control *ractl)
 	if (NFS_STALE(inode))
 		goto out;
 
+#ifdef CONFIG_NFS_FSCACHE
+	if (netfs_inode(inode)->cache) {
+		netfs_readahead(ractl);
+		ret = 0;
+		goto out;
+	}
+#endif
 	if (file == NULL) {
 		ret = -EBADF;
 		ctx = nfs_find_open_context(inode, NULL, FMODE_READ);
diff --git a/include/linux/nfs_page.h b/include/linux/nfs_page.h
index ba7e2e4b0926..8eeb16d9bacd 100644
--- a/include/linux/nfs_page.h
+++ b/include/linux/nfs_page.h
@@ -101,6 +101,9 @@ struct nfs_pageio_descriptor {
 	struct pnfs_layout_segment *pg_lseg;
 	struct nfs_io_completion *pg_io_completion;
 	struct nfs_direct_req	*pg_dreq;
+#ifdef CONFIG_NFS_FSCACHE
+	void			*pg_netfs;
+#endif
 	unsigned int		pg_bsize;	/* default bsize for mirrors */
 
 	u32			pg_mirror_count;
diff --git a/include/linux/nfs_xdr.h b/include/linux/nfs_xdr.h
index e86cf6642d21..e196ef595908 100644
--- a/include/linux/nfs_xdr.h
+++ b/include/linux/nfs_xdr.h
@@ -1619,6 +1619,9 @@ struct nfs_pgio_header {
 	const struct nfs_rw_ops	*rw_ops;
 	struct nfs_io_completion *io_completion;
 	struct nfs_direct_req	*dreq;
+#ifdef CONFIG_NFS_FSCACHE
+	void			*netfs;
+#endif
 
 	int			pnfs_error;
 	int			error;		/* merge with pnfs_error */
-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

