Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 98B6F2CE4B1
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Dec 2020 02:05:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-T-J8nPiLMoWCggLp1fd_zQ-1; Thu, 03 Dec 2020 20:05:39 -0500
X-MC-Unique: T-J8nPiLMoWCggLp1fd_zQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 461D5107ACE6;
	Fri,  4 Dec 2020 01:05:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 641B01001B2C;
	Fri,  4 Dec 2020 01:05:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E4CEE5002D;
	Fri,  4 Dec 2020 01:05:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B412SFs026169 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 20:02:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 622342027144; Fri,  4 Dec 2020 01:02:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C7692026D3E
	for <linux-cachefs@redhat.com>; Fri,  4 Dec 2020 01:02:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2457F185A794
	for <linux-cachefs@redhat.com>; Fri,  4 Dec 2020 01:02:26 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam11on2130.outbound.protection.outlook.com [40.107.223.130])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-419-y51UX21ANKK7_xfpwHW_TA-1; Thu, 03 Dec 2020 20:02:23 -0500
X-MC-Unique: y51UX21ANKK7_xfpwHW_TA-1
Received: from MN2PR13MB3957.namprd13.prod.outlook.com (2603:10b6:208:263::11)
	by MN2PR13MB3661.namprd13.prod.outlook.com (2603:10b6:208:1ed::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.9;
	Fri, 4 Dec 2020 01:02:20 +0000
Received: from MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e989:f666:131a:e210]) by
	MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e989:f666:131a:e210%9]) with mapi id 15.20.3632.016;
	Fri, 4 Dec 2020 01:02:20 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "bfields@fieldses.org" <bfields@fieldses.org>
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: fNDm/l4o9cYx5Rz5g0S1EO4zMAtIR4tJDJwAAAWCe4BeKhpLVGiQL7pUtKchSdvFeTqNAIAEhEYAgBNavQCAAAtBAIABTyGAgAxAb4CAAG0ggIAAGvSAgAAMzwCAAAXZAIAAE9IAgAACQQCAAAaSgIAAHXOA
Date: Fri, 4 Dec 2020 01:02:20 +0000
Message-ID: <136e9c309ad962cb247b9e696633484db76d1f3b.camel@hammerspace.com>
References: <1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
	<20201203185109.GB27931@fieldses.org>
	<4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
	<20201203211328.GC27931@fieldses.org>
	<9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
	<20201203224520.GG27931@fieldses.org>
	<d88c69f90820bf631908cbe3d3ce34343ec672f1.camel@hammerspace.com>
	<20201203231655.GH27931@fieldses.org>
In-Reply-To: <20201203231655.GH27931@fieldses.org>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ca2c09f-95a7-43fb-aa16-08d897f04099
x-ms-traffictypediagnostic: MN2PR13MB3661:
x-microsoft-antispam-prvs: <MN2PR13MB36610A6CCECAEB58C06E5B8EB8F10@MN2PR13MB3661.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: j8PeVy9TsPDVm3QNNP0M/JRjndkRc36jTrA8gMQ++iNd7IG+RcCyB4OoQ2hHxB0xS8xDU9QIZPo9gLLhIbsSxqYCVKr5Clhkj6hjLBwMQKcji7xvKVCuWkjc6WLXkK9XD0PA1vSVC1u0TAy97DwVj4pspAUw/9bv7MuC/Qoq5+ppwWU8yEv/8f8uMGxwwmakfemgs1viPhuxREABcd0bIBKi9t+1hfCxFZ5Emh4DP8+ZMOBAgdkUIIqrArsYJ3QUNNMgpnnrD8Aj8K7st6HvtrSvV+CkTqVR8jfZBY83GEXRXQDGgTLw5jEpd7W0QBs8rdOAS82X3JZIuGB8gDCJcQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MN2PR13MB3957.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(346002)(376002)(39840400004)(396003)(366004)(136003)(64756008)(2906002)(91956017)(54906003)(76116006)(5660300002)(2616005)(66446008)(6916009)(66476007)(71200400001)(316002)(6512007)(8936002)(66556008)(86362001)(66946007)(186003)(26005)(8676002)(83380400001)(4326008)(478600001)(6486002)(36756003)(6506007);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?utf-8?B?TzFkZ2NISWlKaWlsWUlyTklKTHVlbnZHSG1ZOFlsbWhEOXN0TFBrOUh6emh1?=
	=?utf-8?B?aUFWUldZcUNkaFJZVnlnVTlBTkM0NDdZV2dPU2pqUVUvR1liMFdPMUpDNW9h?=
	=?utf-8?B?SGhvUEZYTnc1K3daRXdzZmVnUGc1V3p5OEdXMFVVK0VPUGVxZmhBL2NqMjRk?=
	=?utf-8?B?d1ZqN0NYK0hDdnp1NnlNNXl1djY5aTcxUzNLWHkvQUxMLzBwcmxEY051S2ls?=
	=?utf-8?B?cTdGVGlSZTFjem1oMWlnaDFqVmc5bDNUMlJKYXJMdFBBa3VCdnJZRGdjYmQr?=
	=?utf-8?B?VUkyNkJVcWlUNXV1V001blZreHFJcnVRYVlLdlRVYk9Rb1l3Tmp3b0hYR2Jn?=
	=?utf-8?B?S2FmS1U5WVU3dXlpZkMzMGIxdENwa3AxU3krek5lYVBycVlWOE5uV3hEdVlS?=
	=?utf-8?B?Zk1xUjE1c0hOUEpBUCt4cmZISk5aWk5mVkgvUUw0ZUo2OTNDZXp3bkx2OVo3?=
	=?utf-8?B?L25sVUNzK0NtT0dLRGhYcS92VXJURWQwelJTWnBmNGRIUndkbmhkbTFnSUlC?=
	=?utf-8?B?MTJUOFZKck1iSnduM3NyRzFab2R5SjFUNCt1OXpqL1ZrbjVOMEVhbjJVTjJt?=
	=?utf-8?B?cnVOUU51dGlDNC9LS05kT1BjMURjUjJHNUd1dUI0azZpV3JNNTBJRDRPQW1s?=
	=?utf-8?B?aFBST1NzTnZVMGZYNHVIcmVjM3hpS25JQzdxMXBFaXkvV3ErOTRQbS9ZVmUv?=
	=?utf-8?B?Q1hnTHNUSEIreUptR1lCalhWY1R2ZXVOSGRSVUhxMkY5TjlhQTliRGdtM2k1?=
	=?utf-8?B?WVY3S1ZxcmpJZUw0cW5pZkZ6UnI3a2QyQXJLNWE1d1BROFhENGEzYmxHYWFY?=
	=?utf-8?B?dVZzRVEyTjVWRHBwWmxnL0w0VXV3T281S293cDBhMnIwckRyNjYveGFhV1BW?=
	=?utf-8?B?Z0lvR2JCa29zL2paWnc5LzJSNjQwc0llcGEvb1FuRFNpZUROSGdUb3d0ZzRD?=
	=?utf-8?B?WmpPaDlObjZ5RzMxbDEvOGhFSEprTXRTK25iSHRNeW9jeUZhKzlqQmk0NGpM?=
	=?utf-8?B?UHZyVU0relN4SDNvTVI3a0NicmQ2NU9JYU1kU0ppWXQ2UCtnUUlrL2lFWC9X?=
	=?utf-8?B?Tnh6Nkszb3ZUK3hCUEJubFpLVk8wNnZkMi9OTVhWd0N1TktZdVVFU01rSTd1?=
	=?utf-8?B?ZWluSGljQUx3MlBmMUtsMUtld1NlWUhiMWJUYUdwbDNidEdlQS82c2kvMnBn?=
	=?utf-8?B?VXRsVzhhRldBck9WcW9JM2h4akxZVURQR3lPSUU0YlUyQTJoakdEYTJQWHFH?=
	=?utf-8?B?di8rdnNNY2xjc01Ncm9SQ2RwYkpYRk5kQ3g3d0FqTkFHZVZHWHBranRWd3Yx?=
	=?utf-8?Q?GF23ogQwUszCETa5ur1cWfbjkX+y23gQqx?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3957.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca2c09f-95a7-43fb-aa16-08d897f04099
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2020 01:02:20.3199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GjMV1yGohh3yPmhwMirhxadRkNKuvxSnvj//srCfrHHX3g1RaTf1yjUmaI89SlxObiLuvHlVy1hOT81GNvHpYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3661
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B412SFs026169
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <0D936D568442E94781D378587D387304@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTEyLTAzIGF0IDE4OjE2IC0wNTAwLCBiZmllbGRzQGZpZWxkc2VzLm9yZyB3
cm90ZToKPiBPbiBUaHUsIERlYyAwMywgMjAyMCBhdCAxMDo1MzoyNlBNICswMDAwLCBUcm9uZCBN
eWtsZWJ1c3Qgd3JvdGU6Cj4gPiBPbiBUaHUsIDIwMjAtMTItMDMgYXQgMTc6NDUgLTA1MDAsIGJm
aWVsZHNAZmllbGRzZXMub3JnwqB3cm90ZToKPiA+ID4gT24gVGh1LCBEZWMgMDMsIDIwMjAgYXQg
MDk6MzQ6MjZQTSArMDAwMCwgVHJvbmQgTXlrbGVidXN0IHdyb3RlOgo+ID4gPiA+IEkndmUgYmVl
biB3YW50aW5nIHN1Y2ggYSBmdW5jdGlvbiBmb3IgcXVpdGUgYSB3aGlsZSBhbnl3YXkgaW4KPiA+
ID4gPiBvcmRlciB0byBhbGxvdyB0aGUgY2xpZW50IHRvIGRldGVjdCBzdGF0ZSBsZWFrcyAoZWl0
aGVyIGR1ZSB0bwo+ID4gPiA+IHNvZnQgdGltZW91dHMsIG9yIGR1ZSB0byByZW9yZGVyZWQgY2xv
c2Uvb3BlbiBvcGVyYXRpb25zKS4KPiA+ID4gCj4gPiA+IE9uZSBzdXJlIHdheSB0byBmaXggYW55
IHN0YXRlIGxlYWtzIGlzIHRvIHJlYm9vdCB0aGUgc2VydmVyLsKgIFRoZQo+ID4gPiBzZXJ2ZXIg
dGhyb3dzIGV2ZXJ5dGhpbmcgYXdheSwgdGhlIGNsaWVudHMgcmVjbGFpbSwgYWxsIHRoYXQncwo+
ID4gPiBsZWZ0Cj4gPiA+IGlzIHN0dWZmIHRoZXkgc3RpbGwgYWN0dWFsbHkgY2FyZSBhYm91dC4K
PiA+ID4gCj4gPiA+IEl0J3MgdmVyeSBkaXNydXB0aXZlLgo+ID4gPiAKPiA+ID4gQnV0IHlvdSBj
b3VsZCBkbyBhIGxpbWl0ZWQgdmVyc2lvbiBvZiB0aGF0OiB0aGUgc2VydmVyIHRocm93cwo+ID4g
PiBhd2F5Cj4gPiA+IHRoZSBzdGF0ZSBmcm9tIG9uZSBjbGllbnQgKGtlZXBpbmcgdGhlIHVuZGVy
bHlpbmcgbG9ja3Mgb24gdGhlCj4gPiA+IGV4cG9ydGVkIGZpbGVzeXN0ZW0pLCBsZXRzIHRoZSBj
bGllbnQgZ28gdGhyb3VnaCBpdHMgbm9ybWFsCj4gPiA+IHJlY2xhaW0KPiA+ID4gcHJvY2Vzcywg
YXQgdGhlIGVuZCBvZiB0aGF0IHRocm93cyBhd2F5IGFueXRoaW5nIHRoYXQgd2Fzbid0Cj4gPiA+
IHJlY2xhaW1lZC7CoCBUaGUgb25seSBkZWxheSBpcyB0byBhbnlvbmUgdHJ5aW5nIHRvIGFjcXVp
cmUgbmV3Cj4gPiA+IGxvY2tzCj4gPiA+IHRoYXQgY29uZmxpY3Qgd2l0aCB0aGF0IHNldCBvZiBs
b2NrcywgYW5kIG9ubHkgZm9yIGFzIGxvbmcgYXMgaXQKPiA+ID4gdGFrZXMgZm9yIHRoZSBvbmUg
Y2xpZW50IHRvIHJlY2xhaW0uCj4gPiAKPiA+IE9uZSBjb3VsZCBkbyB0aGF0LCBidXQgdGhhdCBy
ZXF1aXJlcyB0aGUgZXhpc3RlbmNlIG9mIGEgcXVpZXNjZW50Cj4gPiBwZXJpb2Qgd2hlcmUgdGhl
IGNsaWVudCBob2xkcyBubyBzdGF0ZSBhdCBhbGwgb24gdGhlIHNlcnZlci4KPiAKPiBObywgYXMg
SSBzYWlkLCB0aGUgY2xpZW50IHBlcmZvcm1zIHJlYm9vdCByZWNvdmVyeSBmb3IgYW55IHN0YXRl
IHRoYXQKPiBpdAo+IGhvbGRzIHdoZW4gd2UgZG8gdGhpcy4KPiAKCkhtbS4uLiBTbyBob3cgZG8g
dGhlIGNsaWVudCBhbmQgc2VydmVyIGNvb3JkaW5hdGUgd2hhdCBjYW4gYW5kIGNhbm5vdApiZSBy
ZWNsYWltZWQ/IFRoZSBpc3N1ZSBpcyB0aGF0IHJhY2VzIGNhbiB3b3JrIGJvdGggd2F5cywgd2l0
aCB0aGUKY2xpZW50IHNvbWV0aW1lcyBiZWxpZXZpbmcgdGhhdCBpdCBob2xkcyBhIGxheW91dCBv
ciBhIGRlbGVnYXRpb24gdGhhdAp0aGUgc2VydmVyIHRoaW5rcyBpdCBoYXMgcmV0dXJuZWQuIElm
IHRoZSBzZXJ2ZXIgYWxsb3dzIGEgcmVjbGFpbSBvZgpzdWNoIGEgZGVsZWdhdGlvbiwgdGhlbiB0
aGF0IGNvdWxkIGJlIHByb2JsZW1hdGljIChiZWNhdXNlIGl0IGJyZWFrcwpsb2NrIGF0b21pY2l0
eSBvbiB0aGUgY2xpZW50IGFuZCBiZWNhdXNlIGl0IG1heSBjYXVzZSBjb25mbGljdHMpLgoKQnkg
dGhlIHdheSwgdGhlIG90aGVyIHRoaW5nIHRoYXQgSSdkIGxpa2UgdG8gYWRkIHRvIG15IHdpc2hs
aXN0IGlzIGEKY2FsbGJhY2sgdGhhdCBhbGxvd3MgdGhlIHNlcnZlciB0byBhc2sgdGhlIGNsaWVu
dCBpZiBpdCBzdGlsbCBob2xkcyBhCmdpdmVuIG9wZW4gb3IgbG9jayBzdGF0ZWlkLiBBIHNlcnZl
ciBjYW4gcmVjYWxsIGEgZGVsZWdhdGlvbiBvciBhCmxheW91dCwgc28gaXQgY2FuIGZpeCB1cCBs
ZWFrcyBvZiB0aG9zZSwgaG93ZXZlciBpdCBoYXMgbm8gcmVtZWR5IGlmCnRoZSBjbGllbnQgbG9z
ZXMgYW4gb3BlbiBvciBsb2NrIHN0YXRlaWQgb3RoZXIgdGhhbiB0byBwb3NzaWJseQpmb3JjaWJs
eSByZXZva2Ugc3RhdGUuIFRoYXQgY291bGQgY2F1c2UgYXBwbGljYXRpb24gY3Jhc2hlcyBpZiB0
aGUKc2VydmVyIG1ha2VzIGEgbWlzdGFrZSBhbmQgcmV2b2tlcyBhIGxvY2sgdGhhdCBpcyBhY3R1
YWxseSBpbiB1c2UuCgotLSAKVHJvbmQgTXlrbGVidXN0CkxpbnV4IE5GUyBjbGllbnQgbWFpbnRh
aW5lciwgSGFtbWVyc3BhY2UKdHJvbmQubXlrbGVidXN0QGhhbW1lcnNwYWNlLmNvbQoKCgotLQpM
aW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6
Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnM=

