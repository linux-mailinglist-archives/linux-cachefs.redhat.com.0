Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3982E03CA
	for <lists+linux-cachefs@lfdr.de>; Tue, 22 Dec 2020 02:22:38 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-jssriT7uPgOWzyLqol_mFQ-1; Mon, 21 Dec 2020 20:22:35 -0500
X-MC-Unique: jssriT7uPgOWzyLqol_mFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B714800D53;
	Tue, 22 Dec 2020 01:22:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39EAF106D5C7;
	Tue, 22 Dec 2020 01:22:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 265F64A7C7;
	Tue, 22 Dec 2020 01:22:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BM1MVVn002938 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 21 Dec 2020 20:22:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2B2EE2026D46; Tue, 22 Dec 2020 01:22:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24DE52026DE4
	for <linux-cachefs@redhat.com>; Tue, 22 Dec 2020 01:22:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4EC91010424
	for <linux-cachefs@redhat.com>; Tue, 22 Dec 2020 01:22:28 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
	[209.85.210.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-167--OWN2lzuM_ydFUFdhay5zQ-1; Mon, 21 Dec 2020 20:22:24 -0500
X-MC-Unique: -OWN2lzuM_ydFUFdhay5zQ-1
Received: by mail-ot1-f51.google.com with SMTP id n42so4633276ota.12;
	Mon, 21 Dec 2020 17:22:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1tqH6gFEH/QkT/MrE5FvbhgIXvCJPwTVubT5FNjmPiw=;
	b=iTYvEmuvKP/Nda5ErG7fbx8wgBA8yUw1e0/9c2FZKMtx2ld9+BzId+FSJnWl1911fK
	DKehdSKOvYfbh+N+7jA4WjJCpD0a9ocmGLBqg5DyLTYjmRwRQ5wCFtPZOwVf6sOWjx8D
	fUNAQYrOo9bjHhe0VCuRWcKbW9TnViDHwH9P/HaOqvX1OXPNX9XzYSrwllw3hNZQUV1D
	6jmxvqFhqWmcFuXQdc+18BaZDHkEUuGCRwfcyeo0aMuSGG0HZ/LsdXSP5qGTVTS5DTUg
	GlcgNblxJ6JMT2k2nN+znVUAoC+LH6dutIGjaIlekhPWKl9zkb/9nTNmiRaxKyt0xIe7
	6bDg==
X-Gm-Message-State: AOAM532lbAG9rzSrWBmgdjz3/4WQomE/L6lZ+a17cR0hoOzJMX8PcEMI
	PIwCjzP1z0KOLyud0v+7H7Y=
X-Google-Smtp-Source: ABdhPJwNKBYsLuiG7MmO1rP1TZQVCWEScL7Wn7rEabYIkS5ugbeuCCac5ztOmPJsmUppPC1+6neqmA==
X-Received: by 2002:a9d:66d4:: with SMTP id t20mr14111088otm.264.1608600143560;
	Mon, 21 Dec 2020 17:22:23 -0800 (PST)
Received: from localhost.localdomain ([50.236.19.102])
	by smtp.gmail.com with ESMTPSA id
	x20sm4070098oov.33.2020.12.21.17.22.18
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Dec 2020 17:22:23 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: darrick.wong@oracle.com, willy@infradead.org, david@fromorbit.com,
	hch@infradead.org, mhocko@kernel.org, akpm@linux-foundation.org,
	dhowells@redhat.com, jlayton@redhat.com
Date: Tue, 22 Dec 2020 09:21:31 +0800
Message-Id: <20201222012131.47020-5-laoar.shao@gmail.com>
In-Reply-To: <20201222012131.47020-1-laoar.shao@gmail.com>
References: <20201222012131.47020-1-laoar.shao@gmail.com>
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
Subject: [Linux-cachefs] [PATCH v14 4/4] xfs: use current->journal_info to
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
index b428704eeb20..e2f3251d6cce 100644
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
-	if (!tp->t_flags)
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
-	tp->t_flags = -1;
 }
 
 #endif	/* __XFS_TRANS_H__ */
-- 
2.18.4

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

