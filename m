Return-Path: <linux-cachefs+bncBDLIXLMFVAERBYMZ46VQMGQEQ7Y5YPI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F415811654
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:25:22 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-67ee1ca3b05sf33751116d6.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:25:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481121; cv=pass;
        d=google.com; s=arc-20160816;
        b=S3gqhA1sPCSRLAIvml3Niu+bAPEJZ+YpT6ELeow8SyIPbfqlBasxNve3eWYCXxxS3e
         zFOdINmO5WTrQHIqQk0Uw+XB20wxc/Yd9ZnCsORoFFG+1+B3sjJidLwW2FBTjKvineIF
         iGNMOh5uRup8dhA33VFa6CnIec4GNiwnUtzqrFEMH+i0scCBdYgTADjXdXocF8peOjdZ
         ZPNojJkiBKDfcHnlbyxnDoKJ/5WhJQj+dJ5CwxdevFzsCDLmsAXFWHbTql0o91u4dE0q
         IBHDyFrmbFRH0uQK2tdLAWMiaJr/PsX+9tjDOF3ihL59UCDRuWp44hTDGO+4wNvRxCmY
         BwMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=90GKF6rME7KCBa92gC934EhEJQgjXSV+/HinDCwezuE=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=mkcdgErczk95AYNu3gfCzLUac6blosd0VBKQjElvGenLEOO0EPMAgEWULmPjqWGgML
         MmnZP7hRUreIQLuQeDHh3fkpx0PgURWoxLbTfEYgVxxgrm2cGCKT3uBdE1+7XgWLGtNH
         zG3kQfJuhQ9cqTD13CnA82eShHH+/R8stBMmXbOVFUVRR0UJoChHbfKxSt9b10Lm9dCZ
         4cd7Dl2W+t/ZR2EWp651vQbZ9M2FzY+ybvWOtqYg4X8TnEI/LYChrS8mHiy3HN3K4GZx
         T6RTGrr5ny/at/6v+zDbKPMsRXTRDr3vO/4u9qsIQOClAemwlP4saPVE8/Wq4a/EEZl4
         njlw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481121; x=1703085921;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90GKF6rME7KCBa92gC934EhEJQgjXSV+/HinDCwezuE=;
        b=RXxwIwwGcIaR8u/40yDkJlFXTvU1X714tDgJa5qHnWp7GvjnPWdCJRHg0Z3Qt+9nZ6
         SSbqqCFIV32ReX5EUXTz0AwLs4rFp0fBXrSeTIlpfb4BzPYkTFHXUA3Mr23xCr3Fc1go
         4JDwBQ4lfweCGkO3LZkextipfH1U0nqMhI9aekNkbeIN5IulTq9ff9tMICY/PVspts00
         nV5Yq6Do1UydZNykoIeyD0DOSBvP84Hr1w1mEXOX2DL47mpLxOF38VjJl6mA4ZrBmi58
         G0RQrdQk/ouwax/ZwqJHOTeAi+tXWZjdE1B+Zh8T8Yn5Nx3JJDBmIHWQPUlyU3tGyNVq
         mWgg==
X-Gm-Message-State: AOJu0YxHm8ntG+OcClEnx8aykm5vqeXhT91lQtx9smYSzRODoavB5U43
	rgXToPO8iL4Zj+/Fbh0E7yDaPg==
X-Google-Smtp-Source: AGHT+IEBmDwVhLLmSq60qOB6dwj2m3hEVKCeLHLqILPCQWyJQGBEWLF12v1wRL6rQF1g0x6MGNa1Mg==
X-Received: by 2002:a0c:f691:0:b0:67a:ceb3:64c6 with SMTP id p17-20020a0cf691000000b0067aceb364c6mr7881994qvn.36.1702481121290;
        Wed, 13 Dec 2023 07:25:21 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:bec6:0:b0:67a:218c:efcc with SMTP id f6-20020a0cbec6000000b0067a218cefccls1871692qvj.1.-pod-prod-02-us;
 Wed, 13 Dec 2023 07:25:20 -0800 (PST)
X-Received: by 2002:a05:6102:370b:b0:464:3f43:9077 with SMTP id s11-20020a056102370b00b004643f439077mr6985308vst.25.1702481120597;
        Wed, 13 Dec 2023 07:25:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481120; cv=none;
        d=google.com; s=arc-20160816;
        b=oRkci7xN8gN0ZR86VOcqPdJJ9uzlGK9JltS418mqoBXFyn/ni8wBgY0YffQSQ6qfho
         J6Nq7FJzu3ziKKPqKNPFPPXS3f8cgHdkGV/soXnz1qO4VMKL9TLyTHDSHHfn2IrHOBSg
         aDBuB95UwXlmoHfbHp3czhn88iCg4t3tdr3yf/ICC9r9TvnsYblx6s/CRH8dNnEghFsd
         6nhRBJPANeOj6Qs4bvfC4TX91R+45DcOfXnhSG8oAgT1Bi3h5+8YMwpdS1v2rUh2t8TR
         4GLzPogcT7UyaanD72FkWTTznQyGacybisH/CbZc6HhtgjFhtWPxFl8dVTxmbZIEjCHF
         wy1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=FiYKm77Ht/I6AsAMlaNFj+jCmOgPY/9fZvw3wuH/0+8=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=dWfD2EpKsiMx/O3TukNN6DlVdv+u9+CN61rXOs9++WNqe0RSkjKQ6T+AzSdq7q3xpV
         Bcnj5Xa+X3jloPJreQXWwPT9cbLX2fU0BqXzvoT9aDKKqdMkNsh5Hs51Z7ExHFnIVRuR
         rlyz3np5wRdKgnZeUyvztsfcF8qNh+Y1OWvfEwj48kMIwfR9VeupZTI+H/puf/+oZcV9
         HDThsnhQXllX3sncpUJeSw3h8/TOQlDDaK8gl/+TkwiPHthBIOYrAeEsWF7zfqiG0BU5
         5UxcfvgFhBg6Y9vqLhCnDkaz7dYTDtp7QBMJkcoVK/uNdYDO+fsMUpWBHFrnQg9jJmSu
         VKfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id y4-20020a67cf04000000b0046489b9114fsi2361424vsl.386.2023.12.13.07.25.20
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:25:20 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-4UzcA13gOm2k-FC8S2L28A-1; Wed, 13 Dec 2023 10:25:16 -0500
X-MC-Unique: 4UzcA13gOm2k-FC8S2L28A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 516BB86E926
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:25:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 4E85B5190; Wed, 13 Dec 2023 15:25:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 978F551E3;
	Wed, 13 Dec 2023 15:25:12 +0000 (UTC)
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
Subject: [PATCH v4 19/39] netfs: Extend the netfs_io_*request structs to handle writes
Date: Wed, 13 Dec 2023 15:23:29 +0000
Message-ID: <20231213152350.431591-20-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Modify the netfs_io_request struct to act as a point around which writes
can be coordinated.  It represents and pins a range of pages that need
writing and a list of regions of dirty data in that range of pages.

If RMW is required, the original data can be downloaded into the bounce
buffer, decrypted if necessary, the modifications made, then the modified
data can be reencrypted/recompressed and sent back to the server.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/internal.h          |  6 ++++++
 fs/netfs/main.c              |  3 ++-
 fs/netfs/objects.c           |  6 ++++++
 fs/netfs/stats.c             | 16 +++++++++++++---
 include/linux/netfs.h        | 15 ++++++++++++++-
 include/trace/events/netfs.h |  8 ++++++--
 6 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 20eb1fd6986e..8d1bfc9c3e2f 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -110,6 +110,12 @@ extern atomic_t netfs_n_rh_write_begin;
 extern atomic_t netfs_n_rh_write_done;
 extern atomic_t netfs_n_rh_write_failed;
 extern atomic_t netfs_n_rh_write_zskip;
+extern atomic_t netfs_n_wh_upload;
+extern atomic_t netfs_n_wh_upload_done;
+extern atomic_t netfs_n_wh_upload_failed;
+extern atomic_t netfs_n_wh_write;
+extern atomic_t netfs_n_wh_write_done;
+extern atomic_t netfs_n_wh_write_failed;
 
 int netfs_stats_show(struct seq_file *m, void *v);
 
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 404e68e339bf..6584eafda944 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -28,10 +28,11 @@ MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
 LIST_HEAD(netfs_io_requests);
 DEFINE_SPINLOCK(netfs_proc_lock);
 
-static const char *netfs_origins[] = {
+static const char *netfs_origins[nr__netfs_io_origin] = {
 	[NETFS_READAHEAD]	= "RA",
 	[NETFS_READPAGE]	= "RP",
 	[NETFS_READ_FOR_WRITE]	= "RW",
+	[NETFS_WRITEBACK]	= "WB",
 };
 
 /*
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index a7947e82374a..7ef804e8915c 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -20,6 +20,7 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	struct inode *inode = file ? file_inode(file) : mapping->host;
 	struct netfs_inode *ctx = netfs_inode(inode);
 	struct netfs_io_request *rreq;
+	bool cached = netfs_is_cache_enabled(ctx);
 	int ret;
 
 	rreq = kzalloc(ctx->ops->io_request_size ?: sizeof(struct netfs_io_request),
@@ -38,7 +39,10 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	xa_init(&rreq->bounce);
 	INIT_LIST_HEAD(&rreq->subrequests);
 	refcount_set(&rreq->ref, 1);
+
 	__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
+	if (cached)
+		__set_bit(NETFS_RREQ_WRITE_TO_CACHE, &rreq->flags);
 	if (rreq->netfs_ops->init_request) {
 		ret = rreq->netfs_ops->init_request(rreq, file);
 		if (ret < 0) {
@@ -48,6 +52,7 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 		}
 	}
 
+	trace_netfs_rreq_ref(rreq->debug_id, 1, netfs_rreq_trace_new);
 	netfs_proc_add_rreq(rreq);
 	netfs_stat(&netfs_n_rh_rreq);
 	return rreq;
@@ -132,6 +137,7 @@ struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq
 			 sizeof(struct netfs_io_subrequest),
 			 GFP_KERNEL);
 	if (subreq) {
+		INIT_WORK(&subreq->work, NULL);
 		INIT_LIST_HEAD(&subreq->rreq_link);
 		refcount_set(&subreq->ref, 2);
 		subreq->rreq = rreq;
diff --git a/fs/netfs/stats.c b/fs/netfs/stats.c
index 6025dc485f7e..c1f85cd595a4 100644
--- a/fs/netfs/stats.c
+++ b/fs/netfs/stats.c
@@ -27,6 +27,12 @@ atomic_t netfs_n_rh_write_begin;
 atomic_t netfs_n_rh_write_done;
 atomic_t netfs_n_rh_write_failed;
 atomic_t netfs_n_rh_write_zskip;
+atomic_t netfs_n_wh_upload;
+atomic_t netfs_n_wh_upload_done;
+atomic_t netfs_n_wh_upload_failed;
+atomic_t netfs_n_wh_write;
+atomic_t netfs_n_wh_write_done;
+atomic_t netfs_n_wh_write_failed;
 
 int netfs_stats_show(struct seq_file *m, void *v)
 {
@@ -50,10 +56,14 @@ int netfs_stats_show(struct seq_file *m, void *v)
 		   atomic_read(&netfs_n_rh_read),
 		   atomic_read(&netfs_n_rh_read_done),
 		   atomic_read(&netfs_n_rh_read_failed));
+	seq_printf(m, "Netfs  : UL=%u us=%u uf=%u\n",
+		   atomic_read(&netfs_n_wh_upload),
+		   atomic_read(&netfs_n_wh_upload_done),
+		   atomic_read(&netfs_n_wh_upload_failed));
 	seq_printf(m, "Netfs  : WR=%u ws=%u wf=%u\n",
-		   atomic_read(&netfs_n_rh_write),
-		   atomic_read(&netfs_n_rh_write_done),
-		   atomic_read(&netfs_n_rh_write_failed));
+		   atomic_read(&netfs_n_wh_write),
+		   atomic_read(&netfs_n_wh_write_done),
+		   atomic_read(&netfs_n_wh_write_failed));
 	return fscache_stats_show(m);
 }
 EXPORT_SYMBOL(netfs_stats_show);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 406d5a3a3298..fce7a5a86e8e 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -118,6 +118,9 @@ enum netfs_io_source {
 	NETFS_DOWNLOAD_FROM_SERVER,
 	NETFS_READ_FROM_CACHE,
 	NETFS_INVALID_READ,
+	NETFS_UPLOAD_TO_SERVER,
+	NETFS_WRITE_TO_CACHE,
+	NETFS_INVALID_WRITE,
 } __mode(byte);
 
 typedef void (*netfs_io_terminated_t)(void *priv, ssize_t transferred_or_error,
@@ -149,9 +152,14 @@ struct netfs_cache_resources {
 };
 
 /*
- * Descriptor for a single component subrequest.
+ * Descriptor for a single component subrequest.  Each operation represents an
+ * individual read/write from/to a server, a cache, a journal, etc..
+ *
+ * The buffer iterator is persistent for the life of the subrequest struct and
+ * the pages it points to can be relied on to exist for the duration.
  */
 struct netfs_io_subrequest {
+	struct work_struct	work;
 	struct netfs_io_request *rreq;		/* Supervising I/O request */
 	struct list_head	rreq_link;	/* Link in rreq->subrequests */
 	struct iov_iter		io_iter;	/* Iterator for this subrequest */
@@ -176,6 +184,8 @@ enum netfs_io_origin {
 	NETFS_READAHEAD,		/* This read was triggered by readahead */
 	NETFS_READPAGE,			/* This read is a synchronous read */
 	NETFS_READ_FOR_WRITE,		/* This read is to prepare a write */
+	NETFS_WRITEBACK,		/* This write was triggered by writepages */
+	nr__netfs_io_origin
 } __mode(byte);
 
 /*
@@ -200,6 +210,7 @@ struct netfs_io_request {
 	__counted_by(direct_bv_count);
 	unsigned int		direct_bv_count; /* Number of elements in direct_bv[] */
 	unsigned int		debug_id;
+	unsigned int		subreq_counter;	/* Next subreq->debug_index */
 	atomic_t		nr_outstanding;	/* Number of ops in progress */
 	atomic_t		nr_copy_ops;	/* Number of copy-to-cache ops in progress */
 	size_t			submitted;	/* Amount submitted for I/O so far */
@@ -219,6 +230,8 @@ struct netfs_io_request {
 #define NETFS_RREQ_FAILED		4	/* The request failed */
 #define NETFS_RREQ_IN_PROGRESS		5	/* Unlocked when the request completes */
 #define NETFS_RREQ_USE_BOUNCE_BUFFER	6	/* Use bounce buffer */
+#define NETFS_RREQ_WRITE_TO_CACHE	7	/* Need to write to the cache */
+#define NETFS_RREQ_UPLOAD_TO_SERVER	8	/* Need to write to the server */
 	const struct netfs_request_ops *netfs_ops;
 };
 
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index fce6d0bc78e5..4ea4e34d279f 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -24,7 +24,8 @@
 #define netfs_rreq_origins					\
 	EM(NETFS_READAHEAD,			"RA")		\
 	EM(NETFS_READPAGE,			"RP")		\
-	E_(NETFS_READ_FOR_WRITE,		"RW")
+	EM(NETFS_READ_FOR_WRITE,		"RW")		\
+	E_(NETFS_WRITEBACK,			"WB")
 
 #define netfs_rreq_traces					\
 	EM(netfs_rreq_trace_assess,		"ASSESS ")	\
@@ -39,7 +40,10 @@
 	EM(NETFS_FILL_WITH_ZEROES,		"ZERO")		\
 	EM(NETFS_DOWNLOAD_FROM_SERVER,		"DOWN")		\
 	EM(NETFS_READ_FROM_CACHE,		"READ")		\
-	E_(NETFS_INVALID_READ,			"INVL")		\
+	EM(NETFS_INVALID_READ,			"INVL")		\
+	EM(NETFS_UPLOAD_TO_SERVER,		"UPLD")		\
+	EM(NETFS_WRITE_TO_CACHE,		"WRIT")		\
+	E_(NETFS_INVALID_WRITE,			"INVL")
 
 #define netfs_sreq_traces					\
 	EM(netfs_sreq_trace_download_instead,	"RDOWN")	\

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

