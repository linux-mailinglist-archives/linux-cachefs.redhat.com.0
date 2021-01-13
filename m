Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 871EC2F4881
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Jan 2021 11:23:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-jwWF444-NoK20Y0xEmy4uQ-1; Wed, 13 Jan 2021 05:23:23 -0500
X-MC-Unique: jwWF444-NoK20Y0xEmy4uQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A608100C601;
	Wed, 13 Jan 2021 10:23:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F373D71D6D;
	Wed, 13 Jan 2021 10:23:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 716B04BB7B;
	Wed, 13 Jan 2021 10:23:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10DANBxX016920 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 13 Jan 2021 05:23:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C45A51004150; Wed, 13 Jan 2021 10:23:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C049A1006EA6
	for <linux-cachefs@redhat.com>; Wed, 13 Jan 2021 10:23:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81C57811E76
	for <linux-cachefs@redhat.com>; Wed, 13 Jan 2021 10:23:09 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-435-8_eLqfsYMrKpzjJRmRy-0A-1; Wed, 13 Jan 2021 05:23:07 -0500
X-MC-Unique: 8_eLqfsYMrKpzjJRmRy-0A-1
Received: by mail-ot1-f48.google.com with SMTP id x5so1396936otp.9;
	Wed, 13 Jan 2021 02:23:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EZdWjEiE6JU4dDIJ/Pyi7n34O5hqZ+ARLNb+PckQnXM=;
	b=EbZVr2YLD7ltFfce2cqBd979ldA3q03WTVN3vZfMw/LabnY9qPPMRpv3PpotGJz6m6
	56XELO9dFN9sx7/1342ypW3pqXpm7e0LxBlu+qLMA5WM+yzHo4QaZgr/4v5sOcciDbhN
	3cSaii+bXBS0IQuV6CQ855NenjyPyR6bHiU8W8h+sx8Oy+7/LS6P60C34YuHqqWyZcba
	aU9/j/gJTc8MqkbLAXWFtHcRBhNS2xCHqtqdkK0k3mth+fJIcu8xZ7Soa0R2Q4VSQLHR
	pgiSqJygWHh49HnZ0C9hoatm3cC+zP7eNd7+ZUX5wlQSqkQY9qLTpmJ8SZhp9vr53pZs
	2dpA==
X-Gm-Message-State: AOAM532J9vBPmoqFdOHYRsRkPAAlTTAMGJRD6h0gMQByvb6yN+os3iU0
	dljxPCcBxHD7LMaMT0J4sL4=
X-Google-Smtp-Source: ABdhPJxzpcZ6oajkxTk/IqALwgCtGfZtB6bXMnDlhxhsoNwGNY4Zv4RvzAHa0fEt2VE6pimAVRh7CA==
X-Received: by 2002:a9d:19cb:: with SMTP id k69mr732136otk.75.1610533386389;
	Wed, 13 Jan 2021 02:23:06 -0800 (PST)
Received: from localhost.localdomain ([50.236.19.102])
	by smtp.gmail.com with ESMTPSA id z8sm335571oon.10.2021.01.13.02.22.58
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jan 2021 02:23:05 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: darrick.wong@oracle.com, willy@infradead.org, david@fromorbit.com,
	hch@infradead.org, mhocko@kernel.org, akpm@linux-foundation.org,
	dhowells@redhat.com, jlayton@redhat.com
Date: Wed, 13 Jan 2021 18:22:20 +0800
Message-Id: <20210113102224.13655-1-laoar.shao@gmail.com>
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
	oliver.sang@intel.com, linux-fsdevel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH v15 0/4] xfs: avoid transaction reservation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Patch #4 is the implementation of reusing current->journal_info to
avoid transaction reservation recursion.

No obvious error occurred after running xfstests
(with CONFIG_XFS_ASSERT_FATAL enabled).

[1]. https://lore.kernel.org/linux-mm/20200625113122.7540-1-willy@infradead.org

v15:
- fix Assertion_failed reported by kernel test robot
- run xfstests with CONFIG_XFS_ASSERT_FATAL enabled

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
  xfs: refactor the usage around xfs_trans_context_{set,clear}
  xfs: use current->journal_info to avoid transaction reservation
    recursion

 fs/iomap/buffered-io.c    |  7 -------
 fs/xfs/libxfs/xfs_btree.c | 14 ++++++++------
 fs/xfs/xfs_aops.c         | 14 ++++++++++++--
 fs/xfs/xfs_linux.h        |  4 ----
 fs/xfs/xfs_trans.c        | 26 ++++++++++++--------------
 fs/xfs/xfs_trans.h        | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/sched/mm.h  | 22 ++++++++++++++++++++++
 mm/vmscan.c               | 16 +---------------
 8 files changed, 91 insertions(+), 48 deletions(-)

-- 
2.17.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

