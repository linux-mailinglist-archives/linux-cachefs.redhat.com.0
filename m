Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFEF5A0157
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Aug 2022 20:28:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661365683;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Nu6ajkxgPCw+LvNy8EYRD5d7wZdOidkSJ6e1Jbc+reA=;
	b=Hnyn4YEJm4LfX9Y2gsEbY66PDHWzjxhCexrlat5F8rYh1OGmQCkCBxnFg9sWnmSCtdCCGY
	U+YiskR/Fti47lxB3qZuV6VYJ4mVpNGcYAdFCQxHWyMrunbgaoWe9D7eNA70A4OwWydz1f
	wEJycyZTPpAtDHMxXRpeVCCLrWB2cLU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-eBYfDx36OBaYbm1CcQcstw-1; Wed, 24 Aug 2022 14:28:01 -0400
X-MC-Unique: eBYfDx36OBaYbm1CcQcstw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 680F9805F46;
	Wed, 24 Aug 2022 18:28:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A4F01121319;
	Wed, 24 Aug 2022 18:28:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1F4E11946A58;
	Wed, 24 Aug 2022 18:28:00 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AD7BA1946A42 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 24 Aug 2022 17:43:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 820CD4010D24; Wed, 24 Aug 2022 17:43:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D51A40D2830
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 17:43:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49BC63C0F36E
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 17:43:46 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2115.outbound.protection.outlook.com [40.107.94.115]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-6Tq6WzN5NsGcorl-_UyhrQ-1; Wed, 24 Aug 2022 13:43:42 -0400
X-MC-Unique: 6Tq6WzN5NsGcorl-_UyhrQ-1
Received: from CH0PR13MB5084.namprd13.prod.outlook.com (2603:10b6:610:111::7)
 by BY3PR13MB4788.namprd13.prod.outlook.com (2603:10b6:a03:36e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 17:43:37 +0000
Received: from CH0PR13MB5084.namprd13.prod.outlook.com
 ([fe80::f1c7:62d0:a63d:f5ca]) by CH0PR13MB5084.namprd13.prod.outlook.com
 ([fe80::f1c7:62d0:a63d:f5ca%3]) with mapi id 15.20.5566.014; Wed, 24 Aug 2022
 17:43:37 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "willy@infradead.org" <willy@infradead.org>
Thread-Topic: [RFC PATCH 2/3] NFS: Add support for netfs in struct nfs_inode
 and Kconfig
Thread-Index: AQHYt5zQc0jiP02yL0Kjw6guU1m2RK29/pOAgAAFTACAAAEnAIAAErsAgAAlsoCAAAdXgIAADgwA
Date: Wed, 24 Aug 2022 17:43:36 +0000
Message-ID: <5dfadceb26da1b4d8d499221a5ff1d3c80ad59c0.camel@hammerspace.com>
References: <da9200f1bded9b8b078a7aef227fd6b92eb028fb.camel@hammerspace.com>
 <20220824093501.384755-1-dwysocha@redhat.com>
 <20220824093501.384755-3-dwysocha@redhat.com>
 <429ecc819fcffe63d60dbb2b72f9022d2a21ddd8.camel@hammerspace.com>
 <CALF+zOknvMZyufSUD-g9Z9Y5RfwE-vUFT+CF0kxqbcpR=yJPJw@mail.gmail.com>
 <216681.1661350326@warthog.procyon.org.uk>
 <5ab3188affa7e56e68a4f66a42f45d7086c1da23.camel@hammerspace.com>
 <YwZXfSXMzZgaSPAg@casper.infradead.org>
In-Reply-To: <YwZXfSXMzZgaSPAg@casper.infradead.org>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9daee04-8993-4407-b55f-08da85f82c7c
x-ms-traffictypediagnostic: BY3PR13MB4788:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: XbtP+o4HrHP3q6NI63Yx5JNIf0bYHL9L+J9nsoV6CfgNbwS9rs5EVc3pq6M2wFQZZAVbcJBWmMh8e4raa3V+LstVsZLGVCIUtYjMDSUQiOhErp4CJx0UVlYfCvkOkV3yMgjrnMDSmhf/Y7zxjoMe3lp7qDBNrbp0lXYKifshCx/I/fFhfbp74T1jSeZPs4CRK2wO1cF7MXjFMh+IgUucoUWChT9PNdzCR+HKsXTOVQFkpoZg8qvepOgs9Zwk7Pklc+A+MHJ8+ObpRDSa59NB8+oi59rTuFESGb4NyJiahJ0OyeUUOrjujzY8gvaPDLR4Qn4/4EQNOYUv+vWvIFLI2zdMDnoHviDqqBrUNhgCbRuY2UbXUcKYG+vDFugrR222ACtxsEmD/OEzfZdSZ2281hHFhP4URIkt4KIOd5llUaY/wkx1R6dUXaO7l1g+gHnQqWUeamYe0uf0ELaMkfi0M17TmJ+4xFRL+c8DIhYnBZnfNMWxfwbfIHYTf/1gg9waQV6vrzesJsaoNYiLs6ZfG9zlZ/XTaNZu3+4o/V2Q20kIjlz7QkwqNXQpjrsy2ZhrhAm48bISO/pojqjL8JdA03JpGuJlwmu2DMriMJfAWhpIsG9G5QE3CA2GXqc6fmzVu8vS/NuzgWtMmdfsjLm2mrovQhi0UB4WPcvvABQ6ujl1q0rhzrVJOvR1lg/zlmAXBxrGtMvPOAvKLWVLSsXAz6jSa5gilZVR/RivFHK6m9U0Bz03juDfW0gTPZTuLcMuInz1UfOCDglMf509uZcZWw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR13MB5084.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39830400003)(346002)(136003)(376002)(396003)(66946007)(64756008)(66476007)(5660300002)(4326008)(8676002)(66446008)(6486002)(8936002)(66556008)(41300700001)(36756003)(478600001)(71200400001)(316002)(76116006)(6916009)(6506007)(86362001)(26005)(54906003)(2906002)(186003)(2616005)(6512007)(83380400001)(122000001)(38070700005)(38100700002);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXprN3RCSmQ5M3phK3hOV3NVUTV2Q3pzUzBMNTQ0ZDlEdXhoOHB1Z3pyb3Ur?=
 =?utf-8?B?SmJXTTNKVmw0cXRoT095REtBSDhvN01jSUF5SjErV2ZRa2lRVzdKMDdPZk1p?=
 =?utf-8?B?UUU4aHpGWEwveFp1aFJQb0tya1VMbUNlNzBVQzhIMHNabGZPZ1QzVmMrTklM?=
 =?utf-8?B?QkRLck0zeXNFZmhxUVNYQmZpdWFYV1FObml5VEl3amJseGx4VFdpVXJ6aGI4?=
 =?utf-8?B?REU2R3FrSjZvQkRuK1ZSOXhpSG4wbTU1Skd0ek9idXJieU9HNHF1dHcwV1p6?=
 =?utf-8?B?enRqR1AwRmxqd0Q4WTRpaXFQbklJSklKOTFlYVhuRjZCS01VSU0zeldEM3Ew?=
 =?utf-8?B?WGdJUU1YK3hmYzVwTHk2VnVYV3pLaWxFYTdOQ2wrUFpyV1YzVFdLbGRtejhP?=
 =?utf-8?B?YVNEZ1FrRDdEZk41cUNmVGh3NUpKS2QvUzM2Sk9TWHJ1S21EL2pLOWdJSjRv?=
 =?utf-8?B?TWRlenRCa2xvMXNZQWZnaUwyU1NScURpdWFmOU9SbFlTUm5jRG96MFdWcDQ2?=
 =?utf-8?B?c20xYzJPRXFoN004bDhEbzhIVWVrVS9GVGRMM2kvVjg5ckI0L1RYQ0I3RHVO?=
 =?utf-8?B?TXZhakRkT040N0ZCNWJQM0I4VU1waXExQWVLdFJ4d25kZE9IVzFaYXFLNksz?=
 =?utf-8?B?Q1A4eVVVOUdZRDE5TFJhcmJTZUM3TVlCbGN6NktWemM2UStmeVgzWmJwYXdO?=
 =?utf-8?B?U0R6dGZRYTBKT3puTTZVUHN5ZnVhN0pVWlBMRkpjaWJWS25idmJaRDRIUWNK?=
 =?utf-8?B?M2xuZ2lGeE9VRlBTa3gvVUJka0pEU09YVTc2allYWlNMSDZUWnRhcTZoUkZm?=
 =?utf-8?B?S0loV0FrRjFTK0hhbHlxMEJnbGZXZ3FUWWt2MjN0TDYwOXNIUEZxVXRpaHRJ?=
 =?utf-8?B?ZVNPakFzVUxHOHI4bE9lOXNtZDJKd25TZDhxRm1aNElyWldWeGtVV1lUQW5v?=
 =?utf-8?B?WEFUZ1V6NDRwTm12MlZoYTkrRGNSb1dsVkQwTXR4ZGtacmtybWJJK2lnT1NF?=
 =?utf-8?B?bDZtdkY3NHdPcWZJUjhicGM2cERicDZVamNRc0xrRzVyN25kMjR1MHpoOThx?=
 =?utf-8?B?SEpoMWp3Y0c0WWlTblcvdnNzMnRmU3ptVXVuc2tqVHd5a0xBZFA4VlF0bVNj?=
 =?utf-8?B?SnVQL2MxeGZtVjh2d3oxRlNqUVVscFd5VTNHQ3c2Vy9YSlU4R1M5TnFqUHA4?=
 =?utf-8?B?UkFyMk5xOHpMMG53cGlGNGZVTVI0czZCSCtobGNxM1hWT1F1ZnBOenE0TUVP?=
 =?utf-8?B?V1hiRzNPWHUzcmtQS1ByaDY0VHFQdURVMzAxNTVkME5BZnlOd1RLM2N4SVBm?=
 =?utf-8?B?czN5THNjWXh5UU90REtETjZ0OG9wMmtGYllmbzR6WW5HWjNVOER5ekxUeE1W?=
 =?utf-8?B?d1QzUWJhR0hBdDRSdE4rSzNQZ3FIbUM5WHQzUko1aEVaam4xbVlWOHMzd2p0?=
 =?utf-8?B?cjBQNTExZUliM254S3dWN3pWMkpHZEIrQzhNUy9XWUZhU2dIQjU5SnZhVGJz?=
 =?utf-8?B?OWJaSXB3bUw0bzJMMHJ2bzl0a29hbmZMMjB2MTlXeE9Jbzg5ZGhtaFdpMVJS?=
 =?utf-8?B?eGMvWGR5OFA1WDRVS1N2aS9aQUh4WFQ4anVmNkpTdGdRdWFScVI0ZkgxUko2?=
 =?utf-8?B?N0FQVmhWK0V3NjZ5R2wzMElpdzA0eW9FNnEzYTU3Q3pFdHNPZDg4Q004dUti?=
 =?utf-8?B?QkxLZ1cxeDdQM1Jjd1lBbUpodjVSRzh0OVU4RDNZM3h6emk5RXdCSlE2aGg4?=
 =?utf-8?B?TkN3YmoyamdDMkRYbElVMEpXV25yaERmb1lBRXFwS1dZWXQ0citha0xqbS9n?=
 =?utf-8?B?azBudkl0L2ZiVTh3Mm1oT0JObXZSNXo0L1lCQkFGd3RjKzF4RWo5ak0xMkRl?=
 =?utf-8?B?cUlyV2RUSUVMZzcwSW9XUEVZQmh2VVY0QjZNRFpQN3V5eFNzUzllVVJ3enlY?=
 =?utf-8?B?d0hhNUdJeTBCMFE1NGZndlVheTdUejR1QUlTQWxYM0pIa2l5Q09tQnhLcDh5?=
 =?utf-8?B?OGZidC9nMk9NaW42UmNITDVnTkR1ZHErSStCbjgzZ00zRDEwLzQ4Ym5KaHN2?=
 =?utf-8?B?SDNaRnlhZEZEaFFUZXE1VlBCbTFlYk1pd2s3NHA5MEsvRmMxak1idHFGZ2Rr?=
 =?utf-8?B?SUhjSDFTMnphNDhpYUEvWnJJK0hyM1Y2UE9PbmV5dHpMZ3g1d1dGbnlhSnhD?=
 =?utf-8?B?YkE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR13MB5084.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9daee04-8993-4407-b55f-08da85f82c7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 17:43:37.0930 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sqEMCSlJJW66jlfHCkO/RkLpoOj9mNpR2Pbdo9Ei2537l17NyunGXr04FJXgLuJHccMk9kRX+ybzrKMthJtdQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR13MB4788
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <49618FC8D0573B4C98AE8CC40EB1192A@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIyLTA4LTI0IGF0IDE3OjUzICswMTAwLCBNYXR0aGV3IFdpbGNveCB3cm90ZToN
Cj4gT24gV2VkLCBBdWcgMjQsIDIwMjIgYXQgMDQ6Mjc6MDRQTSArMDAwMCwgVHJvbmQgTXlrbGVi
dXN0IHdyb3RlOg0KPiA+IFJpZ2h0IG5vdywgSSBzZWUgbGltaXRlZCB2YWx1ZSBpbiBhZGRpbmcg
bXVsdGlwYWdlIGZvbGlvcyB0byBORlMuDQo+ID4gDQo+ID4gV2hpbGUgYmFzaWMgTkZTdjQgZG9l
cyBhbGxvdyB5b3UgdG8gcHJldGVuZCB0aGVyZSBpcyBhIGZ1bmRhbWVudGFsDQo+ID4gdW5kZXJs
eWluZyBibG9jayBzaXplLCBwTkZTIGhhcyBjaGFuZ2VkIGFsbCB0aGF0LCBhbmQgd2UgaGF2ZSBo
YWQNCj4gPiB0bw0KPiA+IGVuZ2luZWVyIHN1cHBvcnQgZm9yIGRldGVybWluaW5nIHRoZSBJL08g
YmxvY2sgc2l6ZSBvbiB0aGUgZmx5LCBhbmQNCj4gPiBidWlsZGluZyB0aGUgUlBDIHJlcXVlc3Rz
IGFjY29yZGluZ2x5LiBDbGllbnQgc2lkZSBtaXJyb3JpbmcganVzdA0KPiA+IGFkZHMNCj4gPiB0
byB0aGUgZnVuLg0KPiA+IA0KPiA+IEFzIEkgc2VlIGl0LCB0aGUgb25seSB2YWx1ZSB0aGF0IG11
bHRpcGFnZSBmb2xpb3MgbWlnaHQgYnJpbmcgdG8NCj4gPiBORlMNCj4gPiB3b3VsZCBiZSBzbWFs
bGVyIHBhZ2UgY2FjaGUgbWFuYWdlbWVudCBvdmVyaGVhZCB3aGVuIGRlYWxpbmcgd2l0aA0KPiA+
IGxhcmdlDQo+ID4gZmlsZXMuDQo+IA0KPiBZZXMsIGJ1dCB0aGF0J3MgYSBSZWFsbHkgQmlnIERl
YWwuwqAgTWFjaGluZXMgd2l0aCBhIGxvdCBvZiBtZW1vcnkgZW5kDQo+IHVwIHdpdGggdmVyeSBs
b25nIExSVSBsaXN0cy7CoCBXZSBjYW4ndCBhZmZvcmQgdGhlIG92ZXJoZWFkIG9mDQo+IG1hbmFn
aW5nDQo+IG1lbW9yeSBpbiA0a0IgY2h1bmtzIGFueSBtb3JlLsKgIChJIGRvbid0IHdhbnQgdG8g
ZHdlbGwgb24gdGhpcyBwb2ludA0KPiB0b28NCj4gbXVjaDsgSSd2ZSBydW4gdGhlIG51bWJlcnMg
YmVmb3JlIGFuZCBjYW4gZG8gc28gYWdhaW4gaWYgeW91IHdhbnQgbWUNCj4gdG8NCj4gZ28gaW50
byBtb3JlIGRldGFpbHMpLg0KPiANCj4gQmV5b25kIHRoYXQsIGZpbGVzeXN0ZW1zIGhhdmUgYSBs
b3Qgb2YgaW50ZXJhY3Rpb25zIHdpdGggdGhlIHBhZ2UNCj4gY2FjaGUNCj4gdG9kYXkuwqAgV2hl
biBJIHN0YXJ0ZWQgbG9va2luZyBhdCB0aGlzLCBJIHRob3VnaHQgZmlsZXN5c3RlbSBwZW9wbGUN
Cj4gYWxsDQo+IGhhZCBhIGRlZXAgdW5kZXJzdGFuZGluZyBvZiBob3cgdGhlIHBhZ2UgY2FjaGUg
d29ya2VkLsKgIE5vdyBJIHJlYWxpc2UNCj4gZXZlcnlvbmUncyBhcyBjbHVlbGVzcyBhcyBJIGFt
LsKgIFRoZSByZWFsIGJlbmVmaXQgSSBzZWUgdG8gcHJvamVjdHMNCj4gbGlrZQ0KPiBpb21hcC9u
ZXRmcyBpcyB0aGF0IHRoZXkgaW5zdWxhdGUgZmlsZXN5c3RlbXMgZnJvbSBoYXZpbmcgdG8gZGVh
bA0KPiB3aXRoDQo+IHRoZSBwYWdlIGNhY2hlLsKgIEFsbCB0aGUgaW50ZXJhY3Rpb25zIGFyZSBp
biB0d28gb3IgdGhyZWUgcGxhY2VzIGFuZA0KPiB3ZQ0KPiBjYW4gcmVmYWN0b3Igd2l0aG91dCBo
YXZpbmcgdG8gdGFsayB0byB0aGUgb3duZXJzIG9mIDUwKyBmaWxlc3lzdGVtcy4NCj4gDQo+IEl0
IGFsc28gZ2l2ZXMgdXMgYSBjaGFuY2UgdG8gcmUtZXhhbWluZSBzb21lIG9mIHRoZSBhc3N1bXB0
aW9ucyB0aGF0DQo+IHdlIGhhdmUgbWFkZSBvdmVyIHRoZSB5ZWFycyBhYm91dCBob3cgZmlsZXN5
c3RlbXMgYW5kIHBhZ2UgY2FjaGUNCj4gc2hvdWxkDQo+IGJlIGludGVyYWN0aW5nLsKgIFdlJ3Zl
IGZpeGVkIGEgZmFpciBmZXcgYnVncyBpbiByZWNlbnQgeWVhcnMgdGhhdA0KPiBjYW1lDQo+IGFi
b3V0IGJlY2F1c2UgZmlsZXN5c3RlbSBwZW9wbGUgZG9uJ3QgdGVuZCB0byBoYXZlIGRlZXAga25v
d2xlZGdlIG9mDQo+IG1tDQo+IGludGVybmFscyAoYW5kIHRoZXkgc2hvdWxkbid0IG5lZWQgdG8h
KQ0KPiANCj4gSSBkb24ndCBrbm93IHRoYXQgbmV0ZnMgaGFzIHRoZSBwZXJmZWN0IGludGVyZmFj
ZSB0byBiZSB1c2VkIGZvciBuZnMuDQo+IEJ1dCB0aGF0IHRvbyBjYW4gYmUgY2hhbmdlZCB0byBt
YWtlIGl0IHdvcmsgYmV0dGVyIGZvciB5b3VyIG5lZWRzLg0KDQpJZiB0aGUgVk0gZm9sa3MgbmVl
ZCBpdCwgdGhlbiBhZGRpbmcgc3VwcG9ydCBmb3IgbXVsdGktcGFnZSBmb2xpb3MgaXMgYQ0KbXVj
aCBzbWFsbGVyIHNjb3BlIHRoYW4gd2hhdCBEYXZpZCB3YXMgZGVzY3JpYmluZy4gSXQgY2FuIGJl
IGRvbmUNCndpdGhvdXQgdG9vIG11Y2ggc3VyZ2VyeSB0byB0aGUgZXhpc3RpbmcgTkZTIEkvTyBz
dGFjay4gV2UgYWxyZWFkeSBoYXZlDQpjb2RlIHRvIHN1cHBvcnQgSS9PIGJsb2NrIHNpemVzIHRo
YXQgYXJlIG11Y2ggbGVzcyB0aGFuIHRoZSBwYWdlIHNpemUsDQpzbyBjb252ZXJ0aW5nIHRoYXQg
dG8gYWN0IG9uIGxhcmdlciBmb2xpb3MgaXMgbm90IGEgaHVnZSBkZWFsLg0KDQpXaGF0IHdvdWxk
IGJlIHVzZWZ1bCB0aGVyZSBpcyBzb21ldGhpbmcgbGlrZSBhIHJhbmdlIHRyZWUgdG8gYWxsb3cg
dXMNCnRvIG1vdmUgYmV5b25kIHRoZSBQR191cHRvZGF0ZSBiaXQsIGFuZCBoZWxwIG1ha2UgdGhl
DQppc19wYXJ0aWFsbHlfdXB0b2RhdGUoKSBhZGRyZXNzX3NwYWNlX29wZXJhdGlvbiBhIGJpdCBt
b3JlIHVzZWZ1bC4NCk90aGVyd2lzZSwgd2UgZW5kIHVwIGhhdmluZyB0byByZWFkIGluIHRoZSBl
bnRpcmUgZm9saW8sIHdoaWNoIGlzIHdoYXQNCndlIGRvIHRvZGF5IGZvciBwYWdlcywgYnV0IGNv
dWxkIGdldCBvbmVyb3VzIHdpdGggbGFyZ2UgZm9saW9zIHdoZW4NCmRvaW5nIGZpbGUgcmFuZG9t
IGFjY2Vzcy4NCg0KLS0gDQpUcm9uZCBNeWtsZWJ1c3QNCkxpbnV4IE5GUyBjbGllbnQgbWFpbnRh
aW5lciwgSGFtbWVyc3BhY2UNCnRyb25kLm15a2xlYnVzdEBoYW1tZXJzcGFjZS5jb20NCg0KDQot
LQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0
cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZzCg==

