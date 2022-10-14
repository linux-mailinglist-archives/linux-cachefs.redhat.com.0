Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E985FE8E1
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Oct 2022 08:31:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665729105;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LwaHD5DVvp/WVZJI6cp/pFPNyoACC/kooeZZAJNVJmM=;
	b=Fr1QLrzpX9eVwS9TXsOVh5YtLXJTc+dVcMupMgTRWKSZaUXWPuIREq56HOJGZWm9DpfAzu
	yERaw51V1yRzDzZe3strKBGC8JB8slwOGZMyFb8h04vhN5aWt9/oHxvuT979eTdw4Y4N1C
	wcFwfJay3GMocnVwdVM8dwv8xyRkZdI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-sUAcXSvuNv-XamSWthzT1g-1; Fri, 14 Oct 2022 02:31:43 -0400
X-MC-Unique: sUAcXSvuNv-XamSWthzT1g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18A4C8027EC;
	Fri, 14 Oct 2022 06:31:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B445856D19B;
	Fri, 14 Oct 2022 06:31:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0EF56194658F;
	Fri, 14 Oct 2022 06:31:40 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BAB9E1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 14 Oct 2022 06:31:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 84CC41111A42; Fri, 14 Oct 2022 06:31:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E0C91111A40
 for <linux-cachefs@redhat.com>; Fri, 14 Oct 2022 06:31:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A4271C068CD
 for <linux-cachefs@redhat.com>; Fri, 14 Oct 2022 06:31:38 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-446-22bnMhgcNum5c8rDj2EFYA-1; Fri, 14 Oct 2022 02:31:36 -0400
X-MC-Unique: 22bnMhgcNum5c8rDj2EFYA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R401e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VS6WuA7_1665729090
Received: from 30.221.130.30(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VS6WuA7_1665729090) by smtp.aliyun-inc.com;
 Fri, 14 Oct 2022 14:31:32 +0800
Message-ID: <5ca5d4bd-63b4-12e9-39cd-7580958980db@linux.alibaba.com>
Date: Fri, 14 Oct 2022 14:31:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
To: Jia Zhu <zhujia.zj@bytedance.com>, dhowells@redhat.com, xiang@kernel.org
References: <20221014030745.25748-1-zhujia.zj@bytedance.com>
 <20221014030745.25748-4-zhujia.zj@bytedance.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <20221014030745.25748-4-zhujia.zj@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH V2 3/5] cachefiles: resend an open
 request if the read request's object is closed
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 10/14/22 11:07 AM, Jia Zhu wrote:

> +/*
> + * Reopen the closed object with associated read request.

I think "Reopen the closed object if there's any inflight or subsequent
READ request on this object" would be better?

> + * Skip read requests whose related object are reopening.
					       ^
					      is ?


> @@ -277,14 +308,18 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
>  	xa_unlock(&cache->reqs);
>  
>  	id = xas.xa_index;
> -	msg->msg_id = id;
>  
>  	if (msg->opcode == CACHEFILES_OP_OPEN) {
>  		ret = cachefiles_ondemand_get_fd(req);
> -		if (ret)
> +		if (ret) {
> +			cachefiles_ondemand_set_object_close(req->object);
>  			goto error;
> +		}
>  	}
>  
> +	msg->msg_id = id;
> +	msg->object_id = req->object->private->ondemand_id;

Since currently msg->object_id is always assigned in
cachefiles_ondemand_daemon_read(), we can remove the assignment in
cachefiles_ondemand_get_fd().


Otherwise LGTM.

Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>

-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

