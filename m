Return-Path: <linux-cachefs+bncBDLIXLMFVAERBGPPZCVQMGQEYLSHQJQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 45295809341
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:22:34 +0100 (CET)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1fb1c742f0bsf2534374fac.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:22:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984153; cv=pass;
        d=google.com; s=arc-20160816;
        b=uXKc6D0c47jfuhmml/hQy3hMyt0+iyILH6aqKqMjYfAbzOrl+o64lDl4RuulAfWUJY
         oEgJD4whD6w7Qt51sp8OEXw0p/iqI6fdn2+Zr4ns0/E4pFeMJ4XjVOPmrKBzKWNH551o
         D5JO1NFnrYGyuZMGzf04U/RYLLdV5gEkccojp3eBsQ3jvDLtrRnDRHHblU5CXpuSJA+L
         GGIGhdQF3RKk37p2eiu5auORS8gv4zQkEdUk6VIxl/E9eR7tGOoCP2Z8NR4DA1dTOJzN
         Bueje9aWt6h/UZdRJWQjXdpJI5GJcmC4X5Gxlxbj4e44//hJ/5jg1HqjMt0YxUo8K/XZ
         teyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=e+7uYtAlWEuzt04FblWk4tIk+UtTWYsLZAkAGYrIKa8=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=LijwFR0LZd/4vjk+ip2eZRs/eRsimdMjBkkdMFqpV+RpiwpE9K3nvldZqsTPgmcrQL
         Fq/3LALd1sFDOKhX3NvufEW/40rUXI9sEQldcTqwE1vXaUNfeLh1pz//nXUk5HDkZ0cK
         yUx9aOuY+COYf6aQFpf76VRpME3v3EjZGIqjyzHQto5q5aaGdCH90SaCWBALVR7QI/m/
         IcfQDIpjLirCPiBTcwFVQJMhLshXl4PLwJXdJ5Hvqxh7zmWBhh9ep8AEX3tFsqWG9rsL
         68l86S8kwRiw8kCg+rLRO/J8QekNHEPnm1FFgnNiTlZiCDaMd52KvwW3M7njFkJRV+ek
         zz8g==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984153; x=1702588953;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+7uYtAlWEuzt04FblWk4tIk+UtTWYsLZAkAGYrIKa8=;
        b=Tqm/AGbEkNmsdAdRNq/Ow/QCyatFVc8BXoWBYyKMD4pQJpUFBZgMUw+srDE2qB3B27
         YOssUCkjOX+oIi5LzZT++j0Iar34H0xqGZRJRQb3vWFT2odJfZfMp3poviOIkZeRXCVM
         l6cFzxpgb5YCTWb9gBR7KQ2hoL9JzxQzvOaQTOYCzr1Gs+LaQgg6BZKBXwmZSwUVIHVZ
         ZCgM6McggLgaCY4LFuT0mkVgjptgwykP1qS7JoEzCTOiH8DtZEjeAV+yrhcfPnny4aZv
         s4xqcXdeTgAYGMyFnYVRKTwSFYhiISz7EuKglaZxn+dzt5d+T3cFTWp1QFx/EiOESjcM
         lDSQ==
X-Gm-Message-State: AOJu0Yw7jAwG7t1/LH5b1mhbNBnULBtPhMNW3zcdImwNMyeEMRi8Vtd4
	Ud5VDiTVIgBBDHyS7Dnn3ejfdw==
X-Google-Smtp-Source: AGHT+IFYWRfwxNskDv+h+bkfSXj9Em3G1dRvsy04Ab0+oPLWvRwnSqGpv70nA+dI8N4/ReQ6TfZF0g==
X-Received: by 2002:a05:6870:1712:b0:1f9:fa19:75e3 with SMTP id h18-20020a056870171200b001f9fa1975e3mr3847100oae.50.1701984153128;
        Thu, 07 Dec 2023 13:22:33 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:be9a:b0:1fb:38af:b153 with SMTP id
 nx26-20020a056870be9a00b001fb38afb153ls916023oab.0.-pod-prod-02-us; Thu, 07
 Dec 2023 13:22:32 -0800 (PST)
X-Received: by 2002:a05:6808:20a1:b0:3b9:dab0:dea3 with SMTP id s33-20020a05680820a100b003b9dab0dea3mr2293761oiw.3.1701984152587;
        Thu, 07 Dec 2023 13:22:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984152; cv=none;
        d=google.com; s=arc-20160816;
        b=Qcp5vkYv9bI++emSM441hGBntTB8RjINkOtz+wz6bK14GJQBDexRGeheJ0riVsWf7Z
         sVNfqKKOtYTgyCA2uLbYhW9a5rjnvsLsCQNRBYuZyFJvzYyQFOjkIaE8+vS82aKEy8bD
         Epv8CamBzb7kkDoO9eLrf4AbRgw06TcUcFD5SAz7Iy5Ju1WcwnNY+8MBHceZLU4HPvpU
         zaRQyUv5NfGd3g+D5+OeGRhPHALCVb+1l/KeGqarY9dX1hWkwHs0r1YJy8RmLpxC4Ihf
         JzKU9A9RXfCkN8yZYnI6TZDez6qAtHhFviDWi/TWZeYkdTfhXSSlExqaoNI9oAvU/oex
         QZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Xqq79jY95IXblzWTsHO1+WeGcio5Fxlavb7x6El1ZTM=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=VE1kJT9X2p8Yr+CZOcbGg2A2Qp7N/ksITnCjPx9pH1xtmyl3z/4l45Tqh4yNAAiIgi
         yLoLkbetK3xeFaxcyfKIruRuEeEjnOxH1Cofgcrz3Lb3atlpC/86OaGXwhchkMPKWJcD
         ikCc2Y0UgdQG1u9LT/GtTX2wOgAv8w3Mf5DUYq/OT4TCV2DdHe9Axg1USTRwmZVBwmYm
         z5/i5qHII2TSSsPlp/hABqiiAoK9Xqg9VX8h14HKEyNNEnl4QZ/39ea8x+qEUiEceYDE
         jvJ0OQjpeZFB43c4yUKYEPYols+ftPa4y01u+wQuNqP1FVmJYqF7g3PY3IIGPKVcOy2g
         +lhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id 18-20020a05620a04d200b0077dca498345si520243qks.719.2023.12.07.13.22.32
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:22:32 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-197-tdKOaSsUNe2Y9klkqIDuCQ-1; Thu,
 07 Dec 2023 16:22:27 -0500
X-MC-Unique: tdKOaSsUNe2Y9klkqIDuCQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FC863813BD1
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:22:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 394228CD2; Thu,  7 Dec 2023 21:22:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9934F8CD0;
	Thu,  7 Dec 2023 21:22:22 +0000 (UTC)
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
Subject: [PATCH v3 04/59] netfs, fscache: Move /proc/fs/fscache to /proc/fs/netfs and put in a symlink
Date: Thu,  7 Dec 2023 21:21:11 +0000
Message-ID: <20231207212206.1379128-5-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
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
 fs/netfs/main.c          | 34 ++++++++++++++++++++++++++++++++++
 fs/netfs/stats.c         | 13 +++++++------
 include/linux/netfs.h    |  1 -
 7 files changed, 63 insertions(+), 32 deletions(-)

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
index dc764b98c7f0..3e6e6a2c0375 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -76,6 +76,7 @@ extern atomic_t netfs_n_rh_write_done;
 extern atomic_t netfs_n_rh_write_failed;
 extern atomic_t netfs_n_rh_write_zskip;
 
+int netfs_stats_show(struct seq_file *m, void *v);
 
 static inline void netfs_stat(atomic_t *stat)
 {
@@ -168,6 +169,13 @@ static inline void fscache_see_cookie(struct fscache_cookie *cookie,
 extern unsigned fscache_debug;
 
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
@@ -218,12 +226,14 @@ static inline void fscache_stat_d(atomic_t *stat)
 
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
index 068568702957..c9af6e0896d3 100644
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
@@ -18,3 +20,35 @@ MODULE_LICENSE("GPL");
 unsigned netfs_debug;
 module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
 MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
+
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

