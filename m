Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8925E62BDB1
	for <lists+linux-cachefs@lfdr.de>; Wed, 16 Nov 2022 13:24:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668601498;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WZU331GczDxF5wYF4wAj5dII8T7OnkLTX/CsMBuegCw=;
	b=bD3kL1BxjLq3WL5hPkYdfk82vrZ1NNnvR9mhaEVTjjWMtY1y6jYzdJmEoOCQt0X37xTovf
	x96thJZA44B5ZP1xQA1SB4x60FaVBo50wrBO6cYd6q2mFX8gRhP3jSdRg6QdXL1+loHtU4
	H067taXhI9YTaiOqt96mE04k6ScRy2k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-KZrcRHDaM5iyZKvDJhUGuA-1; Wed, 16 Nov 2022 07:24:55 -0500
X-MC-Unique: KZrcRHDaM5iyZKvDJhUGuA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACF753C0ED50;
	Wed, 16 Nov 2022 12:24:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3954492B05;
	Wed, 16 Nov 2022 12:24:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6B5C019465A8;
	Wed, 16 Nov 2022 12:24:54 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8BC7C19465A3 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 16 Nov 2022 12:18:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7AFE640C6DC7; Wed, 16 Nov 2022 12:18:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 738FA40C6EC3
 for <linux-cachefs@redhat.com>; Wed, 16 Nov 2022 12:18:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5895B887404
 for <linux-cachefs@redhat.com>; Wed, 16 Nov 2022 12:18:00 +0000 (UTC)
Received: from out199-9.us.a.mail.aliyun.com (out199-9.us.a.mail.aliyun.com
 [47.90.199.9]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-USxRRC78MhKD93jITX3agw-1; Wed, 16 Nov 2022 07:17:58 -0500
X-MC-Unique: USxRRC78MhKD93jITX3agw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VUxx6gz_1668601073
Received: from 30.221.128.213(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VUxx6gz_1668601073) by smtp.aliyun-inc.com;
 Wed, 16 Nov 2022 20:17:54 +0800
Message-ID: <68463af5-952b-a024-21fd-fa9e5fc37eb3@linux.alibaba.com>
Date: Wed, 16 Nov 2022 20:17:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: Jeff Layton <jlayton@kernel.org>, xiang@kernel.org, chao@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-cachefs@redhat.com, dhowells@redhat.com
References: <20221116104502.107431-1-jefflexu@linux.alibaba.com>
 <20221116104502.107431-2-jefflexu@linux.alibaba.com>
 <2b595b62f6ecd28298a860fcdc5b4941dcafd9eb.camel@kernel.org>
From: Jingbo Xu <jefflexu@linux.alibaba.com>
In-Reply-To: <2b595b62f6ecd28298a860fcdc5b4941dcafd9eb.camel@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH v3 1/2] fscache,
 cachefiles: add prepare_ondemand_read() callback
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSmVmZiwKClRoYW5rcyBmb3IgdGhlIGNvbW1lbnQhCgpPbiAxMS8xNi8yMiA3OjU4IFBNLCBK
ZWZmIExheXRvbiB3cm90ZToKCj4+ICAKPj4gLS8qCj4+IC0gKiBQcmVwYXJlIGEgcmVhZCBvcGVy
YXRpb24sIHNob3J0ZW5pbmcgaXQgdG8gYSBjYWNoZWQvdW5jYWNoZWQKPj4gLSAqIGJvdW5kYXJ5
IGFzIGFwcHJvcHJpYXRlLgo+PiAtICovCj4+IC1zdGF0aWMgZW51bSBuZXRmc19pb19zb3VyY2Ug
Y2FjaGVmaWxlc19wcmVwYXJlX3JlYWQoc3RydWN0IG5ldGZzX2lvX3N1YnJlcXVlc3QgKnN1YnJl
cSwKPj4gLQkJCQkJCSAgICAgIGxvZmZfdCBpX3NpemUpCj4+ICtzdGF0aWMgZW51bSBuZXRmc19p
b19zb3VyY2UgY2FjaGVmaWxlc19kb19wcmVwYXJlX3JlYWQoc3RydWN0IG5ldGZzX2NhY2hlX3Jl
c291cmNlcyAqY3JlcywKPj4gKwkJCQkJbG9mZl90ICpfc3RhcnQsIHNpemVfdCAqX2xlbiwKPj4g
KwkJCQkJdW5zaWduZWQgbG9uZyAqX2ZsYWdzLCBsb2ZmX3QgaV9zaXplKQo+IAo+IF9zdGFydCBp
cyBuZXZlciBjaGFuZ2VkLCBzbyBpdCBzaG91bGQgYmUgcGFzc2VkIGJ5IHZhbHVlIGluc3RlYWQg
b2YgYnkKPiBwb2ludGVyLiAKClllYWgsIHN0YXJ0IGlzIGluZGVlZCB1bmNoYW5nZWQsIGFuZCBJ
IHRoaW5rIGl0J3MgYWxzbyByZWFzb25hYmxlIHRvCnBhc3MgaXQgYnkgdmFsdWUgcmF0aGVyIHRo
YW4gYnkgcG9pbnRlci4KCgo+IEknZCBhbHNvIHJldmVyc2UgdGhlIHBvc2l0aW9uIG9mIHRoZSBh
cmd1bWVudHMgZm9yIF9mbGFncyBhbmQKPiBpX3NpemUuwqAgT3RoZXJ3aXNlLCB0aGUgQ1BVL2Nv
bXBpbGVyIGhhdmUgdG8gc2h1ZmZsZSB0aGluZ3MgYXJvdW5kIG1vcmUKPiBpbiBjYWNoZWZpbGVz
X3ByZXBhcmVfb25kZW1hbmRfcmVhZCBiZWZvcmUgdGhleSBjYWxsIHRoaXMuCgpZZWFoIEkgZGlk
bid0IG5vdGljZSB0aGUgZGV0YWlscy4KCgpJIHdpbGwgZml4IHRoZSBhYm92ZSB0d28gaXNzdWVz
IGluIGEgcXVpY2sgdjQgdmVyc2lvbi4KCk1hbnkgdGhhbmtzIGZvciB0aGUgZmVlZGJhY2suCgoK
Ci0tIApUaGFua3MsCkppbmdibwoKLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKTGludXgt
Y2FjaGVmc0ByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtY2FjaGVmcwo=

