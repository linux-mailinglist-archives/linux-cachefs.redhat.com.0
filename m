Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 00CF341F053
	for <lists+linux-cachefs@lfdr.de>; Fri,  1 Oct 2021 17:04:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-RwLgboa3Mn6Vp2yzjmrNQw-1; Fri, 01 Oct 2021 11:04:26 -0400
X-MC-Unique: RwLgboa3Mn6Vp2yzjmrNQw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58D6284A5E0;
	Fri,  1 Oct 2021 15:04:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DE505C3DF;
	Fri,  1 Oct 2021 15:04:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6851D4EA29;
	Fri,  1 Oct 2021 15:04:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 191F4HLn019496 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 1 Oct 2021 11:04:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 828B41190D1E; Fri,  1 Oct 2021 15:04:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CAFA1134300
	for <linux-cachefs@redhat.com>; Fri,  1 Oct 2021 15:04:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B014218A6539
	for <linux-cachefs@redhat.com>; Fri,  1 Oct 2021 15:04:14 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam11on2098.outbound.protection.outlook.com [40.107.236.98])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-209-S5SudCg2NLqiViTjTsdL8Q-1; Fri, 01 Oct 2021 11:04:11 -0400
X-MC-Unique: S5SudCg2NLqiViTjTsdL8Q-1
Received: from CH0PR13MB5084.namprd13.prod.outlook.com (2603:10b6:610:111::7)
	by CH0PR13MB4699.namprd13.prod.outlook.com (2603:10b6:610:d9::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.7;
	Fri, 1 Oct 2021 15:04:08 +0000
Received: from CH0PR13MB5084.namprd13.prod.outlook.com
	([fe80::1533:4550:d876:1486]) by
	CH0PR13MB5084.namprd13.prod.outlook.com
	([fe80::1533:4550:d876:1486%6]) with mapi id 15.20.4587.011;
	Fri, 1 Oct 2021 15:04:08 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "dhowells@redhat.com" <dhowells@redhat.com>
Thread-Topic: Can the GFP flags to releasepage() be trusted? -- was Re: [PATCH
	v2 3/8] nfs: Move to using the alternate fallback fscache I/O API
Thread-Index: AQHXq9VkcJvbs0xlPEq7aMXkSiWnq6u+EpgAgAA3MwCAAAZMAIAAA2YA
Date: Fri, 1 Oct 2021 15:04:08 +0000
Message-ID: <23033528036059af4633f60b8325e48eab95ac36.camel@hammerspace.com>
References: <97eb17f51c8fd9a89f10d9dd0bf35f1075f6b236.camel@hammerspace.com>
	<163189104510.2509237.10805032055807259087.stgit@warthog.procyon.org.uk>
	<163189108292.2509237.12615909591150927232.stgit@warthog.procyon.org.uk>
	<CALF+zO=165sRYRaxPpDS7DaQCpTe-YOa4FamSoMy5FV2uuG5Yg@mail.gmail.com>
	<81120.1633099916@warthog.procyon.org.uk>
In-Reply-To: <81120.1633099916@warthog.procyon.org.uk>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e91cadf5-1609-4d1b-da40-08d984ecb81b
x-ms-traffictypediagnostic: CH0PR13MB4699:
x-microsoft-antispam-prvs: <CH0PR13MB4699366B235AE4BD329A2C61B8AB9@CH0PR13MB4699.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: OGWJ3F2/yJA7nmpKdAv488Wlu3qJ5gG3e0HP42FX4A0uPl4KkyeieTsgsi62ioPJfmer4SOisBD+4IUbIgvpWbpPy27zYyfp+ho4z6OtLTaHghjX1/OexzMHZXfmMhc4sHynmRWhH04puESIWSMuSo7Fc8X+YI+eGrWSU+SeaM2dysPQmQHKmyyKaPaKFKbQ2nbRMq4I24UKpWeaGdkodHNlvOkDWfUtlknizmSVB+GdGgbzUKCofFquh8fCSBrQbqYOaFNOvuJ+jp0hW1411m71UupNSh7lxjNwmaHlPghPeqaQmvr8tIgaT2lgpyvi/jkRDIWdJQwKtvbBx9WPVu7sKzzLAketN7LvZqRM6mbHdpQY3sjf0qMLHZuoyae0fSI6I/WlJTdNVLWu0a5082R4SHjBthIZsim4b/D4MOkjXMJl9VbxkicJq8W5m+S+HuZ/ly1jKFk9bkYJ8FIkplG/DpYX/YBjt5BLW6PvQ/lvHMHhLz8dGm7onUmrhES+LOR9LUAUnMjaCI8xNygmu2IDSp1UqI63Viv7xU767cgAGHbkgT0xS8ayxw9uueHCVjeLi/gXD9TJYhvLVqEUt15mou6QzUmU8HV41zCSf2tl4YGfgaK7aC1zdPp0QOX7n0mYxikcDMeE5nD8BNrg6nGWt/Q3LX330wiTAHWH8O6OS/lHGHXSZ2pxdxjSTLjVy+0vjVnNgIwJ69ea7aWULw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CH0PR13MB5084.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(6916009)(38100700002)(76116006)(66556008)(66476007)(122000001)(36756003)(38070700005)(6512007)(64756008)(66446008)(66946007)(6506007)(8676002)(26005)(8936002)(4326008)(71200400001)(54906003)(186003)(86362001)(316002)(5660300002)(2906002)(83380400001)(2616005)(6486002)(508600001);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bE94cTN1bW1vZ1R2ajhLWVZlbFNaWk9KQ0FXU0FhVFJ1MDhOcjhML1hwNnEx?=
	=?utf-8?B?MjByMllJQmJJL3FnMHIyYngydGJhWlV6NTlta0dKakhUOWVvL3B0L2NDNGJq?=
	=?utf-8?B?V0RjQjFtUWV5Ni8yWGs0eDU5ekJsaXpCTnBaNDREZldEUjZMYjJReGxkR01k?=
	=?utf-8?B?YzY1NGdqMEVGNUJnSXV6WmhGdUNXeENrVWlSdmp5bndoTHVNdE81Q05OOGNr?=
	=?utf-8?B?MkZYM255VUovRmxxdy9wdDQzNXQrb283c1BWSVNUcDg5NnZ4SDF0eTRpYy82?=
	=?utf-8?B?SmhiTzFpVlVIVlMxc2EyR1I3dzhWR1ozeHNzWVRmTzlBYXZNMzAxeFZadXBz?=
	=?utf-8?B?YTRRU0o3a0IrUEtoYTJ5ZkUraUwwZ2VHS3JNeDBGbHkyN3VKMjJJeVgrM2hM?=
	=?utf-8?B?dThSMm9vSkk3K0JhUmJIblVVKzE1Rk5MZ1lNclJueTY5dkFnM2M1WDVQNzJq?=
	=?utf-8?B?eXhaUCtUWkd2d2hHTGR5YVFJWnlIU2VESjB2b0E2ZnEwV0VCYXp5dFJ0RytN?=
	=?utf-8?B?cDlXTFVwTk8rUmlrN3BodXB3U2x0YmxWOXd2QlBnY29oUEpldTBPZ2toUkNq?=
	=?utf-8?B?c01MOW13amUrVEVTOWtsL0ZhVW1WdEhPYW54c0NNM2ppMXREZ0pIV0YxcEp0?=
	=?utf-8?B?SE5zemlISlZEQmFZbjhBVVVnMmpnZkRTekozUVhPR1NiZk5uWENaYkFOZStY?=
	=?utf-8?B?RFpJOFpidDNGaWE2eVg2aGQvUGJsc3pCQy9oUGNsZDJWRjFydUpoK1NGSTc0?=
	=?utf-8?B?ZkQ3TmcrUGpXYTZpMU5xTnVsYlVEendNL2h3TlUrUk1TNXBka0F0TDl4VmYx?=
	=?utf-8?B?R05IRXJoVGRJeHRJb0czNExDZkdPZFM3NjNHYXg3S050a2IwcjBTYkxQSGVr?=
	=?utf-8?B?eVkxL2RCa1NEaHFjK0tYQkZmUXNSa2pZQWZIOVJ5bGo0Y05iNlVDc3NCbTlV?=
	=?utf-8?B?NU1xTUU0ME40bFNtZGdaQWM0Q1lKVzZpamsvYXoxSDZvQ3pOc0FhL0dwR1FI?=
	=?utf-8?B?WGRaVlFKN0lRYnlZUGc1aXIrRFVWbGM3a0w4eU4vcDNCUjFmQjc5b3RqVW1w?=
	=?utf-8?B?RGE0SUp3QlpUODRybWlqTndoZnloTnJsK2taYldBWlhmVjRvR0k4a3IxbndE?=
	=?utf-8?B?QzJ3MFBORmt6VUpRa1AxRnd1dm84SVRQME5peTBxS2tDR0hiZUM3OUNQbVRB?=
	=?utf-8?B?V0lqWFF6ZUFqWWFEdGtzVjBpaUw3Qk9RL25WOG9wVTlvbXN0ZitSc1hWaWFZ?=
	=?utf-8?B?cllGanBmMFNXLzdzdVJwa0l0RU1uUE5oV01FRE96NVlYSUVuZkp6MDBlR09r?=
	=?utf-8?B?WjlVWXd0bTkwV1hiYjRvUHp0TUVxSyt6OVh0RzlGM1JJa0ZvT2htUzRpMkZ4?=
	=?utf-8?B?K3pFUTNuQk5URFlLSXJIczVnMHlQQmtwRXFaR1JzOFcybWh6R295b3VwSEcx?=
	=?utf-8?B?RkJPbVArZmtoWGpzbWVPM3M2c1JtcW1MVjYyYlJ1SVdxbXF4Wm50a200c29P?=
	=?utf-8?B?MjRlNDZTRnduY3lhRzlEWEJ2clI5T2ExMkkrOVYyL3lwZDhiOEZOMHJwckJo?=
	=?utf-8?B?dklqb29qOWNaWFJHM21EMWM0YTc5aFluNWdjZHdxc0kzWXNZSTRPUm0vMlhH?=
	=?utf-8?B?VTBaVmg0SzlrUUFTRVQ0TU53OHdNSWYveEMwRkNzWWFla2FxV1lDbXA5NTN6?=
	=?utf-8?B?WVlSc3o4bE1aNzZxZk9ORVlGWTJSK3NmczVxSnVJYzRJeUlaL2V1bUUyNm5Q?=
	=?utf-8?Q?07u6XOSUVOpQv122h85eDNqHmKnSzC4URxZQA+x?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR13MB5084.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e91cadf5-1609-4d1b-da40-08d984ecb81b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 15:04:08.3506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y5/Ew9fehU9RSY4BdNGhntq42ehJxGH4V5pn4d8MK7cfN9mmInLURhVL8RrGzXX3peqEGojOY1dO+dnTEG9/Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR13MB4699
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 191F4HLn019496
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"willy@infradead.org" <willy@infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] Can the GFP flags to releasepage() be trusted?
 -- was Re: [PATCH v2 3/8] nfs: Move to using the alternate fallback fscache
 I/O API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <EC8134AF8324AE44BFD581331A8923DA@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIxLTEwLTAxIGF0IDE1OjUxICswMTAwLCBEYXZpZCBIb3dlbGxzIHdyb3RlOgo+
IFRyb25kIE15a2xlYnVzdCA8dHJvbmRteUBoYW1tZXJzcGFjZS5jb20+IHdyb3RlOgo+IAo+ID4g
PiA+IEBAIC00MzIsNyArNDMyLDEyIEBAIHN0YXRpYyBpbnQgbmZzX3JlbGVhc2VfcGFnZShzdHJ1
Y3QgcGFnZQo+ID4gPiA+ICpwYWdlLCBnZnBfdCBnZnApCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oC8qIElmIFBhZ2VQcml2YXRlKCkgaXMgc2V0LCB0aGVuIHRoZSBwYWdlIGlzIG5vdAo+ID4gPiA+
IGZyZWVhYmxlICovCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChQYWdlUHJpdmF0ZShwYWdl
KSkKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ID4g
PiA+IC3CoMKgwqDCoMKgwqDCoHJldHVybiBuZnNfZnNjYWNoZV9yZWxlYXNlX3BhZ2UocGFnZSwg
Z2ZwKTsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoUGFnZUZzQ2FjaGUocGFnZSkpIHsKPiA+
ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCEoZ2ZwICYgX19HRlBfRElS
RUNUX1JFQ0xBSU0pIHx8ICEoZ2ZwICYKPiA+ID4gPiBfX0dGUF9GUykpCj4gPiA+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZmFsc2U7Cj4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHdhaXRfb25fcGFnZV9mc2NhY2hl
KHBhZ2UpOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gdHJ1ZTsKPiA+ID4gPiDCoH0KPiA+IAo+ID4gSSd2ZSBmb3VuZCB0aGlzIGdlbmVyYWxs
eSBub3QgdG8gYmUgc2FmZS4gVGhlIFZNIGNhbGxzIC0KPiA+ID5yZWxlYXNlX3BhZ2UoKQo+ID4g
ZnJvbSBhIHZhcmlldHkgb2YgY29udGV4dHMsIGFuZCBvZnRlbiBmYWlscyB0byByZXBvcnQgaXQg
Y29ycmVjdGx5Cj4gPiBpbgo+ID4gdGhlIGdmcCBmbGFncy4gVGhhdCdzIHBhcnRpY3VsYXJseSB0
cnVlIG9mIHRoZSBzdHVmZiBpbgo+ID4gbW0vdm1zY2FuLmMuCj4gPiBUaGlzIGlzIHdoeSB3ZSBo
YXZlIHRoZSBjaGVjayBhYm92ZSB0aGF0IHZldG9zIHBhZ2UgcmVtb3ZhbCB1cG9uCj4gPiBQYWdl
UHJpdmF0ZSgpIGJlaW5nIHNldC4KPiAKPiBbQWRkaW5nIFdpbGx5IGFuZCB0aGUgbW0gY3JldyB0
byB0aGUgY2MgbGlzdF0KPiAKPiBJIHdvbmRlciBpZiB0aGF0IG1hdHRlcnMgaW4gdGhpcyBjYXNl
LsKgIEluIHRoZSB3b3JzdCBjYXNlLCB3ZSdsbCB3YWl0Cj4gZm9yIHRoZQo+IHBhZ2UgdG8gY2Vh
c2UgYmVpbmcgRE1BJ2QgLSBidXQgd2Ugd29uJ3QgcmV0dXJuIHRydWUgaWYgaXQgaXMuCj4gCj4g
QnV0IGlmIHZtc2NhbiBpcyBnZW5lcmF0aW5nIHRoZSB3cm9uZyBWTSBmbGFncywgd2Ugc2hvdWxk
IGxvb2sgYXQKPiBmaXhpbmcgdGhhdC4KPiAKPiAKClRvIGVsYWJvcmF0ZSBhIGJpdDogd2UgdXNl
ZCB0byBoYXZlIGNvZGUgaGVyZSB0aGF0IHdvdWxkIGNoZWNrIHdoZXRoZXIKdGhlIHBhZ2UgaGFk
IGJlZW4gY2xlYW5lZCBidXQgd2FzIHVuc3RhYmxlLCBhbmQgaWYgYW4gYXJndW1lbnQgb2YKR0ZQ
X0tFUk5FTCBvciBhYm92ZSB3YXMgc2V0LCB3ZSdkIHRyeSB0byBjYWxsIENPTU1JVCB0byBlbnN1
cmUgdGhlIHBhZ2UKd2FzIHN5bmNoZWQgdG8gZGlzayBvbiB0aGUgc2VydmVyIChhbmQgd2UnZCB3
YWl0IGZvciB0aGF0IGNhbGwgdG8KY29tcGxldGUpLgoKVGhhdCBjb2RlIHdvdWxkIGVuZCB1cCBk
ZWFkbG9ja2luZyBpbiBhbGwgc29ydHMgb2YgaG9ycmlibGUgd2F5cywgc28gd2UKZW5kZWQgdXAg
aGF2aW5nIHRvIHB1bGwgaXQuCgotLSAKVHJvbmQgTXlrbGVidXN0CkxpbnV4IE5GUyBjbGllbnQg
bWFpbnRhaW5lciwgSGFtbWVyc3BhY2UKdHJvbmQubXlrbGVidXN0QGhhbW1lcnNwYWNlLmNvbQoK
CgotLQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20K
aHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZz

