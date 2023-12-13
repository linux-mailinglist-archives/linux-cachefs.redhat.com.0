Return-Path: <linux-cachefs+bncBDLIXLMFVAERBQUZ46VQMGQEBR7DRCY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FAA81163E
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:24:51 +0100 (CET)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-591627a8555sf278686eaf.3
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:24:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481090; cv=pass;
        d=google.com; s=arc-20160816;
        b=KEoD9PZnfXoVKPr+CTEpd3i4CunIvg9m/3xFQRIqNNnqtQ2GXa6A1Sbpil1niqcGYd
         CRLyAys3ucOU/AdZohXq3DfVnXDp+zBmMGJu0xaLyvkvH5kXls1AwT4ty9fUWi5Sg8zm
         oVgI08o7d6Ggcv6W2Yz/J32AAA/3RfHYdPctkgQ3fbwSO4jbGE4oWcXTJSEnBf+VOz18
         en9CNq/FJSXmsmVQYhHi5HbjelTiPP8k9a6a2pGXeEFr5sbrQIbCQgj9am/5dtmxX8g2
         oXCEtSCfznrWNxeylxvp6dfxzMWCc1To6+8tju4l7+saBvnZ7ZEUTT5iErZL0TfiVC7K
         dFaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=lIgA0flKFaNGJzCiq7PyslM6hj6LatLCRIBm4KyUtWc=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=FwtrZ7j3Gg3PIoK/VKoqBL0CYDbNKTfp8owK7J5/FDrL340pyUs5S0Y1z++xcl/Ve9
         zrzENnQNfRDwd70pDSuU1MzSoMX01Q5+nCyCe+6TBarCE6is/iEG7JiMCUeROoOf/V7S
         F7GHo7Ys5uEW5kdlN9xCK75vU+4mQ4ApCwztrk4YOaTPR7LRvhBzq9gEXpFwJ+W9IQFT
         YATENMGp/whizvDPufhfePn6Ru0E0kT/jYMgKGxFG6HEcbkIIaiVGGf2o5F+mZUZJIGl
         lVhII3X7ZSsZqf2C2a9LFO4t163tguXyv/y6152LK9TxyKuPwN3ulFX5+G0jW2+YPvCh
         0HWQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481090; x=1703085890;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIgA0flKFaNGJzCiq7PyslM6hj6LatLCRIBm4KyUtWc=;
        b=oXnpQx1seX0uisQRVEnHFDj8mkxMiSAT6XwxqbFQuG2pOutZAojdB37ILIwEwRj6cJ
         PiGRtGZxLDug6LJQtnxfe5YhPoCOo0pf1rVBhOi3RD5pHNNmOKVDB+dOJbHWPmd34uPv
         TqQ6/sCN3Wuk9BtgMIDT/u/WQ7iWol8H5hZW6doRL/r0JLlB24Hxkv22msQb9IOu4WBF
         TKyhjakK6SkZehJKnD6Oj0xyeQQuc51Ild+UggdNlUBnfXsOzpUTsk9I/+ocACVKtgxo
         Jl8JqCr7MBrqDbFGNusq2jVA/jj5lPn+QyMHVPyt0yIHGDK3hMFfxawkoU0fASdXZ57h
         4V7w==
X-Gm-Message-State: AOJu0YwqQq82PC1zAmzWERhPCjI2hfw4sFqK1oHQJaVmpJXUGTsE5+Ae
	ZnnGurRaleW96d0OMaTfHqY4+g==
X-Google-Smtp-Source: AGHT+IFvzj2dEAptfUgwE1QHcpnb+/VULAbc8cDSeGFTxSSwNxca6QQCuYtzUjV5WNr46gac6Z0sJg==
X-Received: by 2002:a4a:681:0:b0:591:47f2:3224 with SMTP id 123-20020a4a0681000000b0059147f23224mr1308583ooj.0.1702481090655;
        Wed, 13 Dec 2023 07:24:50 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:2224:b0:58e:2769:6234 with SMTP id
 cj36-20020a056820222400b0058e27696234ls2741722oob.0.-pod-prod-09-us; Wed, 13
 Dec 2023 07:24:50 -0800 (PST)
X-Received: by 2002:a9d:4b0d:0:b0:6d8:7cf8:1aa6 with SMTP id q13-20020a9d4b0d000000b006d87cf81aa6mr8997290otf.42.1702481089971;
        Wed, 13 Dec 2023 07:24:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481089; cv=none;
        d=google.com; s=arc-20160816;
        b=ieGjb0WsDEJTTYgby+6SowSsumBtUz/3VKL9TD90rR/Rh3rs2ly59QltSNPWtM6Jfr
         wyHHvM8rl8Wcds7BIPU2nGTEJxOZMMo3v6TSRLYJz8xbsxzJsxxr/5+hnxVp29nysQ0J
         prMjKFovDlhY0+taW2XY3XrAsgfJ+j7PUa62xZ88LRjOL2k+n2DhKJMsEdnFTihR2Qmr
         8btkctK4FgzBb8HDuz0hUvvKnSrtsitc2dvdbJyWoWjxWu8KPlc2Mo9XCBAPY9omJyL2
         YFvuzyrBstaMD6lwZiYyGhx2yMaFxJnF5fH563/OblAvqqdzwaMPEeG3cxRZ3Ul3goXN
         E0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=YNj0M7wIH2KyJkCq66ZNM2ALuHL5lOHXJKpMpeEunrM=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=kT2P7eX4/tGxigxKAfcenoMZ+ucH18JK9WY70+p9jCc1nT8LTdSomwEO5vegYiiKvG
         4TPMaVlR7WJPDPPGshDfD2rZ1Lu6hIu99tqpOyEi4MCZVWONpk2Jb0qQdutYWdQjEEg/
         xMMtlI7y60bVS0V7dl/0Jx/wrDb4XIt85bIAopBY2gDz0b8E80c/n58ZEydfTgbSMLrV
         b+JAj6ijhC6DhRAZA6ZF8fAPkt3bnCoHlz1j/AwMMDj0R8SuDcmrQVmWhWH/KXMcsPvx
         v3U3mPXycvhhQC74DejyHLMpsPueJVztWmaRHT8xbZYp7jqSWDQvMl7zzbba8a4gzfHN
         c1WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id c26-20020ab0695a000000b007cb2c41e234si655514uas.188.2023.12.13.07.24.49
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:24:49 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-8BwdS7hbOKqqqJr6LEQUFA-1; Wed, 13 Dec 2023 10:24:47 -0500
X-MC-Unique: 8BwdS7hbOKqqqJr6LEQUFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 467CD863022
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:24:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 406983C2E; Wed, 13 Dec 2023 15:24:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 139493C2F;
	Wed, 13 Dec 2023 15:24:43 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/39] netfs: Add iov_iters to (sub)requests to describe various buffers
Date: Wed, 13 Dec 2023 15:23:22 +0000
Message-ID: <20231213152350.431591-13-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

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
index c5013ec3c1dc..aa95b4d6376c 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -320,11 +320,7 @@ static void afs_issue_read(struct netfs_io_subrequest *subreq)
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
index d39d0ffe75d2..751556faa70b 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -199,6 +199,10 @@ void netfs_readahead(struct readahead_control *ractl)
 
 	netfs_rreq_expand(rreq, ractl);
 
+	/* Set up the output buffer */
+	iov_iter_xarray(&rreq->iter, ITER_DEST, &ractl->mapping->i_pages,
+			rreq->start, rreq->len);
+
 	/* Drop the refs on the folios here rather than in the cache or
 	 * filesystem.  The locks will be dropped in netfs_rreq_unlock().
 	 */
@@ -251,6 +255,11 @@ int netfs_read_folio(struct file *file, struct folio *folio)
 
 	netfs_stat(&netfs_n_rh_readpage);
 	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
+
+	/* Set up the output buffer */
+	iov_iter_xarray(&rreq->iter, ITER_DEST, &mapping->i_pages,
+			rreq->start, rreq->len);
+
 	return netfs_begin_read(rreq, true);
 
 discard:
@@ -408,6 +417,10 @@ int netfs_write_begin(struct netfs_inode *ctx,
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
index fc6d9756a029..3da962e977f5 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -150,6 +150,7 @@ struct netfs_cache_resources {
 struct netfs_io_subrequest {
 	struct netfs_io_request *rreq;		/* Supervising I/O request */
 	struct list_head	rreq_link;	/* Link in rreq->subrequests */
+	struct iov_iter		io_iter;	/* Iterator for this subrequest */
 	loff_t			start;		/* Where to start the I/O */
 	size_t			len;		/* Size of the I/O */
 	size_t			transferred;	/* Amount of data transferred */
@@ -186,6 +187,8 @@ struct netfs_io_request {
 	struct netfs_cache_resources cache_resources;
 	struct list_head	proc_link;	/* Link in netfs_iorequests */
 	struct list_head	subrequests;	/* Contributory I/O operations */
+	struct iov_iter		iter;		/* Unencrypted-side iterator */
+	struct iov_iter		io_iter;	/* I/O (Encrypted-side) iterator */
 	void			*netfs_priv;	/* Private data for the netfs */
 	unsigned int		debug_id;
 	atomic_t		nr_outstanding;	/* Number of ops in progress */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

