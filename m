Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A875983C5
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Aug 2022 15:10:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660828210;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xD4nCfvQXNiZ80Gez1oBqUU2zexyG71ZnxmfUZGul28=;
	b=VZz/CYJgi9+RmFxpXZ3nfj6B5Ox8p9wxslPTQGwn9WQX7qgTtLVbZyBcLIjgyscsfinbFL
	4rPhdl87Jn7PQ8LU1jb2sy1eSD29uKXWfdcLGXc8kGf0Liv7loMY/5MpvItnU7BcLfdx//
	TgxVM3hk/yWuZk2rUS0WsQii1rDqFiw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-PBgJ8t8QMU-NnnhgoMqN9A-1; Thu, 18 Aug 2022 09:10:07 -0400
X-MC-Unique: PBgJ8t8QMU-NnnhgoMqN9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8006382F1A8;
	Thu, 18 Aug 2022 13:10:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD86F14152E1;
	Thu, 18 Aug 2022 13:10:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5CE29194F847;
	Thu, 18 Aug 2022 13:10:06 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6A5891946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 11:02:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3F690400E726; Thu, 18 Aug 2022 11:02:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BC8C4010D42
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 11:02:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24BF3801755
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 11:02:56 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com
 [45.249.212.189]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-u-AX5BeYMlyoROPh20Y9FA-1; Thu, 18 Aug 2022 07:02:54 -0400
X-MC-Unique: u-AX5BeYMlyoROPh20Y9FA-1
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4M7hlJ2JbxzGpc4;
 Thu, 18 Aug 2022 19:01:16 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 18 Aug 2022 19:02:47 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 18 Aug 2022 19:02:47 +0800
To: JeffleXu <jefflexu@linux.alibaba.com>, <dhowells@redhat.com>
References: <20220818094939.1548183-1-sunke32@huawei.com>
 <0cc3f6d6-ac89-05f6-23f3-68446a32d8b2@linux.alibaba.com>
From: Sun Ke <sunke32@huawei.com>
Message-ID: <1ee8458c-9200-7ad8-8497-a142df2bbe0b@huawei.com>
Date: Thu, 18 Aug 2022 19:02:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <0cc3f6d6-ac89-05f6-23f3-68446a32d8b2@linux.alibaba.com>
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Thu, 18 Aug 2022 13:10:05 +0000
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: fix error return code in
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

CgrlnKggMjAyMi84LzE4IDE4OjQ3LCBKZWZmbGVYdSDlhpnpgZM6Cj4gCj4gCj4gT24gOC8xOC8y
MiA1OjQ5IFBNLCBTdW4gS2Ugd3JvdGU6Cj4+IElmIHNpemUgPCAwOyBvcGVuIHJlcXVlc3Qgd2ls
bCBmYWlsLCBidXQgY2FjaGVmaWxlc19vbmRlbWFuZF9jb3BlbiByZXR1cm4gMC4KPiAKPiBIaSwg
dGhpcyBpcyBhIGRlbGliZXJhdGUgZGVzaWduLiBUaGUgY2FjaGVfc2l6ZSBmaWVsZCBvZiBjb3Bl
biBpcwo+IHNwZWNpZmllZCBieSB0aGUgdXNlciBkYWVtb24uIElmIGNhY2hlX3NpemUgPCAwLCB0
aGVuIHRoZSBPUEVOIHJlcXVlc3QKPiBpcyBleHBlY3RlZCB0byBmYWlsLCB3aGlsZSBjb3BlbiBp
dHNlbGYgc2hhbGwgc3VjY2VlZC4KPiAKPj4gRml4IHRvIHJldHVybiBhIG5lZ2F0aXZlIGVycm9y
IGNvZGUuCj4+Cj4+IEZpeGVzOiBjODM4MzA1NDUwNmMgKCJjYWNoZWZpbGVzOiBub3RpZnkgdGhl
IHVzZXIgZGFlbW9uIHdoZW4gbG9va2luZyB1cCBjb29raWUiKQo+PiBTaWduZWQtb2ZmLWJ5OiBT
dW4gS2UgPHN1bmtlMzJAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICAgZnMvY2FjaGVmaWxlcy9vbmRl
bWFuZC5jIHwgMSArCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRp
ZmYgLS1naXQgYS9mcy9jYWNoZWZpbGVzL29uZGVtYW5kLmMgYi9mcy9jYWNoZWZpbGVzL29uZGVt
YW5kLmMKPj4gaW5kZXggMWZlZTcwMmQ1NTI5Li5hMzFkM2ZmMGNlNWYgMTAwNjQ0Cj4+IC0tLSBh
L2ZzL2NhY2hlZmlsZXMvb25kZW1hbmQuYwo+PiArKysgYi9mcy9jYWNoZWZpbGVzL29uZGVtYW5k
LmMKPj4gQEAgLTE2MSw2ICsxNjEsNyBAQCBpbnQgY2FjaGVmaWxlc19vbmRlbWFuZF9jb3Blbihz
dHJ1Y3QgY2FjaGVmaWxlc19jYWNoZSAqY2FjaGUsIGNoYXIgKmFyZ3MpCj4+ICAgCQlpZiAoIUlT
X0VSUl9WQUxVRShzaXplKSkKPj4gICAJCQlzaXplID0gLUVJTlZBTDsKPiAKPiBIb3dldmVyLCBp
dCBpcyBpbmRlZWQgdW5leHBlY3RlZCB3aGVuIGNhY2hlX3NpemUgaXMgYW4gaW52YWxpZCBlcnJv
cgo+IGNvZGUuIEhvdyBhYm91dDoKPiAKPiAJCWlmICghSVNfRVJSX1ZBTFVFKHNpemUpKQo+IC0J
CQlzaXplPSAtRUlOVkFMOwo+ICsJCQlyZXQgPSBzaXplID0gLUVJTlZBTDsKPiAJCXJlcS0+ZXJy
b3IgPSBzaXplOwo+IAkJZ290byBvdXQ7Cj4gCX0KCk9LLCBJIHdpbGwgc2VuZCBhIHYyIHBhdGNo
LgoKVGhhbmtzLApTdW4gS2UKPiAKPj4gICAJCXJlcS0+ZXJyb3IgPSBzaXplOwo+PiArCQlyZXQg
PSAtRUlOVkFMOwo+PiAgIAkJZ290byBvdXQ7Cj4+ICAgCX0KPj4gICAKPiAKCi0tCkxpbnV4LWNh
Y2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xpc3Rt
YW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnMK

