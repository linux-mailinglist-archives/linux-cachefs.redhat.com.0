Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EEE042D2AC0
	for <lists+linux-cachefs@lfdr.de>; Tue,  8 Dec 2020 13:29:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-ywIqX2J_OXuCHlltaHuZtw-1; Tue, 08 Dec 2020 07:29:17 -0500
X-MC-Unique: ywIqX2J_OXuCHlltaHuZtw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B310801B1A;
	Tue,  8 Dec 2020 12:29:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AC5D39A60;
	Tue,  8 Dec 2020 12:29:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1680E180954D;
	Tue,  8 Dec 2020 12:29:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B8CTD1c011058 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 07:29:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1C5102026D48; Tue,  8 Dec 2020 12:29:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 176492026D76
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 12:29:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDF218001B8
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 12:29:12 +0000 (UTC)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-149-QHx0MctDPH2aCEYnopopSg-1; Tue, 08 Dec 2020 07:29:08 -0500
X-MC-Unique: QHx0MctDPH2aCEYnopopSg-1
Received: by mail-vs1-f65.google.com with SMTP id p7so9403325vsf.8;
	Tue, 08 Dec 2020 04:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=17HkpCiChNHQ4avz8nKjAF3KcVK7dbos9sXYlvZmUH8=;
	b=rZXmu1c1blvaO7mKjxMOAtbiQUNKjVTEzdFXuibfhGwhe5lz8ybeXX8HfOn//jaaFu
	Cn+GucXEOMIjgRBcYfbcQDesJm8W1Lyw95yk4vpwgtvCCj0+2/Fecp0+NKyZe8GNoWN7
	Dlk5RDAQAKIriTg49ZINsRLIXlcl4SQBM3H4kicKwqzCKuRFfXT7o5GlaRF2qBQstMCW
	0t30yzzuWJb4Fzk+Zvt6SKFQBFc1lDPoH2bQhme8/fjXQMuay5iqjy0t0U0ATF0l8UCF
	ZBXyBpm+boqL5KpgMFcgHQcKnnnkL7SyjXyd/wxX116uNUbw+xf08zgqHV/JwP6W/htb
	1nbQ==
X-Gm-Message-State: AOAM530HVBkDZNN4XLX0AtLUtohLsSJtw5JyfNgEAwBjv/VzKL7/wi+k
	lhOeXdnxQ95S8/2ZrFvmnyY=
X-Google-Smtp-Source: ABdhPJzB7us8JzVAWeOHv8/fHrg99szKANSxsykkf7kNaONPTq8lgv76MK10x5L5LcEp8esxH8xd7g==
X-Received: by 2002:a67:bd0a:: with SMTP id y10mr15127725vsq.28.1607430547745; 
	Tue, 08 Dec 2020 04:29:07 -0800 (PST)
Received: from localhost.localdomain ([50.236.19.102])
	by smtp.gmail.com with ESMTPSA id
	w202sm2001106vkd.25.2020.12.08.04.29.01
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Dec 2020 04:29:07 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: darrick.wong@oracle.com, willy@infradead.org, david@fromorbit.com,
	hch@infradead.org, mhocko@kernel.org, akpm@linux-foundation.org,
	dhowells@redhat.com, jlayton@redhat.com
Date: Tue,  8 Dec 2020 20:28:23 +0800
Message-Id: <20201208122824.16118-4-laoar.shao@gmail.com>
In-Reply-To: <20201208122824.16118-1-laoar.shao@gmail.com>
References: <20201208122824.16118-1-laoar.shao@gmail.com>
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
Cc: Yafang Shao <laoar.shao@gmail.com>, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH v11 3/4] xfs: refactor the usage around
	xfs_trans_context_{set, clear}
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
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

The xfs_trans context should be active after it is allocated, and
deactive when it is freed.

So these two helpers are refactored as,
- xfs_trans_context_set()
  Used in xfs_trans_alloc()
- xfs_trans_context_clear()
  Used in xfs_trans_free()

This patch is based on Darrick's work to fix the issue in xfs/141 in the
earlier version. [1]

1. https://lore.kernel.org/linux-xfs/20201104001649.GN7123@magnolia

Cc: Darrick J. Wong <darrick.wong@oracle.com>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Dave Chinner <david@fromorbit.com>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 fs/xfs/xfs_trans.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
index 11d390f0d3f2..fe20398a214e 100644
--- a/fs/xfs/xfs_trans.c
+++ b/fs/xfs/xfs_trans.c
@@ -67,6 +67,9 @@ xfs_trans_free(
 	xfs_extent_busy_sort(&tp->t_busy);
 	xfs_extent_busy_clear(tp->t_mountp, &tp->t_busy, false);
 
+	/* Detach the transaction from this thread. */
+	xfs_trans_context_clear(tp);
+
 	trace_xfs_trans_free(tp, _RET_IP_);
 	if (!(tp->t_flags & XFS_TRANS_NO_WRITECOUNT))
 		sb_end_intwrite(tp->t_mountp->m_super);
@@ -153,9 +156,6 @@ xfs_trans_reserve(
 	int			error = 0;
 	bool			rsvd = (tp->t_flags & XFS_TRANS_RESERVE) != 0;
 
-	/* Mark this thread as being in a transaction */
-	xfs_trans_context_set(tp);
-
 	/*
 	 * Attempt to reserve the needed disk blocks by decrementing
 	 * the number needed from the number available.  This will
@@ -163,10 +163,9 @@ xfs_trans_reserve(
 	 */
 	if (blocks > 0) {
 		error = xfs_mod_fdblocks(mp, -((int64_t)blocks), rsvd);
-		if (error != 0) {
-			xfs_trans_context_clear(tp);
+		if (error != 0)
 			return -ENOSPC;
-		}
+
 		tp->t_blk_res += blocks;
 	}
 
@@ -241,8 +240,6 @@ xfs_trans_reserve(
 		tp->t_blk_res = 0;
 	}
 
-	xfs_trans_context_clear(tp);
-
 	return error;
 }
 
@@ -284,6 +281,8 @@ xfs_trans_alloc(
 	INIT_LIST_HEAD(&tp->t_dfops);
 	tp->t_firstblock = NULLFSBLOCK;
 
+	/* Mark this thread as being in a transaction */
+	xfs_trans_context_set(tp);
 	error = xfs_trans_reserve(tp, resp, blocks, rtextents);
 	if (error) {
 		xfs_trans_cancel(tp);
@@ -878,7 +877,6 @@ __xfs_trans_commit(
 
 	xfs_log_commit_cil(mp, tp, &commit_lsn, regrant);
 
-	xfs_trans_context_clear(tp);
 	xfs_trans_free(tp);
 
 	/*
@@ -911,7 +909,6 @@ __xfs_trans_commit(
 		tp->t_ticket = NULL;
 	}
 
-	xfs_trans_context_clear(tp);
 	xfs_trans_free_items(tp, !!error);
 	xfs_trans_free(tp);
 
@@ -971,9 +968,6 @@ xfs_trans_cancel(
 		tp->t_ticket = NULL;
 	}
 
-	/* mark this thread as no longer being in a transaction */
-	xfs_trans_context_clear(tp);
-
 	xfs_trans_free_items(tp, dirty);
 	xfs_trans_free(tp);
 }
-- 
2.18.4

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

