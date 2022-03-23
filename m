Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FFF4E4C51
	for <lists+linux-cachefs@lfdr.de>; Wed, 23 Mar 2022 06:33:24 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-_8sH_-yFPW-1apDq-BcutQ-1; Wed, 23 Mar 2022 01:33:20 -0400
X-MC-Unique: _8sH_-yFPW-1apDq-BcutQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BA8D1C05EC3;
	Wed, 23 Mar 2022 05:33:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D38F2026D60;
	Wed, 23 Mar 2022 05:33:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A40AF1940349;
	Wed, 23 Mar 2022 05:33:16 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7A34F1949762 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 23 Mar 2022 05:33:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4FCC82166B47; Wed, 23 Mar 2022 05:33:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B70E2166B2D
 for <linux-cachefs@redhat.com>; Wed, 23 Mar 2022 05:33:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59B813804506
 for <linux-cachefs@redhat.com>; Wed, 23 Mar 2022 05:33:07 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-ClbGJbYpPTmrQb51C3UPlw-1; Wed, 23 Mar 2022 01:33:03 -0400
X-MC-Unique: ClbGJbYpPTmrQb51C3UPlw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=16; SR=0; TI=SMTPD_---0V7zuNYS_1648013577
Received: from 30.225.24.115(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V7zuNYS_1648013577) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 23 Mar 2022 13:32:58 +0800
Message-ID: <8f93abf9-2c3e-51cd-9afa-ee2b68e61a4b@linux.alibaba.com>
Date: Wed, 23 Mar 2022 13:32:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: Matthew Wilcox <willy@infradead.org>, David Howells <dhowells@redhat.com>
References: <YjiX5oXYkmN6WrA3@casper.infradead.org>
 <20220316131723.111553-1-jefflexu@linux.alibaba.com>
 <20220316131723.111553-4-jefflexu@linux.alibaba.com>
 <YjiAVezd5B9auhcP@casper.infradead.org>
 <6bc551d2-15fc-5d17-c99b-8db588c6b671@linux.alibaba.com>
 <YjiLACenpRV4XTcs@casper.infradead.org>
 <adb957da-8909-06d8-1b2c-b8a293b37930@linux.alibaba.com>
 <1035025.1647876652@warthog.procyon.org.uk>
 <YjoBpm8mUHX/w/rK@casper.infradead.org>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <YjoBpm8mUHX/w/rK@casper.infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH v5 03/22] cachefiles: introduce
 on-demand read mode
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
Cc: linux-erofs@lists.ozlabs.org, chao@kernel.org, tao.peng@linux.alibaba.com,
 linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 3/23/22 1:04 AM, Matthew Wilcox wrote:
> On Mon, Mar 21, 2022 at 03:30:52PM +0000, David Howells wrote:
>> Matthew Wilcox <willy@infradead.org> wrote:
>>
>>> Absolutely; just use xa_lock() to protect both setting & testing the
>>> flag.
>>
>> How should Jeffle deal with xarray dropping the lock internally in order to do
>> an allocation and then taking it again (actually in patch 5)?
> 
> There are a number of ways to handle this.  I'll outline two; others
> are surely possible.

Thanks.


> 
> option 1:
> 
> add side:
> 
> xa_lock();
> if (!DEAD)
> 	xa_store(GFP_KERNEL);
> 	if (DEAD)
> 		xa_erase();
> xa_unlock();
> 
> destroy side:
> 
> xa_lock();
> set DEAD;
> xa_for_each()
> 	xa_erase();
> xa_unlock();
> 
> That has the problem (?) that it might be temporarily possible to see
> a newly-added entry in a DEAD array.

I think this problem doesn't matter in our scenario.


> 
> If that is a problem, you can use xa_reserve() on the add side, followed
> by overwriting it or removing it, depending on the state of the DEAD flag.

Right. Then even the normal path (when memory allocation succeeds) needs
to call xa_reserve() once.


> 
> If you really want to, you can decompose the add side so that you always
> check the DEAD flag before doing the store, ie:
> 
> do {
> 	xas_lock();
> 	if (DEAD)
> 		xas_set_error(-EINVAL);
> 	else
> 		xas_store();
> 	xas_unlock();
> } while (xas_nomem(GFP_KERNEL));

This way is more cleaner from the locking semantics, with the cost of
code duplication. However, after decomposing the __xa_alloc(), we can
also reuse the xas when setting CACHEFILES_REQ_NEW mark.

```
+	xa_lock(xa);
+	ret = __xa_alloc(xa, &id, req, xa_limit_32b, GFP_KERNEL);
+	if (!ret)
+		__xa_set_mark(xa, id, CACHEFILES_REQ_NEW);
+	xa_unlock(xa);
```

So far personally I prefer the decomposing way in our scenario.


-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

