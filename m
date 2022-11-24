Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D719B6370EC
	for <lists+linux-cachefs@lfdr.de>; Thu, 24 Nov 2022 04:20:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669260005;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NkMiC7bwMTDikAQ0/mjMVLfjeT6llm6QtN9NmLgIv2c=;
	b=isEjql8hjqsClpmsTGj1YBDj4XluRckB1VbKDFACmAHT6X3Gc/o32U/4PKHS97+fkU3dnC
	mLucs5UQMibDQSpKgtVSBBizynqMtBaXRtTC84SiVZhspBJsFjv96rTJLf5/CGRNELGs8N
	wFXnpfKfninVze0yw/y/u/QqwAyCMK0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-5PLBf6EEM6e9KklNWIZSyQ-1; Wed, 23 Nov 2022 22:20:02 -0500
X-MC-Unique: 5PLBf6EEM6e9KklNWIZSyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF012833A06;
	Thu, 24 Nov 2022 03:20:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CED540C6EC5;
	Thu, 24 Nov 2022 03:20:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 48129194658D;
	Thu, 24 Nov 2022 03:20:00 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 077941946587 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 24 Nov 2022 03:19:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E8DA240C83DA; Thu, 24 Nov 2022 03:19:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E109640C835A
 for <linux-cachefs@redhat.com>; Thu, 24 Nov 2022 03:19:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C64AC85A588
 for <linux-cachefs@redhat.com>; Thu, 24 Nov 2022 03:19:58 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-81-QhF-hGkPNRCRNI-hI7yXQw-1; Wed, 23 Nov 2022 22:19:56 -0500
X-MC-Unique: QhF-hGkPNRCRNI-hI7yXQw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VVZ9.-D_1669259990
Received: from 30.221.132.138(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VVZ9.-D_1669259990) by smtp.aliyun-inc.com;
 Thu, 24 Nov 2022 11:19:51 +0800
Message-ID: <25cfb176-ff2d-36e5-d12e-a2413ad2d5c2@linux.alibaba.com>
Date: Thu, 24 Nov 2022 11:19:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: David Howells <dhowells@redhat.com>
References: <20221117053017.21074-2-jefflexu@linux.alibaba.com>
 <20221117053017.21074-1-jefflexu@linux.alibaba.com>
 <1609247.1669221883@warthog.procyon.org.uk>
From: Jingbo Xu <jefflexu@linux.alibaba.com>
In-Reply-To: <1609247.1669221883@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH v4 1/2] fscache,
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
Cc: chao@kernel.org, jlayton@kernel.org, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org, xiang@kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

Really thanks for the comment.

On 11/24/22 12:44 AM, David Howells wrote:
> Jingbo Xu <jefflexu@linux.alibaba.com> wrote:
> 
>> -/*
>> - * Prepare a read operation, shortening it to a cached/uncached
>> - * boundary as appropriate.
>> - */
>> -static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *subreq,
>> -						      loff_t i_size)
>> +static inline enum netfs_io_source
>> +cachefiles_do_prepare_read(struct netfs_cache_resources *cres,
>> +			   loff_t start, size_t *_len, loff_t i_size,
>> +			   unsigned long *_flags)
> 
> That's not exactly what I meant, but I guess it would work as the compiler
> would probably inline it into both callers.

Yeah, I just have no better way if we don't want another function
calling introduced by this patch.  If we keep cachefiles_prepare_read()
untouched, the on-demand users need to construct a temporary subrequest
on the stack, and Jeff pointed out that this way is somewhat fragile and
not robust enough.

Anyway I would keep moving forward in the direction of current patch,
and add back the netfs_inode number to the tracepoint.  I would send v5
soon.

Thanks again for the reply :-)

> 
>> -		      __entry->netfs_inode, __entry->cache_inode)
>> +		      __entry->cache_inode)
> 
> Can you not lose the netfs_inode number from the tracepoint, please?  Feel
> free to display 0 there for your purposes.
> 

Sure.


-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

