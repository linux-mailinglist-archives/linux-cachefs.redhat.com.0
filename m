Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 938295FC881
	for <lists+linux-cachefs@lfdr.de>; Wed, 12 Oct 2022 17:37:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665589074;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7aH9g+84MtHdKQodWcm7lxKSfAYkIpG2ucnzeYfdn+g=;
	b=IhXN1xIgil8dyI9Z3rrjtMke0dw1AAyR+xS3EsgQYU3jMaL/kypAw336DWf+MA1tH+IPmV
	avX7/Cbc8x+wSM8sBsF0dGBvjeOXtvNTodcWVfXf3OOqaeVenWrdnXZ/NmS2RINv4DTFP/
	4jEOT/WJyCQWmwHYfE/sltkrOSkcUrw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-LPMegrNkOVugFmV_T0r03Q-1; Wed, 12 Oct 2022 11:37:51 -0400
X-MC-Unique: LPMegrNkOVugFmV_T0r03Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAC3080280D;
	Wed, 12 Oct 2022 15:37:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98914492B05;
	Wed, 12 Oct 2022 15:37:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1E4211946594;
	Wed, 12 Oct 2022 15:37:49 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 078FD1946588 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 12 Oct 2022 15:37:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EC88D414A809; Wed, 12 Oct 2022 15:37:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E512F414A818
 for <linux-cachefs@redhat.com>; Wed, 12 Oct 2022 15:37:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57918185A792
 for <linux-cachefs@redhat.com>; Wed, 12 Oct 2022 15:37:47 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-179-poOo3nTeNqinfL83UM8N6w-1; Wed, 12 Oct 2022 11:37:38 -0400
X-MC-Unique: poOo3nTeNqinfL83UM8N6w-1
Received: by mail-pj1-f50.google.com with SMTP id
 t12-20020a17090a3b4c00b0020b04251529so2404741pjf.5
 for <linux-cachefs@redhat.com>; Wed, 12 Oct 2022 08:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=S2jK+cfoyd0vz00QrrKo8s95SUmryHgC+6RpgzWjESk=;
 b=6lcfhvwNHgZZe+QhfqW46ZsSHFj+ItMVGCoaajInWKXq8hszWjfA31hwslZJxz+oe5
 wRANVfvfvbtv7nZKdWI6iq9+VXDPL65YEdn2ZyFc+7IYuWhz12anXTAZIi/f7hD9UaGm
 XhBALYr8smjP7VkTFI9pma6KrfK56Zl+VxTUzr7IWLeTMLiYTFwGcGP4Yh4e5wlwAToK
 PdjqAq56TepqadIcRK7fmTxj6slvQiff5/T9UUXgWm8EGkr19AAbRy4kQ5OoEfHQK7xQ
 W9FrfpyyPe0dI4rLYD/X8+pLLK2ip+ipX1ZDzg0BHhyKiykof5MnZXHdZZQGdyQcmcjL
 eRcA==
X-Gm-Message-State: ACrzQf3tp79IB35en+gWmOJNBn4K7aSKpamJ2/7vVcVR02U+1GKqVoLU
 2995N6WpqrbYqhrB/wEupoB1UQ==
X-Google-Smtp-Source: AMsMyM6zMT5rB8y6CsFFXm1ViiLl06XxlM+uWUoIAm5MYoVEUa8Qy5VJ+MIob9kOJV5FH5dzgSaigA==
X-Received: by 2002:a17:903:2411:b0:184:7159:dce6 with SMTP id
 e17-20020a170903241100b001847159dce6mr4224709plo.101.1665589057095; 
 Wed, 12 Oct 2022 08:37:37 -0700 (PDT)
Received: from [10.3.156.122] ([63.216.146.190])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a17090a650b00b0020a821e97fbsm1664306pjj.13.2022.10.12.08.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 08:37:36 -0700 (PDT)
Message-ID: <c6f5d729-2083-817d-fe7d-b01bce27e39f@bytedance.com>
Date: Wed, 12 Oct 2022 23:37:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
To: JeffleXu <jefflexu@linux.alibaba.com>, dhowells@redhat.com,
 xiang@kernel.org
References: <20221011131552.23833-1-zhujia.zj@bytedance.com>
 <20221011131552.23833-4-zhujia.zj@bytedance.com>
 <28d64f00-e408-9fc2-9506-63c1d8b08b9c@linux.alibaba.com>
From: Jia Zhu <zhujia.zj@bytedance.com>
In-Reply-To: <28d64f00-e408-9fc2-9506-63c1d8b08b9c@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Linux-cachefs] [External] Re: [PATCH 3/5] cachefiles: resend
 an open request if the read request's object is closed
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

CgrlnKggMjAyMi8xMC8xMiAxNTo1MywgSmVmZmxlWHUg5YaZ6YGTOgo+IAo+IAo+IE9uIDEwLzEx
LzIyIDk6MTUgUE0sIEppYSBaaHUgd3JvdGU6Cj4+IEBAIC0yNTQsMTIgKzI4MiwxOCBAQCBzc2l6
ZV90IGNhY2hlZmlsZXNfb25kZW1hbmRfZGFlbW9uX3JlYWQoc3RydWN0IGNhY2hlZmlsZXNfY2Fj
aGUgKmNhY2hlLAo+PiAgIAkgKiByZXF1ZXN0IGRpc3RyaWJ1dGlvbiBmYWlyLgo+PiAgIAkgKi8K
Pj4gICAJeGFfbG9jaygmY2FjaGUtPnJlcXMpOwo+PiAtCXJlcSA9IHhhc19maW5kX21hcmtlZCgm
eGFzLCBVSU5UX01BWCwgQ0FDSEVGSUxFU19SRVFfTkVXKTsKPj4gLQlpZiAoIXJlcSAmJiBjYWNo
ZS0+cmVxX2lkX25leHQgPiAwKSB7Cj4+IC0JCXhhc19zZXQoJnhhcywgMCk7Cj4+IC0JCXJlcSA9
IHhhc19maW5kX21hcmtlZCgmeGFzLCBjYWNoZS0+cmVxX2lkX25leHQgLSAxLCBDQUNIRUZJTEVT
X1JFUV9ORVcpOwo+PiArcmV0cnk6Cj4+ICsJeGFzX2Zvcl9lYWNoX21hcmtlZCgmeGFzLCByZXEs
IHhhX21heCwgQ0FDSEVGSUxFU19SRVFfTkVXKSB7Cj4+ICsJCWlmIChjYWNoZWZpbGVzX29uZGVt
YW5kX3NraXBfcmVxKHJlcSkpCj4+ICsJCQljb250aW51ZTsKPj4gKwkJYnJlYWs7Cj4+ICAgCX0K
Pj4gICAJaWYgKCFyZXEpIHsKPj4gKwkJaWYgKGNhY2hlLT5yZXFfaWRfbmV4dCA+IDAgJiYgeGFf
bWF4ID09IFVMT05HX01BWCkgewo+PiArCQkJeGFzX3NldCgmeGFzLCAwKTsKPj4gKwkJCXhhX21h
eCA9IGNhY2hlLT5yZXFfaWRfbmV4dCAtIDE7Cj4+ICsJCQlnb3RvIHJldHJ5Owo+PiArCQl9Cj4g
Cj4gSSB3b3VsZCBzdWdnZXN0IGFic3RyYWN0aW5nIHRoZSAieGFzX2Zvcl9lYWNoX21hcmtlZCgu
Li4sCj4gQ0FDSEVGSUxFU19SRVFfTkVXKSIgcGFydCBpbnRvIGEgaGVscGVyIGZ1bmN0aW9uIHRv
IGF2b2lkIHRoZSAiZ290byByZXRyeSIuCj4gCkhpIEppbmdCbywKClRoYW5rcyBmb3IgeW91ciBh
ZHZpY2UuIEFyZSB0aGUgZm9sbG93aW5nIHJldmlzZXMgYXBwcm9wcmlhdGXvvJ8KCnN0YXRpYyBz
dHJ1Y3QgY2FjaGVmaWxlc19yZXEgKmNhY2hlZmlsZXNfb25kZW1hbmRfc2VsZWN0X3JlcShzdHJ1
Y3QgCnhhX3N0YXRlICp4YXMsIHVuc2lnbmVkIGxvbmcgeGFfbWF4KQp7CiAgICAgc3RydWN0IGNh
Y2hlZmlsZXNfcmVxICpyZXE7CiAgICAgc3RydWN0IGNhY2hlZmlsZXNfb25kZW1hbmRfaW5mbyAq
aW5mbzsKCiAgICAgeGFzX2Zvcl9lYWNoX21hcmtlZCh4YXMsIHJlcSwgeGFfbWF4LCBDQUNIRUZJ
TEVTX1JFUV9ORVcpIHsKICAgICAgICAgaWYgKCFyZXEgfHwgcmVxLT5tc2cub3Bjb2RlICE9IENB
Q0hFRklMRVNfT1BfUkVBRCkKICAgICAgICAgICAgIHJldHVybiByZXE7CiAgICAgICAgIGluZm8g
PSByZXEtPm9iamVjdC0+cHJpdmF0ZTsKICAgICAgICAgaWYgKGluZm8tPnN0YXRlID09IENBQ0hF
RklMRVNfT05ERU1BTkRfT0JKU1RBVEVfY2xvc2UpIHsKICAgICAgICAgICAgIGNhY2hlZmlsZXNf
b25kZW1hbmRfc2V0X29iamVjdF9yZW9wZW5pbmcocmVxLT5vYmplY3QpOwogICAgICAgICAgICAg
cXVldWVfd29yayhmc2NhY2hlX3dxLCAmaW5mby0+d29yayk7CiAgICAgICAgICAgICBjb250aW51
ZTsKICAgICAgICAgfSBlbHNlIGlmIChpbmZvLT5zdGF0ZSA9PSBDQUNIRUZJTEVTX09OREVNQU5E
X09CSlNUQVRFX3Jlb3BlbmluZykgewogICAgICAgICAgICAgY29udGludWU7CiAgICAgICAgIH0K
ICAgICAgICAgcmV0dXJuIHJlcTsKICAgICB9CiAgICAgcmV0dXJuIE5VTEw7Cn0KCi4uLgoKICB4
YV9sb2NrKCZjYWNoZS0+cmVxcyk7CiAgICAgcmVxID0gY2FjaGVmaWxlc19vbmRlbWFuZF9zZWxl
Y3RfcmVxKCZ4YXMsIFVMT05HX01BWCk7CiAgICAgaWYgKCFyZXEgJiYgY2FjaGUtPnJlcV9pZF9u
ZXh0ID4gMCkgewogICAgICAgICB4YXNfc2V0KCZ4YXMsIDApOwogICAgICAgICByZXEgPSBjYWNo
ZWZpbGVzX29uZGVtYW5kX3NlbGVjdF9yZXEoJnhhcywgY2FjaGUtPnJlcV9pZF9uZXh0IC0gMSk7
CiAgICAgfQogICAgIGlmICghcmVxKSB7CiAgICAgICAgIHhhX3VubG9jaygmY2FjaGUtPnJlcXMp
OwogICAgICAgICByZXR1cm4gMDsKICAgICB9Cj4gCj4+IEBAIC0zOTIsOCArNDM0LDE2IEBAIHN0
YXRpYyBpbnQgY2FjaGVmaWxlc19vbmRlbWFuZF9zZW5kX3JlcShzdHJ1Y3QgY2FjaGVmaWxlc19v
YmplY3QgKm9iamVjdCwKPj4gICAJd2FrZV91cF9hbGwoJmNhY2hlLT5kYWVtb25fcG9sbHdxKTsK
Pj4gICAJd2FpdF9mb3JfY29tcGxldGlvbigmcmVxLT5kb25lKTsKPj4gICAJcmV0ID0gcmVxLT5l
cnJvcjsKPj4gKwlrZnJlZShyZXEpOwo+PiArCXJldHVybiByZXQ7Cj4+ICAgb3V0Ogo+PiAgIAlr
ZnJlZShyZXEpOwo+PiArCS8qIFJlc2V0IHRoZSBvYmplY3QgdG8gY2xvc2Ugc3RhdGUgaW4gZXJy
b3IgaGFuZGxpbmcgcGF0aC4KPj4gKwkgKiBJZiBlcnJvciBvY2N1cnMgYWZ0ZXIgY3JlYXRpbmcg
dGhlIGFub255bW91cyBmZCwKPj4gKwkgKiBjYWNoZWZpbGVzX29uZGVtYW5kX2ZkX3JlbGVhc2Uo
KSB3aWxsIHNldCBvYmplY3QgdG8gY2xvc2UuCj4+ICsJICovCj4+ICsJaWYgKG9wY29kZSA9PSBD
QUNIRUZJTEVTX09QX09QRU4pCj4+ICsJCWNhY2hlZmlsZXNfb25kZW1hbmRfc2V0X29iamVjdF9j
bG9zZShyZXEtPm9iamVjdCk7Cj4gCj4gVGhpcyBtYXkgY2F1c2UgdXNlLWFmdGVyLWZyZWUgc2lu
Y2UgQHJlcSBoYXMgYmVlbiBmcmVlZC4KVGhhbmtzIGZvciBjYXRjaGluZyB0aGlzLCBJJ2xsIGZp
eCBpdCBpbiBuZXh0IHZlcnNpb24uCj4gCj4gCj4gCgotLQpMaW51eC1jYWNoZWZzIG1haWxpbmcg
bGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZzCg==

