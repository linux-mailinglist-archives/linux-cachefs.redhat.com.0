Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D16B14E6193
	for <lists+linux-cachefs@lfdr.de>; Thu, 24 Mar 2022 11:15:09 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-UBfJpW_MNoWu1DHPE3tJWw-1; Thu, 24 Mar 2022 06:15:06 -0400
X-MC-Unique: UBfJpW_MNoWu1DHPE3tJWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BB13899ECD;
	Thu, 24 Mar 2022 10:15:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F82E141DC5F;
	Thu, 24 Mar 2022 10:15:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EED6C1940356;
	Thu, 24 Mar 2022 10:15:03 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5D39C1949762 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 23 Mar 2022 08:55:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 25FFF403D1DD; Wed, 23 Mar 2022 08:55:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 211E6403D1D1
 for <linux-cachefs@redhat.com>; Wed, 23 Mar 2022 08:55:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C23323822234
 for <linux-cachefs@redhat.com>; Wed, 23 Mar 2022 08:55:10 +0000 (UTC)
Received: from bjfk-gateway01.kuaishou.com (smtpcn02.kuaishou.com
 [103.107.216.241]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-v8AVdW3sNQqlyAMpCXBkWQ-1; Wed, 23 Mar 2022 04:55:04 -0400
X-MC-Unique: v8AVdW3sNQqlyAMpCXBkWQ-1
Received: from bjfk-gateway01.kuaishou.com (localhost [127.0.0.2] (may be
 forged)) by bjfk-gateway01.kuaishou.com with ESMTP id 22N8ene5016084;
 Wed, 23 Mar 2022 16:40:49 +0800 (GMT-8)
 (envelope-from tianzichen@kuaishou.com)
Received: from bjfk-pm-mail30.kuaishou.com ([172.29.5.62])
 by bjfk-gateway01.kuaishou.com with ESMTPS id 22N8c83w014939
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Mar 2022 16:38:08 +0800 (GMT-8)
 (envelope-from tianzichen@kuaishou.com)
Received: from bjfk-pm-mail30.kuaishou.com (172.29.5.62) by
 bjfk-pm-mail30.kuaishou.com (172.29.5.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Wed, 23 Mar 2022 16:38:07 +0800
Received: from bjfk-pm-mail30.kuaishou.com ([fe80::2534:b256:58c3:b20]) by
 bjfk-pm-mail30.kuaishou.com ([fe80::2534:b256:58c3:b20%17]) with mapi id
 15.01.2176.014; Wed, 23 Mar 2022 16:38:07 +0800
From: =?utf-8?B?55Sw5a2Q5pmo?= <tianzichen@kuaishou.com>
To: "jefflexu@linux.alibaba.com" <jefflexu@linux.alibaba.com>
Thread-Topic: [PATCH v5 00/22] fscache, erofs: fscache-based on-demand read
 semantics
Thread-Index: AQHYPpFSpObg91d1C0qJ04JyRDD9Sw==
Date: Wed, 23 Mar 2022 08:38:07 +0000
Message-ID: <B6EA31D4-877C-450E-BF89-2879044B9EAD@kuaishou.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.20.112.31]
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: bjfk-gateway01.kuaishou.com 22N8ene5016084
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Thu, 24 Mar 2022 10:15:01 +0000
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [Linux-cachefs] [PATCH v5 00/22] fscache,
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
 "chao@kernel.org" <chao@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "joseph.qi@linux.alibaba.com" <joseph.qi@linux.alibaba.com>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "luodaowen.backend@bytedance.com" <luodaowen.backend@bytedance.com>,
 "xiang@kernel.org" <xiang@kernel.org>,
 "gerry@linux.alibaba.com" <gerry@linux.alibaba.com>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBzb2x1dGlvbiBsb29rcyBnb29kLCBhbmQgd2XigJkgcmUgYWxzbyBpbnRlcmVzdGVkICBp
biBpdCAsICBwbGVhc2UgYWNjZWxlcmF0ZSBpdHMgcHJvZ3Jlc3Mgc28gd2UgY2FuIHVzZSBpdC4N
Cg0KQmVzdCB3aXNoZXMsDQp6aWNoZW4NCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0Ckxp
bnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWNhY2hlZnMK

