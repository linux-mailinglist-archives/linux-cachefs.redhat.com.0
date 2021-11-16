Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C214532FA
	for <lists+linux-cachefs@lfdr.de>; Tue, 16 Nov 2021 14:39:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637069983;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6g2wRPAaK7MAMcrJKJ7Sl2pXELm60+pbjLOXqAhfEQg=;
	b=iO0svkrI8uegx1OXMqtCwezhUG7zLt+n8siEC4gn20RID+Vkj7k62vYotoCnPri/nKvlXO
	s77kJo7sDvCIllM7TRMARWxLnIjStbv9/iEDJsTEoJiGseBCo5Kf+J4orDuovOtH6u3DYo
	63rO2MMs037gn4VtJ1ZhVQTFlTnncCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-Akh-eZ9XPWOIttIevKJ0Yw-1; Tue, 16 Nov 2021 08:39:40 -0500
X-MC-Unique: Akh-eZ9XPWOIttIevKJ0Yw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C3B110144E0;
	Tue, 16 Nov 2021 13:39:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB8DF1970E;
	Tue, 16 Nov 2021 13:39:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3F6A1806D03;
	Tue, 16 Nov 2021 13:39:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AGDcuSE031924 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Nov 2021 08:38:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 784C7694B4; Tue, 16 Nov 2021 13:38:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F7A92AF6D;
	Tue, 16 Nov 2021 13:38:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Tue, 16 Nov 2021 13:38:45 +0000
Message-ID: <163706992597.3179783.18360472879717076435.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Subject: [Linux-cachefs] [PATCH] netfs: Adjust docs after foliation
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

Adjust the netfslib docs in light of the foliation changes.

Also un-kdoc-mark netfs_skip_folio_read() since it's internal and isn't
part of the API.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Matthew Wilcox <willy@infradead.org>
cc: linux-cachefs@redhat.com
cc: linux-mm@kvack.org
---

 Documentation/filesystems/netfs_library.rst |   95 ++++++++++++++++-----------
 fs/netfs/read_helper.c                      |    4 +
 2 files changed, 58 insertions(+), 41 deletions(-)

diff --git a/Documentation/filesystems/netfs_library.rst b/Documentation/filesystems/netfs_library.rst
index bb68d39f03b7..375baca7edcd 100644
--- a/Documentation/filesystems/netfs_library.rst
+++ b/Documentation/filesystems/netfs_library.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 =================================
-NETWORK FILESYSTEM HELPER LIBRARY
+Network Filesystem Helper Library
 =================================
 
 .. Contents:
@@ -37,22 +37,22 @@ into a common call framework.
 
 The following services are provided:
 
- * Handles transparent huge pages (THPs).
+ * Handle folios that span multiple pages.
 
- * Insulates the netfs from VM interface changes.
+ * Insulate the netfs from VM interface changes.
 
- * Allows the netfs to arbitrarily split reads up into pieces, even ones that
-   don't match page sizes or page alignments and that may cross pages.
+ * Allow the netfs to arbitrarily split reads up into pieces, even ones that
+   don't match folio sizes or folio alignments and that may cross folios.
 
- * Allows the netfs to expand a readahead request in both directions to meet
-   its needs.
+ * Allow the netfs to expand a readahead request in both directions to meet its
+   needs.
 
- * Allows the netfs to partially fulfil a read, which will then be resubmitted.
+ * Allow the netfs to partially fulfil a read, which will then be resubmitted.
 
- * Handles local caching, allowing cached data and server-read data to be
+ * Handle local caching, allowing cached data and server-read data to be
    interleaved for a single request.
 
- * Handles clearing of bufferage that aren't on the server.
+ * Handle clearing of bufferage that aren't on the server.
 
  * Handle retrying of reads that failed, switching reads from the cache to the
    server as necessary.
@@ -70,22 +70,22 @@ Read Helper Functions
 
 Three read helpers are provided::
 
- * void netfs_readahead(struct readahead_control *ractl,
-			const struct netfs_read_request_ops *ops,
-			void *netfs_priv);``
- * int netfs_readpage(struct file *file,
-		      struct page *page,
-		      const struct netfs_read_request_ops *ops,
-		      void *netfs_priv);
- * int netfs_write_begin(struct file *file,
-			 struct address_space *mapping,
-			 loff_t pos,
-			 unsigned int len,
-			 unsigned int flags,
-			 struct page **_page,
-			 void **_fsdata,
-			 const struct netfs_read_request_ops *ops,
-			 void *netfs_priv);
+	void netfs_readahead(struct readahead_control *ractl,
+			     const struct netfs_read_request_ops *ops,
+			     void *netfs_priv);
+	int netfs_readpage(struct file *file,
+			   struct folio *folio,
+			   const struct netfs_read_request_ops *ops,
+			   void *netfs_priv);
+	int netfs_write_begin(struct file *file,
+			      struct address_space *mapping,
+			      loff_t pos,
+			      unsigned int len,
+			      unsigned int flags,
+			      struct folio **_folio,
+			      void **_fsdata,
+			      const struct netfs_read_request_ops *ops,
+			      void *netfs_priv);
 
 Each corresponds to a VM operation, with the addition of a couple of parameters
 for the use of the read helpers:
@@ -103,8 +103,8 @@ Both of these values will be stored into the read request structure.
 For ->readahead() and ->readpage(), the network filesystem should just jump
 into the corresponding read helper; whereas for ->write_begin(), it may be a
 little more complicated as the network filesystem might want to flush
-conflicting writes or track dirty data and needs to put the acquired page if an
-error occurs after calling the helper.
+conflicting writes or track dirty data and needs to put the acquired folio if
+an error occurs after calling the helper.
 
 The helpers manage the read request, calling back into the network filesystem
 through the suppplied table of operations.  Waits will be performed as
@@ -253,7 +253,7 @@ through which it can issue requests and negotiate::
 		void (*issue_op)(struct netfs_read_subrequest *subreq);
 		bool (*is_still_valid)(struct netfs_read_request *rreq);
 		int (*check_write_begin)(struct file *file, loff_t pos, unsigned len,
-					 struct page *page, void **_fsdata);
+					 struct folio *folio, void **_fsdata);
 		void (*done)(struct netfs_read_request *rreq);
 		void (*cleanup)(struct address_space *mapping, void *netfs_priv);
 	};
@@ -313,13 +313,14 @@ The operations are as follows:
 
    There is no return value; the netfs_subreq_terminated() function should be
    called to indicate whether or not the operation succeeded and how much data
-   it transferred.  The filesystem also should not deal with setting pages
+   it transferred.  The filesystem also should not deal with setting folios
    uptodate, unlocking them or dropping their refs - the helpers need to deal
    with this as they have to coordinate with copying to the local cache.
 
-   Note that the helpers have the pages locked, but not pinned.  It is possible
-   to use the ITER_XARRAY iov iterator to refer to the range of the inode that
-   is being operated upon without the need to allocate large bvec tables.
+   Note that the helpers have the folios locked, but not pinned.  It is
+   possible to use the ITER_XARRAY iov iterator to refer to the range of the
+   inode that is being operated upon without the need to allocate large bvec
+   tables.
 
  * ``is_still_valid()``
 
@@ -330,15 +331,15 @@ The operations are as follows:
  * ``check_write_begin()``
 
    [Optional] This is called from the netfs_write_begin() helper once it has
-   allocated/grabbed the page to be modified to allow the filesystem to flush
+   allocated/grabbed the folio to be modified to allow the filesystem to flush
    conflicting state before allowing it to be modified.
 
-   It should return 0 if everything is now fine, -EAGAIN if the page should be
+   It should return 0 if everything is now fine, -EAGAIN if the folio should be
    regrabbed and any other error code to abort the operation.
 
  * ``done``
 
-   [Optional] This is called after the pages in the request have all been
+   [Optional] This is called after the folios in the request have all been
    unlocked (and marked uptodate if applicable).
 
  * ``cleanup``
@@ -390,7 +391,7 @@ The read helpers work by the following general procedure:
      * If NETFS_SREQ_CLEAR_TAIL was set, a short read will be cleared to the
        end of the slice instead of reissuing.
 
- * Once the data is read, the pages that have been fully read/cleared:
+ * Once the data is read, the folios that have been fully read/cleared:
 
    * Will be marked uptodate.
 
@@ -398,11 +399,11 @@ The read helpers work by the following general procedure:
 
    * Unlocked
 
- * Any pages that need writing to the cache will then have DIO writes issued.
+ * Any folios that need writing to the cache will then have DIO writes issued.
 
  * Synchronous operations will wait for reading to be complete.
 
- * Writes to the cache will proceed asynchronously and the pages will have the
+ * Writes to the cache will proceed asynchronously and the folios will have the
    PG_fscache mark removed when that completes.
 
  * The request structures will be cleaned up when everything has completed.
@@ -452,6 +453,9 @@ operation table looks like the following::
 			    netfs_io_terminated_t term_func,
 			    void *term_func_priv);
 
+		int (*prepare_write)(struct netfs_cache_resources *cres,
+				     loff_t *_start, size_t *_len, loff_t i_size);
+
 		int (*write)(struct netfs_cache_resources *cres,
 			     loff_t start_pos,
 			     struct iov_iter *iter,
@@ -509,6 +513,14 @@ The methods defined in the table are:
    indicating whether the termination is definitely happening in the caller's
    context.
 
+ * ``prepare_write()``
+
+   [Required] Called to adjust a write to the cache and check that there is
+   sufficient space in the cache.  The start and length values indicate the
+   size of the write that netfslib is proposing, and this can be adjusted by
+   the cache to respect DIO boundaries.  The file size is passed for
+   information.
+
  * ``write()``
 
    [Required] Called to write to the cache.  The start file offset is given
@@ -525,4 +537,9 @@ not the read request structure as they could be used in other situations where
 there isn't a read request structure as well, such as writing dirty data to the
 cache.
 
+
+API Function Reference
+======================
+
 .. kernel-doc:: include/linux/netfs.h
+.. kernel-doc:: fs/netfs/read_helper.c
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 9320a42dfaf9..7046f9bdd8dc 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -1008,8 +1008,8 @@ int netfs_readpage(struct file *file,
 }
 EXPORT_SYMBOL(netfs_readpage);
 
-/**
- * netfs_skip_folio_read - prep a folio for writing without reading first
+/*
+ * Prepare a folio for writing without reading first
  * @folio: The folio being prepared
  * @pos: starting position for the write
  * @len: length of write


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

