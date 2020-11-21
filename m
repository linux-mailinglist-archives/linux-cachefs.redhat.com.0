Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 59E0A2BBAEF
	for <lists+linux-cachefs@lfdr.de>; Sat, 21 Nov 2020 01:34:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-RIH_uDPqO8S6934txscY1A-1; Fri, 20 Nov 2020 19:34:52 -0500
X-MC-Unique: RIH_uDPqO8S6934txscY1A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29BFE81CAF7;
	Sat, 21 Nov 2020 00:34:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7603E5D6AD;
	Sat, 21 Nov 2020 00:34:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8FCA54A7C6;
	Sat, 21 Nov 2020 00:34:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AL0YhYs000967 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 19:34:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 61A6E1018E5C; Sat, 21 Nov 2020 00:34:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DD6F10031FF
	for <linux-cachefs@redhat.com>; Sat, 21 Nov 2020 00:34:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17EB2185A7BC
	for <linux-cachefs@redhat.com>; Sat, 21 Nov 2020 00:34:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-437-xl-qL33_MAW_IDe80HAC3w-1;
	Fri, 20 Nov 2020 19:34:38 -0500
X-MC-Unique: xl-qL33_MAW_IDe80HAC3w-1
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CF85C23A65;
	Sat, 21 Nov 2020 00:34:36 +0000 (UTC)
Message-ID: <761df9cadb497de177eb29bb407061f6e213e75c.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: "J. Bruce Fields" <bfields@redhat.com>
Date: Fri, 20 Nov 2020 19:34:35 -0500
In-Reply-To: <1605911960-12516-3-git-send-email-bfields@redhat.com>
References: <20201120223831.GB7705@fieldses.org>
	<1605911960-12516-1-git-send-email-bfields@redhat.com>
	<1605911960-12516-3-git-send-email-bfields@redhat.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AL0YhYs000967
X-loop: linux-cachefs@redhat.com
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH 3/8] nfsd: minor nfsd4_change_attribute
	cleanup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIwLTExLTIwIGF0IDE3OjM5IC0wNTAwLCBKLiBCcnVjZSBGaWVsZHMgd3JvdGU6
Cj4gRnJvbTogIkouIEJydWNlIEZpZWxkcyIgPGJmaWVsZHNAcmVkaGF0LmNvbT4KPiAKPiBNaW5v
ciBjbGVhbnVwLCBubyBjaGFuZ2UgaW4gYmVoYXZpb3IKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKLiBC
cnVjZSBGaWVsZHMgPGJmaWVsZHNAcmVkaGF0LmNvbT4KPiAtLS0KPiDCoGZzL25mc2QvbmZzZmgu
aCB8IDEzICsrKysrLS0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL25mc2QvbmZzZmguaCBiL2ZzL25m
c2QvbmZzZmguaAo+IGluZGV4IDNmYWY1OTc0ZmE0ZS4uNDViZDc3NjI5MGQ1IDEwMDY0NAo+IC0t
LSBhL2ZzL25mc2QvbmZzZmguaAo+ICsrKyBiL2ZzL25mc2QvbmZzZmguaAo+IEBAIC0yNTksMTkg
KzI1OSwxNiBAQCBmaF9jbGVhcl93Y2Moc3RydWN0IHN2Y19maCAqZmhwKQo+IMKgc3RhdGljIGlu
bGluZSB1NjQgbmZzZDRfY2hhbmdlX2F0dHJpYnV0ZShzdHJ1Y3Qga3N0YXQgKnN0YXQsCj4gwqAJ
CQkJCSBzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+IMKgewo+IC0JdTY0IGNoYXR0cjsKPiAtCj4gwqAJ
aWYgKElTX0lfVkVSU0lPTihpbm9kZSkpIHsKPiArCQl1NjQgY2hhdHRyOwo+ICsKPiDCoAkJY2hh
dHRyID0gIHN0YXQtPmN0aW1lLnR2X3NlYzsKPiDCoAkJY2hhdHRyIDw8PSAzMDsKPiDCoAkJY2hh
dHRyICs9IHN0YXQtPmN0aW1lLnR2X25zZWM7Cj4gwqAJCWNoYXR0ciArPSBpbm9kZV9xdWVyeV9p
dmVyc2lvbihpbm9kZSk7Cj4gLQl9IGVsc2Ugewo+IC0JCWNoYXR0ciA9IGNwdV90b19iZTMyKHN0
YXQtPmN0aW1lLnR2X3NlYyk7Cj4gLQkJY2hhdHRyIDw8PSAzMjsKPiAtCQljaGF0dHIgKz0gY3B1
X3RvX2JlMzIoc3RhdC0+Y3RpbWUudHZfbnNlYyk7Cj4gLQl9Cj4gLQlyZXR1cm4gY2hhdHRyOwo+
ICsJCXJldHVybiBjaGF0dHI7Cj4gKwl9IGVsc2UKPiArCQlyZXR1cm4gdGltZV90b19jaGF0dHIo
JnN0YXQtPmN0aW1lKTsKPiDCoH0KPiDCoAo+IAo+IMKgZXh0ZXJuIHZvaWQgZmlsbF9wcmVfd2Nj
KHN0cnVjdCBzdmNfZmggKmZocCk7CgpJJ2QganVzdCBmb2xkIHRoaXMgb25lIGludG8gMi84Lgot
LSAKSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KCgotLQpMaW51eC1jYWNoZWZzIG1h
aWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnM=

