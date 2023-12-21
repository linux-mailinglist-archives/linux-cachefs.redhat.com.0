Return-Path: <linux-cachefs+bncBDLIXLMFVAERBQHZSCWAMGQEMHNY44I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E42A81B766
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:25:21 +0100 (CET)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-42786dd75a3sf10974801cf.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:25:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165120; cv=pass;
        d=google.com; s=arc-20160816;
        b=AKGh8yUVFoeXxC0MT6AmYvapVuSGMBB4R88En95fqqcJZWpCbncq/elr/HL/TtR/IS
         kPDCfNoVBiA6MrUE2hwxaPe/fhQv9zAJyxFv+SXYa2AsORrGqSdvie2SLLti7JqLEiYU
         pQDq2toyr6Gi09JsHdlzMk8GmcdhxaC661z4aaojZK08PZ6aKzW+4mkGpAvXwFAAteu6
         YEHiYgOh7h/Ab3Hvvid3qWqOhb8rRNOJgo9tZXt5voly2JVhxTLZpJYnccdZ1weWUPHk
         mIT8KBeDIl91NI5qj6a08mdlmykoUSj1pDJiY67ty1Fg5Ej+0a2PHaR0loeyYq5vunKV
         jrqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=0IRwMjz0wdbuXbtfv1Dm7OmjPCapy8V3EeG8JcflOM4=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=dSzxLVmbQp5gDwJWUGlHsfOuDjB5r95Mh+PsXH9xbPj2Wnfn6NkVaNvwESZx06gNc4
         Oeni1qHhGOgpx4gfLVG+VwrkDzkU5j2+NdeTso0CnHauDDWVFwqV3LfIsDV5YthjokVG
         K83mYEyixh5UviQIIYWPlvMz3001RNOjScvzqXD7A4uDfNvcmwQLLjl3FXJgC13QAA/j
         bqe/0s9+gzVHMV3y9JJtJXVPaURMEnMhG4FPiQbCBfK2a1WRl5QShZ7RPq8iXgvh5zQ1
         CvEy2JrpfKWoZiMzFI/G8N2B/kmZnEkmB+17nyLEgQIZykbCpBJuDUatHSX+IBRyzm0O
         T7gA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165120; x=1703769920;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IRwMjz0wdbuXbtfv1Dm7OmjPCapy8V3EeG8JcflOM4=;
        b=Uel8M9FLRsCtHa+xxCj09T5GeCj1cBGnrPc0XH3P9qvfqUBkwH93FUZxCl2e0VlsGm
         bGgtWTAmCwSSuwLbFgab+FTQ9Fe2y02hjKFe5GzfJC0U1nVgvyNfNyWBDvLzRNk8R4yi
         yBr2Dg9SvhuaCW7xbVLCBE9qtZcZzC02uD4GTe+g3pib9qU0ZDcA0oidfiQrDSpDJ9iq
         XjCozI7nbJYShVWx6WnYYiJxjWE0JOb/iMuOWBu5H27ZAzPnkBfBKdPD7oDWwRO9wt0x
         grrwhZ3a/6Sf102xStf1vz7X5jCx41Pe0n/xO5/mbeM97KTR9g5uXRnjp3jQ0Hu4Am5Q
         YvBg==
X-Gm-Message-State: AOJu0YwoJpVq9dCTbRJGD+YtJd5AM3PnmX8lNlND6S/Az0AP/Kajaqvw
	UPVjm79HDJLZ9MOu3N3xWm9Bsg==
X-Google-Smtp-Source: AGHT+IGwSMkGRooMv0Cu01b/0oAn+OhjKwE2ymzkdGVvCeulTjJ8M7Tz28R8j3zsK2+FRbQwdQMywQ==
X-Received: by 2002:ac8:7d52:0:b0:425:4043:7650 with SMTP id h18-20020ac87d52000000b0042540437650mr30878429qtb.120.1703165120537;
        Thu, 21 Dec 2023 05:25:20 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:6983:0:b0:427:a0ed:f0bf with SMTP id o3-20020ac86983000000b00427a0edf0bfls460556qtq.0.-pod-prod-07-us;
 Thu, 21 Dec 2023 05:25:20 -0800 (PST)
X-Received: by 2002:a05:622a:41:b0:425:4043:7628 with SMTP id y1-20020a05622a004100b0042540437628mr31437615qtw.80.1703165119958;
        Thu, 21 Dec 2023 05:25:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165119; cv=none;
        d=google.com; s=arc-20160816;
        b=pgrn7MmNKXT8cHgHGkKpGNG71DuQh5CiJfnnS+xbQ86whWLTHL81NTK/E4EmDG1Xxk
         q+HuDSKC1eNf66WzZVxDnGNgwpPxufqrZ12QslGMITn70Pw/EtAXSgaDnaiDQ5m8uAK9
         +YjnSwreytdizhiOdoJ4JBSuEqyTJ+9z0WOVArpKWZryXuCy1VNVUp3vc+a9RwM2yPDn
         PI9B0dTzZAv7kic7CQJ38t+opVE18X+LH3Ms+byiHOxTh13a8Ljm+FS6tokkWiT6dK0h
         XJ/JfwU1Tr7FgXQ3I+RlYIldOZjoj4pmprQLdIJY1l1OGoFYM4rtIxwBGZLDheqmp4XN
         U8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=jvSBfprvkBoOjRik5NifHMGz4KyKCYFH+Iug548VZSw=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=latJpoHRzOL1/gHGmQpUfSuuhwHKr6VbyhvtW22Wl5sdz52pzj8fzE6Ms1HPoO9Ed0
         fNBiAzl1X9esrSjEjVgcmu9wkXQXnfvVbRZ2I1beV3hAUXglUs6khLUhhm6PbwIaJpm9
         p/hgwn8rw+bCXkNOkTwx0Esob38PwQ0eK3k20aEK4HYFuSIXo6CnCC4rmWx9MQWSpJEz
         hzaFqyeegj00CIzNpVRzNAubSEFdm88DqYIJykmZBapu++xhXVcaAL5v5mALM5tHorY2
         cscrYPIMFtlaIlDy6ku+ghrIUhdAvXdCfcwxBdStWqE+BUUAO5u9uGAnd73eUDDMG6rb
         Bljg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id y6-20020a05622a004600b00425e5682bbasi2046022qtw.48.2023.12.21.05.25.19
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:25:19 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-PXsifzGeMB-BdvzAM0-s3g-1; Thu,
 21 Dec 2023 08:25:18 -0500
X-MC-Unique: PXsifzGeMB-BdvzAM0-s3g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0672C3830081
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:25:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 02CDD2166B34; Thu, 21 Dec 2023 13:25:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A9FD2166B31;
	Thu, 21 Dec 2023 13:25:14 +0000 (UTC)
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
Subject: [PATCH v5 19/40] netfs: Extend the netfs_io_*request structs to handle writes
Date: Thu, 21 Dec 2023 13:23:14 +0000
Message-ID: <20231221132400.1601991-20-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
Reviewed-by: Jeff Layton <jlayton@kernel.org>
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
index b908c7e0a901..2bf2e82b2ad7 100644
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
index 97ce1436615b..ab6cac110676 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -25,10 +25,11 @@ MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
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
index 4df5e5eeada6..65a17dd4ab49 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -20,6 +20,7 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	struct inode *inode = file ? file_inode(file) : mapping->host;
 	struct netfs_inode *ctx = netfs_inode(inode);
 	struct netfs_io_request *rreq;
+	bool cached = netfs_is_cache_enabled(ctx);
 	int ret;
 
 	rreq = kzalloc(ctx->ops->io_request_size ?: sizeof(struct netfs_io_request),
@@ -37,7 +38,10 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	rreq->debug_id	= atomic_inc_return(&debug_ids);
 	INIT_LIST_HEAD(&rreq->subrequests);
 	refcount_set(&rreq->ref, 1);
+
 	__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
+	if (cached)
+		__set_bit(NETFS_RREQ_WRITE_TO_CACHE, &rreq->flags);
 	if (rreq->netfs_ops->init_request) {
 		ret = rreq->netfs_ops->init_request(rreq, file);
 		if (ret < 0) {
@@ -46,6 +50,7 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 		}
 	}
 
+	trace_netfs_rreq_ref(rreq->debug_id, 1, netfs_rreq_trace_new);
 	netfs_proc_add_rreq(rreq);
 	netfs_stat(&netfs_n_rh_rreq);
 	return rreq;
@@ -129,6 +134,7 @@ struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq
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
index 2ece21fccb02..d08bd37bc3ce 100644
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
@@ -199,6 +209,7 @@ struct netfs_io_request {
 	__counted_by(direct_bv_count);
 	unsigned int		direct_bv_count; /* Number of elements in direct_bv[] */
 	unsigned int		debug_id;
+	unsigned int		subreq_counter;	/* Next subreq->debug_index */
 	atomic_t		nr_outstanding;	/* Number of ops in progress */
 	atomic_t		nr_copy_ops;	/* Number of copy-to-cache ops in progress */
 	size_t			submitted;	/* Amount submitted for I/O so far */
@@ -217,6 +228,8 @@ struct netfs_io_request {
 #define NETFS_RREQ_DONT_UNLOCK_FOLIOS	3	/* Don't unlock the folios on completion */
 #define NETFS_RREQ_FAILED		4	/* The request failed */
 #define NETFS_RREQ_IN_PROGRESS		5	/* Unlocked when the request completes */
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

