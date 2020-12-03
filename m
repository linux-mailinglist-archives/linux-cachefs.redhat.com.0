Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 450DE2CE068
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 22:13:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-PovOKAhfM4q9LE-cSZMJmw-1; Thu, 03 Dec 2020 16:13:43 -0500
X-MC-Unique: PovOKAhfM4q9LE-cSZMJmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 094C4107ACE4;
	Thu,  3 Dec 2020 21:13:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC8401001901;
	Thu,  3 Dec 2020 21:13:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BED35180954D;
	Thu,  3 Dec 2020 21:13:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3LDZj3002628 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 16:13:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 738242027EB2; Thu,  3 Dec 2020 21:13:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DF6F2027EAE
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 21:13:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 159E8186E121
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 21:13:33 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-255-HcbUABbMPSOG1Y5LEjEZeg-1;
	Thu, 03 Dec 2020 16:13:29 -0500
X-MC-Unique: HcbUABbMPSOG1Y5LEjEZeg-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 188DB6F73; Thu,  3 Dec 2020 16:13:28 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 188DB6F73
Date: Thu, 3 Dec 2020 16:13:28 -0500
From: "bfields@fieldses.org" <bfields@fieldses.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20201203211328.GC27931@fieldses.org>
References: <279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
	<20201203185109.GB27931@fieldses.org>
	<4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
MIME-Version: 1.0
In-Reply-To: <4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3LDZj3002628
X-loop: linux-cachefs@redhat.com
Cc: "daire@dneg.com" <daire@dneg.com>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMDg6Mjc6MzlQTSArMDAwMCwgVHJvbmQgTXlrbGVidXN0
IHdyb3RlOgo+IE9uIFRodSwgMjAyMC0xMi0wMyBhdCAxMzo1MSAtMDUwMCwgYmZpZWxkcyB3cm90
ZToKPiA+IEkndmUgYmVlbiBzY3JhdGNoaW5nIG15IGhlYWQgb3ZlciBob3cgdG8gaGFuZGxlIHJl
Ym9vdCBvZiBhIHJlLQo+ID4gZXhwb3J0aW5nCj4gPiBzZXJ2ZXIuwqAgSSB0aGluayBvbmUgd2F5
IHRvIGZpeCBpdCBtaWdodCBiZSBqdXN0IHRvIGFsbG93IHRoZSByZS0KPiA+IGV4cG9ydAo+ID4g
c2VydmVyIHRvIHBhc3MgYWxvbmcgcmVjbGFpbXMgdG8gdGhlIG9yaWdpbmFsIHNlcnZlciBhcyBp
dCByZWNlaXZlcwo+ID4gdGhlbQo+ID4gZnJvbSBpdHMgb3duIGNsaWVudHMuwqAgSXQgbWlnaHQg
cmVxdWlyZSBzb21lIHByb3RvY29sIHR3ZWFrcywgSSdtIG5vdAo+ID4gc3VyZS7CoCBJJ2xsIHRy
eSB0byBnZXQgbXkgdGhvdWdodHMgaW4gb3JkZXIgYW5kIHByb3Bvc2Ugc29tZXRoaW5nLgo+ID4g
Cj4gCj4gSXQncyBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gdGhhdC4gSWYgdGhlIHJlLWV4cG9ydGlu
ZyBzZXJ2ZXIgcmVib290cywKPiBidXQgdGhlIG9yaWdpbmFsIHNlcnZlciBkb2VzIG5vdCwgdGhl
biB1bmxlc3MgdGhhdCByZS1leHBvcnRpbmcgc2VydmVyCj4gcGVyc2lzdGVkIGl0cyBsZWFzZSBh
bmQgYSBmdWxsIHNldCBvZiBzdGF0ZWlkcyBzb21ld2hlcmUsIGl0IHdpbGwgbm90Cj4gYmUgYWJs
ZSB0byBhdG9taWNhbGx5IHJlY2xhaW0gZGVsZWdhdGlvbiBhbmQgbG9jayBzdGF0ZSBvbiB0aGUg
c2VydmVyCj4gb24gYmVoYWxmIG9mIGl0cyBjbGllbnRzLgoKQnkgc2VuZGluZyByZWNsYWltcyB0
byB0aGUgb3JpZ2luYWwgc2VydmVyLCBJIG1lYW4gbGl0ZXJhbGx5IHNlbmRpbmcgbmV3Cm9wZW4g
YW5kIGxvY2sgcmVxdWVzdHMgd2l0aCB0aGUgUkVDTEFJTSBiaXQgc2V0LCB3aGljaCB3b3VsZCBn
ZXQgYnJhbmQKbmV3IHN0YXRlaWRzLgoKU28sIHRoZSBvcmlnaW5hbCBzZXJ2ZXIgd291bGQgaW52
YWxpZGF0ZSB0aGUgZXhpc3RpbmcgY2xpZW50J3MgcHJldmlvdXMKY2xpZW50aWQgYW5kIHN0YXRl
aWRzLS1qdXN0IGFzIGl0IG5vcm1hbGx5IHdvdWxkIG9uIHJlYm9vdC0tYnV0IGl0IHdvdWxkCm9w
dGlvbmFsbHkgcmVtZW1iZXIgdGhlIHVuZGVybHlpbmcgbG9ja3MgaGVsZCBieSB0aGUgY2xpZW50
IGFuZCBhbGxvdwpjb21wYXRpYmxlIGxvY2sgcmVjbGFpbXMuCgpSb3VnaCBhdHRlbXB0OgoKCWh0
dHBzOi8vd2lraS5saW51eC1uZnMub3JnL3dpa2kvaW5kZXgucGhwL1JlYm9vdF9yZWNvdmVyeV9m
b3JfcmUtZXhwb3J0X3NlcnZlcnMKClRoaW5rIGl0IHdvdWxkIGZseT8KCi0tYi4KCgotLQpMaW51
eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6Ly93
d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnM=

