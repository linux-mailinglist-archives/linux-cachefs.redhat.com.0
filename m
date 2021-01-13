Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A2B3F2F4890
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Jan 2021 11:23:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-VecM_GyDN0G1AlehXF5vqQ-1; Wed, 13 Jan 2021 05:23:41 -0500
X-MC-Unique: VecM_GyDN0G1AlehXF5vqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7266107ACF7;
	Wed, 13 Jan 2021 10:23:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2E5510429F3;
	Wed, 13 Jan 2021 10:23:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF493180954D;
	Wed, 13 Jan 2021 10:23:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10DANaQo016980 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 13 Jan 2021 05:23:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B64FF2026D16; Wed, 13 Jan 2021 10:23:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1BF22026D46
	for <linux-cachefs@redhat.com>; Wed, 13 Jan 2021 10:23:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AA47805B3B
	for <linux-cachefs@redhat.com>; Wed, 13 Jan 2021 10:23:36 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-454-v3oMfuTTPBKtky946yeEoA-1; Wed, 13 Jan 2021 05:23:32 -0500
X-MC-Unique: v3oMfuTTPBKtky946yeEoA-1
Received: by mail-ot1-f50.google.com with SMTP id o11so1425027ote.4;
	Wed, 13 Jan 2021 02:23:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2Hoa9myK143cV0+5FfOAtzs2mXHnYs56TUMaxDFngxI=;
	b=e7At/IM7vJKoCdBl4CDO59tWklDWpuGOaRXweyzuEW7wKWhOy1kI/wuPq1rL20ssxu
	1f7TP1EZrsLOTjHcNfRyNQqVfwQ4owuk6h49TGzEkz4TyOUr605MXAdsxXNa3XfhqHl3
	CFDXinTurec5mvY8ozQPVgMZJTSFZgRsQXJapvweT+5EAeTGqSoAN5S7aJM6dTNsCil5
	dqNhEWphZdZLfquPnStms/SavG/80PLTzBWWWry0p4/aNdun7Jt6vFNu6kVufBuz6QJU
	KeS5XCs9jl7FM7x3TRemn30hIJQAxn2li//r6YA7oCPywqStu14wzfuJClRgvohZMs0Z
	gVPQ==
X-Gm-Message-State: AOAM533Wf0e/2inckevE6zvDryuvzbRF+7stXJ75onVqAczo9DJPMDPb
	7CJkN3teySNz13npuEALz3E=
X-Google-Smtp-Source: ABdhPJzMbFRs70OCbw4e3J96c+SlsfFE7Ic6psQgivnf/qYiMFYIWrf1tQemCSk4aiSnqSS+tSYWsg==
X-Received: by 2002:a9d:12d7:: with SMTP id g81mr761901otg.103.1610533411738; 
	Wed, 13 Jan 2021 02:23:31 -0800 (PST)
Received: from localhost.localdomain ([50.236.19.102])
	by smtp.gmail.com with ESMTPSA id z8sm335571oon.10.2021.01.13.02.23.25
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jan 2021 02:23:31 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: darrick.wong@oracle.com, willy@infradead.org, david@fromorbit.com,
	hch@infradead.org, mhocko@kernel.org, akpm@linux-foundation.org,
	dhowells@redhat.com, jlayton@redhat.com
Date: Wed, 13 Jan 2021 18:22:24 +0800
Message-Id: <20210113102224.13655-5-laoar.shao@gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: Yafang Shao <laoar.shao@gmail.com>, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	oliver.sang@intel.com, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH v15 4/4] xfs: use current->journal_info to
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
PF_FSTRANS back. To avoid wasting the space of PF_* flags in
task_struct,
we can reuse the current->journal_info to do that, per Willy. As the
check of transaction reservation recursion is used by XFS only, we can
move the check into xfs_vm_writepage(s), per Dave.

[oliver.sang@intel.com: reported a Assertion_failed in the prev version]

Cc: Darrick J. Wong <darrick.wong@oracle.com>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Dave Chinner <david@fromorbit.com>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: David Howells <dhowells@redhat.com>
Cc: Jeff Layton <jlayton@redhat.com>
Cc: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 fs/iomap/buffered-io.c |  7 -------
 fs/xfs/xfs_aops.c      | 10 ++++++++++
 fs/xfs/xfs_trans.h     | 22 +++++++++++++++++++---
 3 files changed, 29 insertions(+), 10 deletions(-)

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
index 2371187b7615..eed4881d4461 100644
--- a/fs/xfs/xfs_aops.c
+++ b/fs/xfs/xfs_aops.c
@@ -568,6 +568,12 @@ xfs_vm_writepage(
 {
 	struct xfs_writepage_ctx wpc = { };
 
+	if (WARN_ON_ONCE(xfs_trans_context_active())) {
+		redirty_page_for_writepage(wbc, page);
+		unlock_page(page);
+		return 0;
+	}
+
 	return iomap_writepage(page, wbc, &wpc.ctx, &xfs_writeback_ops);
 }
 
@@ -579,6 +585,10 @@ xfs_vm_writepages(
 	struct xfs_writepage_ctx wpc = { };
 
 	xfs_iflags_clear(XFS_I(mapping->host), XFS_ITRUNCATED);
+
+	if (WARN_ON_ONCE(xfs_trans_context_active()))
+		return 0;
+
 	return iomap_writepages(mapping, wbc, &wpc.ctx, &xfs_writeback_ops);
 }
 
diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
index 3645fd0d74b8..e2f3251d6cce 100644
--- a/fs/xfs/xfs_trans.h
+++ b/fs/xfs/xfs_trans.h
@@ -268,24 +268,40 @@ xfs_trans_item_relog(
 	return lip->li_ops->iop_relog(lip, tp);
 }
 
+static inline bool
+xfs_trans_context_active(void)
+{
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
-	if (!tp->t_pflags)
-		memalloc_nofs_restore(tp->t_pflags);
+	/*
+	 * If we handed over the context via xfs_trans_context_swap() then
+	 * the context is no longer needed to clear.
+	 */
+	if (current->journal_info != tp)
+		return;
+
+	current->journal_info = NULL;
+	memalloc_nofs_restore(tp->t_pflags);
 }
 
 static inline void
 xfs_trans_context_swap(struct xfs_trans *tp, struct xfs_trans *ntp)
 {
+	ASSERT(current->journal_info == tp);
+	current->journal_info = ntp;
 	ntp->t_pflags = tp->t_pflags;
-	tp->t_pflags = -1;
 }
 
 #endif	/* __XFS_TRANS_H__ */
-- 
2.17.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

