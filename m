Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 26E8C2CE211
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 23:51:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-36pVF-hIPYOAvwIIHT56Ng-1; Thu, 03 Dec 2020 17:51:01 -0500
X-MC-Unique: 36pVF-hIPYOAvwIIHT56Ng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDC30803646;
	Thu,  3 Dec 2020 22:50:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C22D71A890;
	Thu,  3 Dec 2020 22:50:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D1244BB7B;
	Thu,  3 Dec 2020 22:50:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3Motce013365 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 17:50:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 69DFD2166B2B; Thu,  3 Dec 2020 22:50:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6362B2166B27
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 22:50:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFC0F8007D9
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 22:50:52 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2104.outbound.protection.outlook.com [40.107.244.104])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-592-tIkTzd9oPjWRymB-Y7DF9w-1; Thu, 03 Dec 2020 17:50:49 -0500
X-MC-Unique: tIkTzd9oPjWRymB-Y7DF9w-1
Received: from MN2PR13MB3957.namprd13.prod.outlook.com (2603:10b6:208:263::11)
	by BL0PR13MB4420.namprd13.prod.outlook.com (2603:10b6:208:17c::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.6;
	Thu, 3 Dec 2020 22:50:46 +0000
Received: from MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e989:f666:131a:e210]) by
	MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e989:f666:131a:e210%9]) with mapi id 15.20.3632.016;
	Thu, 3 Dec 2020 22:50:46 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "bfields@fieldses.org" <bfields@fieldses.org>, "ffilzlnx@mindspring.com"
	<ffilzlnx@mindspring.com>
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: fNDm/l4o9cYx5Rz5g0S1EO4zMAtIR4tJDJwAAAWCe4BeKhpLVGiQL7pUtKchSdvFeTqNAIAEhEYAgBNavQCAAAtBAIABTyGAgAxAb4CAAG0ggIAAGvSAgAAMzwCAAAXZAIAAAzUAgAADTACAAAHegIAAAs4AgAAHHgCAAAMGgA==
Date: Thu, 3 Dec 2020 22:50:46 +0000
Message-ID: <72362b839eb2ecc992f41a0e7783545b13e8ecbc.camel@hammerspace.com>
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
	<0452916df308e9419f472b0d5ffb41815014dce4.camel@hammerspace.com>
	<01a001d6c9c5$37eb34f0$a7c19ed0$@mindspring.com>
In-Reply-To: <01a001d6c9c5$37eb34f0$a7c19ed0$@mindspring.com>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bb90bcc-3895-44ce-3fbc-08d897dddf43
x-ms-traffictypediagnostic: BL0PR13MB4420:
x-microsoft-antispam-prvs: <BL0PR13MB442071316AC120C33079A616B8F20@BL0PR13MB4420.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: shjeLTsc91LRnL3RCqDPr6VNK5140Dn9eH2V5wmQg8zcigc6XNmJzfgAEzm+g03BN3dtbZVUvUOF/i17HICRa3rHlK9EhwGMF1rZH29/Se3Yujg1anWPW8DBIrN8kwHLHEg6ZJV76kvrHQdqdRDqLGx3XWl+LgO+3/VP04tsRcgTHZ3+DUzcAntsqVjQcqMg+Xem6RwuSf1kNRFOpN7AtC04TLOPmaB1q9w70xogYKhdIvO9XdSebYWMjX0FVFTaCF9vrvXD3Yzr345Wuua3O9WJJ1XlXu8Wdc35u69aJrPjXn6b4AYmSrhJqMw8aDXelWOYq9o+pwy1ignd6n9urEsj7HFpSK4pwPjZ2X35/n4oHoqMkr6EAJfs3HgAieUOaS3DPC5KokflvyY5Kyp5dQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MN2PR13MB3957.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(376002)(346002)(396003)(366004)(136003)(39840400004)(478600001)(76116006)(8936002)(6486002)(5660300002)(316002)(8676002)(71200400001)(83380400001)(86362001)(53546011)(2906002)(6506007)(186003)(64756008)(26005)(66476007)(36756003)(6512007)(66556008)(91956017)(16799955002)(110136005)(2616005)(66446008)(966005)(66946007)(54906003)(4326008);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?utf-8?B?UFBUYmpjamFDSld4cm5KdFVlOXAybFRqU3k4ZVJSUXlLcXpOdSsvNHc3RjZ4?=
	=?utf-8?B?cElUZGZCa3dUbjNLWmVGRlgzckU5RTJlODlWQWUvQ010cG9TUjlOSlJsR05D?=
	=?utf-8?B?YzZzdSt3MlErNlZxYVRYWS9LbEduWENNTmlGNlZrYjkrQ2xWRkI3NjgwTHlz?=
	=?utf-8?B?eHZDSi9iUFZRbTliMEREVFRYT0pRMytYWVZRdzJ3Tm9KWHRnRDI5MTBXRlBN?=
	=?utf-8?B?NVB1Yjl6dkpiQ2FkcFcwdzE4NE9rL241VnFZZG9wcTgrWUJ1cHgxdDIwS3RC?=
	=?utf-8?B?ajVPRHU1bTgwSGZ6emFRTmxYakozWFY3bU1NRXdRWXJCNlFOdGVkNStvZm5q?=
	=?utf-8?B?YnJycXA1bW1ocVErSmdJRk9FUXpvTkZReWpFMU9RUVlDa1FGR0lvcmRSN3dj?=
	=?utf-8?B?WldTQVRsd2F2MWl4QWQrTDhwSE03NTJ2Uk9sVG1BM0NiUnY2VjhNZE9FMkI2?=
	=?utf-8?B?SEhjQ0VTdWNxUTFIc0twZXFrQ3Y0SjVtdm9lY2R1djE0a0hlSzU2blR3MW5T?=
	=?utf-8?B?ZGxtU1VaeUVQbnVZUUtKQldkbHJnSjBIZGh4TGFZcmFqd0tXZWRQYVE0VFoy?=
	=?utf-8?B?Z2I1WndQTE1NOWhPVTlPYkN5VklpT0VheFZPY0dLRzVBajY1Zi9GMC9lb3gx?=
	=?utf-8?B?SEtJVWJ6ZkJkelNlVXh1Z0U5bDJ3L2NJb2NVWDFFaWRyVmdlQTRMSjlIZUM0?=
	=?utf-8?B?STFGd05BVVhHYS9zK2ZBZ0F4UG9EVTZqK1QrYjlGeS9PeVphZDFhSGl4VjBU?=
	=?utf-8?B?bkFsWkxrUVpRcE11czZOYWl5alpWczBlUmJRNStDbXpYZVZtKzVQdlRoWEpu?=
	=?utf-8?B?UnRMbjZ5QzN2K3g1QmZBcmhsWTJ3b0l4bzlyRzZjVDNrdDB5OWRsODhPNHpE?=
	=?utf-8?B?VEV6ZDluN0tnQUV3NGIwM2NSZ0tndG1XeGVrbmc3Rnp6Q2diYW1GSmlJMTlG?=
	=?utf-8?B?WlpaWU5ORkFsdWFnck9Td0UxcituMGp5cnNYRkJ1dUVLb29DNGk3ZDBDTFF2?=
	=?utf-8?B?RmNNSC9ia2U0Vm5FZ05xMlRxeEQ3bnJNWE05UEZBLyszTkVDUnliUFJMNmJu?=
	=?utf-8?B?YmN3ZVpWV2VNcW9hTXJWelFQS2hmOWtjV3EwTEVEd2ZUWE9sdjBZVXV2NVVI?=
	=?utf-8?B?OXNjb2FDTkdPWmlwdThPZ2ZRMkhaNDRrZXhzMmwwRXRQYlA2a1QwNHN2U1U1?=
	=?utf-8?B?ZG4yVitXTTRxYVZtemtHc2dIamI0U2ZYMzBaSllIUi9iMnE3Vk5nbzgyaUMz?=
	=?utf-8?B?ZmlkVWp5MTJSRXhGVnMxc1RaZG85REtwMG1uTGZCUTc5VU4rdUQrTnRlVmQw?=
	=?utf-8?Q?FU8ggXdMokWZ8dw8O4ANiJypbCpeaH4ehI?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3957.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb90bcc-3895-44ce-3fbc-08d897dddf43
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 22:50:46.1003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ezjfaGAZ3bFFcs1ioFgj36gUoJlzf9iOup8Rl1C4fQJC/wLjMJxphPV2WvpBA8DfIOY+F4a+ni7oiLCCZXdZOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR13MB4420
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3Motce013365
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
Content-ID: <78FDB28A5F0E5043BAAB192C17A876DC@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTEyLTAzIGF0IDE0OjM5IC0wODAwLCBGcmFuayBGaWx6IHdyb3RlOgo+IAo+
IAo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFRyb25kIE15a2xlYnVz
dCBbbWFpbHRvOnRyb25kbXlAaGFtbWVyc3BhY2UuY29tXQo+ID4gU2VudDogVGh1cnNkYXksIERl
Y2VtYmVyIDMsIDIwMjAgMjoxNCBQTQo+ID4gVG86IGJmaWVsZHNAZmllbGRzZXMub3JnCj4gPiBD
YzogbGludXgtY2FjaGVmc0ByZWRoYXQuY29tOyBmZmlsemxueEBtaW5kc3ByaW5nLmNvbTsgbGlu
dXgtCj4gPiBuZnNAdmdlci5rZXJuZWwub3JnOyBkYWlyZUBkbmVnLmNvbQo+ID4gU3ViamVjdDog
UmU6IEFkdmVudHVyZXMgaW4gTkZTIHJlLWV4cG9ydGluZwo+ID4gCj4gPiBPbiBUaHUsIDIwMjAt
MTItMDMgYXQgMTc6MDQgLTA1MDAsIGJmaWVsZHNAZmllbGRzZXMub3JnwqB3cm90ZToKPiA+ID4g
T24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMDk6NTc6NDFQTSArMDAwMCwgVHJvbmQgTXlrbGVidXN0
IHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgMjAyMC0xMi0wMyBhdCAxMzo0NSAtMDgwMCwgRnJhbmsg
RmlseiB3cm90ZToKPiA+ID4gPiA+ID4gT24gVGh1LCAyMDIwLTEyLTAzIGF0IDE2OjEzIC0wNTAw
LAo+ID4gPiA+ID4gPiBiZmllbGRzQGZpZWxkc2VzLm9yZ8Kgd3JvdGU6Cj4gPiA+ID4gPiA+ID4g
T24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMDg6Mjc6MzlQTSArMDAwMCwgVHJvbmQgTXlrbGVidXN0
Cj4gPiA+ID4gPiA+ID4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiBPbiBUaHUsIDIwMjAtMTItMDMg
YXQgMTM6NTEgLTA1MDAsIGJmaWVsZHMgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+IEkndmUgYmVl
biBzY3JhdGNoaW5nIG15IGhlYWQgb3ZlciBob3cgdG8gaGFuZGxlCj4gPiA+ID4gPiA+ID4gPiA+
IHJlYm9vdCBvZgo+ID4gPiA+ID4gPiA+ID4gPiBhCj4gPiA+ID4gPiA+ID4gPiA+IHJlLQo+ID4g
PiA+ID4gPiA+ID4gPiBleHBvcnRpbmcgc2VydmVyLsKgIEkgdGhpbmsgb25lIHdheSB0byBmaXgg
aXQgbWlnaHQgYmUKPiA+ID4gPiA+ID4gPiA+ID4ganVzdAo+ID4gPiA+ID4gPiA+ID4gPiB0byBh
bGxvdyB0aGUgcmUtIGV4cG9ydCBzZXJ2ZXIgdG8gcGFzcyBhbG9uZyByZWNsYWltcwo+ID4gPiA+
ID4gPiA+ID4gPiB0bwo+ID4gPiA+ID4gPiA+ID4gPiB0aGUgb3JpZ2luYWwgc2VydmVyIGFzIGl0
IHJlY2VpdmVzIHRoZW0gZnJvbSBpdHMgb3duCj4gPiA+ID4gPiA+ID4gPiA+IGNsaWVudHMuwqAg
SXQgbWlnaHQgcmVxdWlyZSBzb21lIHByb3RvY29sIHR3ZWFrcywgSSdtCj4gPiA+ID4gPiA+ID4g
PiA+IG5vdAo+ID4gPiA+ID4gPiA+ID4gPiBzdXJlLsKgIEknbGwgdHJ5IHRvIGdldCBteSB0aG91
Z2h0cyBpbiBvcmRlciBhbmQKPiA+ID4gPiA+ID4gPiA+ID4gcHJvcG9zZQo+ID4gPiA+ID4gPiA+
ID4gPiBzb21ldGhpbmcuCj4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+ID4gPiBJdCdzIG1vcmUgY29tcGxpY2F0ZWQgdGhhbiB0aGF0LiBJZiB0aGUgcmUtZXhw
b3J0aW5nCj4gPiA+ID4gPiA+ID4gPiBzZXJ2ZXIKPiA+ID4gPiA+ID4gPiA+IHJlYm9vdHMsIGJ1
dCB0aGUgb3JpZ2luYWwgc2VydmVyIGRvZXMgbm90LCB0aGVuIHVubGVzcwo+ID4gPiA+ID4gPiA+
ID4gdGhhdAo+ID4gPiA+ID4gPiA+ID4gcmUtIGV4cG9ydGluZyBzZXJ2ZXIgcGVyc2lzdGVkIGl0
cyBsZWFzZSBhbmQgYSBmdWxsIHNldAo+ID4gPiA+ID4gPiA+ID4gb2YKPiA+ID4gPiA+ID4gPiA+
IHN0YXRlaWRzIHNvbWV3aGVyZSwgaXQgd2lsbCBub3QgYmUgYWJsZSB0byBhdG9taWNhbGx5Cj4g
PiA+ID4gPiA+ID4gPiByZWNsYWltIGRlbGVnYXRpb24gYW5kIGxvY2sgc3RhdGUgb24gdGhlIHNl
cnZlciBvbgo+ID4gPiA+ID4gPiA+ID4gYmVoYWxmIG9mCj4gPiA+ID4gPiA+ID4gPiBpdHMgY2xp
ZW50cy4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBCeSBzZW5kaW5nIHJlY2xhaW1zIHRv
IHRoZSBvcmlnaW5hbCBzZXJ2ZXIsIEkgbWVhbgo+ID4gPiA+ID4gPiA+IGxpdGVyYWxseQo+ID4g
PiA+ID4gPiA+IHNlbmRpbmcgbmV3IG9wZW4gYW5kIGxvY2sgcmVxdWVzdHMgd2l0aCB0aGUgUkVD
TEFJTSBiaXQKPiA+ID4gPiA+ID4gPiBzZXQsCj4gPiA+ID4gPiA+ID4gd2hpY2ggd291bGQgZ2V0
IGJyYW5kIG5ldyBzdGF0ZWlkcy4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBTbywgdGhl
IG9yaWdpbmFsIHNlcnZlciB3b3VsZCBpbnZhbGlkYXRlIHRoZSBleGlzdGluZwo+ID4gPiA+ID4g
PiA+IGNsaWVudCdzCj4gPiA+ID4gPiA+ID4gcHJldmlvdXMgY2xpZW50aWQgYW5kIHN0YXRlaWRz
LS1qdXN0IGFzIGl0IG5vcm1hbGx5IHdvdWxkCj4gPiA+ID4gPiA+ID4gb24KPiA+ID4gPiA+ID4g
PiByZWJvb3QtLWJ1dCBpdCB3b3VsZCBvcHRpb25hbGx5IHJlbWVtYmVyIHRoZSB1bmRlcmx5aW5n
Cj4gPiA+ID4gPiA+ID4gbG9ja3MKPiA+ID4gPiA+ID4gPiBoZWxkIGJ5IHRoZSBjbGllbnQgYW5k
IGFsbG93IGNvbXBhdGlibGUgbG9jayByZWNsYWltcy4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gPiBSb3VnaCBhdHRlbXB0Ogo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiA+IGh0dHBzOi8vd2lraS5saW51eC1uZnMub3JnL3dpa2kvaW5kZXgucGhwL1JlYm9vdF9y
ZWNvdmVyeV9mb3JfCj4gPiA+ID4gPiA+ID4gcmUtZXhwb3IKPiA+ID4gPiA+ID4gPiB0X3NlcnZl
cnMKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBUaGluayBpdCB3b3VsZCBmbHk/Cj4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiBTbyB0aGlzIHdvdWxkIGJlIGEgdmFyaWFudCBvZiBjb3VydGVz
eSBsb2NrcyB0aGF0IGNhbiBiZQo+ID4gPiA+ID4gPiByZWNsYWltZWQgYnkgdGhlIGNsaWVudCB1
c2luZyB0aGUgcmVib290IHJlY2xhaW0gdmFyaWFudCBvZgo+ID4gPiA+ID4gPiBPUEVOL0xPQ0sg
b3V0c2lkZSB0aGUgZ3JhY2UgcGVyaW9kPyBUaGUgcHVycG9zZSBiZWluZyB0bwo+ID4gPiA+ID4g
PiBhbGxvdwo+ID4gPiA+ID4gPiByZWNsYWltIHdpdGhvdXQgZm9yY2luZyB0aGUgY2xpZW50IHRv
IHBlcnNpc3QgdGhlIG9yaWdpbmFsCj4gPiA+ID4gPiA+IHN0YXRlaWQ/Cj4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiBIbW0uLi4gVGhhdCdzIGRvYWJsZSwgYnV0IGhvdyBhYm91dCB0aGUgZm9sbG93
aW5nCj4gPiA+ID4gPiA+IGFsdGVybmF0aXZlOgo+ID4gPiA+ID4gPiBBZGQKPiA+ID4gPiA+ID4g
YSBmdW5jdGlvbgo+ID4gPiA+ID4gPiB0aGF0IGFsbG93cyB0aGUgY2xpZW50IHRvIHJlcXVlc3Qg
dGhlIGZ1bGwgbGlzdCBvZiBzdGF0ZWlkcwo+ID4gPiA+ID4gPiB0aGF0Cj4gPiA+ID4gPiA+IHRo
ZSBzZXJ2ZXIgaG9sZHMgb24gaXRzIGJlaGFsZj8KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEkn
dmUgYmVlbiB3YW50aW5nIHN1Y2ggYSBmdW5jdGlvbiBmb3IgcXVpdGUgYSB3aGlsZSBhbnl3YXkK
PiA+ID4gPiA+ID4gaW4KPiA+ID4gPiA+ID4gb3JkZXIgdG8gYWxsb3cgdGhlIGNsaWVudCB0byBk
ZXRlY3Qgc3RhdGUgbGVha3MgKGVpdGhlciBkdWUKPiA+ID4gPiA+ID4gdG8KPiA+ID4gPiA+ID4g
c29mdCB0aW1lb3V0cywgb3IgZHVlIHRvIHJlb3JkZXJlZCBjbG9zZS9vcGVuIG9wZXJhdGlvbnMp
Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBPaCwgdGhhdCBzb3VuZHMgaW50ZXJlc3RpbmcuIFNvIGJh
c2ljYWxseSB0aGUgcmUtZXhwb3J0Cj4gPiA+ID4gPiBzZXJ2ZXIKPiA+ID4gPiA+IHdvdWxkIHJl
LXBvcHVsYXRlIGl0J3Mgc3RhdGUgZnJvbSB0aGUgb3JpZ2luYWwgc2VydmVyIHJhdGhlcgo+ID4g
PiA+ID4gdGhhbgo+ID4gPiA+ID4gcmVseWluZyBvbiBpdCdzIGNsaWVudHMgZG9pbmcgcmVjbGFp
bXM/IEhtbSwgYnV0IGhvdyBkb2VzIHRoZQo+ID4gPiA+ID4gcmUtZXhwb3J0IHNlcnZlciByZWJ1
aWxkIGl0cyBzdGF0ZWlkcz8gSSBndWVzcyBpdCBjb3VsZCBtYWtlCj4gPiA+ID4gPiB0aGUKPiA+
ID4gPiA+IGNsaWVudHMgcmVwb3B1bGF0ZSB0aGVtIHdpdGggdGhlIHNhbWUgImdpdmUgbWUgYSBk
dW1wIG9mIGFsbAo+ID4gPiA+ID4gbXkKPiA+ID4gPiA+IHN0YXRlIiwgdXNpbmcgdGhlIHN0YXRl
IGRldGFpbHMgdG8gbWF0Y2ggdXAgd2l0aCB0aGUgb2xkCj4gPiA+ID4gPiBzdGF0ZSBhbmQKPiA+
ID4gPiA+IHJlcGxhY2luZyBzdGF0ZWlkcy4gT3IgZGlkIHlvdSBoYXZlIHNvbWV0aGluZyBkaWZm
ZXJlbnQgaW4KPiA+ID4gPiA+IG1pbmQ/Cj4gPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBJIHdh
cyB0aGlua2luZyB0aGF0IHRoZSByZS1leHBvcnQgc2VydmVyIGNvdWxkIGp1c3QgdXNlIHRoYXQK
PiA+ID4gPiBsaXN0IG9mCj4gPiA+ID4gc3RhdGVpZHMgdG8gZmlndXJlIG91dCB3aGljaCBsb2Nr
cyBjYW4gYmUgcmVjbGFpbWVkIGF0b21pY2FsbHksCj4gPiA+ID4gYW5kCj4gPiA+ID4gd2hpY2gg
b25lcyBoYXZlIGJlZW4gaXJyZWRlZW1hYmx5IGxvc3QuIFRoZSBhc3N1bXB0aW9uIGlzIHRoYXQK
PiA+ID4gPiBpZgo+ID4gPiA+IHlvdSBoYXZlIGEgbG9jayBzdGF0ZWlkIG9yIGEgZGVsZWdhdGlv
biwgdGhlbiB0aGF0IG1lYW5zIHRoZQo+ID4gPiA+IGNsaWVudHMKPiA+ID4gPiBjYW4gcmVjbGFp
bSBhbGwgdGhlIGxvY2tzIHRoYXQgd2VyZSByZXByZXNlbnRlZCBieSB0aGF0Cj4gPiA+ID4gc3Rh
dGVpZC4KPiA+ID4gCj4gPiA+IEknbSBjb25mdXNlZCBhYm91dCBob3cgdGhlIHJlLWV4cG9ydCBz
ZXJ2ZXIgdXNlcyB0aGF0IGxpc3QuwqAgQXJlCj4gPiA+IHlvdQo+ID4gPiBhc3N1bWluZyBpdCBw
ZXJzaXN0ZWQgaXRzIG93biBsaXN0IGFjcm9zcyBpdHMgb3duIGNyYXNoL3JlYm9vdD/CoAo+ID4g
PiBJCj4gPiA+IGd1ZXNzIHRoYXQncyB3aGF0IEkgd2FzIHRyeWluZyB0byBhdm9pZCBoYXZpbmcg
dG8gZG8uCj4gPiA+IAo+ID4gTm8uIFRoZSBzZXJ2ZXIganVzdCB1c2VzIHRoZSBzdGF0ZWlkcyBh
cyBwYXJ0IG9mIGEgY2hlY2sgZm9yICdkbyBJCj4gPiBob2xkIHN0YXRlIGZvcgo+ID4gdGhpcyBm
aWxlIG9uIHRoaXMgc2VydmVyPycuIElmIHRoZSBhbnN3ZXIgaXMgJ3llcycgYW5kIHRoZSBsb2Nr
Cj4gPiBvd25lcnMgYXJlIHNhbmUsIHRoZW4KPiA+IHdlIHNob3VsZCBiZSBhYmxlIHRvIGFzc3Vt
ZSB0aGUgZnVsbCBzZXQgb2YgbG9ja3MgdGhhdCBsb2NrIG93bmVyCj4gPiBoZWxkIG9uIHRoYXQK
PiA+IGZpbGUgYXJlIHN0aWxsIHZhbGlkLgo+ID4gCj4gPiBCVFc6IGlmIHRoZSBsb2NrIG93bmVy
IGlzIGFsc28gcmV0dXJuZWQgYnkgdGhlIHNlcnZlciwgdGhlbiBzaW5jZQo+ID4gdGhlIGxvY2sg
b3duZXIKPiA+IGlzIGFuIG9wYXF1ZSB2YWx1ZSwgaXQgY291bGQsIGZvciBpbnN0YW5jZSwgYmUg
dXNlZCBieSB0aGUgY2xpZW50Cj4gPiB0byBjYWNoZSBpbmZvIG9uCj4gPiB0aGUgc2VydmVyIGFi
b3V0IHdoaWNoIHVpZC9naWQgb3ducyB0aGVzZSBsb2Nrcy4KPiAKPiBMZXQgbWUgc2VlIGlmIEkn
bSB1bmRlcnN0YW5kaW5nIHlvdXIgaWRlYSByaWdodC4uLgo+IAo+IFJlLWV4cG9ydCBzZXJ2ZXIg
cmVib290cyB3aXRoaW4gdGhlIGV4dGVuZGVkIGxlYXNlIHBlcmlvZCBpdCdzIGJlZW4KPiBnaXZl
biBieSB0aGUgb3JpZ2luYWwgc2VydmVyLiBJJ20gYXNzdW1pbmcgaXQgdXNlcyB0aGUgc2FtZSBj
bGllbnRpZD8KClllcy4gSXQgd291bGQgaGF2ZSB0byB1c2UgdGhlIHNhbWUgY2xpZW50aWQuCgo+
IEJ1dCB3b3VsZCBwcm9iYWJseSBvcGVuIG5ldyBzZXNzaW9ucy4gSXQgcmVxdWVzdHMgdGhlIGxp
c3Qgb2YKPiBzdGF0ZWlkcy4gSG1tLCBob3cgdG8gbWFrZSB0aGUgb3duZXIgaW5mb3JtYXRpb24g
dXNlZnVsLCBuZnMtZ2FuZXNoYQo+IGRvZXNuJ3QgcGFzcyBvbiB0aGUgYWN0dWFsIGNsaWVudCdz
IG93bmVyIGJ1dCByYXRoZXIganVzdCBwYXNzZXMgdGhlCj4gYWRkcmVzcyBvZiBpdHMgcmVjb3Jk
IGZvciB0aGF0IGNsaWVudCBvd25lci4gTWF5YmUgaXQgd2lsbCBoYXZlIHRvIGRvCj4gc29tZXRo
aW5nIGEgYml0IGRpZmZlcmVudCBmb3IgdGhpcyBkZWdyZWUgb2YgcmUtZXhwb3J0IHN1cHBvcnQu
Li4KPiAKPiBOb3cgdGhlIHJlLWV4cG9ydCBzZXJ2ZXIga25vd3Mgd2hpY2ggb3JpZ2luYWwgY2xp
ZW50IGxvY2sgb3duZXJzIGFyZQo+IGFsbG93ZWQgdG8gcmVjbGFpbSBzdGF0ZS4gU28gaXQganVz
dCBhY3F1aXJlcyBsb2NrcyB1c2luZyB0aGUKPiBvcmlnaW5hbCBzdGF0ZWlkIGFzIHRoZSBjbGll
bnQgcmVjbGFpbXMgKHdoYXQgaGFwcGVucyBpZiB0aGUgY2xpZW50Cj4gZG9lc24ndCByZWNsYWlt
IGEgbG9jaz8gSSBzdXBwb3NlIHRoZSByZS1leHBvcnQgc2VydmVyIGNvdWxkIHVubG9jawo+IGFs
bCByZWdpb25zIG5vdCBleHBsaWNpdGx5IGxvY2tlZCBvbmNlIHJlY2xhaW0gaXMgY29tcGxldGUp
LiBTaW5jZQo+IHRoZSByZS1leHBvcnQgc2VydmVyIGlzIGFjcXVpcmluZyBuZXcgbG9ja3MgdXNp
bmcgdGhlIG9yaWdpbmFsCj4gc3RhdGVpZCBpdCB3aWxsIGp1c3Qgb3ZlcmxheSB0aGUgb3JpZ2lu
YWwgbG9jayB3aXRoIHRoZSBuZXcgbG9jayBhbmQKPiB3cml0ZSBsb2NrcyBkb24ndCBjb25mbGlj
dCBzaW5jZSB0aGV5IGFyZSBiZWluZyBhY3F1aXJlZCBieSB0aGUgc2FtZQo+IGxvY2sgb3duZXIu
IEFjdHVhbGx5IHRoZSBvcmlnaW5hbCBzZXJ2ZXIgY291bGQgZXZlbiBiYWxrIGF0IGEKPiAicmVj
bGFpbSIgaW4gdGhpcyB3YXkgdGhhdCB3YXNuJ3Qgb3JpZ2luYWxseSBoZWxkLi4uIEFuZCB0aGUg
b3JpZ2luYWwKPiBzZXJ2ZXIgY291bGQgInJlZnJlc2giIHRoZSBsb2NrcywgYW5kIGRpc2NhcmQg
YW55IHRoYXQgYXJlbid0Cj4gcmVmcmVzaGVkIGF0IHRoZSBlbmQgb2YgcmVjbGFpbS4gVGhhdCBw
YXJ0IGFzc3VtZXMgdGhlIG9yaWdpbmFsCj4gc2VydmVyIGlzIGFwcHJpc2VkIHRoYXQgd2hhdCBp
cyBhY3R1YWxseSBoYXBwZW5pbmcgaXMgYSByZWNsYWltLgo+IAo+IFRoZSByZS1leHBvcnQgc2Vy
dmVyIGNhbiBkZXN0cm95IGFueSBzdGF0ZWlkcyB0aGF0IGl0IGRvZXNuJ3QgcmVjZWl2ZQo+IHJl
Y2xhaW1zIGZvci4KClJpZ2h0LiBUaGF0J3MgaW4gZXNzZW5jZSB3aGF0IEknbSBzdWdnZXN0aW5n
LiBUaGVyZSBhcmUgY29ybmVyIGNhc2VzIHRvCmJlIGNvbnNpZGVyZWQ6IGUuZy4gIndoYXQgaGFw
cGVucyBpZiB0aGUgcmUtZXhwb3J0IHNlcnZlciBjcmFzaGVzIGFmdGVyCnVubG9ja2luZyBvbiB0
aGUgc2VydmVyLCBidXQgYmVmb3JlIHBhc3NpbmcgdGhlIExPQ0tVIHJlcGx5IG9uIHRoZSB0aGUK
Y2xpZW50IiwgaG93ZXZlciBJIHRoaW5rIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBmaWd1cmUg
b3V0IHN0cmF0ZWdpZXMKZm9yIHRob3NlIGNhc2VzLgoKPiAKPiBIbW0sIEkgdGhpbmsgaWYgdGhl
IHJlLWV4cG9ydCBzZXJ2ZXIgaXMgaW1wbGVtZW50ZWQgYXMgYW4gSEEgY2x1c3RlciwKPiBpdCBz
aG91bGQgZXN0YWJsaXNoIGEgY2xpZW50aWQgb24gdGhlIG9yaWdpbmFsIHNlcnZlciBmb3IgZWFj
aAo+IHZpcnR1YWwgSVAgKGFzc3VtaW5nIHRoYXQncyB0aGUgdW5pdCBvZiBIQSnCoCB0aGF0IGV4
aXN0cy4gVGhlbiB3aGVuCj4gdmlydHVhbCBJUHMgYXJlIG1vdmVkLCB0aGUgcmUtZXhwb3J0IHNl
cnZlciBqdXN0IGdvZXMgdGhyb3VnaCB0aGUKPiBhYm92ZSByZWNsYWltIHByb2Nlc3MgZm9yIHRo
YXQgY2xpZW50aWQuCj4gCgpZZXMsIHdlIGNvdWxkIGRvIHNvbWV0aGluZyBsaWtlIHRoYXQuCgot
LSAKVHJvbmQgTXlrbGVidXN0CkxpbnV4IE5GUyBjbGllbnQgbWFpbnRhaW5lciwgSGFtbWVyc3Bh
Y2UKdHJvbmQubXlrbGVidXN0QGhhbW1lcnNwYWNlLmNvbQoKCgotLQpMaW51eC1jYWNoZWZzIG1h
aWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnM=

