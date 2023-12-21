Return-Path: <linux-cachefs+bncBDLIXLMFVAERBEHZSCWAMGQENMEGN6Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 3847C81B74F
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:24:34 +0100 (CET)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-20353d7d3absf839108fac.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:24:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165073; cv=pass;
        d=google.com; s=arc-20160816;
        b=dM9R/QQw5HH9Pul140i92rT4v2GRCVGr4NFseqBCBheEEGq50+wJWgxUB+oreTVeUP
         joJombFV648dwu0emL1u6zflcK0piXIikuFP6PyfVck7KsZs5ue6mTTHqEusf74WnpKC
         zV5WZPkx1TXvKiENmx3JO0lJ3NjzSiDDbImYhIDVYH2NDcoDNbCYsmjymMPeUBSpAhj6
         iMNkNF3KhyjodSXZfCkcW/oWtILZZknj07MQNRkrhUyA94RFc8yQnw7lQPva9e3l1BhB
         gua2aS0DHd1S92OyWAuqMgA0diYBLhtDmN/heVYcQwMAeumjNqb6Rdeh05STSA8niRD1
         R84g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=jSxOjgAUFu6TzN+BgjDeIYT/PTV5fwdNvawWbjMbl2s=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=qSf6tlCOHN5BpW58J5bscEIUbBuH81VC0xWp8HVVooU3a1Em4VM3KgOmAz83YfWWqZ
         OVgH6T5BHou6lP1i7KhFpm5BdbHUrfwkTbUVFTe3TauotMTE+KFNdEJqkBt79ym4WEZJ
         Z0KxLbkijg3qK21e6QQ7v++gzgrpyElbO9cKWdAcoJMEyi7pDa288jXXUni9MOEXeIFI
         4dcsdZNFD4T1El3awMgWB8mpSPwKCfZD42ghWMHx+t06EQJvnp9VUUNMRcUPZZZIyyhm
         mR+RV3a6JTf470UZVhnCi8gsfFUUVYgXV/Z1ao5dhXz5TSG2GeQIbH50QfKVO6IwxXv1
         o3gw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165073; x=1703769873;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSxOjgAUFu6TzN+BgjDeIYT/PTV5fwdNvawWbjMbl2s=;
        b=O+g9j+V1GfqDR2OZH8kHCxqx/pXfHs8aKOKXED0kky8ThFtjxmW6O/lvtKTEY0EAEY
         SkiAAR2oThdmnrkIaHbNVusoqGjSmfnxMBDS/iQkVIyCnugXXpB9t7C/srjMeAtO851j
         Uz2FFE8csTiXEt78+lcUYspIVTa9WbJKsL5IIGP4orRSGGxUo+evzDdve0NCHx843U+f
         2vFE1G91qreeLOsN7XkuzFvEDQ39C9pD6mm6ZLaOBsxK10QwttFBNzczAX2vzWFcIhpx
         8IPi6AzGm7/RNoYP+kaSdyU78BVE9T336DxWW1gzgXJtyjLjImuC8uLOBroDu/Iu/91O
         HrOw==
X-Gm-Message-State: AOJu0YyKTWJUwmY60f7pbgmH9pWsdYcxUYFbMCVhTHmEWUB5ZvtPte0F
	HV3kf7+R4ay8AUpP61tW5rK1tw==
X-Google-Smtp-Source: AGHT+IFTd4iLtRKzdXlpOqa+75rVSZDgr0QWg9TVLwAdamoP/8d+s1E55Boncr0h5e+eeckNOEylng==
X-Received: by 2002:a05:6870:9584:b0:203:84a8:4e99 with SMTP id k4-20020a056870958400b0020384a84e99mr1302641oao.7.1703165072885;
        Thu, 21 Dec 2023 05:24:32 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:4988:b0:203:c880:47a1 with SMTP id
 ho8-20020a056870498800b00203c88047a1ls509605oab.1.-pod-prod-08-us; Thu, 21
 Dec 2023 05:24:30 -0800 (PST)
X-Received: by 2002:a05:6870:2012:b0:203:cfc9:e714 with SMTP id o18-20020a056870201200b00203cfc9e714mr1500757oab.26.1703165070807;
        Thu, 21 Dec 2023 05:24:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165070; cv=none;
        d=google.com; s=arc-20160816;
        b=LEVPMlYODyutZ7UAk8khHS54j4+ZceZlxanmQzBCYyjF0Ob3Hq6jCnxwJzpy8Rhyze
         vBo/G25aNlRON53F6WcPrHWWEiB4bAP7GU4kz/Jb6wmoE5CU1BX49Zj6GBg2A8NFe4W7
         pcLyZJXdQH2DZbF9J05XAEK8zTaUakWQRjNBNPGFpZh8da2etRMmAbVcpu9zm47sRQDU
         lMdMydZslFMUqLlNQWfOIxgSZ101KQV8Q9YPiAYDXM6UEPLbqfPIGZFmwUbtgbWmOKs8
         a/EYRHcizf0CM5KPlYnkAhRZW6sftdJ1vJnI6HXxNdYlsOw6LrC83u9UwurnTqwM7hgK
         aSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=olD3T/QV23+TKJj5arxyYZMtekm0FgsWq7ks/IvQ0w8=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=GBlHwj2w6Gb3jGQ8eqppGuwUdq9HGWsm0Eql0yPnDG/85qJMJqGF0IOeq/1AJyJLFB
         IGMnh9l76PS6ZKco6hAsMozr14UU3DmLC6EjiPQgUB10jzVoP/F/ifDXjdJYZnBClxVR
         mOr4p3mAFsC5oofnA8ue1M0gNpwkH3PoXcb+SnkvZ/M3nIfsayWt+jgVWBpHttTJdBFm
         LzAauWkK0ur91yhT1b4LD2BLCHYrykFgSMfsSnHqtZtM9KMqIXiscm3xy0i18LyrP8yj
         mCQhRhaSuGD8Qtmz9l4wQ2D/W1YvTcILCWlJ9U0hfqns+qryZDMtlxjH8lfEzkH1PhNF
         LeWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id g18-20020ae9e112000000b00780d97179d9si2136180qkm.110.2023.12.21.05.24.30
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:24:30 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-Cdw0BrSlOpadKQKb82qNNg-1; Thu,
 21 Dec 2023 08:24:29 -0500
X-MC-Unique: Cdw0BrSlOpadKQKb82qNNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8B253C0BE4E
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:24:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id E574FC15A0C; Thu, 21 Dec 2023 13:24:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0320CC159B0;
	Thu, 21 Dec 2023 13:24:25 +0000 (UTC)
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
Subject: [PATCH v5 06/40] netfs, fscache: Move /proc/fs/fscache to /proc/fs/netfs and put in a symlink
Date: Thu, 21 Dec 2023 13:23:01 +0000
Message-ID: <20231221132400.1601991-7-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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

Rename /proc/fs/fscache to "netfs" and make a symlink from fscache to that.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: Christian Brauner <christian@brauner.io>
cc: linux-fsdevel@vger.kernel.org
cc: linux-cachefs@redhat.com
---

Notes:
    Changes
    =======
    ver #5)
     - fscache_init/exit() should depend on CONFIG_FSCACHE, not CONFIG_PROC_FS.

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
index 43769ac606e8..3f6e22229433 100644
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
+#ifdef CONFIG_FSCACHE
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

