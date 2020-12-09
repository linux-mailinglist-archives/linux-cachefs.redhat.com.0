Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E3F342D42F3
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Dec 2020 14:14:47 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-7NaNkzrVPiuwr75mfVsN0g-1; Wed, 09 Dec 2020 08:13:42 -0500
X-MC-Unique: 7NaNkzrVPiuwr75mfVsN0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C7F0894B56;
	Wed,  9 Dec 2020 13:13:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AD3C5D71D;
	Wed,  9 Dec 2020 13:13:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 405B518095C7;
	Wed,  9 Dec 2020 13:13:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B9DCGUO030265 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 9 Dec 2020 08:12:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 427B710FFE6C; Wed,  9 Dec 2020 13:12:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DC291142366
	for <linux-cachefs@redhat.com>; Wed,  9 Dec 2020 13:12:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E60E4800183
	for <linux-cachefs@redhat.com>; Wed,  9 Dec 2020 13:12:13 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-459-bAjOgTgIOMWmOrYMlWmgyw-1; Wed, 09 Dec 2020 08:12:11 -0500
X-MC-Unique: bAjOgTgIOMWmOrYMlWmgyw-1
Received: by mail-qt1-f195.google.com with SMTP id h19so797091qtq.13;
	Wed, 09 Dec 2020 05:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Fp/zlSJNune866vhfPRgWPP0qPocE+vROnJvQxS4p80=;
	b=Wemw19lujB56e8aCtCbNtfzxHs692dX5Ezewd/VSigskxvJ56mvFgocCj7SvNkoYwQ
	+HzYKEo203/YCRSRJkLSkpbCXG8rjuOcMiX7qeLUYKxwAWHY+Hoey8ttZqPgue6Kb1L4
	/5S95ycnWksIY3VlLkvZDgcKjtjaERwLbIM/Yd5Rn5Syaxdqt1S8Vo94DLjBL1Lx/fZb
	Brn2yG7RMJu7RKc17T0byxT8nNdE5rbX6pFUvxL23pvK+4w0Vu0IRco3YmV2J93fVRkv
	DcrWZLm9zCfpktZBJwLJXhVs1byU8nS4LXwP1ccpGgCkWGApimo1eyV4YILjJnZ6WloR
	7pZw==
X-Gm-Message-State: AOAM530awcMnvrZh/40QX6nVR0+fz30cUK/6gN/OUZQydCv7tDTZj7GY
	yGvpPQixIg3gsCv9I7ES7Z0=
X-Google-Smtp-Source: ABdhPJwtyKiLT8mj11kfTalztFan4ZD94eHgt1nxgmaGAp//Gvty4tmLVaeIkkdgh0EHjqteRp+v3w==
X-Received: by 2002:ac8:5911:: with SMTP id 17mr3001559qty.218.1607519531161; 
	Wed, 09 Dec 2020 05:12:11 -0800 (PST)
Received: from localhost.localdomain ([50.236.19.102])
	by smtp.gmail.com with ESMTPSA id u72sm938114qka.15.2020.12.09.05.12.02
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Dec 2020 05:12:10 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: darrick.wong@oracle.com, willy@infradead.org, david@fromorbit.com,
	hch@infradead.org, mhocko@kernel.org, akpm@linux-foundation.org,
	dhowells@redhat.com, jlayton@redhat.com
Date: Wed,  9 Dec 2020 21:11:42 +0800
Message-Id: <20201209131146.67289-1-laoar.shao@gmail.com>
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-cachefs@redhat.com, Yafang Shao <laoar.shao@gmail.com>,
	linux-mm@kvack.org
Subject: [Linux-cachefs] [PATCH v12 0/4] xfs: avoid transaction reservation
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

Patch #1 and #2 are to use the memalloc_nofs_{save,restore} API 
Patch #1 is picked form Willy's patchset "Overhaul memalloc_no*"[1]

Patch #3 is the refactor of xfs_trans context, which is activated when
xfs_trans is allocated and deactivated when xfs_trans is freed.

Patch #4 is the implementation of reussing current->journal_info to
avoid transaction reservation recursion.

No obvious error occurred after running xfstests.

[1]. https://lore.kernel.org/linux-mm/20200625113122.7540-1-willy@infradead.org

v12:
Per Darrick's suggestion,
- add the check before calling xfs_trans_context_clear() in
  xfs_trans_context_free().
- move t_pflags into xfs_trans_context_swap()

v11:
- add the warning at the callsite of xfs_trans_context_active()
- improve the commit log of patch #2

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
 fs/xfs/xfs_trans.c        | 33 +++++++++++++++++++--------------
 fs/xfs/xfs_trans.h        | 35 +++++++++++++++++++++++++++++++++++
 include/linux/sched/mm.h  | 23 +++++++++++++++++++++++
 mm/vmscan.c               | 16 +---------------
 8 files changed, 105 insertions(+), 48 deletions(-)

-- 
2.18.4

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

