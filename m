Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF385898C
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Jun 2019 20:12:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD568285B4;
	Thu, 27 Jun 2019 18:11:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 577FF5C257;
	Thu, 27 Jun 2019 18:11:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 49FCF4EBD7;
	Thu, 27 Jun 2019 18:11:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5RI6MKq004730 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 27 Jun 2019 14:06:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 53B341001B13; Thu, 27 Jun 2019 18:06:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DC4F1001B06
	for <linux-cachefs@redhat.com>; Thu, 27 Jun 2019 18:06:19 +0000 (UTC)
Received: from azathoth.yuggoth.org (azathoth.yuggoth.org [162.242.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 304193E2CD
	for <linux-cachefs@redhat.com>; Thu, 27 Jun 2019 18:05:59 +0000 (UTC)
Received: from cthulhu.yuggoth.org ([2001:4802:7801:102:be76:4eff:fe20:63e0]
	helo=yuggoth.org) by azathoth.yuggoth.org with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <fungi@yuggoth.org>) id 1hgY6j-0000Td-Cb
	for linux-cachefs@redhat.com; Thu, 27 Jun 2019 17:22:49 +0000
Date: Thu, 27 Jun 2019 17:22:48 +0000
From: Jeremy Stanley <fungi@yuggoth.org>
To: linux-cachefs@redhat.com
Message-ID: <20190627172247.spjeh6ml6gspmnh4@yuggoth.org>
MIME-Version: 1.0
In-Reply-To: <20190627101348.GB3239@fedora19.localdomain>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:4802:7801:102:be76:4eff:fe20:63e0
X-SA-Exim-Rcpt-To: linux-cachefs@redhat.com
X-SA-Exim-Mail-From: fungi@yuggoth.org
X-SA-Exim-Scanned: No (on azathoth.yuggoth.org);
	SAEximRunCond expanded to false
X-Greylist: Delayed for 00:42:57 by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Thu, 27 Jun 2019 18:05:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Thu, 27 Jun 2019 18:05:59 +0000 (UTC) for IP:'162.242.242.62'
	DOMAIN:'azathoth.yuggoth.org' HELO:'azathoth.yuggoth.org'
	FROM:'fungi@yuggoth.org' RCPT:''
X-RedHat-Spam-Score: 0.001 (SPF_NONE) 162.242.242.62 azathoth.yuggoth.org
	162.242.242.62 azathoth.yuggoth.org <fungi@yuggoth.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] 5.2.0-rc1-afs-next-9f4a9105 : kernel BUG at
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
Content-Type: multipart/mixed; boundary="===============8140173453453793161=="
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Thu, 27 Jun 2019 18:12:04 +0000 (UTC)


--===============8140173453453793161==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f42cxppu65hqr3jx"
Content-Disposition: inline


--f42cxppu65hqr3jx
Content-Type: multipart/mixed; boundary="kvmgqu6ga7zpxjwi"
Content-Disposition: inline


--kvmgqu6ga7zpxjwi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

We caught another basically identical panic after ~5.5 hours
running, captured via a remote netconsole stream just before the VM
instance spontaneously terminated. Attached.
--=20
Jeremy Stanley

--kvmgqu6ga7zpxjwi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="panic_2019-06-27T15:20.txt"

[19810.938809] FS-Cache:
[19810.942102] FS-Cache: Assertion failed
[19810.946177] FS-Cache: 4 == 5 is false
[19810.949270] ------------[ cut here ]------------
[19810.952131] kernel BUG at fs/fscache/operation.c:74!
[19810.954445] invalid opcode: 0000 [#1] SMP PTI
[19810.955224] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 5.2.0-rc1-afs-next-9f4a9105 #2
[19810.956028] Hardware name: Xen HVM domU, BIOS 4.1.5 11/28/2013
[19810.956756] RIP: 0010:fscache_enqueue_operation+0x1f1/0x210 [fscache]
[19810.957473] Code: c7 78 32 91 c0 e8 22 e6 be c3 48 c7 c7 86 32 91 c0 e8 16 e6 be c3 8b 73 40 ba 05 00 00 00 48 c7 c7 a8 22 91 c0 e8 02 e6 be c3 <0f> 0b 48 c7 c7 f0 22 91 c0 e8 f4 e5 be c3 0f 0b 0f 1f 44 00 00 66
[19810.958955] RSP: 0018:ffffa54940d90c78 EFLAGS: 00010086
[19810.959725] RAX: 0000000000000019 RBX: ffff8f3892725f00 RCX: 0000000000000006
[19810.960486] RDX: 0000000000000000 RSI: 0000000000000082 RDI: ffff8f3a47497380
[19810.961245] RBP: ffffa54940d90c90 R08: 00000000000004f4 R09: ffff8f3a46c52810
[19810.962008] R10: 00000000000002d8 R11: ffff8f3859befeb8 R12: ffff8f3892725f00
[19810.962761] R13: ffff8f38bc1934a0 R14: ffffffff85a08130 R15: 0000000000000000
[19810.963647] FS:  0000000000000000(0000) GS:ffff8f3a47480000(0000) knlGS:0000000000000000
[19810.964466] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19810.965231] CR2: 00007f1ca4990000 CR3: 000000016f7ac000 CR4: 00000000000006e0
[19810.965964] Call Trace:
[19810.966679]  <IRQ>
[19810.967415]  cachefiles_read_waiter+0xd5/0x130 [cachefiles]
[19810.968125]  __wake_up_common+0x73/0x130
[19810.968888]  __wake_up_locked_key_bookmark+0x1b/0x20
[19810.969873]  wake_up_page_bit+0xab/0x100
[19810.970615]  unlock_page+0x26/0x30
[19810.971301]  mpage_end_io+0x74/0x100
[19810.971956]  bio_endio+0xf0/0x170
[19810.972595]  dec_pending+0x10e/0x210
[19810.973231]  clone_endio+0x90/0x180
[19810.973844]  bio_endio+0xf0/0x170
[19810.974496]  blk_update_request+0x7b/0x300
[19810.975098]  blk_mq_end_request+0x20/0x130
[19810.975816]  blkif_complete_rq+0x15/0x20
[19810.976483]  blk_done_softirq+0x92/0xc0
[19810.977017]  __do_softirq+0xe4/0x2f3
[19810.977543]  irq_exit+0xb6/0xc0
[19810.978059]  xen_evtchn_do_upcall+0x30/0x50
[19810.978577]  xen_hvm_callback_vector+0xf/0x20
[19810.979110]  </IRQ>
[19810.979613] RIP: 0010:native_safe_halt+0x12/0x20
[19810.980125] Code: 00 0f 00 2d 42 30 5c 00 f4 5d c3 0f 1f 00 66 2e 0f 1f 84 00 00 00 00 00 55 48 89 e5 e9 07 00 00 00 0f 00 2d 22 30 5c 00 fb f4 <5d> c3 90 90 90 90 90 90 90 90 90 90 90 90 e8 7b 4d b7 3b 55 48 89
[19810.981225] RSP: 0018:ffffa54940ccfe70 EFLAGS: 00000286 ORIG_RAX: ffffffffffffff0c
[19810.981789] RAX: ffffffff84e46e50 RBX: 0000000000000002 RCX: 0000000000000001
[19810.982361] RDX: ffff8f3a474ab980 RSI: ffffa54940ccfe40 RDI: 0000000000000000
[19810.982942] RBP: ffffa54940ccfe70 R08: 00000000133325b8 R09: 0000000000000076
[19810.983537] R10: 00000000000003d4 R11: ffff8f3924dc73e4 R12: 0000000000000002
[19810.984122] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[19810.984715]  ? __cpuidle_text_start+0x8/0x8
[19810.985300]  default_idle+0x22/0x150
[19810.985949]  arch_cpu_idle+0x15/0x20
[19810.986531]  default_idle_call+0x23/0x30
[19810.987130]  do_idle+0x1cb/0x280
[19810.987719]  cpu_startup_entry+0x1d/0x20
[19810.988365]  start_secondary+0x181/0x1d0
[19810.988940]  secondary_startup_64+0xa4/0xb0
[19810.989485] Modules linked in: netconsole kafs fcrypt pcbc rxrpc cachefiles fscache binfmt_misc ip6t_REJECT nf_reject_ipv6 ip6table_filter ip6_tables ipt_REJECT nf_reject_ipv4 xt_tcpudp xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_filter ppdev intel_rapl sb_edac joydev intel_rapl_perf input_leds serio_raw parport_pc parport mac_hid sch_fq_codel ib_iser rdma_cm iw_cm ib_cm ib_core iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi xenfs xen_privcmd ip_tables x_tables autofs4 btrfs zstd_compress raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c raid1 raid0 multipath linear hid_generic usbhid hid crct10dif_pclmul crc32_pclmul ghash_clmulni_intel cirrus aesni_intel drm_kms_helper syscopyarea aes_x86_64 sysfillrect crypto_simd sysimgblt cryptd fb_sys_fops glue_helper drm psmouse pata_acpi i2c_piix4 floppy
[19810.994087] ---[ end trace 2068878944818e0d ]---
[19810.994681] RIP: 0010:fscache_enqueue_operation+0x1f1/0x210 [fscache]
[19810.995282] Code: c7 78 32 91 c0 e8 22 e6 be c3 48 c7 c7 86 32 91 c0 e8 16 e6 be c3 8b 73 40 ba 05 00 00 00 48 c7 c7 a8 22 91 c0 e8 02 e6 be c3 <0f> 0b 48 c7 c7 f0 22 91 c0 e8 f4 e5 be c3 0f 0b 0f 1f 44 00 00 66
[19810.996553] RSP: 0018:ffffa54940d90c78 EFLAGS: 00010086
[19810.997178] RAX: 0000000000000019 RBX: ffff8f3892725f00 RCX: 0000000000000006
[19810.997807] RDX: 0000000000000000 RSI: 0000000000000082 RDI: ffff8f3a47497380
[19810.998438] RBP: ffffa54940d90c90 R08: 00000000000004f4 R09: ffff8f3a46c52810
[19810.999126] R10: 00000000000002d8 R11: ffff8f3859befeb8 R12: ffff8f3892725f00
[19810.999770] R13: ffff8f38bc1934a0 R14: ffffffff85a08130 R15: 0000000000000000
[19811.000421] FS:  0000000000000000(0000) GS:ffff8f3a47480000(0000) knlGS:0000000000000000
[19811.001075] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19811.001734] CR2: 00007f1ca4990000 CR3: 000000016f7ac000 CR4: 00000000000006e0
[19811.002456] Kernel panic - not syncing: Fatal exception in interrupt
[19811.003259] Kernel Offset: 0x3400000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)

--kvmgqu6ga7zpxjwi--

--f42cxppu65hqr3jx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAABCgB9FiEEl65Jb8At7J/DU7LnSPmWEUNJWCkFAl0U+2FfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDk3
QUU0OTZGQzAyREVDOUZDMzUzQjJFNzQ4Rjk5NjExNDM0OTU4MjkACgkQSPmWEUNJ
WCkmzg//c/GxDUyXDRmHR2hAn+fmHSatDIvvReISpqORqQt4jjE6MRYB3U/mJzYd
H3pUCN/AfPRlbPkQQZJktAXQXJ8pe43fkWmi/jOdAL7beqrR7DS+ggJBgEUINyBX
mT802b3QEKhYhWNibEntwm2f5qWzLkSQw3DspG9rADEYLnl2siQJPN/rD7f543K2
bFnPTUP7OHEw4GGM81B/sX3Y2miABc33zWffhVdRNW6b3RXjX7KdLPOV36eW/rK2
rCKSX9QnpMnj0Hss3VIqO+clxIcySSiTAJKkiTEgFaNZquad0dx6XWb2KwMNOjqj
42UKdF7nkYiW8OkuuqxcPkRxRBP2hq4xrS9SXS7njLS1nQNUHn9hbrZ2R1I48A7Y
oB2Xj2bZ3oqNApDYGTkschDqzbYc+I4VPUjfv9krWOXE2ZahEUo1nbEF68VRPXeb
XflrOWUpc4gseT3lvoUGNR/SGPuhy97Hcm9gFcgQuaYhNd066Py8MRGBre69Bmd6
xueyBqOGqr5XmlQeZtkJAvV9UVFQlNt7llNLbd7VUgOZybvjPXMxQDS8+pUUxc+Z
6lat55nkuBBQngux8Nnz0JEart3v0yf6sNn3e+7QG7ZysSzG9D2zkRNLkdF4YibP
RxDOjjEY9HBjJMWsITzPfzniZT/w51PvegtC+808swx4Bl3egTE=
=M3MT
-----END PGP SIGNATURE-----

--f42cxppu65hqr3jx--


--===============8140173453453793161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs
--===============8140173453453793161==--

