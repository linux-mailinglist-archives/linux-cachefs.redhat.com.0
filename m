Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 268B72B4B7D
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Nov 2020 17:42:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-P_JAA9E5Oba99lf4pNtuug-1; Mon, 16 Nov 2020 11:42:56 -0500
X-MC-Unique: P_JAA9E5Oba99lf4pNtuug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 377F190542B;
	Mon, 16 Nov 2020 16:42:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB76C5C22E;
	Mon, 16 Nov 2020 16:42:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A50C95812C;
	Mon, 16 Nov 2020 16:42:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGGcsMU030734 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 11:38:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8AC26200BA9E; Mon, 16 Nov 2020 16:38:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84F3920244F7
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 16:38:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B3D2102F1E0
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 16:38:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-55-HwHwCY7ePNKtvQYZ8Q-KMA-1; 
	Mon, 16 Nov 2020 11:38:47 -0500
X-MC-Unique: HwHwCY7ePNKtvQYZ8Q-KMA-1
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0409E20776;
	Mon, 16 Nov 2020 16:38:45 +0000 (UTC)
Message-ID: <db55bab87b6fc9dd1594f8c2e853f07b1165ff5d.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: bfields <bfields@fieldses.org>
Date: Mon, 16 Nov 2020 11:38:44 -0500
In-Reply-To: <20201116161407.GG898@fieldses.org>
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
	<20201116161407.GG898@fieldses.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AGGcsMU030734
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIwLTExLTE2IGF0IDExOjE0IC0wNTAwLCBiZmllbGRzIHdyb3RlOgo+IE9uIE1v
biwgTm92IDE2LCAyMDIwIGF0IDExOjAzOjAwQU0gLTA1MDAsIEplZmYgTGF5dG9uIHdyb3RlOgo+
ID4gT24gTW9uLCAyMDIwLTExLTE2IGF0IDEwOjU2IC0wNTAwLCBiZmllbGRzIHdyb3RlOgo+ID4g
PiBPbiBNb24sIE5vdiAxNiwgMjAyMCBhdCAxMDoyOToyOUFNIC0wNTAwLCBKZWZmIExheXRvbiB3
cm90ZToKPiA+ID4gPiBPbiBGcmksIDIwMjAtMTEtMTMgYXQgMTc6MjYgLTA1MDAsIGJmaWVsZHMg
d3JvdGU6Cj4gPiA+ID4gPiBPbiBGcmksIE5vdiAxMywgMjAyMCBhdCAwOTo1MDo1MEFNIC0wNTAw
LCBiZmllbGRzIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBUaHUsIE5vdiAxMiwgMjAyMCBhdCAxMTow
NTo1N1BNICswMDAwLCBEYWlyZSBCeXJuZSB3cm90ZToKPiA+ID4gPiA+ID4gPiBTbywgSSBjYW4n
dCBsYXkgY2xhaW0gdG8gaWRlbnRpZnlpbmcgdGhlIGV4YWN0IG9wdGltaXNhdGlvbi9oYWNrIHRo
YXQKPiA+ID4gPiA+ID4gPiBpbXByb3ZlcyB0aGUgcmV0ZW50aW9uIG9mIHRoZSByZS1leHBvcnQg
c2VydmVyJ3MgY2xpZW50IGNhY2hlIHdoZW4KPiA+ID4gPiA+ID4gPiByZS1leHBvcnRpbmcgYW4g
TkZTdjMgc2VydmVyICh3aGljaCBpcyB0aGVuIHJlYWQgYnkgbWFueSBjbGllbnRzKS4gV2UKPiA+
ID4gPiA+ID4gPiB3ZXJlIHdvcmtpbmcgd2l0aCBhbiBlbmdpbmVlciBhdCB0aGUgdGltZSB3aG8g
c2hvd2VkIGFuIGludGVyZXN0IGluCj4gPiA+ID4gPiA+ID4gb3VyIHVzZSBjYXNlIGFuZCBhZnRl
ciB3ZSBzdXBwbGllZCBhIHJlcHJvZHVjZXIgaGUgc3VnZ2VzdGVkIG1vZGlmeWluZwo+ID4gPiA+
ID4gPiA+IHRoZSBuZnMvaW5vZGUuYwo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IC0JCWlm
ICghaW5vZGVfZXFfaXZlcnNpb25fcmF3KGlub2RlLCBmYXR0ci0+Y2hhbmdlX2F0dHIpKSB7Cj4g
PiA+ID4gPiA+ID4gKwkJaWYgKGlub2RlX3BlZWtfaXZlcnNpb25fcmF3KGlub2RlKSA8IGZhdHRy
LT5jaGFuZ2VfYXR0cikKPiA+ID4gPiA+ID4gPiB7Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
ID4gSGlzIHJlYXNvbmluZyBhdCB0aGUgdGltZSB3YXM6Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+ID4gIkZpeGVzIGlub2RlIGludmFsaWRhdGlvbiBjYXVzZWQgYnkgcmVhZCBhY2Nlc3MuIFRo
ZSBsZWFzdCBpbXBvcnRhbnQKPiA+ID4gPiA+ID4gPiBiaXQgaXMgT1JlZCB3aXRoIDEgYW5kIGNh
dXNlcyB0aGUgaW5vZGUgdmVyc2lvbiB0byBkaWZmZXIgZnJvbSB0aGUgb25lCj4gPiA+ID4gPiA+
ID4gc2VlbiBvbiB0aGUgTkZTIHNoYXJlLiBUaGlzIGluIHR1cm4gY2F1c2VzIHVubmVjZXNzYXJ5
IHJlLWRvd25sb2FkCj4gPiA+ID4gPiA+ID4gaW1wYWN0aW5nIHRoZSBwZXJmb3JtYW5jZSBzaWdu
aWZpY2FudGx5LiBUaGlzIGZpeCBtYWtlcyBpdCBvbmx5Cj4gPiA+ID4gPiA+ID4gcmUtZmV0Y2gg
ZmlsZSBjb250ZW50IGlmIGlub2RlIHZlcnNpb24gc2VlbiBvbiB0aGUgc2VydmVyIGlzIG5ld2Vy
Cj4gPiA+ID4gPiA+ID4gdGhhbiB0aGUgb25lIG9uIHRoZSBjbGllbnQuIgo+ID4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiA+IEJ1dCBJJ3ZlIGFsd2F5cyBiZWVuIHB1enpsZWQgYnkgd2h5IHRoaXMg
b25seSBzZWVtcyB0byBiZSB0aGUgY2FzZQo+ID4gPiA+ID4gPiA+IHdoZW4gdXNpbmcga25mc2Qg
dG8gcmUtZXhwb3J0IHRoZSAoTkZTdjMpIGNsaWVudCBtb3VudC4gVXNpbmcgbXVsdGlwbGUKPiA+
ID4gPiA+ID4gPiBwcm9jZXNzZXMgb24gYSBzdGFuZGFyZCBjbGllbnQgbW91bnQgbmV2ZXIgY2F1
c2VzIGFueSBzaW1pbGFyCj4gPiA+ID4gPiA+ID4gcmUtdmFsaWRhdGlvbnMuIEFuZCB0aGlzIGhh
cHBlbnMgd2l0aCBhIGNvbXBsZXRlbHkgcmVhZC1vbmx5IHNoYXJlCj4gPiA+ID4gPiA+ID4gd2hp
Y2ggaXMgd2h5IEkgc3RhcnRlZCB0byB0aGluayBpdCBoYXMgc29tZXRoaW5nIHRvIGRvIHdpdGgg
YXRpbWVzIGFzCj4gPiA+ID4gPiA+ID4gdGhhdCBjb3VsZCBwZXJoYXBzIHN0aWxsIGNhdXNlIGEg
IndyaXRlIiBtb2RpZmljYXRpb24gZXZlbiB3aGVuCj4gPiA+ID4gPiA+ID4gcmVhZC1vbmx5Pwo+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gQWgtaGFoISAgU28sIGl0J3MgaW5vZGVfcXVlcnlfaXZl
cnNpb24oKSB0aGF0J3MgbW9kaWZ5aW5nIGEgbmZzIGlub2RlJ3MKPiA+ID4gPiA+ID4gaV92ZXJz
aW9uLiAgVGhhdCdzIGEgc3BlY2lhbCB0aGluZyB0aGF0IG9ubHkgbmZzZCB3b3VsZCBkby4KPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEkgdGhpbmsgdGhhdCdzIHRvdGFsbHkgZml4YWJsZSwgd2Un
bGwganVzdCBoYXZlIHRvIHRoaW5rIGEgbGl0dGxlIGFib3V0Cj4gPiA+ID4gPiA+IGhvdy4uLi4K
PiA+ID4gPiA+IAo+ID4gPiA+ID4gSSB3b25kZXIgaWYgc29tZXRoaW5nIGxpa2UgdGhpcyBoZWxw
cz8tLWIuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IGNvbW1pdCAwYWRkODhhOWNjYzUKPiA+ID4gPiA+
IEF1dGhvcjogSi4gQnJ1Y2UgRmllbGRzIDxiZmllbGRzQHJlZGhhdC5jb20+Cj4gPiA+ID4gPiBE
YXRlOiAgIEZyaSBOb3YgMTMgMTc6MDM6MDQgMjAyMCAtMDUwMAo+ID4gPiA+ID4gCj4gPiA+ID4g
PiDCoMKgwqDCoG5mczogZG9uJ3QgbWFuZ2xlIGlfdmVyc2lvbiBvbiBORlMKPiA+ID4gPiA+IMKg
wqDCoMKgCj4gPiA+ID4gPiAKPiA+ID4gPiA+IMKgwqDCoMKgVGhlIGlfdmVyc2lvbiBvbiBORlMg
aGFzIHByZXR0eSBtdWNoIG9wYXF1ZSB0byB0aGUgY2xpZW50LCBzbyB3ZSBkb24ndAo+ID4gPiA+
ID4gwqDCoMKgwqB3YW50IHRvIGdpdmUgdGhlIGxvdyBiaXQgYW55IHNwZWNpYWwgaW50ZXJwcmV0
YXRpb24uCj4gPiA+ID4gPiDCoMKgwqDCoAo+ID4gPiA+ID4gCj4gPiA+ID4gPiDCoMKgwqDCoERl
ZmluZSBhIG5ldyBGU19QUklWQVRFX0lfVkVSU0lPTiBmbGFnIGZvciBmaWxlc3lzdGVtcyB0aGF0
IG1hbmFnZSB0aGUKPiA+ID4gPiA+IMKgwqDCoMKgaV92ZXJzaW9uIG9uIHRoZWlyIG93bi4KPiA+
ID4gPiA+IMKgwqDCoMKgCj4gPiA+ID4gPiAKPiA+ID4gPiA+IMKgwqDCoMKgU2lnbmVkLW9mZi1i
eTogSi4gQnJ1Y2UgRmllbGRzIDxiZmllbGRzQHJlZGhhdC5jb20+Cj4gPiA+ID4gPiAKPiA+ID4g
PiA+IGRpZmYgLS1naXQgYS9mcy9uZnMvZnNfY29udGV4dC5jIGIvZnMvbmZzL2ZzX2NvbnRleHQu
Ywo+ID4gPiA+ID4gaW5kZXggMjllYzhiMDlhNTJkLi45YjhkZDViNzEzYTcgMTAwNjQ0Cj4gPiA+
ID4gPiAtLS0gYS9mcy9uZnMvZnNfY29udGV4dC5jCj4gPiA+ID4gPiArKysgYi9mcy9uZnMvZnNf
Y29udGV4dC5jCj4gPiA+ID4gPiBAQCAtMTQ4OCw3ICsxNDg4LDggQEAgc3RydWN0IGZpbGVfc3lz
dGVtX3R5cGUgbmZzX2ZzX3R5cGUgPSB7Cj4gPiA+ID4gPiDCoAkuaW5pdF9mc19jb250ZXh0CT0g
bmZzX2luaXRfZnNfY29udGV4dCwKPiA+ID4gPiA+IMKgCS5wYXJhbWV0ZXJzCQk9IG5mc19mc19w
YXJhbWV0ZXJzLAo+ID4gPiA+ID4gwqAJLmtpbGxfc2IJCT0gbmZzX2tpbGxfc3VwZXIsCj4gPiA+
ID4gPiAtCS5mc19mbGFncwkJPSBGU19SRU5BTUVfRE9FU19EX01PVkV8RlNfQklOQVJZX01PVU5U
REFUQSwKPiA+ID4gPiA+ICsJLmZzX2ZsYWdzCQk9IEZTX1JFTkFNRV9ET0VTX0RfTU9WRXxGU19C
SU5BUllfTU9VTlREQVRBfAo+ID4gPiA+ID4gKwkJCQkgIEZTX1BSSVZBVEVfSV9WRVJTSU9OLAo+
ID4gPiA+ID4gwqB9Owo+ID4gPiA+ID4gwqBNT0RVTEVfQUxJQVNfRlMoIm5mcyIpOwo+ID4gPiA+
ID4gwqBFWFBPUlRfU1lNQk9MX0dQTChuZnNfZnNfdHlwZSk7Cj4gPiA+ID4gPiBAQCAtMTUwMCw3
ICsxNTAxLDggQEAgc3RydWN0IGZpbGVfc3lzdGVtX3R5cGUgbmZzNF9mc190eXBlID0gewo+ID4g
PiA+ID4gwqAJLmluaXRfZnNfY29udGV4dAk9IG5mc19pbml0X2ZzX2NvbnRleHQsCj4gPiA+ID4g
PiDCoAkucGFyYW1ldGVycwkJPSBuZnNfZnNfcGFyYW1ldGVycywKPiA+ID4gPiA+IMKgCS5raWxs
X3NiCQk9IG5mc19raWxsX3N1cGVyLAo+ID4gPiA+ID4gLQkuZnNfZmxhZ3MJCT0gRlNfUkVOQU1F
X0RPRVNfRF9NT1ZFfEZTX0JJTkFSWV9NT1VOVERBVEEsCj4gPiA+ID4gPiArCS5mc19mbGFncwkJ
PSBGU19SRU5BTUVfRE9FU19EX01PVkV8RlNfQklOQVJZX01PVU5UREFUQXwKPiA+ID4gPiA+ICsJ
CQkJICBGU19QUklWQVRFX0lfVkVSU0lPTiwKPiA+ID4gPiA+IMKgfTsKPiA+ID4gPiA+IMKgTU9E
VUxFX0FMSUFTX0ZTKCJuZnM0Iik7Cj4gPiA+ID4gPiDCoE1PRFVMRV9BTElBUygibmZzNCIpOwo+
ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZnMuaCBiL2luY2x1ZGUvbGludXgv
ZnMuaAo+ID4gPiA+ID4gaW5kZXggMjFjYzk3MWZkOTYwLi5jNWJiNDI2ODIyOGIgMTAwNjQ0Cj4g
PiA+ID4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2ZzLmgKPiA+ID4gPiA+ICsrKyBiL2luY2x1ZGUv
bGludXgvZnMuaAo+ID4gPiA+ID4gQEAgLTIyMTcsNiArMjIxNyw3IEBAIHN0cnVjdCBmaWxlX3N5
c3RlbV90eXBlIHsKPiA+ID4gPiA+IMKgI2RlZmluZSBGU19IQVNfU1VCVFlQRQkJNAo+ID4gPiA+
ID4gwqAjZGVmaW5lIEZTX1VTRVJOU19NT1VOVAkJOAkvKiBDYW4gYmUgbW91bnRlZCBieSB1c2Vy
bnMgcm9vdCAqLwo+ID4gPiA+ID4gwqAjZGVmaW5lIEZTX0RJU0FMTE9XX05PVElGWV9QRVJNCTE2
CS8qIERpc2FibGUgZmFub3RpZnkgcGVybWlzc2lvbiBldmVudHMgKi8KPiA+ID4gPiA+ICsjZGVm
aW5lIEZTX1BSSVZBVEVfSV9WRVJTSU9OCTMyCS8qIGlfdmVyc2lvbiBtYW5hZ2VkIGJ5IGZpbGVz
eXN0ZW0gKi8KPiA+ID4gPiA+IMKgI2RlZmluZSBGU19USFBfU1VQUE9SVAkJODE5MgkvKiBSZW1v
dmUgb25jZSBhbGwgZnMgY29udmVydGVkICovCj4gPiA+ID4gPiDCoCNkZWZpbmUgRlNfUkVOQU1F
X0RPRVNfRF9NT1ZFCTMyNzY4CS8qIEZTIHdpbGwgaGFuZGxlIGRfbW92ZSgpIGR1cmluZyByZW5h
bWUoKSBpbnRlcm5hbGx5LiAqLwo+ID4gPiA+ID4gwqAJaW50ICgqaW5pdF9mc19jb250ZXh0KShz
dHJ1Y3QgZnNfY29udGV4dCAqKTsKPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2l2ZXJzaW9uLmggYi9pbmNsdWRlL2xpbnV4L2l2ZXJzaW9uLmgKPiA+ID4gPiA+IGluZGV4IDI5
MTdlZjk5MGQ0My4uNTJjNzkwYTg0N2RlIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvaW5jbHVkZS9s
aW51eC9pdmVyc2lvbi5oCj4gPiA+ID4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2l2ZXJzaW9uLmgK
PiA+ID4gPiA+IEBAIC0zMDcsNiArMzA3LDggQEAgaW5vZGVfcXVlcnlfaXZlcnNpb24oc3RydWN0
IGlub2RlICppbm9kZSkKPiA+ID4gPiA+IMKgCXU2NCBjdXIsIG9sZCwgbmV3Owo+ID4gPiA+ID4g
wqAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gwqAJY3VyID0gaW5vZGVfcGVla19pdmVyc2lvbl9yYXco
aW5vZGUpOwo+ID4gPiA+ID4gKwlpZiAoaW5vZGUtPmlfc2ItPnNfdHlwZS0+ZnNfZmxhZ3MgJiBG
U19QUklWQVRFX0lfVkVSU0lPTikKPiA+ID4gPiA+ICsJCXJldHVybiBjdXI7Cj4gPiA+ID4gPiDC
oAlmb3IgKDs7KSB7Cj4gPiA+ID4gPiDCoAkJLyogSWYgZmxhZyBpcyBhbHJlYWR5IHNldCwgdGhl
biBubyBuZWVkIHRvIHN3YXAgKi8KPiA+ID4gPiA+IMKgCQlpZiAoY3VyICYgSV9WRVJTSU9OX1FV
RVJJRUQpIHsKPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBJdCdzIHByb2JhYmx5IG1vcmUgY29y
cmVjdCB0byBqdXN0IGNoZWNrIHRoZSBhbHJlYWR5LWV4aXN0aW5nCj4gPiA+ID4gU0JfSV9WRVJT
SU9OIGZsYWcgaGVyZQo+ID4gPiAKPiA+ID4gU28gdGhlIGNoZWNrIHdvdWxkIGJlCj4gPiA+IAo+
ID4gPiAJaWYgKCFJU19JX1ZFUlNJT04oaW5vZGUpKQo+ID4gPiAJCXJldHVybiBjdXI7Cj4gPiA+
IAo+ID4gPiA/Cj4gPiA+IAo+ID4gCj4gPiBZZXMsIHRoYXQgbG9va3MgYWJvdXQgcmlnaHQuCj4g
Cj4gVGhhdCBkb2Vzbid0IHNvdW5kIHJpZ2h0IHRvIG1lLiAgTkZTLCBmb3IgZXhhbXBsZSwgaGFz
IGEgcGVyZmVjdGx5IGdvb2QKPiBpX3ZlcnNpb24gdGhhdCB3b3JrcyBhcyBhIGNoYW5nZSBhdHRy
aWJ1dGUsIHNvIGl0IHNob3VsZCBzZXQKPiBTQl9JX1ZFUlNJT04uICBCdXQgaXQgZG9lc24ndCB3
YW50IHRoZSB2ZnMgcGxheWluZyBnYW1lcyB3aXRoIHRoZSBsb3cKPiBiaXQuCj4gCj4gKEluIGZh
Y3QsIEknbSBjb25mdXNlZCBub3c6IHRoZSBpbXByb3ZlbWVudCBEYWlyZSB3YXMgc2VlaW5nIHNo
b3VsZCBvbmx5Cj4gYmUgcG9zc2libGUgaWYgdGhlIHJlLWV4cG9ydCBzZXJ2ZXIgd2FzIHNlZWlu
ZyBTQl9JX1ZFUlNJT04gc2V0IG9uIHRoZQo+IE5GUyBmaWxlc3lzdGVtIGl0IHdhcyBleHBvcnRp
bmcsIGJ1dCBhIHF1aWNrIGdyZXAgZG9lc24ndCBhY3R1YWxseSBzaG93Cj4gbWUgd2hlcmUgTkZT
IGlzIHNldHRpbmcgU0JfSV9WRVJTSU9OLiAgSSdtIG1pc3Npbmcgc29tZXRoaW5nCj4gb2J2aW91
cy4uLi4pCgoKSG1tLCBvay4uLiBuZnNkNF9jaGFuZ2VfYXR0cmlidXRlKCkgaXMgY2FsbGVkIGZy
b20gbmZzNCBjb2RlIGJ1dCBhbHNvCm5mczMgY29kZSBhcyB3ZWxsLiBUaGUgdjQgY2FsbGVyIChl
bmNvZGVfY2hhbmdlKSBvbmx5IGNhbGxzIGl0IHdoZW4KSVNfSV9WRVJTSU9OIGlzIHNldCwgYnV0
IHRoZSB2MyBjYWxsZXJzIGRvbid0IHNlZW0gdG8gcGF5IGF0dGVudGlvbiB0bwp0aGF0LgoKSSB0
aGluayB0aGUgYmFzaWMgaXNzdWUgaGVyZSBpcyB0aGF0IHdlJ3JlIHRyeWluZyB0byB1c2UgU0Jf
SV9WRVJTSU9OCmZvciB0d28gZGlmZmVyZW50IHRoaW5ncy4gSXRzIG1haW4gcHVycG9zZSBpcyB0
byB0ZWxsIHRoZSBrZXJuZWwgdGhhdAp3aGVuIGl0J3MgdXBkYXRpbmcgdGhlIGZpbGUgdGltZXMg
dGhhdCBpdCBzaG91bGQgYWxzbyAocG9zc2libHkpCmluY3JlbWVudCB0aGUgaV92ZXJzaW9uIGNv
dW50ZXIgdG9vLiAoU29tZSBvZiB0aGlzIGlzIGRvY3VtZW50ZWQgaW4KaW5jbHVkZS9saW51eC9p
dmVyc2lvbi5oIHRvbywgZndpdykKCm5mc2QgbmVlZHMgYSB3YXkgdG8gdGVsbCB3aGV0aGVyIHRo
ZSBmaWVsZCBzaG91bGQgYmUgY29uc3VsdGVkIGF0IGFsbC4KRm9yIHRoYXQgd2UgcHJvYmFibHkg
ZG8gbmVlZCBhIGRpZmZlcmVudCBmbGFnIG9mIHNvbWUgc29ydC4gRG9pbmcgaXQgYXQKdGhlIGZz
dHlwZSBsZXZlbCBzZWVtcyBhIGJpdCB3cm9uZyB0aG91Z2ggLS0gdjIvMyBkb24ndCBoYXZlIGEg
cmVhbApjaGFuZ2UgYXR0cmlidXRlIGFuZCBpdCBwcm9iYWJseSBzaG91bGRuJ3QgYmUgdHJ1c3Rl
ZCB3aGVuIGV4cG9ydGluZwp0aGVtLgoKLS0gCkplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5v
cmc+CgoKLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKTGludXgtY2FjaGVmc0ByZWRoYXQu
Y29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZz

