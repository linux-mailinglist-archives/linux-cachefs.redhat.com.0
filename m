Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E70212E03C6
	for <lists+linux-cachefs@lfdr.de>; Tue, 22 Dec 2020 02:22:21 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-hvMEqJWoP-Ciq2dWsn77Kg-1; Mon, 21 Dec 2020 20:22:19 -0500
X-MC-Unique: hvMEqJWoP-Ciq2dWsn77Kg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E260715722;
	Tue, 22 Dec 2020 01:22:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57A9019D9C;
	Tue, 22 Dec 2020 01:22:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 34F2E180954D;
	Tue, 22 Dec 2020 01:22:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BM1M778002848 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 21 Dec 2020 20:22:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 567DC2026D3B; Tue, 22 Dec 2020 01:22:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5118B2026D46
	for <linux-cachefs@redhat.com>; Tue, 22 Dec 2020 01:22:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3176E858EEC
	for <linux-cachefs@redhat.com>; Tue, 22 Dec 2020 01:22:05 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
	[209.85.161.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-336-YneJcvK5MnWs4L4UrNK20w-1; Mon, 21 Dec 2020 20:22:01 -0500
X-MC-Unique: YneJcvK5MnWs4L4UrNK20w-1
Received: by mail-oo1-f50.google.com with SMTP id j21so2628489oou.11;
	Mon, 21 Dec 2020 17:22:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zfyd8+tCEuNHXvryEXCzCH9GQPnu047cakpfMip3n1U=;
	b=cKnYGVdkAHJpN2g1B/9nuMc1jNo2Q4lHWd9lrKqOiOx8cWdSh2zUhyw91jGLz21hkj
	dBKVj+iVGWL5VCsr/NLFJ6OBo5ZeMPKbO7dT9/pTF81+RBLXRMAdmjVSh55j46btRK9R
	CzS/yY3JzBmVWYR3ELaRBKnuiI7Wh1tbFpqYkyoGNdiUGxfpRW/on7TFWc7DWGWrXXzk
	nEFfL7faOySalR+pl5JIhfUVT1Vgdby0Iy/ZrIaZElbt3asqpm9kcQCjtKpked38pdIj
	vdAK8lsa0iwVOsGlHUtUMSrkitIVwZ7GWUcUQuZBbqcyzqAh1xUK5N+EdrHU31hsm1qg
	Ki5g==
X-Gm-Message-State: AOAM5337xxs1u3l1Bh3LtGITSR83nKl1vp4sOvXDfTcA6vUAy0CmjPKc
	EblA7g8ZHpwyfx80WiuJLCY=
X-Google-Smtp-Source: ABdhPJxHbyNtUyWl/WAzlJIE1qh8PdfS5Lc7Wnsu58XQtOTCmiUcs7dFLLap8LrPisiuzgB49qLBoQ==
X-Received: by 2002:a4a:d118:: with SMTP id k24mr13348179oor.8.1608600120359; 
	Mon, 21 Dec 2020 17:22:00 -0800 (PST)
Received: from localhost.localdomain ([50.236.19.102])
	by smtp.gmail.com with ESMTPSA id
	x20sm4070098oov.33.2020.12.21.17.21.53
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Dec 2020 17:21:59 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: darrick.wong@oracle.com, willy@infradead.org, david@fromorbit.com,
	hch@infradead.org, mhocko@kernel.org, akpm@linux-foundation.org,
	dhowells@redhat.com, jlayton@redhat.com
Date: Tue, 22 Dec 2020 09:21:27 +0800
Message-Id: <20201222012131.47020-1-laoar.shao@gmail.com>
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
Subject: [Linux-cachefs] [PATCH v14 0/4] xfs: avoid transaction reservation
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Patch #3 introduces xfs_trans_context_swap() for rolling transaction.

Patch #4 is the implementation of reusing current->journal_info to
avoid transaction reservation recursion.

No obvious error occurred after running xfstests.

[1]. https://lore.kernel.org/linux-mm/20200625113122.7540-1-willy@infradead.org

v14:
- minor optimze in restore_kswapd(), per Dave.
- don't need to refactor xfs_trans_context_{set,clear} 
- remove redundant comments in patch #4

v13:
- move xfs_trans_context_swap() into patch #3 and set NOFS to the old
  transaction

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
  xfs: introduce xfs_trans_context_swap() for rolling transaction
  xfs: use current->journal_info to avoid transaction reservation
    recursion

 fs/iomap/buffered-io.c    |  7 -------
 fs/xfs/libxfs/xfs_btree.c | 14 ++++++++------
 fs/xfs/xfs_aops.c         | 14 ++++++++++++--
 fs/xfs/xfs_linux.h        |  4 ----
 fs/xfs/xfs_trans.c        | 17 ++++++++++-------
 fs/xfs/xfs_trans.h        | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/sched/mm.h  | 22 ++++++++++++++++++++++
 mm/vmscan.c               | 16 +---------------
 8 files changed, 89 insertions(+), 41 deletions(-)

-- 
2.18.4

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

