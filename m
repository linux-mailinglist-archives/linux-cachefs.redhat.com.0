Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBCE57FFE
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Jun 2019 12:15:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F307C59454;
	Thu, 27 Jun 2019 10:14:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58CF75C22F;
	Thu, 27 Jun 2019 10:14:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D425D1833002;
	Thu, 27 Jun 2019 10:14:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5RADulY000790 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 27 Jun 2019 06:13:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF5FB5C236; Thu, 27 Jun 2019 10:13:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB86A5C231
	for <linux-cachefs@redhat.com>; Thu, 27 Jun 2019 10:13:54 +0000 (UTC)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
	[209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4AA1E356E9
	for <linux-cachefs@redhat.com>; Thu, 27 Jun 2019 10:13:54 +0000 (UTC)
Received: by mail-pf1-f197.google.com with SMTP id c17so1277207pfb.21
	for <linux-cachefs@redhat.com>; Thu, 27 Jun 2019 03:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=3mRoTeX6a2t4VyFEQemahGkuB8nqi6oK4Pv6mn+2CiI=;
	b=X46jtolwD3S8UQDgANDEBvU6vs0wDJidJtqki1OAsYZCnt/vDcIM9yx+H9DePnIgyZ
	I3RdreDvM757IjPEllcp/gdyo4oYupeByXBeOuSgiSaALtT7tbDUOPDLpq3H90JNNdc8
	/bWoagXCubJA3vcuRdfDMf7sZe/yRPupeKelFWeG3uspkFikfu3f7wbhBG2K8AUfn+mZ
	NnaVLBGJlQo5JHh0KNWvV+T3QIwRXvqQsWP2uRNrTuTduxvEjQqi8y87XiRBc58eqwR+
	G/gKIZKEQVgRw7FzsSfVYC2Vj1toNIWWdjQJtDM29U1wRT94EUR/LPw432mhEP25//7j
	/B9Q==
X-Gm-Message-State: APjAAAVdISjPwI3zDRkua3m/p46n3Sgh26ZJVeOMAU9dpxomkUzZK6HB
	XF22Wtk/Fo8R0z6k0ZOBOlJItQEGHNjxcbrCafnAH0vbeYAblgjPmJb57e5w5iQYHXgl1c+6Xms
	poG8a+A+i6S4l7S12LYWLgw==
X-Received: by 2002:a17:902:848c:: with SMTP id
	c12mr3639797plo.17.1561630433252; 
	Thu, 27 Jun 2019 03:13:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKWL4ov3zLZd+TOxpJYN7tuIqRx9bpn3Xcu0GNdi+JHw75LC419uCbd9JV2jQ7RIeQ1eZ0rg==
X-Received: by 2002:a17:902:848c:: with SMTP id
	c12mr3639765plo.17.1561630432941; 
	Thu, 27 Jun 2019 03:13:52 -0700 (PDT)
Received: from fedora19.localdomain ([101.164.133.67])
	by smtp.gmail.com with ESMTPSA id
	v27sm5848667pgn.76.2019.06.27.03.13.51 for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 03:13:52 -0700 (PDT)
Date: Thu, 27 Jun 2019 20:13:48 +1000
From: Ian Wienand <iwienand@redhat.com>
To: linux-cachefs@redhat.com
Message-ID: <20190627101348.GB3239@fedora19.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Subject: [Linux-cachefs] 5.2.0-rc1-afs-next-9f4a9105 : kernel BUG at
	fs/fscache/operation.c:74
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 27 Jun 2019 10:15:01 +0000 (UTC)

Hello,

We are running a 5.2.0-rc1 kernel from the afs-next branch @ 9f4a9105
and hit the following.

The host is serving files from various AFS volumes via Apache.  It is
all read-only traffic.  We have cachefilesd configured to a dedicated
ext4 filesystem on a partition from a LVM volume.

We have had the host disappear a number of times without trace.  It is
a VM and just went into "shutdown" state on the provider side.  It did
the same this time, but this was the first time we managed to grab a
oops (via netconsole to a remote host).  If the prior shutdowns were
due to this is unclear, but likely.  The host has been up for several
days at times, but only about 12 hours before we hit this.  So it
seems racy.

Happy for suggestions!

Thanks,

-i

---

[74690.011888] FS-Cache:
[74690.011917] FS-Cache: Assertion failed
[74690.011929] FS-Cache: 4 == 5 is false
[74690.011964] ------------[ cut here ]------------
[74690.011982] kernel BUG at fs/fscache/operation.c:74!
[74690.012004] invalid opcode: 0000 [#1] SMP PTI
[74690.012017] CPU: 2 PID: 21 Comm: ksoftirqd/2 Not tainted 5.2.0-rc1-afs-next-9f4a9105 #2
[74690.012035] Hardware name: Xen HVM domU, BIOS 4.1.5 11/28/2013
[74690.012059] RIP: 0010:fscache_enqueue_operation+0x1f1/0x210 [fscache]
[74690.012075] Code: c7 78 52 9e c0 e8 22 c6 51 e9 48 c7 c7 86 52 9e c0 e8 16 c6 51 e9 8b 73 40 ba 05 00 00 00 48 c7 c7 a8 42 9e c0 e8 02 c6 51 e9 <0f> 0b 48 c7 c7 f0 42 9e c0 e8 f4 c5 51 e9 0f 0b 0f 1f 44 00 00 66
[74690.012114] RSP: 0018:ffffa93f00d7bb78 EFLAGS: 00010086
[74690.012127] RAX: 0000000000000019 RBX: ffff8fedcef5f900 RCX: 0000000000000006
[74690.012144] RDX: 0000000000000000 RSI: 0000000000000092 RDI: ffff8fefc7497380
[74690.012160] RBP: ffffa93f00d7bb90 R08: 000000000000027b R09: 0000000000000000
[74690.012175] R10: ffffa93f00d7bc88 R11: ffff8fefbd898000 R12: ffff8fedcef5f900
[74690.012189] R13: ffff8fedc815b020 R14: ffffffffab408100 R15: 0000000000000000
[74690.012238] CR2: 00007f724441a000 CR3: 000000003e420000 CR4: 00000000000006e0
[74690.012255] Call Trace:
[74690.012271]  cachefiles_read_waiter+0xd5/0x130 [cachefiles]
[74690.012287]  __wake_up_common+0x73/0x130
[74690.012209] FS:  0000000000000000(0000) GS:ffff8fefc7480000(0000) knlGS:0000000000000000
[74690.012225] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[74690.012306]  __wake_up_locked_key_bookmark+0x1b/0x20
[74690.012327]  wake_up_page_bit+0xab/0x100
[74690.012339]  unlock_page+0x26/0x30
[74690.012772]  mpage_end_io+0x74/0x100
[74690.013141]  bio_endio+0xf0/0x170
[74690.013505]  dec_pending+0x10e/0x210
[74690.013919]  clone_endio+0x90/0x180
[74690.014268]  bio_endio+0xf0/0x170
[74690.014616]  blk_update_request+0x7b/0x300
[74690.014970]  blk_mq_end_request+0x20/0x130
[74690.015319]  blkif_complete_rq+0x15/0x20
[74690.015669]  blk_done_softirq+0x92/0xc0
[74690.016018]  __do_softirq+0xe4/0x2f3
[74690.016365]  run_ksoftirqd+0x2b/0x40
[74690.016708]  smpboot_thread_fn+0xfc/0x170
[74690.017051]  kthread+0x121/0x140
[74690.017388]  ? sort_range+0x30/0x30
[74690.017726]  ? kthread_park+0x90/0x90
[74690.018069]  ret_from_fork+0x35/0x40
[74690.018410] Modules linked in: netconsole kafs fcrypt pcbc rxrpc cachefiles fscache binfmt_misc ip6t_REJECT nf_reject_ipv6 ip6table_filter ip6_tables ipt_REJECT nf_reject_ipv4 xt_tcpudp xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_filter ppdev joydev intel_rapl sb_edac intel_rapl_perf input_leds serio_raw parport_pc parport mac_hid sch_fq_codel ib_iser rdma_cm iw_cm ib_cm ib_core xenfs xen_privcmd iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi ip_tables x_tables autofs4 btrfs zstd_compress raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c raid1 raid0 multipath linear hid_generic usbhid hid crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel cirrus drm_kms_helper aes_x86_64 crypto_simd syscopyarea cryptd sysfillrect glue_helper sysimgblt fb_sys_fops psmouse drm i2c_piix4 pata_acpi floppy
[74690.021073] ---[ end trace 8a69254422d3d600 ]---
[74690.021493] RIP: 0010:fscache_enqueue_operation+0x1f1/0x210 [fscache]
[74690.021913] Code: c7 78 52 9e c0 e8 22 c6 51 e9 48 c7 c7 86 52 9e c0 e8 16 c6 51 e9 8b 73 40 ba 05 00 00 00 48 c7 c7 a8 42 9e c0 e8 02 c6 51 e9 <0f> 0b 48 c7 c7 f0 42 9e c0 e8 f4 c5 51 e9 0f 0b 0f 1f 44 00 00 66
[74690.022784] RSP: 0018:ffffa93f00d7bb78 EFLAGS: 00010086
[74690.023224] RAX: 0000000000000019 RBX: ffff8fedcef5f900 RCX: 0000000000000006
[74690.023664] RDX: 0000000000000000 RSI: 0000000000000092 RDI: ffff8fefc7497380
[74690.024103] RBP: ffffa93f00d7bb90 R08: 000000000000027b R09: 0000000000000000
[74690.024535] R10: ffffa93f00d7bc88 R11: ffff8fefbd898000 R12: ffff8fedcef5f900
[74690.024955] R13: ffff8fedc815b020 R14: ffffffffab408100 R15: 0000000000000000
[74690.025483] FS:  0000000000000000(0000) GS:ffff8fefc7480000(0000) knlGS:0000000000000000
[74690.026142] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[74690.026815] CR2: 00007f724441a000 CR3: 000000003e420000 CR4: 00000000000006e0
[74690.027510] Kernel panic - not syncing: Fatal exception in interrupt
[74690.028393] Kernel Offset: 0x28e00000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs
