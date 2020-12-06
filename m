Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DE2352D0133
	for <lists+linux-cachefs@lfdr.de>; Sun,  6 Dec 2020 07:41:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-_QNf0x33P0a_UeScOrRirw-1; Sun, 06 Dec 2020 01:41:50 -0500
X-MC-Unique: _QNf0x33P0a_UeScOrRirw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B32A3180A087;
	Sun,  6 Dec 2020 06:41:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8641560CF0;
	Sun,  6 Dec 2020 06:41:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 179ED180954D;
	Sun,  6 Dec 2020 06:41:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B66fihn021982 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 6 Dec 2020 01:41:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7FC5E2026D3D; Sun,  6 Dec 2020 06:41:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B15B2026D3C
	for <linux-cachefs@redhat.com>; Sun,  6 Dec 2020 06:41:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AE49811E76
	for <linux-cachefs@redhat.com>; Sun,  6 Dec 2020 06:41:42 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-16-OpygBMQgMsusirmX5Bnzew-1; Sun, 06 Dec 2020 01:41:36 -0500
X-MC-Unique: OpygBMQgMsusirmX5Bnzew-1
Received: by mail-ot1-f68.google.com with SMTP id o11so6818503ote.4;
	Sat, 05 Dec 2020 22:41:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=m+1GohZiu08TBGb+QZ95Ht2UJWzVkthZE/EPME/oCwk=;
	b=i+F7j8Ms/05E8bNZzoBAFjawJHzzybT2nfw9euqzhIFk5YQrZsIF6XvkuFmNsBNrnE
	5YDbtGdmMeizI9IoypoNs7cN/w7L2uFLOZ7pDpo0sQZMkSyrbeDygPOhHAeGZ7xBNkt+
	+Yt3bFbIQJ/c1iwfg4usUq2htc0e9rPivoA3YCrSF7nJ0UXZ6c2Bltl/HzXICRAuNTzI
	GJg2SFcp0SyxC/8b/eBuS0nBudYPH6X/JHX+L5WTr+1bjtFjMi9z9WuxnQasnu1W6GY4
	FHrqqubPNMt8F1KBGXl2Y+A7kZGQUzg3f9E99kX2dJuHCSfjjqEVUu+j9dCEwOHl2XUq
	G2pg==
X-Gm-Message-State: AOAM533RFKeTN79s5mFBXQ2XA7/YgVkaMyM4DFv8GvHJTqTphZ6BTF1G
	Ez9dpqGAyAmQjO0F2IphFwU=
X-Google-Smtp-Source: ABdhPJyaG+OZH5jroE971JONC6KbGt2J1QNHjJpwed0eyCQiNNQbHe8nYwl0PABcVt48pyD2EA234Q==
X-Received: by 2002:a9d:6b8d:: with SMTP id b13mr8985231otq.168.1607236896025; 
	Sat, 05 Dec 2020 22:41:36 -0800 (PST)
Received: from localhost.localdomain ([122.225.203.131])
	by smtp.gmail.com with ESMTPSA id
	y18sm1817553ooj.20.2020.12.05.22.41.24
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Dec 2020 22:41:35 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: darrick.wong@oracle.com, willy@infradead.org, hch@infradead.org,
	david@fromorbit.com, mhocko@kernel.org, 000akpm@linux-foundation.org,
	dhowells@redhat.com, jlayton@redhat.com
Date: Sun,  6 Dec 2020 14:40:45 +0800
Message-Id: <20201206064046.2921-2-laoar.shao@gmail.com>
In-Reply-To: <20201206064046.2921-1-laoar.shao@gmail.com>
References: <20201206064046.2921-1-laoar.shao@gmail.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Yafang Shao <laoar.shao@gmail.com>,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH v9 1/2] mm: Add become_kswapd and
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 include/linux/sched/mm.h  | 23 +++++++++++++++++++++++
 mm/vmscan.c               | 16 +---------------
 3 files changed, 32 insertions(+), 21 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_btree.c b/fs/xfs/libxfs/xfs_btree.c
index 2d25bab68764..a04a44238aab 100644
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
index d5ece7a9a403..2faf03e79a1e 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -278,6 +278,29 @@ static inline void memalloc_nocma_restore(unsigned int flags)
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
+
+	return flags;
+}
+
+static inline void restore_kswapd(unsigned long flags)
+{
+	current->flags &= ~(flags ^ KSWAPD_PF_FLAGS);
+}
+
 #ifdef CONFIG_MEMCG
 DECLARE_PER_CPU(struct mem_cgroup *, int_active_memcg);
 /**
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 1b8f0e059767..77bc1dda75bf 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3869,19 +3869,7 @@ static int kswapd(void *p)
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
@@ -3931,8 +3919,6 @@ static int kswapd(void *p)
 			goto kswapd_try_sleep;
 	}
 
-	tsk->flags &= ~(PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD);
-
 	return 0;
 }
 
-- 
2.18.4

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

