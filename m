Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A670E75F9B0
	for <lists+linux-cachefs@lfdr.de>; Mon, 24 Jul 2023 16:21:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690208507;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qVzLUZ6zKKxjVzyFDULHhUQ5NQFMF5e8IKsC5c7LkGw=;
	b=Bk6fYpVkmkW3W+Y+2EpAmmZCDC2TV+3Fcdeha9FaXwt5rXzxjliUqhpT0X52RMrY1ze7Lr
	9SJsvX8+MKEWJ+HMYv1wmOEUFpAe/kXHdAxZzcYb/6ZpuH14DNZ/7zZlup29tYaJ07sL5u
	Z3L4DR0e36kFnNKoAUf0d3GXZMXutzI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-mfPGoECNMxKRrTEMlctMlw-1; Mon, 24 Jul 2023 10:21:43 -0400
X-MC-Unique: mfPGoECNMxKRrTEMlctMlw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1EDA2A5957E;
	Mon, 24 Jul 2023 14:21:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7E38F782D;
	Mon, 24 Jul 2023 14:21:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F31F219451D4;
	Mon, 24 Jul 2023 14:21:40 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6303D1946588 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 24 Jul 2023 14:21:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4EF4A1121318; Mon, 24 Jul 2023 14:21:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46A011121315
 for <linux-cachefs@redhat.com>; Mon, 24 Jul 2023 14:21:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24E23856F67
 for <linux-cachefs@redhat.com>; Mon, 24 Jul 2023 14:21:39 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-JPAexGotNlipmBHR86GNKg-1; Mon, 24 Jul 2023 10:21:37 -0400
X-MC-Unique: JPAexGotNlipmBHR86GNKg-1
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-268108bc663so1323670a91.0
 for <linux-cachefs@redhat.com>; Mon, 24 Jul 2023 07:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690208496; x=1690813296;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a7+y4J72Q0kEFtJFZr3ToqDneS+Q2vn9lfoVlJ352mE=;
 b=A+w27plM/Vt9GCoBIlNRMPoZ+DfwL1ILzBLiRMxo9sMqwiH68lfY93evs4L6kYP9/M
 zZ7Xlax8NQj0tKcLf1y5ZKeLfQF3lu8tBL1aNqfFRwPr/LK1V/J6VVfN8egQmdOdTCi5
 qfgHRjjv6ERuB+MFOkOsCRUTTBy/gNfZkI81xcizxSE4jhjfE6E1ppa4/JAE+HUUA1ps
 8aYZth5xvbqn1+QkxOUxnUn+D6xcZfZjO9wB7DRw3T2EG78+bttFU7jfsL1ArpFIwB5M
 vrtnetng23pSNbtJVrZlhkUFR+8Ba9ROi1rWk6JLms4xEClFtkG9KDTGhSWy5QQuzFZS
 4Jew==
X-Gm-Message-State: ABy/qLZG/4jWk/6dlHmkgaGG+i3bNV0i/eslGP7ChFkzOE6V0WxuIiTS
 vik18QOf8rzRsSnjOfmTFNMiEjDiWsoc7cE+MTU3rlgWCQitKiAwuo+Q3Nm9u5MrKefweT7CRIj
 kF3vOTpTZfHEt/PJ7gFBNwv7IjJyrZ4UiKk8LUg==
X-Received: by 2002:a17:90b:1946:b0:268:2621:6a41 with SMTP id
 nk6-20020a17090b194600b0026826216a41mr1196356pjb.45.1690208496403; 
 Mon, 24 Jul 2023 07:21:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGuDMFWdU3qGv/NZSSOBNW9kWUCS3q97mp2l1nbTr0wImLmNrCBvwj+EKwCJCdxYKm0PhLqITGqeq58nBHRzHs=
X-Received: by 2002:a17:90b:1946:b0:268:2621:6a41 with SMTP id
 nk6-20020a17090b194600b0026826216a41mr1196343pjb.45.1690208496104; Mon, 24
 Jul 2023 07:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230608214137.856006-1-dwysocha@redhat.com>
In-Reply-To: <20230608214137.856006-1-dwysocha@redhat.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Mon, 24 Jul 2023 10:20:59 -0400
Message-ID: <CALF+zOk+r18aDDJ19Ngt2N0G3CPeuXD8vVh7cqZ5s+Up9Kw4Uw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH] netfs: Only call folio_start_fscache()
 one time for each folio
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBKdW4gOCwgMjAyMyBhdCA1OjQx4oCvUE0gRGF2ZSBXeXNvY2hhbnNraSA8ZHd5c29j
aGFAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBJZiBhIG5ldHdvcmsgZmlsZXN5c3RlbSB1c2luZyBu
ZXRmcyBpbXBsZW1lbnRzIGEgY2xhbXBfbGVuZ3RoKCkKPiBmdW5jdGlvbiwgaXQgY2FuIHNldCBz
dWJyZXF1ZXN0IGxlbmd0aHMgc21hbGxlciB0aGFuIGEgcGFnZSBzaXplLgo+IFdoZW4gd2UgbG9v
cCB0aHJvdWdoIHRoZSBmb2xpb3MgaW4gbmV0ZnNfcnJlcV91bmxvY2tfZm9saW9zKCkgdG8KPiBz
ZXQgYW55IGZvbGlvcyB0byBiZSB3cml0dGVuIGJhY2ssIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHdl
IG9ubHkKPiBjYWxsIGZvbGlvX3N0YXJ0X2ZzY2FjaGUoKSBvbmNlIGZvciBlYWNoIGZvbGlvLiAg
T3RoZXJ3aXNlLAo+IHRoaXMgc2ltcGxlIHRlc3RjYXNlOgo+ICAgbW91bnQgLW8gZnNjLHJzaXpl
PTEwMjQsd3NpemU9MTAyNCAxMjcuMC4wLjE6L2V4cG9ydCAvbW50L25mcwo+ICAgZGQgaWY9L2Rl
di96ZXJvIG9mPS9tbnQvbmZzL2ZpbGUuYmluIGJzPTQwOTYgY291bnQ9MQo+ICAgMSswIHJlY29y
ZHMgaW4KPiAgIDErMCByZWNvcmRzIG91dAo+ICAgNDA5NiBieXRlcyAoNC4xIGtCLCA0LjAgS2lC
KSBjb3BpZWQsIDAuMDEyNjM1OSBzLCAzMjQga0Ivcwo+ICAgY2F0IC9tbnQvbmZzL2ZpbGUuYmlu
ID4gL2Rldi9udWxsCj4KPiB3aWxsIHRyaWdnZXIgYW4gb29wcyBzaW1pbGFyIHRvIHRoZSBmb2xs
b3dpbmc6Cj4gLi4uCj4gIHBhZ2UgZHVtcGVkIGJlY2F1c2U6IFZNX0JVR19PTl9GT0xJTyhmb2xp
b190ZXN0X3ByaXZhdGVfMihmb2xpbykpCj4gIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0t
LS0tLS0tLQo+ICBrZXJuZWwgQlVHIGF0IGluY2x1ZGUvbGludXgvbmV0ZnMuaDo0NCEKPiAuLi4K
PiAgQ1BVOiA1IFBJRDogMTM0IENvbW06IGt3b3JrZXIvdTE2OjUgS2R1bXA6IGxvYWRlZCBOb3Qg
dGFpbnRlZCA2LjQuMC1yYzUKPiAuLi4KPiAgUklQOiAwMDEwOm5ldGZzX3JyZXFfdW5sb2NrX2Zv
bGlvcysweDY4ZS8weDczMCBbbmV0ZnNdCj4gLi4uCj4gIENhbGwgVHJhY2U6Cj4gICA8VEFTSz4K
PiAgIG5ldGZzX3JyZXFfYXNzZXNzKzB4NDk3LzB4NjYwIFtuZXRmc10KPiAgIG5ldGZzX3N1YnJl
cV90ZXJtaW5hdGVkKzB4MzJiLzB4NjEwIFtuZXRmc10KPiAgIG5mc19uZXRmc19yZWFkX2NvbXBs
ZXRpb24rMHgxNGUvMHgxYTAgW25mc10KPiAgIG5mc19yZWFkX2NvbXBsZXRpb24rMHgyZjkvMHgz
MzAgW25mc10KPiAgIHJwY19mcmVlX3Rhc2srMHg3Mi8weGEwIFtzdW5ycGNdCj4gICBycGNfYXN5
bmNfcmVsZWFzZSsweDQ2LzB4NzAgW3N1bnJwY10KPiAgIHByb2Nlc3Nfb25lX3dvcmsrMHgzYmQv
MHg3MTAKPiAgIHdvcmtlcl90aHJlYWQrMHg4OS8weDYxMAo+ICAga3RocmVhZCsweDE4MS8weDFj
MAo+ICAgcmV0X2Zyb21fZm9yaysweDI5LzB4NTAKPgo+IFNpZ25lZC1vZmYtYnk6IERhdmUgV3lz
b2NoYW5za2kgPGR3eXNvY2hhQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGZzL25ldGZzL2J1ZmZlcmVk
X3JlYWQuYyB8IDYgKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9mcy9uZXRmcy9idWZmZXJlZF9yZWFkLmMgYi9m
cy9uZXRmcy9idWZmZXJlZF9yZWFkLmMKPiBpbmRleCAzNDA0NzA3ZGRiZTcuLjBkYWZkOTcwYzFi
NiAxMDA2NDQKPiAtLS0gYS9mcy9uZXRmcy9idWZmZXJlZF9yZWFkLmMKPiArKysgYi9mcy9uZXRm
cy9idWZmZXJlZF9yZWFkLmMKPiBAQCAtMjEsNiArMjEsNyBAQCB2b2lkIG5ldGZzX3JyZXFfdW5s
b2NrX2ZvbGlvcyhzdHJ1Y3QgbmV0ZnNfaW9fcmVxdWVzdCAqcnJlcSkKPiAgICAgICAgIHBnb2Zm
X3QgbGFzdF9wYWdlID0gKChycmVxLT5zdGFydCArIHJyZXEtPmxlbikgLyBQQUdFX1NJWkUpIC0g
MTsKPiAgICAgICAgIHNpemVfdCBhY2NvdW50ID0gMDsKPiAgICAgICAgIGJvb2wgc3VicmVxX2Zh
aWxlZCA9IGZhbHNlOwo+ICsgICAgICAgYm9vbCBmb2xpb19zdGFydGVkOwo+Cj4gICAgICAgICBY
QV9TVEFURSh4YXMsICZycmVxLT5tYXBwaW5nLT5pX3BhZ2VzLCBzdGFydF9wYWdlKTsKPgo+IEBA
IC01Myw2ICs1NCw3IEBAIHZvaWQgbmV0ZnNfcnJlcV91bmxvY2tfZm9saW9zKHN0cnVjdCBuZXRm
c19pb19yZXF1ZXN0ICpycmVxKQo+Cj4gICAgICAgICAgICAgICAgIHBnX2VuZCA9IGZvbGlvX3Bv
cyhmb2xpbykgKyBmb2xpb19zaXplKGZvbGlvKSAtIDE7Cj4KPiArICAgICAgICAgICAgICAgZm9s
aW9fc3RhcnRlZCA9IGZhbHNlOwo+ICAgICAgICAgICAgICAgICBmb3IgKDs7KSB7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgbG9mZl90IHNyZXFfZW5kOwo+Cj4gQEAgLTYwLDggKzYyLDEwIEBA
IHZvaWQgbmV0ZnNfcnJlcV91bmxvY2tfZm9saW9zKHN0cnVjdCBuZXRmc19pb19yZXF1ZXN0ICpy
cmVxKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGdfZmFpbGVkID0gdHJ1ZTsK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIH0KPiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAodGVzdF9iaXQoTkVURlNf
U1JFUV9DT1BZX1RPX0NBQ0hFLCAmc3VicmVxLT5mbGFncykpCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKCFmb2xpb19zdGFydGVkICYmIHRlc3RfYml0KE5FVEZTX1NSRVFfQ09QWV9UT19D
QUNIRSwgJnN1YnJlcS0+ZmxhZ3MpKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBmb2xpb19zdGFydF9mc2NhY2hlKGZvbGlvKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZvbGlvX3N0YXJ0ZWQgPSB0cnVlOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIH0K
PiAgICAgICAgICAgICAgICAgICAgICAgICBwZ19mYWlsZWQgfD0gc3VicmVxX2ZhaWxlZDsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBzcmVxX2VuZCA9IHN1YnJlcS0+c3RhcnQgKyBzdWJyZXEt
PmxlbiAtIDE7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHBnX2VuZCA8IHNyZXFfZW5k
KQo+IC0tCj4gMi4zMS4xCj4KPiAtLQo+IExpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0Cj4gTGlu
dXgtY2FjaGVmc0ByZWRoYXQuY29tCj4gaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1jYWNoZWZzCj4KCkRhdmlkLAoKSnVzdCB3YW50ZWQgdG8gcGluZyBh
IGZyaWVuZGx5IHJlbWluZGVyIG9uIHRoaXMgcGF0Y2ggYXMgSSBkaWRuJ3Qgc2VlCmFueSByZXNw
b25zZSBvciBpbiBhbnkgdHJlZSB0aGF0IEkgY291bGQgZmluZC4KCkFsc28sIHRoZXJlIGlzIGEg
UmVkIEhhdCBidWd6aWxsYSBmb3IgaXQsIHNvIHBhdGNoIHNob3VsZCBoYXZlIGhhZDoKTGluazog
aHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0yMjEwNjEyCgotLQpM
aW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6
Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZzCg==

