Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0931CC028
	for <lists+linux-cachefs@lfdr.de>; Sat,  9 May 2020 12:01:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589018480;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4tF+2stcfJFsV0hCLCojHqPydcZpdmuxKj1nvQnYz2Y=;
	b=E0drWVAsA12hMaXFpnaOEpHZU+66bOjtPIvXcy/lQcTIqAMJwNYVKGprvlVawiKOXB+gHO
	3oCaGHUb1exIaY5xtzvvE+Dlr6YMV+rd1y8aOY3cqUKskYl41M8CqiHXbQpmEavhLA+uUA
	Uba+UhJ4HVDrmQVDPEuUzxtXEfkNmnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-RiFOEi5iP3CnOE-ds8jsoQ-1; Sat, 09 May 2020 06:01:18 -0400
X-MC-Unique: RiFOEi5iP3CnOE-ds8jsoQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D36B4800687;
	Sat,  9 May 2020 10:01:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6843670493;
	Sat,  9 May 2020 10:01:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EBD654CAA0;
	Sat,  9 May 2020 10:01:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 049A1Cto008832 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 9 May 2020 06:01:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9A13C20267F2; Sat,  9 May 2020 10:01:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95F68202683D
	for <linux-cachefs@redhat.com>; Sat,  9 May 2020 10:01:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE700811E7A
	for <linux-cachefs@redhat.com>; Sat,  9 May 2020 10:01:09 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
	[209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-332-eg8eqYSnM8mUuLGRfSFIhA-1; Sat, 09 May 2020 06:01:07 -0400
X-MC-Unique: eg8eqYSnM8mUuLGRfSFIhA-1
Received: by mail-ed1-f71.google.com with SMTP id j9so1653563edr.0
	for <linux-cachefs@redhat.com>; Sat, 09 May 2020 03:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eQh9Ro1CS/VzcvZu4r+0jxvGVFEo1JSYYPYiVRM4vA4=;
	b=aDuZ1Ayx0kBJjZ1c6tJ2DGpMZAuVlVZeCh/Zmb1ANq5U5+z6lyUJG7S7oeL4OserpL
	dne0LxYzoKHcF3K43UgaWcHsVC1DqxJ80yllPXVkCe7FnwBJleIHpyi9TLXi5cGnIJdn
	9mki9FVUyw+0jPDdaILV1YUEKpE7PfVmdu19VExEnYYAGxQxOb/JzWD2mHCsaLkDXniU
	/tPgesC6iss+KFJ/NH8Zjktw+hYVSddb5yrYybIm8hhLmldrYPloXwKKe6TRalJMGrSE
	uWP7B7ENSrwjXVaJDRWf5neadO6X9fM3WPtD2A03wAG3xDRnED+rveSKyUQLCzXwYM9E
	TLWg==
X-Gm-Message-State: AGi0PuYyYOqrn/7sV98b3Y08CEAb1x3Np9y+VJjmPpi0bMTifc64OD04
	WwWXcIwtwbNaWrzqQVcG6oqhMOGuhEymua5GG5PuHUtrS/C1G4S3Vv3MP3QpgS7+EGrGuS0OOuc
	cxmWN7aw1dj6T152xlXxzNwaF3+OnhyrLSRUORw==
X-Received: by 2002:a17:906:5e50:: with SMTP id
	b16mr5597532eju.331.1589018465878; 
	Sat, 09 May 2020 03:01:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypLMnq8DpXaYPt1LryP+pHHL84BGpd4+cnwpZ0kqtgB0YfTqMnyqAOR7WaTpG4N+98gHc9NZVcI+ESI00vvW6kM=
X-Received: by 2002:a17:906:5e50:: with SMTP id
	b16mr5597502eju.331.1589018465536; 
	Sat, 09 May 2020 03:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <MEAPR01MB2600BD6F2B65E0E90CF507268CA30@MEAPR01MB2600.ausprd01.prod.outlook.com>
In-Reply-To: <MEAPR01MB2600BD6F2B65E0E90CF507268CA30@MEAPR01MB2600.ausprd01.prod.outlook.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Sat, 9 May 2020 06:00:29 -0400
Message-ID: <CALF+zOnUewT0cMMu2GuuJAa_tPOH8ryJNvZQJe3GMwUfKgr+_Q@mail.gmail.com>
To: Greg M <gregm@servu.net.au>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
Subject: Re: [Linux-cachefs] fscache bug in Kernel 5.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, May 9, 2020 at 5:22 AM Greg M <gregm@servu.net.au> wrote:
>
> Hello,
>
> I have just tried to re-use fscache on Gentoo Linux again after a multi-year hiatus. Unfortunately there seems to be a major bug introduced in the 5.6 kernel.
>
> After only a few minutes, my system hangs completely and I have to power cycle it with a nfs mount configured with the "fsc" option:
>
> [ 1207.798737] ------------[ cut here ]------------
> [ 1207.798738] kernel BUG at fs/nfs/fscache.c:471!
> [ 1207.798741] invalid opcode: 0000 [#1] SMP PTI
> [ 1207.798784] CPU: 7 PID: 5044 Comm: php-fpm Not tainted 5.6.11-gentoo-x86_64 #1
> [ 1207.798877] Hardware name: Supermicro Super Server/X11SCL-F, BIOS 1.3 02/20/2020
> [ 1207.798976] RIP: 0010:__nfs_readpages_from_fscache+0x8b/0xa4
> [ 1207.799042] Code: 0d be 01 00 00 00 4c 89 e7 e8 e5 f7 ff ff 41 83 fa c3 74 1f 45 85 d2 74 08 41 83 fa 97 75 1a eb 12 48 8b 45 00 48 39 c5 74 02 <0f> 0b 83 3b 00 74 08 0f 0b 41 ba 01 00 00 00 5b 44 89 d0 5d 41 5c
> [ 1207.799316] RSP: 0018:ffffa0d806fc3b40 EFLAGS: 00010283
> [ 1207.799378] RAX: ffffc9ea9aef0b48 RBX: ffffa0d806fc3b6c RCX: ffffc9ea93a57fc0
> [ 1207.799471] RDX: 0000000000000004 RSI: 0000000000000001 RDI: ffff95041bb55a90
> [ 1207.799564] RBP: ffffa0d806fc3cf8 R08: 000000001b9f7601 R09: ffffa0d806fc3cf8
> [ 1207.799656] R10: 0000000000000000 R11: 00000000000003fa R12: ffff95041bb55a90
> [ 1207.799749] R13: 0000000000000004 R14: ffffa0d806fc3b80 R15: 0000000000000004
> [ 1207.799841] FS:  00007fab7a542980(0000) GS:ffff9506cebc0000(0000) knlGS:0000000000000000
> [ 1207.799947] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1207.800019] CR2: 00007fab698e5000 CR3: 000000083a1c8003 CR4: 00000000003606e0
> [ 1207.800111] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [ 1207.800204] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [ 1207.800295] Call Trace:
> [ 1207.800318]  nfs_readpages+0x108/0x17b
> [ 1207.800355]  ? xas_load+0x13/0x4a
> [ 1207.800387]  ? xas_find+0x6b/0x101
> [ 1207.800419]  read_pages+0x6c/0x115
> [ 1207.800452]  __do_page_cache_readahead+0xb1/0x180
> [ 1207.800507]  ondemand_readahead+0x1c2/0x1d4
> [ 1207.800553]  generic_file_read_iter+0x1ed/0x59f
> [ 1207.800605]  nfs_file_read+0x54/0x7c
> [ 1207.800641]  new_sync_read+0x77/0xaa
> [ 1207.800676]  vfs_read+0x95/0xca
> [ 1207.800707]  ksys_read+0x71/0xba
> [ 1207.800737]  do_syscall_64+0x48/0x55
> [ 1207.800773]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [ 1207.800832] RIP: 0033:0x7fab7c17feae
> [ 1207.800867] Code: c0 e9 c6 fe ff ff 50 48 8d 3d 36 b2 09 00 e8 79 e8 01 00 66 0f 1f 84 00 00 00 00 00 64 8b 04 25 18 00 00 00 85 c0 75 14 0f 05 <48> 3d 00 f0 ff ff 77 5a c3 66 0f 1f 84 00 00 00 00 00 48 83 ec 28
> [ 1207.801141] RSP: 002b:00007ffe9034a7e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> [ 1207.801240] RAX: ffffffffffffffda RBX: 00007fab7a352540 RCX: 00007fab7c17feae
> [ 1207.801332] RDX: 0000000000002000 RSI: 00007fab696c8000 RDI: 0000000000000008
> [ 1207.801425] RBP: 00007fab696c8000 R08: 0000000000002000 R09: 00000000000c8000
> [ 1207.801517] R10: 0000000000000300 R11: 0000000000000246 R12: 00007fab7a352540
> [ 1207.801610] R13: 0000000000002000 R14: 00007fab7a2839c0 R15: 0000000000000052
> [ 1207.801702] Modules linked in: ip6table_filter binfmt_misc ahci x86_pkg_temp_thermal input_leds led_class joydev libahci coretemp i2c_i801 libata efivars pcspkr msdos fuse
> [ 1207.801933] ---[ end trace 5c56244d22bfbc82 ]---
> [ 1207.801975] RIP: 0010:__nfs_readpages_from_fscache+0x8b/0xa4
> [ 1207.805516] Code: 0d be 01 00 00 00 4c 89 e7 e8 e5 f7 ff ff 41 83 fa c3 74 1f 45 85 d2 74 08 41 83 fa 97 75 1a eb 12 48 8b 45 00 48 39 c5 74 02 <0f> 0b 83 3b 00 74 08 0f 0b 41 ba 01 00 00 00 5b 44 89 d0 5d 41 5c
> [ 1207.813103] RSP: 0018:ffffa0d806fc3b40 EFLAGS: 00010283
> [ 1207.813104] RAX: ffffc9ea9aef0b48 RBX: ffffa0d806fc3b6c RCX: ffffc9ea93a57fc0
> [ 1207.813104] RDX: 0000000000000004 RSI: 0000000000000001 RDI: ffff95041bb55a90
> [ 1207.813105] RBP: ffffa0d806fc3cf8 R08: 000000001b9f7601 R09: ffffa0d806fc3cf8
> [ 1207.813105] R10: 0000000000000000 R11: 00000000000003fa R12: ffff95041bb55a90
> [ 1207.813105] R13: 0000000000000004 R14: ffffa0d806fc3b80 R15: 0000000000000004
> [ 1207.813106] FS:  00007fab7a542980(0000) GS:ffff9506cebc0000(0000) knlGS:0000000000000000
> [ 1207.813106] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1207.813107] CR2: 00007fab698e5000 CR3: 000000083a1c8003 CR4: 00000000003606e0
> [ 1207.813108] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [ 1207.813108] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>
>
>
> This looks to have been introduced possibly with this commit https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v5.6.11&id=b0ea262a2347eac8522de5eef24ccd7a90dad7d4
>
> Happy to provide more info as required as this effectively makes fscache unusable on Linux 5.6
>

HEAD is now at aabff12c5db1... Linux 5.6.11
fs/nfs/fscache.c
462     if (*nr_pages < npages)
463         nfs_add_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_OK,
464                       npages);
465     if (*nr_pages > 0)
466         nfs_add_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL,
467                       *nr_pages);
468
469     switch (ret) {
470     case 0: /* read submitted to the cache for all pages */
471-->        BUG_ON(!list_empty(pages));
472         BUG_ON(*nr_pages != 0);
473         dfprintk(FSCACHE,
474              "NFS: nfs_getpages_from_fscache: submitted\n");
475
476         return ret;
477

This is a known issue with a fix queued up:
[PATCH 1/5] cachefiles: Fix corruption of the return value in
cachefiles_read_or_alloc_pages()
https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?h=fscache-fixes&id=c5f9d9db83d9f84d2b4aae5a1b29d9b582ccff2f


> Regards,
>
> Greg
> --
> Linux-cachefs mailing list
> Linux-cachefs@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-cachefs
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

