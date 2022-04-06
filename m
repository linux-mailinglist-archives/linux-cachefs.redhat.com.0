Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C44C94F5205
	for <lists+linux-cachefs@lfdr.de>; Wed,  6 Apr 2022 04:47:49 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-4KZLiZpINwmIHSNgsJk9Lg-1; Tue, 05 Apr 2022 22:47:46 -0400
X-MC-Unique: 4KZLiZpINwmIHSNgsJk9Lg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B011C8041A0;
	Wed,  6 Apr 2022 02:47:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB8C840C1241;
	Wed,  6 Apr 2022 02:47:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0D54C1940372;
	Wed,  6 Apr 2022 02:47:30 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 423FC194036B for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 02:47:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0B82E2026D6A; Wed,  6 Apr 2022 02:47:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06F372026D64
 for <linux-cachefs@redhat.com>; Wed,  6 Apr 2022 02:47:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8B9680346E
 for <linux-cachefs@redhat.com>; Wed,  6 Apr 2022 02:47:25 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-3kDj6eqEOIKWBJYCFFODFA-1; Tue, 05 Apr 2022 22:47:21 -0400
X-MC-Unique: 3kDj6eqEOIKWBJYCFFODFA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R521e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=7; SR=0; TI=SMTPD_---0V9JnNKo_1649213237
Received: from 30.225.24.86(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V9JnNKo_1649213237) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 06 Apr 2022 10:47:18 +0800
Message-ID: <74e81f65-171c-804a-a8ca-fa5452c5ad77@linux.alibaba.com>
Date: Wed, 6 Apr 2022 10:47:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: Yue Hu <huyue2@coolpad.com>, dhowells@redhat.com, linux-cachefs@redhat.com
References: <20220401063643.7340-1-huyue2@coolpad.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <20220401063643.7340-1-huyue2@coolpad.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Linux-cachefs] [PATCH] fscache: Use wrapper
 fscache_set_cache_state() directly when relinquishing
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
Cc: zbestahu@gmail.com, linux-kernel@vger.kernel.org, zbestahu@163.com,
 zhangwen@coolpad.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 4/1/22 2:37 PM, Yue Hu wrote:
> We already have the wrapper function to set cache state.
> 
> Signed-off-by: Yue Hu <huyue2@coolpad.com>
> ---
>  fs/fscache/cache.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/fscache/cache.c b/fs/fscache/cache.c
> index 2749933852a9..d645f8b302a2 100644
> --- a/fs/fscache/cache.c
> +++ b/fs/fscache/cache.c
> @@ -214,7 +214,7 @@ void fscache_relinquish_cache(struct fscache_cache *cache)
>  
>  	cache->ops = NULL;
>  	cache->cache_priv = NULL;
> -	smp_store_release(&cache->state, FSCACHE_CACHE_IS_NOT_PRESENT);
> +	fscache_set_cache_state(cache, FSCACHE_CACHE_IS_NOT_PRESENT);
>  	fscache_put_cache(cache, where);
>  }
>  EXPORT_SYMBOL(fscache_relinquish_cache);

Looks good to me.
Reviewed-by: Jeffle Xu <jefflexu@linux.alibaba.com>

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

