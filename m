Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E5660310E44
	for <lists+linux-cachefs@lfdr.de>; Fri,  5 Feb 2021 18:02:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612544555;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iAbthB6XVpkeKDafVkz69YMi9u34/CMvEyxVqrBgKbU=;
	b=LgWv4mdmsBFtLR2cFCBtcEwf2dmMY9EORyNYEkYtDGoQTIr7+k+C1mDjBBJfWWADH8RTBh
	2Sh3Sh6Aj6fMV4JDH/NVlaF2GNkbDVuigz9UU3h+BjhDint5VIdZAJoEMc82BJPFi6nYMZ
	+eW4ZlGhiEH9PGGXhPbnrLV4wAEj1YU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-0oyJHskTNaCNlbHxppiO4A-1; Fri, 05 Feb 2021 12:02:33 -0500
X-MC-Unique: 0oyJHskTNaCNlbHxppiO4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58051192AB78;
	Fri,  5 Feb 2021 17:02:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0281E5D6AB;
	Fri,  5 Feb 2021 17:02:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C20F657DFA;
	Fri,  5 Feb 2021 17:02:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 115H2LJ4032337 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 5 Feb 2021 12:02:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AB0BA19712; Fri,  5 Feb 2021 17:02:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D00E1A353;
	Fri,  5 Feb 2021 17:02:14 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
MIME-Version: 1.0
Date: Fri, 05 Feb 2021 17:02:14 +0000
Message-ID: <2522190.1612544534@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 115H2LJ4032337
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] Upcoming for next merge window: fscache and netfs
	lib
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

CkhpIExpbnVzLAoKVG8gYXBwcmlzZSB5b3UgaW4gYWR2YW5jZSwgSSdtIGludGVuZGluZyB0byBz
dWJtaXQgYSBwdWxsIHJlcXVlc3QgZm9yIGEKcGFydGlhbCBtb2Rlcm5pc2F0aW9uIG9mIHRoZSBm
c2NhY2hlIEkvTyBzdWJzeXN0ZW0sIHdoaWNoIGNhbiBiZSBmb3VuZCBoZXJlOgoKCWh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Rob3dlbGxzL2xpbnV4LWZz
LmdpdC9sb2cvP2g9ZnNjYWNoZS1uZXh0CgpUaGUgbWFpbiBwYXJ0cyBvZiBpdCBhcmU6CgogKDEp
IEluc3RpdHV0ZSBhIGhlbHBlciBsaWJyYXJ5IGZvciBuZXR3b3JrIGZpbGVzeXN0ZW1zLiAgVGhl
IGZpcnN0IHN0YWdlIG9mCiAgICAgdGhpcyBoYW5kbGVzIC0+cmVhZHBhZ2UoKSwgLT5yZWFkYWhl
YWQoKSBhbmQgcGFydCBvZiAtPndyaXRlX2JlZ2luKCkgb24KICAgICBiZWhhbGYgb2YgdGhlIG5l
dGZzLCByZXF1aXJpbmcgdGhlIG5ldGZzIHRvIHByb3ZpZGUgYSB2ZWN0b3IgdG8gcGVyZm9ybSBh
CiAgICAgcmVhZCB0byBzb21lIHBhcnQgb2YgYW4gaW5vZGUuCgogICAgIFRoaXMgYWxsb3dzIGhh
bmRsaW5nIG9mIHRoZSBmb2xsb3dpbmcgdG8gYmUgKGF0IGxlYXN0IHBhcnRpYWxseSkgbW92ZWQK
ICAgICBvdXQgb2YgYWxsIHRoZSBuZXR3b3JrIGZpbGVzeXN0ZW1zIGFuZCBjb25zb2xpZGF0ZWQg
aW4gb25lIHBsYWNlOgoKCS0gY2hhbmdlcyBpbiBWTSB2ZWN0b3JzIChNYXR0aGV3IFdpbGNveCdz
IEdyYW5kIFBsYW5z4oSiOy0pCgkgIC0gdHJhbnNwYXJlbnQgaHVnZSBwYWdlIHN1cHBvcnQKCS0g
c2hhcGluZyBvZiByZWFkcwoJICAtIHJlYWRhaGVhZCBleHBhbnNpb24KCSAgLSBmcyBhbGlnbm1l
bnQvZ3JhbnVsYXJpdHkgKGNlcGgsIHBuZnMpCgkgIC0gY2FjaGUgYWxpZ25tZW50L2dyYW51bGFy
aXR5CgktIHNsaWNpbmcgb2YgcmVhZHMKCSAgLSByc2l6ZQoJICAtIGtlZXBpbmcgbXVsdGlwbGUg
cmVhZCBpbiBmbGlnaHQJfSBTdGV2ZSBGcmVuY2ggd291bGQgbGlrZQoJICAtIG11bHRpY2hhbm5l
bCBkaXN0cmlidXRpb24JCX0gYnV0IGZvciB0aGUgZnV0dXJlCgkgIC0gbXVsdGlzZXJ2ZXIgZGlz
dHJpYnV0aW9uIChjZXBoLCBwbmZzKQoJICAtIHN0aXRjaGluZyB0b2dldGhlciByZWFkcyBmcm9t
IHRoZSBjYWNoZSBhbmQgcmVhZHMgZnJvbSB0aGUgbmV0d29yawoJLSBzYXZpbmcgZGF0YSByZWFk
IGZyb20gdGhlIHNlcnZlciBpbnRvIHRoZSBjYWNoZQoJLSByZXRyeS9yZWlzc3VlIGhhbmRsaW5n
CgkgIC0gZmFsbGJhY2sgYWZ0ZXIgY2FjaGUgZmFpbHVyZQogICAgIAktIHNob3J0IHJlYWRzCgkt
IGZzY3J5cHQgZGF0YSBkZWNyeXB0aW9uIChKZWZmIExheXRvbiBpcyBjb25zaWRlcmluZyBmb3Ig
dGhlIGZ1dHVyZSkKCiAoMikgQWRkIGFuIGFsdGVybmF0ZSBjYWNoZSBJL08gQVBJIGZvciB1c2Ug
d2l0aCB0aGUgbmV0ZnMgbGliIHRoYXQgbWFrZXMgdXNlCiAgICAgb2Yga2lvY2JzIGluIHRoZSBj
YWNoZSB0byBkbyBkaXJlY3QgSS9PIGJldHdlZW4gdGhlIGNhY2hlIGZpbGVzIGFuZCB0aGUKICAg
ICBuZXRmcyBwYWdlcy4KCiAgICAgVGhpcyBpcyBpbnRlbmRlZCB0byByZXBsYWNlIHRoZSBjdXJy
ZW50IEkvTyBBUEkgdGhhdCBjYWxscyB0aGUgYmFja2luZyBmcwogICAgIHJlYWRwYWdlIG9wIGFu
ZCB0aGFuIHNub29waW5nIHRoZSB3YWl0IHF1ZXVlcyBmb3IgY29tcGxldGlvbiB0byByZWFkIGFu
ZAogICAgIHVzaW5nIHZmc193cml0ZSgpIHRvIHdyaXRlLiAgSXQgd2Fzbid0IHBvc3NpYmxlIHRv
IGRvIGluLWtlcm5lbCBESU8gd2hlbgogICAgIEkgZmlyc3Qgd3JvdGUgY2FjaGVmaWxlcyAtIGFu
ZCB0aGlzIG1ha2VzIGl0IGEgbG90IHNpbXBsZXIgYW5kIG1vcmUKICAgICByb2J1c3QgKGFuZCB1
c2VzIGEgbG90IGxlc3MgbWVtb3J5KS4KCiAoMykgQWRkIGFuIElURVJfWEFSUkFZIGlvdl9pdGVy
IHRoYXQgYWxsb3dzIEkvTyBpdGVyYXRpb24gdG8gYmUgZG9uZSBvbiBhbgogICAgIHhhcnJheSBv
ZiBwaW5uZWQgcGFnZXMgKHN1Y2ggYXMgaW5vZGUtPmlfbWFwcGluZy0+aV9wYWdlcyksIHRoZXJl
YnkKICAgICBhdm9pZGluZyB0aGUgbmVlZCB0byBhbGxvY2F0ZSBhIGJ2ZWMgYXJyYXkgdG8gcmVw
cmVzZW50IHRoaXMuCgogICAgIFRoaXMgaXMgdXNlZCB0byBwcmVzZW50IGEgc2V0IG9mIG5ldGZz
IHBhZ2VzIHRvIHRoZSBjYWNoZSB0byBkbyBESU8gb24KICAgICBhbmQgaXMgYWxzbyB1c2VkIGJ5
IGFmcyB0byBwcmVzZW50IG5ldGZzIHBhZ2VzIHRvIHNlbmRtc2cuICBJdCBjb3VsZCBhbHNvCiAg
ICAgYmUgdXNlZCBieSB1bmVuY3J5cHRlZCBjaWZzIHRvIHBhc3MgdGhlIHBhZ2VzIHRvIHRoZSBU
Q1Agc29ja2V0IGl0IHVzZXMKICAgICAoaWYgaXQncyBkb2luZyBUQ1ApIGFuZCBteSBwYXRjaCBm
b3IgOXAgKHdoaWNoIGlzbid0IGluY2x1ZGVkIGhlcmUpIGNhbgogICAgIG1ha2UgdXNlIG9mIGl0
LgoKICg0KSBNYWtlIGFmcyB1c2UgdGhlIGFib3ZlLiAgSXQgcGFzc2VzIHRoZSBzYW1lIHhmc3Rl
c3RzIChhbmQgaGFzIHRoZSBzYW1lCiAgICAgZmFpbHVyZXMpIGFzIHRoZSB1bnBhdGNoZWQgYWZz
IGNsaWVudC4KCiAoNSkgTWFrZSBjZXBoIHVzZSB0aGUgYWJvdmUgKEkndmUgbWVyZ2VkIGEgYnJh
bmNoIGZyb20gSmVmZiBMYXl0b24gZm9yIHRoaXMpLgogICAgIFRoaXMgYWxzbyBwYXNzZXMgeGZz
dGVzdHMuCgpEYXZlIFd5c29jaGFuc2tpIGhhcyBhIHBhdGNoIHNlcmllcyBmb3IgbmZzLiAgTm9y
bWFsIG5mcyB3b3JrcyBmaW5lIGFuZCBwYXNzZXMKdmFyaW91cyB0ZXN0cywgYnV0IGl0IHR1cm5l
ZCBvdXQgcG5mcyBoYXMgYSBwcm9ibGVtIC0gcG5mcyBkb2VzIHNwbGl0dGluZyBvZgpyZXF1ZXN0
cyBpdHNlbGYgYW5kIHNlbmRpbmcgdGhlbSB0byB2YXJpb3VzIHBsYWNlcywgYnV0IGl0IG5lZWRz
IHRvIGNvb3BlcmF0ZQptb3JlIGNsb3NlbHkgd2l0aCBuZXRmcyBvdmVyIHRoaXMuICBIZSdzIHdv
cmtpbmcgb24gdGhpcy4KCkkndmUgZ2l2ZW4gRG9taW5pcXVlIE1hcnRpbmV0IGEgcGF0Y2ggZm9y
IDlwIGFuZCBTdGV2ZSBGcmVuY2ggYSBwYXJ0aWFsIHBhdGNoCmZvciBjaWZzLCBidXQgbmVpdGhl
ciBvZiB0aG9zZSBpcyBnb2luZyB0byBiZSByZWFkeSB0aGlzIG1lcmdlIHdpbmRvdyBlaXRoZXIu
Cgotfi0KCkFzc3VtaW5nIHlvdSdyZSB3aWxsaW5nIHRvIHRha2UgdGhpcywgc2hvdWxkIEkgc3Vi
bWl0IG9uZSBwdWxsIHJlcXVlc3QgZm9yIHRoZQpjb21iaW5lZCBsb3QsIG9yIHNob3VsZCBJIGJy
ZWFrIGl0IHVwIGludG8gc21hbGxlciByZXF1ZXN0cyAoc2F5IHdpdGggYQpzZXBhcmF0ZSByZXF1
ZXN0IGZyb20gSmVmZiBmb3IgdGhlIGNlcGggc3R1ZmYpLgoKSWYgd2UgY2FuIGdldCB0aGUgbmV0
ZnMgbGliIGluIHRoaXMgbWVyZ2Ugd2luZG93LCB0aGF0IHNpbXBsaWZpZXMgZGVhbGluZyB3aXRo
Cm5mcyBhbmQgY2lmcyBwYXJ0aWN1bGFybHkgYXMgdGhlIGNoYW5nZXMgc3BlY2lmaWMgdG8gdGhv
c2UgY2FuIGdvIHRocm91Z2ggdGhlCm1haW50YWluZXIgdHJlZXMuCgpUaGFua3MsCkRhdmlkCgot
LQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0
cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnM=

