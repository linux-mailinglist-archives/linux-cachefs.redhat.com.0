Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1142246FBC4
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 08:37:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-W5SxTg03NvaU6KrsD59vwQ-1; Fri, 10 Dec 2021 02:37:06 -0500
X-MC-Unique: W5SxTg03NvaU6KrsD59vwQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 209D6100C661;
	Fri, 10 Dec 2021 07:37:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCF21196F1;
	Fri, 10 Dec 2021 07:37:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9F4D4BB7C;
	Fri, 10 Dec 2021 07:37:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BA7aYfZ027797 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 10 Dec 2021 02:36:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2CA8F53A9; Fri, 10 Dec 2021 07:36:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27C4253A8
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91FDC185A7BA
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:28 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
	(out30-56.freemail.mail.aliyun.com [115.124.30.56]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-412-VUfIxWQVM0y9xrq2P_D4BQ-1; Fri, 10 Dec 2021 02:36:26 -0500
X-MC-Unique: VUfIxWQVM0y9xrq2P_D4BQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1;
	HT=alimailimapcm10staff010182156082;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V-8E0Od_1639121780
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V-8E0Od_1639121780) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 10 Dec 2021 15:36:21 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 10 Dec 2021 15:36:01 +0800
Message-Id: <20211210073619.21667-2-jefflexu@linux.alibaba.com>
In-Reply-To: <20211210073619.21667-1-jefflexu@linux.alibaba.com>
References: <20211210073619.21667-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [RFC 01/19] cachefiles: add mode command
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

fscache/cachefiles used to serve as a local cache for remote fs.
This patch set introduces a new use case, in which local read-only
fs could implement demand read with fscache.

Thus 'mode' field is used to distinguish which mode cachefiles works in.
User daemon could set the specified mode with 'mode' command. If user
daemon doesn't ever explicitly set the mode, then cachefiles serves as
the local cache for remote fs by default.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/daemon.c   | 35 +++++++++++++++++++++++++++++++++++
 fs/cachefiles/internal.h |  6 ++++++
 2 files changed, 41 insertions(+)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 40a792421fc1..951963e72b44 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -41,6 +41,7 @@ static int cachefiles_daemon_dir(struct cachefiles_cache *, char *);
 static int cachefiles_daemon_inuse(struct cachefiles_cache *, char *);
 static int cachefiles_daemon_secctx(struct cachefiles_cache *, char *);
 static int cachefiles_daemon_tag(struct cachefiles_cache *, char *);
+static int cachefiles_daemon_mode(struct cachefiles_cache *, char *);
 static int cachefiles_daemon_bind(struct cachefiles_cache *, char *);
 static void cachefiles_daemon_unbind(struct cachefiles_cache *);
 
@@ -75,6 +76,7 @@ static const struct cachefiles_daemon_cmd cachefiles_daemon_cmds[] = {
 	{ "inuse",	cachefiles_daemon_inuse		},
 	{ "secctx",	cachefiles_daemon_secctx	},
 	{ "tag",	cachefiles_daemon_tag		},
+	{ "mode",	cachefiles_daemon_mode		},
 	{ "",		NULL				}
 };
 
@@ -663,6 +665,39 @@ static int cachefiles_daemon_inuse(struct cachefiles_cache *cache, char *args)
 	return -EINVAL;
 }
 
+/*
+ * Set the cache mode
+ * - command: "mode cache|demand"
+ */
+static int cachefiles_daemon_mode(struct cachefiles_cache *cache, char *args)
+{
+	enum cachefiles_mode mode;
+
+	_enter(",%s", args);
+
+	if (test_bit(CACHEFILES_READY, &cache->flags)) {
+		pr_err("Cache already started\n");
+		return -EINVAL;
+	}
+
+	if (!*args) {
+		pr_err("Empty mode specified\n");
+		return -EINVAL;
+	}
+
+	if (!strncmp(args, "cache", strlen("cache"))) {
+		mode = CACHEFILES_MODE_CACHE;
+	} else if (!strncmp(args, "demand", strlen("demand"))) {
+		mode = CACHEFILES_MODE_DEMAND;
+	} else {
+		pr_err("Invalid mode specified\n");
+		return -EINVAL;
+	}
+
+	cache->mode = mode;
+	return 0;
+}
+
 /*
  * Bind a directory as a cache
  */
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index f42021b3a0be..1366e4319b4e 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -60,6 +60,11 @@ struct cachefiles_object {
 #define CACHEFILES_OBJECT_USING_TMPFILE	0		/* Have an unlinked tmpfile */
 };
 
+enum cachefiles_mode {
+	CACHEFILES_MODE_CACHE,	/* local cache for netfs (Default) */
+	CACHEFILES_MODE_DEMAND,	/* demand read for read-only fs */
+};
+
 /*
  * Cache files cache definition
  */
@@ -93,6 +98,7 @@ struct cachefiles_cache {
 	sector_t			brun;		/* when to stop culling */
 	sector_t			bcull;		/* when to start culling */
 	sector_t			bstop;		/* when to stop allocating */
+	enum cachefiles_mode		mode;
 	unsigned long			flags;
 #define CACHEFILES_READY		0	/* T if cache prepared */
 #define CACHEFILES_DEAD			1	/* T if cache dead */
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

