Return-Path: <linux-cachefs+bncBDLIXLMFVAERBGXPZCVQMGQERCNYH3Y@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mail.lfdr.de (Postfix) with ESMTPS id C527B809342
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:22:35 +0100 (CET)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3b89b3ebd5dsf419732b6e.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:22:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984154; cv=pass;
        d=google.com; s=arc-20160816;
        b=T6cYBKzTb0IkAOr+ady9T/uwJqgH5EFGnGVzn12Bp1RiVN3Z9yu2FkfF5bCmNXr6y9
         oQniYHUoUR9NfnN9+Hm8s0NvnCgNT0wq9D02AdV2A0rSUEWYEYq80umbP/BtMypdyIem
         yFqCdvUJX+KrZyEY/FIMaSOPSf+/PJXOFZiqgCBZGLiIQ22FEzCGTx9mPeWyUfuUrgck
         2OK1desAmdQ38tqk7BeChDgwZcinS24VM8yNqLPNEcnK4iCJTmB1L/8G3HnwQoFenB5M
         cqbsRaNu3nl4UTXFWwWptekMG3KNkD+iA5TP9zIwxtcEQ5IRx/fHrFThRAT7/LWBHKla
         g66w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=AaK5Pk55IPyyZfj9bDfwvZzj0865pvEEYLVndZIw9Ck=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=DGidYWGg11Ag0Hh+SdhWbapD70I0ixOUHe1lQkKFIftRWohgWvlqUorFd/pXBvgtgo
         uxVNWMs+MUUSf4GleK7mk7Ed6nEAsJF1CV2ob463+9+O0bwFSpXRopkO72uzKhQZqkFi
         +3REob8DUevMSpzmsDUoCru3S+pSt9v3R0eEDGCLdaCBAlVKi14oySWxvZUHkD0S3w5g
         0vtulrt7vDqbCGuUG+wICW/LeX62zLdXNmyqZ7VBj4eFDClL79zf/wBn8iwYv2m4D+f+
         NBFrL0uVFs1dp//lS388LxyxoYAhpP5WmjL4AeUQHTW+FmooLBoTiqUvzDSsDjqmxUS2
         euCA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984154; x=1702588954;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaK5Pk55IPyyZfj9bDfwvZzj0865pvEEYLVndZIw9Ck=;
        b=gNAegLJAychIWEnx1Fm9IeIVQtG2ie3HAMWOCkG1rlcVHwmkzRUkue6gE719I0n7vI
         2yPyPL6oIeplseeik3lh7GyymH2Of/lJwB9MS3+kneX+knTFGzGavVTNiSDW4itUiJeg
         cyHOWiIw8JilH+C5wuOcNtXw4nYa22lN6Mqu63VXDt8cvIDm5eJF8jBQwCt/3VcRl90/
         EVHznuBb6qvunT3FiLlcGZrQt3+XFp7dPs6eatgC/cLgbPcdX1yHU0nlHHkA30MCfh/L
         92upBFpx2/AKzdKnCnuJllvoX9RW/wBXhfV8Mg14P7bfqHmqNfQK2My3ILPZNRihTU54
         r7xw==
X-Gm-Message-State: AOJu0Yw2CB04gOz6Wff6ohvqUdNHh5zic6R6XM4RC2IF5klLHTZpVWt5
	ykLZszXomzG+klOun+Xw6JN4pA==
X-Google-Smtp-Source: AGHT+IHxnmCoEXATRJuXpGlI7rBcpEa6IBuwUEN9blgxJZYwwNn2HWAKBSdr8JTbNDhLBtMEg6ms4w==
X-Received: by 2002:a05:6358:5925:b0:16e:b5d:43ce with SMTP id g37-20020a056358592500b0016e0b5d43cemr7075274rwf.0.1701984154498;
        Thu, 07 Dec 2023 13:22:34 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:a8b:b0:67a:9611:38ee with SMTP id
 ev11-20020a0562140a8b00b0067a961138eels632925qvb.2.-pod-prod-07-us; Thu, 07
 Dec 2023 13:22:34 -0800 (PST)
X-Received: by 2002:a05:6214:1398:b0:67a:a721:e132 with SMTP id pp24-20020a056214139800b0067aa721e132mr3674732qvb.95.1701984153929;
        Thu, 07 Dec 2023 13:22:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984153; cv=none;
        d=google.com; s=arc-20160816;
        b=mDJAKrER/Sp1MQAzOfoKqbLl058zPrfrRmWCavhz5jnf0Z/40IfU59BB5mrW5gAQDo
         3zuQ4D1kSSE2zERCs/APSthP6LYoFcn7BO14+mNqdy2UQyKK5MD6kXu9fyobE7tqU4wf
         5uQrnpaiEAxNQl2LOV8EyUnihtgvG323TfEaPWBtByFgMUU/heML7YIyW32TxACMmuhF
         3ACkYJ8/GGxTe3VO4HBMAtdXT1DYPw1IQDjop7qS8uhzEoSg/WWRUa8czSwi5Vgh9nO7
         UubFCzX1A7BmNPrnsEfo3Rt+aYOwiZ2psH8PKIrjOUZXLBdm5MdNn4JlQWUja/AqIoSn
         FoeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=gYUIXZ+PiNdh85g2qszNwYuewLXwpj0jIftWKnkTXRI=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=XWOZnSMIp6FflDlxICzVAXOLG5NU2AzW2yS8FS+8gxX8rOsYHbD9DzhTmGjXRKcftF
         bQdk5F2vBjZzzOTOCJ4FRQ4oOv42Vx0MnMDw4ZMuR1VwvA6418iOj24ZqIcBS0kxyQLe
         MmAXtUMUSlwh4OINNg0vZjKxKRlBA3djFC+aEiQ+8PnHhc69KZOC0DPrj13fc3LODuI2
         /V6oku1FUaGS3BdBBIsqv2ZmnTPd38o5cjrCPN0wdF25JTHotsyR7dV63J/180rlO0w7
         LwOUd9KahkbythCQAjkcKOrlyAU9XoMrtGWvqm37OrDiK5Vyz3HALoqFty7ykSZD+Cf4
         kPxg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id cm17-20020a05622a251100b00419628da454si764015qtb.177.2023.12.07.13.22.33
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:22:33 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-7GOF24CdNye6oj5RXQLTGQ-1; Thu, 07 Dec 2023 16:22:32 -0500
X-MC-Unique: 7GOF24CdNye6oj5RXQLTGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D880485A58F
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:22:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id D26801C05E1A; Thu,  7 Dec 2023 21:22:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DE911C060AF;
	Thu,  7 Dec 2023 21:22:29 +0000 (UTC)
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
Subject: [PATCH v3 06/59] netfs: Add a procfile to list in-progress requests
Date: Thu,  7 Dec 2023 21:21:13 +0000
Message-ID: <20231207212206.1379128-7-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
index 3e6e6a2c0375..2bd99989dd7f 100644
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

