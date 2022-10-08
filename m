Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2165F848A
	for <lists+linux-cachefs@lfdr.de>; Sat,  8 Oct 2022 11:06:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665220006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G2qGDF63kna8wZLSrj2eSrs/5NX4T2RKHHzxsTMivLo=;
	b=Tf3zIhRRzqNnidkWeaqp/JexExOle6O80jR71gTGHr14jpDzSGPTvIOtXzST54o2vC+I1x
	yeEzaS9bftDNPn5ZtwUpVVFXo/aNMvzBtn3otMMNq5Bd64zLTalU9GPnzwkmU3L0LzeBT/
	fehFjPEtJ4qMZ1jXTzPiC7FHxIeo9Mw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-Ma50OccePKGSrUNEmbfQsg-1; Sat, 08 Oct 2022 05:06:43 -0400
X-MC-Unique: Ma50OccePKGSrUNEmbfQsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C44D101A5DC;
	Sat,  8 Oct 2022 09:06:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1330840C9559;
	Sat,  8 Oct 2022 09:06:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D91331946A51;
	Sat,  8 Oct 2022 09:06:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 849791946587 for <linux-cachefs@listman.corp.redhat.com>;
 Sat,  8 Oct 2022 09:06:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4C15020182B4; Sat,  8 Oct 2022 09:06:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 442E8201EC56
 for <linux-cachefs@redhat.com>; Sat,  8 Oct 2022 09:06:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27DBE811E67
 for <linux-cachefs@redhat.com>; Sat,  8 Oct 2022 09:06:41 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-413-1Gp8kdUqPVCMgDsrNWvUtA-1; Sat, 08 Oct 2022 05:06:36 -0400
X-MC-Unique: 1Gp8kdUqPVCMgDsrNWvUtA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VRc0d2._1665219991
Received: from 30.221.130.66(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VRc0d2._1665219991) by smtp.aliyun-inc.com;
 Sat, 08 Oct 2022 17:06:32 +0800
Message-ID: <4fbf60f5-4ed1-3dd8-e4d3-de796e701956@linux.alibaba.com>
Date: Sat, 8 Oct 2022 17:06:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
To: Jia Zhu <zhujia.zj@bytedance.com>, dhowells@redhat.com, xiang@kernel.org
References: <20220818135204.49878-1-zhujia.zj@bytedance.com>
 <20220818135204.49878-3-zhujia.zj@bytedance.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <20220818135204.49878-3-zhujia.zj@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Linux-cachefs] [RFC PATCH 2/5] cachefiles: extract ondemand
 info field from cachefiles_object
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 8/18/22 9:52 PM, Jia Zhu wrote:

>  /*
>   * Backing file state.
>   */
> @@ -67,8 +73,7 @@ struct cachefiles_object {
>  	unsigned long			flags;
>  #define CACHEFILES_OBJECT_USING_TMPFILE	0		/* Have an unlinked tmpfile */
>  #ifdef CONFIG_CACHEFILES_ONDEMAND
> -	int				ondemand_id;
> -	enum cachefiles_object_state	state;
> +	void				*private;
>  #endif
>  };

Personally I would prefer

	struct cachefiles_object {
		...
	#ifdef CONFIG_CACHEFILES_ONDEMAND
		struct cachefiles_ondemand_info *private;
	#endif
	}

and

> @@ -88,6 +93,7 @@ void cachefiles_put_object(struct cachefiles_object
*object,
>  		ASSERTCMP(object->file, ==, NULL);
>
>  		kfree(object->d_name);
> + #ifdef CONFIG_CACHEFILES_ONDEMAND
> +		kfree(object->private);
> + #endif
>
>  		cache = object->volume->cache->cache;
>  		fscache_put_cookie(object->cookie,

so that we can get rid of CACHEFILES_ONDEMAND_OBJINFO() stuff, to make
the code more readable.



-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

