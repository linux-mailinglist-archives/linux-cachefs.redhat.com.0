Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 0238718C930
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Mar 2020 09:49:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584694191;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IQZcyBbrJpaF5wzN3dfK1+7pj6l59SNs5tIh1qMZucc=;
	b=XNvA4iFFkjksZei4u+HoLCEG/ccHPyYAAWR3lsOmYFlvqUlGDULls+oD5w3fM2Pyn66jTr
	9czZBemc/M+mUj5WOWS/t6LNaacs6u9FCdzGmdn+2mnXzKaBB6rahDHEBVtC+VUqYhtgzc
	DJM0dDDHiOqnXWVT1hb9WylMsxAw2gc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-J1hdMYItNd6e3wCFBrLIiQ-1; Fri, 20 Mar 2020 04:49:50 -0400
X-MC-Unique: J1hdMYItNd6e3wCFBrLIiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC289800D4E;
	Fri, 20 Mar 2020 08:49:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB3B860304;
	Fri, 20 Mar 2020 08:49:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB10094297;
	Fri, 20 Mar 2020 08:49:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02K8nVKt010121 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Mar 2020 04:49:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B7926EFBF; Fri, 20 Mar 2020 08:49:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com
	[10.10.113.126])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 491D273876;
	Fri, 20 Mar 2020 08:49:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <83da0eec-7688-c56c-65f1-de4539cede88@hovedpuden.dk>
References: <83da0eec-7688-c56c-65f1-de4539cede88@hovedpuden.dk>
To: =?us-ascii?Q?=3D=3FUTF-8=3FQ=3FJohn=5FDamm=5FS=3Dc3=3Db8rensen=3F=3D?=
	<john@hovedpuden.dk>
MIME-Version: 1.0
Date: Fri, 20 Mar 2020 08:49:26 +0000
Message-ID: <3253541.1584694166@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02K8nVKt010121
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] Is anybody working on cachefilesd issues?
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Sm9obiBEYW1tIFPDuHJlbnNlbiA8am9obkBob3ZlZHB1ZGVuLmRrPiB3cm90ZToKCj4gSSByZWNl
bnRseSBmaWxlZCBhIGJ1ZyBmb3IgdGhlIGNhY2hlZmlsZXNkIHVzZWQgd2l0aCBDZW50b3MgNyBi
dXQgaXQgc2VlbXMKPiBsaWtlIG5vYm9keSBoYXMgYmVlbiBhc3NpZ25lZCB0byB0aGUgYnVnLgo+
IAo+IElzIGNhY2hlZmlsZXNkIG5vIGxvbmdlciBhbiBhY3RpdmUgcHJvamVjdD8KCkknbSB0cnlp
bmcgdG8gb3ZlcmhhdWwgdGhlIHdob2xlIHRoaW5nIHRvIG1ha2UgaXQgbGVzcyBmcmFnaWxlIGlu
c2lkZSB0aGUKa2VybmVsLiAgVGhlIHByb2JsZW0gaW4gdGhlIHVwc3RyZWFtIGtlcm5lbCBjb2Rl
IGlzIHRoYXQgaXQgZGVwZW5kcyBvbgpkZWxpY2F0ZSBzbm9vcGluZyBvZiB3YWtlLXVwIHF1ZXVl
cyB0aGF0IHRoZSBiYWNraW5nIGZpbGVzeXN0ZW0gaXMgc3VwcG9zZWQgdG8KcG9rZSB3aGVuIGl0
IGZpbmlzaGVkIGxvYWRpbmcgYSBwYWdlIGZyb20gc3RvcmFnZS4gIFVuZm9ydHVuYXRlbHksIGl0
IGFwcGVhcnMKdGhhdCB0aGlzIGRvZXNuJ3QgYWx3YXlzIHdvcmsgLSBhbmQgaXQncyBwcm92aW5n
IGltcG9zc2libGUgdG8gcGluIGRvd24gc28gZmFyCih0aGUgcHJvYmxlbSBiZWluZyB0aGF0IHRo
ZSBzeW1wdG9tcyBvZiB0aGUgYnVncyBJJ20gdHJ5aW5nIHRvIGZpbmQgYXJlCnNob3dpbmcgdXAg
c28gbG9uZyBhZnRlciB0aGUgYWN0dWFsIGJ1ZyB0aGF0IHRoZSB0cmFjZSBidWZmZXIgY2FuJ3Qg
YmUgbWFkZQpiaWcgZW5vdWdoKS4KClRoZSB1cHN0cmVhbSBjb2RlIGlzIGFsc28gc2xvdyBhcyBp
dCBpbnRyb2R1Y2VzIGV4dHJhIGNvcGllcyBhbmQgVk0gcHJlc3N1cmUKdGhhdCB0aGUgc3lzdGVt
IGhhcyB0cm91YmxlIGFjY291bnRpbmcgZm9yLiAgSSd2ZSBhbHNvIGJlZW4gdXNpbmcgdGhlIGJt
YXAKaW50ZXJmYWNlIHRvIHByb2JlIHRoZSBiYWNraW5nIGZpbGVzeXN0ZW0gdG8gZmluZCBvdXQg
aWYgdGhlcmUncyBhIGJsb2NrCnByZXNlbnQgaW4gdGhlIGNhY2hlIGZpbGUgLSBidXQgdGhhdCdz
IG5vdCB2aWFibGUgd2l0aCBtb2Rlcm4gZXh0ZW50LWJhc2VkCmZpbGVzeXN0ZW1zIGFuZCBjYW4g
bGVhZCB0byBjb3JydXB0aW9uIGJ5IGludGVycG9sYXRpb24gb2YgYmxvY2tzIG9mIHplcm9zCmZy
b20gYnJpZGdpbmcgYmxvY2tzIGFkZGVkIGluIHRvIGFuIGV4dGVudC4KCkhvd2V2ZXIsIHNpbmNl
IEkgd3JvdGUgdGhlIGNhY2hlZmlsZXMgZHJpdmVyLCBhIG5ldyBpbnRlcmZhY2UgaW5zaWRlIHRo
ZQprZXJuZWwgKGtpb2NiKSBoYXMgY29tZSBhbG9uZyB0aGF0IGFsbG93cyBtZSB0byBwZXJmb3Jt
IGFzeW5jaHJvbm91cywgZGlyZWN0CkkvTyB0byB0aGUgYmFja2luZyBkZXZpY2UgLSBidXQgdG8g
dXNlIGl0IEkgaGF2ZSB0byBjb21wbGV0ZWx5IGNoYW5nZSB0aGUKY2FjaGUgSS9PIEFQSSB1c2Vk
IGJ5IG5ldHdvcmsgZmlsZXN5c3RlbXMuICBUaGUgZ29vZCBuZXdzIGl0IHRoYXQgaXQncyBhIGxv
dApmYXN0ZXIsIHNpbXBsZXIsIHdheSBsZXNzIGNvZGUgKDMtNDAwMCBsaW5lcyBsZXNzKSBhbmQg
cHJlc3N1cmVzIHRoZSBWTSBhIGxvdApsZXNzLgoKCWh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L2Rob3dlbGxzL2xpbnV4LWZzLmdpdC9sb2cvP2g9ZnNjYWNo
ZS1pdGVyCgpIb3dldmVyLCB0aGF0J3MganVzdCB0aGUgZmlyc3QgcGhhc2UuCgpUaGUgc2Vjb25k
IHBoYXNlIGlzIGdvaW5nIHRvIGludm9sdmUgY2hhbmdpbmcgdGhlIHdheSBzcGFjZSBpcyBtYW5h
Z2VkIGFuZApjdWxsaW5nIGlzIGRvbmUgLSBhbmQgdGhpcyBpcyBnb2luZyB0byBpbXBhY3QgY2Fj
aGVmaWxlc2QuICBUaGUgY3VsbGluZwphbGdvcml0aG0gd2lsbCBuZWVkIHRvIG1vdmUgaW50byB0
aGUga2VybmVsLCBJIHRoaW5rLCBhbmQgd2lsbCBiZSBkb25lIHRocm91Z2gKYW4gaW5kZXggZmls
ZS4gIEl0IG5lZWRzIGNhcmVmdWwgdGhvdWdodCBiZWNhdXNlIEkgaGF2ZSBzaXR1YXRpb25zIHdo
ZXJlIEkKbmVlZCB0byBoYW5kbGUgYW55dGhpbmcgZnJvbSBhIGZldyBmaWxlcyB0byBhIGNvdXBs
ZSBvZiBtaWxsaW9uLiAgSXQgbWF5IGJlCnRoYXQgdGhlIGJlc3Qgc3RyYXRlZ3kgaW4gc3VjaCBh
IGxhcmdlIGNhc2UgaXMgbm90IHRvIGN1bGwgYXV0b21hdGljYWxseSBhdAphbGwuCgpUaGUgdGhp
cmQgcGhhc2UgaXMgZ29pbmcgdG8gaW52b2x2ZSBhZGRpbmcgZGlzY29ubmVjdGVkIG9wZXJhdGlv
biBzdXBwb3J0IC0KYW5kIHRoYXQgd2lsbCBwcm9iYWJseSByZXF1aXJlIHlldCBtb3JlIGNoYW5n
ZXMgdG8gY2FjaGVmaWxlc2QuCgpEYXZpZAoKLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QK
TGludXgtY2FjaGVmc0ByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1jYWNoZWZz

