Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A9A7B2CE28D
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Dec 2020 00:20:32 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-oAEb9wSxMfOE1z2KCTjmRA-1; Thu, 03 Dec 2020 18:20:30 -0500
X-MC-Unique: oAEb9wSxMfOE1z2KCTjmRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD97A800D55;
	Thu,  3 Dec 2020 23:20:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80E155D6AC;
	Thu,  3 Dec 2020 23:20:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF15B4A7C6;
	Thu,  3 Dec 2020 23:20:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3NH1nj016629 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 18:17:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D5C4C11701CA; Thu,  3 Dec 2020 23:17:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D156D11701C8
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 23:16:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D481B811E76
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 23:16:58 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-255-CfuYVEdUPLODM9KuBhybeA-1;
	Thu, 03 Dec 2020 18:16:56 -0500
X-MC-Unique: CfuYVEdUPLODM9KuBhybeA-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 9353A6F73; Thu,  3 Dec 2020 18:16:55 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 9353A6F73
Date: Thu, 3 Dec 2020 18:16:55 -0500
From: "bfields@fieldses.org" <bfields@fieldses.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20201203231655.GH27931@fieldses.org>
References: <1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
	<20201203185109.GB27931@fieldses.org>
	<4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
	<20201203211328.GC27931@fieldses.org>
	<9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
	<20201203224520.GG27931@fieldses.org>
	<d88c69f90820bf631908cbe3d3ce34343ec672f1.camel@hammerspace.com>
MIME-Version: 1.0
In-Reply-To: <d88c69f90820bf631908cbe3d3ce34343ec672f1.camel@hammerspace.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3NH1nj016629
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"daire@dneg.com" <daire@dneg.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMTA6NTM6MjZQTSArMDAwMCwgVHJvbmQgTXlrbGVidXN0
IHdyb3RlOgo+IE9uIFRodSwgMjAyMC0xMi0wMyBhdCAxNzo0NSAtMDUwMCwgYmZpZWxkc0BmaWVs
ZHNlcy5vcmcgd3JvdGU6Cj4gPiBPbiBUaHUsIERlYyAwMywgMjAyMCBhdCAwOTozNDoyNlBNICsw
MDAwLCBUcm9uZCBNeWtsZWJ1c3Qgd3JvdGU6Cj4gPiA+IEkndmUgYmVlbiB3YW50aW5nIHN1Y2gg
YSBmdW5jdGlvbiBmb3IgcXVpdGUgYSB3aGlsZSBhbnl3YXkgaW4KPiA+ID4gb3JkZXIgdG8gYWxs
b3cgdGhlIGNsaWVudCB0byBkZXRlY3Qgc3RhdGUgbGVha3MgKGVpdGhlciBkdWUgdG8KPiA+ID4g
c29mdCB0aW1lb3V0cywgb3IgZHVlIHRvIHJlb3JkZXJlZCBjbG9zZS9vcGVuIG9wZXJhdGlvbnMp
Lgo+ID4gCj4gPiBPbmUgc3VyZSB3YXkgdG8gZml4IGFueSBzdGF0ZSBsZWFrcyBpcyB0byByZWJv
b3QgdGhlIHNlcnZlci7CoCBUaGUKPiA+IHNlcnZlciB0aHJvd3MgZXZlcnl0aGluZyBhd2F5LCB0
aGUgY2xpZW50cyByZWNsYWltLCBhbGwgdGhhdCdzIGxlZnQKPiA+IGlzIHN0dWZmIHRoZXkgc3Rp
bGwgYWN0dWFsbHkgY2FyZSBhYm91dC4KPiA+IAo+ID4gSXQncyB2ZXJ5IGRpc3J1cHRpdmUuCj4g
PiAKPiA+IEJ1dCB5b3UgY291bGQgZG8gYSBsaW1pdGVkIHZlcnNpb24gb2YgdGhhdDogdGhlIHNl
cnZlciB0aHJvd3MgYXdheQo+ID4gdGhlIHN0YXRlIGZyb20gb25lIGNsaWVudCAoa2VlcGluZyB0
aGUgdW5kZXJseWluZyBsb2NrcyBvbiB0aGUKPiA+IGV4cG9ydGVkIGZpbGVzeXN0ZW0pLCBsZXRz
IHRoZSBjbGllbnQgZ28gdGhyb3VnaCBpdHMgbm9ybWFsIHJlY2xhaW0KPiA+IHByb2Nlc3MsIGF0
IHRoZSBlbmQgb2YgdGhhdCB0aHJvd3MgYXdheSBhbnl0aGluZyB0aGF0IHdhc24ndAo+ID4gcmVj
bGFpbWVkLsKgIFRoZSBvbmx5IGRlbGF5IGlzIHRvIGFueW9uZSB0cnlpbmcgdG8gYWNxdWlyZSBu
ZXcgbG9ja3MKPiA+IHRoYXQgY29uZmxpY3Qgd2l0aCB0aGF0IHNldCBvZiBsb2NrcywgYW5kIG9u
bHkgZm9yIGFzIGxvbmcgYXMgaXQKPiA+IHRha2VzIGZvciB0aGUgb25lIGNsaWVudCB0byByZWNs
YWltLgo+IAo+IE9uZSBjb3VsZCBkbyB0aGF0LCBidXQgdGhhdCByZXF1aXJlcyB0aGUgZXhpc3Rl
bmNlIG9mIGEgcXVpZXNjZW50Cj4gcGVyaW9kIHdoZXJlIHRoZSBjbGllbnQgaG9sZHMgbm8gc3Rh
dGUgYXQgYWxsIG9uIHRoZSBzZXJ2ZXIuCgpObywgYXMgSSBzYWlkLCB0aGUgY2xpZW50IHBlcmZv
cm1zIHJlYm9vdCByZWNvdmVyeSBmb3IgYW55IHN0YXRlIHRoYXQgaXQKaG9sZHMgd2hlbiB3ZSBk
byB0aGlzLgoKLS1iLgoKCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hl
ZnNAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtY2FjaGVmcw==

