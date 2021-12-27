Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C9B47FD2E
	for <lists+linux-cachefs@lfdr.de>; Mon, 27 Dec 2021 14:01:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-Wyx14nemN8e12ek-My3CiA-1; Mon, 27 Dec 2021 08:01:33 -0500
X-MC-Unique: Wyx14nemN8e12ek-My3CiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D7251006AA4;
	Mon, 27 Dec 2021 13:01:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34DDC7E2FD;
	Mon, 27 Dec 2021 13:01:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCC911832B19;
	Mon, 27 Dec 2021 13:01:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BRD1T7m004228 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 27 Dec 2021 08:01:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 167EA2026D65; Mon, 27 Dec 2021 13:01:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 123DD2026D4D
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 13:01:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B453C101A52D
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 13:01:25 +0000 (UTC)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
	[47.88.44.36]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-480-HUXii9m6NL-XTykAbJrRBA-1; Mon, 27 Dec 2021 08:01:22 -0500
X-MC-Unique: HUXii9m6NL-XTykAbJrRBA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R311e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V.wXYT2_1640609685
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V.wXYT2_1640609685) by smtp.aliyun-inc.com(127.0.0.1);
	Mon, 27 Dec 2021 20:54:46 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon, 27 Dec 2021 20:54:22 +0800
Message-Id: <20211227125444.21187-2-jefflexu@linux.alibaba.com>
In-Reply-To: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [PATCH v1 01/23] cachefiles: add cachefiles_demand
	devnode
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

fscache/cachefiles used to serve as a local cache for remote fs. The
following patches will introduce a new use case, in which local
read-only fs could implement demand reading with fscache. By then the
user daemon needs to read and poll on the devnode, and thus the original
cachefiles devnode can't be reused in this case.

Thus create a new devnode specifically for the new mode. The following
patches will add more file_operations.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/daemon.c   |  8 ++++++++
 fs/cachefiles/internal.h |  1 +
 fs/cachefiles/main.c     | 12 ++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 40a792421fc1..871f1e0f423d 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -56,6 +56,14 @@ const struct file_operations cachefiles_daemon_fops = {
 	.llseek		= noop_llseek,
 };
 
+const struct file_operations cachefiles_demand_fops = {
+	.owner		= THIS_MODULE,
+	.open		= cachefiles_daemon_open,
+	.release	= cachefiles_daemon_release,
+	.write		= cachefiles_daemon_write,
+	.llseek		= noop_llseek,
+};
+
 struct cachefiles_daemon_cmd {
 	char name[8];
 	int (*handler)(struct cachefiles_cache *cache, char *args);
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 421423819d63..e0ed811d628d 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -145,6 +145,7 @@ extern int cachefiles_has_space(struct cachefiles_cache *cache,
  * daemon.c
  */
 extern const struct file_operations cachefiles_daemon_fops;
+extern const struct file_operations cachefiles_demand_fops;
 
 /*
  * error_inject.c
diff --git a/fs/cachefiles/main.c b/fs/cachefiles/main.c
index 3f369c6f816d..0a423274d283 100644
--- a/fs/cachefiles/main.c
+++ b/fs/cachefiles/main.c
@@ -39,6 +39,12 @@ static struct miscdevice cachefiles_dev = {
 	.fops	= &cachefiles_daemon_fops,
 };
 
+static struct miscdevice cachefiles_demand_dev = {
+	.minor	= MISC_DYNAMIC_MINOR,
+	.name	= "cachefiles_demand",
+	.fops	= &cachefiles_demand_fops,
+};
+
 /*
  * initialise the fs caching module
  */
@@ -52,6 +58,9 @@ static int __init cachefiles_init(void)
 	ret = misc_register(&cachefiles_dev);
 	if (ret < 0)
 		goto error_dev;
+	ret = misc_register(&cachefiles_demand_dev);
+	if (ret < 0)
+		goto error_demand_dev;
 
 	/* create an object jar */
 	ret = -ENOMEM;
@@ -68,6 +77,8 @@ static int __init cachefiles_init(void)
 	return 0;
 
 error_object_jar:
+	misc_deregister(&cachefiles_demand_dev);
+error_demand_dev:
 	misc_deregister(&cachefiles_dev);
 error_dev:
 	cachefiles_unregister_error_injection();
@@ -86,6 +97,7 @@ static void __exit cachefiles_exit(void)
 	pr_info("Unloading\n");
 
 	kmem_cache_destroy(cachefiles_object_jar);
+	misc_deregister(&cachefiles_demand_dev);
 	misc_deregister(&cachefiles_dev);
 	cachefiles_unregister_error_injection();
 }
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

