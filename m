Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6553B1CC102
	for <lists+linux-cachefs@lfdr.de>; Sat,  9 May 2020 13:35:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589024111;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AtfuCe89W9uzwkH+n3SfkJapbKCRKeniSHsaytatzLI=;
	b=X8N8AHPPIlj+CWbtpgaciEw7cN2tS8IjFQfq5s1VcIQJ6zdS8Ct4m0W6x34a+XGDw1rEJP
	7xEDyS+WFXVbXgzwdpEHdZPH9H4bSEDEC7c/D/y8e4uDUnbRLJi1gUshgMb7ML1IunZgrw
	AxouPpOzKNFfQx6ejSD3w4tYvxP9rcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-q7uASml-M2OFqBzrjBg8pA-1; Sat, 09 May 2020 07:35:09 -0400
X-MC-Unique: q7uASml-M2OFqBzrjBg8pA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 653DB1005510;
	Sat,  9 May 2020 11:35:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 793875D9CC;
	Sat,  9 May 2020 11:35:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C9BF4CA95;
	Sat,  9 May 2020 11:35:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 049BYvJh014933 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 9 May 2020 07:34:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F3C2320267F2; Sat,  9 May 2020 11:34:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF04E202683D
	for <linux-cachefs@redhat.com>; Sat,  9 May 2020 11:34:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B910D811E77
	for <linux-cachefs@redhat.com>; Sat,  9 May 2020 11:34:54 +0000 (UTC)
Received: from AUS01-SY3-obe.outbound.protection.outlook.com
	(mail-eopbgr1370109.outbound.protection.outlook.com [40.107.137.109])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-361-q-PJRCkiN_OG5Z9b_BWcJA-1; Sat, 09 May 2020 07:34:51 -0400
X-MC-Unique: q-PJRCkiN_OG5Z9b_BWcJA-1
Received: from MEAPR01MB2600.ausprd01.prod.outlook.com (52.134.201.19) by
	MEAPR01MB4840.ausprd01.prod.outlook.com (20.178.178.76) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2979.29; Sat, 9 May 2020 11:34:47 +0000
Received: from MEAPR01MB2600.ausprd01.prod.outlook.com
	([fe80::78f9:2c5a:a555:9d98]) by
	MEAPR01MB2600.ausprd01.prod.outlook.com
	([fe80::78f9:2c5a:a555:9d98%7]) with mapi id 15.20.2979.033;
	Sat, 9 May 2020 11:34:47 +0000
From: Greg M <gregm@servu.net.au>
To: David Wysochanski <dwysocha@redhat.com>
Thread-Topic: [Linux-cachefs] fscache bug in Kernel 5.6
Thread-Index: AdYl4ncpZMtpgnDiRYq5Xkug1AbchQABjQaAAAJ0SYA=
Date: Sat, 9 May 2020 11:34:46 +0000
Message-ID: <MEAPR01MB26009A5383AE8018D8727ED78CA30@MEAPR01MB2600.ausprd01.prod.outlook.com>
References: <MEAPR01MB2600BD6F2B65E0E90CF507268CA30@MEAPR01MB2600.ausprd01.prod.outlook.com>
	<CALF+zOnUewT0cMMu2GuuJAa_tPOH8ryJNvZQJe3GMwUfKgr+_Q@mail.gmail.com>
In-Reply-To: <CALF+zOnUewT0cMMu2GuuJAa_tPOH8ryJNvZQJe3GMwUfKgr+_Q@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [120.16.237.231]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8dbbdff2-0e15-437c-ae4a-08d7f40cfa35
x-ms-traffictypediagnostic: MEAPR01MB4840:
x-microsoft-antispam-prvs: <MEAPR01MB48407273ED249D727908E87A8CA30@MEAPR01MB4840.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 03982FDC1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TVVu91xiiMeQkIlpBRw+WHhO0QNTBmK2BOx3kV/w+y6k+GjBX2QhL30tRsxl3GUmp0xu3tM/Le4djI9eBfAYob84CeeupbTFF+kKSM483AhltAFy1eAx7SSTK84VKwMvIEmBEZCo+LNct8KJt4G+VE1p/C0ZkQtN+wPzML4xQ9WcoTCm3Sedn6tbxPHBe2oIVdUEbBK3vxbxtSFjo5E4XfwIDrcdlZSododPbrd27VlEVNbbgGPe4yVCjW9Vi096sU837186tiq/q8XDu5Eb4peTlHt2gUgpDWpp9F4mvd7tp97nzLZEi2Q9kCcvUf+sasmD54ofuyA5hlRh0KIe0gV7WNEuoXX07/a6NKBQvV/kSugC6tOB8hw8qwrCiLzjy3d0/Xkdp6gkz5lugam74YhwZH6CAzhzzQkCDEl2fx4pDbu50LQNgulhe1/mG1c6ImO7dYb4kBWueIg1gtvToi+WE5bTQ02XSHNAGBc/n9+SsPtl/MriRDSCSYGrtL1V/lDqkldIXRdaBcrQC9FK/WtueBeyJXTQpIYTgBUKz3rONSKoD/2Rk/r6kYF+AcorJYkI3XTeNnYaBP00C7vJoAc+m7xrkjXeghcRfQzvRHM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MEAPR01MB2600.ausprd01.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(396003)(136003)(366004)(346002)(39830400003)(376002)(33430700001)(8936002)(5660300002)(71200400001)(66556008)(66476007)(76116006)(66946007)(33440700001)(64756008)(2906002)(53546011)(6506007)(186003)(7696005)(26005)(508600001)(66446008)(45080400002)(33656002)(86362001)(450100002)(52536014)(55016002)(966005)(8676002)(9686003)(316002)(6916009)(4326008);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: H/1TIypJ2tS9ctlFhT9nS3Wm4vswVS3/10PBRvq1ryTqOf7/n0XgMMOPDoA+Fj5AGKwDfrUv9CLX+grQ8S3SuzXPwlxbT4ZiiqS2axl1PD/nQut3DjH1pseBD7diIbNWwFQZLSHNz/DczsmlBN/NUr1Vjzm0kG34gIulDhSd8zYScBfnN9dEUnNm1fVVreUR8IbRG667TvN37CdiTK7ROn3fsos2lq3uGVcTPnsX7ZW+zFBC0aZ9Ux6A8NflweeNqBre7yNflNDuTz/LMi0pXPinR4TPuGmoBQqndCRyQqrrFWBsQn8M+jKkJfbq2sMNAqEtJeZfPrnSYnpf797EAlc8Wdow2yn6hzIINggZyb9kCRMI8rF34c6TM0Zy/m7hNzUjZ0QW1eUe8JQUYCtqLhvg7/ZoJxnhpIiL1nfRay6jg07KQgYn/wcFN0sk8RIrajcA34HPFxYBvy4cebqnZxqKD4O61Fl21NybeakAH1497IAfPskx+i3ZGRixB7sA
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: servu.net.au
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dbbdff2-0e15-437c-ae4a-08d7f40cfa35
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2020 11:34:46.8972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 48bf32e7-02f1-4c3f-a0de-b079bb737228
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ShH5+PsQmTjzMPLAlr8C9GgbrzylFHQxC1fyNljtR6twb9H42+Rfc4RQvSwhZ/Z8w1YnuXB/fe+FiRIA2jwj7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEAPR01MB4840
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 049BYvJh014933
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks David & Daire. 

I have applied the patches from David H and so far so good for the last 60 minutes.

Appreciate the fast replies.

Kind Regards,

Greg

-----Original Message-----
From: David Wysochanski <dwysocha@redhat.com> 
Sent: Saturday, 9 May 2020 6:00 PM
To: Greg M <gregm@servu.net.au>
Cc: linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] fscache bug in Kernel 5.6

On Sat, May 9, 2020 at 5:22 AM Greg M <gregm@servu.net.au> wrote:
>
> Hello,
>
> I have just tried to re-use fscache on Gentoo Linux again after a multi-year hiatus. Unfortunately there seems to be a major bug introduced in the 5.6 kernel.
>
> After only a few minutes, my system hangs completely and I have to power cycle it with a nfs mount configured with the "fsc" option:
>
> [ 1207.798737] ------------[ cut here ]------------ [ 1207.798738] 
> kernel BUG at fs/nfs/fscache.c:471!
> [ 1207.798741] invalid opcode: 0000 [#1] SMP PTI [ 1207.798784] CPU: 7 
> PID: 5044 Comm: php-fpm Not tainted 5.6.11-gentoo-x86_64 #1 [ 
> 1207.798877] Hardware name: Supermicro Super Server/X11SCL-F, BIOS 1.3 
> 02/20/2020 [ 1207.798976] RIP: 
> 0010:__nfs_readpages_from_fscache+0x8b/0xa4
> [ 1207.799042] Code: 0d be 01 00 00 00 4c 89 e7 e8 e5 f7 ff ff 41 83 
> fa c3 74 1f 45 85 d2 74 08 41 83 fa 97 75 1a eb 12 48 8b 45 00 48 39 
> c5 74 02 <0f> 0b 83 3b 00 74 08 0f 0b 41 ba 01 00 00 00 5b 44 89 d0 5d 
> 41 5c [ 1207.799316] RSP: 0018:ffffa0d806fc3b40 EFLAGS: 00010283 [ 
> 1207.799378] RAX: ffffc9ea9aef0b48 RBX: ffffa0d806fc3b6c RCX: 
> ffffc9ea93a57fc0 [ 1207.799471] RDX: 0000000000000004 RSI: 
> 0000000000000001 RDI: ffff95041bb55a90 [ 1207.799564] RBP: 
> ffffa0d806fc3cf8 R08: 000000001b9f7601 R09: ffffa0d806fc3cf8 [ 
> 1207.799656] R10: 0000000000000000 R11: 00000000000003fa R12: 
> ffff95041bb55a90 [ 1207.799749] R13: 0000000000000004 R14: 
> ffffa0d806fc3b80 R15: 0000000000000004 [ 1207.799841] FS:  
> 00007fab7a542980(0000) GS:ffff9506cebc0000(0000) 
> knlGS:0000000000000000 [ 1207.799947] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033 [ 1207.800019] CR2: 00007fab698e5000 CR3: 000000083a1c8003 CR4: 00000000003606e0 [ 1207.800111] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000 [ 1207.800204] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400 [ 1207.800295] Call Trace:
> [ 1207.800318]  nfs_readpages+0x108/0x17b [ 1207.800355]  ? 
> xas_load+0x13/0x4a [ 1207.800387]  ? xas_find+0x6b/0x101 [ 
> 1207.800419]  read_pages+0x6c/0x115 [ 1207.800452]  
> __do_page_cache_readahead+0xb1/0x180
> [ 1207.800507]  ondemand_readahead+0x1c2/0x1d4 [ 1207.800553]  
> generic_file_read_iter+0x1ed/0x59f
> [ 1207.800605]  nfs_file_read+0x54/0x7c [ 1207.800641]  
> new_sync_read+0x77/0xaa [ 1207.800676]  vfs_read+0x95/0xca [ 
> 1207.800707]  ksys_read+0x71/0xba [ 1207.800737]  
> do_syscall_64+0x48/0x55 [ 1207.800773]  
> entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [ 1207.800832] RIP: 0033:0x7fab7c17feae [ 1207.800867] Code: c0 e9 c6 
> fe ff ff 50 48 8d 3d 36 b2 09 00 e8 79 e8 01 00 66 0f 1f 84 00 00 00 
> 00 00 64 8b 04 25 18 00 00 00 85 c0 75 14 0f 05 <48> 3d 00 f0 ff ff 77 
> 5a c3 66 0f 1f 84 00 00 00 00 00 48 83 ec 28 [ 1207.801141] RSP: 
> 002b:00007ffe9034a7e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000 [ 
> 1207.801240] RAX: ffffffffffffffda RBX: 00007fab7a352540 RCX: 
> 00007fab7c17feae [ 1207.801332] RDX: 0000000000002000 RSI: 
> 00007fab696c8000 RDI: 0000000000000008 [ 1207.801425] RBP: 
> 00007fab696c8000 R08: 0000000000002000 R09: 00000000000c8000 [ 
> 1207.801517] R10: 0000000000000300 R11: 0000000000000246 R12: 
> 00007fab7a352540 [ 1207.801610] R13: 0000000000002000 R14: 
> 00007fab7a2839c0 R15: 0000000000000052 [ 1207.801702] Modules linked 
> in: ip6table_filter binfmt_misc ahci x86_pkg_temp_thermal input_leds 
> led_class joydev libahci coretemp i2c_i801 libata efivars pcspkr msdos 
> fuse [ 1207.801933] ---[ end trace 5c56244d22bfbc82 ]--- [ 
> 1207.801975] RIP: 0010:__nfs_readpages_from_fscache+0x8b/0xa4
> [ 1207.805516] Code: 0d be 01 00 00 00 4c 89 e7 e8 e5 f7 ff ff 41 83 
> fa c3 74 1f 45 85 d2 74 08 41 83 fa 97 75 1a eb 12 48 8b 45 00 48 39 
> c5 74 02 <0f> 0b 83 3b 00 74 08 0f 0b 41 ba 01 00 00 00 5b 44 89 d0 5d 
> 41 5c [ 1207.813103] RSP: 0018:ffffa0d806fc3b40 EFLAGS: 00010283 [ 
> 1207.813104] RAX: ffffc9ea9aef0b48 RBX: ffffa0d806fc3b6c RCX: 
> ffffc9ea93a57fc0 [ 1207.813104] RDX: 0000000000000004 RSI: 
> 0000000000000001 RDI: ffff95041bb55a90 [ 1207.813105] RBP: 
> ffffa0d806fc3cf8 R08: 000000001b9f7601 R09: ffffa0d806fc3cf8 [ 
> 1207.813105] R10: 0000000000000000 R11: 00000000000003fa R12: 
> ffff95041bb55a90 [ 1207.813105] R13: 0000000000000004 R14: 
> ffffa0d806fc3b80 R15: 0000000000000004 [ 1207.813106] FS:  
> 00007fab7a542980(0000) GS:ffff9506cebc0000(0000) 
> knlGS:0000000000000000 [ 1207.813106] CS:  0010 DS: 0000 ES: 0000 CR0: 
> 0000000080050033 [ 1207.813107] CR2: 00007fab698e5000 CR3: 
> 000000083a1c8003 CR4: 00000000003606e0 [ 1207.813108] DR0: 
> 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000 [ 
> 1207.813108] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 
> 0000000000000400
>
>
>
> This looks to have been introduced possibly with this commit 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commi
> t/?h=v5.6.11&id=b0ea262a2347eac8522de5eef24ccd7a90dad7d4
>
> Happy to provide more info as required as this effectively makes 
> fscache unusable on Linux 5.6
>

HEAD is now at aabff12c5db1... Linux 5.6.11 fs/nfs/fscache.c
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

