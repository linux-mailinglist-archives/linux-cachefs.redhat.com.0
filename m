Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BF4A942FCF5
	for <lists+linux-cachefs@lfdr.de>; Fri, 15 Oct 2021 22:24:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-B-en7kU5OdWlMkT8hBGKeQ-1; Fri, 15 Oct 2021 16:24:07 -0400
X-MC-Unique: B-en7kU5OdWlMkT8hBGKeQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CB8A10A8E00;
	Fri, 15 Oct 2021 20:24:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC18C100E809;
	Fri, 15 Oct 2021 20:24:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6319A1809C81;
	Fri, 15 Oct 2021 20:24:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19FKJQqT030988 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 15 Oct 2021 16:19:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7302240CFD11; Fri, 15 Oct 2021 20:19:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C98140CFD0D
	for <linux-cachefs@redhat.com>; Fri, 15 Oct 2021 20:19:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 502F41066559
	for <linux-cachefs@redhat.com>; Fri, 15 Oct 2021 20:19:26 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-226-ESh0kfSwPA69U-wsX-w_KA-1; Fri, 15 Oct 2021 16:19:22 -0400
X-MC-Unique: ESh0kfSwPA69U-wsX-w_KA-1
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	19FJjBgA013279; Fri, 15 Oct 2021 20:18:53 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by mx0b-00069f02.pphosted.com with ESMTP id 3bqbgp9yv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Oct 2021 20:18:52 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19FK1Hhu090715;
	Fri, 15 Oct 2021 20:18:43 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
	(mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by userp3030.oracle.com with ESMTP id 3bkyvf02pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Oct 2021 20:18:42 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
	by BYAPR10MB2439.namprd10.prod.outlook.com (2603:10b6:a02:ba::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25;
	Fri, 15 Oct 2021 20:18:40 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
	([fe80::f4fe:5b4:6bd9:4c5b]) by SJ0PR10MB4688.namprd10.prod.outlook.com
	([fe80::f4fe:5b4:6bd9:4c5b%6]) with mapi id 15.20.4608.017;
	Fri, 15 Oct 2021 20:18:40 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Trond Myklebust <trondmy@hammerspace.com>
Thread-Topic: [PATCH 1/1] NFS: Convert from readpages() to readahead()
Thread-Index: AQHXu9PCTxWz7e0uNku4Se2Jl0pkd6vJJJuAgAqUFgCAANNXNg==
Date: Fri, 15 Oct 2021 20:18:40 +0000
Message-ID: <E3E18FD8-5895-4C4D-90BF-2588A3C346E9@oracle.com>
References: <1633649528-1321-1-git-send-email-dwysocha@redhat.com>
	<1633649528-1321-2-git-send-email-dwysocha@redhat.com>
	<3F1E7B93-EB8D-4744-8143-D44654CA6451@oracle.com>
	<1fe6dbeac820b58f0790dcff492b62b7dd7e4fea.camel@hammerspace.com>
In-Reply-To: <1fe6dbeac820b58f0790dcff492b62b7dd7e4fea.camel@hammerspace.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a3c4e98-7b76-4b74-01e2-08d99018faa4
x-ms-traffictypediagnostic: BYAPR10MB2439:
x-microsoft-antispam-prvs: <BYAPR10MB243943448E82CDD3C3983AF993B99@BYAPR10MB2439.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:663
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: V979x+2zCjIBXeA71j3hOeRPW3iVBqtTFBKq/zoZdS/6bf3Y08cia0MjTf15NtdXp5DvKvg845JiS1gbBZRqWWbiCRmnqCPhZ0hCPHIE1fxpTJ48Yykbg8IqYURharKMRFf34oqPsLoiq3vfeyuG8st+o9eHSy/U9C1wmelxXj/6oJsgGOEcF61FOvTkNqm5EaAwTJ9pFrLk5D0gWHgRfk/dBir0DqxR/h8+lnumb0/nldCYLXAOLkLoef+RrJnwSx13A5MWe+yOg+tzNPPgwTBuABpswVSRzLlwyNXNnszWmK4NELzEIpk7FXJryn8a3cNX0AFlnqZzer2wHrxi7Ik7xuX6dSEyb91dRAHm7S34BMakaemWAyEa3rIIrVDHCIs36VBz/aNlmestMetVIDQIrDQyF7LgvK0CikH8elSlPDLGPm9ndxVMetRykNjHpGxJ6dWJpyV1uHoZnltDsRjKDw3OcvuhMdinrBGN6hzRYRKIHvNoYj8QzkbLIkoYJ+0NfEg0y2r/I7pYtC41Wkj4PXpMrfSqMUIGxHbIrZenAMXjXi3HAg16av6FM7+rl8Pyq35SvBiE7hgZGl4D6zsZmDjn+zrtmrWgHceJQ5jRCq6wynD0/k8xMBgbpxSseU9wlRlBzYLqB90EtNiHu3sjSA237FFwVGlVTWXtsi0fVjUtiSUMXlgYNLo36ZYb0c3GEHiOgImz0yt0nVFRsjLGOZjzjKJ8w+ezOYOHXCE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR10MB4688.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(36756003)(8676002)(2616005)(91956017)(186003)(33656002)(6486002)(38070700005)(4326008)(2906002)(86362001)(76116006)(6512007)(508600001)(53546011)(54906003)(66446008)(6506007)(66476007)(66946007)(38100700002)(316002)(83380400001)(5660300002)(66556008)(64756008)(122000001)(6916009)(71200400001)(8936002)(45980500001);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajJBaU1iZVYvU3pxeEdmcEZBaHlqQ0wwSFFzNTVDc2RSclkxUFdxSnZUQlJW?=
	=?utf-8?B?YXU4aGdxNkRxa1JJdGpCR2NVRG9XNHVNczdpWFl3N29LdHNzZkluZEN3bXV2?=
	=?utf-8?B?ZStYQ3Z0OG55OGEzUnNCM0hlaVNCS3pybG1QS2tUNmdBdDUzRzRIQjJtUnZZ?=
	=?utf-8?B?STV3cS9ySThNSDZFLzVGYWtIWFpLZ09GZXpqVEhWRktScGZpZnJJa0FUd3dz?=
	=?utf-8?B?MnptU0xBTmNUUkV0OXJ1MWlXTjJvS2p0TTNvN2FDSHFVeGFJbTFyRkVoUmp5?=
	=?utf-8?B?dTlxZ0RHZDlKQ3dUU2czNWFmZmNMRnRnYkhqRmpZNTJTSndibEpPSWwzejFE?=
	=?utf-8?B?WSthZUc3b05ucCtXY2tpK0JRUzEwZDk3WEZLcHdMendWYXQzeU8zWDViclZV?=
	=?utf-8?B?SkowbTZxTmE4M1dSVzc0bG92dVNmQlMzby93WlUwUWhVMGJ3L0htRU5ZcUN4?=
	=?utf-8?B?bWRzcUFsNjBTbFgrL0xhd2JVL21hYndCbDQ0R1JzTlpwUXo2cDhIbUtQSHRC?=
	=?utf-8?B?QWR5TE1zajVHcTY5RjI1akRBaGUxS0RyOXppOFNjdEl2SkdVeDFsR28rZEtB?=
	=?utf-8?B?VTRGNnZjM1lpR1RXcHM5aFNWVHlIK2ZUa3JYTlNvUzArV0FaM3B5OUVJaDVL?=
	=?utf-8?B?TGx1TGpzbW8ralRKT1RQVE01TTdQWW80TldwRW9TdnByVFZIblRENHV5Wm9j?=
	=?utf-8?B?clUwb0pyZmlBNiswSFFYTUZPS3A3UHp4cUV0T1IvZW0zU21vQXpwRkR5K05J?=
	=?utf-8?B?QlRLcml0emNiUndudDl1cTNxR1p5SFVBNWN0OGFwYkE4dXJ2WjlZRjIzTFFi?=
	=?utf-8?B?M0xWMzcvdTBwSGsxZjE4WG5Ud1FBMGZ4T0dHdXdCM1phdjJnbTRJaGFHQjhT?=
	=?utf-8?B?VWlMY2ZZbkdqMXJma2pyaDdlSlQ1RFUyNjdsN3NOSllJSldKd3lKUi9CZWlC?=
	=?utf-8?B?NGdEakRkNTdGUElXMS8wa3pyWDRUT0xQUFVPVGpPSjVVdFFGdkV5VkZDeGQ3?=
	=?utf-8?B?aDBZdTNOeHBVWWdYRUFTMjZ0TVlEbnJDR2ZyL0h2dk5yc1pnVVQ5dHhaaVVr?=
	=?utf-8?B?a1BpNTAzSzYxektwNW9RVTF6VFFwc1BLUW5DN2Y5cVZUT002NEVnZkZRNDN0?=
	=?utf-8?B?WndBZFZwakozYjNkbjBZUWJXTUJFZ1J6YVRvNmhzci9vdTB3YnVBYnBoSTF3?=
	=?utf-8?B?bVRnWUJ4NHMyWE5mczFsZTMrMDB2dmxURzhzTHNvYzZtem05WEltLy9wdFZl?=
	=?utf-8?B?czVsR05nTTZkUS9vM2RwalZXbms2R28wdXdzSGQ5KzZqVUJnVG5CMXVzUFZZ?=
	=?utf-8?B?YWpmMHQvVit5eCsvWW1tblFvWFlSb2ljQmIzWEczMFduNytCcHh0RDFKNHZ4?=
	=?utf-8?B?R292eXpIaTJFOXJ1THByeHljRmxmanBycHJFUG9nZUVaQ2h5TG1mdTdwcWts?=
	=?utf-8?B?cnBjVy9jbFQxU0h2UTlzc0ZIc1U5T242Q2ZVeTExdUYyL296d29yVitmMldE?=
	=?utf-8?B?YlJwNlFjRVU5WlRqSzc5N2RCeDNWbWRRMFQwWTRqTDlsUERDUThoNlV0dEVa?=
	=?utf-8?B?M0lGQ3R4eWtCV0xBWVdvZXFVYVlqVGlJWWFZME51bFVMN09TSkxGZXZCUXM4?=
	=?utf-8?B?QmhvUkV5V3BLZGF1RnBSVUMyMUtDbXhhcE5HNm5VZlp5aXRUVmZVcFV2cm5I?=
	=?utf-8?B?aTVRekYyOERjNU0xd2t3R1dCajhldmVjTWJuaStlQlExdm5lTVJCWjBRWTFT?=
	=?utf-8?B?WGdKYU1zV2NkYW1sYjBxemJzazJ2SkN0UFl6cktYZzgxR0dnellTeTJlK2o4?=
	=?utf-8?B?N2xqNkVmQkYzSnpjbHRxRm1rbDhzU3ZJOUFSemw4WHFHcmtRNG14cDZiM1or?=
	=?utf-8?Q?GwqiJTJF9ntOT?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3c4e98-7b76-4b74-01e2-08d99018faa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 20:18:40.6839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jhFy9set0V9g133a9Eh3oUas1SbFjjQw9D/4IjAHZg0b5ny4jgodhwuuuNkPGsXWkAd7tKXKaTfyhn99RpXFQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2439
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10138
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	phishscore=0 bulkscore=0
	malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2109230001 definitions=main-2110150121
X-Proofpoint-GUID: 5ZX0h6W1Zhl5mS9orVrtwrPOUcfqM99m
X-Proofpoint-ORIG-GUID: 5ZX0h6W1Zhl5mS9orVrtwrPOUcfqM99m
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 19FKJQqT030988
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"willy@infradead.org" <willy@infradead.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Cj4gT24gT2N0IDE1LCAyMDIxLCBhdCAzOjQyIEFNLCBUcm9uZCBNeWtsZWJ1c3QgPHRyb25kbXlA
aGFtbWVyc3BhY2UuY29tPiB3cm90ZToKPiAKPiDvu79PbiBGcmksIDIwMjEtMTAtMDggYXQgMTQ6
MDkgKzAwMDAsIENodWNrIExldmVyIElJSSB3cm90ZToKPj4gCj4+IAo+Pj4gT24gT2N0IDcsIDIw
MjEsIGF0IDc6MzIgUE0sIERhdmUgV3lzb2NoYW5za2kgPGR3eXNvY2hhQHJlZGhhdC5jb20+Cj4+
PiB3cm90ZToKPj4+IAo+Pj4gQ29udmVydCB0byB0aGUgbmV3IFZNIHJlYWRhaGVhZCgpIEFQSSB3
aGljaCBpcyB0aGUgcHJlZmVycmVkIEFQSQo+Pj4gdG8gcmVhZCBtdWx0aXBsZSBwYWdlcywgYW5k
IHJlbmFtZSB0aGUgTkZTSU9TXyogY291bnRlcnMgYW5kIHRoZQo+Pj4gdHJhY2Vwb2ludCBhcyBu
ZWVkZWQuCj4+PiAKPj4+IFNpZ25lZC1vZmYtYnk6IERhdmUgV3lzb2NoYW5za2kgPGR3eXNvY2hh
QHJlZGhhdC5jb20+Cj4+PiAtLS0KPj4+IGZzL25mcy9maWxlLmMgICAgICAgICAgICAgIHwgIDIg
Ky0KPj4+IGZzL25mcy9uZnN0cmFjZS5oICAgICAgICAgIHwgIDIgKy0KPj4+IGZzL25mcy9yZWFk
LmMgICAgICAgICAgICAgIHwgMjEgKysrKysrKysrKysrKysrLS0tLS0tCj4+PiBpbmNsdWRlL2xp
bnV4L25mc19mcy5oICAgICB8ICAzICstLQo+Pj4gaW5jbHVkZS9saW51eC9uZnNfaW9zdGF0Lmgg
fCAgNiArKystLS0KPj4+IDUgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMTMgZGVs
ZXRpb25zKC0pCj4+PiAKPj4+IGRpZmYgLS1naXQgYS9mcy9uZnMvZmlsZS5jIGIvZnMvbmZzL2Zp
bGUuYwo+Pj4gaW5kZXggMjA5ZGFjMjA4NDc3Li5jYzc2ZDE3ZmE5N2YgMTAwNjQ0Cj4+PiAtLS0g
YS9mcy9uZnMvZmlsZS5jCj4+PiArKysgYi9mcy9uZnMvZmlsZS5jCj4+PiBAQCAtNTE5LDcgKzUx
OSw3IEBAIHN0YXRpYyB2b2lkIG5mc19zd2FwX2RlYWN0aXZhdGUoc3RydWN0IGZpbGUKPj4+ICpm
aWxlKQo+Pj4gCj4+PiBjb25zdCBzdHJ1Y3QgYWRkcmVzc19zcGFjZV9vcGVyYXRpb25zIG5mc19m
aWxlX2FvcHMgPSB7Cj4+PiAgICAgICAgIC5yZWFkcGFnZSA9IG5mc19yZWFkcGFnZSwKPj4+IC0g
ICAgICAgLnJlYWRwYWdlcyA9IG5mc19yZWFkcGFnZXMsCj4+PiArICAgICAgIC5yZWFkYWhlYWQg
PSBuZnNfcmVhZGFoZWFkLAo+Pj4gICAgICAgICAuc2V0X3BhZ2VfZGlydHkgPSBfX3NldF9wYWdl
X2RpcnR5X25vYnVmZmVycywKPj4+ICAgICAgICAgLndyaXRlcGFnZSA9IG5mc193cml0ZXBhZ2Us
Cj4+PiAgICAgICAgIC53cml0ZXBhZ2VzID0gbmZzX3dyaXRlcGFnZXMsCj4+PiBkaWZmIC0tZ2l0
IGEvZnMvbmZzL25mc3RyYWNlLmggYi9mcy9uZnMvbmZzdHJhY2UuaAo+Pj4gaW5kZXggNzhiMGY2
NDlkZDA5Li5kMmIyMDgwNzY1YTYgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9uZnMvbmZzdHJhY2UuaAo+
Pj4gKysrIGIvZnMvbmZzL25mc3RyYWNlLmgKPj4+IEBAIC05MTUsNyArOTE1LDcgQEAKPj4+ICAg
ICAgICAgICAgICAgICApCj4+PiApOwo+Pj4gCj4+PiAtVFJBQ0VfRVZFTlQobmZzX2FvcHNfcmVh
ZHBhZ2VzLAo+Pj4gK1RSQUNFX0VWRU5UKG5mc19hb3BzX3JlYWRhaGVhZCwKPj4gCj4+IEluIHYy
IGFuZCB2MyBvZiBteSBwYXRjaCwgdGhpcyB0cmFjZXBvaW50IGhhcyBhbHJlYWR5IGJlZW4KPj4g
cmVuYW1lZCB0byBuZnNfYW9wX3JlYWRhaGVhZC4KPiAKPiBEb2VzIHRoYXQgbWVhbiB5b3UncmUg
Z29pbmcgdG8gcmVzZW5kLCBDaHVjaz8KCkkgcmUtc2VudCB0aGlzIG9uZSBwYXRjaCBhIGZldyBk
YXlzIGFnbywgYnV0IEkgY2FuIHJlLXNlbmQgdGhlIHdob2xlIHNlcmllcyBhZ2FpbiB0byBiZSBz
dXJlIGV2ZXJ5b25lIGhhcyB0aGUgbGF0ZXN0LgoKCgotLQpMaW51eC1jYWNoZWZzIG1haWxpbmcg
bGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZz

