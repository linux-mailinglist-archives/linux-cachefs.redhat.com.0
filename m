Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 34A4A2CE137
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 22:57:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-IjvFugrDOTC4ksia9HTh-g-1; Thu, 03 Dec 2020 16:57:53 -0500
X-MC-Unique: IjvFugrDOTC4ksia9HTh-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 676611005504;
	Thu,  3 Dec 2020 21:57:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 533A81A4D0;
	Thu,  3 Dec 2020 21:57:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 34528180954D;
	Thu,  3 Dec 2020 21:57:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3LvmuF006353 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 16:57:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A96A72026D49; Thu,  3 Dec 2020 21:57:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A22D02026D12
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 21:57:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75EF9103B802
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 21:57:46 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam10on2137.outbound.protection.outlook.com [40.107.93.137])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-14-UMuyPqwkOxWFzKX9qN5cFQ-1; Thu, 03 Dec 2020 16:57:43 -0500
X-MC-Unique: UMuyPqwkOxWFzKX9qN5cFQ-1
Received: from MN2PR13MB3957.namprd13.prod.outlook.com (2603:10b6:208:263::11)
	by MN2PR13MB3534.namprd13.prod.outlook.com (2603:10b6:208:163::31)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.9;
	Thu, 3 Dec 2020 21:57:41 +0000
Received: from MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e989:f666:131a:e210]) by
	MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e989:f666:131a:e210%9]) with mapi id 15.20.3632.016;
	Thu, 3 Dec 2020 21:57:41 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "bfields@fieldses.org" <bfields@fieldses.org>, "ffilzlnx@mindspring.com"
	<ffilzlnx@mindspring.com>
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: fNDm/l4o9cYx5Rz5g0S1EO4zMAtIR4tJDJwAAAWCe4BeKhpLVGiQL7pUtKchSdvFeTqNAIAEhEYAgBNavQCAAAtBAIABTyGAgAxAb4CAAG0ggIAAGvSAgAAMzwCAAAXZAIAAAzUAgAADTAA=
Date: Thu, 3 Dec 2020 21:57:41 +0000
Message-ID: <b9e8da547065f6a94bed22771f214fef91449931.camel@hammerspace.com>
References: <279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
	<20201203185109.GB27931@fieldses.org>
	<4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
	<20201203211328.GC27931@fieldses.org>
	<9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
	<019001d6c9bd$acbeb6b0$063c2410$@mindspring.com>
In-Reply-To: <019001d6c9bd$acbeb6b0$063c2410$@mindspring.com>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d169f744-9531-42d4-552c-08d897d67517
x-ms-traffictypediagnostic: MN2PR13MB3534:
x-microsoft-antispam-prvs: <MN2PR13MB353478A1BAAC664E94A066F0B8F20@MN2PR13MB3534.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: oElvgPJzucbBWGWqQz11eTEe4ZwO4P5De360ijoPK6aKciQLlbSwKzJikFiHF6Vd0WIndhNFdg7TyLIR7we8zq5St/QQfkuRCIGANF8C8O0/XaKjYh3yeSeZSAJ9YaxGc0QUpp2KGmz7uEEnfFIuHaX4XrYgy8C6N68f1PMPhryAp8Zda9AIdGsX05py8ORIzO9OgZBDrKl2k4EXm3rLhCe0uY9EUBylQU/USrimSgQxgkDgUvFXDdY9OGzA+OxEEVKbGkwZzqs/HT3gYB3JJNqyCyerYiEnPsqnqO7hbhkrBV6/3JdKtYbxP4bRkqh08Q/522vYLmQz1ccBxILFIAaVgVFtcdyJ/h3HbJKbkGr6yz1FECVAtWKy8AkvrS2oxcJ+XfSocSYiod0WcaRzYw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MN2PR13MB3957.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(39840400004)(376002)(366004)(136003)(396003)(346002)(5660300002)(54906003)(6512007)(91956017)(66946007)(36756003)(16799955002)(966005)(71200400001)(8936002)(478600001)(8676002)(316002)(110136005)(83380400001)(4326008)(66446008)(186003)(6486002)(2616005)(64756008)(26005)(66476007)(6506007)(76116006)(66556008)(2906002)(86362001);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?utf-8?B?Tkh2ZUh6VExBdGdJUlFhd2VKdk14NGhLNmpyUjFrYkt5czE4N2xSUzkzV2Mw?=
	=?utf-8?B?bHpQUzdwd3p1bVN1MklYeEJWYWtpWStOTkpVYy8zZWlxczFFdjd0aVRDanpZ?=
	=?utf-8?B?Wm93enJMZ0ZmRVRoeThFdm5TUzVBV2ZiQVBQZ0VVMFE3a0Z4amFXNmwvUDJq?=
	=?utf-8?B?NUFJenpMVFpsb251Rm1Gdm9iSkFoOU1WQzlEUDAvMmw3aVZ2M3cwTmY4OTRw?=
	=?utf-8?B?NVcrUTk5UlkzbTdDZlpBSGNDNk04cW5Bc0hIMk9YUXFwWmlJMTNNR2k3Uktn?=
	=?utf-8?B?WnllSEVkYlJTZGdMVTZoUzZ4cXBoQTMwYWsvL0ZpdlVYMXMvTWh0enc3clhD?=
	=?utf-8?B?VDd1WHRqbzJoNDhsRmpXMEZGRGNOSEl6bXl5WHJCNmVZaDZGU1VVTC9vd2xO?=
	=?utf-8?B?OU1EZnRqeFlPbzRHSDdHVlNZbGhBSzRFN3BDUFJQZ291S09EKzNvUHRGL1Qz?=
	=?utf-8?B?U29tTkRMUGdpNExIWE8xcW1TRUlPQ3dPK1pVa1dqbm0wSnpmMlZZS1c1Y21O?=
	=?utf-8?B?b3lKdVZPT2dmd2hrVWR1Sk94d0I2SGsvQXl4dlFDbFlzZ1dWblpGN3doMHo3?=
	=?utf-8?B?TlhOSStGb3ZoOENHL05GL2FZazJ1M0loNGZjcGluNzIzZE12YlhheGdQY2FB?=
	=?utf-8?B?aDYrYnhnS2JJRWI4YnNFNVhPczNIRUhyb3VZZTBsZjNmUW1sSVFNaFhUTHc5?=
	=?utf-8?B?Sk9ja2dQUzlLdkRnV2o4K3VWTUZOREpWKzh4enZjTVk0RzV2c3JMZWpLZ1BO?=
	=?utf-8?B?ZnBXWm5KaTJYNjBJc3Iyd1ZOaTNkNGE4NnRqeDNEcFhFTjJtdkhOYjNSd2NY?=
	=?utf-8?B?dW5MN1hQQ2xqK1B6aVpHb3JCajNvYkJYNGFHSHN6V2FMNHZldm1kRDVYb1NM?=
	=?utf-8?B?cFhmMkNXRWtqOVpuTWl0S1VJUmpyWjhDSUNQQ1NvYjdLYit1RkZDd3pGallP?=
	=?utf-8?B?b3VNV056M3huWUFpemx4TG9BUXRsQ2NKd2VYbDJtZnhRWnRTODFBeVFnMXF5?=
	=?utf-8?B?STBEQzhvMUVEMU5hQzNBamZ1Y01penR1Ylc0azY3R1RvT21TdUpucmNDMDcx?=
	=?utf-8?B?cVUxWHlnTVhiQlpFZUFNbjROenpWS1hQMldxUGFCcG02UWRxbzAzRWVYQ2xJ?=
	=?utf-8?B?aTdCMGFsTElwcGpRTjVMdzFpMGc4MXV5alBwaXpWOEVFZ0ljT1JJQWtVcm1I?=
	=?utf-8?B?MXBYdlVXUHVyb3N1VThTT1BZNmJmTWFySUtMRTZOSXg2eFhjL043Y3ltUm5p?=
	=?utf-8?B?VER3Ykg5c25NczNoYTYvcnRKTk90MTM4M25zYkR1Tk1QV1JKOC9rSnRxeWdL?=
	=?utf-8?Q?y1hR+Alsw8JKX9MoIBRfD8cvMY6eJdgbwd?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3957.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d169f744-9531-42d4-552c-08d897d67517
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 21:57:41.4959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3lGV/pGLj2o/5Ab6wpD2kPU+de7mhbRdcjQdRKMV2byAU8QtnHFG2T/mRR99yqhOWKWTo3XNUD3O2lBYuRBjMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3534
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3LvmuF006353
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"daire@dneg.com" <daire@dneg.com>
Subject: Re: [Linux-cachefs] Adventures in NFS re-exporting
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <94B202ADCEB7014CAB6C8BA82E0AA46A@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTEyLTAzIGF0IDEzOjQ1IC0wODAwLCBGcmFuayBGaWx6IHdyb3RlOgo+ID4g
T24gVGh1LCAyMDIwLTEyLTAzIGF0IDE2OjEzIC0wNTAwLCBiZmllbGRzQGZpZWxkc2VzLm9yZ8Kg
d3JvdGU6Cj4gPiA+IE9uIFRodSwgRGVjIDAzLCAyMDIwIGF0IDA4OjI3OjM5UE0gKzAwMDAsIFRy
b25kIE15a2xlYnVzdCB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIDIwMjAtMTItMDMgYXQgMTM6NTEg
LTA1MDAsIGJmaWVsZHMgd3JvdGU6Cj4gPiA+ID4gPiBJJ3ZlIGJlZW4gc2NyYXRjaGluZyBteSBo
ZWFkIG92ZXIgaG93IHRvIGhhbmRsZSByZWJvb3Qgb2YgYQo+ID4gPiA+ID4gcmUtCj4gPiA+ID4g
PiBleHBvcnRpbmcgc2VydmVyLsKgIEkgdGhpbmsgb25lIHdheSB0byBmaXggaXQgbWlnaHQgYmUg
anVzdCB0bwo+ID4gPiA+ID4gYWxsb3cgdGhlIHJlLSBleHBvcnQgc2VydmVyIHRvIHBhc3MgYWxv
bmcgcmVjbGFpbXMgdG8gdGhlCj4gPiA+ID4gPiBvcmlnaW5hbAo+ID4gPiA+ID4gc2VydmVyIGFz
IGl0IHJlY2VpdmVzIHRoZW0gZnJvbSBpdHMgb3duIGNsaWVudHMuwqAgSXQgbWlnaHQKPiA+ID4g
PiA+IHJlcXVpcmUKPiA+ID4gPiA+IHNvbWUgcHJvdG9jb2wgdHdlYWtzLCBJJ20gbm90IHN1cmUu
wqAgSSdsbCB0cnkgdG8gZ2V0IG15Cj4gPiA+ID4gPiB0aG91Z2h0cwo+ID4gPiA+ID4gaW4gb3Jk
ZXIgYW5kIHByb3Bvc2Ugc29tZXRoaW5nLgo+ID4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gSXQn
cyBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gdGhhdC4gSWYgdGhlIHJlLWV4cG9ydGluZyBzZXJ2ZXIK
PiA+ID4gPiByZWJvb3RzLAo+ID4gPiA+IGJ1dCB0aGUgb3JpZ2luYWwgc2VydmVyIGRvZXMgbm90
LCB0aGVuIHVubGVzcyB0aGF0IHJlLWV4cG9ydGluZwo+ID4gPiA+IHNlcnZlciBwZXJzaXN0ZWQg
aXRzIGxlYXNlIGFuZCBhIGZ1bGwgc2V0IG9mIHN0YXRlaWRzCj4gPiA+ID4gc29tZXdoZXJlLCBp
dAo+ID4gPiA+IHdpbGwgbm90IGJlIGFibGUgdG8gYXRvbWljYWxseSByZWNsYWltIGRlbGVnYXRp
b24gYW5kIGxvY2sKPiA+ID4gPiBzdGF0ZSBvbgo+ID4gPiA+IHRoZSBzZXJ2ZXIgb24gYmVoYWxm
IG9mIGl0cyBjbGllbnRzLgo+ID4gPiAKPiA+ID4gQnkgc2VuZGluZyByZWNsYWltcyB0byB0aGUg
b3JpZ2luYWwgc2VydmVyLCBJIG1lYW4gbGl0ZXJhbGx5Cj4gPiA+IHNlbmRpbmcKPiA+ID4gbmV3
IG9wZW4gYW5kIGxvY2sgcmVxdWVzdHMgd2l0aCB0aGUgUkVDTEFJTSBiaXQgc2V0LCB3aGljaCB3
b3VsZAo+ID4gPiBnZXQKPiA+ID4gYnJhbmQgbmV3IHN0YXRlaWRzLgo+ID4gPiAKPiA+ID4gU28s
IHRoZSBvcmlnaW5hbCBzZXJ2ZXIgd291bGQgaW52YWxpZGF0ZSB0aGUgZXhpc3RpbmcgY2xpZW50
J3MKPiA+ID4gcHJldmlvdXMgY2xpZW50aWQgYW5kIHN0YXRlaWRzLS1qdXN0IGFzIGl0IG5vcm1h
bGx5IHdvdWxkIG9uCj4gPiA+IHJlYm9vdC0tYnV0IGl0IHdvdWxkIG9wdGlvbmFsbHkgcmVtZW1i
ZXIgdGhlIHVuZGVybHlpbmcgbG9ja3MKPiA+ID4gaGVsZCBieQo+ID4gPiB0aGUgY2xpZW50IGFu
ZCBhbGxvdyBjb21wYXRpYmxlIGxvY2sgcmVjbGFpbXMuCj4gPiA+IAo+ID4gPiBSb3VnaCBhdHRl
bXB0Ogo+ID4gPiAKPiA+ID4gCj4gPiA+IGh0dHBzOi8vd2lraS5saW51eC1uZnMub3JnL3dpa2kv
aW5kZXgucGhwL1JlYm9vdF9yZWNvdmVyeV9mb3JfcmUtZXhwb3IKPiA+ID4gdF9zZXJ2ZXJzCj4g
PiA+IAo+ID4gPiBUaGluayBpdCB3b3VsZCBmbHk/Cj4gPiAKPiA+IFNvIHRoaXMgd291bGQgYmUg
YSB2YXJpYW50IG9mIGNvdXJ0ZXN5IGxvY2tzIHRoYXQgY2FuIGJlIHJlY2xhaW1lZAo+ID4gYnkg
dGhlIGNsaWVudAo+ID4gdXNpbmcgdGhlIHJlYm9vdCByZWNsYWltIHZhcmlhbnQgb2YgT1BFTi9M
T0NLIG91dHNpZGUgdGhlIGdyYWNlCj4gPiBwZXJpb2Q/IFRoZQo+ID4gcHVycG9zZSBiZWluZyB0
byBhbGxvdyByZWNsYWltIHdpdGhvdXQgZm9yY2luZyB0aGUgY2xpZW50IHRvCj4gPiBwZXJzaXN0
IHRoZSBvcmlnaW5hbAo+ID4gc3RhdGVpZD8KPiA+IAo+ID4gSG1tLi4uIFRoYXQncyBkb2FibGUs
IGJ1dCBob3cgYWJvdXQgdGhlIGZvbGxvd2luZyBhbHRlcm5hdGl2ZTogQWRkCj4gPiBhIGZ1bmN0
aW9uCj4gPiB0aGF0IGFsbG93cyB0aGUgY2xpZW50IHRvIHJlcXVlc3QgdGhlIGZ1bGwgbGlzdCBv
ZiBzdGF0ZWlkcyB0aGF0Cj4gPiB0aGUgc2VydmVyIGhvbGRzIG9uCj4gPiBpdHMgYmVoYWxmPwo+
ID4gCj4gPiBJJ3ZlIGJlZW4gd2FudGluZyBzdWNoIGEgZnVuY3Rpb24gZm9yIHF1aXRlIGEgd2hp
bGUgYW55d2F5IGluIG9yZGVyCj4gPiB0byBhbGxvdyB0aGUKPiA+IGNsaWVudCB0byBkZXRlY3Qg
c3RhdGUgbGVha3MgKGVpdGhlciBkdWUgdG8gc29mdCB0aW1lb3V0cywgb3IgZHVlCj4gPiB0byBy
ZW9yZGVyZWQKPiA+IGNsb3NlL29wZW4gb3BlcmF0aW9ucykuCj4gCj4gT2gsIHRoYXQgc291bmRz
IGludGVyZXN0aW5nLiBTbyBiYXNpY2FsbHkgdGhlIHJlLWV4cG9ydCBzZXJ2ZXIgd291bGQKPiBy
ZS1wb3B1bGF0ZSBpdCdzIHN0YXRlIGZyb20gdGhlIG9yaWdpbmFsIHNlcnZlciByYXRoZXIgdGhh
biByZWx5aW5nCj4gb24gaXQncyBjbGllbnRzIGRvaW5nIHJlY2xhaW1zPyBIbW0sIGJ1dCBob3cg
ZG9lcyB0aGUgcmUtZXhwb3J0Cj4gc2VydmVyIHJlYnVpbGQgaXRzIHN0YXRlaWRzPyBJIGd1ZXNz
IGl0IGNvdWxkIG1ha2UgdGhlIGNsaWVudHMKPiByZXBvcHVsYXRlIHRoZW0gd2l0aCB0aGUgc2Ft
ZSAiZ2l2ZSBtZSBhIGR1bXAgb2YgYWxsIG15IHN0YXRlIiwgdXNpbmcKPiB0aGUgc3RhdGUgZGV0
YWlscyB0byBtYXRjaCB1cCB3aXRoIHRoZSBvbGQgc3RhdGUgYW5kIHJlcGxhY2luZwo+IHN0YXRl
aWRzLiBPciBkaWQgeW91IGhhdmUgc29tZXRoaW5nIGRpZmZlcmVudCBpbiBtaW5kPwo+IAoKSSB3
YXMgdGhpbmtpbmcgdGhhdCB0aGUgcmUtZXhwb3J0IHNlcnZlciBjb3VsZCBqdXN0IHVzZSB0aGF0
IGxpc3Qgb2YKc3RhdGVpZHMgdG8gZmlndXJlIG91dCB3aGljaCBsb2NrcyBjYW4gYmUgcmVjbGFp
bWVkIGF0b21pY2FsbHksIGFuZAp3aGljaCBvbmVzIGhhdmUgYmVlbiBpcnJlZGVlbWFibHkgbG9z
dC4gVGhlIGFzc3VtcHRpb24gaXMgdGhhdCBpZiB5b3UKaGF2ZSBhIGxvY2sgc3RhdGVpZCBvciBh
IGRlbGVnYXRpb24sIHRoZW4gdGhhdCBtZWFucyB0aGUgY2xpZW50cyBjYW4KcmVjbGFpbSBhbGwg
dGhlIGxvY2tzIHRoYXQgd2VyZSByZXByZXNlbnRlZCBieSB0aGF0IHN0YXRlaWQuCgpJIHN1cHBv
c2UgdGhlIGNsaWVudCB3b3VsZCBhbHNvIG5lZWQgdG8ga25vdyB0aGUgbG9ja293bmVyIGZvciB0
aGUKc3RhdGVpZCwgYnV0IHByZXN1bWFibHkgdGhhdCBpbmZvcm1hdGlvbiBjb3VsZCBhbHNvIGJl
IHJldHVybmVkIGJ5IHRoZQpzZXJ2ZXI/CgotLSAKVHJvbmQgTXlrbGVidXN0CkxpbnV4IE5GUyBj
bGllbnQgbWFpbnRhaW5lciwgSGFtbWVyc3BhY2UKdHJvbmQubXlrbGVidXN0QGhhbW1lcnNwYWNl
LmNvbQoKCgotLQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhh
dC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hl
ZnM=

