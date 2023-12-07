Return-Path: <linux-cachefs+bncBDLIXLMFVAERBLXPZCVQMGQELDYJCVI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE1A80934F
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:22:55 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-67ad79b7243sf15060036d6.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:22:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984174; cv=pass;
        d=google.com; s=arc-20160816;
        b=fX+tlcaadTstHK8MdNDMk7JzjnHbVydrgrtx/q9WHcupme1QvNAq/rE1P9JG43SuX3
         huHvY3xNaOMZHZue/mlp8dCvvewax6KlTuJLPiFt6WslgMc7n3eqrTNVC/csZhRidLIk
         QmU029hF9sQnjjdELVaKwL3hjkj3a9stHcUk4ScUYcsAc322auDP2s5V2AML8vHiXElP
         qQMkk00GiPkxx+coZzAVb82Qy1jGdjIK9FZ5liEVy3N6idTQORlnKVJLkXqfJ1ev2r/K
         E+EGZr2vovnNfJI9t3aYq5GYeTC72BVImCULMWGUFkq3Xmqhmh34Ep/fPpcTxjb00ARc
         Nejg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=1t/qJjzAnlaeFyaoI22R1v4sE8zYqwxiqP1mQhEoJVM=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=olQcSLbpeM4GAEcRHrqhX7k8jEVaLtAPW1rquoACeeEkek2aLyy7wKjFfE4CcHT7RM
         ZImEUtf24Z+9l/RkDfOF4PMuLCH0cGBrR2YhCgBUaqs2MIS6/OjtyAGSwhB7z8+7F70q
         AHrW0txRDv73Uauk1ZGolehMUU3Ph5+ir2XYRFj+zgBfcuU9HPO1Ybh42RL0vssJ1cEA
         HuvbtQxJjuf+IC5vtjhkG6CU6JGg8yZCrJ1FWzWqFvoTET/XuI9gEFjHtAp4CcSDQ5vf
         s2G/Z7mFbwxDHt/lUA8BLxe2VlUWgffseAX8BV63NInD9iBmBX8lHNdwT1SAX4Ecpe7h
         42nA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984174; x=1702588974;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1t/qJjzAnlaeFyaoI22R1v4sE8zYqwxiqP1mQhEoJVM=;
        b=NhTZRotsyUvwcNWwNJsYoDJD/i9fSaAA7D/a704kenCO7F9oKOhDqpVutxzGUVJEtD
         N2poOG8FeLUYnZLO9xzws9vfljcWTqfvFVeNAakD53QqMfFqjhpglkcyJNQc3L+lmrcu
         Q1BwKOQ2CfgIOpx4l9g2J5KeLG9PHpkOmJryQ0i+loT02FqLROTv4vTSZSwu2NtnBJHB
         u+otERLyXCUYkVi53YGYZe3ptC/OBmwB6ciXCbK4+6NE/VzFH+Rb9ba/bUOLkSevArVm
         RwRaupawIbhywogwaGfFOkRMSjBZ8pqinrc6jhL5LQ5FxLDc304fFbFTXI0+UJ3JEzwU
         Kadg==
X-Gm-Message-State: AOJu0Yy1RO8aHqFPaff/Z+zoh+f8yPazTjlo65GnB5dUVxShltZLFOTS
	8nlNOhNO45xpKGRhwo6IjR2sEw==
X-Google-Smtp-Source: AGHT+IFjJyPTtJBRRvZHuKEku7TPZgSU2JroqNVvxwsg9YaU4V8gRxuBnb2xO/yz0pHCgn5uIcj0yA==
X-Received: by 2002:a05:6214:80a:b0:67a:a721:caf7 with SMTP id df10-20020a056214080a00b0067aa721caf7mr3699136qvb.88.1701984174485;
        Thu, 07 Dec 2023 13:22:54 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:4f10:0:b0:67a:4cc:6765 with SMTP id fb16-20020ad44f10000000b0067a04cc6765ls1186703qvb.2.-pod-prod-05-us;
 Thu, 07 Dec 2023 13:22:54 -0800 (PST)
X-Received: by 2002:a0c:fb42:0:b0:67a:a0f5:827f with SMTP id b2-20020a0cfb42000000b0067aa0f5827fmr3600808qvq.30.1701984173937;
        Thu, 07 Dec 2023 13:22:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984173; cv=none;
        d=google.com; s=arc-20160816;
        b=vntqQfobrumlQQTgZknfedq248o+0I6ulCwrLOxrtBp18jGLEiibXp7U4grZzL1ld7
         sfSXSECIzipM3aTO+kpHN4YMunCKkM03gPfNi518Re/Xv0FYZL43LpeQKdp6345rwmqs
         kbAACEWNB4niAtcRc+VLxSVvxdZOGkvT4x457ggtzFJrFSz58KzZGwoZcHjfoyHLXqWy
         kexni6pB7fYeKMtk4eM93NDxtGBIrcI3PTXLvYYFPyfpz5Bwdi5KPeopCe6WbTFU1xTS
         Joyn6PUDD5PLZ+QOF9MT2y78qK/SDnrIm9zZ3IhqihZ2pFFxofiqbb+Uv1+D/toLfjG+
         fXsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=f516Si/fckbvlv9DQ38US/PGlNPcuj5wq6s+1CkC86A=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=wzPEgqiUARnbQ+REaaLItv8sY2D5hb+sUpOjNH+GLQ2wf8BpyFtnfRU2KSXEPZLUsW
         pvdUJQ8W+apatUcBCyMYIDAkc8GCdZRziomb2xJT+ftK5STsMBkvlzADxNz/zHyUJaBO
         moQaPLp0rpPunwcI0fhk5sO7itg7ebvkMCemZFXrnBEILX/VgwM25Ib6lsaZjO6Ea/5K
         pixBEAj8MU411PlVh9bYtCW2Woy5fA/UbkwgqxLpdzXeMXMiF5xgtQ5dp/2GwxAxmSCO
         M0+veEHpxamOu/0vmS+M+g8z2qA4Bcq4Oc0CAZWnJhXSwjPwIU7uVsYqkzAVxA192qVZ
         lXMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id pr10-20020a056214140a00b0067a9b65fe58si609743qvb.138.2023.12.07.13.22.53
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:22:53 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-RMDIbca6M2aImHI2rHdtww-1; Thu, 07 Dec 2023 16:22:52 -0500
X-MC-Unique: RMDIbca6M2aImHI2rHdtww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FFFB845DC7
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:22:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 0CDD11C0652C; Thu,  7 Dec 2023 21:22:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 508641C060BC;
	Thu,  7 Dec 2023 21:22:49 +0000 (UTC)
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
Subject: [PATCH v3 12/59] netfs: Add iov_iters to (sub)requests to describe various buffers
Date: Thu,  7 Dec 2023 21:21:19 +0000
Message-ID: <20231207212206.1379128-13-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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

