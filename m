Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3236E2734
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Apr 2023 17:45:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681487144;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AHPvTh6SSUSJllHN6AqJTNlrqVuDJM9E0qrz0knYJec=;
	b=Ajiny3yteZ9KOeLobLiocxP5vWWtvtRlrr+4Yv8UUx510t6CpfqmJcT/kiLZwxDn4x8u0u
	34vLKPNQiSYPnPnFGgi4NSE0/+zcG7sicab5/6/32gQzT+4vfzmuOY+jHv3pHv985yql6p
	2i6xwnYXQTIlOMZtir8Fd+1S8QqosjE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-37NaMlo-OF2dlIQVWd8UXQ-1; Fri, 14 Apr 2023 11:45:41 -0400
X-MC-Unique: 37NaMlo-OF2dlIQVWd8UXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B06A3C10233;
	Fri, 14 Apr 2023 15:45:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1298B1121320;
	Fri, 14 Apr 2023 15:45:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D35D519472CD;
	Fri, 14 Apr 2023 15:45:35 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 116531946589 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 14 Apr 2023 15:45:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E383A112132D; Fri, 14 Apr 2023 15:45:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC6641121320
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 15:45:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC37C38123CE
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 15:45:34 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-UY_VmlM1PPSDFONSuEIuJA-1; Fri, 14 Apr 2023 11:45:32 -0400
X-MC-Unique: UY_VmlM1PPSDFONSuEIuJA-1
Received: by mail-pj1-f41.google.com with SMTP id
 h24-20020a17090a9c1800b002404be7920aso19052210pjp.5
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 08:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681487132; x=1684079132;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7gutJ4yAe/JkNa5xIKaFp+nwMYRP6dEdLjl9hZY/uZI=;
 b=McJrwZbbnAl4kQTVsaacB6SCbY95sVhbdOYIY5JOSziNeyqG+oqfhq6AiP5EfI5lWQ
 kBLbwXtE4jRIY3GSLzDqLjjUXMhuPuxceOElpw1kZsQqHRru+kpakMygoi+UstYXDmgO
 r20Wt3U5ZGcqoWFjp/bGH4FsgwcfR4B9vRct544hhAUD/NGaM+uOjvSlcxyJ4qLb+8Uw
 VMQWJVp8PZ8VoW3QuG2ZjcgtMDIKn+5gNMDZcJKp6EFpQHBQmZX23tD8AT6dqtD1XDcs
 LON1BRWTl47tRVVWfxUHuj/gS5YcOn94ucmIDTF6ZJadJNVG596iGZjAQ7Og7ykHJLIW
 jgaA==
X-Gm-Message-State: AAQBX9dofhRGyK684jCMa/QlivaWvLHlOZRmzGXiNJUcrrfF36S9At2F
 hRTRnuoZprWWaDwUwG/xWBoGpg==
X-Google-Smtp-Source: AKy350Y7T+7xKTE2jnOyKS8B+OM1XJANTVOkZ6bFQpjwSG5ySowVYCk/VmCO7z52L/JBVLB93/WFng==
X-Received: by 2002:a17:902:e801:b0:1a6:4714:5cb2 with SMTP id
 u1-20020a170902e80100b001a647145cb2mr4074836plg.2.1681487131808; 
 Fri, 14 Apr 2023 08:45:31 -0700 (PDT)
Received: from [10.255.185.5] ([139.177.225.243])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a170902869500b001a5260a6e6csm3201794plo.206.2023.04.14.08.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 08:45:31 -0700 (PDT)
Message-ID: <c310a5e7-e410-dbdb-cada-3eca82a9ceb0@bytedance.com>
Date: Fri, 14 Apr 2023 23:45:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
To: David Howells <dhowells@redhat.com>
References: <20230329140155.53272-3-zhujia.zj@bytedance.com>
 <20230329140155.53272-1-zhujia.zj@bytedance.com>
 <1250339.1681480291@warthog.procyon.org.uk>
From: Jia Zhu <zhujia.zj@bytedance.com>
In-Reply-To: <1250339.1681480291@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH V5 2/5] cachefiles: extract ondemand
 info field from cachefiles_object
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CgrlnKggMjAyMy80LzE0IDIxOjUxLCBEYXZpZCBIb3dlbGxzIOWGmemBkzoKPiBKaWEgWmh1IDx6
aHVqaWEuempAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gCj4+ICAgI2RlZmluZSBDQUNIRUZJTEVT
X09CSkVDVF9TVEFURV9GVU5DUyhfc3RhdGUsIF9TVEFURSkJXAo+PiAgIHN0YXRpYyBpbmxpbmUg
Ym9vbAkJCQkJCQkJXAo+PiAgIGNhY2hlZmlsZXNfb25kZW1hbmRfb2JqZWN0X2lzXyMjX3N0YXRl
KGNvbnN0IHN0cnVjdCBjYWNoZWZpbGVzX29iamVjdCAqb2JqZWN0KSBcCj4+ICAgewkJCQkJCQkJ
CQkJCVwKPj4gLQlyZXR1cm4gb2JqZWN0LT5zdGF0ZSA9PSBDQUNIRUZJTEVTX09OREVNQU5EX09C
SlNUQVRFXyMjX1NUQVRFOyBcCj4+ICsJcmV0dXJuIG9iamVjdC0+b25kZW1hbmQtPnN0YXRlID09
IENBQ0hFRklMRVNfT05ERU1BTkRfT0JKU1RBVEVfIyNfU1RBVEU7IFwKPj4gICB9CQkJCQkJCQkJ
CQkJXAo+PiAgIAkJCQkJCQkJCQkJCVwKPj4gICBzdGF0aWMgaW5saW5lIHZvaWQJCQkJCQkJCVwK
Pj4gICBjYWNoZWZpbGVzX29uZGVtYW5kX3NldF9vYmplY3RfIyNfc3RhdGUoc3RydWN0IGNhY2hl
ZmlsZXNfb2JqZWN0ICpvYmplY3QpIFwKPj4gICB7CQkJCQkJCQkJCQkJXAo+PiAtCW9iamVjdC0+
c3RhdGUgPSBDQUNIRUZJTEVTX09OREVNQU5EX09CSlNUQVRFXyMjX1NUQVRFOyBcCj4+ICsJb2Jq
ZWN0LT5vbmRlbWFuZC0+c3RhdGUgPSBDQUNIRUZJTEVTX09OREVNQU5EX09CSlNUQVRFXyMjX1NU
QVRFOyBcCj4+ICAgfQo+IAo+IEkgd29uZGVyIGlmIHRob3NlIG5lZWQgYmFycmllcnMgLSBzbXBf
bG9hZF9hY3F1aXJlKCkgYW5kIHNtcF9zdG9yZV9yZWxlYXNlKCkuCj4gCj4gRGF2aWQKClRoZXJl
IGFyZSB0aHJlZSBvYmplY3Qgc3RhdGVzOiBPUEVOLCBDTE9TRSwgUkVPUEVOSU5HLgoKSGVyZSBp
cyBubyBsb2dpYyBpbiB0aGUgY29kZSBzdWNoIGxpa2U6IEEgaGFzIHRvIHdhdGNoaW5nIGFuZCB3
YWl0aW5nCmZvciBCJ3Mgc3RhdHVzIGNoYW5nZS4KCkFuZCBzbyBmYXIgSSBoYXZlbid0IGNvbnN0
cnVjdGVkIGEgc2NlbmFyaW8gcmVxdWlyZXMgYmFycmllciBwYWlycy4gVGh1cwpJIGRpZG4ndCBh
ZGQgYmFycmllcnMgaGVyZS4KCkppYQo+IAoKLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QK
TGludXgtY2FjaGVmc0ByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtY2FjaGVmcwo=

