Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B95FA2353DF
	for <lists+linux-cachefs@lfdr.de>; Sat,  1 Aug 2020 19:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596303822;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZKvh26qo33x86mYVlEcmXLafhVzIesymL9GHSV+GBtg=;
	b=HWWDVKdWdRgaZiuNTx8e5n+x21YSceGOlcVLLt4D/V5YDEZ25E7xpDP2TTZnZsmgOrHPx3
	lzRFTODGnvXzylyBzgBUHArgctX2sIS2HnedzkqqhIjhH+9Ip2LvcjfUUpO1fdpCmsDnO2
	7ofIbwOVIomrdkr4Xp11fvmoZXd5hb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-Ppf5P0roMA6KJDIOc2nZPA-1; Sat, 01 Aug 2020 13:43:40 -0400
X-MC-Unique: Ppf5P0roMA6KJDIOc2nZPA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBDA8101C8A6;
	Sat,  1 Aug 2020 17:43:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C63B5C1D3;
	Sat,  1 Aug 2020 17:43:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C626B95A8A;
	Sat,  1 Aug 2020 17:43:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 071HhSrT015159 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 1 Aug 2020 13:43:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA0B72166BA0; Sat,  1 Aug 2020 17:43:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C53552166B28
	for <linux-cachefs@redhat.com>; Sat,  1 Aug 2020 17:43:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B42648007D7
	for <linux-cachefs@redhat.com>; Sat,  1 Aug 2020 17:43:26 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
	[209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-327-5zKJ2MEZMueXjNnpPCMPMQ-1; Sat, 01 Aug 2020 13:43:24 -0400
X-MC-Unique: 5zKJ2MEZMueXjNnpPCMPMQ-1
Received: by mail-ed1-f72.google.com with SMTP id p26so8121765edt.11
	for <linux-cachefs@redhat.com>; Sat, 01 Aug 2020 10:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N/hToSYUxLP/SBDJMpuZbShbcJehNKirSiTIgxtYmlo=;
	b=UB0/n6+ciCkHKBLyhNdxcvv1wS9DXl0x+nx7/DjBwfT5tjlCMSESOWiPseQGu7Xabn
	BJaYqvEEVkMVSa8sPVqc2Hw4EbWp1sobG9dUZunKvdKjXi26h5O61lBwDe4qBa2rzEOZ
	EAFf4VdXvOTMZdeN92K5xxA2qfJjUimgxxRwsd/PVSF0yWHtQchJe0QzMpHPCLZiStZ4
	clH95pifwq/KaFWDz1Fvt9SiPdun1SDnmJR2u4UFoaDUB9OtT/+qLXXU2hiTx6Qs1gVb
	2B7nM+M44Hl32e4yQD4crhBOycTJBf83oVBTInyt30sRy4F4CkbBZqGsJ3iIP79ebzcl
	PKQw==
X-Gm-Message-State: AOAM5321FHY45sHfzM15f3QWibgVSsiEG/y+JCTLkkAgAobIv/iTU5XG
	fhmYaUU8R8/2bebEuUMpCxL9gPkRymVe5DnMhrTpuUzvQ7CbS9GGdnNzyiYoysaf7Y4Y0tMsqkl
	CPRe3R+vFexMtrqZo1RO58mMSJ/3zEQWYmZMGQg==
X-Received: by 2002:a17:906:7b48:: with SMTP id
	n8mr9315862ejo.110.1596303803484; 
	Sat, 01 Aug 2020 10:43:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyl3ha4ll+I6Ocx4o4a/hyY/XeYF2QLkw+NTggc7Tt/JfAdkRWXnrrFqZQyqmbSDdCP1C3o6f1AxbLgwn6q2v0=
X-Received: by 2002:a17:906:7b48:: with SMTP id
	n8mr9315854ejo.110.1596303803266; 
	Sat, 01 Aug 2020 10:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
	<1596031949-26793-14-git-send-email-dwysocha@redhat.com>
	<43e8a8ff1ea015bb7bd335d5616268d36155327a.camel@redhat.com>
	<CALF+zOnYLbibbYxvbyUJFJQ+NtcreuAvFkZYr9h3_qQswbMxRw@mail.gmail.com>
	<CALF+zOn9tSft_QkPaJ7w8v_OLTfon+acUB_W9MSb8EEMQGc94w@mail.gmail.com>
	<538846.1596139431@warthog.procyon.org.uk>
	<CALF+zO=8jkarrv8un3Ea5N2_8p72gqtqp27uePG4CbJAwxv9Sw@mail.gmail.com>
In-Reply-To: <CALF+zO=8jkarrv8un3Ea5N2_8p72gqtqp27uePG4CbJAwxv9Sw@mail.gmail.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Sat, 1 Aug 2020 13:42:47 -0400
Message-ID: <CALF+zOkrn=cm9Vkw+vRkb_wyZhWsv2-rw6oOZuU-WHcjQuVjRA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [RFC PATCH v2 13/14] NFS: Call
 fscache_resize_cookie() when inode size changes due to setattr
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 30, 2020 at 5:07 PM David Wysochanski <dwysocha@redhat.com> wrote:
>
> On Thu, Jul 30, 2020 at 4:03 PM David Howells <dhowells@redhat.com> wrote:
> >
> > David Wysochanski <dwysocha@redhat.com> wrote:
> >
> > > To be honest I'm not sure about needing a call to fscache_use/unuse_cookie()
> > > around the call to fscache_resize_cookie().  If the cookie has a
> > > refcount of 1 when it is created, and a file is never opened, so
> > > we never call fscache_use_cookie(), what might happen inside
> > > fscache_resize_cookie()?  The header on use_cookie() says
> >
> > I've have afs_setattr() doing use/unuse on the cookie around resize.
> >
> > David
> >
>
> Got it and will be fixed in next series.  Thanks!

I am getting a reproducible use-after-free panic now.  The panic
manifests itself as a random backtrace but
kasan report is below.

Here is the patch I tried:
https://github.com/DaveWysochanskiRH/kernel/commit/2c9e6e3f14380e76fd8cb0232c6b7dbab14f26a2

Without that patch generic/014 passes as does most other xfstest
generic tests, only 2 tests are failing now.

I added kasan and got the below report:
f32-node1 login: [  116.724496] FS-Cache: Netfs 'nfs' registered for caching
[  117.567384] Key type dns_resolver registered
[  118.465342] NFS: Registering the id_resolver key type
[  118.474332] Key type id_resolver registered
[  118.476319] Key type id_legacy registered
[  119.370158] run fstests generic/014 at 2020-08-01 13:27:08
[  121.548415] ==================================================================
[  121.553037] BUG: KASAN: slab-out-of-bounds in
cachefiles_shorten_content_map+0x257/0x280 [cachefiles]
[  121.556576] Read of size 1 at addr ffff8881db88e7c9 by task truncfile/5675
[  121.559207]
[  121.559861] CPU: 1 PID: 5675 Comm: truncfile Kdump: loaded Not
tainted 5.8.0-rc3-d9c7f5201a4f-kasan+ #3
[  121.563505] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[  121.565780] Call Trace:
[  121.566905]  dump_stack+0x91/0xc8
[  121.568301]  print_address_description.constprop.0+0x1a/0x210
[  121.570616]  ? _raw_spin_lock_irqsave+0x7d/0xc0
[  121.572429]  ? _raw_write_unlock_bh+0x60/0x60
[  121.574143]  ? cachefiles_shorten_content_map+0x257/0x280 [cachefiles]
[  121.576717]  kasan_report.cold+0x37/0x7c
[  121.578328]  ? __fscache_init_io_request+0x140/0x160 [fscache]
[  121.580625]  ? cachefiles_shorten_content_map+0x257/0x280 [cachefiles]
[  121.583191]  cachefiles_shorten_content_map+0x257/0x280 [cachefiles]
[  121.585686]  cachefiles_resize_object+0xc8/0x160 [cachefiles]
[  121.587946]  __fscache_resize_cookie+0x10c/0x320 [fscache]
[  121.590296]  nfs_setattr_update_inode+0x910/0xdf0 [nfs]
[  121.592407]  nfs4_proc_setattr+0x352/0x450 [nfsv4]
[  121.594321]  nfs_setattr+0x2f0/0x690 [nfs]
[  121.595962]  notify_change+0x760/0xd50
[  121.597455]  ? __down_timeout+0x20/0x20
[  121.598969]  do_truncate+0xde/0x170
[  121.600362]  ? file_open_root+0x1d0/0x1d0
[  121.601949]  do_sys_ftruncate+0x1e5/0x2d0
[  121.603551]  do_syscall_64+0x4d/0x90
[  121.604970]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  121.606941] RIP: 0033:0x7f45ace69bfb
[  121.608346] Code: Bad RIP value.
[  121.609615] RSP: 002b:00007ffd1a514988 EFLAGS: 00000202 ORIG_RAX:
000000000000004d
[  121.612539] RAX: ffffffffffffffda RBX: 000000000920470b RCX: 00007f45ace69bfb
[  121.615298] RDX: 000000000920470b RSI: 000000000920470b RDI: 0000000000000003
[  121.618033] RBP: 0000000000000003 R08: 000000000000005b R09: 00007f45acf32a40
[  121.620766] R10: fffffffffffff115 R11: 0000000000000202 R12: 000000005f25a5ed
[  121.623503] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[  121.626229]
[  121.626852] Allocated by task 5675:
[  121.628252]  save_stack+0x1b/0x40
[  121.629587]  __kasan_kmalloc.constprop.0+0xc2/0xd0
[  121.631463]  cachefiles_expand_content_map+0x70/0x1b0 [cachefiles]
[  121.633856]  cachefiles_shape_request+0x356/0x910 [cachefiles]
[  121.636119]  __fscache_shape_request+0xa1/0x180 [fscache]
[  121.638211]  fscache_read_helper+0x1e9/0x2200 [fscache]
[  121.640263]  fscache_read_helper_locked_page+0x6c/0x80 [fscache]
[  121.642625]  __nfs_readpage_from_fscache+0x138/0x4a0 [nfs]
[  121.644768]  nfs_readpage+0x651/0x970 [nfs]
[  121.646431]  nfs_write_begin+0x3ff/0x960 [nfs]
[  121.648212]  generic_perform_write+0x1b5/0x3e0
[  121.649960]  nfs_file_write+0x36a/0x710 [nfs]
[  121.651679]  new_sync_write+0x361/0x5e0
[  121.653201]  vfs_write+0x14e/0x440
[  121.654536]  ksys_write+0xdd/0x1a0
[  121.655889]  do_syscall_64+0x4d/0x90
[  121.657297]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  121.659253]
[  121.659853] Freed by task 59:
[  121.661016]  save_stack+0x1b/0x40
[  121.662328]  __kasan_slab_free+0x12d/0x170
[  121.663924]  slab_free_freelist_hook+0x66/0x110
[  121.665684]  kfree+0xa5/0x210
[  121.666885]  process_one_work+0x64d/0x1030
[  121.668503]  worker_thread+0x562/0xf50
[  121.669973]  kthread+0x326/0x3f0
[  121.671292]  ret_from_fork+0x22/0x30
[  121.672682]
[  121.673291] The buggy address belongs to the object at ffff8881db88e780
[  121.673291]  which belongs to the cache kmalloc-64 of size 64
[  121.677970] The buggy address is located 9 bytes to the right of
[  121.677970]  64-byte region [ffff8881db88e780, ffff8881db88e7c0)
[  121.682577] The buggy address belongs to the page:
[  121.684492] page:ffffea00076e2380 refcount:1 mapcount:0
mapping:0000000000000000 index:0x0
[  121.687686] flags: 0x17ffffc0000200(slab)
[  121.689262] raw: 0017ffffc0000200 dead000000000100 dead000000000122
ffff8881e8c0f600
[  121.692218] raw: 0000000000000000 0000000000200020 00000001ffffffff
0000000000000000
[  121.695181] page dumped because: kasan: bad access detected
[  121.697342]
[  121.697961] Memory state around the buggy address:
[  121.699825]  ffff8881db88e680: 00 00 00 00 00 00 00 fc fc fc fc fc
fc fc fc fc
[  121.702608]  ffff8881db88e700: 00 00 00 00 00 00 fc fc fc fc fc fc
fc fc fc fc
[  121.705391] >ffff8881db88e780: 00 00 00 00 00 00 00 00 fc fc fc fc
fc fc fc fc
[  121.708160]                                               ^
[  121.710337]  ffff8881db88e800: 00 00 00 00 00 04 fc fc fc fc fc fc
fc fc fc fc
[  121.713116]  ffff8881db88e880: fb fb fb fb fb fb fb fb fc fc fc fc
fc fc fc fc
[  121.715915] ==================================================================
[  121.718695] Disabling lock debugging due to kernel taint

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

