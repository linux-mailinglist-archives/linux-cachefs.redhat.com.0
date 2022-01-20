Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C295494E26
	for <lists+linux-cachefs@lfdr.de>; Thu, 20 Jan 2022 13:46:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-GSBPQOXfOEuzKXGEwu73zg-1; Thu, 20 Jan 2022 07:46:37 -0500
X-MC-Unique: GSBPQOXfOEuzKXGEwu73zg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19947196E6C6;
	Thu, 20 Jan 2022 12:46:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 995097AB6C;
	Thu, 20 Jan 2022 12:46:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D404C1809CB8;
	Thu, 20 Jan 2022 12:46:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20KCiBaW002106 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 20 Jan 2022 07:44:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AE1387774; Thu, 20 Jan 2022 12:44:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8BBD76CC
	for <linux-cachefs@redhat.com>; Thu, 20 Jan 2022 12:44:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9272F811E7F
	for <linux-cachefs@redhat.com>; Thu, 20 Jan 2022 12:44:08 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
	(out30-42.freemail.mail.aliyun.com [115.124.30.42]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-306-_fA8oztYMfKj5tZBIQ4VkA-1; Thu, 20 Jan 2022 07:44:04 -0500
X-MC-Unique: _fA8oztYMfKj5tZBIQ4VkA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
	TI=SMTPD_---0V2MYYzM_1642682637
Received: from 192.168.31.65(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V2MYYzM_1642682637) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 20 Jan 2022 20:43:59 +0800
Message-ID: <a5b495d3-cafe-548a-2130-b7aa9e597f41@linux.alibaba.com>
Date: Thu, 20 Jan 2022 20:43:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.3.2
To: Matthew Wilcox <willy@infradead.org>
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
	<20211227125444.21187-20-jefflexu@linux.alibaba.com>
	<YcndgcpQQWY8MJBD@casper.infradead.org>
	<47831875-4bdd-8398-9f2d-0466b31a4382@linux.alibaba.com>
	<99c94a78-58c4-f0af-e1d4-9aaa51bab281@linux.alibaba.com>
	<YegQOHs9yjIgu1Qi@casper.infradead.org>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <YegQOHs9yjIgu1Qi@casper.infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: chao@kernel.org, tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	xiang@kernel.org, gerry@linux.alibaba.com,
	linux-erofs@lists.ozlabs.org, eguan@linux.alibaba.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 1/19/22 9:20 PM, Matthew Wilcox wrote:
> On Wed, Jan 12, 2022 at 05:02:13PM +0800, JeffleXu wrote:
>> I'm afraid IDR can't be replaced by xarray here. Because we need an 'ID'
>> for each pending read request, so that after fetching data from remote,
>> user daemon could notify kernel which read request has finished by this
>> 'ID'.
>>
>> Currently this 'ID' is get from idr_alloc(), and actually identifies the
>> position of corresponding read request inside the IDR tree. I can't find
>> similar API of xarray implementing similar function, i.e., returning an
>> 'ID'.
> 
> xa_alloc().
> 

Oh yes. Thanks. I will try to convert to xarray API...

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

