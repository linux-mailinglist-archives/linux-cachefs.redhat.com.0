Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4751A4FCD2B
	for <lists+linux-cachefs@lfdr.de>; Tue, 12 Apr 2022 05:36:09 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-hISC5tfAO_mTyBMQdhEP4g-1; Mon, 11 Apr 2022 23:36:05 -0400
X-MC-Unique: hISC5tfAO_mTyBMQdhEP4g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6BAA3C14846;
	Tue, 12 Apr 2022 03:36:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 937A84029A0;
	Tue, 12 Apr 2022 03:36:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E3FF1940366;
	Tue, 12 Apr 2022 03:36:04 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 641FF1947BBF for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 12 Apr 2022 03:36:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 14A6041639E; Tue, 12 Apr 2022 03:36:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10DA040ED53
 for <linux-cachefs@redhat.com>; Tue, 12 Apr 2022 03:36:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D91A21C06900
 for <linux-cachefs@redhat.com>; Tue, 12 Apr 2022 03:36:02 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-C0edl9VNOIinmnyL1oUOnA-1; Mon, 11 Apr 2022 23:36:01 -0400
X-MC-Unique: C0edl9VNOIinmnyL1oUOnA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V9sqOTP_1649734551
Received: from 30.225.24.141(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V9sqOTP_1649734551) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 12 Apr 2022 11:35:53 +0800
Message-ID: <a20ca50f-1d1a-d09e-75da-f6ced65f6c93@linux.alibaba.com>
Date: Tue, 12 Apr 2022 11:35:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: David Howells <dhowells@redhat.com>
References: <542f749c-b0f1-1de6-cb41-26e296afb2df@linux.alibaba.com>
 <20220406075612.60298-5-jefflexu@linux.alibaba.com>
 <20220406075612.60298-1-jefflexu@linux.alibaba.com>
 <1091405.1649680508@warthog.procyon.org.uk>
 <1094493.1649684554@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <1094493.1649684554@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH v8 04/20] cachefiles: notify user daemon
 when withdrawing cookie
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
Cc: linux-erofs@lists.ozlabs.org, chao@kernel.org, fannaihao@baidu.com,
 tao.peng@linux.alibaba.com, willy@infradead.org, linux-kernel@vger.kernel.org,
 tianzichen@kuaishou.com, joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
 bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 4/11/22 9:42 PM, David Howells wrote:
> JeffleXu <jefflexu@linux.alibaba.com> wrote:
> 
>>>
>>>> +	if (fd == 0)
>>>> +		return -ENOENT;
>>>
>>> 0 is a valid fd.
>>
>> Yeah, but IMHO fd 0 is always for stdin? I think the allocated anon_fd
>> won't install at fd 0. Please correct me if I'm wrong.
> 
> If someone has closed 0, then you'll get 0 next, I'm pretty sure.  Try it and
> see.

Good catch.

> 
>> In fact I wanna use "fd == 0" as the initial state as struct
>> cachefiles_object is allocated with kmem_cache_zalloc().
> 
> I would suggest presetting it to something like -2 to avoid confusion.

Okay, as described in the previous email, I'm going to replace @fd to
@object_id. I will define some symbols to make it more readable,
something like

```
struct cachefiles_object {
	...
#ifdef CONFIG_CACHEFILES_ONDEMAND
#define CACHEFILES_OBJECT_ID_DEFAULT -2
#define CACHEFILES_OBJECT_ID_DEAD    -1
	int object_id;
#endif
	...
}
```

Thanks for your time.

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

