Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 24CEA2B69F9
	for <lists+linux-cachefs@lfdr.de>; Tue, 17 Nov 2020 17:25:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-hQ-qc1ElPceHuuM0Jd5e7w-1; Tue, 17 Nov 2020 11:24:59 -0500
X-MC-Unique: hQ-qc1ElPceHuuM0Jd5e7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 421111074664;
	Tue, 17 Nov 2020 16:24:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97CE85DA8F;
	Tue, 17 Nov 2020 16:24:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4BDF86BE8;
	Tue, 17 Nov 2020 16:24:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AHEEFro002121 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 17 Nov 2020 09:14:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2C397207A642; Tue, 17 Nov 2020 14:14:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 274D8207A641
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 14:14:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4D66801184
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 14:14:12 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-265-LxsuD5fmPHCnBWd1Fg9jMw-1;
	Tue, 17 Nov 2020 09:14:07 -0500
X-MC-Unique: LxsuD5fmPHCnBWd1Fg9jMw-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 29B131CE6; Tue, 17 Nov 2020 09:14:05 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 29B131CE6
Date: Tue, 17 Nov 2020 09:14:05 -0500
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20201117141405.GA4556@fieldses.org>
References: <20201117031601.GB10526@fieldses.org>
	<1605583086-19869-1-git-send-email-bfields@redhat.com>
	<1605583086-19869-3-git-send-email-bfields@redhat.com>
	<4be708fffc15a27560c378af20314212e8594f85.camel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <4be708fffc15a27560c378af20314212e8594f85.camel@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
From: bfields@fieldses.org (J. Bruce Fields)
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AHEEFro002121
X-loop: linux-cachefs@redhat.com
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	"J. Bruce Fields" <bfields@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBOb3YgMTcsIDIwMjAgYXQgMDc6Mjc6MDNBTSAtMDUwMCwgSmVmZiBMYXl0b24gd3Jv
dGU6Cj4gT24gTW9uLCAyMDIwLTExLTE2IGF0IDIyOjE4IC0wNTAwLCBKLiBCcnVjZSBGaWVsZHMg
d3JvdGU6Cj4gPiBGcm9tOiAiSi4gQnJ1Y2UgRmllbGRzIiA8YmZpZWxkc0ByZWRoYXQuY29tPgo+
ID4gCj4gPiBUaGUgaV92ZXJzaW9uIG9uIE5GUyBoYXMgcHJldHR5IG11Y2ggb3BhcXVlIHRvIHRo
ZSBjbGllbnQsIHNvIHdlIGRvbid0Cj4gPiB3YW50IHRvIGdpdmUgdGhlIGxvdyBiaXQgYW55IHNw
ZWNpYWwgaW50ZXJwcmV0YXRpb24uCj4gPiAKPiA+IERlZmluZSBhIG5ldyBGU19QUklWQVRFX0lf
VkVSU0lPTiBmbGFnIGZvciBmaWxlc3lzdGVtcyB0aGF0IG1hbmFnZSB0aGUKPiA+IGlfdmVyc2lv
biBvbiB0aGVpciBvd24uCj4gPiAKPiAKPiBEZXNjcmlwdGlvbiBoZXJlIGRvZXNuJ3QgcXVpdGUg
bWF0Y2ggdGhlIHBhdGNoLi4uCgpPb3BzLCB0aGFua3MuLS1iLgoKPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IEouIEJydWNlIEZpZWxkcyA8YmZpZWxkc0ByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiDCoGZz
L25mcy9leHBvcnQuYyAgICAgICAgICB8IDEgKwo+ID4gwqBpbmNsdWRlL2xpbnV4L2V4cG9ydGZz
LmggfCAxICsKPiA+IMKgaW5jbHVkZS9saW51eC9pdmVyc2lvbi5oIHwgNCArKysrCj4gPiDCoDMg
ZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9mcy9u
ZnMvZXhwb3J0LmMgYi9mcy9uZnMvZXhwb3J0LmMKPiA+IGluZGV4IDM0MzBkNjg5MWU4OS4uYzJl
YjkxNWE1NGNhIDEwMDY0NAo+ID4gLS0tIGEvZnMvbmZzL2V4cG9ydC5jCj4gPiArKysgYi9mcy9u
ZnMvZXhwb3J0LmMKPiA+IEBAIC0xNzEsNCArMTcxLDUgQEAgY29uc3Qgc3RydWN0IGV4cG9ydF9v
cGVyYXRpb25zIG5mc19leHBvcnRfb3BzID0gewo+ID4gwqAJLmVuY29kZV9maCA9IG5mc19lbmNv
ZGVfZmgsCj4gPiDCoAkuZmhfdG9fZGVudHJ5ID0gbmZzX2ZoX3RvX2RlbnRyeSwKPiA+IMKgCS5n
ZXRfcGFyZW50ID0gbmZzX2dldF9wYXJlbnQsCj4gPiArCS5mZXRjaF9pdmVyc2lvbiA9IGlub2Rl
X3BlZWtfaXZlcnNpb25fcmF3LAo+ID4gwqB9Owo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvZXhwb3J0ZnMuaCBiL2luY2x1ZGUvbGludXgvZXhwb3J0ZnMuaAo+ID4gaW5kZXggM2NlYjcy
YjY3YTdhLi42MDAwMTIxYTIwMWYgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2V4cG9y
dGZzLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvZXhwb3J0ZnMuaAo+ID4gQEAgLTIxMyw2ICsy
MTMsNyBAQCBzdHJ1Y3QgZXhwb3J0X29wZXJhdGlvbnMgewo+ID4gwqAJCQkgIGJvb2wgd3JpdGUs
IHUzMiAqZGV2aWNlX2dlbmVyYXRpb24pOwo+ID4gwqAJaW50ICgqY29tbWl0X2Jsb2Nrcykoc3Ry
dWN0IGlub2RlICppbm9kZSwgc3RydWN0IGlvbWFwICppb21hcHMsCj4gPiDCoAkJCSAgICAgaW50
IG5yX2lvbWFwcywgc3RydWN0IGlhdHRyICppYXR0cik7Cj4gPiArCXU2NCAoKmZldGNoX2l2ZXJz
aW9uKShjb25zdCBzdHJ1Y3QgaW5vZGUgKik7Cj4gPiDCoH07Cj4gPiDCoAo+ID4gCj4gPiAKPiA+
IAo+ID4gCj4gPiAKPiA+IAo+ID4gCj4gPiDCoGV4dGVybiBpbnQgZXhwb3J0ZnNfZW5jb2RlX2lu
b2RlX2ZoKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWQgKmZpZCwKPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L2l2ZXJzaW9uLmggYi9pbmNsdWRlL2xpbnV4L2l2ZXJzaW9uLmgK
PiA+IGluZGV4IDI5MTdlZjk5MGQ0My4uNDgxYjNkZWJmNmJiIDEwMDY0NAo+ID4gLS0tIGEvaW5j
bHVkZS9saW51eC9pdmVyc2lvbi5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2l2ZXJzaW9uLmgK
PiA+IEBAIC0zLDYgKzMsNyBAQAo+ID4gwqAjZGVmaW5lIF9MSU5VWF9JVkVSU0lPTl9ICj4gPiDC
oAo+ID4gCj4gPiAKPiA+IAo+ID4gCj4gPiAKPiA+IAo+ID4gCj4gPiDCoCNpbmNsdWRlIDxsaW51
eC9mcy5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9leHBvcnRmcy5oPgo+ID4gwqAKPiA+IAo+ID4g
Cj4gPiAKPiA+IAo+ID4gCj4gPiAKPiA+IAo+ID4gwqAvKgo+ID4gwqDCoCogVGhlIGlub2RlLT5p
X3ZlcnNpb24gZmllbGQ6Cj4gPiBAQCAtMzA2LDYgKzMwNyw5IEBAIGlub2RlX3F1ZXJ5X2l2ZXJz
aW9uKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4gPiDCoHsKPiA+IMKgCXU2NCBjdXIsIG9sZCwgbmV3
Owo+ID4gwqAKPiA+IAo+ID4gCj4gPiAKPiA+IAo+ID4gCj4gPiAKPiA+IAo+ID4gKwlpZiAoaW5v
ZGUtPmlfc2ItPnNfZXhwb3J0X29wLT5mZXRjaF9pdmVyc2lvbikKPiA+ICsJCXJldHVybiBpbm9k
ZS0+aV9zYi0+c19leHBvcnRfb3AtPmZldGNoX2l2ZXJzaW9uKGlub2RlKTsKPiA+ICsKPiAKPiBU
aGlzIGxvb2tzIGRhbmdlcm91cyAtLSBzX2V4cG9ydF9vcCBjb3VsZCBiZSBhIE5VTEwgcG9pbnRl
ci4KPiAKPiA+IMKgCWN1ciA9IGlub2RlX3BlZWtfaXZlcnNpb25fcmF3KGlub2RlKTsKPiA+IMKg
CWZvciAoOzspIHsKPiA+IMKgCQkvKiBJZiBmbGFnIGlzIGFscmVhZHkgc2V0LCB0aGVuIG5vIG5l
ZWQgdG8gc3dhcCAqLwo+IAo+IC0tIAo+IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+
CgoKLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKTGludXgtY2FjaGVmc0ByZWRoYXQuY29t
Cmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZz

