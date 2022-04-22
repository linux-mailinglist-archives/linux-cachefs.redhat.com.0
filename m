Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 002F350AE66
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Apr 2022 05:11:04 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-_zu19bpdPnyX-X2r5d2pYQ-1; Thu, 21 Apr 2022 23:11:01 -0400
X-MC-Unique: _zu19bpdPnyX-X2r5d2pYQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75436811E75;
	Fri, 22 Apr 2022 03:11:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F773C28133;
	Fri, 22 Apr 2022 03:11:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1CEC91940353;
	Fri, 22 Apr 2022 03:11:00 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 07176194034C for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 22 Apr 2022 03:10:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A0C98145BA60; Fri, 22 Apr 2022 03:10:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D284140EBD5
 for <linux-cachefs@redhat.com>; Fri, 22 Apr 2022 03:10:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 839E1802803
 for <linux-cachefs@redhat.com>; Fri, 22 Apr 2022 03:10:58 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-LzE5iXD2NEyWli1l7haCIg-1; Thu, 21 Apr 2022 23:10:55 -0400
X-MC-Unique: LzE5iXD2NEyWli1l7haCIg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0VAk49Jj_1650597028
Received: from 30.225.24.197(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VAk49Jj_1650597028) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 22 Apr 2022 11:10:30 +0800
Message-ID: <a15c3c93-3472-5bed-c8bb-4416bb809325@linux.alibaba.com>
Date: Fri, 22 Apr 2022 11:10:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: David Howells <dhowells@redhat.com>
References: <20220415123614.54024-9-jefflexu@linux.alibaba.com>
 <20220415123614.54024-1-jefflexu@linux.alibaba.com>
 <1447053.1650552451@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <1447053.1650552451@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH v9 08/21] cachefiles: document on-demand
 read mode
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
 tianzichen@kuaishou.com, joseph.qi@linux.alibaba.com,
 zhangjiachen.jaycee@bytedance.com, linux-cachefs@redhat.com,
 bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David, thanks for polishing the documents. It's a detailed and
meticulous review again. Really thanks for your time :) I will fix all
these in the next version.

On 4/21/22 10:47 PM, David Howells wrote:
> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> 
>> +The essential difference between these two modes is that, in original mode,
>> +when a cache miss occurs, the netfs will fetch the data from the remote server
>> +and then write it to the cache file.  With on-demand read mode, however,
>> +fetching the data and writing it into the cache is delegated to a user daemon.
> 
> The starting sentence seems off.  How about:
> 
>   The essential difference between these two modes is seen when a cache miss
>   occurs: In the original mode, the netfs will fetch the data from the remote
>   server and then write it to the cache file; in on-demand read mode, fetching
>   data and writing it into the cache is delegated to a user daemon.

Okay, it sounds better.

>> the devnode ('/dev/cachefiles') to check if
>> +there's a pending request to be processed.  A POLLIN event will be returned
>> +when there's a pending request.
>> +
>> +The user daemon then reads the devnode to fetch a request and process it
>> +accordingly.
> 
> Reading the devnode doesn't process the request, so I think something like:
> 
> "... and process it accordingly" -> "... that it can then process."
> 
> or:
> 
> "... and process it accordingly" -> "... to process."

Yeah the original statement is indeed misleading.


>> Each cache file has a unique object_id, while it
>> +may have multiple anonymous fds. The user daemon may duplicate anonymous fds
>> +from the initial anonymous fd indicated by the @fd field through dup(). Thus
>> +each object_id can be mapped to multiple anonymous fds, while the usr daemon
>> +itself needs to maintain the mapping.
>> +
>> +With the given anonymous fd, the user daemon can fetch data and write it to the
>> +cache file in the background, even when kernel has not triggered a cache miss
>> +yet.
>> +
>> +The user daemon should complete the READ request
> 
> READ request -> OPEN request?

Good catch. Will be fixed.


>> in the READ request.  The ioctl is of the form::
>> +
>> +	ioctl(fd, CACHEFILES_IOC_CREAD, msg_id);
>> +
>> +	* ``fd`` is one of the anonymous fds associated with the given object_id
>> +	  in the READ request.
> 
> the given object_id in the READ request -> object_id
> 
>> +
>> +	* ``msg_id`` must match the msg_id field of the previous READ request.
> 
> By "previous READ request" is this referring to something different to "the
> READ request" you mentioned against the fd parameter?

Actually it is referring to the same thing (the same READ request). I
will change the statement simply to:

``msg_id`` must match the msg_id field of the READ request.

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

