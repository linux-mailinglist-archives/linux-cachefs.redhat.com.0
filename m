Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED342CE200
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 23:45:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-YMoFWuMkOQ6vbZmc-fFNJA-1; Thu, 03 Dec 2020 17:45:06 -0500
X-MC-Unique: YMoFWuMkOQ6vbZmc-fFNJA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7ADE4518E;
	Thu,  3 Dec 2020 22:45:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E73A41A890;
	Thu,  3 Dec 2020 22:45:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81C294BB7B;
	Thu,  3 Dec 2020 22:45:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3Mj05a012560 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 17:45:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DBDBA110E9B2; Thu,  3 Dec 2020 22:45:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7A411020447
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 22:44:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2668811E76
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 22:44:57 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-554-nmZtzlvGNaGloenBXwZ08w-1;
	Thu, 03 Dec 2020 17:44:55 -0500
X-MC-Unique: nmZtzlvGNaGloenBXwZ08w-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 9AF3E6F5E; Thu,  3 Dec 2020 17:44:54 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 9AF3E6F5E
Date: Thu, 3 Dec 2020 17:44:54 -0500
From: "bfields@fieldses.org" <bfields@fieldses.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20201203224454.GF27931@fieldses.org>
References: <932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
	<20201203185109.GB27931@fieldses.org>
	<4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
	<20201203211328.GC27931@fieldses.org>
	<9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
	<019001d6c9bd$acbeb6b0$063c2410$@mindspring.com>
	<b9e8da547065f6a94bed22771f214fef91449931.camel@hammerspace.com>
	<20201203220421.GE27931@fieldses.org>
	<0452916df308e9419f472b0d5ffb41815014dce4.camel@hammerspace.com>
MIME-Version: 1.0
In-Reply-To: <0452916df308e9419f472b0d5ffb41815014dce4.camel@hammerspace.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3Mj05a012560
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

T24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMTA6MTQ6MjVQTSArMDAwMCwgVHJvbmQgTXlrbGVidXN0
IHdyb3RlOgo+IE9uIFRodSwgMjAyMC0xMi0wMyBhdCAxNzowNCAtMDUwMCwgYmZpZWxkc0BmaWVs
ZHNlcy5vcmcgd3JvdGU6Cj4gPiBPbiBUaHUsIERlYyAwMywgMjAyMCBhdCAwOTo1Nzo0MVBNICsw
MDAwLCBUcm9uZCBNeWtsZWJ1c3Qgd3JvdGU6Cj4gPiA+IE9uIFRodSwgMjAyMC0xMi0wMyBhdCAx
Mzo0NSAtMDgwMCwgRnJhbmsgRmlseiB3cm90ZToKPiA+ID4gPiA+IE9uIFRodSwgMjAyMC0xMi0w
MyBhdCAxNjoxMyAtMDUwMCwgYmZpZWxkc0BmaWVsZHNlcy5vcmfCoHdyb3RlOgo+ID4gPiA+ID4g
PiBPbiBUaHUsIERlYyAwMywgMjAyMCBhdCAwODoyNzozOVBNICswMDAwLCBUcm9uZCBNeWtsZWJ1
c3QKPiA+ID4gPiA+ID4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24gVGh1LCAyMDIwLTEyLTAzIGF0
IDEzOjUxIC0wNTAwLCBiZmllbGRzIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gSSd2ZSBiZWVuIHNj
cmF0Y2hpbmcgbXkgaGVhZCBvdmVyIGhvdyB0byBoYW5kbGUgcmVib290IG9mCj4gPiA+ID4gPiA+
ID4gPiBhCj4gPiA+ID4gPiA+ID4gPiByZS0KPiA+ID4gPiA+ID4gPiA+IGV4cG9ydGluZyBzZXJ2
ZXIuwqAgSSB0aGluayBvbmUgd2F5IHRvIGZpeCBpdCBtaWdodCBiZQo+ID4gPiA+ID4gPiA+ID4g
anVzdCB0bwo+ID4gPiA+ID4gPiA+ID4gYWxsb3cgdGhlIHJlLSBleHBvcnQgc2VydmVyIHRvIHBh
c3MgYWxvbmcgcmVjbGFpbXMgdG8gdGhlCj4gPiA+ID4gPiA+ID4gPiBvcmlnaW5hbAo+ID4gPiA+
ID4gPiA+ID4gc2VydmVyIGFzIGl0IHJlY2VpdmVzIHRoZW0gZnJvbSBpdHMgb3duIGNsaWVudHMu
wqAgSXQKPiA+ID4gPiA+ID4gPiA+IG1pZ2h0Cj4gPiA+ID4gPiA+ID4gPiByZXF1aXJlCj4gPiA+
ID4gPiA+ID4gPiBzb21lIHByb3RvY29sIHR3ZWFrcywgSSdtIG5vdCBzdXJlLsKgIEknbGwgdHJ5
IHRvIGdldCBteQo+ID4gPiA+ID4gPiA+ID4gdGhvdWdodHMKPiA+ID4gPiA+ID4gPiA+IGluIG9y
ZGVyIGFuZCBwcm9wb3NlIHNvbWV0aGluZy4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiA+IEl0J3MgbW9yZSBjb21wbGljYXRlZCB0aGFuIHRoYXQuIElmIHRoZSBy
ZS1leHBvcnRpbmcgc2VydmVyCj4gPiA+ID4gPiA+ID4gcmVib290cywKPiA+ID4gPiA+ID4gPiBi
dXQgdGhlIG9yaWdpbmFsIHNlcnZlciBkb2VzIG5vdCwgdGhlbiB1bmxlc3MgdGhhdCByZS0KPiA+
ID4gPiA+ID4gPiBleHBvcnRpbmcKPiA+ID4gPiA+ID4gPiBzZXJ2ZXIgcGVyc2lzdGVkIGl0cyBs
ZWFzZSBhbmQgYSBmdWxsIHNldCBvZiBzdGF0ZWlkcwo+ID4gPiA+ID4gPiA+IHNvbWV3aGVyZSwg
aXQKPiA+ID4gPiA+ID4gPiB3aWxsIG5vdCBiZSBhYmxlIHRvIGF0b21pY2FsbHkgcmVjbGFpbSBk
ZWxlZ2F0aW9uIGFuZCBsb2NrCj4gPiA+ID4gPiA+ID4gc3RhdGUgb24KPiA+ID4gPiA+ID4gPiB0
aGUgc2VydmVyIG9uIGJlaGFsZiBvZiBpdHMgY2xpZW50cy4KPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+IEJ5IHNlbmRpbmcgcmVjbGFpbXMgdG8gdGhlIG9yaWdpbmFsIHNlcnZlciwgSSBtZWFuIGxp
dGVyYWxseQo+ID4gPiA+ID4gPiBzZW5kaW5nCj4gPiA+ID4gPiA+IG5ldyBvcGVuIGFuZCBsb2Nr
IHJlcXVlc3RzIHdpdGggdGhlIFJFQ0xBSU0gYml0IHNldCwgd2hpY2gKPiA+ID4gPiA+ID4gd291
bGQKPiA+ID4gPiA+ID4gZ2V0Cj4gPiA+ID4gPiA+IGJyYW5kIG5ldyBzdGF0ZWlkcy4KPiA+ID4g
PiA+ID4gCj4gPiA+ID4gPiA+IFNvLCB0aGUgb3JpZ2luYWwgc2VydmVyIHdvdWxkIGludmFsaWRh
dGUgdGhlIGV4aXN0aW5nCj4gPiA+ID4gPiA+IGNsaWVudCdzCj4gPiA+ID4gPiA+IHByZXZpb3Vz
IGNsaWVudGlkIGFuZCBzdGF0ZWlkcy0tanVzdCBhcyBpdCBub3JtYWxseSB3b3VsZCBvbgo+ID4g
PiA+ID4gPiByZWJvb3QtLWJ1dCBpdCB3b3VsZCBvcHRpb25hbGx5IHJlbWVtYmVyIHRoZSB1bmRl
cmx5aW5nIGxvY2tzCj4gPiA+ID4gPiA+IGhlbGQgYnkKPiA+ID4gPiA+ID4gdGhlIGNsaWVudCBh
bmQgYWxsb3cgY29tcGF0aWJsZSBsb2NrIHJlY2xhaW1zLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gUm91Z2ggYXR0ZW1wdDoKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBo
dHRwczovL3dpa2kubGludXgtbmZzLm9yZy93aWtpL2luZGV4LnBocC9SZWJvb3RfcmVjb3Zlcnlf
Zm9yX3JlLWV4cG9yCj4gPiA+ID4gPiA+IHRfc2VydmVycwo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gVGhpbmsgaXQgd291bGQgZmx5Pwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTbyB0aGlzIHdvdWxk
IGJlIGEgdmFyaWFudCBvZiBjb3VydGVzeSBsb2NrcyB0aGF0IGNhbiBiZQo+ID4gPiA+ID4gcmVj
bGFpbWVkCj4gPiA+ID4gPiBieSB0aGUgY2xpZW50Cj4gPiA+ID4gPiB1c2luZyB0aGUgcmVib290
IHJlY2xhaW0gdmFyaWFudCBvZiBPUEVOL0xPQ0sgb3V0c2lkZSB0aGUgZ3JhY2UKPiA+ID4gPiA+
IHBlcmlvZD8gVGhlCj4gPiA+ID4gPiBwdXJwb3NlIGJlaW5nIHRvIGFsbG93IHJlY2xhaW0gd2l0
aG91dCBmb3JjaW5nIHRoZSBjbGllbnQgdG8KPiA+ID4gPiA+IHBlcnNpc3QgdGhlIG9yaWdpbmFs
Cj4gPiA+ID4gPiBzdGF0ZWlkPwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBIbW0uLi4gVGhhdCdzIGRv
YWJsZSwgYnV0IGhvdyBhYm91dCB0aGUgZm9sbG93aW5nIGFsdGVybmF0aXZlOgo+ID4gPiA+ID4g
QWRkCj4gPiA+ID4gPiBhIGZ1bmN0aW9uCj4gPiA+ID4gPiB0aGF0IGFsbG93cyB0aGUgY2xpZW50
IHRvIHJlcXVlc3QgdGhlIGZ1bGwgbGlzdCBvZiBzdGF0ZWlkcwo+ID4gPiA+ID4gdGhhdAo+ID4g
PiA+ID4gdGhlIHNlcnZlciBob2xkcyBvbgo+ID4gPiA+ID4gaXRzIGJlaGFsZj8KPiA+ID4gPiA+
IAo+ID4gPiA+ID4gSSd2ZSBiZWVuIHdhbnRpbmcgc3VjaCBhIGZ1bmN0aW9uIGZvciBxdWl0ZSBh
IHdoaWxlIGFueXdheSBpbgo+ID4gPiA+ID4gb3JkZXIKPiA+ID4gPiA+IHRvIGFsbG93IHRoZQo+
ID4gPiA+ID4gY2xpZW50IHRvIGRldGVjdCBzdGF0ZSBsZWFrcyAoZWl0aGVyIGR1ZSB0byBzb2Z0
IHRpbWVvdXRzLCBvcgo+ID4gPiA+ID4gZHVlCj4gPiA+ID4gPiB0byByZW9yZGVyZWQKPiA+ID4g
PiA+IGNsb3NlL29wZW4gb3BlcmF0aW9ucykuCj4gPiA+ID4gCj4gPiA+ID4gT2gsIHRoYXQgc291
bmRzIGludGVyZXN0aW5nLiBTbyBiYXNpY2FsbHkgdGhlIHJlLWV4cG9ydCBzZXJ2ZXIKPiA+ID4g
PiB3b3VsZAo+ID4gPiA+IHJlLXBvcHVsYXRlIGl0J3Mgc3RhdGUgZnJvbSB0aGUgb3JpZ2luYWwg
c2VydmVyIHJhdGhlciB0aGFuCj4gPiA+ID4gcmVseWluZwo+ID4gPiA+IG9uIGl0J3MgY2xpZW50
cyBkb2luZyByZWNsYWltcz8gSG1tLCBidXQgaG93IGRvZXMgdGhlIHJlLWV4cG9ydAo+ID4gPiA+
IHNlcnZlciByZWJ1aWxkIGl0cyBzdGF0ZWlkcz8gSSBndWVzcyBpdCBjb3VsZCBtYWtlIHRoZSBj
bGllbnRzCj4gPiA+ID4gcmVwb3B1bGF0ZSB0aGVtIHdpdGggdGhlIHNhbWUgImdpdmUgbWUgYSBk
dW1wIG9mIGFsbCBteSBzdGF0ZSIsCj4gPiA+ID4gdXNpbmcKPiA+ID4gPiB0aGUgc3RhdGUgZGV0
YWlscyB0byBtYXRjaCB1cCB3aXRoIHRoZSBvbGQgc3RhdGUgYW5kIHJlcGxhY2luZwo+ID4gPiA+
IHN0YXRlaWRzLiBPciBkaWQgeW91IGhhdmUgc29tZXRoaW5nIGRpZmZlcmVudCBpbiBtaW5kPwo+
ID4gPiA+IAo+ID4gPiAKPiA+ID4gSSB3YXMgdGhpbmtpbmcgdGhhdCB0aGUgcmUtZXhwb3J0IHNl
cnZlciBjb3VsZCBqdXN0IHVzZSB0aGF0IGxpc3QKPiA+ID4gb2YKPiA+ID4gc3RhdGVpZHMgdG8g
ZmlndXJlIG91dCB3aGljaCBsb2NrcyBjYW4gYmUgcmVjbGFpbWVkIGF0b21pY2FsbHksIGFuZAo+
ID4gPiB3aGljaCBvbmVzIGhhdmUgYmVlbiBpcnJlZGVlbWFibHkgbG9zdC4gVGhlIGFzc3VtcHRp
b24gaXMgdGhhdCBpZgo+ID4gPiB5b3UKPiA+ID4gaGF2ZSBhIGxvY2sgc3RhdGVpZCBvciBhIGRl
bGVnYXRpb24sIHRoZW4gdGhhdCBtZWFucyB0aGUgY2xpZW50cwo+ID4gPiBjYW4KPiA+ID4gcmVj
bGFpbSBhbGwgdGhlIGxvY2tzIHRoYXQgd2VyZSByZXByZXNlbnRlZCBieSB0aGF0IHN0YXRlaWQu
Cj4gPiAKPiA+IEknbSBjb25mdXNlZCBhYm91dCBob3cgdGhlIHJlLWV4cG9ydCBzZXJ2ZXIgdXNl
cyB0aGF0IGxpc3QuwqAgQXJlIHlvdQo+ID4gYXNzdW1pbmcgaXQgcGVyc2lzdGVkIGl0cyBvd24g
bGlzdCBhY3Jvc3MgaXRzIG93biBjcmFzaC9yZWJvb3Q/wqAgSQo+ID4gZ3Vlc3MKPiA+IHRoYXQn
cyB3aGF0IEkgd2FzIHRyeWluZyB0byBhdm9pZCBoYXZpbmcgdG8gZG8uCj4gPiAKPiBOby4gVGhl
IHNlcnZlciBqdXN0IHVzZXMgdGhlIHN0YXRlaWRzIGFzIHBhcnQgb2YgYSBjaGVjayBmb3IgJ2Rv
IEkgaG9sZAo+IHN0YXRlIGZvciB0aGlzIGZpbGUgb24gdGhpcyBzZXJ2ZXI/Jy4gSWYgdGhlIGFu
c3dlciBpcyAneWVzJyBhbmQgdGhlCj4gbG9jayBvd25lcnMgYXJlIHNhbmUsIHRoZW4gd2Ugc2hv
dWxkIGJlIGFibGUgdG8gYXNzdW1lIHRoZSBmdWxsIHNldCBvZgo+IGxvY2tzIHRoYXQgbG9jayBv
d25lciBoZWxkIG9uIHRoYXQgZmlsZSBhcmUgc3RpbGwgdmFsaWQuCj4gCj4gQlRXOiBpZiB0aGUg
bG9jayBvd25lciBpcyBhbHNvIHJldHVybmVkIGJ5IHRoZSBzZXJ2ZXIsIHRoZW4gc2luY2UgdGhl
Cj4gbG9jayBvd25lciBpcyBhbiBvcGFxdWUgdmFsdWUsIGl0IGNvdWxkLCBmb3IgaW5zdGFuY2Us
IGJlIHVzZWQgYnkgdGhlCj4gY2xpZW50IHRvIGNhY2hlIGluZm8gb24gdGhlIHNlcnZlciBhYm91
dCB3aGljaCB1aWQvZ2lkIG93bnMgdGhlc2UKPiBsb2Nrcy4KCk9LLCBzbyB0aGUgbGlzdCBvZiBz
dGF0ZWlkcyByZXR1cm5lZCBieSB0aGUgc2VydmVyIGhhcyBlbnRyaWVzIHRoYXQgbG9vawpsaWtl
ICh0eXBlLCBmaWxlaGFuZGxlLCBvd25lciwgc3RhdGVpZCkgKHdoZXJlIHR5cGU9b3BlbiBvciBs
b2NrPykuCgpJIGd1ZXNzIEknZCBuZWVkIHRvIHNlZSB0aGlzIGluIG1vcmUgZGV0YWlsLgoKLS1i
LgoKCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNv
bQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVmcw==

