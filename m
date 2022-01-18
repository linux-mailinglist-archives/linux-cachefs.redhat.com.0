Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6591B492695
	for <lists+linux-cachefs@lfdr.de>; Tue, 18 Jan 2022 14:12:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-U2i-O9xxPa2XJDbqxoLndQ-1; Tue, 18 Jan 2022 08:12:37 -0500
X-MC-Unique: U2i-O9xxPa2XJDbqxoLndQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE9AC102C87E;
	Tue, 18 Jan 2022 13:12:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF8E481C1A;
	Tue, 18 Jan 2022 13:12:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 663444BB7B;
	Tue, 18 Jan 2022 13:12:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IDCV2F010061 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 08:12:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C32462026976; Tue, 18 Jan 2022 13:12:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF26F202660C
	for <linux-cachefs@redhat.com>; Tue, 18 Jan 2022 13:12:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD3E785A5A8
	for <linux-cachefs@redhat.com>; Tue, 18 Jan 2022 13:12:28 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
	(out30-57.freemail.mail.aliyun.com [115.124.30.57]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-15-GWkypBlhM_2yAIDwhX9F9w-1; Tue, 18 Jan 2022 08:12:26 -0500
X-MC-Unique: GWkypBlhM_2yAIDwhX9F9w-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R541e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V2CR7xO_1642511541
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V2CR7xO_1642511541) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 18 Jan 2022 21:12:22 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Tue, 18 Jan 2022 21:12:00 +0800
Message-Id: <20220118131216.85338-5-jefflexu@linux.alibaba.com>
In-Reply-To: <20220118131216.85338-1-jefflexu@linux.alibaba.com>
References: <20220118131216.85338-1-jefflexu@linux.alibaba.com>
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
Subject: [Linux-cachefs] [PATCH v2 04/20] cachefiles: extract generic daemon
	write function
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

... so that the following new devnode can reuse most of the code when
implementing its .write() callback.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/daemon.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 7ac04ee2c0a0..aa2e5e354afb 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -209,10 +209,11 @@ static ssize_t cachefiles_daemon_read(struct file *file, char __user *_buffer,
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
@@ -261,7 +262,7 @@ static ssize_t cachefiles_daemon_write(struct file *file,
 	}
 
 	/* run the appropriate command handler */
-	for (cmd = cachefiles_daemon_cmds; cmd->name[0]; cmd++)
+	for (cmd = cmds; cmd->name[0]; cmd++)
 		if (strcmp(cmd->name, data) == 0)
 			goto found_command;
 
@@ -284,6 +285,15 @@ static ssize_t cachefiles_daemon_write(struct file *file,
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

