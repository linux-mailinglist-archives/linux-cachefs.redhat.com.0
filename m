Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 74DD13D0FE2
	for <lists+linux-cachefs@lfdr.de>; Wed, 21 Jul 2021 15:45:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626875152;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DV33GTDlMklQjoHPzWPHwTgebSlqp6AzyY3LKX4MLqQ=;
	b=BWEYeetquzQ50Sedh9MTj9jdMvJMMW1uYoAPtjN33bct9tYBu3PsTfAUilKodBX7yQHTJQ
	IzJ8H+fUFNB397MYbbM91RiyDLNLwDtILHrwFHMvPt0e/Ry/LsnjjRcXbEZAoY/1/rCKY+
	L9FZYzvBhfd78k5iXgHsY3kUqQ6zLUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-Z29uHgqlMN-q0I0qRqFGiA-1; Wed, 21 Jul 2021 09:45:51 -0400
X-MC-Unique: Z29uHgqlMN-q0I0qRqFGiA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 444648026BB;
	Wed, 21 Jul 2021 13:45:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3313B5D741;
	Wed, 21 Jul 2021 13:45:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D9664BB7C;
	Wed, 21 Jul 2021 13:45:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16LDjlMH031306 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 21 Jul 2021 09:45:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 689E360C59; Wed, 21 Jul 2021 13:45:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-62.rdu2.redhat.com
	[10.10.112.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 095B36A057;
	Wed, 21 Jul 2021 13:45:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 21 Jul 2021 14:45:24 +0100
Message-ID: <162687512469.276387.15723958695928327041.stgit@warthog.procyon.org.uk>
In-Reply-To: <162687506932.276387.14456718890524355509.stgit@warthog.procyon.org.uk>
References: <162687506932.276387.14456718890524355509.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Shyam Prasad N <nspmangalore@gmail.com>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	devel@lists.orangefs.org, Mike Marshall <hubcap@omnibond.com>
Subject: [Linux-cachefs] [RFC PATCH 04/12] netfs: Use a buffer in
 netfs_read_request and add pages to it
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

Add an "output" buffer to the netfs_read_request struct.  This is an xarray
to which the intended destination pages can be added, supplemented by
additional pages to make the buffer up to a sufficient size to be the
output for an overlarge read, decryption and/or decompression.

The readahead_expand() function will only expand the requested pageset up
to a point where it runs into an already extant page at either end - which
means that the resulting buffer might not be large enough or may be
misaligned for our purposes.

With this, we can make sure we have a useful buffer and we can splice the
extra pages from it into the pagecache if there are holes we can plug.

The read buffer could also be useful in the future to perform RMW cycles
when fixing up after disconnected operation or direct I/O with
smaller-than-preferred granularity.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/netfs/read_helper.c |  166 ++++++++++++++++++++++++++++++++++++++++++++----
 include/linux/netfs.h  |    1 
 2 files changed, 154 insertions(+), 13 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 5e1a9be48130..b03bc5b0da5a 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -28,6 +28,7 @@ module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
 MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
 
 static void netfs_rreq_work(struct work_struct *);
+static void netfs_rreq_clear_buffer(struct netfs_read_request *);
 static void __netfs_put_subrequest(struct netfs_read_subrequest *, bool);
 
 static void netfs_put_subrequest(struct netfs_read_subrequest *subreq,
@@ -51,6 +52,7 @@ static struct netfs_read_request *netfs_alloc_read_request(
 		rreq->inode	= file_inode(file);
 		rreq->i_size	= i_size_read(rreq->inode);
 		rreq->debug_id	= atomic_inc_return(&debug_ids);
+		xa_init(&rreq->buffer);
 		INIT_LIST_HEAD(&rreq->subrequests);
 		INIT_WORK(&rreq->work, netfs_rreq_work);
 		refcount_set(&rreq->usage, 1);
@@ -90,6 +92,7 @@ static void netfs_free_read_request(struct work_struct *work)
 	trace_netfs_rreq(rreq, netfs_rreq_trace_free);
 	if (rreq->cache_resources.ops)
 		rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
+	netfs_rreq_clear_buffer(rreq);
 	kfree(rreq);
 	netfs_stat_d(&netfs_n_rh_rreq);
 }
@@ -727,7 +730,7 @@ netfs_rreq_prepare_read(struct netfs_read_request *rreq,
 	if (WARN_ON(subreq->len == 0))
 		source = NETFS_INVALID_READ;
 
-	iov_iter_xarray(&subreq->iter, READ, &rreq->mapping->i_pages,
+	iov_iter_xarray(&subreq->iter, READ, &rreq->buffer,
 			subreq->start, subreq->len);
 
 out:
@@ -838,6 +841,133 @@ static void netfs_rreq_expand(struct netfs_read_request *rreq,
 	}
 }
 
+/*
+ * Clear a read buffer, discarding the pages which have XA_MARK_0 set.
+ */
+static void netfs_rreq_clear_buffer(struct netfs_read_request *rreq)
+{
+	struct page *page;
+	XA_STATE(xas, &rreq->buffer, 0);
+
+	rcu_read_lock();
+	xas_for_each_marked(&xas, page, ULONG_MAX, XA_MARK_0) {
+		put_page(page);
+	}
+	rcu_read_unlock();
+	xa_destroy(&rreq->buffer);
+}
+
+static int xa_insert_set_mark(struct xarray *xa, unsigned long index,
+			      void *entry, xa_mark_t mark, gfp_t gfp_mask)
+{
+	int ret;
+
+	xa_lock(xa);
+	ret = __xa_insert(xa, index, entry, gfp_mask);
+	if (ret == 0)
+		__xa_set_mark(xa, index, mark);
+	xa_unlock(xa);
+	return ret;
+}
+
+/*
+ * Create the specified range of pages in the buffer attached to the read
+ * request.  The pages are marked with XA_MARK_0 so that we know that these
+ * need freeing later.
+ */
+static int netfs_rreq_add_pages_to_buffer(struct netfs_read_request *rreq,
+					  pgoff_t index, pgoff_t to, gfp_t gfp_mask)
+{
+	struct page *page;
+	int ret;
+
+	if (to + 1 == index) /* Page range is inclusive */
+		return 0;
+
+	do {
+		page = __page_cache_alloc(gfp_mask);
+		if (!page)
+			return -ENOMEM;
+		page->index = index;
+		ret = xa_insert_set_mark(&rreq->buffer, index, page, XA_MARK_0,
+					 gfp_mask);
+		if (ret < 0) {
+			__free_page(page);
+			return ret;
+		}
+
+		index += thp_nr_pages(page);
+	} while (index < to);
+
+	return 0;
+}
+
+/*
+ * Set up a buffer into which to data will be read or decrypted/decompressed.
+ * The pages to be read into are attached to this buffer and the gaps filled in
+ * to form a continuous region.
+ */
+static int netfs_rreq_set_up_buffer(struct netfs_read_request *rreq,
+				    struct readahead_control *ractl,
+				    struct page *keep,
+				    pgoff_t have_index, unsigned int have_pages)
+{
+	struct page *page;
+	gfp_t gfp_mask = readahead_gfp_mask(rreq->mapping);
+	unsigned int want_pages = have_pages;
+	pgoff_t want_index = have_index;
+	int ret;
+
+#if 0
+	want_index = round_down(want_index, 256 * 1024 / PAGE_SIZE);
+	want_pages += have_index - want_index;
+	want_pages = round_up(want_pages, 256 * 1024 / PAGE_SIZE);
+
+	kdebug("setup %lx-%lx -> %lx-%lx",
+	       have_index, have_index + have_pages - 1,
+	       want_index, want_index + want_pages - 1);
+#endif
+
+	ret = netfs_rreq_add_pages_to_buffer(rreq, want_index, have_index - 1,
+					     gfp_mask);
+	if (ret < 0)
+		return ret;
+	have_pages += have_index - want_index;
+
+	ret = netfs_rreq_add_pages_to_buffer(rreq, have_index + have_pages,
+					     want_index + want_pages - 1,
+					     gfp_mask);
+	if (ret < 0)
+		return ret;
+
+	/* Transfer the pages proposed by the VM into the buffer along with
+	 * their page refs.  The locks will be dropped in netfs_rreq_unlock().
+	 */
+	if (ractl) {
+		while ((page = readahead_page(ractl))) {
+			if (page == keep)
+				get_page(page);
+			ret = xa_insert_set_mark(&rreq->buffer, page->index, page,
+						 XA_MARK_0, gfp_mask);
+			if (ret < 0) {
+				if (page != keep)
+					unlock_page(page);
+				put_page(page);
+				return ret;
+			}
+		}
+	} else {
+		get_page(keep);
+		ret = xa_insert_set_mark(&rreq->buffer, keep->index, keep,
+					 XA_MARK_0, gfp_mask);
+		if (ret < 0) {
+			put_page(keep);
+			return ret;
+		}
+	}
+	return 0;
+}
+
 /**
  * netfs_readahead - Helper to manage a read request
  * @ractl: The description of the readahead request
@@ -861,7 +991,6 @@ void netfs_readahead(struct readahead_control *ractl,
 		     void *netfs_priv)
 {
 	struct netfs_read_request *rreq;
-	struct page *page;
 	unsigned int debug_index = 0;
 	int ret;
 
@@ -889,6 +1018,12 @@ void netfs_readahead(struct readahead_control *ractl,
 
 	netfs_rreq_expand(rreq, ractl);
 
+	/* Set up the output buffer */
+	ret = netfs_rreq_set_up_buffer(rreq, ractl, NULL,
+				       readahead_index(ractl), readahead_count(ractl));
+	if (ret < 0)
+		goto cleanup_free;
+
 	atomic_set(&rreq->nr_rd_ops, 1);
 	do {
 		if (!netfs_rreq_submit_slice(rreq, &debug_index))
@@ -896,12 +1031,6 @@ void netfs_readahead(struct readahead_control *ractl,
 
 	} while (rreq->submitted < rreq->len);
 
-	/* Drop the refs on the pages here rather than in the cache or
-	 * filesystem.  The locks will be dropped in netfs_rreq_unlock().
-	 */
-	while ((page = readahead_page(ractl)))
-		put_page(page);
-
 	/* If we decrement nr_rd_ops to 0, the ref belongs to us. */
 	if (atomic_dec_and_test(&rreq->nr_rd_ops))
 		netfs_rreq_assess(rreq, false);
@@ -967,6 +1096,12 @@ int netfs_readpage(struct file *file,
 	netfs_stat(&netfs_n_rh_readpage);
 	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
 
+	/* Set up the output buffer */
+	ret = netfs_rreq_set_up_buffer(rreq, NULL, page,
+				       page_index(page), thp_nr_pages(page));
+	if (ret < 0)
+		goto out;
+
 	netfs_get_read_request(rreq);
 
 	atomic_set(&rreq->nr_rd_ops, 1);
@@ -1134,13 +1269,18 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	 */
 	ractl._nr_pages = thp_nr_pages(page);
 	netfs_rreq_expand(rreq, &ractl);
-	netfs_get_read_request(rreq);
 
-	/* We hold the page locks, so we can drop the references */
-	while ((xpage = readahead_page(&ractl)))
-		if (xpage != page)
-			put_page(xpage);
+	/* Set up the output buffer */
+	ret = netfs_rreq_set_up_buffer(rreq, &ractl, page,
+				       readahead_index(&ractl), readahead_count(&ractl));
+	if (ret < 0) {
+		while ((xpage = readahead_page(&ractl)))
+			if (xpage != page)
+				put_page(xpage);
+		goto error_put;
+	}
 
+	netfs_get_read_request(rreq);
 	atomic_set(&rreq->nr_rd_ops, 1);
 	do {
 		if (!netfs_rreq_submit_slice(rreq, &debug_index))
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 45d40c622205..815001fe7a76 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -138,6 +138,7 @@ struct netfs_read_request {
 	struct address_space	*mapping;	/* The mapping being accessed */
 	struct netfs_cache_resources cache_resources;
 	struct list_head	subrequests;	/* Requests to fetch I/O from disk or net */
+	struct xarray		buffer;		/* Decryption/decompression buffer */
 	void			*netfs_priv;	/* Private data for the netfs */
 	unsigned int		debug_id;
 	atomic_t		nr_rd_ops;	/* Number of read ops in progress */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

