Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFDF4E2BC1
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Mar 2022 16:18:23 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-Gyj7DJatP8isX8GYYkGqsA-1; Mon, 21 Mar 2022 11:18:19 -0400
X-MC-Unique: Gyj7DJatP8isX8GYYkGqsA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93BE2381AA06;
	Mon, 21 Mar 2022 15:18:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E87F02166B2D;
	Mon, 21 Mar 2022 15:18:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 501891947BBE;
	Mon, 21 Mar 2022 15:18:15 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4B3D819451ED for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 21 Mar 2022 15:18:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 280F840CF8FB; Mon, 21 Mar 2022 15:18:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2411B40CF8FA
 for <linux-cachefs@redhat.com>; Mon, 21 Mar 2022 15:18:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B6331010366
 for <linux-cachefs@redhat.com>; Mon, 21 Mar 2022 15:18:14 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-COojwGKwMnqyDHhhqcBRGA-1; Mon, 21 Mar 2022 11:18:11 -0400
X-MC-Unique: COojwGKwMnqyDHhhqcBRGA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=16; SR=0; TI=SMTPD_---0V7rdzHQ_1647875885
Received: from 192.168.31.65(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V7rdzHQ_1647875885) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 21 Mar 2022 23:18:06 +0800
Message-ID: <adb957da-8909-06d8-1b2c-b8a293b37930@linux.alibaba.com>
Date: Mon, 21 Mar 2022 23:18:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: Matthew Wilcox <willy@infradead.org>
References: <20220316131723.111553-1-jefflexu@linux.alibaba.com>
 <20220316131723.111553-4-jefflexu@linux.alibaba.com>
 <YjiAVezd5B9auhcP@casper.infradead.org>
 <6bc551d2-15fc-5d17-c99b-8db588c6b671@linux.alibaba.com>
 <YjiLACenpRV4XTcs@casper.infradead.org>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <YjiLACenpRV4XTcs@casper.infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 3/21/22 10:26 PM, Matthew Wilcox wrote:
> On Mon, Mar 21, 2022 at 10:08:47PM +0800, JeffleXu wrote:
>> reqs_lock is also used to protect the check of cache->flags. Please
>> refer to patch 4 [1] of this patchset.
> 
> Yes, that's exactly what I meant by "bad idea".
> 
>> ```
>> +	/*
>> +	 * Enqueue the pending request.
>> +	 *
>> +	 * Stop enqueuing the request when daemon is dying. So we need to
>> +	 * 1) check cache state, and 2) enqueue request if cache is alive.
>> +	 *
>> +	 * The above two ops need to be atomic as a whole. @reqs_lock is used
>> +	 * here to ensure that. Otherwise, request may be enqueued after xarray
>> +	 * has been flushed, in which case the orphan request will never be
>> +	 * completed and thus netfs will hang there forever.
>> +	 */
>> +	read_lock(&cache->reqs_lock);
>> +
>> +	/* recheck dead state under lock */
>> +	if (test_bit(CACHEFILES_DEAD, &cache->flags)) {
>> +		read_unlock(&cache->reqs_lock);
>> +		ret = -EIO;
>> +		goto out;
>> +	}
> 
> So this is an error path.  We're almost always going to take the xa_lock
> immediately after taking the read_lock.  In other words, you've done two
> atomic operations instead of one.

Right.

> 
>> +	xa_lock(xa);
>> +	ret = __xa_alloc(xa, &id, req, xa_limit_32b, GFP_KERNEL);
>> +	if (!ret)
>> +		__xa_set_mark(xa, id, CACHEFILES_REQ_NEW);
>> +	xa_unlock(xa);
>> +
>> +	read_unlock(&cache->reqs_lock);
>> ```
>>
>> It's mainly used to protect against the xarray flush.
>>
>> Besides, IMHO read-write lock shall be more performance friendly, since
>> most cases are the read side.
> 
> That's almost never true.  rwlocks are usually a bad idea because you
> still have to bounce the cacheline, so you replace lock contention
> (which you can see) with cacheline contention (which is harder to
> measure).  And then you have questions about reader/writer fairness
> (should new readers queue behind a writer if there's one waiting, or
> should a steady stream of readers be able to hold a writer off
> indefinitely?)

Interesting, I didn't notice it before. Thanks for explaining it.


BTW what I want is just

```
PROCESS 1		PROCESS 2
=========		=========
#lock			#lock
set DEAD state		if (not DEAD)
flush xarray		   enqueue into xarray
#unlock			#unlock
```

I think it is a generic paradigm. So it seems that the spinlock inside
xarray is already adequate for this job?

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

