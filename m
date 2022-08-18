Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC88598195
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Aug 2022 12:47:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660819648;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F7//k/+NjgVPMUuyud3oUwzfriR8gQc5Jg68LE7D6+w=;
	b=huTg6vio8cKAgt6hHW6bkJX6W9CzL43egvwBBo5KfNPcGfZ4QGnBxTopR0wnWmWLUafz7W
	0YXc29Kvf5W8C+Avn/55d68/pcQROGPROv5lcquftcK5E4Dhs4a+BtiVKwGJu0vo4SlLSs
	q2P+C6VxzArA0F7sJHk0cabwcV57uGY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-TnbNxVdsN722puDpiiwIMA-1; Thu, 18 Aug 2022 06:47:27 -0400
X-MC-Unique: TnbNxVdsN722puDpiiwIMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C0B38039AE;
	Thu, 18 Aug 2022 10:47:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 67E0C9457F;
	Thu, 18 Aug 2022 10:47:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2161D194E11C;
	Thu, 18 Aug 2022 10:47:26 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DDEB61946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 10:47:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BF032400F36; Thu, 18 Aug 2022 10:47:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB59D492C3B
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 10:47:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3B9080231E
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 10:47:24 +0000 (UTC)
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-649-x8eP5p6NP6GTbWYFYaI3ug-1; Thu, 18 Aug 2022 06:47:20 -0400
X-MC-Unique: x8eP5p6NP6GTbWYFYaI3ug-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R561e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VMabRlS_1660819636
Received: from 30.227.66.106(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VMabRlS_1660819636) by smtp.aliyun-inc.com;
 Thu, 18 Aug 2022 18:47:17 +0800
Message-ID: <0cc3f6d6-ac89-05f6-23f3-68446a32d8b2@linux.alibaba.com>
Date: Thu, 18 Aug 2022 18:47:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
To: Sun Ke <sunke32@huawei.com>, dhowells@redhat.com
References: <20220818094939.1548183-1-sunke32@huawei.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <20220818094939.1548183-1-sunke32@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: fix error return code in
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
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 linux-cachefs@redhat.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 8/18/22 5:49 PM, Sun Ke wrote:
> If size < 0; open request will fail, but cachefiles_ondemand_copen return 0.

Hi, this is a deliberate design. The cache_size field of copen is
specified by the user daemon. If cache_size < 0, then the OPEN request
is expected to fail, while copen itself shall succeed.

> Fix to return a negative error code.
> 
> Fixes: c8383054506c ("cachefiles: notify the user daemon when looking up cookie")
> Signed-off-by: Sun Ke <sunke32@huawei.com>
> ---
>  fs/cachefiles/ondemand.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
> index 1fee702d5529..a31d3ff0ce5f 100644
> --- a/fs/cachefiles/ondemand.c
> +++ b/fs/cachefiles/ondemand.c
> @@ -161,6 +161,7 @@ int cachefiles_ondemand_copen(struct cachefiles_cache *cache, char *args)
>  		if (!IS_ERR_VALUE(size))
>  			size = -EINVAL;

However, it is indeed unexpected when cache_size is an invalid error
code. How about:

		if (!IS_ERR_VALUE(size))
-			size= -EINVAL;
+			ret = size = -EINVAL;
		req->error = size;
		goto out;
	}

>  		req->error = size;
> +		ret = -EINVAL;
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

