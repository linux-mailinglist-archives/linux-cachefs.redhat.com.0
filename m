Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C58DA2D20A4
	for <lists+linux-cachefs@lfdr.de>; Tue,  8 Dec 2020 03:16:49 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-tbwAG5K_MsGZHRrFmyWjvA-1; Mon, 07 Dec 2020 21:16:47 -0500
X-MC-Unique: tbwAG5K_MsGZHRrFmyWjvA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79EEB1934103;
	Tue,  8 Dec 2020 02:16:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67D0539A4B;
	Tue,  8 Dec 2020 02:16:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54E264BB40;
	Tue,  8 Dec 2020 02:16:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B82GgLg017194 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 21:16:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D98BB86D8E; Tue,  8 Dec 2020 02:16:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3C0D86D7A
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 02:16:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61575800140
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 02:16:42 +0000 (UTC)
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-252-2grH31DIMnSZCKypE0TgFA-1; Mon, 07 Dec 2020 21:16:38 -0500
X-MC-Unique: 2grH31DIMnSZCKypE0TgFA-1
Received: by mail-vk1-f193.google.com with SMTP id e5so3612579vkd.4;
	Mon, 07 Dec 2020 18:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ud8rBXD383H8tEM/7RAKMWYYnbYnYvq5454vllAa0OE=;
	b=TCDI4YkzrqlrFgMSeDqvHGIGxFa5fWwlSVPqEfsMesYMCL1zUYupDkLttbDJotkfW6
	fVmu14Mrj7p9EgWMLvn1+osIoee5YXIouoFp0m9Uv07s0/C32t89zn5yhx4auuxztq8+
	OpF20ARphyf79/PxctfoemP2GhOfgly7MyYxCDNBP3XBHJOmXt3vTYvBzxwwqkK5NnxP
	pn21ZS67ZL8WBFNK+ErY8vVK0kPy6hiN9MtJOGSOJzR+ycB5QXkF5pMb4h/cOe8VvEAV
	z6R35L0A2bPy6vSZpPREnuE4cc8x1rC0LqbH/M871nnQJV9sD/Xp5MjCxs2fGdvbaDWp
	hBOQ==
X-Gm-Message-State: AOAM5331UexUUCv6Eo2st9i24mOlHQ4fX9w3Q4JxabRei/wJ0q9wxLKX
	I0A4aGZhF2IKD1yf25DVvIQ=
X-Google-Smtp-Source: ABdhPJwtzaP1P4kV/OMfdLX2VU8BtGy0weGaN3rGGYXb2OGURumF3K/0Y8TvDMi1DQu/8hTd0EjkSw==
X-Received: by 2002:a1f:a541:: with SMTP id o62mr14930646vke.9.1607393797625; 
	Mon, 07 Dec 2020 18:16:37 -0800 (PST)
Received: from localhost.localdomain ([50.236.19.102])
	by smtp.gmail.com with ESMTPSA id
	o192sm1936000vko.19.2020.12.07.18.16.31
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Dec 2020 18:16:37 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: darrick.wong@oracle.com, willy@infradead.org, david@fromorbit.com,
	hch@infradead.org, mhocko@kernel.org, akpm@linux-foundation.org,
	dhowells@redhat.com, jlayton@redhat.com
Date: Tue,  8 Dec 2020 10:15:43 +0800
Message-Id: <20201208021543.76501-5-laoar.shao@gmail.com>
In-Reply-To: <20201208021543.76501-1-laoar.shao@gmail.com>
References: <20201208021543.76501-1-laoar.shao@gmail.com>
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
Subject: [Linux-cachefs] [PATCH v10 4/4] xfs: use current->journal_info to
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

PF_FSTRANS which is used to avoid transaction reservation recursion, is
dropped since commit 9070733b4efa ("xfs: abstract PF_FSTRANS to
PF_MEMALLOC_NOFS") and commit 7dea19f9ee63 ("mm: introduce
memalloc_nofs_{save,restore} API") and replaced by PF_MEMALLOC_NOFS which
means to avoid filesystem reclaim recursion.

As these two flags have different meanings, we'd better reintroduce
PF_FSTRANS back. To avoid wasting the space of PF_* flags in task_struct,
we can reuse the current->journal_info to do that, per Willy. As the
check of transaction reservation recursion is used by XFS only, we can
move the check into xfs_vm_writepage(s), per Dave.

To better abstract that behavoir, two new helpers are introduced, as
follows,
- xfs_trans_context_active
  To check whehter current is in fs transcation or not
- xfs_trans_context_swap
  Transfer the transaction context when rolling a permanent transaction

These two new helpers are instroduced in xfs_trans.h.

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
 fs/xfs/xfs_trans.c     |  3 +++
 fs/xfs/xfs_trans.h     | 25 +++++++++++++++++++++++++
 4 files changed, 45 insertions(+), 7 deletions(-)

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
index 2371187b7615..28db93d0da97 100644
--- a/fs/xfs/xfs_aops.c
+++ b/fs/xfs/xfs_aops.c
@@ -568,6 +568,16 @@ xfs_vm_writepage(
 {
 	struct xfs_writepage_ctx wpc = { };
 
+	/*
+	 * Given that we do not allow direct reclaim to call us, we should
+	 * never be called while in a filesystem transaction.
+	 */
+	if (xfs_trans_context_active()) {
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
+	if (xfs_trans_context_active())
+		return 0;
+
 	return iomap_writepages(mapping, wbc, &wpc.ctx, &xfs_writeback_ops);
 }
 
diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
index fe20398a214e..08d4916ffb13 100644
--- a/fs/xfs/xfs_trans.c
+++ b/fs/xfs/xfs_trans.c
@@ -124,6 +124,9 @@ xfs_trans_dup(
 	tp->t_rtx_res = tp->t_rtx_res_used;
 	ntp->t_pflags = tp->t_pflags;
 
+	/* Associate the new transaction with this thread. */
+	xfs_trans_context_swap(tp, ntp);
+
 	/* move deferred ops over to the new tp */
 	xfs_defer_move(ntp, tp);
 
diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
index 44b11c64a15e..82c6735e40fc 100644
--- a/fs/xfs/xfs_trans.h
+++ b/fs/xfs/xfs_trans.h
@@ -268,16 +268,41 @@ xfs_trans_item_relog(
 	return lip->li_ops->iop_relog(lip, tp);
 }
 
+static inline bool
+xfs_trans_context_active(void)
+{
+	/* Use journal_info to indicate current is in a transaction */
+	if (WARN_ON_ONCE(current->journal_info != NULL))
+		return true;
+
+	return false;
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
+	ASSERT(current->journal_info == tp);
+	current->journal_info = NULL;
 	memalloc_nofs_restore(tp->t_pflags);
 }
 
+/*
+ * Transfer the transaction context when rolling a permanent
+ * transaction.
+ */
+static inline void
+xfs_trans_context_swap(struct xfs_trans *tp, struct xfs_trans *ntp)
+{
+	ASSERT(current->journal_info == tp);
+	current->journal_info = ntp;
+}
+
 #endif	/* __XFS_TRANS_H__ */
-- 
2.18.4

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

