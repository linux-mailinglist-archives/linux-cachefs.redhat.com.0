Return-Path: <linux-cachefs+bncBDLIXLMFVAERBFXZSCWAMGQEWQNSUCI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5E481B753
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:24:39 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-67ef8bbfe89sf12537276d6.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:24:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165079; cv=pass;
        d=google.com; s=arc-20160816;
        b=KhAEUHBH7XaT5p87z45QN0HywrWzF+1vJpjUpc+Wg8gVl9UHIFACGDwap50UaQ9QhE
         kZp16XnDSJIo/OCy1VnFNbszYaIHNMt6TnKIEbqHjI9vpY6GgWoSKLQzohfYbgNppMdq
         BwLtkqUJMaOn2W6fYoAjbdqt4+uPScBZxwkqFhhJdLtTZzl9n/O1OeJuv0q8SWkS3/qj
         jBjOypfXXzgejHRIyRsWru9Lam4qulnbLkUGdpeU+rphEDNekwHc6FIoAiTKOkA56AON
         lHPkUnkT8PffOd9YhaSKOeS+rEXvVlse95q5aaEmh+mJw+094R9FZ3vwDjGCgj0WAaco
         hCSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=gw82zitWfun09f42HuKxughM+r1Hmrpk9mEXG8U21iQ=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=epv+nZS7lxznD9hxgLOiIgupZ1yWG92ZVt7C9PCZ7HAc+BInx1P90xVfKHFd6fvxN7
         At378BtapA+x3a/dbhunv3Jrkf7ncpV984xUUaBTwHgPEDr20BihjmZMEY2n1v8+/7QG
         toq/y3f5zVX299p01leX+WERXTadhumIvrrYQ3SpOXoYOIoSO8BuLJeyyMn4PxdiVfsa
         dVVaY8thRHMmFkicsROx8V6IYARs3wPrHXjCiWjosAPQIE9mvCAsPNHVJmx8wPCSKrvD
         UHmtfjfADf5cUlLepYlGZzETwnmmjUhRUvTmfddy8WcSpOXYZKOxMuf53+UAsUXa5s12
         9S5w==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165078; x=1703769878;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gw82zitWfun09f42HuKxughM+r1Hmrpk9mEXG8U21iQ=;
        b=N5q6IeMof1nCYQMlfKJ4WtLpHH2KM6AnEtbcwM7Z+JIirxUZ6fIBS0NgtXmginKQl1
         mdKoS9v7Q8XCfpJK6/PWkRhRb4bQw2Ic4nOVxqwFYBv/wym0tp9jt8Et0pX7jndnBlfK
         ubZLhlVN7GS9dckaSxSwrYMTr23hRvj+x1Qq+kfRmWJuUP0ySMhlYlq1EM+1GqCyJ8I0
         JCpVRt3pDGQ780L5xC++PqTQSbty16O5aUDYbDiHhXkm8IrJ547tdvsJH3QvbATMsrJw
         TrDsNDLbPhhwE+ecBm8JQXSKMds5veq73E3HdVmaXK58iPb+ACZOnsU/Kg6KIrkETr1b
         y2kg==
X-Gm-Message-State: AOJu0YzbUlR31j9kjf4FZiCIhPL1rftpxD7TewRx4ZqVoEL5DQghyVIZ
	AWZVo+92MBQSat99VgPXyiE7zw==
X-Google-Smtp-Source: AGHT+IGgOSR+YITcr7UD1aihAHg6rr4N7CzMBFOGLoAdO1bd0LPjaHZT4K+p1LfdlJa7cTyMFm3pEA==
X-Received: by 2002:ad4:5c8b:0:b0:67f:6579:6732 with SMTP id o11-20020ad45c8b000000b0067f65796732mr5409075qvh.47.1703165078663;
        Thu, 21 Dec 2023 05:24:38 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:5f4b:0:b0:67e:fd54:9f50 with SMTP id p11-20020ad45f4b000000b0067efd549f50ls1653597qvg.2.-pod-prod-05-us;
 Thu, 21 Dec 2023 05:24:38 -0800 (PST)
X-Received: by 2002:ac8:5aca:0:b0:425:8930:fdbc with SMTP id d10-20020ac85aca000000b004258930fdbcmr30975469qtd.96.1703165078152;
        Thu, 21 Dec 2023 05:24:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165078; cv=none;
        d=google.com; s=arc-20160816;
        b=uyZVqxm25VvvyQLbM/VGJLOwRO+jxc2eQre1SzF/0shK/1Q5SRykdtiHkXr1zAwZu0
         MKHszjwAZ4dyiRthT4iPKzoZ3+1wXDxGIX8B7tErwK6qaVrrcx9bgaqtzlxXeRYvELBY
         vA4u27hBXHdrEJt8YSSM5XRYoBoEFt7seivn3ZNIDSa0hhAOe13bX1buJyB6999FiQ9v
         PdbfcM+wmnXmU2RTOO6gY2cBhnqinb/ajk4eQ+21nYk55i0Ff3A99cExLSCTuG+fiOPW
         MPiLY1tqJg1aj7g80HcLWRBzswlwJjX1tREMEuSgATqhFcUTDTKhJkGGkP55/vXc7AyB
         C5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=/8o/jzOtIP8Ko02Zj7+GBh+0/dDxeH6NEFPQ0ZzQc+4=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=e3l3S8pAKLmlYtRyHZt0Yl+12KYLlPpwBnjGKZYOdKe/LySYCo4QHgTK5Uy3ZF/eUe
         JtGFb50ljAF898wmDny69q9xd4Vaq/qZP+LJAdtkSFV/DEuZ90yRWGgfW/dhB/BPUvJ9
         ZbTQrR28lEREqnNiKtqwMRObKcQB0tXpTc8lzHy4Yjptxqj4OG8Pu8Q18FszPFo6lVPO
         O/sBOm51UA6AiuYG3BtftfT6IEQsLXdiagf3vbQmGwmDOxOUtwA/h4zIfaEVNCSyFFXm
         xVtaZ0GlToEk9ZFVM2jo4uwsEjAOiuvpcIbxsd5TPG7QtEMHyn7qMGqJkrnWFtGanG9q
         lCbg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id 16-20020ac85750000000b00423941d3e26si2087960qtx.700.2023.12.21.05.24.38
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:24:38 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-248-alf0bs7AP2uwNRM4TZMMJg-1; Thu,
 21 Dec 2023 08:24:36 -0500
X-MC-Unique: alf0bs7AP2uwNRM4TZMMJg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F1D01C06529
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:24:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 68BDF492BFD; Thu, 21 Dec 2023 13:24:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80DDD492BFA;
	Thu, 21 Dec 2023 13:24:33 +0000 (UTC)
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
Subject: [PATCH v5 08/40] netfs: Add a procfile to list in-progress requests
Date: Thu, 21 Dec 2023 13:23:03 +0000
Message-ID: <20231221132400.1601991-9-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
index 3f6e22229433..4708fb15446b 100644
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

