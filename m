Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0D29A28088A
	for <lists+linux-cachefs@lfdr.de>; Thu,  1 Oct 2020 22:39:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-visx9Pf-MAqm-i178cwmXQ-1; Thu, 01 Oct 2020 16:39:51 -0400
X-MC-Unique: visx9Pf-MAqm-i178cwmXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD37A873115;
	Thu,  1 Oct 2020 20:39:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45F3260BFA;
	Thu,  1 Oct 2020 20:39:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 823C344A4C;
	Thu,  1 Oct 2020 20:39:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PDo7r8009456 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 09:50:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D04742156A2D; Fri, 25 Sep 2020 13:50:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAEDF2156A23
	for <linux-cachefs@redhat.com>; Fri, 25 Sep 2020 13:50:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF78780351B
	for <linux-cachefs@redhat.com>; Fri, 25 Sep 2020 13:50:03 +0000 (UTC)
Received: from r3-25.sinamail.sina.com.cn (r3-25.sinamail.sina.com.cn
	[202.108.3.25]) by relay.mimecast.com with ESMTP id
	us-mta-521-WAkcgeaoOOyJmHtl0EadOQ-1; Fri, 25 Sep 2020 09:49:59 -0400
X-MC-Unique: WAkcgeaoOOyJmHtl0EadOQ-1
Received: from unknown (HELO localhost.localdomain)([221.219.2.146])
	by sina.com with ESMTP
	id 5F6DF4F100034098; Fri, 25 Sep 2020 21:47:32 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 31956454919407
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+2d0585e5efcd43d113c2@syzkaller.appspotmail.com>
Date: Fri, 25 Sep 2020 21:47:19 +0800
Message-Id: <20200925134719.11444-1-hdanton@sina.com>
In-Reply-To: <000000000000e32a8b05b01f808a@google.com>
References: <000000000000e32a8b05b01f808a@google.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 01 Oct 2020 16:39:46 -0400
Cc: Hillf Danton <hdanton@sina.com>, linux-cachefs@redhat.com,
	syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-cachefs] KASAN: use-after-free Read in
	fscache_alloc_cookie
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Fri, 25 Sep 2020 01:57:16 -0700
> syzbot found the following issue on:
> 
> HEAD commit:    171d4ff7 Merge tag 'mmc-v5.9-rc4-2' of git://git.kernel.or..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=17d457b5900000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5f4c828c9e3cef97
> dashboard link: https://syzkaller.appspot.com/bug?extid=2d0585e5efcd43d113c2
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16a33ad3900000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+2d0585e5efcd43d113c2@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: use-after-free in memcpy include/linux/string.h:406 [inline]
> BUG: KASAN: use-after-free in fscache_set_key fs/fscache/cookie.c:93 [inline]
> BUG: KASAN: use-after-free in fscache_alloc_cookie+0xff/0x730 fs/fscache/cookie.c:153
> Read of size 10 at addr ffff8880a6c28200 by task kworker/1:6/8760
> 
> CPU: 1 PID: 8760 Comm: kworker/1:6 Not tainted 5.9.0-rc6-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Workqueue: afs afs_manage_cell
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x198/0x1fd lib/dump_stack.c:118
>  print_address_description.constprop.0.cold+0xae/0x497 mm/kasan/report.c:383
>  __kasan_report mm/kasan/report.c:513 [inline]
>  kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
>  check_memory_region_inline mm/kasan/generic.c:186 [inline]
>  check_memory_region+0x13d/0x180 mm/kasan/generic.c:192
>  memcpy+0x20/0x60 mm/kasan/common.c:105
>  memcpy include/linux/string.h:406 [inline]
>  fscache_set_key fs/fscache/cookie.c:93 [inline]
>  fscache_alloc_cookie+0xff/0x730 fs/fscache/cookie.c:153
>  __fscache_acquire_cookie+0x16c/0x610 fs/fscache/cookie.c:288
>  fscache_acquire_cookie include/linux/fscache.h:334 [inline]
>  afs_activate_cell fs/afs/cell.c:609 [inline]
>  afs_manage_cell+0x4fa/0x11c0 fs/afs/cell.c:697
>  process_one_work+0x94c/0x1670 kernel/workqueue.c:2269
>  worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
>  kthread+0x3b5/0x4a0 kernel/kthread.c:292
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
> 
> Allocated by task 10197:
>  kasan_save_stack+0x1b/0x40 mm/kasan/common.c:48
>  kasan_set_track mm/kasan/common.c:56 [inline]
>  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:461
>  __do_kmalloc mm/slab.c:3655 [inline]
>  __kmalloc+0x1b0/0x360 mm/slab.c:3664
>  kmalloc include/linux/slab.h:559 [inline]
>  afs_alloc_cell fs/afs/cell.c:157 [inline]
>  afs_lookup_cell+0x5e9/0x1440 fs/afs/cell.c:262
>  afs_parse_source fs/afs/super.c:290 [inline]
>  afs_parse_param+0x404/0x8c0 fs/afs/super.c:326
>  vfs_parse_fs_param fs/fs_context.c:117 [inline]
>  vfs_parse_fs_param+0x203/0x550 fs/fs_context.c:98
>  vfs_parse_fs_string+0xe6/0x150 fs/fs_context.c:161
>  generic_parse_monolithic+0x16f/0x1f0 fs/fs_context.c:201
>  do_new_mount fs/namespace.c:2871 [inline]
>  path_mount+0x133f/0x20a0 fs/namespace.c:3192
>  do_mount fs/namespace.c:3205 [inline]
>  __do_sys_mount fs/namespace.c:3413 [inline]
>  __se_sys_mount fs/namespace.c:3390 [inline]
>  __x64_sys_mount+0x27f/0x300 fs/namespace.c:3390
>  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> Freed by task 16:
>  kasan_save_stack+0x1b/0x40 mm/kasan/common.c:48
>  kasan_set_track+0x1c/0x30 mm/kasan/common.c:56
>  kasan_set_free_info+0x1b/0x30 mm/kasan/generic.c:355
>  __kasan_slab_free+0xd8/0x120 mm/kasan/common.c:422
>  __cache_free mm/slab.c:3418 [inline]
>  kfree+0x10e/0x2b0 mm/slab.c:3756
>  afs_cell_destroy+0x1b0/0x240 fs/afs/cell.c:500
>  rcu_do_batch kernel/rcu/tree.c:2428 [inline]
>  rcu_core+0x5ca/0x1130 kernel/rcu/tree.c:2656
>  __do_softirq+0x1f8/0xb23 kernel/softirq.c:298
> 
> The buggy address belongs to the object at ffff8880a6c28200
>  which belongs to the cache kmalloc-32 of size 32
> The buggy address is located 0 bytes inside of
>  32-byte region [ffff8880a6c28200, ffff8880a6c28220)
> The buggy address belongs to the page:
> page:00000000c2f50dc7 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff8880a6c28fc1 pfn:0xa6c28
> flags: 0xfffe0000000200(slab)
> raw: 00fffe0000000200 ffffea00028969c8 ffffea00025ca748 ffff8880aa040100
> raw: ffff8880a6c28fc1 ffff8880a6c28000 000000010000003f 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>  ffff8880a6c28100: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>  ffff8880a6c28180: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
> >ffff8880a6c28200: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>                    ^
>  ffff8880a6c28280: 00 00 00 00 fc fc fc fc 00 fc fc fc fc fc fc fc
>  ffff8880a6c28300: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
> ==================================================================

Flush the manager work before releasing cell's resources to avoid uaf.
To that end, add the AFS_CELL_DESTROYING cell state to infom the kworker
that there's no more job to do.

--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -344,6 +344,7 @@ enum afs_cell_state {
 	AFS_CELL_DEACTIVATING,
 	AFS_CELL_INACTIVE,
 	AFS_CELL_FAILED,
+	AFS_CELL_DESTROYING,
 };
 
 /*
--- a/fs/afs/cell.c
+++ b/fs/afs/cell.c
@@ -493,6 +493,7 @@ static void afs_cell_destroy(struct rcu_
 
 	ASSERTCMP(atomic_read(&cell->usage), ==, 0);
 
+	flush_work(&cell->manager);
 	afs_put_volume(cell->net, cell->root_volume, afs_volume_trace_put_cell_root);
 	afs_put_vlserverlist(cell->net, rcu_access_pointer(cell->vl_servers));
 	afs_put_cell(cell->net, cell->alias_of);
@@ -672,13 +673,17 @@ static void afs_manage_cell(struct work_
 again:
 	_debug("state %u", cell->state);
 	switch (cell->state) {
+	case AFS_CELL_DESTROYING:
+		return;
 	case AFS_CELL_INACTIVE:
 	case AFS_CELL_FAILED:
 		write_seqlock(&net->cells_lock);
 		usage = 1;
 		deleted = atomic_try_cmpxchg_relaxed(&cell->usage, &usage, 0);
-		if (deleted)
+		if (deleted) {
 			rb_erase(&cell->net_node, &net->cells);
+			cell->state = AFS_CELL_DESTROYING;
+		}
 		write_sequnlock(&net->cells_lock);
 		if (deleted)
 			goto final_destruction;

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

