Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 615BD1CBFC1
	for <lists+linux-cachefs@lfdr.de>; Sat,  9 May 2020 11:22:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589016172;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ThInJve+jX2GVIwzST+a77gVpaQoyi8LDA9vEFTrHx4=;
	b=aSJTlrVPAN5r2K0YteQjHTGX2x8pXSIvVQW0zLv0I+ye+wv13QRXZI6j231W+FEboXAGZV
	IfoGQ80wk9cpOm1SdhXfdt3aYBB1PZZ0bXC81Ez1UgpWk2NBV0xF/VFK3g0iUbCmXGlDIU
	5Y5ui/qY0Rvj3epqAQOUUl8XBGLH8J0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-y6FmdGNWNYeuGC9I6WQgXg-1; Sat, 09 May 2020 05:22:49 -0400
X-MC-Unique: y6FmdGNWNYeuGC9I6WQgXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8D71107ACCA;
	Sat,  9 May 2020 09:22:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6100D1001B0B;
	Sat,  9 May 2020 09:22:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64F611809543;
	Sat,  9 May 2020 09:22:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0499MblK006149 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 9 May 2020 05:22:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7839E12491B; Sat,  9 May 2020 09:22:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72F6D121857
	for <linux-cachefs@redhat.com>; Sat,  9 May 2020 09:22:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CED68008A3
	for <linux-cachefs@redhat.com>; Sat,  9 May 2020 09:22:34 +0000 (UTC)
Received: from AUS01-ME1-obe.outbound.protection.outlook.com
	(mail-eopbgr1360133.outbound.protection.outlook.com [40.107.136.133])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-193-JCEVij4xNeywSyc0agsjQQ-1; Sat, 09 May 2020 05:22:29 -0400
X-MC-Unique: JCEVij4xNeywSyc0agsjQQ-1
Received: from MEAPR01MB2600.ausprd01.prod.outlook.com (52.134.201.19) by
	MEAPR01MB2776.ausprd01.prod.outlook.com (52.134.196.147) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2979.33; Sat, 9 May 2020 09:22:25 +0000
Received: from MEAPR01MB2600.ausprd01.prod.outlook.com
	([fe80::78f9:2c5a:a555:9d98]) by
	MEAPR01MB2600.ausprd01.prod.outlook.com
	([fe80::78f9:2c5a:a555:9d98%7]) with mapi id 15.20.2979.033;
	Sat, 9 May 2020 09:22:25 +0000
From: Greg M <gregm@servu.net.au>
To: "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
Thread-Topic: fscache bug in Kernel 5.6
Thread-Index: AdYl4ncpZMtpgnDiRYq5Xkug1AbchQ==
Date: Sat, 9 May 2020 09:22:25 +0000
Message-ID: <MEAPR01MB2600BD6F2B65E0E90CF507268CA30@MEAPR01MB2600.ausprd01.prod.outlook.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [120.16.65.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8d0f859-f8f1-4b12-6513-08d7f3fa7c71
x-ms-traffictypediagnostic: MEAPR01MB2776:
x-microsoft-antispam-prvs: <MEAPR01MB27764C5AF7AF7AB4D8B54CC58CA30@MEAPR01MB2776.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 03982FDC1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XVaH5kVNYe/aLo006QXkehrk8lLmNBi9Bcz9jLbCjm7KhI0cZfa37EG7tqR9LHCtoC0nk2U+n9XEl2TJhXUme1MUMaq7PdIif9vSOd6OMIjHnAWGSiJI7O9y+A4LmBrFmKYTuoOxww0HONlhWhVS5scem7eF0wjlFmV4mHMieq8B6nQ4aRfK53H87DJfEorGzWkfpc3A41XyMCNM70PE3nL1xkrmvET8/X1ABK/wjPzwCwQ6tZ4oyMOANpXeQtdruckXVWO42NfmhCiqV7kFo/ySQpGHYgvNXl5Ccia5BvPzEdZVm5p0UUYcbqzK4doA83QN8BDjR1dbdufFcMkkYT+cRxv0q/1nbNbmS4M2lCRecGVfKYj3XBNdr806J6ioXLz3qGAcQizVbO/Ed64DfS0BCtCzySiQpUudxqe3OdBR3j/J+T7PEygRpruSZOs5UGq7Ru15y7g+FDw1yHcdfo5B0E+PP9FCp4PUieyUBp7nWvYyrp9wVcpZsKgIK1MgiKKmcScKD7/LKK9SewcRlPvukkqBR/Ya0ohbTJABDhFzGkcFzbh+bW2DUBdBjOUcZL+zIN69ixSaWh7Grtp2VSKTiQ/0+2aUbKT3khXZnDM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MEAPR01MB2600.ausprd01.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(136003)(346002)(39830400003)(396003)(366004)(376002)(33430700001)(8676002)(6916009)(66556008)(66446008)(66946007)(52536014)(9326002)(76116006)(508600001)(64756008)(66476007)(33656002)(166002)(966005)(45080400002)(316002)(33440700001)(186003)(26005)(8936002)(9686003)(55016002)(6506007)(5660300002)(2906002)(7696005)(86362001)(71200400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: s0yVr5jQgf3ajrlh+n3X9VAGFLBybn4ukrvhs2vCnLw5NIZ/yfiiefuVvqvW4IS/+ogZbI7V3SkQdvCVlYLxf2zFavjfCl/G0QcfZLExBqNIQyeq8TzJ9A1s94CFw4K+IIijvAnpY+BI8k9do7hbijlJEYKRjtTgMsmiutXJ53fZ5cV7nNVTtOJOiMGGh9uuTai8F49SSsju4NcvMNOc6DyfU6dIql6OmAHsp7MuENGQ/PIPMFdkfFxlokf1llwC1s9BPu6e7v7lvtbhUMrsVRgdnY8uEvJjmX3G0mzbcmVGBHhR2msJH87exPitVEkHOc5PvAjSJmOGodJFCMtQXm7ZQl1aPTw4oK+/+zvWfcnfa5OHw49h3UrlbOL0dOUI82aQFWqgWoG6xqD66fPN1KFHFwBrq18wiiNIJ20rBOS4pgQshzkUQ7eq9OjhCFILpggWEASKhP3dSdC/L7C2fkUpYBWLU8megBdRZNU5Wfk=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: servu.net.au
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d0f859-f8f1-4b12-6513-08d7f3fa7c71
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2020 09:22:25.0274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 48bf32e7-02f1-4c3f-a0de-b079bb737228
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Fh2hBUmIiaFyw7VTvlLBLHerk32S6iQAP/Ap6u974BmQKd/9r18kbs9uy9ynCRQmgUrZviVPA2qwW9WTik00Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEAPR01MB2776
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [Linux-cachefs] fscache bug in Kernel 5.6
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I have just tried to re-use fscache on Gentoo Linux again after a multi-year hiatus. Unfortunately there seems to be a major bug introduced in the 5.6 kernel.

After only a few minutes, my system hangs completely and I have to power cycle it with a nfs mount configured with the "fsc" option:

[ 1207.798737] ------------[ cut here ]------------
[ 1207.798738] kernel BUG at fs/nfs/fscache.c:471!
[ 1207.798741] invalid opcode: 0000 [#1] SMP PTI
[ 1207.798784] CPU: 7 PID: 5044 Comm: php-fpm Not tainted 5.6.11-gentoo-x86_64 #1
[ 1207.798877] Hardware name: Supermicro Super Server/X11SCL-F, BIOS 1.3 02/20/2020
[ 1207.798976] RIP: 0010:__nfs_readpages_from_fscache+0x8b/0xa4
[ 1207.799042] Code: 0d be 01 00 00 00 4c 89 e7 e8 e5 f7 ff ff 41 83 fa c3 74 1f 45 85 d2 74 08 41 83 fa 97 75 1a eb 12 48 8b 45 00 48 39 c5 74 02 <0f> 0b 83 3b 00 74 08 0f 0b 41 ba 01 00 00 00 5b 44 89 d0 5d 41 5c
[ 1207.799316] RSP: 0018:ffffa0d806fc3b40 EFLAGS: 00010283
[ 1207.799378] RAX: ffffc9ea9aef0b48 RBX: ffffa0d806fc3b6c RCX: ffffc9ea93a57fc0
[ 1207.799471] RDX: 0000000000000004 RSI: 0000000000000001 RDI: ffff95041bb55a90
[ 1207.799564] RBP: ffffa0d806fc3cf8 R08: 000000001b9f7601 R09: ffffa0d806fc3cf8
[ 1207.799656] R10: 0000000000000000 R11: 00000000000003fa R12: ffff95041bb55a90
[ 1207.799749] R13: 0000000000000004 R14: ffffa0d806fc3b80 R15: 0000000000000004
[ 1207.799841] FS:  00007fab7a542980(0000) GS:ffff9506cebc0000(0000) knlGS:0000000000000000
[ 1207.799947] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1207.800019] CR2: 00007fab698e5000 CR3: 000000083a1c8003 CR4: 00000000003606e0
[ 1207.800111] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[ 1207.800204] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[ 1207.800295] Call Trace:
[ 1207.800318]  nfs_readpages+0x108/0x17b
[ 1207.800355]  ? xas_load+0x13/0x4a
[ 1207.800387]  ? xas_find+0x6b/0x101
[ 1207.800419]  read_pages+0x6c/0x115
[ 1207.800452]  __do_page_cache_readahead+0xb1/0x180
[ 1207.800507]  ondemand_readahead+0x1c2/0x1d4
[ 1207.800553]  generic_file_read_iter+0x1ed/0x59f
[ 1207.800605]  nfs_file_read+0x54/0x7c
[ 1207.800641]  new_sync_read+0x77/0xaa
[ 1207.800676]  vfs_read+0x95/0xca
[ 1207.800707]  ksys_read+0x71/0xba
[ 1207.800737]  do_syscall_64+0x48/0x55
[ 1207.800773]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1207.800832] RIP: 0033:0x7fab7c17feae
[ 1207.800867] Code: c0 e9 c6 fe ff ff 50 48 8d 3d 36 b2 09 00 e8 79 e8 01 00 66 0f 1f 84 00 00 00 00 00 64 8b 04 25 18 00 00 00 85 c0 75 14 0f 05 <48> 3d 00 f0 ff ff 77 5a c3 66 0f 1f 84 00 00 00 00 00 48 83 ec 28
[ 1207.801141] RSP: 002b:00007ffe9034a7e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[ 1207.801240] RAX: ffffffffffffffda RBX: 00007fab7a352540 RCX: 00007fab7c17feae
[ 1207.801332] RDX: 0000000000002000 RSI: 00007fab696c8000 RDI: 0000000000000008
[ 1207.801425] RBP: 00007fab696c8000 R08: 0000000000002000 R09: 00000000000c8000
[ 1207.801517] R10: 0000000000000300 R11: 0000000000000246 R12: 00007fab7a352540
[ 1207.801610] R13: 0000000000002000 R14: 00007fab7a2839c0 R15: 0000000000000052
[ 1207.801702] Modules linked in: ip6table_filter binfmt_misc ahci x86_pkg_temp_thermal input_leds led_class joydev libahci coretemp i2c_i801 libata efivars pcspkr msdos fuse
[ 1207.801933] ---[ end trace 5c56244d22bfbc82 ]---
[ 1207.801975] RIP: 0010:__nfs_readpages_from_fscache+0x8b/0xa4
[ 1207.805516] Code: 0d be 01 00 00 00 4c 89 e7 e8 e5 f7 ff ff 41 83 fa c3 74 1f 45 85 d2 74 08 41 83 fa 97 75 1a eb 12 48 8b 45 00 48 39 c5 74 02 <0f> 0b 83 3b 00 74 08 0f 0b 41 ba 01 00 00 00 5b 44 89 d0 5d 41 5c
[ 1207.813103] RSP: 0018:ffffa0d806fc3b40 EFLAGS: 00010283
[ 1207.813104] RAX: ffffc9ea9aef0b48 RBX: ffffa0d806fc3b6c RCX: ffffc9ea93a57fc0
[ 1207.813104] RDX: 0000000000000004 RSI: 0000000000000001 RDI: ffff95041bb55a90
[ 1207.813105] RBP: ffffa0d806fc3cf8 R08: 000000001b9f7601 R09: ffffa0d806fc3cf8
[ 1207.813105] R10: 0000000000000000 R11: 00000000000003fa R12: ffff95041bb55a90
[ 1207.813105] R13: 0000000000000004 R14: ffffa0d806fc3b80 R15: 0000000000000004
[ 1207.813106] FS:  00007fab7a542980(0000) GS:ffff9506cebc0000(0000) knlGS:0000000000000000
[ 1207.813106] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1207.813107] CR2: 00007fab698e5000 CR3: 000000083a1c8003 CR4: 00000000003606e0
[ 1207.813108] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[ 1207.813108] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400



This looks to have been introduced possibly with this commit https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v5.6.11&id=b0ea262a2347eac8522de5eef24ccd7a90dad7d4

Happy to provide more info as required as this effectively makes fscache unusable on Linux 5.6

Regards,

Greg
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

