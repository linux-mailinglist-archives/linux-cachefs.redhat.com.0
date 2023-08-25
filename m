Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B900178D3F2
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Aug 2023 10:23:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693383794;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=39xo9BATAcl2HIlq5X02mt4KQHE9b7vZp+GGeN0aUYI=;
	b=Q/u36kdRBR12BpDSzCTLNdOlircYtvjG1YZFia9cg5czQ0TeY8CP9E+FCrfodrusmdObo9
	rBr2HYAD0NoZ15vaK7iw6/B/DOET6W+WbV3zySbduzp/hvYb1FpeegkCVEoZ6/LieAFvu7
	weljgaVqbEpbAuOp3j2zh77qkTxy974=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-tdgIry5POzaHqeh8VluCEA-1; Wed, 30 Aug 2023 04:23:11 -0400
X-MC-Unique: tdgIry5POzaHqeh8VluCEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0605E85CCE0;
	Wed, 30 Aug 2023 08:23:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F10D61121320;
	Wed, 30 Aug 2023 08:23:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7DFA91946A49;
	Wed, 30 Aug 2023 08:23:03 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 930A619465A8 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:01:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6134B2166B28; Fri, 25 Aug 2023 14:01:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CF612166B26
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 14:01:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3212838210AA
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 14:01:27 +0000 (UTC)
Received: from out-253.mta1.migadu.com (out-253.mta1.migadu.com
 [95.215.58.253]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-lelRVpk4NjqJcYu_g-qfwA-1; Fri, 25 Aug 2023 10:01:22 -0400
X-MC-Unique: lelRVpk4NjqJcYu_g-qfwA-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:16 +0800
Message-Id: <20230825135431.1317785-15-hao.xu@linux.dev>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Wed, 30 Aug 2023 08:22:42 +0000
Subject: [Linux-cachefs] [PATCH 14/29] xfs: support nowait for
 xfs_log_reserve()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Hao Xu <howeyxu@tencent.com>

Support nowait logic for xfs_log_reserve(), including add a nowait
boolean parameter and error out -EAGAIN for ticket allocation.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_log.c      | 18 +++++++++++++-----
 fs/xfs/xfs_log.h      |  5 +++--
 fs/xfs/xfs_log_cil.c  |  2 +-
 fs/xfs/xfs_log_priv.h |  2 +-
 fs/xfs/xfs_trans.c    |  5 +++--
 5 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/fs/xfs/xfs_log.c b/fs/xfs/xfs_log.c
index 79004d193e54..90fbb1c0eca2 100644
--- a/fs/xfs/xfs_log.c
+++ b/fs/xfs/xfs_log.c
@@ -462,7 +462,8 @@ xfs_log_reserve(
 	int			unit_bytes,
 	int			cnt,
 	struct xlog_ticket	**ticp,
-	bool			permanent)
+	bool			permanent,
+	bool			nowait)
 {
 	struct xlog		*log = mp->m_log;
 	struct xlog_ticket	*tic;
@@ -475,7 +476,9 @@ xfs_log_reserve(
 	XFS_STATS_INC(mp, xs_try_logspace);
 
 	ASSERT(*ticp == NULL);
-	tic = xlog_ticket_alloc(log, unit_bytes, cnt, permanent);
+	tic = xlog_ticket_alloc(log, unit_bytes, cnt, permanent, nowait);
+	if (!tic)
+		return -EAGAIN;
 	*ticp = tic;
 
 	xlog_grant_push_ail(log, tic->t_cnt ? tic->t_unit_res * tic->t_cnt
@@ -974,7 +977,7 @@ xlog_unmount_write(
 	struct xlog_ticket	*tic = NULL;
 	int			error;
 
-	error = xfs_log_reserve(mp, 600, 1, &tic, 0);
+	error = xfs_log_reserve(mp, 600, 1, &tic, 0, false);
 	if (error)
 		goto out_err;
 
@@ -3527,12 +3530,17 @@ xlog_ticket_alloc(
 	struct xlog		*log,
 	int			unit_bytes,
 	int			cnt,
-	bool			permanent)
+	bool			permanent,
+	bool			nowait)
 {
 	struct xlog_ticket	*tic;
 	int			unit_res;
 
-	tic = kmem_cache_zalloc(xfs_log_ticket_cache, GFP_NOFS | __GFP_NOFAIL);
+	gfp_t			gfp_flags = GFP_NOFS |
+					    (nowait ? 0 : __GFP_NOFAIL);
+	tic = kmem_cache_zalloc(xfs_log_ticket_cache, gfp_flags);
+	if (!tic)
+		return NULL;
 
 	unit_res = xlog_calc_unit_res(log, unit_bytes, &tic->t_iclog_hdrs);
 
diff --git a/fs/xfs/xfs_log.h b/fs/xfs/xfs_log.h
index 2728886c2963..ba515df443c3 100644
--- a/fs/xfs/xfs_log.h
+++ b/fs/xfs/xfs_log.h
@@ -139,8 +139,9 @@ void	xfs_log_mount_cancel(struct xfs_mount *);
 xfs_lsn_t xlog_assign_tail_lsn(struct xfs_mount *mp);
 xfs_lsn_t xlog_assign_tail_lsn_locked(struct xfs_mount *mp);
 void	xfs_log_space_wake(struct xfs_mount *mp);
-int	xfs_log_reserve(struct xfs_mount *mp, int length, int count,
-			struct xlog_ticket **ticket, bool permanent);
+int	xfs_log_reserve(struct xfs_mount *mp, int length,
+			int count, struct xlog_ticket **ticket,
+			bool permanent, bool nowait);
 int	xfs_log_regrant(struct xfs_mount *mp, struct xlog_ticket *tic);
 void	xfs_log_unmount(struct xfs_mount *mp);
 bool	xfs_log_writable(struct xfs_mount *mp);
diff --git a/fs/xfs/xfs_log_cil.c b/fs/xfs/xfs_log_cil.c
index eccbfb99e894..f17c1799b3c4 100644
--- a/fs/xfs/xfs_log_cil.c
+++ b/fs/xfs/xfs_log_cil.c
@@ -37,7 +37,7 @@ xlog_cil_ticket_alloc(
 {
 	struct xlog_ticket *tic;
 
-	tic = xlog_ticket_alloc(log, 0, 1, 0);
+	tic = xlog_ticket_alloc(log, 0, 1, 0, false);
 
 	/*
 	 * set the current reservation to zero so we know to steal the basic
diff --git a/fs/xfs/xfs_log_priv.h b/fs/xfs/xfs_log_priv.h
index 1bd2963e8fbd..41edaa0ae869 100644
--- a/fs/xfs/xfs_log_priv.h
+++ b/fs/xfs/xfs_log_priv.h
@@ -503,7 +503,7 @@ extern __le32	 xlog_cksum(struct xlog *log, struct xlog_rec_header *rhead,
 
 extern struct kmem_cache *xfs_log_ticket_cache;
 struct xlog_ticket *xlog_ticket_alloc(struct xlog *log, int unit_bytes,
-		int count, bool permanent);
+		int count, bool permanent, bool nowait);
 
 void	xlog_print_tic_res(struct xfs_mount *mp, struct xlog_ticket *ticket);
 void	xlog_print_trans(struct xfs_trans *);
diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
index dbec685f4f4a..7988b4c7f36e 100644
--- a/fs/xfs/xfs_trans.c
+++ b/fs/xfs/xfs_trans.c
@@ -155,6 +155,7 @@ xfs_trans_reserve(
 	struct xfs_mount	*mp = tp->t_mountp;
 	int			error = 0;
 	bool			rsvd = (tp->t_flags & XFS_TRANS_RESERVE) != 0;
+	bool			nowait = tp->t_flags & XFS_TRANS_NOWAIT;
 
 	/*
 	 * Attempt to reserve the needed disk blocks by decrementing
@@ -192,8 +193,8 @@ xfs_trans_reserve(
 			error = xfs_log_regrant(mp, tp->t_ticket);
 		} else {
 			error = xfs_log_reserve(mp, resp->tr_logres,
-						resp->tr_logcount,
-						&tp->t_ticket, permanent);
+						resp->tr_logcount, &tp->t_ticket,
+						permanent, nowait);
 		}
 
 		if (error)
-- 
2.25.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

