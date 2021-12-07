Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7465B46BCCA
	for <lists+linux-cachefs@lfdr.de>; Tue,  7 Dec 2021 14:43:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-mUM8bIG5OaeOkwm8L0Vh9Q-1; Tue, 07 Dec 2021 08:43:00 -0500
X-MC-Unique: mUM8bIG5OaeOkwm8L0Vh9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08CE1102CB37;
	Tue,  7 Dec 2021 13:42:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E970A45D63;
	Tue,  7 Dec 2021 13:42:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D320D1809CB9;
	Tue,  7 Dec 2021 13:42:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B727v8p021805 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 6 Dec 2021 21:07:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DBAAC492C3B; Tue,  7 Dec 2021 02:07:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D72D4492C38
	for <linux-cachefs@redhat.com>; Tue,  7 Dec 2021 02:07:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDACD85A5AA
	for <linux-cachefs@redhat.com>; Tue,  7 Dec 2021 02:07:57 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-16-_mSBbVKDPkSox31Nyt01zA-1; Mon, 06 Dec 2021 21:07:54 -0500
X-MC-Unique: _mSBbVKDPkSox31Nyt01zA-1
Received: by mail-qk1-f174.google.com with SMTP id d2so13183812qki.12;
	Mon, 06 Dec 2021 18:07:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3E3HUdI+eXkJ2DLGNVHT3aFUXd0oRXFnf4vYNBfb/7s=;
	b=GBePWAcHbXdOqIjBP1cfebKd/xcVcUQs/TvUhee1CLFQdUvo8Ml82hMpwafpuMO8g4
	QgUzKxuJkY34fpJTK76bnDQV+b1fUKyr3hrfJsHtXinVmrKlWpVlQ1BYvHx5kGRPilOs
	UWy5AVsIOIZ1jtqjcu5If1tOylrxd7Ouic8UUF/KMKd4gkf84qAksJ8ce/UY0kAwFHCz
	HTrYL0UAvolDgFWSexS5uwzQTtBMq7xKokg04/MJun49lGK8veaPoeLlW40Wf7Mb7nJD
	uirFVAzuqv90nbvS1rsUmuufwhBaaoUJT/scAb39Tr02TWcQqLG+nm0XNxabhOgTSZbn
	hrqA==
X-Gm-Message-State: AOAM530WuSjWZSJPbWdzbd+hw4OkSqmRoxIt1YJPsWtLhWWKRZe8vHw3
	d3cX78i6lgVRTtTd/Fm+SmVvttRP5yi1LeavJ9AaVCZ/FabB6A==
X-Google-Smtp-Source: ABdhPJyGZ1bIQPiE34mfKYdkDQyZmrkn/MwXL/bBP+fIXydIUNUUerJ1PnqtJGfXgs9FZi2JwwlcjAst7cN98GjrmG8=
X-Received: by 2002:a05:620a:752:: with SMTP id
	i18mr37590574qki.453.1638842873721; 
	Mon, 06 Dec 2021 18:07:53 -0800 (PST)
MIME-Version: 1.0
References: <1638760762-27239-1-git-send-email-huangzhaoyang@gmail.com>
	<20211206172340.fded3873aed7e853b54ab276@linux-foundation.org>
In-Reply-To: <20211206172340.fded3873aed7e853b54ab276@linux-foundation.org>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Tue, 7 Dec 2021 10:07:33 +0800
Message-ID: <CAGWkznGP1_Ycin+KRsY44XesFDuvZA9rCFnc6pd9VJf-AMj9Eg@mail.gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 07 Dec 2021 08:41:58 -0500
Cc: "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
	linux-cachefs@redhat.com, LKML <linux-kernel@vger.kernel.org>,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>
Subject: Re: [Linux-cachefs] [PATCH] mm: mask DIRECT_RECLAIM in kswapd
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 7, 2021 at 9:23 AM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Mon,  6 Dec 2021 11:19:22 +0800 Huangzhaoyang <huangzhaoyang@gmail.com> wrote:
>
> > From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> >
> > As the eg bellowing, using GFP_KERNEL could confuse the registered .releasepage
> > or .shrinker functions when called in kswapd and have them acting wrongly.Mask
> > __GFP_DIRECT_RECLAIM in kswapd.
> >
> > eg,
> > kswapd
> >   shrink_page_list
> >     try_to_release_page
> >       __fscache_maybe_release_page
> >       ...
> >          if (!(gfp & __GFP_DIRECT_RECLAIM) || !(gfp & __GFP_FS)) {
> >                  fscache_stat(&fscache_n_store_vmscan_busy);
> >                  return false;
> >          }
>
> Well, we have thus far been permitting kswapd's memory allocations to
> enter direct reclaim.  Forbidding that kernel-wide might be the right
> thing to do, or might not be.  But disabling it kernel-wide because of
> a peculiar hack in fscache is not good justification.
By checking the whole path of kswapd reclaiming, I don't find any
steps need __GFP_DIRECT_RECLAIM but the hooked slab shrinker and fs's
releasepage functions. It doesn't make sense for kswapd be aware of
there is a concurrent direct reclaim.

>
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -4083,7 +4083,7 @@ static int balance_pgdat(pg_data_t *pgdat, int order, int highest_zoneidx)
> >       bool boosted;
> >       struct zone *zone;
> >       struct scan_control sc = {
> > -             .gfp_mask = GFP_KERNEL,
> > +             .gfp_mask = GFP_KERNEL & ~__GFP_DIRECT_RECLAIM,
> >               .order = order,
> >               .may_unmap = 1,
> >       };
>
> Maybe hack the hack like this?
>
> --- a/fs/fscache/page.c~a
> +++ a/fs/fscache/page.c
> @@ -126,8 +126,10 @@ page_busy:
>          * sleeping on memory allocation, so we may need to impose a timeout
>          * too. */
>         if (!(gfp & __GFP_DIRECT_RECLAIM) || !(gfp & __GFP_FS)) {
> -               fscache_stat(&fscache_n_store_vmscan_busy);
> -               return false;
> +               if (!current_is_kswapd()) {
> +                       fscache_stat(&fscache_n_store_vmscan_busy);
> +                       return false;
> +               }
>         }
>
>         fscache_stat(&fscache_n_store_vmscan_wait);
This method works. However, there are several other hook functions as
below using this flag for judging the context. IMHO,
__GFP_DIRECT_RECLAIM just only takes affection for two points. Have
page_alloc_slow_path judging if enter direct_reclaim and the reclaimer
tell the context.

eg.
 xfs_qm_shrink_scan(
...
        if ((sc->gfp_mask & (__GFP_FS|__GFP_DIRECT_RECLAIM)) !=
(__GFP_FS|__GFP_DIRECT_RECLAIM))
                 return 0;

 static int ceph_releasepage(struct page *page, gfp_t gfp)
...
          if (PageFsCache(page)) {
                  if (!(gfp & __GFP_DIRECT_RECLAIM) || !(gfp & __GFP_FS))
                          return 0;

static int afs_releasepage(struct page *page, gfp_t gfp_flags)
...
         if (PageFsCache(page)) {
                 if (!(gfp_flags & __GFP_DIRECT_RECLAIM) ||
!(gfp_flags & __GFP_FS))
                         return false;


> _
>
> But please, do cc the fscache mailing list and maintainer when mucking
> with these things.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

