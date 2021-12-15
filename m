Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C4218475EFC
	for <lists+linux-cachefs@lfdr.de>; Wed, 15 Dec 2021 18:28:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-gnxeQ65hNZOHfFTWJQJCuQ-1; Wed, 15 Dec 2021 12:27:59 -0500
X-MC-Unique: gnxeQ65hNZOHfFTWJQJCuQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E8B0180833B;
	Wed, 15 Dec 2021 17:27:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B65424E2B3;
	Wed, 15 Dec 2021 17:27:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 22F3B1809C88;
	Wed, 15 Dec 2021 17:27:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BFHRlkt017444 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 15 Dec 2021 12:27:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0F201401A972; Wed, 15 Dec 2021 17:27:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AF0E40149B1
	for <linux-cachefs@redhat.com>; Wed, 15 Dec 2021 17:27:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E65042A59553
	for <linux-cachefs@redhat.com>; Wed, 15 Dec 2021 17:27:46 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-13-YBr2B_KeOwWYk6_z9oClyA-1; Wed, 15 Dec 2021 12:27:45 -0500
X-MC-Unique: YBr2B_KeOwWYk6_z9oClyA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 122E2B81D3F;
	Wed, 15 Dec 2021 17:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53EC7C36AE2;
	Wed, 15 Dec 2021 17:22:33 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 15 Dec 2021 18:20:52 +0100
Message-Id: <20211215172027.028132662@linuxfoundation.org>
In-Reply-To: <20211215172026.641863587@linuxfoundation.org>
References: <20211215172026.641863587@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BFHRlkt017444
X-loop: linux-cachefs@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, Jan Kara <jack@suse.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jeff Layton <jlayton@kernel.org>, stable@vger.kernel.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH 5.15 11/42] netfs: Fix lockdep warning from
	taking sb_writers whilst holding mmap_lock
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
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

From: David Howells <dhowells@redhat.com>

[ Upstream commit 598ad0bd09329818ee041cb3e4b60ba0a70cb1ee ]

Taking sb_writers whilst holding mmap_lock isn't allowed and will result in
a lockdep warning like that below.  The problem comes from cachefiles
needing to take the sb_writers lock in order to do a write to the cache,
but being asked to do this by netfslib called from readpage, readahead or
write_begin[1].

Fix this by always offloading the write to the cache off to a worker
thread.  The main thread doesn't need to wait for it, so deadlock can be
avoided.

This can be tested by running the quick xfstests on something like afs or
ceph with lockdep enabled.

WARNING: possible circular locking dependency detected
5.15.0-rc1-build2+ #292 Not tainted
------------------------------------------------------
holetest/65517 is trying to acquire lock:
ffff88810c81d730 (mapping.invalidate_lock#3){.+.+}-{3:3}, at: filemap_fault+0x276/0x7a5

but task is already holding lock:
ffff8881595b53e8 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x28d/0x59c

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #2 (&mm->mmap_lock#2){++++}-{3:3}:
       validate_chain+0x3c4/0x4a8
       __lock_acquire+0x89d/0x949
       lock_acquire+0x2dc/0x34b
       __might_fault+0x87/0xb1
       strncpy_from_user+0x25/0x18c
       removexattr+0x7c/0xe5
       __do_sys_fremovexattr+0x73/0x96
       do_syscall_64+0x67/0x7a
       entry_SYSCALL_64_after_hwframe+0x44/0xae

-> #1 (sb_writers#10){.+.+}-{0:0}:
       validate_chain+0x3c4/0x4a8
       __lock_acquire+0x89d/0x949
       lock_acquire+0x2dc/0x34b
       cachefiles_write+0x2b3/0x4bb
       netfs_rreq_do_write_to_cache+0x3b5/0x432
       netfs_readpage+0x2de/0x39d
       filemap_read_page+0x51/0x94
       filemap_get_pages+0x26f/0x413
       filemap_read+0x182/0x427
       new_sync_read+0xf0/0x161
       vfs_read+0x118/0x16e
       ksys_read+0xb8/0x12e
       do_syscall_64+0x67/0x7a
       entry_SYSCALL_64_after_hwframe+0x44/0xae

-> #0 (mapping.invalidate_lock#3){.+.+}-{3:3}:
       check_noncircular+0xe4/0x129
       check_prev_add+0x16b/0x3a4
       validate_chain+0x3c4/0x4a8
       __lock_acquire+0x89d/0x949
       lock_acquire+0x2dc/0x34b
       down_read+0x40/0x4a
       filemap_fault+0x276/0x7a5
       __do_fault+0x96/0xbf
       do_fault+0x262/0x35a
       __handle_mm_fault+0x171/0x1b5
       handle_mm_fault+0x12a/0x233
       do_user_addr_fault+0x3d2/0x59c
       exc_page_fault+0x85/0xa5
       asm_exc_page_fault+0x1e/0x30

other info that might help us debug this:

Chain exists of:
  mapping.invalidate_lock#3 --> sb_writers#10 --> &mm->mmap_lock#2

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&mm->mmap_lock#2);
                               lock(sb_writers#10);
                               lock(&mm->mmap_lock#2);
  lock(mapping.invalidate_lock#3);

 *** DEADLOCK ***

1 lock held by holetest/65517:
 #0: ffff8881595b53e8 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x28d/0x59c

stack backtrace:
CPU: 0 PID: 65517 Comm: holetest Not tainted 5.15.0-rc1-build2+ #292
Hardware name: ASUS All Series/H97-PLUS, BIOS 2306 10/09/2014
Call Trace:
 dump_stack_lvl+0x45/0x59
 check_noncircular+0xe4/0x129
 ? print_circular_bug+0x207/0x207
 ? validate_chain+0x461/0x4a8
 ? add_chain_block+0x88/0xd9
 ? hlist_add_head_rcu+0x49/0x53
 check_prev_add+0x16b/0x3a4
 validate_chain+0x3c4/0x4a8
 ? check_prev_add+0x3a4/0x3a4
 ? mark_lock+0xa5/0x1c6
 __lock_acquire+0x89d/0x949
 lock_acquire+0x2dc/0x34b
 ? filemap_fault+0x276/0x7a5
 ? rcu_read_unlock+0x59/0x59
 ? add_to_page_cache_lru+0x13c/0x13c
 ? lock_is_held_type+0x7b/0xd3
 down_read+0x40/0x4a
 ? filemap_fault+0x276/0x7a5
 filemap_fault+0x276/0x7a5
 ? pagecache_get_page+0x2dd/0x2dd
 ? __lock_acquire+0x8bc/0x949
 ? pte_offset_kernel.isra.0+0x6d/0xc3
 __do_fault+0x96/0xbf
 ? do_fault+0x124/0x35a
 do_fault+0x262/0x35a
 ? handle_pte_fault+0x1c1/0x20d
 __handle_mm_fault+0x171/0x1b5
 ? handle_pte_fault+0x20d/0x20d
 ? __lock_release+0x151/0x254
 ? mark_held_locks+0x1f/0x78
 ? rcu_read_unlock+0x3a/0x59
 handle_mm_fault+0x12a/0x233
 do_user_addr_fault+0x3d2/0x59c
 ? pgtable_bad+0x70/0x70
 ? rcu_read_lock_bh_held+0xab/0xab
 exc_page_fault+0x85/0xa5
 ? asm_exc_page_fault+0x8/0x30
 asm_exc_page_fault+0x1e/0x30
RIP: 0033:0x40192f
Code: ff 48 89 c3 48 8b 05 50 28 00 00 48 85 ed 7e 23 31 d2 4b 8d 0c 2f eb 0a 0f 1f 00 48 8b 05 39 28 00 00 48 0f af c2 48 83 c2 01 <48> 89 1c 01 48 39 d5 7f e8 8b 0d f2 27 00 00 31 c0 85 c9 74 0e 8b
RSP: 002b:00007f9931867eb0 EFLAGS: 00010202
RAX: 0000000000000000 RBX: 00007f9931868700 RCX: 00007f993206ac00
RDX: 0000000000000001 RSI: 0000000000000000 RDI: 00007ffc13e06ee0
RBP: 0000000000000100 R08: 0000000000000000 R09: 00007f9931868700
R10: 00007f99318689d0 R11: 0000000000000202 R12: 00007ffc13e06ee0
R13: 0000000000000c00 R14: 00007ffc13e06e00 R15: 00007f993206a000

Fixes: 726218fdc22c ("netfs: Define an interface to talk to a cache")
Signed-off-by: David Howells <dhowells@redhat.com>
Tested-by: Jeff Layton <jlayton@kernel.org>
cc: Jan Kara <jack@suse.cz>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
Link: https://lore.kernel.org/r/20210922110420.GA21576@quack2.suse.cz/ [1]
Link: https://lore.kernel.org/r/163887597541.1596626.2668163316598972956.stgit@warthog.procyon.org.uk/ # v1
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/netfs/read_helper.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 994ec22d40402..4b54529f8176b 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -354,16 +354,11 @@ static void netfs_rreq_write_to_cache_work(struct work_struct *work)
 	netfs_rreq_do_write_to_cache(rreq);
 }
 
-static void netfs_rreq_write_to_cache(struct netfs_read_request *rreq,
-				      bool was_async)
+static void netfs_rreq_write_to_cache(struct netfs_read_request *rreq)
 {
-	if (was_async) {
-		rreq->work.func = netfs_rreq_write_to_cache_work;
-		if (!queue_work(system_unbound_wq, &rreq->work))
-			BUG();
-	} else {
-		netfs_rreq_do_write_to_cache(rreq);
-	}
+	rreq->work.func = netfs_rreq_write_to_cache_work;
+	if (!queue_work(system_unbound_wq, &rreq->work))
+		BUG();
 }
 
 /*
@@ -560,7 +555,7 @@ static void netfs_rreq_assess(struct netfs_read_request *rreq, bool was_async)
 	wake_up_bit(&rreq->flags, NETFS_RREQ_IN_PROGRESS);
 
 	if (test_bit(NETFS_RREQ_WRITE_TO_CACHE, &rreq->flags))
-		return netfs_rreq_write_to_cache(rreq, was_async);
+		return netfs_rreq_write_to_cache(rreq);
 
 	netfs_rreq_completed(rreq, was_async);
 }
-- 
2.33.0




--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

