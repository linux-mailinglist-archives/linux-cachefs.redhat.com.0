Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3BC2CE5B1
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Dec 2020 03:27:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-bFs3M52RMQqGkxen6lN0lQ-1; Thu, 03 Dec 2020 21:27:23 -0500
X-MC-Unique: bFs3M52RMQqGkxen6lN0lQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96027107ACE4;
	Fri,  4 Dec 2020 02:27:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D23F1349A;
	Fri,  4 Dec 2020 02:27:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5CB535002E;
	Fri,  4 Dec 2020 02:27:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B42RDEr004928 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 21:27:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BC8582166B2B; Fri,  4 Dec 2020 02:27:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B62292166B27
	for <linux-cachefs@redhat.com>; Fri,  4 Dec 2020 02:27:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97AEE185A7BC
	for <linux-cachefs@redhat.com>; Fri,  4 Dec 2020 02:27:10 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam12on2125.outbound.protection.outlook.com [40.107.237.125])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-212-dqoC1-gWMdiVGWK7sYLjnQ-1; Thu, 03 Dec 2020 21:27:08 -0500
X-MC-Unique: dqoC1-gWMdiVGWK7sYLjnQ-1
Received: from MN2PR13MB3957.namprd13.prod.outlook.com (2603:10b6:208:263::11)
	by MN2PR13MB2735.namprd13.prod.outlook.com (2603:10b6:208:f2::32)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.9;
	Fri, 4 Dec 2020 02:27:06 +0000
Received: from MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e989:f666:131a:e210]) by
	MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e989:f666:131a:e210%9]) with mapi id 15.20.3632.016;
	Fri, 4 Dec 2020 02:27:06 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "bfields@fieldses.org" <bfields@fieldses.org>
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: fNDm/l4o9cYx5Rz5g0S1EO4zMAtIR4tJDJwAAAWCe4BeKhpLVGiQL7pUtKchSdvFeTqNAIAEhEYAgBNavQCAAAtBAIABTyGAgAxAb4CAAG0ggIAAGvSAgAAMzwCAAAXZAIAAE9IAgAACQQCAAAaSgIAAHXOAgAAKzwCAAAzbgA==
Date: Fri, 4 Dec 2020 02:27:06 +0000
Message-ID: <55fc9b74ed33e08e046031515fa10532f7b46877.camel@hammerspace.com>
References: <932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
	<20201203185109.GB27931@fieldses.org>
	<4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
	<20201203211328.GC27931@fieldses.org>
	<9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
	<20201203224520.GG27931@fieldses.org>
	<d88c69f90820bf631908cbe3d3ce34343ec672f1.camel@hammerspace.com>
	<20201203231655.GH27931@fieldses.org>
	<136e9c309ad962cb247b9e696633484db76d1f3b.camel@hammerspace.com>
	<20201204014100.GI27931@fieldses.org>
In-Reply-To: <20201204014100.GI27931@fieldses.org>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 494cbd6d-b750-4d0d-7f59-08d897fc17f7
x-ms-traffictypediagnostic: MN2PR13MB2735:
x-microsoft-antispam-prvs: <MN2PR13MB2735854359EAF05F5E9300D7B8F10@MN2PR13MB2735.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: c+hKY3dB76nyrGpRVuAvxo3Y2D+HBKf+aA1/QU/mfvXPASDJ+yYo7Iubbs4a7GpWl8A34Hu3WrkBmmTlb56NkdxFCfKBPouspcxgSRZGk+RqiP7iqW3tB6T7vl1sCuTQDar5AqabJ1WXzhiUXTC6GiAlcdpCeaN32fRYtlp9RQrNTXnm+mkrfltTtehnFiJh7+TCMIuOlje9NySKLxJbz4C7/czb5sxyK2yvy6xCHaM2UkUloTqgL99nURsC2tNZ7LqG0yc0ibnndN6Bc+inbU9Nnt1XuntPrsXcak5rfLmJx6YoJwURz+dmfnkiM5zkJhwoXdBr2NfyrcxSbmCqOA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MN2PR13MB3957.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(39840400004)(136003)(346002)(366004)(376002)(396003)(4326008)(36756003)(186003)(8936002)(6486002)(26005)(6506007)(478600001)(6916009)(6512007)(8676002)(2906002)(2616005)(71200400001)(86362001)(66556008)(91956017)(66946007)(64756008)(66446008)(66476007)(76116006)(54906003)(316002)(5660300002)(83380400001);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?utf-8?B?QVVKaU1JRjV3dXA4aCtkb0EvRXBrYzJJaWVCMHBhQzVZTDdrUWYreDF3c0Zp?=
	=?utf-8?B?WWtRNnZNUEVoR2Y0bmlxZFZwTlN6VVhkUjZKTWp0T24zdTBWaEEvRk5EL243?=
	=?utf-8?B?Y3dnYnluajd4OUwrMFgzcWNrZ2xWRU1MSXBGdmRIWk9EajVvNnIxV0h5M1Rk?=
	=?utf-8?B?bGRRUFZxeTNLWFptNFBsaStuNzhOUHJMYThzOG1yamZ6L2RsY0lBMEZONjVT?=
	=?utf-8?B?eDh2VXZrWEdZbHF3Q1IrS2luUHo0ZjZWZHRtYzVQWHlNdFVtNStUZ0gxajZC?=
	=?utf-8?B?bkQyU0J0NzVRRVI5dnU0Z1pMejg5NUNDM09iTjlnTHhIUHZkMzVGc3NZd3J6?=
	=?utf-8?B?a0o0ZXJ3alBsVUpKOXd2bDdBZFZPOEFMS1N5REVHcWdMZEJnanJmczNqWkN5?=
	=?utf-8?B?d0lhb3Z0bDRwR1Izd3ltUyt1TjZiM0JYNU82dkZBZ2R1THVpUmc5aHdwRVgz?=
	=?utf-8?B?aVJHWjhzREhOam02K2dDT29nQWRKYlVLdDZ3Wmd6ZUZrMHVQU3ZmcUtaNDNX?=
	=?utf-8?B?cVBwN2doU0piWWIybGJBWG5QVGh2NVk3WmRkeW9mVEU1aC9IVGY5bDBuT0Nu?=
	=?utf-8?B?TlE1MDhtNElpa2NNd3Myb0htN3dBRlErMzlTUkFlOGU3S200REVsSXNDZGF1?=
	=?utf-8?B?Q3hJRzlVVHhaM0V1RXZYdFpnSVMxRWw2MDN6REZaQkgrUS93YzF0OW43Vi8x?=
	=?utf-8?B?cUsrM2pmK0dyN2NOdVE5V2RGQWtKS29hT1Y5MFIwUW1UZ3RWVlVraVpZUWFq?=
	=?utf-8?B?eHlyZTdTWFZXVTVPZXBEOVJmOWVqUW9vRjIzcU95REJieVUwWEttdTF1MHIy?=
	=?utf-8?B?R3ZJSU92V21CT1E2Skt0NFlXS09oMXUxdkNidk1qMDZMd3FkWTlGVTRlVENB?=
	=?utf-8?B?b0JnTkhTRk90YlhJYVBYRUM1QmhYZ1R4VGxveDc1cTFYNUwrd01IYlBVcERR?=
	=?utf-8?B?OTFLMnZ2U2dHVHNVWnNnVHp5WFJGaFk0V21Qd3RWV3hwQk5TeUNxdzBiMWIv?=
	=?utf-8?B?ay9sQ1RwaDVjUDgyR1NFWUg0Qk15czk4VkpGVWhQTmFNNHRZbm5hTmNHam9W?=
	=?utf-8?B?bGVoRG5WSU9VZU9IRU1jNlhWaEJSSmkwTmZqcFdjL1VDRWdnV29VMVZNMVY5?=
	=?utf-8?B?UzdndytHdzVCREZSYitFMk9yQ2s2ZHlBK2tPTWo5SElGZ2Eya3B4M3JVLzB1?=
	=?utf-8?B?R2p5dUk0MFdKbDBuSDdLMjhlWmhMQW9yQkVjN2pBb002U2dVK2FQUzhtK2M4?=
	=?utf-8?B?ZVVrUnVUL3hkYTd1c0VBTkUwc1h3NWJOWG9nWlJCRWJDallvVG4yQU9tR3lK?=
	=?utf-8?Q?/Ra7nXqn6i+9VrsYsb0OqoqRztQevcyito?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3957.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 494cbd6d-b750-4d0d-7f59-08d897fc17f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2020 02:27:06.1199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ECAUqtkkdCFcCnBhrlS6kf+irETNfQrFgSQtcdV9xCbNbDgekef599QBO8QePTzBLnP7YJeXKHWJeLpqQvA9dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB2735
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B42RDEr004928
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <69924AEBEED4FD4688827ECF98E3D37E@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTEyLTAzIGF0IDIwOjQxIC0wNTAwLCBiZmllbGRzQGZpZWxkc2VzLm9yZyB3
cm90ZToKPiBPbiBGcmksIERlYyAwNCwgMjAyMCBhdCAwMTowMjoyMEFNICswMDAwLCBUcm9uZCBN
eWtsZWJ1c3Qgd3JvdGU6Cj4gPiBPbiBUaHUsIDIwMjAtMTItMDMgYXQgMTg6MTYgLTA1MDAsIGJm
aWVsZHNAZmllbGRzZXMub3JnwqB3cm90ZToKPiA+ID4gT24gVGh1LCBEZWMgMDMsIDIwMjAgYXQg
MTA6NTM6MjZQTSArMDAwMCwgVHJvbmQgTXlrbGVidXN0IHdyb3RlOgo+ID4gPiA+IE9uIFRodSwg
MjAyMC0xMi0wMyBhdCAxNzo0NSAtMDUwMCwgYmZpZWxkc0BmaWVsZHNlcy5vcmfCoHdyb3RlOgo+
ID4gPiA+ID4gT24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMDk6MzQ6MjZQTSArMDAwMCwgVHJvbmQg
TXlrbGVidXN0Cj4gPiA+ID4gPiB3cm90ZToKPiA+ID4gPiA+ID4gSSd2ZSBiZWVuIHdhbnRpbmcg
c3VjaCBhIGZ1bmN0aW9uIGZvciBxdWl0ZSBhIHdoaWxlIGFueXdheQo+ID4gPiA+ID4gPiBpbgo+
ID4gPiA+ID4gPiBvcmRlciB0byBhbGxvdyB0aGUgY2xpZW50IHRvIGRldGVjdCBzdGF0ZSBsZWFr
cyAoZWl0aGVyIGR1ZQo+ID4gPiA+ID4gPiB0bwo+ID4gPiA+ID4gPiBzb2Z0IHRpbWVvdXRzLCBv
ciBkdWUgdG8gcmVvcmRlcmVkIGNsb3NlL29wZW4gb3BlcmF0aW9ucykuCj4gPiA+ID4gPiAKPiA+
ID4gPiA+IE9uZSBzdXJlIHdheSB0byBmaXggYW55IHN0YXRlIGxlYWtzIGlzIHRvIHJlYm9vdCB0
aGUgc2VydmVyLsKgCj4gPiA+ID4gPiBUaGUKPiA+ID4gPiA+IHNlcnZlciB0aHJvd3MgZXZlcnl0
aGluZyBhd2F5LCB0aGUgY2xpZW50cyByZWNsYWltLCBhbGwKPiA+ID4gPiA+IHRoYXQncwo+ID4g
PiA+ID4gbGVmdAo+ID4gPiA+ID4gaXMgc3R1ZmYgdGhleSBzdGlsbCBhY3R1YWxseSBjYXJlIGFi
b3V0Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJdCdzIHZlcnkgZGlzcnVwdGl2ZS4KPiA+ID4gPiA+
IAo+ID4gPiA+ID4gQnV0IHlvdSBjb3VsZCBkbyBhIGxpbWl0ZWQgdmVyc2lvbiBvZiB0aGF0OiB0
aGUgc2VydmVyIHRocm93cwo+ID4gPiA+ID4gYXdheQo+ID4gPiA+ID4gdGhlIHN0YXRlIGZyb20g
b25lIGNsaWVudCAoa2VlcGluZyB0aGUgdW5kZXJseWluZyBsb2NrcyBvbgo+ID4gPiA+ID4gdGhl
Cj4gPiA+ID4gPiBleHBvcnRlZCBmaWxlc3lzdGVtKSwgbGV0cyB0aGUgY2xpZW50IGdvIHRocm91
Z2ggaXRzIG5vcm1hbAo+ID4gPiA+ID4gcmVjbGFpbQo+ID4gPiA+ID4gcHJvY2VzcywgYXQgdGhl
IGVuZCBvZiB0aGF0IHRocm93cyBhd2F5IGFueXRoaW5nIHRoYXQgd2Fzbid0Cj4gPiA+ID4gPiBy
ZWNsYWltZWQuwqAgVGhlIG9ubHkgZGVsYXkgaXMgdG8gYW55b25lIHRyeWluZyB0byBhY3F1aXJl
IG5ldwo+ID4gPiA+ID4gbG9ja3MKPiA+ID4gPiA+IHRoYXQgY29uZmxpY3Qgd2l0aCB0aGF0IHNl
dCBvZiBsb2NrcywgYW5kIG9ubHkgZm9yIGFzIGxvbmcgYXMKPiA+ID4gPiA+IGl0Cj4gPiA+ID4g
PiB0YWtlcyBmb3IgdGhlIG9uZSBjbGllbnQgdG8gcmVjbGFpbS4KPiA+ID4gPiAKPiA+ID4gPiBP
bmUgY291bGQgZG8gdGhhdCwgYnV0IHRoYXQgcmVxdWlyZXMgdGhlIGV4aXN0ZW5jZSBvZiBhCj4g
PiA+ID4gcXVpZXNjZW50Cj4gPiA+ID4gcGVyaW9kIHdoZXJlIHRoZSBjbGllbnQgaG9sZHMgbm8g
c3RhdGUgYXQgYWxsIG9uIHRoZSBzZXJ2ZXIuCj4gPiA+IAo+ID4gPiBObywgYXMgSSBzYWlkLCB0
aGUgY2xpZW50IHBlcmZvcm1zIHJlYm9vdCByZWNvdmVyeSBmb3IgYW55IHN0YXRlCj4gPiA+IHRo
YXQKPiA+ID4gaXQKPiA+ID4gaG9sZHMgd2hlbiB3ZSBkbyB0aGlzLgo+ID4gPiAKPiA+IAo+ID4g
SG1tLi4uIFNvIGhvdyBkbyB0aGUgY2xpZW50IGFuZCBzZXJ2ZXIgY29vcmRpbmF0ZSB3aGF0IGNh
biBhbmQKPiA+IGNhbm5vdAo+ID4gYmUgcmVjbGFpbWVkPyBUaGUgaXNzdWUgaXMgdGhhdCByYWNl
cyBjYW4gd29yayBib3RoIHdheXMsIHdpdGggdGhlCj4gPiBjbGllbnQgc29tZXRpbWVzIGJlbGll
dmluZyB0aGF0IGl0IGhvbGRzIGEgbGF5b3V0IG9yIGEgZGVsZWdhdGlvbgo+ID4gdGhhdAo+ID4g
dGhlIHNlcnZlciB0aGlua3MgaXQgaGFzIHJldHVybmVkLiBJZiB0aGUgc2VydmVyIGFsbG93cyBh
IHJlY2xhaW0KPiA+IG9mCj4gPiBzdWNoIGEgZGVsZWdhdGlvbiwgdGhlbiB0aGF0IGNvdWxkIGJl
IHByb2JsZW1hdGljIChiZWNhdXNlIGl0Cj4gPiBicmVha3MKPiA+IGxvY2sgYXRvbWljaXR5IG9u
IHRoZSBjbGllbnQgYW5kIGJlY2F1c2UgaXQgbWF5IGNhdXNlIGNvbmZsaWN0cykuCj4gCj4gVGhl
IHNlcnZlcidzIG5vdCBhY3R1YWxseSBmb3JnZXR0aW5nIGFueXRoaW5nLCBpdCdzIGp1c3QgcHJl
dGVuZGluZwo+IHRvLAo+IGluIG9yZGVyIHRvIHRyaWdnZXIgdGhlIGNsaWVudCdzIHJlYm9vdCBy
ZWNvdmVyeS7CoCBJdCBjYW4gdHVybiBkb3duCj4gdGhlCj4gY2xpZW50J3MgYXR0ZW1wdCB0byBy
ZWNsYWltIHNvbWV0aGluZyBpdCBkb2Vzbid0IGhhdmUuCj4gCj4gVGhvdWdoIGlzbid0IGl0IGFs
cmVhZHkgZ2FtZSBvdmVyIGJ5IHRoZSB0aW1lIHRoZSBjbGllbnQgdGhpbmtzIGl0Cj4gaG9sZHMK
PiBzb21lIGxvY2svb3Blbi9kZWxlZ2F0aW9uIHRoYXQgdGhlIHNlcnZlciBkb2Vzbid0P8KgIEkg
Z3Vlc3MgSSdkIG5lZWQKPiB0bwo+IHNlZSB0aGVzZSBjYXNlcyB3cml0dGVuIG91dCBpbiBkZXRh
aWwgdG8gdW5kZXJzdGFuZC4KPiAKCk5vcm1hbGx5LCB0aGUgc2VydmVyIHdpbGwgcmV0dXJuIE5G
UzRFUlJfQkFEX1NUQVRFSUQgb3IKTkZTNEVSUl9PTERfU1RBVEVJRCBpZiB0aGUgY2xpZW50IHRy
aWVzIHRvIHVzZSBhbiBpbnZhbGlkIHN0YXRlaWQuIFRoZQppc3N1ZSBoZXJlIGlzIHRoYXQgeW91
J2QgYmUgZGlzY2FyZGluZyB0aGF0IG1hY2hpbmVyeSwgYmVjYXVzZSB0aGUKY2xpZW50IGlzIGZv
cmdldHRpbmcgaXRzIHN0YXRlaWRzIHdoZW4gaXQgZ2V0cyB0b2xkIHRoYXQgdGhlIHNlcnZlcgpy
ZWJvb3RlZC4KVGhhdCBhZ2FpbiBwdXRzIHRoZSBvbnVzIG9uIHRoZSBzZXJ2ZXIgdG8gdmVyaWZ5
IG1vcmUgc3Ryb25nbHkgd2hldGhlcgpvciBub3QgdGhlIGNsaWVudCBpcyByZWNvdmVyaW5nIHN0
YXRlIHRoYXQgaXQgYWN0dWFsbHkgaG9sZHMuCgoKU28gdG8gZWxhYm9yYXRlIGEgbGl0dGxlIG1v
cmUgb24gdGhlIGNhc2VzIHdoZXJlIHdlIGhhdmUgc2VlbiB0aGUKY2xpZW50IGFuZCBzZXJ2ZXIg
c3RhdGUgbWVzcyB1cCBoZXJlLiBUeXBpY2FsbHkgaXQgaGFwcGVucyB3aGVuIHdlCmJ1aWxkIENP
TVBPVU5EUyB3aGVyZSB0aGVyZSBpcyBhIHN0YXRlZnVsIG9wZXJhdGlvbiBmb2xsb3dlZCBieSBh
IHNsb3cKb3BlcmF0aW9uLiBTb21ldGhpbmcgbGlrZQoKVGhyZWFkIDEKPT09PT09PT0KT1BFTihm
b28pICsgTEFZT1VUR0VUCi0+IG9wZW5zdGF0ZWlkKDAxOiBibGFoKQoKCQkJCVRocmVhZCAyCgkJ
CQk9PT09PT09PQoJCQkJT1BFTihmb28pCgkJCQktPm9wZW5zdGF0ZWlkKDAyOiBibGFoKQoJCQkJ
Q0xPU0Uob3BlbnN0YXRlaWQoMDI6YmxhaCkpCgooZ2V0cyByZXBseSBmcm9tIE9QRU4pLgoKVHlw
aWNhbGx5IHRoZSBjbGllbnQgZm9yZ2V0cyBhYm91dCB0aGUgc3RhdGVpZCBhZnRlciB0aGUgQ0xP
U0UsIHNvIHdoZW4KaXQgZ2V0cyBhIHJlcGx5IHRvIHRoZSBvcmlnaW5hbCBPUEVOLCBpdCB0aGlu
a3MgaXQganVzdCBnb3QgYQpjb21wbGV0ZWx5IGZyZXNoIHN0YXRlaWQgIm9wZW5zdGF0ZWlkKDAx
OiBibGFoKSIsIHdoaWNoIGl0IG1pZ2h0IHRyeSB0bwpyZWNsYWltIGlmIHRoZSBzZXJ2ZXIgZGVj
bGFyZXMgYSByZWJvb3QuCgo+IC0tYi4KPiAKPiA+IEJ5IHRoZSB3YXksIHRoZSBvdGhlciB0aGlu
ZyB0aGF0IEknZCBsaWtlIHRvIGFkZCB0byBteSB3aXNobGlzdCBpcwo+ID4gYQo+ID4gY2FsbGJh
Y2sgdGhhdCBhbGxvd3MgdGhlIHNlcnZlciB0byBhc2sgdGhlIGNsaWVudCBpZiBpdCBzdGlsbCBo
b2xkcwo+ID4gYQo+ID4gZ2l2ZW4gb3BlbiBvciBsb2NrIHN0YXRlaWQuIEEgc2VydmVyIGNhbiBy
ZWNhbGwgYSBkZWxlZ2F0aW9uIG9yIGEKPiA+IGxheW91dCwgc28gaXQgY2FuIGZpeCB1cCBsZWFr
cyBvZiB0aG9zZSwgaG93ZXZlciBpdCBoYXMgbm8gcmVtZWR5Cj4gPiBpZgo+ID4gdGhlIGNsaWVu
dCBsb3NlcyBhbiBvcGVuIG9yIGxvY2sgc3RhdGVpZCBvdGhlciB0aGFuIHRvIHBvc3NpYmx5Cj4g
PiBmb3JjaWJseSByZXZva2Ugc3RhdGUuIFRoYXQgY291bGQgY2F1c2UgYXBwbGljYXRpb24gY3Jh
c2hlcyBpZiB0aGUKPiA+IHNlcnZlciBtYWtlcyBhIG1pc3Rha2UgYW5kIHJldm9rZXMgYSBsb2Nr
IHRoYXQgaXMgYWN0dWFsbHkgaW4gdXNlLgo+ID4gCgotLSAKVHJvbmQgTXlrbGVidXN0CkxpbnV4
IE5GUyBjbGllbnQgbWFpbnRhaW5lciwgSGFtbWVyc3BhY2UKdHJvbmQubXlrbGVidXN0QGhhbW1l
cnNwYWNlLmNvbQoKCgotLQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZz
QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWNhY2hlZnM=

