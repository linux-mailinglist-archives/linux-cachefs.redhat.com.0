Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 300FB619628
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Nov 2022 13:23:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667564583;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8mEoo7AbKwSZ0grywV8ecj/RW48WF/XQ844lBJFjj4Q=;
	b=LcTDzHpfPedITS+49jRmR1sbqwiZZIxV5aHXGGlkmBuDm++tlH3EKCDCOzD49p5ALOhKEy
	OrT6DnNSAUtgv6Rk/OrMaoEPQCREsL7dqMIQCc9mRzNJ0OKJVXdrv9P8aJTwEhlrd38oTy
	KceAM7Fp1hrOaXAKQoQXo2S3F5Xtm2k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-rxySRuxaPWWWa3TkmgUIqg-1; Fri, 04 Nov 2022 08:23:00 -0400
X-MC-Unique: rxySRuxaPWWWa3TkmgUIqg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80058800B23;
	Fri,  4 Nov 2022 12:22:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 76A712166B26;
	Fri,  4 Nov 2022 12:22:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4C2791946594;
	Fri,  4 Nov 2022 12:22:59 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 631A31946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  4 Nov 2022 12:22:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 39442492CA5; Fri,  4 Nov 2022 12:22:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30D044A9254
 for <linux-cachefs@redhat.com>; Fri,  4 Nov 2022 12:22:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15EA786F12E
 for <linux-cachefs@redhat.com>; Fri,  4 Nov 2022 12:22:58 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-133-pC8rEPgJMhmIhjndMnO76Q-1; Fri, 04 Nov 2022 08:22:54 -0400
X-MC-Unique: pC8rEPgJMhmIhjndMnO76Q-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VTxEyHi_1667564569
Received: from 30.221.128.121(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VTxEyHi_1667564569) by smtp.aliyun-inc.com;
 Fri, 04 Nov 2022 20:22:50 +0800
Message-ID: <71907c21-bd3f-81a1-86d6-a757e4484be2@linux.alibaba.com>
Date: Fri, 4 Nov 2022 20:22:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: Jeff Layton <jlayton@kernel.org>, dhowells@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-cachefs@redhat.com, linux-erofs@lists.ozlabs.org
References: <20221104072637.72375-1-jefflexu@linux.alibaba.com>
 <20221104072637.72375-2-jefflexu@linux.alibaba.com>
 <c0d893bf6f52702a0bd2056a8cb005861b8324ea.camel@kernel.org>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <c0d893bf6f52702a0bd2056a8cb005861b8324ea.camel@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH 1/2] fscache,
 cachefiles: add prepare_ondemand_read() callback
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 11/4/22 7:18 PM, Jeff Layton wrote:
> On Fri, 2022-11-04 at 15:26 +0800, Jingbo Xu wrote:
>> Add prepare_ondemand_read() callback dedicated for the on-demand read
>> scenario, so that callers from this scenario can be decoupled from
>> netfs_io_subrequest.
>>
>> To reuse the hole detecting logic as mush as possible, both the
>> implementation of prepare_read() and prepare_ondemand_read() inside
>> Cachefiles call a common routine.
>>
>> In the near future, prepare_read() will get enhanced and more
>> information will be needed and then returned to callers. Thus
>> netfs_io_subrequest is a reasonable candidate for holding places for all
>> these information needed in the internal implementation.
>>
>> Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
>> ---
>>  fs/cachefiles/io.c                | 42 +++++++++++++++++++++++++------
>>  include/linux/netfs.h             |  7 ++++++
>>  include/trace/events/cachefiles.h |  4 +--
>>  3 files changed, 43 insertions(+), 10 deletions(-)
>>
>> diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
>> index 000a28f46e59..6427259fcba9 100644
>> --- a/fs/cachefiles/io.c
>> +++ b/fs/cachefiles/io.c
>> @@ -385,16 +385,11 @@ static int cachefiles_write(struct netfs_cache_resources *cres,
>>  				  term_func, term_func_priv);
>>  }
>>  
>> -/*
>> - * Prepare a read operation, shortening it to a cached/uncached
>> - * boundary as appropriate.
>> - */
>> -static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *subreq,
>> -						      loff_t i_size)
>> +static enum netfs_io_source cachefiles_do_prepare_read(struct netfs_io_subrequest *subreq,
>> +						       struct netfs_cache_resources *cres,
>> +						       loff_t i_size)
>>  {
>>  	enum cachefiles_prepare_read_trace why;
>> -	struct netfs_io_request *rreq = subreq->rreq;
>> -	struct netfs_cache_resources *cres = &rreq->cache_resources;
>>  	struct cachefiles_object *object;
>>  	struct cachefiles_cache *cache;
>>  	struct fscache_cookie *cookie = fscache_cres_cookie(cres);
>> @@ -501,6 +496,36 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *
>>  	return ret;
>>  }
>>  
>> +/*
>> + * Prepare a read operation, shortening it to a cached/uncached
>> + * boundary as appropriate.
>> + */
>> +static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *subreq,
>> +						      loff_t i_size)
>> +{
>> +	return cachefiles_do_prepare_read(subreq,
>> +			&subreq->rreq->cache_resources, i_size);
>> +}
>> +
>> +/*
>> + * Prepare an on-demand read operation, shortening it to a cached/uncached
>> + * boundary as appropriate.
>> + */
>> +static enum netfs_io_source cachefiles_prepare_ondemand_read(struct netfs_cache_resources *cres,
>> +		loff_t start, size_t *_len, loff_t i_size)
>> +{
>> +	enum netfs_io_source source;
>> +	struct netfs_io_subrequest subreq = {
>> +		.start	= start,
>> +		.len	= *_len,
>> +		.flags	= 1 << NETFS_SREQ_ONDEMAND,
>> +	};
>> +
> 
> Faking up a struct like this is sort of fragile. What if we change
> cachefiles_do_prepare_read to consult other fields in this structure
> later?

Indeed it's not robust somehow.


> 
> It might be best to have cachefiles_do_prepare_read take individual
> start, len, and flags values instead of doing this.
> 

I will give it a try if nobody objects this.


Thank you for your suggestions :)


-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

