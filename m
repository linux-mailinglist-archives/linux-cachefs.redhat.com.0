Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B462484FBE
	for <lists+linux-cachefs@lfdr.de>; Wed,  5 Jan 2022 10:05:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-zHY7cMocOiqbmQIoB6Lb0w-1; Wed, 05 Jan 2022 04:05:14 -0500
X-MC-Unique: zHY7cMocOiqbmQIoB6Lb0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68353190A7AA;
	Wed,  5 Jan 2022 09:05:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 751FC5E492;
	Wed,  5 Jan 2022 09:05:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C38E4BB7C;
	Wed,  5 Jan 2022 09:05:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20594cAA000748 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 5 Jan 2022 04:04:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 757B4492D1B; Wed,  5 Jan 2022 09:04:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70F3F492D17
	for <linux-cachefs@redhat.com>; Wed,  5 Jan 2022 09:04:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44ED02B76035
	for <linux-cachefs@redhat.com>; Wed,  5 Jan 2022 09:04:38 +0000 (UTC)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
	[47.88.44.36]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-510-Dg327-yzMRKc957C0H7vCw-1; Wed, 05 Jan 2022 04:04:34 -0500
X-MC-Unique: Dg327-yzMRKc957C0H7vCw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V10Yc.y_1641373459
Received: from 30.225.24.102(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V10Yc.y_1641373459) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 05 Jan 2022 17:04:20 +0800
Message-ID: <9ab680eb-beb2-07eb-eab2-833fde48906d@linux.alibaba.com>
Date: Wed, 5 Jan 2022 17:04:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.3.2
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, tao.peng@linux.alibaba.com,
	gerry@linux.alibaba.com, eguan@linux.alibaba.com,
	linux-kernel@vger.kernel.org
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
	<20211227125444.21187-8-jefflexu@linux.alibaba.com>
	<YdRattisu+ITYvvZ@B-P7TQMD6M-0146.local>
	<YdRgrWEDU8sJVExX@B-P7TQMD6M-0146.local>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <YdRgrWEDU8sJVExX@B-P7TQMD6M-0146.local>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH v1 07/23] erofs: add nodev mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 1/4/22 10:58 PM, Gao Xiang wrote:
> On Tue, Jan 04, 2022 at 10:33:26PM +0800, Gao Xiang wrote:
>> On Mon, Dec 27, 2021 at 08:54:28PM +0800, Jeffle Xu wrote:
>>> Until then erofs is exactly blockdev based filesystem. In other using
>>> scenarios (e.g. container image), erofs needs to run upon files.
>>>
>>> This patch introduces a new nodev mode, in which erofs could be mounted
>>> from a bootstrap blob file containing the complete erofs image.
>>>
>>> The following patch will introduce a new mount option "uuid", by which
>>> users could specify the bootstrap blob file.
>>>
>>> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
>>
>> I think the order of some patches in this patchset can be improved.
>>
>> Take this patch as an example. This patch introduces a new mount
>> option called "uuid", so the kernel will just accept it (which
>> generates a user-visible impact) after this patch but it doesn't
>> actually work.
>>
>> Therefore, we actually have three different behaviors here:
>>  - kernel doesn't support "uuid" mount option completely;
>>  - kernel support "uuid" but it doesn't work;
>>  - kernel support "uuid" correctly (maybe after some random patch);
>>
>> Actually that is bad for bisecting since there are some commits
>> having temporary behaviors. And we don't know which commit
>> actually fully implements this "uuid" mount option.
>>
>> So personally I think the proper order is just like the bottom-up
>> approach, and make sure each patch can be tested / bisected
>> independently.
> 
> Oh, I may misread this patch, but I still think we'd better to
> avoid dead paths "TODO" like this as much as possible.
> 
> Just do in the bottom-up way.
> 

OK, it is better to be put at the latter part of the whole patch set.
Would be fixed in the next version. Thanks.

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

