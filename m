Return-Path: <linux-cachefs+bncBDLIXLMFVAERBIVQ36VAMGQETHEUGJY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD0D7EF967
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:20 +0100 (CET)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1e9c2c00182sf2378543fac.1
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255779; cv=pass;
        d=google.com; s=arc-20160816;
        b=D+zKA34s1WHt3PUOVdMcz7z2fT+z0I/pig0Rjk6xnDiAj0uM7MtuoF7Pvailmr5jnx
         J2vrDdwX/djFMjNXTimbU30OJTqF7gY8UBk15okyu8Sw66UgoEfQh2UywK1VwVy/NIDt
         dSRKwI6WYpsrinQ9NMkmVExA0DYU+Z/RjdKomU6V0Q0SQW/zA6nfLAjM12/OXnnSDEVQ
         0CQQ1+gi8m5nYUVSLQwPb/bKmAUQTNOnJ624Us+oGNVjUm3BxJISXeh+cW4hHbXSODX1
         Y+wNkFl4ejqYYkJGq90g+1nCT70/ygaUhT08/XZKJHD/qKcGwClzjUxj+JDDLfkJo2Cx
         GVWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=VCNk/TvOcc15a8zA2qYQjbCXNLIOBE6HSQyMn1xfFM0=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=u+aE0Q+0jByqmoN5Pb0vvMVw4oMXJwcHpiuooQ33AnVyA7ro/hnRBvNUWtIfAox2ik
         nmGyKK5BrAxA4Y4FIsfx+ryWG7qvw++GloExpCtYiNioyxeuKOVzlPCb1Ud+YJnIHTml
         ZV109OWi7ivmORJx9wIf+S6NuRwTK+SgLqNwYehWqW0NUsBN06Zn7kxMSMC59Gd1YKOX
         rzHpwWbRTX1NMtv5zIXEIcj758/+DOEs9nebiSRe1tSz5/svK/boUQUwqJAGjQUI6BOE
         PTa3XzelpihgIwq9TBJPjD7qkX2r/T37QNUIHN6gHdDBs3Ze92Z8UuhlC94eVlmtL6VW
         vByw==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255779; x=1700860579;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCNk/TvOcc15a8zA2qYQjbCXNLIOBE6HSQyMn1xfFM0=;
        b=IIpg0jKLtmpl6MEoU3hdpl8VXX+8YtktfCoe9MEAEvwscN+d09CKwX4gHN3IF9rDFz
         phOSrO3k0WlpaW2kDqi3J7AfzXB2zq7bQeUHbcG8rpGlm7CTy5TxRWfpPYj6rBRihkuU
         e1/e2/Ree3VR2imcLzgtMsLi+jhFINsRZyeyD5umt0NqdiTZ+IP3Gzn2mQ8LcSxnsat/
         H/16ubo3nyhoXyjkACuceIIHLKWnSsbjk1yzBb+oSdqaErO/eUuz6CMG4+GM8gnHYe8Y
         Etg6SACU9brsYvnXShmdcEzc3wL5Wl9xn1eZarWbE+qrrxiJA38mLvlE8SdeRDitcz53
         EMjw==
X-Gm-Message-State: AOJu0YwVbXOHTPsjHikbOdhbLEn3+50dlSuF75EMdk6EXTTSk3FhN4/b
	sPBxWSErPqPN8r/jqnwbSIrs8w==
X-Google-Smtp-Source: AGHT+IE7gaemQ0BY6h5pdkvNhQeAh7zYLVH9bvn/7wav3gWlFmtSNAj8mLTOmIAfaglZBPKgOuEopA==
X-Received: by 2002:a05:6870:ce8e:b0:1e9:ce72:35e0 with SMTP id xe14-20020a056870ce8e00b001e9ce7235e0mr518446oab.0.1700255778884;
        Fri, 17 Nov 2023 13:16:18 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6871:740a:b0:1f4:88df:8b64 with SMTP id
 nw10-20020a056871740a00b001f488df8b64ls2120579oac.1.-pod-prod-09-us; Fri, 17
 Nov 2023 13:16:18 -0800 (PST)
X-Received: by 2002:a05:6358:4407:b0:16d:abc7:bfab with SMTP id z7-20020a056358440700b0016dabc7bfabmr627380rwc.15.1700255778159;
        Fri, 17 Nov 2023 13:16:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255778; cv=none;
        d=google.com; s=arc-20160816;
        b=kB1I8WKaObUk9ZqZCkM7Gg09unkWumnXUf44NO5c++Qe9j24haJYgzJ7Alco3bDoN0
         UXhqH5E+89kSv+cGYDodVtSA9nWDRj06vMK5zutri1hPVk2EDv4/QsYAwJiHNmXlcvmA
         slhOZtE0Q4MSaOhgfCbs2VynkPLmVVarYE5u5zsHex7WYIw9bfR/0HTCrTUj1cqVgm3o
         /mnjDGnJIq35+NwtuW18JPFiIusFiBgjLbbKDXu1M0lb7zGiBT5L9gmQOcczD/vilNrs
         R62tNVjSMRGCtqoUrS+EShG/6wRCMFKmHB6u41/I3azG6b4V4Dh7ScLC22fAA8Me/oAm
         wU3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=GmsQwEX2uB9xEmzG477By7AeVK+QOhZz+3Yr2KCPFgw=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=fIIeCo543dMZqmxG1O2eD3D5vpWedwmMJc/KtrCQlo6I13gbAyoCb9JKLR5JWnUMm6
         joQrDAJ4OrzB7UlbzahOxVqduufCCYb8S62hrqibVtMQluL4IU54iS/4NJKDj8QXrcbJ
         HiB7kMQ3scciKQDlCU5Cfv0B1xMe8kUoD5dd6NtG3Y6/9vkoegeYxC7u1fbQA1DfrCJ+
         /IUf+L4p3a1tWeSelncBFEkrT991nbnTNfAvCc9TYZqPGEx7S+436oBBYhcbZoZ7YAah
         tbgzpll9sO3xdv9+HQoFaiTh1Z1Vz+v+a5zrhLQ3xEp1cjCSt+Y6EJdjrdzYRjmd3Xdy
         1NMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id f16-20020a05620a409000b00773b364bd64si2465140qko.391.2023.11.17.13.16.18
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:16:18 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-437-T46V3umNOyeL18h0VHRWfA-1; Fri,
 17 Nov 2023 16:16:16 -0500
X-MC-Unique: T46V3umNOyeL18h0VHRWfA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 549AF28040B9
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:16:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 512182026D68; Fri, 17 Nov 2023 21:16:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B04812026D4C;
	Fri, 17 Nov 2023 21:16:13 +0000 (UTC)
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
Subject: [PATCH v2 08/51] netfs: Add iov_iters to (sub)requests to describe various buffers
Date: Fri, 17 Nov 2023 21:15:00 +0000
Message-ID: <20231117211544.1740466-9-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
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
index 3fea5cd8ef13..a7658fb2d7dc 100644
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
index 18e3d8b53646..48868b3e4d51 100644
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
 	atomic_t		nr_outstanding;	/* Number of ops in progress */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

