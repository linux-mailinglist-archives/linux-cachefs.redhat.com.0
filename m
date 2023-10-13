Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2596E7C8993
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Oct 2023 18:05:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697213106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Cs+7FBC9qwSth32Mzv56sGnvdYRBP792L18Gt+f6uP0=;
	b=FF6OxJ4OUNA8sVGy/qMTY/WR5y46hgjHSHJVp8/fxo5AhZiePnsFFUhAGnyIQA8+faBD5l
	OoLNUmtLSJSBP//u+QS8O2TGjtvWRGXp10HwlErb7F2sA4pem7RHoFspHUK+27CEM8Qy2s
	tLJeK2NE0qfmN6w3WGFidfxa5v6OkC0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-FXRFTEW2NoadGb0Wjp-4lg-1; Fri, 13 Oct 2023 12:05:03 -0400
X-MC-Unique: FXRFTEW2NoadGb0Wjp-4lg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6833D3822E95;
	Fri, 13 Oct 2023 16:05:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EE072157F5B;
	Fri, 13 Oct 2023 16:05:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3CFBC19465A2;
	Fri, 13 Oct 2023 16:05:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5ACFA1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Oct 2023 16:05:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4A2AB25C1; Fri, 13 Oct 2023 16:05:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BACC725C0;
 Fri, 13 Oct 2023 16:04:58 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Date: Fri, 13 Oct 2023 17:03:39 +0100
Message-ID: <20231013160423.2218093-11-dhowells@redhat.com>
In-Reply-To: <20231013160423.2218093-1-dhowells@redhat.com>
References: <20231013160423.2218093-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Subject: [Linux-cachefs] [RFC PATCH 10/53] netfs: Add iov_iters to
 (sub)requests to describe various buffers
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 netdev@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com, linux-mm@kvack.org,
 Marc Dionne <marc.dionne@auristor.com>, v9fs@lists.linux.dev,
 Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
 Christian Brauner <christian@brauner.io>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add three iov_iter structs:

 (1) Add an iov_iter (->iter) to the I/O request to describe the
     unencrypted-side buffer.

 (2) Add an iov_iter (->io_iter) to the I/O request to describe the
     encrypted-side I/O buffer.  This may be a different size to the buffer
     in (1).

 (3) Add an iov_iter (->io_iter) to the I/O subrequest to describe the part
     of the I/O buffer for that subrequest.

This will allow future patches to point to a bounce buffer instead for
purposes of handling oversize writes, decryption (where we want to save the
encrypted data to the cache) and decompression.

These iov_iters persist for the lifetime of the (sub)request, and so can be
accessed multiple times without worrying about them being deallocated upon
return to the caller.

The network filesystem must appropriately advance the iterator before
terminating the request.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/afs/file.c            |  6 +---
 fs/netfs/buffered_read.c | 13 ++++++++
 fs/netfs/io.c            | 69 +++++++++++++++++++++++++++++-----------
 include/linux/netfs.h    |  3 ++
 4 files changed, 67 insertions(+), 24 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 3d2e1913ea27..3e39a2ebcad6 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -323,11 +323,7 @@ static void afs_issue_read(struct netfs_io_subrequest *subreq)
 	fsreq->len	= subreq->len   - subreq->transferred;
 	fsreq->key	= key_get(subreq->rreq->netfs_priv);
 	fsreq->vnode	= vnode;
-	fsreq->iter	= &fsreq->def_iter;
-
-	iov_iter_xarray(&fsreq->def_iter, ITER_DEST,
-			&fsreq->vnode->netfs.inode.i_mapping->i_pages,
-			fsreq->pos, fsreq->len);
+	fsreq->iter	= &subreq->io_iter;
 
 	afs_fetch_data(fsreq->vnode, fsreq);
 	afs_put_read(fsreq);
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index a2852fa64ad0..3b7eb706f2fe 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -206,6 +206,10 @@ void netfs_readahead(struct readahead_control *ractl)
 
 	netfs_rreq_expand(rreq, ractl);
 
+	/* Set up the output buffer */
+	iov_iter_xarray(&rreq->iter, ITER_DEST, &ractl->mapping->i_pages,
+			rreq->start, rreq->len);
+
 	/* Drop the refs on the folios here rather than in the cache or
 	 * filesystem.  The locks will be dropped in netfs_rreq_unlock().
 	 */
@@ -258,6 +262,11 @@ int netfs_read_folio(struct file *file, struct folio *folio)
 
 	netfs_stat(&netfs_n_rh_readpage);
 	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
+
+	/* Set up the output buffer */
+	iov_iter_xarray(&rreq->iter, ITER_DEST, &mapping->i_pages,
+			rreq->start, rreq->len);
+
 	return netfs_begin_read(rreq, true);
 
 discard:
@@ -415,6 +424,10 @@ int netfs_write_begin(struct netfs_inode *ctx,
 	ractl._nr_pages = folio_nr_pages(folio);
 	netfs_rreq_expand(rreq, &ractl);
 
+	/* Set up the output buffer */
+	iov_iter_xarray(&rreq->iter, ITER_DEST, &mapping->i_pages,
+			rreq->start, rreq->len);
+
 	/* We hold the folio locks, so we can drop the references */
 	folio_get(folio);
 	while (readahead_folio(&ractl))
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 7f753380e047..e9d408e211b8 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -21,12 +21,7 @@
  */
 static void netfs_clear_unread(struct netfs_io_subrequest *subreq)
 {
-	struct iov_iter iter;
-
-	iov_iter_xarray(&iter, ITER_DEST, &subreq->rreq->mapping->i_pages,
-			subreq->start + subreq->transferred,
-			subreq->len   - subreq->transferred);
-	iov_iter_zero(iov_iter_count(&iter), &iter);
+	iov_iter_zero(iov_iter_count(&subreq->io_iter), &subreq->io_iter);
 }
 
 static void netfs_cache_read_terminated(void *priv, ssize_t transferred_or_error,
@@ -46,14 +41,9 @@ static void netfs_read_from_cache(struct netfs_io_request *rreq,
 				  enum netfs_read_from_hole read_hole)
 {
 	struct netfs_cache_resources *cres = &rreq->cache_resources;
-	struct iov_iter iter;
 
 	netfs_stat(&netfs_n_rh_read);
-	iov_iter_xarray(&iter, ITER_DEST, &rreq->mapping->i_pages,
-			subreq->start + subreq->transferred,
-			subreq->len   - subreq->transferred);
-
-	cres->ops->read(cres, subreq->start, &iter, read_hole,
+	cres->ops->read(cres, subreq->start, &subreq->io_iter, read_hole,
 			netfs_cache_read_terminated, subreq);
 }
 
@@ -88,6 +78,11 @@ static void netfs_read_from_server(struct netfs_io_request *rreq,
 				   struct netfs_io_subrequest *subreq)
 {
 	netfs_stat(&netfs_n_rh_download);
+	if (iov_iter_count(&subreq->io_iter) != subreq->len - subreq->transferred)
+		pr_warn("R=%08x[%u] ITER PRE-MISMATCH %zx != %zx-%zx %lx\n",
+			rreq->debug_id, subreq->debug_index,
+			iov_iter_count(&subreq->io_iter), subreq->len,
+			subreq->transferred, subreq->flags);
 	rreq->netfs_ops->issue_read(subreq);
 }
 
@@ -259,6 +254,30 @@ static void netfs_rreq_short_read(struct netfs_io_request *rreq,
 		netfs_read_from_server(rreq, subreq);
 }
 
+/*
+ * Reset the subrequest iterator prior to resubmission.
+ */
+static void netfs_reset_subreq_iter(struct netfs_io_request *rreq,
+				    struct netfs_io_subrequest *subreq)
+{
+	size_t remaining = subreq->len - subreq->transferred;
+	size_t count = iov_iter_count(&subreq->io_iter);
+
+	if (count == remaining)
+		return;
+
+	_debug("R=%08x[%u] ITER RESUB-MISMATCH %zx != %zx-%zx-%llx %x\n",
+	       rreq->debug_id, subreq->debug_index,
+	       iov_iter_count(&subreq->io_iter), subreq->transferred,
+	       subreq->len, rreq->i_size,
+	       subreq->io_iter.iter_type);
+
+	if (count < remaining)
+		iov_iter_revert(&subreq->io_iter, remaining - count);
+	else
+		iov_iter_advance(&subreq->io_iter, count - remaining);
+}
+
 /*
  * Resubmit any short or failed operations.  Returns true if we got the rreq
  * ref back.
@@ -287,6 +306,7 @@ static bool netfs_rreq_perform_resubmissions(struct netfs_io_request *rreq)
 			trace_netfs_sreq(subreq, netfs_sreq_trace_download_instead);
 			netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
 			atomic_inc(&rreq->nr_outstanding);
+			netfs_reset_subreq_iter(rreq, subreq);
 			netfs_read_from_server(rreq, subreq);
 		} else if (test_bit(NETFS_SREQ_SHORT_IO, &subreq->flags)) {
 			netfs_rreq_short_read(rreq, subreq);
@@ -399,9 +419,9 @@ void netfs_subreq_terminated(struct netfs_io_subrequest *subreq,
 	struct netfs_io_request *rreq = subreq->rreq;
 	int u;
 
-	_enter("[%u]{%llx,%lx},%zd",
-	       subreq->debug_index, subreq->start, subreq->flags,
-	       transferred_or_error);
+	_enter("R=%x[%x]{%llx,%lx},%zd",
+	       rreq->debug_id, subreq->debug_index,
+	       subreq->start, subreq->flags, transferred_or_error);
 
 	switch (subreq->source) {
 	case NETFS_READ_FROM_CACHE:
@@ -501,7 +521,8 @@ static enum netfs_io_source netfs_cache_prepare_read(struct netfs_io_subrequest
  */
 static enum netfs_io_source
 netfs_rreq_prepare_read(struct netfs_io_request *rreq,
-			struct netfs_io_subrequest *subreq)
+			struct netfs_io_subrequest *subreq,
+			struct iov_iter *io_iter)
 {
 	enum netfs_io_source source;
 
@@ -528,9 +549,14 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
 		}
 	}
 
-	if (WARN_ON(subreq->len == 0))
+	if (WARN_ON(subreq->len == 0)) {
 		source = NETFS_INVALID_READ;
+		goto out;
+	}
 
+	subreq->io_iter = *io_iter;
+	iov_iter_truncate(&subreq->io_iter, subreq->len);
+	iov_iter_advance(io_iter, subreq->len);
 out:
 	subreq->source = source;
 	trace_netfs_sreq(subreq, netfs_sreq_trace_prepare);
@@ -541,6 +567,7 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
  * Slice off a piece of a read request and submit an I/O request for it.
  */
 static bool netfs_rreq_submit_slice(struct netfs_io_request *rreq,
+				    struct iov_iter *io_iter,
 				    unsigned int *_debug_index)
 {
 	struct netfs_io_subrequest *subreq;
@@ -565,7 +592,7 @@ static bool netfs_rreq_submit_slice(struct netfs_io_request *rreq,
 	 * (the starts must coincide), in which case, we go around the loop
 	 * again and ask it to download the next piece.
 	 */
-	source = netfs_rreq_prepare_read(rreq, subreq);
+	source = netfs_rreq_prepare_read(rreq, subreq, io_iter);
 	if (source == NETFS_INVALID_READ)
 		goto subreq_failed;
 
@@ -603,6 +630,7 @@ static bool netfs_rreq_submit_slice(struct netfs_io_request *rreq,
  */
 int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 {
+	struct iov_iter io_iter;
 	unsigned int debug_index = 0;
 	int ret;
 
@@ -615,6 +643,8 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 		return -EIO;
 	}
 
+	rreq->io_iter = rreq->iter;
+
 	INIT_WORK(&rreq->work, netfs_rreq_work);
 
 	if (sync)
@@ -624,8 +654,9 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 	 * want and submit each one.
 	 */
 	atomic_set(&rreq->nr_outstanding, 1);
+	io_iter = rreq->io_iter;
 	do {
-		if (!netfs_rreq_submit_slice(rreq, &debug_index))
+		if (!netfs_rreq_submit_slice(rreq, &io_iter, &debug_index))
 			break;
 
 	} while (rreq->submitted < rreq->len);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 33d4487a91e9..bd0437088f0e 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -152,6 +152,7 @@ struct netfs_cache_resources {
 struct netfs_io_subrequest {
 	struct netfs_io_request *rreq;		/* Supervising I/O request */
 	struct list_head	rreq_link;	/* Link in rreq->subrequests */
+	struct iov_iter		io_iter;	/* Iterator for this subrequest */
 	loff_t			start;		/* Where to start the I/O */
 	size_t			len;		/* Size of the I/O */
 	size_t			transferred;	/* Amount of data transferred */
@@ -188,6 +189,8 @@ struct netfs_io_request {
 	struct netfs_cache_resources cache_resources;
 	struct list_head	proc_link;	/* Link in netfs_iorequests */
 	struct list_head	subrequests;	/* Contributory I/O operations */
+	struct iov_iter		iter;		/* Unencrypted-side iterator */
+	struct iov_iter		io_iter;	/* I/O (Encrypted-side) iterator */
 	void			*netfs_priv;	/* Private data for the netfs */
 	unsigned int		debug_id;
 	unsigned int		rsize;		/* Maximum read size (0 for none) */
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

