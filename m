Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FE9596A40
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Aug 2022 09:19:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660720761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KYD0qJyI6FYy9HEzmqklwJkq0Z5+C0lZNIcjxv0M5xM=;
	b=TGFnV8GbWJjyCtVL40UhQ5eU/FXEKSoCAP80k08gda4G5cLr2Wve/TinYllDxBIYcQarva
	/Nx2Wy30RXI43wYACkg9V7keTtcd9i/WGZaCA4IfTq3AuHKL/gJeQHtCwF9xHAYfYijgQM
	YOuYUFvHoSY4iMBuPo6IG41wkqsgluk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-HGlNjQD_MamgXLDYUjjxQQ-1; Wed, 17 Aug 2022 03:19:20 -0400
X-MC-Unique: HGlNjQD_MamgXLDYUjjxQQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CFFC185A7BA;
	Wed, 17 Aug 2022 07:19:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73998400EAB2;
	Wed, 17 Aug 2022 07:19:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 37AA4193F6F5;
	Wed, 17 Aug 2022 07:19:19 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6DD811947047 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 17 Aug 2022 07:19:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4F699400E88D; Wed, 17 Aug 2022 07:19:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BAFD404C324
 for <linux-cachefs@redhat.com>; Wed, 17 Aug 2022 07:19:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32DC785A581
 for <linux-cachefs@redhat.com>; Wed, 17 Aug 2022 07:19:18 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-433-Jlw8CezWP2-d2u5VD8Nuzw-1; Wed, 17 Aug 2022 03:19:16 -0400
X-MC-Unique: Jlw8CezWP2-d2u5VD8Nuzw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VMUXCj0_1660720441
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VMUXCj0_1660720441) by smtp.aliyun-inc.com;
 Wed, 17 Aug 2022 15:14:03 +0800
Date: Wed, 17 Aug 2022 15:14:01 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Xin Yin <yinxin.x@bytedance.com>
Message-ID: <YvyVOfzkITlvgtQ6@B-P7TQMD6M-0146.local>
Mail-Followup-To: Xin Yin <yinxin.x@bytedance.com>, dhowells@redhat.com,
 xiang@kernel.org, jefflexu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, zhujia.zj@bytedance.com,
 linux-cachefs@redhat.com, Yongqing Li <liyongqing@bytedance.com>
References: <20220817065200.11543-1-yinxin.x@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20220817065200.11543-1-yinxin.x@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: make on-demand request
 distribution fairer
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
Cc: zhujia.zj@bytedance.com, Yongqing Li <liyongqing@bytedance.com>,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com, xiang@kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Yin,

On Wed, Aug 17, 2022 at 02:52:00PM +0800, Xin Yin wrote:
> For now, enqueuing and dequeuing on-demand requests all start from
> idx 0, this makes request distribution unfair. In the weighty
> concurrent I/O scenario, the request stored in higher idx will starve.
> 
> Searching requests cyclically in cachefiles_ondemand_daemon_read,
> makes distribution fairer.

Yeah, thanks for the catch.  The previous approach could cause somewhat
unfairness and make some requests starving... But we don't need strict
FIFO here.

> 
> Reported-by: Yongqing Li <liyongqing@bytedance.com>
> Signed-off-by: Xin Yin <yinxin.x@bytedance.com>
> ---
>  fs/cachefiles/internal.h |  1 +
>  fs/cachefiles/ondemand.c | 12 +++++++++---
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
> index 6cba2c6de2f9..2ad58c465208 100644
> --- a/fs/cachefiles/internal.h
> +++ b/fs/cachefiles/internal.h
> @@ -111,6 +111,7 @@ struct cachefiles_cache {
>  	char				*tag;		/* cache binding tag */
>  	refcount_t			unbind_pincount;/* refcount to do daemon unbind */
>  	struct xarray			reqs;		/* xarray of pending on-demand requests */
> +	unsigned long			req_id_next;

	unsigned long			ondemand_req_id_next; ?

Otherwise it looks good to me,

Thanks,
Gao Xiang

>  	struct xarray			ondemand_ids;	/* xarray for ondemand_id allocation */
>  	u32				ondemand_id_next;
>  };
> diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
> index 1fee702d5529..247961d65369 100644
> --- a/fs/cachefiles/ondemand.c
> +++ b/fs/cachefiles/ondemand.c
> @@ -238,14 +238,19 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
>  	unsigned long id = 0;
>  	size_t n;
>  	int ret = 0;
> -	XA_STATE(xas, &cache->reqs, 0);
> +	XA_STATE(xas, &cache->reqs, cache->req_id_next);
>  
>  	/*
> -	 * Search for a request that has not ever been processed, to prevent
> -	 * requests from being processed repeatedly.
> +	 * Cyclically search for a request that has not ever been processed,
> +	 * to prevent requests from being processed repeatedly, and make
> +	 * request distribution fair.
>  	 */
>  	xa_lock(&cache->reqs);
>  	req = xas_find_marked(&xas, UINT_MAX, CACHEFILES_REQ_NEW);
> +	if (!req && cache->req_id_next > 0) {
> +		xas_set(&xas, 0);
> +		req = xas_find_marked(&xas, cache->req_id_next - 1, CACHEFILES_REQ_NEW);
> +	}
>  	if (!req) {
>  		xa_unlock(&cache->reqs);
>  		return 0;
> @@ -260,6 +265,7 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
>  	}
>  
>  	xas_clear_mark(&xas, CACHEFILES_REQ_NEW);
> +	cache->req_id_next = xas.xa_index + 1;
>  	xa_unlock(&cache->reqs);
>  
>  	id = xas.xa_index;
> -- 
> 2.25.1
> 
> --
> Linux-cachefs mailing list
> Linux-cachefs@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-cachefs

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

