Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A15A26F2
	for <lists+linux-cachefs@lfdr.de>; Fri, 26 Aug 2022 13:37:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661513838;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m1ltcTZq5zEjdk4YufBUk2Co4YlyZSJ84ElIn1pPNSE=;
	b=fq3o1KylG3hx7WiLWp046ZXu+K+Wu2HECQOBTcdUD4MMtFA2QLYFBwD12adgfk21VBbvw0
	b9AKv3klsydvGE2ggaTqzg8KqJDtQ2ZNPniv6VZvsytNeqQ6afrqKRY7kEBVOlySwr2Mng
	j7wcDZHpkjrjjjc486aSuGdVCv7sjUc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-pcxKvmoVOJSjtuXuQRMjkA-1; Fri, 26 Aug 2022 07:37:15 -0400
X-MC-Unique: pcxKvmoVOJSjtuXuQRMjkA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C1783C0F38B;
	Fri, 26 Aug 2022 11:37:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE07D40357BA;
	Fri, 26 Aug 2022 11:37:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 74A631946A52;
	Fri, 26 Aug 2022 11:37:12 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 138361946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 26 Aug 2022 11:37:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D71E61121315; Fri, 26 Aug 2022 11:37:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D33161121314
 for <linux-cachefs@redhat.com>; Fri, 26 Aug 2022 11:37:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B81CC805B72
 for <linux-cachefs@redhat.com>; Fri, 26 Aug 2022 11:37:10 +0000 (UTC)
Received: from out199-11.us.a.mail.aliyun.com
 (out199-11.us.a.mail.aliyun.com [47.90.199.11]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-csLqhaDaNli6gWx8yslFFA-1; Fri, 26 Aug 2022 07:37:09 -0400
X-MC-Unique: csLqhaDaNli6gWx8yslFFA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R351e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VNIv.gp_1661513519
Received: from 192.168.31.65(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VNIv.gp_1661513519) by smtp.aliyun-inc.com;
 Fri, 26 Aug 2022 19:32:00 +0800
Message-ID: <10116646-a12b-05b2-5364-17e078649fab@linux.alibaba.com>
Date: Fri, 26 Aug 2022 19:31:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
To: Sun Ke <sunke32@huawei.com>, dhowells@redhat.com
References: <20220826023515.3437469-1-sunke32@huawei.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <20220826023515.3437469-1-sunke32@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH v4] cachefiles: fix error return code in
 cachefiles_ondemand_copen()
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 dan.carpenter@oracle.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 8/26/22 10:35 AM, Sun Ke wrote:
> The cache_size field of copen is specified by the user daemon.
> If cache_size < 0, then the OPEN request is expected to fail,
> while copen itself shall succeed. However, returning 0 is indeed
> unexpected when cache_size is an invalid error code.
> 
> Fix this by returning error when cache_size is an invalid error code.
> 
> Fixes: c8383054506c ("cachefiles: notify the user daemon when looking up cookie")
> Signed-off-by: Sun Ke <sunke32@huawei.com>
> Suggested-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>

Thanks Sun. Also thanks Dan for the suggestion.


Jingbo Xu

> ---
> v4: update the code suggested by Dan
> v3: update the commit log suggested by Jingbo.
>  fs/cachefiles/ondemand.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
> index 1fee702d5529..7e1586bd5cf3 100644
> --- a/fs/cachefiles/ondemand.c
> +++ b/fs/cachefiles/ondemand.c
> @@ -158,9 +158,13 @@ int cachefiles_ondemand_copen(struct cachefiles_cache *cache, char *args)
>  
>  	/* fail OPEN request if daemon reports an error */
>  	if (size < 0) {
> -		if (!IS_ERR_VALUE(size))
> -			size = -EINVAL;
> -		req->error = size;
> +		if (!IS_ERR_VALUE(size)) {
> +			req->error = -EINVAL;
> +			ret = -EINVAL;
> +		} else {
> +			req->error = size;
> +			ret = 0;
> +		}
>  		goto out;
>  	}
>  

-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

