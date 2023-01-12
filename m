Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E3437666A57
	for <lists+linux-cachefs@lfdr.de>; Thu, 12 Jan 2023 05:34:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673498095;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hVypvW2Z8OGp0+NDUd7638xwpoMzWta+rVSlrVry+5I=;
	b=PSwtZ5cD8r3miK6MfKP+3+RLea4lFjfypzdVBnepaoYLCIPI6nZa8uJIxipMXKr6cuoolt
	9z7YKpwO2BbFQNwK5zXzt+VH7aKNe1frIBFmDOc3UDmNEIPdzs/PU1tHGoYrjYYDum1hMU
	hp9RT04zcx54CT2AdEeTeK9N6RBBxKI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-8PcgRUR7PwK9_Mt7cqwZDQ-1; Wed, 11 Jan 2023 23:34:52 -0500
X-MC-Unique: 8PcgRUR7PwK9_Mt7cqwZDQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2D88857F82;
	Thu, 12 Jan 2023 04:34:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8364D1121314;
	Thu, 12 Jan 2023 04:34:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E418A1946A7D;
	Thu, 12 Jan 2023 04:34:49 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 469591946A78 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 04:34:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E6E0A422FE; Thu, 12 Jan 2023 04:34:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE853422A9
 for <linux-cachefs@redhat.com>; Thu, 12 Jan 2023 04:34:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF24C183B3C7
 for <linux-cachefs@redhat.com>; Thu, 12 Jan 2023 04:34:47 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-505-1sRv2DkMNX2qKw0IH9QnKw-1; Wed, 11 Jan 2023 23:34:35 -0500
X-MC-Unique: 1sRv2DkMNX2qKw0IH9QnKw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VZPZhea_1673498070
Received: from 30.221.131.229(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VZPZhea_1673498070) by smtp.aliyun-inc.com;
 Thu, 12 Jan 2023 12:34:31 +0800
Message-ID: <8b0af045-25c1-9848-3c8c-de7da94d06da@linux.alibaba.com>
Date: Thu, 12 Jan 2023 12:34:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: Hou Tao <houtao@huaweicloud.com>, linux-cachefs@redhat.com
References: <20221226103309.953112-1-houtao@huaweicloud.com>
 <20221226103309.953112-3-houtao@huaweicloud.com>
From: Jingbo Xu <jefflexu@linux.alibaba.com>
In-Reply-To: <20221226103309.953112-3-houtao@huaweicloud.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH v2 2/2] fscache: Add the missing
 smp_mb__after_atomic() before wake_up_bit()
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
Cc: linux-erofs@lists.ozlabs.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, houtao1@huawei.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/26/22 6:33 PM, Hou Tao wrote:
> From: Hou Tao <houtao1@huawei.com>
> 
> fscache_create_volume_work() uses wake_up_bit() to wake up the processes
> which are waiting for the completion of volume creation. According to
> comments in wake_up_bit() and waitqueue_active(), an extra smp_mb() is
> needed to guarantee the memory order between FSCACHE_VOLUME_CREATING
> flag and waitqueue_active() before invoking wake_up_bit().
> 
> Considering clear_bit_unlock() before wake_up_bit() is an atomic
> operation, use smp_mb__after_atomic() instead of smp_mb() to provide
> such guarantee.
> 
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> ---
>  fs/fscache/volume.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/fs/fscache/volume.c b/fs/fscache/volume.c
> index fc3dd3bc851d..734d17f404e7 100644
> --- a/fs/fscache/volume.c
> +++ b/fs/fscache/volume.c
> @@ -281,6 +281,11 @@ static void fscache_create_volume_work(struct work_struct *work)
>  				 fscache_access_acquire_volume_end);
>  
>  	clear_bit_unlock(FSCACHE_VOLUME_CREATING, &volume->flags);
> +	/*
> +	 * Paired with barrier in wait_on_bit(). Check wake_up_bit() and
> +	 * waitqueue_active() for details.
> +	 */
> +	smp_mb__after_atomic();
>  	wake_up_bit(&volume->flags, FSCACHE_VOLUME_CREATING);
>  	fscache_put_volume(volume, fscache_volume_put_create_work);
>  }

LGTM.

Actually I'm thinking if clear_and_wake_up_bit() could be used here.
Ditto for patch 1.

-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

