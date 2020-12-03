Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 219BF2CE14E
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 23:05:15 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-TSnnG18yNDWwnH03R-7ILA-1; Thu, 03 Dec 2020 17:05:10 -0500
X-MC-Unique: TSnnG18yNDWwnH03R-7ILA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1266F192CC40;
	Thu,  3 Dec 2020 22:05:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 882EA17F6D;
	Thu,  3 Dec 2020 22:05:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2402A180954D;
	Thu,  3 Dec 2020 22:05:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3M4Uf0007008 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 17:04:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 22385101F0B5; Thu,  3 Dec 2020 22:04:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DB3A11701C6
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 22:04:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FF74811E76
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 22:04:26 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-479-w3x7Ndg5PYGZHjfP9SOKMw-1;
	Thu, 03 Dec 2020 17:04:23 -0500
X-MC-Unique: w3x7Ndg5PYGZHjfP9SOKMw-1
Received: by fieldses.org (Postfix, from userid 2815)
	id E94FA4EE7; Thu,  3 Dec 2020 17:04:21 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org E94FA4EE7
Date: Thu, 3 Dec 2020 17:04:21 -0500
From: "bfields@fieldses.org" <bfields@fieldses.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20201203220421.GE27931@fieldses.org>
References: <1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
	<20201203185109.GB27931@fieldses.org>
	<4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
	<20201203211328.GC27931@fieldses.org>
	<9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
	<019001d6c9bd$acbeb6b0$063c2410$@mindspring.com>
	<b9e8da547065f6a94bed22771f214fef91449931.camel@hammerspace.com>
MIME-Version: 1.0
In-Reply-To: <b9e8da547065f6a94bed22771f214fef91449931.camel@hammerspace.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3M4Uf0007008
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"ffilzlnx@mindspring.com" <ffilzlnx@mindspring.com>,
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

T24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMDk6NTc6NDFQTSArMDAwMCwgVHJvbmQgTXlrbGVidXN0
IHdyb3RlOgo+IE9uIFRodSwgMjAyMC0xMi0wMyBhdCAxMzo0NSAtMDgwMCwgRnJhbmsgRmlseiB3
cm90ZToKPiA+ID4gT24gVGh1LCAyMDIwLTEyLTAzIGF0IDE2OjEzIC0wNTAwLCBiZmllbGRzQGZp
ZWxkc2VzLm9yZ8Kgd3JvdGU6Cj4gPiA+ID4gT24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMDg6Mjc6
MzlQTSArMDAwMCwgVHJvbmQgTXlrbGVidXN0IHdyb3RlOgo+ID4gPiA+ID4gT24gVGh1LCAyMDIw
LTEyLTAzIGF0IDEzOjUxIC0wNTAwLCBiZmllbGRzIHdyb3RlOgo+ID4gPiA+ID4gPiBJJ3ZlIGJl
ZW4gc2NyYXRjaGluZyBteSBoZWFkIG92ZXIgaG93IHRvIGhhbmRsZSByZWJvb3Qgb2YgYQo+ID4g
PiA+ID4gPiByZS0KPiA+ID4gPiA+ID4gZXhwb3J0aW5nIHNlcnZlci7CoCBJIHRoaW5rIG9uZSB3
YXkgdG8gZml4IGl0IG1pZ2h0IGJlIGp1c3QgdG8KPiA+ID4gPiA+ID4gYWxsb3cgdGhlIHJlLSBl
eHBvcnQgc2VydmVyIHRvIHBhc3MgYWxvbmcgcmVjbGFpbXMgdG8gdGhlCj4gPiA+ID4gPiA+IG9y
aWdpbmFsCj4gPiA+ID4gPiA+IHNlcnZlciBhcyBpdCByZWNlaXZlcyB0aGVtIGZyb20gaXRzIG93
biBjbGllbnRzLsKgIEl0IG1pZ2h0Cj4gPiA+ID4gPiA+IHJlcXVpcmUKPiA+ID4gPiA+ID4gc29t
ZSBwcm90b2NvbCB0d2Vha3MsIEknbSBub3Qgc3VyZS7CoCBJJ2xsIHRyeSB0byBnZXQgbXkKPiA+
ID4gPiA+ID4gdGhvdWdodHMKPiA+ID4gPiA+ID4gaW4gb3JkZXIgYW5kIHByb3Bvc2Ugc29tZXRo
aW5nLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gSXQncyBtb3JlIGNvbXBsaWNh
dGVkIHRoYW4gdGhhdC4gSWYgdGhlIHJlLWV4cG9ydGluZyBzZXJ2ZXIKPiA+ID4gPiA+IHJlYm9v
dHMsCj4gPiA+ID4gPiBidXQgdGhlIG9yaWdpbmFsIHNlcnZlciBkb2VzIG5vdCwgdGhlbiB1bmxl
c3MgdGhhdCByZS1leHBvcnRpbmcKPiA+ID4gPiA+IHNlcnZlciBwZXJzaXN0ZWQgaXRzIGxlYXNl
IGFuZCBhIGZ1bGwgc2V0IG9mIHN0YXRlaWRzCj4gPiA+ID4gPiBzb21ld2hlcmUsIGl0Cj4gPiA+
ID4gPiB3aWxsIG5vdCBiZSBhYmxlIHRvIGF0b21pY2FsbHkgcmVjbGFpbSBkZWxlZ2F0aW9uIGFu
ZCBsb2NrCj4gPiA+ID4gPiBzdGF0ZSBvbgo+ID4gPiA+ID4gdGhlIHNlcnZlciBvbiBiZWhhbGYg
b2YgaXRzIGNsaWVudHMuCj4gPiA+ID4gCj4gPiA+ID4gQnkgc2VuZGluZyByZWNsYWltcyB0byB0
aGUgb3JpZ2luYWwgc2VydmVyLCBJIG1lYW4gbGl0ZXJhbGx5Cj4gPiA+ID4gc2VuZGluZwo+ID4g
PiA+IG5ldyBvcGVuIGFuZCBsb2NrIHJlcXVlc3RzIHdpdGggdGhlIFJFQ0xBSU0gYml0IHNldCwg
d2hpY2ggd291bGQKPiA+ID4gPiBnZXQKPiA+ID4gPiBicmFuZCBuZXcgc3RhdGVpZHMuCj4gPiA+
ID4gCj4gPiA+ID4gU28sIHRoZSBvcmlnaW5hbCBzZXJ2ZXIgd291bGQgaW52YWxpZGF0ZSB0aGUg
ZXhpc3RpbmcgY2xpZW50J3MKPiA+ID4gPiBwcmV2aW91cyBjbGllbnRpZCBhbmQgc3RhdGVpZHMt
LWp1c3QgYXMgaXQgbm9ybWFsbHkgd291bGQgb24KPiA+ID4gPiByZWJvb3QtLWJ1dCBpdCB3b3Vs
ZCBvcHRpb25hbGx5IHJlbWVtYmVyIHRoZSB1bmRlcmx5aW5nIGxvY2tzCj4gPiA+ID4gaGVsZCBi
eQo+ID4gPiA+IHRoZSBjbGllbnQgYW5kIGFsbG93IGNvbXBhdGlibGUgbG9jayByZWNsYWltcy4K
PiA+ID4gPiAKPiA+ID4gPiBSb3VnaCBhdHRlbXB0Ogo+ID4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+
IGh0dHBzOi8vd2lraS5saW51eC1uZnMub3JnL3dpa2kvaW5kZXgucGhwL1JlYm9vdF9yZWNvdmVy
eV9mb3JfcmUtZXhwb3IKPiA+ID4gPiB0X3NlcnZlcnMKPiA+ID4gPiAKPiA+ID4gPiBUaGluayBp
dCB3b3VsZCBmbHk/Cj4gPiA+IAo+ID4gPiBTbyB0aGlzIHdvdWxkIGJlIGEgdmFyaWFudCBvZiBj
b3VydGVzeSBsb2NrcyB0aGF0IGNhbiBiZSByZWNsYWltZWQKPiA+ID4gYnkgdGhlIGNsaWVudAo+
ID4gPiB1c2luZyB0aGUgcmVib290IHJlY2xhaW0gdmFyaWFudCBvZiBPUEVOL0xPQ0sgb3V0c2lk
ZSB0aGUgZ3JhY2UKPiA+ID4gcGVyaW9kPyBUaGUKPiA+ID4gcHVycG9zZSBiZWluZyB0byBhbGxv
dyByZWNsYWltIHdpdGhvdXQgZm9yY2luZyB0aGUgY2xpZW50IHRvCj4gPiA+IHBlcnNpc3QgdGhl
IG9yaWdpbmFsCj4gPiA+IHN0YXRlaWQ/Cj4gPiA+IAo+ID4gPiBIbW0uLi4gVGhhdCdzIGRvYWJs
ZSwgYnV0IGhvdyBhYm91dCB0aGUgZm9sbG93aW5nIGFsdGVybmF0aXZlOiBBZGQKPiA+ID4gYSBm
dW5jdGlvbgo+ID4gPiB0aGF0IGFsbG93cyB0aGUgY2xpZW50IHRvIHJlcXVlc3QgdGhlIGZ1bGwg
bGlzdCBvZiBzdGF0ZWlkcyB0aGF0Cj4gPiA+IHRoZSBzZXJ2ZXIgaG9sZHMgb24KPiA+ID4gaXRz
IGJlaGFsZj8KPiA+ID4gCj4gPiA+IEkndmUgYmVlbiB3YW50aW5nIHN1Y2ggYSBmdW5jdGlvbiBm
b3IgcXVpdGUgYSB3aGlsZSBhbnl3YXkgaW4gb3JkZXIKPiA+ID4gdG8gYWxsb3cgdGhlCj4gPiA+
IGNsaWVudCB0byBkZXRlY3Qgc3RhdGUgbGVha3MgKGVpdGhlciBkdWUgdG8gc29mdCB0aW1lb3V0
cywgb3IgZHVlCj4gPiA+IHRvIHJlb3JkZXJlZAo+ID4gPiBjbG9zZS9vcGVuIG9wZXJhdGlvbnMp
Lgo+ID4gCj4gPiBPaCwgdGhhdCBzb3VuZHMgaW50ZXJlc3RpbmcuIFNvIGJhc2ljYWxseSB0aGUg
cmUtZXhwb3J0IHNlcnZlciB3b3VsZAo+ID4gcmUtcG9wdWxhdGUgaXQncyBzdGF0ZSBmcm9tIHRo
ZSBvcmlnaW5hbCBzZXJ2ZXIgcmF0aGVyIHRoYW4gcmVseWluZwo+ID4gb24gaXQncyBjbGllbnRz
IGRvaW5nIHJlY2xhaW1zPyBIbW0sIGJ1dCBob3cgZG9lcyB0aGUgcmUtZXhwb3J0Cj4gPiBzZXJ2
ZXIgcmVidWlsZCBpdHMgc3RhdGVpZHM/IEkgZ3Vlc3MgaXQgY291bGQgbWFrZSB0aGUgY2xpZW50
cwo+ID4gcmVwb3B1bGF0ZSB0aGVtIHdpdGggdGhlIHNhbWUgImdpdmUgbWUgYSBkdW1wIG9mIGFs
bCBteSBzdGF0ZSIsIHVzaW5nCj4gPiB0aGUgc3RhdGUgZGV0YWlscyB0byBtYXRjaCB1cCB3aXRo
IHRoZSBvbGQgc3RhdGUgYW5kIHJlcGxhY2luZwo+ID4gc3RhdGVpZHMuIE9yIGRpZCB5b3UgaGF2
ZSBzb21ldGhpbmcgZGlmZmVyZW50IGluIG1pbmQ/Cj4gPiAKPiAKPiBJIHdhcyB0aGlua2luZyB0
aGF0IHRoZSByZS1leHBvcnQgc2VydmVyIGNvdWxkIGp1c3QgdXNlIHRoYXQgbGlzdCBvZgo+IHN0
YXRlaWRzIHRvIGZpZ3VyZSBvdXQgd2hpY2ggbG9ja3MgY2FuIGJlIHJlY2xhaW1lZCBhdG9taWNh
bGx5LCBhbmQKPiB3aGljaCBvbmVzIGhhdmUgYmVlbiBpcnJlZGVlbWFibHkgbG9zdC4gVGhlIGFz
c3VtcHRpb24gaXMgdGhhdCBpZiB5b3UKPiBoYXZlIGEgbG9jayBzdGF0ZWlkIG9yIGEgZGVsZWdh
dGlvbiwgdGhlbiB0aGF0IG1lYW5zIHRoZSBjbGllbnRzIGNhbgo+IHJlY2xhaW0gYWxsIHRoZSBs
b2NrcyB0aGF0IHdlcmUgcmVwcmVzZW50ZWQgYnkgdGhhdCBzdGF0ZWlkLgoKSSdtIGNvbmZ1c2Vk
IGFib3V0IGhvdyB0aGUgcmUtZXhwb3J0IHNlcnZlciB1c2VzIHRoYXQgbGlzdC4gIEFyZSB5b3UK
YXNzdW1pbmcgaXQgcGVyc2lzdGVkIGl0cyBvd24gbGlzdCBhY3Jvc3MgaXRzIG93biBjcmFzaC9y
ZWJvb3Q/ICBJIGd1ZXNzCnRoYXQncyB3aGF0IEkgd2FzIHRyeWluZyB0byBhdm9pZCBoYXZpbmcg
dG8gZG8uCgotLWIuCgoKLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKTGludXgtY2FjaGVm
c0ByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1jYWNoZWZz

