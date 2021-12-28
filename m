Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B45480920
	for <lists+linux-cachefs@lfdr.de>; Tue, 28 Dec 2021 13:33:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-WEkHieIZNGOHlphNDdJekQ-1; Tue, 28 Dec 2021 07:33:53 -0500
X-MC-Unique: WEkHieIZNGOHlphNDdJekQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE4471E17;
	Tue, 28 Dec 2021 12:33:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8326F6F94C;
	Tue, 28 Dec 2021 12:33:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 923671809CB8;
	Tue, 28 Dec 2021 12:33:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BSCXZQl029781 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 28 Dec 2021 07:33:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 606DF401A992; Tue, 28 Dec 2021 12:33:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C4EE401A972
	for <linux-cachefs@redhat.com>; Tue, 28 Dec 2021 12:33:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4708380B710
	for <linux-cachefs@redhat.com>; Tue, 28 Dec 2021 12:33:35 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com
	(out30-132.freemail.mail.aliyun.com [115.124.30.132]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-633-THd3w8nPPseeBlS2vFb4wg-1; Tue, 28 Dec 2021 07:33:29 -0500
X-MC-Unique: THd3w8nPPseeBlS2vFb4wg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
	TI=SMTPD_---0V06qOCA_1640694803
Received: from 30.225.24.30(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V06qOCA_1640694803) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 28 Dec 2021 20:33:24 +0800
Message-ID: <47831875-4bdd-8398-9f2d-0466b31a4382@linux.alibaba.com>
Date: Tue, 28 Dec 2021 20:33:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.3.2
To: Matthew Wilcox <willy@infradead.org>
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
	<20211227125444.21187-20-jefflexu@linux.alibaba.com>
	<YcndgcpQQWY8MJBD@casper.infradead.org>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <YcndgcpQQWY8MJBD@casper.infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-cachefs@redhat.com
Cc: chao@kernel.org, tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	linux-cachefs@redhat.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, xiang@kernel.org,
	gerry@linux.alibaba.com, linux-erofs@lists.ozlabs.org,
	eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v1 19/23] cachefiles: implement
 .demand_read() for demand read
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/27/21 11:36 PM, Matthew Wilcox wrote:
> On Mon, Dec 27, 2021 at 08:54:40PM +0800, Jeffle Xu wrote:
>> +	spin_lock(&cache->reqs_lock);
>> +	ret = idr_alloc(&cache->reqs, req, 0, 0, GFP_KERNEL);
> 
> GFP_KERNEL while holding a spinlock?

Right. Thanks for pointing it out.

> 
> You should be using an XArray instead of an IDR in new code anyway.
> 

Regards.

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

