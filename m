Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D6095386DD6
	for <lists+linux-cachefs@lfdr.de>; Tue, 18 May 2021 01:41:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-6k3YNXG9NKCHcahzJX8H4w-1; Mon, 17 May 2021 19:41:15 -0400
X-MC-Unique: 6k3YNXG9NKCHcahzJX8H4w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62C3C501E8;
	Mon, 17 May 2021 23:41:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98B6E60C25;
	Mon, 17 May 2021 23:41:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2EBFC1800BB0;
	Mon, 17 May 2021 23:41:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14HNf6Kc008963 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 17 May 2021 19:41:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 69EFD207B099; Mon, 17 May 2021 23:41:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63EA1207ADC2
	for <linux-cachefs@redhat.com>; Mon, 17 May 2021 23:41:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA1D9101D220
	for <linux-cachefs@redhat.com>; Mon, 17 May 2021 23:41:03 +0000 (UTC)
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
	[67.231.145.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-223-MZPqpBvnM6WVJVaoEJ8k6g-1; Mon, 17 May 2021 19:41:01 -0400
X-MC-Unique: MZPqpBvnM6WVJVaoEJ8k6g-1
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
	14HNaDXc012097; Mon, 17 May 2021 16:40:53 -0700
Received: from mail.thefacebook.com ([163.114.132.120])
	by mx0a-00082601.pphosted.com with ESMTP id 38jxcx0s7e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 17 May 2021 16:40:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
	o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2176.2; Mon, 17 May 2021 16:40:52 -0700
Received: from SJ0PR15MB4359.namprd15.prod.outlook.com (2603:10b6:a03:358::15)
	by BYAPR15MB2486.namprd15.prod.outlook.com (2603:10b6:a02:84::33)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26;
	Mon, 17 May 2021 23:40:51 +0000
Received: from SJ0PR15MB4359.namprd15.prod.outlook.com
	([fe80::1836:351b:ea83:df75]) by
	SJ0PR15MB4359.namprd15.prod.outlook.com
	([fe80::1836:351b:ea83:df75%7]) with mapi id 15.20.4129.031;
	Mon, 17 May 2021 23:40:51 +0000
From: Chris Mason <clm@fb.com>
To: Dave Chinner <david@fromorbit.com>
Thread-Topic: How capacious and well-indexed are ext4, xfs and btrfs
	directories?
Thread-Index: AQHXSy5S9wK3qRYDs0OeBucANXpnfaroUK+AgAAFFwA=
Date: Mon, 17 May 2021 23:40:51 +0000
Message-ID: <9073312A-DB74-4ADF-8E12-6C04E15FE34C@fb.com>
References: <206078.1621264018@warthog.procyon.org.uk>
	<20210517232237.GE2893@dread.disaster.area>
In-Reply-To: <20210517232237.GE2893@dread.disaster.area>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.101.208.204]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ca6cdfe-65e8-420e-d048-08d9198d3491
x-ms-traffictypediagnostic: BYAPR15MB2486:
x-microsoft-antispam-prvs: <BYAPR15MB248679AF3CC7A2BE2851AA16D32D9@BYAPR15MB2486.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 2T4mg4ZIqfQLxMp//sUPA0EOnN59FL0Y4Z8rQ2jmOZd09zfvj37gTvBsCbNExEhf+PQYatpUQIbxSYyzfTxChISte54QxU8KtneMR41tExkC4a8O/dsWK+eXu/Wf9FEXegIt8mYTRvP2t2F/sSMOxM27xNdsJXN/Dkm/HHF1ZYZ8kjdQOacvV+2QLhIzXG/90K9e7ZFB1Ir4gRAwnwXXQoEOX8uK5UdvQPF+6VfbTZQ12eMkBQn8TDMGivLMhGxL7+kbiHOmkkmii94HKn3/43tOk6JqbbMYZuDmEpA/okwyZj7t6Q7ahbkFwGnxRCdeROPNfTeg/7V4XRbuEjSLbajCJtUy56AUgdyFR78cZVs16jlHPuwzYQZHz3fSRsjmpjS+5N14xzN6PzDbfULmjy7ulSJSWtZyXgVkTkTvm3nnZPGuSsG1SLdGhLjCTp+6Sagq7xaEgveE+G4YBEJit3JHkU1dTVhdaFx0oIfoyhKRrKSyvc11+RCep+CfHg7zZzVQEbdPmKhI3wdh+U+7w+g+VOSdyjZrw5RB7SbCjpci06Smtwkc42qsLJ7N6Hevxd16QqOOOUnx46J5Yk1ZRmpKtk6SDVpBrmRUATNW+9DK/4fektQyjlzk8pqOQIlTm+tFdrvacKeNVludUmR8ZeXpoqUpuCIKcv2BdqWDHFA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR15MB4359.namprd15.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(2906002)(6486002)(26005)(54906003)(71200400001)(316002)(86362001)(36756003)(122000001)(478600001)(66556008)(8676002)(38100700002)(2616005)(8936002)(66476007)(83380400001)(64756008)(66446008)(6916009)(53546011)(6512007)(6506007)(76116006)(7416002)(91956017)(5660300002)(33656002)(4326008)(186003)(66946007)(45980500001);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZjBVR0x3SzNYNk9rdXhFZDFLU0dmZDlqc0ltMi9mMGVMUTEwQnhRbkZYR0xT?=
	=?utf-8?B?UFpENzBnaEN4ZzdhUkJ5VnpDeEVEMkVmVzhLMGpkVlhScFBrcTNpeGczVkpD?=
	=?utf-8?B?cndWSU5adFZmSGVKL2FsdUFWMUdhbDBKYVJ3MG5oSkQ0dUVFSlRJMnNUbmVv?=
	=?utf-8?B?bUJ5Y0Yyd0NXd3FSd1JDTnZmQk9EU2NqaHN4OXBIVEN4YlpsNUtaNmpGWkdk?=
	=?utf-8?B?NVFadE83M2JsY0dJSVN5SFgxZ0tIS1loTUNYT2xERDZKWjJqMndKQUNlQ1Iy?=
	=?utf-8?B?bGNwcERIT1lzQlViQ3dPZHRpU1BaUXhBa1BudlpxcVdUY2h4eStFME4wdEty?=
	=?utf-8?B?VlBzZHZnbXFHZ21RMmpvRkpjYnFuTEpxK2dsemRRVDJ1NzMyMmdOOWtMK2sv?=
	=?utf-8?B?ZmJVV1IyR0ZqVk9VL3RaekVncGM3VURESDV6Vk9QTi8zRVpRWjFabmZ5bmVE?=
	=?utf-8?B?dWh1OTdSRFNET1NVSE1uMGRzcWFsN0orN2ZBVG9odE9vSFNsMHgrbzY1aGJJ?=
	=?utf-8?B?YitEN21LY2pTcGxjMmxvRjB0RkJqSFp0UFQzWDZZNGg4ZS9oZzl2aTZoWU9F?=
	=?utf-8?B?ZG1rR3NVc1BNWTMwN2VDV2YyMXJsMXNLdGxVaiswelBpZ0RFMlFOWGFVTWNT?=
	=?utf-8?B?S1U2THlKMlVRbER6enlPVmpob3FjYkpUaW1oTFFEVG1ITWd4eU1SR29UNXZt?=
	=?utf-8?B?VzFoSGZCdE01VXA3VytibGV5eVZaL3pEM1ptdHNkck55dlo1R2pyZkhvQU1V?=
	=?utf-8?B?UG40N1hNWnpuUndCWWpHa0thUXVqcEhCZVhqa0UzN1VqSnBZc2FkR3RaeExL?=
	=?utf-8?B?WDU1V1ErS25hQk1NME5Nb3JVUFpLYmRkOStZUnpwYjlKbk16NDNlWnJsSzd4?=
	=?utf-8?B?YU1naWhpK2pLUHQxWEkyek1WYlNCbW5tMUMxNnVjRFhPa2E2enhpcHlvZ3hN?=
	=?utf-8?B?Vk13UFduN1FZSERpdkxsWGlGQ2NQSVNRUU9YcERoUkNQNTdMTnkxVFo5ZXRw?=
	=?utf-8?B?V29IKzZYa3VpY1B3bFpDMzhLRVBTMmhZMjlFU2VIcmlMeGdzTkxFWXFnZnhn?=
	=?utf-8?B?azFVbk9HVllVelBVRUlKN25EUDVOMFhzZUdHdC84Um5qTlBKN2gwZmR4WFlq?=
	=?utf-8?B?SnJsWnZuNnFsV0wvbmtnR0xtOWo5T1pqdklEZmNKQ011MjRFQjROQW1CZThu?=
	=?utf-8?B?UVZCMXhNVWZ5bVNuaUhXY3RSL2g3ajJGVGdqd0NqOFc3c2hiSmsxK2dqaTFF?=
	=?utf-8?B?RldidkhuRlpMZXdsQTRhM0pINmg2eVJGSThFSVBKY3VpYmZDNmsrT0dkSjFr?=
	=?utf-8?B?REltMy9VNUN4bStVeFdTdWM3MHVOMGJ4aWRtQ0Z2OFk4S29rcXd3WGJLajhU?=
	=?utf-8?B?K3V2UU15aWNYa1VNK00yaTJCRVVVZ1VVLzlLbndmM0VyRkFLUjZxQzRtZVB1?=
	=?utf-8?B?c21SRDFoL3JUTXNMRlFpKzczZEh4VDhxN1cxVzNvbU9hckFVQUVBeit3alRt?=
	=?utf-8?B?cVVMSG9HUmlqSEh1RmFyTCtyUkFrMzF6M0JhVEdaTk5tU09STGN0WVpQczAx?=
	=?utf-8?B?SVhqbkpDV1A1YTA0TkhvZHZ3Y0lmZ2NocWE1ejVDNURkVjZpbG9BT2MvaUdT?=
	=?utf-8?B?QjhaYXA4MTVRRHFRUmF4QnVRcWwzTkx0cmkyYi9Sb1hoWlRqajdkemtvMCt4?=
	=?utf-8?B?Tjg4bTVFTFk3aWlOcExZUEcrYnJlTHJCZUxUam5senlZd3dZWjRWcEN6SHh1?=
	=?utf-8?B?Y214VGw1NVpYaTRqMUFSM0lTWDJlQkVrTEVEYkVkM2Z2c1k5WjdaK3Y4QTNW?=
	=?utf-8?B?dThPUEFEMEdkMU9Scm9vdz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR15MB4359.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca6cdfe-65e8-420e-d048-08d9198d3491
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2021 23:40:51.2411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NGY6XelFw5jxPxgiNFRLx7R5WJejHDKVU/cbg3E38CUeqgQy7OZJ9H+oMYa8B/mQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2486
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: DCZwvkab0Y-1OetI_FuNsJaIK3apepPZ
X-Proofpoint-ORIG-GUID: DCZwvkab0Y-1OetI_FuNsJaIK3apepPZ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
	definitions=2021-05-17_10:2021-05-17,
	2021-05-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
	impostorscore=0
	clxscore=1011 bulkscore=0 priorityscore=1501 lowpriorityscore=0
	mlxlogscore=465 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
	suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1
	engine=8.12.0-2104190000 definitions=main-2105170169
X-FB-Internal: deliver
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 14HNf6Kc008963
X-loop: linux-cachefs@redhat.com
Cc: "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	Theodore Ts'o <tytso@mit.edu>, "Darrick J. Wong" <djwong@kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Linux-cachefs] How capacious and well-indexed are ext4,
 xfs and btrfs directories?
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
Content-ID: <C8A55C60E04A5D47B82BAC896DB71BCD@namprd15.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Cj4gT24gTWF5IDE3LCAyMDIxLCBhdCA3OjIyIFBNLCBEYXZlIENoaW5uZXIgPGRhdmlkQGZyb21v
cmJpdC5jb20+IHdyb3RlOgo+IAo+IE9uIE1vbiwgTWF5IDE3LCAyMDIxIGF0IDA0OjA2OjU4UE0g
KzAxMDAsIERhdmlkIEhvd2VsbHMgd3JvdGU6Cj4gCj4+IFdoYXQgSSdkIGxpa2UgdG8gZG8gaXMg
cmVtb3ZlIHRoZSBmYW5vdXQgZGlyZWN0b3JpZXMsIHNvIHRoYXQgZm9yIGVhY2ggbG9naWNhbAo+
PiAidm9sdW1lIlsqXSBJIGhhdmUgYSBzaW5nbGUgZGlyZWN0b3J5IHdpdGggYWxsIHRoZSBmaWxl
cyBpbiBpdC4gIEJ1dCB0aGF0Cj4+IG1lYW5zIHN0aWNraW5nIG1hc3NpdmUgYW1vdW50cyBvZiBl
bnRyaWVzIGludG8gYSBzaW5nbGUgZGlyZWN0b3J5IGFuZCBob3BpbmcKPj4gaXQgKGEpIGlzbid0
IHRvbyBzbG93IGFuZCAoYikgZG9lc24ndCBoaXQgdGhlIGNhcGFjaXR5IGxpbWl0Lgo+IAo+IE5v
dGUgdGhhdCBpZiB5b3UgdXNlIGEgc2luZ2xlIGRpcmVjdG9yeSwgeW91IGFyZSBlZmZlY3RpdmVs
eSBzaW5nbGUKPiB0aHJlYWRpbmcgbW9kaWZpY2F0aW9ucyB0byB5b3VyIGZpbGUgaW5kZXguIFlv
dSBzdGlsbCBuZWVkIHRvIHVzZQo+IGZhbm91dCBkaXJlY3RvcmllcyBpZiB5b3Ugd2FudCBjb25j
dXJyZW5jeSBkdXJpbmcgbW9kaWZpY2F0aW9uIGZvcgo+IHRoZSBjYWNoZWZpbGVzIGluZGV4LCBi
dXQgdGhhdCdzIGEgZGlmZmVyZW50IGRlc2lnbiBjcml0ZXJpYQo+IGNvbXBhcmVkIHRvIGRpcmVj
dG9yeSBjYXBhY2l0eSBhbmQgbW9kaWZpY2F0aW9uL2xvb2t1cCBzY2FsYWJpbGl0eS4KClVubGVz
cyB5b3XigJlyZSBkb2luZyBvbmUgc3Vidm9sIHBlciBmYW4gZGlyZWN0b3J5LCB0aGUgYnRyZnMg
cmVzdWx0cyBzaG91bGQgYmUgcmVhbGx5IHNpbWlsYXIgZWl0aGVyIHdheS4gIEl04oCZcyBhbGwg
Z2V0dGluZyBpbmRleGVkIGluIHRoZSBzYW1lIGJ0cmVlLCB0aGUga2V5cyBqdXN0IGNoYW5nZSBi
YXNlZCBvbiB0aGUgcGFyZW50IGRpci4KClRoZSBiaWdnZXN0IGRpZmZlcmVuY2Ugc2hvdWxkIGJl
IHdoYXQgRGF2ZSBjYWxscyBvdXQgaGVyZSwgd2hlcmUgZGlyZWN0b3J5IGxvY2tpbmcgYXQgdGhl
IHZmcyBsZXZlbCBtaWdodCBiZSBhIGJvdHRsZW5lY2suCgotY2hyaXMKCi0tCkxpbnV4LWNhY2hl
ZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4u
cmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnM=

