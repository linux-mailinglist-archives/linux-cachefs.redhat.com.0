Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 938704EA7BB
	for <lists+linux-cachefs@lfdr.de>; Tue, 29 Mar 2022 08:15:05 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-U0lgbZR4Nny5hmR-RymN2Q-1; Tue, 29 Mar 2022 02:15:00 -0400
X-MC-Unique: U0lgbZR4Nny5hmR-RymN2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDEE4811E80;
	Tue, 29 Mar 2022 06:14:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CEDE40CF8E7;
	Tue, 29 Mar 2022 06:14:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1805C1940348;
	Tue, 29 Mar 2022 06:14:57 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 44FD21940342 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 29 Mar 2022 06:14:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 218D2112132E; Tue, 29 Mar 2022 06:14:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CC701121325
 for <linux-cachefs@redhat.com>; Tue, 29 Mar 2022 06:14:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DBAE811E81
 for <linux-cachefs@redhat.com>; Tue, 29 Mar 2022 06:14:43 +0000 (UTC)
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-nEB7mhMlPq-z3YYK-y8PtA-1; Tue, 29 Mar 2022 02:14:39 -0400
X-MC-Unique: nEB7mhMlPq-z3YYK-y8PtA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R621e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V8XENYr_1648534472
Received: from 30.225.24.46(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V8XENYr_1648534472) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 29 Mar 2022 14:14:34 +0800
Message-ID: <597372bf-06dc-defa-0628-a1c140235c1e@linux.alibaba.com>
Date: Tue, 29 Mar 2022 14:14:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
From: JeffleXu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
References: <20220325122223.102958-1-jefflexu@linux.alibaba.com>
 <20220325122223.102958-4-jefflexu@linux.alibaba.com>
In-Reply-To: <20220325122223.102958-4-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH v6 03/22] cachefiles: notify user daemon
 with anon_fd when looking up cookie
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
Cc: gregkh@linuxfoundation.org, fannaihao@baidu.com, tao.peng@linux.alibaba.com,
 willy@infradead.org, linux-kernel@vger.kernel.org, tianzichen@kuaishou.com,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 3/25/22 8:22 PM, Jeffle Xu wrote:

> diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
> index e80673d0ab97..8a0f1b691aca 100644
> --- a/fs/cachefiles/internal.h
> +++ b/fs/cachefiles/internal.h
> @@ -15,6 +15,8 @@
>  
> +/*
> + * ondemand.c
> + */
> +#ifdef CONFIG_CACHEFILES_ONDEMAND
> +extern ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
> +					       char __user *_buffer,
> +					       size_t buflen);
> +
> +extern int cachefiles_ondemand_cinit(struct cachefiles_cache *cache,
> +				     char *args);
> +
> +extern int cachefiles_ondemand_init_object(struct cachefiles_object *object);
> +
> +#else

> +ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
> +					char __user *_buffer, size_t buflen)

Needs to be declared as static inline ...

> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int cachefiles_ondemand_init_object(struct cachefiles_object *object)
> +{
> +	return 0;
> +}
> +#endif


-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

