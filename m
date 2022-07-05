Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4525671B0
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Jul 2022 16:59:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657033195;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4o5YcXk1FHkJtM57loWud9nvhlPKmN7k5YKmaVCEO7g=;
	b=Jmf9rzabSB6uBdxRA1qDfAAH5P1uF834eEu/s5TJcjIcv8IxxjqRJhp45YP/3RErEf9WC2
	KJItyokOCimYJuVpmL8721N1O3cigyRFJu8ESVA/XL2LRDOtxPg+CmuzHlkf/Jm7nZMYOp
	zsCOs1qvJGEydYeFD2ujZ6U3buRNgg4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-HVciwk8kNgu3AGq7rRoGjg-1; Tue, 05 Jul 2022 10:59:53 -0400
X-MC-Unique: HVciwk8kNgu3AGq7rRoGjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C25D5294EDCF;
	Tue,  5 Jul 2022 14:59:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E932A414A7E7;
	Tue,  5 Jul 2022 14:59:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9FFBB1947055;
	Tue,  5 Jul 2022 14:59:51 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7DE22194704A for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  5 Jul 2022 14:59:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5ABFE112131B; Tue,  5 Jul 2022 14:59:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56B051121315
 for <linux-cachefs@redhat.com>; Tue,  5 Jul 2022 14:59:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A74F1C01B3C
 for <linux-cachefs@redhat.com>; Tue,  5 Jul 2022 14:59:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-mvjOipB8OXq_dHtpeyjNZg-1; Tue, 05 Jul 2022 10:59:48 -0400
X-MC-Unique: mvjOipB8OXq_dHtpeyjNZg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74A5861A2A;
 Tue,  5 Jul 2022 14:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413FBC341C7;
 Tue,  5 Jul 2022 14:59:46 +0000 (UTC)
Message-ID: <243e8ec016b415d71849d8d5c92394ef67a8ca04.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Yue Hu <huyue2@coolpad.com>, dhowells@redhat.com, linux-cachefs@redhat.com
Date: Tue, 05 Jul 2022 10:59:45 -0400
In-Reply-To: <20220525023212.32642-1-huyue2@coolpad.com>
References: <20220525023212.32642-1-huyue2@coolpad.com>
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-05-25 at 10:32 +0800, Yue Hu wrote:
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
> @@ -182,7 +182,7 @@ static bool fscache_hash_volume(struct fscache_volume *candidate)
>  	hlist_bl_add_head(&candidate->hash_link, h);
>  	hlist_bl_unlock(h);
>  
> -	if (test_bit(FSCACHE_VOLUME_ACQUIRE_PENDING, &candidate->flags))
> +	if (fscache_is_acquire_pending(candidate))
>  		fscache_wait_on_volume_collision(candidate, collidee_debug_id);
>  	return true;
>  

Nice catch:

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

