Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B8D9B2D209F
	for <lists+linux-cachefs@lfdr.de>; Tue,  8 Dec 2020 03:16:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-ZmvyPhQDPWOzD6CkjUJ47A-1; Mon, 07 Dec 2020 21:16:27 -0500
X-MC-Unique: ZmvyPhQDPWOzD6CkjUJ47A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BC47AFA82;
	Tue,  8 Dec 2020 02:16:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 316C95D6D5;
	Tue,  8 Dec 2020 02:16:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53F9D4E58E;
	Tue,  8 Dec 2020 02:16:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B82GGrK017114 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 21:16:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D1D2E2026D36; Tue,  8 Dec 2020 02:16:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD6992026D46
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 02:16:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 892F8100FBC5
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 02:16:14 +0000 (UTC)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-300-HoY09aLrMwOzFk0JtF_u1A-1; Mon, 07 Dec 2020 21:16:12 -0500
X-MC-Unique: HoY09aLrMwOzFk0JtF_u1A-1
Received: by mail-vk1-f196.google.com with SMTP id w66so1736549vka.3;
	Mon, 07 Dec 2020 18:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N4iknFTA7A8PYDmVPmJNoru7g6pRjx8JJZWZP7DeZ3U=;
	b=J9WSwZQCr2yB6JwPhEkNT5to4+vJQ4uUp1CrB3n1iepIV/zDPNV+0Cu2swhberDUBB
	00XO5RKc2a0Mp3LPDLhrAeIoQXf3s8Q+Oaw1iN4FPTYiLQlJ0B5Lz3n7ICpagKrjpBn6
	gTl2Z+c9tobBhkGLB5ZT3A3ile22a/1dJ8IKQo/4VCFg9QJWqWBGAic7eCiDQ8dMdBli
	cmcJp1bxlLcj2z7v1pywD3aOq94LuZvfzEVpLG+VCAfVbCfij//Q1eWqse92PpTkmBWv
	cuabQNQD/FButxUYWDNkuATDqqIlbk6OTnLsmNctPu3acF6Ry+Zuiuypd49qB4V623bo
	4yFw==
X-Gm-Message-State: AOAM531tTie3znwZ/yCz8p15Og//g15IMEPRLyi9wPxAQ/JGDoRckSCs
	eN79htKL0TWCKDmN3fav9Mc=
X-Google-Smtp-Source: ABdhPJx3PMfgbCqCB6rPTd5DamJ2UeJDaVGUaq3shuEg3TEJZiaBkppoCISMrKaL7MYLdiGJgHIYYA==
X-Received: by 2002:a1f:3411:: with SMTP id b17mr14936109vka.7.1607393771916; 
	Mon, 07 Dec 2020 18:16:11 -0800 (PST)
Received: from localhost.localdomain ([50.236.19.102])
	by smtp.gmail.com with ESMTPSA id
	o192sm1936000vko.19.2020.12.07.18.16.03
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Dec 2020 18:16:11 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: darrick.wong@oracle.com, willy@infradead.org, david@fromorbit.com,
	hch@infradead.org, mhocko@kernel.org, akpm@linux-foundation.org,
	dhowells@redhat.com, jlayton@redhat.com
Date: Tue,  8 Dec 2020 10:15:39 +0800
Message-Id: <20201208021543.76501-1-laoar.shao@gmail.com>
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-cachefs@redhat.com, Yafang Shao <laoar.shao@gmail.com>,
	linux-mm@kvack.org
Subject: [Linux-cachefs] [PATCH v10 0/4] xfs: avoid transaction reservation
	recursion
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

PF_FSTRANS which is used to avoid transaction reservation recursion, is
dropped since commit 9070733b4efa ("xfs: abstract PF_FSTRANS to
PF_MEMALLOC_NOFS") and commit 7dea19f9ee63 ("mm: introduce
memalloc_nofs_{save,restore} API"), and replaced by PF_MEMALLOC_NOFS which
means to avoid filesystem reclaim recursion.

As these two flags have different meanings, we'd better reintroduce
PF_FSTRANS back. To avoid wasting the space of PF_* flags in task_struct,
we can reuse the current->journal_info to do that, per Willy. As the 
check of transaction reservation recursion is used by XFS only, we can 
move the check into xfs_vm_writepage(s), per Dave.

Patch #1 and #2 are to use the memalloc_nofs_{save,restore} API,
which is introduced in
commit 7dea19f9ee63 ("mm: introduce memalloc_nofs_{save,restore} API"),
instead of using PF_MEMALLOC_NOFS directly in XFS.
Patch #1 is picked form Willy's patchset "Overhaul memalloc_no*"[1]

Patch #3 is the refactor of xfs_trans context, which is activated when
xfs_trans is allocated and deactivated when xfs_trans is freed.

Patch #4 is the implementation of reussing current->journal_info to
avoid transaction reservation recursion.

No obvious error occurred after running xfstests.

[1]. https://lore.kernel.org/linux-mm/20200625113122.7540-1-willy@infradead.org

v10:
- refactor the code, per Dave.

v9:
- rebase it on xfs tree.
- Darrick fixed an error occurred in xfs/141
- run xfstests, and no obvious error occurred.

v8:
- check xfs_trans_context_active() in xfs_vm_writepage(s), per Dave.

v7:
- check fstrans recursion for XFS only, by introducing a new member in
  struct writeback_control.

v6:
- add Michal's ack and comment in patch #1.

v5:
- pick one of Willy's patch
- introduce four new helpers, per Dave

v4:
- retitle from "xfs: introduce task->in_fstrans for transaction reservation
  recursion protection"
- reuse current->journal_info, per Willy


Matthew Wilcox (Oracle) (1):
  mm: Add become_kswapd and restore_kswapd

Yafang Shao (3):
  xfs: use memalloc_nofs_{save,restore} in xfs transaction
  xfs: refactor the usage around xfs_trans_context_{set,clear}
  xfs: use current->journal_info to avoid transaction reservation
    recursion

 fs/iomap/buffered-io.c    |  7 -------
 fs/xfs/libxfs/xfs_btree.c | 14 ++++++++------
 fs/xfs/xfs_aops.c         | 21 +++++++++++++++++++--
 fs/xfs/xfs_linux.h        |  4 ----
 fs/xfs/xfs_trans.c        | 24 +++++++++++-------------
 fs/xfs/xfs_trans.h        | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/sched/mm.h  | 23 +++++++++++++++++++++++
 mm/vmscan.c               | 16 +---------------
 8 files changed, 99 insertions(+), 47 deletions(-)

-- 
2.18.4

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

