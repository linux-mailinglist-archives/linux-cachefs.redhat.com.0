Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F21EA2CE12C
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 22:54:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-wWev45uRNMOzvCbU-EBjKA-1; Thu, 03 Dec 2020 16:54:13 -0500
X-MC-Unique: wWev45uRNMOzvCbU-EBjKA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 461F2801B3F;
	Thu,  3 Dec 2020 21:54:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B28519C46;
	Thu,  3 Dec 2020 21:54:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A263180954D;
	Thu,  3 Dec 2020 21:54:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3Ls62O006010 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 16:54:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 620952166B2B; Thu,  3 Dec 2020 21:54:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D3FF2166B27
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 21:54:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F7AA800296
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 21:54:04 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-431-aA3HVlv5OzeGFEWQACw7Zg-1;
	Thu, 03 Dec 2020 16:54:01 -0500
X-MC-Unique: aA3HVlv5OzeGFEWQACw7Zg-1
Received: by fieldses.org (Postfix, from userid 2815)
	id D9DED6F73; Thu,  3 Dec 2020 16:54:00 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org D9DED6F73
Date: Thu, 3 Dec 2020 16:54:00 -0500
From: "bfields@fieldses.org" <bfields@fieldses.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20201203215400.GD27931@fieldses.org>
References: <20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
	<20201203185109.GB27931@fieldses.org>
	<4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
	<20201203211328.GC27931@fieldses.org>
	<9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
MIME-Version: 1.0
In-Reply-To: <9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3Ls62O006010
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

T24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMDk6MzQ6MjZQTSArMDAwMCwgVHJvbmQgTXlrbGVidXN0
IHdyb3RlOgo+IE9uIFRodSwgMjAyMC0xMi0wMyBhdCAxNjoxMyAtMDUwMCwgYmZpZWxkc0BmaWVs
ZHNlcy5vcmcgd3JvdGU6Cj4gPiBPbiBUaHUsIERlYyAwMywgMjAyMCBhdCAwODoyNzozOVBNICsw
MDAwLCBUcm9uZCBNeWtsZWJ1c3Qgd3JvdGU6Cj4gPiA+IE9uIFRodSwgMjAyMC0xMi0wMyBhdCAx
Mzo1MSAtMDUwMCwgYmZpZWxkcyB3cm90ZToKPiA+ID4gPiBJJ3ZlIGJlZW4gc2NyYXRjaGluZyBt
eSBoZWFkIG92ZXIgaG93IHRvIGhhbmRsZSByZWJvb3Qgb2YgYSByZS0KPiA+ID4gPiBleHBvcnRp
bmcKPiA+ID4gPiBzZXJ2ZXIuwqAgSSB0aGluayBvbmUgd2F5IHRvIGZpeCBpdCBtaWdodCBiZSBq
dXN0IHRvIGFsbG93IHRoZSByZS0KPiA+ID4gPiBleHBvcnQKPiA+ID4gPiBzZXJ2ZXIgdG8gcGFz
cyBhbG9uZyByZWNsYWltcyB0byB0aGUgb3JpZ2luYWwgc2VydmVyIGFzIGl0Cj4gPiA+ID4gcmVj
ZWl2ZXMKPiA+ID4gPiB0aGVtCj4gPiA+ID4gZnJvbSBpdHMgb3duIGNsaWVudHMuwqAgSXQgbWln
aHQgcmVxdWlyZSBzb21lIHByb3RvY29sIHR3ZWFrcywgSSdtCj4gPiA+ID4gbm90Cj4gPiA+ID4g
c3VyZS7CoCBJJ2xsIHRyeSB0byBnZXQgbXkgdGhvdWdodHMgaW4gb3JkZXIgYW5kIHByb3Bvc2UK
PiA+ID4gPiBzb21ldGhpbmcuCj4gPiA+ID4gCj4gPiA+IAo+ID4gPiBJdCdzIG1vcmUgY29tcGxp
Y2F0ZWQgdGhhbiB0aGF0LiBJZiB0aGUgcmUtZXhwb3J0aW5nIHNlcnZlcgo+ID4gPiByZWJvb3Rz
LAo+ID4gPiBidXQgdGhlIG9yaWdpbmFsIHNlcnZlciBkb2VzIG5vdCwgdGhlbiB1bmxlc3MgdGhh
dCByZS1leHBvcnRpbmcKPiA+ID4gc2VydmVyCj4gPiA+IHBlcnNpc3RlZCBpdHMgbGVhc2UgYW5k
IGEgZnVsbCBzZXQgb2Ygc3RhdGVpZHMgc29tZXdoZXJlLCBpdCB3aWxsCj4gPiA+IG5vdAo+ID4g
PiBiZSBhYmxlIHRvIGF0b21pY2FsbHkgcmVjbGFpbSBkZWxlZ2F0aW9uIGFuZCBsb2NrIHN0YXRl
IG9uIHRoZQo+ID4gPiBzZXJ2ZXIKPiA+ID4gb24gYmVoYWxmIG9mIGl0cyBjbGllbnRzLgo+ID4g
Cj4gPiBCeSBzZW5kaW5nIHJlY2xhaW1zIHRvIHRoZSBvcmlnaW5hbCBzZXJ2ZXIsIEkgbWVhbiBs
aXRlcmFsbHkgc2VuZGluZwo+ID4gbmV3Cj4gPiBvcGVuIGFuZCBsb2NrIHJlcXVlc3RzIHdpdGgg
dGhlIFJFQ0xBSU0gYml0IHNldCwgd2hpY2ggd291bGQgZ2V0Cj4gPiBicmFuZAo+ID4gbmV3IHN0
YXRlaWRzLgo+ID4gCj4gPiBTbywgdGhlIG9yaWdpbmFsIHNlcnZlciB3b3VsZCBpbnZhbGlkYXRl
IHRoZSBleGlzdGluZyBjbGllbnQncwo+ID4gcHJldmlvdXMKPiA+IGNsaWVudGlkIGFuZCBzdGF0
ZWlkcy0tanVzdCBhcyBpdCBub3JtYWxseSB3b3VsZCBvbiByZWJvb3QtLWJ1dCBpdAo+ID4gd291
bGQKPiA+IG9wdGlvbmFsbHkgcmVtZW1iZXIgdGhlIHVuZGVybHlpbmcgbG9ja3MgaGVsZCBieSB0
aGUgY2xpZW50IGFuZCBhbGxvdwo+ID4gY29tcGF0aWJsZSBsb2NrIHJlY2xhaW1zLgo+ID4gCj4g
PiBSb3VnaCBhdHRlbXB0Ogo+ID4gCj4gPiDCoMKgwqDCoMKgwqDCoMKgaHR0cHM6Ly93aWtpLmxp
bnV4LW5mcy5vcmcvd2lraS9pbmRleC5waHAvUmVib290X3JlY292ZXJ5X2Zvcl9yZS1leHBvcnRf
c2VydmVycwo+ID4gCj4gPiBUaGluayBpdCB3b3VsZCBmbHk/Cj4gCj4gU28gdGhpcyB3b3VsZCBi
ZSBhIHZhcmlhbnQgb2YgY291cnRlc3kgbG9ja3MgdGhhdCBjYW4gYmUgcmVjbGFpbWVkIGJ5Cj4g
dGhlIGNsaWVudCB1c2luZyB0aGUgcmVib290IHJlY2xhaW0gdmFyaWFudCBvZiBPUEVOL0xPQ0sg
b3V0c2lkZSB0aGUKPiBncmFjZSBwZXJpb2Q/IFRoZSBwdXJwb3NlIGJlaW5nIHRvIGFsbG93IHJl
Y2xhaW0gd2l0aG91dCBmb3JjaW5nIHRoZQo+IGNsaWVudCB0byBwZXJzaXN0IHRoZSBvcmlnaW5h
bCBzdGF0ZWlkPwoKUmlnaHQuCgo+IEhtbS4uLiBUaGF0J3MgZG9hYmxlLAoKS2VlcCBtdWxsaW5n
IGl0IG92ZXIgYW5kIGxldCBtZSBrbm93IGlmIHlvdSBzZWUgc29tZXRoaW5nIHRoYXQgZG9lc24n
dAp3b3JrLgoKPiBidXQgaG93IGFib3V0IHRoZSBmb2xsb3dpbmcgYWx0ZXJuYXRpdmU6IEFkZCBh
Cj4gZnVuY3Rpb24gdGhhdCBhbGxvd3MgdGhlIGNsaWVudCB0byByZXF1ZXN0IHRoZSBmdWxsIGxp
c3Qgb2Ygc3RhdGVpZHMKPiB0aGF0IHRoZSBzZXJ2ZXIgaG9sZHMgb24gaXRzIGJlaGFsZj8KClNv
LCBvbiB0aGUgcmUtZXhwb3J0IHNlcnZlcjoKClRoZSBjbGllbnQgY29tZXMgYmFjayB1cCBrbm93
aW5nIG5vdGhpbmcsIHNvIGl0IHJlcXVlc3RzIHRoYXQgbGlzdCBvZgpzdGF0ZWlkcy4gIEEgcmVj
bGFpbSBjb21lcyBpbiBmcm9tIGFuIGVuZCBjbGllbnQuICBUaGUgY2xpZW50IGxvb2tzCnRocm91
Z2ggaXRzIGxpc3QgZm9yIGEgc3RhdGVpZCB0aGF0IG1hdGNoZXMgdGhhdCByZWNsYWltIHNvbWVo
b3cuICBTbywgSQpndWVzcyB0aGUgbGlzdCBvZiBzdGF0ZWlkcyBhbHNvIGhhcyB0byBpbmNsdWRl
IGZpbGVoYW5kbGVzIGFuZCBhY2Nlc3MKYml0cyBhbmQgbG9jayByYW5nZXMgYW5kIHN1Y2gsIHNv
IHRoZSBjbGllbnQgY2FuIHBpY2sgYW4gYXBwcm9wcmlhdGUKc3RhdGVpZCB0byB1c2U/Cgo+IEkn
dmUgYmVlbiB3YW50aW5nIHN1Y2ggYSBmdW5jdGlvbiBmb3IgcXVpdGUgYSB3aGlsZSBhbnl3YXkg
aW4gb3JkZXIgdG8KPiBhbGxvdyB0aGUgY2xpZW50IHRvIGRldGVjdCBzdGF0ZSBsZWFrcyAoZWl0
aGVyIGR1ZSB0byBzb2Z0IHRpbWVvdXRzLCBvcgo+IGR1ZSB0byByZW9yZGVyZWQgY2xvc2Uvb3Bl
biBvcGVyYXRpb25zKS4KCllpcGVzLCBJIGhhZG4ndCByZWFsaXplZCB0aGF0IHdhcyBwb3NzaWJs
ZS4KCi0tYi4KCgotLQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJl
ZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNh
Y2hlZnM=

