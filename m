Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8AFC02CDFAF
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 21:28:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290--KxxxcW5MXiLmWFI-1XOfA-1; Thu, 03 Dec 2020 15:28:01 -0500
X-MC-Unique: -KxxxcW5MXiLmWFI-1XOfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4C441005504;
	Thu,  3 Dec 2020 20:27:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAA0F1A839;
	Thu,  3 Dec 2020 20:27:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 326584BB7B;
	Thu,  3 Dec 2020 20:27:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3KRpSR028812 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 15:27:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5B9AF101F0C8; Thu,  3 Dec 2020 20:27:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 532991031F3E
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 20:27:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E3D2803C9F
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 20:27:46 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam10on2120.outbound.protection.outlook.com [40.107.93.120])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-296-qo4t007BNyK9GiuRERiY9g-1; Thu, 03 Dec 2020 15:27:44 -0500
X-MC-Unique: qo4t007BNyK9GiuRERiY9g-1
Received: from MN2PR13MB3957.namprd13.prod.outlook.com (2603:10b6:208:263::11)
	by BL0PR13MB4241.namprd13.prod.outlook.com (2603:10b6:208:81::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.9;
	Thu, 3 Dec 2020 20:27:39 +0000
Received: from MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e989:f666:131a:e210]) by
	MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e989:f666:131a:e210%9]) with mapi id 15.20.3632.016;
	Thu, 3 Dec 2020 20:27:39 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "bfields@fieldses.org" <bfields@fieldses.org>, "daire@dneg.com"
	<daire@dneg.com>
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: fNDm/l4o9cYx5Rz5g0S1EO4zMAtIR4tJDJwAAAWCe4BeKhpLVGiQL7pUtKchSdvFeTqNAIAEhEYAgBNavQCAAAtBAIABTyGAgAxAb4CAAG0ggIAAGvSA
Date: Thu, 3 Dec 2020 20:27:39 +0000
Message-ID: <4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
	<20201203185109.GB27931@fieldses.org>
In-Reply-To: <20201203185109.GB27931@fieldses.org>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04fff860-0312-4b67-8633-08d897c9e130
x-ms-traffictypediagnostic: BL0PR13MB4241:
x-microsoft-antispam-prvs: <BL0PR13MB424114B375C7CFE407B000EAB8F20@BL0PR13MB4241.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: Eirkya3y6fixfucMYtuBrXDy5Gz/jZmf9OwU2B48IwioFBf5gMysXguHpoDCqLpvWOIEspDXS2Xk6TXHxULlvy8POv0tzs8Y6Askkr7rt5EfGB7UO7+zhXv7rqsH8X999Nngj7U/GSUT4b3SQztA5iCj51JqRW4MAPhKwufYHraeB47j//IaDnaXM5rCfjNMMKmYxsi8D+rsEzUFvwNXemdnyHZQlwZsYVk1fO0KFNgAE2iII28Pb6kapXaxybuqHF1HrnB/jmClNEf623Hd378uf3VfriWcgxt+okoxZy5WxTfqVcVU4kRmZvvYeRX5VON9oE4/w8GLWQO02Wy6P89nTtCuPYIrzekmDEJtWorKrdm188ayC9Zsit1yB9SgfHPieeqsbq8Ju+ie2Sya+A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MN2PR13MB3957.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(376002)(346002)(136003)(39840400004)(366004)(396003)(91956017)(5660300002)(36756003)(6506007)(6486002)(966005)(6512007)(26005)(2616005)(186003)(66446008)(76116006)(64756008)(66556008)(66946007)(66476007)(4326008)(2906002)(86362001)(83380400001)(478600001)(71200400001)(316002)(54906003)(8936002)(110136005)(8676002);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?utf-8?B?a0ZFTnNmaW1ST1RLZ3ZCeTFVMGR3SXcyWEhvOUlxbFhYSUpvdHRSTyt4KzZs?=
	=?utf-8?B?NEFBczAyZVA1YUhSVE1qYlZIMm1mWE9LdDZBZDk5Y250VGpVdno5NFNTeDBo?=
	=?utf-8?B?VDhlRjFQcHcwaWdVdmRId3pHVENjRnlqQ2ZoWDVIQlRLUXJPL3N3Tyt5VGF0?=
	=?utf-8?B?Qkh3cU5CK0hyT1VSWlJzY0IrTHpFcDlCczYvL0tKTzFPQjQxSHhWV21zVmlv?=
	=?utf-8?B?czk5b2hOb29kbHpHTm5YMFdMSmlnVW16dkliNGRBWGVFNDV6cFFDRktwVzE2?=
	=?utf-8?B?MVg0K2lzdXpDTkdlZXgyUktFRk5MNGNxcXlKclF3UFVFWk9KUWNBZTBnVTIr?=
	=?utf-8?B?SUNoOThMOGlTVStWa1F5NjBQNUhwRlk0Qmg4TVFDRGZocTZsN1R6amtIbXVx?=
	=?utf-8?B?aXk3NGhWRUdRVForL2FPWC91bVNPMVQ5Y0YvVFVUVjJBT2NodmdIZmFkb09u?=
	=?utf-8?B?RkxVRUR5YWlOUjYwNFdNSE9yVWxZSmduZ0Y0RUwwMG9Zd01NQWJ4cS9reVpQ?=
	=?utf-8?B?dlBoOUdJQTYzNy9oT0RyYjVKUEhEdU1XMjc5aFZvS0ZDUlB2OEk3d0Q0TCtH?=
	=?utf-8?B?c0xMUWJCTFZpc1YyZE1tNS9pYkduSlp5b1hlL1lENHk4cXF4d3ZCWWJRb0p2?=
	=?utf-8?B?dmZvVytjY09HbjkxemZDZklxNXhZOXlRRTY1MDZObkplQjhEYUdJWkttT2NO?=
	=?utf-8?B?OHc4eVZGdGlueUcxaDJ4b2JjTXlPSEgvSUF6RWNzNjBlR1Q5Y0VZVXJlNjNm?=
	=?utf-8?B?YlA3d3d6b3MxbmYzWFl1dGhwczhtNjI2aHpCazV5dktVSStwTE9ZM29ENFZr?=
	=?utf-8?B?MGc0TVFVRS9QRGp5dnRkRDlQWEl5R3kxUERZUjJxSmJUSmZveld5L3JZeDJP?=
	=?utf-8?B?anpjZWlkZVcwR3VmTnhoQU91cjQ0L2UwQnNLbCtscmxCR3p1bzVhNktxeDZR?=
	=?utf-8?B?QzFWV0d6U0NSOUdIOGdKdUFCS2RPWjRZbTA3ano2WG91NGdJQmhmM1IzSlJI?=
	=?utf-8?B?ZjgxT25yQzJ2REhrcks0VGZrN0xaZHUrNUJMZlRxa0VIQVY5c1owV1I3MFZP?=
	=?utf-8?B?dXp0Smo4WEtnTnZyQnF1eXRUaUpzM3ZEZW5NSGV3K2NOb1hKVnJFQlNZeXpI?=
	=?utf-8?B?bGRKVjZMdWFuNUUzME9hcEw5TVBJamFBTlh6d2ROOXg3Rm93eThXanY2MTBm?=
	=?utf-8?B?dG9hbHdSUHFuZUZkeEZZbmhyTTBWVG5hcGFWZERnMEk3Um1MQzJ4c2lTbVdm?=
	=?utf-8?B?S3RCclIrbnE5YUthbUhDandiRmw2alVPN3JUL2JWeHc5c0x0cDRhRHgwNjB0?=
	=?utf-8?Q?6AukO+0YBvwKxANlqqbYmV2mr3Bsl56NwH?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3957.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04fff860-0312-4b67-8633-08d897c9e130
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 20:27:39.4731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0/6jsE+RTL7vvds/QvbXpzw/LUxAVX3GrL/m/d7CtU4y9GNtEECFaag4kf1/pu9tZfysyIqAt3Ashwmwr3q35A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR13MB4241
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3KRpSR028812
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
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
Content-ID: <35C9154F439D19419258D2309C1739AF@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTEyLTAzIGF0IDEzOjUxIC0wNTAwLCBiZmllbGRzIHdyb3RlOgo+IE9uIFRo
dSwgRGVjIDAzLCAyMDIwIGF0IDEyOjIwOjM1UE0gKzAwMDAsIERhaXJlIEJ5cm5lIHdyb3RlOgo+
ID4gSnVzdCBhIHNtYWxsIHVwZGF0ZSBiYXNlZCBvbiB0aGUgbW9zdCByZWNlbnQgcGF0Y2hzZXRz
IGZyb20gVHJvbmQgJgo+ID4gQnJ1Y2U6Cj4gPiAKPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9saW51eC1uZnMvbGlzdC8/c2VyaWVzPTM5MzU2Nwo+ID4gaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW5mcy9saXN0Lz9zZXJpZXM9MzkzNTYx
Cj4gPiAKPiA+IEZvciB0aGUgd3JpdGUtdGhyb3VnaCB0ZXN0cywgdGhlIE5GU3YzIHJlLWV4cG9y
dCBvZiBhIE5GU3Y0LjIKPiA+IHNlcnZlcgo+ID4gaGFzIHRyaW1tZWQgYW4gZXh0cmEgR0VUQVRU
UjoKPiA+IAo+ID4gQmVmb3JlOiBvcmlnaW5hdGluZyBzZXJ2ZXIgPC0gKHZlcnM9NC4yKSA8LSBy
ZWV4cG9ydCBzZXJ2ZXIgLQo+ID4gKHZlcnM9MykKPiA+IDwtIGNsaWVudCB3cml0aW5nID0gV1JJ
VEUsQ09NTUlULEdFVEFUVFIgLi4uLiByZXBlYXRpbmcKPiA+IMKgCj4gPiBBZnRlcjogb3JpZ2lu
YXRpbmcgc2VydmVyIDwtICh2ZXJzPTQuMikgPC0gcmVleHBvcnQgc2VydmVyIC0KPiA+ICh2ZXJz
PTMpCj4gPiA8LSBjbGllbnQgd3JpdGluZyA9IFdSSVRFLENPTU1JVCAuLi4uIHJlcGVhdGluZwo+
ID4gCj4gPiBJJ20gYXNzdW1pbmcgdGhpcyBpcyBzcGVjaWZpY2FsbHkgZHVlIHRvIHRoZSAiRVhQ
T1JUX09QX05PV0NDIgo+ID4gcGF0Y2g/Cj4gCj4gUHJvYmFibHkgc28sIHRoYW5rcyBmb3IgdGhl
IHVwZGF0ZS4KPiAKPiA+IEFsbCBvdGhlciBjb21iaW5hdGlvbnMgbG9vayB0aGUgc2FtZSBhcyBi
ZWZvcmUgKGZvciB3cml0ZS10aHJvdWdoKS4KPiA+IEFuCj4gPiBORlN2NC4yIHJlLWV4cG9ydCBv
ZiBhIE5GU3YzIHNlcnZlciBpcyBzdGlsbCB0aGUgYmVzdC9pZGVhbCBpbgo+ID4gdGVybXMKPiA+
IG9mIG5vdCBpbmN1cnJpbmcgZXh0cmEgbWV0YWRhdGEgcm91bmR0cmlwcyB3aGVuIHdyaXRpbmcu
Cj4gPiAKPiA+IEl0J3MgZ3JlYXQgdG8gc2VlIHRoaXMgcmUtZXhwb3J0IHNjZW5hcmlvIGJlY29t
aW5nIGEgYmV0dGVyCj4gPiBzdXBwb3J0ZWQKPiA+IChhbmQgcGVyZm9ybWluZykgdG9wb2xvZ3k7
IG1hbnkgdGhhbmtzIGFsbC4KPiAKPiBJJ3ZlIGJlZW4gc2NyYXRjaGluZyBteSBoZWFkIG92ZXIg
aG93IHRvIGhhbmRsZSByZWJvb3Qgb2YgYSByZS0KPiBleHBvcnRpbmcKPiBzZXJ2ZXIuwqAgSSB0
aGluayBvbmUgd2F5IHRvIGZpeCBpdCBtaWdodCBiZSBqdXN0IHRvIGFsbG93IHRoZSByZS0KPiBl
eHBvcnQKPiBzZXJ2ZXIgdG8gcGFzcyBhbG9uZyByZWNsYWltcyB0byB0aGUgb3JpZ2luYWwgc2Vy
dmVyIGFzIGl0IHJlY2VpdmVzCj4gdGhlbQo+IGZyb20gaXRzIG93biBjbGllbnRzLsKgIEl0IG1p
Z2h0IHJlcXVpcmUgc29tZSBwcm90b2NvbCB0d2Vha3MsIEknbSBub3QKPiBzdXJlLsKgIEknbGwg
dHJ5IHRvIGdldCBteSB0aG91Z2h0cyBpbiBvcmRlciBhbmQgcHJvcG9zZSBzb21ldGhpbmcuCj4g
CgpJdCdzIG1vcmUgY29tcGxpY2F0ZWQgdGhhbiB0aGF0LiBJZiB0aGUgcmUtZXhwb3J0aW5nIHNl
cnZlciByZWJvb3RzLApidXQgdGhlIG9yaWdpbmFsIHNlcnZlciBkb2VzIG5vdCwgdGhlbiB1bmxl
c3MgdGhhdCByZS1leHBvcnRpbmcgc2VydmVyCnBlcnNpc3RlZCBpdHMgbGVhc2UgYW5kIGEgZnVs
bCBzZXQgb2Ygc3RhdGVpZHMgc29tZXdoZXJlLCBpdCB3aWxsIG5vdApiZSBhYmxlIHRvIGF0b21p
Y2FsbHkgcmVjbGFpbSBkZWxlZ2F0aW9uIGFuZCBsb2NrIHN0YXRlIG9uIHRoZSBzZXJ2ZXIKb24g
YmVoYWxmIG9mIGl0cyBjbGllbnRzLgoKLS0gClRyb25kIE15a2xlYnVzdApMaW51eCBORlMgY2xp
ZW50IG1haW50YWluZXIsIEhhbW1lcnNwYWNlCnRyb25kLm15a2xlYnVzdEBoYW1tZXJzcGFjZS5j
b20KCgoKLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKTGludXgtY2FjaGVmc0ByZWRoYXQu
Y29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZz

