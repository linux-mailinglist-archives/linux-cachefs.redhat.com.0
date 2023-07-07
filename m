Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5974C74B620
	for <lists+linux-cachefs@lfdr.de>; Fri,  7 Jul 2023 20:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688753575;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V+LSUPGW3YI/XVA+8v/Ty2ucWCOlmifDs9JPZeLLMx0=;
	b=YpoIQ5sQyGC/JGAWOdZAQJ5xM0SM/F1LbqibRTTmfMvORmnnuo8C/0qfyBSboe5PYbKa/S
	aqBpQ1TDY/Q3MtvhiHbuoSzYATyN8PlbDwoojgEoSl+XYKqD4+Mf6L9lUKN4zmQOuBtq8I
	wnAoJ+OmdxRQqsGHBJC8glbwPgtT+qI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-HwtdePnbO3-aeeZDKwIJhg-1; Fri, 07 Jul 2023 14:12:50 -0400
X-MC-Unique: HwtdePnbO3-aeeZDKwIJhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 443CE858EED;
	Fri,  7 Jul 2023 18:12:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7F0E4087C6A;
	Fri,  7 Jul 2023 18:12:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1536E1946A61;
	Fri,  7 Jul 2023 18:12:47 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EA1A61946A54 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  7 Jul 2023 18:12:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9064B4087C6B; Fri,  7 Jul 2023 18:12:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8896C4087C6A
 for <linux-cachefs@redhat.com>; Fri,  7 Jul 2023 18:12:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68B9B1C05138
 for <linux-cachefs@redhat.com>; Fri,  7 Jul 2023 18:12:45 +0000 (UTC)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-MZ9JFxedOleB810GvcTSIQ-1; Fri, 07 Jul 2023 14:12:44 -0400
X-MC-Unique: MZ9JFxedOleB810GvcTSIQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-262e5e719eeso2833470a91.1
 for <linux-cachefs@redhat.com>; Fri, 07 Jul 2023 11:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688753563; x=1691345563;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dYp6SX4idj0K2s8mMqxJ4XFt6H9/PBaHUEfz7SiAvZA=;
 b=gZk7R0dYczxrPBBB4TJ8fXsd/D1R048+ak7VOLkmcvt+V6uShuTiqgsa3yHB/l7qyR
 DcXPePqDNtBMA3Xkq5bAB5ONja9HbhbCqm8rJK6mCRNvRAwrtzJaCATWGmyvuPAvKOZz
 /j+YOHj/4tJanlPfs+ys0H9i3jZmjzgUXaZBgMXe8na3eNEs9HeFK85VC71yr/oaZLVE
 2eC67NiFpcwBG3NpsZ+gmteNsw592TPW01Zw0cCtWT050OxwrJ6iEylsLb8viVCoFqO5
 R+dZ1FWQM3urPcpS5/bQT/BaCOFWO41Kkmr8Ce61k6I+HsGqhn1Rm9VbJgGgDPE57qYS
 Jk8w==
X-Gm-Message-State: ABy/qLbO1hsBUDfCh76xAj87bVRQ8jH/uOu+GirTZ8RMZu4ZReqQAhln
 TqqR/RPxwR6YYmFPsgvKIOOvz8edtbVQhvTGMldVrvtWvOeXiaBMwfjacq4T4kHPRmJHqKA9a22
 mkWSqB0WLY4xYwT6aDQLgdXFiRI59qG9rw6KZUQ==
X-Received: by 2002:a17:90a:bd01:b0:262:b229:7e45 with SMTP id
 y1-20020a17090abd0100b00262b2297e45mr4613494pjr.11.1688753563139; 
 Fri, 07 Jul 2023 11:12:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG6u68dTynLKu27IgkCmRz2kNSu4UGaUBT2IU6X1iGZYQeExxypGVXNQUOEHGzK3cyz6ytMfUjBA5GoKXPvaz8=
X-Received: by 2002:a17:90a:bd01:b0:262:b229:7e45 with SMTP id
 y1-20020a17090abd0100b00262b2297e45mr4613468pjr.11.1688753562822; Fri, 07 Jul
 2023 11:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230628104852.3391651-1-dhowells@redhat.com>
 <20230628104852.3391651-3-dhowells@redhat.com>
 <ZKg/J3OG3kQ9ynSO@fedora>
 <CAB=+i9Qbi7+o90Cd_ecd1TeaAYnWPcO-gNp7kzc95Pxecy0XTw@mail.gmail.com>
In-Reply-To: <CAB=+i9Qbi7+o90Cd_ecd1TeaAYnWPcO-gNp7kzc95Pxecy0XTw@mail.gmail.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Fri, 7 Jul 2023 14:12:06 -0400
Message-ID: <CALF+zO=nGdoxcT-ya3aaUCBi-4iKPo3kZyzcWYCKMCf4n2wVbA@mail.gmail.com>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Linux-cachefs] [BUG mm-unstable] BUG: KASAN: use-after-free in
 shrink_folio_list+0x9f4/0x1ae0
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Dominique Martinet <asmadeus@codewreck.org>, linux-mm@kvack.org,
 linux-afs@lists.infradead.org, Shyam Prasad N <nspmangalore@gmail.com>,
 linux-cifs@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-cachefs@redhat.com,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBKdWwgNywgMjAyMyBhdCAxMjo0NuKAr1BNIEh5ZW9uZ2dvbiBZb28gPDQyLmh5ZXlv
b0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBKdWwgOCwgMjAyMyBhdCAxOjM54oCvQU0g
SHllb25nZ29uIFlvbyA8NDIuaHlleW9vQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2Vk
LCBKdW4gMjgsIDIwMjMgYXQgMTE6NDg6NTJBTSArMDEwMCwgRGF2aWQgSG93ZWxscyB3cm90ZToK
PiA+ID4gRnNjYWNoZSBoYXMgYW4gb3B0aW1pc2F0aW9uIGJ5IHdoaWNoIHJlYWRzIGZyb20gdGhl
IGNhY2hlIGFyZSBza2lwcGVkIHVudGlsCj4gPiA+IHdlIGtub3cgdGhhdCAoYSkgdGhlcmUncyBk
YXRhIHRoZXJlIHRvIGJlIHJlYWQgYW5kIChiKSB0aGF0IGRhdGEgaXNuJ3QKPiA+ID4gZW50aXJl
bHkgY292ZXJlZCBieSBwYWdlcyByZXNpZGVudCBpbiB0aGUgbmV0ZnMgcGFnZWNhY2hlLiAgVGhp
cyBpcyBkb25lCj4gPiA+IHdpdGggdHdvIGZsYWdzIG1hbmlwdWxhdGVkIGJ5IGZzY2FjaGVfbm90
ZV9wYWdlX3JlbGVhc2UoKToKPiA+ID4KPiA+ID4gICAgICAgaWYgKC4uLgo+ID4gPiAgICAgICAg
ICAgdGVzdF9iaXQoRlNDQUNIRV9DT09LSUVfSEFWRV9EQVRBLCAmY29va2llLT5mbGFncykgJiYK
PiA+ID4gICAgICAgICAgIHRlc3RfYml0KEZTQ0FDSEVfQ09PS0lFX05PX0RBVEFfVE9fUkVBRCwg
JmNvb2tpZS0+ZmxhZ3MpKQo+ID4gPiAgICAgICAgICAgICAgIGNsZWFyX2JpdChGU0NBQ0hFX0NP
T0tJRV9OT19EQVRBX1RPX1JFQUQsICZjb29raWUtPmZsYWdzKTsKPiA+ID4KPiA+ID4gd2hlcmUg
dGhlIE5PX0RBVEFfVE9fUkVBRCBmbGFnIGNhdXNlcyBjYWNoZWZpbGVzX3ByZXBhcmVfcmVhZCgp
IHRvIGluZGljYXRlCj4gPiA+IHRoYXQgbmV0ZnNsaWIgc2hvdWxkIGRvd25sb2FkIGZyb20gdGhl
IHNlcnZlciBvciBjbGVhciB0aGUgcGFnZSBpbnN0ZWFkLgo+ID4gPgo+ID4gPiBUaGUgZnNjYWNo
ZV9ub3RlX3BhZ2VfcmVsZWFzZSgpIGZ1bmN0aW9uIGlzIGludGVuZGVkIHRvIGJlIGNhbGxlZCBm
cm9tCj4gPiA+IC0+cmVsZWFzZXBhZ2UoKSAtIGJ1dCB0aGF0IG9ubHkgZ2V0cyBjYWxsZWQgaWYg
UEdfcHJpdmF0ZSBvciBQR19wcml2YXRlXzIKPiA+ID4gaXMgc2V0IC0gYW5kIGN1cnJlbnRseSB0
aGUgZm9ybWVyIGlzIGF0IHRoZSBkaXNjcmV0aW9uIG9mIHRoZSBuZXR3b3JrCj4gPiA+IGZpbGVz
eXN0ZW0gYW5kIHRoZSBsYXR0ZXIgaXMgb25seSBzZXQgd2hpbHN0IGEgcGFnZSBpcyBiZWluZyB3
cml0dGVuIHRvIHRoZQo+ID4gPiBjYWNoZSwgc28gc29tZXRpbWVzIHdlIG1pc3MgY2xlYXJpbmcg
dGhlIG9wdGltaXNhdGlvbi4KPiA+ID4KPiA+ID4gRml4IHRoaXMgYnkgZm9sbG93aW5nIFdpbGx5
J3Mgc3VnZ2VzdGlvblsxXSBhbmQgYWRkaW5nIGFuIGFkZHJlc3Nfc3BhY2UKPiA+ID4gZmxhZywg
QVNfUkVMRUFTRV9BTFdBWVMsIHRoYXQgY2F1c2VzIGZpbGVtYXBfcmVsZWFzZV9mb2xpbygpIHRv
IGFsd2F5cyBjYWxsCj4gPiA+IC0+cmVsZWFzZV9mb2xpbygpIGlmIGl0J3Mgc2V0LCBldmVuIGlm
IFBHX3ByaXZhdGUgb3IgUEdfcHJpdmF0ZV8yIGFyZW4ndAo+ID4gPiBzZXQuCj4gPiA+Cj4gPiA+
IE5vdGUgdGhhdCB0aGlzIHdvdWxkIHJlcXVpcmUgZm9saW9fdGVzdF9wcml2YXRlKCkgYW5kIHBh
Z2VfaGFzX3ByaXZhdGUoKSB0bwo+ID4gPiBiZWNvbWUgbW9yZSBjb21wbGljYXRlZC4gIFRvIGF2
b2lkIHRoYXQsIGluIHRoZSBwbGFjZXNbKl0gd2hlcmUgdGhlc2UgYXJlCj4gPiA+IHVzZWQgdG8g
Y29uZGl0aW9uYWxpc2UgY2FsbHMgdG8gZmlsZW1hcF9yZWxlYXNlX2ZvbGlvKCkgYW5kCj4gPiA+
IHRyeV90b19yZWxlYXNlX3BhZ2UoKSwgdGhlIHRlc3RzIGFyZSByZW1vdmVkIHRoZSB0aG9zZSBm
dW5jdGlvbnMganVzdAo+ID4gPiBqdW1wZWQgdG8gdW5jb25kaXRpb25hbGx5IGFuZCB0aGUgdGVz
dCBpcyBwZXJmb3JtZWQgdGhlcmUuCj4gPiA+Cj4gPiA+IFsqXSBUaGVyZSBhcmUgc29tZSBleGNl
cHRpb25zIGluIHZtc2Nhbi5jIHdoZXJlIHRoZSBjaGVjayBndWFyZHMgbW9yZSB0aGFuCj4gPiA+
IGp1c3QgYSBjYWxsIHRvIHRoZSByZWxlYXNlci4gIEkndmUgYWRkZWQgYSBmdW5jdGlvbiwgZm9s
aW9fbmVlZHNfcmVsZWFzZSgpCj4gPiA+IHRvIHdyYXAgYWxsIHRoZSBjaGVja3MgZm9yIHRoYXQu
Cj4gPiA+Cj4gPiA+IEFTX1JFTEVBU0VfQUxXQVlTIHNob3VsZCBiZSBzZXQgaWYgYSBub24tTlVM
TCBjb29raWUgaXMgb2J0YWluZWQgZnJvbQo+ID4gPiBmc2NhY2hlIGFuZCBjbGVhcmVkIGluIC0+
ZXZpY3RfaW5vZGUoKSBiZWZvcmUgdHJ1bmNhdGVfaW5vZGVfcGFnZXNfZmluYWwoKQo+ID4gPiBp
cyBjYWxsZWQuCj4gPiA+Cj4gPiA+IEFkZGl0aW9uYWxseSwgdGhlIEZTQ0FDSEVfQ09PS0lFX05P
X0RBVEFfVE9fUkVBRCBmbGFnIG5lZWRzIHRvIGJlIGNsZWFyZWQKPiA+ID4gYW5kIHRoZSBvcHRp
bWlzYXRpb24gY2FuY2VsbGVkIGlmIGEgY2FjaGVmaWxlcyBvYmplY3QgYWxyZWFkeSBjb250YWlu
cyBkYXRhCj4gPiA+IHdoZW4gd2Ugb3BlbiBpdC4KPiA+ID4KPiA+ID4gRml4ZXM6IDFmNjdlNmQw
YjE4OCAoImZzY2FjaGU6IFByb3ZpZGUgYSBmdW5jdGlvbiB0byBub3RlIHRoZSByZWxlYXNlIG9m
IGEgcGFnZSIpCj4gPiA+IEZpeGVzOiAwNDc0ODdjOTQ3ZTggKCJjYWNoZWZpbGVzOiBJbXBsZW1l
bnQgdGhlIEkvTyByb3V0aW5lcyIpCj4gPiA+IFJlcG9ydGVkLWJ5OiBSb2hpdGggU3VyYWJhdHR1
bGEgPHJvaGl0aHMubXNmdEBnbWFpbC5jb20+Cj4gPiA+IFN1Z2dlc3RlZC1ieTogTWF0dGhldyBX
aWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEhv
d2VsbHMgPGRob3dlbGxzQHJlZGhhdC5jb20+Cj4gPgo+ID4gSGkgRGF2aWQsCj4gPgo+ID4gSSB3
YXMgYmlzZWN0aW5nIGEgdXNlLWFmdGVyLWZyZWUgQlVHIG9uIHRoZSBsYXRlc3QgbW0tdW5zdGFi
bGUsCj4gPiB3aGVyZSBIRUFEIGlzIDM0N2UyMDhkZTBlNCAoInJtYXA6IHBhc3MgdGhlIGZvbGlv
IHRvIF9fcGFnZV9jaGVja19hbm9uX3JtYXAoKSIpLgo+ID4KPiA+IEFjY29yZGluZyB0byBteSBi
aXNlY3Rpb24sIHRoaXMgaXMgdGhlIGZpcnN0IGJhZCBjb21taXQuCj4gPiBVc2UtQWZ0ZXItRnJl
ZSBpcyB0cmlnZ2VyZWQgb24gcmVjbGFtYXRpb24gcGF0aCB3aGVuIHN3YXAgaXMgZW5hYmxlZC4K
Pgo+IFRoaXMgd2FzIG9yaWdpbmFsbHkgb2NjdXJyZWQgZHVyaW5nIGtlcm5lbCBjb21waWxhdGlv
biBidXQKPiBjYW4gZWFzaWx5IGJlIHJlcHJvZHVjZWQgdmlhOgo+Cj4gc3RyZXNzLW5nIC0tYmln
aGVhcCAkKG5wcm9jKQo+Cj4gPiAoYW5kIGNvdWxkbid0IHRyaWdnZXIgd2l0aG91dCBzd2FwIGVu
YWJsZWQpCj4gPgo+ID4gdGhlIGNvbmZpZywgS0FTQU4gc3BsYXQsIGJpc2VjdCBsb2cgYXJlIGF0
dGFjaGVkLgo+ID4gaG9wZSB0aGlzIGlzbid0IHRvbyBsYXRlIDooCj4gPgo+ID4gPiBjYzogTWF0
dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+Cj4gPiA+IGNjOiBMaW51cyBUb3J2YWxk
cyA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gPiA+IGNjOiBTdGV2ZSBGcmVuY2gg
PHNmcmVuY2hAc2FtYmEub3JnPgo+ID4gPiBjYzogU2h5YW0gUHJhc2FkIE4gPG5zcG1hbmdhbG9y
ZUBnbWFpbC5jb20+Cj4gPiA+IGNjOiBSb2hpdGggU3VyYWJhdHR1bGEgPHJvaGl0aHMubXNmdEBn
bWFpbC5jb20+Cj4gPiA+IGNjOiBEYXZlIFd5c29jaGFuc2tpIDxkd3lzb2NoYUByZWRoYXQuY29t
Pgo+ID4gPiBjYzogRG9taW5pcXVlIE1hcnRpbmV0IDxhc21hZGV1c0Bjb2Rld3JlY2sub3JnPgo+
ID4gPiBjYzogSWx5YSBEcnlvbW92IDxpZHJ5b21vdkBnbWFpbC5jb20+Cj4gPiA+IGNjOiBsaW51
eC1jYWNoZWZzQHJlZGhhdC5jb20KPiA+ID4gY2M6IGxpbnV4LWNpZnNAdmdlci5rZXJuZWwub3Jn
Cj4gPiA+IGNjOiBsaW51eC1hZnNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiBjYzogdjlmcy1k
ZXZlbG9wZXJAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gPiA+IGNjOiBjZXBoLWRldmVsQHZnZXIu
a2VybmVsLm9yZwo+ID4gPiBjYzogbGludXgtbmZzQHZnZXIua2VybmVsLm9yZwo+ID4gPiBjYzog
bGludXgtZnNkZXZlbEB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gY2M6IGxpbnV4LW1tQGt2YWNrLm9y
Zwo+ID4gPiAtLS0KPiA+ID4KPiA+ID4gTm90ZXM6Cj4gPiA+ICAgICB2ZXIgIzcpCj4gPiA+ICAg
ICAgLSBNYWtlIE5GUyBzZXQgQVNfUkVMRUFTRV9BTFdBWVMuCj4gPiA+Cj4gPiA+ICAgICB2ZXIg
IzQpCj4gPiA+ICAgICAgLSBTcGxpdCBvdXQgbWVyZ2luZyBvZiBmb2xpb19oYXNfcHJpdmF0ZSgp
L2ZpbGVtYXBfcmVsZWFzZV9mb2xpbygpIGNhbGwKPiA+ID4gICAgICAgIHBhaXJzIGludG8gYSBw
cmVjZWRpbmcgcGF0Y2guCj4gPiA+ICAgICAgLSBEb24ndCBuZWVkIHRvIGNsZWFyIEFTX1JFTEVB
U0VfQUxXQVlTIGluIC0+ZXZpY3RfaW5vZGUoKS4KPiA+ID4KPiA+ID4gICAgIHZlciAjMykKPiA+
ID4gICAgICAtIEZpeGVkIG1hcHBpbmdfY2xlYXJfcmVsZWFzZV9hbHdheXMoKSB0byB1c2UgY2xl
YXJfYml0KCkgbm90IHNldF9iaXQoKS4KPiA+ID4gICAgICAtIE1vdmVkIGEgJyYmJyB0byB0aGUg
Y29ycmVjdCBsaW5lLgo+ID4gPgo+ID4gPiAgICAgdmVyICMyKQo+ID4gPiAgICAgIC0gUmV3cm90
ZSBlbnRpcmVseSBhY2NvcmRpbmcgdG8gV2lsbHkncyBzdWdnZXN0aW9uWzFdLgo+ID4gPgo+ID4g
PiAgZnMvOXAvY2FjaGUuYyAgICAgICAgICAgfCAgMiArKwo+ID4gPiAgZnMvYWZzL2ludGVybmFs
LmggICAgICAgfCAgMiArKwo+ID4gPiAgZnMvY2FjaGVmaWxlcy9uYW1laS5jICAgfCAgMiArKwo+
ID4gPiAgZnMvY2VwaC9jYWNoZS5jICAgICAgICAgfCAgMiArKwo+ID4gPiAgZnMvbmZzL2ZzY2Fj
aGUuYyAgICAgICAgfCAgMyArKysKPiA+ID4gIGZzL3NtYi9jbGllbnQvZnNjYWNoZS5jIHwgIDIg
KysKPiA+ID4gIGluY2x1ZGUvbGludXgvcGFnZW1hcC5oIHwgMTYgKysrKysrKysrKysrKysrKwo+
ID4gPiAgbW0vaW50ZXJuYWwuaCAgICAgICAgICAgfCAgNSArKysrLQo+ID4gPiAgOCBmaWxlcyBj
aGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgoKSSB0aGluayBteXNlbGYg
LyBEYWlyZSBCeXJuZSBtYXkgaGF2ZSBhbHJlYWR5IHRyYWNrZWQgdGhpcyBkb3duIGFuZCBJCmZv
dW5kIGEgMS1saW5lciB0aGF0IGZpeGVkIGEgc2ltaWxhciBjcmFzaCBpbiBoaXMgZW52aXJvbm1l
bnQuCgpDYW4geW91IHRyeSB0aGlzIHBhdGNoIG9uIHRvcCBhbmQgbGV0IG1lIGtub3cgaWYgaXQg
c3RpbGwgY3Jhc2hlcz8KaHR0cHM6Ly9naXRodWIuY29tL0RhdmVXeXNvY2hhbnNraVJIL2tlcm5l
bC9jb21taXQvOTAyYzk5MGUzMTExMjAxNzlmYTVkZTk5ZDY4MzY0YjI5NDdiNzllYwoKLS0KTGlu
dXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKTGludXgtY2FjaGVmc0ByZWRoYXQuY29tCmh0dHBzOi8v
bGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVmcwo=

