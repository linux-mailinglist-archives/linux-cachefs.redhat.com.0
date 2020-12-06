Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A033F2D0132
	for <lists+linux-cachefs@lfdr.de>; Sun,  6 Dec 2020 07:41:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-BTLZ9EoZOLSZwHHzjgpfhg-1; Sun, 06 Dec 2020 01:41:41 -0500
X-MC-Unique: BTLZ9EoZOLSZwHHzjgpfhg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A11D107ACE3;
	Sun,  6 Dec 2020 06:41:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FFE4289BF;
	Sun,  6 Dec 2020 06:41:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 147724A7C6;
	Sun,  6 Dec 2020 06:41:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B66fShf021957 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 6 Dec 2020 01:41:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 542682166B28; Sun,  6 Dec 2020 06:41:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ED7D2166B27
	for <linux-cachefs@redhat.com>; Sun,  6 Dec 2020 06:41:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08F6C811E76
	for <linux-cachefs@redhat.com>; Sun,  6 Dec 2020 06:41:26 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-414-qLQhnh25NSaAt-eqGP4x-g-1; Sun, 06 Dec 2020 01:41:20 -0500
X-MC-Unique: qLQhnh25NSaAt-eqGP4x-g-1
Received: by mail-ot1-f67.google.com with SMTP id j12so9486577ota.7;
	Sat, 05 Dec 2020 22:41:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4uryp7VoMw6vTHsDBKmQdtkum5EctehoaGW3WLCaGdw=;
	b=Zdyy22CV2XOTj8tMzigKWUmKwNYNyhqDhWGhwKAVA9eruU9phIibDveh+m1CvY6w91
	x3hQ7XxemhdLJGl/63ltmtmTVIB+LLTCHd4cRY0njjIq6IcsxHFdQeHISc3Wn6qtdsRt
	pTvk7OTBMsN72gIau1lUZZtGoQwbDuX/iZf0XSpj9waZRgmRk/ZcCJC2EBrQD7lGfeqR
	7ZrrW8y5Zp41XmTC7qdbOF+STqal2ohao5wQXe+JD3TVdoaDghvJUXmYF1GWtgioufVy
	mjzNdVTIUJcVD6IiVvcWi0JHJ4kQcc7Abx+yUaztmVH1QQdn9jJSzK3reotZgCb1qdOh
	nAUg==
X-Gm-Message-State: AOAM531Uwvp3BQ/gcU3R8DOkDsS913mjdnX7wJ7jK+PrWntAeEdYQxFi
	szaQst7TsleGqmSWlHVyoNI=
X-Google-Smtp-Source: ABdhPJz0zuQ/HHcKj74pAmZf49zndavOqXdbZx9Dmc3IsyKF1npPcXqG51F8231ukrl21NZjZd7usw==
X-Received: by 2002:a9d:708e:: with SMTP id l14mr9199595otj.87.1607236879898; 
	Sat, 05 Dec 2020 22:41:19 -0800 (PST)
Received: from localhost.localdomain ([122.225.203.131])
	by smtp.gmail.com with ESMTPSA id
	y18sm1817553ooj.20.2020.12.05.22.41.13
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Dec 2020 22:41:19 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: darrick.wong@oracle.com, willy@infradead.org, hch@infradead.org,
	david@fromorbit.com, mhocko@kernel.org, 000akpm@linux-foundation.org,
	dhowells@redhat.com, jlayton@redhat.com
Date: Sun,  6 Dec 2020 14:40:44 +0800
Message-Id: <20201206064046.2921-1-laoar.shao@gmail.com>
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-cachefs@redhat.com, Yafang Shao <laoar.shao@gmail.com>,
	linux-mm@kvack.org
Subject: [Linux-cachefs] [PATCH v9 0/2] avoid xfs transaction reservation
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

This patchset avoids transaction reservation recursion by reintroducing
the discarded PF_FSTRANS in a new way, suggested by Dave. In this new 
implementation, some new helpers are introduced, which are 
xfs_trans_context_{set, clear, active},
suggested by Dave. And re-using the task->journal_info to indicates
whehter the task is in fstrans or not, suggested by Willy

Darrick helped fix the error occurred in xfs/141.[2]

I rerun the xfstests again in my server, and no obvious error occurred.

Patch #1 is picked from Willy's patchset "Overhaul memalloc_no*"[1]

[1].
https://lore.kernel.org/linux-mm/20200625113122.7540-1-willy@infradead.org/
[2]. https://lore.kernel.org/linux-xfs/20201104001649.GN7123@magnolia/#t


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

Yafang Shao (1):
  xfs: avoid transaction reservation recursion

 fs/iomap/buffered-io.c    |  7 -------
 fs/xfs/libxfs/xfs_btree.c | 14 ++++++++------
 fs/xfs/xfs_aops.c         | 23 +++++++++++++++++++++--
 fs/xfs/xfs_linux.h        |  4 ----
 fs/xfs/xfs_trans.c        | 25 +++++++++++++------------
 fs/xfs/xfs_trans.h        | 23 +++++++++++++++++++++++
 include/linux/sched/mm.h  | 23 +++++++++++++++++++++++
 mm/vmscan.c               | 16 +---------------
 8 files changed, 89 insertions(+), 46 deletions(-)

-- 
2.18.4

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

