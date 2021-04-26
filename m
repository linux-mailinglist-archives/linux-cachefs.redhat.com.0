Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B50BD36BCA5
	for <lists+linux-cachefs@lfdr.de>; Tue, 27 Apr 2021 02:26:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-izZnkvVkPQSZxHOI4iiZwg-1; Mon, 26 Apr 2021 20:26:52 -0400
X-MC-Unique: izZnkvVkPQSZxHOI4iiZwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E90A28189CA;
	Tue, 27 Apr 2021 00:26:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9CEB2B1A7;
	Tue, 27 Apr 2021 00:26:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4A3A1806D1A;
	Tue, 27 Apr 2021 00:26:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13QMHd8D002975 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 26 Apr 2021 18:17:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5CBB89F64; Mon, 26 Apr 2021 22:17:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast01.extmail.prod.ext.phx2.redhat.com [10.5.110.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 555D160C4A
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 22:17:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC5C11006C88
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 22:17:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-173-uAuAJBjGPmScGfu7fXOR_A-1;
	Mon, 26 Apr 2021 18:17:31 -0400
X-MC-Unique: uAuAJBjGPmScGfu7fXOR_A-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8DE061009;
	Mon, 26 Apr 2021 22:17:27 +0000 (UTC)
Message-ID: <728b55601fa54449cd43a35195641c00fbe6c096.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, Matthew Wilcox <willy@infradead.org>
Date: Mon, 26 Apr 2021 18:17:26 -0400
In-Reply-To: <3737237.1619472003@warthog.procyon.org.uk>
References: <20210426210939.GS235567@casper.infradead.org>
	<161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<3726642.1619471184@warthog.procyon.org.uk>
	<3737237.1619472003@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13QMHd8D002975
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 26 Apr 2021 20:26:43 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, Christoph,
	Steve French <sfrench@samba.org>, linux-kernel@vger.kernel.org,
	Mike, linux-afs@lists.infradead.org, linux-mm@kvack.org,
	Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, Hellwig <hch@lst.de>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Marshall <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] [PATCH v2] netfs: Miscellaneous fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIxLTA0LTI2IGF0IDIyOjIwICswMTAwLCBEYXZpZCBIb3dlbGxzIHdyb3RlOgo+
IE9rYXksIGhvdyBhYm91dCB0aGUgYXR0YWNoZWQsIHRoZW4/Cj4gCj4gRGF2aWQKPiAtLS0KPiBu
ZXRmczogTWlzY2VsbGFuZW91cyBmaXhlcwo+IMKgwqDCoMKgCj4gCj4gCj4gCj4gRml4IHNvbWUg
bWlzY2VsbGFuZW91cyB0aGluZ3MgaW4gdGhlIG5ldyBuZXRmcyBsaWJbMV06Cj4gCj4gwqAoMSkg
VGhlIGtlcm5lbGRvYyBmb3IgbmV0ZnNfcmVhZHBhZ2UoKSBzaG91bGRuJ3Qgc2F5IG5ldGZzX3Bh
Z2UoKS4KPiAKPiDCoCgyKSBuZXRmc19yZWFkcGFnZSgpIGNhbiBnZXQgYW4gaW50ZWdlciBvdmVy
ZmxvdyBvbiAzMi1iaXQgd2hlbiBpdAo+IMKgwqDCoMKgwqBtdWx0aXBsaWVzIHBhZ2VfaW5kZXgo
cGFnZSkgYnkgUEFHRV9TSVpFLiAgSXQgc2hvdWxkIHVzZQo+IMKgwqDCoMKgwqBwYWdlX2ZpbGVf
b2Zmc2V0KCkgaW5zdGVhZC4KPiAKPiDCoCgzKSBuZXRmc193cml0ZV9iZWdpbigpIHNob3VsZCB1
c2UgcGFnZV9vZmZzZXQoKSB0byBhdm9pZCB0aGUgc2FtZQo+IMKgwqDCoMKgwqBvdmVyZmxvdy4K
PiAKPiBOb3RlIHRoYXQgbmV0ZnNfcmVhZHBhZ2UoKSBuZWVkcyB0byB1c2UgcGFnZV9maWxlX29m
ZnNldCgpIHJhdGhlciB0aGFuCj4gcGFnZV9vZmZzZXQoKSBhcyBpdCBtYXkgc2VlIHN3YXAtb3Zl
ci1ORlMuCj4gCj4gUmVwb3J0ZWQtYnk6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQu
b3JnPgo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEhvd2VsbHMgPGRob3dlbGxzQHJlZGhhdC5jb20+
Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8xNjE3ODkwNjIxOTAuNjE1NS4xMjcx
MTU4NDQ2NjMzODQ5MzA1MC5zdGdpdEB3YXJ0aG9nLnByb2N5b24ub3JnLnVrLyBbMV0KPiAtLS0K
PiDCoGZzL25ldGZzL3JlYWRfaGVscGVyLmMgfCAgICA2ICsrKy0tLQo+IMKgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZnMv
bmV0ZnMvcmVhZF9oZWxwZXIuYyBiL2ZzL25ldGZzL3JlYWRfaGVscGVyLmMKPiBpbmRleCAxZDNi
NTBjNWRiNmQuLjE5Mzg0MWQwM2RlMCAxMDA2NDQKPiAtLS0gYS9mcy9uZXRmcy9yZWFkX2hlbHBl
ci5jCj4gKysrIGIvZnMvbmV0ZnMvcmVhZF9oZWxwZXIuYwo+IEBAIC05MzMsNyArOTMzLDcgQEAg
dm9pZCBuZXRmc19yZWFkYWhlYWQoc3RydWN0IHJlYWRhaGVhZF9jb250cm9sICpyYWN0bCwKPiDC
oEVYUE9SVF9TWU1CT0wobmV0ZnNfcmVhZGFoZWFkKTsKPiDCoAo+IAo+IAo+IAo+IMKgLyoqCj4g
LSAqIG5ldGZzX3BhZ2UgLSBIZWxwZXIgdG8gbWFuYWdlIGEgcmVhZHBhZ2UgcmVxdWVzdAo+ICsg
KiBuZXRmc19yZWFkcGFnZSAtIEhlbHBlciB0byBtYW5hZ2UgYSByZWFkcGFnZSByZXF1ZXN0Cj4g
wqDCoCogQGZpbGU6IFRoZSBmaWxlIHRvIHJlYWQgZnJvbQo+IMKgwqAqIEBwYWdlOiBUaGUgcGFn
ZSB0byByZWFkCj4gwqDCoCogQG9wczogVGhlIG5ldHdvcmsgZmlsZXN5c3RlbSdzIG9wZXJhdGlv
bnMgZm9yIHRoZSBoZWxwZXIgdG8gdXNlCj4gQEAgLTk2OCw3ICs5NjgsNyBAQCBpbnQgbmV0ZnNf
cmVhZHBhZ2Uoc3RydWN0IGZpbGUgKmZpbGUsCj4gwqAJCXJldHVybiAtRU5PTUVNOwo+IMKgCX0K
PiDCoAlycmVxLT5tYXBwaW5nCT0gcGFnZV9maWxlX21hcHBpbmcocGFnZSk7Cj4gLQlycmVxLT5z
dGFydAk9IHBhZ2VfaW5kZXgocGFnZSkgKiBQQUdFX1NJWkU7Cj4gKwlycmVxLT5zdGFydAk9IHBh
Z2VfZmlsZV9vZmZzZXQocGFnZSk7Cj4gwqAJcnJlcS0+bGVuCT0gdGhwX3NpemUocGFnZSk7Cj4g
wqAKPiAKPiAKPiAKPiDCoAlpZiAob3BzLT5iZWdpbl9jYWNoZV9vcGVyYXRpb24pIHsKPiBAQCAt
MTEwNiw3ICsxMTA2LDcgQEAgaW50IG5ldGZzX3dyaXRlX2JlZ2luKHN0cnVjdCBmaWxlICpmaWxl
LCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiDCoAlpZiAoIXJyZXEpCj4gwqAJCWdv
dG8gZXJyb3I7Cj4gwqAJcnJlcS0+bWFwcGluZwkJPSBwYWdlLT5tYXBwaW5nOwo+IC0JcnJlcS0+
c3RhcnQJCT0gcGFnZS0+aW5kZXggKiBQQUdFX1NJWkU7Cj4gKwlycmVxLT5zdGFydAkJPSBwYWdl
X29mZnNldChwYWdlKTsKPiDCoAlycmVxLT5sZW4JCT0gdGhwX3NpemUocGFnZSk7Cj4gwqAJcnJl
cS0+bm9fdW5sb2NrX3BhZ2UJPSBwYWdlLT5pbmRleDsKPiDCoAlfX3NldF9iaXQoTkVURlNfUlJF
UV9OT19VTkxPQ0tfUEFHRSwgJnJyZXEtPmZsYWdzKTsKPiAKClJldmlld2VkLWJ5OiBKZWZmIExh
eXRvbiA8amxheXRvbkBrZXJuZWwub3JnPgoKCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0
CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnM=

