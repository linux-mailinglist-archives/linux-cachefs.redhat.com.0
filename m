Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B22BA596FB6
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Aug 2022 15:24:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660742693;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6G9Y/8cXRqyLZ6sWM8L5UUWll1uliI5iDCIwcf7ajQU=;
	b=UtT7O5rg15jiqdjrCy5uxFIxefmshSYQlBP5MR99Phcy6xS4UN7+OHJyHGF0uUTE8qdkUX
	RByAcb80WIHW5DpAigaEPpT1m1ZkJ6Jji5UmsvVZ6LbEJR4FB7InomLuCVkCJWRMQecmer
	ci4Oc7+sSUqE4175Dqu8Ys4u8NgeeEg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-g1nS8vYaOnm-rbs-XRffDg-1; Wed, 17 Aug 2022 09:24:50 -0400
X-MC-Unique: g1nS8vYaOnm-rbs-XRffDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B0333C0E214;
	Wed, 17 Aug 2022 13:24:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B31E6400E726;
	Wed, 17 Aug 2022 13:24:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 65C3F194E009;
	Wed, 17 Aug 2022 13:24:49 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A7D3D1946A40 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 17 Aug 2022 12:16:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 956BD40D2830; Wed, 17 Aug 2022 12:16:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91C6540D2827
 for <linux-cachefs@redhat.com>; Wed, 17 Aug 2022 12:16:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E93E296A605
 for <linux-cachefs@redhat.com>; Wed, 17 Aug 2022 12:16:02 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-205-DsLSbo3oOO-sCx4uTZ9d3g-1; Wed, 17 Aug 2022 08:15:59 -0400
X-MC-Unique: DsLSbo3oOO-sCx4uTZ9d3g-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R861e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VMVTaVT_1660738553
Received: from 30.227.73.176(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VMVTaVT_1660738553) by smtp.aliyun-inc.com;
 Wed, 17 Aug 2022 20:15:54 +0800
Message-ID: <107223ba-f125-9a09-758d-893bf33b629f@linux.alibaba.com>
Date: Wed, 17 Aug 2022 20:15:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
To: Xin Yin <yinxin.x@bytedance.com>, dhowells@redhat.com, xiang@kernel.org
References: <20220817065200.11543-1-yinxin.x@bytedance.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <20220817065200.11543-1-yinxin.x@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: linux-fsdevel@vger.kernel.org, zhujia.zj@bytedance.com,
 linux-cachefs@redhat.com, Yongqing Li <liyongqing@bytedance.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 8/17/22 2:52 PM, Xin Yin wrote:
> For now, enqueuing and dequeuing on-demand requests all start from
> idx 0, this makes request distribution unfair. In the weighty
> concurrent I/O scenario, the request stored in higher idx will starve.
> 
> Searching requests cyclically in cachefiles_ondemand_daemon_read,
> makes distribution fairer.
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
> +		xas_set(&xas, 0);> +		req = xas_find_marked(&xas, cache->req_id_next - 1,
CACHEFILES_REQ_NEW);


LGTM.

Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>

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

-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

