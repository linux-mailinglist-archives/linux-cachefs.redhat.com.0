Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CE6032B4A72
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Nov 2020 17:14:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-yrSeALUGNTmXI6I7Dnr0fQ-1; Mon, 16 Nov 2020 11:14:18 -0500
X-MC-Unique: yrSeALUGNTmXI6I7Dnr0fQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAAD6186DD26;
	Mon, 16 Nov 2020 16:14:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9958819D6C;
	Mon, 16 Nov 2020 16:14:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F354B183D021;
	Mon, 16 Nov 2020 16:14:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGGECux028234 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 11:14:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D652F202278E; Mon, 16 Nov 2020 16:14:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0E0D201EE2E
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 16:14:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC8BA90E425
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 16:14:10 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-195-UlbYtXavNBiCx0hq16yvLA-1;
	Mon, 16 Nov 2020 11:14:08 -0500
X-MC-Unique: UlbYtXavNBiCx0hq16yvLA-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 483021C15; Mon, 16 Nov 2020 11:14:07 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 483021C15
Date: Mon, 16 Nov 2020 11:14:07 -0500
From: bfields <bfields@fieldses.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20201116161407.GG898@fieldses.org>
References: <1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<20201112135733.GA9243@fieldses.org>
	<444227972.86442677.1605206025305.JavaMail.zimbra@dneg.com>
	<20201112205524.GI9243@fieldses.org>
	<883314904.86570901.1605222357023.JavaMail.zimbra@dneg.com>
	<20201113145050.GB1299@fieldses.org>
	<20201113222600.GC1299@fieldses.org>
	<b0d61b4053442ba46fd2c707ee7e0608704c2598.camel@kernel.org>
	<20201116155619.GF898@fieldses.org>
	<83ebb6dc68216ce3f3dfd2a2736b7a301550efc5.camel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <83ebb6dc68216ce3f3dfd2a2736b7a301550efc5.camel@kernel.org>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AGGECux028234
X-loop: linux-cachefs@redhat.com
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTE6MDM6MDBBTSAtMDUwMCwgSmVmZiBMYXl0b24gd3Jv
dGU6Cj4gT24gTW9uLCAyMDIwLTExLTE2IGF0IDEwOjU2IC0wNTAwLCBiZmllbGRzIHdyb3RlOgo+
ID4gT24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTA6Mjk6MjlBTSAtMDUwMCwgSmVmZiBMYXl0b24g
d3JvdGU6Cj4gPiA+IE9uIEZyaSwgMjAyMC0xMS0xMyBhdCAxNzoyNiAtMDUwMCwgYmZpZWxkcyB3
cm90ZToKPiA+ID4gPiBPbiBGcmksIE5vdiAxMywgMjAyMCBhdCAwOTo1MDo1MEFNIC0wNTAwLCBi
ZmllbGRzIHdyb3RlOgo+ID4gPiA+ID4gT24gVGh1LCBOb3YgMTIsIDIwMjAgYXQgMTE6MDU6NTdQ
TSArMDAwMCwgRGFpcmUgQnlybmUgd3JvdGU6Cj4gPiA+ID4gPiA+IFNvLCBJIGNhbid0IGxheSBj
bGFpbSB0byBpZGVudGlmeWluZyB0aGUgZXhhY3Qgb3B0aW1pc2F0aW9uL2hhY2sgdGhhdAo+ID4g
PiA+ID4gPiBpbXByb3ZlcyB0aGUgcmV0ZW50aW9uIG9mIHRoZSByZS1leHBvcnQgc2VydmVyJ3Mg
Y2xpZW50IGNhY2hlIHdoZW4KPiA+ID4gPiA+ID4gcmUtZXhwb3J0aW5nIGFuIE5GU3YzIHNlcnZl
ciAod2hpY2ggaXMgdGhlbiByZWFkIGJ5IG1hbnkgY2xpZW50cykuIFdlCj4gPiA+ID4gPiA+IHdl
cmUgd29ya2luZyB3aXRoIGFuIGVuZ2luZWVyIGF0IHRoZSB0aW1lIHdobyBzaG93ZWQgYW4gaW50
ZXJlc3QgaW4KPiA+ID4gPiA+ID4gb3VyIHVzZSBjYXNlIGFuZCBhZnRlciB3ZSBzdXBwbGllZCBh
IHJlcHJvZHVjZXIgaGUgc3VnZ2VzdGVkIG1vZGlmeWluZwo+ID4gPiA+ID4gPiB0aGUgbmZzL2lu
b2RlLmMKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IC0JCWlmICghaW5vZGVfZXFfaXZlcnNpb25f
cmF3KGlub2RlLCBmYXR0ci0+Y2hhbmdlX2F0dHIpKSB7Cj4gPiA+ID4gPiA+ICsJCWlmIChpbm9k
ZV9wZWVrX2l2ZXJzaW9uX3Jhdyhpbm9kZSkgPCBmYXR0ci0+Y2hhbmdlX2F0dHIpCj4gPiA+ID4g
PiA+IHsKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEhpcyByZWFzb25pbmcgYXQgdGhlIHRpbWUg
d2FzOgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gIkZpeGVzIGlub2RlIGludmFsaWRhdGlvbiBj
YXVzZWQgYnkgcmVhZCBhY2Nlc3MuIFRoZSBsZWFzdCBpbXBvcnRhbnQKPiA+ID4gPiA+ID4gYml0
IGlzIE9SZWQgd2l0aCAxIGFuZCBjYXVzZXMgdGhlIGlub2RlIHZlcnNpb24gdG8gZGlmZmVyIGZy
b20gdGhlIG9uZQo+ID4gPiA+ID4gPiBzZWVuIG9uIHRoZSBORlMgc2hhcmUuIFRoaXMgaW4gdHVy
biBjYXVzZXMgdW5uZWNlc3NhcnkgcmUtZG93bmxvYWQKPiA+ID4gPiA+ID4gaW1wYWN0aW5nIHRo
ZSBwZXJmb3JtYW5jZSBzaWduaWZpY2FudGx5LiBUaGlzIGZpeCBtYWtlcyBpdCBvbmx5Cj4gPiA+
ID4gPiA+IHJlLWZldGNoIGZpbGUgY29udGVudCBpZiBpbm9kZSB2ZXJzaW9uIHNlZW4gb24gdGhl
IHNlcnZlciBpcyBuZXdlcgo+ID4gPiA+ID4gPiB0aGFuIHRoZSBvbmUgb24gdGhlIGNsaWVudC4i
Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBCdXQgSSd2ZSBhbHdheXMgYmVlbiBwdXp6bGVkIGJ5
IHdoeSB0aGlzIG9ubHkgc2VlbXMgdG8gYmUgdGhlIGNhc2UKPiA+ID4gPiA+ID4gd2hlbiB1c2lu
ZyBrbmZzZCB0byByZS1leHBvcnQgdGhlIChORlN2MykgY2xpZW50IG1vdW50LiBVc2luZyBtdWx0
aXBsZQo+ID4gPiA+ID4gPiBwcm9jZXNzZXMgb24gYSBzdGFuZGFyZCBjbGllbnQgbW91bnQgbmV2
ZXIgY2F1c2VzIGFueSBzaW1pbGFyCj4gPiA+ID4gPiA+IHJlLXZhbGlkYXRpb25zLiBBbmQgdGhp
cyBoYXBwZW5zIHdpdGggYSBjb21wbGV0ZWx5IHJlYWQtb25seSBzaGFyZQo+ID4gPiA+ID4gPiB3
aGljaCBpcyB3aHkgSSBzdGFydGVkIHRvIHRoaW5rIGl0IGhhcyBzb21ldGhpbmcgdG8gZG8gd2l0
aCBhdGltZXMgYXMKPiA+ID4gPiA+ID4gdGhhdCBjb3VsZCBwZXJoYXBzIHN0aWxsIGNhdXNlIGEg
IndyaXRlIiBtb2RpZmljYXRpb24gZXZlbiB3aGVuCj4gPiA+ID4gPiA+IHJlYWQtb25seT8KPiA+
ID4gPiA+IAo+ID4gPiA+ID4gQWgtaGFoISAgU28sIGl0J3MgaW5vZGVfcXVlcnlfaXZlcnNpb24o
KSB0aGF0J3MgbW9kaWZ5aW5nIGEgbmZzIGlub2RlJ3MKPiA+ID4gPiA+IGlfdmVyc2lvbi4gIFRo
YXQncyBhIHNwZWNpYWwgdGhpbmcgdGhhdCBvbmx5IG5mc2Qgd291bGQgZG8uCj4gPiA+ID4gPiAK
PiA+ID4gPiA+IEkgdGhpbmsgdGhhdCdzIHRvdGFsbHkgZml4YWJsZSwgd2UnbGwganVzdCBoYXZl
IHRvIHRoaW5rIGEgbGl0dGxlIGFib3V0Cj4gPiA+ID4gPiBob3cuLi4uCj4gPiA+ID4gCj4gPiA+
ID4gSSB3b25kZXIgaWYgc29tZXRoaW5nIGxpa2UgdGhpcyBoZWxwcz8tLWIuCj4gPiA+ID4gCj4g
PiA+ID4gY29tbWl0IDBhZGQ4OGE5Y2NjNQo+ID4gPiA+IEF1dGhvcjogSi4gQnJ1Y2UgRmllbGRz
IDxiZmllbGRzQHJlZGhhdC5jb20+Cj4gPiA+ID4gRGF0ZTogICBGcmkgTm92IDEzIDE3OjAzOjA0
IDIwMjAgLTA1MDAKPiA+ID4gPiAKPiA+ID4gPiDCoMKgwqDCoG5mczogZG9uJ3QgbWFuZ2xlIGlf
dmVyc2lvbiBvbiBORlMKPiA+ID4gPiDCoMKgwqDCoAo+ID4gPiA+IAo+ID4gPiA+IMKgwqDCoMKg
VGhlIGlfdmVyc2lvbiBvbiBORlMgaGFzIHByZXR0eSBtdWNoIG9wYXF1ZSB0byB0aGUgY2xpZW50
LCBzbyB3ZSBkb24ndAo+ID4gPiA+IMKgwqDCoMKgd2FudCB0byBnaXZlIHRoZSBsb3cgYml0IGFu
eSBzcGVjaWFsIGludGVycHJldGF0aW9uLgo+ID4gPiA+IMKgwqDCoMKgCj4gPiA+ID4gCj4gPiA+
ID4gwqDCoMKgwqBEZWZpbmUgYSBuZXcgRlNfUFJJVkFURV9JX1ZFUlNJT04gZmxhZyBmb3IgZmls
ZXN5c3RlbXMgdGhhdCBtYW5hZ2UgdGhlCj4gPiA+ID4gwqDCoMKgwqBpX3ZlcnNpb24gb24gdGhl
aXIgb3duLgo+ID4gPiA+IMKgwqDCoMKgCj4gPiA+ID4gCj4gPiA+ID4gwqDCoMKgwqBTaWduZWQt
b2ZmLWJ5OiBKLiBCcnVjZSBGaWVsZHMgPGJmaWVsZHNAcmVkaGF0LmNvbT4KPiA+ID4gPiAKPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvZnMvbmZzL2ZzX2NvbnRleHQuYyBiL2ZzL25mcy9mc19jb250ZXh0
LmMKPiA+ID4gPiBpbmRleCAyOWVjOGIwOWE1MmQuLjliOGRkNWI3MTNhNyAxMDA2NDQKPiA+ID4g
PiAtLS0gYS9mcy9uZnMvZnNfY29udGV4dC5jCj4gPiA+ID4gKysrIGIvZnMvbmZzL2ZzX2NvbnRl
eHQuYwo+ID4gPiA+IEBAIC0xNDg4LDcgKzE0ODgsOCBAQCBzdHJ1Y3QgZmlsZV9zeXN0ZW1fdHlw
ZSBuZnNfZnNfdHlwZSA9IHsKPiA+ID4gPiDCoAkuaW5pdF9mc19jb250ZXh0CT0gbmZzX2luaXRf
ZnNfY29udGV4dCwKPiA+ID4gPiDCoAkucGFyYW1ldGVycwkJPSBuZnNfZnNfcGFyYW1ldGVycywK
PiA+ID4gPiDCoAkua2lsbF9zYgkJPSBuZnNfa2lsbF9zdXBlciwKPiA+ID4gPiAtCS5mc19mbGFn
cwkJPSBGU19SRU5BTUVfRE9FU19EX01PVkV8RlNfQklOQVJZX01PVU5UREFUQSwKPiA+ID4gPiAr
CS5mc19mbGFncwkJPSBGU19SRU5BTUVfRE9FU19EX01PVkV8RlNfQklOQVJZX01PVU5UREFUQXwK
PiA+ID4gPiArCQkJCSAgRlNfUFJJVkFURV9JX1ZFUlNJT04sCj4gPiA+ID4gwqB9Owo+ID4gPiA+
IMKgTU9EVUxFX0FMSUFTX0ZTKCJuZnMiKTsKPiA+ID4gPiDCoEVYUE9SVF9TWU1CT0xfR1BMKG5m
c19mc190eXBlKTsKPiA+ID4gPiBAQCAtMTUwMCw3ICsxNTAxLDggQEAgc3RydWN0IGZpbGVfc3lz
dGVtX3R5cGUgbmZzNF9mc190eXBlID0gewo+ID4gPiA+IMKgCS5pbml0X2ZzX2NvbnRleHQJPSBu
ZnNfaW5pdF9mc19jb250ZXh0LAo+ID4gPiA+IMKgCS5wYXJhbWV0ZXJzCQk9IG5mc19mc19wYXJh
bWV0ZXJzLAo+ID4gPiA+IMKgCS5raWxsX3NiCQk9IG5mc19raWxsX3N1cGVyLAo+ID4gPiA+IC0J
LmZzX2ZsYWdzCQk9IEZTX1JFTkFNRV9ET0VTX0RfTU9WRXxGU19CSU5BUllfTU9VTlREQVRBLAo+
ID4gPiA+ICsJLmZzX2ZsYWdzCQk9IEZTX1JFTkFNRV9ET0VTX0RfTU9WRXxGU19CSU5BUllfTU9V
TlREQVRBfAo+ID4gPiA+ICsJCQkJICBGU19QUklWQVRFX0lfVkVSU0lPTiwKPiA+ID4gPiDCoH07
Cj4gPiA+ID4gwqBNT0RVTEVfQUxJQVNfRlMoIm5mczQiKTsKPiA+ID4gPiDCoE1PRFVMRV9BTElB
UygibmZzNCIpOwo+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2ZzLmggYi9pbmNs
dWRlL2xpbnV4L2ZzLmgKPiA+ID4gPiBpbmRleCAyMWNjOTcxZmQ5NjAuLmM1YmI0MjY4MjI4YiAx
MDA2NDQKPiA+ID4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2ZzLmgKPiA+ID4gPiArKysgYi9pbmNs
dWRlL2xpbnV4L2ZzLmgKPiA+ID4gPiBAQCAtMjIxNyw2ICsyMjE3LDcgQEAgc3RydWN0IGZpbGVf
c3lzdGVtX3R5cGUgewo+ID4gPiA+IMKgI2RlZmluZSBGU19IQVNfU1VCVFlQRQkJNAo+ID4gPiA+
IMKgI2RlZmluZSBGU19VU0VSTlNfTU9VTlQJCTgJLyogQ2FuIGJlIG1vdW50ZWQgYnkgdXNlcm5z
IHJvb3QgKi8KPiA+ID4gPiDCoCNkZWZpbmUgRlNfRElTQUxMT1dfTk9USUZZX1BFUk0JMTYJLyog
RGlzYWJsZSBmYW5vdGlmeSBwZXJtaXNzaW9uIGV2ZW50cyAqLwo+ID4gPiA+ICsjZGVmaW5lIEZT
X1BSSVZBVEVfSV9WRVJTSU9OCTMyCS8qIGlfdmVyc2lvbiBtYW5hZ2VkIGJ5IGZpbGVzeXN0ZW0g
Ki8KPiA+ID4gPiDCoCNkZWZpbmUgRlNfVEhQX1NVUFBPUlQJCTgxOTIJLyogUmVtb3ZlIG9uY2Ug
YWxsIGZzIGNvbnZlcnRlZCAqLwo+ID4gPiA+IMKgI2RlZmluZSBGU19SRU5BTUVfRE9FU19EX01P
VkUJMzI3NjgJLyogRlMgd2lsbCBoYW5kbGUgZF9tb3ZlKCkgZHVyaW5nIHJlbmFtZSgpIGludGVy
bmFsbHkuICovCj4gPiA+ID4gwqAJaW50ICgqaW5pdF9mc19jb250ZXh0KShzdHJ1Y3QgZnNfY29u
dGV4dCAqKTsKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pdmVyc2lvbi5oIGIv
aW5jbHVkZS9saW51eC9pdmVyc2lvbi5oCj4gPiA+ID4gaW5kZXggMjkxN2VmOTkwZDQzLi41MmM3
OTBhODQ3ZGUgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9pdmVyc2lvbi5oCj4g
PiA+ID4gKysrIGIvaW5jbHVkZS9saW51eC9pdmVyc2lvbi5oCj4gPiA+ID4gQEAgLTMwNyw2ICsz
MDcsOCBAQCBpbm9kZV9xdWVyeV9pdmVyc2lvbihzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ID4gPiA+
IMKgCXU2NCBjdXIsIG9sZCwgbmV3Owo+ID4gPiA+IMKgCj4gPiA+ID4gCj4gPiA+ID4gwqAJY3Vy
ID0gaW5vZGVfcGVla19pdmVyc2lvbl9yYXcoaW5vZGUpOwo+ID4gPiA+ICsJaWYgKGlub2RlLT5p
X3NiLT5zX3R5cGUtPmZzX2ZsYWdzICYgRlNfUFJJVkFURV9JX1ZFUlNJT04pCj4gPiA+ID4gKwkJ
cmV0dXJuIGN1cjsKPiA+ID4gPiDCoAlmb3IgKDs7KSB7Cj4gPiA+ID4gwqAJCS8qIElmIGZsYWcg
aXMgYWxyZWFkeSBzZXQsIHRoZW4gbm8gbmVlZCB0byBzd2FwICovCj4gPiA+ID4gwqAJCWlmIChj
dXIgJiBJX1ZFUlNJT05fUVVFUklFRCkgewo+ID4gPiAKPiA+ID4gCj4gPiA+IEl0J3MgcHJvYmFi
bHkgbW9yZSBjb3JyZWN0IHRvIGp1c3QgY2hlY2sgdGhlIGFscmVhZHktZXhpc3RpbmcKPiA+ID4g
U0JfSV9WRVJTSU9OIGZsYWcgaGVyZQo+ID4gCj4gPiBTbyB0aGUgY2hlY2sgd291bGQgYmUKPiA+
IAo+ID4gCWlmICghSVNfSV9WRVJTSU9OKGlub2RlKSkKPiA+IAkJcmV0dXJuIGN1cjsKPiA+IAo+
ID4gPwo+ID4gCj4gCj4gWWVzLCB0aGF0IGxvb2tzIGFib3V0IHJpZ2h0LgoKVGhhdCBkb2Vzbid0
IHNvdW5kIHJpZ2h0IHRvIG1lLiAgTkZTLCBmb3IgZXhhbXBsZSwgaGFzIGEgcGVyZmVjdGx5IGdv
b2QKaV92ZXJzaW9uIHRoYXQgd29ya3MgYXMgYSBjaGFuZ2UgYXR0cmlidXRlLCBzbyBpdCBzaG91
bGQgc2V0ClNCX0lfVkVSU0lPTi4gIEJ1dCBpdCBkb2Vzbid0IHdhbnQgdGhlIHZmcyBwbGF5aW5n
IGdhbWVzIHdpdGggdGhlIGxvdwpiaXQuCgooSW4gZmFjdCwgSSdtIGNvbmZ1c2VkIG5vdzogdGhl
IGltcHJvdmVtZW50IERhaXJlIHdhcyBzZWVpbmcgc2hvdWxkIG9ubHkKYmUgcG9zc2libGUgaWYg
dGhlIHJlLWV4cG9ydCBzZXJ2ZXIgd2FzIHNlZWluZyBTQl9JX1ZFUlNJT04gc2V0IG9uIHRoZQpO
RlMgZmlsZXN5c3RlbSBpdCB3YXMgZXhwb3J0aW5nLCBidXQgYSBxdWljayBncmVwIGRvZXNuJ3Qg
YWN0dWFsbHkgc2hvdwptZSB3aGVyZSBORlMgaXMgc2V0dGluZyBTQl9JX1ZFUlNJT04uICBJJ20g
bWlzc2luZyBzb21ldGhpbmcKb2J2aW91cy4uLi4pCgotLWIuCgoKLS0KTGludXgtY2FjaGVmcyBt
YWlsaW5nIGxpc3QKTGludXgtY2FjaGVmc0ByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZz

