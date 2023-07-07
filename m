Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AF174B836
	for <lists+linux-cachefs@lfdr.de>; Fri,  7 Jul 2023 22:43:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688762610;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dGRDiqxkrwtK5+dBMmwrXO8HI73jMjsxOjLMpwz3x3A=;
	b=aXa3QK5wA42mh6Sf++/aX9vEPIZQ1lDGo/jgL1yTrmUNPhyMhC9clwbPkLMb3KaVT1GVvJ
	hSXYuuBF0y6Mszob6ZoLPc3I1t6g99HduC/rRBaqgEJeQqXL23MVpOdIHntoiU1a8hJnOA
	lNNiEPL/46FreitcjX9skSThcXfofOs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-O64VuVi6PsCU1T8EpaM81w-1; Fri, 07 Jul 2023 16:43:27 -0400
X-MC-Unique: O64VuVi6PsCU1T8EpaM81w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6AFB101A54E;
	Fri,  7 Jul 2023 20:43:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 94B1D4CD0C7;
	Fri,  7 Jul 2023 20:43:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CA6051946A6F;
	Fri,  7 Jul 2023 20:43:21 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 10EB11946A54 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  7 Jul 2023 18:28:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BDBE8F66A2; Fri,  7 Jul 2023 18:28:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6F11F643A
 for <linux-cachefs@redhat.com>; Fri,  7 Jul 2023 18:28:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A488830EFF
 for <linux-cachefs@redhat.com>; Fri,  7 Jul 2023 18:28:03 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-5By8drsiNpqS5qc6nqWlEA-1; Fri, 07 Jul 2023 14:28:00 -0400
X-MC-Unique: 5By8drsiNpqS5qc6nqWlEA-1
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3a37909a64eso1797755b6e.1; 
 Fri, 07 Jul 2023 11:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688754479; x=1691346479;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iYQfxXiGIbONBSMq6Yza7HFvxxB0EcOOzA9wruYd9/s=;
 b=BxCuG2XBYbULo31E5iharvVTJh+7+5zdPlxUjmhhyScpEdcp2GWMl/lZPOEED7FPTg
 ZMiUdWcHNDeICeBhJN9LB3K3aNzPmwfm9PSgbcjvMARJTfVKd5ODWDuWh1020zVrxMVH
 DTRrIBjD78ZAr2oXxyftr0+OpRqPOocWFG3lqsXnjumOut9KyxCIHbv4TOcwrIK2JYHs
 ZnHp1uRzPwJevG0hNsUT6ZmMg+RHUelFDwBkNKATwUUN+KWenGQ2EQeW3fMbjsVLA65A
 g+r3xGljBBLSU4f8qNwWoFfuRoaxAg3buF/YMXSzw+3cmhbT0Gv9wkP1H28TMzM7ObQM
 5T1Q==
X-Gm-Message-State: ABy/qLYOfnSIlT/QEXlwaxQXNdhCGB+iFlAMdFuTqU61H5ab3x21dldK
 n9LXmEalGWXU2YV0SXWq1H5/JUaZJjb8NFNe
X-Google-Smtp-Source: APBJJlGyNnx65V8DrUjHW0YCJrqFGc33K7OB7NDJ9VF8y/PY5FmBu9OfcUtqWP5Qz4NxceHxptdnHQ==
X-Received: by 2002:a05:6808:202a:b0:3a3:d153:2723 with SMTP id
 q42-20020a056808202a00b003a3d1532723mr6588090oiw.29.1688754478621; 
 Fri, 07 Jul 2023 11:27:58 -0700 (PDT)
Received: from fedora ([121.135.181.61]) by smtp.gmail.com with ESMTPSA id
 fe27-20020a056a002f1b00b0064d47cd117esm3189901pfb.39.2023.07.07.11.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 11:27:58 -0700 (PDT)
Date: Sat, 8 Jul 2023 03:27:42 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: David Wysochanski <dwysocha@redhat.com>
Message-ID: <ZKhZHg6LSGnvryIe@fedora>
References: <20230628104852.3391651-1-dhowells@redhat.com>
 <20230628104852.3391651-3-dhowells@redhat.com>
 <ZKg/J3OG3kQ9ynSO@fedora>
 <CAB=+i9Qbi7+o90Cd_ecd1TeaAYnWPcO-gNp7kzc95Pxecy0XTw@mail.gmail.com>
 <CALF+zO=nGdoxcT-ya3aaUCBi-4iKPo3kZyzcWYCKMCf4n2wVbA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALF+zO=nGdoxcT-ya3aaUCBi-4iKPo3kZyzcWYCKMCf4n2wVbA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Fri, 07 Jul 2023 20:43:21 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBKdWwgMDcsIDIwMjMgYXQgMDI6MTI6MDZQTSAtMDQwMCwgRGF2aWQgV3lzb2NoYW5z
a2kgd3JvdGU6Cj4gT24gRnJpLCBKdWwgNywgMjAyMyBhdCAxMjo0NuKAr1BNIEh5ZW9uZ2dvbiBZ
b28gPDQyLmh5ZXlvb0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFNhdCwgSnVsIDgsIDIw
MjMgYXQgMTozOeKAr0FNIEh5ZW9uZ2dvbiBZb28gPDQyLmh5ZXlvb0BnbWFpbC5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBPbiBXZWQsIEp1biAyOCwgMjAyMyBhdCAxMTo0ODo1MkFNICswMTAwLCBE
YXZpZCBIb3dlbGxzIHdyb3RlOgo+ID4gPiA+IEZzY2FjaGUgaGFzIGFuIG9wdGltaXNhdGlvbiBi
eSB3aGljaCByZWFkcyBmcm9tIHRoZSBjYWNoZSBhcmUgc2tpcHBlZCB1bnRpbAo+ID4gPiA+IHdl
IGtub3cgdGhhdCAoYSkgdGhlcmUncyBkYXRhIHRoZXJlIHRvIGJlIHJlYWQgYW5kIChiKSB0aGF0
IGRhdGEgaXNuJ3QKPiA+ID4gPiBlbnRpcmVseSBjb3ZlcmVkIGJ5IHBhZ2VzIHJlc2lkZW50IGlu
IHRoZSBuZXRmcyBwYWdlY2FjaGUuICBUaGlzIGlzIGRvbmUKPiA+ID4gPiB3aXRoIHR3byBmbGFn
cyBtYW5pcHVsYXRlZCBieSBmc2NhY2hlX25vdGVfcGFnZV9yZWxlYXNlKCk6Cj4gPiA+ID4KPiA+
ID4gPiAgICAgICBpZiAoLi4uCj4gPiA+ID4gICAgICAgICAgIHRlc3RfYml0KEZTQ0FDSEVfQ09P
S0lFX0hBVkVfREFUQSwgJmNvb2tpZS0+ZmxhZ3MpICYmCj4gPiA+ID4gICAgICAgICAgIHRlc3Rf
Yml0KEZTQ0FDSEVfQ09PS0lFX05PX0RBVEFfVE9fUkVBRCwgJmNvb2tpZS0+ZmxhZ3MpKQo+ID4g
PiA+ICAgICAgICAgICAgICAgY2xlYXJfYml0KEZTQ0FDSEVfQ09PS0lFX05PX0RBVEFfVE9fUkVB
RCwgJmNvb2tpZS0+ZmxhZ3MpOwo+ID4gPiA+Cj4gPiA+ID4gd2hlcmUgdGhlIE5PX0RBVEFfVE9f
UkVBRCBmbGFnIGNhdXNlcyBjYWNoZWZpbGVzX3ByZXBhcmVfcmVhZCgpIHRvIGluZGljYXRlCj4g
PiA+ID4gdGhhdCBuZXRmc2xpYiBzaG91bGQgZG93bmxvYWQgZnJvbSB0aGUgc2VydmVyIG9yIGNs
ZWFyIHRoZSBwYWdlIGluc3RlYWQuCj4gPiA+ID4KPiA+ID4gPiBUaGUgZnNjYWNoZV9ub3RlX3Bh
Z2VfcmVsZWFzZSgpIGZ1bmN0aW9uIGlzIGludGVuZGVkIHRvIGJlIGNhbGxlZCBmcm9tCj4gPiA+
ID4gLT5yZWxlYXNlcGFnZSgpIC0gYnV0IHRoYXQgb25seSBnZXRzIGNhbGxlZCBpZiBQR19wcml2
YXRlIG9yIFBHX3ByaXZhdGVfMgo+ID4gPiA+IGlzIHNldCAtIGFuZCBjdXJyZW50bHkgdGhlIGZv
cm1lciBpcyBhdCB0aGUgZGlzY3JldGlvbiBvZiB0aGUgbmV0d29yawo+ID4gPiA+IGZpbGVzeXN0
ZW0gYW5kIHRoZSBsYXR0ZXIgaXMgb25seSBzZXQgd2hpbHN0IGEgcGFnZSBpcyBiZWluZyB3cml0
dGVuIHRvIHRoZQo+ID4gPiA+IGNhY2hlLCBzbyBzb21ldGltZXMgd2UgbWlzcyBjbGVhcmluZyB0
aGUgb3B0aW1pc2F0aW9uLgo+ID4gPiA+Cj4gPiA+ID4gRml4IHRoaXMgYnkgZm9sbG93aW5nIFdp
bGx5J3Mgc3VnZ2VzdGlvblsxXSBhbmQgYWRkaW5nIGFuIGFkZHJlc3Nfc3BhY2UKPiA+ID4gPiBm
bGFnLCBBU19SRUxFQVNFX0FMV0FZUywgdGhhdCBjYXVzZXMgZmlsZW1hcF9yZWxlYXNlX2ZvbGlv
KCkgdG8gYWx3YXlzIGNhbGwKPiA+ID4gPiAtPnJlbGVhc2VfZm9saW8oKSBpZiBpdCdzIHNldCwg
ZXZlbiBpZiBQR19wcml2YXRlIG9yIFBHX3ByaXZhdGVfMiBhcmVuJ3QKPiA+ID4gPiBzZXQuCj4g
PiA+ID4KPiA+ID4gPiBOb3RlIHRoYXQgdGhpcyB3b3VsZCByZXF1aXJlIGZvbGlvX3Rlc3RfcHJp
dmF0ZSgpIGFuZCBwYWdlX2hhc19wcml2YXRlKCkgdG8KPiA+ID4gPiBiZWNvbWUgbW9yZSBjb21w
bGljYXRlZC4gIFRvIGF2b2lkIHRoYXQsIGluIHRoZSBwbGFjZXNbKl0gd2hlcmUgdGhlc2UgYXJl
Cj4gPiA+ID4gdXNlZCB0byBjb25kaXRpb25hbGlzZSBjYWxscyB0byBmaWxlbWFwX3JlbGVhc2Vf
Zm9saW8oKSBhbmQKPiA+ID4gPiB0cnlfdG9fcmVsZWFzZV9wYWdlKCksIHRoZSB0ZXN0cyBhcmUg
cmVtb3ZlZCB0aGUgdGhvc2UgZnVuY3Rpb25zIGp1c3QKPiA+ID4gPiBqdW1wZWQgdG8gdW5jb25k
aXRpb25hbGx5IGFuZCB0aGUgdGVzdCBpcyBwZXJmb3JtZWQgdGhlcmUuCj4gPiA+ID4KPiA+ID4g
PiBbKl0gVGhlcmUgYXJlIHNvbWUgZXhjZXB0aW9ucyBpbiB2bXNjYW4uYyB3aGVyZSB0aGUgY2hl
Y2sgZ3VhcmRzIG1vcmUgdGhhbgo+ID4gPiA+IGp1c3QgYSBjYWxsIHRvIHRoZSByZWxlYXNlci4g
IEkndmUgYWRkZWQgYSBmdW5jdGlvbiwgZm9saW9fbmVlZHNfcmVsZWFzZSgpCj4gPiA+ID4gdG8g
d3JhcCBhbGwgdGhlIGNoZWNrcyBmb3IgdGhhdC4KPiA+ID4gPgo+ID4gPiA+IEFTX1JFTEVBU0Vf
QUxXQVlTIHNob3VsZCBiZSBzZXQgaWYgYSBub24tTlVMTCBjb29raWUgaXMgb2J0YWluZWQgZnJv
bQo+ID4gPiA+IGZzY2FjaGUgYW5kIGNsZWFyZWQgaW4gLT5ldmljdF9pbm9kZSgpIGJlZm9yZSB0
cnVuY2F0ZV9pbm9kZV9wYWdlc19maW5hbCgpCj4gPiA+ID4gaXMgY2FsbGVkLgo+ID4gPiA+Cj4g
PiA+ID4gQWRkaXRpb25hbGx5LCB0aGUgRlNDQUNIRV9DT09LSUVfTk9fREFUQV9UT19SRUFEIGZs
YWcgbmVlZHMgdG8gYmUgY2xlYXJlZAo+ID4gPiA+IGFuZCB0aGUgb3B0aW1pc2F0aW9uIGNhbmNl
bGxlZCBpZiBhIGNhY2hlZmlsZXMgb2JqZWN0IGFscmVhZHkgY29udGFpbnMgZGF0YQo+ID4gPiA+
IHdoZW4gd2Ugb3BlbiBpdC4KPiA+ID4gPgo+ID4gPiA+IEZpeGVzOiAxZjY3ZTZkMGIxODggKCJm
c2NhY2hlOiBQcm92aWRlIGEgZnVuY3Rpb24gdG8gbm90ZSB0aGUgcmVsZWFzZSBvZiBhIHBhZ2Ui
KQo+ID4gPiA+IEZpeGVzOiAwNDc0ODdjOTQ3ZTggKCJjYWNoZWZpbGVzOiBJbXBsZW1lbnQgdGhl
IEkvTyByb3V0aW5lcyIpCj4gPiA+ID4gUmVwb3J0ZWQtYnk6IFJvaGl0aCBTdXJhYmF0dHVsYSA8
cm9oaXRocy5tc2Z0QGdtYWlsLmNvbT4KPiA+ID4gPiBTdWdnZXN0ZWQtYnk6IE1hdHRoZXcgV2ls
Y294IDx3aWxseUBpbmZyYWRlYWQub3JnPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEhv
d2VsbHMgPGRob3dlbGxzQHJlZGhhdC5jb20+Cj4gPiA+Cj4gPiA+IEhpIERhdmlkLAo+ID4gPgo+
ID4gPiBJIHdhcyBiaXNlY3RpbmcgYSB1c2UtYWZ0ZXItZnJlZSBCVUcgb24gdGhlIGxhdGVzdCBt
bS11bnN0YWJsZSwKPiA+ID4gd2hlcmUgSEVBRCBpcyAzNDdlMjA4ZGUwZTQgKCJybWFwOiBwYXNz
IHRoZSBmb2xpbyB0byBfX3BhZ2VfY2hlY2tfYW5vbl9ybWFwKCkiKS4KPiA+ID4KPiA+ID4gQWNj
b3JkaW5nIHRvIG15IGJpc2VjdGlvbiwgdGhpcyBpcyB0aGUgZmlyc3QgYmFkIGNvbW1pdC4KPiA+
ID4gVXNlLUFmdGVyLUZyZWUgaXMgdHJpZ2dlcmVkIG9uIHJlY2xhbWF0aW9uIHBhdGggd2hlbiBz
d2FwIGlzIGVuYWJsZWQuCj4gPgo+ID4gVGhpcyB3YXMgb3JpZ2luYWxseSBvY2N1cnJlZCBkdXJp
bmcga2VybmVsIGNvbXBpbGF0aW9uIGJ1dAo+ID4gY2FuIGVhc2lseSBiZSByZXByb2R1Y2VkIHZp
YToKPiA+Cj4gPiBzdHJlc3MtbmcgLS1iaWdoZWFwICQobnByb2MpCj4gPgo+ID4gPiAoYW5kIGNv
dWxkbid0IHRyaWdnZXIgd2l0aG91dCBzd2FwIGVuYWJsZWQpCj4gPiA+Cj4gPiA+IHRoZSBjb25m
aWcsIEtBU0FOIHNwbGF0LCBiaXNlY3QgbG9nIGFyZSBhdHRhY2hlZC4KPiA+ID4gaG9wZSB0aGlz
IGlzbid0IHRvbyBsYXRlIDooCj4gPiA+Cj4gPiA+ID4gY2M6IE1hdHRoZXcgV2lsY294IDx3aWxs
eUBpbmZyYWRlYWQub3JnPgo+ID4gPiA+IGNjOiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGlu
dXgtZm91bmRhdGlvbi5vcmc+Cj4gPiA+ID4gY2M6IFN0ZXZlIEZyZW5jaCA8c2ZyZW5jaEBzYW1i
YS5vcmc+Cj4gPiA+ID4gY2M6IFNoeWFtIFByYXNhZCBOIDxuc3BtYW5nYWxvcmVAZ21haWwuY29t
Pgo+ID4gPiA+IGNjOiBSb2hpdGggU3VyYWJhdHR1bGEgPHJvaGl0aHMubXNmdEBnbWFpbC5jb20+
Cj4gPiA+ID4gY2M6IERhdmUgV3lzb2NoYW5za2kgPGR3eXNvY2hhQHJlZGhhdC5jb20+Cj4gPiA+
ID4gY2M6IERvbWluaXF1ZSBNYXJ0aW5ldCA8YXNtYWRldXNAY29kZXdyZWNrLm9yZz4KPiA+ID4g
PiBjYzogSWx5YSBEcnlvbW92IDxpZHJ5b21vdkBnbWFpbC5jb20+Cj4gPiA+ID4gY2M6IGxpbnV4
LWNhY2hlZnNAcmVkaGF0LmNvbQo+ID4gPiA+IGNjOiBsaW51eC1jaWZzQHZnZXIua2VybmVsLm9y
Zwo+ID4gPiA+IGNjOiBsaW51eC1hZnNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiA+IGNjOiB2
OWZzLWRldmVsb3BlckBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+ID4gPiBjYzogY2VwaC1kZXZl
bEB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gPiBjYzogbGludXgtbmZzQHZnZXIua2VybmVsLm9yZwo+
ID4gPiA+IGNjOiBsaW51eC1mc2RldmVsQHZnZXIua2VybmVsLm9yZwo+ID4gPiA+IGNjOiBsaW51
eC1tbUBrdmFjay5vcmcKPiA+ID4gPiAtLS0KPiA+ID4gPgo+ID4gPiA+IE5vdGVzOgo+ID4gPiA+
ICAgICB2ZXIgIzcpCj4gPiA+ID4gICAgICAtIE1ha2UgTkZTIHNldCBBU19SRUxFQVNFX0FMV0FZ
Uy4KPiA+ID4gPgo+ID4gPiA+ICAgICB2ZXIgIzQpCj4gPiA+ID4gICAgICAtIFNwbGl0IG91dCBt
ZXJnaW5nIG9mIGZvbGlvX2hhc19wcml2YXRlKCkvZmlsZW1hcF9yZWxlYXNlX2ZvbGlvKCkgY2Fs
bAo+ID4gPiA+ICAgICAgICBwYWlycyBpbnRvIGEgcHJlY2VkaW5nIHBhdGNoLgo+ID4gPiA+ICAg
ICAgLSBEb24ndCBuZWVkIHRvIGNsZWFyIEFTX1JFTEVBU0VfQUxXQVlTIGluIC0+ZXZpY3RfaW5v
ZGUoKS4KPiA+ID4gPgo+ID4gPiA+ICAgICB2ZXIgIzMpCj4gPiA+ID4gICAgICAtIEZpeGVkIG1h
cHBpbmdfY2xlYXJfcmVsZWFzZV9hbHdheXMoKSB0byB1c2UgY2xlYXJfYml0KCkgbm90IHNldF9i
aXQoKS4KPiA+ID4gPiAgICAgIC0gTW92ZWQgYSAnJiYnIHRvIHRoZSBjb3JyZWN0IGxpbmUuCj4g
PiA+ID4KPiA+ID4gPiAgICAgdmVyICMyKQo+ID4gPiA+ICAgICAgLSBSZXdyb3RlIGVudGlyZWx5
IGFjY29yZGluZyB0byBXaWxseSdzIHN1Z2dlc3Rpb25bMV0uCj4gPiA+ID4KPiA+ID4gPiAgZnMv
OXAvY2FjaGUuYyAgICAgICAgICAgfCAgMiArKwo+ID4gPiA+ICBmcy9hZnMvaW50ZXJuYWwuaCAg
ICAgICB8ICAyICsrCj4gPiA+ID4gIGZzL2NhY2hlZmlsZXMvbmFtZWkuYyAgIHwgIDIgKysKPiA+
ID4gPiAgZnMvY2VwaC9jYWNoZS5jICAgICAgICAgfCAgMiArKwo+ID4gPiA+ICBmcy9uZnMvZnNj
YWNoZS5jICAgICAgICB8ICAzICsrKwo+ID4gPiA+ICBmcy9zbWIvY2xpZW50L2ZzY2FjaGUuYyB8
ICAyICsrCj4gPiA+ID4gIGluY2x1ZGUvbGludXgvcGFnZW1hcC5oIHwgMTYgKysrKysrKysrKysr
KysrKwo+ID4gPiA+ICBtbS9pbnRlcm5hbC5oICAgICAgICAgICB8ICA1ICsrKystCj4gPiA+ID4g
IDggZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IAo+
IEkgdGhpbmsgbXlzZWxmIC8gRGFpcmUgQnlybmUgbWF5IGhhdmUgYWxyZWFkeSB0cmFja2VkIHRo
aXMgZG93biBhbmQgSQo+IGZvdW5kIGEgMS1saW5lciB0aGF0IGZpeGVkIGEgc2ltaWxhciBjcmFz
aCBpbiBoaXMgZW52aXJvbm1lbnQuCj4gCj4gQ2FuIHlvdSB0cnkgdGhpcyBwYXRjaCBvbiB0b3Ag
YW5kIGxldCBtZSBrbm93IGlmIGl0IHN0aWxsIGNyYXNoZXM/Cj4gaHR0cHM6Ly9naXRodWIuY29t
L0RhdmVXeXNvY2hhbnNraVJIL2tlcm5lbC9jb21taXQvOTAyYzk5MGUzMTExMjAxNzlmYTVkZTk5
ZDY4MzY0YjI5NDdiNzllYwoKT2gsIGl0IGRvZXMgbm90IGNyYXNoIHdpdGggdGhlIHBhdGNoIGFw
cGxpZWQuCgpIbW0sIHdhcyBpdCBVQUYgYmVjYXVzZSBpdCByZWZlcmVuY2VzIHdyb25nIGZpZWxk
IC0+bWFwcGluZywKaW5zdGVhZCBvZiBzd2FwcGVyIGFkZHJlc3Mgc3BhY2U/CgotLQpMaW51eC1j
YWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0
bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZzCg==

