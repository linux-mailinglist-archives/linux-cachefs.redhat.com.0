Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B72C6CD8A9
	for <lists+linux-cachefs@lfdr.de>; Wed, 29 Mar 2023 13:43:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680090198;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aY3/6EGrxt7K6i1jBxX5kO4vZY6KUmAISWsW0dzTnkw=;
	b=gj8u26YkpeCkNk4ZB15nXHxG5ijyG1GaPmQpHSVUh/jQT1+Tyffll+65WYn24YyjVgiD5y
	xkQF3NM3dIV+DK38wLb+fsOLv3aVuuraibALpkm3hus3d3k5xS+q88ghSpahuJLn6oBz5Q
	oY0C6nC2yTDuSko/w8c9sr/quaK1cvw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-pJk0epiSOJqRTcEtzXHBSQ-1; Wed, 29 Mar 2023 07:43:17 -0400
X-MC-Unique: pJk0epiSOJqRTcEtzXHBSQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D362D3823A04;
	Wed, 29 Mar 2023 11:43:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 566A04042AC0;
	Wed, 29 Mar 2023 11:43:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E9BFB19465B6;
	Wed, 29 Mar 2023 11:43:08 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 86135194658C for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 11:42:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7995F440D7; Wed, 29 Mar 2023 11:42:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 720E6FD6E
 for <linux-cachefs@redhat.com>; Wed, 29 Mar 2023 11:42:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 522F33823A07
 for <linux-cachefs@redhat.com>; Wed, 29 Mar 2023 11:42:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-U3YcummdOmajtr63ItpfGQ-1; Wed, 29 Mar 2023 07:42:53 -0400
X-MC-Unique: U3YcummdOmajtr63ItpfGQ-1
Received: by mail-pl1-f177.google.com with SMTP id o2so14626887plg.4
 for <linux-cachefs@redhat.com>; Wed, 29 Mar 2023 04:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680090172;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9rtdQyV0q9oVWf7iT9zqh6jDfdmbrVZm1KuGQCRjagw=;
 b=YeZAVUz36a/sMLH3NWf6FZe1enyfGn+cdxGY7lywWHUmpux+7ZA7/8mkWzIJwRU0ox
 iMJyPKdortNsjoRBHCRPU4e33ucMCP8oYwlaU3Y9HUXLl8LEFJqvnrrN4dK2ZgMu248E
 dXC7IiNSs7dJQc9BcV5yVFXTxKZ99B6+OBdHpGh7oSaK9MEvXa65Foj2DgUer66vKTA0
 dS7l2j4ZwlmVnFYfycbDn9kYobOxC6f/zj1M3YaedVTeFbIiuklqzdlFtnIttOKFbQV0
 7jjXtFX8ipSzjAAcuuFI2PW9cNQbkm/M3Qc2TwX9Ih5OgZCimmJucwaWL6n/YcavVpkV
 gacQ==
X-Gm-Message-State: AAQBX9fWDrwKR7mU4kratxb2f1Dc2Vsq1JHFNvdj0OoKI4Hjr5msvVxE
 6ku1f4jS3Znk38PWvo6TGPcLsFXUahJAF28oWVI=
X-Google-Smtp-Source: AKy350bTawRigOCFkONs1BjCoXDEMU4q+k6uUeg9qWpwX1yJ/AP30l3jQUkeDQFYYF1rceOFjP5Dqg==
X-Received: by 2002:a17:903:28c8:b0:1a2:19c1:a974 with SMTP id
 kv8-20020a17090328c800b001a219c1a974mr14861215plb.68.1680090172616; 
 Wed, 29 Mar 2023 04:42:52 -0700 (PDT)
Received: from [10.3.144.50] ([61.213.176.11])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a1709026b8800b0019ab151eb90sm5144283plk.139.2023.03.29.04.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 04:42:52 -0700 (PDT)
Message-ID: <029453d7-1b2d-3d3c-cd8e-64f5be4420bf@bytedance.com>
Date: Wed, 29 Mar 2023 19:42:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: David Howells <dhowells@redhat.com>
References: <20230111052515.53941-4-zhujia.zj@bytedance.com>
 <20230111052515.53941-1-zhujia.zj@bytedance.com>
 <132777.1680012744@warthog.procyon.org.uk>
From: Jia Zhu <zhujia.zj@bytedance.com>
In-Reply-To: <132777.1680012744@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH V4 3/5] cachefiles: resend an open
 request if the read request's object is closed
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

CgrlnKggMjAyMy8zLzI4IDIyOjEyLCBEYXZpZCBIb3dlbGxzIOWGmemBkzoKPiBKaWEgWmh1IDx6
aHVqaWEuempAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gCj4+ICsJc3RydWN0IGNhY2hlZmlsZXNf
b2JqZWN0ICpvYmplY3QgPQo+PiArCQkoKHN0cnVjdCBjYWNoZWZpbGVzX29uZGVtYW5kX2luZm8g
Kil3b3JrKS0+b2JqZWN0Owo+IAo+IGNvbnRhaW5lcl9vZigpLgpUaGFua3MsIHdpbGwgcmV2aXNl
IGl0Lgo+IAo+PiArCQkJY29udGludWU7Cj4+ICsJCX0gZWxzZSBpZiAoY2FjaGVmaWxlc19vbmRl
bWFuZF9vYmplY3RfaXNfcmVvcGVuaW5nKG9iamVjdCkpIHsKPiAKPiBUaGUgImVsc2UiIGlzIHVu
bmVjZXNzYXJ5LgpXaWxsIHJlbW92ZSBpdC4KPiAKPj4gK3N0YXRpYyB2b2lkIG9uZGVtYW5kX29i
amVjdF93b3JrZXIoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+PiArewo+PiArCXN0cnVjdCBj
YWNoZWZpbGVzX29iamVjdCAqb2JqZWN0ID0KPj4gKwkJKChzdHJ1Y3QgY2FjaGVmaWxlc19vbmRl
bWFuZF9pbmZvICopd29yayktPm9iamVjdDsKPj4gKwo+PiArCWNhY2hlZmlsZXNfb25kZW1hbmRf
aW5pdF9vYmplY3Qob2JqZWN0KTsKPj4gK30KPiAKPiBJIGNhbid0IGhlbHAgYnV0IGZlZWwgdGhl
cmUncyBzb21lIG1pc3NpbmcgZXhjbHVzaW9uL2xvY2tpbmcuICAKCkl0J3MgaW5kZWVkIGtpbmQg
b2YgY29tcGxpY2F0ZWQgaGVyZSBzaW5jZSB0aGUgYXN5bmMgb3BlcmF0aW9uLgpUaHVzIHdlIHBh
aWQgbXVjaCBhdHRlbnRpb24gdG8gY2F0Y2hpbmcgdGhlIHJhY2Ugc2NlbmFyaW9zIGR1cmluZyBj
b2RpbmcKYW5kIHJldmlld2luZy4KCkhlcmUgYXJlIHNldmVyYWwgY29ybmVyIGNhc2UgaGF2ZSBi
ZWVuIGNvbnNpZGVyZWQ6CgoxLiBEb24ndCByZXBlYXRlZGx5IHB1c2ggdGhlIEB3b3JrIG9mIHNh
bWUgb2JqZWN0IGludG8gd29ya3F1ZXVlOgpVc2UgPHJlb3BlbmluZz4gc3RhdGUgdG8gcmVwcmVz
ZW50IHRoaXMgb2JqZWN0LiBPbmNlIHRoZSBvYmplY3QgaXMKc2V0IHRvIDxyZW9wZW5pbmc+IGF0
b21pY2x5LCB3aGljaCBtZWFucyB0aGUgd29yayBoYXMgYmVlbiBwdXNoZWQgdG8Kd29ya3F1ZXVl
LiBBbmQgb3RoZXIgY29uY3VycmVudCB0aHJlYWRzIHdpbGwgbm90IHBpY2sgdGhlIDxyZW9wZW5p
bmc+Cm9iamVjdCB0byB3b3JrcXVldWUuCgoyLiBEb24ndCByZXBlYXRlZGx5IHNldCA8cmVvcGVu
aW5nPiBzdGF0ZSBmb3IgdGhlIHNhbWUgb2JqZWN0OgpIb2xkIHRoZSB4YV9sb2NrIGR1cmluZyBz
ZWFyY2hpbmcgcmVxcyBhbmQgc2V0dGluZyBpdCB0byA8cmVvcGVuaW5nPi4KT25jZSBvYmplY3Qg
aXMgc2V0IHRvIDxyZW9wZW5pbmc+LCB0aGUgc2FtZSBvYmplY3Qgd2lsbCBiZSBza2lwcGVkLgoK
My4gZXRjLgoKV291bGQgeW91IG1pbmQgcHJvdmlkaW5nIG1vcmUgaGludHMgZm9yIHRoaXMgaXNz
dWU/Cgo+IFRoaXMgZmVlbHMgbGlrZQo+IGl0IHJlYWxseSBvdWdodCB0byBiZSBkcml2ZW4gZnJv
bSB0aGUgZnNjYWNoZSBvYmplY3Qgc3RhdGUgbWFjaGluZS4KCkl0J3MgYSBncmVhdCBpZGVhLiBC
dXQgdGhlIHByb2JsZW0gaXMgaWYgd2UgYWRkIGEgbmV3IHN0YXRlIHRvIGluZGljYXRlCnRoaXMg
cmVvcGVuaW5nIHN0YXR1cyBhbmQgdXNlIGZzY2FjaGUgc3RhdGUgbWFjaGluZSB0byBkcml2ZSB0
aGUgY29va2llCnRvIGRvIHJlb3BlbigpLCB0aHVzIHJlb3BlbigpIChpbiBmc2NhY2hlIG1vZHVs
ZSkgb3VnaHQgdG8gaW52b2tlCmNhY2hlZmlsZXNfb25kZW1hbmRfaW5pdF9vYmplY3QoKSAoaW4g
Y2FjaGVmaWxlIG1vZHVsZSkgdG8gcmVxdWlyZSB1c2VyCmRhZW1vbiB0byBvcGVuIHRoZSBiYWNr
ZW5kIGZpbGUuCkJ1dCBpdCBzZWVtcyB0aGF0IGZzY2FjaGUgbW9kdWxlIHNob3VsZCBub3QgZGVw
ZW5kIG9uIGNhY2hlZmlsZXMgbW9kdWxlLgo+IAoKLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxp
c3QKTGludXgtY2FjaGVmc0ByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVmcwo=

