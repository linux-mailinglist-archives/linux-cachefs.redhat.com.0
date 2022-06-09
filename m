Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A185449C6
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Jun 2022 13:13:34 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-3Gs9pWnMMhG2Mv50KFA-QQ-1; Thu, 09 Jun 2022 07:13:30 -0400
X-MC-Unique: 3Gs9pWnMMhG2Mv50KFA-QQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82DC8917FE5;
	Thu,  9 Jun 2022 11:13:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCD6B492C3B;
	Thu,  9 Jun 2022 11:13:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 80B911947061;
	Thu,  9 Jun 2022 11:13:28 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E232C1947040 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  9 Jun 2022 11:13:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C704718EA6; Thu,  9 Jun 2022 11:13:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C16A918EAB
 for <linux-cachefs@redhat.com>; Thu,  9 Jun 2022 11:13:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3BBF100FBC3
 for <linux-cachefs@redhat.com>; Thu,  9 Jun 2022 11:13:20 +0000 (UTC)
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-JJGyqgmDNFytn3gy9IkseQ-1; Thu, 09 Jun 2022 07:13:13 -0400
X-MC-Unique: JJGyqgmDNFytn3gy9IkseQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R791e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VFt5NSt_1654773185
Received: from 30.225.24.97(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VFt5NSt_1654773185) by smtp.aliyun-inc.com;
 Thu, 09 Jun 2022 19:13:06 +0800
Message-ID: <2332f3b4-6524-dad8-8c11-01a44b872e40@linux.alibaba.com>
Date: Thu, 9 Jun 2022 19:13:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
To: Jia Zhu <zhujia.zj@bytedance.com>, dhowells@redhat.com
References: <1a03d5de-e0cf-b23d-b12a-f46795125968@bytedance.com>
 <b62a09fc-a42c-72b5-eb42-37b52b3d529f@bytedance.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <b62a09fc-a42c-72b5-eb42-37b52b3d529f@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: narrow the scope of flushed
 requests when releasing fd
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
Cc: linux-cachefs@redhat.com, linux-erofs@lists.ozlabs.org, chao@kernel.org,
 yinxin.x@bytedance.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

CkhpLCBKaWEgWmh1LAoKVGhhbmtzIGZvciBmaXhpbmcgdGhpcy4KCgpPbiA2LzkvMjIgNDo1NCBQ
TSwgSmlhIFpodSB3cm90ZToKPiAKPiBXaGVuIGFuIGFub255bW91cyBmZCBpcyByZWxlYXNlZCwg
b25seSBmbHVzaCB0aGUgcmVxdWVzdHMKPiBhc3NvY2lhdGVkIHdpdGggaXQsIHJhdGhlciB0aGFu
IGFsbCBvZiByZXF1ZXN0cyBpbiB4YXJyYXkuCj4gCj4gRml4ZXM6IDkwMzJiNmU4NTg5ZiAoImNh
Y2hlZmlsZXM6IGltcGxlbWVudCBvbi1kZW1hbmQgcmVhZCIpCj4gU2lnbmVkLW9mZi1ieTogSmlh
IFpodSA8emh1amlhLnpqQGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4gwqBmcy9jYWNoZWZpbGVzL29u
ZGVtYW5kLmMgfCAzICsrLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9mcy9jYWNoZWZpbGVzL29uZGVtYW5kLmMgYi9m
cy9jYWNoZWZpbGVzL29uZGVtYW5kLmMKPiBpbmRleCBhNDFhZTZlZmM1NDUuLjFmZWU3MDJkNTUy
OSAxMDA2NDQKPiAtLS0gYS9mcy9jYWNoZWZpbGVzL29uZGVtYW5kLmMKPiArKysgYi9mcy9jYWNo
ZWZpbGVzL29uZGVtYW5kLmMKPiBAQCAtMjEsNyArMjEsOCBAQCBzdGF0aWMgaW50IGNhY2hlZmls
ZXNfb25kZW1hbmRfZmRfcmVsZWFzZShzdHJ1Y3QgaW5vZGUKPiAqaW5vZGUsCj4gwqDCoMKgwqDC
oCAqIGFub25fZmQuCj4gwqDCoMKgwqDCoCAqLwo+IMKgwqDCoMKgIHhhc19mb3JfZWFjaCgmeGFz
LCByZXEsIFVMT05HX01BWCkgewo+IC3CoMKgwqDCoMKgwqDCoCBpZiAocmVxLT5tc2cub3Bjb2Rl
ID09IENBQ0hFRklMRVNfT1BfUkVBRCkgewo+ICvCoMKgwqDCoMKgwqDCoCBpZiAocmVxLT5tc2cu
b2JqZWN0X2lkID09IG9iamVjdF9pZCAmJgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcS0+
bXNnLm9wY29kZSA9PSBDQUNIRUZJTEVTX09QX1JFQUQpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmVxLT5lcnJvciA9IC1FSU87Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBs
ZXRlKCZyZXEtPmRvbmUpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4YXNfc3RvcmUoJnhh
cywgTlVMTCk7CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEplZmZsZSBYdSA8amVmZmxleHVAbGludXgu
YWxpYmFiYS5jb20+CgotLSAKVGhhbmtzLApKZWZmbGUKCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGlu
ZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnMK

