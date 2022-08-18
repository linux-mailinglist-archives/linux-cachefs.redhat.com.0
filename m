Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 946165980EF
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Aug 2022 11:38:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660815532;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9NhYneUyKIuilNL57vtSOv15lS1tItNHw12wvr3soJE=;
	b=Eq6Z9K6k/yUIyPGS7D/e5tsH8JhdRGzAWIrIdcNPWoMv/N33y2CDBqDWw4C1A/P+FuXW7q
	cFgrGI7yb240fkUg5eFYUjWKF4JzUc7dKBYR/wvNrZXF/WcpLQ5TJSEjUY+J4r8DeDkdRk
	WR3e3o+/Y0YyVFyh/WLC9YrpewNLbaM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-DVUqyOBXOjSVsfWBDPHCpg-1; Thu, 18 Aug 2022 05:38:49 -0400
X-MC-Unique: DVUqyOBXOjSVsfWBDPHCpg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4683F18A6523;
	Thu, 18 Aug 2022 09:38:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 96748945D2;
	Thu, 18 Aug 2022 09:38:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4E7D3194E11C;
	Thu, 18 Aug 2022 09:38:45 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1C8941946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 09:38:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 012552166B2B; Thu, 18 Aug 2022 09:38:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1A2A2166B2A
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 09:38:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2054A293248F
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 09:38:37 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-609-q1XvvItoOzaaNcwB-TH5AA-1; Thu, 18 Aug 2022 05:38:34 -0400
X-MC-Unique: q1XvvItoOzaaNcwB-TH5AA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VMaE0Lu_1660815129
Received: from 30.227.66.106(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VMaE0Lu_1660815129) by smtp.aliyun-inc.com;
 Thu, 18 Aug 2022 17:32:10 +0800
Message-ID: <16a13735-1349-9927-0f7b-1c5622198e2a@linux.alibaba.com>
Date: Thu, 18 Aug 2022 17:32:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
To: Khalid Masum <khalid.masum.92@gmail.com>, linux-cachefs@redhat.com,
 linux-kernel@vger.kernel.org
References: <20220818040738.12036-1-khalid.masum.92@gmail.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <20220818040738.12036-1-khalid.masum.92@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH v2] fscache: fix misdocumented parameter
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
Cc: Randy Dunlap <rdunlap@infradead.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 8/18/22 12:07 PM, Khalid Masum wrote:
> This patch fixes two warnings generated by make docs. The functions
> fscache_use_cookie and fscache_unuse_cookie, both have a parameter
> named cookie. But they are documented with the name "object" with
> unclear description. Which generates the warning when creating docs.
> 
> This commit will replace the currently misdocumented parameter names
> with the correct ones while adding proper descriptions.
> 
> CC: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>

LGTM.

Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>

> ---
> Changes since v1:
> - Update commit message.
> - Link: https://lore.kernel.org/lkml/20220521142446.4746-1-khalid.masum.92@gmail.com/
> 
>  include/linux/fscache.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/fscache.h b/include/linux/fscache.h
> index 720874e6ee94..36e5dd84cf59 100644
> --- a/include/linux/fscache.h
> +++ b/include/linux/fscache.h
> @@ -258,7 +258,7 @@ struct fscache_cookie *fscache_acquire_cookie(struct fscache_volume *volume,
>  
>  /**
>   * fscache_use_cookie - Request usage of cookie attached to an object
> - * @object: Object description
> + * @cookie: The cookie representing the cache object
>   * @will_modify: If cache is expected to be modified locally
>   *
>   * Request usage of the cookie attached to an object.  The caller should tell
> @@ -274,7 +274,7 @@ static inline void fscache_use_cookie(struct fscache_cookie *cookie,
>  
>  /**
>   * fscache_unuse_cookie - Cease usage of cookie attached to an object
> - * @object: Object description
> + * @cookie: The cookie representing the cache object
>   * @aux_data: Updated auxiliary data (or NULL)
>   * @object_size: Revised size of the object (or NULL)
>   *

-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

