Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8493F78D40C
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Aug 2023 10:23:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693383825;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F3iVj6CdXOpjOggJjUSe6yHewJvterxGmKpKU7ig+rM=;
	b=ZttIA6fr8opUnvBxfcGqMYB2XP6LLCNWaTUG3TEDS5SMwMNR3yCPNt/bGldYl6A1eplEqn
	/tUYvI6xY7Qtix5NK/+lL7oJ8owSf9zfaK4BEfXkdCtT3IZyjL0REFPfv0cub7gipX/1Z0
	GbjeMILWaSayq4MBj7qVR2RumfStlnU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-kpB8WvcBMGiRA4QYWhSn9w-1; Wed, 30 Aug 2023 04:23:42 -0400
X-MC-Unique: kpB8WvcBMGiRA4QYWhSn9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE08785CCE2;
	Wed, 30 Aug 2023 08:23:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E402D2026F70;
	Wed, 30 Aug 2023 08:23:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8C60A19452C6;
	Wed, 30 Aug 2023 08:23:24 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 28EF919465A8 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:05:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 15106140E962; Fri, 25 Aug 2023 14:05:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D4FD140E950
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 14:05:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5E02800270
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 14:05:25 +0000 (UTC)
Received: from out-243.mta1.migadu.com (out-243.mta1.migadu.com
 [95.215.58.243]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-BUj0eIPmON64Tjm2p59YOA-1; Fri, 25 Aug 2023 10:05:23 -0400
X-MC-Unique: BUj0eIPmON64Tjm2p59YOA-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:27 +0800
Message-Id: <20230825135431.1317785-26-hao.xu@linux.dev>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Wed, 30 Aug 2023 08:22:42 +0000
Subject: [Linux-cachefs] [PATCH 25/29] xfs: support nowait for
 xfs_buf_item_init()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Hao Xu <howeyxu@tencent.com>

support nowait for xfs_buf_item_init() and error out -EAGAIN to
_xfs_trans_bjoin() when it would block.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_buf_item.c         |  9 +++++++--
 fs/xfs/xfs_buf_item.h         |  2 +-
 fs/xfs/xfs_buf_item_recover.c |  2 +-
 fs/xfs/xfs_trans_buf.c        | 16 +++++++++++++---
 4 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/fs/xfs/xfs_buf_item.c b/fs/xfs/xfs_buf_item.c
index 023d4e0385dd..b1e63137d65b 100644
--- a/fs/xfs/xfs_buf_item.c
+++ b/fs/xfs/xfs_buf_item.c
@@ -827,7 +827,8 @@ xfs_buf_item_free_format(
 int
 xfs_buf_item_init(
 	struct xfs_buf	*bp,
-	struct xfs_mount *mp)
+	struct xfs_mount *mp,
+	bool   nowait)
 {
 	struct xfs_buf_log_item	*bip = bp->b_log_item;
 	int			chunks;
@@ -847,7 +848,11 @@ xfs_buf_item_init(
 		return 0;
 	}
 
-	bip = kmem_cache_zalloc(xfs_buf_item_cache, GFP_KERNEL | __GFP_NOFAIL);
+	bip = kmem_cache_zalloc(xfs_buf_item_cache,
+				GFP_KERNEL | (nowait ? 0 : __GFP_NOFAIL));
+	if (!bip)
+		return -EAGAIN;
+
 	xfs_log_item_init(mp, &bip->bli_item, XFS_LI_BUF, &xfs_buf_item_ops);
 	bip->bli_buf = bp;
 
diff --git a/fs/xfs/xfs_buf_item.h b/fs/xfs/xfs_buf_item.h
index 4d8a6aece995..b1daf8988280 100644
--- a/fs/xfs/xfs_buf_item.h
+++ b/fs/xfs/xfs_buf_item.h
@@ -47,7 +47,7 @@ struct xfs_buf_log_item {
 	struct xfs_buf_log_format __bli_format;	/* embedded in-log header */
 };
 
-int	xfs_buf_item_init(struct xfs_buf *, struct xfs_mount *);
+int	xfs_buf_item_init(struct xfs_buf *bp, struct xfs_mount *mp, bool nowait);
 void	xfs_buf_item_done(struct xfs_buf *bp);
 void	xfs_buf_item_relse(struct xfs_buf *);
 bool	xfs_buf_item_put(struct xfs_buf_log_item *);
diff --git a/fs/xfs/xfs_buf_item_recover.c b/fs/xfs/xfs_buf_item_recover.c
index 43167f543afc..aa64d5a499d6 100644
--- a/fs/xfs/xfs_buf_item_recover.c
+++ b/fs/xfs/xfs_buf_item_recover.c
@@ -429,7 +429,7 @@ xlog_recover_validate_buf_type(
 		struct xfs_buf_log_item	*bip;
 
 		bp->b_flags |= _XBF_LOGRECOVERY;
-		xfs_buf_item_init(bp, mp);
+		xfs_buf_item_init(bp, mp, false);
 		bip = bp->b_log_item;
 		bip->bli_item.li_lsn = current_lsn;
 	}
diff --git a/fs/xfs/xfs_trans_buf.c b/fs/xfs/xfs_trans_buf.c
index 016371f58f26..a1e4f2e8629a 100644
--- a/fs/xfs/xfs_trans_buf.c
+++ b/fs/xfs/xfs_trans_buf.c
@@ -57,13 +57,14 @@ xfs_trans_buf_item_match(
  * If the buffer does not yet have a buf log item associated with it,
  * then allocate one for it.  Then add the buf item to the transaction.
  */
-STATIC void
+STATIC int
 _xfs_trans_bjoin(
 	struct xfs_trans	*tp,
 	struct xfs_buf		*bp,
 	int			reset_recur)
 {
 	struct xfs_buf_log_item	*bip;
+	int ret;
 
 	ASSERT(bp->b_transp == NULL);
 
@@ -72,7 +73,11 @@ _xfs_trans_bjoin(
 	 * it doesn't have one yet, then allocate one and initialize it.
 	 * The checks to see if one is there are in xfs_buf_item_init().
 	 */
-	xfs_buf_item_init(bp, tp->t_mountp);
+	ret = xfs_buf_item_init(bp, tp->t_mountp,
+				tp->t_flags & XFS_TRANS_NOWAIT);
+	if (ret < 0)
+		return ret;
+
 	bip = bp->b_log_item;
 	ASSERT(!(bip->bli_flags & XFS_BLI_STALE));
 	ASSERT(!(bip->__bli_format.blf_flags & XFS_BLF_CANCEL));
@@ -92,6 +97,7 @@ _xfs_trans_bjoin(
 	xfs_trans_add_item(tp, &bip->bli_item);
 	bp->b_transp = tp;
 
+	return 0;
 }
 
 void
@@ -309,7 +315,11 @@ xfs_trans_read_buf_map(
 	}
 
 	if (tp) {
-		_xfs_trans_bjoin(tp, bp, 1);
+		error = _xfs_trans_bjoin(tp, bp, 1);
+		if (error) {
+			xfs_buf_relse(bp);
+			return error;
+		}
 		trace_xfs_trans_read_buf(bp->b_log_item);
 	}
 	ASSERT(bp->b_ops != NULL || ops == NULL);
-- 
2.25.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

