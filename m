Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B338143F90D
	for <lists+linux-cachefs@lfdr.de>; Fri, 29 Oct 2021 10:39:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-WU36tt_tMX69ILMo1rebbw-1; Fri, 29 Oct 2021 04:39:02 -0400
X-MC-Unique: WU36tt_tMX69ILMo1rebbw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B27681006AA6;
	Fri, 29 Oct 2021 08:38:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36DC6ADC9;
	Fri, 29 Oct 2021 08:38:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B25614E58F;
	Fri, 29 Oct 2021 08:38:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19T8cs0v016703 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 29 Oct 2021 04:38:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 268C151E3; Fri, 29 Oct 2021 08:38:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 204AD51DD
	for <linux-cachefs@redhat.com>; Fri, 29 Oct 2021 08:38:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BD81185A794
	for <linux-cachefs@redhat.com>; Fri, 29 Oct 2021 08:38:46 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-469-VzQmI0rtMY6thSkOYdWrSQ-1; Fri, 29 Oct 2021 04:38:42 -0400
X-MC-Unique: VzQmI0rtMY6thSkOYdWrSQ-1
Date: Fri, 29 Oct 2021 10:38:39 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-cachefs@redhat.com, linux-kernel@vger.kernel.org
Message-ID: <20211029083839.xwwt7jgzru3kcpii@linutronix.de>
References: <20211028160628.czwdzjjjhtqywasw@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20211028160628.czwdzjjjhtqywasw@linutronix.de>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 19T8cs0v016703
X-loop: linux-cachefs@redhat.com
Cc: Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Gregor Beck <gregor.beck@gmail.com>
Subject: [Linux-cachefs] [PATCH v2] fscache: Use only one
	fscache_object_cong_wait.
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
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

SW4gdGhlIGNvbW1pdCBtZW50aW9uZWQgYmVsb3csIGZzY2FjaGUgd2FzIGNvbnZlcnRlZCBmcm9t
IHNsb3ctd29yayB0bwp3b3JrcXVldWUuIHNsb3dfd29ya19lbnF1ZXVlKCkgYW5kIHNsb3dfd29y
a19zbGVlcF90aWxsX3RocmVhZF9uZWVkZWQoKQpkaWQgbm90IHVzZSBhIHBlci1DUFUgd29ya3F1
ZXVlLiBUaGV5IGNob29zZSBmcm9tIHR3byBnbG9iYWwgd2FpdHF1ZXVlcwpkZXBlbmRpbmcgb24g
dGhlIFNMT1dfV09SS19WRVJZX1NMT1cgYml0IHdoaWNoIHdhcyBub3Qgc2V0IHNvIGl0IGFsd2F5
cwpvbmUgd2FpdHF1ZXVlLgoKSSBjYW4ndCBmaW5kIG91dCBob3cgaXQgaXMgZW5zdXJlZCB0aGF0
IGEgd2FpdGVyIG9uIGNlcnRhaW4gQ1BVIGlzIHdva2VuCnVwIGJlIHRoZSBvdGhlciBzaWRlLiBN
eSBndWVzcyBpcyB0aGF0IHRoZSB0aW1lb3V0IGluIHNjaGVkdWxlX3RpbWVvdXQoKQplbnN1cmVz
IHRoYXQgaXQgZG9lcyBub3Qgd2FpdCBmb3JldmVyIChvciBhIHJhbmRvbSB3YWtlIHVwKS4KCmZz
Y2FjaGVfb2JqZWN0X3NsZWVwX3RpbGxfY29uZ2VzdGVkKCkgbXVzdCBiZSBpbnZva2VkIGZyb20g
cHJlZW1wdGlibGUKY29udGV4dCBpbiBvcmRlciBmb3Igc2NoZWR1bGUoKSB0byB3b3JrLiBJbiB0
aGlzIGNhc2UgdGhpc19jcHVfcHRyKCkKc2hvdWxkIGNvbXBsYWluIHdpdGggQ09ORklHX0RFQlVH
X1BSRUVNUFQgZW5hYmxlZCBleGNlcHQgdGhlIHRocmVhZCBpcwpib3VuZCB0byBvbmUgQ1BVLgoK
d2FrZV91cCgpIHdha2VzIG9ubHkgb25lIHdhaXRlciBhbmQgSSdtIG5vdCBzdXJlIGlmIGl0IGlz
IGd1YXJhbnRlZWQKdGhhdCBvbmx5IG9uZSB3YWl0ZXIgZXhpc3RzLgoKUmVwbGFjZSB0aGUgcGVy
LUNQVSB3YWl0cXVldWUgd2l0aCBvbmUgZ2xvYmFsIHdhaXRxdWV1ZS4KCkZpeGVzOiA4YjhlZGVm
YTJmZmZiICgiZnNjYWNoZTogY29udmVydCBvYmplY3QgdG8gdXNlIHdvcmtxdWV1ZSBpbnN0ZWFk
IG9mIHNsb3ctd29yayIpClJlcG9ydGVkLWJ5OiBHcmVnb3IgQmVjayA8Z3JlZ29yLmJlY2tAZ21h
aWwuY29tPgpDYzogc3RhYmxlLXJ0QHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBTZWJh
c3RpYW4gQW5kcnplaiBTaWV3aW9yIDxiaWdlYXN5QGxpbnV0cm9uaXguZGU+Ci0tLQp2MeKApnYy
OgogIC0gQWxzbyByZW1vdmUgdGhlIHB1dF9jcHVfdmFyKCkgc3RhdGVtZW50LgoKIGZzL2ZzY2Fj
aGUvaW50ZXJuYWwuaCB8ICAxIC0KIGZzL2ZzY2FjaGUvbWFpbi5jICAgICB8ICA2IC0tLS0tLQog
ZnMvZnNjYWNoZS9vYmplY3QuYyAgIHwgMTMgKysrKystLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2ZzY2Fj
aGUvaW50ZXJuYWwuaCBiL2ZzL2ZzY2FjaGUvaW50ZXJuYWwuaAppbmRleCBjM2U0ODA0YjhmY2Jm
Li45ZWRiODdlMTE2ODBiIDEwMDY0NAotLS0gYS9mcy9mc2NhY2hlL2ludGVybmFsLmgKKysrIGIv
ZnMvZnNjYWNoZS9pbnRlcm5hbC5oCkBAIC04MSw3ICs4MSw2IEBAIGV4dGVybiB1bnNpZ25lZCBm
c2NhY2hlX2RlYnVnOwogZXh0ZXJuIHN0cnVjdCBrb2JqZWN0ICpmc2NhY2hlX3Jvb3Q7CiBleHRl
cm4gc3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QgKmZzY2FjaGVfb2JqZWN0X3dxOwogZXh0ZXJuIHN0
cnVjdCB3b3JrcXVldWVfc3RydWN0ICpmc2NhY2hlX29wX3dxOwotREVDTEFSRV9QRVJfQ1BVKHdh
aXRfcXVldWVfaGVhZF90LCBmc2NhY2hlX29iamVjdF9jb25nX3dhaXQpOwogCiBleHRlcm4gdW5z
aWduZWQgaW50IGZzY2FjaGVfaGFzaCh1bnNpZ25lZCBpbnQgc2FsdCwgdW5zaWduZWQgaW50ICpk
YXRhLCB1bnNpZ25lZCBpbnQgbik7CiAKZGlmZiAtLWdpdCBhL2ZzL2ZzY2FjaGUvbWFpbi5jIGIv
ZnMvZnNjYWNoZS9tYWluLmMKaW5kZXggNDIwN2Y5OGU0MDVmZC4uODVmOGNmM2EzMjNkNSAxMDA2
NDQKLS0tIGEvZnMvZnNjYWNoZS9tYWluLmMKKysrIGIvZnMvZnNjYWNoZS9tYWluLmMKQEAgLTQx
LDggKzQxLDYgQEAgc3RydWN0IGtvYmplY3QgKmZzY2FjaGVfcm9vdDsKIHN0cnVjdCB3b3JrcXVl
dWVfc3RydWN0ICpmc2NhY2hlX29iamVjdF93cTsKIHN0cnVjdCB3b3JrcXVldWVfc3RydWN0ICpm
c2NhY2hlX29wX3dxOwogCi1ERUZJTkVfUEVSX0NQVSh3YWl0X3F1ZXVlX2hlYWRfdCwgZnNjYWNo
ZV9vYmplY3RfY29uZ193YWl0KTsKLQogLyogdGhlc2UgdmFsdWVzIHNlcnZlIGFzIGxvd2VyIGJv
dW5kcywgd2lsbCBiZSBhZGp1c3RlZCBpbiBmc2NhY2hlX2luaXQoKSAqLwogc3RhdGljIHVuc2ln
bmVkIGZzY2FjaGVfb2JqZWN0X21heF9hY3RpdmUgPSA0Owogc3RhdGljIHVuc2lnbmVkIGZzY2Fj
aGVfb3BfbWF4X2FjdGl2ZSA9IDI7CkBAIC0xMzgsNyArMTM2LDYgQEAgdW5zaWduZWQgaW50IGZz
Y2FjaGVfaGFzaCh1bnNpZ25lZCBpbnQgc2FsdCwgdW5zaWduZWQgaW50ICpkYXRhLCB1bnNpZ25l
ZCBpbnQgbikKIHN0YXRpYyBpbnQgX19pbml0IGZzY2FjaGVfaW5pdCh2b2lkKQogewogCXVuc2ln
bmVkIGludCBucl9jcHVzID0gbnVtX3Bvc3NpYmxlX2NwdXMoKTsKLQl1bnNpZ25lZCBpbnQgY3B1
OwogCWludCByZXQ7CiAKIAlmc2NhY2hlX29iamVjdF9tYXhfYWN0aXZlID0KQEAgLTE2MSw5ICsx
NTgsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBmc2NhY2hlX2luaXQodm9pZCkKIAlpZiAoIWZzY2Fj
aGVfb3Bfd3EpCiAJCWdvdG8gZXJyb3Jfb3Bfd3E7CiAKLQlmb3JfZWFjaF9wb3NzaWJsZV9jcHUo
Y3B1KQotCQlpbml0X3dhaXRxdWV1ZV9oZWFkKCZwZXJfY3B1KGZzY2FjaGVfb2JqZWN0X2Nvbmdf
d2FpdCwgY3B1KSk7Ci0KIAlyZXQgPSBmc2NhY2hlX3Byb2NfaW5pdCgpOwogCWlmIChyZXQgPCAw
KQogCQlnb3RvIGVycm9yX3Byb2M7CmRpZmYgLS1naXQgYS9mcy9mc2NhY2hlL29iamVjdC5jIGIv
ZnMvZnNjYWNoZS9vYmplY3QuYwppbmRleCA2YTY3NTY1MjEyOWIyLi43YTk3MmQxNDRiNTQ2IDEw
MDY0NAotLS0gYS9mcy9mc2NhY2hlL29iamVjdC5jCisrKyBiL2ZzL2ZzY2FjaGUvb2JqZWN0LmMK
QEAgLTc5OCw2ICs3OTgsOCBAQCB2b2lkIGZzY2FjaGVfb2JqZWN0X2Rlc3Ryb3koc3RydWN0IGZz
Y2FjaGVfb2JqZWN0ICpvYmplY3QpCiB9CiBFWFBPUlRfU1lNQk9MKGZzY2FjaGVfb2JqZWN0X2Rl
c3Ryb3kpOwogCitzdGF0aWMgREVDTEFSRV9XQUlUX1FVRVVFX0hFQUQoZnNjYWNoZV9vYmplY3Rf
Y29uZ193YWl0KTsKKwogLyoKICAqIGVucXVldWUgYW4gb2JqZWN0IGZvciBtZXRhZGF0YS10eXBl
IHByb2Nlc3NpbmcKICAqLwpAQCAtODA2LDE2ICs4MDgsMTIgQEAgdm9pZCBmc2NhY2hlX2VucXVl
dWVfb2JqZWN0KHN0cnVjdCBmc2NhY2hlX29iamVjdCAqb2JqZWN0KQogCV9lbnRlcigie09CSiV4
fSIsIG9iamVjdC0+ZGVidWdfaWQpOwogCiAJaWYgKGZzY2FjaGVfZ2V0X29iamVjdChvYmplY3Qs
IGZzY2FjaGVfb2JqX2dldF9xdWV1ZSkgPj0gMCkgewotCQl3YWl0X3F1ZXVlX2hlYWRfdCAqY29u
Z193cSA9Ci0JCQkmZ2V0X2NwdV92YXIoZnNjYWNoZV9vYmplY3RfY29uZ193YWl0KTsKIAogCQlp
ZiAocXVldWVfd29yayhmc2NhY2hlX29iamVjdF93cSwgJm9iamVjdC0+d29yaykpIHsKIAkJCWlm
IChmc2NhY2hlX29iamVjdF9jb25nZXN0ZWQoKSkKLQkJCQl3YWtlX3VwKGNvbmdfd3EpOworCQkJ
CXdha2VfdXAoJmZzY2FjaGVfb2JqZWN0X2Nvbmdfd2FpdCk7CiAJCX0gZWxzZQogCQkJZnNjYWNo
ZV9wdXRfb2JqZWN0KG9iamVjdCwgZnNjYWNoZV9vYmpfcHV0X3F1ZXVlKTsKLQotCQlwdXRfY3B1
X3Zhcihmc2NhY2hlX29iamVjdF9jb25nX3dhaXQpOwogCX0KIH0KIApAQCAtODMzLDE2ICs4MzEs
MTUgQEAgdm9pZCBmc2NhY2hlX2VucXVldWVfb2JqZWN0KHN0cnVjdCBmc2NhY2hlX29iamVjdCAq
b2JqZWN0KQogICovCiBib29sIGZzY2FjaGVfb2JqZWN0X3NsZWVwX3RpbGxfY29uZ2VzdGVkKHNp
Z25lZCBsb25nICp0aW1lb3V0cCkKIHsKLQl3YWl0X3F1ZXVlX2hlYWRfdCAqY29uZ193cSA9IHRo
aXNfY3B1X3B0cigmZnNjYWNoZV9vYmplY3RfY29uZ193YWl0KTsKIAlERUZJTkVfV0FJVCh3YWl0
KTsKIAogCWlmIChmc2NhY2hlX29iamVjdF9jb25nZXN0ZWQoKSkKIAkJcmV0dXJuIHRydWU7CiAK
LQlhZGRfd2FpdF9xdWV1ZV9leGNsdXNpdmUoY29uZ193cSwgJndhaXQpOworCWFkZF93YWl0X3F1
ZXVlX2V4Y2x1c2l2ZSgmZnNjYWNoZV9vYmplY3RfY29uZ193YWl0LCAmd2FpdCk7CiAJaWYgKCFm
c2NhY2hlX29iamVjdF9jb25nZXN0ZWQoKSkKIAkJKnRpbWVvdXRwID0gc2NoZWR1bGVfdGltZW91
dCgqdGltZW91dHApOwotCWZpbmlzaF93YWl0KGNvbmdfd3EsICZ3YWl0KTsKKwlmaW5pc2hfd2Fp
dCgmZnNjYWNoZV9vYmplY3RfY29uZ193YWl0LCAmd2FpdCk7CiAKIAlyZXR1cm4gZnNjYWNoZV9v
YmplY3RfY29uZ2VzdGVkKCk7CiB9Ci0tIAoyLjMzLjEKCgotLQpMaW51eC1jYWNoZWZzIG1haWxp
bmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZz

