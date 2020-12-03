Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E386A2CE0F2
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 22:38:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-4OjF9qQVOUS3knztwEQBHw-1; Thu, 03 Dec 2020 16:38:37 -0500
X-MC-Unique: 4OjF9qQVOUS3knztwEQBHw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 202AF107ACFA;
	Thu,  3 Dec 2020 21:38:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7CC05D6BA;
	Thu,  3 Dec 2020 21:38:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BCB5D4BB7B;
	Thu,  3 Dec 2020 21:38:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3LYa3G004255 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 16:34:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 82FB32166B27; Thu,  3 Dec 2020 21:34:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C19E2166B2B
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 21:34:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DC90108C0E2
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 21:34:33 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam10on2099.outbound.protection.outlook.com [40.107.94.99])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-527-JuoCKkk0PPuRGlHhpTc1Cw-1; Thu, 03 Dec 2020 16:34:30 -0500
X-MC-Unique: JuoCKkk0PPuRGlHhpTc1Cw-1
Received: from MN2PR13MB3957.namprd13.prod.outlook.com (2603:10b6:208:263::11)
	by MN2PR13MB2736.namprd13.prod.outlook.com (2603:10b6:208:f1::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.6;
	Thu, 3 Dec 2020 21:34:26 +0000
Received: from MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e989:f666:131a:e210]) by
	MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e989:f666:131a:e210%9]) with mapi id 15.20.3632.016;
	Thu, 3 Dec 2020 21:34:26 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "bfields@fieldses.org" <bfields@fieldses.org>
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: fNDm/l4o9cYx5Rz5g0S1EO4zMAtIR4tJDJwAAAWCe4BeKhpLVGiQL7pUtKchSdvFeTqNAIAEhEYAgBNavQCAAAtBAIABTyGAgAxAb4CAAG0ggIAAGvSAgAAMzwCAAAXZAA==
Date: Thu, 3 Dec 2020 21:34:26 +0000
Message-ID: <9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
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
In-Reply-To: <20201203211328.GC27931@fieldses.org>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a664a139-3135-4375-ba9f-08d897d3357d
x-ms-traffictypediagnostic: MN2PR13MB2736:
x-microsoft-antispam-prvs: <MN2PR13MB2736423A43FB4BD19129289EB8F20@MN2PR13MB2736.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 7EY4S3SoX2PvPBDwMEl3C7rqDjZ656ZNLb60YKbGX1ciksflc9zE50YDHARMnUaRZH0XPHqz+UeLZnpsaXx0B/d1et0pqiAiMmTl9l7VYGHWcJvCeAgYL4A5CKCwS+Un2H5uuXxNnT/HbSdGhbFiJA5BV50sBNQwtsKc71YsI2pJJkPNnEmyTaxZVSz1x8mbF9TZ4uOL/oNDPsU1Qs+9CWKfkiX8PtPIIUWv+4qvpuU2WyWv/6XL1vAgnhHNp1rVQYLRAgBnju4mozjvaau09iskJeIhte/QQINDzESsJBJBGN9S71bKtqNTaeKp9HLCcJj0umqXBGtbpDUrsJgW33P1IBS02F5XPe2kfTRg71U3E9Ds0Q+6F0b7VMxgIcxtCqKfQqvfnQo8C2K9+RmXzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MN2PR13MB3957.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(39840400004)(136003)(346002)(376002)(396003)(86362001)(8936002)(6506007)(26005)(71200400001)(2906002)(4326008)(36756003)(66476007)(64756008)(66446008)(478600001)(2616005)(66556008)(91956017)(66946007)(76116006)(966005)(186003)(6486002)(6512007)(6916009)(8676002)(16799955002)(5660300002)(83380400001)(316002)(54906003);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?utf-8?B?dUEwTVF2b1FXTVlETHlodFloRDVFTWszYkRLUkRmMHJTWnE2UEZlaFl4TENQ?=
	=?utf-8?B?aHhCWFRUNTZBSDNZWlliKy9QVFR0Q0ZiN0FjVzMzaXBrV2lwVE51UG5iNmI4?=
	=?utf-8?B?UkI4a1dOU1ZTTGh2WG9wWHp5N1NIMjdLYUZJWjB2TTZYTk9wbkM3NkMxN05m?=
	=?utf-8?B?STdSby9wK0dKOEpFZVhUcmVwdmVodGtwS2xMTFhsYzl4Z2s4akc0ZHNHUlkz?=
	=?utf-8?B?aVdydWxESW9ET2wwODBwanpGaHZIOG8wR3V4UGNFcTJoVGpRUzBPdGtBbko1?=
	=?utf-8?B?SGNjQXRpWVNQNlA2elk5cTlVOGw3YzZzSjZsV2Y3c2lVZWVKYklMSnRUaURh?=
	=?utf-8?B?UGRWNXF6OHROSm5TcHdrRUZkYmxZei8vSUFlN1VOaWlOb3g0S2p0bHBvK3ky?=
	=?utf-8?B?WWFYRTU1LzZHcCsvQXM0OTFWMk5wTy9uU283KzZHZklPL1ZBL1ZnVHhiOFFF?=
	=?utf-8?B?U0t6N0xzc1JYTTJZeW5KSk9xWVlpTzNDYjMyQ1lXcnJwVHBoQjFjUll5blBG?=
	=?utf-8?B?cThubUtRNFJZQnlQOHdIVHFMcVgrRlNlVWhBRXBTV3BRNi9LRExabXpJOHFj?=
	=?utf-8?B?d3dXZ0pIUkJ4dTRITVM0NEhuM25hYTBaYkxTdmxyVzRUWEFkTFBGU2FxempR?=
	=?utf-8?B?YkVlK1djRTM1eFR1bWlUUXcrVlRkei9lU3VpcVliTXlDNGxuSjU5TjdlbkJ3?=
	=?utf-8?B?WC9jYm1lVldVRmI0Ym5xUHdzazJKcFlCRFpOaEdUWVdwd3dUcjgydGRFN0Z3?=
	=?utf-8?B?Z3N3N05qVndBQ0FXSWJDcVhyc0RoYzYzOVQxTVVLbWFoT3Irb3pteGdLRGY3?=
	=?utf-8?B?UGNYSkhFVU5DTkdOODNUUnZuM2FlbThBVko2R2lYRXBPK2ZVOHh3QlQvVHJv?=
	=?utf-8?B?WjJmTmJEeWg5MHlBYmhSTFFVcUhzblNmSUZ3cGRad1MzTS8wbzBLL2JBK0Fn?=
	=?utf-8?B?RUZxaDN4YTZnTEw4YWxtMm1rVEU5R1dIUkN0V011Si9TUkFUS3Eyc1l6eERC?=
	=?utf-8?B?ejFVQXFYZ0Y4NDFXY3Jiam4yUCtacUtwTXBIdWNvbTltMUtSZy9OWGZHM2xu?=
	=?utf-8?B?SFdPSDdlTlhZZjBTakRkOGVFc2tyOXliVXkxckhCTWdaQ1JzTGw5a1p1V2dU?=
	=?utf-8?B?RDZ6d1Yyb2djUWVNZzc0cU01MHlUQWVkNDA0aTRtZ2x1TzJud2FWVmE3OEQy?=
	=?utf-8?B?U0FFZ3lRTDhYaU5QRUlZNlk4dUlSeldlbmh3WjZ6VnAybTRHcVdZN0FnQXM5?=
	=?utf-8?B?Q1YxMkVEVEE3SG5pd0d6RVU4ZzQvK254NnZTemFwYnVzMGN6cCtLSzIybVVH?=
	=?utf-8?Q?dot7ua90metHTYV21PegrUNvXztXLS/z4I?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3957.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a664a139-3135-4375-ba9f-08d897d3357d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 21:34:26.2419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nbeo8XUy//kidJdISdUeoZYvL+AtXHK/1xaMnZmZ+xN25PMtyth5Mhst1l7b3pAXtkZPnnQbieeN938euJkMlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB2736
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3LYa3G004255
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <07CEFFFB5926D24B901968826DF1CB66@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTEyLTAzIGF0IDE2OjEzIC0wNTAwLCBiZmllbGRzQGZpZWxkc2VzLm9yZyB3
cm90ZToKPiBPbiBUaHUsIERlYyAwMywgMjAyMCBhdCAwODoyNzozOVBNICswMDAwLCBUcm9uZCBN
eWtsZWJ1c3Qgd3JvdGU6Cj4gPiBPbiBUaHUsIDIwMjAtMTItMDMgYXQgMTM6NTEgLTA1MDAsIGJm
aWVsZHMgd3JvdGU6Cj4gPiA+IEkndmUgYmVlbiBzY3JhdGNoaW5nIG15IGhlYWQgb3ZlciBob3cg
dG8gaGFuZGxlIHJlYm9vdCBvZiBhIHJlLQo+ID4gPiBleHBvcnRpbmcKPiA+ID4gc2VydmVyLsKg
IEkgdGhpbmsgb25lIHdheSB0byBmaXggaXQgbWlnaHQgYmUganVzdCB0byBhbGxvdyB0aGUgcmUt
Cj4gPiA+IGV4cG9ydAo+ID4gPiBzZXJ2ZXIgdG8gcGFzcyBhbG9uZyByZWNsYWltcyB0byB0aGUg
b3JpZ2luYWwgc2VydmVyIGFzIGl0Cj4gPiA+IHJlY2VpdmVzCj4gPiA+IHRoZW0KPiA+ID4gZnJv
bSBpdHMgb3duIGNsaWVudHMuwqAgSXQgbWlnaHQgcmVxdWlyZSBzb21lIHByb3RvY29sIHR3ZWFr
cywgSSdtCj4gPiA+IG5vdAo+ID4gPiBzdXJlLsKgIEknbGwgdHJ5IHRvIGdldCBteSB0aG91Z2h0
cyBpbiBvcmRlciBhbmQgcHJvcG9zZQo+ID4gPiBzb21ldGhpbmcuCj4gPiA+IAo+ID4gCj4gPiBJ
dCdzIG1vcmUgY29tcGxpY2F0ZWQgdGhhbiB0aGF0LiBJZiB0aGUgcmUtZXhwb3J0aW5nIHNlcnZl
cgo+ID4gcmVib290cywKPiA+IGJ1dCB0aGUgb3JpZ2luYWwgc2VydmVyIGRvZXMgbm90LCB0aGVu
IHVubGVzcyB0aGF0IHJlLWV4cG9ydGluZwo+ID4gc2VydmVyCj4gPiBwZXJzaXN0ZWQgaXRzIGxl
YXNlIGFuZCBhIGZ1bGwgc2V0IG9mIHN0YXRlaWRzIHNvbWV3aGVyZSwgaXQgd2lsbAo+ID4gbm90
Cj4gPiBiZSBhYmxlIHRvIGF0b21pY2FsbHkgcmVjbGFpbSBkZWxlZ2F0aW9uIGFuZCBsb2NrIHN0
YXRlIG9uIHRoZQo+ID4gc2VydmVyCj4gPiBvbiBiZWhhbGYgb2YgaXRzIGNsaWVudHMuCj4gCj4g
Qnkgc2VuZGluZyByZWNsYWltcyB0byB0aGUgb3JpZ2luYWwgc2VydmVyLCBJIG1lYW4gbGl0ZXJh
bGx5IHNlbmRpbmcKPiBuZXcKPiBvcGVuIGFuZCBsb2NrIHJlcXVlc3RzIHdpdGggdGhlIFJFQ0xB
SU0gYml0IHNldCwgd2hpY2ggd291bGQgZ2V0Cj4gYnJhbmQKPiBuZXcgc3RhdGVpZHMuCj4gCj4g
U28sIHRoZSBvcmlnaW5hbCBzZXJ2ZXIgd291bGQgaW52YWxpZGF0ZSB0aGUgZXhpc3RpbmcgY2xp
ZW50J3MKPiBwcmV2aW91cwo+IGNsaWVudGlkIGFuZCBzdGF0ZWlkcy0tanVzdCBhcyBpdCBub3Jt
YWxseSB3b3VsZCBvbiByZWJvb3QtLWJ1dCBpdAo+IHdvdWxkCj4gb3B0aW9uYWxseSByZW1lbWJl
ciB0aGUgdW5kZXJseWluZyBsb2NrcyBoZWxkIGJ5IHRoZSBjbGllbnQgYW5kIGFsbG93Cj4gY29t
cGF0aWJsZSBsb2NrIHJlY2xhaW1zLgo+IAo+IFJvdWdoIGF0dGVtcHQ6Cj4gCj4gwqDCoMKgwqDC
oMKgwqDCoGh0dHBzOi8vd2lraS5saW51eC1uZnMub3JnL3dpa2kvaW5kZXgucGhwL1JlYm9vdF9y
ZWNvdmVyeV9mb3JfcmUtZXhwb3J0X3NlcnZlcnMKPiAKPiBUaGluayBpdCB3b3VsZCBmbHk/CgpT
byB0aGlzIHdvdWxkIGJlIGEgdmFyaWFudCBvZiBjb3VydGVzeSBsb2NrcyB0aGF0IGNhbiBiZSBy
ZWNsYWltZWQgYnkKdGhlIGNsaWVudCB1c2luZyB0aGUgcmVib290IHJlY2xhaW0gdmFyaWFudCBv
ZiBPUEVOL0xPQ0sgb3V0c2lkZSB0aGUKZ3JhY2UgcGVyaW9kPyBUaGUgcHVycG9zZSBiZWluZyB0
byBhbGxvdyByZWNsYWltIHdpdGhvdXQgZm9yY2luZyB0aGUKY2xpZW50IHRvIHBlcnNpc3QgdGhl
IG9yaWdpbmFsIHN0YXRlaWQ/CgpIbW0uLi4gVGhhdCdzIGRvYWJsZSwgYnV0IGhvdyBhYm91dCB0
aGUgZm9sbG93aW5nIGFsdGVybmF0aXZlOiBBZGQgYQpmdW5jdGlvbiB0aGF0IGFsbG93cyB0aGUg
Y2xpZW50IHRvIHJlcXVlc3QgdGhlIGZ1bGwgbGlzdCBvZiBzdGF0ZWlkcwp0aGF0IHRoZSBzZXJ2
ZXIgaG9sZHMgb24gaXRzIGJlaGFsZj8KCkkndmUgYmVlbiB3YW50aW5nIHN1Y2ggYSBmdW5jdGlv
biBmb3IgcXVpdGUgYSB3aGlsZSBhbnl3YXkgaW4gb3JkZXIgdG8KYWxsb3cgdGhlIGNsaWVudCB0
byBkZXRlY3Qgc3RhdGUgbGVha3MgKGVpdGhlciBkdWUgdG8gc29mdCB0aW1lb3V0cywgb3IKZHVl
IHRvIHJlb3JkZXJlZCBjbG9zZS9vcGVuIG9wZXJhdGlvbnMpLgoKLS0gClRyb25kIE15a2xlYnVz
dApMaW51eCBORlMgY2xpZW50IG1haW50YWluZXIsIEhhbW1lcnNwYWNlCnRyb25kLm15a2xlYnVz
dEBoYW1tZXJzcGFjZS5jb20KCgoKLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKTGludXgt
Y2FjaGVmc0ByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1jYWNoZWZz

