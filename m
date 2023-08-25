Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD1078D3FC
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Aug 2023 10:23:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693383811;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PNPR7BVYR6V3s8btVwFmmF08STU8GR0Q4JZbm5KCCs8=;
	b=XMyj3bWkqXM0gxmgPfFD+P24vN8ER+b2fH8HJSQBcH/ItyWUPvsbZk28XC8TwssI+A665K
	rvgAE6cBCMRfvHt+vKtaiujAVay1jNsllv1CtYKz+yUNYqxzPh0cp4Gcwf8mf1w5+NWaL6
	IIZvVQldBxCtWiQ2/qOCJMiuk+V6PhY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-JWFUFALxNdqWOMEagu-o8w-1; Wed, 30 Aug 2023 04:23:25 -0400
X-MC-Unique: JWFUFALxNdqWOMEagu-o8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B8BD8087B9;
	Wed, 30 Aug 2023 08:23:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32D2640C2071;
	Wed, 30 Aug 2023 08:23:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3A84E1946A78;
	Wed, 30 Aug 2023 08:23:19 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8D1BF19465A8 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:03:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7A29040D283A; Fri, 25 Aug 2023 14:03:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7261140D2839
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 14:03:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3877F38008BA
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 14:03:34 +0000 (UTC)
Received: from out-246.mta1.migadu.com (out-246.mta1.migadu.com
 [95.215.58.246]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-POTFKMJ7PuOLXlF9CHHmBA-1; Fri, 25 Aug 2023 10:03:32 -0400
X-MC-Unique: POTFKMJ7PuOLXlF9CHHmBA-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:04 +0800
Message-Id: <20230825135431.1317785-3-hao.xu@linux.dev>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Wed, 30 Aug 2023 08:22:42 +0000
Subject: [Linux-cachefs] [PATCH 02/29] xfs: rename XBF_TRYLOCK to XBF_NOWAIT
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Hao Xu <howeyxu@tencent.com>

XBF_TRYLOCK means we need lock but don't block on it, we can use it to
stand for not waiting for memory allcation. Rename XBF_TRYLOCK to
XBF_NOWAIT, which is more generic.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/libxfs/xfs_alloc.c       | 2 +-
 fs/xfs/libxfs/xfs_attr_remote.c | 2 +-
 fs/xfs/libxfs/xfs_btree.c       | 2 +-
 fs/xfs/scrub/repair.c           | 2 +-
 fs/xfs/xfs_buf.c                | 6 +++---
 fs/xfs/xfs_buf.h                | 4 ++--
 fs/xfs/xfs_dquot.c              | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_alloc.c b/fs/xfs/libxfs/xfs_alloc.c
index 3069194527dd..a75b9298faa8 100644
--- a/fs/xfs/libxfs/xfs_alloc.c
+++ b/fs/xfs/libxfs/xfs_alloc.c
@@ -3183,7 +3183,7 @@ xfs_alloc_read_agf(
 	ASSERT((flags & (XFS_ALLOC_FLAG_FREEING | XFS_ALLOC_FLAG_TRYLOCK)) !=
 			(XFS_ALLOC_FLAG_FREEING | XFS_ALLOC_FLAG_TRYLOCK));
 	error = xfs_read_agf(pag, tp,
-			(flags & XFS_ALLOC_FLAG_TRYLOCK) ? XBF_TRYLOCK : 0,
+			(flags & XFS_ALLOC_FLAG_TRYLOCK) ? XBF_NOWAIT : 0,
 			&agfbp);
 	if (error)
 		return error;
diff --git a/fs/xfs/libxfs/xfs_attr_remote.c b/fs/xfs/libxfs/xfs_attr_remote.c
index d440393b40eb..2ccb0867824c 100644
--- a/fs/xfs/libxfs/xfs_attr_remote.c
+++ b/fs/xfs/libxfs/xfs_attr_remote.c
@@ -661,7 +661,7 @@ xfs_attr_rmtval_invalidate(
 			return error;
 		if (XFS_IS_CORRUPT(args->dp->i_mount, nmap != 1))
 			return -EFSCORRUPTED;
-		error = xfs_attr_rmtval_stale(args->dp, &map, XBF_TRYLOCK);
+		error = xfs_attr_rmtval_stale(args->dp, &map, XBF_NOWAIT);
 		if (error)
 			return error;
 
diff --git a/fs/xfs/libxfs/xfs_btree.c b/fs/xfs/libxfs/xfs_btree.c
index 6a6503ab0cd7..77c4f1d83475 100644
--- a/fs/xfs/libxfs/xfs_btree.c
+++ b/fs/xfs/libxfs/xfs_btree.c
@@ -1343,7 +1343,7 @@ xfs_btree_read_buf_block(
 	int			error;
 
 	/* need to sort out how callers deal with failures first */
-	ASSERT(!(flags & XBF_TRYLOCK));
+	ASSERT(!(flags & XBF_NOWAIT));
 
 	error = xfs_btree_ptr_to_daddr(cur, ptr, &d);
 	if (error)
diff --git a/fs/xfs/scrub/repair.c b/fs/xfs/scrub/repair.c
index ac6d8803e660..9312cf3b20e2 100644
--- a/fs/xfs/scrub/repair.c
+++ b/fs/xfs/scrub/repair.c
@@ -460,7 +460,7 @@ xrep_invalidate_block(
 
 	error = xfs_buf_incore(sc->mp->m_ddev_targp,
 			XFS_FSB_TO_DADDR(sc->mp, fsbno),
-			XFS_FSB_TO_BB(sc->mp, 1), XBF_TRYLOCK, &bp);
+			XFS_FSB_TO_BB(sc->mp, 1), XBF_NOWAIT, &bp);
 	if (error)
 		return 0;
 
diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 15d1e5a7c2d3..9f84bc3b802c 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -228,7 +228,7 @@ _xfs_buf_alloc(
 	 * We don't want certain flags to appear in b_flags unless they are
 	 * specifically set by later operations on the buffer.
 	 */
-	flags &= ~(XBF_UNMAPPED | XBF_TRYLOCK | XBF_ASYNC | XBF_READ_AHEAD);
+	flags &= ~(XBF_UNMAPPED | XBF_NOWAIT | XBF_ASYNC | XBF_READ_AHEAD);
 
 	atomic_set(&bp->b_hold, 1);
 	atomic_set(&bp->b_lru_ref, 1);
@@ -543,7 +543,7 @@ xfs_buf_find_lock(
 	struct xfs_buf          *bp,
 	xfs_buf_flags_t		flags)
 {
-	if (flags & XBF_TRYLOCK) {
+	if (flags & XBF_NOWAIT) {
 		if (!xfs_buf_trylock(bp)) {
 			XFS_STATS_INC(bp->b_mount, xb_busy_locked);
 			return -EAGAIN;
@@ -886,7 +886,7 @@ xfs_buf_readahead_map(
 	struct xfs_buf		*bp;
 
 	xfs_buf_read_map(target, map, nmaps,
-		     XBF_TRYLOCK | XBF_ASYNC | XBF_READ_AHEAD, &bp, ops,
+		     XBF_NOWAIT | XBF_ASYNC | XBF_READ_AHEAD, &bp, ops,
 		     __this_address);
 }
 
diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
index 549c60942208..8cd307626939 100644
--- a/fs/xfs/xfs_buf.h
+++ b/fs/xfs/xfs_buf.h
@@ -45,7 +45,7 @@ struct xfs_buf;
 
 /* flags used only as arguments to access routines */
 #define XBF_INCORE	 (1u << 29)/* lookup only, return if found in cache */
-#define XBF_TRYLOCK	 (1u << 30)/* lock requested, but do not wait */
+#define XBF_NOWAIT	 (1u << 30)/* mem/lock requested, but do not wait */
 #define XBF_UNMAPPED	 (1u << 31)/* do not map the buffer */
 
 
@@ -68,7 +68,7 @@ typedef unsigned int xfs_buf_flags_t;
 	{ _XBF_DELWRI_Q,	"DELWRI_Q" }, \
 	/* The following interface flags should never be set */ \
 	{ XBF_INCORE,		"INCORE" }, \
-	{ XBF_TRYLOCK,		"TRYLOCK" }, \
+	{ XBF_NOWAIT,		"NOWAIT" }, \
 	{ XBF_UNMAPPED,		"UNMAPPED" }
 
 /*
diff --git a/fs/xfs/xfs_dquot.c b/fs/xfs/xfs_dquot.c
index 7f071757f278..5bc01ed4b2d7 100644
--- a/fs/xfs/xfs_dquot.c
+++ b/fs/xfs/xfs_dquot.c
@@ -1233,7 +1233,7 @@ xfs_qm_dqflush(
 	 * Get the buffer containing the on-disk dquot
 	 */
 	error = xfs_trans_read_buf(mp, NULL, mp->m_ddev_targp, dqp->q_blkno,
-				   mp->m_quotainfo->qi_dqchunklen, XBF_TRYLOCK,
+				   mp->m_quotainfo->qi_dqchunklen, XBF_NOWAIT,
 				   &bp, &xfs_dquot_buf_ops);
 	if (error == -EAGAIN)
 		goto out_unlock;
-- 
2.25.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

