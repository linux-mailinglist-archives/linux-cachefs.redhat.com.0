Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 797BA598206
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Aug 2022 13:14:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660821276;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ecql7KX6+eShHw67aqHJwmXIQGAEc8ZQJM6/rMIRD/A=;
	b=IhdSKc9X6QWJBCxYhO3w3oFfhtlfa2o9Wpig6nH6z+FT9ache6kpMEOWrWFVY3vMkY9suj
	9f3Z19RlaK4zAFBIfc4pmByEw14m5ZZ/xNY0p36Y4dX+BmD9pZiimKf5yAsLwjOXhFH5gG
	frmDifs0mS6vXopi5MyYZ/JBTziYQPI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-3E_Ru3tgOw6sP_3uUoRtPw-1; Thu, 18 Aug 2022 07:14:35 -0400
X-MC-Unique: 3E_Ru3tgOw6sP_3uUoRtPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CC78811E75;
	Thu, 18 Aug 2022 11:14:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72CDC1121315;
	Thu, 18 Aug 2022 11:14:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4DA25194E11C;
	Thu, 18 Aug 2022 11:14:34 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AE5CD1946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 11:14:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A1570492CA4; Thu, 18 Aug 2022 11:14:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D9B7492C3B
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 11:14:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AC051034AD3
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 11:14:32 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-554-6c73eqDyPxyTwW-F78dzDA-1; Thu, 18 Aug 2022 07:14:30 -0400
X-MC-Unique: 6c73eqDyPxyTwW-F78dzDA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VMaUvrM_1660821265
Received: from 30.227.66.106(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VMaUvrM_1660821265) by smtp.aliyun-inc.com;
 Thu, 18 Aug 2022 19:14:26 +0800
Message-ID: <e4e18421-7820-f1e3-6762-5959c2bd7ea4@linux.alibaba.com>
Date: Thu, 18 Aug 2022 19:14:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
To: Sun Ke <sunke32@huawei.com>, dhowells@redhat.com
References: <20220818111935.1683062-1-sunke32@huawei.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <20220818111935.1683062-1-sunke32@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Linux-cachefs] [v2] cachefiles: fix error return code in
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 8/18/22 7:19 PM, Sun Ke wrote:
> If size < 0; open request will fail, but cachefiles_ondemand_copen return 0.
> Fix to return a negative error code.

Could you please also update the commit log?

Otherwise LGTM.

Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>


BTW, also cc linux-fsdevel@vger.kernel.org

> 
> Fixes: c8383054506c ("cachefiles: notify the user daemon when looking up cookie")
> Signed-off-by: Sun Ke <sunke32@huawei.com>
> ---
>  fs/cachefiles/ondemand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
> index 1fee702d5529..ea8a1e8317d9 100644
> --- a/fs/cachefiles/ondemand.c
> +++ b/fs/cachefiles/ondemand.c
> @@ -159,7 +159,7 @@ int cachefiles_ondemand_copen(struct cachefiles_cache *cache, char *args)
>  	/* fail OPEN request if daemon reports an error */
>  	if (size < 0) {
>  		if (!IS_ERR_VALUE(size))
> -			size = -EINVAL;
> +			ret = size = -EINVAL;
>  		req->error = size;
>  		goto out;
>  	}

-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

