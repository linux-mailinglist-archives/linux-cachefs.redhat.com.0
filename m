Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 17D45390D45
	for <lists+linux-cachefs@lfdr.de>; Wed, 26 May 2021 02:25:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-yaupwTh2M1mnr9XljrY04w-1; Tue, 25 May 2021 20:25:16 -0400
X-MC-Unique: yaupwTh2M1mnr9XljrY04w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 643F6501E3;
	Wed, 26 May 2021 00:25:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DB6950446;
	Wed, 26 May 2021 00:25:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A510B1801029;
	Wed, 26 May 2021 00:25:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14Q0PAld017343 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 25 May 2021 20:25:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AEB5E208AB6B; Wed, 26 May 2021 00:25:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A97C1208AB69
	for <linux-cachefs@redhat.com>; Wed, 26 May 2021 00:25:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20924101D233
	for <linux-cachefs@redhat.com>; Wed, 26 May 2021 00:25:07 +0000 (UTC)
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
	[67.231.153.30]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-573-sJui7IH9N2GBwBT93GXtBw-1; Tue, 25 May 2021 20:25:04 -0400
X-MC-Unique: sJui7IH9N2GBwBT93GXtBw-1
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
	14Q0Etl0018391; Tue, 25 May 2021 17:24:59 -0700
Received: from mail.thefacebook.com ([163.114.132.120])
	by mx0a-00082601.pphosted.com with ESMTP id 38rh3ss5wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 25 May 2021 17:24:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.98.9) by
	o365-in.thefacebook.com (100.104.94.231) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2176.2; Tue, 25 May 2021 17:24:57 -0700
Received: from SJ0PR15MB4359.namprd15.prod.outlook.com (2603:10b6:a03:358::15)
	by BY5PR15MB3651.namprd15.prod.outlook.com (2603:10b6:a03:1f7::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23;
	Wed, 26 May 2021 00:24:56 +0000
Received: from SJ0PR15MB4359.namprd15.prod.outlook.com
	([fe80::1836:351b:ea83:df75]) by
	SJ0PR15MB4359.namprd15.prod.outlook.com
	([fe80::1836:351b:ea83:df75%7]) with mapi id 15.20.4150.027;
	Wed, 26 May 2021 00:24:56 +0000
From: Chris Mason <clm@fb.com>
To: Andreas Dilger <adilger@dilger.ca>
Thread-Topic: How capacious and well-indexed are ext4, xfs and btrfs
	directories?
Thread-Index: AQHXSy5S9wK3qRYDs0OeBucANXpnfartabQAgAMvKACABCaAAIAANWGA
Date: Wed, 26 May 2021 00:24:56 +0000
Message-ID: <5D04989A-E253-47B5-B50A-E96419F0E151@fb.com>
References: <206078.1621264018@warthog.procyon.org.uk>
	<6E4DE257-4220-4B5B-B3D0-B67C7BC69BB5@dilger.ca>
	<YKntRtEUoxTEFBOM@localhost>
	<B70B57ED-6F11-45CC-B99F-86BBDE36ACA4@dilger.ca>
In-Reply-To: <B70B57ED-6F11-45CC-B99F-86BBDE36ACA4@dilger.ca>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c091:480::1:c291]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efe623f6-5038-4c53-b0bb-08d91fdcb071
x-ms-traffictypediagnostic: BY5PR15MB3651:
x-microsoft-antispam-prvs: <BY5PR15MB3651F1B5B1BC769A817B3FAED3249@BY5PR15MB3651.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3631
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: /hGgclooLRGPvPTpyr87nGtERQEc9dFiF1TzZjQJTTqJL8iQHQhJABdeyNFtyYy7AHd/iPMSErID9xrlhrBRG60Il4zIQ7yfOPBzwX3jDbVoOaisZiL+HVXjgFr+Gn3xmZIHfuKnItEX+q9IV0f9wMTl+osQMohDK7Rtj8Pw8uBr4jy0IWBNeAKO2bhiyCnfWXbVA1OK9U+/gienixgZ0+3h+BpPFrULDDtsRq4bpSAwn7KTT0uCxPTxCTJLS00j2sDeeCeuSrHJwmetiIF8UF7otFXkZMfG0a0MHQlCBYeK1eL1XzKLyQhoChR5j+uPQLYsAW4c3JLNkkUk3WG8vLkJNCX5RT1rSS1yZsqd8f/Pvp3l8QbOJMUzhNPKW96fT7jb6lgEqK4THOZRVA9VE9unLFb7dBYeBOw4/jVRI/cBL2pQRmGTlpB/XyN/wuvCgSE3qwEA3Pb+4chadGG3/y2NnyMCMD30IcDmkdF5nyaZNizqeNqTG/+4lzyjC5lKZ/RY5KsRGvLUOXZ1FxBzUNtuAGRq7Ok+z54hXNvAUlnc80ZXmQtp4oQOPXvBfyMrLrIsv0R1JFXpYwEJkYiq5h9Aya8f/CqAzD8F/N5OJpFfCH4oiO9b++MfhtTBHFS7crdeSx66wcfg81Fwq/Uk5IxB8nRDS6yofYFchLyqeV/hFJvJKoW390d5LrpDNYFnc0j/Dq7Rhr7d185INZQrjb0zgdloePCuJnMZDlt0kQGvOuvCjx64sO9I78UtGaPF4MdtHwpqvFUjEDY4MAaGJQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR15MB4359.namprd15.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(8676002)(2616005)(4326008)(76116006)(6916009)(122000001)(53546011)(6512007)(86362001)(6506007)(83380400001)(38100700002)(54906003)(8936002)(36756003)(91956017)(71200400001)(478600001)(6486002)(66946007)(64756008)(66556008)(2906002)(316002)(66476007)(186003)(5660300002)(7416002)(966005)(66446008)(33656002)(45980500001);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?utf-8?B?YWRvQXljclk4U1FuUVJOTXdKQ0V2SDdHYkZ6OGZBem1XeStHdWgzdXVkYTBa?=
	=?utf-8?B?SFJnM1pPV0IxVEtJQ3VQOG84RE83ZkNhTUUyb1JjalpidlRKME80MmIzeStR?=
	=?utf-8?B?bzgrQ3dRc3pZZGJ5Z1NYMWR1RUp0ZXltZERlU01INS9vNTNKQlI4Rks2ZTFC?=
	=?utf-8?B?WWp1YUVoS2pjQXNURURhYmNiY1VBVTA0QlVtWmdyN3JzNkt6aVBmb1BvcUc5?=
	=?utf-8?B?ZjhuRVBwZnVkT1N4WDEwMDR2SjBWZTVBeThDTnhTcXVMeWljZ0RScEZ1bWJ3?=
	=?utf-8?B?YXlaV05NSjI5eWZ6T3F3Um5PZzNlT1BNa0pwa0ZnNmNieVc5bThRS1VnQVpV?=
	=?utf-8?B?OFFiTWI5dWJrbFpmZjJteE5oSG9QZDVFT01rMUU2c0w0NW9wLzNlRUEvdzZh?=
	=?utf-8?B?NUFJN2F5QkNtUkRCc2RzYTR3elo3TjAzR2ZvSkdYTHlEYkk2R0loN0RmVmdr?=
	=?utf-8?B?REh6TzJMcktEQjJBd0ZiQjRacjJqOXNCTlA4WWE2eU1QWEhoT3J1MW9IRHA3?=
	=?utf-8?B?d0dGcGxsdkVWMVVLdVRFeU9DZXR0YStMQ1NUaEdSc2xiTm9KU2lrejZrMFVO?=
	=?utf-8?B?SnBrbW5OVHRraE9EeDQ4WXhwZkkzaHhObkVkUWRvK1BJSW85MG5JMlRXM0RB?=
	=?utf-8?B?SGpFQjl3MjNoWTNmc1VwRzh2bVRXaHJFNDI2S1liL1F2N1p5WDAvYk4vMldz?=
	=?utf-8?B?aThveTZkZ1l4dTh2N0FDRzM1bERGMTR2ZEE1OUpqdTlyekhZb3hQZ3RrU0FB?=
	=?utf-8?B?Q0JuQUl6bkpDa295Mlhvb1h6NkNpbWE5TUhlYURqc1E0Z1Job01KcmFpUVEx?=
	=?utf-8?B?ZXByaVpZSTdqQzNFMmVqeW1pcnJ5cVl6U3EyelExVmM1UUI4MVJUZ3hUWWlx?=
	=?utf-8?B?a3llT2RLUlJOaUo1bHdCaWl5L2dZVXpOaElDaUdiUWl3c0tuV3R4OFU4VmU5?=
	=?utf-8?B?NGkxeVczOWxsN0JlaFRqc2ZEdGg4bUZLNkhVdVNYcUd6emdmN2ttV3lPWUFn?=
	=?utf-8?B?clVGR21ORWdsa0ZoZHRSa01LK2NqWXFJTzM2dGpYaCtFLzkwei9oWWdUd21S?=
	=?utf-8?B?VzVkTmlac1hpZjFlRFMzQkdJckZkOEVUNW0yZWR6NFhyUVEvOUpyQk4wOVZj?=
	=?utf-8?B?QTdaU3FKdWZLTTJyUHhvbnNTeUVERk5JenlmWE1uQXhYZy9iWTBVd2F4L2dw?=
	=?utf-8?B?Q0s4cUtxR3pNVlpKazdoa1kwdldSTUtNeTBvcW1ITW1lMDM5TkJSQmZsOE5j?=
	=?utf-8?B?cTNzOStucExXZFV5RzFpYUxwWUZWZitqVE1RWHJSZ1BQbWhCN0czUEpqWTcx?=
	=?utf-8?B?N2JZM1FTSDBGbXg2dk9YUVQySnVJaFAxZzdGTDExWG91OG80MjBsUzdhNm1U?=
	=?utf-8?B?bC9yc1hBRDljNVpQMkh6Y0tSK1puTDcxTHB3Tm9FOXlLWTdYclJjZzVheWNN?=
	=?utf-8?B?c3VmaWtpQ1ExaDZOTWNRbHk2eG9BR0hEM1pQaHc0UDk3NXdhbGM5K0V2cWxO?=
	=?utf-8?B?SlN6UDZOMWJIOXVUZHZPdDBXcWNLM0J5dkRoUy9MSzEySmNiSk1yTm4xbnMz?=
	=?utf-8?B?Qk41V2t4eEMyWG1JY25mMFU3aGtkQUIwckhuOC9ucUZ1TWplaTVXcXlPSXcx?=
	=?utf-8?B?SkVEdzNZMndCWlpiRnRGVktjZE00c1NpMDFQVlZaZUM4T3pYSkRQUkVEUFIz?=
	=?utf-8?B?citrY1g5dGY3cW0wMHlMdk4vckZwU0tuZnhsd0FvNitrZ2ZmRis1SnR3VmNG?=
	=?utf-8?B?Tk1vb055U1gwaGw5NjJFR3ZEbk1QWDJhMnN3Rlp6SU1OdTNQL2FqdHU2UHZm?=
	=?utf-8?Q?sA6SH82QlB2THk+x6E6O+8WXOqpT5WAu0YCrw=3D?=
x-ms-exchange-transport-forked: True
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR15MB4359.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe623f6-5038-4c53-b0bb-08d91fdcb071
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 00:24:56.2366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /V2/Rc3aiT010Yby6v9B1qe/AlRBH27H4FjLtCYmEZynOoWJPrmVkc07NynfZxfi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3651
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: us4V7As8E9WJ3ioIQ2sV-d-TpTqbIaKt
X-Proofpoint-ORIG-GUID: us4V7As8E9WJ3ioIQ2sV-d-TpTqbIaKt
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
	definitions=2021-05-25_09:2021-05-25,
	2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
	spamscore=0
	priorityscore=1501 malwarescore=0 mlxlogscore=999 adultscore=0
	bulkscore=0
	impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
	mlxscore=0
	clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2104190000 definitions=main-2105260000
X-FB-Internal: deliver
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 14Q0PAld017343
X-loop: linux-cachefs@redhat.com
Cc: xfs <linux-xfs@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>, NeilBrown <neilb@suse.com>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>
Subject: Re: [Linux-cachefs] How capacious and well-indexed are ext4,
 xfs and btrfs directories?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <64DD6B250E69824292823F92CE0A6B7C@namprd15.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Cj4gT24gTWF5IDI1LCAyMDIxLCBhdCA1OjEzIFBNLCBBbmRyZWFzIERpbGdlciA8YWRpbGdlckBk
aWxnZXIuY2E+IHdyb3RlOgo+IAo+IE9uIE1heSAyMiwgMjAyMSwgYXQgMTE6NTEgUE0sIEpvc2gg
VHJpcGxldHQgPGpvc2hAam9zaHRyaXBsZXR0Lm9yZz4gd3JvdGU6Cj4+IAo+PiBPbiBUaHUsIE1h
eSAyMCwgMjAyMSBhdCAxMToxMzoyOFBNIC0wNjAwLCBBbmRyZWFzIERpbGdlciB3cm90ZToKPj4+
IE9uIE1heSAxNywgMjAyMSwgYXQgOTowNiBBTSwgRGF2aWQgSG93ZWxscyA8ZGhvd2VsbHNAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4+Pj4gV2l0aCBmaWxlc3lzdGVtcyBsaWtlIGV4dDQsIHhmcyBhbmQg
YnRyZnMsIHdoYXQgYXJlIHRoZSBsaW1pdHMgb24gZGlyZWN0b3J5Cj4+Pj4gY2FwYWNpdHksIGFu
ZCBob3cgd2VsbCBhcmUgdGhleSBpbmRleGVkPwo+Pj4+IAo+Pj4+IFRoZSByZWFzb24gSSBhc2sg
aXMgdGhhdCBpbnNpZGUgb2YgY2FjaGVmaWxlcywgSSBpbnNlcnQgZmFub3V0IGRpcmVjdG9yaWVz
Cj4+Pj4gaW5zaWRlIGluZGV4IGRpcmVjdG9yaWVzIHRvIGRpdmlkZSB1cCB0aGUgc3BhY2UgZm9y
IGV4dDIgdG8gY29wZSB3aXRoIHRoZQo+Pj4+IGxpbWl0cyBvbiBkaXJlY3Rvcnkgc2l6ZXMgYW5k
IHRoYXQgaXQgZGlkIGxpbmVhciBzZWFyY2hlcyAoSUlSQykuCj4+Pj4gCj4+Pj4gRm9yIHNvbWUg
YXBwbGljYXRpb25zLCBJIG5lZWQgdG8gYmUgYWJsZSB0byBjYWNoZSBvdmVyIDFNIGVudHJpZXMg
KHJlbmRlcgo+Pj4+IGZhcm0pIGFuZCBldmVuIGEga2VybmVsIHRyZWUgaGFzIG92ZXIgMTAway4K
Pj4+PiAKPj4+PiBXaGF0IEknZCBsaWtlIHRvIGRvIGlzIHJlbW92ZSB0aGUgZmFub3V0IGRpcmVj
dG9yaWVzLCBzbyB0aGF0IGZvciBlYWNoIGxvZ2ljYWwKPj4+PiAidm9sdW1lIlsqXSBJIGhhdmUg
YSBzaW5nbGUgZGlyZWN0b3J5IHdpdGggYWxsIHRoZSBmaWxlcyBpbiBpdC4gIEJ1dCB0aGF0Cj4+
Pj4gbWVhbnMgc3RpY2tpbmcgbWFzc2l2ZSBhbW91bnRzIG9mIGVudHJpZXMgaW50byBhIHNpbmds
ZSBkaXJlY3RvcnkgYW5kIGhvcGluZwo+Pj4+IGl0IChhKSBpc24ndCB0b28gc2xvdyBhbmQgKGIp
IGRvZXNuJ3QgaGl0IHRoZSBjYXBhY2l0eSBsaW1pdC4KPj4+IAo+Pj4gRXh0NCBjYW4gY29tZm9y
dGFibHkgaGFuZGxlIH4xMk0gZW50cmllcyBpbiBhIHNpbmdsZSBkaXJlY3RvcnksIGlmIHRoZQo+
Pj4gZmlsZW5hbWVzIGFyZSBub3QgdG9vIGxvbmcgKGUuZy4gMzIgYnl0ZXMgb3Igc28pLiAgV2l0
aCB0aGUgImxhcmdlX2RpciIKPj4+IGZlYXR1cmUgKHNpbmNlIDQuMTMsIGJ1dCBub3QgZW5hYmxl
ZCBieSBkZWZhdWx0KSBhIHNpbmdsZSBkaXJlY3RvcnkgY2FuCj4+PiBob2xkIGFyb3VuZCA0QiBl
bnRyaWVzLCBiYXNpY2FsbHkgYWxsIHRoZSBpbm9kZXMgb2YgYSBmaWxlc3lzdGVtLgo+PiAKPj4g
ZXh0NCBkZWZpbml0ZWx5IHNlZW1zIHRvIGJlIGFibGUgdG8gaGFuZGxlIGl0LiBJJ3ZlIHNlZW4g
Ym90dGxlbmVja3MgaW4KPj4gb3RoZXIgcGFydHMgb2YgdGhlIHN0b3JhZ2Ugc3RhY2ssIHRob3Vn
aC4KPj4gCj4+IFdpdGggYSBub3JtYWwgTlZNZSBkcml2ZSwgYSBkbS1jcnlwdCB2b2x1bWUgY29u
dGFpbmluZyBleHQ0LCBhbmQgZGlzY2FyZAo+PiBlbmFibGVkIChvbiBib3RoIGV4dDQgYW5kIGRt
LWNyeXB0KSwgSSd2ZSBzZWVuIHJtIC1yIG9mIGEgZGlyZWN0b3J5IHdpdGgKPj4gYSBmZXcgbWls
bGlvbiBlbnRyaWVzIChlYWNoIHBvaW50aW5nIHRvIGEgfjQtOGsgZmlsZSkgdGFrZSB0aGUgYmV0
dGVyCj4+IHBhcnQgb2YgYW4gaG91ciwgYWxtb3N0IGFsbCBvZiBpdCBzeXN0ZW0gdGltZSBpbiBp
b3dhaXQuIEFsc28gbWFrZXMgYW55Cj4+IG90aGVyIGNvbmN1cnJlbnQgZGlzayB3cml0ZXMgaGFu
ZywgZXZlbiBhIHNpbXBsZSAidG91Y2ggeCIuIFR1cm5pbmcgb2ZmCj4+IGRpc2NhcmQgc3BlZWRz
IGl0IHVwIGJ5IHNldmVyYWwgb3JkZXJzIG9mIG1hZ25pdHVkZS4KPj4gCj4+IChJIGRvbid0IGtu
b3cgaWYgdGhpcyBpcyBhIGtub3duIGlzc3VlIG9yIG5vdCwgc28gaGVyZSBhcmUgdGhlIGRldGFp
bHMKPj4ganVzdCBpbiBjYXNlIGl0IGlzbid0LiBBbHNvLCBpZiB0aGlzIGlzIGFscmVhZHkgZml4
ZWQgaW4gYSBuZXdlciBrZXJuZWwsCj4+IG15IGFwb2xvZ2llcyBmb3IgdGhlIG91dGRhdGVkIHJl
cG9ydC4pCj4gCj4gRGVmaW5pdGVseSAiLW8gZGlzY2FyZCIgaXMga25vd24gdG8gaGF2ZSBhIG1l
YXN1cmFibGUgcGVyZm9ybWFuY2UgaW1wYWN0LAo+IHNpbXBseSBiZWNhdXNlIGl0IGVuZHMgdXAg
c2VuZGluZyBhIGxvdCBtb3JlIHJlcXVlc3RzIHRvIHRoZSBibG9jayBkZXZpY2UsCj4gYW5kIHRo
b3NlIHJlcXVlc3RzIGNhbiBiZSBzbG93L2Jsb2NrIHRoZSBxdWV1ZSwgZGVwZW5kaW5nIG9uIHVu
ZGVybHlpbmcKPiBzdG9yYWdlIGJlaGF2aW9yLgo+IAo+IFRoZXJlIHdhcyBhIHBhdGNoIHB1c2hl
ZCByZWNlbnRseSB0aGF0IHRhcmdldHMgIi1vIGRpc2NhcmQiIHBlcmZvcm1hbmNlOgo+IGh0dHBz
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1leHQ0L2xpc3QvP3Nlcmllcz0y
NDQwOTEKPiB0aGF0IG5lZWRzIGEgYml0IG1vcmUgd29yaywgYnV0IG1heSBiZSB3b3J0aHdoaWxl
IHRvIHRlc3QgaWYgaXQgaW1wcm92ZXMKPiB5b3VyIHdvcmtsb2FkLCBhbmQgaGVscCBwdXQgc29t
ZSB3ZWlnaHQgYmVoaW5kIGxhbmRpbmcgaXQ/Cj4gCgpUaGlzIGlzIHByZXR0eSBmYXIgb2ZmIHRv
cGljIGZyb20gdGhlIG9yaWdpbmFsIG1lc3NhZ2UsIGJ1dCB3ZeKAmXZlIGhhZCBhIGxvbmcgbGlz
dCBvZiBkaXNjYXJkIHByb2JsZW1zIGluIHByb2R1Y3Rpb246CgoqIFN5bmNocm9ub3VzIGRpc2Nh
cmRzIHN0YWxsIHVuZGVyIGhlYXZ5IGRlbGV0ZSBsb2FkcywgZXNwZWNpYWxseSBvbiBsb3dlciBl
bmQgZHJpdmVzLiAgRXZlbiBkcml2ZXMgdGhhdCBzZXJ2aWNlIHRoZSBkaXNjYXJkcyBlbnRpcmVs
eSBpbiByYW0gb24gdGhlIGhvc3QgKGZ1c2lvbi1pb+KAmXMgYmVzdCBmZWF0dXJlIGltaG8pIGhh
ZCB0cm91YmxlLiAgSeKAmW0gc3VyZSBzb21lIHJlYWxseSBoaWdoIGVuZCBmbGFzaCBpcyByZWFs
bHkgaGlnaCBlbmQsIGJ1dCBpdCBoYXNu4oCZdCBiZWVuIGEgZHJpdmluZyBjcml0ZXJpYSBmb3Ig
dXMgaW4gdGhlIGZsZWV0LgoKKiBYRlMgYXN5bmMgZGlzY2FyZHMgZGVjb3VwbGUgdGhlIGNvbW1p
dCBsYXRlbmN5IGZyb20gdGhlIGRpc2NhcmQgbGF0ZW5jeSwgd2hpY2ggaXMgZ3JlYXQuICBCdXQg
dGhlIGJhY2tsb2cgb2YgZGlzY2FyZHMgd2FzbuKAmXQgcmVhbGx5IGxpbWl0ZWQsIHNvIG1hc3Mg
ZGVsZXRpb24gZXZlbnRzIGVuZGVkIHVwIGdlbmVyYXRpbmcgc3RhbGxzIGZvciByZWFkcyBhbmQg
d3JpdGVzIHRoYXQgd2VyZSBjb21wZXRpbmcgd2l0aCB0aGUgZGlzY2FyZHMuICBXZSBsYXN0IGJl
bmNobWFya2VkIHRoaXMgd2l0aCB2NS4yLCBzbyBpdCBtaWdodCBiZSBkaWZmZXJlbnQgbm93LCBi
dXQgdW5mb3J0dW5hdGVseSBpdCB3YXNu4oCZdCB1c2FibGUgZm9yIHVzLgoKKiBmc3RyaW0tZnJv
bS1jcm9uIGxpbWl0cyB0aGUgc3RhbGxzIHRvIDJhbSwgd2hpY2ggaXMgcGVhayBzb21ld2hlcmUg
aW4gdGhlIHdvcmxkLCBzbyBpdCBpc24ndCBpZGVhbC4gIE9uIHNvbWUgZHJpdmVzIGl0cyBmaW5l
LCBvbiBvdGhlcnMgaXTigJlzIGEgMTAgbWludXRlIGx1bmNoIGJyZWFrLgoKRm9yIFhGUyBpbiBs
YXRlbmN5IHNlbnNpdGl2ZSB3b3JrbG9hZHMsIHdl4oCZdmUgc2V0dGxlZCBvbiBzeW5jaHJvbm91
cyBkaXNjYXJkcyBhbmQgYXBwbGljYXRpb25zIHVzaW5nIGl0ZXJhdGluZyB0cnVuY2F0ZSBjYWxs
cyB0aGF0IG5pYmJsZSB0aGUgZW5kcyBvZmYgb2YgYSBmaWxlIGJpdCBieSBiaXQgd2hpbGUgY2Fs
bGluZyBmc3luYyBpbiByZWFzb25hYmxlIGludGVydmFscy4gIEl0IGh1cnRzIHRvIHNheSBvdXQg
bG91ZCBidXQgaXMgYWxzbyB3b25kZXJmdWxseSBwcmVkaWN0YWJsZS4KCldlIGdlbmVyYWxseSB1
c2UgYnRyZnMgb24gbG93IGVuZCByb290IGRyaXZlcywgd2hlcmUgZGlzY2FyZHMgYXJlIGEgbXVj
aCBiaWdnZXIgcHJvYmxlbS4gIFRoZSBidHJmcyBhc3luYyBkaXNjYXJkIGltcGxlbWVudGF0aW9u
IGNvbnNpZGVycyByZS1hbGxvY2F0aW5nIHRoZSBibG9jayB0aGUgc2FtZSBhcyBkaXNjYXJkaW5n
IGl0LCBzbyB3ZSBhdm9pZCBzb21lIGRpc2NhcmRzIGp1c3QgYnkgcmV1c2luZyBibG9ja3MuICBJ
dCBzb3J0cyBwZW5kaW5nIGRpc2NhcmRzIHRvIHByZWZlciBsYXJnZXIgSU9zLCBhbmQgZHJpYmJs
ZXMgdGhlbSBvdXQgc2xvd2x5IHRvIGF2b2lkIHNhdHVyYXRpbmcgdGhlIGRyaXZlLiAgSXTigJlz
IGEgZ2lhbnQgYmFnIG9mIGNvbXByb21pc2VzIGJ1dCBhdm9pZHMgbGF0ZW5jaWVzIGFuZCBtYWlu
dGFpbnMgdGhlIHdyaXRlIGFtcGxpZmljYXRpb24gdGFyZ2V0cy4gIFdlIGRvIHVzZSBpdCBvbiBh
IGZldyBkYXRhIGludGVuc2l2ZSB3b3JrbG9hZHMgd2l0aCBoaWdoZXIgZW5kIGZsYXNoLCBidXQg
d2UgY3JhbmsgdXAgdGhlIGlvcHMgdGFyZ2V0cyBmb3IgdGhlIGRpc2NhcmRzIHRoZXJlLgoKLWNo
cmlzCgotLQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5j
b20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNo
ZWZz

