Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 49CEF2DCA57
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Dec 2020 02:14:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-XdybhpfJNZCqUKXkSh8ZDg-1; Wed, 16 Dec 2020 20:14:34 -0500
X-MC-Unique: XdybhpfJNZCqUKXkSh8ZDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B7EF801B15;
	Thu, 17 Dec 2020 01:14:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C63160C15;
	Thu, 17 Dec 2020 01:14:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 46270180954D;
	Thu, 17 Dec 2020 01:14:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BH1CTMp032248 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 16 Dec 2020 20:12:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 11E552026D5D; Thu, 17 Dec 2020 01:12:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D4332026D48
	for <linux-cachefs@redhat.com>; Thu, 17 Dec 2020 01:12:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA334858280
	for <linux-cachefs@redhat.com>; Thu, 17 Dec 2020 01:12:25 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
	[209.85.222.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-442-E9sQh8frPImXbLfQCEWBJA-1; Wed, 16 Dec 2020 20:12:21 -0500
X-MC-Unique: E9sQh8frPImXbLfQCEWBJA-1
Received: by mail-ua1-f48.google.com with SMTP id 73so1095947uac.8;
	Wed, 16 Dec 2020 17:12:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iBZKS7fZyjdTYTaO3rtutG8028bfWaEOmNu0KLWmO18=;
	b=tSVHIsepBIL7bdSWyNFfDia4qNJMUXFdmPP59FLkZucLwq63W6vy5oRyK0U9SPHzcE
	W6ViK8Eg1fd8KITRIM/ZAEzPRWB7wyJ+TpCtEacwF5gTFSEiu8OAJjkp4wjb9lcwLRH2
	TFu6BIXf/AwZvsDz9fC2QD38zh8jaeAh6xhREAFN2DbPZg6PceXDw8H/2ExJrcr5sBUz
	6pjN8LOKoICgivg+QXpq6OmODa86EclX0vouOQhnFTnItYwqruooccxO8ZOPluLJrkTH
	TVeN3q2UKhbK20pds6wYntRzVSfPmPD3rA3kIOW8Ptuf1i4zkfwgFu2pzjf6xd7rpHf0
	myvA==
X-Gm-Message-State: AOAM53123bT0jfEu8yksoMPLs9elwmsLU6+VVSa+gde376gnNx7ya2kV
	ZsMQEWN/CybRR0qUf3FBoI4=
X-Google-Smtp-Source: ABdhPJz/YGsgeQJh4SGPLtJui6RuCMR6Y42EbrIIRR4DBSYZK9cZPw6yyRDLwSegXCZqjAGBjAp2IQ==
X-Received: by 2002:ab0:2f4:: with SMTP id 107mr129918uah.110.1608167541431;
	Wed, 16 Dec 2020 17:12:21 -0800 (PST)
Received: from localhost.localdomain ([50.236.19.102])
	by smtp.gmail.com with ESMTPSA id i63sm2900760uad.4.2020.12.16.17.12.16
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Dec 2020 17:12:20 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: darrick.wong@oracle.com, willy@infradead.org, david@fromorbit.com,
	hch@infradead.org, mhocko@kernel.org, akpm@linux-foundation.org,
	dhowells@redhat.com, jlayton@redhat.com
Date: Thu, 17 Dec 2020 09:11:55 +0800
Message-Id: <20201217011157.92549-3-laoar.shao@gmail.com>
In-Reply-To: <20201217011157.92549-1-laoar.shao@gmail.com>
References: <20201217011157.92549-1-laoar.shao@gmail.com>
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
Subject: [Linux-cachefs] [PATCH v13 2/4] xfs: use memalloc_nofs_{save,
	restore} in xfs transaction
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce a new API to mark the start and end of XFS transactions.
For now, just save and restore the memalloc_nofs flags.

The new helpers as follows,
- xfs_trans_context_set
  Mark the start of XFS transactions
- xfs_trans_context_clear
  Mark the end of XFS transactions

Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Dave Chinner <david@fromorbit.com>
Cc: Michal Hocko <mhocko@kernel.org>
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 fs/xfs/xfs_aops.c  |  4 ++--
 fs/xfs/xfs_linux.h |  4 ----
 fs/xfs/xfs_trans.c | 13 +++++++------
 fs/xfs/xfs_trans.h | 12 ++++++++++++
 4 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
index 4304c6416fbb..2371187b7615 100644
--- a/fs/xfs/xfs_aops.c
+++ b/fs/xfs/xfs_aops.c
@@ -62,7 +62,7 @@ xfs_setfilesize_trans_alloc(
 	 * We hand off the transaction to the completion thread now, so
 	 * clear the flag here.
 	 */
-	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
+	xfs_trans_context_clear(tp);
 	return 0;
 }
 
@@ -125,7 +125,7 @@ xfs_setfilesize_ioend(
 	 * thus we need to mark ourselves as being in a transaction manually.
 	 * Similarly for freeze protection.
 	 */
-	current_set_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
+	xfs_trans_context_set(tp);
 	__sb_writers_acquired(VFS_I(ip)->i_sb, SB_FREEZE_FS);
 
 	/* we abort the update if there was an IO error */
diff --git a/fs/xfs/xfs_linux.h b/fs/xfs/xfs_linux.h
index 5b7a1e201559..6ab0f8043c73 100644
--- a/fs/xfs/xfs_linux.h
+++ b/fs/xfs/xfs_linux.h
@@ -102,10 +102,6 @@ typedef __u32			xfs_nlink_t;
 #define xfs_cowb_secs		xfs_params.cowb_timer.val
 
 #define current_cpu()		(raw_smp_processor_id())
-#define current_set_flags_nested(sp, f)		\
-		(*(sp) = current->flags, current->flags |= (f))
-#define current_restore_flags_nested(sp, f)	\
-		(current->flags = ((current->flags & ~(f)) | (*(sp) & (f))))
 
 #define NBBY		8		/* number of bits per byte */
 
diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
index c94e71f741b6..11d390f0d3f2 100644
--- a/fs/xfs/xfs_trans.c
+++ b/fs/xfs/xfs_trans.c
@@ -154,7 +154,7 @@ xfs_trans_reserve(
 	bool			rsvd = (tp->t_flags & XFS_TRANS_RESERVE) != 0;
 
 	/* Mark this thread as being in a transaction */
-	current_set_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
+	xfs_trans_context_set(tp);
 
 	/*
 	 * Attempt to reserve the needed disk blocks by decrementing
@@ -164,7 +164,7 @@ xfs_trans_reserve(
 	if (blocks > 0) {
 		error = xfs_mod_fdblocks(mp, -((int64_t)blocks), rsvd);
 		if (error != 0) {
-			current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
+			xfs_trans_context_clear(tp);
 			return -ENOSPC;
 		}
 		tp->t_blk_res += blocks;
@@ -241,7 +241,7 @@ xfs_trans_reserve(
 		tp->t_blk_res = 0;
 	}
 
-	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
+	xfs_trans_context_clear(tp);
 
 	return error;
 }
@@ -878,7 +878,7 @@ __xfs_trans_commit(
 
 	xfs_log_commit_cil(mp, tp, &commit_lsn, regrant);
 
-	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
+	xfs_trans_context_clear(tp);
 	xfs_trans_free(tp);
 
 	/*
@@ -910,7 +910,8 @@ __xfs_trans_commit(
 			xfs_log_ticket_ungrant(mp->m_log, tp->t_ticket);
 		tp->t_ticket = NULL;
 	}
-	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
+
+	xfs_trans_context_clear(tp);
 	xfs_trans_free_items(tp, !!error);
 	xfs_trans_free(tp);
 
@@ -971,7 +972,7 @@ xfs_trans_cancel(
 	}
 
 	/* mark this thread as no longer being in a transaction */
-	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
+	xfs_trans_context_clear(tp);
 
 	xfs_trans_free_items(tp, dirty);
 	xfs_trans_free(tp);
diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
index 084658946cc8..44b11c64a15e 100644
--- a/fs/xfs/xfs_trans.h
+++ b/fs/xfs/xfs_trans.h
@@ -268,4 +268,16 @@ xfs_trans_item_relog(
 	return lip->li_ops->iop_relog(lip, tp);
 }
 
+static inline void
+xfs_trans_context_set(struct xfs_trans *tp)
+{
+	tp->t_pflags = memalloc_nofs_save();
+}
+
+static inline void
+xfs_trans_context_clear(struct xfs_trans *tp)
+{
+	memalloc_nofs_restore(tp->t_pflags);
+}
+
 #endif	/* __XFS_TRANS_H__ */
-- 
2.18.4

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

