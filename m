Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D20685A1DFF
	for <lists+linux-cachefs@lfdr.de>; Fri, 26 Aug 2022 03:11:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661476307;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n2/SiVldw/OJr6CH/iiByd6za6T1j/UtaFjvDaUEUrM=;
	b=iN61bYgZiH+Mfcl5Yr/hJy0PqitAKZVnHakkX1+ztnq+FobtL9xFGXmQu8zUH3MMZfc2XU
	o4niah/GUdrOdxsRcsqzrHwBy47nw9MgRQjrQc/LeiPwuz0YWLf1jSwsWOGKOxAEzhhOZd
	o4F53VLdoqLMlgJLrpcoTuRo7fZDHzM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-3tjoOC3CMgqVo-w26bAsnA-1; Thu, 25 Aug 2022 21:11:44 -0400
X-MC-Unique: 3tjoOC3CMgqVo-w26bAsnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25D453C01DFD;
	Fri, 26 Aug 2022 01:11:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A59B71121314;
	Fri, 26 Aug 2022 01:11:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 68B001946A5C;
	Fri, 26 Aug 2022 01:11:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5F5AA1946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 26 Aug 2022 01:11:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 12A6F1121315; Fri, 26 Aug 2022 01:11:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EF3D1121314
 for <linux-cachefs@redhat.com>; Fri, 26 Aug 2022 01:11:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E90F785A589
 for <linux-cachefs@redhat.com>; Fri, 26 Aug 2022 01:11:40 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com
 [45.249.212.189]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-xOYjKLX-P8ipNK6jCQt76g-1; Thu, 25 Aug 2022 21:11:38 -0400
X-MC-Unique: xOYjKLX-P8ipNK6jCQt76g-1
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MDMFG0RkJzGprF;
 Fri, 26 Aug 2022 09:09:54 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 26 Aug 2022 09:11:35 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 26 Aug 2022 09:11:34 +0800
To: Dan Carpenter <dan.carpenter@oracle.com>, JeffleXu
 <jefflexu@linux.alibaba.com>, <kernel-janitors@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-cachefs@redhat.com>,
 <linux-fsdevel@vger.kernel.org>
References: <20220818125038.2247720-1-sunke32@huawei.com>
 <3700079.1661336363@warthog.procyon.org.uk>
 <c6fd70dd-2b0b-ea9f-f0f8-9d727cde2718@linux.alibaba.com>
 <20220825133620.GB2071@kadam> <YweAGTuBw1hWm8PW@B-P7TQMD6M-0146.local>
From: Sun Ke <sunke32@huawei.com>
Message-ID: <a9e7f60a-61a6-bceb-2f5a-07438f7bb8e8@huawei.com>
Date: Fri, 26 Aug 2022 09:11:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YweAGTuBw1hWm8PW@B-P7TQMD6M-0146.local>
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH v3] cachefiles: fix error return code in
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
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CgrlnKggMjAyMi84LzI1IDIxOjU4LCBHYW8gWGlhbmcg5YaZ6YGTOgo+IE9uIFRodSwgQXVnIDI1
LCAyMDIyIGF0IDA0OjM2OjIwUE0gKzAzMDAsIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4+IEkgc3Bl
bnQgYSBsb25nIHRpbWUgbG9va2luZyBhdCB0aGlzIGFzIHdlbGwuLi4gIEl0J3MgcmVhbGx5IGlu
c2NydXRhYmxlCj4+IGNvZGUuICBJdCB3b3VsZCBiZSBtb3JlIHJlYWRhYmxlIGlmIHdlIGp1c3Qg
c3BlbGxlZCB0aGluZ3Mgb3V0IGluIHRoZQo+PiBtb3N0IHBlZGFudGljIHdheSBwb3NzaWJsZToK
Pj4KPiAKPiBZZWFoLCB0aGUgZm9sbG93aW5nIGNvZGUgbG9va3MgbXVjaCBiZXR0ZXIuIEtlLCB3
b3VsZCB5b3UgbWluZAo+IHNlbmRpbmcgYSB2ZXJzaW9uIGxpa2UgYmVsb3cgaW5zdGVhZD8KCk9L
LCBJIHdpbGwgdXBkYXRlIGl0Lgo+IAo+IFRoYW5rcywKPiBHYW8gWGlhbmcKPiAKPj4gZGlmZiAt
LWdpdCBhL2ZzL2NhY2hlZmlsZXMvb25kZW1hbmQuYyBiL2ZzL2NhY2hlZmlsZXMvb25kZW1hbmQu
Ywo+PiBpbmRleCAxZmVlNzAyZDU1MjkuLjdlMTU4NmJkNWNmMyAxMDA2NDQKPj4gLS0tIGEvZnMv
Y2FjaGVmaWxlcy9vbmRlbWFuZC5jCj4+ICsrKyBiL2ZzL2NhY2hlZmlsZXMvb25kZW1hbmQuYwo+
PiBAQCAtMTU4LDkgKzE1OCwxMyBAQCBpbnQgY2FjaGVmaWxlc19vbmRlbWFuZF9jb3BlbihzdHJ1
Y3QgY2FjaGVmaWxlc19jYWNoZSAqY2FjaGUsIGNoYXIgKmFyZ3MpCj4+ICAgCj4+ICAgCS8qIGZh
aWwgT1BFTiByZXF1ZXN0IGlmIGRhZW1vbiByZXBvcnRzIGFuIGVycm9yICovCj4+ICAgCWlmIChz
aXplIDwgMCkgewo+PiAtCQlpZiAoIUlTX0VSUl9WQUxVRShzaXplKSkKPj4gLQkJCXNpemUgPSAt
RUlOVkFMOwo+PiAtCQlyZXEtPmVycm9yID0gc2l6ZTsKPj4gKwkJaWYgKCFJU19FUlJfVkFMVUUo
c2l6ZSkpIHsKPj4gKwkJCXJlcS0+ZXJyb3IgPSAtRUlOVkFMOwo+PiArCQkJcmV0ID0gLUVJTlZB
TDsKPj4gKwkJfSBlbHNlIHsKPj4gKwkJCXJlcS0+ZXJyb3IgPSBzaXplOwo+PiArCQkJcmV0ID0g
MDsKPj4gKwkJfQo+PiAgIAkJZ290byBvdXQ7Cj4+ICAgCX0KPj4gICAKPj4KPj4gLS0KPj4gTGlu
dXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKPj4gTGludXgtY2FjaGVmc0ByZWRoYXQuY29tCj4+IGh0
dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVmcwo+
IC4KPiAKCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0
LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNh
Y2hlZnMK

