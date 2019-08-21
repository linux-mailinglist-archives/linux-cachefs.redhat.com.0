Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7209797E30
	for <lists+linux-cachefs@lfdr.de>; Wed, 21 Aug 2019 17:09:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DBE233090FC1;
	Wed, 21 Aug 2019 15:09:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C146D5D9E1;
	Wed, 21 Aug 2019 15:09:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5DD81180085A;
	Wed, 21 Aug 2019 15:09:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7LF9kUY013432 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 21 Aug 2019 11:09:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4351D1001958; Wed, 21 Aug 2019 15:09:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D83510016E8
	for <linux-cachefs@redhat.com>; Wed, 21 Aug 2019 15:09:43 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1EE257F75B
	for <linux-cachefs@redhat.com>; Wed, 21 Aug 2019 15:09:41 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y8so2374479wrn.10
	for <linux-cachefs@redhat.com>; Wed, 21 Aug 2019 08:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=xklAucuhZTd863woHWUzxGXux2TsmahGzuZ/PCeRAAM=;
	b=d8EEnPEkALNCkgbEzOY+JOP706cEtrCuqzkiFxaAe/HvL3sLEfcXMnb9WwOtheDD1E
	DjtWCm9g7M8DYxGJbCwQvHFn5pya4vmxYsfOtojt4k++qh6UUNc6huISqmk+LV1h6k7k
	dbW/Pr/3jCYHdpTQjaURLzEEJx/lQ31meiTgwdcsEz2BVHUyKw1OyN1C3SU5ApgI69X3
	9fFkbHBosjeD4ZhnMz8FLja5Zg2J4gwFQ2M46TC0RJvNIiFV6eB1ZTuAm4ZSR9Lsjj9L
	yun5sNuRcacmdbDpZLtPJECldPPcPbVr/n+EAQEB9Sqk9z4zYhqZuM1/UKuL8R89NUJw
	XYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=xklAucuhZTd863woHWUzxGXux2TsmahGzuZ/PCeRAAM=;
	b=tEUmijLJDnSJNq+TpOkXq6HFL6QzGKBy4Xez3sA888WN+EetRfUKl3aurXrKo+OrzR
	/kVBJdrnkxFgMU7fZ9E8Vs7diqFS6Ia6cB3oG6NOb36olRTlPzK4z0pGMHAonsdML9h8
	x6wGv9LhN1WWPwkzuX/jqj9CcyZOIRECq7Ah8iOWCv+aOpbanvSQWW9++vOvI4A8uRjp
	GNtqfxGSTR2ooXny0vQ/BFTi15CmyNaooUxj9bUX80KhfwBcuu6Shxs3TBjvnOV5KZ8P
	JAaYlhGsjao9Idc6OEQghd8URSO+pgZO4I4LpKC0KCOupg8ZsNgFTB1uNZKZDkE4x8nm
	1J9g==
X-Gm-Message-State: APjAAAX5kAavR4dcfaQnsjne9Ud+R+U6LfG/vXSxluH34/7QE8NMKJSI
	jjzeW8U4rrj62zV1K8tQsfZikGq5WkwVHVwPBtlfT8F7
X-Google-Smtp-Source: APXvYqys8oJPq4DQ/yaTWdHOCdZ7VsDojoJbvARc1uMXGwwpTVEcdEkUFJDm1DNJR+5gjn7eqV8lIytxbfX+p7LQgdU=
X-Received: by 2002:a5d:470c:: with SMTP id y12mr41270991wrq.136.1566400179352;
	Wed, 21 Aug 2019 08:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAB3bAB_5Eb18=fS-xUt9CuVXmOqOfN_ioqEJ6oJ5F8xArUomow@mail.gmail.com>
In-Reply-To: <CAB3bAB_5Eb18=fS-xUt9CuVXmOqOfN_ioqEJ6oJ5F8xArUomow@mail.gmail.com>
From: Daire Byrne <daire.byrne@gmail.com>
Date: Wed, 21 Aug 2019 16:09:27 +0100
Message-ID: <CAB3bAB8reeKRoyLvOQfjkxazpOy9HHsiH8mZroTxbeyvbnAS7w@mail.gmail.com>
To: linux-cachefs@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.71]);
	Wed, 21 Aug 2019 15:09:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Wed, 21 Aug 2019 15:09:41 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'daire.byrne@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.098  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, HTML_MESSAGE, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <daire.byrne@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [Linux-cachefs] kernel BUG at fs/fscache/operation.c:74!
	(kernel 5.0.5-1)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 21 Aug 2019 15:09:58 +0000 (UTC)

I'm still seeing this in kernel 5.2.9. I previously reported in 5.0.5 a few
months ago. I just have to populate the cache for around 30 minutes to
trigger it.

I'm happy to test patches or provide more debug info to assist.

Daire

[ 8592.370028] FS-Cache:
[ 8592.372621] FS-Cache: Assertion failed
[ 8592.376527] FS-Cache: 4 == 5 is false
[ 8592.380352] ------------[ cut here ]------------
[ 8592.385108] kernel BUG at fs/fscache/operation.c:70!
[ 8592.390237] invalid opcode: 0000 [#1] SMP PTI
[ 8592.394741] CPU: 14 PID: 81 Comm: ksoftirqd/14 Not tainted
5.2.9-1.el7.elrepo.x86_64 #1
[ 8592.403166] Hardware name: Google Google Compute Engine/Google Compute
Engine, BIOS Google 01/01/2011
[ 8592.412569] RIP: 0010:fscache_enqueue_operation+0x1c3/0x240 [fscache]
[ 8592.419154] Code: c0 e8 df 95 d4 e0 48 c7 c7 30 c5 3b a0 31 c0 e8 d1 95
d4 e0 8b 73 40 ba 05 00 00 00 48 c7 c7 20 b5 3b a0 31 c0 e8 bb 95 d4 e0
<0f> 0b 48 c7 c7 22 c5 3b a0 31 c0 e8 ab 95 d4 e0 48 c7 c7 30 c5 3b
[ 8592.438543] RSP: 0018:ffffc90006577b40 EFLAGS: 00010046
[ 8592.443917] RAX: 0000000000000019 RBX: ffff888fa4174c00 RCX:
0000000000000006
[ 8592.451392] RDX: 0000000000000000 RSI: 0000000000000082 RDI:
ffff88907db97940
[ 8592.458676] RBP: ffffc90006577b58 R08: 00000000000001dc R09:
00000000000001dc
[ 8592.466119] R10: 0000000000000005 R11: ffffffff826f8cc4 R12:
ffff888fa4174c00
[ 8592.473397] R13: ffff888f8800d480 R14: ffff888fa4174c88 R15:
ffff888f9c8ed460
[ 8592.480672] FS:  0000000000000000(0000) GS:ffff88907db80000(0000)
knlGS:0000000000000000
[ 8592.488926] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 8592.494820] CR2: 00007f60e658f000 CR3: 0000001074b70001 CR4:
00000000001606e0
[ 8592.502349] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[ 8592.509640] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[ 8592.517027] Call Trace:
[ 8592.519662]  cachefiles_read_waiter+0x10b/0x170 [cachefiles]
[ 8592.525497]  __wake_up_common+0x8f/0x160
[ 8592.529600]  __wake_up_locked_key_bookmark+0x1b/0x20
[ 8592.534725]  wake_up_page_bit+0xab/0x100
[ 8592.538813]  unlock_page+0x24/0x30
[ 8592.542399]  mpage_end_io+0x66/0xd0 [ext4]
[ 8592.546662]  bio_endio+0xe6/0x180
[ 8592.550151]  blk_update_request+0x9e/0x330
[ 8592.554504]  scsi_end_request+0x2c/0x150
[ 8592.558671]  scsi_io_completion+0x88/0x4c0
[ 8592.562932]  ? __switch_to_asm+0x40/0x70
[ 8592.567101]  ? __switch_to_asm+0x34/0x70
[ 8592.571292]  scsi_finish_command+0xdc/0x120
[ 8592.575629]  scsi_softirq_done+0x145/0x170
[ 8592.579888]  blk_done_softirq+0xa5/0xd0
[ 8592.583888]  __do_softirq+0xd5/0x2a2
[ 8592.587719]  run_ksoftirqd+0x2b/0x40
[ 8592.591479]  smpboot_thread_fn+0x11f/0x180
[ 8592.595731]  kthread+0x105/0x140
[ 8592.599115]  ? sort_range+0x30/0x30
[ 8592.602759]  ? kthread_bind+0x20/0x20
[ 8592.606596]  ret_from_fork+0x35/0x40
[ 8592.610363] Modules linked in: nfsv3 nfs cachefiles fscache ext4 mbcache
jbd2 sb_edac i2c_piix4 input_leds sg intel_rapl_perf nfsd auth_rpcgss
nfs_acl lockd grace binfmt_misc ip_tables xfs libcrc32c sd_mod
crct10dif_pclmul crc32_pclmul 8021q crc32c_intel garp mrp
ghash_clmulni_intel virtio_net net_failover failover virtio_scsi
aesni_intel scsi_transport_iscsi crypto_simd cryptd glue_helper virtio_pci
virtio_ring virtio serio_raw sunrpc dm_mirror dm_region_hash dm_log dm_mod
[ 8592.652533] ---[ end trace 80c6b6d683b29602 ]---
[ 8592.657332] RIP: 0010:fscache_enqueue_operation+0x1c3/0x240 [fscache]
[ 8592.663920] Code: c0 e8 df 95 d4 e0 48 c7 c7 30 c5 3b a0 31 c0 e8 d1 95
d4 e0 8b 73 40 ba 05 00 00 00 48 c7 c7 20 b5 3b a0 31 c0 e8 bb 95 d4 e0
<0f> 0b 48 c7 c7 22 c5 3b a0 31 c0 e8 ab 95 d4 e0 48 c7 c7 30 c5 3b
[ 8592.682850] RSP: 0018:ffffc90006577b40 EFLAGS: 00010046
[ 8592.688440] RAX: 0000000000000019 RBX: ffff888fa4174c00 RCX:
0000000000000006
[ 8592.695740] RDX: 0000000000000000 RSI: 0000000000000082 RDI:
ffff88907db97940
[ 8592.703206] RBP: ffffc90006577b58 R08: 00000000000001dc R09:
00000000000001dc
[ 8592.710510] R10: 0000000000000005 R11: ffffffff826f8cc4 R12:
ffff888fa4174c00
[ 8592.718026] R13: ffff888f8800d480 R14: ffff888fa4174c88 R15:
ffff888f9c8ed460
[ 8592.725488] FS:  0000000000000000(0000) GS:ffff88907db80000(0000)
knlGS:0000000000000000
[ 8592.733739] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 8592.739862] CR2: 00007f60e658f000 CR3: 0000001074b70001 CR4:
00000000001606e0
[ 8592.747150] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[ 8592.754436] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[ 8592.761740] Kernel panic - not syncing: Fatal exception in interrupt
[ 8593.867017] Shutting down cpus with NMI
[ 8593.871953] Kernel Offset: disabled
[ 8593.875615] ---[ end Kernel panic - not syncing: Fatal exception in
interrupt ]---

On Sat, Apr 6, 2019 at 9:55 AM Daire Byrne <daire.byrne@gmail.com> wrote:

> Hi,
>
> I can reproduce this bug under heavy cache read loads within a few
> minutes. It seem like it happens pretty frequently when the entire data set
> has been cached and so we are reading entirely from disk. I found these
> previous patches that looked to address similar issues here:
> https://lkml.org/lkml/2018/7/4/546
>
> I'm happy to test any patches to verify fixes.
>
> Daire
>
>
> [ 6598.153866] FS-Cache: Assertion failed
> [ 6598.157778] FS-Cache: 4 == 5 is false
> [ 6598.161638] kernel BUG at fs/fscache/operation.c:74!
> [ 6598.166771] invalid opcode: 0000 [#1] SMP PTI
> [ 6598.171397] CPU: 14 PID: 1430 Comm: nfsd Not tainted
> 5.0.5-1.el7.elrepo.x86_64 #1
> [ 6598.179034] Hardware name: Google Google Compute Engine/Google Compute
> Engine, BIOS Google 01/01/2011
> [ 6598.188417] RIP: 0010:fscache_enqueue_operation+0x1c3/0x240 [fscache]
> [ 6598.195006] Code: c0 e8 df 86 c1 e0 48 c7 c7 30 85 4e a0 31 c0 e8 d1 86
> c1 e0 8b 73 40 ba 05 00 00 00 48 c7 c7 20 75 4e a0 31 c0 e8 bb 86 c1 e0
> <0f> 0b 48 c7 c7 22 85 4e a0 31 c0 e8 ab 86 c1 e0 48 c7 c7 30 85 4e
> [ 6598.214256] RSP: 0018:ffff88907db83c28 EFLAGS: 00010046
> [ 6598.219628] RAX: 0000000000000019 RBX: ffff88810039b200 RCX:
> 0000000000000006
> [ 6598.226910] RDX: 0000000000000000 RSI: 0000000000000082 RDI:
> ffff88907db96980
> [ 6598.234187] RBP: ffff88907db83c40 R08: 0000000000000000 R09:
> 00000000000001d8
> [ 6598.241464] R10: 0000000000000005 R11: 0000000000000000 R12:
> ffff88810039b200
> [ 6598.248839] R13: ffff888e14d34000 R14: ffff888cc24353a0 R15:
> ffff888cc2435340
> [ 6598.256125] FS:  0000000000000000(0000) GS:ffff88907db80000(0000)
> knlGS:0000000000000000
> [ 6598.264364] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 6598.270255] CR2: 00007fdb83171000 CR3: 0000001057f9e005 CR4:
> 00000000001606e0
> [ 6598.277538] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [ 6598.284821] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> [ 6598.292233] Call Trace:
> [ 6598.294846]  <IRQ>
> [ 6598.297019]  cachefiles_read_waiter+0x10b/0x170 [cachefiles]
> [ 6598.302839]  __wake_up_common+0x8f/0x160
> [ 6598.306910]  __wake_up_locked_key_bookmark+0x1b/0x20
> [ 6598.312044]  wake_up_page_bit+0xab/0x100
> [ 6598.316112]  unlock_page+0x24/0x30
> [ 6598.319678]  mpage_end_io+0x29/0x70 [ext4]
> [ 6598.323924]  bio_endio+0xe6/0x180
> [ 6598.327397]  blk_update_request+0x9e/0x300
> [ 6598.331650]  scsi_end_request+0x30/0x1a0
> [ 6598.335724]  scsi_io_completion+0x8e/0x5f0
> [ 6598.339963]  scsi_finish_command+0xdc/0x130
> [ 6598.344315]  scsi_softirq_done+0x145/0x170
> [ 6598.348563]  blk_done_softirq+0xa5/0xd0
> [ 6598.352555]  __do_softirq+0xd5/0x2a2
> [ 6598.356301]  irq_exit+0xe8/0x100
> [ 6598.359683]  do_IRQ+0x59/0xe0
> [ 6598.362804]  common_interrupt+0xf/0xf
> [ 6598.366624]  </IRQ>
> [ 6598.368898] RIP: 0010:dd_insert_requests+0x6/0x210
> [ 6598.373847] Code: 58 b8 75 91 31 db eb 99 31 c0 eb a3 0f 0b 31 c0 0f 1f
> 40 00 c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55
> <48> 89 e5 41 57 41 56 41 55 41 54 53 48 89 f3 48 83 ec 18 48 8b 87
> [ 6598.393060] RSP: 0018:ffffc90007a4f2d8 EFLAGS: 00000246 ORIG_RAX:
> ffffffffffffffde
> [ 6598.400802] RAX: ffff889062c5f800 RBX: ffff889062c5e000 RCX:
> 0000000000000000
> [ 6598.408098] RDX: 0000000000000000 RSI: ffffc90007a4f338 RDI:
> ffff889062c5e000
> [ 6598.415376] RBP: ffffc90007a4f2f8 R08: ffffffff813edb10 R09:
> ffff889062cbe9c0
> [ 6598.422675] R10: 0000000000000001 R11: 0000000000001000 R12:
> 0000000000000000
> [ 6598.429963] R13: ffff889063114848 R14: ffffc90007a4f338 R15:
> ffff88906238d3c8
> [ 6598.437253]  ? deadline_fifo_request+0x110/0x110
> [ 6598.442015]  ? blk_mq_sched_insert_requests+0x3e/0x80
> [ 6598.447210]  blk_mq_flush_plug_list+0x177/0x280
> [ 6598.452117]  ? __blk_mq_get_tag+0x21/0x90
> [ 6598.456273]  blk_flush_plug_list+0xd1/0x100
> [ 6598.460605]  blk_mq_make_request+0x1f8/0x500
> [ 6598.465025]  generic_make_request+0x191/0x3c0
> [ 6598.469531]  submit_bio+0x75/0x140
> [ 6598.473082]  ? bio_add_page+0x4b/0x60
> [ 6598.476910]  ext4_mpage_readpages+0x41f/0x840 [ext4]
> [ 6598.482038]  ? scan_shadow_nodes+0x30/0x30
> [ 6598.486302]  ext4_readpage+0x4d/0xb0 [ext4]
> [ 6598.490641]  cachefiles_read_or_alloc_pages+0x69b/0xf10 [cachefiles]
> [ 6598.497145]  ? __wait_on_bit+0x7d/0x90
> [ 6598.501046]  ? wake_up_bit+0x41/0x50
> [ 6598.504779]  ? fscache_run_op.isra.11+0x5c/0xf0 [fscache]
> [ 6598.510339]  ? fscache_submit_op+0x264/0x3f0 [fscache]
> [ 6598.515634]  __fscache_read_or_alloc_pages+0x239/0x380 [fscache]
> [ 6598.521836]  __nfs_readpages_from_fscache+0x6b/0x190 [nfs]
> [ 6598.528319]  nfs_readpages+0xbf/0x1c0 [nfs]
> [ 6598.532655]  ? dev_hard_start_xmit+0x9e/0x220
> [ 6598.537311]  ? __alloc_pages_nodemask+0x133/0x2e0
> [ 6598.542161]  read_pages+0x67/0x1a0
> [ 6598.545707]  __do_page_cache_readahead+0x1c5/0x1e0
> [ 6598.550645]  ondemand_readahead+0x172/0x2b0
> [ 6598.554979]  page_cache_sync_readahead+0x85/0xc0
> [ 6598.559753]  generic_file_read_iter+0x942/0xdc0
> [ 6598.564456]  ? nfs_check_cache_invalid+0x38/0xa0 [nfs]
> [ 6598.569894]  ? nfs_mapping_need_revalidate_inode+0x17/0x40 [nfs]
> [ 6598.576445]  ? _cond_resched+0x19/0x30
> [ 6598.580352]  nfs_file_read+0x6d/0xc0 [nfs]
> [ 6598.584607]  generic_file_splice_read+0xfd/0x1c0
> [ 6598.589379]  do_splice_to+0x76/0x90
> [ 6598.593015]  splice_direct_to_actor+0x10d/0x250
> [ 6598.597706]  ? fsid_source+0x60/0x60 [nfsd]
> [ 6598.602040]  nfsd_splice_read+0x7f/0x110 [nfsd]
> [ 6598.606740]  nfsd_read+0x1ac/0x1d0 [nfsd]
> [ 6598.610902]  nfsd3_proc_read+0xb4/0x160 [nfsd]
> [ 6598.615503]  nfsd_dispatch+0xc1/0x260 [nfsd]
> [ 6598.619951]  svc_process_common+0x3e1/0x7f0 [sunrpc]
> [ 6598.625067]  svc_process+0xfc/0x110 [sunrpc]
> [ 6598.629489]  nfsd+0xe9/0x160 [nfsd]
> [ 6598.633132]  kthread+0x105/0x140
> [ 6598.636513]  ? nfsd_destroy+0x60/0x60 [nfsd]
> [ 6598.640935]  ? kthread_bind+0x20/0x20
> [ 6598.644752]  ret_from_fork+0x35/0x40
> [ 6598.648478] Modules linked in: nfsv3 nfs cachefiles fscache ext4
> mbcache jbd2 sg pcc_cpufreq sb_edac i2c_piix4 intel_rapl_perf input_leds
> nfsd auth_rpcgss nfs_acl lockd grace binfmt_misc ip_tables xfs libcrc32c
> sd_mod crct10dif_pclmul crc32_pclmul crc32c_intel 8021q garp mrp
> ghash_clmulni_intel virtio_net net_failover failover virtio_scsi
> aesni_intel crypto_simd cryptd virtio_pci glue_helper virtio_ring virtio
> scsi_transport_iscsi serio_raw sunrpc dm_mirror dm_region_hash dm_log dm_mod
> [ 6598.691798] ---[ end trace a77e949852c4460c ]---
> [ 6598.696688] RIP: 0010:fscache_enqueue_operation+0x1c3/0x240 [fscache]
> [ 6598.703370] Code: c0 e8 df 86 c1 e0 48 c7 c7 30 85 4e a0 31 c0 e8 d1 86
> c1 e0 8b 73 40 ba 05 00 00 00 48 c7 c7 20 75 4e a0 31 c0 e8 bb 86 c1 e0
> <0f> 0b 48 c7 c7 22 85 4e a0 31 c0 e8 ab 86 c1 e0 48 c7 c7 30 85 4e
> [ 6598.722331] RSP: 0018:ffff88907db83c28 EFLAGS: 00010046
> [ 6598.727714] RAX: 0000000000000019 RBX: ffff88810039b200 RCX:
> 0000000000000006
> [ 6598.734999] RDX: 0000000000000000 RSI: 0000000000000082 RDI:
> ffff88907db96980
> [ 6598.742287] RBP: ffff88907db83c40 R08: 0000000000000000 R09:
> 00000000000001d8
> [ 6598.749579] R10: 0000000000000005 R11: 0000000000000000 R12:
> ffff88810039b200
> [ 6598.756867] R13: ffff888e14d34000 R14: ffff888cc24353a0 R15:
> ffff888cc2435340
> [ 6598.764623] FS:  0000000000000000(0000) GS:ffff88907db80000(0000)
> knlGS:0000000000000000
> [ 6598.772866] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 6598.778877] CR2: 00007fdb83171000 CR3: 0000001057f9e005 CR4:
> 00000000001606e0
> [ 6598.786167] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [ 6598.793464] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> [ 6598.800886] Kernel panic - not syncing: Fatal exception in interrupt
> [ 6599.929552] Shutting down cpus with NMI
> [ 6599.934409] Kernel Offset: disabled
> [ 6599.938060] ---[ end Kernel panic - not syncing: Fatal exception in
> interrupt ]---
>
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs
