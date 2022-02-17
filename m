Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4E74B95A7
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Feb 2022 02:49:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-nei4jcx4Or2GhalHpj8fNQ-1; Wed, 16 Feb 2022 20:49:48 -0500
X-MC-Unique: nei4jcx4Or2GhalHpj8fNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8D6B814246;
	Thu, 17 Feb 2022 01:49:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F0B75DB82;
	Thu, 17 Feb 2022 01:49:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 960404BB7C;
	Thu, 17 Feb 2022 01:49:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21H1ndWm014200 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 16 Feb 2022 20:49:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C4961C080B4; Thu, 17 Feb 2022 01:49:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1073C080AF
	for <linux-cachefs@redhat.com>; Thu, 17 Feb 2022 01:49:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A835485A5A8
	for <linux-cachefs@redhat.com>; Thu, 17 Feb 2022 01:49:39 +0000 (UTC)
Received: from out199-18.us.a.mail.aliyun.com
	(out199-18.us.a.mail.aliyun.com [47.90.199.18]) by relay.mimecast.com
	with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-198-II4sA-N6MyCZhpsfOJ8jdA-1; Wed, 16 Feb 2022 20:49:37 -0500
X-MC-Unique: II4sA-N6MyCZhpsfOJ8jdA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R271e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
	TI=SMTPD_---0V4fQwYM_1645062566
Received: from 30.225.24.49(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V4fQwYM_1645062566) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 17 Feb 2022 09:49:27 +0800
Message-ID: <a3da9289-665d-ea37-5ab9-b97b883f694f@linux.alibaba.com>
Date: Thu, 17 Feb 2022 09:49:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.6.0
To: Greg KH <gregkh@linuxfoundation.org>
References: <bd9cb3bb-e29c-d4b3-e9bf-915b9771b553@linux.alibaba.com>
	<20220215111335.123528-1-jefflexu@linux.alibaba.com>
	<YgzWkhXCnlNDADvb@kroah.com>
	<becd656c-701c-747e-f063-2b9867cbd3d2@linux.alibaba.com>
	<Yg0421B10PPwunI+@kroah.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <Yg0421B10PPwunI+@kroah.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: linux-cachefs@redhat.com
Cc: linux-erofs@lists.ozlabs.org, chao@kernel.org, tao.peng@linux.alibaba.com,
	willy@infradead.org, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	xiang@kernel.org, gerry@linux.alibaba.com,
	torvalds@linux-foundation.org, eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v4 05/23] cachefiles: introduce new
 devnode for on-demand read mode
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2/17/22 1:48 AM, Greg KH wrote:
> On Wed, Feb 16, 2022 at 08:49:35PM +0800, JeffleXu wrote:
>>>> +struct cachefiles_req_in {
>>>> +	uint64_t id;
>>>> +	uint64_t off;
>>>> +	uint64_t len;
>>>
>>> For structures that cross the user/kernel boundry, you have to use the
>>> correct types.  For this it would be __u64.
>>
>> OK I will change to __xx style in the next version.
>>
>> By the way, I can't understand the disadvantage of uintxx_t style.
> 
> The "uint*" types are not valid kernel types.  They are userspace types
> and do not transfer properly in all arches and situations when crossing
> the user/kernel boundry.  They are also in a different C "namespace", so
> should not even be used in kernel code, although a lot of people do
> because they are used to writing userspace C code :(

OK. "uint*" types are defined in ISO C library, while it seems that
linux kernel doesn't expect any C library [1].

[1] https://kernelnewbies.org/FAQ/LibraryFunctionsInKernel

Thanks for explaining it.

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

