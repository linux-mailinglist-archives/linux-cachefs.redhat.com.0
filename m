Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 69C112BC33E
	for <lists+linux-cachefs@lfdr.de>; Sun, 22 Nov 2020 04:03:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-bz8vQ0nbMx-FvsHTSNZ9YQ-1; Sat, 21 Nov 2020 22:03:57 -0500
X-MC-Unique: bz8vQ0nbMx-FvsHTSNZ9YQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B81D184215F;
	Sun, 22 Nov 2020 03:03:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C684F6064B;
	Sun, 22 Nov 2020 03:03:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1045D180954D;
	Sun, 22 Nov 2020 03:03:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AM33kqU029891 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 21 Nov 2020 22:03:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1D86D2026D12; Sun, 22 Nov 2020 03:03:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 186832026D11
	for <linux-cachefs@redhat.com>; Sun, 22 Nov 2020 03:03:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C6EA800B3B
	for <linux-cachefs@redhat.com>; Sun, 22 Nov 2020 03:03:43 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-550-qKjIen0vMXGUP4e2ic-a5w-1;
	Sat, 21 Nov 2020 22:03:40 -0500
X-MC-Unique: qKjIen0vMXGUP4e2ic-a5w-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 338326E9D; Sat, 21 Nov 2020 22:03:39 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 338326E9D
Date: Sat, 21 Nov 2020 22:03:39 -0500
From: bfields <bfields@fieldses.org>
To: Daire Byrne <daire@dneg.com>
Message-ID: <20201122030339.GF3476@fieldses.org>
References: <20201117031601.GB10526@fieldses.org>
	<20201117152636.GC4556@fieldses.org>
	<725499c144317aac1a03f0334a22005588dbdefc.camel@kernel.org>
	<20201120223831.GB7705@fieldses.org>
	<20201120224438.GC7705@fieldses.org>
	<5f8e9e0cb53c89a7d1c156a6799c6dbc6db96dae.camel@kernel.org>
	<1758069641.91412432.1605995069116.JavaMail.zimbra@dneg.com>
	<20201122000216.GE3476@fieldses.org>
	<1480128642.91427046.1606010150674.JavaMail.zimbra@dneg.com>
MIME-Version: 1.0
In-Reply-To: <1480128642.91427046.1606010150674.JavaMail.zimbra@dneg.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AM33kqU029891
X-loop: linux-cachefs@redhat.com
Cc: "J. Bruce Fields" <bfields@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>, Jeff Layton <jlayton@kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH 2/4] nfsd: pre/post attr is using wrong
	change attribute
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
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU3VuLCBOb3YgMjIsIDIwMjAgYXQgMDE6NTU6NTBBTSArMDAwMCwgRGFpcmUgQnlybmUgd3Jv
dGU6Cj4gCj4gLS0tLS0gT24gMjIgTm92LCAyMDIwLCBhdCAwMDowMiwgYmZpZWxkcyBiZmllbGRz
QGZpZWxkc2VzLm9yZyB3cm90ZToKPiA+PiBJIHNob3VsZCBhbHNvIG1lbnRpb24gdGhhdCBJIHN0
aWxsIHNlZSBhIGxvdCBvZiB1bmV4cGVjdGVkIHJlcGVhdAo+ID4+IGxvb2t1cHMgZXZlbiB3aXRo
IHRoZSBpdmVyc2lvbiBvcHRpbWlzYXRpb24gcGF0Y2hlcyB3aXRoIGNlcnRhaW4KPiA+PiB3b3Jr
bG9hZHMuIEZvciBleGFtcGxlLCBsb29raW5nIGF0IGEgbmV0d29yayBjYXB0dXJlIG9uIHRoZSBy
ZS1leHBvcnQKPiA+PiBzZXJ2ZXIgSSBtaWdodCBzZWUgMTAwcyBvZiBnZXRhdHRyIGNhbGxzIHRv
IHRoZSBvcmlnaW5hdGluZyBzZXJ2ZXIgZm9yCj4gPj4gdGhlIHNhbWUgZmlsZWhhbmRsZSB3aXRo
aW4gMzAgc2Vjb25kcyB3aGljaCBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgdGhlCj4gPj4gY2xpZW50
IGNhY2hlIHRvIHNlcnZlLiBCdXQgaXQgY291bGQgYWxzbyBiZSB0aGF0IHRoZSBjbGllbnQgY2Fj
aGUgaXMKPiA+PiB1bmRlciBtZW1vcnkgcHJlc3N1cmUgYW5kIG5vdCBob2xkaW5nIHRoYXQgZGF0
YSBmb3IgdmVyeSBsb25nLgo+ID4gCj4gPiBUaGF0IHNvdW5kcyB3ZWlyZC4gIElzIHRoZSBmaWxl
aGFuZGxlIGZvciBhIGZpbGUgb3IgYSBkaXJlY3Rvcnk/ICBJcyB0aGUKPiA+IGZpbGUgb3IgZGly
ZWN0b3J5IGFjdHVhbGx5IGNoYW5naW5nIGF0IHRoZSB0aW1lLCBhbmQgaWYgc28sIGlzIGl0IHRo
ZQo+ID4gY2xpZW50IHRoYXQncyBjaGFuZ2luZyBpdD8KPiA+IAo+ID4gUmVtaW5kIG1lIHdoYXQg
dGhlIHNldHVwIGlzLS1hIHYzIHJlLWV4cG9ydCBvZiBhIHY0IG1vdW50Pwo+IAo+IE1heWJlIHRo
aXMgZGlzY3Vzc2lvbiBzaG91bGQgZ28gYmFjayBpbnRvIHRoZSAiQWR2ZW52ZXR1cmVzIGluIHJl
LWV4cG9ydGluZyIgdGhyZWFkPyBCdXQgdG8gZ2l2ZSBhIHF1aWNrIGFuc3dlciBoZXJlIGFueXdh
eS4uLgo+IAo+IFRoZSB3b3JrbG9hZCBJIGhhdmUgYmVlbiBsb29raW5nIGF0IHJlY2VudGx5IGlz
IGEgTkZTdjMgcmUtZXhwb3J0IG9mIGEgTkZTdjQuMiBtb3VudC4gSSBjYW4gYWxzbyBzYXkgdGhh
dCBpdCBpcyBnZW5lcmFsbHkgd2hlbiBuZXcgZmlsZXMgYXJlIGJlaW5nIHdyaXR0ZW4gdG8gYSBk
aXJlY3RvcnkuIFNvIHllcywgdGhlIGZpbGVzIGFuZCBkaXIgYXJlIGNoYW5naW5nIGF0IHRoZSB0
aW1lIGJ1dCBJIHN0aWxsIGRpZG4ndCBleHBlY3QgdG8gc2VlIHNvIG1hbnkgcmVwZWF0ZWQgZ2V0
YXR0ciBuZWF0bHkgYnVuZGxlZCB0b2dldGhlciBpbiBzaG9ydCBidXJzdHMsIGUuZy4gKHJlLWV4
cG9ydCBzZXJ2ZXIgPSAxMC4xNTYuMTIuMSwgb3JpZ2luYXRpbmcgc2VydmVyIDEwLjIxLjIyLjEx
NykuCgpXZWxsLCBJIGd1ZXNzIHRoZSBwcmUvcG9zdC1vcCBhdHRyaWJ1dGVzIGNvdWxkIGNvbnRy
aWJ1dGUgdG8gdGhlCnByb2JsZW0sIGluIHRoYXQgdGhleSBjb3VsZCB1bm5lY2Vzc2FyaWx5IHR1
cm4gYSBDT01NSVQgaW50bwoKCUdFVEFUVFIKCUNPTU1JVAoJR0VUQVRUUgoKQW5kIGRpdHRvIGZv
ciBhbnl0aGluZyB0aGF0IG1vZGlmaWVzIGZpbGUgb3IgZGlyZWN0b3J5IGNvbnRlbnRzLiAgQnV0
CkknZCd2ZSB0aG91Z2h0IHNvbWUgb2YgdGhvc2UgY291bGQgaGF2ZSBiZWVuIGNhY2hlZC4gIEFs
c28gaXQgbG9va3MgbGlrZQp5b3UndmUgZ290IG1vcmUgR0VUQVRUUnMgdGhhbiB0aGF0LiAgSG0u
CgotLWIuCgo+IAo+IDU0NTQ0ICA4OC4xNDc5MjcgIDEwLjE1Ni4xMi4xIOKGkiAxMC4yMS4yMi4x
MTcgTkZTIDMyNiBWNCBDYWxsIFNFVEFUVFIgRkg6IDB4NGRiZGZiMDEKPiA1NDU0NyAgODguMTYw
NDY5ICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5GUyAzNTAgVjQgQ2FsbCBTRVRBVFRS
IEZIOiAweDRkYmRmYjAxCj4gNTQ1NTYgIDg4LjE4NTU5MiAgMTAuMTU2LjEyLjEg4oaSIDEwLjIx
LjIyLjExNyBORlMgMzMwIFY0IENhbGwgU0VUQVRUUiBGSDogMHg0ZGJkZmIwMQo+IDU0NTU5ICA4
OC4xOTgzNTAgIDEwLjE1Ni4xMi4xIOKGkiAxMC4yMS4yMi4xMTcgTkZTIDM1MCBWNCBDYWxsIFNF
VEFUVFIgRkg6IDB4NGRiZGZiMDEKPiA1NDU2MiAgODguMjExNjcwICAxMC4xNTYuMTIuMSDihpIg
MTAuMjEuMjIuMTE3IE5GUyAzMjYgVjQgQ2FsbCBTRVRBVFRSIEZIOiAweDRkYmRmYjAxCj4gNTQ1
NjUgIDg4LjI0MzI1MSAgMTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMzUwIFY0IENh
bGwgT1BFTiBESDogMHg0ZGJkZmIwMS8KPiA1NDYzNyAgODguMjY5NTg3ICAxMC4xNTYuMTIuMSDi
hpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRBVFRSIEZIOiAweDRkYmRmYjAxCj4g
NTUwNzggIDg4LjI3NzEzOCAgMTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMjgyIFY0
IENhbGwgQ09NTUlUIEZIOiAweDRkYmRmYjAxIE9mZnNldDogMCBMZW46IDAKPiA1Nzc0NyAgODgu
MzkwMTk3ICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRB
VFRSIEZIOiAweDRkYmRmYjAxCj4gNTc3NDggIDg4LjM5MDIxMiAgMTAuMTU2LjEyLjEg4oaSIDEw
LjIxLjIyLjExNyBORlMgMjgyIFY0IENhbGwgR0VUQVRUUiBGSDogMHg0ZGJkZmIwMQo+IDU3NzQ5
ICA4OC4zOTAyMTUgIDEwLjE1Ni4xMi4xIOKGkiAxMC4yMS4yMi4xMTcgTkZTIDI4MiBWNCBDYWxs
IEdFVEFUVFIgRkg6IDB4NGRiZGZiMDEKPiA1Nzc1MCAgODguMzkwMjE4ICAxMC4xNTYuMTIuMSDi
hpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRBVFRSIEZIOiAweDRkYmRmYjAxCj4g
NTc3NTEgIDg4LjM5MDIyMCAgMTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMjgyIFY0
IENhbGwgR0VUQVRUUiBGSDogMHg0ZGJkZmIwMQo+IDU3NzUyICA4OC4zOTAyMjIgIDEwLjE1Ni4x
Mi4xIOKGkiAxMC4yMS4yMi4xMTcgTkZTIDI4MiBWNCBDYWxsIEdFVEFUVFIgRkg6IDB4NGRiZGZi
MDEKPiA1Nzc1MyAgODguMzkwMjMxICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5GUyAy
ODIgVjQgQ2FsbCBHRVRBVFRSIEZIOiAweDRkYmRmYjAxCj4gNTc3NTQgIDg4LjM5MDI2MSAgMTAu
MTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMjgyIFY0IENhbGwgQ09NTUlUIEZIOiAweDRk
YmRmYjAxIE9mZnNldDogMCBMZW46IDAKPiA1Nzc1NSAgODguMzkwMjkyICAxMC4xNTYuMTIuMSDi
hpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRBVFRSIEZIOiAweDRkYmRmYjAxCj4g
NTc4NTIgIDg4LjQxNTU0MSAgMTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMjgyIFY0
IENhbGwgQ09NTUlUIEZIOiAweDRkYmRmYjAxIE9mZnNldDogMCBMZW46IDAKPiA1Nzg1MyAgODgu
NDE1NTUxICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRB
VFRSIEZIOiAweDRkYmRmYjAxCj4gNTg5NjUgIDg4LjQ0MjAwNCAgMTAuMTU2LjEyLjEg4oaSIDEw
LjIxLjIyLjExNyBORlMgMjgyIFY0IENhbGwgR0VUQVRUUiBGSDogMHg0ZGJkZmIwMQo+IDYwMjAx
ICA4OC40ODYyMzEgIDEwLjE1Ni4xMi4xIOKGkiAxMC4yMS4yMi4xMTcgTkZTIDI4MiBWNCBDYWxs
IEdFVEFUVFIgRkg6IDB4NGRiZGZiMDEKPiA2MDYxNSAgODguNTA1NDUzICAxMC4xNTYuMTIuMSDi
hpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRBVFRSIEZIOiAweDRkYmRmYjAxCj4g
NjA2MTYgIDg4LjUwNTQ3MyAgMTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMjgyIFY0
IENhbGwgR0VUQVRUUiBGSDogMHg0ZGJkZmIwMQo+IDYwNjE3ICA4OC41MDU0NzcgIDEwLjE1Ni4x
Mi4xIOKGkiAxMC4yMS4yMi4xMTcgTkZTIDI4MiBWNCBDYWxsIEdFVEFUVFIgRkg6IDB4NGRiZGZi
MDEKPiA2MDYxOCAgODguNTA1NDgwICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5GUyAy
ODIgVjQgQ2FsbCBHRVRBVFRSIEZIOiAweDRkYmRmYjAxCj4gNjA2MTkgIDg4LjUwNTQ4MiAgMTAu
MTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMjgyIFY0IENhbGwgQ09NTUlUIEZIOiAweDRk
YmRmYjAxIE9mZnNldDogMCBMZW46IDAKPiAKPiBPZnRlbiBJIG9ubHkgY2FwdHVyZSBhbiBvcGVu
IGRoIGZvbGxvd2VkIGJ5IGEgZmx1cnJ5IG9mIGdldGF0dHI6Cj4gCj4gIDMwNjggIDI0LjYwMzE1
MyAgMTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMzUwIFY0IENhbGwgT1BFTiBESDog
MHhiNjNhOThlYy8KPiAgMzA4OSAgMjQuNjQxNTQyICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIu
MTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRBVFRSIEZIOiAweGI2M2E5OGVjCj4gIDMwOTMgIDI0LjY0
MjE3MiAgMTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMjgyIFY0IENhbGwgR0VUQVRU
UiBGSDogMHhiNjNhOThlYwo+ICAzMTQwICAyNC43MTk5MzAgIDEwLjE1Ni4xMi4xIOKGkiAxMC4y
MS4yMi4xMTcgTkZTIDI4MiBWNCBDYWxsIEdFVEFUVFIgRkg6IDB4YjYzYTk4ZWMKPiAgMzM2MCAg
MjQuNzY5NDIzICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBH
RVRBVFRSIEZIOiAweGI2M2E5OGVjCj4gIDMzNzYgIDI0Ljc3MTM1MyAgMTAuMTU2LjEyLjEg4oaS
IDEwLjIxLjIyLjExNyBORlMgMjgyIFY0IENhbGwgR0VUQVRUUiBGSDogMHhiNjNhOThlYwo+ICAz
NDM2ICAyNC43ODI4MTcgIDEwLjE1Ni4xMi4xIOKGkiAxMC4yMS4yMi4xMTcgTkZTIDI4MiBWNCBD
YWxsIEdFVEFUVFIgRkg6IDB4YjYzYTk4ZWMKPiAgMzU2OSAgMjQuNzk4MjA3ICAxMC4xNTYuMTIu
MSDihpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRBVFRSIEZIOiAweGI2M2E5OGVj
Cj4gIDM3NTMgIDI0Ljg1NTIzMyAgMTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMjgy
IFY0IENhbGwgR0VUQVRUUiBGSDogMHhiNjNhOThlYwo+ICAzNzc3ICAyNC44NTYxMzAgIDEwLjE1
Ni4xMi4xIOKGkiAxMC4yMS4yMi4xMTcgTkZTIDI4MiBWNCBDYWxsIEdFVEFUVFIgRkg6IDB4YjYz
YTk4ZWMKPiAgMzgyNCAgMjQuODYyOTE5ICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5G
UyAyODIgVjQgQ2FsbCBHRVRBVFRSIEZIOiAweGI2M2E5OGVjCj4gIDM4NzMgIDI0Ljg3Mzg5MCAg
MTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMjgyIFY0IENhbGwgR0VUQVRUUiBGSDog
MHhiNjNhOThlYwo+ICA0MDAxICAyNC44OTgyODkgIDEwLjE1Ni4xMi4xIOKGkiAxMC4yMS4yMi4x
MTcgTkZTIDI4MiBWNCBDYWxsIEdFVEFUVFIgRkg6IDB4YjYzYTk4ZWMKPiAgNDA3MCAgMjQuOTI1
OTcwICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRBVFRS
IEZIOiAweGI2M2E5OGVjCj4gIDQxMjcgIDI0Ljk0MDYxNiAgMTAuMTU2LjEyLjEg4oaSIDEwLjIx
LjIyLjExNyBORlMgMjgyIFY0IENhbGwgR0VUQVRUUiBGSDogMHhiNjNhOThlYwo+ICA0MTc0ICAy
NC45ODUxNjAgIDEwLjE1Ni4xMi4xIOKGkiAxMC4yMS4yMi4xMTcgTkZTIDI4MiBWNCBDYWxsIEdF
VEFUVFIgRkg6IDB4YjYzYTk4ZWMKPiAgNDM0MyAgMjUuMDA3NTY1ICAxMC4xNTYuMTIuMSDihpIg
MTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRBVFRSIEZIOiAweGI2M2E5OGVjCj4gIDQz
NDQgIDI1LjAwODM0MyAgMTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMjgyIFY0IENh
bGwgR0VUQVRUUiBGSDogMHhiNjNhOThlYwo+ICA0MzU4ICAyNS4wMzYxNzcgIDEwLjE1Ni4xMi4x
IOKGkiAxMC4yMS4yMi4xMTcgTkZTIDI4MiBWNCBDYWxsIEdFVEFUVFIgRkg6IDB4YjYzYTk4ZWMK
PiAKPiBUaGUgY29tbW9uIHdvcmtsb2FkIGlzIHRoYXQgd2Ugd2lsbCBoYXZlIG11bHRpcGxlIGNs
aWVudHMgb2YgdGhlIHJlLWV4cG9ydCBzZXJ2ZXIgYWxsIHdyaXRpbmcgZGlmZmVyZW50IChmcmFt
ZSkgZmlsZXMgaW50byB0aGUgc2FtZSBkaXJlY3RvcnkgYXQgdGhlIHNhbWUgdGltZS4gQnV0IG9u
IHRoZSByZS1leHBvcnQgc2VydmVyIGl0IGlzIHVsdGltYXRlbHkgMTYgdGhyZWFkcyBvZiBuZnNk
IG1ha2luZyB0aG9zZSBjYWxscyB0byB0aGUgb3JpZ2luYXRpbmcgc2VydmVyLgo+IAo+IFRoZSBy
ZS1leHBvcnQgc2VydmVyJ3MgY2xpZW50IHNob3VsZCBiZSB0aGUgb25seSBvbmUgbWFraW5nIG1v
c3Qgb2YgdGhlIGNoYW5nZXMsIGFsdGhvdWdoIHRoZXJlIGFyZSBvdGhlciBORlN2MyBjbGllbnRz
IG9mIHRoZSBvcmlnaW5hdGluZyBzZXJ2ZXJzIHRoYXQgY291bGQgY29uY2VpdmFibHkgYmUgdXBk
YXRpbmcgZmlsZXMgdG9vLgo+IAo+IExpa2UgSSBzYWlkLCBpdCBtaWdodCBiZSBpbnRlcmVzdGlu
ZyB0byBzZWUgaWYgd2Ugc2VlIHRoZSBzYW1lIGJlaGF2aW91ciB3aXRoIGEgTkZTdjMgcmUtZXhw
b3J0IG9mIGFuIE5GU3YzIHNlcnZlci4KPiAKPiBEYWlyZQoKCi0tCkxpbnV4LWNhY2hlZnMgbWFp
bGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVmcw==

