Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0CF70FBC8
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 May 2023 18:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684946347;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N0hq3bZImzA2CAf4KjgQTFXdUSNZJjNL1SvzbMgDEXw=;
	b=Nw+SmnBar6HhUgaFTDSLyS2Y8/xbB69iM1SELaBn/pZu2PFZHj2FY7U8mh9dE4GvJvQccK
	8lWN31HDnRsfG6VdX42Yx2JjsNeDFocoj1Qgi4HhD73oDg4qJ0UBeBlaxPaogLiH18hUqQ
	o1Kw050oVeDlEJ1t5YgYwEC+BrngnXQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-6yuYztt5NOCacFPNKlHCsA-1; Wed, 24 May 2023 12:39:03 -0400
X-MC-Unique: 6yuYztt5NOCacFPNKlHCsA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA2821C05EB1;
	Wed, 24 May 2023 16:39:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E03E3C090D9;
	Wed, 24 May 2023 16:39:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AF4E419465B3;
	Wed, 24 May 2023 16:39:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A025219465A0 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 24 May 2023 16:39:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 90DBD40C6EC4; Wed, 24 May 2023 16:39:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88F1040C6CCC
 for <linux-cachefs@redhat.com>; Wed, 24 May 2023 16:39:00 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B5FD101A52C
 for <linux-cachefs@redhat.com>; Wed, 24 May 2023 16:39:00 +0000 (UTC)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-VIQm2NFsMTu9Wz6KNtbXqg-1; Wed, 24 May 2023 12:38:58 -0400
X-MC-Unique: VIQm2NFsMTu9Wz6KNtbXqg-1
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-5343c1d114cso481291a12.0
 for <linux-cachefs@redhat.com>; Wed, 24 May 2023 09:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684946338; x=1687538338;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hIRDFYHmrI2ea9PgJ9cG2BzagPncv2WifE6ykqY/z1c=;
 b=M3ByTguI4RJLhmI9n0klq48lVg51fWPLyqz2PPEqzVWZFeY1SuN4k3gs03f0/F+u03
 BILIbSGpVjPMipNQV4JRuNkM/Bn69VHs5iCivFInUUuCgMFftLLLEFXU+g7hyWL2sskP
 AnDcq4q9Ko67+6vK20+lBok/qCMS+5do//h0CqjLYNvV8q8+r7mi3q/yM+S67rPMch7V
 zUvy9r5T2D0OIMZ1JPN08Bw3I60bPFG0hpHi97xodeRx5wvpR3DkxOvqnnssqg+6AODO
 T9YjsGtGINZRZbmC504KU2H1B1oasbgH+pdm3prbGT3SUv7ACu5aOFhUv4s1rEzLPjtQ
 HMwQ==
X-Gm-Message-State: AC+VfDxDyzjHHjcOKHmjVppDcGTlnqZho/XKf04xiPaLlI1mdTOQgyve
 D7oN/VRLR+6Lh+OIyzy4A3K7ciCSJrv9IG7jChK99pAPFKWvigVxdcYdcf360T+6bvc7UhEUTwz
 TFd19lJD+KEK6rJJ7FbHNa5Wj00h3qqjm0wyfqA==
X-Received: by 2002:a17:903:428a:b0:1ac:4a41:d38d with SMTP id
 ju10-20020a170903428a00b001ac4a41d38dmr15831011plb.51.1684946337864; 
 Wed, 24 May 2023 09:38:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7QhwNbEG7dVnvKUcvcrF5VXTCpluYFQoMIGO7odXS8eF4N7acYVvSWWvlkVR9tfx1GsK6DpUi0zEDdnwhFY7c=
X-Received: by 2002:a17:903:428a:b0:1ac:4a41:d38d with SMTP id
 ju10-20020a170903428a00b001ac4a41d38dmr15830993plb.51.1684946337555; Wed, 24
 May 2023 09:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230216150701.3654894-1-dhowells@redhat.com>
 <CALF+zO=w2Gyz6JtzEoFgTVjH67-_CuTaK7e+2yoHEwXZ8bPx_A@mail.gmail.com>
In-Reply-To: <CALF+zO=w2Gyz6JtzEoFgTVjH67-_CuTaK7e+2yoHEwXZ8bPx_A@mail.gmail.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Wed, 24 May 2023 12:38:21 -0400
Message-ID: <CALF+zO=Y8dMsJ79RYp1e7n9B5_0=segpqW9_tetBqPhFiQcZxA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>, Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH v6 0/2] mm, netfs,
 fscache: Stop read optimisation when folio removed from pagecache
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBNYXkgMTYsIDIwMjMgYXQgMzoyOeKAr1BNIERhdmlkIFd5c29jaGFuc2tpIDxkd3lz
b2NoYUByZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgRmViIDE2LCAyMDIzIGF0IDEwOjA3
4oCvQU0gRGF2aWQgSG93ZWxscyA8ZGhvd2VsbHNAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4g
SGkgV2lsbHksCj4gPgo+ID4gSXMgdGhpcyBva2F5IGJ5IHlvdT8gIFlvdSBzYWlkIHlvdSB3YW50
ZWQgdG8gbG9vayBhdCB0aGUgcmVtYWluaW5nIHVzZXMgb2YKPiA+IHBhZ2VfaGFzX3ByaXZhdGUo
KSwgb2Ygd2hpY2ggdGhlcmUgYXJlIHRoZW4gdGhyZWUgYWZ0ZXIgdGhlc2UgcGF0Y2hlcywgbm90
Cj4gPiBjb3VudGluZyBmb2xpb19oYXNfcHJpdmF0ZSgpOgo+ID4KPiA+ICAgICAgICAgYXJjaC9z
MzkwL2tlcm5lbC91di5jOiAgICAgICAgICBpZiAocGFnZV9oYXNfcHJpdmF0ZShwYWdlKSkKPiA+
ICAgICAgICAgbW0va2h1Z2VwYWdlZC5jOiAgICAgICAgICAgICAgICAgICAgMSArIHBhZ2VfbWFw
Y291bnQocGFnZSkgKyBwYWdlX2hhc19wcml2YXRlKHBhZ2UpKSB7Cj4gPiAgICAgICAgIG1tL21p
Z3JhdGVfZGV2aWNlLmM6ICAgICAgICAgICAgZXh0cmEgKz0gMSArIHBhZ2VfaGFzX3ByaXZhdGUo
cGFnZSk7Cj4gPgo+ID4gLS0KPiA+IEkndmUgc3BsaXQgdGhlIGZvbGlvX2hhc19wcml2YXRlKCkv
ZmlsZW1hcF9yZWxlYXNlX2ZvbGlvKCkgY2FsbCBwYWlyCj4gPiBtZXJnaW5nIGludG8gaXRzIG93
biBwYXRjaCwgc2VwYXJhdGUgZnJvbSB0aGUgYWN0dWFsIGJ1Z2ZpeCBhbmQgcHVsbGVkIG91dAo+
ID4gdGhlIGZvbGlvX25lZWRzX3JlbGVhc2UoKSBmdW5jdGlvbiBpbnRvIG1tL2ludGVybmFsLmgg
YW5kIG1hZGUKPiA+IGZpbGVtYXBfcmVsZWFzZV9mb2xpbygpIHVzZSBpdC4gIEkndmUgYWxzbyBn
b3QgcmlkIG9mIHRoZSBiaXQgY2xlYXJhbmNlcwo+ID4gZnJvbSB0aGUgbmV0d29yayBmaWxlc3lz
dGVtIGV2aWN0X2lub2RlIGZ1bmN0aW9ucyBhcyB0aGV5IGRvZXNuJ3Qgc2VlbSB0bwo+ID4gYmUg
bmVjZXNzYXJ5Lgo+ID4KPiA+IE5vdGUgdGhhdCB0aGUgbGFzdCB2ZXN0aWdlcyBvZiB0cnlfdG9f
cmVsZWFzZV9wYWdlKCkgZ290IHN3ZXB0IGF3YXksIHNvIEkKPiA+IHJlYmFzZWQgYW5kIGRlYWx0
IHdpdGggdGhhdC4gIE9uZSBjb21tZW50IHJlbWFpbmVkLCB3aGljaCBpcyByZW1vdmVkIGJ5IHRo
ZQo+ID4gZmlyc3QgcGF0Y2guCj4gPgo+ID4gRGF2aWQKPiA+Cj4gPiBDaGFuZ2VzOgo+ID4gPT09
PT09PT0KPiA+IHZlciAjNikKPiA+ICAtIERyb3AgdGhlIHRoaXJkIHBhdGNoIHdoaWNoIHJlbW92
ZXMgYSBkdXBsaWNhdGUgY2hlY2sgaW4gdm1zY2FuKCkuCj4gPgo+ID4gdmVyICM1KQo+ID4gIC0g
UmViYXNlZCBvbiBsaW51cy9tYXN0ZXIuICB0cnlfdG9fcmVsZWFzZV9wYWdlKCkgaGFzIG5vdyBi
ZWVuIGVudGlyZWx5Cj4gPiAgICByZXBsYWNlZCBieSBmaWxlbWFwX3JlbGVhc2VfZm9saW8oKSwg
YmFycmluZyBvbmUgY29tbWVudC4KPiA+ICAtIENsZWFuZWQgdXAgc29tZSBwYWlycyBpbiBleHQ0
Lgo+ID4KPiA+IHZlciAjNCkKPiA+ICAtIFNwbGl0IGhhc19wcml2YXRlL3JlbGVhc2UgY2FsbCBw
YWlycyBpbnRvIG93biBwYXRjaC4KPiA+ICAtIE1vdmVkIGZvbGlvX25lZWRzX3JlbGVhc2UoKSB0
byBtbS9pbnRlcm5hbC5oIGFuZCByZW1vdmVkIG9wZW4tY29kZWQKPiA+ICAgIHZlcnNpb24gZnJv
bSBmaWxlbWFwX3JlbGVhc2VfZm9saW8oKS4KPiA+ICAtIERvbid0IG5lZWQgdG8gY2xlYXIgQVNf
UkVMRUFTRV9BTFdBWVMgaW4gLT5ldmljdF9pbm9kZSgpLgo+ID4gIC0gQWRkZWQgZXhwZXJpbWVu
dGFsIHBhdGNoIHRvIHJlZHVjZSBzaHJpbmtfZm9saW9fbGlzdCgpLgo+ID4KPiA+IHZlciAjMykK
PiA+ICAtIEZpeGVkIG1hcHBpbmdfY2xlYXJfcmVsZWFzZV9hbHdheXMoKSB0byB1c2UgY2xlYXJf
Yml0KCkgbm90IHNldF9iaXQoKS4KPiA+ICAtIE1vdmVkIGEgJyYmJyB0byB0aGUgY29ycmVjdCBs
aW5lLgo+ID4KPiA+IHZlciAjMikKPiA+ICAtIFJld3JvdGUgZW50aXJlbHkgYWNjb3JkaW5nIHRv
IFdpbGx5J3Mgc3VnZ2VzdGlvblsxXS4KPiA+Cj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yL1lrOVYvMDN3Z2RZaTY1TGJAY2FzcGVyLmluZnJhZGVhZC5vcmcvIFsxXQo+ID4gTGlu
azogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8xNjQ5Mjg2MzA1NzcuNDU3MTAyLjg1MTkyNTEx
NzkzMjc2MDExNzguc3RnaXRAd2FydGhvZy5wcm9jeW9uLm9yZy51ay8gIyB2MQo+ID4gTGluazog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8xNjY4NDQxNzQwNjkuMTEyNDUyMS4xMDg5MDUwNjM2
MDk3NDE2OTk5NC5zdGdpdEB3YXJ0aG9nLnByb2N5b24ub3JnLnVrLyAjIHYyCj4gPiBMaW5rOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzE2Njg2OTQ5NTIzOC4zNzIwNDY4LjQ4NzgxNTE0MDkw
ODUxNDY3NjQuc3RnaXRAd2FydGhvZy5wcm9jeW9uLm9yZy51ay8gIyB2Mwo+ID4gTGluazogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8xNDU5MTUyLjE2NjkyMDg1NTBAd2FydGhvZy5wcm9jeW9u
Lm9yZy51ay8gIyB2MyBhbHNvCj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzE2
NjkyNDM3MDUzOS4xNzcyNzkzLjEzNzMwNjk4MzYwNzcxODIxMzE3LnN0Z2l0QHdhcnRob2cucHJv
Y3lvbi5vcmcudWsvICMgdjQKPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMTY3
MTcyMTMxMzY4LjIzMzQ1MjUuODU2OTgwODkyNTY4NzczMTkzNy5zdGdpdEB3YXJ0aG9nLnByb2N5
b24ub3JnLnVrLyAjIHY1Cj4gPiAtLS0KPiA+ICUoc2hvcnRsb2cpcwo+ID4gJShkaWZmc3RhdClz
Cj4gPgo+ID4gRGF2aWQgSG93ZWxscyAoMik6Cj4gPiAgIG1tOiBNZXJnZSBmb2xpb19oYXNfcHJp
dmF0ZSgpL2ZpbGVtYXBfcmVsZWFzZV9mb2xpbygpIGNhbGwgcGFpcnMKPiA+ICAgbW0sIG5ldGZz
LCBmc2NhY2hlOiBTdG9wIHJlYWQgb3B0aW1pc2F0aW9uIHdoZW4gZm9saW8gcmVtb3ZlZCBmcm9t
Cj4gPiAgICAgcGFnZWNhY2hlCj4gPgo+ID4gIGZzLzlwL2NhY2hlLmMgICAgICAgICAgIHwgIDIg
KysKPiA+ICBmcy9hZnMvaW50ZXJuYWwuaCAgICAgICB8ICAyICsrCj4gPiAgZnMvY2FjaGVmaWxl
cy9uYW1laS5jICAgfCAgMiArKwo+ID4gIGZzL2NlcGgvY2FjaGUuYyAgICAgICAgIHwgIDIgKysK
PiA+ICBmcy9jaWZzL2ZzY2FjaGUuYyAgICAgICB8ICAyICsrCj4gPiAgZnMvZXh0NC9tb3ZlX2V4
dGVudC5jICAgfCAxMiArKysrLS0tLS0tLS0KPiA+ICBmcy9zcGxpY2UuYyAgICAgICAgICAgICB8
ICAzICstLQo+ID4gIGluY2x1ZGUvbGludXgvcGFnZW1hcC5oIHwgMTYgKysrKysrKysrKysrKysr
Kwo+ID4gIG1tL2ZpbGVtYXAuYyAgICAgICAgICAgIHwgIDIgKysKPiA+ICBtbS9odWdlX21lbW9y
eS5jICAgICAgICB8ICAzICstLQo+ID4gIG1tL2ludGVybmFsLmggICAgICAgICAgIHwgMTEgKysr
KysrKysrKysKPiA+ICBtbS9raHVnZXBhZ2VkLmMgICAgICAgICB8ICAzICstLQo+ID4gIG1tL21l
bW9yeS1mYWlsdXJlLmMgICAgIHwgIDggKysrLS0tLS0KPiA+ICBtbS9taWdyYXRlLmMgICAgICAg
ICAgICB8ICAzICstLQo+ID4gIG1tL3RydW5jYXRlLmMgICAgICAgICAgIHwgIDYgKystLS0tCj4g
PiAgbW0vdm1zY2FuLmMgICAgICAgICAgICAgfCAgOCArKysrLS0tLQo+ID4gIDE2IGZpbGVzIGNo
YW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQo+ID4KPiA+IC0tCj4gPiBM
aW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdAo+ID4gTGludXgtY2FjaGVmc0ByZWRoYXQuY29tCj4g
PiBodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hl
ZnMKPiA+Cj4KPiBXaWxseSwgYW5kIERhdmlkLAo+Cj4gQ2FuIHRoaXMgc2VyaWVzIG1vdmUgZm9y
d2FyZD8KPiBUaGlzIGp1c3QgZ290IG1lbnRpb25lZCBhZ2FpbiBbMV0gYWZ0ZXIgQ2hyaXMgdGVz
dGVkIHRoZSBORlMgbmV0ZnMKPiBwYXRjaGVzIHRoYXQgd2VyZSBtZXJnZWQgaW4gNi40LXJjMQo+
Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW5mcy9DQUFtYmstZl9VOENQY1RR
TTg2Nkw1NzJ1VUhkSzRwNWlXS25VUXM0cjhma1c9NlJXOWdAbWFpbC5nbWFpbC5jb20vCgpTb3Jy
eSBhYm91dCB0aGUgdGltaW5nIG9uIHRoZSBvcmlnaW5hbCBlbWFpbCBhcyBJIGZvcmdvdCBpdCBs
aW5lZCB1cAp3aXRoIExTRi9NTS4KCkZZSSwgSSB0ZXN0ZWQgd2l0aCA2LjQtcmMxIHBsdXMgdGhl
c2UgdHdvIHBhdGNoZXMsIHRoZW4gSSBhZGRlZCB0aGUgTkZTCmh1bmsgbmVlZGVkIChzZWUgYmVs
b3cpLiAgQWxsIG15IHRlc3RzIHBhc3Mgbm93WzFdLCBhbmQgaXQgbWFrZXMgc2Vuc2UKZnJvbSBh
bGwgdGhlIGZ0cmFjZXMgSSd2ZSBzZWVuIG9uIHRlc3QgcnVucyB0aGF0IGZhaWwgKGNhY2hlZmls
ZXNfcHJlcF9yZWFkCnRyYWNlIGV2ZW50IHdvdWxkIHNob3cgIkRPV04gbm8tZGF0YSIgZXZlbiBh
ZnRlciBkYXRhIHdhcyB3cml0dGVuCnByZXZpb3VzbHkpLgoKVGhpcyBzbWFsbCBORlMgaHVuayBu
ZWVkcyBhZGRlZCB0byBwYXRjaCAjMiBpbiB0aGlzIHNlcmllczoKCmRpZmYgLS1naXQgYS9mcy9u
ZnMvZnNjYWNoZS5jIGIvZnMvbmZzL2ZzY2FjaGUuYwppbmRleCA4YzM1ZDg4YTg0YjEuLmQ0YTIw
NzQ4YjE0ZiAxMDA2NDQKLS0tIGEvZnMvbmZzL2ZzY2FjaGUuYworKysgYi9mcy9uZnMvZnNjYWNo
ZS5jCkBAIC0xODAsNiArMTgwLDEwIEBAIHZvaWQgbmZzX2ZzY2FjaGVfaW5pdF9pbm9kZShzdHJ1
Y3QgaW5vZGUgKmlub2RlKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZhdXhkYXRhLCAgICAgIC8qIGF1eF9kYXRhICovCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKGF1eGRhdGEpLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlfc2l6ZV9yZWFkKGlub2RlKSk7CisK
KyAgICAgICBpZiAobmV0ZnNfaW5vZGUoaW5vZGUpLT5jYWNoZSkKKyAgICAgICAgICAgICAgIG1h
cHBpbmdfc2V0X3JlbGVhc2VfYWx3YXlzKGlub2RlLT5pX21hcHBpbmcpOworCiB9CgogLyoKClsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1uZnMvQ0FMRit6T25fcVg0dGNUMnVjcTRq
RDNHLTFFUnFaa0w2Q3c3aHg3NU9uUUYwaXZxU2VBQG1haWwuZ21haWwuY29tLwoKLS0KTGludXgt
Y2FjaGVmcyBtYWlsaW5nIGxpc3QKTGludXgtY2FjaGVmc0ByZWRoYXQuY29tCmh0dHBzOi8vbGlz
dG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVmcwo=

