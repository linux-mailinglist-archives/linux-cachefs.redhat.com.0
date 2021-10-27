Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B386444103A
	for <lists+linux-cachefs@lfdr.de>; Sun, 31 Oct 2021 19:40:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-eI2e3TVOOWGKYa0jveVBxQ-1; Sun, 31 Oct 2021 14:40:48 -0400
X-MC-Unique: eI2e3TVOOWGKYa0jveVBxQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95AFE1808318;
	Sun, 31 Oct 2021 18:40:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 387F35C1C5;
	Sun, 31 Oct 2021 18:40:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B34591800FE4;
	Sun, 31 Oct 2021 18:40:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19RBPPp5005140 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 27 Oct 2021 07:25:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 52AB940CFD11; Wed, 27 Oct 2021 11:25:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DFF040CFD10
	for <linux-cachefs@redhat.com>; Wed, 27 Oct 2021 11:25:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 266ED187506A
	for <linux-cachefs@redhat.com>; Wed, 27 Oct 2021 11:25:25 +0000 (UTC)
Received: from swift.blarg.de (swift.blarg.de [138.201.185.127]) by
	relay.mimecast.com with ESMTP id us-mta-450-exJOUZryNhKg-8_E4VtraA-1;
	Wed, 27 Oct 2021 07:25:23 -0400
X-MC-Unique: exJOUZryNhKg-8_E4VtraA-1
Received: by swift.blarg.de (Postfix, from userid 1000)
	id 0D33740FAF; Wed, 27 Oct 2021 13:18:17 +0200 (CEST)
Date: Wed, 27 Oct 2021 13:18:17 +0200
From: Max Kellermann <max@blarg.de>
To: linux-cachefs@redhat.com, dhowells@redhat.com
Message-ID: <YXk1efxXuaTsdpmA@swift.blarg.de>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Sun, 31 Oct 2021 14:40:40 -0400
Subject: [Linux-cachefs] Deadlock in __fscache_disable_cookie() ?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I am experiencing kernel lockups on a few web servers every other day;
today, a server where I have serial console access is affected,
running 5.14.11 (with storage mounted using NFS with fscache enabled).
This is what the kernel complains:

 rcu: INFO: rcu_sched self-detected stall on CPU
 Route cache is full: consider increasing sysctl net.ipv6.route.max_size.
 rcu:  43-....: (14429313 ticks this GP) idle=07a/1/0x4000000000000000 softirq=18010850/18010853 fqs=6457974 
 Route cache is full: consider increasing sysctl net.ipv6.route.max_size.
       (t=14962240 jiffies g=130080233 q=62260771)
 Route cache is full: consider increasing sysctl net.ipv6.route.max_size.
 NMI backtrace for cpu 43
 CPU: 43 PID: 2685840 Comm: php-cgi7.0 Tainted: G      D           5.14.11-cm4all1-hp+ #121
 Route cache is full: consider increasing sysctl net.ipv6.route.max_size.
 Route cache is full: consider increasing sysctl net.ipv6.route.max_size.
 Route cache is full: consider increasing sysctl net.ipv6.route.max_size.
 Hardware name: HP ProLiant DL380 Gen9/ProLiant DL380 Gen9, BIOS P89 10/17/2018
 Call Trace:
  <IRQ>
  dump_stack_lvl+0x34/0x44
  nmi_cpu_backtrace.cold+0x32/0x69
  ? lapic_can_unplug_cpu+0x70/0x70
  nmi_trigger_cpumask_backtrace+0x7c/0x90
  rcu_dump_cpu_stacks+0xb6/0xe4
  rcu_sched_clock_irq.cold+0xc7/0x1e9
  ? trigger_load_balance+0x99/0x300
  update_process_times+0x8c/0xc0
  tick_sched_timer+0xa8/0x100
  ? get_cpu_iowait_time_us+0x110/0x110
  __hrtimer_run_queues+0x124/0x270
  hrtimer_interrupt+0x110/0x2c0
  __sysvec_apic_timer_interrupt+0x5c/0xd0
  sysvec_apic_timer_interrupt+0x65/0x90
  </IRQ>
  asm_sysvec_apic_timer_interrupt+0x12/0x20
 RIP: 0010:queued_spin_lock_slowpath+0x41/0x1a0
 Code: 2f 08 0f 92 c0 0f b6 c0 c1 e0 08 89 c2 8b 07 30 e4 09 d0 a9 00 01 ff ff 0f 85 f0 00 00 00 85 c0 74 0e 8b 07 84 c0 74 08 f3 90 <8b> 07 84 c0 75 f8 b8 01 00 00 00 66 89 07 c3 8b 37 b8 00 02 00 00
 RSP: 0018:ffff9ad42a12fb78 EFLAGS: 00000202
 RAX: 0000000000000101 RBX: ffff9771d4743980 RCX: 0000000000000000
 dst_alloc: 134 callbacks suppressed
 Route cache is full: consider increasing sysctl net.ipv6.route.max_size.
 RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff9771d474398c
 RBP: ffff9ad42a12fc00 R08: ffff9ad42a12fc00 R09: ffff9771c9f77d40
 R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000001
 R13: ffff9771d47439d8 R14: 0000000000000028 R15: ffff9771d4744a40
  __fscache_disable_cookie+0x146/0x260
 Route cache is full: consider increasing sysctl net.ipv6.route.max_size.
  ? nfs_do_access+0x4f/0x240
  ? nfs_flock+0x50/0x50
 Route cache is full: consider increasing sysctl net.ipv6.route.max_size.
 Route cache is full: consider increasing sysctl net.ipv6.route.max_size.
  nfs_fscache_open_file+0x10b/0x120
  nfs_open+0x71/0xa0
  do_dentry_open+0x129/0x350
  path_openat+0xb19/0xeb0
  ? terminate_walk+0x61/0xf0
 Route cache is full: consider increasing sysctl net.ipv6.route.max_size.
  ? path_lookupat+0xae/0x1c0
  ? filename_lookup+0x120/0x1a0
  do_filp_open+0xa9/0x150
 Route cache is full: consider increasing sysctl net.ipv6.route.max_size.
  ? __check_object_size+0x136/0x150
  do_sys_openat2+0x97/0x150
  __x64_sys_openat+0x54/0x90
  do_syscall_64+0x5c/0x80
 Route cache is full: consider increasing sysctl net.ipv6.route.max_size.
  ? syscall_exit_to_user_mode+0x1d/0x40
  ? do_syscall_64+0x69/0x80

This time from "sysrq w" (without those "Route cache is full"
messages):

 NMI backtrace for cpu 43
 CPU: 43 PID: 2685840 Comm: php-cgi7.0 Tainted: G      D           5.14.11-cm4all1-hp+ #121
 Hardware name: HP ProLiant DL380 Gen9/ProLiant DL380 Gen9, BIOS P89 10/17/2018
 RIP: 0010:queued_spin_lock_slowpath+0x41/0x1a0
 Code: 2f 08 0f 92 c0 0f b6 c0 c1 e0 08 89 c2 8b 07 30 e4 09 d0 a9 00 01 ff ff 0f 85 f0 00 00 00 85 c0 74 0e 8b 07 84 c0 74 08 f3 90 <8b> 07 84 c0 75 f8 b8 01 00 00 00 66 89 07 c3 8b 37 b8 00 02 00 00
 RSP: 0018:ffff9ad42a12fb78 EFLAGS: 00000202
 RAX: 0000000000000101 RBX: ffff9771d4743980 RCX: 0000000000000000
 RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff9771d474398c
 RBP: ffff9ad42a12fc00 R08: ffff9ad42a12fc00 R09: ffff9771c9f77d40
 R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000001
 R13: ffff9771d47439d8 R14: 0000000000000028 R15: ffff9771d4744a40
 FS:  00007fe0aa631b80(0000) GS:ffff97895fcc0000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 00007fe0ad2c3000 CR3: 00000018c3576005 CR4: 00000000001706e0
 Call Trace:
  __fscache_disable_cookie+0x146/0x260
  ? nfs_do_access+0x4f/0x240
  ? nfs_flock+0x50/0x50
  nfs_fscache_open_file+0x10b/0x120
  nfs_open+0x71/0xa0
  do_dentry_open+0x129/0x350
  path_openat+0xb19/0xeb0
  ? terminate_walk+0x61/0xf0
  ? path_lookupat+0xae/0x1c0
  ? filename_lookup+0x120/0x1a0
  do_filp_open+0xa9/0x150
  ? __check_object_size+0x136/0x150
  do_sys_openat2+0x97/0x150
  __x64_sys_openat+0x54/0x90
  do_syscall_64+0x5c/0x80
  ? syscall_exit_to_user_mode+0x1d/0x40
  ? do_syscall_64+0x69/0x80
  ? __x64_sys_close+0xe/0x40
  ? asm_exc_page_fault+0x8/0x30
  entry_SYSCALL_64_after_hwframe+0x44/0xae
 RIP: 0033:0x7fe0ac8911ae
 Code: 25 00 00 41 00 3d 00 00 41 00 74 48 48 8d 05 59 65 0d 00 8b 00 85 c0 75 69 89 f2 b8 01 01 00 00 48 89 fe bf 9c ff ff ff 0f 05 <48> 3d 00 f0 ff ff 0f 87 a6 00 00 00 48 8b 4c 24 28 64 48 33 0c 25
 RSP: 002b:00007ffec23850e0 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
 RAX: ffffffffffffffda RBX: 00007fe09c176dc8 RCX: 00007fe0ac8911ae
 RDX: 0000000000000000 RSI: 00007ffec2385170 RDI: 00000000ffffff9c
 RBP: 00007ffec2385170 R08: 0000557365b35a20 R09: babdda20aa8c4eb7
 R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
 R13: 0000000000000000 R14: 00007fe09c1f1460 R15: 0000000000000000

Most other processes on the machine are blocked as well, probably also
RCU-stalled?

This is systemd:

 task:systemd         state:D stack:    0 pid:    1 ppid:     0 flags:0x00000000
 Call Trace:
  __schedule+0x26e/0x1350
  ? kmem_cache_alloc+0x25e/0x3c0
  ? comm_show+0x90/0x90
  schedule+0x44/0xa0
  schedule_preempt_disabled+0xa/0x10
  __mutex_lock.constprop.0+0x2d0/0x480
  ? kmem_cache_alloc_trace+0x34/0x3c0
  proc_cgroup_show+0x48/0x2b0
  proc_single_show+0x4d/0xb0
  seq_read_iter+0x122/0x4b0
  seq_read+0x100/0x150
  ? mcopy_atomic+0x5e0/0x5f0
  vfs_read+0x8c/0x160
  ksys_read+0x5f/0xe0
  do_syscall_64+0x5c/0x80
  ? syscall_exit_to_user_mode+0x1d/0x40
  ? do_syscall_64+0x69/0x80
  ? syscall_exit_to_user_mode+0x1d/0x40
  ? do_syscall_64+0x69/0x80
  ? do_syscall_64+0x69/0x80
  ? do_syscall_64+0x69/0x80
  ? do_syscall_64+0x69/0x80
  ? asm_exc_page_fault+0x8/0x30
  entry_SYSCALL_64_after_hwframe+0x44/0xae

This is a container init process which is stuck while exiting:

 task:init  state:D stack:    0 pid:2635844 ppid:     1 flags:0x00000220
 Call Trace:
  __schedule+0x26e/0x1350
  schedule+0x44/0xa0
  schedule_preempt_disabled+0xa/0x10
  __mutex_lock.constprop.0+0x2d0/0x480
  ? __mod_memcg_lruvec_state+0x1f/0xe0
  synchronize_rcu_expedited+0x34b/0x5e0
  ? __wake_up_common_lock+0x8a/0xc0
  namespace_unlock+0xce/0x1a0
  put_mnt_ns+0x62/0x80
  free_nsproxy+0x17/0x1b0
  do_exit+0x2e1/0x940
  do_group_exit+0x33/0x90
  __x64_sys_exit_group+0x14/0x20
  do_syscall_64+0x5c/0x80
  ? __x64_sys_close+0xe/0x40
  ? do_syscall_64+0x69/0x80
  ? do_syscall_64+0x69/0x80
  ? asm_exc_page_fault+0x8/0x30
  entry_SYSCALL_64_after_hwframe+0x44/0xae

Since the main process is stuck inside the fscache code, waiting for a
fscache spinlock, I suspect the cause may be found there, and
everything else is just a follow-up problem.

I can leave the server stuck as it is for a little while, so if you
need any more information to analyze this problem, I can try to get it
from a (mostly working) root shell on the serial console.  For the
kernel, I have an unstripped debug image.

(On another cluster, I experienced a similar problem, but with Ceph
instead of NFS.  I had the same "Route cache is full" messages, but
unfortunately only a partial stack tracke and no serial console.)

Max

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

