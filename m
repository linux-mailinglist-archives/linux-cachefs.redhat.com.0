Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B0147FD30
	for <lists+linux-cachefs@lfdr.de>; Mon, 27 Dec 2021 14:01:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-XSQ1mlqoNHik-mv2s-imGg-1; Mon, 27 Dec 2021 08:01:40 -0500
X-MC-Unique: XSQ1mlqoNHik-mv2s-imGg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 012A436393;
	Mon, 27 Dec 2021 13:01:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE3FD7553C;
	Mon, 27 Dec 2021 13:01:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F2334A7C8;
	Mon, 27 Dec 2021 13:01:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BRD1bo1004271 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 27 Dec 2021 08:01:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3D59EC08096; Mon, 27 Dec 2021 13:01:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 389C0C08092
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 13:01:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C79433C01D82
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 13:01:36 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
	(out30-133.freemail.mail.aliyun.com [115.124.30.133]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-96-Nw7_R81kPtSLJbz6NRcE0g-1; Mon, 27 Dec 2021 08:00:51 -0500
X-MC-Unique: Nw7_R81kPtSLJbz6NRcE0g-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V.wXYWr_1640609710
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V.wXYWr_1640609710) by smtp.aliyun-inc.com(127.0.0.1);
	Mon, 27 Dec 2021 20:55:11 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon, 27 Dec 2021 20:54:43 +0800
Message-Id: <20211227125444.21187-23-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [PATCH v1 22/23] cachefiles: add done command for
	demand read
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Once has prepared data and filled the hole, user daemon could notify
cachefiles backend by writing 'done' command to devnode.

With done command, the id originally readed from devnode is transferred
back to cachefiles backend. This id identifies the position of the
completed request inside the idr tree, and thus cachefiles backend could
find the corresponding completed request once gets notified.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/daemon.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index ce4cc5617dfc..36d0bcf5fc3f 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -48,6 +48,7 @@ static int cachefiles_daemon_tag(struct cachefiles_cache *, char *);
 static int cachefiles_daemon_mode(struct cachefiles_cache *, char *);
 static int cachefiles_daemon_bind(struct cachefiles_cache *, char *);
 static void cachefiles_daemon_unbind(struct cachefiles_cache *);
+static int cachefiles_daemon_done(struct cachefiles_cache *, char *);
 
 static unsigned long cachefiles_open;
 
@@ -91,6 +92,7 @@ static const struct cachefiles_daemon_cmd cachefiles_daemon_cmds[] = {
 	{ "secctx",	cachefiles_daemon_secctx	},
 	{ "tag",	cachefiles_daemon_tag		},
 	{ "mode",	cachefiles_daemon_mode		},
+	{ "done",	cachefiles_daemon_done		},
 	{ "",		NULL				}
 };
 
@@ -604,6 +606,38 @@ static int cachefiles_daemon_tag(struct cachefiles_cache *cache, char *args)
 	return 0;
 }
 
+/*
+ * Request completion
+ * - command: "done <id>"
+ */
+static int cachefiles_daemon_done(struct cachefiles_cache *cache, char *args)
+{
+	unsigned long id;
+	int ret;
+	struct cachefiles_req *req;
+
+	_enter(",%s", args);
+
+	if (!*args) {
+		pr_err("Empty id specified\n");
+		return -EINVAL;
+	}
+
+	ret = kstrtoul(args, 0, &id);
+	if (ret)
+		return ret;
+
+	spin_lock(&cache->reqs_lock);
+	req = idr_remove(&cache->reqs, id);
+	spin_unlock(&cache->reqs_lock);
+	if (!req)
+		return -EINVAL;
+
+	complete(&req->done);
+
+	return 0;
+}
+
 /*
  * Request a node in the cache be culled from the current working directory
  * - command: "cull <name>"
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

