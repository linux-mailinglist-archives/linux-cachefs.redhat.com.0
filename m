Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C96E268D
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Apr 2023 17:13:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681485190;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dz53Y476jrKlkD+SsybkcHXD0ebMZlveGJLwG4s5dZE=;
	b=Wpb72vY9f7truU96Fu/zBlS+0lhW5dNTqTPGOf6kmRxw5IeVaM1XcpDZTiimGLAaZhmE6U
	OSMK+NOuwtrZY/QFQeIvvnwcLdg4ce0sRmmhKJJtXb+ibkRhjMawfD4EmQQVfVp06gIYgn
	M8Zb5u0+EYe+z9K7S+O7EViNlBnAXA4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-pOVfU6U9Ob20IaAvGjQWlQ-1; Fri, 14 Apr 2023 11:13:07 -0400
X-MC-Unique: pOVfU6U9Ob20IaAvGjQWlQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05637381495C;
	Fri, 14 Apr 2023 15:13:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 748124042ACB;
	Fri, 14 Apr 2023 15:13:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 172D419472CE;
	Fri, 14 Apr 2023 15:13:05 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1CBAB19472C9 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 14 Apr 2023 15:13:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EDED7492C14; Fri, 14 Apr 2023 15:13:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E60FE492C13
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 15:13:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA53C88B7A1
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 15:13:03 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-GG4qOG7sM369dtlDL_488Q-1; Fri, 14 Apr 2023 11:13:02 -0400
X-MC-Unique: GG4qOG7sM369dtlDL_488Q-1
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-24735727c83so172367a91.3
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 08:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681485181; x=1684077181;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7E15TZKBUj7LhKJ72c7EvYGt3lCtMNYU30GwoWvGVWc=;
 b=SiTeNosqloJg6vHtUMJaTGiDUS8iKlT+FjlnpkcBAajbsYhleNrbFcsayZ2bm57kKu
 wpVydfOmdNrDNlVJiTMV84Y1Sgy5+JRElRlAOqNaV83wQOc4cMfRccUIzNJTFuCmxD/I
 xAYUolGzJ3lu64ez+xXjx2bwNFWuUA80IsmDZIhV0gs57VjvUnuODLn7tHuAQvcxwVWP
 wLnBMbO5FnZqEWUWzzVfe5Z5zRCPWrbVm6xt198JRPj1+ix5i6W1Uh4H/9wTfpxxOhDP
 uV6eCdD7t9r+aI7jDRa++1gbTtyMrx8qWE1kczHTosav9jI0DkzNCE1i1bzHuGzJjqb8
 GtlA==
X-Gm-Message-State: AAQBX9caY9Gj3qKl78MDILI9NAQya1DlwabU72gZ00skBlxsYWb1PG+K
 NRPERsDmx9zWScnXXNkAlviGpg==
X-Google-Smtp-Source: AKy350a/j8gjvHx5XSjNdD1sExInjJAJ7u6ERNSyq4ejXK3n0tHMQ777nwe9LmVp5aHRdXJu3Y85pw==
X-Received: by 2002:a05:6a00:2e1d:b0:636:ea6c:68d8 with SMTP id
 fc29-20020a056a002e1d00b00636ea6c68d8mr8600263pfb.27.1681485181079; 
 Fri, 14 Apr 2023 08:13:01 -0700 (PDT)
Received: from [10.255.185.5] ([139.177.225.243])
 by smtp.gmail.com with ESMTPSA id
 5-20020aa79105000000b0063b1bb2e0a7sm3129352pfh.203.2023.04.14.08.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 08:13:00 -0700 (PDT)
Message-ID: <65f424ca-d7cd-f53b-cefc-684ec0393bce@bytedance.com>
Date: Fri, 14 Apr 2023 23:12:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
To: David Howells <dhowells@redhat.com>
References: <20230329140155.53272-6-zhujia.zj@bytedance.com>
 <20230329140155.53272-1-zhujia.zj@bytedance.com>
 <1250439.1681480404@warthog.procyon.org.uk>
From: Jia Zhu <zhujia.zj@bytedance.com>
In-Reply-To: <1250439.1681480404@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH V5 5/5] cachefiles: add restore command
 to recover inflight ondemand read requests
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CgrlnKggMjAyMy80LzE0IDIxOjUzLCBEYXZpZCBIb3dlbGxzIOWGmemBkzoKPiBKaWEgWmh1IDx6
aHVqaWEuempAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gCj4+ICtpbnQgY2FjaGVmaWxlc19vbmRl
bWFuZF9yZXN0b3JlKHN0cnVjdCBjYWNoZWZpbGVzX2NhY2hlICpjYWNoZSwgY2hhciAqYXJncykK
Pj4gK3sKPj4gKwlzdHJ1Y3QgY2FjaGVmaWxlc19yZXEgKnJlcTsKPj4gKwo+PiArCVhBX1NUQVRF
KHhhcywgJmNhY2hlLT5yZXFzLCAwKTsKPj4gKwo+PiArCWlmICghdGVzdF9iaXQoQ0FDSEVGSUxF
U19PTkRFTUFORF9NT0RFLCAmY2FjaGUtPmZsYWdzKSkKPj4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQ
Owo+PiArCj4+ICsJLyoKPj4gKwkgKiBSZXNldCB0aGUgcmVxdWVzdHMgdG8gQ0FDSEVGSUxFU19S
RVFfTkVXIHN0YXRlLCBzbyB0aGF0IHRoZQo+PiArCSAqIHJlcXVlc3RzIGhhdmUgYmVlbiBwcm9j
ZXNzZWQgaGFsZndheSBiZWZvcmUgdGhlIGNyYXNoIG9mIHRoZQo+PiArCSAqIHVzZXIgZGFlbW9u
IGNvdWxkIGJlIHJlcHJvY2Vzc2VkIGFmdGVyIHRoZSByZWNvdmVyeS4KPj4gKwkgKi8KPj4gKwl4
YXNfbG9jaygmeGFzKTsKPj4gKwl4YXNfZm9yX2VhY2goJnhhcywgcmVxLCBVTE9OR19NQVgpCj4+
ICsJCXhhc19zZXRfbWFyaygmeGFzLCBDQUNIRUZJTEVTX1JFUV9ORVcpOwo+PiArCXhhc191bmxv
Y2soJnhhcyk7Cj4+ICsKPj4gKwl3YWtlX3VwX2FsbCgmY2FjaGUtPmRhZW1vbl9wb2xsd3EpOwo+
PiArCXJldHVybiAwOwo+PiArfQo+IAo+IFNob3VsZCB0aGVyZSBiZSBhIGNoZWNrIHRvIHNlZSBp
ZiB0aGlzIGlzIG5lZWRlZD8KPiAKPiBEYXZpZAoKSSd2ZSBjb25zaWRlcmVkIHdoZXRoZXIgdG8g
YWRkIGEgY2hlY2sgaGVyZSwgc2luY2UgdGhlIHVzZXIgY291bGQgaW52b2tlCidyZXN0b3JlJyB0
aHJvdWdoIGlvY3RsIGF0IGFueSB0aW1lLgoKSWYgJ3Jlc3RvcmUnIGlzIGNhbGxlZCB3aXRob3V0
IHVzZXIgZGFlbW9uIGNyYXNoaW5nLiBUaGVuIHRoZSByZXEgYmVpbmcKcHJvY2Vzc2VkIGJ5IHRo
ZSB1c2VyIGRhZW1vbiB3aWxsIGJlIHJlc2V0IHRvIENBQ0hFRklMRVNfUkVRX05FVyBhbmQKY291
bGQgYmUgcmUtcmVhZCBhbmQgcHJvY2Vzc2VkIGJ5IHRoZSB1c2VyIGRhZW1vbi4KCkZvciBPUEVO
IHJlcTogIFRoZSB1c2VyIGRhZW1vbiB3aWxsIGlnbm9yZSB0aGlzIHJlcGVhdGVkIHJlcSBzaW5j
ZSB0aGUKcmVsYXRlZCBhbm9ueW1vdXMgZmQgaXMgdGhlIHNhbWUuCgpGb3IgUkVBRCByZXE6IFRo
ZSB1c2VyIGRhZW1vbiB3aWxsIHJlYWQgdGhlIHNhbWUgcGFydCBvZiB0aGUgZGF0YSBhZ2Fpbgph
bmQgd3JpdGUgaXQgdG8gZnNjYWNoZSAodGhpcyB3aWxsIG5vdCBjYXVzZSBhbnkgZXJyb3IpCgpG
b3IgQ0xPU0UgcmVxOiBBY3R1YWxseSB0aGUgdXNlciBkYWVtb24gd2lsbCBjbG9zZSB0aGlzIGFu
b255bW91cyBmZCwKYnV0IGZvcnR1bmF0ZWx5IFtQQVRDSCAzLzVdIGNvdWxkIGhhbmRsZSB0aGlz
IGNhc2UgYnkgcmVvcGVuaW5nIGl0CmF1dG9tYXRpY2FsbHkuCgpUaHVzICJyZXN0b3JlIiBjb3Vs
ZCBiZSBjYWxsZWQgYXQgYW55IHRpbWUgd2l0aG91dCBlcnJvciwgY2hlY2tzCm1pZ2h0IGludHJv
ZHVjZSBleHRyYSByYWNlIGNvbmRpdGlvbnMuCgpKaWEKPiAKCi0tCkxpbnV4LWNhY2hlZnMgbWFp
bGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnMK

