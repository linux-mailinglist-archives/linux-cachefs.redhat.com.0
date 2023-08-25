Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABB878D410
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Aug 2023 10:23:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693383834;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0XgR0TECglT4xzrtJoDLZQ95eqK6na9ejXpDmX+Uvoo=;
	b=atrARxshR0OcCozKEiRsDqCvk5fK/5RbnygZSPV+NYTYeNItmj3+mU9cAo4TX4TzH/+E2Z
	04QBCk5KUv+aweINelFfrUjb5mkj2sOIUUnp11INpG2Uw/l8iwJbKJl60BneAs9mBo4lik
	mCy3tegfhxqsr2bxdtKDHpUBSXmtmko=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-9SwGLeBAMlawj9YsakPDBw-1; Wed, 30 Aug 2023 04:23:51 -0400
X-MC-Unique: 9SwGLeBAMlawj9YsakPDBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91C41101A528;
	Wed, 30 Aug 2023 08:23:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88D151121315;
	Wed, 30 Aug 2023 08:23:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BBA3E19465A3;
	Wed, 30 Aug 2023 08:23:29 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 34D7819465B1 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:06:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DC8812166B28; Fri, 25 Aug 2023 14:06:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4B172166B26
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 14:06:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B715B1C0755B
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 14:06:11 +0000 (UTC)
Received: from out-244.mta1.migadu.com (out-244.mta1.migadu.com
 [95.215.58.244]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-XHPXNOW-MCWFg5vOlz55eA-1; Fri, 25 Aug 2023 10:06:09 -0400
X-MC-Unique: XHPXNOW-MCWFg5vOlz55eA-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:30 +0800
Message-Id: <20230825135431.1317785-29-hao.xu@linux.dev>
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
Subject: [Linux-cachefs] [PATCH 28/29] xfs: support nowait semantics for
 xc_ctx_lock in xlog_cil_commit()
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

Apply trylock logic for xc_ctx_lock in xlog_cil_commit() in nowait
case and error out -EAGAIN for xlog_cil_commit().

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_log_cil.c  | 12 ++++++++++--
 fs/xfs/xfs_log_priv.h |  2 +-
 fs/xfs/xfs_trans.c    |  4 +++-
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/xfs_log_cil.c b/fs/xfs/xfs_log_cil.c
index b31830ee36dd..6d054359bbb5 100644
--- a/fs/xfs/xfs_log_cil.c
+++ b/fs/xfs/xfs_log_cil.c
@@ -1613,7 +1613,7 @@ xlog_cil_process_intents(
  * background commit, returns without it held once background commits are
  * allowed again.
  */
-void
+int
 xlog_cil_commit(
 	struct xlog		*log,
 	struct xfs_trans	*tp,
@@ -1623,6 +1623,7 @@ xlog_cil_commit(
 	struct xfs_cil		*cil = log->l_cilp;
 	struct xfs_log_item	*lip, *next;
 	uint32_t		released_space = 0;
+	bool			nowait = tp->t_flags & XFS_TRANS_NOWAIT;
 
 	/*
 	 * Do all necessary memory allocation before we lock the CIL.
@@ -1632,7 +1633,12 @@ xlog_cil_commit(
 	xlog_cil_alloc_shadow_bufs(log, tp);
 
 	/* lock out background commit */
-	down_read(&cil->xc_ctx_lock);
+	if (nowait) {
+		if (!down_read_trylock(&cil->xc_ctx_lock))
+			return -EAGAIN;
+	} else {
+		down_read(&cil->xc_ctx_lock);
+	}
 
 	if (tp->t_flags & XFS_TRANS_HAS_INTENT_DONE)
 		released_space = xlog_cil_process_intents(cil, tp);
@@ -1668,6 +1674,8 @@ xlog_cil_commit(
 
 	/* xlog_cil_push_background() releases cil->xc_ctx_lock */
 	xlog_cil_push_background(log);
+
+	return 0;
 }
 
 /*
diff --git a/fs/xfs/xfs_log_priv.h b/fs/xfs/xfs_log_priv.h
index 41edaa0ae869..eb7a1241deab 100644
--- a/fs/xfs/xfs_log_priv.h
+++ b/fs/xfs/xfs_log_priv.h
@@ -580,7 +580,7 @@ int	xlog_cil_init(struct xlog *log);
 void	xlog_cil_init_post_recovery(struct xlog *log);
 void	xlog_cil_destroy(struct xlog *log);
 bool	xlog_cil_empty(struct xlog *log);
-void	xlog_cil_commit(struct xlog *log, struct xfs_trans *tp,
+int	xlog_cil_commit(struct xlog *log, struct xfs_trans *tp,
 			xfs_csn_t *commit_seq, bool regrant);
 void	xlog_cil_set_ctx_write_state(struct xfs_cil_ctx *ctx,
 			struct xlog_in_core *iclog);
diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
index f1f84a3dd456..e5beda636a37 100644
--- a/fs/xfs/xfs_trans.c
+++ b/fs/xfs/xfs_trans.c
@@ -1037,7 +1037,9 @@ __xfs_trans_commit(
 		xfs_trans_apply_sb_deltas(tp);
 	xfs_trans_apply_dquot_deltas(tp);
 
-	xlog_cil_commit(log, tp, &commit_seq, regrant);
+	error = xlog_cil_commit(log, tp, &commit_seq, regrant);
+	if (error)
+		goto out_unreserve;
 
 	xfs_trans_free(tp);
 
-- 
2.25.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

