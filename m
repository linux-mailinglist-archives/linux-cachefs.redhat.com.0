Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F73662D24A
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Nov 2022 05:25:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668659105;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kZQOl5Am9YxeeANVeV7cE3GKDid1Ww5YEJXKjKkLfu8=;
	b=WOxKzOalZGRjQLJ+9T80Pz5f8GBcrvXmS5Qw3yiFtytxbR4g2B9nTp1+n45i9GmIwnL5I0
	p1vDpJmVFT5JZ8odvoG68VfUDpYivhRhWkT0neQRN1YjsS7EBvuBBAN1HxMcS/zN1WL1gT
	B1Uh31QizAHvv8TyqJSfskyGhBxLXqs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-RI9qgt7LNi24j76CWL4XuA-1; Wed, 16 Nov 2022 23:25:04 -0500
X-MC-Unique: RI9qgt7LNi24j76CWL4XuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AAFA85A588;
	Thu, 17 Nov 2022 04:25:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24EEA145BA4B;
	Thu, 17 Nov 2022 04:25:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7663B19465A8;
	Thu, 17 Nov 2022 04:25:01 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BD20F19465A2 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 04:25:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 646702157F39; Thu, 17 Nov 2022 04:25:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C29F2157F37
 for <linux-cachefs@redhat.com>; Thu, 17 Nov 2022 04:25:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CA8C29AA383
 for <linux-cachefs@redhat.com>; Thu, 17 Nov 2022 04:25:00 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-46-QQSY3uaBOXCeum1-JUDnOw-1; Wed, 16 Nov 2022 23:24:45 -0500
X-MC-Unique: QQSY3uaBOXCeum1-JUDnOw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VV-VtWS_1668659080
Received: from 30.221.128.178(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VV-VtWS_1668659080) by smtp.aliyun-inc.com;
 Thu, 17 Nov 2022 12:24:42 +0800
Message-ID: <c529ee21-699d-dfc8-5f7d-2597fa00796d@linux.alibaba.com>
Date: Thu, 17 Nov 2022 12:24:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: David Howells <dhowells@redhat.com>, Jeff Layton <jlayton@kernel.org>
References: <2b595b62f6ecd28298a860fcdc5b4941dcafd9eb.camel@kernel.org>
 <20221116104502.107431-1-jefflexu@linux.alibaba.com>
 <20221116104502.107431-2-jefflexu@linux.alibaba.com>
 <2968419.1668606101@warthog.procyon.org.uk>
From: Jingbo Xu <jefflexu@linux.alibaba.com>
In-Reply-To: <2968419.1668606101@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH v3 1/2] fscache,
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
Cc: chao@kernel.org, linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, xiang@kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 11/16/22 9:41 PM, David Howells wrote:
> Jeff Layton <jlayton@kernel.org> wrote:
> 
>>> +static enum netfs_io_source cachefiles_do_prepare_read(struct netfs_cache_resources *cres,
>>> +					loff_t *_start, size_t *_len,
>>> +					unsigned long *_flags, loff_t i_size)
>>
>> _start is never changed, so it should be passed by value instead of by
>> pointer.
> 
> Hmmm.  The intention was that the start pointer should be able to be moved
> backwards by the cache - but that's not necessary in ->prepare_read() and
> ->expand_readahead() is provided for that now.  So yes, the start pointer
> shouldn't get changed at this point.

Okay.


> 
>> I'd also reverse the position of the arguments for _flags and i_size.
>> Otherwise, the CPU/compiler have to shuffle things around more in
>> cachefiles_prepare_ondemand_read before they call this.
> 
> Better to pass the flags in and then ignore them.  That way it can tail call,
> or just call cachefiles_do_prepare_read() directly from erofs.  If you're
> going to have a wrapper, then you might be just as well create a
> netfs_io_subrequest struct on the stack.

I would prefer letting cachefiles_prepare_ondemand_read() pass flags in
and then tail call cachefiles_do_prepare_read() directly.

Many thanks for the suggestion.


-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

