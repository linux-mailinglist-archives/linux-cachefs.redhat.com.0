Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AC71C42EA73
	for <lists+linux-cachefs@lfdr.de>; Fri, 15 Oct 2021 09:42:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-iB7aC5t3PPeStI82JlInQA-1; Fri, 15 Oct 2021 03:42:34 -0400
X-MC-Unique: iB7aC5t3PPeStI82JlInQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6381EA40C0;
	Fri, 15 Oct 2021 07:42:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAC307092D;
	Fri, 15 Oct 2021 07:42:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0B254E58F;
	Fri, 15 Oct 2021 07:42:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19F7gMee021962 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 15 Oct 2021 03:42:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C9B340CFD11; Fri, 15 Oct 2021 07:42:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3685040CFD0D
	for <linux-cachefs@redhat.com>; Fri, 15 Oct 2021 07:42:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 193FD800963
	for <linux-cachefs@redhat.com>; Fri, 15 Oct 2021 07:42:22 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam10on2134.outbound.protection.outlook.com [40.107.93.134])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-544-IBxknqrwOd6fwgz4KWsUhQ-2; Fri, 15 Oct 2021 03:42:19 -0400
X-MC-Unique: IBxknqrwOd6fwgz4KWsUhQ-2
Received: from CH0PR13MB5084.namprd13.prod.outlook.com (2603:10b6:610:111::7)
	by CH2PR13MB3573.namprd13.prod.outlook.com (2603:10b6:610:26::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.12;
	Fri, 15 Oct 2021 07:42:16 +0000
Received: from CH0PR13MB5084.namprd13.prod.outlook.com
	([fe80::1533:4550:d876:1486]) by
	CH0PR13MB5084.namprd13.prod.outlook.com
	([fe80::1533:4550:d876:1486%7]) with mapi id 15.20.4608.016;
	Fri, 15 Oct 2021 07:42:16 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "chuck.lever@oracle.com" <chuck.lever@oracle.com>, "dwysocha@redhat.com"
	<dwysocha@redhat.com>
Thread-Topic: [PATCH 1/1] NFS: Convert from readpages() to readahead()
Thread-Index: AQHXu9PCRhIgoA2dZ0ipW9xtm9oQyavJJJ0AgAqUEYA=
Date: Fri, 15 Oct 2021 07:42:16 +0000
Message-ID: <1fe6dbeac820b58f0790dcff492b62b7dd7e4fea.camel@hammerspace.com>
References: <1633649528-1321-1-git-send-email-dwysocha@redhat.com>
	<1633649528-1321-2-git-send-email-dwysocha@redhat.com>
	<3F1E7B93-EB8D-4744-8143-D44654CA6451@oracle.com>
In-Reply-To: <3F1E7B93-EB8D-4744-8143-D44654CA6451@oracle.com>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97e80e5b-9a3b-4b63-bfca-08d98faf4f73
x-ms-traffictypediagnostic: CH2PR13MB3573:
x-microsoft-antispam-prvs: <CH2PR13MB3573CF8E7D7CCE06559FA1F6B8B99@CH2PR13MB3573.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:605
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: CLM+RNeLBySMEu9KDOxCAf1/Bm65++93WZnfBYXzlSHKJ6BuJ8/qQcKSEvTgHyTYE2APHn7rUI/wxL2Wbj+DevoW9rTcBMZJmB+teA4maMYEna+FRD3XKYcaYjpW4xNM3NnuS5Tthw6DrCZKc8Lu6xu+Y0AzhWCnxsfekuFb1vTq0hf0Gh65IyBCUUf8cdNzAklfZxbUNzNchm/m6C4E0JDOYGg9nvJ6fJZgpzG2ep5nMcB9sfVBYLSl7V4Ah93jHii4NImRGz5VnOvbOQMz5+ZE0lCrmYdK0FBiAp0ksqZLBCoMs8DLH/UewrvwHBp1dHnSg44xvKpL/SN6HzbvT0sX5vLFK4LrqTERPUwLBrjOejLqmJ7/jF4TBKibsDCF8shiGr0bu9zMS2z06WKavM86AOvt+ET2yufRP30l66fFKbRt95CMZbUEjGUcIuMXzhUvDgxC2fS1TEAz3ODSZPlHVWVIv6d1PXSyWMkWI1A2p5JrcvIEmh/5T6UWH0acCI8JPCGPh0BLA2UAdWlDD8kZXBlB73DUusUbKv5/wOdj9bK+7LbjvVIA1tLzPCCM8ZhH6jPc2HeEeX3qSg51NFdNWy9rEHF9tAg6EMb5lc4x3K+3dRqnvbcP1nP567KHhP20zlgcexNS88VqLsyrdcLIJ6vtd5zbKvw8tzY4Pr1+jLGY+EmfRbmR7Pl5362DXt5rzNaEg0VFBDvCTAYUqw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CH0PR13MB5084.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(316002)(4326008)(186003)(2616005)(8936002)(86362001)(6506007)(83380400001)(5660300002)(71200400001)(2906002)(66556008)(508600001)(38100700002)(66476007)(8676002)(26005)(6512007)(76116006)(91956017)(64756008)(36756003)(38070700005)(122000001)(54906003)(66946007)(53546011)(110136005)(66446008)(6486002);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFVXbVVPRmVkTktsTjQrWG5QM2VyMG1nb2ZMakNBRE5maU0wMWhSUnIwSVp5?=
	=?utf-8?B?TS9jSUVraTQ3a0lMUFNVcXRyQzJ0WnYrSXZTbVh0ZzlGTytKN3ZMY1djaVlX?=
	=?utf-8?B?QzFobUFGeHd0eDJ4MG52Z3o2N1poMXh3bkgxUVBUUlpQenFWanpUbXBsM0ZF?=
	=?utf-8?B?OGRGOGp2RTJtV2Q4YUdBR1R1ckRvekhnd1Nqa3MxOUJmQitFeEs2TnVyMTkz?=
	=?utf-8?B?NldlR1ExeHQ1dmFkWSsyeHhDMUd3cEJ2ZVUyWTZQUXo2dnRJNkE3am8wVEUx?=
	=?utf-8?B?ZDN5T3VsRUpCOFZxdzVXUlozd3pxaXkyNWVGY0oxZGpKa1RKenkvNGsxK3RB?=
	=?utf-8?B?dnlpUUJhL1BGYnQ5Tkt5UzMrc0lOVUtjY0ZBRHZmWkgzdmVuS3A4Y2NLOUlt?=
	=?utf-8?B?MkZ2dWJML085R01IY0RLQVp4LzgxbmYrdVdib1BoUDJFWFRQMWg0UXIwMVJS?=
	=?utf-8?B?ZmRDeTZqSHV3bDdoRElvd1Q4ZWlZRFpyTUV4U2VVS0dyRnVPcUg2T3hCd2RD?=
	=?utf-8?B?YzhDK3VpVUd5YVc5TEd6dnBCSFhaUmFrMHllQnRYSUV6MzZuR0dncDA3VCtY?=
	=?utf-8?B?QllVM291WWhoM2RzQVRWTlNNQ3lXSS9LTnVyU2JPNkJycGhDdGNXaTVWaTBj?=
	=?utf-8?B?MkswSUlSOFUwcmdjZ2tQNHlTLzRuUW1OMmFic2xIMzZkTVFzVmdyQXRHeERP?=
	=?utf-8?B?aENOL2JRVzZVb3oxOGV5eDI0SDhTSXVzY1czc0VBUWhpUmtzVExRR3Q0OE5V?=
	=?utf-8?B?NTZYVEZqRUQwck9LaUYvdWM2SmpmKy9MOGtScW1wWXRxMXN2NWx2d1E4RFhY?=
	=?utf-8?B?QWkxZk8vUnJNSUl3TGVRaXNNRTdCUnZIZ3g2T3Bmbzh1aXdVRjVTYVdiMjI2?=
	=?utf-8?B?TnVsSGxQQzc1bUdTYm4yU0w2UHp1Y2NjbFgzQUNPbUNIYXZNQzFqNjNkTGsr?=
	=?utf-8?B?bldoRFYzNHVUczdoWFJHRjFUUnJlUkF5cjZkVnJpSVFVNjJ4YmhCbHBEaVhR?=
	=?utf-8?B?dDloZ0VBMmxmY3NtQ2JPSDl2L3dIa1RFUVVXZVRyT2FSUGVvM2tyUG1mckZl?=
	=?utf-8?B?WE1MWXhyaDZiM1A3N2tYeXhRN25DY2hxVGd6QVdiMmFNUlRxN1F1dk5TWHVB?=
	=?utf-8?B?bVlwZ2FxYmpxT3FQZnhWSUpCQ0g5NnNza2ZtWlFEOEVndWx6UG1KQk5RRjZ2?=
	=?utf-8?B?UXo2Qzd1M3IwZ0FQSU4wQUlKK3ROSjl6UDRDTFlVMHdzR1lSMGxtTHNXTGtK?=
	=?utf-8?B?TitGMjZQUlc2QkI0Qkw3V2cxc3JtemlZVEt2MGJoY0UxRVhLNnQ1NkR0bXJo?=
	=?utf-8?B?M3FtQVZHZEhrbnI4dkhrS1dFU3Rlb3NCdFppU29LQjgzTVM0T3NFOXZzRnNS?=
	=?utf-8?B?NkZGVUZlU2l5VUNpd1FaSUdTR2duUzBLYUxjeXNDcWpTK1FQYS9HSFpiSG5m?=
	=?utf-8?B?cURJTjNUc0wwYzg0bnc3UlJjdDBtNmRHdXcvdDkyblJaOEpYcStvaDVoRzhK?=
	=?utf-8?B?ejFTUUZPZkhwZTlyak9BbXh6ZkZ4QzZYK3JTUkZJam9iNHlhZERMZDU3dmV1?=
	=?utf-8?B?T0NpZCs0dFQya1gxdVpwSFJRSVUwNVc0YVhtMWpESkFLZ3RML3BHYUFhZGps?=
	=?utf-8?B?R1dYeERnY1RFNkFoc2NveFJCd0NDTkR6V2hUbGVlK0FKSmkyVUtZWUNoSm1u?=
	=?utf-8?B?YlY0SGgyaXJwbzUzMEZSTXZ6eTl4UUNRc1o1UW1TN3dVYmVOdDlFVFk3WFlq?=
	=?utf-8?B?b0syTmc0SHpIR1JMY2R5WFMrWTExamQ3aHZ4NjBLbzVTeEU1dmtieXQyUE1B?=
	=?utf-8?B?UHJsT0lNcXd1aW8xOVdSdz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR13MB5084.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e80e5b-9a3b-4b63-bfca-08d98faf4f73
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 07:42:16.1718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vMTMeWx1x9ZlpsjnkGk0I0DW/LVlm2kAj9eqx8DiIKTUyIy1JRR9xcX8BGsKRhE9+Q5ZCryxrNzo38ZpmfhfjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3573
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 19F7gMee021962
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"anna.schumaker@netapp.com" <anna.schumaker@netapp.com>,
	"willy@infradead.org" <willy@infradead.org>
Subject: Re: [Linux-cachefs] [PATCH 1/1] NFS: Convert from readpages() to
	readahead()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <52605B26948F08419EE8C5E29235C3E6@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIxLTEwLTA4IGF0IDE0OjA5ICswMDAwLCBDaHVjayBMZXZlciBJSUkgd3JvdGU6
Cj4gCj4gCj4gPiBPbiBPY3QgNywgMjAyMSwgYXQgNzozMiBQTSwgRGF2ZSBXeXNvY2hhbnNraSA8
ZHd5c29jaGFAcmVkaGF0LmNvbT4KPiA+IHdyb3RlOgo+ID4gCj4gPiBDb252ZXJ0IHRvIHRoZSBu
ZXcgVk0gcmVhZGFoZWFkKCkgQVBJIHdoaWNoIGlzIHRoZSBwcmVmZXJyZWQgQVBJCj4gPiB0byBy
ZWFkIG11bHRpcGxlIHBhZ2VzLCBhbmQgcmVuYW1lIHRoZSBORlNJT1NfKiBjb3VudGVycyBhbmQg
dGhlCj4gPiB0cmFjZXBvaW50IGFzIG5lZWRlZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogRGF2
ZSBXeXNvY2hhbnNraSA8ZHd5c29jaGFAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gZnMvbmZzL2Zp
bGUuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gPiBmcy9uZnMvbmZzdHJh
Y2UuaMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+ID4gZnMvbmZzL3JlYWQuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwgMjEgKysrKysrKysrKysrKysrLS0tLS0tCj4gPiBpbmNsdWRl
L2xpbnV4L25mc19mcy5owqDCoMKgwqAgfMKgIDMgKy0tCj4gPiBpbmNsdWRlL2xpbnV4L25mc19p
b3N0YXQuaCB8wqAgNiArKystLS0KPiA+IDUgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygr
KSwgMTMgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9mcy9uZnMvZmlsZS5jIGIv
ZnMvbmZzL2ZpbGUuYwo+ID4gaW5kZXggMjA5ZGFjMjA4NDc3Li5jYzc2ZDE3ZmE5N2YgMTAwNjQ0
Cj4gPiAtLS0gYS9mcy9uZnMvZmlsZS5jCj4gPiArKysgYi9mcy9uZnMvZmlsZS5jCj4gPiBAQCAt
NTE5LDcgKzUxOSw3IEBAIHN0YXRpYyB2b2lkIG5mc19zd2FwX2RlYWN0aXZhdGUoc3RydWN0IGZp
bGUKPiA+ICpmaWxlKQo+ID4gCj4gPiBjb25zdCBzdHJ1Y3QgYWRkcmVzc19zcGFjZV9vcGVyYXRp
b25zIG5mc19maWxlX2FvcHMgPSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgLnJlYWRwYWdlID0gbmZz
X3JlYWRwYWdlLAo+ID4gLcKgwqDCoMKgwqDCoMKgLnJlYWRwYWdlcyA9IG5mc19yZWFkcGFnZXMs
Cj4gPiArwqDCoMKgwqDCoMKgwqAucmVhZGFoZWFkID0gbmZzX3JlYWRhaGVhZCwKPiA+IMKgwqDC
oMKgwqDCoMKgwqAuc2V0X3BhZ2VfZGlydHkgPSBfX3NldF9wYWdlX2RpcnR5X25vYnVmZmVycywK
PiA+IMKgwqDCoMKgwqDCoMKgwqAud3JpdGVwYWdlID0gbmZzX3dyaXRlcGFnZSwKPiA+IMKgwqDC
oMKgwqDCoMKgwqAud3JpdGVwYWdlcyA9IG5mc193cml0ZXBhZ2VzLAo+ID4gZGlmZiAtLWdpdCBh
L2ZzL25mcy9uZnN0cmFjZS5oIGIvZnMvbmZzL25mc3RyYWNlLmgKPiA+IGluZGV4IDc4YjBmNjQ5
ZGQwOS4uZDJiMjA4MDc2NWE2IDEwMDY0NAo+ID4gLS0tIGEvZnMvbmZzL25mc3RyYWNlLmgKPiA+
ICsrKyBiL2ZzL25mcy9uZnN0cmFjZS5oCj4gPiBAQCAtOTE1LDcgKzkxNSw3IEBACj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCkKPiA+ICk7Cj4gPiAKPiA+IC1UUkFDRV9FVkVO
VChuZnNfYW9wc19yZWFkcGFnZXMsCj4gPiArVFJBQ0VfRVZFTlQobmZzX2FvcHNfcmVhZGFoZWFk
LAo+IAo+IEluIHYyIGFuZCB2MyBvZiBteSBwYXRjaCwgdGhpcyB0cmFjZXBvaW50IGhhcyBhbHJl
YWR5IGJlZW4KPiByZW5hbWVkIHRvIG5mc19hb3BfcmVhZGFoZWFkLgoKRG9lcyB0aGF0IG1lYW4g
eW91J3JlIGdvaW5nIHRvIHJlc2VuZCwgQ2h1Y2s/IEFsbCBJIGhhdmUgaXMgeW91ciB2MS4uCgoK
Ci0tIApUcm9uZCBNeWtsZWJ1c3QKTGludXggTkZTIGNsaWVudCBtYWludGFpbmVyLCBIYW1tZXJz
cGFjZQp0cm9uZC5teWtsZWJ1c3RAaGFtbWVyc3BhY2UuY29tCgoKCi0tCkxpbnV4LWNhY2hlZnMg
bWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnM=

