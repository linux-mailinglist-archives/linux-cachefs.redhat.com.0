Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6259B2CE536
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Dec 2020 02:41:16 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-ZTDJ4-0KMiCLUTYgMXdXAg-1; Thu, 03 Dec 2020 20:41:14 -0500
X-MC-Unique: ZTDJ4-0KMiCLUTYgMXdXAg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC1793FD7;
	Fri,  4 Dec 2020 01:41:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 404451A8A3;
	Fri,  4 Dec 2020 01:41:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58B00180954D;
	Fri,  4 Dec 2020 01:41:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B41f7xk030928 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 20:41:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 016892166B2B; Fri,  4 Dec 2020 01:41:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF4D92166B2F
	for <linux-cachefs@redhat.com>; Fri,  4 Dec 2020 01:41:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C26EC108C0A0
	for <linux-cachefs@redhat.com>; Fri,  4 Dec 2020 01:41:03 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-278-plehDLlzOjmdWdYcdxAUvA-1;
	Thu, 03 Dec 2020 20:41:01 -0500
X-MC-Unique: plehDLlzOjmdWdYcdxAUvA-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 2E9BB6F73; Thu,  3 Dec 2020 20:41:00 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 2E9BB6F73
Date: Thu, 3 Dec 2020 20:41:00 -0500
From: "bfields@fieldses.org" <bfields@fieldses.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20201204014100.GI27931@fieldses.org>
References: <932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
	<20201203185109.GB27931@fieldses.org>
	<4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
	<20201203211328.GC27931@fieldses.org>
	<9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
	<20201203224520.GG27931@fieldses.org>
	<d88c69f90820bf631908cbe3d3ce34343ec672f1.camel@hammerspace.com>
	<20201203231655.GH27931@fieldses.org>
	<136e9c309ad962cb247b9e696633484db76d1f3b.camel@hammerspace.com>
MIME-Version: 1.0
In-Reply-To: <136e9c309ad962cb247b9e696633484db76d1f3b.camel@hammerspace.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B41f7xk030928
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBEZWMgMDQsIDIwMjAgYXQgMDE6MDI6MjBBTSArMDAwMCwgVHJvbmQgTXlrbGVidXN0
IHdyb3RlOgo+IE9uIFRodSwgMjAyMC0xMi0wMyBhdCAxODoxNiAtMDUwMCwgYmZpZWxkc0BmaWVs
ZHNlcy5vcmcgd3JvdGU6Cj4gPiBPbiBUaHUsIERlYyAwMywgMjAyMCBhdCAxMDo1MzoyNlBNICsw
MDAwLCBUcm9uZCBNeWtsZWJ1c3Qgd3JvdGU6Cj4gPiA+IE9uIFRodSwgMjAyMC0xMi0wMyBhdCAx
Nzo0NSAtMDUwMCwgYmZpZWxkc0BmaWVsZHNlcy5vcmfCoHdyb3RlOgo+ID4gPiA+IE9uIFRodSwg
RGVjIDAzLCAyMDIwIGF0IDA5OjM0OjI2UE0gKzAwMDAsIFRyb25kIE15a2xlYnVzdCB3cm90ZToK
PiA+ID4gPiA+IEkndmUgYmVlbiB3YW50aW5nIHN1Y2ggYSBmdW5jdGlvbiBmb3IgcXVpdGUgYSB3
aGlsZSBhbnl3YXkgaW4KPiA+ID4gPiA+IG9yZGVyIHRvIGFsbG93IHRoZSBjbGllbnQgdG8gZGV0
ZWN0IHN0YXRlIGxlYWtzIChlaXRoZXIgZHVlIHRvCj4gPiA+ID4gPiBzb2Z0IHRpbWVvdXRzLCBv
ciBkdWUgdG8gcmVvcmRlcmVkIGNsb3NlL29wZW4gb3BlcmF0aW9ucykuCj4gPiA+ID4gCj4gPiA+
ID4gT25lIHN1cmUgd2F5IHRvIGZpeCBhbnkgc3RhdGUgbGVha3MgaXMgdG8gcmVib290IHRoZSBz
ZXJ2ZXIuwqAgVGhlCj4gPiA+ID4gc2VydmVyIHRocm93cyBldmVyeXRoaW5nIGF3YXksIHRoZSBj
bGllbnRzIHJlY2xhaW0sIGFsbCB0aGF0J3MKPiA+ID4gPiBsZWZ0Cj4gPiA+ID4gaXMgc3R1ZmYg
dGhleSBzdGlsbCBhY3R1YWxseSBjYXJlIGFib3V0Lgo+ID4gPiA+IAo+ID4gPiA+IEl0J3MgdmVy
eSBkaXNydXB0aXZlLgo+ID4gPiA+IAo+ID4gPiA+IEJ1dCB5b3UgY291bGQgZG8gYSBsaW1pdGVk
IHZlcnNpb24gb2YgdGhhdDogdGhlIHNlcnZlciB0aHJvd3MKPiA+ID4gPiBhd2F5Cj4gPiA+ID4g
dGhlIHN0YXRlIGZyb20gb25lIGNsaWVudCAoa2VlcGluZyB0aGUgdW5kZXJseWluZyBsb2NrcyBv
biB0aGUKPiA+ID4gPiBleHBvcnRlZCBmaWxlc3lzdGVtKSwgbGV0cyB0aGUgY2xpZW50IGdvIHRo
cm91Z2ggaXRzIG5vcm1hbAo+ID4gPiA+IHJlY2xhaW0KPiA+ID4gPiBwcm9jZXNzLCBhdCB0aGUg
ZW5kIG9mIHRoYXQgdGhyb3dzIGF3YXkgYW55dGhpbmcgdGhhdCB3YXNuJ3QKPiA+ID4gPiByZWNs
YWltZWQuwqAgVGhlIG9ubHkgZGVsYXkgaXMgdG8gYW55b25lIHRyeWluZyB0byBhY3F1aXJlIG5l
dwo+ID4gPiA+IGxvY2tzCj4gPiA+ID4gdGhhdCBjb25mbGljdCB3aXRoIHRoYXQgc2V0IG9mIGxv
Y2tzLCBhbmQgb25seSBmb3IgYXMgbG9uZyBhcyBpdAo+ID4gPiA+IHRha2VzIGZvciB0aGUgb25l
IGNsaWVudCB0byByZWNsYWltLgo+ID4gPiAKPiA+ID4gT25lIGNvdWxkIGRvIHRoYXQsIGJ1dCB0
aGF0IHJlcXVpcmVzIHRoZSBleGlzdGVuY2Ugb2YgYSBxdWllc2NlbnQKPiA+ID4gcGVyaW9kIHdo
ZXJlIHRoZSBjbGllbnQgaG9sZHMgbm8gc3RhdGUgYXQgYWxsIG9uIHRoZSBzZXJ2ZXIuCj4gPiAK
PiA+IE5vLCBhcyBJIHNhaWQsIHRoZSBjbGllbnQgcGVyZm9ybXMgcmVib290IHJlY292ZXJ5IGZv
ciBhbnkgc3RhdGUgdGhhdAo+ID4gaXQKPiA+IGhvbGRzIHdoZW4gd2UgZG8gdGhpcy4KPiA+IAo+
IAo+IEhtbS4uLiBTbyBob3cgZG8gdGhlIGNsaWVudCBhbmQgc2VydmVyIGNvb3JkaW5hdGUgd2hh
dCBjYW4gYW5kIGNhbm5vdAo+IGJlIHJlY2xhaW1lZD8gVGhlIGlzc3VlIGlzIHRoYXQgcmFjZXMg
Y2FuIHdvcmsgYm90aCB3YXlzLCB3aXRoIHRoZQo+IGNsaWVudCBzb21ldGltZXMgYmVsaWV2aW5n
IHRoYXQgaXQgaG9sZHMgYSBsYXlvdXQgb3IgYSBkZWxlZ2F0aW9uIHRoYXQKPiB0aGUgc2VydmVy
IHRoaW5rcyBpdCBoYXMgcmV0dXJuZWQuIElmIHRoZSBzZXJ2ZXIgYWxsb3dzIGEgcmVjbGFpbSBv
Zgo+IHN1Y2ggYSBkZWxlZ2F0aW9uLCB0aGVuIHRoYXQgY291bGQgYmUgcHJvYmxlbWF0aWMgKGJl
Y2F1c2UgaXQgYnJlYWtzCj4gbG9jayBhdG9taWNpdHkgb24gdGhlIGNsaWVudCBhbmQgYmVjYXVz
ZSBpdCBtYXkgY2F1c2UgY29uZmxpY3RzKS4KClRoZSBzZXJ2ZXIncyBub3QgYWN0dWFsbHkgZm9y
Z2V0dGluZyBhbnl0aGluZywgaXQncyBqdXN0IHByZXRlbmRpbmcgdG8sCmluIG9yZGVyIHRvIHRy
aWdnZXIgdGhlIGNsaWVudCdzIHJlYm9vdCByZWNvdmVyeS4gIEl0IGNhbiB0dXJuIGRvd24gdGhl
CmNsaWVudCdzIGF0dGVtcHQgdG8gcmVjbGFpbSBzb21ldGhpbmcgaXQgZG9lc24ndCBoYXZlLgoK
VGhvdWdoIGlzbid0IGl0IGFscmVhZHkgZ2FtZSBvdmVyIGJ5IHRoZSB0aW1lIHRoZSBjbGllbnQg
dGhpbmtzIGl0IGhvbGRzCnNvbWUgbG9jay9vcGVuL2RlbGVnYXRpb24gdGhhdCB0aGUgc2VydmVy
IGRvZXNuJ3Q/ICBJIGd1ZXNzIEknZCBuZWVkIHRvCnNlZSB0aGVzZSBjYXNlcyB3cml0dGVuIG91
dCBpbiBkZXRhaWwgdG8gdW5kZXJzdGFuZC4KCi0tYi4KCj4gQnkgdGhlIHdheSwgdGhlIG90aGVy
IHRoaW5nIHRoYXQgSSdkIGxpa2UgdG8gYWRkIHRvIG15IHdpc2hsaXN0IGlzIGEKPiBjYWxsYmFj
ayB0aGF0IGFsbG93cyB0aGUgc2VydmVyIHRvIGFzayB0aGUgY2xpZW50IGlmIGl0IHN0aWxsIGhv
bGRzIGEKPiBnaXZlbiBvcGVuIG9yIGxvY2sgc3RhdGVpZC4gQSBzZXJ2ZXIgY2FuIHJlY2FsbCBh
IGRlbGVnYXRpb24gb3IgYQo+IGxheW91dCwgc28gaXQgY2FuIGZpeCB1cCBsZWFrcyBvZiB0aG9z
ZSwgaG93ZXZlciBpdCBoYXMgbm8gcmVtZWR5IGlmCj4gdGhlIGNsaWVudCBsb3NlcyBhbiBvcGVu
IG9yIGxvY2sgc3RhdGVpZCBvdGhlciB0aGFuIHRvIHBvc3NpYmx5Cj4gZm9yY2libHkgcmV2b2tl
IHN0YXRlLiBUaGF0IGNvdWxkIGNhdXNlIGFwcGxpY2F0aW9uIGNyYXNoZXMgaWYgdGhlCj4gc2Vy
dmVyIG1ha2VzIGEgbWlzdGFrZSBhbmQgcmV2b2tlcyBhIGxvY2sgdGhhdCBpcyBhY3R1YWxseSBp
biB1c2UuCj4gCj4gLS0gCj4gVHJvbmQgTXlrbGVidXN0Cj4gTGludXggTkZTIGNsaWVudCBtYWlu
dGFpbmVyLCBIYW1tZXJzcGFjZQo+IHRyb25kLm15a2xlYnVzdEBoYW1tZXJzcGFjZS5jb20KPiAK
PiAKCgotLQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5j
b20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnM=

