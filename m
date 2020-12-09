Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA192D42EF
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Dec 2020 14:14:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-LpUiCFA6NIikKqLQFCd5iQ-1; Wed, 09 Dec 2020 08:14:15 -0500
X-MC-Unique: LpUiCFA6NIikKqLQFCd5iQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E12FC73C7;
	Wed,  9 Dec 2020 13:14:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B80919746;
	Wed,  9 Dec 2020 13:14:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E69E64E58E;
	Wed,  9 Dec 2020 13:14:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B9DCY82030332 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 9 Dec 2020 08:12:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F34A7AE7B2; Wed,  9 Dec 2020 13:12:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED6A0AE7AD
	for <linux-cachefs@redhat.com>; Wed,  9 Dec 2020 13:12:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D906F802A5D
	for <linux-cachefs@redhat.com>; Wed,  9 Dec 2020 13:12:33 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-241-U2ki6GF9Nnmenrgw18ftJQ-1; Wed, 09 Dec 2020 08:12:31 -0500
X-MC-Unique: U2ki6GF9Nnmenrgw18ftJQ-1
Received: by mail-qk1-f193.google.com with SMTP id q5so1064246qkc.12;
	Wed, 09 Dec 2020 05:12:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=U/1xqfI5qUo3gDO+06cA0eClvvlW5lp3NGGPYOZ6sWg=;
	b=rjEskNYyI39qi1WKXZ8ICYU40lWXQiZFLtLBRvt3A8eVaFkv7Qp6jn/L9Q1sbT6HBg
	auympRTz+5mlWBCms0+sdwoa2KuvG3g15lIsaeOnvyyHkPcGZWm76mkFgMCnlRa6vC6M
	4KKGhPMuQ6oZxrhUs1HYXDxenl+HE7lOr0bMIdgQbdUsFYtaQqxSC54hfmWZAfqN3ufi
	M3cU7Xb+MVcNPn9xc+VD0GvvlK6kQpSUSJ2Mkh1HQYGiDOXOOXRQZJsSJKmhYzOLeYQn
	H9P2yKn2NyVSjP42lHoCRvBHlSdlnzspMoGzmo848OG21tQpbOzzetOxldVeag1RFZL6
	RV2A==
X-Gm-Message-State: AOAM533LIQdIQEi4w57UIN3lBqn6YAFp0qoM8HzNm1c//eo299bZa1Ua
	0Wx4HXAMIimN2s3iCUFnXuo=
X-Google-Smtp-Source: ABdhPJxB0/jAlENo3tmNLdMytrMRXbSsuKgW8S6j4ULYI9Bw/bihb/0tXNXtJPrr5KbOt6cyGOqcXA==
X-Received: by 2002:a05:620a:2290:: with SMTP id
	o16mr2832688qkh.101.1607519551095; 
	Wed, 09 Dec 2020 05:12:31 -0800 (PST)
Received: from localhost.localdomain ([50.236.19.102])
	by smtp.gmail.com with ESMTPSA id u72sm938114qka.15.2020.12.09.05.12.25
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Dec 2020 05:12:30 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: darrick.wong@oracle.com, willy@infradead.org, david@fromorbit.com,
	hch@infradead.org, mhocko@kernel.org, akpm@linux-foundation.org,
	dhowells@redhat.com, jlayton@redhat.com
Date: Wed,  9 Dec 2020 21:11:45 +0800
Message-Id: <20201209131146.67289-4-laoar.shao@gmail.com>
In-Reply-To: <20201209131146.67289-1-laoar.shao@gmail.com>
References: <20201209131146.67289-1-laoar.shao@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: Yafang Shao <laoar.shao@gmail.com>, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH v12 3/4] xfs: refactor the usage around
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
 fs/xfs/xfs_trans.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
index 11d390f0d3f2..4f4645329bb2 100644
--- a/fs/xfs/xfs_trans.c
+++ b/fs/xfs/xfs_trans.c
@@ -67,6 +67,17 @@ xfs_trans_free(
 	xfs_extent_busy_sort(&tp->t_busy);
 	xfs_extent_busy_clear(tp->t_mountp, &tp->t_busy, false);
 
+
+	/* Detach the transaction from this thread. */
+	ASSERT(current->journal_info != NULL);
+	/*
+	 * The PF_MEMALLOC_NOFS is bound to the transaction itself instead
+	 * of the reservation, so we need to check if tp is still the
+	 * current transaction before clearing the flag.
+	 */
+	if (current->journal_info == tp)
+		xfs_trans_context_clear(tp);
+
 	trace_xfs_trans_free(tp, _RET_IP_);
 	if (!(tp->t_flags & XFS_TRANS_NO_WRITECOUNT))
 		sb_end_intwrite(tp->t_mountp->m_super);
@@ -153,9 +164,6 @@ xfs_trans_reserve(
 	int			error = 0;
 	bool			rsvd = (tp->t_flags & XFS_TRANS_RESERVE) != 0;
 
-	/* Mark this thread as being in a transaction */
-	xfs_trans_context_set(tp);
-
 	/*
 	 * Attempt to reserve the needed disk blocks by decrementing
 	 * the number needed from the number available.  This will
@@ -163,10 +171,9 @@ xfs_trans_reserve(
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
 
@@ -241,8 +248,6 @@ xfs_trans_reserve(
 		tp->t_blk_res = 0;
 	}
 
-	xfs_trans_context_clear(tp);
-
 	return error;
 }
 
@@ -284,6 +289,8 @@ xfs_trans_alloc(
 	INIT_LIST_HEAD(&tp->t_dfops);
 	tp->t_firstblock = NULLFSBLOCK;
 
+	/* Mark this thread as being in a transaction */
+	xfs_trans_context_set(tp);
 	error = xfs_trans_reserve(tp, resp, blocks, rtextents);
 	if (error) {
 		xfs_trans_cancel(tp);
@@ -878,7 +885,6 @@ __xfs_trans_commit(
 
 	xfs_log_commit_cil(mp, tp, &commit_lsn, regrant);
 
-	xfs_trans_context_clear(tp);
 	xfs_trans_free(tp);
 
 	/*
@@ -911,7 +917,6 @@ __xfs_trans_commit(
 		tp->t_ticket = NULL;
 	}
 
-	xfs_trans_context_clear(tp);
 	xfs_trans_free_items(tp, !!error);
 	xfs_trans_free(tp);
 
@@ -971,9 +976,6 @@ xfs_trans_cancel(
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

