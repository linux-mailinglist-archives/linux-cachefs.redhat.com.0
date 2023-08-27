Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A3878D40E
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Aug 2023 10:23:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693383829;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DiffSoBM6xrsWEj7S/28iry27m6SSeF0kifa1m6BLrw=;
	b=FrLlLuhp3DKJzKNZiTMBN6xPbNdL3W/p5CYb8pxIsl5+YtQ4Yv5aZV+ivG3Q68tWomxtQ8
	wSK9/490GcOjCHYruZuWEGWAo6RkySMJ/VC+CFtxH+eKBlA8iaJ+QYXCsR6sVzpVWkrWGe
	GdRigzlUw5YEPkA3zEU2K2bl+uAk+88=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-679--gwt0UP6MFG7RFbf2XoCVQ-1; Wed, 30 Aug 2023 04:23:46 -0400
X-MC-Unique: -gwt0UP6MFG7RFbf2XoCVQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1343F185A78F;
	Wed, 30 Aug 2023 08:23:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 097AA492C13;
	Wed, 30 Aug 2023 08:23:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F2DF91946A4B;
	Wed, 30 Aug 2023 08:23:34 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5A87919465A8 for <linux-cachefs@listman.corp.redhat.com>;
 Sun, 27 Aug 2023 13:30:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3AB06492C14; Sun, 27 Aug 2023 13:30:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33121492C13
 for <linux-cachefs@redhat.com>; Sun, 27 Aug 2023 13:30:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 055BF3C02B67
 for <linux-cachefs@redhat.com>; Sun, 27 Aug 2023 13:30:13 +0000 (UTC)
Received: from out-248.mta1.migadu.com (out-248.mta1.migadu.com
 [95.215.58.248]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-40B59jS7PC-Hb3Yiw6V1pg-1; Sun, 27 Aug 2023 09:30:09 -0400
X-MC-Unique: 40B59jS7PC-Hb3Yiw6V1pg-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Sun, 27 Aug 2023 21:28:24 +0800
Message-Id: <20230827132835.1373581-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Wed, 30 Aug 2023 08:22:42 +0000
Subject: [Linux-cachefs] [PATCH v6 00/11] io_uring getdents
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bpf@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-btrfs@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Hao Xu <howeyxu@tencent.com>

This series introduce getdents64 to io_uring, the code logic is similar
with the snychronized version's. It first try nowait issue, and offload
it to io-wq threads if the first try fails.

Patch1 and Patch2 are some preparation
Patch3 supports nowait for xfs getdents code
Patch4-11 are vfs change, include adding helpers and trylock for locks

Tests I've done:
A liburing test case for functional test:
https://github.com/HowHsu/liburing/commit/39dc9a8e19c06a8cebf8c2301b85320eb45c061e?diff=unified

Tested it with a liburing performance test:
https://github.com/HowHsu/liburing/blob/getdents/test/getdents2.c

The test is controlled by the below script[2] which runs getdents2.t 100
times and calulate the avg.
The result show that io_uring version is about 2.6% faster:

note:
[1] the number of getdents call/request in io_uring and normal sync version
are made sure to be same beforehand.

[2] run_getdents.py

```python3

import subprocess

N = 100
sum = 0.0
args = ["/data/home/howeyxu/tmpdir", "sync"]

for i in range(N):
    output = subprocess.check_output(["./liburing/test/getdents2.t"] + args)
    sum += float(output)

average = sum / N
print("Average of sync:", average)

sum = 0.0
args = ["/data/home/howeyxu/tmpdir", "iouring"]

for i in range(N):
    output = subprocess.check_output(["./liburing/test/getdents2.t"] + args)
    sum += float(output)

average = sum / N
print("Average of iouring:", average)

```

v5->v6:
 - remove xfs journal stuff since there are fundamental issues in the
   design.

v4->v5:
 - move atime update to the beginning of getdents operation
 - trylock for i_rwsem
 - nowait semantics for involved xfs journal stuff

v3->v4:
 - add Dave's xfs nowait code and fix a deadlock problem, with some code
   style tweak.
 - disable fixed file to avoid a race problem for now
 - add a test program.

v2->v3:
 - removed the kernfs patches
 - add f_pos_lock logic
 - remove the "reduce last EOF getdents try" optimization since
   Dominique reports that doesn't make difference
 - remove the rewind logic, I think the right way is to introduce lseek
   to io_uring not to patch this logic to getdents.
 - add Singed-off-by of Stefan Roesch for patch 1 since checkpatch
   complained that Co-developed-by someone should be accompanied with
   Signed-off-by same person, I can remove them if Stefan thinks that's
   not proper.


Dominique Martinet (1):
  fs: split off vfs_getdents function of getdents64 syscall

Hao Xu (10):
  xfs: add NOWAIT semantics for readdir
  vfs: add nowait flag for struct dir_context
  vfs: add a vfs helper for io_uring file pos lock
  vfs: add file_pos_unlock() for io_uring usage
  vfs: add a nowait parameter for touch_atime()
  vfs: add nowait parameter for file_accessed()
  vfs: move file_accessed() to the beginning of iterate_dir()
  vfs: error out -EAGAIN if atime needs to be updated
  vfs: trylock inode->i_rwsem in iterate_dir() to support nowait
  io_uring: add support for getdents

 arch/s390/hypfs/inode.c        |  2 +-
 block/fops.c                   |  2 +-
 fs/btrfs/file.c                |  2 +-
 fs/btrfs/inode.c               |  2 +-
 fs/cachefiles/namei.c          |  2 +-
 fs/coda/dir.c                  |  4 +--
 fs/ecryptfs/file.c             |  4 +--
 fs/ext2/file.c                 |  4 +--
 fs/ext4/file.c                 |  6 ++--
 fs/f2fs/file.c                 |  4 +--
 fs/file.c                      | 13 ++++++++
 fs/fuse/dax.c                  |  2 +-
 fs/fuse/file.c                 |  4 +--
 fs/gfs2/file.c                 |  2 +-
 fs/hugetlbfs/inode.c           |  2 +-
 fs/inode.c                     | 10 ++++--
 fs/internal.h                  |  8 +++++
 fs/namei.c                     |  4 +--
 fs/nfsd/vfs.c                  |  2 +-
 fs/nilfs2/file.c               |  2 +-
 fs/orangefs/file.c             |  2 +-
 fs/orangefs/inode.c            |  2 +-
 fs/overlayfs/file.c            |  2 +-
 fs/overlayfs/inode.c           |  2 +-
 fs/pipe.c                      |  2 +-
 fs/ramfs/file-nommu.c          |  2 +-
 fs/readdir.c                   | 61 ++++++++++++++++++++++++++--------
 fs/smb/client/cifsfs.c         |  2 +-
 fs/splice.c                    |  2 +-
 fs/stat.c                      |  2 +-
 fs/ubifs/file.c                |  2 +-
 fs/udf/file.c                  |  2 +-
 fs/xfs/libxfs/xfs_da_btree.c   | 16 +++++++++
 fs/xfs/libxfs/xfs_da_btree.h   |  1 +
 fs/xfs/libxfs/xfs_dir2_block.c |  7 ++--
 fs/xfs/libxfs/xfs_dir2_priv.h  |  2 +-
 fs/xfs/scrub/dir.c             |  2 +-
 fs/xfs/scrub/readdir.c         |  2 +-
 fs/xfs/xfs_dir2_readdir.c      | 49 +++++++++++++++++++++------
 fs/xfs/xfs_file.c              |  6 ++--
 fs/xfs/xfs_inode.c             | 27 +++++++++++++++
 fs/xfs/xfs_inode.h             | 17 ++++++----
 fs/zonefs/file.c               |  4 +--
 include/linux/file.h           |  7 ++++
 include/linux/fs.h             | 15 +++++++--
 include/uapi/linux/io_uring.h  |  1 +
 io_uring/fs.c                  | 53 +++++++++++++++++++++++++++++
 io_uring/fs.h                  |  3 ++
 io_uring/opdef.c               |  8 +++++
 kernel/bpf/inode.c             |  4 +--
 mm/filemap.c                   |  8 ++---
 mm/shmem.c                     |  6 ++--
 net/unix/af_unix.c             |  4 +--
 53 files changed, 310 insertions(+), 96 deletions(-)

-- 
2.25.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

