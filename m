Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 621BF61190C
	for <lists+linux-cachefs@lfdr.de>; Fri, 28 Oct 2022 19:14:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666977273;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CLyybDCGYgT5NRhKNjMDlZqbi/YafVkLGZhvBemVWl8=;
	b=bfBo5mmn0Ds2ul5OAJiGtg+fg6n9xtUFxQFo7gW6P+JPdEvC/uFLvUspm2GFpJW2aptzXU
	sLEFU8ITRy/YwIniZER6CCf5AI/anVXMwde5OfLew11C2JdRixh6lqSMcYWkcMpU/HrM0g
	t3rpGgxrbM9S42xN/7O5haDuV8A4fKI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-8jirxGtgN5CdmCu-g1OyKg-1; Fri, 28 Oct 2022 13:14:30 -0400
X-MC-Unique: 8jirxGtgN5CdmCu-g1OyKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE86B3804075;
	Fri, 28 Oct 2022 17:14:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4E671415102;
	Fri, 28 Oct 2022 17:14:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8AFBF19466DF;
	Fri, 28 Oct 2022 17:14:29 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3DF4F1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 28 Oct 2022 17:14:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1AF161415117; Fri, 28 Oct 2022 17:14:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13C971415102
 for <linux-cachefs@redhat.com>; Fri, 28 Oct 2022 17:14:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBF7A811E87
 for <linux-cachefs@redhat.com>; Fri, 28 Oct 2022 17:14:27 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-173-a7il7zOPNZSmd4RQAWIXFg-1; Fri, 28 Oct 2022 13:14:20 -0400
X-MC-Unique: a7il7zOPNZSmd4RQAWIXFg-1
Received: by mail-io1-f50.google.com with SMTP id d123so366334iof.7;
 Fri, 28 Oct 2022 10:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5XNgSsEq8vOrb3y+8G8g3hexuQ/j5bt/MCK+TBnCiJ0=;
 b=i86b8eglCzIR4cjWDl4H4jgJEa1Uz9/8OgaqPoSZdZF6MlK3HZWoqeftZ/zfhSs/4p
 vvunY6lK2ztmYP3GTNVaya/Cu9r/JQgnAp9HfRuWm1S6n7GKFi8HmUAdPNwTM8iMJFtN
 BAksI5IWstqu3VOCoZ/2ltzp+bqiI4KD/F4FfOycb0L8pdk1w4MyPJkqsfXR8RqQkmna
 ZA9Eck7arbfs2YWhT/lNtXl+I+XGtykMnC5rf+9GRNuAfweYvtdhuvy7T8qIyJEbEwfM
 GU+pOcGV3viYDrcqEFu1GdrXGJx+149c25OB4XlVcyksFi+89lb/BAunp0/+JWXsg1YY
 WtNg==
X-Gm-Message-State: ACrzQf3OuhLknNFsC7zUmzIgVRFFTtTX6eUW4BZwF5pj2/wZ8V8KdaOd
 zrPYZwZfcCE/0iL4bhP+3kI/wcMCcQ==
X-Google-Smtp-Source: AMsMyM4xWugIfjL2bKxgAAqoAP5WqrmCAtnlcRXrbJVGopZIWr2X28blkMjO7bmmITEno4znIlHAHQ==
X-Received: by 2002:a05:6638:629:b0:374:e740:883d with SMTP id
 h9-20020a056638062900b00374e740883dmr267479jar.278.1666977259441; 
 Fri, 28 Oct 2022 10:14:19 -0700 (PDT)
Received: from [192.168.75.138] (50-36-85-28.alma.mi.frontiernet.net.
 [50.36.85.28]) by smtp.gmail.com with ESMTPSA id
 y8-20020a056602164800b006a49722dc6dsm1913200iow.11.2022.10.28.10.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 10:14:19 -0700 (PDT)
Message-ID: <8675d583b7d3d2832f7c52da01e4b171e8f5ba46.camel@kernel.org>
From: Trond Myklebust <trondmy@kernel.org>
To: David Wysochanski <dwysocha@redhat.com>
Date: Fri, 28 Oct 2022 13:14:17 -0400
In-Reply-To: <CALF+zOkC4F-g5sW1-v5eyyFph_JuSuSrLMbQ-3Uk71_QN2d75Q@mail.gmail.com>
References: <20221017105212.77588-1-dwysocha@redhat.com>
 <20221017105212.77588-2-dwysocha@redhat.com>
 <010f7996fde7dc4aa7a21e4b2b835d5ae7084771.camel@kernel.org>
 <CALF+zOkC4F-g5sW1-v5eyyFph_JuSuSrLMbQ-3Uk71_QN2d75Q@mail.gmail.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH v9 1/5] NFS: Rename
 readpage_async_filler to nfs_pageio_add_page
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
Cc: linux-nfs@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-cachefs@redhat.com,
 Benjamin Maynard <benmaynard@google.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIyLTEwLTI4IGF0IDA2OjMyIC0wNDAwLCBEYXZpZCBXeXNvY2hhbnNraSB3cm90
ZToKPiBPbiBUaHUsIE9jdCAyNywgMjAyMiBhdCAyOjA3IFBNIFRyb25kIE15a2xlYnVzdCA8dHJv
bmRteUBrZXJuZWwub3JnPgo+IHdyb3RlOgo+ID4gCj4gPiBPbiBNb24sIDIwMjItMTAtMTcgYXQg
MDY6NTIgLTA0MDAsIERhdmUgV3lzb2NoYW5za2kgd3JvdGU6Cj4gPiA+IFJlbmFtZSByZWFkcGFn
ZV9hc3luY19maWxsZXIgdG8gbmZzX3BhZ2Vpb19hZGRfcGFnZSB0bwo+ID4gPiBiZXR0ZXIgcmVm
bGVjdCB3aGF0IHRoaXMgZnVuY3Rpb24gZG9lcyAoYWRkIGEgcGFnZSB0bwo+ID4gPiB0aGUgbmZz
X3BhZ2Vpb19kZXNjcmlwdG9yKSwgYW5kIHNpbXBsaWZ5IGFyZ3VtZW50cyB0bwo+ID4gPiB0aGlz
IGZ1bmN0aW9uIGJ5IHJlbW92aW5nIHN0cnVjdCBuZnNfcmVhZGRlc2MuCj4gPiA+IAo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBEYXZlIFd5c29jaGFuc2tpIDxkd3lzb2NoYUByZWRoYXQuY29tPgo+ID4g
PiBSZXZpZXdlZC1ieTogSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KPiA+ID4gLS0t
Cj4gPiA+IMKgZnMvbmZzL3JlYWQuYyB8IDYwICsrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ID4gPiAtLS0tCj4gPiA+IC0tCj4gPiA+IMKgMSBmaWxlIGNoYW5n
ZWQsIDMwIGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAt
LWdpdCBhL2ZzL25mcy9yZWFkLmMgYi9mcy9uZnMvcmVhZC5jCj4gPiA+IGluZGV4IDhhZTJjOGQx
MjE5ZC4uNTI1ZTgyZWE5YTllIDEwMDY0NAo+ID4gPiAtLS0gYS9mcy9uZnMvcmVhZC5jCj4gPiA+
ICsrKyBiL2ZzL25mcy9yZWFkLmMKPiA+ID4gQEAgLTEyNywxMSArMTI3LDYgQEAgc3RhdGljIHZv
aWQgbmZzX3JlYWRwYWdlX3JlbGVhc2Uoc3RydWN0Cj4gPiA+IG5mc19wYWdlCj4gPiA+ICpyZXEs
IGludCBlcnJvcikKPiA+ID4gwqDCoMKgwqDCoMKgwqAgbmZzX3JlbGVhc2VfcmVxdWVzdChyZXEp
Owo+ID4gPiDCoH0KPiA+ID4gCj4gPiA+IC1zdHJ1Y3QgbmZzX3JlYWRkZXNjIHsKPiA+ID4gLcKg
wqDCoMKgwqDCoCBzdHJ1Y3QgbmZzX3BhZ2Vpb19kZXNjcmlwdG9yIHBnaW87Cj4gPiA+IC3CoMKg
wqDCoMKgwqAgc3RydWN0IG5mc19vcGVuX2NvbnRleHQgKmN0eDsKPiA+ID4gLX07Cj4gPiA+IC0K
PiA+ID4gwqBzdGF0aWMgdm9pZCBuZnNfcGFnZV9ncm91cF9zZXRfdXB0b2RhdGUoc3RydWN0IG5m
c19wYWdlICpyZXEpCj4gPiA+IMKgewo+ID4gPiDCoMKgwqDCoMKgwqDCoCBpZiAobmZzX3BhZ2Vf
Z3JvdXBfc3luY19vbl9iaXQocmVxLCBQR19VUFRPREFURSkpCj4gPiA+IEBAIC0xNTMsNyArMTQ4
LDggQEAgc3RhdGljIHZvaWQgbmZzX3JlYWRfY29tcGxldGlvbihzdHJ1Y3QKPiA+ID4gbmZzX3Bn
aW9faGVhZGVyICpoZHIpCj4gPiA+IAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKHRlc3RfYml0KE5GU19JT0hEUl9FT0YsICZoZHItPmZsYWdzKSkgewo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIG5vdGU6IHJlZ2lv
bnMgb2YgdGhlIHBhZ2Ugbm90IGNvdmVyZWQKPiA+ID4gYnkgYQo+ID4gPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHJlcXVlc3QgYXJlIHplcm9lZCBp
bgo+ID4gPiByZWFkcGFnZV9hc3luY19maWxsZXIgKi8KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiByZXF1ZXN0IGFyZSB6ZXJvZWQgaW4KPiA+
ID4gbmZzX3BhZ2Vpb19hZGRfcGFnZQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChieXRlcyA+IGhkci0+Z29vZF9ieXRlcykgewo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAvKiBub3RoaW5nIGluIHRoaXMgcmVxdWVzdCB3YXMKPiA+ID4gZ29vZCwKPiA+ID4gc28g
emVybwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICogdGhlIGZ1bGwgZXh0ZW50IG9mIHRoZSByZXF1ZXN0Cj4gPiA+
ICovCj4gPiA+IEBAIC0yODEsOCArMjc3LDEwIEBAIHN0YXRpYyB2b2lkIG5mc19yZWFkcGFnZV9y
ZXN1bHQoc3RydWN0Cj4gPiA+IHJwY190YXNrCj4gPiA+ICp0YXNrLAo+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbmZzX3JlYWRwYWdlX3JldHJ5KHRhc2ssIGhkcik7Cj4gPiA+
IMKgfQo+ID4gPiAKPiA+ID4gLXN0YXRpYyBpbnQKPiA+ID4gLXJlYWRwYWdlX2FzeW5jX2ZpbGxl
cihzdHJ1Y3QgbmZzX3JlYWRkZXNjICpkZXNjLCBzdHJ1Y3QgcGFnZQo+ID4gPiAqcGFnZSkKPiA+
ID4gK2ludAo+ID4gPiArbmZzX3BhZ2Vpb19hZGRfcGFnZShzdHJ1Y3QgbmZzX3BhZ2Vpb19kZXNj
cmlwdG9yICpwZ2lvLAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBuZnNfb3Blbl9jb250ZXh0ICpjdHgsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHBhZ2UgKnBhZ2UpCj4gPiAKPiA+IElmIHdlJ3JlIGdv
aW5nIHRvIHJlbmFtZSB0aGlzIGZ1bmN0aW9uLCB0aGVuIGxldCdzIG5vdCBnaXZlIGl0IGEKPiA+
IG5hbWUKPiA+IHRoYXQgc3VnZ2VzdHMgaXQgYmVsb25ncyBpbiBwYWdlbGlzdC5jLiBJdCdzIG5v
dCBhIGdlbmVyaWMgaGVscGVyCj4gPiBmdW5jdGlvbiwgYnV0IGlzIHN0aWxsIHZlcnkgbXVjaCBz
cGVjaWZpYyB0byB0aGUgcGFnZWNhY2hlIHJlYWQKPiA+IGZ1bmN0aW9uYWxpdHkuCj4gPiAKPiAK
PiBIb3cgYWJvdXQgbmZzX3JlYWRfYWRkX3BhZ2UoKT8KPiAKPiAKClRoYXQncyBiZXR0ZXIuIAoK
LS0gClRyb25kIE15a2xlYnVzdApMaW51eCBORlMgY2xpZW50IG1haW50YWluZXIsIEhhbW1lcnNw
YWNlCnRyb25kLm15a2xlYnVzdEBoYW1tZXJzcGFjZS5jb20KCgotLQpMaW51eC1jYWNoZWZzIG1h
aWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhh
dC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZzCg==

