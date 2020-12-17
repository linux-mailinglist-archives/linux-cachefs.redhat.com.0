Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A99E22DCA53
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Dec 2020 02:12:47 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-SqPQziZ8NLu0B5XGkj334A-1; Wed, 16 Dec 2020 20:12:45 -0500
X-MC-Unique: SqPQziZ8NLu0B5XGkj334A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8C5E195D563;
	Thu, 17 Dec 2020 01:12:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9896C10016F5;
	Thu, 17 Dec 2020 01:12:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 595CF4A7C6;
	Thu, 17 Dec 2020 01:12:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BH1CeMU032288 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 16 Dec 2020 20:12:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 57D9B1018E5F; Thu, 17 Dec 2020 01:12:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5408A1018E57
	for <linux-cachefs@redhat.com>; Thu, 17 Dec 2020 01:12:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFED7800BFF
	for <linux-cachefs@redhat.com>; Thu, 17 Dec 2020 01:12:36 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
	[209.85.217.47]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-242-1mxspWyMNjOrloWeFExYow-1; Wed, 16 Dec 2020 20:12:32 -0500
X-MC-Unique: 1mxspWyMNjOrloWeFExYow-1
Received: by mail-vs1-f47.google.com with SMTP id e20so7340010vsr.12;
	Wed, 16 Dec 2020 17:12:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9alW6vAYyuzuIAm2W1sBzzo1XFQKdglwiDiVNpF1K2U=;
	b=sjJ3T2Re/02eB3IKiF+IHDTPlDZmiyXmRcRDGNUWFGyVy5xpEacfFtI2PbmTzb8K2p
	2cTYt7KJNADKkunLmaYnxUOpTtdGPJenYf5F4MIwDkEhCk+sJKHTdL0rIysQYX5deerM
	ttjRMaBEQKdwmVQjRfHnwM1+Z0WjmqzdZ4FVJBNgkuYf9GRTN98ctIuytwNTJoUQBbjz
	zID0H0alXhXeHz9ZpG94e0Lg45hHnXfxwUnpWCvhqROqcdHVWQp9WdDz5TRA/mbn0Ftm
	P4s+PXw/Q780geqjvsO71EQ42HW61FL7FkLIT1x6vLoK/NlfPOMQbi8sRviJirtPH3sY
	5y1w==
X-Gm-Message-State: AOAM533U/Q07l1N+cY3wncnBdqqbsFoT8vqievMg5YxPwfCxd3osQUK4
	8LiMk+LSiFkwloM3SSZkzDM=
X-Google-Smtp-Source: ABdhPJymD38OIInUxz/A6UMIS832ePfAYJx4qTFdpzI+xn54beO/QqmFh11xxFmKvkJ1ebq2NwfIEA==
X-Received: by 2002:a67:1142:: with SMTP id 63mr15960710vsr.24.1608167552295; 
	Wed, 16 Dec 2020 17:12:32 -0800 (PST)
Received: from localhost.localdomain ([50.236.19.102])
	by smtp.gmail.com with ESMTPSA id i63sm2900760uad.4.2020.12.16.17.12.27
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Dec 2020 17:12:31 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: darrick.wong@oracle.com, willy@infradead.org, david@fromorbit.com,
	hch@infradead.org, mhocko@kernel.org, akpm@linux-foundation.org,
	dhowells@redhat.com, jlayton@redhat.com
Date: Thu, 17 Dec 2020 09:11:57 +0800
Message-Id: <20201217011157.92549-5-laoar.shao@gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Yafang Shao <laoar.shao@gmail.com>, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH v13 4/4] xfs: use current->journal_info to
	avoid transaction reservation recursion
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

PF_FSTRANS which is used to avoid transaction reservation recursion, is
dropped since commit 9070733b4efa ("xfs: abstract PF_FSTRANS to
PF_MEMALLOC_NOFS") and replaced by PF_MEMALLOC_NOFS which means to avoid
filesystem reclaim recursion.

As these two flags have different meanings, we'd better reintroduce
PF_FSTRANS back. To avoid wasting the space of PF_* flags in task_struct,
we can reuse the current->journal_info to do that, per Willy. As the
check of transaction reservation recursion is used by XFS only, we can
move the check into xfs_vm_writepage(s), per Dave.

Cc: Darrick J. Wong <darrick.wong@oracle.com>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Dave Chinner <david@fromorbit.com>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: David Howells <dhowells@redhat.com>
Cc: Jeff Layton <jlayton@redhat.com>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 fs/iomap/buffered-io.c |  7 -------
 fs/xfs/xfs_aops.c      | 17 +++++++++++++++++
 fs/xfs/xfs_trans.h     | 26 +++++++++++++++++++-------
 3 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 10cc7979ce38..3c53fa6ce64d 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1458,13 +1458,6 @@ iomap_do_writepage(struct page *page, struct writeback_control *wbc, void *data)
 			PF_MEMALLOC))
 		goto redirty;
 
-	/*
-	 * Given that we do not allow direct reclaim to call us, we should
-	 * never be called in a recursive filesystem reclaim context.
-	 */
-	if (WARN_ON_ONCE(current->flags & PF_MEMALLOC_NOFS))
-		goto redirty;
-
 	/*
 	 * Is this page beyond the end of the file?
 	 *
diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
index 2371187b7615..0da0242d42c3 100644
--- a/fs/xfs/xfs_aops.c
+++ b/fs/xfs/xfs_aops.c
@@ -568,6 +568,16 @@ xfs_vm_writepage(
 {
 	struct xfs_writepage_ctx wpc = { };
 
+	/*
+	 * Given that we do not allow direct reclaim to call us, we should
+	 * never be called while in a filesystem transaction.
+	 */
+	if (WARN_ON_ONCE(xfs_trans_context_active())) {
+		redirty_page_for_writepage(wbc, page);
+		unlock_page(page);
+		return 0;
+	}
+
 	return iomap_writepage(page, wbc, &wpc.ctx, &xfs_writeback_ops);
 }
 
@@ -579,6 +589,13 @@ xfs_vm_writepages(
 	struct xfs_writepage_ctx wpc = { };
 
 	xfs_iflags_clear(XFS_I(mapping->host), XFS_ITRUNCATED);
+	/*
+	 * Given that we do not allow direct reclaim to call us, we should
+	 * never be called while in a filesystem transaction.
+	 */
+	if (WARN_ON_ONCE(xfs_trans_context_active()))
+		return 0;
+
 	return iomap_writepages(mapping, wbc, &wpc.ctx, &xfs_writeback_ops);
 }
 
diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
index 12380eaaf7ce..0c8140147b9b 100644
--- a/fs/xfs/xfs_trans.h
+++ b/fs/xfs/xfs_trans.h
@@ -268,29 +268,41 @@ xfs_trans_item_relog(
 	return lip->li_ops->iop_relog(lip, tp);
 }
 
+static inline bool
+xfs_trans_context_active(void)
+{
+	/* Use journal_info to indicate current is in a transaction */
+	return current->journal_info != NULL;
+}
+
 static inline void
 xfs_trans_context_set(struct xfs_trans *tp)
 {
+	ASSERT(!current->journal_info);
+	current->journal_info = tp;
 	tp->t_pflags = memalloc_nofs_save();
 }
 
 static inline void
 xfs_trans_context_clear(struct xfs_trans *tp)
 {
+	/*
+	 * If xfs_trans_context_swap() handed the NOFS context to a
+	 * new transaction we do not clear the context here.
+	 */
+	if (current->journal_info != tp)
+		return;
+
+	current->journal_info = NULL;
 	memalloc_nofs_restore(tp->t_pflags);
 }
 
 static inline void
 xfs_trans_context_swap(struct xfs_trans *tp, struct xfs_trans *ntp)
 {
+	ASSERT(current->journal_info == tp);
+	current->journal_info = ntp;
 	ntp->t_pflags = tp->t_pflags;
-	/*
-	 * For the rolling transaction, we have to set NOFS in the old
-	 * transaction's t_pflags so that when we clear the context on
-	 * the old transaction we don't actually change the thread's NOFS
-	 * state.
-	 */
-	tp->t_pflags = current->flags | PF_MEMALLOC_NOFS;
 }
 
 #endif	/* __XFS_TRANS_H__ */
-- 
2.18.4

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

