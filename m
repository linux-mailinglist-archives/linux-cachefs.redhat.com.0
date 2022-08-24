Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CBB59FC38
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Aug 2022 15:51:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661349095;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tyXlD8Yuv153mz99L7AKKhVgTxNaTCYaSektKius/50=;
	b=iiq2p5Ywy2P9lOCGKW/A3nvqveq8RYocQG6iTUj+wDysl4nOY7TlALVOJQepqx2XiNd7DQ
	NtYq9uj1hg6ZAlo+roR04flgeDdFrqzuLcp/6Vv6c08dyu4KRosOjSWOuuIzMO3+Ziwdrn
	1iegH/Cr2UTvXTFvzkizDuKcau5I8Hw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-ODNFJ-mvNY2CiHNF6MjJSg-1; Wed, 24 Aug 2022 09:51:32 -0400
X-MC-Unique: ODNFJ-mvNY2CiHNF6MjJSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BB4D383328A;
	Wed, 24 Aug 2022 13:51:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D6B92166B2A;
	Wed, 24 Aug 2022 13:51:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 24DDE1946A52;
	Wed, 24 Aug 2022 13:51:31 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 825721946A42 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 24 Aug 2022 13:05:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5D4C7492CA5; Wed, 24 Aug 2022 13:05:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58D26492C3B
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 13:05:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C8B33C11048
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 13:05:19 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2100.outbound.protection.outlook.com [40.107.93.100]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-OKWKjnCWOMujLVehWu97sQ-1; Wed, 24 Aug 2022 09:05:13 -0400
X-MC-Unique: OKWKjnCWOMujLVehWu97sQ-1
Received: from CH0PR13MB5084.namprd13.prod.outlook.com (2603:10b6:610:111::7)
 by MN2PR13MB2592.namprd13.prod.outlook.com (2603:10b6:208:ef::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Wed, 24 Aug
 2022 13:05:07 +0000
Received: from CH0PR13MB5084.namprd13.prod.outlook.com
 ([fe80::f1c7:62d0:a63d:f5ca]) by CH0PR13MB5084.namprd13.prod.outlook.com
 ([fe80::f1c7:62d0:a63d:f5ca%3]) with mapi id 15.20.5566.014; Wed, 24 Aug 2022
 13:05:06 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "dwysocha@redhat.com" <dwysocha@redhat.com>
Thread-Topic: [RFC PATCH 2/3] NFS: Add support for netfs in struct nfs_inode
 and Kconfig
Thread-Index: AQHYt5zQc0jiP02yL0Kjw6guU1m2RK29/pOAgAAFTACAAAEnAA==
Date: Wed, 24 Aug 2022 13:05:06 +0000
Message-ID: <da9200f1bded9b8b078a7aef227fd6b92eb028fb.camel@hammerspace.com>
References: <20220824093501.384755-1-dwysocha@redhat.com>
 <20220824093501.384755-3-dwysocha@redhat.com>
 <429ecc819fcffe63d60dbb2b72f9022d2a21ddd8.camel@hammerspace.com>
 <CALF+zOknvMZyufSUD-g9Z9Y5RfwE-vUFT+CF0kxqbcpR=yJPJw@mail.gmail.com>
In-Reply-To: <CALF+zOknvMZyufSUD-g9Z9Y5RfwE-vUFT+CF0kxqbcpR=yJPJw@mail.gmail.com>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2cb446e-b330-4e50-0157-08da85d1445d
x-ms-traffictypediagnostic: MN2PR13MB2592:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: xDN0bDBdfhMVYWB2qwVef479YxTQ24nte4UgRaxwTqUKUuKJIwA+fciS25wj0mCzHwavBen9u84ZGrOsp5T4sDqfe1/iSaHFG49lCJIS/PGfrWpcgIA6mNApob/DbKe4/e9kTtEs80+qENfwnZtCbVUoeiEtXQzbF9NqAO2ANm3WPx3FkGYw9EYo0PZkb7syu12Q7I3xf5ZPre+Kaf2FR/1ey9YKTDIdNn9hxLqADz1os0GkfG03tO/zOad7xTk0N3TcGLHkIdVvou95QMmg48yvFo3q/S4kBs/0yzWpp0llr37Hk1jo40A1hG5yv52MuUq/6Sljt14Eyk5d642I04kxBq7UPUi9J4mY0Xr58rBM0YEIHJY0cY8/1G+fRvGdX5DeyLm1spK8owt/W1hoLgFdDs+0uxVWrZYH4OVFIs0pFdRF9jpHfm0+MoLN4Mh7nORJeZjL4zyZ1wxtqOzsYHiK5Sy9cpVPK2y+6AkiYEVij98mgnJiKsPbheDWCmaedtbeILlUVg3Kk7TZXvZQih6tBrObBi4K/DXKySn3/plmXl82gNIv1R2weHGhQA8vBKcg5cvQ7ATCZE5klWKD2JZ71d2n1tALZf3suwk9v1HfJX00Dpm6qt4JyAuFRatNsysLrj+a0JH/gtlQ76UvoUBxW8GDHc6S+/6brBhBKd0IrDCjCo7WNrLXQ7RUxge/Sf5BUwjLtGOh1cttmdavaTJcEZkX9JcPwH3onZkMr4bNVhmDYxqrd9a1fQOkhLbtMg5Mh5DveGVM8kbvKFPACMRPkEWXZrz0yjeoYfn2eAaqcIS4FdWsU3KJvqWB/sBj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR13MB5084.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(366004)(136003)(346002)(39840400004)(86362001)(2906002)(6506007)(26005)(53546011)(2616005)(6512007)(122000001)(38100700002)(83380400001)(186003)(38070700005)(54906003)(6916009)(71200400001)(8936002)(64756008)(66446008)(316002)(4326008)(66476007)(66946007)(66556008)(478600001)(76116006)(8676002)(41300700001)(6486002)(5660300002)(36756003);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azhBb2lEMkZWUGpsRmlSVVFMOHJFenRPbE1PdWNud2ZzWmJXbEMxN0NtaUFx?=
 =?utf-8?B?clVEUmVERWFzVUI4bjBNdFoxbkFwdXZPUmtJT3ozTHUrZ1ZIRDdKblZDWUhQ?=
 =?utf-8?B?S3BFMTU4QmVYMUs3UE1iVTVXOEFubGQ4clhjQ1NCbTZyNEkxbk8yUXRsUXFM?=
 =?utf-8?B?bk1Pa1FveE9CUHRuS3R4b1laSjQwc2MzelVwb1BoWXZWRmo0M2ZUWkcrRzJG?=
 =?utf-8?B?dXNCL2d4VysrRU8rRXlBY0FGMFA4bi9uR0c5OU12bVUyTm5HWlREYjAyOG9V?=
 =?utf-8?B?ZlZneHRpZGRGZlFleFJucXRvd1lXQzFKc0VXeDcvbTEwMzZwNDFiYzNZNkJp?=
 =?utf-8?B?UnVEK2ppY2ZzclN5U3htNGcvUDZyM1ZqOGdvT09HNGhHTGZZamxUMnNoRDVE?=
 =?utf-8?B?RWtPR0RCMVFFZEJJaFdhKzlvbU9MeTBqek90eC8rNDZ4TGhCSkE3Y0hibkt3?=
 =?utf-8?B?a0YxS0lXNndXR2Mvbld1SUdoMngyRlBNT3ZWMDJaNlpmZjdkcExRY0ZrVnI4?=
 =?utf-8?B?cW9zeGhUMG1CNVdtRmpQa08ydTNsR2lkZ1cwZjk5MG0zeVdsa1ExWC85RkRW?=
 =?utf-8?B?U1FqaHhvV1ZUdVY3WjNjL1ZRekhZRjFEN2JoNVdDZ2FwZ0dGcUhWbGUwOGgw?=
 =?utf-8?B?VjlUYmM2VzhObWdxbC9aYkh6TnVCUGpuSkpzelc5YnFMUGpkcG8yNFY2K2Zk?=
 =?utf-8?B?RTlyK3ExRytRbTdSWlByNDZFU1owZUNIMS9zTTBUT243LzNtU3FMMUI3WTlN?=
 =?utf-8?B?RUZndm5UbC9OK1B2cTBxYU5UUmZ5aXRPdlo5U3NCZ01aeGRUbE9sZEpuYXVy?=
 =?utf-8?B?d3FmeSs2VlRINEZ5V1pJZlN5NmVMVFNmK0JHaUlERlVYMWNIbkxSRXJwQm12?=
 =?utf-8?B?dXNFMFN0em92MURIOE1RZXBRTjRkVTQ3OFoyanQyK01UbDdHS2JSMVl5bFM0?=
 =?utf-8?B?ZklxSExNN3FPbEJPNWRvWHdrVW5WeXB6b20vMGEwOU5STXBGSWwzVGtjQzRm?=
 =?utf-8?B?cWpTd2EwZWtlTEZhd2FCZXEvc1hPdnFXblFBR1ZJbUFQaUxxKzlDaEhPdGVS?=
 =?utf-8?B?Z1Bjdm9yYytqblVEc2ltclk3bDk5VHFJaTdwbTg3VFJ1cEV3Zy9hVVFWejhw?=
 =?utf-8?B?MlUrclZ5cDROZWw3MDErY1NmVWpDY2RhMjVXVnVZei9mQUlMRTlzUnZqaWJY?=
 =?utf-8?B?cFQvMXRwUjl0RVJLSUJZQ1NaWEtzejRSb3B1Y1VoS3RIR2h3dzAyMnN0VzAv?=
 =?utf-8?B?Ujd4Vld6WEEvYzFtMnZGR21EUzhYTi9BQmwzRTNUWDVYVXFXa1lPOE1HODV1?=
 =?utf-8?B?Z1hYcXVwWUkxL0JmZ2IvMHRzRmN1blB2RjI2WS9FbkhYQk5LRjFGSDFMdVJG?=
 =?utf-8?B?aUdGYUFTVkdqSWpFQjFpNkc0TXR5WGNJR3ZzUThJSnBGV09YdjVVc1B6d09N?=
 =?utf-8?B?WXNoYlh3N1loYW00Ykd0emFRTEFvVGV5Q00vSlByTHMxbTFNY3NuaWM5eTQr?=
 =?utf-8?B?MEVpT3RJakRCU1Y5VERFRVE4MHgxUmdkbSs2L3JlVGYwL1pmQTFLZ3d2UXJN?=
 =?utf-8?B?SUdFT1I0ZWYzUC9yOE0zdkgvSDFXbzhGZTlQbTZQcmJLTlVBMStXZjZ3Qm8r?=
 =?utf-8?B?TWJpMWMzZUtXQ1MyRGp2N0ZJYXFkMExqaklLMkw3UWMrSzlxWGFZL2hnL2Vm?=
 =?utf-8?B?Z0svM1Q1U0tZRnVpTjN3V1BhdjhZSjR1eWhpZ1hzSlZBcGVOaHJmbUk4Ymc3?=
 =?utf-8?B?b3BvNXRZN2VUVS9RNEpYays3N1pDcEJqWHQ3dmxkd080NGJseUc3QnJTRFZN?=
 =?utf-8?B?b01kRXNkWGJRWnZvZy93TGdoNGlFeWtaMkpWS0F6SU9PaVVTSlRSOWd5bmlX?=
 =?utf-8?B?NDhyaXljNDZxYUhCV0prczlCZCtPSXFIVkYxTHBMMUpVbDF4QTZtaTJKU1c0?=
 =?utf-8?B?eG1obmhhSjJwOW9KY29RUmRoaWM0UVZnYmJScFJ3bUxXR0FFS2phMW45TWVo?=
 =?utf-8?B?aDZRZE1Sekh5MHdTcENRaW9aT0lDQVBTSCtmSFZzYXdSa3NQbDc0T1V4ZFFZ?=
 =?utf-8?B?ZlJiZjM4NGxETEE1WUJEWWx5eU50MzlzT29TVEJlSlkrQkdBeEJ4WGhuNzZk?=
 =?utf-8?B?Ly91Zzh4N2pqZzNTWFBoTnArS2RSWDZLemVoNDQ0a092TkcyWHZXaElxdDd2?=
 =?utf-8?B?cnc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR13MB5084.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cb446e-b330-4e50-0157-08da85d1445d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 13:05:06.7326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R3A6SliVBCHbxXpeK9GKUiAtGVM7VN25U9os0hjkRywDv1GkL4frUfiAhfI5RWQ1w3t/FdXSnSNttCZVYfSUZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB2592
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
 "benmaynard@google.com" <benmaynard@google.com>,
 "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <944916BE0134CB44BDC6F6DF191984A1@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIyLTA4LTI0IGF0IDA5OjAwIC0wNDAwLCBEYXZpZCBXeXNvY2hhbnNraSB3cm90
ZToNCj4gT24gV2VkLCBBdWcgMjQsIDIwMjIgYXQgODo0MiBBTSBUcm9uZCBNeWtsZWJ1c3QNCj4g
PHRyb25kbXlAaGFtbWVyc3BhY2UuY29tPiB3cm90ZToNCj4gPiANCj4gPiBPbiBXZWQsIDIwMjIt
MDgtMjQgYXQgMDU6MzUgLTA0MDAsIERhdmUgV3lzb2NoYW5za2kgd3JvdGU6DQo+ID4gPiBBcyBm
aXJzdCBzdGVwcyBmb3Igc3VwcG9ydCBvZiB0aGUgbmV0ZnMgbGlicmFyeSwgYWRkDQo+ID4gPiBO
RVRGU19TVVBQT1JUDQo+ID4gPiB0byBLY29uZmlnIGFuZCBhZGQgdGhlIHJlcXVpcmVkIG5ldGZz
X2lub2RlIGludG8gc3RydWN0DQo+ID4gPiBuZnNfaW5vZGUuDQo+ID4gPiBUaGUgc3RydWN0IG5l
dGZzX2lub2RlIGlzIG5vdyB3aGVyZSB0aGUgdmZzX2lub2RlIGlzIHN0b3JlZCBhcw0KPiA+ID4g
d2VsbA0KPiA+ID4gYXMgdGhlIGZzY2FjaGVfY29va2llLsKgIEluIGFkZGl0aW9uLCB1c2UgdGhl
IG5ldGZzX2lub2RlKCkgYW5kDQo+ID4gPiBuZXRmc19pX2Nvb2tpZSgpIGhlbHBlcnMsIGFuZCBy
ZW1vdmUgb3VyIG93biBoZWxwZXIsDQo+ID4gPiBuZnNfaV9mc2NhY2hlKCkuDQo+ID4gPiANCj4g
PiA+IExhdGVyIHBhdGNoZXMgd2lsbCBlbmFibGUgbmV0ZnMgYnkgZGVmaW5pbmcgTkZTIHNwZWNp
ZmljIHZlcnNpb24NCj4gPiA+IG9mIHN0cnVjdCBuZXRmc19yZXF1ZXN0X29wcyBhbmQgY2FsbGlu
ZyBuZXRmc19pbm9kZV9pbml0KCkuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IERhdmUg
V3lzb2NoYW5za2kgPGR3eXNvY2hhQHJlZGhhdC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgZnMv
bmZzL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsNCj4gPiA+IMKgZnMvbmZzL2RlbGVn
YXRpb24uY8KgwqDCoCB8wqAgMiArLQ0KPiA+ID4gwqBmcy9uZnMvZGlyLmPCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgMiArLQ0KPiA+ID4gwqBmcy9uZnMvZnNjYWNoZS5jwqDCoMKgwqDCoMKgIHwg
MjAgKysrKysrKysrLS0tLS0tLS0tLS0NCj4gPiA+IMKgZnMvbmZzL2ZzY2FjaGUuaMKgwqDCoMKg
wqDCoCB8IDE1ICsrKysrKy0tLS0tLS0tLQ0KPiA+ID4gwqBmcy9uZnMvaW5vZGUuY8KgwqDCoMKg
wqDCoMKgwqAgfMKgIDYgKysrLS0tDQo+ID4gPiDCoGZzL25mcy9pbnRlcm5hbC5owqDCoMKgwqDC
oCB8wqAgMiArLQ0KPiA+ID4gwqBmcy9uZnMvcG5mcy5jwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTIg
KysrKysrLS0tLS0tDQo+ID4gPiDCoGZzL25mcy93cml0ZS5jwqDCoMKgwqDCoMKgwqDCoCB8wqAg
MiArLQ0KPiA+ID4gwqBpbmNsdWRlL2xpbnV4L25mc19mcy5oIHwgMTkgKysrKystLS0tLS0tLS0t
LS0tLQ0KPiA+ID4gwqAxMCBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCA0NyBkZWxl
dGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL25mcy9LY29uZmlnIGIvZnMv
bmZzL0tjb25maWcNCj4gPiA+IGluZGV4IDE0YTcyMjI0YjY1Ny4uNzliMjQxYmVkNzYyIDEwMDY0
NA0KPiA+ID4gLS0tIGEvZnMvbmZzL0tjb25maWcNCj4gPiA+ICsrKyBiL2ZzL25mcy9LY29uZmln
DQo+ID4gPiBAQCAtNSw2ICs1LDcgQEAgY29uZmlnIE5GU19GUw0KPiA+ID4gwqDCoMKgwqDCoMKg
wqAgc2VsZWN0IExPQ0tEDQo+ID4gPiDCoMKgwqDCoMKgwqDCoCBzZWxlY3QgU1VOUlBDDQo+ID4g
PiDCoMKgwqDCoMKgwqDCoCBzZWxlY3QgTkZTX0FDTF9TVVBQT1JUIGlmIE5GU19WM19BQ0wNCj4g
PiA+ICvCoMKgwqDCoMKgwqAgc2VsZWN0IE5FVEZTX1NVUFBPUlQNCj4gPiA+IA0KPiA+IA0KPiA+
IE5BQ0suIEknbSBub3QgYXQgYWxsIE9LIHdpdGggbWFraW5nIG5ldGZzIG1hbmRhdG9yeS4NCj4g
PiANCj4gDQo+IEp1c3Qgc28gd2UncmUgb24gdGhlIHNhbWUgcGFnZSwgYXJlIHlvdSBvayB3aXRo
IG5ldGZzIGJlaW5nIGVuYWJsZWQNCj4gaWYNCj4gZnNjYWNoZSBpcyBlbmFibGVkIGxpa2UgdG9k
YXk/DQo+IA0KDQpBcyBsb25nIGFzIGl0IGlzIGFuIG9wdC1pbiBmZWF0dXJlLCBJJ20gT0suIEkg
ZG9uJ3Qgd2FudCB0byBoYXZlIHRvDQpjb21waWxlIGl0IGluIGJ5IGRlZmF1bHQuDQpBIGNhY2hl
ZnMgc2hvdWxkIG5ldmVyIGJlY29tZSBhIG1hbmRhdG9yeSBmZWF0dXJlIG9mIG5ldHdvcmtlZA0K
ZmlsZXN5c3RlbXMuDQoNCi0tIA0KVHJvbmQgTXlrbGVidXN0DQpMaW51eCBORlMgY2xpZW50IG1h
aW50YWluZXIsIEhhbW1lcnNwYWNlDQp0cm9uZC5teWtsZWJ1c3RAaGFtbWVyc3BhY2UuY29tDQoN
Cg0KLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKTGludXgtY2FjaGVmc0ByZWRoYXQuY29t
Cmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVm
cwo=

