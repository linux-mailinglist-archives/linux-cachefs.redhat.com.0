Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3655A007C
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Aug 2022 19:35:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661362545;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vUN67eGNpH41eCRNze7KBzhFpzrU0zYPgD2kV2Im6tc=;
	b=V5mTO+tLD/YooJNnYdMTzUnpt1sRwLZ8Tp/dLGuHr3J3J1aJr3kOo8RNXUFiJEDrRWLtN6
	Sgj3MycLFYCUOmWk7EhgjHNVU4VyxZngpV4T4tDqC3b7+B658bBEtLeBiqC9KTHPI6rS1W
	6YYEiuqSzhBXyNXLCjNqOdrHJmIXxeY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-FTcJQrkqNf2f-idX9yGgIQ-1; Wed, 24 Aug 2022 13:35:42 -0400
X-MC-Unique: FTcJQrkqNf2f-idX9yGgIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A0D0101A5AD;
	Wed, 24 Aug 2022 17:35:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 773D21121315;
	Wed, 24 Aug 2022 17:35:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5631A1946A5B;
	Wed, 24 Aug 2022 17:35:40 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5CCE11946A42 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 24 Aug 2022 16:27:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 498621415133; Wed, 24 Aug 2022 16:27:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44FD11415125
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 16:27:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BE0E1C07424
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 16:27:13 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2097.outbound.protection.outlook.com [40.107.93.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-bwJOATUmOviuCLF6zitzQA-1; Wed, 24 Aug 2022 12:27:09 -0400
X-MC-Unique: bwJOATUmOviuCLF6zitzQA-1
Received: from CH0PR13MB5084.namprd13.prod.outlook.com (2603:10b6:610:111::7)
 by DM5PR13MB1035.namprd13.prod.outlook.com (2603:10b6:3:79::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Wed, 24 Aug
 2022 16:27:05 +0000
Received: from CH0PR13MB5084.namprd13.prod.outlook.com
 ([fe80::f1c7:62d0:a63d:f5ca]) by CH0PR13MB5084.namprd13.prod.outlook.com
 ([fe80::f1c7:62d0:a63d:f5ca%3]) with mapi id 15.20.5566.014; Wed, 24 Aug 2022
 16:27:04 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "dhowells@redhat.com" <dhowells@redhat.com>
Thread-Topic: [RFC PATCH 2/3] NFS: Add support for netfs in struct nfs_inode
 and Kconfig
Thread-Index: AQHYt5zQc0jiP02yL0Kjw6guU1m2RK29/pOAgAAFTACAAAEnAIAAErsAgAAlsoA=
Date: Wed, 24 Aug 2022 16:27:04 +0000
Message-ID: <5ab3188affa7e56e68a4f66a42f45d7086c1da23.camel@hammerspace.com>
References: <da9200f1bded9b8b078a7aef227fd6b92eb028fb.camel@hammerspace.com>
 <20220824093501.384755-1-dwysocha@redhat.com>
 <20220824093501.384755-3-dwysocha@redhat.com>
 <429ecc819fcffe63d60dbb2b72f9022d2a21ddd8.camel@hammerspace.com>
 <CALF+zOknvMZyufSUD-g9Z9Y5RfwE-vUFT+CF0kxqbcpR=yJPJw@mail.gmail.com>
 <216681.1661350326@warthog.procyon.org.uk>
In-Reply-To: <216681.1661350326@warthog.procyon.org.uk>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e887ad54-5dce-4071-214b-08da85ed7b43
x-ms-traffictypediagnostic: DM5PR13MB1035:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: w8u2GmFV/CtED2on0G6dbzV62cwpI05Kgev2s0qA5D40PbRYpAi84VXjFlXadfyUqYJ4HpXEixjjkLz1LKsqLli/im3taFJdxNnl8X6ruLLaWnSbtT/esXtOqAWKPQYi1PmdkOaVHQlm+ZKaH3K0xy7qehopWRcxkouUv2ciF8OKa6g0Lr82IF3A/XPtoS9UdoRvIHiBolr4MZckFvXwjZIpfeXBwa29EBK/GHeR3YHpHgRhWSfkPQpqGq45S2pX82RQ6Up3rvYqFHx3cDMULSCAAnko/5wqPce+OtQAn6W//Nib/dFjOm9am/mj13NGwr4jF5NvdzqIl6gR6q7gAmpbIc/M0AwZ7r1dym1kPhb4poyfePlEX7MNmINYjLbfsRblirwvyAqQ7ysB2LiCxWUlwDyJHrNzgJbBOTPHEH1C/zjkjEyYcIWT7Trk9IPyAJB0HBIYH+fvXb1Gm0uL5ulrj/FrY1kDH4SS/ooW+PBpd5seYFxKSNCRsLin9i8dbdQs8ratxpAriD27g6dru61yCtFLnfSTHS3DUQEWcY2yr3RyvXNCZwYbq1V6S43SRxX0D34WUkDAtQCFWHOhGXkUvClPfcLGmkdB5YMZtJkCfvGQjgOvRjYpL4DtF8cEOoVGlPwUdUL6vMCi3n2/QUGDgsAvxLjHVUKqgDgqD4tUo32O0/o0y/vl7mVXGKqFhpFEoaZO981DYFvAaNFxW3A4YiVJRtYbHz+jS6B7dydDDNbRcYls6wGn7bej35Ko2ZRrewrmjovhoUjTjB3R8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR13MB5084.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(136003)(39840400004)(376002)(346002)(41300700001)(2906002)(38100700002)(86362001)(38070700005)(6486002)(478600001)(2616005)(186003)(6512007)(83380400001)(26005)(4326008)(71200400001)(6506007)(5660300002)(122000001)(8936002)(36756003)(66476007)(66946007)(6916009)(66446008)(66556008)(64756008)(8676002)(76116006)(316002)(54906003);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UU5wZXR1NTZiMlJQSUJTUjlWLzZCTXFhWENvTXFEd21BNld4Sm9yZERMdjVM?=
 =?utf-8?B?aUhkL0RQMnUzNnBXT0dZVFNHM01vUnZIT0RVMng4TWNlZ3BLSEJOczNYL1Ez?=
 =?utf-8?B?c2dheVJuUDFRdm5iSk9QUHNOdVoreXlERXRtQS9wVVpyQlYzWTQySmg5NkRX?=
 =?utf-8?B?SjZnd2szYk1vMXBKbDI1ZjNxK1pIbVh4UncrczRqREpxNy8xTUJPYjNPakNj?=
 =?utf-8?B?S2RBQXIxK05JckkvNWsxdDZYdHBuZThySHUrZzkycUc2SGxMcGx6ZzhEZ0hP?=
 =?utf-8?B?RzNHL3ZyVXdSakpZVkxZNGFqakQrRmpaczhnK29VcTFxdlIwd3BFWEtRVHVN?=
 =?utf-8?B?UWd3TjhsVWxjNW5iM2wwRmtsaW9GdzJlRWE1c3k0Q2dlaUNmemNwNHhqWmpJ?=
 =?utf-8?B?c05wemNUOFV3RWovUEk0V1k0RDByMGVpUDVjb200MmNWMSt1Wkc4RHRzNm4v?=
 =?utf-8?B?UEg2RGVYUmV4UVFTVUs1STBYZGFXL2o3QXZHQWxRSE85SEM1MWdhZk5RdHdl?=
 =?utf-8?B?b25OS2xyOEdXbkduaFFxMFRSZWVDVm9FZ1NOeXU2NjhSR29oZUY1T2tESElz?=
 =?utf-8?B?ek9KM0xXdTlsdXBUU0VZQ2dmL1JmemYybWg5MTFPcXJwa2Zpb2VjVEh3dWhr?=
 =?utf-8?B?US9yc1AyTVZNY2FYY3crYXFIS2QwWVYyelF5czlkejdKYWZuYm9XN0pzVjg3?=
 =?utf-8?B?Ujg3SytWM211c0JPcnhJMGNSaHloejVTK2xSSEMzWXRwNUZjalE5Y0RSRlhy?=
 =?utf-8?B?VFFRTUFHODg4K2ttUXVwYjFXTitjdFpVczROemVaSURhalNWbHg0SEVRei9v?=
 =?utf-8?B?YVErbHZFVU5YSVJiYjJvRnBWMk9Tdlg0Rm1FNEcwT3d3Q1UvSXl3RHFvNEhv?=
 =?utf-8?B?bHpEQVRrUlczRCtOSDZLcXhjaWY0VG5wajEvSi82ekdJclZVMy9CRGpHMHdF?=
 =?utf-8?B?TDdtN0VRNzlQdFY3UUxhTVpRK1ZhVnlZL3VIODQ0TndsWlYyMi9mM0JaaTh4?=
 =?utf-8?B?Nk9xSU1MQTZwbWt0QXM1TEZBWityM1JSb1QrZjlJdSsrYzQ2R0h0VTB5cUpZ?=
 =?utf-8?B?aUh5dmZmRWp0cllybVBFdzIvbWpZNkVNbnY1VkV4ZmFBandRRWpZZ2xYZEZK?=
 =?utf-8?B?SHA4U251My8zazd5MlpUQVh3YVFjMkIwQm01MXFsVmRCdlA3R2ZhOG1XYjF5?=
 =?utf-8?B?UFlqZSsxZURka1hYbzJReXVCTG0xRE10THcrbWZoTzQxc0RPMVZRWGJSNWx1?=
 =?utf-8?B?Rm9ZU0FSSkgveXdlY1VTUVp5cE91eGgwZFRNMER0dlhVc2tBM3BnbWFnTTlZ?=
 =?utf-8?B?NDlvTDNVc3NETzA1SHozc2ordkExNkRoOGtsQUhXeGY5VDNOSDNYTnZnNEJw?=
 =?utf-8?B?cjRvd3BCSkloUTZBVzFsN3BRSitjYnBGNHNuVnVRbTIwT3B6K1A3QVRHTGFu?=
 =?utf-8?B?YU5OSU5QVit3Zmsvem94TnI3ZVJMRWtDK1B2ZnBkdW5HZnRWMWFUVVdyWnRG?=
 =?utf-8?B?a3VwSFFmeE1Qc1VoVXRIbjJGUnlsRHpCZnRDQVE0TGpFdUlGcG5KNlhRa2RM?=
 =?utf-8?B?bCswUVI2d3NrVXhMMTR4TFNQdFU3YnY3cnlOZUk1a0pDTXR6cTlKQ2NUYi9o?=
 =?utf-8?B?YzMvTnNBcmxPY25ZR1haMWFEOEdVa0xVTUdHOWZCZmgySk9XQWRweHFIbFZ4?=
 =?utf-8?B?ZEhTY3VkVG82dXZwN1JBa1RySUNyRHpLbEdaSXhPaTRTS0ZBS1duTVpxeUkx?=
 =?utf-8?B?SkZzZDhMOHlDSlNwcFBTYk9oR25iOG1QNUQyNHRBTzNVU2poKzR3S2lHcDlC?=
 =?utf-8?B?WDBEWGUxUmZVY0RtSUVDc0d5UTl3V0dPMi9SNnhjVmhhSVZ3cWo0QnNPQTQz?=
 =?utf-8?B?VzJjQUhKNEp4ajY5SnhqZzJpdzdhQm9QajdSL3ZIWVIyYTdGTjEvMXUrVnRj?=
 =?utf-8?B?KzYvZlA0bCt5VXNUdnNDQWdvbWIxY0NhaGtZditnVnBWM2szRmdnWksrV0tP?=
 =?utf-8?B?VFlzVXJ2Ry9YUGU4aUY0OVRoMDZMMUQ5Vmt2cS9wV0FFbldWc2VERUVUclVq?=
 =?utf-8?B?SndEQkV2QzA2Sk10K3liV2ZldnRueCs5ZlRmREdZM21sbTVVam8yZktDeEZv?=
 =?utf-8?B?dUZGbEJTTi8yTllhRzQybEl2K2toQUNMUEJ1STJJNSt3OVNZcXZpenJxZnhQ?=
 =?utf-8?B?Y3c9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR13MB5084.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e887ad54-5dce-4071-214b-08da85ed7b43
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 16:27:04.7617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VdxG8bGjNFcYUI1xCu3lQkJgrganEKOzYj1pGFeSXpdEjtnZDjYBPEMcAcR1BThjmsg7LeWKReb8BzF7/nNtNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1035
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Linux-cachefs] [RFC PATCH 2/3] NFS: Add support for netfs in
 struct nfs_inode and Kconfig
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 "benmaynard@google.com" <benmaynard@google.com>,
 "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <8E576AAC17F45E459BE099D236F00D1A@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIyLTA4LTI0IGF0IDE1OjEyICswMTAwLCBEYXZpZCBIb3dlbGxzIHdyb3RlOg0K
PiBUcm9uZCBNeWtsZWJ1c3QgPHRyb25kbXlAaGFtbWVyc3BhY2UuY29tPiB3cm90ZToNCj4gDQo+
ID4gQXMgbG9uZyBhcyBpdCBpcyBhbiBvcHQtaW4gZmVhdHVyZSwgSSdtIE9LLiBJIGRvbid0IHdh
bnQgdG8gaGF2ZSB0bw0KPiA+IGNvbXBpbGUgaXQgaW4gYnkgZGVmYXVsdC4NCj4gPiBBIGNhY2hl
ZnMgc2hvdWxkIG5ldmVyIGJlY29tZSBhIG1hbmRhdG9yeSBmZWF0dXJlIG9mIG5ldHdvcmtlZA0K
PiA+IGZpbGVzeXN0ZW1zLg0KPiANCj4gbmV0ZnNsaWIgaXMgaW50ZW5kZWQgdG8gYmUgdXNlZCBl
dmVuIGlmIGZzYWNoZSBpcyBub3QgZW5hYmxlZC7CoCBJdCBpcw0KPiBpbnRlbmRlZA0KPiB0byBt
YWtlIHRoZSB1bmRlcmx5aW5nIG5ldHdvcmsgZmlsZXN5c3RlbSBtYWludGFpbmVyJ3MgbGlmZSBl
YXNpZXINCj4gYnk6DQo+IA0KPiDCoC0gTW92aW5nIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBhbGwg
dGhlIFZNIG9wcyBmcm9tIHRoZSBuZXR3b3JrDQo+IGZpbGVzeXN0ZW1zIGFzDQo+IMKgwqAgbXVj
aCBhcyBwb3NzaWJsZSBpbnRvIG9uZSBwbGFjZS7CoCBUaGUgbmV0d29yayBmaWxlc3lzdGVtIHRo
ZW4ganVzdA0KPiBoYXMgdG8NCj4gwqDCoCBwcm92aWRlIGEgcmVhZCBvcCBhbmQgYSB3cml0ZSBv
cC4NCj4gDQo+IMKgLSBNYWtpbmcgaXQgc3VjaCB0aGF0IHRoZSBmaWxlc3lzdGVtIGRvZXNuJ3Qg
aGF2ZSB0byBkZWFsIHdpdGggdGhlDQo+IGRpZmZlcmVuY2UNCj4gwqDCoCBiZXR3ZWVuIERJTyBh
bmQgYnVmZmVyZWQgSS9PDQo+IA0KPiDCoC0gSGFuZGxpbmcgVk0gZmVhdHVyZXMgb24gYmVoYWxm
IG9mIGFsbCBmaWxlc3lzdGVtcy7CoCBUaGlzIGdpdmVzIHRoZQ0KPiBWTSBmb2xrDQo+IMKgwqAg
b25lIHBsYWNlIHRvIGNoYW5nZSBpbnN0ZWFkIG9mIDUrLsKgIG1wYWdlIGFuZCBpb21hcCBhcmUg
c2ltaWxhcg0KPiB0aGluZ3MgYnV0DQo+IMKgwqAgZm9yIGJsb2NrZGV2IGZpbGVzeXN0ZW1zLg0K
PiANCj4gwqAtIFByb3ZpZGluZyBmZWF0dXJlcyB0byB0aG9zZSBmaWxlc3lzdGVtcyB0aGF0IGNh
biBzdXBwb3J0IHRoZW0sDQo+IGVnLjoNCj4gDQo+IMKgwqAgLSBmc2NyeXB0DQo+IMKgwqAgLSBj
b21wcmVzc2lvbg0KPiDCoMKgIC0gYm91bmNlIGJ1ZmZlcmluZw0KPiDCoMKgIC0gbG9jYWwgY2Fj
aGluZw0KPiDCoMKgIC0gZGlzY29ubmVjdGVkIG9wZXJhdGlvbg0KPiANCj4gDQo+IEN1cnJlbnRs
eSBuZnMgaW50ZXJhY3RzIHdpdGggZnNjYWNoZSBvbiBhIHBhZ2UtYnktcGFnZSBiYXNpcywgYnV0
DQo+IHRoaXMgbmVlZHMNCj4gdG8gY2hhbmdlOg0KPiANCj4gwqAoMSkgTXVsdGlwYWdlIGZvbGlv
cyBhcmUgbm93IGEgdGhpbmcuwqAgWW91IG5lZWQgdG8gcm9sbCBmb2xpb3Mgb3V0DQo+IGludG8g
bmZzDQo+IMKgwqDCoMKgIGlmIHlvdSdyZSBnb2luZyB0byB0YWtlIGFkdmFudGFnZSBvZiB0aGlz
LsKgIEFsc28sIHlvdSBtYXkgaGF2ZQ0KPiBub3RpY2VkDQo+IMKgwqDCoMKgIHRoYXQgYWxsIHRo
ZSBWTSBpbnRlcmZhY2VzIGFyZSBiZWluZyByZWNhc3QgaW4gdGVybXMgb2YgZm9saW9zLg0KDQpS
aWdodCBub3csIEkgc2VlIGxpbWl0ZWQgdmFsdWUgaW4gYWRkaW5nIG11bHRpcGFnZSBmb2xpb3Mg
dG8gTkZTLg0KDQpXaGlsZSBiYXNpYyBORlN2NCBkb2VzIGFsbG93IHlvdSB0byBwcmV0ZW5kIHRo
ZXJlIGlzIGEgZnVuZGFtZW50YWwNCnVuZGVybHlpbmcgYmxvY2sgc2l6ZSwgcE5GUyBoYXMgY2hh
bmdlZCBhbGwgdGhhdCwgYW5kIHdlIGhhdmUgaGFkIHRvDQplbmdpbmVlciBzdXBwb3J0IGZvciBk
ZXRlcm1pbmluZyB0aGUgSS9PIGJsb2NrIHNpemUgb24gdGhlIGZseSwgYW5kDQpidWlsZGluZyB0
aGUgUlBDIHJlcXVlc3RzIGFjY29yZGluZ2x5LiBDbGllbnQgc2lkZSBtaXJyb3JpbmcganVzdCBh
ZGRzDQp0byB0aGUgZnVuLg0KDQpBcyBJIHNlZSBpdCwgdGhlIG9ubHkgdmFsdWUgdGhhdCBtdWx0
aXBhZ2UgZm9saW9zIG1pZ2h0IGJyaW5nIHRvIE5GUw0Kd291bGQgYmUgc21hbGxlciBwYWdlIGNh
Y2hlIG1hbmFnZW1lbnQgb3ZlcmhlYWQgd2hlbiBkZWFsaW5nIHdpdGggbGFyZ2UNCmZpbGVzLg0K
DQo+IA0KPiDCoCgyKSBJIG5lZWQgdG8gZml4IHRoZSBjYWNoZSBzbyB0aGF0IGl0IG5vIGxvbmdl
ciB1c2VzIHRoZSBiYWNraW5nDQo+IMKgwqDCoMKgIGZpbGVzeXN0ZW0ncyBtZXRhZGF0YSB0byB0
cmFjayBjb250ZW50LsKgIFRvIG1ha2UgdGhpcyB1c2UgbGVzcw0KPiBkaXNrc3BhY2UsDQo+IMKg
wqDCoMKgIEkgd2FudCB0byBpbmNyZWFzZSB0aGUgY2FjaGUgYmxvY2sgc2l6ZSB0bywgc2F5LCAy
NTZLIG9yIDJNLg0KPiANCj4gwqDCoMKgwqAgVGhpcyBtZWFucyB0aGF0IHRoZSBjYWNoZSBuZWVk
cyB0byBoYXZlIGEgc2F5IGluIGhvdyBiaWcgYSByZWFkDQo+IHRoZQ0KPiDCoMKgwqDCoCBuZXR3
b3JrIGZpbGVzeXN0ZW0gZG9lcyAtIGFuZCBhbHNvIHRoYXQgYSBzaW5nbGUgY2FjaGUgcmVxdWVz
dA0KPiBtaWdodCBuZWVkDQo+IMKgwqDCoMKgIHRvIGJlIHN0aXRjaGVkIHRvZ2V0aGVyIGZyb20g
bXVsdGlwbGUgcmVhZCBvcHMuDQo+IA0KPiDCoCgzKSBNb3JlIHBhZ2VjYWNoZSBjaGFuZ2VzIGFy
ZSBsdXJraW5nIGluIHRoZSBmdXR1cmUsIHBvc3NpYmx5DQo+IGluY2x1ZGluZw0KPiDCoMKgwqDC
oCBnZXR0aW5nIHJpZCBvZiB0aGUgY29uY2VwdCBvZiBwYWdlcyBlbnRpcmVseSBmcm9tIHRoZSBw
YWdlY2FjaGUuDQo+IA0KPiBUaGVyZSBhcmUgdXNlcnMgb2YgbmZzICsgZnNjYWNoZSBhbmQgd2Un
ZCBsaWtlIHRvIGNvbnRpbnVlIHRvIHN1cHBvcnQNCj4gdGhlbSBhcw0KPiBiZXN0IGFzIHBvc3Np
YmxlIGJ1dCB0aGUgY3VycmVudCBjb2RlIG5vdGljYWJseSBkZWdyYWRlcyBwZXJmb3JtYW5jZQ0K
PiBoZXJlLg0KPiANCj4gVW5mb3J0dW5hdGVseSwgSSdtIGFsc28gZ29pbmcgdG8gbmVlZCB0byBk
cm9wIHRoZSBmYWxsYmFjayBpbnRlcmZhY2UNCj4gd2hpY2ggbmZzDQo+IGN1cnJlbnRseSB1c2Vz
IGluIHRoZSBuZXh0IGNvdXBsZSB2ZXJzaW9ucywgd2UgaGF2ZSB0byBhdCBsZWFzdCBnZXQNCj4g
dGhlDQo+IGZzY2FjaGUgZW5hYmxlZCBjb252ZXJzaW9uIGRvbmUuDQo+IA0KPiBJJ3ZlIGJlZW4g
ZGVhbGluZyB3aXRoIHRoZSBWTSwgOXAsIGNlcGggYW5kIGNpZnMgcGVvcGxlIG92ZXIgdGhlDQo+
IGRpcmVjdGlvbg0KPiB0aGF0IG5ldGZzbGliIG1pZ2h0IG5lZWQgdG8gZ28gaW4sIGJ1dCBmb3Ig
bmZzLCBpdCdzIHR5cGljYWxseSBiZWVuIGENCj4gZmxhdA0KPiAibm8iLsKgIEkgd291bGQgbGlr
ZSB0byB3b3JrIG91dCBob3cgdG8gbWFrZSBuZXRmc2xpYiB3b3JrIGZvciBuZnMNCj4gYWxzbywg
aWYNCj4geW91J3JlIHdpbGxpbmcgdG8gZGlzY3VzcyBpdC4NCj4gDQo+IEkgd291bGQgYmUgb3Bl
biB0byBoYXZpbmcgYSBsb29rIGF0IGltcG9ydGluZyBuZnMgcGFnZSBoYW5kbGluZyBpbnRvDQo+
IG5ldGZzbGliDQo+IGFuZCB3b3JraW5nIGZyb20gdGhhdCAtIGJ1dCBpdCBzdGlsbCBuZWVkcyB0
byBkZWFsIHdpdGggKDEpIGFuZCAoMikNCj4gYWJvdmUsIGFuZA0KPiBJIHdvdWxkIGxpa2UgdG8g
bWFrZSBpdCBwYXNzIGl0ZXJhdG9ycyBkb3duIHRvIHRoZSBsb3dlciBsYXllcnMgYXMNCj4gYnVm
ZmVyDQo+IGRlc2NyaXB0aW9ucy7CoCBJdCdzIGFsc28gdmVyeSBjb21wbGljYXRlZCBzdHVmZi4N
Cj4gDQo+IEFsc286DQo+IA0KPiDCoC0gSSd2ZSBub3RlZCB0aGUgbmZzX3BhZ2Ugc3RydWN0cyB0
aGF0IG5mcyB1c2VzIGFuZCBJJ20gbG9va2luZyBhdCBhDQo+IHdheSBvZg0KPiDCoMKgIGhhdmlu
ZyBzb21ldGhpbmcgc2ltaWxhciwgYnV0IGhlbGQgc2VwYXJhdGVseSBzbyB0aGF0IG9uZSBzdHJ1
Y3QNCj4gY2FuIHNwYW4NCj4gwqDCoCBhbmQgc3RvcmUgaW5mb3JtYXRpb24gYWJvdXQgbXVsdGlw
bGUgZm9saW9zLg0KPiANCj4gwqAtIEknbSBsb29raW5nIGF0IHB1bnRpbmcgd3JpdGUtdG8tdGhl
LWNhY2hlIHRvIHdyaXRlcGFnZXMoKSBvcg0KPiBzb21ldGhpbmcgbGlrZQ0KPiDCoMKgIHRoYXQg
c28gdGhhdCB0aGUgVk0gZm9sa3MgY2FuIHJlY2xhaW0gdGhlIFBHX3ByaXZhdGVfMiBmbGFnIGJp
dCwNCj4gc28gdGhhdA0KPiDCoMKgIHdvbid0IGJlIGF2YWlsYWJsZSB0byBuZnMgZWl0aGVyIGlu
IHRoZSBmdXR1cmUuDQo+IA0KPiDCoC0gYW9wcy0+d3JpdGVfYmVnaW4oKSBhbmQgLT53cml0ZV9l
bmQoKSBhcmUgZ29pbmcgdG8gZ28gYXdheS7CoCBJbg0KPiBuZXRmc2xpYg0KPiDCoMKgIHdoYXQg
SSdtIHRyeWluZyB0byBkbyBpcyBtYWtlIGEgIm5ldGZzX3BlcmZvcm1fd3JpdGUiIGFzIGENCj4g
cGFyYWxsZWwgdG8NCj4gwqDCoCBnZW5lcmljX3BlcmZvcm1fd3JpdGUoKS4NCj4gDQoNCldoYXQg
cHJvYmxlbXMgd291bGQgYW55IG9mIHRoaXMgc29sdmUgZm9yIE5GUz8gSSdtIHdvcnJpZWQgYWJv
dXQgdGhlDQpjb3N0IG9mIGFsbCB0aGlzIHByb3Bvc2VkwqBjb2RlIGNodXJuIGFzIHdlbGw7IGFz
IHlvdSBzYWlkICdpdCBpcw0KY29tcGxpY2F0ZWQgc3R1ZmYnLCBtYWlubHkgZm9yIHRoZSBnb29k
IHJlYXNvbiB0aGF0IHdlJ3ZlIGJlZW4NCm9wdGltaXNpbmcgYSBsb3Qgb2YgY29kZSBvdmVyIHRo
ZSBsYXN0IDI1LTMwIHllYXJzLg0KDQpIb3dldmVyIGxldCdzIHN0YXJ0IHdpdGggdGhlICJ3aHk/
IiBxdWVzdGlvbiBmaXJzdC4gV2h5IGRvIEkgbmVlZCBhbg0KZXh0cmEgbGF5ZXIgb2YgYWJzdHJh
Y3Rpb24gYmV0d2VlbiBORlMgYW5kIHRoZSBWTSwgd2hlbiBvbmUgb2YgbXkNCnByaW1hcnkgY29u
Y2VybnMgcmlnaHQgbm93IGlzIHRoYXQgdGhlIHN0YWNrIGRlcHRoIGtlZXBzIGdyb3dpbmc/DQoN
Ci0tIA0KVHJvbmQgTXlrbGVidXN0DQpMaW51eCBORlMgY2xpZW50IG1haW50YWluZXIsIEhhbW1l
cnNwYWNlDQp0cm9uZC5teWtsZWJ1c3RAaGFtbWVyc3BhY2UuY29tDQoNCg0KLS0KTGludXgtY2Fj
aGVmcyBtYWlsaW5nIGxpc3QKTGludXgtY2FjaGVmc0ByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1h
bi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVmcwo=

