Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 522BC50A31F
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Apr 2022 16:47:43 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-vFmf5LLpO1SipbW8YcQ7Rw-1; Thu, 21 Apr 2022 10:47:39 -0400
X-MC-Unique: vFmf5LLpO1SipbW8YcQ7Rw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBCDC952EA3;
	Thu, 21 Apr 2022 14:47:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD922DCC486;
	Thu, 21 Apr 2022 14:47:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 94BFF1940350;
	Thu, 21 Apr 2022 14:47:38 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2CA2B19451F0 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 21 Apr 2022 14:47:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2315ADCC486; Thu, 21 Apr 2022 14:47:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F69DDCC485
 for <linux-cachefs@redhat.com>; Thu, 21 Apr 2022 14:47:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04BFF86B8A4
 for <linux-cachefs@redhat.com>; Thu, 21 Apr 2022 14:47:38 +0000 (UTC)
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-75m9yQH8OIqePgFomf5Tig-1; Thu, 21 Apr 2022 10:47:33 -0400
X-MC-Unique: 75m9yQH8OIqePgFomf5Tig-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0VAfplXu_1650552445
Received: from 192.168.31.65(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VAfplXu_1650552445) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 21 Apr 2022 22:47:27 +0800
Message-ID: <62301f0e-8623-80ac-b351-a1b475a7004c@linux.alibaba.com>
Date: Thu, 21 Apr 2022 22:47:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: David Howells <dhowells@redhat.com>
References: <20220415123614.54024-3-jefflexu@linux.alibaba.com>
 <20220415123614.54024-1-jefflexu@linux.alibaba.com>
 <1444650.1650549423@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <1444650.1650549423@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH v9 02/21] cachefiles: notify user daemon
 when looking up cookie
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

Hi David,

Thanks for reviewing :)


On 4/21/22 9:57 PM, David Howells wrote:
> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> 
>> +	help
>> +	  This permits on-demand read mode of cachefiles.  In this mode, when
>> +	  cache miss, the cachefiles backend instead of netfs, is responsible
>> +	  for fetching data, e.g. through user daemon.
> 
> How about:
> 
> 	help
> 	  This permits userspace to enable the cachefiles on-demand read mode.
> 	  In this mode, when a cache miss occurs, responsibility for fetching
> 	  the data lies with the cachefiles backend instead of with the netfs
> 	  and is delegated to userspace.
> 
>> +	/*
>> +	 * 1) Cache has been marked as dead state, and then 2) flush all
>> +	 * pending requests in @reqs xarray. The barrier inside set_bit()
>> +	 * will ensure that above two ops won't be reordered.
>> +	 */
> 
> What set_bit()?  

"set_bit(CACHEFILES_DEAD, &cache->flags);" in cachefiles_daemon_release()

> What "above two ops"? 

The two operations I mentioned in the comment:
1) Cache has been marked as dead state, and then
2) flush all pending requests in @reqs xarray.


> And that's not how barriers work; they


> provide a partial ordering relative to another pair of barriered ops.
> 
> Also, set_bit() can't be relied upon to imply a barrier - see
> Documentation/memory-barriers.txt.

Yeah, it seems that set_bit() doesn't imply with a memory barrier,
though the x86 implementation (arch/x86/boot/bitops.h) indeed implies a
barrier, which may misleads me. Thanks for pointing it out. Then maybe a
full barrier is needed here before flushing the @reqs xarray.

> 
>> +	if (IS_ENABLED(CONFIG_CACHEFILES_ONDEMAND) &&
>> +	    test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags)) {
> 
> It might be worth abstracting this into an inline function in internal.h:
> 
> 	static inline bool cachefiles_in_ondemand_mode(cache)
> 	{
> 		return IS_ENABLED(CONFIG_CACHEFILES_ONDEMAND) &&
> 			test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags)
> 	}

Okay, will be fixed in the next version.

> 
>> +#ifdef CONFIG_CACHEFILES_ONDEMAND
> 
> This looks like it ought to be superfluous, given the preceding test - though
> I can see why you need it:

Sorry I can't see the context. But I guess you are referring to the
snippet of cachefiles_daemon_poll()?

```
+	if (IS_ENABLED(CONFIG_CACHEFILES_ONDEMAND) &&
+	    test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags)) {
+#ifdef CONFIG_CACHEFILES_ONDEMAND
+		if (!xa_empty(&cache->reqs))
+			mask |= EPOLLIN;
```

Yes the implementation here is indeed not elegant enough. As you
described below, if @reqs is defined non-conditionally in struct
cachefiles_cache, then the superfluous magic here is not needed then.

> 
>> +#ifdef CONFIG_CACHEFILES_ONDEMAND
>> +	struct xarray			reqs;		/* xarray of pending on-demand requests */
>> +	struct xarray			ondemand_ids;	/* xarray for ondemand_id allocation */
>> +	u32				ondemand_id_next;
>> +#endif
> 
> I'm tempted to say that you should just make them non-conditional.  It's not
> like there's likely to be more than one or two cachefiles_cache structs on a
> system.

Okay, sounds reasonable.


-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

