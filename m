Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 73E082CE222
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 23:53:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-AIK9nojxNfyyvNPojEmHzA-1; Thu, 03 Dec 2020 17:53:40 -0500
X-MC-Unique: AIK9nojxNfyyvNPojEmHzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCE898049C1;
	Thu,  3 Dec 2020 22:53:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0EDC1349A;
	Thu,  3 Dec 2020 22:53:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D72B4BB7B;
	Thu,  3 Dec 2020 22:53:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3MrZuc013646 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 17:53:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3F48ADA68E; Thu,  3 Dec 2020 22:53:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38799F1007
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 22:53:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BE90858287
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 22:53:33 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2118.outbound.protection.outlook.com [40.107.244.118])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-17-qCgpklqfONKnrWlOPCOgAQ-1; Thu, 03 Dec 2020 17:53:30 -0500
X-MC-Unique: qCgpklqfONKnrWlOPCOgAQ-1
Received: from MN2PR13MB3957.namprd13.prod.outlook.com (2603:10b6:208:263::11)
	by MN2PR13MB3213.namprd13.prod.outlook.com (2603:10b6:208:135::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.6;
	Thu, 3 Dec 2020 22:53:26 +0000
Received: from MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e989:f666:131a:e210]) by
	MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e989:f666:131a:e210%9]) with mapi id 15.20.3632.016;
	Thu, 3 Dec 2020 22:53:26 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "bfields@fieldses.org" <bfields@fieldses.org>
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: fNDm/l4o9cYx5Rz5g0S1EO4zMAtIR4tJDJwAAAWCe4BeKhpLVGiQL7pUtKchSdvFeTqNAIAEhEYAgBNavQCAAAtBAIABTyGAgAxAb4CAAG0ggIAAGvSAgAAMzwCAAAXZAIAAE9IAgAACQQA=
Date: Thu, 3 Dec 2020 22:53:26 +0000
Message-ID: <d88c69f90820bf631908cbe3d3ce34343ec672f1.camel@hammerspace.com>
References: <20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
	<20201203185109.GB27931@fieldses.org>
	<4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
	<20201203211328.GC27931@fieldses.org>
	<9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
	<20201203224520.GG27931@fieldses.org>
In-Reply-To: <20201203224520.GG27931@fieldses.org>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 371dd2d8-a5c6-4a7e-66f5-08d897de3f0f
x-ms-traffictypediagnostic: MN2PR13MB3213:
x-microsoft-antispam-prvs: <MN2PR13MB32137E6A68A784DD3D78ECA2B8F20@MN2PR13MB3213.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: Vpk26TCOmBYn1jn9j+f9q0MsmZB5ZfXr8619RRGdGRJdHSf8+pkRrAebfrQDE4tNzPv8HCODbvcnt9LgwFMjIl5WpJWQfEr6FUcDdFc1egdjpug7QC66iP/VvOxEZR4xL3lUbpdaiGtu3xubVUBm7ONGBODgJUDhX/ZHIWnrVQsIj8CPSdrPap5/HJ/BtE3BkyNZRuK4geGoB85omIfOEE/RY6Lbi1swBmuGhtBlaChWCchg685bIU+KjvPlcBJXGY8yhe3SSb98TLoriEp1jcTuzfqgt18TnodYt5POkUjX+EMctNwKFzDp+3CTSmbrDOlkpJZaiDOuQiMyd4bVaQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MN2PR13MB3957.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(376002)(346002)(366004)(396003)(39840400004)(136003)(83380400001)(5660300002)(8936002)(86362001)(6486002)(6506007)(478600001)(36756003)(91956017)(71200400001)(6916009)(4326008)(186003)(316002)(2616005)(2906002)(54906003)(66556008)(66476007)(66946007)(8676002)(66446008)(26005)(76116006)(6512007)(64756008);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?utf-8?B?aE9tcm1QaE1kZS8zMmlVMmFTbVRLM0lDT0gzb2NCUnBVRjBoOHFQemVuOEtB?=
	=?utf-8?B?YWoxTzYwRXQ5VXdteEsrRzNoZXJHT214bmx3NUZPTzhvWXBsR3kzWXVBVkQy?=
	=?utf-8?B?eHpYYnlYTWlTL1JaN1ZvTCtRVkRGYUI1djloVGZxK3BHSkl4ejlNRTY4ZXZL?=
	=?utf-8?B?c1ZxajM5VkJnRHJlaGh6SW5neE8xcVFYbktNYVZPeGhmalNkZWRINWVPRENk?=
	=?utf-8?B?MEViS1BkaWx4MXcwSXZtTmRQWjBaSmdGM09VRHVEZ1RWMjV4SzJhTkppMHYx?=
	=?utf-8?B?dDNVb3Ixd2FxZmVTZmhpcThHaGRPQWlPOHFkeWdyU29mNDUrcXpqVzgwcFFu?=
	=?utf-8?B?WE8xcno1WnhEamFVUEI2UUFpN0JuOGdEbHNUcDZIeElqUEM4MWN6NlQ5a2hx?=
	=?utf-8?B?bWNvdTJmYWNmbkxPUll3dzY4Z3hyUVZPenp5Wk0vdmltYUVCc0t2bjdhVThs?=
	=?utf-8?B?T0ttYUVnZlkvWTlsTWxibXlHeFBvNzVvQVNTb203dmJvOEZsdEtXNkR2SlBO?=
	=?utf-8?B?d0s3d3lOTjBBZmUvWE9BSEpOenJjSk5IK3FkYTg4QWhMdit5REtJMWRZL2Zw?=
	=?utf-8?B?SDltYnI1RnE2eE02SG92bVNqR1JBY3JCdWJXazlxdEJXMVZJUGhITVVjWkJC?=
	=?utf-8?B?Z21QMnVsL3kzaHpPZkVJV3pONzUwNElEZTgrUVloTG5scWVUYko2S1N2N2Jl?=
	=?utf-8?B?M1U2SzhHMXJwbFF0WDVEVTdoWUlNSmF1WG5IN1VKUVFlTW44ZEdwN0cwbmk4?=
	=?utf-8?B?R1B5OU1RemxPaXQvR2FucnU2RUxhTk9KcDJ4b0N5aFZmWHBTYlo2Q2E5THdF?=
	=?utf-8?B?cmpqU1FUOENnUnBkaTZsRXRTb2VSV1draUtBYkV3dTdiQ3hVRVVldUlWaTQy?=
	=?utf-8?B?aUxlbE1YcG9sN2MwTUxpSXhHZHF6ZnM5c0RrUGFuQXNVcU1KeU45emsxWTQv?=
	=?utf-8?B?ZllTUXJma0lmWm0vYlVRQVdJazJrdXdNSkxYQXplYUhoaUJwT0hBT3ZQK3JG?=
	=?utf-8?B?V2doQzY0ZXo4dzhvcmFjSHBYQzVNZ0x2MUlwaGU5a0hlNlkvdG8rV05GWEho?=
	=?utf-8?B?Q3hXU1Ewb2xQWHZsMlVDOWxrdFZXM3B4cVBVUnd0dUNFRDlrSHUreDZSaERN?=
	=?utf-8?B?d3BWSXlQM0Z4Sm4yaVlGVk5VRG5aWlM1RmFWMGZwMHVGQ0Z4UzRpd3BRQjdP?=
	=?utf-8?B?cmZhSWhQUVUxamp2Z2pvNG9Ya2Z5bWVDTzNra1JTN00wM2RGVnBWK2ZUbFRN?=
	=?utf-8?B?V25XcmZPdzVwN0s4Ylhsd3hmQmhjUGZrS3Q2S3NnS1loMkM1WXB5citwcTIy?=
	=?utf-8?Q?zzlQl/p/ubGgFIR3s4wkNBwGEqNQnqQUaS?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3957.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 371dd2d8-a5c6-4a7e-66f5-08d897de3f0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 22:53:26.8477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JcU5a1dzC/KFbMnNxY3R4MXCFEVZJVHdRGwXeOio8J9OMKJj5zJOCea5Whe6AccMp/zZeP9P/ycPJAzh4f1w7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3213
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3MrZuc013646
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
Content-ID: <95A227EAFB100A44912B106A97174AA1@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTEyLTAzIGF0IDE3OjQ1IC0wNTAwLCBiZmllbGRzQGZpZWxkc2VzLm9yZyB3
cm90ZToKPiBPbiBUaHUsIERlYyAwMywgMjAyMCBhdCAwOTozNDoyNlBNICswMDAwLCBUcm9uZCBN
eWtsZWJ1c3Qgd3JvdGU6Cj4gPiBJJ3ZlIGJlZW4gd2FudGluZyBzdWNoIGEgZnVuY3Rpb24gZm9y
IHF1aXRlIGEgd2hpbGUgYW55d2F5IGluIG9yZGVyCj4gPiB0bwo+ID4gYWxsb3cgdGhlIGNsaWVu
dCB0byBkZXRlY3Qgc3RhdGUgbGVha3MgKGVpdGhlciBkdWUgdG8gc29mdAo+ID4gdGltZW91dHMs
IG9yCj4gPiBkdWUgdG8gcmVvcmRlcmVkIGNsb3NlL29wZW4gb3BlcmF0aW9ucykuCj4gCj4gT25l
IHN1cmUgd2F5IHRvIGZpeCBhbnkgc3RhdGUgbGVha3MgaXMgdG8gcmVib290IHRoZSBzZXJ2ZXIu
wqAgVGhlCj4gc2VydmVyCj4gdGhyb3dzIGV2ZXJ5dGhpbmcgYXdheSwgdGhlIGNsaWVudHMgcmVj
bGFpbSwgYWxsIHRoYXQncyBsZWZ0IGlzIHN0dWZmCj4gdGhleSBzdGlsbCBhY3R1YWxseSBjYXJl
IGFib3V0Lgo+IAo+IEl0J3MgdmVyeSBkaXNydXB0aXZlLgo+IAo+IEJ1dCB5b3UgY291bGQgZG8g
YSBsaW1pdGVkIHZlcnNpb24gb2YgdGhhdDogdGhlIHNlcnZlciB0aHJvd3MgYXdheQo+IHRoZQo+
IHN0YXRlIGZyb20gb25lIGNsaWVudCAoa2VlcGluZyB0aGUgdW5kZXJseWluZyBsb2NrcyBvbiB0
aGUgZXhwb3J0ZWQKPiBmaWxlc3lzdGVtKSwgbGV0cyB0aGUgY2xpZW50IGdvIHRocm91Z2ggaXRz
IG5vcm1hbCByZWNsYWltIHByb2Nlc3MsCj4gYXQKPiB0aGUgZW5kIG9mIHRoYXQgdGhyb3dzIGF3
YXkgYW55dGhpbmcgdGhhdCB3YXNuJ3QgcmVjbGFpbWVkLsKgIFRoZSBvbmx5Cj4gZGVsYXkgaXMg
dG8gYW55b25lIHRyeWluZyB0byBhY3F1aXJlIG5ldyBsb2NrcyB0aGF0IGNvbmZsaWN0IHdpdGgK
PiB0aGF0Cj4gc2V0IG9mIGxvY2tzLCBhbmQgb25seSBmb3IgYXMgbG9uZyBhcyBpdCB0YWtlcyBm
b3IgdGhlIG9uZSBjbGllbnQgdG8KPiByZWNsYWltLgoKT25lIGNvdWxkIGRvIHRoYXQsIGJ1dCB0
aGF0IHJlcXVpcmVzIHRoZSBleGlzdGVuY2Ugb2YgYSBxdWllc2NlbnQKcGVyaW9kIHdoZXJlIHRo
ZSBjbGllbnQgaG9sZHMgbm8gc3RhdGUgYXQgYWxsIG9uIHRoZSBzZXJ2ZXIuIFRoZXJlIGFyZQpk
ZWZpbml0ZWx5IGNhc2VzIHdoZXJlIHRoYXQgaXMgbm90IGFuIG9wdGlvbi4KCi0tIApUcm9uZCBN
eWtsZWJ1c3QKTGludXggTkZTIGNsaWVudCBtYWludGFpbmVyLCBIYW1tZXJzcGFjZQp0cm9uZC5t
eWtsZWJ1c3RAaGFtbWVyc3BhY2UuY29tCgoKCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0
CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtY2FjaGVmcw==

