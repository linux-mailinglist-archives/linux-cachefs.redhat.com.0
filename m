Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id ECE262927CB
	for <lists+linux-cachefs@lfdr.de>; Mon, 19 Oct 2020 15:00:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-6bjuxvXmPvaO0RMs2NbiHA-1; Mon, 19 Oct 2020 09:00:42 -0400
X-MC-Unique: 6bjuxvXmPvaO0RMs2NbiHA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22BA564162;
	Mon, 19 Oct 2020 13:00:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 523136716C;
	Mon, 19 Oct 2020 13:00:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6721B18408A1;
	Mon, 19 Oct 2020 13:00:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JD0UFc007753 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 09:00:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 732E51111C88; Mon, 19 Oct 2020 13:00:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E2E91111C85
	for <linux-cachefs@redhat.com>; Mon, 19 Oct 2020 13:00:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04911805C20
	for <linux-cachefs@redhat.com>; Mon, 19 Oct 2020 13:00:28 +0000 (UTC)
Received: from AUS01-ME1-obe.outbound.protection.outlook.com
	(mail-eopbgr1360105.outbound.protection.outlook.com [40.107.136.105])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-122-cHcsZd9hOvyVmOqioqVTKg-1; Mon, 19 Oct 2020 09:00:20 -0400
X-MC-Unique: cHcsZd9hOvyVmOqioqVTKg-1
Received: from SYBPR01MB4827.ausprd01.prod.outlook.com (2603:10c6:10:14::17)
	by SYBPR01MB5066.ausprd01.prod.outlook.com (2603:10c6:10:14::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25;
	Mon, 19 Oct 2020 13:00:16 +0000
Received: from SYBPR01MB4827.ausprd01.prod.outlook.com
	([fe80::4c59:14cb:69eb:ebfe]) by
	SYBPR01MB4827.ausprd01.prod.outlook.com
	([fe80::4c59:14cb:69eb:ebfe%5]) with mapi id 15.20.3477.028;
	Mon, 19 Oct 2020 13:00:16 +0000
From: Greg M <gregm@servu.net.au>
To: "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
Thread-Topic: fscache broken since kernel 5.8
Thread-Index: AdagdwKE5XLQKkTeR8ea4hHJgFiTHwFoLFZw
Date: Mon, 19 Oct 2020 13:00:15 +0000
Message-ID: <SYBPR01MB48274F8478B6D19E7D67AF5B8C1E0@SYBPR01MB4827.ausprd01.prod.outlook.com>
References: <SYBPR01MB4827ACD82D4C41A68D54751C8C070@SYBPR01MB4827.ausprd01.prod.outlook.com>
In-Reply-To: <SYBPR01MB4827ACD82D4C41A68D54751C8C070@SYBPR01MB4827.ausprd01.prod.outlook.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [103.46.213.135]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f36bfd7e-f7e7-4428-afd1-08d8742eeca2
x-ms-traffictypediagnostic: SYBPR01MB5066:
x-microsoft-antispam-prvs: <SYBPR01MB5066B6F699F2D2C0908F7DF48C1E0@SYBPR01MB5066.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: flAo2zi+vCFJqMoUCimAQFjmhYMiMD7GIB7FOwj/+0p/XLVed19m+NwUcPDxf0PQp5iS9mB4SFH4n8/wGC5xeLTxlQCOdWN+Tjblv8Y/tNT5ONn8ajvsbqRLcnGC7LxFq7jJqnKbyEjBBSxO6FXoxs28VnCUwSSawwH92wvAYGcEmPTup38eSoCxRcyqaOH1zj5JOqTVdK2qXscB0k7ZXGV5WF0YLkLYXXgfPO6Vl6guvnzlXbRx3e16n0OFW2XnHb4YULz4Va1fc/gqNkXJWCQpBINLYpm/9ZVfbuXv9XoVCIqZeKItyQ3RfPr3rOv2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SYBPR01MB4827.ausprd01.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(346002)(366004)(376002)(396003)(39830400003)(136003)(8936002)(8676002)(316002)(71200400001)(478600001)(83380400001)(9686003)(86362001)(55016002)(450100002)(26005)(186003)(33656002)(2906002)(7696005)(52536014)(6506007)(9326002)(66946007)(5660300002)(76116006)(45080400002)(64756008)(66446008)(6916009)(66476007)(66556008)(4326008);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: Cgg9Nn60nMrvqRCj3DKkVOqdSLYDB7yxYVbpdF3lph9n/xV/7MukxWzgqVx6aAWVq2EIIJx1+YvLsMzHkTuWzqowHgtMcYFULP7GZSycJXo7HhYta9H0M6xRn1lX+pCwK27nLXYvdToqKCD/yA18ITdxMDSNw3PLCERgksan6Cgp6afB69/s0Bc0ysIJwb1MjMtdJPXXa/FaNw53ZDxvNTsUIWHs/v944FLapJqPtHikBqY0Yhn4zl1i0iQ4NVo4oTxmp/QBt3rMqrLhzPkFsS2ZoRJ2xqNhmor5Rt2hw/rzCKNCqXWOyO/bxHW51kVTqso6i97Ai1oQc4PheAD3sWgmIPPkKxxdcfd3HDI1IAqeFQO4e8elFKoBM+ClnoO8MUgFxy9rrjXibzig5ctowGdqSIzEZwYTmN0qhjhSPcPaReNWmKbp71rb7AX7+QO+gWttVuD4QvxI7Bxs8bzEG+33LX1Syu0eZnhASNVZUW+ejnU0umAyRegYk2NSwrmsPXZWOO0j+r/KmI5oImJqhmmLU9B1XqNdwbDB0swehi95Ajz+kr3TxGtmjOF4WsbbS0TfeqttwbMC7ZBxFCQRVKNKaO8D1Go5J2nSQDYNx6sRWskVA2+leDU9u5Gt9AWaHdpCj0/r8Y/+6JaOep3ucg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: servu.net.au
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB4827.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f36bfd7e-f7e7-4428-afd1-08d8742eeca2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2020 13:00:15.9348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 48bf32e7-02f1-4c3f-a0de-b079bb737228
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VC6NKzhGYzUfn0awqrTXBK1JfVO63YUp6k7ZXwUzfXKyw47Eei5Tnw9KFiFS+CNduXj1kB8FMtpsxu9OPbwpEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBPR01MB5066
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [Linux-cachefs] fscache broken since kernel 5.8
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

<Apologies for the re-send, the original email was sent to the wrong mailing list address.>

I have been attempting to upgrade my Gentoo webservers from kernel 5.7 to 5.8 however I have been running into a cachefiles bug since 5.8.0 - which is still occurring on 5.8.14.

This is the dmesg output:

[31033.884329] CacheFiles:
[31033.887797] CacheFiles: Assertion failed
[31033.891300] ------------[ cut here ]------------
[31033.894826] kernel BUG at fs/cachefiles/rdwr.c:715!
[31033.894829] invalid opcode: 0000 [#73] SMP PTI
[31033.894830] CPU: 8 PID: 4435 Comm: php-fpm Tainted: G      D           5.8.14-gentoo-x86_64 #1
[31033.894830] Hardware name: Supermicro Super Server/X11SCL-F, BIOS 1.4 05/26/2020
[31033.894833] RIP: 0010:cachefiles_read_or_alloc_pages+0xc4/0x5e4
[31033.894834] Code: ff 0f 0b 49 8b 47 30 48 8b 40 70 48 83 78 20 00 75 1a 48 c7 c7 c7 39 da 9d e8 48 28 dd ff 48 c7 c7 d7 39 da 9d e8 3c 28 dd ff <0f> 0b 49 8b 47 28 ba 0c 00 00 00 66 c7 44 24 48 00 00 45 31 f6 0f
[31033.894835] RSP: 0018:ffffa097c7887a40 EFLAGS: 00010246
[31033.894835] RAX: 000000000000001c RBX: ffffa097c7887d20 RCX: 0000000000000000
[31033.894836] RDX: 0000000000000000 RSI: ffff91490ec17890 RDI: ffff91490ec17890
[31033.894836] RBP: ffffa097c7887bbc R08: 000000000000000f R09: 0000000000000000
[31033.894836] R10: 0000000000aaaaaa R11: ffffa097c12ff020 R12: ffff914550d26e40
[31033.894837] R13: ffffa097c7887bbc R14: ffff914550d26e40 R15: ffff914807998670
[31033.894837] FS:  00007f0fcc832980(0000) GS:ffff91490ec00000(0000) knlGS:0000000000000000
[31033.894838] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[31033.894838] CR2: 00007f0f8c07d000 CR3: 0000000736fb8002 CR4: 00000000003606e0
[31033.894839] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[31033.894839] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[31033.894839] Call Trace:
[31033.894842]  ? rpc_wake_up_first_on_wq+0xf0/0xf7
[31033.894844]  ? kmem_cache_alloc_trace+0xe3/0xf2
[31033.894860]  ? fscache_run_op+0x82/0x90
[31033.894861]  __fscache_read_or_alloc_pages+0x23b/0x2d8
[31033.894863]  __nfs_readpages_from_fscache+0x46/0xa8
[31033.894865]  nfs_readpages+0x108/0x170
[31033.894867]  ? nfs4_file_open+0x19b/0x1d4
[31033.996631]  read_pages+0x8d/0x114
[31033.996633]  page_cache_readahead_unbounded+0xd0/0x19e
[31033.996634]  generic_file_buffered_read+0x11e/0x4fa
[31033.996636]  nfs_file_read+0x54/0x7d
[31033.996638]  new_sync_read+0x77/0xaa
[31033.996639]  vfs_read+0xc6/0x103
[31033.996640]  ksys_read+0x71/0xba
[31033.996642]  do_syscall_64+0x48/0x67
[31033.996644]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[31033.996645] RIP: 0033:0x7f0fce4c545e
[31033.996646] Code: c0 e9 b6 fe ff ff 50 48 8d 3d be e0 09 00 e8 f9 e4 01 00 66 0f 1f 84 00 00 00 00 00 64 8b 04 25 18 00 00 00 85 c0 75 14 0f 05 <48> 3d 00 f0 ff ff 77 5a c3 66 0f 1f 84 00 00 00 00 00 48 83 ec 28
[31033.996647] RSP: 002b:00007ffc0174dbb8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[31033.996647] RAX: ffffffffffffffda RBX: 00007f0fcc6e8380 RCX: 00007f0fce4c545e
[31033.996648] RDX: 0000000000002000 RSI: 00007f0fcc6a4000 RDI: 0000000000000008
[31033.996648] RBP: 00007f0fcc6a4000 R08: 00007f0fcc6a4000 R09: 0000003fffffffff
[31033.996649] R10: 0000000000000002 R11: 0000000000000246 R12: 0000000000000003
[31033.996649] R13: 0000000000002000 R14: 00007f0fcc67d480 R15: 00007f0fcc6e8380
[31033.996650] Modules linked in: ip6t_REJECT nf_reject_ipv6 ip6table_filter binfmt_misc x86_pkg_temp_thermal input_leds joydev led_class i40e coretemp i2c_i801 efivars pcspkr i2c_smbus ahci libahci libata
[31033.997353] ---[ end trace c44b03d0e3d7bd38 ]---
[31034.069000] RIP: 0010:cachefiles_read_or_alloc_pages+0xc4/0x5e4
[31034.069001] Code: ff 0f 0b 49 8b 47 30 48 8b 40 70 48 83 78 20 00 75 1a 48 c7 c7 c7 39 da 9d e8 48 28 dd ff 48 c7 c7 d7 39 da 9d e8 3c 28 dd ff <0f> 0b 49 8b 47 28 ba 0c 00 00 00 66 c7 44 24 48 00 00 45 31 f6 0f
[31034.069002] RSP: 0018:ffffa097c0933940 EFLAGS: 00010246
[31034.084198] RAX: 000000000000001c RBX: ffffa097c0933c20 RCX: 0000000000000027
[31034.084199] RDX: 0000000000000000 RSI: 0000000000000002 RDI: ffff91490ec57890
[31034.084199] RBP: ffffa097c0933abc R08: 0000000000000001 R09: ffff91492efdd400
[31034.084200] R10: 00000000000002f2 R11: 000000000000003c R12: ffff9147889503c0
[31034.084200] R13: ffffa097c0933abc R14: ffff9147889503c0 R15: ffff914817910a20
[31034.084201] FS:  00007f0fcc832980(0000) GS:ffff91490ec00000(0000) knlGS:0000000000000000
[31034.084202] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[31034.109695] CR2: 00007f0f8c07d000 CR3: 0000000736fb8002 CR4: 00000000003606e0
[31034.109696] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[31034.109696] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

I don't really have much else to report other than the above. Eventually my webserver will crash and require a power cycle.

Kind Regards,

Greg M

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

