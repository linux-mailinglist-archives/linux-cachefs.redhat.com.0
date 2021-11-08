Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDAC44B4ED
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Nov 2021 22:52:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-5Nsdx7EpPUyp4-2ZC4WLKQ-1; Tue, 09 Nov 2021 16:52:21 -0500
X-MC-Unique: 5Nsdx7EpPUyp4-2ZC4WLKQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4AAA1006AA3;
	Tue,  9 Nov 2021 21:52:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3C9D5C1D5;
	Tue,  9 Nov 2021 21:52:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C2D9C181A1D0;
	Tue,  9 Nov 2021 21:52:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A86KHd8014146 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 8 Nov 2021 01:20:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 52A0451DD; Mon,  8 Nov 2021 06:20:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B46E51DC
	for <linux-cachefs@redhat.com>; Mon,  8 Nov 2021 06:20:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C04980122B
	for <linux-cachefs@redhat.com>; Mon,  8 Nov 2021 06:20:14 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60083.outbound.protection.outlook.com [40.107.6.83]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-2-3JYDEgMjOBK07_LTsvPusg-1; Mon, 08 Nov 2021 01:20:10 -0500
X-MC-Unique: 3JYDEgMjOBK07_LTsvPusg-1
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
	HE1PR0301MB2410.eurprd03.prod.outlook.com (2603:10a6:3:68::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4669.15; Mon, 8 Nov 2021 06:20:05 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
	([fe80::d535:e3e:baf4:2d60]) by HE1PR03MB3162.eurprd03.prod.outlook.com
	([fe80::d535:e3e:baf4:2d60%5]) with mapi id 15.20.4669.016;
	Mon, 8 Nov 2021 06:20:05 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>, Steve French
	<sfrench@samba.org>, Jonathan Corbet <corbet@lwn.net>, David Howells
	<dhowells@redhat.com>, Russell King <linux@armlinux.org.uk>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman
	<mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Yoshinori Sato <ysato@users.osdn.me>, Rich Felker <dalias@libc.org>,
	Lee Jones <lee.jones@linaro.org>, Jeff Layton <jlayton@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd
	Bergmann <arnd@arndb.de>, Ronnie Sahlberg <lsahlber@redhat.com>, Guenter
	Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-sh@vger.kernel.org"
	<linux-sh@vger.kernel.org>, linux-power <linux-power@fi.rohmeurope.com>
Thread-Topic: [PATCH 6/7] include: mfd: Remove leftovers from bd70528 watchdog
Thread-Index: AQHX0lzMDNIdtW14e0WCkmlQyrtX/Kv5LJ2A
Date: Mon, 8 Nov 2021 06:20:05 +0000
Message-ID: <38c3dcf9-588c-323d-4630-ec6bc8af7313@fi.rohmeurope.com>
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
	<20211105154334.1841927-7-alexandre.ghiti@canonical.com>
In-Reply-To: <20211105154334.1841927-7-alexandre.ghiti@canonical.com>
Accept-Language: fi-FI, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.1.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9de774b5-ed75-4d36-2ab2-08d9a27fce8d
x-ms-traffictypediagnostic: HE1PR0301MB2410:
x-microsoft-antispam-prvs: <HE1PR0301MB241059E462984531F8906E0BAD919@HE1PR0301MB2410.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: Yare5VyqhT8p+QMDPl27wWH7WCbQqMHW4eIZKH0pys0jjAXxEmUuIGhKSA7QpLug/1Oy0yJVn57ZSI80dQegOPP2iaFawluLEDbQLSLN2gD38HPMhxugXBGOp0OpGvnQ6P5kKLeoYDjJznTfj/AXxJLVGK83y5E5qU9nV6Bf97bdzoEB4bftyJTtoQAxy29jQZWiGucSkG5b+916Oo96CjgTwpIA8zSet1kOR3oyH4n7oCnat4mJpDOQFSm7pgZevUf3fFzzCpicRksNxBdx1n6QDxEgVSGlkSczk9EngXAVsJGTu8YvQ1voQBX+ts8YHgl7aqRiU/g361uJUJ9t1X6v5vwxDcxGjyBAa533lc4UM6NvjVArGDqPsligzuBzZIRgcwkt2gsvuzdZqEiePaKhwISwdmKEAZfM4gVj5wNM8fqZyzopnAYRS/tFwO1ypQ2LS/5QyHsHHaUOPoiF+VMnGs8w7OevCKK+S26JxVsCfxbH6ZcRYzDokEyNaO//0Yvf4lBQkTp2HGfXlAeFCcqEvlgzfTRGswlu0PG0imMgx4yfilZyc2P+/cnX4HEgDl0yEH14niu4NdAoUJwElCcmnVKM46IeOIx2e4yRsKzHs8U0rz7fhTV7WoBbvmjHHDAsTEcXS3it69avhC7gTUZJikMOWQBemmyIpANv+bhu6VeXUdRio5MbqA0YaDkg+nH3/rOL5zPO38TXT1/h4rNMPMRmh3cz0/1BvBewCD2a60NeGFXqqAzeWS36xop+uAsYDg789VyDRhP76GrOZBs7xP895huUFOkcUcYN6AliLmKjJMCaWMF2q3ekJs+I9WnfoopNIszqZbIhFu6rneLIj6U5UhsdQ4MQAykarCwaU7DE6FFJE0NmMPxebSy4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:HE1PR03MB3162.eurprd03.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(366004)(66476007)(66946007)(2906002)(31686004)(31696002)(7416002)(7406005)(86362001)(508600001)(6512007)(76116006)(66556008)(64756008)(921005)(66446008)(966005)(6636002)(83380400001)(186003)(110136005)(6506007)(5660300002)(38070700005)(53546011)(71200400001)(316002)(2616005)(8936002)(6486002)(122000001)(8676002)(4744005)(38100700002)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3ZpV0hNWWwyMlIrQkhjQXBTTmZIRTdLTndHSmN4c1ZWbWxXNXhEdUlTN0JV?=
	=?utf-8?B?TktTaDVaLzN2SEoxSmcrMGdpcmRTa1NWOWtzNW9oZ1NGUTRFUXQrOGhzTlNq?=
	=?utf-8?B?MGRMLy9ZdTdLQUVMb1U1YzVSQTQ4NGViQUwzVVdCWXVYUkJhdnhjQUM3NGRu?=
	=?utf-8?B?MEc2dVRXWFRQTkt1RmtNeGNTbFROeTF4ZnJpalkyeUhweFFmUjBWTENHQkU3?=
	=?utf-8?B?Y1lDbEdJaW9peFd3KzFGRlloMjFtMTY0ZVhSdWhYOGxkR3B2YzB4MTFwVnVp?=
	=?utf-8?B?a09JTks1YVRPakhhV3VKajY3eWRTMFlhTHZCeURlNDNHWWZnSkhEZklKZVlu?=
	=?utf-8?B?UEt6N2w3Q2paamNqaktkODFJTE0xNGwzdk5pMTVBRHBNYTk3RldFdng4WHRG?=
	=?utf-8?B?dHlIb1RyUUVHdXFsc0l3RFk3TytCUUtMcDl4R1d1MWFCNy9FTzhSZS9EM0hU?=
	=?utf-8?B?dFdKaFI4UW5UeEN0Z0tHcy9HS3REbTR4V0h4TGo2SUN2a2I4SWNFZDFPZS8z?=
	=?utf-8?B?NjJYemh4UjFuTkNqbHRKUStsdlcvbllFQ0Iwc3dMZTVhSkZNWEMxNVE4elJv?=
	=?utf-8?B?MkNOV0ZMQmNhOGdRNUJUZ1dmZ0thYUlVN3RmSE4wUjQyVEZoOXA1NVBpZ1ZV?=
	=?utf-8?B?SWg2dEYrMTlhdUFObkRZcjAxU0o2cThoU0NXMU5LS1VpS0hzY2p5UDk4SFN2?=
	=?utf-8?B?bFc2U2sxTW0vUEpSNlRHMzU1ZzhaRDVRYSsyaWtHaHZpRlRiWExrQ3JOdzIw?=
	=?utf-8?B?RVlqUFdicGVCL010UTVMZXl6Sko2NFErcGY2b1RkZjQwL3pqU3BhMlpZcExF?=
	=?utf-8?B?NzRpcitmaW83S0dYQ3Y3TXRWZ085TXEvUEhnK2FVek8wejJIb3NRbU0rM255?=
	=?utf-8?B?YlBZdjEwalJGckpsMWFaZmdzSUpJZU1GYnBubEkyTW9oZ284bExKRFpDVDk3?=
	=?utf-8?B?aEYxdmowZ1ZCMytKYURRaEJtZllPTS9WQmtpcWF4WG5Fa3c1SHVtSmdJZGRV?=
	=?utf-8?B?MnRSRVlnVmx2RG5SMUVMQSs2bzUxeGdQVElWUmF0ZGlPWnJQbnVFdUtjWFJE?=
	=?utf-8?B?d29lNWZaWm0vVUZUYXFveVFRMDc1ZWlGc2R4Mk9kV2dSQXJNMkhnTFU4VWxQ?=
	=?utf-8?B?TTA3cmlFU1FjbGFDY0NGS0dUQThBM1JqMStzMVU2S25IajZLQ216dWFGa3F5?=
	=?utf-8?B?WnEzRXg3eWwxV0dJRUlZdFBFS3lBN1FvdkxjRVBSNjgrMUdXK2hwYUxRRW9Z?=
	=?utf-8?B?b0xpZStRb3dic0s2TkVKeDN5NnNQVkZYK2pMc2RJQytxdnhZT1hyTlBBVUsy?=
	=?utf-8?B?KzhSR3ZQN2JIM0phMHBIRU1HWFU2ZGs0MXZrdUJMbDgxWUNQRmovNFB5WEV1?=
	=?utf-8?B?VVYrOVo3K3lOa3RqVm0wc25QT3hINHhGT2lqQlZQeFp1V3hJZ2FkK3dmQ1Jj?=
	=?utf-8?B?eWEwNGt2S2lrWUxjM0R1b1poNDJxYWc3WG9BdmFTa0VJYWlieVp3Y1U2RTlT?=
	=?utf-8?B?dGoxZGlPQUk1NS94T2hOZWFGN21yZmpUY0hYVUduenFmU1FiU0JaWDdJa3E3?=
	=?utf-8?B?b2ZpWXUxSHpSejRtK0hMck92RGxQdlloUUNCV0hUVEk2aE9nU2MxWEh6ckVn?=
	=?utf-8?B?dTdLMWlnSy8xeHJnVEljU1RBdDRLSmVjR0Z6dHMxcnlPS2R3NGlGYlhlS1N0?=
	=?utf-8?B?bWxkSEUwUk9xK0ovVHdFUDFoYzFQMlNzRk1yZWt0Um4xbHE1cnRiUy9Qdk1O?=
	=?utf-8?B?R0tVR3VJWE8xbStwUDBtZCs2d2ZqNS9XMENPMlo4VmVBcHRxOG4vSmZrUDBj?=
	=?utf-8?B?V0xzOHpRd2d6bWNtU2hGSjRkRXF6U2dIdjZkdU9USjg1dVUrWW80MlI3UE5M?=
	=?utf-8?B?Ry9JWVlUcDZYQXhxVURrWDRCN3ZUVXBGT0tuTGZMTEErNExnaVhoZmZzMG1P?=
	=?utf-8?B?aE5WMUJqT0lhdU81ODBpenB5aGduSzdEYjZ3cjNmRVpyN0tOcVUrWVRhU0pq?=
	=?utf-8?B?TmpxNWpmaExITzhOV2RmS1ZOZWhKMisrakhFNFZoVjBiYlNtLzBHaXR0OVdV?=
	=?utf-8?B?cno1UVJFeUhabHJVQko5WXJPOHlTMGhzVm02L0RnU2Jjak9BMS9sbDB1MEdt?=
	=?utf-8?B?S1liRVd0QnhkbmsxZlgxd01paFU4N1VXNWc1UmFhVmpMRGt1TEw0RHYrZHFh?=
	=?utf-8?B?NTVxWHB5SFVvR3pZTHhRSjJXbzU0U1FZMXpoVWFRd3hyWGw1TDNldVNGSW83?=
	=?utf-8?B?d3NzS3hjNHpCTTNOdldPUXNRUEJ0cGhEYVdXZE5UWG5nS1JrU0hUalJkNkU0?=
	=?utf-8?B?NzNEQnhxOHUraDJ6ZVFrTS9rYW1XK1U5WGpLZWQ1M2hETDR0eVFhZz09?=
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de774b5-ed75-4d36-2ab2-08d9a27fce8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2021 06:20:05.8100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CNwa5VAZJUZw3wLPAlkIHlzcU3MAxrVRV1FQw+xgUBK/0VWF4fLs6coh7eFKImRyuE6YP4vhuxGYoRvKYHpIefUd5XKxj0ei6oXv0dWBPzr85iAh58JRMeYIQFB1FJMr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2410
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1A86KHd8014146
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 09 Nov 2021 16:44:57 -0500
Subject: Re: [Linux-cachefs] [PATCH 6/7] include: mfd: Remove leftovers from
	bd70528 watchdog
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
Content-Language: fi-FI
Content-ID: <F5740C52C37300439D6B722B54F9E72C@eurprd03.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks Alexandre,

On 11/5/21 17:43, Alexandre Ghiti wrote:
> This driver was removed so remove all references to it.
> 
> Fixes: 52a5502507bc ("watchdog: bd70528 drop bd70528 support")
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>   include/linux/mfd/rohm-bd70528.h | 24 ------------------------
>   1 file changed, 24 deletions(-)
> 
> diff --git a/include/linux/mfd/rohm-bd70528.h b/include/linux/mfd/rohm-bd70528.h

This whole header should be dropped. I've already sent a patch for this 
during the previous cycle. I guess I need to respin that.

https://lore.kernel.org/lkml/b288b97d-4c5f-1966-92b0-e949588ba97e@fi.rohmeurope.com/

Best Regards
   --Matti


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

