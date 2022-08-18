Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 973F65983C2
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Aug 2022 15:10:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660828208;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yQAMwK3bLyfs3nZrzDwU5FSEcd+N/B2I2wjzCzqDwpE=;
	b=QcuXROfrkAOKNC0nHNS15ZysIYpHDwxVcS9O/kKn8eR40LJ3fQFqs2XrBhsm7jc9FiOFIy
	J6/RouQphHyMEhc2oi8WDKD/IMSdb5N3LcaahhKwggN26d6icB5Ch5PkiFDRPv0k26wTdj
	vvnImeMtpdu0uubVbfi8Iokwlt1jGEY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-NY4zCUCVMuWwUhL20AyMOw-1; Thu, 18 Aug 2022 09:10:07 -0400
X-MC-Unique: NY4zCUCVMuWwUhL20AyMOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 054891857F0E;
	Thu, 18 Aug 2022 13:10:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF34E14152E1;
	Thu, 18 Aug 2022 13:10:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 845D21953541;
	Thu, 18 Aug 2022 13:10:06 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7ABF51946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 11:28:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6DDA62026D2D; Thu, 18 Aug 2022 11:28:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69F0E2026D07
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 11:28:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86DC2800124
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 11:28:08 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com
 [45.249.212.189]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-ZqCSpQCCPtGPuUf-kHH5sw-1; Thu, 18 Aug 2022 07:28:04 -0400
X-MC-Unique: ZqCSpQCCPtGPuUf-kHH5sw-1
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4M7jJM30FDzGpc5;
 Thu, 18 Aug 2022 19:26:27 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 18 Aug 2022 19:28:00 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 18 Aug 2022 19:28:00 +0800
To: JeffleXu <jefflexu@linux.alibaba.com>, <dhowells@redhat.com>
References: <20220818111935.1683062-1-sunke32@huawei.com>
 <e4e18421-7820-f1e3-6762-5959c2bd7ea4@linux.alibaba.com>
From: Sun Ke <sunke32@huawei.com>
Message-ID: <adf4b4c2-75a2-705d-8870-df130fb583fb@huawei.com>
Date: Thu, 18 Aug 2022 19:27:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <e4e18421-7820-f1e3-6762-5959c2bd7ea4@linux.alibaba.com>
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mailman-Approved-At: Thu, 18 Aug 2022 13:10:05 +0000
Subject: Re: [Linux-cachefs] [v2] cachefiles: fix error return code in
 cachefiles_ondemand_copen()
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
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 linux-cachefs@redhat.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CgrlnKggMjAyMi84LzE4IDE5OjE0LCBKZWZmbGVYdSDlhpnpgZM6Cj4gCj4gCj4gT24gOC8xOC8y
MiA3OjE5IFBNLCBTdW4gS2Ugd3JvdGU6Cj4+IElmIHNpemUgPCAwOyBvcGVuIHJlcXVlc3Qgd2ls
bCBmYWlsLCBidXQgY2FjaGVmaWxlc19vbmRlbWFuZF9jb3BlbiByZXR1cm4gMC4KPj4gRml4IHRv
IHJldHVybiBhIG5lZ2F0aXZlIGVycm9yIGNvZGUuCj4gCj4gQ291bGQgeW91IHBsZWFzZSBhbHNv
IHVwZGF0ZSB0aGUgY29tbWl0IGxvZz8KClRoZSBjYWNoZV9zaXplIGZpZWxkIG9mIGNvcGVuIGlz
IHNwZWNpZmllZCBieSB0aGUgdXNlciBkYWVtb24uIElmIApjYWNoZV9zaXplIDwgMCwgdGhlbiB0
aGUgT1BFTiByZXF1ZXN0IGlzIGV4cGVjdGVkIHRvIGZhaWwsIHdoaWxlIGNvcGVuIAppdHNlbGYg
c2hhbGwgc3VjY2VlZC4gSG93ZXZlciwgcmV0dXJuIDAgaXMgaW5kZWVkIHVuZXhwZWN0ZWQgd2hl
biAKY2FjaGVfc2l6ZSBpcyBhbiBpbnZhbGlkIGVycm9yIGNvZGUuCkZpeCB0byByZXR1cm4gYSBu
ZWdhdGl2ZSBlcnJvciBjb2RlLgoKcmlnaHQ/Cj4gCj4gT3RoZXJ3aXNlIExHVE0uCj4gCj4gUmV2
aWV3ZWQtYnk6IEppbmdibyBYdSA8amVmZmxleHVAbGludXguYWxpYmFiYS5jb20+Cj4gCj4gCj4g
QlRXLCBhbHNvIGNjIGxpbnV4LWZzZGV2ZWxAdmdlci5rZXJuZWwub3JnCj4gCj4+Cj4+IEZpeGVz
OiBjODM4MzA1NDUwNmMgKCJjYWNoZWZpbGVzOiBub3RpZnkgdGhlIHVzZXIgZGFlbW9uIHdoZW4g
bG9va2luZyB1cCBjb29raWUiKQo+PiBTaWduZWQtb2ZmLWJ5OiBTdW4gS2UgPHN1bmtlMzJAaHVh
d2VpLmNvbT4KPj4gLS0tCj4+ICAgZnMvY2FjaGVmaWxlcy9vbmRlbWFuZC5jIHwgMiArLQo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvZnMvY2FjaGVmaWxlcy9vbmRlbWFuZC5jIGIvZnMvY2FjaGVmaWxlcy9vbmRlbWFu
ZC5jCj4+IGluZGV4IDFmZWU3MDJkNTUyOS4uZWE4YTFlODMxN2Q5IDEwMDY0NAo+PiAtLS0gYS9m
cy9jYWNoZWZpbGVzL29uZGVtYW5kLmMKPj4gKysrIGIvZnMvY2FjaGVmaWxlcy9vbmRlbWFuZC5j
Cj4+IEBAIC0xNTksNyArMTU5LDcgQEAgaW50IGNhY2hlZmlsZXNfb25kZW1hbmRfY29wZW4oc3Ry
dWN0IGNhY2hlZmlsZXNfY2FjaGUgKmNhY2hlLCBjaGFyICphcmdzKQo+PiAgIAkvKiBmYWlsIE9Q
RU4gcmVxdWVzdCBpZiBkYWVtb24gcmVwb3J0cyBhbiBlcnJvciAqLwo+PiAgIAlpZiAoc2l6ZSA8
IDApIHsKPj4gICAJCWlmICghSVNfRVJSX1ZBTFVFKHNpemUpKQo+PiAtCQkJc2l6ZSA9IC1FSU5W
QUw7Cj4+ICsJCQlyZXQgPSBzaXplID0gLUVJTlZBTDsKPj4gICAJCXJlcS0+ZXJyb3IgPSBzaXpl
Owo+PiAgIAkJZ290byBvdXQ7Cj4+ICAgCX0KPiAKCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBs
aXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnMK

