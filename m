Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0591878D3F1
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Aug 2023 10:23:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693383794;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nc4BEpREbpLLz4JeyCBFCIZywF1Qkd8eu9CJXzITWTY=;
	b=i78/Rt8h1KHdnc8/xKwMRYTkBDuLY9CMiExf9SjEfQ98VsddvB33X0d/9Q/pFH652L9b4J
	u5VxnEDZ5JHBhZE+Fg2YLYqWGjby7iyHg5PdWbwYg+a6RuFn0vZ4Uv23XriZk9SCplyRZw
	fAhAg1hkTTUAODsgkpxxRCrqae9Prq0=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-MSAQNJMTOkaQxsm2-C_Q-A-1; Wed, 30 Aug 2023 04:23:11 -0400
X-MC-Unique: MSAQNJMTOkaQxsm2-C_Q-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59A7038008D0;
	Wed, 30 Aug 2023 08:23:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F7C96466B;
	Wed, 30 Aug 2023 08:23:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5692E1946A4A;
	Wed, 30 Aug 2023 08:22:58 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5D8F119465A8 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:02:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 47024C1602B; Fri, 25 Aug 2023 14:02:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E86FC1602E
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 14:02:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A9DE800270
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 14:02:06 +0000 (UTC)
Received: from out-244.mta1.migadu.com (out-244.mta1.migadu.com
 [95.215.58.244]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-PprLV6r7NJi08N-SPgZ1rA-1; Fri, 25 Aug 2023 10:02:01 -0400
X-MC-Unique: PprLV6r7NJi08N-SPgZ1rA-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:17 +0800
Message-Id: <20230825135431.1317785-16-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Wed, 30 Aug 2023 08:22:42 +0000
Subject: [Linux-cachefs] [PATCH 15/29] xfs: don't wait for free space in
 xlog_grant_head_check() in nowait case
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bpf@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-btrfs@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Hao Xu <howeyxu@tencent.com>

Don't sleep and wait for more space for a log ticket in
xlog_grant_head_check() when it is in nowait case.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_log.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/xfs/xfs_log.c b/fs/xfs/xfs_log.c
index 90fbb1c0eca2..a2aabdd42a29 100644
--- a/fs/xfs/xfs_log.c
+++ b/fs/xfs/xfs_log.c
@@ -341,7 +341,8 @@ xlog_grant_head_check(
 	struct xlog		*log,
 	struct xlog_grant_head	*head,
 	struct xlog_ticket	*tic,
-	int			*need_bytes)
+	int			*need_bytes,
+	bool			nowait)
 {
 	int			free_bytes;
 	int			error = 0;
@@ -360,13 +361,15 @@ xlog_grant_head_check(
 		spin_lock(&head->lock);
 		if (!xlog_grant_head_wake(log, head, &free_bytes) ||
 		    free_bytes < *need_bytes) {
-			error = xlog_grant_head_wait(log, head, tic,
-						     *need_bytes);
+			error = nowait ?
+				-EAGAIN : xlog_grant_head_wait(log, head, tic,
+							       *need_bytes);
 		}
 		spin_unlock(&head->lock);
 	} else if (free_bytes < *need_bytes) {
 		spin_lock(&head->lock);
-		error = xlog_grant_head_wait(log, head, tic, *need_bytes);
+		error = nowait ? -EAGAIN : xlog_grant_head_wait(log, head, tic,
+								*need_bytes);
 		spin_unlock(&head->lock);
 	}
 
@@ -428,7 +431,7 @@ xfs_log_regrant(
 	trace_xfs_log_regrant(log, tic);
 
 	error = xlog_grant_head_check(log, &log->l_write_head, tic,
-				      &need_bytes);
+				      &need_bytes, false);
 	if (error)
 		goto out_error;
 
@@ -487,7 +490,7 @@ xfs_log_reserve(
 	trace_xfs_log_reserve(log, tic);
 
 	error = xlog_grant_head_check(log, &log->l_reserve_head, tic,
-				      &need_bytes);
+				      &need_bytes, nowait);
 	if (error)
 		goto out_error;
 
-- 
2.25.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

