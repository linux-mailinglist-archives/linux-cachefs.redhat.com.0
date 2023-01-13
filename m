Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9A4669C85
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Jan 2023 16:35:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673624152;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XHnDJGI+90HTZG+gdHXWjMe9k4dmBuOFki4UIMm1hR4=;
	b=SL3Xw62CZ4U9/3eguekeVaTRjn2tcXDrVZRv4oVIhBFg6S+pnetCScRnR6YrMvZN0BAEEg
	nRtzh0sx33NGQBwNzQJrRoObWYkZ5mj/Z6hyrC1qENpD9SIDblIPGJUUVXV7c9k9sD8DYS
	KKI3uHzyXNSq+/5t/n6S/Vo2xu6DkCc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-fB9tN31kNRuOhBp-UyFwwQ-1; Fri, 13 Jan 2023 10:35:48 -0500
X-MC-Unique: fB9tN31kNRuOhBp-UyFwwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 994B12A5956B;
	Fri, 13 Jan 2023 15:35:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BD691121314;
	Fri, 13 Jan 2023 15:35:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BA2DA1947060;
	Fri, 13 Jan 2023 15:35:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 97AB61946A78 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Jan 2023 15:35:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 89B622166B29; Fri, 13 Jan 2023 15:35:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 831862166B26
 for <linux-cachefs@redhat.com>; Fri, 13 Jan 2023 15:35:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F57D3814958
 for <linux-cachefs@redhat.com>; Fri, 13 Jan 2023 15:35:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-LF4ycvGNP1mKQ7F1D-4DEw-1; Fri, 13 Jan 2023 10:35:43 -0500
X-MC-Unique: LF4ycvGNP1mKQ7F1D-4DEw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9425620D6;
 Fri, 13 Jan 2023 15:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F489C433D2;
 Fri, 13 Jan 2023 15:28:02 +0000 (UTC)
Message-ID: <bc07b4d69f6c709988d2faca50717a402c1ed81e.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Hou Tao <houtao@huaweicloud.com>, linux-cachefs@redhat.com
Date: Fri, 13 Jan 2023 10:28:01 -0500
In-Reply-To: <20230113115211.2895845-3-houtao@huaweicloud.com>
References: <20230113115211.2895845-1-houtao@huaweicloud.com>
 <20230113115211.2895845-3-houtao@huaweicloud.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH v3 2/2] fscache: Use
 clear_and_wake_up_bit() in fscache_create_volume_work()
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
Cc: linux-kernel@vger.kernel.org, houtao1@huawei.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2023-01-13 at 19:52 +0800, Hou Tao wrote:
> From: Hou Tao <houtao1@huawei.com>
> 
> fscache_create_volume_work() uses wake_up_bit() to wake up the processes
> which are waiting for the completion of volume creation. According to
> comments in wake_up_bit() and waitqueue_active(), an extra smp_mb() is
> needed to guarantee the memory order between FSCACHE_VOLUME_CREATING
> flag and waitqueue_active() before invoking wake_up_bit().
> 
> Fixing it by using clear_and_wake_up_bit() to add the missing memory
> barrier.
> 
> Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> ---
>  fs/fscache/volume.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/fscache/volume.c b/fs/fscache/volume.c
> index 903af9d85f8b..cdf991bdd9de 100644
> --- a/fs/fscache/volume.c
> +++ b/fs/fscache/volume.c
> @@ -280,8 +280,7 @@ static void fscache_create_volume_work(struct work_struct *work)
>  	fscache_end_cache_access(volume->cache,
>  				 fscache_access_acquire_volume_end);
>  
> -	clear_bit_unlock(FSCACHE_VOLUME_CREATING, &volume->flags);
> -	wake_up_bit(&volume->flags, FSCACHE_VOLUME_CREATING);
> +	clear_and_wake_up_bit(FSCACHE_VOLUME_CREATING, &volume->flags);
>  	fscache_put_volume(volume, fscache_volume_put_create_work);
>  }
>  

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

