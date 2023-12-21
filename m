Return-Path: <linux-cachefs+bncBDLIXLMFVAERBLXZSCWAMGQECDNWLJI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE9481B75E
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:25:03 +0100 (CET)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-59070f0f0b5sf758291eaf.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:25:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165102; cv=pass;
        d=google.com; s=arc-20160816;
        b=qSzlBRJf6kwf9Z+KM17SQkRAFAnbHyMLr4RB3W9yq8K6SfIPAWS3dvdWgYVpcLtf1I
         HYB3AMvKh+TwhPe5Zi8lwv9PY6vS4MU4FUTintHMpPuijYQ99A5EvNYIbEUn8xyJIKm+
         HUVRFiLJ/SckPCh90WEAubxV4J/gv6dsUib2T8i1iMBxQfm53xRlQCQWlejY1cWjDmDR
         +XPyL3K8THh9f/vGw5ulmVOhtwKOSsF5k/UXCN0KMznrX00oRdIKd8RqBkUudn6ePKXX
         xTDVxwwqN50bYUMJwj6Z3m2snx0mCiCatdgrFNn1EpBOrvg9XpNKx+ILzJO+99m8p9C5
         /ihw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=1t/qJjzAnlaeFyaoI22R1v4sE8zYqwxiqP1mQhEoJVM=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=NmA1nTA5abGs29Xf9o1pdLAauQUNnKVpUgqiMRKeCeZTctY3SRk18NqfD6/WoVfMVL
         QM/EB4Yw9AfcwIhfmjCSv8p9bSPIVdnD8MHrKrpbpVGobyDCN3+emkts2Xtcc2JFMmJH
         vJPZkY4uQ6NvD+amk3kELk2dyHO9YgmSn6Dwks/sQNVCSZiBNUZiR0iFKZn90e+QEf2U
         uLfTnb3Aqo0GlUwBCpJV1lya2z9nZHLPEMzO7Jeb7RReA9KbpWzw+EHw+vxDFITC8DdU
         3AFbyJrK2E2tIYYbLfz5NA4HoNu9eP1zYqvEMV6Fr9hRGGHY7Y7IPgdiJTHa9asEfiDH
         IDzQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165102; x=1703769902;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1t/qJjzAnlaeFyaoI22R1v4sE8zYqwxiqP1mQhEoJVM=;
        b=bXk41gLy0iAllKsKUaBeWWJL6uLqdxBADSi4A+g+UyDhX/Bs0jhgSq+O08iBgCe/8y
         xmPI9e7PyrAvSjJB3nZfSSFMT9oeQIL6es4SvYq/z3dwjzO4af47yDdlp/jY9hovvd2o
         0Eli+CHCuUQ8+8pWwRnQYYTbkp8DZmoZEIoEGS1h3j63BomuvfpQUv+vvIbIA+CIUrz3
         JQCoQKfSAtjoj+QNBIRdeoWQT/opSOYCoMSa3wrxYONOPBWA2OgnaFaehYHnPQGqmPWk
         mLxHaxYisuYG+nzBvgV6wxEq0jih7Rrb3Rk609OAgmKW8qM5ZQisGraDdelD9MXeqyA5
         746A==
X-Gm-Message-State: AOJu0YzCsFpGrxU1icFZNT70lRSL8IGTZwJC18Ji24yPddFnxs3J35r5
	7QfPMf+wQ8MlsFQKj2C3mwxcVw==
X-Google-Smtp-Source: AGHT+IGM3E4SmyJW+TLloAfg25FGWr1yGWFutDfhIfKbkWlkM0cEqvHa/TyORkLNv2aGgES6ZwqMiw==
X-Received: by 2002:a05:6820:1ac9:b0:590:87c5:2b0c with SMTP id bu9-20020a0568201ac900b0059087c52b0cmr14009000oob.7.1703165102142;
        Thu, 21 Dec 2023 05:25:02 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a4a:e882:0:b0:594:2b68:3014 with SMTP id g2-20020a4ae882000000b005942b683014ls377469ooe.0.-pod-prod-02-us;
 Thu, 21 Dec 2023 05:25:01 -0800 (PST)
X-Received: by 2002:a05:6808:f91:b0:3b9:e8d0:6df0 with SMTP id o17-20020a0568080f9100b003b9e8d06df0mr22939029oiw.24.1703165101578;
        Thu, 21 Dec 2023 05:25:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165101; cv=none;
        d=google.com; s=arc-20160816;
        b=XmYyVG7FfuUPGpX0/xIbaYYRns8kQQN2ms2KIyXk1ZXV2plt/3hIq5/LpPrG3yvXPi
         FZeDgNnlf1U4EsyYh9/hC6g2bCs9qAss6FU0B04FldS++0LMRIynsyWTwzshTMa7N/Qe
         9Po6Mkl5pAbwFQM89oZmCY9I4HCfZ2stBxZBifl2DkuIIfbGLalbCcxbR49rM/sDQtJy
         p1k51+BLJpT5QltDJwvToS2kn7cVX4l9rR1mzXUrLF5YKqJi0+ywXDyhHLLUGOr+G9Dz
         EjDKdqvdNvY0g40RVYoLD7ofi3A2TOw2hF7RRwq5/QK4fk9WnISDWgcfkNztkKSk8Fyb
         tDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=f516Si/fckbvlv9DQ38US/PGlNPcuj5wq6s+1CkC86A=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=xey29UMmY3x/1t84Im2467THSKNVr6iQ6geeWzjOjjyfEpI+WMRGvaw69dSejR4slQ
         wN+mSS34vEqx5E4BCihg7KPtEVHdiHip9oQHBijGRuTjyyTj0Jc5RmzVatgk7ikOvDH8
         ATbNWBnB1/OcVb1HgQzOEoUWl8xL1H06HJNwV5mo8Au+XUn8Axx8euKOoLap50K6IarJ
         EoJCprA1BoxRBaDdxCsn49cFIEENKXoXIWCS0G4PseSFwMJtBK4HZX6ETBZKULwPpnws
         fr4Bdk0BzsnSZCi2/jiabfR2CS6ZDe36ncQ8fyG6GYPOte072ak05j96NY/BYTEEPlRH
         QvHg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id g14-20020a0caace000000b0067f7820cfebsi1991901qvb.390.2023.12.21.05.25.01
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:25:01 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-E_tp5mngNquLkZ9Vt-Iy2g-1; Thu, 21 Dec 2023 08:24:59 -0500
X-MC-Unique: E_tp5mngNquLkZ9Vt-Iy2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3618E868A01
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:24:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 331DF51E3; Thu, 21 Dec 2023 13:24:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4288951D5;
	Thu, 21 Dec 2023 13:24:56 +0000 (UTC)
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
Subject: [PATCH v5 14/40] netfs: Add iov_iters to (sub)requests to describe various buffers
Date: Thu, 21 Dec 2023 13:23:09 +0000
Message-ID: <20231221132400.1601991-15-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
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
index d152ba451f0e..3403bb792deb 100644
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

