Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 684935A65BC
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Aug 2022 15:56:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661867797;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JqxvZLr8n6XgxXK1nJ90sMop9ZJWtIg1d1O5vU2Nkm8=;
	b=dUp18s9SL04wa2Kk1HV6EBssYpfmoS0drhezMbsu6TA4K0wGaTourOiXDQ0BY5qpsNlkHS
	canHOSaYH69R+baUgBwwvErSEp+drIQekTmmsHFVVzvvQ82GFyLq38vgOtqAfTmwgd/rGb
	bH2vxwghmNN1Rp0LTY/CnHMbVrTvzBQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-TfyqGsaDNBGVpVf0Se7zNQ-1; Tue, 30 Aug 2022 09:56:34 -0400
X-MC-Unique: TfyqGsaDNBGVpVf0Se7zNQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E31E285A585;
	Tue, 30 Aug 2022 13:56:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FC43492C3B;
	Tue, 30 Aug 2022 13:56:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ECA9C1946A47;
	Tue, 30 Aug 2022 13:56:31 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 515211946A40 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 30 Aug 2022 00:05:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 331CF40C1421; Tue, 30 Aug 2022 00:05:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F42440C141D
 for <linux-cachefs@redhat.com>; Tue, 30 Aug 2022 00:05:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A237C1C01701
 for <linux-cachefs@redhat.com>; Tue, 30 Aug 2022 00:05:36 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-Ppgk-JMsMsquXDw91hFFsQ-1; Mon, 29 Aug 2022 20:05:34 -0400
X-MC-Unique: Ppgk-JMsMsquXDw91hFFsQ-1
Received: by mail-il1-f199.google.com with SMTP id
 i27-20020a056e021d1b00b002eb5eb4d200so128611ila.21
 for <linux-cachefs@redhat.com>; Mon, 29 Aug 2022 17:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc;
 bh=3qVmTD3+pVsCJtnKVn9HTqJIISDhqHbYBEvV4wOpfE0=;
 b=Yyocq5GJb9LO1MXIennLA3IWTfp3WJ84TRuBWF6xHvixwXkAZOALjuJl7ON8S5TWYg
 rdHdJxILCLgIXIWD/i+rXyyrzsCTfIr88G/EyDo9YX9KAFH5uHYRVJoX9y4YAgOMWkLM
 TTd1+OWmhj1sxTiFKYSbu2A9uu8JFD0/LJlEFEV99CC8nEPjWorLx/cBc4D1SurLp+nz
 RGYQYldwf426inTpYd1njtxVeV71uLTKm86IClvWdjFXkTxSZ1/wroTO4Kc5cpggaFWA
 jIE2KvHHhxGhCxAKeZrfzEyJ95NT6iH8aQCz6Ozxmbhqk2KJHUMKHqkcRlo5b7lKERQY
 fwJA==
X-Gm-Message-State: ACgBeo0ZlZ7wUx1UHws9SX9jzFCvcBv9mzIRcGDzyKoqDh1XSpXiURa8
 8kOMAdGRbOIfqdD6OwhCu0F6bxHSox/AbBSKL86RbPE1Qw9y
X-Google-Smtp-Source: AA6agR5CuZDIyUhlMNbduI24IYB68uvBWwjB6bBbQCoDw3WMjUUV6wQ+Me7/gwgSyI6c1C4kgebmBMVK0nX4BtgqMCJBJd6cilIb
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1402:b0:68a:9d38:8248 with SMTP id
 t2-20020a056602140200b0068a9d388248mr9624316iov.68.1661817934170; Mon, 29 Aug
 2022 17:05:34 -0700 (PDT)
Date: Mon, 29 Aug 2022 17:05:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a5d1ac05e76a23bb@google.com>
From: syzbot <syzbot+a76f6a6e524cf2080aa3@syzkaller.appspotmail.com>
To: asmadeus@codewreck.org, dhowells@redhat.com, jlayton@kernel.org, 
 linux-cachefs@redhat.com, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Tue, 30 Aug 2022 13:56:31 +0000
Subject: [Linux-cachefs] [syzbot] KASAN: slab-out-of-bounds Read in
 __fscache_acquire_volume
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
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

syzbot found the following issue on:

HEAD commit:    8379c0b31fbc Merge tag 'for-6.0-rc3-tag' of git://git.kern..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12f5306d080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=911efaff115942bb
dashboard link: https://syzkaller.appspot.com/bug?extid=a76f6a6e524cf2080aa3
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1552b3ad080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15b0294d080000

The issue was bisected to:

commit 24e42e32d347f0787a6f99aeb590f3aaa7221093
Author: David Howells <dhowells@redhat.com>
Date:   Wed Nov 18 09:06:42 2020 +0000

    9p: Use fscache indexing rewrite and reenable caching

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14660e8b080000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16660e8b080000
console output: https://syzkaller.appspot.com/x/log.txt?x=12660e8b080000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a76f6a6e524cf2080aa3@syzkaller.appspotmail.com
Fixes: 24e42e32d347 ("9p: Use fscache indexing rewrite and reenable caching")

==================================================================
BUG: KASAN: slab-out-of-bounds in memcmp+0x16f/0x1c0 lib/string.c:757
Read of size 8 at addr ffff888016f3aa90 by task syz-executor344/3613

CPU: 0 PID: 3613 Comm: syz-executor344 Not tainted 6.0.0-rc2-syzkaller-00327-g8379c0b31fbc #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:317 [inline]
 print_report.cold+0x2ba/0x719 mm/kasan/report.c:433
 kasan_report+0xb1/0x1e0 mm/kasan/report.c:495
 memcmp+0x16f/0x1c0 lib/string.c:757
 memcmp include/linux/fortify-string.h:420 [inline]
 fscache_volume_same fs/fscache/volume.c:133 [inline]
 fscache_hash_volume fs/fscache/volume.c:171 [inline]
 __fscache_acquire_volume+0x76c/0x1080 fs/fscache/volume.c:328
 fscache_acquire_volume include/linux/fscache.h:204 [inline]
 v9fs_cache_session_get_cookie+0x143/0x240 fs/9p/cache.c:34
 v9fs_session_init+0x1166/0x1810 fs/9p/v9fs.c:473
 v9fs_mount+0xba/0xc90 fs/9p/vfs_super.c:126
 legacy_get_tree+0x105/0x220 fs/fs_context.c:610
 vfs_get_tree+0x89/0x2f0 fs/super.c:1530
 do_new_mount fs/namespace.c:3040 [inline]
 path_mount+0x1326/0x1e20 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f7d5064b1d9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd1700c028 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffd1700c060 RCX: 00007f7d5064b1d9
RDX: 0000000020000040 RSI: 0000000020000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000020000200 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000000f4240
R13: 0000000000000000 R14: 00007ffd1700c04c R15: 00007ffd1700c050
 </TASK>

Allocated by task 3613:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:45 [inline]
 set_alloc_info mm/kasan/common.c:437 [inline]
 ____kasan_kmalloc mm/kasan/common.c:516 [inline]
 ____kasan_kmalloc mm/kasan/common.c:475 [inline]
 __kasan_kmalloc+0xa9/0xd0 mm/kasan/common.c:525
 kmalloc include/linux/slab.h:605 [inline]
 kzalloc include/linux/slab.h:733 [inline]
 fscache_alloc_volume fs/fscache/volume.c:234 [inline]
 __fscache_acquire_volume+0x2c2/0x1080 fs/fscache/volume.c:323
 fscache_acquire_volume include/linux/fscache.h:204 [inline]
 v9fs_cache_session_get_cookie+0x143/0x240 fs/9p/cache.c:34
 v9fs_session_init+0x1166/0x1810 fs/9p/v9fs.c:473
 v9fs_mount+0xba/0xc90 fs/9p/vfs_super.c:126
 legacy_get_tree+0x105/0x220 fs/fs_context.c:610
 vfs_get_tree+0x89/0x2f0 fs/super.c:1530
 do_new_mount fs/namespace.c:3040 [inline]
 path_mount+0x1326/0x1e20 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

The buggy address belongs to the object at ffff888016f3aa00
 which belongs to the cache kmalloc-192 of size 192
The buggy address is located 144 bytes inside of
 192-byte region [ffff888016f3aa00, ffff888016f3aac0)

The buggy address belongs to the physical page:
page:ffffea00005bce80 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x16f3a
flags: 0xfff00000000200(slab|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000200 ffffea00005bd000 dead000000000002 ffff888011841a00
raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x12cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY), pid 1, tgid 1 (swapper/0), ts 1480756181, free_ts 0
 prep_new_page mm/page_alloc.c:2532 [inline]
 get_page_from_freelist+0x109b/0x2ce0 mm/page_alloc.c:4283
 __alloc_pages+0x1c7/0x510 mm/page_alloc.c:5515
 alloc_page_interleave+0x1e/0x200 mm/mempolicy.c:2103
 alloc_pages+0x22f/0x270 mm/mempolicy.c:2265
 alloc_slab_page mm/slub.c:1824 [inline]
 allocate_slab+0x27e/0x3d0 mm/slub.c:1969
 new_slab mm/slub.c:2029 [inline]
 ___slab_alloc+0x7f1/0xe10 mm/slub.c:3031
 __slab_alloc.constprop.0+0x4d/0xa0 mm/slub.c:3118
 slab_alloc_node mm/slub.c:3209 [inline]
 slab_alloc mm/slub.c:3251 [inline]
 kmem_cache_alloc_trace+0x323/0x3e0 mm/slub.c:3282
 kmalloc include/linux/slab.h:600 [inline]
 kzalloc include/linux/slab.h:733 [inline]
 call_usermodehelper_setup+0x97/0x340 kernel/umh.c:365
 kobject_uevent_env+0xee6/0x1640 lib/kobject_uevent.c:614
 kernel_add_sysfs_param kernel/params.c:816 [inline]
 param_sysfs_builtin kernel/params.c:851 [inline]
 param_sysfs_init+0x367/0x43b kernel/params.c:970
 do_one_initcall+0xfe/0x650 init/main.c:1296
 do_initcall_level init/main.c:1369 [inline]
 do_initcalls init/main.c:1385 [inline]
 do_basic_setup init/main.c:1404 [inline]
 kernel_init_freeable+0x6b1/0x73a init/main.c:1623
 kernel_init+0x1a/0x1d0 init/main.c:1512
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888016f3a980: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888016f3aa00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff888016f3aa80: 00 00 04 fc fc fc fc fc fc fc fc fc fc fc fc fc
                         ^
 ffff888016f3ab00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888016f3ab80: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

