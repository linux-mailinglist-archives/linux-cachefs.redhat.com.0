Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B5F602F488F
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Jan 2021 11:23:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-w_f305Q0OxmPlIsdVFIKbg-1; Wed, 13 Jan 2021 05:23:37 -0500
X-MC-Unique: w_f305Q0OxmPlIsdVFIKbg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72D139CC09;
	Wed, 13 Jan 2021 10:23:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DBE21C936;
	Wed, 13 Jan 2021 10:23:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 490454BB7B;
	Wed, 13 Jan 2021 10:23:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10DANW67016968 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 13 Jan 2021 05:23:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B7E1D1004154; Wed, 13 Jan 2021 10:23:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3F221004150
	for <linux-cachefs@redhat.com>; Wed, 13 Jan 2021 10:23:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A775805B3B
	for <linux-cachefs@redhat.com>; Wed, 13 Jan 2021 10:23:30 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-12-cWLhEhIwMUeY8bX6lKPlSg-1; Wed, 13 Jan 2021 05:23:26 -0500
X-MC-Unique: cWLhEhIwMUeY8bX6lKPlSg-1
Received: by mail-ot1-f50.google.com with SMTP id j12so1408740ota.7;
	Wed, 13 Jan 2021 02:23:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XxclDVwqVJvNjL6ogvvc7lutzmJKTCIl3aL2mVuveRU=;
	b=s3pQiMVniOFV+lRtcLtIvs36lr4RcDBYKs2rXMEYx6pFCYS7tBjyRKaa09Oo84ZNww
	Ap18J3QGKdz+dyeKDqsPGJ66N784WHlCqUDoLnZJ3182bSH5Is0UB+W+MpTnzjXXrL4f
	AIXRUYs/GPHsgKhUkcDqFfTjYVfI/gYDDKeHt0nD40bErvfS0gdE4ewYaH1WP6lowF7a
	WKstRttpoA/KRcDZyfeJIcgFjZthrXd1BhL7oHjd9eX7BM/qDY575Mu6tHPnpeLDqc5W
	eKqdhU/c8ZVE2REQKCXsw9JQr0DTzuvpRY6WowRC8rxJlMnwGNxEiF7d2oh3XU2Qgp+7
	Ozig==
X-Gm-Message-State: AOAM532CTYc2OnqZP3oyCmTgZ2tmDuMmzxtzfXHzmGs1aUhATGxrXkV9
	B55jS44+b/1/m/viqkIZxca1GkH252NsZbnb
X-Google-Smtp-Source: ABdhPJy3SuuCBXWeZ64qnoWABbZ8wtAGotjYfWPZu33kh0kuO2TTGVs0UOsxp8cqTnyLedLhUOmebA==
X-Received: by 2002:a9d:694a:: with SMTP id p10mr722519oto.149.1610533405317; 
	Wed, 13 Jan 2021 02:23:25 -0800 (PST)
Received: from localhost.localdomain ([50.236.19.102])
	by smtp.gmail.com with ESMTPSA id z8sm335571oon.10.2021.01.13.02.23.19
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jan 2021 02:23:24 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: darrick.wong@oracle.com, willy@infradead.org, david@fromorbit.com,
	hch@infradead.org, mhocko@kernel.org, akpm@linux-foundation.org,
	dhowells@redhat.com, jlayton@redhat.com
Date: Wed, 13 Jan 2021 18:22:23 +0800
Message-Id: <20210113102224.13655-4-laoar.shao@gmail.com>
In-Reply-To: <20210113102224.13655-1-laoar.shao@gmail.com>
References: <20210113102224.13655-1-laoar.shao@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Yafang Shao <laoar.shao@gmail.com>, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	oliver.sang@intel.com, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH v15 3/4] xfs: refactor the usage around
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The xfs_trans context should be active after it is allocated, and
deactive when it is freed.
The rolling transaction should be specially considered, because in the
case when we clear the old transaction the thread's NOFS state shouldn't
be changed, as a result we have to set NOFS in the old transaction's
t_pflags in xfs_trans_context_swap().

So these helpers are refactored as,
- xfs_trans_context_set()
  Used in xfs_trans_alloc()
- xfs_trans_context_clear()
  Used in xfs_trans_free()

And a new helper is instroduced to handle the rolling transaction,
- xfs_trans_context_swap()
  Used in rolling transaction

This patch is based on Darrick's work[1] to fix the issue in xfs/141 in the
earlier version and Dave's suggestion[2].

[1]. https://lore.kernel.org/linux-xfs/20201104001649.GN7123@magnolia
[2]. https://lore.kernel.org/linux-xfs/20201218000705.GR632069@dread.disaster.area

Cc: Dave Chinner <david@fromorbit.com>
Cc: Darrick J. Wong <darrick.wong@oracle.com>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 fs/xfs/xfs_trans.c | 25 +++++++++++--------------
 fs/xfs/xfs_trans.h | 10 +++++++++-
 2 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
index 43107af569fe..b76e850c9ae7 100644
--- a/fs/xfs/xfs_trans.c
+++ b/fs/xfs/xfs_trans.c
@@ -67,6 +67,10 @@ xfs_trans_free(
 	xfs_extent_busy_sort(&tp->t_busy);
 	xfs_extent_busy_clear(tp->t_mountp, &tp->t_busy, false);
 
+
+	/* Detach the transaction from this thread. */
+	xfs_trans_context_clear(tp);
+
 	trace_xfs_trans_free(tp, _RET_IP_);
 	if (!(tp->t_flags & XFS_TRANS_NO_WRITECOUNT))
 		sb_end_intwrite(tp->t_mountp->m_super);
@@ -119,7 +123,9 @@ xfs_trans_dup(
 
 	ntp->t_rtx_res = tp->t_rtx_res - tp->t_rtx_res_used;
 	tp->t_rtx_res = tp->t_rtx_res_used;
-	ntp->t_pflags = tp->t_pflags;
+
+	/* Associate the new transaction with this thread. */
+	xfs_trans_context_swap(tp, ntp);
 
 	/* move deferred ops over to the new tp */
 	xfs_defer_move(ntp, tp);
@@ -153,9 +159,6 @@ xfs_trans_reserve(
 	int			error = 0;
 	bool			rsvd = (tp->t_flags & XFS_TRANS_RESERVE) != 0;
 
-	/* Mark this thread as being in a transaction */
-	xfs_trans_context_set(tp);
-
 	/*
 	 * Attempt to reserve the needed disk blocks by decrementing
 	 * the number needed from the number available.  This will
@@ -163,10 +166,9 @@ xfs_trans_reserve(
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
 
@@ -241,8 +243,6 @@ xfs_trans_reserve(
 		tp->t_blk_res = 0;
 	}
 
-	xfs_trans_context_clear(tp);
-
 	return error;
 }
 
@@ -284,6 +284,8 @@ xfs_trans_alloc(
 	INIT_LIST_HEAD(&tp->t_dfops);
 	tp->t_firstblock = NULLFSBLOCK;
 
+	/* Mark this thread as being in a transaction */
+	xfs_trans_context_set(tp);
 	error = xfs_trans_reserve(tp, resp, blocks, rtextents);
 	if (error) {
 		xfs_trans_cancel(tp);
@@ -878,7 +880,6 @@ __xfs_trans_commit(
 
 	xfs_log_commit_cil(mp, tp, &commit_lsn, regrant);
 
-	xfs_trans_context_clear(tp);
 	xfs_trans_free(tp);
 
 	/*
@@ -911,7 +912,6 @@ __xfs_trans_commit(
 		tp->t_ticket = NULL;
 	}
 
-	xfs_trans_context_clear(tp);
 	xfs_trans_free_items(tp, !!error);
 	xfs_trans_free(tp);
 
@@ -971,9 +971,6 @@ xfs_trans_cancel(
 		tp->t_ticket = NULL;
 	}
 
-	/* mark this thread as no longer being in a transaction */
-	xfs_trans_context_clear(tp);
-
 	xfs_trans_free_items(tp, dirty);
 	xfs_trans_free(tp);
 }
diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
index 44b11c64a15e..3645fd0d74b8 100644
--- a/fs/xfs/xfs_trans.h
+++ b/fs/xfs/xfs_trans.h
@@ -277,7 +277,15 @@ xfs_trans_context_set(struct xfs_trans *tp)
 static inline void
 xfs_trans_context_clear(struct xfs_trans *tp)
 {
-	memalloc_nofs_restore(tp->t_pflags);
+	if (!tp->t_pflags)
+		memalloc_nofs_restore(tp->t_pflags);
+}
+
+static inline void
+xfs_trans_context_swap(struct xfs_trans *tp, struct xfs_trans *ntp)
+{
+	ntp->t_pflags = tp->t_pflags;
+	tp->t_pflags = -1;
 }
 
 #endif	/* __XFS_TRANS_H__ */
-- 
2.17.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

