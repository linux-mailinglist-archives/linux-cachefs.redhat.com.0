Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 09515443E3B
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Nov 2021 09:15:48 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-JoN-N444N1a31OQlCio7NQ-1; Wed, 03 Nov 2021 04:15:44 -0400
X-MC-Unique: JoN-N444N1a31OQlCio7NQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09ACACC621;
	Wed,  3 Nov 2021 08:15:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22B0A1B5B7;
	Wed,  3 Nov 2021 08:15:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB09D1809C84;
	Wed,  3 Nov 2021 08:15:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A38FYZu022383 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 3 Nov 2021 04:15:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB7482026D65; Wed,  3 Nov 2021 08:15:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E51EA2026D46
	for <linux-cachefs@redhat.com>; Wed,  3 Nov 2021 08:15:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FB8C899EC2
	for <linux-cachefs@redhat.com>; Wed,  3 Nov 2021 08:15:31 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-28-ZM7W1CzlOU-shRkXW0udng-1; Wed, 03 Nov 2021 04:15:26 -0400
X-MC-Unique: ZM7W1CzlOU-shRkXW0udng-1
Received: by mail-pg1-f171.google.com with SMTP id j9so1751053pgh.1;
	Wed, 03 Nov 2021 01:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6/g1pCDTYXPMrURdzvLf7qrNknIjaeuJnxxrL+FZ9xQ=;
	b=opPU4/zjv2wCHvs/MsIvC8PZJqTtXd47iOvrm6HWbtlfA8vh9S5YT2YWwu5Cks06Nu
	2DIbJ54cSkbM0iiUPMEITALMVgousFwMfHMzwf5zVZEDK+7BojYw+0Gia8D3PMZ983Dk
	2lnJE7k4WUq4J4nZV1V1R3R4t4oYBZXsw1vNYb6pt5trb34GEE673266jqrYVLGukIyk
	6k9J4ln/uENQLNmAOuLbqaDuFbJDEkC14eP0gAG9SRFEONObwwuZNstexN4T1yQ9M1Yc
	WFyBEqn6mZ55bUHDJA1g3hBnoahZlFRGWMFUHSxoeVBGMaBCM2f+u1AweN7a1hzCRBgX
	p0ZQ==
X-Gm-Message-State: AOAM532yQWU4baGncFeFoXhqVJwJJkYy1YTWkoE9QwmMqcB7qlQMv5x9
	/WwWuRQQMIJs2XqDlFMZw/edfwDWbe1Dd36A+fL25AbiBFMhLg==
X-Google-Smtp-Source: ABdhPJyn9YxhU1yLGSGKZzbhqhNMhFMhTVcsFjJ2ueKZny5pWstrpNPNRyT/P3oyAZa0qbkZTraZrRVKqjA0GKyxiUI=
X-Received: by 2002:aa7:990e:0:b0:480:ff8f:d655 with SMTP id
	z14-20020aa7990e000000b00480ff8fd655mr22595770pff.18.1635927324220;
	Wed, 03 Nov 2021 01:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210824031847.GA23326@raspberrypi>
In-Reply-To: <20210824031847.GA23326@raspberrypi>
From: Austin Kim <austindh.kim@gmail.com>
Date: Wed, 3 Nov 2021 17:15:13 +0900
Message-ID: <CADLLry4fgoj5CVeZ8M+QmzzvQ=GTj2AheBJA3eMeSTZT47scNA@mail.gmail.com>
To: dhowells@redhat.com
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1A38FYZu022383
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	=?UTF-8?B?6rmA64+Z7ZiE?= <austin.kim@lge.com>
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: remove always false
	'datalen < 0' expression
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

MjAyMeuFhCA47JuUIDI07J28ICjtmZQpIOyYpO2bhCAxMjoxOCwgQXVzdGluIEtpbSA8YXVzdGlu
ZGgua2ltQGdtYWlsLmNvbT7ri5jsnbQg7J6R7ISxOgo+Cj4gRnJvbTogQXVzdGluIEtpbSA8YXVz
dGluLmtpbUBsZ2UuY29tPgo+Cj4gU2luY2UgJ2RhdGFsZW4nIGlzIGRlY2xhcmVkIGFzIHNpemVf
dCwgdGhlICdkYXRhbGVuIDwgMCcgZXhwcmVzc2lvbgo+IGlzIGFsd2F5cyBmYWxzZS4gV2hlcmUg
c2l6ZV90IGlzIGRlZmluZWQgYXMgYmVsb3c7Cj4KPiAgICB0eXBlZGVmIHVuc2lnbmVkIGxvbmcg
X19rZXJuZWxfdWxvbmdfdDsKPiAgICB0eXBlZGVmIF9fa2VybmVsX3Vsb25nX3QgX19rZXJuZWxf
c2l6ZV90Owo+ICAgIHR5cGVkZWYgX19rZXJuZWxfc2l6ZV90IHNpemVfdDsKPgo+IFNvIGl0IGhh
ZCBiZXR0ZXIgcmVtb3ZlIHVubmVjZXNzYXJ5ICdhbHdheXMgZmFsc2UnIGV4cHJlc3Npb24uCj4K
PiBTaWduZWQtb2ZmLWJ5OiBBdXN0aW4gS2ltIDxhdXN0aW4ua2ltQGxnZS5jb20+Cj4gLS0tCj4g
IGZzL2NhY2hlZmlsZXMvZGFlbW9uLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2NhY2hlZmlsZXMvZGFl
bW9uLmMgYi9mcy9jYWNoZWZpbGVzL2RhZW1vbi5jCj4gaW5kZXggNzUyYzFlNDM0MTZmLi4xY2Zl
ZDllMDgxMmEgMTAwNjQ0Cj4gLS0tIGEvZnMvY2FjaGVmaWxlcy9kYWVtb24uYwo+ICsrKyBiL2Zz
L2NhY2hlZmlsZXMvZGFlbW9uLmMKPiBAQCAtMjI1LDcgKzIyNSw3IEBAIHN0YXRpYyBzc2l6ZV90
IGNhY2hlZmlsZXNfZGFlbW9uX3dyaXRlKHN0cnVjdCBmaWxlICpmaWxlLAo+ICAgICAgICAgaWYg
KHRlc3RfYml0KENBQ0hFRklMRVNfREVBRCwgJmNhY2hlLT5mbGFncykpCj4gICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlPOwo+Cj4gLSAgICAgICBpZiAoZGF0YWxlbiA8IDAgfHwgZGF0YWxlbiA+
IFBBR0VfU0laRSAtIDEpCj4gKyAgICAgICBpZiAoZGF0YWxlbiA+IFBBR0VfU0laRSAtIDEpCj4g
ICAgICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPgo+ICAgICAgICAgLyogZHJhZyB0
aGUgY29tbWFuZCBzdHJpbmcgaW50byB0aGUga2VybmVsIHNvIHdlIGNhbiBwYXJzZSBpdCAqLwo+
IC0tCj4gMi4yMC4xCj4KCklmIHlvdSBhcmUgYXZhaWxhYmxlLCB3b3VsZCB5b3UgcGxlYXNlIHJl
dmlldyB0aGlzIHBhdGNoPwpJdCB3aWxsIG5vdCB0YWtlIGxvbmcuCgpCUiwKQXVzdGluIEtpbQoK
Ci0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpo
dHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnM=

