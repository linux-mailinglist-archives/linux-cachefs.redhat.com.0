Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DE3AD36B9FA
	for <lists+linux-cachefs@lfdr.de>; Mon, 26 Apr 2021 21:28:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619465292;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=efpEokvoF1XnWL6MDyAboXac3KXZym3kNlOkgs2QJIM=;
	b=f7tb0Z6F1cJdFQw+XfWMWCmRDs5EBNfbNzkoZWqglupbljZVlF638B0tKL18Cud/y57cpZ
	/TueVPZXpLvgviD155VS7D8YlKoCER+XdrqYPJSMWpEDmvDai/eWARtj5llya7AM2y5Otq
	ZcqMRpwPHomml+iK02gHo6lQaIAiQFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-0S_5rNYANTy9VUd5ZuNTeA-1; Mon, 26 Apr 2021 15:28:11 -0400
X-MC-Unique: 0S_5rNYANTy9VUd5ZuNTeA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A71F87A82A;
	Mon, 26 Apr 2021 19:28:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89D635C234;
	Mon, 26 Apr 2021 19:28:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D618F1806D1C;
	Mon, 26 Apr 2021 19:28:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13QJ2rhT018800 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 26 Apr 2021 15:02:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B542F11457C5; Mon, 26 Apr 2021 19:02:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B100F11457C2
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 19:02:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3A30A28805
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 19:02:50 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-99-407SKT96MTG67HZS0LV8Sw-1; Mon, 26 Apr 2021 15:02:48 -0400
X-MC-Unique: 407SKT96MTG67HZS0LV8Sw-1
Received: by mail-qk1-f197.google.com with SMTP id
	q5-20020a05620a0c85b02902e004d74d8cso21306750qki.16
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 12:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ouGZBrLLWit6/ZcOCgBmqDAJzjKl2dpVcZkTyeLSBYo=;
	b=lRLf72SRsnOVUlJhgbSjA3M7Wxf59Zon5REWQX65jqAaQ1MaQDw+pre40dWZPFFKTe
	rEfU4LdVlTYGXTOQHQCsof8V0un5ZxRf9RB+6Y1JRESQ/YP6RbSKW0vMI1F8QIlHmx/b
	FHaY8S1jb868ixIluC4+JAT/3gVOz/2RYVnIawtkDsqcDlGIhsX+Z6FoBEQP3Qj3iTv4
	poYnNCQdzXVTiIkqlbuH9ULcZjYYmcHQFRkg3niZK9TkHdnXCXiatiRVOFKtf/8rYEye
	q7V2tIfJPn0I/T5WcYppA7P8fs5oAm/BAmM5w4J2GTQi7u9uN7/zBHFR1UmsQlkehG1Z
	4eLQ==
X-Gm-Message-State: AOAM530mu2qIjOZF3Q+zaJHHPdOAIZhh7gdkXTQbBc1DZ2kryZfOn3A+
	U/z2OaCG4AlzBuOSE71mllXFdbMKTrEi4Yb5gKNiJelrv9J8jWngCZaHrLEcpZGwDfdPoRcb3VH
	worVdk8zgLaICbSjgr45eeA==
X-Received: by 2002:a05:6214:12ab:: with SMTP id
	w11mr2594678qvu.14.1619463768329; 
	Mon, 26 Apr 2021 12:02:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGCsMCqX/N3XGxXqCeA/FOnTSmKwq96TpGbwn+GxMf4WVXk/guJWr0j2oTl477h4kubLqiGw==
X-Received: by 2002:a05:6214:12ab:: with SMTP id
	w11mr2594656qvu.14.1619463768135; 
	Mon, 26 Apr 2021 12:02:48 -0700 (PDT)
Received: from [192.168.1.180] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
	[68.20.15.154]) by smtp.gmail.com with ESMTPSA id
	c17sm11477744qtd.71.2021.04.26.12.02.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 26 Apr 2021 12:02:47 -0700 (PDT)
Message-ID: <9e5744b2b647a8ff9cdea6efb58c39adde48f7f0.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>, Alexander Viro
	<viro@zeniv.linux.org.uk>
Date: Mon, 26 Apr 2021 15:02:46 -0400
In-Reply-To: <3545034.1619392490@warthog.procyon.org.uk>
References: <161918448151.3145707.11541538916600921083.stgit@warthog.procyon.org.uk>
	<161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<3545034.1619392490@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 26 Apr 2021 15:28:04 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, Dominique,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Trond,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	Martinet <asmadeus@codewreck.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Myklebust <trond.myklebust@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH] iov_iter: Four fixes for ITER_XARRAY
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIxLTA0LTI2IGF0IDAwOjE0ICswMTAwLCBEYXZpZCBIb3dlbGxzIHdyb3RlOgo+
IEhpIEFsLAo+IAo+IEkgdGhpbmsgdGhpcyBwYXRjaCBzaG91bGQgaW5jbHVkZSBhbGwgdGhlIGZp
eGVzIG5lY2Vzc2FyeS4gIEkgY291bGQgbWVyZ2UKPiBpdCBpbiwgYnV0IEkgdGhpbmsgaXQgbWln
aHQgYmUgYmV0dGVyIHRvIHRhZyBpdCBvbiB0aGUgZW5kIGFzIGFuIGFkZGl0aW9uYWwKPiBwYXRj
aC4KPiAKPiBEYXZpZAo+IC0tLQo+IGlvdl9pdGVyOiBGb3VyIGZpeGVzIGZvciBJVEVSX1hBUlJB
WQo+IAo+IEZpeCBmb3VyIHRoaW5nc1sxXSBpbiB0aGUgcGF0Y2ggdGhhdCBhZGRzIElURVJfWEFS
UkFZWzJdOgo+IAo+IMKgKDEpIFJlbW92ZSB0aGUgYWRkcmVzc19zcGFjZSBzdHJ1Y3QgcHJlZGVj
bGFyYXRpb24uICBUaGlzIGlzIGEgaG9sZG92ZXIKPiDCoMKgwqDCoMKgZnJvbSB3aGVuIGl0IHdh
cyBJVEVSX01BUFBJTkcuCj4gCj4gwqAoMikgRml4IF9jb3B5X21jX3RvX2l0ZXIoKSBzbyB0aGF0
IHRoZSB4YXJyYXkgc2VnbWVudCB1cGRhdGVzIGNvdW50IGFuZAo+IMKgwqDCoMKgwqBpb3Zfb2Zm
c2V0IGluIHRoZSBpdGVyYXRvciBiZWZvcmUgcmV0dXJuaW5nLgo+IAo+IMKgKDMpIEZpeCBpb3Zf
aXRlcl9hbGlnbm1lbnQoKSB0byBub3QgbG9vcCBpbiB0aGUgeGFycmF5IGNhc2UuICBCZWNhdXNl
IHRoZQo+IMKgwqDCoMKgwqBtaWRkbGUgcGFnZXMgYXJlIGFsbCB3aG9sZSBwYWdlcywgb25seSB0
aGUgZW5kIHBhZ2VzIG5lZWQgYmUKPiDCoMKgwqDCoMKgY29uc2lkZXJlZCAtIGFuZCB0aGlzIGNh
biBiZSByZWR1Y2VkIHRvIGp1c3QgbG9va2luZyBhdCB0aGUgc3RhcnQKPiDCoMKgwqDCoMKgcG9z
aXRpb24gaW4gdGhlIHhhcnJheSBhbmQgdGhlIGl0ZXJhdGlvbiBzaXplLgo+IAo+IMKgKDQpIEZp
eCBpb3ZfaXRlcl9hZHZhbmNlKCkgdG8gbGltaXQgdGhlIHNpemUgb2YgdGhlIGFkdmFuY2UgdG8g
bm8gbW9yZQo+IMKgwqDCoMKgwqB0aGFuIHRoZSByZW1haW5pbmcgaXRlcmF0aW9uIHNpemUuCj4g
Cj4gUmVwb3J0ZWQtYnk6IEFsIFZpcm8gPHZpcm9AemVuaXYubGludXgub3JnLnVrPgo+IFNpZ25l
ZC1vZmYtYnk6IERhdmlkIEhvd2VsbHMgPGRob3dlbGxzQHJlZGhhdC5jb20+Cj4gTGluazogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9ZSVZySlQ4R3dMSTBXbGd4QHplbml2LWNhLmxpbnV4Lm9y
Zy51ayBbMV0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzE2MTkxODQ0ODE1MS4z
MTQ1NzA3LjExNTQxNTM4OTE2NjAwOTIxMDgzLnN0Z2l0QHdhcnRob2cucHJvY3lvbi5vcmcudWsg
WzJdCj4gLS0tCj4gwqBpbmNsdWRlL2xpbnV4L3Vpby5oIHwgICAgMSAtCj4gwqBsaWIvaW92X2l0
ZXIuYyAgICAgIHwgICAgNSArKysrKwo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC91aW8uaCBi
L2luY2x1ZGUvbGludXgvdWlvLmgKPiBpbmRleCA1ZjVmZmM0NWQ0YWEuLmQzZWM4NzcwNmQ3NSAx
MDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3Vpby5oCj4gKysrIGIvaW5jbHVkZS9saW51eC91
aW8uaAo+IEBAIC0xMCw3ICsxMCw2IEBACj4gwqAjaW5jbHVkZSA8dWFwaS9saW51eC91aW8uaD4K
PiDCoAo+IAo+IAo+IAo+IMKgc3RydWN0IHBhZ2U7Cj4gLXN0cnVjdCBhZGRyZXNzX3NwYWNlOwo+
IMKgc3RydWN0IHBpcGVfaW5vZGVfaW5mbzsKPiDCoAo+IAo+IAo+IAo+IMKgc3RydWN0IGt2ZWMg
ewo+IGRpZmYgLS1naXQgYS9saWIvaW92X2l0ZXIuYyBiL2xpYi9pb3ZfaXRlci5jCj4gaW5kZXgg
NDRmYTcyNmE4MzIzLi42MTIyOGE2YzY5ZjggMTAwNjQ0Cj4gLS0tIGEvbGliL2lvdl9pdGVyLmMK
PiArKysgYi9saWIvaW92X2l0ZXIuYwo+IEBAIC03OTEsNiArNzkxLDggQEAgc2l6ZV90IF9jb3B5
X21jX3RvX2l0ZXIoY29uc3Qgdm9pZCAqYWRkciwgc2l6ZV90IGJ5dGVzLCBzdHJ1Y3QgaW92X2l0
ZXIgKmkpCj4gwqAJCQljdXJyX2FkZHIgPSAodW5zaWduZWQgbG9uZykgZnJvbTsKPiDCoAkJCWJ5
dGVzID0gY3Vycl9hZGRyIC0gc19hZGRyIC0gcmVtOwo+IMKgCQkJcmN1X3JlYWRfdW5sb2NrKCk7
Cj4gKwkJCWktPmlvdl9vZmZzZXQgKz0gYnl0ZXM7Cj4gKwkJCWktPmNvdW50IC09IGJ5dGVzOwo+
IMKgCQkJcmV0dXJuIGJ5dGVzOwo+IMKgCQl9Cj4gwqAJCX0pCj4gQEAgLTExNDcsNiArMTE0OSw3
IEBAIHZvaWQgaW92X2l0ZXJfYWR2YW5jZShzdHJ1Y3QgaW92X2l0ZXIgKmksIHNpemVfdCBzaXpl
KQo+IMKgCQlyZXR1cm47Cj4gwqAJfQo+IMKgCWlmICh1bmxpa2VseShpb3ZfaXRlcl9pc194YXJy
YXkoaSkpKSB7Cj4gKwkJc2l6ZSA9IG1pbihzaXplLCBpLT5jb3VudCk7Cj4gwqAJCWktPmlvdl9v
ZmZzZXQgKz0gc2l6ZTsKPiDCoAkJaS0+Y291bnQgLT0gc2l6ZTsKPiDCoAkJcmV0dXJuOwo+IEBA
IC0xMzQ2LDYgKzEzNDksOCBAQCB1bnNpZ25lZCBsb25nIGlvdl9pdGVyX2FsaWdubWVudChjb25z
dCBzdHJ1Y3QgaW92X2l0ZXIgKmkpCj4gwqAJCQlyZXR1cm4gc2l6ZSB8IGktPmlvdl9vZmZzZXQ7
Cj4gwqAJCXJldHVybiBzaXplOwo+IMKgCX0KPiArCWlmICh1bmxpa2VseShpb3ZfaXRlcl9pc194
YXJyYXkoaSkpKQo+ICsJCXJldHVybiAoaS0+eGFycmF5X3N0YXJ0ICsgaS0+aW92X29mZnNldCkg
fCBpLT5jb3VudDsKPiDCoAlpdGVyYXRlX2FsbF9raW5kcyhpLCBzaXplLCB2LAo+IMKgCQkocmVz
IHw9ICh1bnNpZ25lZCBsb25nKXYuaW92X2Jhc2UgfCB2Lmlvdl9sZW4sIDApLAo+IMKgCQlyZXMg
fD0gdi5idl9vZmZzZXQgfCB2LmJ2X2xlbiwKPiAKCkkgZGlkIGEgdGVzdCBydW4gd2l0aCB5b3Vy
IHY3IHBpbGUsIHRoaXMgcGF0Y2gsIGFuZCBteSBjZXBoIGZzY2FjaGUKcmV3b3JrIHBhdGNoZXMg
YW5kIGl0IGRpZCBmaW5lLiBZb3UgY2FuIGFkZDoKClRlc3RlZC1ieTogSmVmZiBMYXl0b24gPGps
YXl0b25AcmVkaGF0LmNvbT4KCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNh
Y2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWNhY2hlZnM=

