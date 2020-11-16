Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 48DB02B4A39
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Nov 2020 17:03:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-yFTWhXtMOx2aKDNZCFySGw-1; Mon, 16 Nov 2020 11:03:15 -0500
X-MC-Unique: yFTWhXtMOx2aKDNZCFySGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 283FA6414D;
	Mon, 16 Nov 2020 16:03:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC6526EF52;
	Mon, 16 Nov 2020 16:03:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 871CB183D021;
	Mon, 16 Nov 2020 16:03:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGG39hG025868 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 11:03:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2935142AC1; Mon, 16 Nov 2020 16:03:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23A907D280
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 16:03:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E587F1021F7C
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 16:03:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-19-4-GM-2hTNSuxMhBjveNSpQ-1; 
	Mon, 16 Nov 2020 11:03:03 -0500
X-MC-Unique: 4-GM-2hTNSuxMhBjveNSpQ-1
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 76F2B2223D;
	Mon, 16 Nov 2020 16:03:01 +0000 (UTC)
Message-ID: <83ebb6dc68216ce3f3dfd2a2736b7a301550efc5.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: bfields <bfields@fieldses.org>
Date: Mon, 16 Nov 2020 11:03:00 -0500
In-Reply-To: <20201116155619.GF898@fieldses.org>
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
	<20201116155619.GF898@fieldses.org>
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AGG39hG025868
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIwLTExLTE2IGF0IDEwOjU2IC0wNTAwLCBiZmllbGRzIHdyb3RlOgo+IE9uIE1v
biwgTm92IDE2LCAyMDIwIGF0IDEwOjI5OjI5QU0gLTA1MDAsIEplZmYgTGF5dG9uIHdyb3RlOgo+
ID4gT24gRnJpLCAyMDIwLTExLTEzIGF0IDE3OjI2IC0wNTAwLCBiZmllbGRzIHdyb3RlOgo+ID4g
PiBPbiBGcmksIE5vdiAxMywgMjAyMCBhdCAwOTo1MDo1MEFNIC0wNTAwLCBiZmllbGRzIHdyb3Rl
Ogo+ID4gPiA+IE9uIFRodSwgTm92IDEyLCAyMDIwIGF0IDExOjA1OjU3UE0gKzAwMDAsIERhaXJl
IEJ5cm5lIHdyb3RlOgo+ID4gPiA+ID4gU28sIEkgY2FuJ3QgbGF5IGNsYWltIHRvIGlkZW50aWZ5
aW5nIHRoZSBleGFjdCBvcHRpbWlzYXRpb24vaGFjayB0aGF0Cj4gPiA+ID4gPiBpbXByb3ZlcyB0
aGUgcmV0ZW50aW9uIG9mIHRoZSByZS1leHBvcnQgc2VydmVyJ3MgY2xpZW50IGNhY2hlIHdoZW4K
PiA+ID4gPiA+IHJlLWV4cG9ydGluZyBhbiBORlN2MyBzZXJ2ZXIgKHdoaWNoIGlzIHRoZW4gcmVh
ZCBieSBtYW55IGNsaWVudHMpLiBXZQo+ID4gPiA+ID4gd2VyZSB3b3JraW5nIHdpdGggYW4gZW5n
aW5lZXIgYXQgdGhlIHRpbWUgd2hvIHNob3dlZCBhbiBpbnRlcmVzdCBpbgo+ID4gPiA+ID4gb3Vy
IHVzZSBjYXNlIGFuZCBhZnRlciB3ZSBzdXBwbGllZCBhIHJlcHJvZHVjZXIgaGUgc3VnZ2VzdGVk
IG1vZGlmeWluZwo+ID4gPiA+ID4gdGhlIG5mcy9pbm9kZS5jCj4gPiA+ID4gPiAKPiA+ID4gPiA+
IC0JCWlmICghaW5vZGVfZXFfaXZlcnNpb25fcmF3KGlub2RlLCBmYXR0ci0+Y2hhbmdlX2F0dHIp
KSB7Cj4gPiA+ID4gPiArCQlpZiAoaW5vZGVfcGVla19pdmVyc2lvbl9yYXcoaW5vZGUpIDwgZmF0
dHItPmNoYW5nZV9hdHRyKQo+ID4gPiA+ID4gewo+ID4gPiA+ID4gCj4gPiA+ID4gPiBIaXMgcmVh
c29uaW5nIGF0IHRoZSB0aW1lIHdhczoKPiA+ID4gPiA+IAo+ID4gPiA+ID4gIkZpeGVzIGlub2Rl
IGludmFsaWRhdGlvbiBjYXVzZWQgYnkgcmVhZCBhY2Nlc3MuIFRoZSBsZWFzdCBpbXBvcnRhbnQK
PiA+ID4gPiA+IGJpdCBpcyBPUmVkIHdpdGggMSBhbmQgY2F1c2VzIHRoZSBpbm9kZSB2ZXJzaW9u
IHRvIGRpZmZlciBmcm9tIHRoZSBvbmUKPiA+ID4gPiA+IHNlZW4gb24gdGhlIE5GUyBzaGFyZS4g
VGhpcyBpbiB0dXJuIGNhdXNlcyB1bm5lY2Vzc2FyeSByZS1kb3dubG9hZAo+ID4gPiA+ID4gaW1w
YWN0aW5nIHRoZSBwZXJmb3JtYW5jZSBzaWduaWZpY2FudGx5LiBUaGlzIGZpeCBtYWtlcyBpdCBv
bmx5Cj4gPiA+ID4gPiByZS1mZXRjaCBmaWxlIGNvbnRlbnQgaWYgaW5vZGUgdmVyc2lvbiBzZWVu
IG9uIHRoZSBzZXJ2ZXIgaXMgbmV3ZXIKPiA+ID4gPiA+IHRoYW4gdGhlIG9uZSBvbiB0aGUgY2xp
ZW50LiIKPiA+ID4gPiA+IAo+ID4gPiA+ID4gQnV0IEkndmUgYWx3YXlzIGJlZW4gcHV6emxlZCBi
eSB3aHkgdGhpcyBvbmx5IHNlZW1zIHRvIGJlIHRoZSBjYXNlCj4gPiA+ID4gPiB3aGVuIHVzaW5n
IGtuZnNkIHRvIHJlLWV4cG9ydCB0aGUgKE5GU3YzKSBjbGllbnQgbW91bnQuIFVzaW5nIG11bHRp
cGxlCj4gPiA+ID4gPiBwcm9jZXNzZXMgb24gYSBzdGFuZGFyZCBjbGllbnQgbW91bnQgbmV2ZXIg
Y2F1c2VzIGFueSBzaW1pbGFyCj4gPiA+ID4gPiByZS12YWxpZGF0aW9ucy4gQW5kIHRoaXMgaGFw
cGVucyB3aXRoIGEgY29tcGxldGVseSByZWFkLW9ubHkgc2hhcmUKPiA+ID4gPiA+IHdoaWNoIGlz
IHdoeSBJIHN0YXJ0ZWQgdG8gdGhpbmsgaXQgaGFzIHNvbWV0aGluZyB0byBkbyB3aXRoIGF0aW1l
cyBhcwo+ID4gPiA+ID4gdGhhdCBjb3VsZCBwZXJoYXBzIHN0aWxsIGNhdXNlIGEgIndyaXRlIiBt
b2RpZmljYXRpb24gZXZlbiB3aGVuCj4gPiA+ID4gPiByZWFkLW9ubHk/Cj4gPiA+ID4gCj4gPiA+
ID4gQWgtaGFoISAgU28sIGl0J3MgaW5vZGVfcXVlcnlfaXZlcnNpb24oKSB0aGF0J3MgbW9kaWZ5
aW5nIGEgbmZzIGlub2RlJ3MKPiA+ID4gPiBpX3ZlcnNpb24uICBUaGF0J3MgYSBzcGVjaWFsIHRo
aW5nIHRoYXQgb25seSBuZnNkIHdvdWxkIGRvLgo+ID4gPiA+IAo+ID4gPiA+IEkgdGhpbmsgdGhh
dCdzIHRvdGFsbHkgZml4YWJsZSwgd2UnbGwganVzdCBoYXZlIHRvIHRoaW5rIGEgbGl0dGxlIGFi
b3V0Cj4gPiA+ID4gaG93Li4uLgo+ID4gPiAKPiA+ID4gSSB3b25kZXIgaWYgc29tZXRoaW5nIGxp
a2UgdGhpcyBoZWxwcz8tLWIuCj4gPiA+IAo+ID4gPiBjb21taXQgMGFkZDg4YTljY2M1Cj4gPiA+
IEF1dGhvcjogSi4gQnJ1Y2UgRmllbGRzIDxiZmllbGRzQHJlZGhhdC5jb20+Cj4gPiA+IERhdGU6
ICAgRnJpIE5vdiAxMyAxNzowMzowNCAyMDIwIC0wNTAwCj4gPiA+IAo+ID4gPiDCoMKgwqDCoG5m
czogZG9uJ3QgbWFuZ2xlIGlfdmVyc2lvbiBvbiBORlMKPiA+ID4gwqDCoMKgwqAKPiA+ID4gCj4g
PiA+IMKgwqDCoMKgVGhlIGlfdmVyc2lvbiBvbiBORlMgaGFzIHByZXR0eSBtdWNoIG9wYXF1ZSB0
byB0aGUgY2xpZW50LCBzbyB3ZSBkb24ndAo+ID4gPiDCoMKgwqDCoHdhbnQgdG8gZ2l2ZSB0aGUg
bG93IGJpdCBhbnkgc3BlY2lhbCBpbnRlcnByZXRhdGlvbi4KPiA+ID4gwqDCoMKgwqAKPiA+ID4g
Cj4gPiA+IMKgwqDCoMKgRGVmaW5lIGEgbmV3IEZTX1BSSVZBVEVfSV9WRVJTSU9OIGZsYWcgZm9y
IGZpbGVzeXN0ZW1zIHRoYXQgbWFuYWdlIHRoZQo+ID4gPiDCoMKgwqDCoGlfdmVyc2lvbiBvbiB0
aGVpciBvd24uCj4gPiA+IMKgwqDCoMKgCj4gPiA+IAo+ID4gPiDCoMKgwqDCoFNpZ25lZC1vZmYt
Ynk6IEouIEJydWNlIEZpZWxkcyA8YmZpZWxkc0ByZWRoYXQuY29tPgo+ID4gPiAKPiA+ID4gZGlm
ZiAtLWdpdCBhL2ZzL25mcy9mc19jb250ZXh0LmMgYi9mcy9uZnMvZnNfY29udGV4dC5jCj4gPiA+
IGluZGV4IDI5ZWM4YjA5YTUyZC4uOWI4ZGQ1YjcxM2E3IDEwMDY0NAo+ID4gPiAtLS0gYS9mcy9u
ZnMvZnNfY29udGV4dC5jCj4gPiA+ICsrKyBiL2ZzL25mcy9mc19jb250ZXh0LmMKPiA+ID4gQEAg
LTE0ODgsNyArMTQ4OCw4IEBAIHN0cnVjdCBmaWxlX3N5c3RlbV90eXBlIG5mc19mc190eXBlID0g
ewo+ID4gPiDCoAkuaW5pdF9mc19jb250ZXh0CT0gbmZzX2luaXRfZnNfY29udGV4dCwKPiA+ID4g
wqAJLnBhcmFtZXRlcnMJCT0gbmZzX2ZzX3BhcmFtZXRlcnMsCj4gPiA+IMKgCS5raWxsX3NiCQk9
IG5mc19raWxsX3N1cGVyLAo+ID4gPiAtCS5mc19mbGFncwkJPSBGU19SRU5BTUVfRE9FU19EX01P
VkV8RlNfQklOQVJZX01PVU5UREFUQSwKPiA+ID4gKwkuZnNfZmxhZ3MJCT0gRlNfUkVOQU1FX0RP
RVNfRF9NT1ZFfEZTX0JJTkFSWV9NT1VOVERBVEF8Cj4gPiA+ICsJCQkJICBGU19QUklWQVRFX0lf
VkVSU0lPTiwKPiA+ID4gwqB9Owo+ID4gPiDCoE1PRFVMRV9BTElBU19GUygibmZzIik7Cj4gPiA+
IMKgRVhQT1JUX1NZTUJPTF9HUEwobmZzX2ZzX3R5cGUpOwo+ID4gPiBAQCAtMTUwMCw3ICsxNTAx
LDggQEAgc3RydWN0IGZpbGVfc3lzdGVtX3R5cGUgbmZzNF9mc190eXBlID0gewo+ID4gPiDCoAku
aW5pdF9mc19jb250ZXh0CT0gbmZzX2luaXRfZnNfY29udGV4dCwKPiA+ID4gwqAJLnBhcmFtZXRl
cnMJCT0gbmZzX2ZzX3BhcmFtZXRlcnMsCj4gPiA+IMKgCS5raWxsX3NiCQk9IG5mc19raWxsX3N1
cGVyLAo+ID4gPiAtCS5mc19mbGFncwkJPSBGU19SRU5BTUVfRE9FU19EX01PVkV8RlNfQklOQVJZ
X01PVU5UREFUQSwKPiA+ID4gKwkuZnNfZmxhZ3MJCT0gRlNfUkVOQU1FX0RPRVNfRF9NT1ZFfEZT
X0JJTkFSWV9NT1VOVERBVEF8Cj4gPiA+ICsJCQkJICBGU19QUklWQVRFX0lfVkVSU0lPTiwKPiA+
ID4gwqB9Owo+ID4gPiDCoE1PRFVMRV9BTElBU19GUygibmZzNCIpOwo+ID4gPiDCoE1PRFVMRV9B
TElBUygibmZzNCIpOwo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mcy5oIGIvaW5j
bHVkZS9saW51eC9mcy5oCj4gPiA+IGluZGV4IDIxY2M5NzFmZDk2MC4uYzViYjQyNjgyMjhiIDEw
MDY0NAo+ID4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2ZzLmgKPiA+ID4gKysrIGIvaW5jbHVkZS9s
aW51eC9mcy5oCj4gPiA+IEBAIC0yMjE3LDYgKzIyMTcsNyBAQCBzdHJ1Y3QgZmlsZV9zeXN0ZW1f
dHlwZSB7Cj4gPiA+IMKgI2RlZmluZSBGU19IQVNfU1VCVFlQRQkJNAo+ID4gPiDCoCNkZWZpbmUg
RlNfVVNFUk5TX01PVU5UCQk4CS8qIENhbiBiZSBtb3VudGVkIGJ5IHVzZXJucyByb290ICovCj4g
PiA+IMKgI2RlZmluZSBGU19ESVNBTExPV19OT1RJRllfUEVSTQkxNgkvKiBEaXNhYmxlIGZhbm90
aWZ5IHBlcm1pc3Npb24gZXZlbnRzICovCj4gPiA+ICsjZGVmaW5lIEZTX1BSSVZBVEVfSV9WRVJT
SU9OCTMyCS8qIGlfdmVyc2lvbiBtYW5hZ2VkIGJ5IGZpbGVzeXN0ZW0gKi8KPiA+ID4gwqAjZGVm
aW5lIEZTX1RIUF9TVVBQT1JUCQk4MTkyCS8qIFJlbW92ZSBvbmNlIGFsbCBmcyBjb252ZXJ0ZWQg
Ki8KPiA+ID4gwqAjZGVmaW5lIEZTX1JFTkFNRV9ET0VTX0RfTU9WRQkzMjc2OAkvKiBGUyB3aWxs
IGhhbmRsZSBkX21vdmUoKSBkdXJpbmcgcmVuYW1lKCkgaW50ZXJuYWxseS4gKi8KPiA+ID4gwqAJ
aW50ICgqaW5pdF9mc19jb250ZXh0KShzdHJ1Y3QgZnNfY29udGV4dCAqKTsKPiA+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvaXZlcnNpb24uaCBiL2luY2x1ZGUvbGludXgvaXZlcnNpb24u
aAo+ID4gPiBpbmRleCAyOTE3ZWY5OTBkNDMuLjUyYzc5MGE4NDdkZSAxMDA2NDQKPiA+ID4gLS0t
IGEvaW5jbHVkZS9saW51eC9pdmVyc2lvbi5oCj4gPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvaXZl
cnNpb24uaAo+ID4gPiBAQCAtMzA3LDYgKzMwNyw4IEBAIGlub2RlX3F1ZXJ5X2l2ZXJzaW9uKHN0
cnVjdCBpbm9kZSAqaW5vZGUpCj4gPiA+IMKgCXU2NCBjdXIsIG9sZCwgbmV3Owo+ID4gPiDCoAo+
ID4gPiAKPiA+ID4gwqAJY3VyID0gaW5vZGVfcGVla19pdmVyc2lvbl9yYXcoaW5vZGUpOwo+ID4g
PiArCWlmIChpbm9kZS0+aV9zYi0+c190eXBlLT5mc19mbGFncyAmIEZTX1BSSVZBVEVfSV9WRVJT
SU9OKQo+ID4gPiArCQlyZXR1cm4gY3VyOwo+ID4gPiDCoAlmb3IgKDs7KSB7Cj4gPiA+IMKgCQkv
KiBJZiBmbGFnIGlzIGFscmVhZHkgc2V0LCB0aGVuIG5vIG5lZWQgdG8gc3dhcCAqLwo+ID4gPiDC
oAkJaWYgKGN1ciAmIElfVkVSU0lPTl9RVUVSSUVEKSB7Cj4gPiAKPiA+IAo+ID4gSXQncyBwcm9i
YWJseSBtb3JlIGNvcnJlY3QgdG8ganVzdCBjaGVjayB0aGUgYWxyZWFkeS1leGlzdGluZwo+ID4g
U0JfSV9WRVJTSU9OIGZsYWcgaGVyZQo+IAo+IFNvIHRoZSBjaGVjayB3b3VsZCBiZQo+IAo+IAlp
ZiAoIUlTX0lfVkVSU0lPTihpbm9kZSkpCj4gCQlyZXR1cm4gY3VyOwo+IAo+ID8KPiAKClllcywg
dGhhdCBsb29rcyBhYm91dCByaWdodC4KCj4gPiAodGhvdWdoIGluIGhpbmRzaWdodCBhIGZzdHlw
ZSBmbGFnIG1pZ2h0IGhhdmUgbWFkZSBtb3JlIHNlbnNlKS4KPiAKPiBJX1ZFUlNJT04gc3VwcG9y
dCBjYW4gdmFyeSBieSBzdXBlcmJsb2NrIChmb3IgZXhhbXBsZSwgeGZzIHN1cHBvcnRzIGl0Cj4g
b3Igbm90IGRlcGVuZGluZyBvbiBvbi1kaXNrIGZvcm1hdCB2ZXJzaW9uKS4KPiAKCkdvb2QgcG9p
bnQhCgotLSAKSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KCgotLQpMaW51eC1jYWNo
ZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnM=

