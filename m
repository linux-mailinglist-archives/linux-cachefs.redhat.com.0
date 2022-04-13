Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2FC4FF751
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Apr 2022 15:01:38 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-NnARkZYaNVCE8XjwT-TZfw-1; Wed, 13 Apr 2022 09:01:35 -0400
X-MC-Unique: NnARkZYaNVCE8XjwT-TZfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCEB81F665A5;
	Wed, 13 Apr 2022 13:01:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 992487AEB;
	Wed, 13 Apr 2022 13:01:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C80CF194034F;
	Wed, 13 Apr 2022 13:01:30 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 95FEF1940340 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 13 Apr 2022 12:58:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4EFA21457F42; Wed, 13 Apr 2022 12:58:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AA0C1454555
 for <linux-cachefs@redhat.com>; Wed, 13 Apr 2022 12:58:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF46D3C172CC
 for <linux-cachefs@redhat.com>; Wed, 13 Apr 2022 12:58:00 +0000 (UTC)
Received: from bjm7-spam01.kuaishou.com (smtpcn03.kuaishou.com
 [103.107.217.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-fqX2zb9EN6OQ7Uwggc327g-1; Wed, 13 Apr 2022 08:57:58 -0400
X-MC-Unique: fqX2zb9EN6OQ7Uwggc327g-1
Received: from bjm7-spam01.kuaishou.com (localhost [127.0.0.2] (may be forged))
 by bjm7-spam01.kuaishou.com with ESMTP id 23DCSImb089575
 for <linux-cachefs@redhat.com>; Wed, 13 Apr 2022 20:28:18 +0800 (GMT-8)
 (envelope-from tianzichen@kuaishou.com)
Received: from bjm7-pm-mail26.kuaishou.com ([172.28.1.62])
 by bjm7-spam01.kuaishou.com with ESMTPS id 23DCR75u089255
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 13 Apr 2022 20:27:07 +0800 (GMT-8)
 (envelope-from tianzichen@kuaishou.com)
Received: from bjfk-pm-mail30.kuaishou.com (172.29.5.62) by
 bjm7-pm-mail26.kuaishou.com (172.28.1.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Wed, 13 Apr 2022 20:27:07 +0800
Received: from bjfk-pm-mail30.kuaishou.com ([fe80::2534:b256:58c3:b20]) by
 bjfk-pm-mail30.kuaishou.com ([fe80::2534:b256:58c3:b20%17]) with mapi id
 15.01.2176.014; Wed, 13 Apr 2022 20:27:07 +0800
From: =?utf-8?B?55Sw5a2Q5pmo?= <tianzichen@kuaishou.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>, "jefflexu@linux.alibaba.com"
 <jefflexu@linux.alibaba.com>
Thread-Topic: [PATCH v8 00/20] fscache,erofs: fscache-based on-demand read
 semantics
Thread-Index: AQHYTzHKf6eBDuhir0CXwRoLEUpF1A==
Date: Wed, 13 Apr 2022 12:27:06 +0000
Message-ID: <B58D56BF-4456-4AD4-A25F-0C9779355DEA@kuaishou.com>
References: <20220406075612.60298-1-jefflexu@linux.alibaba.com>
 <YlLS47A9TpHyZJQi@B-P7TQMD6M-0146.local>
In-Reply-To: <YlLS47A9TpHyZJQi@B-P7TQMD6M-0146.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.20.112.61]
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: bjm7-spam01.kuaishou.com 23DCSImb089575
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH v8 00/20] fscache,
 erofs: fscache-based on-demand read semantics
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
 "fannaihao@baidu.com" <fannaihao@baidu.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "joseph.qi@linux.alibaba.com" <joseph.qi@linux.alibaba.com>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 "luodaowen.backend@bytedance.com" <luodaowen.backend@bytedance.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "gerry@linux.alibaba.com" <gerry@linux.alibaba.com>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: zh-CN
Content-ID: <F41F2052051878449E4DC01E52BCB8A1@kuaishou.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gMjAyMuW5tDTmnIgxMOaXpSDkuIvljYg4OjUx77yMR2FvIFhpYW5nIDxoc2lhbmdrYW9A
bGludXguYWxpYmFiYS5jb20+IOWGmemBk++8mg0KPiANCj4gT24gV2VkLCBBcHIgMDYsIDIwMjIg
YXQgMDM6NTU6NTJQTSArMDgwMCwgSmVmZmxlIFh1IHdyb3RlOg0KPj4gY2hhbmdlcyBzaW5jZSB2
NzoNCj4+IC0gcmViYXNlZCB0byA1LjE4LXJjMQ0KPj4gLSBpbmNsdWRlICJjYWNoZWZpbGVzOiB1
bm1hcmsgaW5vZGUgaW4gdXNlIGluIGVycm9yIHBhdGgiIHBhdGNoIGludG8NCj4+ICB0aGlzIHBh
dGNoc2V0IHRvIGF2b2lkIHdhcm5pbmcgZnJvbSB0ZXN0IHJvYm90IChwYXRjaCAxKQ0KPj4gLSBj
YWNoZWZpbGVzOiByZW5hbWUgW2Nvb2tpZXx2b2x1bWVdX2tleV9sZW4gZmllbGQgb2Ygc3RydWN0
DQo+PiAgY2FjaGVmaWxlc19vcGVuIHRvIFtjb29raWV8dm9sdW1lXV9rZXlfc2l6ZSB0byBhdm9p
ZCBwb3RlbnRpYWwNCj4+ICBtaXN1bmRlcnN0YW5kaW5nLiBBbHNvIGFkZCBtb3JlIGRvY3VtZW50
YXRpb24gdG8NCj4+ICBpbmNsdWRlL3VhcGkvbGludXgvY2FjaGVmaWxlcy5oLiAocGF0Y2ggMykN
Cj4+IC0gY2FjaGVmaWxlczogdmFsaWQgY2hlY2sgZm9yIGVycm9yIGNvZGUgcmV0dXJuZWQgZnJv
bSB1c2VyIGRhZW1vbg0KPj4gIChwYXRjaCAzKQ0KPj4gLSBjYWNoZWZpbGVzOiBjaGFuZ2UgV0FS
Tl9PTl9PTkNFKCkgdG8gcHJfaW5mb19vbmNlKCkgd2hlbiB1c2VyIGRhZW1vbg0KPj4gIGNsb3Nl
cyBhbm9uX2ZkIHByZW1hdHVyZWx5IChwYXRjaCA0LzUpDQo+PiAtIHJlYWR5IGZvciBjb21wbGV0
ZSByZXZpZXcNCj4+IA0KPj4gDQo+PiBLZXJuZWwgUGF0Y2hzZXQNCj4+IC0tLS0tLS0tLS0tLS0t
LQ0KPj4gR2l0IHRyZWU6DQo+PiANCj4+ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9sb3N0amVmZmxl
L2xpbnV4LmdpdCBqaW5nYm8vZGV2LWVyb2ZzLWZzY2FjaGUtdjgNCj4+IA0KPj4gR2l0d2ViOg0K
Pj4gDQo+PiAgICBodHRwczovL2dpdGh1Yi5jb20vbG9zdGplZmZsZS9saW51eC9jb21taXRzL2pp
bmdiby9kZXYtZXJvZnMtZnNjYWNoZS12OA0KPj4gDQo+PiANCj4+IFVzZXIgRGFlbW9uIGZvciBR
dWljayBUZXN0DQo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4gR2l0IHRyZWU6DQo+
PiANCj4+ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9sb3N0amVmZmxlL2RlbWFuZC1yZWFkLWNhY2hl
ZmlsZXNkLmdpdCBtYWluDQo+PiANCj4+IEdpdHdlYjoNCj4+IA0KPj4gICAgaHR0cHM6Ly9naXRo
dWIuY29tL2xvc3RqZWZmbGUvZGVtYW5kLXJlYWQtY2FjaGVmaWxlc2QNCj4+IA0KPiANCj4gQnR3
LCB3ZSd2ZSBhbHNvIGZpbmlzaGVkIGEgcHJlbGltaW5hcnkgZW5kLXRvLWVuZCBvbi1kZW1hbmQg
ZG93bmxvYWQNCj4gZGFlbW9uIGluIG9yZGVyIHRvIHRlc3QgdGhlIGZzY2FjaGUgb24tZGVtYW5k
IGtlcm5lbCBjb2RlIGFzIGEgcmVhbA0KPiBlbmQtdG8tZW5kIHdvcmtsb2FkIGZvciBjb250YWlu
ZXIgdXNlIGNhc2VzOg0KPiANCj4gVXNlciBndWlkZTogaHR0cHM6Ly9naXRodWIuY29tL2RyYWdv
bmZseW9zcy9pbWFnZS1zZXJ2aWNlL2Jsb2IvZnNjYWNoZS9kb2NzL255ZHVzLWZzY2FjaGUubWQN
Cj4gVmlkZW86IGh0dHBzOi8veW91dHUuYmUvRjRJRjJfREVOWG8NCg0KVGVzdGVkLWJ5OiBaaWNo
ZW4gVGlhbiA8dGlhbnppY2hlbkBrdWFpc2hvdS5jb20+DQoNCj4gVGhhbmtzLA0KPiBHYW8gWGlh
bmcNCj4gDQoNCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVk
aGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWNhY2hlZnMK

