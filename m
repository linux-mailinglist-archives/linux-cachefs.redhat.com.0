Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 790C82B4A15
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Nov 2020 16:56:32 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-6i0L7jtjMrKkVb09XDBNsQ-1; Mon, 16 Nov 2020 10:56:30 -0500
X-MC-Unique: 6i0L7jtjMrKkVb09XDBNsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D38E9800461;
	Mon, 16 Nov 2020 15:56:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0FF2196FD;
	Mon, 16 Nov 2020 15:56:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A910358118;
	Mon, 16 Nov 2020 15:56:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGFuOHR025174 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 10:56:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DF51F1111A50; Mon, 16 Nov 2020 15:56:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D760C100403D
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 15:56:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88ABA800050
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 15:56:22 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-394-loJ8mJUiOX2I5HuxwEPmDA-1;
	Mon, 16 Nov 2020 10:56:20 -0500
X-MC-Unique: loJ8mJUiOX2I5HuxwEPmDA-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 5D3851C15; Mon, 16 Nov 2020 10:56:19 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 5D3851C15
Date: Mon, 16 Nov 2020 10:56:19 -0500
From: bfields <bfields@fieldses.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20201116155619.GF898@fieldses.org>
References: <635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<20201112135733.GA9243@fieldses.org>
	<444227972.86442677.1605206025305.JavaMail.zimbra@dneg.com>
	<20201112205524.GI9243@fieldses.org>
	<883314904.86570901.1605222357023.JavaMail.zimbra@dneg.com>
	<20201113145050.GB1299@fieldses.org>
	<20201113222600.GC1299@fieldses.org>
	<b0d61b4053442ba46fd2c707ee7e0608704c2598.camel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <b0d61b4053442ba46fd2c707ee7e0608704c2598.camel@kernel.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AGFuOHR025174
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

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTA6Mjk6MjlBTSAtMDUwMCwgSmVmZiBMYXl0b24gd3Jv
dGU6Cj4gT24gRnJpLCAyMDIwLTExLTEzIGF0IDE3OjI2IC0wNTAwLCBiZmllbGRzIHdyb3RlOgo+
ID4gT24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgMDk6NTA6NTBBTSAtMDUwMCwgYmZpZWxkcyB3cm90
ZToKPiA+ID4gT24gVGh1LCBOb3YgMTIsIDIwMjAgYXQgMTE6MDU6NTdQTSArMDAwMCwgRGFpcmUg
QnlybmUgd3JvdGU6Cj4gPiA+ID4gU28sIEkgY2FuJ3QgbGF5IGNsYWltIHRvIGlkZW50aWZ5aW5n
IHRoZSBleGFjdCBvcHRpbWlzYXRpb24vaGFjayB0aGF0Cj4gPiA+ID4gaW1wcm92ZXMgdGhlIHJl
dGVudGlvbiBvZiB0aGUgcmUtZXhwb3J0IHNlcnZlcidzIGNsaWVudCBjYWNoZSB3aGVuCj4gPiA+
ID4gcmUtZXhwb3J0aW5nIGFuIE5GU3YzIHNlcnZlciAod2hpY2ggaXMgdGhlbiByZWFkIGJ5IG1h
bnkgY2xpZW50cykuIFdlCj4gPiA+ID4gd2VyZSB3b3JraW5nIHdpdGggYW4gZW5naW5lZXIgYXQg
dGhlIHRpbWUgd2hvIHNob3dlZCBhbiBpbnRlcmVzdCBpbgo+ID4gPiA+IG91ciB1c2UgY2FzZSBh
bmQgYWZ0ZXIgd2Ugc3VwcGxpZWQgYSByZXByb2R1Y2VyIGhlIHN1Z2dlc3RlZCBtb2RpZnlpbmcK
PiA+ID4gPiB0aGUgbmZzL2lub2RlLmMKPiA+ID4gPiAKPiA+ID4gPiAtCQlpZiAoIWlub2RlX2Vx
X2l2ZXJzaW9uX3Jhdyhpbm9kZSwgZmF0dHItPmNoYW5nZV9hdHRyKSkgewo+ID4gPiA+ICsJCWlm
IChpbm9kZV9wZWVrX2l2ZXJzaW9uX3Jhdyhpbm9kZSkgPCBmYXR0ci0+Y2hhbmdlX2F0dHIpCj4g
PiA+ID4gewo+ID4gPiA+IAo+ID4gPiA+IEhpcyByZWFzb25pbmcgYXQgdGhlIHRpbWUgd2FzOgo+
ID4gPiA+IAo+ID4gPiA+ICJGaXhlcyBpbm9kZSBpbnZhbGlkYXRpb24gY2F1c2VkIGJ5IHJlYWQg
YWNjZXNzLiBUaGUgbGVhc3QgaW1wb3J0YW50Cj4gPiA+ID4gYml0IGlzIE9SZWQgd2l0aCAxIGFu
ZCBjYXVzZXMgdGhlIGlub2RlIHZlcnNpb24gdG8gZGlmZmVyIGZyb20gdGhlIG9uZQo+ID4gPiA+
IHNlZW4gb24gdGhlIE5GUyBzaGFyZS4gVGhpcyBpbiB0dXJuIGNhdXNlcyB1bm5lY2Vzc2FyeSBy
ZS1kb3dubG9hZAo+ID4gPiA+IGltcGFjdGluZyB0aGUgcGVyZm9ybWFuY2Ugc2lnbmlmaWNhbnRs
eS4gVGhpcyBmaXggbWFrZXMgaXQgb25seQo+ID4gPiA+IHJlLWZldGNoIGZpbGUgY29udGVudCBp
ZiBpbm9kZSB2ZXJzaW9uIHNlZW4gb24gdGhlIHNlcnZlciBpcyBuZXdlcgo+ID4gPiA+IHRoYW4g
dGhlIG9uZSBvbiB0aGUgY2xpZW50LiIKPiA+ID4gPiAKPiA+ID4gPiBCdXQgSSd2ZSBhbHdheXMg
YmVlbiBwdXp6bGVkIGJ5IHdoeSB0aGlzIG9ubHkgc2VlbXMgdG8gYmUgdGhlIGNhc2UKPiA+ID4g
PiB3aGVuIHVzaW5nIGtuZnNkIHRvIHJlLWV4cG9ydCB0aGUgKE5GU3YzKSBjbGllbnQgbW91bnQu
IFVzaW5nIG11bHRpcGxlCj4gPiA+ID4gcHJvY2Vzc2VzIG9uIGEgc3RhbmRhcmQgY2xpZW50IG1v
dW50IG5ldmVyIGNhdXNlcyBhbnkgc2ltaWxhcgo+ID4gPiA+IHJlLXZhbGlkYXRpb25zLiBBbmQg
dGhpcyBoYXBwZW5zIHdpdGggYSBjb21wbGV0ZWx5IHJlYWQtb25seSBzaGFyZQo+ID4gPiA+IHdo
aWNoIGlzIHdoeSBJIHN0YXJ0ZWQgdG8gdGhpbmsgaXQgaGFzIHNvbWV0aGluZyB0byBkbyB3aXRo
IGF0aW1lcyBhcwo+ID4gPiA+IHRoYXQgY291bGQgcGVyaGFwcyBzdGlsbCBjYXVzZSBhICJ3cml0
ZSIgbW9kaWZpY2F0aW9uIGV2ZW4gd2hlbgo+ID4gPiA+IHJlYWQtb25seT8KPiA+ID4gCj4gPiA+
IEFoLWhhaCEgIFNvLCBpdCdzIGlub2RlX3F1ZXJ5X2l2ZXJzaW9uKCkgdGhhdCdzIG1vZGlmeWlu
ZyBhIG5mcyBpbm9kZSdzCj4gPiA+IGlfdmVyc2lvbi4gIFRoYXQncyBhIHNwZWNpYWwgdGhpbmcg
dGhhdCBvbmx5IG5mc2Qgd291bGQgZG8uCj4gPiA+IAo+ID4gPiBJIHRoaW5rIHRoYXQncyB0b3Rh
bGx5IGZpeGFibGUsIHdlJ2xsIGp1c3QgaGF2ZSB0byB0aGluayBhIGxpdHRsZSBhYm91dAo+ID4g
PiBob3cuLi4uCj4gPiAKPiA+IEkgd29uZGVyIGlmIHNvbWV0aGluZyBsaWtlIHRoaXMgaGVscHM/
LS1iLgo+ID4gCj4gPiBjb21taXQgMGFkZDg4YTljY2M1Cj4gPiBBdXRob3I6IEouIEJydWNlIEZp
ZWxkcyA8YmZpZWxkc0ByZWRoYXQuY29tPgo+ID4gRGF0ZTogICBGcmkgTm92IDEzIDE3OjAzOjA0
IDIwMjAgLTA1MDAKPiA+IAo+ID4gwqDCoMKgwqBuZnM6IGRvbid0IG1hbmdsZSBpX3ZlcnNpb24g
b24gTkZTCj4gPiDCoMKgwqDCoAo+ID4gCj4gPiDCoMKgwqDCoFRoZSBpX3ZlcnNpb24gb24gTkZT
IGhhcyBwcmV0dHkgbXVjaCBvcGFxdWUgdG8gdGhlIGNsaWVudCwgc28gd2UgZG9uJ3QKPiA+IMKg
wqDCoMKgd2FudCB0byBnaXZlIHRoZSBsb3cgYml0IGFueSBzcGVjaWFsIGludGVycHJldGF0aW9u
Lgo+ID4gwqDCoMKgwqAKPiA+IAo+ID4gwqDCoMKgwqBEZWZpbmUgYSBuZXcgRlNfUFJJVkFURV9J
X1ZFUlNJT04gZmxhZyBmb3IgZmlsZXN5c3RlbXMgdGhhdCBtYW5hZ2UgdGhlCj4gPiDCoMKgwqDC
oGlfdmVyc2lvbiBvbiB0aGVpciBvd24uCj4gPiDCoMKgwqDCoAo+ID4gCj4gPiDCoMKgwqDCoFNp
Z25lZC1vZmYtYnk6IEouIEJydWNlIEZpZWxkcyA8YmZpZWxkc0ByZWRoYXQuY29tPgo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvZnMvbmZzL2ZzX2NvbnRleHQuYyBiL2ZzL25mcy9mc19jb250ZXh0LmMK
PiA+IGluZGV4IDI5ZWM4YjA5YTUyZC4uOWI4ZGQ1YjcxM2E3IDEwMDY0NAo+ID4gLS0tIGEvZnMv
bmZzL2ZzX2NvbnRleHQuYwo+ID4gKysrIGIvZnMvbmZzL2ZzX2NvbnRleHQuYwo+ID4gQEAgLTE0
ODgsNyArMTQ4OCw4IEBAIHN0cnVjdCBmaWxlX3N5c3RlbV90eXBlIG5mc19mc190eXBlID0gewo+
ID4gwqAJLmluaXRfZnNfY29udGV4dAk9IG5mc19pbml0X2ZzX2NvbnRleHQsCj4gPiDCoAkucGFy
YW1ldGVycwkJPSBuZnNfZnNfcGFyYW1ldGVycywKPiA+IMKgCS5raWxsX3NiCQk9IG5mc19raWxs
X3N1cGVyLAo+ID4gLQkuZnNfZmxhZ3MJCT0gRlNfUkVOQU1FX0RPRVNfRF9NT1ZFfEZTX0JJTkFS
WV9NT1VOVERBVEEsCj4gPiArCS5mc19mbGFncwkJPSBGU19SRU5BTUVfRE9FU19EX01PVkV8RlNf
QklOQVJZX01PVU5UREFUQXwKPiA+ICsJCQkJICBGU19QUklWQVRFX0lfVkVSU0lPTiwKPiA+IMKg
fTsKPiA+IMKgTU9EVUxFX0FMSUFTX0ZTKCJuZnMiKTsKPiA+IMKgRVhQT1JUX1NZTUJPTF9HUEwo
bmZzX2ZzX3R5cGUpOwo+ID4gQEAgLTE1MDAsNyArMTUwMSw4IEBAIHN0cnVjdCBmaWxlX3N5c3Rl
bV90eXBlIG5mczRfZnNfdHlwZSA9IHsKPiA+IMKgCS5pbml0X2ZzX2NvbnRleHQJPSBuZnNfaW5p
dF9mc19jb250ZXh0LAo+ID4gwqAJLnBhcmFtZXRlcnMJCT0gbmZzX2ZzX3BhcmFtZXRlcnMsCj4g
PiDCoAkua2lsbF9zYgkJPSBuZnNfa2lsbF9zdXBlciwKPiA+IC0JLmZzX2ZsYWdzCQk9IEZTX1JF
TkFNRV9ET0VTX0RfTU9WRXxGU19CSU5BUllfTU9VTlREQVRBLAo+ID4gKwkuZnNfZmxhZ3MJCT0g
RlNfUkVOQU1FX0RPRVNfRF9NT1ZFfEZTX0JJTkFSWV9NT1VOVERBVEF8Cj4gPiArCQkJCSAgRlNf
UFJJVkFURV9JX1ZFUlNJT04sCj4gPiDCoH07Cj4gPiDCoE1PRFVMRV9BTElBU19GUygibmZzNCIp
Owo+ID4gwqBNT0RVTEVfQUxJQVMoIm5mczQiKTsKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L2ZzLmggYi9pbmNsdWRlL2xpbnV4L2ZzLmgKPiA+IGluZGV4IDIxY2M5NzFmZDk2MC4uYzVi
YjQyNjgyMjhiIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9mcy5oCj4gPiArKysgYi9p
bmNsdWRlL2xpbnV4L2ZzLmgKPiA+IEBAIC0yMjE3LDYgKzIyMTcsNyBAQCBzdHJ1Y3QgZmlsZV9z
eXN0ZW1fdHlwZSB7Cj4gPiDCoCNkZWZpbmUgRlNfSEFTX1NVQlRZUEUJCTQKPiA+IMKgI2RlZmlu
ZSBGU19VU0VSTlNfTU9VTlQJCTgJLyogQ2FuIGJlIG1vdW50ZWQgYnkgdXNlcm5zIHJvb3QgKi8K
PiA+IMKgI2RlZmluZSBGU19ESVNBTExPV19OT1RJRllfUEVSTQkxNgkvKiBEaXNhYmxlIGZhbm90
aWZ5IHBlcm1pc3Npb24gZXZlbnRzICovCj4gPiArI2RlZmluZSBGU19QUklWQVRFX0lfVkVSU0lP
TgkzMgkvKiBpX3ZlcnNpb24gbWFuYWdlZCBieSBmaWxlc3lzdGVtICovCj4gPiDCoCNkZWZpbmUg
RlNfVEhQX1NVUFBPUlQJCTgxOTIJLyogUmVtb3ZlIG9uY2UgYWxsIGZzIGNvbnZlcnRlZCAqLwo+
ID4gwqAjZGVmaW5lIEZTX1JFTkFNRV9ET0VTX0RfTU9WRQkzMjc2OAkvKiBGUyB3aWxsIGhhbmRs
ZSBkX21vdmUoKSBkdXJpbmcgcmVuYW1lKCkgaW50ZXJuYWxseS4gKi8KPiA+IMKgCWludCAoKmlu
aXRfZnNfY29udGV4dCkoc3RydWN0IGZzX2NvbnRleHQgKik7Cj4gPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9pdmVyc2lvbi5oIGIvaW5jbHVkZS9saW51eC9pdmVyc2lvbi5oCj4gPiBpbmRl
eCAyOTE3ZWY5OTBkNDMuLjUyYzc5MGE4NDdkZSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvaXZlcnNpb24uaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9pdmVyc2lvbi5oCj4gPiBAQCAt
MzA3LDYgKzMwNyw4IEBAIGlub2RlX3F1ZXJ5X2l2ZXJzaW9uKHN0cnVjdCBpbm9kZSAqaW5vZGUp
Cj4gPiDCoAl1NjQgY3VyLCBvbGQsIG5ldzsKPiA+IMKgCj4gPiAKPiA+IMKgCWN1ciA9IGlub2Rl
X3BlZWtfaXZlcnNpb25fcmF3KGlub2RlKTsKPiA+ICsJaWYgKGlub2RlLT5pX3NiLT5zX3R5cGUt
PmZzX2ZsYWdzICYgRlNfUFJJVkFURV9JX1ZFUlNJT04pCj4gPiArCQlyZXR1cm4gY3VyOwo+ID4g
wqAJZm9yICg7Oykgewo+ID4gwqAJCS8qIElmIGZsYWcgaXMgYWxyZWFkeSBzZXQsIHRoZW4gbm8g
bmVlZCB0byBzd2FwICovCj4gPiDCoAkJaWYgKGN1ciAmIElfVkVSU0lPTl9RVUVSSUVEKSB7Cj4g
Cj4gCj4gSXQncyBwcm9iYWJseSBtb3JlIGNvcnJlY3QgdG8ganVzdCBjaGVjayB0aGUgYWxyZWFk
eS1leGlzdGluZwo+IFNCX0lfVkVSU0lPTiBmbGFnIGhlcmUKClNvIHRoZSBjaGVjayB3b3VsZCBi
ZQoKCWlmICghSVNfSV9WRVJTSU9OKGlub2RlKSkKCQlyZXR1cm4gY3VyOwoKPwoKPiAodGhvdWdo
IGluIGhpbmRzaWdodCBhIGZzdHlwZSBmbGFnIG1pZ2h0IGhhdmUgbWFkZSBtb3JlIHNlbnNlKS4K
CklfVkVSU0lPTiBzdXBwb3J0IGNhbiB2YXJ5IGJ5IHN1cGVyYmxvY2sgKGZvciBleGFtcGxlLCB4
ZnMgc3VwcG9ydHMgaXQKb3Igbm90IGRlcGVuZGluZyBvbiBvbi1kaXNrIGZvcm1hdCB2ZXJzaW9u
KS4KCi0tYi4KCgotLQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJl
ZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNh
Y2hlZnM=

