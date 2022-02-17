Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4D14B9FAF
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Feb 2022 13:06:24 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-Wjrqg9GKNl6EfhGqxr6F3Q-1; Thu, 17 Feb 2022 07:06:20 -0500
X-MC-Unique: Wjrqg9GKNl6EfhGqxr6F3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACDD21898290;
	Thu, 17 Feb 2022 12:06:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0E587B01A;
	Thu, 17 Feb 2022 12:06:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63E091809C88;
	Thu, 17 Feb 2022 12:06:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21HC2CmB026807 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 17 Feb 2022 07:02:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D365A145FBB1; Thu, 17 Feb 2022 12:02:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF64C145FBAF
	for <linux-cachefs@redhat.com>; Thu, 17 Feb 2022 12:02:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B60998BF641
	for <linux-cachefs@redhat.com>; Thu, 17 Feb 2022 12:02:12 +0000 (UTC)
Received: from out199-4.us.a.mail.aliyun.com (out199-4.us.a.mail.aliyun.com
	[47.90.199.4]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-453-y6BMhSLoMrSe8h3XkyAQVA-1; Thu, 17 Feb 2022 07:02:10 -0500
X-MC-Unique: y6BMhSLoMrSe8h3XkyAQVA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
	TI=SMTPD_---0V4kVs6e_1645099318
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V4kVs6e_1645099318) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 17 Feb 2022 20:01:59 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com
Date: Thu, 17 Feb 2022 20:01:53 +0800
Message-Id: <20220217120154.16658-4-jefflexu@linux.alibaba.com>
In-Reply-To: <20220217120154.16658-1-jefflexu@linux.alibaba.com>
References: <20220217120154.16658-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: linux-cachefs@redhat.com
Cc: gregkh@linuxfoundation.org, tao.peng@linux.alibaba.com, willy@infradead.org,
	linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	xiang@kernel.org, gerry@linux.alibaba.com,
	torvalds@linux-foundation.org, eguan@linux.alibaba.com
Subject: [Linux-cachefs] [RESEND PATCH v3 3/4] cachefiles: extract generic
	function for daemon methods
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

... so that the following new devnode can reuse most of the code when
implementing its own methods.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Reviewed-by: Liu Bo <bo.liu@linux.alibaba.com>
---
 fs/cachefiles/daemon.c | 70 +++++++++++++++++++++++++++---------------
 1 file changed, 45 insertions(+), 25 deletions(-)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 7ac04ee2c0a0..6b8d7c5bbe5d 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -78,6 +78,34 @@ static const struct cachefiles_daemon_cmd cachefiles_daemon_cmds[] = {
 	{ "",		NULL				}
 };
 
+static struct cachefiles_cache *cachefiles_daemon_open_cache(void)
+{
+	struct cachefiles_cache *cache;
+
+	/* allocate a cache record */
+	cache = kzalloc(sizeof(struct cachefiles_cache), GFP_KERNEL);
+	if (cache) {
+		mutex_init(&cache->daemon_mutex);
+		init_waitqueue_head(&cache->daemon_pollwq);
+		INIT_LIST_HEAD(&cache->volumes);
+		INIT_LIST_HEAD(&cache->object_list);
+		spin_lock_init(&cache->object_list_lock);
+
+		/* set default caching limits
+		 * - limit at 1% free space and/or free files
+		 * - cull below 5% free space and/or free files
+		 * - cease culling above 7% free space and/or free files
+		 */
+		cache->frun_percent = 7;
+		cache->fcull_percent = 5;
+		cache->fstop_percent = 1;
+		cache->brun_percent = 7;
+		cache->bcull_percent = 5;
+		cache->bstop_percent = 1;
+	}
+
+	return cache;
+}
 
 /*
  * Prepare a cache for caching.
@@ -96,31 +124,13 @@ static int cachefiles_daemon_open(struct inode *inode, struct file *file)
 	if (xchg(&cachefiles_open, 1) == 1)
 		return -EBUSY;
 
-	/* allocate a cache record */
-	cache = kzalloc(sizeof(struct cachefiles_cache), GFP_KERNEL);
+
+	cache = cachefiles_daemon_open_cache();
 	if (!cache) {
 		cachefiles_open = 0;
 		return -ENOMEM;
 	}
 
-	mutex_init(&cache->daemon_mutex);
-	init_waitqueue_head(&cache->daemon_pollwq);
-	INIT_LIST_HEAD(&cache->volumes);
-	INIT_LIST_HEAD(&cache->object_list);
-	spin_lock_init(&cache->object_list_lock);
-
-	/* set default caching limits
-	 * - limit at 1% free space and/or free files
-	 * - cull below 5% free space and/or free files
-	 * - cease culling above 7% free space and/or free files
-	 */
-	cache->frun_percent = 7;
-	cache->fcull_percent = 5;
-	cache->fstop_percent = 1;
-	cache->brun_percent = 7;
-	cache->bcull_percent = 5;
-	cache->bstop_percent = 1;
-
 	file->private_data = cache;
 	cache->cachefilesd = file;
 	return 0;
@@ -209,10 +219,11 @@ static ssize_t cachefiles_daemon_read(struct file *file, char __user *_buffer,
 /*
  * Take a command from cachefilesd, parse it and act on it.
  */
-static ssize_t cachefiles_daemon_write(struct file *file,
-				       const char __user *_data,
-				       size_t datalen,
-				       loff_t *pos)
+static ssize_t cachefiles_daemon_do_write(struct file *file,
+					  const char __user *_data,
+					  size_t datalen,
+					  loff_t *pos,
+			const struct cachefiles_daemon_cmd *cmds)
 {
 	const struct cachefiles_daemon_cmd *cmd;
 	struct cachefiles_cache *cache = file->private_data;
@@ -261,7 +272,7 @@ static ssize_t cachefiles_daemon_write(struct file *file,
 	}
 
 	/* run the appropriate command handler */
-	for (cmd = cachefiles_daemon_cmds; cmd->name[0]; cmd++)
+	for (cmd = cmds; cmd->name[0]; cmd++)
 		if (strcmp(cmd->name, data) == 0)
 			goto found_command;
 
@@ -284,6 +295,15 @@ static ssize_t cachefiles_daemon_write(struct file *file,
 	goto error;
 }
 
+static ssize_t cachefiles_daemon_write(struct file *file,
+				       const char __user *_data,
+				       size_t datalen,
+				       loff_t *pos)
+{
+	return cachefiles_daemon_do_write(file, _data, datalen, pos,
+					  cachefiles_daemon_cmds);
+}
+
 /*
  * Poll for culling state
  * - use EPOLLOUT to indicate culling state
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

