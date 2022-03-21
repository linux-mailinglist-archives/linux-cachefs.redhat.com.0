Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD254E2A4A
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Mar 2022 15:16:40 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-9mfwQ4nBOXmzRF8nONP38g-1; Mon, 21 Mar 2022 10:16:36 -0400
X-MC-Unique: 9mfwQ4nBOXmzRF8nONP38g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EC0D899ED2;
	Mon, 21 Mar 2022 14:16:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 74BC6141DC28;
	Mon, 21 Mar 2022 14:16:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1FF271947BBE;
	Mon, 21 Mar 2022 14:16:35 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DEA0419451ED for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 21 Mar 2022 14:16:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6D132428F08; Mon, 21 Mar 2022 14:16:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6993642D3B3
 for <linux-cachefs@redhat.com>; Mon, 21 Mar 2022 14:16:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 528793C0010B
 for <linux-cachefs@redhat.com>; Mon, 21 Mar 2022 14:16:33 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-SlNWKfMkP3WcuxGu_MCayA-1; Mon, 21 Mar 2022 10:16:28 -0400
X-MC-Unique: SlNWKfMkP3WcuxGu_MCayA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R431e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=16; SR=0; TI=SMTPD_---0V7rRN9d_1647872182
Received: from 192.168.31.65(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V7rRN9d_1647872182) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 21 Mar 2022 22:16:23 +0800
Message-ID: <eb558006-e5f2-59fe-9c58-844c6deff4dd@linux.alibaba.com>
Date: Mon, 21 Mar 2022 22:16:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: David Howells <dhowells@redhat.com>
References: <20220316131723.111553-4-jefflexu@linux.alibaba.com>
 <20220316131723.111553-1-jefflexu@linux.alibaba.com>
 <1027872.1647869684@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <1027872.1647869684@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
 willy@infradead.org, linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Thanks for reviewing.


On 3/21/22 9:34 PM, David Howells wrote:
> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> 
>> Fscache/cachefiles used to serve as a local cache for remote fs. This
>> patch, along with the following patches, introduces a new on-demand read
>> mode for cachefiles, which can boost the scenario where on-demand read
>> semantics is needed, e.g. container image distribution.
>>
>> The essential difference between the original mode and on-demand read
>> mode is that, in the original mode, when cache miss, netfs itself will
>> fetch data from remote, and then write the fetched data into cache file.
>> While in on-demand read mode, a user daemon is responsible for fetching
>> data and then writing to the cache file.
>>
>> This patch only adds the command to enable on-demand read mode. An optional
>> parameter to "bind" command is added. On-demand mode will be turned on when
>> this optional argument matches "ondemand" exactly, i.e.  "bind
>> ondemand". Otherwise cachefiles will keep working in the original mode.
> 
> You're not really adding a command, per se.  Also, I would recommend
> starting the paragraph with a verb.  How about:
> 
> 	Make it possible to enable on-demand read mode by adding an
> 	optional parameter to the "bind" command.  On-demand mode will be
> 	turned on when this parameter is "ondemand", i.e. "bind ondemand".
> 	Otherwise cachefiles will work in the original mode.
> 
> Also, I'd add a note something like the following:
> 
> 	This is implemented as a variation on the bind command so that it
> 	can't be turned on accidentally in /etc/cachefilesd.conf when
> 	cachefilesd isn't expecting it.	

Alright, looks much better :)

> 
>> The following patches will implement the data plane of on-demand read
>> mode.
> 
> I would remove this line.  If ondemand mode is not fully implemented in
> cachefiles at this point, I would be tempted to move this to the end of the
> cachefiles subset of the patchset.  That said, I'm not sure it can be made
> to do anything much before that point.


Alright.

> 
>> +#ifdef CONFIG_CACHEFILES_ONDEMAND
>> +static inline void cachefiles_ondemand_open(struct cachefiles_cache *cache)
>> +{
>> +	xa_init_flags(&cache->reqs, XA_FLAGS_ALLOC);
>> +	rwlock_init(&cache->reqs_lock);
>> +}
> 
> Just merge that into the caller.
> 
>> +static inline void cachefiles_ondemand_release(struct cachefiles_cache *cache)
>> +{
>> +	xa_destroy(&cache->reqs);
>> +}
> 
> Ditto.
> 
>> +static inline
>> +bool cachefiles_ondemand_daemon_bind(struct cachefiles_cache *cache, char *args)
>> +{
>> +	if (!strcmp(args, "ondemand")) {
>> +		set_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags);
>> +		return true;
>> +	}
>> +
>> +	return false;
>> +}
>> ...
>> +	if (!cachefiles_ondemand_daemon_bind(cache, args) && *args) {
>> +		pr_err("'bind' command doesn't take an argument\n");
>> +		return -EINVAL;
>> +	}
>> +
> 
> I would merge these together, I think, and say something like "Ondemand
> mode not enabled in kernel" if CONFIG_CACHEFILES_ONDEMAND=n.
> 

The reason why I extract all these logic into small sized function is
that, the **callers** can call cachefiles_ondemand_daemon_bind()
directly without any clause like:

```
#ifdef CONFIG_CACHEFILES_ONDEMAND
	...
#else
	...
```



Another choice is like

```
if (IS_ENABLED(CONFIG_CACHEFILES_ONDEMAND))
	...
else
	...
```


-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

