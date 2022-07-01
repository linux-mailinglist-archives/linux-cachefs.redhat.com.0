Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0318562F65
	for <lists+linux-cachefs@lfdr.de>; Fri,  1 Jul 2022 11:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656666221;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H9dj9KjTxX34tJLkW01FdxVusTWN+IRNUkZrgnD0we8=;
	b=hcxhWZ5x5M9v2HAdDxR5WwXXHUucoOhaniZeEgy3SzdJHGw0fT8UJhaJlwyRv6djG2gKco
	0W63Woi/2W7TipWRIn2tPvbK+ootSZAsIA37yRrGIFE4IWX9TpiaZp1+vl51GeWv7WzCgi
	usM6v5xHCzsQfv+Ck/Be1km3E8VdH84=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-nG8FvO24O-GePe8TUfLRDw-1; Fri, 01 Jul 2022 05:03:40 -0400
X-MC-Unique: nG8FvO24O-GePe8TUfLRDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C25D3C10145;
	Fri,  1 Jul 2022 09:03:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51CE3C08087;
	Fri,  1 Jul 2022 09:03:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1B7FF1947073;
	Fri,  1 Jul 2022 09:03:39 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2B93E1947058 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  1 Jul 2022 09:03:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 072F3C2810D; Fri,  1 Jul 2022 09:03:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02B27C08087
 for <linux-cachefs@redhat.com>; Fri,  1 Jul 2022 09:03:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DECAD811E87
 for <linux-cachefs@redhat.com>; Fri,  1 Jul 2022 09:03:36 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-KKiuR0jwPKuWgAchbgT68Q-1; Fri, 01 Jul 2022 05:03:34 -0400
X-MC-Unique: KKiuR0jwPKuWgAchbgT68Q-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VI0CmfV_1656666208
Received: from 30.225.24.48(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VI0CmfV_1656666208) by smtp.aliyun-inc.com;
 Fri, 01 Jul 2022 17:03:29 +0800
Message-ID: <d5cc413d-d32a-5612-fe7a-95b61892c363@linux.alibaba.com>
Date: Fri, 1 Jul 2022 17:03:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
To: Yue Hu <huyue2@coolpad.com>, dhowells@redhat.com, linux-cachefs@redhat.com
References: <20220525023212.32642-1-huyue2@coolpad.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <20220525023212.32642-1-huyue2@coolpad.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH] fscache: Fix if condition in
 fscache_wait_on_volume_collision()
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
Cc: zbestahu@gmail.com, linux-kernel@vger.kernel.org, zhangwen@coolpad.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 5/25/22 10:32 AM, Yue Hu wrote:
> After waiting for the volume to complete the acquisition with timeout,
> the if condition under which potential volume collision occurs should be
> acquire the volume is still pending rather than not pending so that we
> will continue to wait until the pending flag is cleared. Also, use the
> existing test pending wrapper directly instead of test_bit().
> 
> Signed-off-by: Yue Hu <huyue2@coolpad.com>
> ---
>  fs/fscache/volume.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/fscache/volume.c b/fs/fscache/volume.c
> index 71d3a6d6d72c..f2009cc22002 100644
> --- a/fs/fscache/volume.c
> +++ b/fs/fscache/volume.c
> @@ -143,7 +143,7 @@ static void fscache_wait_on_volume_collision(struct fscache_volume *candidate,
>  {
>  	wait_var_event_timeout(&candidate->flags,
>  			       !fscache_is_acquire_pending(candidate), 20 * HZ);
> -	if (!fscache_is_acquire_pending(candidate)) {
> +	if (fscache_is_acquire_pending(candidate)) {
>  		pr_notice("Potential volume collision new=%08x old=%08x",
>  			  candidate->debug_id, collidee_debug_id);
>  		fscache_stat(&fscache_n_volumes_collision);

Yeah, I also noticed that before.



> @@ -182,7 +182,7 @@ static bool fscache_hash_volume(struct fscache_volume *candidate)
>  	hlist_bl_add_head(&candidate->hash_link, h);
>  	hlist_bl_unlock(h);
>  
> -	if (test_bit(FSCACHE_VOLUME_ACQUIRE_PENDING, &candidate->flags))
> +	if (fscache_is_acquire_pending(candidate))
>  		fscache_wait_on_volume_collision(candidate, collidee_debug_id);
>  	return true;
>  

LGTM.

Reviewed-by: Jeffle Xu <jefflexu@linux.alibaba.com>

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

