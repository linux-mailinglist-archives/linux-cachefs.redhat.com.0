Return-Path: <linux-cachefs+bncBDLIXLMFVAERBHMZ46VQMGQEOUCAQVQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A16811624
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:24:14 +0100 (CET)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5915b261837sf474941eaf.1
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:24:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481054; cv=pass;
        d=google.com; s=arc-20160816;
        b=xltRGEVWrNAqUAzyFzIX+2DsjWIqXzo6+Lnbu8038ar5ve2wTSc8AoMW69W+lb/Fqt
         A7H9N/qAUhsPp5zkMEZUYb1K/jxugcQAO6hfnDnwmQsnEcPHS56yLP0mbzbVDpizfeaY
         MNUDla8KFe5usD1DofXye0mUcVVlkEtvu85UoEsryd3cxB0v1+R59JRXsamnTY8DYPsG
         M/bxwysHbPL5yHJWMJeY75SMsa/PyuW1ih7dlEGQLG/wNid5c6MFfEgHHZtVq6ke8IOM
         MezMav2uToGjUubn0hxFHxLQGvmhEnoxyhfwbf4E/VBnkzsw7yLvTvQu+l0mbX7EE+nx
         vkHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=07QfsKDRBnsTmgfg36HDF6yPs+lxvl24UHVASxYjWn8=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=pjD5zPPTwdJh6nK5trT1RE2ma1bySY4XwvbPdyfQZL0OC47MV65cAa4Vhb7DNadTBT
         0hLtlvGwzUnGsE+MZqi3wbYVRM1PQy9HcH5+oVOfxolIF6cgOFHMGrSFJPXtU1v7ceAW
         jny0C9V8xlXM3cq4mq/yn3uVYpBQUsY0ASW5QTL3t1LvfbbNB/utUrqBEdg3k2DhulXN
         RHFtrdrRHgMtEd+V4iwQS8tB5fz7lsHbpio18Xsg2OBf9yLk5csdlrbjrQIkaltz5tJa
         Z3w/997qtGhtSbcR2j9aya2/uPC1okd/ZKDuHAvjQ3MDYmVfb/VbMmQO6BeSZynN9vXK
         H/2Q==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481054; x=1703085854;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07QfsKDRBnsTmgfg36HDF6yPs+lxvl24UHVASxYjWn8=;
        b=qfImGblUlH3T0ujVcsPezuxY8Z0LMdOlLzz1Tnv7T/u8EJ4K7sZ9jIvEZSCpUiOF1y
         /BkhdWwVpUay0tyMhMveAn2Q1PXz/ClfcxKEa6MmAFfq+IZvT7tCeQehGOQpF1MlsHoZ
         dnTnmrf0VdvvlSZsMu+7TtRV0Ka2ufWUeLrzh1f6iBpnQXFkWxFHxZyR9XPrY9DkLS3z
         402706vyurqLUH2xaKPsv0V520PDBv/zGHqMqDwTESeeeTvDS2Ig5afmJOEZPVpi6m+q
         63VFSF2shk9edZBGAuZCRcIuIYPNpqu1i+QqD8+yJq8sX8BbKZOtnMHZEants9cuqnlK
         NOMA==
X-Gm-Message-State: AOJu0YxwtO9rzWU4/ZlIFk3M4dkAxA+PkFeFeJr6eRIsO51ManqzOhv8
	hfk3XI4Y/vAEiRo0UzKiCaLxSw==
X-Google-Smtp-Source: AGHT+IFThJabLAA5bEgxQ0lv2vy7CfjyDzTB+nBh9ssbMMQsw58LBEbubLIM2YkQReWpNYB6XirQlg==
X-Received: by 2002:a4a:98a1:0:b0:591:1d4d:8017 with SMTP id a30-20020a4a98a1000000b005911d4d8017mr2527931ooj.1.1702481053754;
        Wed, 13 Dec 2023 07:24:13 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:602:b0:581:f8a9:54e4 with SMTP id
 e2-20020a056820060200b00581f8a954e4ls581377oow.0.-pod-prod-08-us; Wed, 13 Dec
 2023 07:24:13 -0800 (PST)
X-Received: by 2002:a05:6808:1818:b0:3b9:de15:c507 with SMTP id bh24-20020a056808181800b003b9de15c507mr10375059oib.46.1702481053156;
        Wed, 13 Dec 2023 07:24:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481053; cv=none;
        d=google.com; s=arc-20160816;
        b=pf+CKPXDt50XVEFl2kAynZVOB0UlSjWFzJv+U1R8vpWexRmVEilVIdika1uD75i/eK
         tI3gF9ox3js51M5ERzsqJWQj5uUeJGkQFhamSxyLHy2oi55zoDeMUQ4HUNwpS/DePO7a
         QoAcq1UuJU7x0KeL481VdIzaFNfhYPaRwMxLbzxD7aBaa1g1JMhJ8z/1xQS9m2pJhb11
         kKOreniwrDKp+J5/dHfLpTMHG+2fCVVaz8xu4n8ZMERj7lY061t379PD6EtRsWQigxVn
         kvjjydK1ru5QYJGzqBVV6WG3kGZ995quyDB8Sk62bxcyB2dDWBgUte8OinUQpOjW6aHc
         F32w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=9XI1xSoIOgSiowLypR6weaVQC9UtzbtGS+yNMugVydM=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=COjuEFmq2AQAOiaEchWlwhwlhJr0Mk9FKPVIREqjiQFvtO4DWkiylGPaVCGprNVEpP
         fndP5zEkkdkOXfqNd73/Gld+xRL7h25mt0zIyeL5kfBaf7DPonZli0owtjuA4xHvwarU
         NYVINJDtxxoYtsSWB4J03f4bqQtKAqe4Q5a9yZ55borWO4xrm0bMLVoyiPJV57Navpv9
         ihpH/BCjucqsawtVyUppF999AdPcTAR6y8xwBfLV/N/y0mTR8GUesxgm1YeiS5zGvSbV
         OF8scF3T5bT9tc1MiAZsaZ19CYYqLsIzV6CuxiqWcuyTIAZvq/IvpzHZZ4LL8GicNhuw
         yZXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id r25-20020a67cd99000000b0045db6fa22c6si2232525vsl.763.2023.12.13.07.24.13
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:24:13 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-Bv_gz1IdMHKQX7oRau7-sA-1; Wed, 13 Dec 2023 10:24:11 -0500
X-MC-Unique: Bv_gz1IdMHKQX7oRau7-sA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E50CB101A551
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:24:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id E20C31C060B3; Wed, 13 Dec 2023 15:24:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 213A01C060B1;
	Wed, 13 Dec 2023 15:24:08 +0000 (UTC)
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
Subject: [PATCH v4 04/39] netfs, fscache: Move /proc/fs/fscache to /proc/fs/netfs and put in a symlink
Date: Wed, 13 Dec 2023 15:23:14 +0000
Message-ID: <20231213152350.431591-5-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
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

Rename /proc/fs/fscache to "netfs" and make a symlink from fscache to that.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: Christian Brauner <christian@brauner.io>
cc: linux-fsdevel@vger.kernel.org
cc: linux-cachefs@redhat.com
---
 fs/netfs/fscache_main.c  |  8 ++------
 fs/netfs/fscache_proc.c  | 23 ++++++++---------------
 fs/netfs/fscache_stats.c |  4 +---
 fs/netfs/internal.h      | 12 +++++++++++-
 fs/netfs/main.c          | 33 +++++++++++++++++++++++++++++++++
 fs/netfs/stats.c         | 13 +++++++------
 include/linux/netfs.h    |  1 -
 7 files changed, 62 insertions(+), 32 deletions(-)

diff --git a/fs/netfs/fscache_main.c b/fs/netfs/fscache_main.c
index 00600a4d9ce5..42e98bb523e3 100644
--- a/fs/netfs/fscache_main.c
+++ b/fs/netfs/fscache_main.c
@@ -62,7 +62,7 @@ unsigned int fscache_hash(unsigned int salt, const void *data, size_t len)
 /*
  * initialise the fs caching module
  */
-static int __init fscache_init(void)
+int __init fscache_init(void)
 {
 	int ret = -ENOMEM;
 
@@ -94,12 +94,10 @@ static int __init fscache_init(void)
 	return ret;
 }
 
-fs_initcall(fscache_init);
-
 /*
  * clean up on module removal
  */
-static void __exit fscache_exit(void)
+void __exit fscache_exit(void)
 {
 	_enter("");
 
@@ -108,5 +106,3 @@ static void __exit fscache_exit(void)
 	destroy_workqueue(fscache_wq);
 	pr_notice("FS-Cache unloaded\n");
 }
-
-module_exit(fscache_exit);
diff --git a/fs/netfs/fscache_proc.c b/fs/netfs/fscache_proc.c
index dc3b0e9c8cce..ecd0d1edafaa 100644
--- a/fs/netfs/fscache_proc.c
+++ b/fs/netfs/fscache_proc.c
@@ -12,41 +12,34 @@
 #include "internal.h"
 
 /*
- * initialise the /proc/fs/fscache/ directory
+ * Add files to /proc/fs/netfs/.
  */
 int __init fscache_proc_init(void)
 {
-	if (!proc_mkdir("fs/fscache", NULL))
-		goto error_dir;
+	if (!proc_symlink("fs/fscache", NULL, "../netfs"))
+		goto error_sym;
 
-	if (!proc_create_seq("fs/fscache/caches", S_IFREG | 0444, NULL,
+	if (!proc_create_seq("fs/netfs/caches", S_IFREG | 0444, NULL,
 			     &fscache_caches_seq_ops))
 		goto error;
 
-	if (!proc_create_seq("fs/fscache/volumes", S_IFREG | 0444, NULL,
+	if (!proc_create_seq("fs/netfs/volumes", S_IFREG | 0444, NULL,
 			     &fscache_volumes_seq_ops))
 		goto error;
 
-	if (!proc_create_seq("fs/fscache/cookies", S_IFREG | 0444, NULL,
+	if (!proc_create_seq("fs/netfs/cookies", S_IFREG | 0444, NULL,
 			     &fscache_cookies_seq_ops))
 		goto error;
-
-#ifdef CONFIG_FSCACHE_STATS
-	if (!proc_create_single("fs/fscache/stats", S_IFREG | 0444, NULL,
-				fscache_stats_show))
-		goto error;
-#endif
-
 	return 0;
 
 error:
 	remove_proc_entry("fs/fscache", NULL);
-error_dir:
+error_sym:
 	return -ENOMEM;
 }
 
 /*
- * clean up the /proc/fs/fscache/ directory
+ * Clean up the /proc/fs/fscache symlink.
  */
 void fscache_proc_cleanup(void)
 {
diff --git a/fs/netfs/fscache_stats.c b/fs/netfs/fscache_stats.c
index fc94e5e79f1c..aad812ead398 100644
--- a/fs/netfs/fscache_stats.c
+++ b/fs/netfs/fscache_stats.c
@@ -52,7 +52,7 @@ EXPORT_SYMBOL(fscache_n_culled);
 /*
  * display the general statistics
  */
-int fscache_stats_show(struct seq_file *m, void *v)
+int fscache_stats_show(struct seq_file *m)
 {
 	seq_puts(m, "FS-Cache statistics\n");
 	seq_printf(m, "Cookies: n=%d v=%d vcol=%u voom=%u\n",
@@ -96,7 +96,5 @@ int fscache_stats_show(struct seq_file *m, void *v)
 	seq_printf(m, "IO     : rd=%u wr=%u\n",
 		   atomic_read(&fscache_n_read),
 		   atomic_read(&fscache_n_write));
-
-	netfs_stats_show(m);
 	return 0;
 }
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 43769ac606e8..a15fe67e1db7 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -76,6 +76,7 @@ extern atomic_t netfs_n_rh_write_done;
 extern atomic_t netfs_n_rh_write_failed;
 extern atomic_t netfs_n_rh_write_zskip;
 
+int netfs_stats_show(struct seq_file *m, void *v);
 
 static inline void netfs_stat(atomic_t *stat)
 {
@@ -166,6 +167,13 @@ static inline void fscache_see_cookie(struct fscache_cookie *cookie,
  * fscache-main.c
  */
 extern unsigned int fscache_hash(unsigned int salt, const void *data, size_t len);
+#ifdef CONFIG_PROC_FS
+int __init fscache_init(void);
+void __exit fscache_exit(void);
+#else
+static inline int fscache_init(void) { return 0; }
+static inline void fscache_exit(void) {}
+#endif
 
 /*
  * fscache-proc.c
@@ -216,12 +224,14 @@ static inline void fscache_stat_d(atomic_t *stat)
 
 #define __fscache_stat(stat) (stat)
 
-int fscache_stats_show(struct seq_file *m, void *v);
+int fscache_stats_show(struct seq_file *m);
 #else
 
 #define __fscache_stat(stat) (NULL)
 #define fscache_stat(stat) do {} while (0)
 #define fscache_stat_d(stat) do {} while (0)
+
+static inline int fscache_stats_show(struct seq_file *m) { return 0; }
 #endif
 
 /*
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 1ba8091fcf3e..c9af6e0896d3 100644
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
@@ -19,3 +21,34 @@ unsigned netfs_debug;
 module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
 MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
 
+static int __init netfs_init(void)
+{
+	int ret = -ENOMEM;
+
+	if (!proc_mkdir("fs/netfs", NULL))
+		goto error;
+
+#ifdef CONFIG_FSCACHE_STATS
+	if (!proc_create_single("fs/netfs/stats", S_IFREG | 0444, NULL,
+				netfs_stats_show))
+		goto error_proc;
+#endif
+
+	ret = fscache_init();
+	if (ret < 0)
+		goto error_proc;
+	return 0;
+
+error_proc:
+	remove_proc_entry("fs/netfs", NULL);
+error:
+	return ret;
+}
+fs_initcall(netfs_init);
+
+static void __exit netfs_exit(void)
+{
+	fscache_exit();
+	remove_proc_entry("fs/netfs", NULL);
+}
+module_exit(netfs_exit);
diff --git a/fs/netfs/stats.c b/fs/netfs/stats.c
index 5510a7a14a40..6025dc485f7e 100644
--- a/fs/netfs/stats.c
+++ b/fs/netfs/stats.c
@@ -28,31 +28,32 @@ atomic_t netfs_n_rh_write_done;
 atomic_t netfs_n_rh_write_failed;
 atomic_t netfs_n_rh_write_zskip;
 
-void netfs_stats_show(struct seq_file *m)
+int netfs_stats_show(struct seq_file *m, void *v)
 {
-	seq_printf(m, "RdHelp : RA=%u RP=%u WB=%u WBZ=%u rr=%u sr=%u\n",
+	seq_printf(m, "Netfs  : RA=%u RP=%u WB=%u WBZ=%u rr=%u sr=%u\n",
 		   atomic_read(&netfs_n_rh_readahead),
 		   atomic_read(&netfs_n_rh_readpage),
 		   atomic_read(&netfs_n_rh_write_begin),
 		   atomic_read(&netfs_n_rh_write_zskip),
 		   atomic_read(&netfs_n_rh_rreq),
 		   atomic_read(&netfs_n_rh_sreq));
-	seq_printf(m, "RdHelp : ZR=%u sh=%u sk=%u\n",
+	seq_printf(m, "Netfs  : ZR=%u sh=%u sk=%u\n",
 		   atomic_read(&netfs_n_rh_zero),
 		   atomic_read(&netfs_n_rh_short_read),
 		   atomic_read(&netfs_n_rh_write_zskip));
-	seq_printf(m, "RdHelp : DL=%u ds=%u df=%u di=%u\n",
+	seq_printf(m, "Netfs  : DL=%u ds=%u df=%u di=%u\n",
 		   atomic_read(&netfs_n_rh_download),
 		   atomic_read(&netfs_n_rh_download_done),
 		   atomic_read(&netfs_n_rh_download_failed),
 		   atomic_read(&netfs_n_rh_download_instead));
-	seq_printf(m, "RdHelp : RD=%u rs=%u rf=%u\n",
+	seq_printf(m, "Netfs  : RD=%u rs=%u rf=%u\n",
 		   atomic_read(&netfs_n_rh_read),
 		   atomic_read(&netfs_n_rh_read_done),
 		   atomic_read(&netfs_n_rh_read_failed));
-	seq_printf(m, "RdHelp : WR=%u ws=%u wf=%u\n",
+	seq_printf(m, "Netfs  : WR=%u ws=%u wf=%u\n",
 		   atomic_read(&netfs_n_rh_write),
 		   atomic_read(&netfs_n_rh_write_done),
 		   atomic_read(&netfs_n_rh_write_failed));
+	return fscache_stats_show(m);
 }
 EXPORT_SYMBOL(netfs_stats_show);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index d294ff8f9ae4..9bd91cd615d5 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -294,7 +294,6 @@ void netfs_get_subrequest(struct netfs_io_subrequest *subreq,
 			  enum netfs_sreq_ref_trace what);
 void netfs_put_subrequest(struct netfs_io_subrequest *subreq,
 			  bool was_async, enum netfs_sreq_ref_trace what);
-void netfs_stats_show(struct seq_file *);
 ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
 				struct iov_iter *new,
 				iov_iter_extraction_t extraction_flags);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

