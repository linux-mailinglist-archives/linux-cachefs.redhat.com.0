Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1806CD40D
	for <lists+linux-cachefs@lfdr.de>; Wed, 29 Mar 2023 10:09:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680077355;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3tF2qsWXb46At9j1MRNwDD3/s/Ebfj+k7WmZIcnmXGg=;
	b=XL0zA8ELvQrnYPAge0Xcd2yfik+ZE1/AkeWA5VO9Mo6JxQu8YKrMeB8WqpfbszZDSCgCZz
	Pe7JaCmcRj/gSPe/zPBJUrwOkiOsycKn/OXm/BH9XeHl/qDGDvjbXO9wYqB1i4biyivxvs
	pmEOQsBjoB8hYWu31dGG+OogfqMwe14=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-sXhePCqROQS-o3h0jjiUSA-1; Wed, 29 Mar 2023 04:09:12 -0400
X-MC-Unique: sXhePCqROQS-o3h0jjiUSA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB8BD886063;
	Wed, 29 Mar 2023 08:09:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5B5E440DD;
	Wed, 29 Mar 2023 08:09:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AD89B1946597;
	Wed, 29 Mar 2023 08:09:09 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2261B194658C for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 08:09:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 02442C15BB8; Wed, 29 Mar 2023 08:09:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDBB6C15BA0
 for <linux-cachefs@redhat.com>; Wed, 29 Mar 2023 08:09:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBC2A85530E
 for <linux-cachefs@redhat.com>; Wed, 29 Mar 2023 08:09:07 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-5JC7I5O4Mlu8Zequ6L0S7w-1; Wed, 29 Mar 2023 04:08:56 -0400
X-MC-Unique: 5JC7I5O4Mlu8Zequ6L0S7w-1
Received: by mail-pj1-f44.google.com with SMTP id j13so13353116pjd.1
 for <linux-cachefs@redhat.com>; Wed, 29 Mar 2023 01:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680077335;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mVRpG2dAr/nWYNSNRqghl5EEZFHlwrwTvwCgPASuUmU=;
 b=7/TWalb18G+xDW9n1VgoQnEsw7aQBImBijbEeBkmRXZCQpquP9Ct5GzU8sFYUA28pg
 tnnBdboCD3m/T23sT24UqWzIPT8sc/ngK89JnX1UR8JaMQ/2J9wN6H5QPn1QAeSIzHsD
 zAtJvnW2Um4AdAkDKult060vW9lhHIFhp8pFR2ELd7uY4+5kun59Gikdt72o4FIDgTDe
 ytXOxQvwYAmIOsrKRL6SrXR22ISBe8+6nhjf1SAxMKbBe+SUWBlhzOLo5AuZVXqu45ze
 4TEU0bYHniFUiAaKi1i1qYbsxkM+6bRuDIeNf5BIobq8T/BsCcYnQqrwl6ShHGzoFe6d
 rczA==
X-Gm-Message-State: AAQBX9dKolPZD+cIQ9dUIUKgO1LeFhcgrcYJomDV7qLy7SumqznDBqAg
 0xv0pHBvD1/Rh1yLTGmaMh1Gug==
X-Google-Smtp-Source: AKy350YkuPVOI4SkoYUmjVLLsU+g0OQwvsA0hoKkKc7WLUm0Sa5StE4Ydf+KVToEOuvk5LGwIcWN8g==
X-Received: by 2002:a17:90b:3ece:b0:23f:6edd:41da with SMTP id
 rm14-20020a17090b3ece00b0023f6edd41damr20304030pjb.29.1680077335048; 
 Wed, 29 Mar 2023 01:08:55 -0700 (PDT)
Received: from [10.3.144.50] ([61.213.176.11])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a17090ae38f00b002369e16b276sm859568pjz.32.2023.03.29.01.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 01:08:54 -0700 (PDT)
Message-ID: <2a39ced1-05f1-d696-1905-4ff5199fa41b@bytedance.com>
Date: Wed, 29 Mar 2023 16:08:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: David Howells <dhowells@redhat.com>
References: <20230111052515.53941-5-zhujia.zj@bytedance.com>
 <20230111052515.53941-1-zhujia.zj@bytedance.com>
 <133078.1680013145@warthog.procyon.org.uk>
From: Jia Zhu <zhujia.zj@bytedance.com>
In-Reply-To: <133078.1680013145@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Linux-cachefs] [External] Re: [PATCH V4 4/5] cachefiles:
 narrow the scope of triggering EPOLLIN events in ondemand mode
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
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CgrlnKggMjAyMy8zLzI4IDIyOjE5LCBEYXZpZCBIb3dlbGxzIOWGmemBkzoKPiBKaWEgWmh1IDx6
aHVqaWEuempAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gCj4+ICsJCWlmICgheGFfZW1wdHkoeGEp
KSB7Cj4+ICsJCQl4YV9sb2NrKHhhKTsKPj4gKwkJCXhhX2Zvcl9lYWNoX21hcmtlZCh4YSwgaW5k
ZXgsIHJlcSwgQ0FDSEVGSUxFU19SRVFfTkVXKSB7Cj4+ICsJCQkJaWYgKCFjYWNoZWZpbGVzX29u
ZGVtYW5kX2lzX3Jlb3BlbmluZ19yZWFkKHJlcSkpIHsKPj4gKwkJCQkJbWFzayB8PSBFUE9MTElO
Owo+PiArCQkJCQlicmVhazsKPj4gKwkJCQl9Cj4+ICsJCQl9Cj4+ICsJCQl4YV91bmxvY2soeGEp
Owo+PiArCQl9Cj4gCj4gSSB3b25kZXIgaWYgdGhlcmUncyBhIG1vcmUgZWZmaWNpZW50IHdheSB0
byBkbyB0aGlzLiAgSSBndWVzcyBpdCBkZXBlbmRzIG9uCj4gaG93IG1hbnkgcmVxcyB5b3UgZXhw
ZWN0IHRvIGdldCBpbiBhIHF1ZXVlLiAgSXQgbWlnaHQgYmUgd29ydGggdGFraW5nIHRoZQo+IHJj
dV9yZWFkX2xvY2sgYmVmb3JlIGNhbGxpbmcgeGFfbG9jaygpIGFuZCBob2xkaW5nIGl0IG92ZXIg
dGhlIHdob2xlIGxvb3AuCj4gClRoYW5rcyBmb3IgdGhlIGFkdmljZSwgd2lsbCB1c2UgcmN1X3Jl
YWRfbG9ja++8iHVubG9ja++8iSB0byByZXBsYWNlIGl0Lgo+IERhdmlkCj4gCgotLQpMaW51eC1j
YWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0
bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZzCg==

