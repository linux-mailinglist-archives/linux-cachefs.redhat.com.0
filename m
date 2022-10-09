Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 410B95F8A70
	for <lists+linux-cachefs@lfdr.de>; Sun,  9 Oct 2022 11:51:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665309076;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SEDdlyiHSOWagpxgslvoH4PA+m9jpJyT7Z0+1FttPP0=;
	b=Xp8hn6HNt/tF4WS3bM1NMxIVT6hHHppNVdfbS4Y701wvWtrYnCPVF3Hw0kJJmU6qXKYTPQ
	9bth4/sVer2lgWdLXfvW0qDcwtZaSjU2sLxD6mQJ8Ga0TKHOjqoetj/0lgww5ebwz8fEtW
	TvhDI/xlcrTJhk0jL/co52leTov9XSQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-ygxxQWWYNVS25VxX8dtONQ-1; Sun, 09 Oct 2022 05:51:13 -0400
X-MC-Unique: ygxxQWWYNVS25VxX8dtONQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49C5929AA3BF;
	Sun,  9 Oct 2022 09:51:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 647E645359A;
	Sun,  9 Oct 2022 09:51:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B65CD1946595;
	Sun,  9 Oct 2022 09:51:09 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2031F1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Sun,  9 Oct 2022 09:51:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 11922215CDB7; Sun,  9 Oct 2022 09:51:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A4F82166B4D
 for <linux-cachefs@redhat.com>; Sun,  9 Oct 2022 09:51:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E27F29AA3BF
 for <linux-cachefs@redhat.com>; Sun,  9 Oct 2022 09:51:07 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-494-JMO7eLgtOAys7HpNXxUSAQ-1; Sun, 09 Oct 2022 05:51:05 -0400
X-MC-Unique: JMO7eLgtOAys7HpNXxUSAQ-1
Received: by mail-pf1-f172.google.com with SMTP id 3so6945435pfw.4
 for <linux-cachefs@redhat.com>; Sun, 09 Oct 2022 02:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z4m/+MFcLOu4fQCGtHWhklBXP7FJWyhQPBvhnJItC0c=;
 b=CqkKEmkFeVKT/N8QMXDAJfHB+RzZ+HWzfgiBiEuVEen0ia+GFrXAz+w3gF1BlT5Wj9
 uJNPsrnflXZ/dnwFl5MRJ2za5Iaw1TgmVJO3l1rsUtCVoDVXW9QSLA9/rFzXZ55/cK4K
 vkZZYjeJdVNdLImhddldu/91mLfEFWqqiwqUF7EMkHT/sUQlx/6YR797wMClSJKx1OFT
 +I7orGAN15EaeqBoQk29LyoVECtxyXVrW2n0SagSGGvsCu3VcUoMOIESLMKMJCGmLMwO
 +8dIzLkCttt/cfb0wkusQxH5kRWnhZqcC7G+3jDZLnJilObAnn5OODY00sZjcAPcu1Db
 vfkQ==
X-Gm-Message-State: ACrzQf1Ereazy17T00nCSqdoUB2mGUYO4X3lglO2NkCuy6hRRThymQJf
 9nV8La/r1RhvftNGPv+Z6MswrQ==
X-Google-Smtp-Source: AMsMyM7F2xzqmrYGH1iUoyWGCA+/PPWnIKp4VkJG06mIj7pLxR5nygmemQM7ncAmvXBG27h9VFZziw==
X-Received: by 2002:a05:6a00:1a08:b0:545:362c:b219 with SMTP id
 g8-20020a056a001a0800b00545362cb219mr13787740pfv.27.1665309064778; 
 Sun, 09 Oct 2022 02:51:04 -0700 (PDT)
Received: from [10.3.156.122] ([63.216.146.190])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a621b07000000b0053b723a74f7sm4795147pfb.90.2022.10.09.02.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Oct 2022 02:51:04 -0700 (PDT)
Message-ID: <35dfe983-f916-d972-497d-269ec44cf7bf@bytedance.com>
Date: Sun, 9 Oct 2022 17:50:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
To: JeffleXu <jefflexu@linux.alibaba.com>, dhowells@redhat.com,
 xiang@kernel.org
References: <20220818135204.49878-1-zhujia.zj@bytedance.com>
 <20220818135204.49878-3-zhujia.zj@bytedance.com>
 <4fbf60f5-4ed1-3dd8-e4d3-de796e701956@linux.alibaba.com>
From: Jia Zhu <zhujia.zj@bytedance.com>
In-Reply-To: <4fbf60f5-4ed1-3dd8-e4d3-de796e701956@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Linux-cachefs] [External] Re: [RFC PATCH 2/5] cachefiles:
 extract ondemand info field from cachefiles_object
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CgrlnKggMjAyMi8xMC84IDE3OjA2LCBKZWZmbGVYdSDlhpnpgZM6Cj4gCj4gCj4gT24gOC8xOC8y
MiA5OjUyIFBNLCBKaWEgWmh1IHdyb3RlOgo+IAo+PiAgIC8qCj4+ICAgICogQmFja2luZyBmaWxl
IHN0YXRlLgo+PiAgICAqLwo+PiBAQCAtNjcsOCArNzMsNyBAQCBzdHJ1Y3QgY2FjaGVmaWxlc19v
YmplY3Qgewo+PiAgIAl1bnNpZ25lZCBsb25nCQkJZmxhZ3M7Cj4+ICAgI2RlZmluZSBDQUNIRUZJ
TEVTX09CSkVDVF9VU0lOR19UTVBGSUxFCTAJCS8qIEhhdmUgYW4gdW5saW5rZWQgdG1wZmlsZSAq
Lwo+PiAgICNpZmRlZiBDT05GSUdfQ0FDSEVGSUxFU19PTkRFTUFORAo+PiAtCWludAkJCQlvbmRl
bWFuZF9pZDsKPj4gLQllbnVtIGNhY2hlZmlsZXNfb2JqZWN0X3N0YXRlCXN0YXRlOwo+PiArCXZv
aWQJCQkJKnByaXZhdGU7Cj4+ICAgI2VuZGlmCj4+ICAgfTsKPiAKPiBQZXJzb25hbGx5IEkgd291
bGQgcHJlZmVyCj4gCj4gCXN0cnVjdCBjYWNoZWZpbGVzX29iamVjdCB7Cj4gCQkuLi4KPiAJI2lm
ZGVmIENPTkZJR19DQUNIRUZJTEVTX09OREVNQU5ECj4gCQlzdHJ1Y3QgY2FjaGVmaWxlc19vbmRl
bWFuZF9pbmZvICpwcml2YXRlOwo+IAkjZW5kaWYKPiAJfQo+IAo+IGFuZAo+IAo+PiBAQCAtODgs
NiArOTMsNyBAQCB2b2lkIGNhY2hlZmlsZXNfcHV0X29iamVjdChzdHJ1Y3QgY2FjaGVmaWxlc19v
YmplY3QKPiAqb2JqZWN0LAo+PiAgIAkJQVNTRVJUQ01QKG9iamVjdC0+ZmlsZSwgPT0sIE5VTEwp
Owo+Pgo+PiAgIAkJa2ZyZWUob2JqZWN0LT5kX25hbWUpOwo+PiArICNpZmRlZiBDT05GSUdfQ0FD
SEVGSUxFU19PTkRFTUFORAo+PiArCQlrZnJlZShvYmplY3QtPnByaXZhdGUpOwo+PiArICNlbmRp
Zgo+Pgo+PiAgIAkJY2FjaGUgPSBvYmplY3QtPnZvbHVtZS0+Y2FjaGUtPmNhY2hlOwo+PiAgIAkJ
ZnNjYWNoZV9wdXRfY29va2llKG9iamVjdC0+Y29va2llLAo+IAo+IHNvIHRoYXQgd2UgY2FuIGdl
dCByaWQgb2YgQ0FDSEVGSUxFU19PTkRFTUFORF9PQkpJTkZPKCkgc3R1ZmYsIHRvIG1ha2UKPiB0
aGUgY29kZSBtb3JlIHJlYWRhYmxlLgpIaSBKaW5nQm8uIFRoYW5rcyBmb3IgeW91ciByZXZpZXcu
IEknbGwgcmV2aXNlIGl0IGluIG5leHQgdmVyc2lvbi4KPiAKPiAKPiAKCi0tCkxpbnV4LWNhY2hl
ZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4u
cmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnMK

