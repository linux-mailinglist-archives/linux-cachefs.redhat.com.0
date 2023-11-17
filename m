Return-Path: <linux-cachefs+bncBDLIXLMFVAERBD5Q36VAMGQEIVQGNFQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id D376D7EF954
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:00 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41cca916954sf29248951cf.2
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255759; cv=pass;
        d=google.com; s=arc-20160816;
        b=JwTcvbe/8xECaLwVWNl1XgWRP90clnw0OiPinEhwUYTd9ylDg9UVxEF2tBGo789U+j
         DH+qEkDVrQW8UxAZ50Dtipx7ZX9NX/eJ5TQ6QFiR/XphbRUYSGtrmA2Ggp/9qJDClRpO
         skQ7hCbtnL5klH+8YkdIeM1UR0koFNx1VdcsYZuWoNX/4KQR4ncRldMno8ojd+vGLWEh
         lV8Wwmagur15etFGUGDOfDgth6SyngC8TjvhIwZbijh0nNQ/3HJdWwRQe1gJH50CaxBi
         M1SgcRNdVH9wVUXrH1ARj8+ySsYhUOBamgNVrLl7YLyQ7Tj/el52AvkY1kooPNVjO2pn
         cXMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=kS4TK0hqGimWSbnJ7XhpumXkKVYl01SwJ7CqD6cmYDY=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=UTt5GndwYog3mF3MaoIT+/0RI8SUf8Sqmx0T7ueT3v2bvj5eG/mK+LWgarYJz/kVfU
         YzomLk8Pb/jX0YaTlF0DQ8hVypO3rHcOhrUcuEXUEEy9pJbtgSsm3s2wkDiLSF2driKO
         Kq7w8tO8cvTDdsGREyCA4TAi0uAT+s7Louzc2S7JSGpDv1BPaquGyARUqaqUKEdg9Y7k
         m7F0Qk1DXiP7Y3WGf51e9eoI9swObTk4RXr3F5FeL8KgQovRKLS8S4lwrS3As/ZWvU0m
         yV2BsZFCa1Jc6vJgfTmoWFTDNNBlcYB5THHTlL4B1EEIyyjqEn85E4NOUp2uN/IYEBMb
         MdKw==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255759; x=1700860559;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kS4TK0hqGimWSbnJ7XhpumXkKVYl01SwJ7CqD6cmYDY=;
        b=NeRVNiCQfHN75X4YNKgC9htLiInOAlfVO3YaDoIAo4Ps10ErTNZWUjOBsj3mdE9bZz
         vFafcWkdFjDL7rixpP3nIf879xux9HzKVPnjezDeuETW40wwM5H4t/S3/gIZy6qQHIpu
         2M6WWo1bbZwJXEhtI+qwr+07JALoCOTx7drsSTbOEYmP/TbSvNNdoaA7MapPMwpqohkG
         12tVA4AhWQpKyVLKB8Pf0a2Z+H8EHIN4Q7M7YxSCzYRoXa2Y4gwunisv7KEdzoxEuGyZ
         Z1Jd4LBWyUe+E6LYP1ayxiXX3M29We5UCGi2i+f15/n/6IPp5wKTM65RdECTBGLkLiXa
         Z/QA==
X-Gm-Message-State: AOJu0YyVQkrTnzWgjiLV/LjH3Ha0hdcAAdNDVPvdpUz870AndkF86Cz6
	3eTk8cnXgdOI8JjqFmVbaDB75A==
X-Google-Smtp-Source: AGHT+IHqEEPCUs3b84jz2QZYcPZBEJnHOuaXzPJg77ZW7ULoi6VDz1vDwmIk0rnDHdYEif5WveqXYQ==
X-Received: by 2002:a05:622a:1386:b0:403:a9aa:571f with SMTP id o6-20020a05622a138600b00403a9aa571fmr1012507qtk.16.1700255759800;
        Fri, 17 Nov 2023 13:15:59 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:7f4d:0:b0:419:5434:d639 with SMTP id g13-20020ac87f4d000000b004195434d639ls1362803qtk.0.-pod-prod-06-us;
 Fri, 17 Nov 2023 13:15:59 -0800 (PST)
X-Received: by 2002:a05:622a:58d:b0:41e:7b2b:f339 with SMTP id c13-20020a05622a058d00b0041e7b2bf339mr1186431qtb.26.1700255759171;
        Fri, 17 Nov 2023 13:15:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255759; cv=none;
        d=google.com; s=arc-20160816;
        b=qAJKGEb2sZXaX5NxSyodce//3kUfnuFVP58OcbXx+9zwnbj5Lt9WYVMDHqJJDeAH1P
         VZlc2ibJ6SfuiqCJD81WBZRX9TSS5InVybatJ30ylkG3LXBY0+fO51nIRHBEpSQdur9S
         kOTohNDasRv2SN1sUYKH7+WP2kt5nVRhR7CcrZWohKfqNelLDek0cirBYJ3NnvGSyoVw
         0rLYr1xkhw2xdTzh4QY2+wsb7jcwTQku6yaLGYPQ4lDMggr3qu8a9I0QEuFcbiwAowQM
         1WiC8ukDZix0XmyGM60XPPH/pJDnMGeok6fadOEKxrrhIbkia8hFLOKusHg+bgZrOr9z
         QtYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=KKwIDnJBdKbpqLQU76AV5hRxBgMKROUmlCRt7k06nqI=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=DGKXORB0mpNcE5eAEOm0sqLp4nFg2T9Hs/2EX89wR7D4gGb+OCmqR+LcDDa73terwi
         hWqPcctUOu50T1czrvfcMU4i4JXyCjbNH+B7PdMZVpUEnwmpJxOoJBIEKfiEhfnE4Szn
         QYejFs3RrxX9vVlJIjtsGaiUcO6iEGpdK/moHRiQqnzJokhQphp5ONfUW6fUM9SikA4V
         Vel3UzSPPOhd6Lk0pGLOjaACFU3ybVdpznr9z9GY//vrYqL0zhrR1keQjpTrIB9NpMoR
         jEyyb8/Cxvj19loeVgZGtF9t5muvbAzznXCXV1jM+3cXf8ankSUXWuGpxWFbUrVBQZSh
         T6Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id b4-20020ac87fc4000000b004181028650esi2382330qtk.606.2023.11.17.13.15.59
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:15:59 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-31-NJxJq6VcNI6tZ0CP3yatBg-1; Fri,
 17 Nov 2023 16:15:52 -0500
X-MC-Unique: NJxJq6VcNI6tZ0CP3yatBg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B77773C025D3
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:15:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id B48BB492BE8; Fri, 17 Nov 2023 21:15:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1EE6E492BE0;
	Fri, 17 Nov 2023 21:15:50 +0000 (UTC)
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
Subject: [PATCH v2 01/51] netfs: Add a procfile to list in-progress requests
Date: Fri, 17 Nov 2023 21:14:53 +0000
Message-ID: <20231117211544.1740466-2-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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
 fs/netfs/internal.h   | 22 +++++++++++
 fs/netfs/main.c       | 91 +++++++++++++++++++++++++++++++++++++++++++
 fs/netfs/objects.c    |  4 +-
 include/linux/netfs.h |  6 ++-
 4 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 43fac1b14e40..1f067aa96c50 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -29,6 +29,28 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync);
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
index 068568702957..21f814eee6af 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -7,6 +7,8 @@
 
 #include <linux/module.h>
 #include <linux/export.h>
+#include <linux/proc_fs.h>
+#include <linux/seq_file.h>
 #include "internal.h"
 #define CREATE_TRACE_POINTS
 #include <trace/events/netfs.h>
@@ -18,3 +20,92 @@ MODULE_LICENSE("GPL");
 unsigned netfs_debug;
 module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
 MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
+
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
+static int __init netfs_init(void)
+{
+	if (!proc_mkdir("fs/netfs", NULL))
+		goto error;
+
+	if (!proc_create_seq("fs/netfs/requests", S_IFREG | 0444, NULL,
+			     &netfs_requests_seq_ops))
+		goto error_proc;
+
+	return 0;
+
+error_proc:
+	remove_proc_entry("fs/netfs", NULL);
+error:
+	return -ENOMEM;
+}
+fs_initcall(netfs_init);
+
+static void __exit netfs_exit(void)
+{
+	remove_proc_entry("fs/netfs", NULL);
+}
+module_exit(netfs_exit);
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
index b11a84f6c32b..b447cb67f599 100644
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

