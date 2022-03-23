Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C9A4E518C
	for <lists+linux-cachefs@lfdr.de>; Wed, 23 Mar 2022 12:45:28 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-XKwrW7C9OQmY8d202LyMKQ-1; Wed, 23 Mar 2022 07:45:26 -0400
X-MC-Unique: XKwrW7C9OQmY8d202LyMKQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D787C811E81;
	Wed, 23 Mar 2022 11:45:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B64356D18A;
	Wed, 23 Mar 2022 11:45:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D578F194034D;
	Wed, 23 Mar 2022 11:45:22 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 923861940347 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 23 Mar 2022 11:45:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7ECE256D18C; Wed, 23 Mar 2022 11:45:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B38156D19A
 for <linux-cachefs@redhat.com>; Wed, 23 Mar 2022 11:45:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B03C833964
 for <linux-cachefs@redhat.com>; Wed, 23 Mar 2022 11:45:21 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-VDwh30VvPgWRaPvwWWn94w-1; Wed, 23 Mar 2022 07:45:17 -0400
X-MC-Unique: VDwh30VvPgWRaPvwWWn94w-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF2FEB81E86;
 Wed, 23 Mar 2022 11:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B4FC340E9;
 Wed, 23 Mar 2022 11:45:14 +0000 (UTC)
Date: Wed, 23 Mar 2022 12:45:11 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: =?utf-8?B?55Sw5a2Q5pmo?= <tianzichen@kuaishou.com>
Message-ID: <YjsIR886wCKosNNu@kroah.com>
References: <B6EA31D4-877C-450E-BF89-2879044B9EAD@kuaishou.com>
MIME-Version: 1.0
In-Reply-To: <B6EA31D4-877C-450E-BF89-2879044B9EAD@kuaishou.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
 "chao@kernel.org" <chao@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "joseph.qi@linux.alibaba.com" <joseph.qi@linux.alibaba.com>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 "luodaowen.backend@bytedance.com" <luodaowen.backend@bytedance.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "xiang@kernel.org" <xiang@kernel.org>,
 "gerry@linux.alibaba.com" <gerry@linux.alibaba.com>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBNYXIgMjMsIDIwMjIgYXQgMDg6Mzg6MDdBTSArMDAwMCwg55Sw5a2Q5pmoIHdyb3Rl
Ogo+IFRoaXMgc29sdXRpb24gbG9va3MgZ29vZCwgYW5kIHdl4oCZIHJlIGFsc28gaW50ZXJlc3Rl
ZCAgaW4gaXQgLCAgcGxlYXNlIGFjY2VsZXJhdGUgaXRzIHByb2dyZXNzIHNvIHdlIGNhbiB1c2Ug
aXQuCgpQbGVhc2UgdGVzdCB0aGUgcGF0Y2hlcyBhbmQgcHJvdmlkZSB5b3VyIGZlZWRiYWNrIG9u
IGl0IChpLmUuCiJSZXZpZXdlZC1ieToiIGFuZCB0aGUgbGlrZS4pCgp0aGFua3MsCgpncmVnIGst
aAoKLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKTGludXgtY2FjaGVmc0ByZWRoYXQuY29t
Cmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVm
cwo=

