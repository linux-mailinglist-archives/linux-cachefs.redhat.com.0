Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A7D572B4981
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Nov 2020 16:36:40 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-xm9of7vAO2epamOOV6N9Dg-1; Mon, 16 Nov 2020 10:36:37 -0500
X-MC-Unique: xm9of7vAO2epamOOV6N9Dg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6386083DCAE;
	Mon, 16 Nov 2020 15:36:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 525865D9D2;
	Mon, 16 Nov 2020 15:36:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E72275812C;
	Mon, 16 Nov 2020 15:36:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGFaURT022111 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 10:36:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CA7012157F4F; Mon, 16 Nov 2020 15:36:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5F812157F4A
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 15:36:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB91690E434
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 15:36:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-227-PKGvcshUMzOuI6efdSnwFQ-1;
	Mon, 16 Nov 2020 10:36:21 -0500
X-MC-Unique: PKGvcshUMzOuI6efdSnwFQ-1
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BA7762078E;
	Mon, 16 Nov 2020 15:29:30 +0000 (UTC)
Message-ID: <b0d61b4053442ba46fd2c707ee7e0608704c2598.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: bfields <bfields@fieldses.org>, Daire Byrne <daire@dneg.com>
Date: Mon, 16 Nov 2020 10:29:29 -0500
In-Reply-To: <20201113222600.GC1299@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<20201112135733.GA9243@fieldses.org>
	<444227972.86442677.1605206025305.JavaMail.zimbra@dneg.com>
	<20201112205524.GI9243@fieldses.org>
	<883314904.86570901.1605222357023.JavaMail.zimbra@dneg.com>
	<20201113145050.GB1299@fieldses.org>
	<20201113222600.GC1299@fieldses.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AGFaURT022111
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIwLTExLTEzIGF0IDE3OjI2IC0wNTAwLCBiZmllbGRzIHdyb3RlOgo+IE9uIEZy
aSwgTm92IDEzLCAyMDIwIGF0IDA5OjUwOjUwQU0gLTA1MDAsIGJmaWVsZHMgd3JvdGU6Cj4gPiBP
biBUaHUsIE5vdiAxMiwgMjAyMCBhdCAxMTowNTo1N1BNICswMDAwLCBEYWlyZSBCeXJuZSB3cm90
ZToKPiA+ID4gU28sIEkgY2FuJ3QgbGF5IGNsYWltIHRvIGlkZW50aWZ5aW5nIHRoZSBleGFjdCBv
cHRpbWlzYXRpb24vaGFjayB0aGF0Cj4gPiA+IGltcHJvdmVzIHRoZSByZXRlbnRpb24gb2YgdGhl
IHJlLWV4cG9ydCBzZXJ2ZXIncyBjbGllbnQgY2FjaGUgd2hlbgo+ID4gPiByZS1leHBvcnRpbmcg
YW4gTkZTdjMgc2VydmVyICh3aGljaCBpcyB0aGVuIHJlYWQgYnkgbWFueSBjbGllbnRzKS4gV2UK
PiA+ID4gd2VyZSB3b3JraW5nIHdpdGggYW4gZW5naW5lZXIgYXQgdGhlIHRpbWUgd2hvIHNob3dl
ZCBhbiBpbnRlcmVzdCBpbgo+ID4gPiBvdXIgdXNlIGNhc2UgYW5kIGFmdGVyIHdlIHN1cHBsaWVk
IGEgcmVwcm9kdWNlciBoZSBzdWdnZXN0ZWQgbW9kaWZ5aW5nCj4gPiA+IHRoZSBuZnMvaW5vZGUu
Ywo+ID4gPiAKPiA+ID4gLQkJaWYgKCFpbm9kZV9lcV9pdmVyc2lvbl9yYXcoaW5vZGUsIGZhdHRy
LT5jaGFuZ2VfYXR0cikpIHsKPiA+ID4gKwkJaWYgKGlub2RlX3BlZWtfaXZlcnNpb25fcmF3KGlu
b2RlKSA8IGZhdHRyLT5jaGFuZ2VfYXR0cikKPiA+ID4gewo+ID4gPiAKPiA+ID4gSGlzIHJlYXNv
bmluZyBhdCB0aGUgdGltZSB3YXM6Cj4gPiA+IAo+ID4gPiAiRml4ZXMgaW5vZGUgaW52YWxpZGF0
aW9uIGNhdXNlZCBieSByZWFkIGFjY2Vzcy4gVGhlIGxlYXN0IGltcG9ydGFudAo+ID4gPiBiaXQg
aXMgT1JlZCB3aXRoIDEgYW5kIGNhdXNlcyB0aGUgaW5vZGUgdmVyc2lvbiB0byBkaWZmZXIgZnJv
bSB0aGUgb25lCj4gPiA+IHNlZW4gb24gdGhlIE5GUyBzaGFyZS4gVGhpcyBpbiB0dXJuIGNhdXNl
cyB1bm5lY2Vzc2FyeSByZS1kb3dubG9hZAo+ID4gPiBpbXBhY3RpbmcgdGhlIHBlcmZvcm1hbmNl
IHNpZ25pZmljYW50bHkuIFRoaXMgZml4IG1ha2VzIGl0IG9ubHkKPiA+ID4gcmUtZmV0Y2ggZmls
ZSBjb250ZW50IGlmIGlub2RlIHZlcnNpb24gc2VlbiBvbiB0aGUgc2VydmVyIGlzIG5ld2VyCj4g
PiA+IHRoYW4gdGhlIG9uZSBvbiB0aGUgY2xpZW50LiIKPiA+ID4gCj4gPiA+IEJ1dCBJJ3ZlIGFs
d2F5cyBiZWVuIHB1enpsZWQgYnkgd2h5IHRoaXMgb25seSBzZWVtcyB0byBiZSB0aGUgY2FzZQo+
ID4gPiB3aGVuIHVzaW5nIGtuZnNkIHRvIHJlLWV4cG9ydCB0aGUgKE5GU3YzKSBjbGllbnQgbW91
bnQuIFVzaW5nIG11bHRpcGxlCj4gPiA+IHByb2Nlc3NlcyBvbiBhIHN0YW5kYXJkIGNsaWVudCBt
b3VudCBuZXZlciBjYXVzZXMgYW55IHNpbWlsYXIKPiA+ID4gcmUtdmFsaWRhdGlvbnMuIEFuZCB0
aGlzIGhhcHBlbnMgd2l0aCBhIGNvbXBsZXRlbHkgcmVhZC1vbmx5IHNoYXJlCj4gPiA+IHdoaWNo
IGlzIHdoeSBJIHN0YXJ0ZWQgdG8gdGhpbmsgaXQgaGFzIHNvbWV0aGluZyB0byBkbyB3aXRoIGF0
aW1lcyBhcwo+ID4gPiB0aGF0IGNvdWxkIHBlcmhhcHMgc3RpbGwgY2F1c2UgYSAid3JpdGUiIG1v
ZGlmaWNhdGlvbiBldmVuIHdoZW4KPiA+ID4gcmVhZC1vbmx5Pwo+ID4gCj4gPiBBaC1oYWghICBT
bywgaXQncyBpbm9kZV9xdWVyeV9pdmVyc2lvbigpIHRoYXQncyBtb2RpZnlpbmcgYSBuZnMgaW5v
ZGUncwo+ID4gaV92ZXJzaW9uLiAgVGhhdCdzIGEgc3BlY2lhbCB0aGluZyB0aGF0IG9ubHkgbmZz
ZCB3b3VsZCBkby4KPiA+IAo+ID4gSSB0aGluayB0aGF0J3MgdG90YWxseSBmaXhhYmxlLCB3ZSds
bCBqdXN0IGhhdmUgdG8gdGhpbmsgYSBsaXR0bGUgYWJvdXQKPiA+IGhvdy4uLi4KPiAKPiBJIHdv
bmRlciBpZiBzb21ldGhpbmcgbGlrZSB0aGlzIGhlbHBzPy0tYi4KPiAKPiBjb21taXQgMGFkZDg4
YTljY2M1Cj4gQXV0aG9yOiBKLiBCcnVjZSBGaWVsZHMgPGJmaWVsZHNAcmVkaGF0LmNvbT4KPiBE
YXRlOiAgIEZyaSBOb3YgMTMgMTc6MDM6MDQgMjAyMCAtMDUwMAo+IAo+IMKgwqDCoMKgbmZzOiBk
b24ndCBtYW5nbGUgaV92ZXJzaW9uIG9uIE5GUwo+IMKgwqDCoMKgCj4gCj4gwqDCoMKgwqBUaGUg
aV92ZXJzaW9uIG9uIE5GUyBoYXMgcHJldHR5IG11Y2ggb3BhcXVlIHRvIHRoZSBjbGllbnQsIHNv
IHdlIGRvbid0Cj4gwqDCoMKgwqB3YW50IHRvIGdpdmUgdGhlIGxvdyBiaXQgYW55IHNwZWNpYWwg
aW50ZXJwcmV0YXRpb24uCj4gwqDCoMKgwqAKPiAKPiDCoMKgwqDCoERlZmluZSBhIG5ldyBGU19Q
UklWQVRFX0lfVkVSU0lPTiBmbGFnIGZvciBmaWxlc3lzdGVtcyB0aGF0IG1hbmFnZSB0aGUKPiDC
oMKgwqDCoGlfdmVyc2lvbiBvbiB0aGVpciBvd24uCj4gwqDCoMKgwqAKPiAKPiDCoMKgwqDCoFNp
Z25lZC1vZmYtYnk6IEouIEJydWNlIEZpZWxkcyA8YmZpZWxkc0ByZWRoYXQuY29tPgo+IAo+IGRp
ZmYgLS1naXQgYS9mcy9uZnMvZnNfY29udGV4dC5jIGIvZnMvbmZzL2ZzX2NvbnRleHQuYwo+IGlu
ZGV4IDI5ZWM4YjA5YTUyZC4uOWI4ZGQ1YjcxM2E3IDEwMDY0NAo+IC0tLSBhL2ZzL25mcy9mc19j
b250ZXh0LmMKPiArKysgYi9mcy9uZnMvZnNfY29udGV4dC5jCj4gQEAgLTE0ODgsNyArMTQ4OCw4
IEBAIHN0cnVjdCBmaWxlX3N5c3RlbV90eXBlIG5mc19mc190eXBlID0gewo+IMKgCS5pbml0X2Zz
X2NvbnRleHQJPSBuZnNfaW5pdF9mc19jb250ZXh0LAo+IMKgCS5wYXJhbWV0ZXJzCQk9IG5mc19m
c19wYXJhbWV0ZXJzLAo+IMKgCS5raWxsX3NiCQk9IG5mc19raWxsX3N1cGVyLAo+IC0JLmZzX2Zs
YWdzCQk9IEZTX1JFTkFNRV9ET0VTX0RfTU9WRXxGU19CSU5BUllfTU9VTlREQVRBLAo+ICsJLmZz
X2ZsYWdzCQk9IEZTX1JFTkFNRV9ET0VTX0RfTU9WRXxGU19CSU5BUllfTU9VTlREQVRBfAo+ICsJ
CQkJICBGU19QUklWQVRFX0lfVkVSU0lPTiwKPiDCoH07Cj4gwqBNT0RVTEVfQUxJQVNfRlMoIm5m
cyIpOwo+IMKgRVhQT1JUX1NZTUJPTF9HUEwobmZzX2ZzX3R5cGUpOwo+IEBAIC0xNTAwLDcgKzE1
MDEsOCBAQCBzdHJ1Y3QgZmlsZV9zeXN0ZW1fdHlwZSBuZnM0X2ZzX3R5cGUgPSB7Cj4gwqAJLmlu
aXRfZnNfY29udGV4dAk9IG5mc19pbml0X2ZzX2NvbnRleHQsCj4gwqAJLnBhcmFtZXRlcnMJCT0g
bmZzX2ZzX3BhcmFtZXRlcnMsCj4gwqAJLmtpbGxfc2IJCT0gbmZzX2tpbGxfc3VwZXIsCj4gLQku
ZnNfZmxhZ3MJCT0gRlNfUkVOQU1FX0RPRVNfRF9NT1ZFfEZTX0JJTkFSWV9NT1VOVERBVEEsCj4g
KwkuZnNfZmxhZ3MJCT0gRlNfUkVOQU1FX0RPRVNfRF9NT1ZFfEZTX0JJTkFSWV9NT1VOVERBVEF8
Cj4gKwkJCQkgIEZTX1BSSVZBVEVfSV9WRVJTSU9OLAo+IMKgfTsKPiDCoE1PRFVMRV9BTElBU19G
UygibmZzNCIpOwo+IMKgTU9EVUxFX0FMSUFTKCJuZnM0Iik7Cj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvZnMuaCBiL2luY2x1ZGUvbGludXgvZnMuaAo+IGluZGV4IDIxY2M5NzFmZDk2MC4u
YzViYjQyNjgyMjhiIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvZnMuaAo+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvZnMuaAo+IEBAIC0yMjE3LDYgKzIyMTcsNyBAQCBzdHJ1Y3QgZmlsZV9zeXN0
ZW1fdHlwZSB7Cj4gwqAjZGVmaW5lIEZTX0hBU19TVUJUWVBFCQk0Cj4gwqAjZGVmaW5lIEZTX1VT
RVJOU19NT1VOVAkJOAkvKiBDYW4gYmUgbW91bnRlZCBieSB1c2VybnMgcm9vdCAqLwo+IMKgI2Rl
ZmluZSBGU19ESVNBTExPV19OT1RJRllfUEVSTQkxNgkvKiBEaXNhYmxlIGZhbm90aWZ5IHBlcm1p
c3Npb24gZXZlbnRzICovCj4gKyNkZWZpbmUgRlNfUFJJVkFURV9JX1ZFUlNJT04JMzIJLyogaV92
ZXJzaW9uIG1hbmFnZWQgYnkgZmlsZXN5c3RlbSAqLwo+IMKgI2RlZmluZSBGU19USFBfU1VQUE9S
VAkJODE5MgkvKiBSZW1vdmUgb25jZSBhbGwgZnMgY29udmVydGVkICovCj4gwqAjZGVmaW5lIEZT
X1JFTkFNRV9ET0VTX0RfTU9WRQkzMjc2OAkvKiBGUyB3aWxsIGhhbmRsZSBkX21vdmUoKSBkdXJp
bmcgcmVuYW1lKCkgaW50ZXJuYWxseS4gKi8KPiDCoAlpbnQgKCppbml0X2ZzX2NvbnRleHQpKHN0
cnVjdCBmc19jb250ZXh0ICopOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2l2ZXJzaW9u
LmggYi9pbmNsdWRlL2xpbnV4L2l2ZXJzaW9uLmgKPiBpbmRleCAyOTE3ZWY5OTBkNDMuLjUyYzc5
MGE4NDdkZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2l2ZXJzaW9uLmgKPiArKysgYi9p
bmNsdWRlL2xpbnV4L2l2ZXJzaW9uLmgKPiBAQCAtMzA3LDYgKzMwNyw4IEBAIGlub2RlX3F1ZXJ5
X2l2ZXJzaW9uKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4gwqAJdTY0IGN1ciwgb2xkLCBuZXc7Cj4g
wqAKPiAKPiDCoAljdXIgPSBpbm9kZV9wZWVrX2l2ZXJzaW9uX3Jhdyhpbm9kZSk7Cj4gKwlpZiAo
aW5vZGUtPmlfc2ItPnNfdHlwZS0+ZnNfZmxhZ3MgJiBGU19QUklWQVRFX0lfVkVSU0lPTikKPiAr
CQlyZXR1cm4gY3VyOwo+IMKgCWZvciAoOzspIHsKPiDCoAkJLyogSWYgZmxhZyBpcyBhbHJlYWR5
IHNldCwgdGhlbiBubyBuZWVkIHRvIHN3YXAgKi8KPiDCoAkJaWYgKGN1ciAmIElfVkVSU0lPTl9R
VUVSSUVEKSB7CgoKSXQncyBwcm9iYWJseSBtb3JlIGNvcnJlY3QgdG8ganVzdCBjaGVjayB0aGUg
YWxyZWFkeS1leGlzdGluZwpTQl9JX1ZFUlNJT04gZmxhZyBoZXJlICh0aG91Z2ggaW4gaGluZHNp
Z2h0IGEgZnN0eXBlIGZsYWcgbWlnaHQgaGF2ZQptYWRlIG1vcmUgc2Vuc2UpLgoKLS0gCkplZmYg
TGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+CgoKLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxp
c3QKTGludXgtY2FjaGVmc0ByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1jYWNoZWZz

