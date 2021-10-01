Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA4E41EF80
	for <lists+linux-cachefs@lfdr.de>; Fri,  1 Oct 2021 16:29:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-3Y9-9DRFPAOpEL7JxO-fTQ-1; Fri, 01 Oct 2021 10:29:50 -0400
X-MC-Unique: 3Y9-9DRFPAOpEL7JxO-fTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E1408015C7;
	Fri,  1 Oct 2021 14:29:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C64DF608BA;
	Fri,  1 Oct 2021 14:29:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D849B4E58F;
	Fri,  1 Oct 2021 14:29:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 191ETaZ9017314 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 1 Oct 2021 10:29:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0FD411424B0; Fri,  1 Oct 2021 14:29:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB29A11424AD
	for <linux-cachefs@redhat.com>; Fri,  1 Oct 2021 14:29:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3201F862DFA
	for <linux-cachefs@redhat.com>; Fri,  1 Oct 2021 14:29:33 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam08on2132.outbound.protection.outlook.com [40.107.100.132])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-519-8FSpJKs3OMq6dVL8bM-RJA-1; Fri, 01 Oct 2021 10:29:29 -0400
X-MC-Unique: 8FSpJKs3OMq6dVL8bM-RJA-1
Received: from CH0PR13MB5084.namprd13.prod.outlook.com (2603:10b6:610:111::7)
	by CH0PR13MB4700.namprd13.prod.outlook.com (2603:10b6:610:c2::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.9;
	Fri, 1 Oct 2021 14:29:26 +0000
Received: from CH0PR13MB5084.namprd13.prod.outlook.com
	([fe80::1533:4550:d876:1486]) by
	CH0PR13MB5084.namprd13.prod.outlook.com
	([fe80::1533:4550:d876:1486%6]) with mapi id 15.20.4587.011;
	Fri, 1 Oct 2021 14:29:26 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "dwysocha@redhat.com" <dwysocha@redhat.com>, "dhowells@redhat.com"
	<dhowells@redhat.com>
Thread-Topic: [PATCH v2 3/8] nfs: Move to using the alternate fallback fscache
	I/O API
Thread-Index: AQHXq9VkcJvbs0xlPEq7aMXkSiWnq6u+EpgAgAA3MwA=
Date: Fri, 1 Oct 2021 14:29:26 +0000
Message-ID: <97eb17f51c8fd9a89f10d9dd0bf35f1075f6b236.camel@hammerspace.com>
References: <163189104510.2509237.10805032055807259087.stgit@warthog.procyon.org.uk>
	<163189108292.2509237.12615909591150927232.stgit@warthog.procyon.org.uk>
	<CALF+zO=165sRYRaxPpDS7DaQCpTe-YOa4FamSoMy5FV2uuG5Yg@mail.gmail.com>
In-Reply-To: <CALF+zO=165sRYRaxPpDS7DaQCpTe-YOa4FamSoMy5FV2uuG5Yg@mail.gmail.com>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fd22a37-05c6-42dc-7818-08d984e7def5
x-ms-traffictypediagnostic: CH0PR13MB4700:
x-microsoft-antispam-prvs: <CH0PR13MB4700E3C235F5F2E2D458E10BB8AB9@CH0PR13MB4700.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: QcquSlWybqMbzmIA4rIE/OBe65nzWehyCp0jj6yVclJ4rC5scvuuy6BcoRNaIC6S2fFxY9/1ejKMhwTfxjHT8J2qZJtuF/f4pR3dNyeyv09hFGJg4BfYAgzyqD0ZDvHhyJuzEyLll+VnAv2lJAheIzhrWuW0+82rP8aVuW9gCr4ozb/e91STCUpnyl/vebx3hQz/yIXrxGDrp5hrjvrOHWG2fOh1lF9Lq+BejFOOIUgP3BR5u66SRihRPhJKQWRvZ9lqL/gcex5mFJHuaZN5/a2e8hXQmy4tD95vCHtNRRmJyykjJNXrBkT2he9K2hw9xfWDh0doGzmEflFxCUTcwuZPeuro1bnYyjtUDB6oDlXNIPbx3ssh+s9uv1KYY59IkZQ02HnkdJvs8FKaw1GWS0yR3VKNQr1bTztyP2RuN9FjRc8jQ1Nmqp+3oAuSGjm9Lqkq6ETlLehxXdMH5hoEiS8GMoailqAVMdrOYzx25B3aTk5YX/5i0YkxJQjdKxWcU/ARdocFMMQt7C0XMocQRVej55qy9KQF2ur5/SF+WY5+QFvea9TyUbFT5qi/Wdc1apaL7ySVd6RR/6PE3qHDeCYQH/fMzWnP8T9CQS05mnGOtq1kt2o3XfQAAYP1KzbDdX5N2bWNZQiTEtasFaYUHrDB4Za7sjKLtM8w+1sAQAB6hPQD0qM08Ltv53RVaijGZJHhrFxewt4wY2r+ZZWVKrr2fnrJX8iyzgCmsomueeVEpzNevTi47l+EiwvCj8Q08RL9FRsYoZZmVcSYnsOt3OxU9DG4GugNmpfwUyLhlHU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CH0PR13MB5084.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(66556008)(71200400001)(83380400001)(8936002)(6512007)(66946007)(316002)(64756008)(66476007)(38100700002)(5660300002)(86362001)(8676002)(110136005)(2616005)(26005)(6486002)(38070700005)(2906002)(54906003)(4326008)(966005)(53546011)(76116006)(6506007)(36756003)(508600001)(66446008)(122000001)(186003);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVMzTTNrNEh0VTVXMGFHdVlzU0N1LzdMTEErRFVCb3FrZ05DekoyNUFJUEFL?=
	=?utf-8?B?SVk5OU8zR0hwaXJHTGU0VGMyLzFZdGJuUlhsU0l0aWxJdVJVQTlBdEJRQ05L?=
	=?utf-8?B?TmtIaWJHc1JWME5RUmFPVGxaaVBqUlVZQ2pVYUJLUFE1dFByOVpPREhrYVYw?=
	=?utf-8?B?ZFpFSWg1STVYWGVWN0hYbzlKSDZ2aTYvMDhEMzBlNTVZVkFjelI2dkZwVys2?=
	=?utf-8?B?aGE3K2lHTlg3OTk5ZWJOYThXc3IxWWxBelNab1BXSHhOaTRHQ3J0a3JRWW84?=
	=?utf-8?B?MHhDY3VBSXl6SDdIb3ovOVBQaGwvRkVhMjNkS2VSZkZKV1Rwa1Ryd3NSVmti?=
	=?utf-8?B?NW1NT3lYVnNkUy8xQ1Awa292Y2hQbXZSUysyVVNQZnYwNU9iTmtmaHNFS1dp?=
	=?utf-8?B?QmRmQnE5cVFMb05XSnNTTnpUcy9pa2NZbjVXNEVtRElsdzNwbnMva3QxWDBL?=
	=?utf-8?B?ODZSSGJzUW5lYWhHVjlDMjdqd3Avc1dhSC92UzdTNVpTNVpSVkcyTlpkVnY5?=
	=?utf-8?B?TStJeGFhQjh6TlVIdmtqaDVjN0FIUGVOMzUvRVdEcEhUTlA3NjJNSnVIZEZZ?=
	=?utf-8?B?bThXbUxTK1RrYlV6UUJxS3F3UkdCb1J0d3dlR3V5cW05dVc3UEdXaXlGZFBS?=
	=?utf-8?B?RG90alkwQWtzRGtKRnI1MVBxM1h6UVFIR0hMSkxIWGR3Uk9EdGtwWmFsbW9u?=
	=?utf-8?B?cThBWHJCUk5pZnE0SW13SUZNa3JKRGhqc0dZRWd6MWZRZ0FTMUxsVDZUQnpN?=
	=?utf-8?B?eGVwb2swTFJPckpldlZqUUFBY0piRFdnZW9weUdUQUFMc01VK2JzSFcwS0ZU?=
	=?utf-8?B?bEl1OUlQeUFhc2FudTlLZW55dlFxREIwdllzNEtKcEtHN1NVZGZyTG45YzBK?=
	=?utf-8?B?c0NLM1YwWHZ1cnlZbGxBMjllcmxGbjhZeWNrYVI1WTg4ZmVRcGxTMlZ5N2hj?=
	=?utf-8?B?WlhTQjM1ZG1JaXhPWU1VSVFkdTRCeWNTNVZqS1NXWU9DdFA3U29MSWJPT3pp?=
	=?utf-8?B?YWUyNjBES3BvUktmUzlkL1RaSjdrUTUySm9QSmNGcHpCWWs5TnJCaDNYYmgr?=
	=?utf-8?B?VVpidmo5TTFRM2pObitlZUNjK3pwUHFtSmhoZ0JiaFNUc0hoeVlwbDdCckNT?=
	=?utf-8?B?ZDNldERiMWREOXBSeTRPWmNOYTA2YWJEdTRFT3hXeTZ0d2F0dTZ6bXE1d1hV?=
	=?utf-8?B?UytRK0I2U29udGZabGgxY0k1V0kvUSswS3Z0WDQyeTdUbUhWZkhhZEUwZzUw?=
	=?utf-8?B?eWw5ZndnMzlBQWlnckR1NzZ5aW1TMUo4dzkyWkpteFV1R0kzM01kU1N1UVln?=
	=?utf-8?B?cWFyaFZ2T2lmSCtzTnJSRXZDbTZ4SmVMUGJtMVlzTmlVVnZMdEdWbkp2dE9i?=
	=?utf-8?B?QzhML2NJL21KNGtDTkhzSmNwTG1XeWN3ZnpQMHIrV3FJYklMUGlid1N2dUpG?=
	=?utf-8?B?RUFSYlVaVlhQKzVSZHN6Lyt6UUpwUWtDOHhreHpvWG1ERmw1L2JOL0V0aGpa?=
	=?utf-8?B?dTRHTGFmcUZHUEJjREZjWFBFdmNXUTRmWHdPSUh1QnhmZGlyRnZTVEEwbjNE?=
	=?utf-8?B?d01XOGJHTFRTSm5vd1NoNmR3bk5SZjFjU2NKV0xsWmN6aU5wdUpkUUIvbnM5?=
	=?utf-8?B?WXZzZjdUMTZwazJ6WjA2aHVuT2ovc3kwNGNRS2owY2x5ekhwZ2dJRGM5OGh1?=
	=?utf-8?B?ZVFLcHdWYjNOcnVxMVRMQmJrZmJTTlg5c0N3Y09vR2R1OUtnN3lqdS9kYUVy?=
	=?utf-8?Q?VQiK6QXwGpo91FBa3koRyGTQiSBQeCV8NHGDiKK?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR13MB5084.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd22a37-05c6-42dc-7818-08d984e7def5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 14:29:26.0465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Utshr5soYEbaUparm036MdIq1KI1PDC5l+YT0dKUVCx2NsYpC336xzovVI8JKNdQOEuTtK6XIpITx6HhXCbYOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR13MB4700
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 191ETaZ9017314
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v2 3/8] nfs: Move to using the alternate
 fallback fscache I/O API
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
Content-ID: <E0D21244B42DAE458BCEEA9CB26D6D79@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIxLTEwLTAxIGF0IDA3OjExIC0wNDAwLCBEYXZpZCBXeXNvY2hhbnNraSB3cm90
ZToKPiAKPiAKPiBPbiBGcmksIFNlcCAxNywgMjAyMSBhdCAxMTowNSBBTSBEYXZpZCBIb3dlbGxz
IDxkaG93ZWxsc0ByZWRoYXQuY29tPgo+IHdyb3RlOgo+ID4gCj4gPiBNb3ZlIE5GUyB0byB1c2lu
ZyB0aGUgYWx0ZXJuYXRlIGZhbGxiYWNrIGZzY2FjaGUgSS9PIEFQSSBpbnN0ZWFkIG9mCj4gPiB0
aGUgb2xkCj4gPiB1cHN0cmVhbSBJL08gQVBJIGFzIHRoYXQgaXMgYWJvdXQgdG8gYmUgZGVsZXRl
ZC7CoCBUaGUgYWx0ZXJuYXRlIEFQSQo+ID4gd2lsbAo+ID4gYWxzbyBiZSBkZWxldGVkIGF0IHNv
bWUgcG9pbnQgaW4gdGhlIGZ1dHVyZSBhcyBpdCdzIGRhbmdlcm91cyAoYXMKPiA+IGlzIHRoZQo+
ID4gb2xkIEFQSSkgYW5kIGNhbiBsZWFkIHRvIGRhdGEgY29ycnVwdGlvbiBpZiB0aGUgYmFja2lu
ZyBmaWxlc3lzdGVtCj4gPiBjYW4KPiA+IGluc2VydC9yZW1vdmUgYnJpZGdpbmcgYmxvY2tzIG9m
IHplcm9zIGludG8gaXRzIGV4dGVudCBsaXN0WzFdLgo+ID4gCj4gPiBUaGUgYWx0ZXJuYXRlIEFQ
SSByZWFkcyBhbmQgd3JpdGVzIHBhZ2VzIHN5bmNocm9ub3VzbHksIHdpdGggdGhlCj4gPiBpbnRl
bnRpb24KPiA+IG9mIGFsbG93aW5nIHJlbW92YWwgb2YgdGhlIG9wZXJhdGlvbiBtYW5hZ2VtZW50
IGZyYW1ld29yayBhbmQKPiA+IHRoZW5jZSB0aGUKPiA+IG9iamVjdCBtYW5hZ2VtZW50IGZyYW1l
d29yayBmcm9tIGZzY2FjaGUuCj4gPiAKPiA+IFRoZSBwcmVmZXJyZWQgY2hhbmdlIHdvdWxkIGJl
IHRvIHVzZSB0aGUgbmV0ZnMgbGliLCBidXQgdGhlIG5ldyBJL08KPiA+IEFQSSBjYW4KPiA+IGJl
IHVzZWQgZGlyZWN0bHkuwqAgSXQncyBqdXN0IHRoYXQgYXMgdGhlIGNhY2hlIG5vdyBuZWVkcyB0
byB0cmFjawo+ID4gZGF0YSBmb3IKPiA+IGl0c2VsZiwgY2FjaGluZyBibG9ja3MgbWF5IGV4Y2Vl
ZCBwYWdlIHNpemUuLi4KPiA+IAo+ID4gQ2hhbmdlcwo+ID4gPT09PT09PQo+ID4gdmVyICMyOgo+
ID4gwqAgLSBDaGFuZ2VkICJkZXByZWNhdGVkIiB0byAiZmFsbGJhY2siIGluIHRoZSBuZXcgZnVu
Y3Rpb24KPiA+IG5hbWVzWzJdLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIb3dlbGxz
IDxkaG93ZWxsc0ByZWRoYXQuY29tPgo+ID4gY2M6IFRyb25kIE15a2xlYnVzdCA8dHJvbmQubXlr
bGVidXN0QGhhbW1lcnNwYWNlLmNvbT4KPiA+IGNjOiBBbm5hIFNjaHVtYWtlciA8YW5uYS5zY2h1
bWFrZXJAbmV0YXBwLmNvbT4KPiA+IGNjOiBsaW51eC1uZnNAdmdlci5rZXJuZWwub3JnCj4gPiBj
YzogbGludXgtY2FjaGVmc0ByZWRoYXQuY29tCj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yL1lPMTdaTk9jcSs5UGFqZlFAbWl0LmVkdSBbMV0KPiA+IExpbms6Cj4gPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yL0NBSGstPXdpVksrMUN5RWpXOHU3MXpWUEs4bXNlYT1xUHB6blgz
NWduWCtzOHNYbkpUZ0BtYWlsLmdtYWlsLmNvbS8KPiA+IFsyXQo+ID4gTGluazoKPiA+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMTYzMTYyNzcxNDIxLjQzODMzMi4xMTU2MzI5NzYxODE3NDk0
ODgxOC5zdGdpdEB3YXJ0aG9nLnByb2N5b24ub3JnLnVrLwo+ID4gIyByZmMKPiA+IC0tLQo+ID4g
Cj4gPiDCoGZzL25mcy9maWxlLmMgwqAgwqB8IMKgIDE0ICsrKy0tCj4gPiDCoGZzL25mcy9mc2Nh
Y2hlLmMgfCDCoDE2MSArKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiA+IC0tLS0tLS0tLS0tLQo+ID4gwqBmcy9uZnMvZnNjYWNoZS5oIHwgwqAgODUgKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+IMKgZnMvbmZzL3JlYWQuYyDCoCDCoHwgwqAgMjUgKysr
LS0tLS0KPiA+IMKgZnMvbmZzL3dyaXRlLmMgwqAgfCDCoCDCoDcgKysKPiA+IMKgNSBmaWxlcyBj
aGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspLCAyMzcgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS9mcy9uZnMvZmlsZS5jIGIvZnMvbmZzL2ZpbGUuYwo+ID4gaW5kZXggYWEzNTNmZDU4
MjQwLi4yMDlkYWMyMDg0NzcgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9uZnMvZmlsZS5jCj4gPiArKysg
Yi9mcy9uZnMvZmlsZS5jCj4gPiBAQCAtNDE2LDcgKzQxNiw3IEBAIHN0YXRpYyB2b2lkIG5mc19p
bnZhbGlkYXRlX3BhZ2Uoc3RydWN0IHBhZ2UKPiA+ICpwYWdlLCB1bnNpZ25lZCBpbnQgb2Zmc2V0
LAo+ID4gwqAgwqAgwqAgwqAgLyogQ2FuY2VsIGFueSB1bnN0YXJ0ZWQgd3JpdGVzIG9uIHRoaXMg
cGFnZSAqLwo+ID4gwqAgwqAgwqAgwqAgbmZzX3diX3BhZ2VfY2FuY2VsKHBhZ2VfZmlsZV9tYXBw
aW5nKHBhZ2UpLT5ob3N0LCBwYWdlKTsKPiA+IAo+ID4gLSDCoCDCoCDCoCBuZnNfZnNjYWNoZV9p
bnZhbGlkYXRlX3BhZ2UocGFnZSwgcGFnZS0+bWFwcGluZy0+aG9zdCk7Cj4gPiArIMKgIMKgIMKg
IHdhaXRfb25fcGFnZV9mc2NhY2hlKHBhZ2UpOwo+ID4gwqB9Cj4gPiAKPiA+IMKgLyoKPiA+IEBA
IC00MzIsNyArNDMyLDEyIEBAIHN0YXRpYyBpbnQgbmZzX3JlbGVhc2VfcGFnZShzdHJ1Y3QgcGFn
ZSAqcGFnZSwKPiA+IGdmcF90IGdmcCkKPiA+IMKgIMKgIMKgIMKgIC8qIElmIFBhZ2VQcml2YXRl
KCkgaXMgc2V0LCB0aGVuIHRoZSBwYWdlIGlzIG5vdCBmcmVlYWJsZQo+ID4gKi8KPiA+IMKgIMKg
IMKgIMKgIGlmIChQYWdlUHJpdmF0ZShwYWdlKSkKPiA+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHJldHVybiAwOwo+ID4gLSDCoCDCoCDCoCByZXR1cm4gbmZzX2ZzY2FjaGVfcmVsZWFzZV9wYWdl
KHBhZ2UsIGdmcCk7Cj4gPiArIMKgIMKgIMKgIGlmIChQYWdlRnNDYWNoZShwYWdlKSkgewo+ID4g
KyDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoIShnZnAgJiBfX0dGUF9ESVJFQ1RfUkVDTEFJTSkg
fHwgIShnZnAgJgo+ID4gX19HRlBfRlMpKQo+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCByZXR1cm4gZmFsc2U7Cj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHdhaXRfb25f
cGFnZV9mc2NhY2hlKHBhZ2UpOwo+ID4gKyDCoCDCoCDCoCB9CgpJJ3ZlIGZvdW5kIHRoaXMgZ2Vu
ZXJhbGx5IG5vdCB0byBiZSBzYWZlLiBUaGUgVk0gY2FsbHMgLT5yZWxlYXNlX3BhZ2UoKQpmcm9t
IGEgdmFyaWV0eSBvZiBjb250ZXh0cywgYW5kIG9mdGVuIGZhaWxzIHRvIHJlcG9ydCBpdCBjb3Jy
ZWN0bHkgaW4KdGhlIGdmcCBmbGFncy4gVGhhdCdzIHBhcnRpY3VsYXJseSB0cnVlIG9mIHRoZSBz
dHVmZiBpbiBtbS92bXNjYW4uYy4KVGhpcyBpcyB3aHkgd2UgaGF2ZSB0aGUgY2hlY2sgYWJvdmUg
dGhhdCB2ZXRvcyBwYWdlIHJlbW92YWwgdXBvbgpQYWdlUHJpdmF0ZSgpIGJlaW5nIHNldC4KPiAK
Ci0tIApUcm9uZCBNeWtsZWJ1c3QKTGludXggTkZTIGNsaWVudCBtYWludGFpbmVyLCBIYW1tZXJz
cGFjZQp0cm9uZC5teWtsZWJ1c3RAaGFtbWVyc3BhY2UuY29tCgoKCi0tCkxpbnV4LWNhY2hlZnMg
bWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnM=

