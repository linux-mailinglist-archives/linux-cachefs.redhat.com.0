Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 13DE0254611
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Aug 2020 15:38:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-C_qw_TxvMruJ3iFbh--Y7A-1; Thu, 27 Aug 2020 09:38:24 -0400
X-MC-Unique: C_qw_TxvMruJ3iFbh--Y7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65E0810ABDC3;
	Thu, 27 Aug 2020 13:38:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 201FE1002D69;
	Thu, 27 Aug 2020 13:38:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63A7C60376;
	Thu, 27 Aug 2020 13:38:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07HJPKsh028925 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 15:25:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7195C8A4C2; Mon, 17 Aug 2020 19:25:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69CF98A4D4
	for <linux-cachefs@redhat.com>; Mon, 17 Aug 2020 19:25:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B9C3102F1E3
	for <linux-cachefs@redhat.com>; Mon, 17 Aug 2020 19:25:15 +0000 (UTC)
Received: from hr2.samba.org (hr2.samba.org [144.76.82.148]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-378-IUnTPQeoMDKBbh-6PodV1g-1;
	Mon, 17 Aug 2020 15:25:10 -0400
X-MC-Unique: IUnTPQeoMDKBbh-6PodV1g-1
Received: from [127.0.0.2] (localhost [127.0.0.1])
	by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
	(Exim) id 1k7kU0-0005ga-CN; Mon, 17 Aug 2020 19:07:48 +0000
To: Jeff Layton <jlayton@redhat.com>, David Wysochanski <dwysocha@redhat.com>,
	David Howells <dhowells@redhat.com>
References: <447452.1596109876@warthog.procyon.org.uk>
	<1851200.1596472222@warthog.procyon.org.uk>
	<667820.1597072619@warthog.procyon.org.uk>
	<CAH2r5msKipj1exNUDaSUN7h0pjanOenhSg2=EWYMv_h15yKtxg@mail.gmail.com>
	<672169.1597074488@warthog.procyon.org.uk>
	<CALF+zO=DkGmNDrrr-WxU6L1Xw8MA4+NrqVbvNMctwSKjy0Yh_w@mail.gmail.com>
	<fecc577d696f9cd58bbb2fae437c8acea170f7bf.camel@redhat.com>
From: Steven French <sfrench@samba.org>
Message-ID: <dfa2aede-3a42-2b04-1d31-93a670a785cc@samba.org>
Date: Mon, 17 Aug 2020 14:07:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fecc577d696f9cd58bbb2fae437c8acea170f7bf.camel@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 27 Aug 2020 09:38:14 -0400
Cc: CIFS <linux-cifs@vger.kernel.org>, linux-nfs <linux-nfs@vger.kernel.org>,
	linux-afs@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <smfrench@gmail.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [GIT PULL] fscache rewrite -- please drop for
	now
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Content-Language: en-US

Ck9uIDgvMTAvMjAgMTI6MDYgUE0sIEplZmYgTGF5dG9uIHdyb3RlOgo+IE9uIE1vbiwgMjAyMC0w
OC0xMCBhdCAxMjozNSAtMDQwMCwgRGF2aWQgV3lzb2NoYW5za2kgd3JvdGU6Cj4+IE9uIE1vbiwg
QXVnIDEwLCAyMDIwIGF0IDExOjQ4IEFNIERhdmlkIEhvd2VsbHMgPGRob3dlbGxzQHJlZGhhdC5j
b20+IHdyb3RlOgo+Pj4gU3RldmUgRnJlbmNoIDxzbWZyZW5jaEBnbWFpbC5jb20+IHdyb3RlOgo+
Pj4KPj4+PiBjaWZzLmtvIGFsc28gY2FuIHNldCByc2l6ZSBxdWl0ZSBzbWFsbCAoZXZlbiAxSyBm
b3IgZXhhbXBsZSwgYWx0aG91Z2gKPj4+PiB0aGF0IHdpbGwgYmUgbW9yZSB0aGFuIDEweCBzbG93
ZXIgdGhhbiB0aGUgZGVmYXVsdCA0TUIgc28gaG9wZWZ1bGx5IG5vCj4+Pj4gb25lIGlzIGNyYXp5
IGVub3VnaCB0byBkbyB0aGF0KS4KPj4+IFlvdSBjYW4gc2V0IHJzaXplIDwgUEFHRV9TSVpFPwo+
Pj4KPj4+PiBJIGNhbid0IGltYWdpbmUgYW4gU01CMyBzZXJ2ZXIgbmVnb3RpYXRpbmcgYW4gcnNp
emUgb3Igd3NpemUgc21hbGxlciB0aGFuCj4+Pj4gNjRLIGluIHRvZGF5J3Mgd29ybGQgKGFuZCB0
eXBpY2FsIGlzIDFNQiB0byA4TUIpIGJ1dCB0aGUgdXNlciBjYW4gc3BlY2lmeSBhCj4+Pj4gbXVj
aCBzbWFsbGVyIHJzaXplIG9uIG1vdW50LiAgSWYgNjRLIGlzIGFuIGFkZXF1YXRlIG1pbmltdW0s
IHdlIGNvdWxkIGNoYW5nZQo+Pj4+IHRoZSBjaWZzIG1vdW50IG9wdGlvbiBwYXJzaW5nIHRvIHJl
cXVpcmUgYSBjZXJ0YWluIG1pbmltdW0gcnNpemUgaWYgZnNjYWNoZQo+Pj4+IGlzIHNlbGVjdGVk
Lgo+Pj4gSSd2ZSBib3Jyb3dlZCB0aGUgMjU2SyBncmFudWxlIHNpemUgdXNlZCBieSB2YXJpb3Vz
IEFGUyBpbXBsZW1lbnRhdGlvbnMgZm9yCj4+PiB0aGUgbW9tZW50LiAgQSA1MTItYnl0ZSB4YXR0
ciBjYW4gdGh1cyBob2xkIGEgYml0bWFwIGNvdmVyaW5nIDFHIG9mIGZpbGUKPj4+IHNwYWNlLgo+
Pj4KPj4+Cj4+IElzIGl0IHBvc3NpYmxlIHRvIG1ha2UgdGhlIGdyYW51bGUgc2l6ZSBjb25maWd1
cmFibGUsIHRoZW4gcmVqZWN0IGEKPj4gcmVnaXN0cmF0aW9uIGlmIHRoZSBzaXplIGlzIHRvbyBz
bWFsbCBvciBub3QgYSBwb3dlciBvZiAyPyAgVGhlbiBhCj4+IG5ldGZzIHVzaW5nIHRoZSBBUEkg
Y291bGQgdHJ5IHRvIHNldCBlcXVhbCB0byByc2l6ZSwgYW5kIHRoZW4gZXJyb3IKPj4gb3V0IHdp
dGggYSBtZXNzYWdlIGlmIHRoZSByZWdpc3RyYXRpb24gd2FzIHJlamVjdGVkLgo+Pgo+IC4uLm9y
IG1heWJlIHdlIHNob3VsZCBqdXN0IG1ha2UgZnNjYWNoZSBpbmNvbXBhdGlibGUgd2l0aCBhbgo+
IHJzaXplIHRoYXQgaXNuJ3QgYW4gZXZlbiBtdWx0aXBsZSBvZiAyNTZrPyBZb3UgbmVlZCB0byBz
ZXQgbW91bnQgb3B0aW9ucwo+IGZvciBib3RoLCB0eXBpY2FsbHksIHNvIGl0IHdvdWxkIGJlIGZh
aXJseSB0cml2aWFsIHRvIGNoZWNrIHRoaXMgYXQKPiBtb3VudCB0aW1lLCBJJ2QgdGhpbmsuCgoK
WWVzIC0gaWYgZnNjYWNoZSBpcyBzcGVjaWZpZWQgb24gbW91bnQgaXQgd291bGQgYmUgZWFzeSB0
byByb3VuZCByc2l6ZSAKdXAgKG9yIGRvd24pLCBhdCBsZWFzdCBmb3IgY2lmcy5rbyAocGVyaGFw
cyBzaW1wbHkgaW4gdGhlIG1vdW50LmNpZnMgCmhlbHBlciBzbyBhIHdhcm5pbmcgY291bGQgYmUg
cmV0dXJuZWQgdG8gdGhlIHVzZXIpIHRvIHdoYXRldmVyIGJvdW5kYXJ5IAp5b3UgcHJlZmVyIGlu
IGZzY2FjaGUuwqDCoCBUaGUgZGVmYXVsdCBvZiA0TUIgKG9yIDFNQiBmb3IgbW91bnRzIHRvIHNv
bWUgCm9sZGVyIHNlcnZlcnMpIHNob3VsZCBiZSBmaW5lLsKgIFNpbWlsYXJseSBpZiB0aGUgdXNl
ciByZXF1ZXN0ZWQgdGhlIApkZWZhdWx0IGJ1dCB0aGUgc2VydmVyIG5lZ290aWF0ZWQgYW4gdW51
c3VhbCBzaXplLCBub3QgYSBtdWx0aXBsZSBvZiAKMjU2Sywgd2UgY291bGQgcm91bmQgdHJ5IHRv
IHJvdW5kIGl0IGRvd24gaWYgcG9zc2libGUgKG9yIGZhaWwgdGhlIG1vdW50IAppZiBub3QgcG9z
c2libGUgdG8gcm91bmQgaXQgZG93biB0byAyNTZLKS4KCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGlu
ZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVmcw==

