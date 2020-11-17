Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E09C82B5F0F
	for <lists+linux-cachefs@lfdr.de>; Tue, 17 Nov 2020 13:27:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-af4jBtqhMbmjHpwxNt9r3w-1; Tue, 17 Nov 2020 07:27:23 -0500
X-MC-Unique: af4jBtqhMbmjHpwxNt9r3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A975485C705;
	Tue, 17 Nov 2020 12:27:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4812C60CD0;
	Tue, 17 Nov 2020 12:27:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EEB6758133;
	Tue, 17 Nov 2020 12:27:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AHCRCUZ001719 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 17 Nov 2020 07:27:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DC76920A8C5F; Tue, 17 Nov 2020 12:27:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7E8520A8C5D
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 12:27:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F5D98007A4
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 12:27:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-506-GNbgjbpGOcWDNeo5L2OiEg-1;
	Tue, 17 Nov 2020 07:27:06 -0500
X-MC-Unique: GNbgjbpGOcWDNeo5L2OiEg-1
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9AEF522203;
	Tue, 17 Nov 2020 12:27:04 +0000 (UTC)
Message-ID: <4be708fffc15a27560c378af20314212e8594f85.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: "J. Bruce Fields" <bfields@redhat.com>
Date: Tue, 17 Nov 2020 07:27:03 -0500
In-Reply-To: <1605583086-19869-3-git-send-email-bfields@redhat.com>
References: <20201117031601.GB10526@fieldses.org>
	<1605583086-19869-1-git-send-email-bfields@redhat.com>
	<1605583086-19869-3-git-send-email-bfields@redhat.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AHCRCUZ001719
X-loop: linux-cachefs@redhat.com
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH 3/4] nfs: don't mangle i_version on NFS
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIwLTExLTE2IGF0IDIyOjE4IC0wNTAwLCBKLiBCcnVjZSBGaWVsZHMgd3JvdGU6
Cj4gRnJvbTogIkouIEJydWNlIEZpZWxkcyIgPGJmaWVsZHNAcmVkaGF0LmNvbT4KPiAKPiBUaGUg
aV92ZXJzaW9uIG9uIE5GUyBoYXMgcHJldHR5IG11Y2ggb3BhcXVlIHRvIHRoZSBjbGllbnQsIHNv
IHdlIGRvbid0Cj4gd2FudCB0byBnaXZlIHRoZSBsb3cgYml0IGFueSBzcGVjaWFsIGludGVycHJl
dGF0aW9uLgo+IAo+IERlZmluZSBhIG5ldyBGU19QUklWQVRFX0lfVkVSU0lPTiBmbGFnIGZvciBm
aWxlc3lzdGVtcyB0aGF0IG1hbmFnZSB0aGUKPiBpX3ZlcnNpb24gb24gdGhlaXIgb3duLgo+IAoK
RGVzY3JpcHRpb24gaGVyZSBkb2Vzbid0IHF1aXRlIG1hdGNoIHRoZSBwYXRjaC4uLgoKPiBTaWdu
ZWQtb2ZmLWJ5OiBKLiBCcnVjZSBGaWVsZHMgPGJmaWVsZHNAcmVkaGF0LmNvbT4KPiAtLS0KPiDC
oGZzL25mcy9leHBvcnQuYyAgICAgICAgICB8IDEgKwo+IMKgaW5jbHVkZS9saW51eC9leHBvcnRm
cy5oIHwgMSArCj4gwqBpbmNsdWRlL2xpbnV4L2l2ZXJzaW9uLmggfCA0ICsrKysKPiDCoDMgZmls
ZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL25mcy9leHBv
cnQuYyBiL2ZzL25mcy9leHBvcnQuYwo+IGluZGV4IDM0MzBkNjg5MWU4OS4uYzJlYjkxNWE1NGNh
IDEwMDY0NAo+IC0tLSBhL2ZzL25mcy9leHBvcnQuYwo+ICsrKyBiL2ZzL25mcy9leHBvcnQuYwo+
IEBAIC0xNzEsNCArMTcxLDUgQEAgY29uc3Qgc3RydWN0IGV4cG9ydF9vcGVyYXRpb25zIG5mc19l
eHBvcnRfb3BzID0gewo+IMKgCS5lbmNvZGVfZmggPSBuZnNfZW5jb2RlX2ZoLAo+IMKgCS5maF90
b19kZW50cnkgPSBuZnNfZmhfdG9fZGVudHJ5LAo+IMKgCS5nZXRfcGFyZW50ID0gbmZzX2dldF9w
YXJlbnQsCj4gKwkuZmV0Y2hfaXZlcnNpb24gPSBpbm9kZV9wZWVrX2l2ZXJzaW9uX3JhdywKPiDC
oH07Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZXhwb3J0ZnMuaCBiL2luY2x1ZGUvbGlu
dXgvZXhwb3J0ZnMuaAo+IGluZGV4IDNjZWI3MmI2N2E3YS4uNjAwMDEyMWEyMDFmIDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvbGludXgvZXhwb3J0ZnMuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvZXhw
b3J0ZnMuaAo+IEBAIC0yMTMsNiArMjEzLDcgQEAgc3RydWN0IGV4cG9ydF9vcGVyYXRpb25zIHsK
PiDCoAkJCSAgYm9vbCB3cml0ZSwgdTMyICpkZXZpY2VfZ2VuZXJhdGlvbik7Cj4gwqAJaW50ICgq
Y29tbWl0X2Jsb2Nrcykoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGlvbWFwICppb21hcHMs
Cj4gwqAJCQkgICAgIGludCBucl9pb21hcHMsIHN0cnVjdCBpYXR0ciAqaWF0dHIpOwo+ICsJdTY0
ICgqZmV0Y2hfaXZlcnNpb24pKGNvbnN0IHN0cnVjdCBpbm9kZSAqKTsKPiDCoH07Cj4gwqAKPiAK
PiAKPiAKPiAKPiAKPiAKPiAKPiDCoGV4dGVybiBpbnQgZXhwb3J0ZnNfZW5jb2RlX2lub2RlX2Zo
KHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWQgKmZpZCwKPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9pdmVyc2lvbi5oIGIvaW5jbHVkZS9saW51eC9pdmVyc2lvbi5oCj4gaW5kZXgg
MjkxN2VmOTkwZDQzLi40ODFiM2RlYmY2YmIgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9p
dmVyc2lvbi5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9pdmVyc2lvbi5oCj4gQEAgLTMsNiArMyw3
IEBACj4gwqAjZGVmaW5lIF9MSU5VWF9JVkVSU0lPTl9ICj4gwqAKPiAKPiAKPiAKPiAKPiAKPiAK
PiAKPiDCoCNpbmNsdWRlIDxsaW51eC9mcy5oPgo+ICsjaW5jbHVkZSA8bGludXgvZXhwb3J0ZnMu
aD4KPiDCoAo+IAo+IAo+IAo+IAo+IAo+IAo+IAo+IMKgLyoKPiDCoMKgKiBUaGUgaW5vZGUtPmlf
dmVyc2lvbiBmaWVsZDoKPiBAQCAtMzA2LDYgKzMwNyw5IEBAIGlub2RlX3F1ZXJ5X2l2ZXJzaW9u
KHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4gwqB7Cj4gwqAJdTY0IGN1ciwgb2xkLCBuZXc7Cj4gwqAK
PiAKPiAKPiAKPiAKPiAKPiAKPiAKPiArCWlmIChpbm9kZS0+aV9zYi0+c19leHBvcnRfb3AtPmZl
dGNoX2l2ZXJzaW9uKQo+ICsJCXJldHVybiBpbm9kZS0+aV9zYi0+c19leHBvcnRfb3AtPmZldGNo
X2l2ZXJzaW9uKGlub2RlKTsKPiArCgpUaGlzIGxvb2tzIGRhbmdlcm91cyAtLSBzX2V4cG9ydF9v
cCBjb3VsZCBiZSBhIE5VTEwgcG9pbnRlci4KCj4gwqAJY3VyID0gaW5vZGVfcGVla19pdmVyc2lv
bl9yYXcoaW5vZGUpOwo+IMKgCWZvciAoOzspIHsKPiDCoAkJLyogSWYgZmxhZyBpcyBhbHJlYWR5
IHNldCwgdGhlbiBubyBuZWVkIHRvIHN3YXAgKi8KCi0tIApKZWZmIExheXRvbiA8amxheXRvbkBr
ZXJuZWwub3JnPgoKCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNA
cmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
Y2FjaGVmcw==

