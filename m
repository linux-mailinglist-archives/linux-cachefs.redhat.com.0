Return-Path: <linux-cachefs+bncBDLIXLMFVAERBSPPZCVQMGQE3XEXNGY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com [209.85.219.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2E9809360
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:23:22 +0100 (CET)
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-db547281f5dsf1706723276.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:23:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984201; cv=pass;
        d=google.com; s=arc-20160816;
        b=w74QvmNhBIi/u5DOo7DwAPyRUOFKnn8P5oWXunQrevdvbuJ73HTd5VeGyr8/Eshcfx
         hx7AzqyTFtFZKtTG21xzS6BDUbGmZYZNRcQW0UQGOdKe61QIVHnYQrg/uXeIh32eZIdo
         +Tjy8kEclzQ062Y6t87TPjfGmbAO7IvgqSkSrLWv/p9jOuVlZp0IwdQzzkT9QTXFP/Fb
         IiYchsPbXoMWMQJIkfI1AJH6wQgV69U8xTCyEgbHLt/Ue2CUBi48tXBToxXcVCbrad9Z
         42SjmH1Fz+sFaFZoFLJX22M0tiZKMHzIiE0PpZHuT/+r5gXvmg97ThAUyetaR9hNZ0lh
         femQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=9sRYznUgnjxsLoYAtZeFiBnzLQ/cd/XvxKadfkMDKI8=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=IPDJW/DalLjcAi8sYUyC6hRBZhY9U5coPorFohG/k1eY2vUkRklWiRtdRtY/tIEy9P
         N/D8I+nZtTw0VzpZs5htTS+F/IyVI+9bLIz4vGNblE6JsKXXFIzTMPj72QySxZN3RXBD
         mE7o19OM6fA+NHvTlJMkrmkPQSiQ3eHUD3rPdYvczuTq6D8/wb4WrNvAiTdAa1B7db0U
         M+zumwLo2YHGhB0Ao+CWnDloCc9o0TmTC0oxczTciMJuGG3F3ewjT7sB66Q86CJa9s14
         ItHADWZ+r3VtjJ9sSEk0tkNcA1LXDKEBioCRilfAf/7gkGqtADjU6Lfp2iXjLkj+EtjM
         Gpsg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984201; x=1702589001;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sRYznUgnjxsLoYAtZeFiBnzLQ/cd/XvxKadfkMDKI8=;
        b=aSeFj/67QPWDZi/3i2I+HRUF9CuV3FmHs6iahDLoTpj0/qUtHucHqFsSUoDc9ibk/6
         ffspEN1iVAsmgGQWTXiLqc1mVyw6YNJSQPBR7wwQGPi/TA2H6z32ryXr9Niyyf1e/knv
         LVML0ikVBOrGT+NZCUefn/r1uT19ogxdr5liwwxVVgeaDtedhvhqgN8GzgyIeFF7ypHr
         m0JFV206fl9pO0CLjNXfhHgsGOKD0PEFvqJysLW8kbnLF9AshOPZAsKe82XV7Er9ZYtw
         U2kaS4GcGjwdL919JeBxN8Ygp7netqsQF+LWPykO2D1E3eftqrSQkhxmFCYjZRPdWp32
         6yew==
X-Gm-Message-State: AOJu0YzvoejodL0qaEp2puU+f6w5+fmMSXbjMkYWSO0GVGwIllL6u/Jg
	2B3fhIVdIeerzxd/h3SXDtL6HA==
X-Google-Smtp-Source: AGHT+IE3QCxuQ7qWPoB2fFpfcac8fOjlN3CHFwJGU2oDntJ/rNThwE/Qncr8TaMXkrcP00KN9Ey39A==
X-Received: by 2002:a25:9c44:0:b0:db7:dacf:2f22 with SMTP id x4-20020a259c44000000b00db7dacf2f22mr2938893ybo.105.1701984201264;
        Thu, 07 Dec 2023 13:23:21 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:234b:0:b0:d7b:3e9d:f12b with SMTP id j72-20020a25234b000000b00d7b3e9df12bls828193ybj.1.-pod-prod-01-us;
 Thu, 07 Dec 2023 13:23:20 -0800 (PST)
X-Received: by 2002:a81:9bd5:0:b0:5d7:1940:53c1 with SMTP id s204-20020a819bd5000000b005d7194053c1mr2846415ywg.57.1701984200678;
        Thu, 07 Dec 2023 13:23:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984200; cv=none;
        d=google.com; s=arc-20160816;
        b=V8EabHOs3lzQWNRDjaViBSKKlZJT8TUNHivdJHCvM7N1P+gcmmmBE0Tv9elb7q8VwB
         65BCeioIqaqAH2gtB3CWN3EgEaoi8/fYt9ILQNnMWW3Qm/vxtn7C+MbrmlqHtA/aQuFI
         gy2dA1HzJkwt3bg7F3lFQGO2h25PwAZDCjdvMtGFHJBrNkALbTCtM0opbL0GojwQ0wDz
         X7gYeVo52/JNOs+6fvMITESTiNJaXAXNU9288Gwz1ou7+Xm/4cHP3jyH21txvE7yOBjw
         1OWXfcbTsA4EKORGwcfJd2Rwr7VtM2HFT2QPDyRI61dN67Kv7/gPW+YP0P79wH24TKhT
         546Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=sSgQthXmwxTlFwDY+c8KCOHr89T1Ieig2YSHVcODvNM=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=kowh86en9hpZIrWEZTGuiWmbZ+1NPJZmUrdD2GORmMWIfQrCBK13qAN4fSUQUT4dv2
         5n+QhR6IA0aBDgtC+iPcFjdZ0JiO6RqJIBJpourCJ4vJQytmQAjzyF8rU6Njuy1DjJcy
         XX5qMzS4qABvUy++VMsxhIlSZlmX7GtHqsjLAsiKIzNVNky327n51rPEB4jDZbfJzUwf
         6CzseYCKBhyED3iFu+Z/ScLo4K/pYF5CS+6bSPPEQfRFs//+lMRCX4fQ93mJ8fKrsz9W
         Q/QnkayKo3UTQFSTCUC8TxbnGCDhFYJ7TEiK2crgCsO3/TfHfChoK3kfyr71Ypt5T8my
         Umkg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id k6-20020a81ac06000000b005d8b58534d7si396040ywh.217.2023.12.07.13.23.20
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:23:20 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-137-c1EEBLjSOSOofpLU4RHlew-1; Thu,
 07 Dec 2023 16:23:17 -0500
X-MC-Unique: c1EEBLjSOSOofpLU4RHlew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BDE6382134D
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:23:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 983E83C35; Thu,  7 Dec 2023 21:23:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E616D3C2E;
	Thu,  7 Dec 2023 21:23:14 +0000 (UTC)
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
Subject: [PATCH v3 19/59] netfs: Extend the netfs_io_*request structs to handle writes
Date: Thu,  7 Dec 2023 21:21:26 +0000
Message-ID: <20231207212206.1379128-20-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
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
index 1f25e8622b8a..2f5a83f4b13a 100644
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

