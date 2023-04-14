Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B056E255F
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Apr 2023 16:13:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681481625;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LhnHeS19L+G7A0UiKFtgxzRb88h/ptAxILejbJ4n6GI=;
	b=fPpFmRjCASCbWCmxwY0QBQXy0EtO+yrBCA5nVPYObPSwOzWbRAGFlQj6rvvIakI/WH4QS0
	cLsGYTjFWYboQI1MUx+UQb6QBFhdTRk/heai3zI4m41c8Xk3goiNFwAiB0KFu9o6Q8QtLc
	qD6dgR/WWE6ywvTS1G5Ewlw4WUk5m3s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-PJUcXXRsOP-tcQpKu6Bq6w-1; Fri, 14 Apr 2023 10:13:42 -0400
X-MC-Unique: PJUcXXRsOP-tcQpKu6Bq6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85A51858297;
	Fri, 14 Apr 2023 14:13:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C8FE40C6E70;
	Fri, 14 Apr 2023 14:13:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3EF2619472C4;
	Fri, 14 Apr 2023 14:13:41 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1A3D41946A7F for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 14 Apr 2023 14:13:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 07B812166B29; Fri, 14 Apr 2023 14:13:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 003DA2166B26
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 14:13:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D63908996E3
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 14:13:39 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-A-BBqkA4M2SAyi_J23Nhnw-1; Fri, 14 Apr 2023 10:13:38 -0400
X-MC-Unique: A-BBqkA4M2SAyi_J23Nhnw-1
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-63b5c48ea09so336451b3a.1
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 07:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681481617; x=1684073617;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0khoLy+eSzRa5gLnIJcGGxbaem/Y8O3pCzVmwyuZdh8=;
 b=BP3q9abN+zNlaM/ZlzbAdZMESyuiS01WN8tSMqKMYVlGrsBF8DX8qT8P1F+FCwBGeL
 CIPdOqqQNHQS9sOVFam4GwNIH7cP0GHNqeXpbDVSSvFDJU83iZyeKeB4Z+3DaoSRaZSU
 00mfh9CBD1GNmifMEqGjSl/qPO/23InpyGCl07NPKhm4TJI5CSM8/iIPdRmpevnU1a7h
 ey5aJg07e/bH0ztpBL2ZYmIn/XY6+LZsThuWQhndtVRBCvs0TjhonYYYGrXf2vi9sF0J
 PqmuG0r/RiJoUk6dF1uOUi5mzj4fENyYsqNsPWR6idGRgqjZe4CNhyqxzviS+XS5PmHS
 cuGw==
X-Gm-Message-State: AAQBX9f6cJY3yQ7gmAAwh59Ae0W1UlnXsaf5UDWEbN0p3Rvupt1W4IKH
 jKj6PUgWjU1RPC/N+Cw27Bb4Fg==
X-Google-Smtp-Source: AKy350aKg9lmYOUaUEQlZgWqZ66lzJFD1dcVcEBuDBWsSx/PM4wkmkAYb4pSZQkjOSGOhInZapBxgA==
X-Received: by 2002:a05:6a00:178c:b0:63b:4e99:807d with SMTP id
 s12-20020a056a00178c00b0063b4e99807dmr7746205pfg.8.1681481616918; 
 Fri, 14 Apr 2023 07:13:36 -0700 (PDT)
Received: from [10.255.185.5] ([139.177.225.243])
 by smtp.gmail.com with ESMTPSA id
 s20-20020aa78294000000b005921c46cbadsm3189981pfm.99.2023.04.14.07.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 07:13:36 -0700 (PDT)
Message-ID: <1a9c4365-aae1-b4fe-d31d-dfd9b42afae6@bytedance.com>
Date: Fri, 14 Apr 2023 22:13:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
To: David Howells <dhowells@redhat.com>
References: <20230329140155.53272-5-zhujia.zj@bytedance.com>
 <20230329140155.53272-1-zhujia.zj@bytedance.com>
 <1250225.1681480128@warthog.procyon.org.uk>
From: Jia Zhu <zhujia.zj@bytedance.com>
In-Reply-To: <1250225.1681480128@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH V5 4/5] cachefiles: narrow the scope of
 triggering EPOLLIN events in ondemand mode
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
Cc: linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CgrlnKggMjAyMy80LzE0IDIxOjQ4LCBEYXZpZCBIb3dlbGxzIOWGmemBkzoKPiBKaWEgWmh1IDx6
aHVqaWEuempAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gCj4+ICAgCWlmIChjYWNoZWZpbGVzX2lu
X29uZGVtYW5kX21vZGUoY2FjaGUpKSB7Cj4+IC0JCWlmICgheGFfZW1wdHkoJmNhY2hlLT5yZXFz
KSkKPj4gLQkJCW1hc2sgfD0gRVBPTExJTjsKPj4gKwkJaWYgKCF4YV9lbXB0eSh4YSkpIHsKPj4g
KwkJCXJjdV9yZWFkX2xvY2soKTsKPj4gKwkJCXhhX2Zvcl9lYWNoX21hcmtlZCh4YSwgaW5kZXgs
IHJlcSwgQ0FDSEVGSUxFU19SRVFfTkVXKSB7Cj4+ICsJCQkJaWYgKCFjYWNoZWZpbGVzX29uZGVt
YW5kX2lzX3Jlb3BlbmluZ19yZWFkKHJlcSkpIHsKPj4gKwkJCQkJbWFzayB8PSBFUE9MTElOOwo+
PiArCQkJCQlicmVhazsKPj4gKwkJCQl9Cj4+ICsJCQl9Cj4+ICsJCQlyY3VfcmVhZF91bmxvY2so
KTsKPiAKPiBZb3Ugc2hvdWxkIHByb2JhYmx5IHVzZSB4YXNfZm9yX2VhY2hfbWFya2VkKCkgaW5z
dGVhZCBvZiB4YV9mb3JfZWFjaF9tYXJrZWQoKQo+IGFzIHRoZSBmb3JtZXIgc2hvdWxkIHBlcmZv
cm0gYmV0dGVyLgo+IAo+IERhdmlkCgpIaSBEYXZpZCwKClRoYW5rcyBmb3IgeW91ciBhZHZpY2Uu
IEknbGwgcmV2aXNlIGl0IGluIG5leHQgdmVyc2lvbi4KCkppYQo+IAoKLS0KTGludXgtY2FjaGVm
cyBtYWlsaW5nIGxpc3QKTGludXgtY2FjaGVmc0ByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5y
ZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVmcwo=

