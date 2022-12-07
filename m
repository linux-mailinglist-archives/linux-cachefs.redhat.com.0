Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 172F56456F2
	for <lists+linux-cachefs@lfdr.de>; Wed,  7 Dec 2022 10:58:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670407136;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ewegw8gz22Wa8MOAdNHBKhJAsiFey9tf8Gmv/h4gez0=;
	b=iaPTyhRj74ZJ1VNonpdwK19YOMTYBONJiG+vPua3kTNTYutGUlyRm4LuX4mNiH+2pmAJga
	YKOBaHgggfY0Wm1cYdDm3YQLQxY1FUvtrUdfDOMbwlWIcp7/5LUpe16h4GWt8blonC6Y/t
	EBTdjZ5X22/l5okKMG/8Y81GPln+Ask=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-NOuNJHOiP7SJaGvY8iI9LQ-1; Wed, 07 Dec 2022 04:58:53 -0500
X-MC-Unique: NOuNJHOiP7SJaGvY8iI9LQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BAE38027FE;
	Wed,  7 Dec 2022 09:58:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D5082166B26;
	Wed,  7 Dec 2022 09:58:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8CE9619465B5;
	Wed,  7 Dec 2022 09:58:51 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DC46919465B1 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  7 Dec 2022 09:58:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9C1A0C15BA5; Wed,  7 Dec 2022 09:58:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9540CC15BA4
 for <linux-cachefs@redhat.com>; Wed,  7 Dec 2022 09:58:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79CCC185A7A8
 for <linux-cachefs@redhat.com>; Wed,  7 Dec 2022 09:58:49 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-9bBjLbNOONWdbIojp_Bj8w-1; Wed, 07 Dec 2022 04:58:47 -0500
X-MC-Unique: 9bBjLbNOONWdbIojp_Bj8w-1
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-3c090251d59so180752397b3.4
 for <linux-cachefs@redhat.com>; Wed, 07 Dec 2022 01:58:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3IU7j/fGQw488nTr3UdYtHsBo8tWefZ/LoILwoUa3Eg=;
 b=566tr9c6wR8odDIOnNFNw+2rOxAYZ2zSuDEEVkY/wZghbGU2ZZjITcP1nTOIEOet1w
 X8HfrwZ8hShVioy09BAvvFV1OFxKEuinugjDiF6t9y0srQKjmHWY/TyVTTmmc6y1Ghcm
 cdgcUoyHkoANFgqSLbFvRpzmuRHSiR4hfgrRL7s2NbwtON8hsDLGA6kKcjGBGARFRNLc
 gmOxFDd5SzmViOMV91hYJMV8JadZia/AJEAFXBNEP9Op0QiJ/bwzmncFGI1w3wtysfZF
 VWm/POmAA+cWn/jYq63RUez7ZQqb6lK21OY0pQS4rmNiKFWDJgKD8WMQAqknB4Z1hNgw
 KV3g==
X-Gm-Message-State: ANoB5pk5Ay71+nGcN6/aOqPU9/crSnw5XDwAOd2k3eCb071P/cpTHS/v
 Q/gk4ZuZQ/dDvkpSTXH8uROlacxHxRcgIZar501izA==
X-Google-Smtp-Source: AA0mqf7qMpRk93JQT2/H1E8tobsiY/6Z8KxYAXhkxymLEUSVqHyGr/QSco7kNP9PSxRtb46LShntC5AWTQAO7sSF/hQ=
X-Received: by 2002:a81:f14:0:b0:3f1:f4b1:e197 with SMTP id
 20-20020a810f14000000b003f1f4b1e197mr9161371ywp.324.1670407126795; Wed, 07
 Dec 2022 01:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20221117142915.1366990-1-dwysocha@redhat.com>
In-Reply-To: <20221117142915.1366990-1-dwysocha@redhat.com>
From: Daire Byrne <daire@dneg.com>
Date: Wed, 7 Dec 2022 09:58:10 +0000
Message-ID: <CAPt2mGOYeJNbqzb8RD94BG0Y8HpHja_UCG6kifQR1kNuWyiMcg@mail.gmail.com>
To: Dave Wysochanski <dwysocha@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH v2] fscache: Fix oops due to race with
 cookie_lru and use_cookie
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com,
 Benjamin Maynard <benmaynard@google.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I have also now tested this v2 patch and can confirm that it also
fixes the race in fscache that we were reliably able to reproduce with
our (re-export) workloads..

Tested-by: Daire Byrne <daire@dneg.com>

Daire

On Thu, 17 Nov 2022 at 14:30, Dave Wysochanski <dwysocha@redhat.com> wrote:
>
> If a cookie expires from the LRU and the LRU_DISCARD flag is set,
> but the state machine has not run yet, it's possible another thread
> can call fscache_use_cookie and begin to use it.  When the
> cookie_worker finally runs, it will see the LRU_DISCARD flag set,
> transition the cookie->state to LRU_DISCARDING, which will then
> withdraw the cookie.  Once the cookie is withdrawn the object is
> removed the below oops will occur because the object associated
> with the cookie is now NULL.
>
> Fix the oops by clearing the LRU_DISCARD bit if another thread
> uses the cookie before the cookie_worker runs.
>
>   BUG: kernel NULL pointer dereference, address: 0000000000000008
>   ...
>   CPU: 31 PID: 44773 Comm: kworker/u130:1 Tainted: G     E    6.0.0-5.dneg.x86_64 #1
>   Hardware name: Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2022
>   Workqueue: events_unbound netfs_rreq_write_to_cache_work [netfs]
>   RIP: 0010:cachefiles_prepare_write+0x28/0x90 [cachefiles]
>   ...
>   Call Trace:
>    netfs_rreq_write_to_cache_work+0x11c/0x320 [netfs]
>    process_one_work+0x217/0x3e0
>    worker_thread+0x4a/0x3b0
>    ? process_one_work+0x3e0/0x3e0
>    kthread+0xd6/0x100
>    ? kthread_complete_and_exit+0x20/0x20
>    ret_from_fork+0x1f/0x30
>
> Fixes: 12bb21a29c19 ("fscache: Implement cookie user counting and resource pinning")
> Reported-by: Daire Byrne <daire.byrne@gmail.com>
> Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
> ---
>  fs/fscache/cookie.c            | 8 ++++++++
>  include/trace/events/fscache.h | 2 ++
>  2 files changed, 10 insertions(+)
>
> diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
> index 451d8a077e12..bce2492186d0 100644
> --- a/fs/fscache/cookie.c
> +++ b/fs/fscache/cookie.c
> @@ -605,6 +605,14 @@ void __fscache_use_cookie(struct fscache_cookie *cookie, bool will_modify)
>                         set_bit(FSCACHE_COOKIE_DO_PREP_TO_WRITE, &cookie->flags);
>                         queue = true;
>                 }
> +               /*
> +                * We could race with cookie_lru which may set LRU_DISCARD bit
> +                * but has yet to run the cookie state machine.  If this happens
> +                * and another thread tries to use the cookie, clear LRU_DISCARD
> +                * so we don't end up withdrawing the cookie while in use.
> +                */
> +               if (test_and_clear_bit(FSCACHE_COOKIE_DO_LRU_DISCARD, &cookie->flags))
> +                       fscache_see_cookie(cookie, fscache_cookie_see_lru_discard_clear);
>                 break;
>
>         case FSCACHE_COOKIE_STATE_FAILED:
> diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
> index c078c48a8e6d..a6190aa1b406 100644
> --- a/include/trace/events/fscache.h
> +++ b/include/trace/events/fscache.h
> @@ -66,6 +66,7 @@ enum fscache_cookie_trace {
>         fscache_cookie_put_work,
>         fscache_cookie_see_active,
>         fscache_cookie_see_lru_discard,
> +       fscache_cookie_see_lru_discard_clear,
>         fscache_cookie_see_lru_do_one,
>         fscache_cookie_see_relinquish,
>         fscache_cookie_see_withdraw,
> @@ -149,6 +150,7 @@ enum fscache_access_trace {
>         EM(fscache_cookie_put_work,             "PQ  work ")            \
>         EM(fscache_cookie_see_active,           "-   activ")            \
>         EM(fscache_cookie_see_lru_discard,      "-   x-lru")            \
> +       EM(fscache_cookie_see_lru_discard_clear,"-   lrudc")            \
>         EM(fscache_cookie_see_lru_do_one,       "-   lrudo")            \
>         EM(fscache_cookie_see_relinquish,       "-   x-rlq")            \
>         EM(fscache_cookie_see_withdraw,         "-   x-wth")            \
> --
> 2.31.1
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

