Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AAFEB2B5F2B
	for <lists+linux-cachefs@lfdr.de>; Tue, 17 Nov 2020 13:34:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-PYtlyK9DMQKyE2v8kB_4RQ-1; Tue, 17 Nov 2020 07:34:52 -0500
X-MC-Unique: PYtlyK9DMQKyE2v8kB_4RQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFFB68015FB;
	Tue, 17 Nov 2020 12:34:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D34B5B4B5;
	Tue, 17 Nov 2020 12:34:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF9BF181A261;
	Tue, 17 Nov 2020 12:34:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AHCYluv002742 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 17 Nov 2020 07:34:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 299C11111C79; Tue, 17 Nov 2020 12:34:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 252411111C78
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 12:34:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB70F811E79
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 12:34:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-165-tvbBla7CP-Wj7jD6vLqNXw-1;
	Tue, 17 Nov 2020 07:34:40 -0500
X-MC-Unique: tvbBla7CP-Wj7jD6vLqNXw-1
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 11D812222A;
	Tue, 17 Nov 2020 12:34:37 +0000 (UTC)
Message-ID: <fc008fc00c50baedbb763d166d33c0bc772f048c.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: "J. Bruce Fields" <bfields@redhat.com>
Date: Tue, 17 Nov 2020 07:34:36 -0500
In-Reply-To: <1605583086-19869-4-git-send-email-bfields@redhat.com>
References: <20201117031601.GB10526@fieldses.org>
	<1605583086-19869-1-git-send-email-bfields@redhat.com>
	<1605583086-19869-4-git-send-email-bfields@redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AHCYluv002742
X-loop: linux-cachefs@redhat.com
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH 4/4] nfs: support i_version in the NFSv4
	case
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIwLTExLTE2IGF0IDIyOjE4IC0wNTAwLCBKLiBCcnVjZSBGaWVsZHMgd3JvdGU6
Cj4gRnJvbTogIkouIEJydWNlIEZpZWxkcyIgPGJmaWVsZHNAcmVkaGF0LmNvbT4KPiAKPiBDdXJy
ZW50bHkgd2hlbiBrbmZzZCByZS1leHBvcnRzIGFuIE5GUyBmaWxlc3lzdGVtLCBpdCB1c2VzIHRo
ZSBjdGltZSBhcwo+IHRoZSBjaGFuZ2UgYXR0cmlidXRlLiAgQnV0IG9idmlvdXNseSB3ZSBoYXZl
IGEgcmVhbCBjaGFuZ2UKPiBhdHRyaWJ1dGUtLXRoZSBvbmUgdGhhdCB3YXMgcmV0dXJuZWQgZnJv
bSB0aGUgb3JpZ2luYWwgc2VydmVyLiAgV2UKPiBzaG91bGQganVzdCB1c2UgdGhhdC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKLiBCcnVjZSBGaWVsZHMgPGJmaWVsZHNAcmVkaGF0LmNvbT4KPiAtLS0K
PiDCoGZzL25mcy9zdXBlci5jIHwgMSArCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKPiAKPiBkaWZmIC0tZ2l0IGEvZnMvbmZzL3N1cGVyLmMgYi9mcy9uZnMvc3VwZXIuYwo+IGlu
ZGV4IDQwMzQxMDIwMTBmMC4uY2E4NWY4MWQxYjllIDEwMDY0NAo+IC0tLSBhL2ZzL25mcy9zdXBl
ci5jCj4gKysrIGIvZnMvbmZzL3N1cGVyLmMKPiBAQCAtMTA0NSw2ICsxMDQ1LDcgQEAgc3RhdGlj
IHZvaWQgbmZzX2ZpbGxfc3VwZXIoc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgc3RydWN0IG5mc19m
c19jb250ZXh0ICpjdHgpCj4gwqAJfSBlbHNlIHsKPiDCoAkJc2ItPnNfdGltZV9taW4gPSBTNjRf
TUlOOwo+IMKgCQlzYi0+c190aW1lX21heCA9IFM2NF9NQVg7Cj4gKwkJc2ItPnNfZmxhZ3MgfD0g
U0JfSV9WRVJTSU9OOwo+IMKgCX0KPiDCoAo+IAo+IMKgCXNiLT5zX21hZ2ljID0gTkZTX1NVUEVS
X01BR0lDOwoKSSBkb24ndCB0aGluayB3ZSB3YW50IHRoaXMgY2hhbmdlLiBUaGlzIHdpbGwgbWFr
ZSBmaWxlX3VwZGF0ZV90aW1lCmF0dGVtcHQgdG8gYnVtcCB0aGUgaV92ZXJzaW9uIGZpZWxkIGl0
c2VsZiB1c2luZyB0aGUgcm91dGluZXMgaW4KaXZlcnNpb24uaC4gVGhpcyB3aWxsIGFsbW9zdCBj
ZXJ0YWlubHkgZG8gdGhlIHdyb25nIHRoaW5nLgoKLS0gCkplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+CgoKLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKTGludXgtY2FjaGVmc0By
ZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1j
YWNoZWZz

