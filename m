Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB852F488D
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Jan 2021 11:23:32 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-cf3nS9PEPxKEMAt8kaLKTA-1; Wed, 13 Jan 2021 05:23:29 -0500
X-MC-Unique: cf3nS9PEPxKEMAt8kaLKTA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 721EB8066E0;
	Wed, 13 Jan 2021 10:23:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60D4E71D6D;
	Wed, 13 Jan 2021 10:23:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 746C44BB7B;
	Wed, 13 Jan 2021 10:23:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10DANNGV016942 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 13 Jan 2021 05:23:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 653CC2166B2A; Wed, 13 Jan 2021 10:23:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FA1C2166B2C
	for <linux-cachefs@redhat.com>; Wed, 13 Jan 2021 10:23:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AF868015B9
	for <linux-cachefs@redhat.com>; Wed, 13 Jan 2021 10:23:20 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
	[209.85.167.172]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-521-mMCJfv-mMqaIQ6qAQW4aFA-1; Wed, 13 Jan 2021 05:23:13 -0500
X-MC-Unique: mMCJfv-mMqaIQ6qAQW4aFA-1
Received: by mail-oi1-f172.google.com with SMTP id p5so1545003oif.7;
	Wed, 13 Jan 2021 02:23:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/Yc1Bbct8Nbc3LO9koCFr8h15MIb1wQ1a9mmnGoYcpk=;
	b=O/lixVBz3SpFhIzH66E6j61h1+0vu3iNfQVDltLVvYk29j5caoTgs0pzIWtQn1l7EY
	Rmd/RZ3DkNaNG4fAnzrsZgcTnvyz+fGtniXC8/eeeuisuEnRuHaDEW0gqrGF4n0xCZVC
	sB4bcSz+OhNYhsN7wpjBZ4l+LN5cY6oxyUK48sWMz+AIy95/DxZIWz3GPVbBjqvPgyDt
	C1BeQcF3CzIt9T0MTSD9pgmS+19m9GPiojZLWzm95zA5WpjVMmLDu/AVekAB7Gd7J7zh
	IYPwgmfcTa4kd5ZGmHsEU0n8u1Ee2CuwUK9eqAzOjK5VPwXo4apzP3FQhl8UkIH7IRkJ
	xltg==
X-Gm-Message-State: AOAM531USJzlbCOKZkC9yaoLptLlHPjQUHeAd8FoyoHsA2nyS0r4wsDJ
	t3Xujk2IyWluL0ORRAQGsbk=
X-Google-Smtp-Source: ABdhPJzUiAkWIHr2kwijHoq+jSnJ10xMB1fk4Dfd7rhcx9Shi9eFjtqGc0F+UWJoXBSC8NNwusBIFQ==
X-Received: by 2002:a54:4391:: with SMTP id u17mr728149oiv.30.1610533392875;
	Wed, 13 Jan 2021 02:23:12 -0800 (PST)
Received: from localhost.localdomain ([50.236.19.102])
	by smtp.gmail.com with ESMTPSA id z8sm335571oon.10.2021.01.13.02.23.06
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jan 2021 02:23:12 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: darrick.wong@oracle.com, willy@infradead.org, david@fromorbit.com,
	hch@infradead.org, mhocko@kernel.org, akpm@linux-foundation.org,
	dhowells@redhat.com, jlayton@redhat.com
Date: Wed, 13 Jan 2021 18:22:21 +0800
Message-Id: <20210113102224.13655-2-laoar.shao@gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Michal Hocko <mhocko@suse.com>, Yafang Shao <laoar.shao@gmail.com>,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, oliver.sang@intel.com,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH v15 1/4] mm: Add become_kswapd and
	restore_kswapd
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Since XFS needs to pretend to be kswapd in some of its worker threads,
create methods to save & restore kswapd state.  Don't bother restoring
kswapd state in kswapd -- the only time we reach this code is when we're
exiting and the task_struct is about to be destroyed anyway.

Cc: Dave Chinner <david@fromorbit.com>
Acked-by: Michal Hocko <mhocko@suse.com>
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 fs/xfs/libxfs/xfs_btree.c | 14 ++++++++------
 include/linux/sched/mm.h  | 22 ++++++++++++++++++++++
 mm/vmscan.c               | 16 +---------------
 3 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_btree.c b/fs/xfs/libxfs/xfs_btree.c
index c4d7a9241dc3..c43f2ad85af9 100644
--- a/fs/xfs/libxfs/xfs_btree.c
+++ b/fs/xfs/libxfs/xfs_btree.c
@@ -2813,8 +2813,9 @@ xfs_btree_split_worker(
 {
 	struct xfs_btree_split_args	*args = container_of(work,
 						struct xfs_btree_split_args, work);
+	bool			is_kswapd = args->kswapd;
 	unsigned long		pflags;
-	unsigned long		new_pflags = PF_MEMALLOC_NOFS;
+	int			memalloc_nofs;
 
 	/*
 	 * we are in a transaction context here, but may also be doing work
@@ -2822,16 +2823,17 @@ xfs_btree_split_worker(
 	 * temporarily to ensure that we don't block waiting for memory reclaim
 	 * in any way.
 	 */
-	if (args->kswapd)
-		new_pflags |= PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD;
-
-	current_set_flags_nested(&pflags, new_pflags);
+	if (is_kswapd)
+		pflags = become_kswapd();
+	memalloc_nofs = memalloc_nofs_save();
 
 	args->result = __xfs_btree_split(args->cur, args->level, args->ptrp,
 					 args->key, args->curp, args->stat);
 	complete(args->done);
 
-	current_restore_flags_nested(&pflags, new_pflags);
+	memalloc_nofs_restore(memalloc_nofs);
+	if (is_kswapd)
+		restore_kswapd(pflags);
 }
 
 /*
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index d5ece7a9a403..7195e542a54d 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -278,6 +278,28 @@ static inline void memalloc_nocma_restore(unsigned int flags)
 }
 #endif
 
+/*
+ * Tell the memory management code that this thread is working on behalf
+ * of background memory reclaim (like kswapd).  That means that it will
+ * get access to memory reserves should it need to allocate memory in
+ * order to make forward progress.  With this great power comes great
+ * responsibility to not exhaust those reserves.
+ */
+#define KSWAPD_PF_FLAGS		(PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD)
+
+static inline unsigned long become_kswapd(void)
+{
+	unsigned long flags = current->flags & KSWAPD_PF_FLAGS;
+
+	current->flags |= KSWAPD_PF_FLAGS;
+	return flags;
+}
+
+static inline void restore_kswapd(unsigned long flags)
+{
+	current->flags = (current->flags & ~KSWAPD_PF_FLAGS) | flags;
+}
+
 #ifdef CONFIG_MEMCG
 DECLARE_PER_CPU(struct mem_cgroup *, int_active_memcg);
 /**
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 7b4e31eac2cf..15af99d1f3f7 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3870,19 +3870,7 @@ static int kswapd(void *p)
 	if (!cpumask_empty(cpumask))
 		set_cpus_allowed_ptr(tsk, cpumask);
 
-	/*
-	 * Tell the memory management that we're a "memory allocator",
-	 * and that if we need more memory we should get access to it
-	 * regardless (see "__alloc_pages()"). "kswapd" should
-	 * never get caught in the normal page freeing logic.
-	 *
-	 * (Kswapd normally doesn't need memory anyway, but sometimes
-	 * you need a small amount of memory in order to be able to
-	 * page out something else, and this flag essentially protects
-	 * us from recursively trying to free more memory as we're
-	 * trying to free the first piece of memory in the first place).
-	 */
-	tsk->flags |= PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD;
+	become_kswapd();
 	set_freezable();
 
 	WRITE_ONCE(pgdat->kswapd_order, 0);
@@ -3932,8 +3920,6 @@ static int kswapd(void *p)
 			goto kswapd_try_sleep;
 	}
 
-	tsk->flags &= ~(PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD);
-
 	return 0;
 }
 
-- 
2.17.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

