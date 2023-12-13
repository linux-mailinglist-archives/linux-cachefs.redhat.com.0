Return-Path: <linux-cachefs+bncBDLIXLMFVAERBJEZ46VQMGQEAEKGDRA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1F781162A
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:24:21 +0100 (CET)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-425e56b80a5sf20518401cf.1
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:24:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481061; cv=pass;
        d=google.com; s=arc-20160816;
        b=cvLOsMS7+TK4AsIUJ7byXH0+0VWOs3Uv3URAF/MU3Gu31zVdEjoq0ASuu6b+I5k2FZ
         YNjZg2vTrqSlOqCO8jcPW1K59Bfwirq3xAkBftMFXUZ0SKTXBryYMzSvoFkiosA/ZITd
         ZX1nENRcTiKISqdDf7xX3X19308lABoMEnzJeNwjhI2jCrjv3swnm9RpH6KR1rRF1ddh
         s4F8oRo5JsLip4I0ztyWd5kU77lkR1UaZmv23TvZ4N9qtMxEyDMy5xx84gXLJmuGzFEm
         2p3O3Xkpy62vG1N+R6eps++CnZbgQ2026tAa/76oOCD5OEeqh6gaG7zEqt61EyZGC0p8
         QBPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=LBOVMKueRVjzw2+WJ7bcPNnY7My6smg8vzoZueV4AKc=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=GTIZjUAa03eMiz1plbHIrz2AWDTGKDqA2MO/vx36QwqVloCcpdiDmWJTCna2s3qrMG
         +v2vvv/IC42saTEa/60mQqMon8zxADuBKtTsEykXs2eT5hRqo643YVqlUg/3AhZatvmP
         0N6DzC7LdnJSh/60aUDVixE2/Ql/BQq34aqVYTS6FFVSKxtpQTmdxiPRDaONN3Ed8k1q
         39sCJZNP5klEPImIDpXw3Bgd+HlV6x2zcWG/CpOrUnR/bbw1VGh4wWbGHBoJg36ysAIU
         0Qi79+bheSVBvgv+11RKDfCnd/x4Qu9hxwjMyTswLH6AeSUNflRrJ61R2pifKdqQ1mID
         Zuzw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481061; x=1703085861;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBOVMKueRVjzw2+WJ7bcPNnY7My6smg8vzoZueV4AKc=;
        b=Rd7TVRA1zDVVLs8J2niGve68fSVzs0ocqvNq8ZsKGKEb2KypVWTRx72z/p/apM5tAZ
         4/qRjyBpiuFMOm6Dg94SDfGPg2wE8qyfFbDl9IgJYdAC5AGYV11CgtFja6glF1dLfU6l
         W7z7LlpxewdalpQYS1HAKswZqAE/GK6s8/oSUKVHGdLVKlR0j9KCDYtwt1vwK4c0113S
         3HfXGuEq7Mh5cxgoA17h6uXbQPnljU0R9hJrhzeSo88wqQbhTGqlYhLL5t9Ejl54cIly
         FFxCmHFoZwhKQVh0Gy/cQMXFNfrS9prGBGh6Z+fdzBpOYjQ7qR1h+b6ETfXzCuUfTE5x
         MrAA==
X-Gm-Message-State: AOJu0Yz4FsnBlXNb0PzPty147NtshffJMBQqyQywtG2utpNOO15IpBgb
	DlQERCI3l1widPml/vIJdmrNZA==
X-Google-Smtp-Source: AGHT+IGuUWaHP6dBgWiYO9MAkSD4iK3jdj8TaoO5G6V0hweZoLCMqcs0rtopJa9wCAgAJCWAAzlHYw==
X-Received: by 2002:ac8:4e83:0:b0:425:4043:5f1e with SMTP id 3-20020ac84e83000000b0042540435f1emr11157174qtp.92.1702481060780;
        Wed, 13 Dec 2023 07:24:20 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1815:b0:423:7c51:c729 with SMTP id
 t21-20020a05622a181500b004237c51c729ls232690qtc.2.-pod-prod-06-us; Wed, 13
 Dec 2023 07:24:20 -0800 (PST)
X-Received: by 2002:a05:622a:1344:b0:425:4043:5f11 with SMTP id w4-20020a05622a134400b0042540435f11mr12157205qtk.79.1702481060246;
        Wed, 13 Dec 2023 07:24:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481060; cv=none;
        d=google.com; s=arc-20160816;
        b=K28K/3qk5qWX5THMtpNtBFvt5DH2T0njI1s5p+e5hMpxx1Si8yK8ZK+cWiLTzNoxfE
         CCwaXYB2WyFcnpZAbWkZZsHOJX9J7dZ4VvU6kpR1w7Ki5jqowjNPgAxffJO7zCXRNw8x
         YIH9YtlHf9XzxxFTLv6n5Gb6hRDj9C+aaSLlmx6NSTuxFAQd3wnarzsGKJBBIiW41eN+
         J6Kg2yASEQKoyuu10CLKpir8/B67rnOzEHJNuF5r0/XZv5E39DiNLjpYDLef7Tbg15Rq
         XrntlAkmsGDOQqKJMoy4ealEY4MpBLBg56U0a3bQGAiHbyh3h/FZNMpdRwRIt+b3qDDb
         Lzng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=xXclU2RwEHr6/zRJbfo0avpxB2MmbXmM1O7VqBArdhM=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=J+IfXu8hxZprH19Qayt0NR9sjSl3eDnXTxq0YnptQwykkQ+hcinUojvp7DlrtGnkfD
         pbZkVtxXowqsVlD5A2nX6PN2IiPJI5NKCILTSFc+sNwrrZnhhRpZZVPcV2KF0BxwN7Ut
         qMwSO2+MQTfEet/A6hQy1iM8hypVvkwvM6b5AxMG+NGKyrRw+EHVsALXkTpuf17COXRP
         2j0RdluzmrAUL0uoB29UFMyeAXvccN7QaEDQ7ive//zJscsgcnOjEwWHM8JaM5gdlsOX
         ac0rGCylh20SQbxvPxxRB4Nw2tRg2ZLt3jyd6y36k6ihpwW6Qxh/yOIt6RtEgeh+61sV
         lwmg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id fe5-20020a05622a4d4500b00423788ce3aesi14265780qtb.137.2023.12.13.07.24.20
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:24:20 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-7NZEy5xyOTepF5QbTVTUzw-1; Wed, 13 Dec 2023 10:24:18 -0500
X-MC-Unique: 7NZEy5xyOTepF5QbTVTUzw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49D08881B7F
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:24:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 4642A2166B31; Wed, 13 Dec 2023 15:24:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C1982166B32;
	Wed, 13 Dec 2023 15:24:15 +0000 (UTC)
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
Subject: [PATCH v4 06/39] netfs: Add a procfile to list in-progress requests
Date: Wed, 13 Dec 2023 15:23:16 +0000
Message-ID: <20231213152350.431591-7-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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

Add a procfile, /proc/fs/netfs/requests, to list in-progress netfslib I/O
requests.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/internal.h   | 22 ++++++++++++++
 fs/netfs/main.c       | 69 ++++++++++++++++++++++++++++++++++++++++++-
 fs/netfs/objects.c    |  4 ++-
 include/linux/netfs.h |  6 +++-
 4 files changed, 98 insertions(+), 3 deletions(-)

diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index a15fe67e1db7..937d9a22f178 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -33,6 +33,28 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync);
  * main.c
  */
 extern unsigned int netfs_debug;
+extern struct list_head netfs_io_requests;
+extern spinlock_t netfs_proc_lock;
+
+#ifdef CONFIG_PROC_FS
+static inline void netfs_proc_add_rreq(struct netfs_io_request *rreq)
+{
+	spin_lock(&netfs_proc_lock);
+	list_add_tail_rcu(&rreq->proc_link, &netfs_io_requests);
+	spin_unlock(&netfs_proc_lock);
+}
+static inline void netfs_proc_del_rreq(struct netfs_io_request *rreq)
+{
+	if (!list_empty(&rreq->proc_link)) {
+		spin_lock(&netfs_proc_lock);
+		list_del_rcu(&rreq->proc_link);
+		spin_unlock(&netfs_proc_lock);
+	}
+}
+#else
+static inline void netfs_proc_add_rreq(struct netfs_io_request *rreq) {}
+static inline void netfs_proc_del_rreq(struct netfs_io_request *rreq) {}
+#endif
 
 /*
  * objects.c
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index c9af6e0896d3..97ce1436615b 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -21,13 +21,80 @@ unsigned netfs_debug;
 module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
 MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
 
+#ifdef CONFIG_PROC_FS
+LIST_HEAD(netfs_io_requests);
+DEFINE_SPINLOCK(netfs_proc_lock);
+
+static const char *netfs_origins[] = {
+	[NETFS_READAHEAD]	= "RA",
+	[NETFS_READPAGE]	= "RP",
+	[NETFS_READ_FOR_WRITE]	= "RW",
+};
+
+/*
+ * Generate a list of I/O requests in /proc/fs/netfs/requests
+ */
+static int netfs_requests_seq_show(struct seq_file *m, void *v)
+{
+	struct netfs_io_request *rreq;
+
+	if (v == &netfs_io_requests) {
+		seq_puts(m,
+			 "REQUEST  OR REF FL ERR  OPS COVERAGE\n"
+			 "======== == === == ==== === =========\n"
+			 );
+		return 0;
+	}
+
+	rreq = list_entry(v, struct netfs_io_request, proc_link);
+	seq_printf(m,
+		   "%08x %s %3d %2lx %4d %3d @%04llx %zx/%zx",
+		   rreq->debug_id,
+		   netfs_origins[rreq->origin],
+		   refcount_read(&rreq->ref),
+		   rreq->flags,
+		   rreq->error,
+		   atomic_read(&rreq->nr_outstanding),
+		   rreq->start, rreq->submitted, rreq->len);
+	seq_putc(m, '\n');
+	return 0;
+}
+
+static void *netfs_requests_seq_start(struct seq_file *m, loff_t *_pos)
+	__acquires(rcu)
+{
+	rcu_read_lock();
+	return seq_list_start_head(&netfs_io_requests, *_pos);
+}
+
+static void *netfs_requests_seq_next(struct seq_file *m, void *v, loff_t *_pos)
+{
+	return seq_list_next(v, &netfs_io_requests, _pos);
+}
+
+static void netfs_requests_seq_stop(struct seq_file *m, void *v)
+	__releases(rcu)
+{
+	rcu_read_unlock();
+}
+
+static const struct seq_operations netfs_requests_seq_ops = {
+	.start  = netfs_requests_seq_start,
+	.next   = netfs_requests_seq_next,
+	.stop   = netfs_requests_seq_stop,
+	.show   = netfs_requests_seq_show,
+};
+#endif /* CONFIG_PROC_FS */
+
 static int __init netfs_init(void)
 {
 	int ret = -ENOMEM;
 
 	if (!proc_mkdir("fs/netfs", NULL))
 		goto error;
-
+	if (!proc_create_seq("fs/netfs/requests", S_IFREG | 0444, NULL,
+			     &netfs_requests_seq_ops))
+		goto error_proc;
 #ifdef CONFIG_FSCACHE_STATS
 	if (!proc_create_single("fs/netfs/stats", S_IFREG | 0444, NULL,
 				netfs_stats_show))
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index e17cdf53f6a7..85f428fc52e6 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -45,6 +45,7 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 		}
 	}
 
+	netfs_proc_add_rreq(rreq);
 	netfs_stat(&netfs_n_rh_rreq);
 	return rreq;
 }
@@ -76,12 +77,13 @@ static void netfs_free_request(struct work_struct *work)
 		container_of(work, struct netfs_io_request, work);
 
 	trace_netfs_rreq(rreq, netfs_rreq_trace_free);
+	netfs_proc_del_rreq(rreq);
 	netfs_clear_subrequests(rreq, false);
 	if (rreq->netfs_ops->free_request)
 		rreq->netfs_ops->free_request(rreq);
 	if (rreq->cache_resources.ops)
 		rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
-	kfree(rreq);
+	kfree_rcu(rreq, rcu);
 	netfs_stat_d(&netfs_n_rh_rreq);
 }
 
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 32faf6c89702..7244ddebd974 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -175,10 +175,14 @@ enum netfs_io_origin {
  * operations to a variety of data stores and then stitch the result together.
  */
 struct netfs_io_request {
-	struct work_struct	work;
+	union {
+		struct work_struct work;
+		struct rcu_head rcu;
+	};
 	struct inode		*inode;		/* The file being accessed */
 	struct address_space	*mapping;	/* The mapping being accessed */
 	struct netfs_cache_resources cache_resources;
+	struct list_head	proc_link;	/* Link in netfs_iorequests */
 	struct list_head	subrequests;	/* Contributory I/O operations */
 	void			*netfs_priv;	/* Private data for the netfs */
 	unsigned int		debug_id;

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

