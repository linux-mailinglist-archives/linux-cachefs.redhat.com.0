Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B613F59FAFF
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Aug 2022 15:16:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661346986;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ya8eDyPsl6OE4RBMzWgh0rZeEClDm4Duw8cuz+Vv1ao=;
	b=dcdwVdhe9JrFSXNANgDWvnigM1PjWdN2wKPt7oK5Uz0Mb4dEO8NctVkbrARUPB0IW6kcvK
	MfLjPLbUPiHwf5EAj9T1kAbhANfLINN77ro2QUdVE4HF0XrFfslSEeBJyRl59un4J/x/rI
	8+omtsDfqXWH1+GBv9RR7XDOOinizG4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-djjPjelZM2uRLlVGkuB_JA-1; Wed, 24 Aug 2022 09:16:23 -0400
X-MC-Unique: djjPjelZM2uRLlVGkuB_JA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E9BD85A596;
	Wed, 24 Aug 2022 13:16:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E83AC15BBA;
	Wed, 24 Aug 2022 13:16:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C68311946A58;
	Wed, 24 Aug 2022 13:16:21 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DE7F01946A42 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 24 Aug 2022 12:42:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 94E8A40466A7; Wed, 24 Aug 2022 12:42:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9031A404C6EB
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 12:42:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 749418039A1
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 12:42:09 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2090.outbound.protection.outlook.com [40.107.243.90]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-deV5-MZPPNiVg1k6l0FTKQ-1; Wed, 24 Aug 2022 08:42:06 -0400
X-MC-Unique: deV5-MZPPNiVg1k6l0FTKQ-1
Received: from CH0PR13MB5084.namprd13.prod.outlook.com (2603:10b6:610:111::7)
 by SA1PR13MB5633.namprd13.prod.outlook.com (2603:10b6:806:230::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Wed, 24 Aug
 2022 12:42:02 +0000
Received: from CH0PR13MB5084.namprd13.prod.outlook.com
 ([fe80::f1c7:62d0:a63d:f5ca]) by CH0PR13MB5084.namprd13.prod.outlook.com
 ([fe80::f1c7:62d0:a63d:f5ca%3]) with mapi id 15.20.5566.014; Wed, 24 Aug 2022
 12:42:01 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>,
 "dwysocha@redhat.com" <dwysocha@redhat.com>, "dhowells@redhat.com"
 <dhowells@redhat.com>
Thread-Topic: [RFC PATCH 2/3] NFS: Add support for netfs in struct nfs_inode
 and Kconfig
Thread-Index: AQHYt5zQc0jiP02yL0Kjw6guU1m2RK29/pOA
Date: Wed, 24 Aug 2022 12:42:01 +0000
Message-ID: <429ecc819fcffe63d60dbb2b72f9022d2a21ddd8.camel@hammerspace.com>
References: <20220824093501.384755-1-dwysocha@redhat.com>
 <20220824093501.384755-3-dwysocha@redhat.com>
In-Reply-To: <20220824093501.384755-3-dwysocha@redhat.com>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 882874e8-3e43-4fe7-673b-08da85ce0acd
x-ms-traffictypediagnostic: SA1PR13MB5633:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: Vmynj3J/YT4AlnnIZDauZXPE0q2ksi2BAuyU7hbkD17MOmigD6HAuneB37EcLRrlmgPhdsjAmHAxyL2Jt7QCKDCqerB2nbVyoNqbuzek321ad4RrcyywUIC4+Pv5QVMVMahWY9akG+KL1O2T0CBArfVxDjQC34jkLA5s2N0dx4pKPxW9JORmyrS+b6pcUqBonCKFxFTB0YuJC2+ROrpDQEo787d40DcQfFyHqpM1n8FdLo+MIhVoxhffRhMwm3whklrBzvpTv/hCnGG5m3nWICJLd8WsoopEiFb8jlImW4rx6dZCYTcZ7L9EK5YrbE8BjPQBxVRGEQrD7kmpUdPYxPD8pUaNn8Hf7j5/aO85NwoU9NTRQPnD221mTJGhvKOq6PbL9c9WpGdLp23aJA/N0EemivPjq35+S/8NxlACjv8mvf7n5NoUReK36mp0y7bLRPjJnU6JNIp9GiuroTIXWn/AXR7vlzcYorrhdtLs8u5n93YslesQt8B+nxiVHQvNW/l9RKKgH43Aq1kwp5rc9Xav+lLAWuVz55vG7Jjlf/ybn/n7e2o3xQS67+qA7ycFwPqcZfoDH5BA+efxo+5DqqYV/LUQxCi/KQxr3KV+ZXQ9EuCTAR4Wmd9Ui6Nfxj8e8784zfWp2hkZz16NLhiX5eh+9PMKc14eJlUg9CGOlIF09PhQfN5jk6Lq5VT3QS8TKz8dKCzmPVUbCypzuSimV6dxAlXmOapH0ouDR48CrDlvfSh5BW0mF47O8tQr0K+m
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR13MB5084.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(366004)(376002)(136003)(39840400004)(66446008)(66476007)(4326008)(71200400001)(66946007)(8936002)(66556008)(41300700001)(64756008)(8676002)(36756003)(76116006)(316002)(478600001)(5660300002)(6486002)(110136005)(6506007)(2906002)(26005)(186003)(2616005)(38100700002)(54906003)(86362001)(6512007)(38070700005)(83380400001)(122000001);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzJIbEhtYVpxV3VBM3ZOcVFIemlObUEybDZ6MllHVTdnUEprNjRRajlZV2l2?=
 =?utf-8?B?ZVFwZ0ZIellqVzExaC8rbDRQSWdTZThweXNMK3ZxODFacXNOdDBiU2p1V042?=
 =?utf-8?B?b0JzaW5GNDNhQm1pWnRBczAxNG1YT1hIRC9lUWZCNDN0bFNUYVNkVkphZzNV?=
 =?utf-8?B?YmU3Mkw4T0RpbEx4ZTB5a3ZmKzh3Ulk5Nk9DKzNmeFBPenhHZ2tzcFVhOGo5?=
 =?utf-8?B?dlU3Tytzdit6L1Y0Mk83VmVqMFoyMmNMNnZUSjgvVmtvaWpLYVRrank0TDIw?=
 =?utf-8?B?ckJwaDVPQVg2NHZJU1dMdWNJSDd0VmxHU2xkM21zSlpBS0NqRmRMaVphU0Z1?=
 =?utf-8?B?bHd3SEhWcU5GQ0pLOTJGY2NTUk1uMVo1OFZxYk1qT3psNzB2VE9SdjNtYm9X?=
 =?utf-8?B?eDE0VWNEMHZWcFUweHk5ZWlDSkRPZUF1b1U1Tk50dFBEbHN5Y0NqK3FRVHYz?=
 =?utf-8?B?ZndhdENsYURPOXE5VXJOeE5HVGtWbnlFVlY0dTBiRlIrT0VwelFjaHpvRmJJ?=
 =?utf-8?B?Rnl1QXQ1U1VvNGRGOHJSNjBLSVZwWTc0c0Zpc2d6NGRTcUd0MTJnbzdSZ0px?=
 =?utf-8?B?TERvU1k2TTdJK09xVjRZZVluMW8wNnVEd1lrcWZFMFRWRU42Tm1nSWF5c1Ri?=
 =?utf-8?B?MjF0RldNRHpCNXdYUytpcitnSWZSTy9MQUNSeE5DeDRzWmNoLzByLzhmejVa?=
 =?utf-8?B?eDRvU1JJTS9KS1A4WUg4YzFlQ0tmVEZ6VDFGS1cyMVNpTkdTVnZJS3J3Q1dm?=
 =?utf-8?B?dXllRWlBSlc1TlY1VVBBYms0VFdxVXBpZ0F1WjcwYmxXMDQvRjEvSlM3ZE8y?=
 =?utf-8?B?T0pxczhSbmhCbGQwZi95bURuZUZMTXpyeVlRZm50UjVFbHF6S3ZwZ3NqNi9u?=
 =?utf-8?B?cVZKbHF6aWQ5TkVpeFIxRWZ4WVBYZ2V2em01MkNsaEtmd1VMeW1tV3pQWjIw?=
 =?utf-8?B?eTRucWJEV2VneE5HTHN5VTR3SGVPY3lBSkdkRktPTjhqMFBhQzBWY280TTMy?=
 =?utf-8?B?eGhGVTcxTW9MbEhVbE5DbUxVQThXcjBENEpqMkxuMEFmbm41QjFSa2tRcEFy?=
 =?utf-8?B?RkVGbVAxeEpLdG8xN0lvbnRwTFNLZmVaT2xGT0Z2d01KMDhKOGlEaVpXYUZG?=
 =?utf-8?B?bUhkVkJPdjhnL0RwNU1heVlrZ09jMVJSQUZpWkx4RFV4bUhUQTErTzZybllr?=
 =?utf-8?B?ZUpoS05kRzdOT0hNUE01T1NpV0MrK0lkRXk2cHhnNWo2NEs2Vzk4WDU2TWNV?=
 =?utf-8?B?Q0t0WGk5MDl2c2FTb2tpU1hYZnRuUkpLRVJOc1JhSTlVc3pzaHhodzNmbnZB?=
 =?utf-8?B?QVF3U1ZVT2EzQkJtUTNuZ3JwSEZldlFaVHhqQld2YkFHWGdLcU9sSjRObzVO?=
 =?utf-8?B?WHNxTHVPNnJwTUNvaWdMdm5NODNCTUNKSUlrZjJIM1BZNVVPUlpka2pDOHc5?=
 =?utf-8?B?SlFDYVVzVFR6eEJxcnlraTAvZjc1dlVJOVdIL2dOQWdVUE5zdy9BVHhXMml4?=
 =?utf-8?B?ZU95RW9veXZDUmNtdWFXaFFsaXNlQjhSTEZhZVVYWDhOS1V1L0N4dmQrUWYr?=
 =?utf-8?B?cXRVTUZFQUdKSS9VZndIUmNMSzR3Ykx4ZjQxcW5meU5HTEVwVWlCZi84SmF5?=
 =?utf-8?B?TWdyb3N2MWd3NlhmK2tyQWZublNvbTl2aVpJRE5lQUdVWmtTT1lUZTViNVhI?=
 =?utf-8?B?dExCVEl5RmR3OVVRR2x3elpLMnBwOThHRXlSZTFicnFra3M1TE5sVWI4WXQ2?=
 =?utf-8?B?bUpOa2hmM0FmM0hPOUt3cWNMQjdVcUd3WUk0NHdWVmhWZnZOMFduZXY2VldR?=
 =?utf-8?B?TjdYZU5YN2REWi9vWEVrVm1seG9VRFVqWFFldm5LLzcrYVkvTSswVDZET0lI?=
 =?utf-8?B?VDlYQmg3U1VtVDRSblU2RVl6bXdaVnFUMUhCTFlHQjNpVEc5SklZYjBTK2JY?=
 =?utf-8?B?QVZkZktJN1Z2R3R0T0J3M2tjVlZJdDN6UzJVR2hKc2lBeVpPSmtFOFVPK2Zp?=
 =?utf-8?B?dG1Ba3l5d1A5b0JiM1NhTVFpbENjL0FVRkFuRHMzNHpKWFVZUGlKV3FWZTRT?=
 =?utf-8?B?RzhhdFJwZnlNc0sxNzlKNS9XMGEvVXRTcnRTMjVxeS9XczRyVDJWRnJlbzNR?=
 =?utf-8?B?aENSaG5pd2NlbTVJaGlzNzNLUGZsbFVMTlhCcGovQytWaTVhVlpsYzdsdm0z?=
 =?utf-8?B?dEE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR13MB5084.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882874e8-3e43-4fe7-673b-08da85ce0acd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 12:42:01.6712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5up/rkQbqdxkdCkXEGAe4YR2s7FkeFXPc1OgDgqnpZh9S7GdFMjuDNPbwvx/mRe94xTAkts5kvUCW4/oOSMSSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR13MB5633
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 "benmaynard@google.com" <benmaynard@google.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <262D79942952D345B475EEE022415AF6@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIyLTA4LTI0IGF0IDA1OjM1IC0wNDAwLCBEYXZlIFd5c29jaGFuc2tpIHdyb3Rl
Og0KPiBBcyBmaXJzdCBzdGVwcyBmb3Igc3VwcG9ydCBvZiB0aGUgbmV0ZnMgbGlicmFyeSwgYWRk
IE5FVEZTX1NVUFBPUlQNCj4gdG8gS2NvbmZpZyBhbmQgYWRkIHRoZSByZXF1aXJlZCBuZXRmc19p
bm9kZSBpbnRvIHN0cnVjdCBuZnNfaW5vZGUuDQo+IFRoZSBzdHJ1Y3QgbmV0ZnNfaW5vZGUgaXMg
bm93IHdoZXJlIHRoZSB2ZnNfaW5vZGUgaXMgc3RvcmVkIGFzIHdlbGwNCj4gYXMgdGhlIGZzY2Fj
aGVfY29va2llLsKgIEluIGFkZGl0aW9uLCB1c2UgdGhlIG5ldGZzX2lub2RlKCkgYW5kDQo+IG5l
dGZzX2lfY29va2llKCkgaGVscGVycywgYW5kIHJlbW92ZSBvdXIgb3duIGhlbHBlciwgbmZzX2lf
ZnNjYWNoZSgpLg0KPiANCj4gTGF0ZXIgcGF0Y2hlcyB3aWxsIGVuYWJsZSBuZXRmcyBieSBkZWZp
bmluZyBORlMgc3BlY2lmaWMgdmVyc2lvbg0KPiBvZiBzdHJ1Y3QgbmV0ZnNfcmVxdWVzdF9vcHMg
YW5kIGNhbGxpbmcgbmV0ZnNfaW5vZGVfaW5pdCgpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRGF2
ZSBXeXNvY2hhbnNraSA8ZHd5c29jaGFAcmVkaGF0LmNvbT4NCj4gLS0tDQo+IMKgZnMvbmZzL0tj
b25maWfCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsNCj4gwqBmcy9uZnMvZGVsZWdhdGlvbi5jwqDC
oMKgIHzCoCAyICstDQo+IMKgZnMvbmZzL2Rpci5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIg
Ky0NCj4gwqBmcy9uZnMvZnNjYWNoZS5jwqDCoMKgwqDCoMKgIHwgMjAgKysrKysrKysrLS0tLS0t
LS0tLS0NCj4gwqBmcy9uZnMvZnNjYWNoZS5owqDCoMKgwqDCoMKgIHwgMTUgKysrKysrLS0tLS0t
LS0tDQo+IMKgZnMvbmZzL2lub2RlLmPCoMKgwqDCoMKgwqDCoMKgIHzCoCA2ICsrKy0tLQ0KPiDC
oGZzL25mcy9pbnRlcm5hbC5owqDCoMKgwqDCoCB8wqAgMiArLQ0KPiDCoGZzL25mcy9wbmZzLmPC
oMKgwqDCoMKgwqDCoMKgwqAgfCAxMiArKysrKystLS0tLS0NCj4gwqBmcy9uZnMvd3JpdGUuY8Kg
wqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0NCj4gwqBpbmNsdWRlL2xpbnV4L25mc19mcy5oIHwgMTkg
KysrKystLS0tLS0tLS0tLS0tLQ0KPiDCoDEwIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMo
KyksIDQ3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2ZzL25mcy9LY29uZmlnIGIv
ZnMvbmZzL0tjb25maWcNCj4gaW5kZXggMTRhNzIyMjRiNjU3Li43OWIyNDFiZWQ3NjIgMTAwNjQ0
DQo+IC0tLSBhL2ZzL25mcy9LY29uZmlnDQo+ICsrKyBiL2ZzL25mcy9LY29uZmlnDQo+IEBAIC01
LDYgKzUsNyBAQCBjb25maWcgTkZTX0ZTDQo+IMKgwqDCoMKgwqDCoMKgwqBzZWxlY3QgTE9DS0QN
Cj4gwqDCoMKgwqDCoMKgwqDCoHNlbGVjdCBTVU5SUEMNCj4gwqDCoMKgwqDCoMKgwqDCoHNlbGVj
dCBORlNfQUNMX1NVUFBPUlQgaWYgTkZTX1YzX0FDTA0KPiArwqDCoMKgwqDCoMKgwqBzZWxlY3Qg
TkVURlNfU1VQUE9SVA0KPiANCg0KTkFDSy4gSSdtIG5vdCBhdCBhbGwgT0sgd2l0aCBtYWtpbmcg
bmV0ZnMgbWFuZGF0b3J5Lg0KDQoNCi0tIA0KVHJvbmQgTXlrbGVidXN0DQpMaW51eCBORlMgY2xp
ZW50IG1haW50YWluZXIsIEhhbW1lcnNwYWNlDQp0cm9uZC5teWtsZWJ1c3RAaGFtbWVyc3BhY2Uu
Y29tDQoNCg0KLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKTGludXgtY2FjaGVmc0ByZWRo
YXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
Y2FjaGVmcwo=

