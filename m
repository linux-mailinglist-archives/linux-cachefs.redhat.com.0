Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 294AB5947E
	for <lists+linux-cachefs@lfdr.de>; Fri, 28 Jun 2019 08:59:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC10080F7C;
	Fri, 28 Jun 2019 06:59:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B62B35C64D;
	Fri, 28 Jun 2019 06:59:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BB5F3D87;
	Fri, 28 Jun 2019 06:58:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5S6teOK004905 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 28 Jun 2019 02:55:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E86FD6013C; Fri, 28 Jun 2019 06:55:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E366D6013A
	for <linux-cachefs@redhat.com>; Fri, 28 Jun 2019 06:55:37 +0000 (UTC)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
	[209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 97ED181F12
	for <linux-cachefs@redhat.com>; Fri, 28 Jun 2019 06:55:37 +0000 (UTC)
Received: by mail-pf1-f198.google.com with SMTP id y7so3267287pfy.9
	for <linux-cachefs@redhat.com>; Thu, 27 Jun 2019 23:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=2fZRJRQijRO6Ly45HFCHGkD7aR9bZa/haNck0Efsh8c=;
	b=Lunb+CpYe+vJpjFQMu1tO6YWTCdgMdXo4E/Sdc4WYm80wEZ7sSDgglTUHdCTHX5Y3y
	3bjSDDmnT8OpPUZtr+XX8O4//DkOdVCLCsx4obmyft5twPk86l+YgHFPUSuU9Qg+9ToN
	+ygBIafWbUAJh+PCDhmpybNCZJ8nO8ussxIaaTQK2By3Na4Q8XiG1b8IuojBwpRrgWY7
	/seRcrDM8h4L7aRzVE4MukTL5qkE2KUtslgI55qRRhKy1gFRK3g6TQZk0LMaASe0mIcJ
	1eLGAZd/uFkxNh+VI8tHiMUVPN4obVTZZvdsDwhf2iV9VAb70cS8FYmn1wmHKh12AF98
	4WFA==
X-Gm-Message-State: APjAAAXT4ksBngEBD0rrGXf8dHewETUXXO+FZjpjy3gFY/WIC6wqqZW2
	FQOwEHro+wWqvZS2kpAhifsL+dEcRBkrMpH23+14qbY7UP3ILidY2gcSXo3/QcXd1bzX+gAhf4J
	el5GP3sG3bsR7vxQUbkBZNA==
X-Received: by 2002:a17:90a:258b:: with SMTP id
	k11mr10727533pje.110.1561704936726; 
	Thu, 27 Jun 2019 23:55:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4vT0BDjTRd/CipVPDPMYobtkG46eS/y4JcL9DppQCmhIHYk7t1bKIbqMmuBujOHb3AiAuxg==
X-Received: by 2002:a17:90a:258b:: with SMTP id
	k11mr10727492pje.110.1561704936206; 
	Thu, 27 Jun 2019 23:55:36 -0700 (PDT)
Received: from fedora19.localdomain ([101.164.133.67])
	by smtp.gmail.com with ESMTPSA id k4sm1098356pju.14.2019.06.27.23.55.33
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 23:55:35 -0700 (PDT)
Date: Fri, 28 Jun 2019 16:55:31 +1000
From: Ian Wienand <iwienand@redhat.com>
To: linux-cachefs@redhat.com
Message-ID: <20190628065531.GB23470@fedora19.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Subject: [Linux-cachefs] 5.2.0-rc1-afs-next-9f4a9105: page allocation failure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 28 Jun 2019 06:59:19 +0000 (UTC)

Hello,

I was just looking at the logs for our mirror host (as described in
[1]) and wanted to note down another issue that just popped up in the
logs that I think is related to fscache/cachefiles from the backtrace.
Backtrace posted below.

I don't think this host is under memory pressure:

 root@mirror01:/opt/kafs-stats# free -h
               total        used        free      shared  buff/cache   available
 Mem:           7.8G        354M        145M        2.3M        7.3G        7.1G
 Swap:          7.6G         27M        7.6G

The host seems to have continued on OK.  I've looked around in the
logs and can't find anything else particularly interesting happening
at that time (syslog, etc).

I just wanted to note this so we have a reference if the problem
persists, thanks.

-i

[1] https://www.redhat.com/archives/linux-cachefs/2019-June/msg00009.html

[Fri Jun 28 06:28:27 2019]
[54273.996578] apache2: page allocation failure: order:0, mode:0x90c00(GFP_NOIO|__GFP_NORETRY|__GFP_NOMEMALLOC), nodemask=(null),cpuset=/,mems_allowed=0
[54273.996629] CPU: 3 PID: 1046 Comm: apache2 Not tainted 5.2.0-rc1-afs-next-9f4a9105 #2
[54273.996647] Hardware name: Xen HVM domU, BIOS 4.1.5 11/28/2013
[54273.996661] Call Trace:
[54273.996682]  dump_stack+0x63/0x85
[54273.996697]  warn_alloc+0x10b/0x190
[54273.996710]  __alloc_pages_slowpath+0xdce/0xe20
[54273.996729]  ? xas_store+0x1a2/0x5f0
[54273.996743]  __alloc_pages_nodemask+0x2cd/0x320
[54273.996763]  alloc_pages_current+0x6a/0xe0
[54273.996781]  __page_cache_alloc+0x6a/0xa0
[54273.996801]  cachefiles_read_or_alloc_pages+0x33b/0xcb0 [cachefiles]
[54273.996824]  ? wake_up_bit+0x42/0x50
[54273.996846]  ? fscache_run_op.isra.12+0x63/0xe0 [fscache]
[54273.996868]  __fscache_read_or_alloc_pages+0x232/0x340 [fscache]
[54273.996895]  afs_readpages+0x337/0x3c0 [kafs]
[54273.996913]  read_pages+0x6b/0x190
[54273.996926]  ? 0xffffffffb5000000
[54273.996940]  __do_page_cache_readahead+0x151/0x190
[54273.996954]  ? __do_page_cache_readahead+0x151/0x190
[54273.996970]  ondemand_readahead+0x11a/0x2e0
[54273.996984]  page_cache_async_readahead+0x9f/0xc0
[54273.996999]  filemap_fault+0x1b8/0x960
[54273.997016]  ? dev_queue_xmit+0x10/0x20
[54273.997031]  ? filemap_map_pages+0x181/0x3b0
[54273.997047]  __do_fault+0x57/0x118
[54273.997062]  __handle_mm_fault+0xe10/0x12f0
[54273.997078]  handle_mm_fault+0xcb/0x200
[54273.997094]  __do_page_fault+0x299/0x4d0
[54273.997109]  do_page_fault+0x2d/0xf0
[54273.997124]  page_fault+0x1e/0x30
[54273.997495] RIP: 0010:copy_user_generic_string+0x2c/0x40
[54273.997813] Code: 90 83 fa 08 72 27 89 f9 83 e1 07 74 15 83 e9 08 f7 d9 29 ca 8a 06 88 07 48 ff c6 48 ff c7 ff c9 75 f2 89 d1 c1 e9 03 83 e2 07 <f3> 48 a5 89 d1 f3 a4 31 c0 66 66 90 c3 0f 1f 80 00 00 00 00 66 66
[54273.998479] RSP: 0018:ffff9c2d81eb7b48 EFLAGS: 00010246
[54273.998818] RAX: 00007f346a4dff09 RBX: ffff9c2d81eb7ce0 RCX: 00000000000001e2
[54273.999164] RDX: 0000000000000000 RSI: 00007f346a4deff9 RDI: ffff8ae35a7540f0
[54273.999513] RBP: ffff9c2d81eb7b50 R08: ffff9c2d81eb8000 R09: 00000000000dff09
[54273.999868] R10: 0000000000001000 R11: 0000000000000000 R12: 0000000000001000
[54274.000223] R13: 0000000000001000 R14: ffff9c2d81eb7e10 R15: ffff8ae35a754000
[54274.000587]  ? copyin+0x26/0x30
[54274.000942]  _copy_from_iter_full+0x86/0x290
[54274.001299]  tcp_sendmsg_locked+0x7d3/0xdb0
[54274.001654]  tcp_sendmsg+0x2c/0x50
[54274.002004]  inet_sendmsg+0x2e/0xb0
[54274.002351]  sock_sendmsg+0x46/0x60
[54274.002697]  sock_write_iter+0x8c/0xf0
[54274.003032]  do_iter_readv_writev+0x159/0x1d0
[54274.003355]  do_iter_write+0x86/0x1a0
[54274.003669]  vfs_writev+0x98/0x110
[54274.003979]  ? __do_munmap+0x345/0x460
[54274.004284]  do_writev+0xde/0x120
[54274.004589]  ? do_writev+0xde/0x120
[54274.004895]  __x64_sys_writev+0x1c/0x20
[54274.005258]  do_syscall_64+0x5a/0x130
[54274.005563]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[54274.005870] RIP: 0033:0x7f34d5cba6e7
[54274.006176] Code: c3 66 90 41 54 55 41 89 d4 53 48 89 f5 89 fb 48 83 ec 10 e8 0b a0 01 00 44 89 e2 41 89 c0 48 89 ee 89 df b8 14 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 35 44 89 c7 48 89 44 24 08 e8 44 a0 01 00 48
[54274.006834] RSP: 002b:00007f34ae7fb9d0 EFLAGS: 00000293 ORIG_RAX: 0000000000000014
[54274.007171] RAX: ffffffffffffffda RBX: 000000000000002a RCX: 00007f34d5cba6e7
[54274.007510] RDX: 0000000000000004 RSI: 00007f34ae7fbb30 RDI: 000000000000002a
[54274.007849] RBP: 00007f34ae7fbb30 R08: 0000000000000000 R09: 00007f34cc0da350
[54274.008189] R10: 00005610e47f735c R11: 0000000000000293 R12: 0000000000000004
[54274.008530] R13: 00007f34ae7fbb30 R14: 00007f34ae7fba90 R15: 00005610e4a123e0
[54274.008904] Mem-Info:
[54274.009250] active_anon:7496 inactive_anon:10875 isolated_anon:0
[54274.009250]  active_file:1076962 inactive_file:611445 isolated_file:0
[54274.009250]  unevictable:384 dirty:1129 writeback:0 unstable:0
[54274.009250]  slab_reclaimable:210856 slab_unreclaimable:49711
[54274.009250]  mapped:13460 shmem:588 pagetables:1810 bounce:0
[54274.009250]  free:50528 free_pcp:953 free_cma:0
[54274.011340] Node 0 active_anon:29984kB inactive_anon:43500kB active_file:4307848kB inactive_file:2445780kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:53840kB dirty:4516kB writeback:0kB shmem:2352kB shmem_thp: 0kB shmem_pmdmapped: 0kB anon_thp: 0kB writeback_tmp:0kB unstable:0kB all_unreclaimable? no
[54274.012514] Node 0 DMA free:15904kB min:132kB low:164kB high:196kB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:15988kB managed:15904kB mlocked:0kB kernel_stack:0kB pagetables:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
[54274.013769] lowmem_reserve[]: 0 3693 7909 7909 7909
[54274.014197] Node 0 DMA32 free:106504kB min:31496kB low:39368kB high:47240kB active_anon:14832kB inactive_anon:24064kB active_file:1435376kB inactive_file:1493804kB unevictable:0kB writepending:2128kB present:3915776kB managed:3825828kB mlocked:0kB kernel_stack:1592kB pagetables:2668kB bounce:0kB free_pcp:1296kB local_pcp:0kB free_cma:0kB
[54274.015498] lowmem_reserve[]: 0 0 4216 4216 4216
[54274.015958] Node 0 Normal free:79704kB min:54384kB low:63372kB high:72360kB active_anon:15152kB inactive_anon:19436kB active_file:2872884kB inactive_file:952936kB unevictable:1536kB writepending:2388kB present:4452352kB managed:4317204kB mlocked:0kB kernel_stack:3000kB pagetables:4572kB bounce:0kB free_pcp:2264kB local_pcp:0kB free_cma:0kB
[54274.017314] lowmem_reserve[]: 0 0 0 0 0
[54274.017787] Node 0 DMA: 0*4kB 0*8kB 0*16kB 1*32kB (U) 2*64kB (U) 1*128kB (U) 1*256kB (U) 0*512kB 1*1024kB (U) 1*2048kB (M) 3*4096kB (M) = 15904kB
[54274.018756] Node 0 DMA32: 1548*4kB (UME) 2275*8kB (UME) 3869*16kB (UME) 659*32kB (UME) 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 107384kB
[54274.019778] Node 0 Normal: 4239*4kB (ME) 1727*8kB (MEH) 1951*16kB (MEH) 332*32kB (UMEH) 47*64kB (MEH) 16*128kB (UMH) 1*256kB (H) 1*512kB (H) 1*1024kB (H) 0*2048kB 0*4096kB = 79460kB
[54274.020847] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB
[54274.021395] 1689245 total pagecache pages
[54274.021964] 179 pages in swap cache
[54274.022518] Swap cache stats: add 8113, delete 7934, find 17199/17897
[54274.023070] Free swap  = 7972908kB
[54274.023654] Total swap = 7999020kB
[54274.024216] 2096029 pages RAM
[54274.024767] 0 pages HighMem/MovableOnly
[54274.025323] 56295 pages reserved
[54274.025889] 0 pages cma reserved
[54274.026439] 0 pages hwpoisoned

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs
