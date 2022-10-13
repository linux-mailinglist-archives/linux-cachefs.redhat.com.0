Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C6E5FD2EC
	for <lists+linux-cachefs@lfdr.de>; Thu, 13 Oct 2022 03:47:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665625645;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YP5HsRV3u8JVaUtfng1hDFtHHldQfPtWWj+kH4OlJPc=;
	b=UXREJmVIC346vdWlrFy9jrYlLW9NepGNoEw63qUnumrKENpdVutoy3rAdxUbGWJYfGt+dt
	7uTMbzl330QlGqrt5gxDvV390NqQz1aNYQrXSdkeBl5o1ro9nctv+KhfL1t66u9UPyc/fU
	33BoMj8MkENCeycdUiHNhHbBUYlkrjU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-lic6wO3tNuejRKG0Yn8n1A-1; Wed, 12 Oct 2022 21:47:22 -0400
X-MC-Unique: lic6wO3tNuejRKG0Yn8n1A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59CC785A5B6;
	Thu, 13 Oct 2022 01:47:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF7F04B3FC8;
	Thu, 13 Oct 2022 01:47:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6F3651946594;
	Thu, 13 Oct 2022 01:47:21 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 674BD1946588 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 13 Oct 2022 01:47:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3EAED208744E; Thu, 13 Oct 2022 01:47:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 372A72086F75
 for <linux-cachefs@redhat.com>; Thu, 13 Oct 2022 01:47:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16E38833A06
 for <linux-cachefs@redhat.com>; Thu, 13 Oct 2022 01:47:20 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-137-nsOqD_jDMoud0WCyGEz1OA-1; Wed, 12 Oct 2022 21:47:16 -0400
X-MC-Unique: nsOqD_jDMoud0WCyGEz1OA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R951e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VS1VlX2_1665625631
Received: from 30.221.130.192(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VS1VlX2_1665625631) by smtp.aliyun-inc.com;
 Thu, 13 Oct 2022 09:47:12 +0800
Message-ID: <3051133b-1408-2ccb-b22f-e5ee990bdc4f@linux.alibaba.com>
Date: Thu, 13 Oct 2022 09:47:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
To: Jia Zhu <zhujia.zj@bytedance.com>, dhowells@redhat.com, xiang@kernel.org
References: <20221011131552.23833-1-zhujia.zj@bytedance.com>
 <20221011131552.23833-4-zhujia.zj@bytedance.com>
 <28d64f00-e408-9fc2-9506-63c1d8b08b9c@linux.alibaba.com>
 <c6f5d729-2083-817d-fe7d-b01bce27e39f@bytedance.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <c6f5d729-2083-817d-fe7d-b01bce27e39f@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Linux-cachefs] [External] Re: [PATCH 3/5] cachefiles: resend
 an open request if the read request's object is closed
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

CgpPbiAxMC8xMi8yMiAxMTozNyBQTSwgSmlhIFpodSB3cm90ZToKPiAKPiAKPiDlnKggMjAyMi8x
MC8xMiAxNTo1MywgSmVmZmxlWHUg5YaZ6YGTOgo+Pgo+Pgo+PiBPbiAxMC8xMS8yMiA5OjE1IFBN
LCBKaWEgWmh1IHdyb3RlOgo+Pj4gQEAgLTI1NCwxMiArMjgyLDE4IEBAIHNzaXplX3QgY2FjaGVm
aWxlc19vbmRlbWFuZF9kYWVtb25fcmVhZChzdHJ1Y3QKPj4+IGNhY2hlZmlsZXNfY2FjaGUgKmNh
Y2hlLAo+Pj4gwqDCoMKgwqDCoMKgICogcmVxdWVzdCBkaXN0cmlidXRpb24gZmFpci4KPj4+IMKg
wqDCoMKgwqDCoCAqLwo+Pj4gwqDCoMKgwqDCoCB4YV9sb2NrKCZjYWNoZS0+cmVxcyk7Cj4+PiAt
wqDCoMKgIHJlcSA9IHhhc19maW5kX21hcmtlZCgmeGFzLCBVSU5UX01BWCwgQ0FDSEVGSUxFU19S
RVFfTkVXKTsKPj4+IC3CoMKgwqAgaWYgKCFyZXEgJiYgY2FjaGUtPnJlcV9pZF9uZXh0ID4gMCkg
ewo+Pj4gLcKgwqDCoMKgwqDCoMKgIHhhc19zZXQoJnhhcywgMCk7Cj4+PiAtwqDCoMKgwqDCoMKg
wqAgcmVxID0geGFzX2ZpbmRfbWFya2VkKCZ4YXMsIGNhY2hlLT5yZXFfaWRfbmV4dCAtIDEsCj4+
PiBDQUNIRUZJTEVTX1JFUV9ORVcpOwo+Pj4gK3JldHJ5Ogo+Pj4gK8KgwqDCoCB4YXNfZm9yX2Vh
Y2hfbWFya2VkKCZ4YXMsIHJlcSwgeGFfbWF4LCBDQUNIRUZJTEVTX1JFUV9ORVcpIHsKPj4+ICvC
oMKgwqDCoMKgwqDCoCBpZiAoY2FjaGVmaWxlc19vbmRlbWFuZF9za2lwX3JlcShyZXEpKQo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+PiArwqDCoMKgwqDCoMKgwqAgYnJl
YWs7Cj4+PiDCoMKgwqDCoMKgIH0KPj4+IMKgwqDCoMKgwqAgaWYgKCFyZXEpIHsKPj4+ICvCoMKg
wqDCoMKgwqDCoCBpZiAoY2FjaGUtPnJlcV9pZF9uZXh0ID4gMCAmJiB4YV9tYXggPT0gVUxPTkdf
TUFYKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4YXNfc2V0KCZ4YXMsIDApOwo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGFfbWF4ID0gY2FjaGUtPnJlcV9pZF9uZXh0IC0gMTsK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gcmV0cnk7Cj4+PiArwqDCoMKgwqDCoMKg
wqAgfQo+Pgo+PiBJIHdvdWxkIHN1Z2dlc3QgYWJzdHJhY3RpbmcgdGhlICJ4YXNfZm9yX2VhY2hf
bWFya2VkKC4uLiwKPj4gQ0FDSEVGSUxFU19SRVFfTkVXKSIgcGFydCBpbnRvIGEgaGVscGVyIGZ1
bmN0aW9uIHRvIGF2b2lkIHRoZSAiZ290bwo+PiByZXRyeSIuCj4+Cj4gSGkgSmluZ0JvLAo+IAo+
IFRoYW5rcyBmb3IgeW91ciBhZHZpY2UuIEFyZSB0aGUgZm9sbG93aW5nIHJldmlzZXMgYXBwcm9w
cmlhdGXvvJ8KPiAKPiBzdGF0aWMgc3RydWN0IGNhY2hlZmlsZXNfcmVxICpjYWNoZWZpbGVzX29u
ZGVtYW5kX3NlbGVjdF9yZXEoc3RydWN0Cj4geGFfc3RhdGUgKnhhcywgdW5zaWduZWQgbG9uZyB4
YV9tYXgpCj4gewo+IMKgwqDCoCBzdHJ1Y3QgY2FjaGVmaWxlc19yZXEgKnJlcTsKPiDCoMKgwqAg
c3RydWN0IGNhY2hlZmlsZXNfb25kZW1hbmRfaW5mbyAqaW5mbzsKPiAKPiDCoMKgwqAgeGFzX2Zv
cl9lYWNoX21hcmtlZCh4YXMsIHJlcSwgeGFfbWF4LCBDQUNIRUZJTEVTX1JFUV9ORVcpIHsKPiDC
oMKgwqDCoMKgwqDCoCBpZiAoIXJlcSB8fCByZXEtPm1zZy5vcGNvZGUgIT0gQ0FDSEVGSUxFU19P
UF9SRUFEKQoKeGFzX2Zvcl9lYWNoX21hcmtlZCgpIHdpbGwgZ3VhcmFudGVlIHRoYXQgQHJlcSB3
b24ndCBiZSBOVUxMLCBhbmQgdGh1cwp0aGUgTlVMTCBjaGVjayBoZXJlIGluIHVubmVjZXNzYXJ5
LiBPdGhlcndpc2UgTEdUTS4KCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmVxOwo+
IMKgwqDCoMKgwqDCoMKgIGluZm8gPSByZXEtPm9iamVjdC0+cHJpdmF0ZTsKPiDCoMKgwqDCoMKg
wqDCoCBpZiAoaW5mby0+c3RhdGUgPT0gQ0FDSEVGSUxFU19PTkRFTUFORF9PQkpTVEFURV9jbG9z
ZSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FjaGVmaWxlc19vbmRlbWFuZF9zZXRfb2Jq
ZWN0X3Jlb3BlbmluZyhyZXEtPm9iamVjdCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBxdWV1
ZV93b3JrKGZzY2FjaGVfd3EsICZpbmZvLT53b3JrKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbnRpbnVlOwo+IMKgwqDCoMKgwqDCoMKgIH0gZWxzZSBpZiAoaW5mby0+c3RhdGUgPT0gQ0FD
SEVGSUxFU19PTkRFTUFORF9PQkpTVEFURV9yZW9wZW5pbmcpIHsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNvbnRpbnVlOwo+IMKgwqDCoMKgwqDCoMKgIH0KPiDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gcmVxOwo+IMKgwqDCoCB9Cj4gwqDCoMKgIHJldHVybiBOVUxMOwo+IH0KPiAKPiAuLi4KPiAK
PiDCoHhhX2xvY2soJmNhY2hlLT5yZXFzKTsKPiDCoMKgwqAgcmVxID0gY2FjaGVmaWxlc19vbmRl
bWFuZF9zZWxlY3RfcmVxKCZ4YXMsIFVMT05HX01BWCk7Cj4gwqDCoMKgIGlmICghcmVxICYmIGNh
Y2hlLT5yZXFfaWRfbmV4dCA+IDApIHsKPiDCoMKgwqDCoMKgwqDCoCB4YXNfc2V0KCZ4YXMsIDAp
Owo+IMKgwqDCoMKgwqDCoMKgIHJlcSA9IGNhY2hlZmlsZXNfb25kZW1hbmRfc2VsZWN0X3JlcSgm
eGFzLCBjYWNoZS0+cmVxX2lkX25leHQgLSAxKTsKPiDCoMKgwqAgfQo+IMKgwqDCoCBpZiAoIXJl
cSkgewo+IMKgwqDCoMKgwqDCoMKgIHhhX3VubG9jaygmY2FjaGUtPnJlcXMpOwo+IMKgwqDCoMKg
wqDCoMKgIHJldHVybiAwOwo+IMKgwqDCoCB9Cj4+CgoKLS0gClRoYW5rcywKSmluZ2JvCgotLQpM
aW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6
Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZzCg==

