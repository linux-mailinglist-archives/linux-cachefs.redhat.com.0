Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AB79D2CE16A
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 23:14:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-3JH1TRsKNIqZCbOiQdhxig-1; Thu, 03 Dec 2020 17:14:39 -0500
X-MC-Unique: 3JH1TRsKNIqZCbOiQdhxig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F4F210054FF;
	Thu,  3 Dec 2020 22:14:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D45CC5D6AC;
	Thu,  3 Dec 2020 22:14:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BA624E58E;
	Thu,  3 Dec 2020 22:14:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3MEX2n009207 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 17:14:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5205A2026D12; Thu,  3 Dec 2020 22:14:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C6092026D49
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 22:14:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2343C10580C1
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 22:14:31 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam12on2109.outbound.protection.outlook.com [40.107.237.109])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-544-5ZErqpSeMS-LfrlykxTvOQ-1; Thu, 03 Dec 2020 17:14:29 -0500
X-MC-Unique: 5ZErqpSeMS-LfrlykxTvOQ-1
Received: from MN2PR13MB3957.namprd13.prod.outlook.com (2603:10b6:208:263::11)
	by MN2PR13MB3183.namprd13.prod.outlook.com (2603:10b6:208:139::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7;
	Thu, 3 Dec 2020 22:14:26 +0000
Received: from MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e989:f666:131a:e210]) by
	MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e989:f666:131a:e210%9]) with mapi id 15.20.3632.016;
	Thu, 3 Dec 2020 22:14:25 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "bfields@fieldses.org" <bfields@fieldses.org>
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: fNDm/l4o9cYx5Rz5g0S1EO4zMAtIR4tJDJwAAAWCe4BeKhpLVGiQL7pUtKchSdvFeTqNAIAEhEYAgBNavQCAAAtBAIABTyGAgAxAb4CAAG0ggIAAGvSAgAAMzwCAAAXZAIAAAzUAgAADTACAAAHegIAAAs4A
Date: Thu, 3 Dec 2020 22:14:25 +0000
Message-ID: <0452916df308e9419f472b0d5ffb41815014dce4.camel@hammerspace.com>
References: <1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
	<20201203185109.GB27931@fieldses.org>
	<4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
	<20201203211328.GC27931@fieldses.org>
	<9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
	<019001d6c9bd$acbeb6b0$063c2410$@mindspring.com>
	<b9e8da547065f6a94bed22771f214fef91449931.camel@hammerspace.com>
	<20201203220421.GE27931@fieldses.org>
In-Reply-To: <20201203220421.GE27931@fieldses.org>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04831bb4-00c2-4df3-3618-08d897d8cbb2
x-ms-traffictypediagnostic: MN2PR13MB3183:
x-microsoft-antispam-prvs: <MN2PR13MB31839B9EAC84B72FA4432556B8F20@MN2PR13MB3183.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: cxeJaCjplcumKAINusoMXe/B7vmsa+CF1d57XMSXNemNTW8q0I50yHn+hfF6gzJHC2Cv3FCuZWkj8soV4/riNSgjIDGtNYX+36Riu8EehHJHwE60ak1HEDBE4iQpfN0XjEx3f3cGNEKtApJxolrP/QTPvUIzPqzNHkR/C3LY5/7MezBzRqLw52IpkgVEoZyx6R36OwiKxT1CZc605b0PuwPP2nU3gsimlm9ip6eqVbXdPmdU561FEnOjNczwjFlx2UGK10xi4wK3QIjte1iseJSkGhc1XZ7UI5DMj9qC5PYyRh8fBFdnATR6OutR7U9tjA3I1k5XUV8TbFb8LKLpbv2a8oqSOs+QkTUWNpEDl1J645pQcIO8HJGMaclGSngIVPY7NrV/havoSxeBI8ZJsA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MN2PR13MB3957.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(376002)(136003)(39840400004)(366004)(346002)(396003)(26005)(186003)(478600001)(966005)(83380400001)(71200400001)(2616005)(316002)(6512007)(54906003)(8676002)(91956017)(6506007)(66946007)(2906002)(66446008)(64756008)(66556008)(66476007)(76116006)(5660300002)(4326008)(6486002)(86362001)(8936002)(16799955002)(6916009)(36756003);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?utf-8?B?aE5RMmkrZDVid282THpsOVBTM0doU25xMzZ4U0tjQkN2Mlc5SkpVK2c3WE1v?=
	=?utf-8?B?a0I3djVjNExvc0Z3WVZaNmphMkxlU2VqdmpLUDFWdURkODB2bDdDMnVJVDhO?=
	=?utf-8?B?S1FNYzlpM1BocjkxK0FyQ0xjbEFuSk5pUlpaY0RQRzBoeVA5UVhSQU5MT1J1?=
	=?utf-8?B?MzBVYUJUOTVOVTZxU2dvZFBKcHdBOHdDSjgvUGtoQmx2TEdDcEZXdkVrbGRC?=
	=?utf-8?B?OU84b0hnMDBwSzNSQktqTkRrSVBmV0E1WkZmSW5RaTlFa1lEZTNRdWY5U2xE?=
	=?utf-8?B?aXdUTkF0eHUwWlVRMHJzTUpPYnRhRGFWaDd1WU5qc1Iwb1ptZk42T0RGN2RP?=
	=?utf-8?B?ZEplLys0NktwT2c1RWw1NTEwblh3UUQxSzRGdFJZQ21vOVVZVHUxTFVRbUZi?=
	=?utf-8?B?d2VUVXFOQTRVWERqTnZaRmh6Qi91bmx0V0V6enFJWmdUSU04L1ZNTlRtYUF3?=
	=?utf-8?B?TGhYTnFHY1RWZ1B5MDkzT3F3eHlUVDQ4anduT3o0eFVNUkVra2NEUXcyRmJI?=
	=?utf-8?B?K2VLSmxlRS9MOXowR2lDL0J0Tzd1Q1J6bFh1OWZVZGptVW1lc2R1M05Dbk5s?=
	=?utf-8?B?OTh5eWhRNWEyZUozeUoycE1wcnkxQzJOMjN4c2pvSTR6YXBrSmNHOW1FVUJC?=
	=?utf-8?B?Z3VXb3laVkNIb1JoalRBaFV1Nmk5N3RMSDZJY2N3aFNlN3JmYloyYVA5aVBa?=
	=?utf-8?B?a0JhMHBtb2tYYzBsc2tJWktKcjBuU3BQNGJnSG5UbVFrelpJNTM5c2UxVTB3?=
	=?utf-8?B?ZlAySlN3M2F3TnZvTGUwTU5SL3lEcGgwK0VEdXZYTDk5Um1KUzE4emFlRmd4?=
	=?utf-8?B?Nlh0bnU0RTZVbXF1cm9Ocm5WUm5wRFlGQnNDSUdrdGZpSExLdW1VOXZtNkpH?=
	=?utf-8?B?VitzMzBQRUNhRmNyQ0swUEpZZ3ZpN1hIcHBHQnV2d2Q5K2I3NXkraFYrdXhl?=
	=?utf-8?B?WkJFNFVmNS84ZWc3akRQYkRCQnJjamdwYzROdEJ5ZnMxbGdES3hoN0J6Tnhr?=
	=?utf-8?B?cHczSFd3S1RQQWtQeENuS3ZxNnN5aVBiRjhUaGZaS0F1ZDRTWXR2UWdWQ29T?=
	=?utf-8?B?VDduK0wxR01rVStPR2tidlYweW9TakNWdGRHWXl0UHQwMHF5anEzcWNVbkdx?=
	=?utf-8?B?M09TTnlIWEV4SFk0bWVtMkRTZVNpZ3hlUi94S3B6a2VmeTJvZ2RJWDNXZVJz?=
	=?utf-8?B?aGIvQUdka2lsVGMwM0N0T2FLVUcrbHJxYTRLZzIzb0FmRmJUZzNEMTB4QjAv?=
	=?utf-8?B?SlM3ZnZQcDJjSE44OXVHMGpkMm1mTWdlSE1zVENBMlB3aU5WeEpzYUx5TVlN?=
	=?utf-8?Q?MHfl2ORThl0VKhXFVYsW2VOQ7Z4IfIaDQ9?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3957.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04831bb4-00c2-4df3-3618-08d897d8cbb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 22:14:25.7546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vDDHlxreB4wXDgsgKsxzIEaMQ3tD3uCKDKQH30yWIOWR58seN6AE8xU8AUTh6CvpEDR8e1XnFQy5FhIaAghajQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3183
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3MEX2n009207
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"ffilzlnx@mindspring.com" <ffilzlnx@mindspring.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <1BD12DC24771AC46B48EC5772BA1D639@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTEyLTAzIGF0IDE3OjA0IC0wNTAwLCBiZmllbGRzQGZpZWxkc2VzLm9yZyB3
cm90ZToKPiBPbiBUaHUsIERlYyAwMywgMjAyMCBhdCAwOTo1Nzo0MVBNICswMDAwLCBUcm9uZCBN
eWtsZWJ1c3Qgd3JvdGU6Cj4gPiBPbiBUaHUsIDIwMjAtMTItMDMgYXQgMTM6NDUgLTA4MDAsIEZy
YW5rIEZpbHogd3JvdGU6Cj4gPiA+ID4gT24gVGh1LCAyMDIwLTEyLTAzIGF0IDE2OjEzIC0wNTAw
LCBiZmllbGRzQGZpZWxkc2VzLm9yZ8Kgd3JvdGU6Cj4gPiA+ID4gPiBPbiBUaHUsIERlYyAwMywg
MjAyMCBhdCAwODoyNzozOVBNICswMDAwLCBUcm9uZCBNeWtsZWJ1c3QKPiA+ID4gPiA+IHdyb3Rl
Ogo+ID4gPiA+ID4gPiBPbiBUaHUsIDIwMjAtMTItMDMgYXQgMTM6NTEgLTA1MDAsIGJmaWVsZHMg
d3JvdGU6Cj4gPiA+ID4gPiA+ID4gSSd2ZSBiZWVuIHNjcmF0Y2hpbmcgbXkgaGVhZCBvdmVyIGhv
dyB0byBoYW5kbGUgcmVib290IG9mCj4gPiA+ID4gPiA+ID4gYQo+ID4gPiA+ID4gPiA+IHJlLQo+
ID4gPiA+ID4gPiA+IGV4cG9ydGluZyBzZXJ2ZXIuwqAgSSB0aGluayBvbmUgd2F5IHRvIGZpeCBp
dCBtaWdodCBiZQo+ID4gPiA+ID4gPiA+IGp1c3QgdG8KPiA+ID4gPiA+ID4gPiBhbGxvdyB0aGUg
cmUtIGV4cG9ydCBzZXJ2ZXIgdG8gcGFzcyBhbG9uZyByZWNsYWltcyB0byB0aGUKPiA+ID4gPiA+
ID4gPiBvcmlnaW5hbAo+ID4gPiA+ID4gPiA+IHNlcnZlciBhcyBpdCByZWNlaXZlcyB0aGVtIGZy
b20gaXRzIG93biBjbGllbnRzLsKgIEl0Cj4gPiA+ID4gPiA+ID4gbWlnaHQKPiA+ID4gPiA+ID4g
PiByZXF1aXJlCj4gPiA+ID4gPiA+ID4gc29tZSBwcm90b2NvbCB0d2Vha3MsIEknbSBub3Qgc3Vy
ZS7CoCBJJ2xsIHRyeSB0byBnZXQgbXkKPiA+ID4gPiA+ID4gPiB0aG91Z2h0cwo+ID4gPiA+ID4g
PiA+IGluIG9yZGVyIGFuZCBwcm9wb3NlIHNvbWV0aGluZy4KPiA+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gCj4gPiA+ID4gPiA+IEl0J3MgbW9yZSBjb21wbGljYXRlZCB0aGFuIHRoYXQuIElmIHRo
ZSByZS1leHBvcnRpbmcgc2VydmVyCj4gPiA+ID4gPiA+IHJlYm9vdHMsCj4gPiA+ID4gPiA+IGJ1
dCB0aGUgb3JpZ2luYWwgc2VydmVyIGRvZXMgbm90LCB0aGVuIHVubGVzcyB0aGF0IHJlLQo+ID4g
PiA+ID4gPiBleHBvcnRpbmcKPiA+ID4gPiA+ID4gc2VydmVyIHBlcnNpc3RlZCBpdHMgbGVhc2Ug
YW5kIGEgZnVsbCBzZXQgb2Ygc3RhdGVpZHMKPiA+ID4gPiA+ID4gc29tZXdoZXJlLCBpdAo+ID4g
PiA+ID4gPiB3aWxsIG5vdCBiZSBhYmxlIHRvIGF0b21pY2FsbHkgcmVjbGFpbSBkZWxlZ2F0aW9u
IGFuZCBsb2NrCj4gPiA+ID4gPiA+IHN0YXRlIG9uCj4gPiA+ID4gPiA+IHRoZSBzZXJ2ZXIgb24g
YmVoYWxmIG9mIGl0cyBjbGllbnRzLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBCeSBzZW5kaW5nIHJl
Y2xhaW1zIHRvIHRoZSBvcmlnaW5hbCBzZXJ2ZXIsIEkgbWVhbiBsaXRlcmFsbHkKPiA+ID4gPiA+
IHNlbmRpbmcKPiA+ID4gPiA+IG5ldyBvcGVuIGFuZCBsb2NrIHJlcXVlc3RzIHdpdGggdGhlIFJF
Q0xBSU0gYml0IHNldCwgd2hpY2gKPiA+ID4gPiA+IHdvdWxkCj4gPiA+ID4gPiBnZXQKPiA+ID4g
PiA+IGJyYW5kIG5ldyBzdGF0ZWlkcy4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gU28sIHRoZSBvcmln
aW5hbCBzZXJ2ZXIgd291bGQgaW52YWxpZGF0ZSB0aGUgZXhpc3RpbmcKPiA+ID4gPiA+IGNsaWVu
dCdzCj4gPiA+ID4gPiBwcmV2aW91cyBjbGllbnRpZCBhbmQgc3RhdGVpZHMtLWp1c3QgYXMgaXQg
bm9ybWFsbHkgd291bGQgb24KPiA+ID4gPiA+IHJlYm9vdC0tYnV0IGl0IHdvdWxkIG9wdGlvbmFs
bHkgcmVtZW1iZXIgdGhlIHVuZGVybHlpbmcgbG9ja3MKPiA+ID4gPiA+IGhlbGQgYnkKPiA+ID4g
PiA+IHRoZSBjbGllbnQgYW5kIGFsbG93IGNvbXBhdGlibGUgbG9jayByZWNsYWltcy4KPiA+ID4g
PiA+IAo+ID4gPiA+ID4gUm91Z2ggYXR0ZW1wdDoKPiA+ID4gPiA+IAo+ID4gPiA+ID4gCj4gPiA+
ID4gPiBodHRwczovL3dpa2kubGludXgtbmZzLm9yZy93aWtpL2luZGV4LnBocC9SZWJvb3RfcmVj
b3ZlcnlfZm9yX3JlLWV4cG9yCj4gPiA+ID4gPiB0X3NlcnZlcnMKPiA+ID4gPiA+IAo+ID4gPiA+
ID4gVGhpbmsgaXQgd291bGQgZmx5Pwo+ID4gPiA+IAo+ID4gPiA+IFNvIHRoaXMgd291bGQgYmUg
YSB2YXJpYW50IG9mIGNvdXJ0ZXN5IGxvY2tzIHRoYXQgY2FuIGJlCj4gPiA+ID4gcmVjbGFpbWVk
Cj4gPiA+ID4gYnkgdGhlIGNsaWVudAo+ID4gPiA+IHVzaW5nIHRoZSByZWJvb3QgcmVjbGFpbSB2
YXJpYW50IG9mIE9QRU4vTE9DSyBvdXRzaWRlIHRoZSBncmFjZQo+ID4gPiA+IHBlcmlvZD8gVGhl
Cj4gPiA+ID4gcHVycG9zZSBiZWluZyB0byBhbGxvdyByZWNsYWltIHdpdGhvdXQgZm9yY2luZyB0
aGUgY2xpZW50IHRvCj4gPiA+ID4gcGVyc2lzdCB0aGUgb3JpZ2luYWwKPiA+ID4gPiBzdGF0ZWlk
Pwo+ID4gPiA+IAo+ID4gPiA+IEhtbS4uLiBUaGF0J3MgZG9hYmxlLCBidXQgaG93IGFib3V0IHRo
ZSBmb2xsb3dpbmcgYWx0ZXJuYXRpdmU6Cj4gPiA+ID4gQWRkCj4gPiA+ID4gYSBmdW5jdGlvbgo+
ID4gPiA+IHRoYXQgYWxsb3dzIHRoZSBjbGllbnQgdG8gcmVxdWVzdCB0aGUgZnVsbCBsaXN0IG9m
IHN0YXRlaWRzCj4gPiA+ID4gdGhhdAo+ID4gPiA+IHRoZSBzZXJ2ZXIgaG9sZHMgb24KPiA+ID4g
PiBpdHMgYmVoYWxmPwo+ID4gPiA+IAo+ID4gPiA+IEkndmUgYmVlbiB3YW50aW5nIHN1Y2ggYSBm
dW5jdGlvbiBmb3IgcXVpdGUgYSB3aGlsZSBhbnl3YXkgaW4KPiA+ID4gPiBvcmRlcgo+ID4gPiA+
IHRvIGFsbG93IHRoZQo+ID4gPiA+IGNsaWVudCB0byBkZXRlY3Qgc3RhdGUgbGVha3MgKGVpdGhl
ciBkdWUgdG8gc29mdCB0aW1lb3V0cywgb3IKPiA+ID4gPiBkdWUKPiA+ID4gPiB0byByZW9yZGVy
ZWQKPiA+ID4gPiBjbG9zZS9vcGVuIG9wZXJhdGlvbnMpLgo+ID4gPiAKPiA+ID4gT2gsIHRoYXQg
c291bmRzIGludGVyZXN0aW5nLiBTbyBiYXNpY2FsbHkgdGhlIHJlLWV4cG9ydCBzZXJ2ZXIKPiA+
ID4gd291bGQKPiA+ID4gcmUtcG9wdWxhdGUgaXQncyBzdGF0ZSBmcm9tIHRoZSBvcmlnaW5hbCBz
ZXJ2ZXIgcmF0aGVyIHRoYW4KPiA+ID4gcmVseWluZwo+ID4gPiBvbiBpdCdzIGNsaWVudHMgZG9p
bmcgcmVjbGFpbXM/IEhtbSwgYnV0IGhvdyBkb2VzIHRoZSByZS1leHBvcnQKPiA+ID4gc2VydmVy
IHJlYnVpbGQgaXRzIHN0YXRlaWRzPyBJIGd1ZXNzIGl0IGNvdWxkIG1ha2UgdGhlIGNsaWVudHMK
PiA+ID4gcmVwb3B1bGF0ZSB0aGVtIHdpdGggdGhlIHNhbWUgImdpdmUgbWUgYSBkdW1wIG9mIGFs
bCBteSBzdGF0ZSIsCj4gPiA+IHVzaW5nCj4gPiA+IHRoZSBzdGF0ZSBkZXRhaWxzIHRvIG1hdGNo
IHVwIHdpdGggdGhlIG9sZCBzdGF0ZSBhbmQgcmVwbGFjaW5nCj4gPiA+IHN0YXRlaWRzLiBPciBk
aWQgeW91IGhhdmUgc29tZXRoaW5nIGRpZmZlcmVudCBpbiBtaW5kPwo+ID4gPiAKPiA+IAo+ID4g
SSB3YXMgdGhpbmtpbmcgdGhhdCB0aGUgcmUtZXhwb3J0IHNlcnZlciBjb3VsZCBqdXN0IHVzZSB0
aGF0IGxpc3QKPiA+IG9mCj4gPiBzdGF0ZWlkcyB0byBmaWd1cmUgb3V0IHdoaWNoIGxvY2tzIGNh
biBiZSByZWNsYWltZWQgYXRvbWljYWxseSwgYW5kCj4gPiB3aGljaCBvbmVzIGhhdmUgYmVlbiBp
cnJlZGVlbWFibHkgbG9zdC4gVGhlIGFzc3VtcHRpb24gaXMgdGhhdCBpZgo+ID4geW91Cj4gPiBo
YXZlIGEgbG9jayBzdGF0ZWlkIG9yIGEgZGVsZWdhdGlvbiwgdGhlbiB0aGF0IG1lYW5zIHRoZSBj
bGllbnRzCj4gPiBjYW4KPiA+IHJlY2xhaW0gYWxsIHRoZSBsb2NrcyB0aGF0IHdlcmUgcmVwcmVz
ZW50ZWQgYnkgdGhhdCBzdGF0ZWlkLgo+IAo+IEknbSBjb25mdXNlZCBhYm91dCBob3cgdGhlIHJl
LWV4cG9ydCBzZXJ2ZXIgdXNlcyB0aGF0IGxpc3QuwqAgQXJlIHlvdQo+IGFzc3VtaW5nIGl0IHBl
cnNpc3RlZCBpdHMgb3duIGxpc3QgYWNyb3NzIGl0cyBvd24gY3Jhc2gvcmVib290P8KgIEkKPiBn
dWVzcwo+IHRoYXQncyB3aGF0IEkgd2FzIHRyeWluZyB0byBhdm9pZCBoYXZpbmcgdG8gZG8uCj4g
Ck5vLiBUaGUgc2VydmVyIGp1c3QgdXNlcyB0aGUgc3RhdGVpZHMgYXMgcGFydCBvZiBhIGNoZWNr
IGZvciAnZG8gSSBob2xkCnN0YXRlIGZvciB0aGlzIGZpbGUgb24gdGhpcyBzZXJ2ZXI/Jy4gSWYg
dGhlIGFuc3dlciBpcyAneWVzJyBhbmQgdGhlCmxvY2sgb3duZXJzIGFyZSBzYW5lLCB0aGVuIHdl
IHNob3VsZCBiZSBhYmxlIHRvIGFzc3VtZSB0aGUgZnVsbCBzZXQgb2YKbG9ja3MgdGhhdCBsb2Nr
IG93bmVyIGhlbGQgb24gdGhhdCBmaWxlIGFyZSBzdGlsbCB2YWxpZC4KCkJUVzogaWYgdGhlIGxv
Y2sgb3duZXIgaXMgYWxzbyByZXR1cm5lZCBieSB0aGUgc2VydmVyLCB0aGVuIHNpbmNlIHRoZQps
b2NrIG93bmVyIGlzIGFuIG9wYXF1ZSB2YWx1ZSwgaXQgY291bGQsIGZvciBpbnN0YW5jZSwgYmUg
dXNlZCBieSB0aGUKY2xpZW50IHRvIGNhY2hlIGluZm8gb24gdGhlIHNlcnZlciBhYm91dCB3aGlj
aCB1aWQvZ2lkIG93bnMgdGhlc2UKbG9ja3MuCgotLSAKVHJvbmQgTXlrbGVidXN0CkxpbnV4IE5G
UyBjbGllbnQgbWFpbnRhaW5lciwgSGFtbWVyc3BhY2UKdHJvbmQubXlrbGVidXN0QGhhbW1lcnNw
YWNlLmNvbQoKCgotLQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJl
ZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNh
Y2hlZnM=

