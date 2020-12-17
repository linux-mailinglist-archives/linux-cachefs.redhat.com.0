Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9030F2DCBC1
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Dec 2020 05:47:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-boRKfa_WOzqjYyvl85W9IA-1; Wed, 16 Dec 2020 23:47:41 -0500
X-MC-Unique: boRKfa_WOzqjYyvl85W9IA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72B50801AC0;
	Thu, 17 Dec 2020 04:47:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73648704D9;
	Thu, 17 Dec 2020 04:47:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EEDF54BB7B;
	Thu, 17 Dec 2020 04:47:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BH4lTTB020057 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 16 Dec 2020 23:47:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CC4392026D12; Thu, 17 Dec 2020 04:47:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C64FC2026D48
	for <linux-cachefs@redhat.com>; Thu, 17 Dec 2020 04:47:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAF861854AF7
	for <linux-cachefs@redhat.com>; Thu, 17 Dec 2020 04:47:26 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-486-kUun00KROD2Ou3x-vq3QBQ-1; Wed, 16 Dec 2020 23:47:24 -0500
X-MC-Unique: kUun00KROD2Ou3x-vq3QBQ-1
Received: by mail-io1-f45.google.com with SMTP id 81so26211023ioc.13;
	Wed, 16 Dec 2020 20:47:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PRUMLTk7szvcs7E9rP3JJrNFOeJ7mkueV5pL+SzEkSM=;
	b=fNSKa7iQVwOY/AOITlOcC5BF3z5PIN0sH/DtdXlXeyiY4TzYOROh5xpHBHU7V0EAlX
	Kb+pmHqmaUedG/gMRYDpQ7WlEylBqcKOB3tI1Dr7KMnJWx+Zt6R+fGnwWYjiMnVhQ8FY
	LM1Hz3F3d14E4Yin4YFce86KCn+uody/wM2bJl1VEeKrvLH9Zd4AvpFmUImLstWkQyQj
	5Cpz6HRGVjsH9A5TWEPf2I0ChaWF4JjWxGVXOEG0patW56nmxoqFHyixZiIVYyJ9L3F1
	7uyGRMkN/G/KuqHQSnSfAX1dFEZYOEnJsqdP3rK5Mo+WDE4/kZG0vgqXigzCmXbAMm/B
	1vfQ==
X-Gm-Message-State: AOAM531C95jALK/TQqRZI9RxQJ37sgWMoW+7+WSOoV3+FSaiJpDfAXFY
	UbwnfC2s3ukUSGBHzvlhdSgT6UgoGWFAcOBAk2E=
X-Google-Smtp-Source: ABdhPJxBoUYfBARhqKQXlH0TMk7AC8ra43Si0SEHE3kCbFav1S1El7VPg2rN//ZysJPcc8ybj8p4DXerd58/pSgl2f0=
X-Received: by 2002:a05:6602:2157:: with SMTP id
	y23mr45264126ioy.202.1608180443614; 
	Wed, 16 Dec 2020 20:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20201217011157.92549-1-laoar.shao@gmail.com>
	<20201217011157.92549-2-laoar.shao@gmail.com>
	<20201217030609.GP632069@dread.disaster.area>
In-Reply-To: <20201217030609.GP632069@dread.disaster.area>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 17 Dec 2020 12:46:47 +0800
Message-ID: <CALOAHbBNbJ9z6YR20wff1Ei=SR6E-uNFRO8OHpRqg_emsD7few@mail.gmail.com>
To: Dave Chinner <david@fromorbit.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: Michal Hocko <mhocko@suse.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
	Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Linux MM <linux-mm@kvack.org>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v13 1/4] mm: Add become_kswapd and
	restore_kswapd
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
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

On Thu, Dec 17, 2020 at 11:06 AM Dave Chinner <david@fromorbit.com> wrote:
>
> On Thu, Dec 17, 2020 at 09:11:54AM +0800, Yafang Shao wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >
> > Since XFS needs to pretend to be kswapd in some of its worker threads,
> > create methods to save & restore kswapd state.  Don't bother restoring
> > kswapd state in kswapd -- the only time we reach this code is when we're
> > exiting and the task_struct is about to be destroyed anyway.
> >
> > Cc: Dave Chinner <david@fromorbit.com>
> > Acked-by: Michal Hocko <mhocko@suse.com>
> > Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > ---
> >  fs/xfs/libxfs/xfs_btree.c | 14 ++++++++------
> >  include/linux/sched/mm.h  | 23 +++++++++++++++++++++++
> >  mm/vmscan.c               | 16 +---------------
> >  3 files changed, 32 insertions(+), 21 deletions(-)
> >
> > diff --git a/fs/xfs/libxfs/xfs_btree.c b/fs/xfs/libxfs/xfs_btree.c
> > index 51dbff9b0908..0f35b7a38e76 100644
> > --- a/fs/xfs/libxfs/xfs_btree.c
> > +++ b/fs/xfs/libxfs/xfs_btree.c
> > @@ -2813,8 +2813,9 @@ xfs_btree_split_worker(
> >  {
> >       struct xfs_btree_split_args     *args = container_of(work,
> >                                               struct xfs_btree_split_args, work);
> > +     bool                    is_kswapd = args->kswapd;
> >       unsigned long           pflags;
> > -     unsigned long           new_pflags = PF_MEMALLOC_NOFS;
> > +     int                     memalloc_nofs;
> >
> >       /*
> >        * we are in a transaction context here, but may also be doing work
> > @@ -2822,16 +2823,17 @@ xfs_btree_split_worker(
> >        * temporarily to ensure that we don't block waiting for memory reclaim
> >        * in any way.
> >        */
> > -     if (args->kswapd)
> > -             new_pflags |= PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD;
> > -
> > -     current_set_flags_nested(&pflags, new_pflags);
> > +     if (is_kswapd)
> > +             pflags = become_kswapd();
> > +     memalloc_nofs = memalloc_nofs_save();
> >
> >       args->result = __xfs_btree_split(args->cur, args->level, args->ptrp,
> >                                        args->key, args->curp, args->stat);
> >       complete(args->done);
> >
> > -     current_restore_flags_nested(&pflags, new_pflags);
> > +     memalloc_nofs_restore(memalloc_nofs);
> > +     if (is_kswapd)
> > +             restore_kswapd(pflags);
> >  }
> >
> >  /*
> > diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> > index d5ece7a9a403..2faf03e79a1e 100644
> > --- a/include/linux/sched/mm.h
> > +++ b/include/linux/sched/mm.h
> > @@ -278,6 +278,29 @@ static inline void memalloc_nocma_restore(unsigned int flags)
> >  }
> >  #endif
> >
> > +/*
> > + * Tell the memory management code that this thread is working on behalf
> > + * of background memory reclaim (like kswapd).  That means that it will
> > + * get access to memory reserves should it need to allocate memory in
> > + * order to make forward progress.  With this great power comes great
> > + * responsibility to not exhaust those reserves.
> > + */
> > +#define KSWAPD_PF_FLAGS              (PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD)
> > +
> > +static inline unsigned long become_kswapd(void)
> > +{
> > +     unsigned long flags = current->flags & KSWAPD_PF_FLAGS;
> > +
> > +     current->flags |= KSWAPD_PF_FLAGS;
> > +
> > +     return flags;
> > +}
>
> You can get rid of the empty lines out of this function.
>
> > +static inline void restore_kswapd(unsigned long flags)
> > +{
> > +     current->flags &= ~(flags ^ KSWAPD_PF_FLAGS);
> > +}
>
> Urk, that requires thinking about to determine whether it is
> correct. And it is 3 runtime logic operations (^, ~ and &) too. The
> way all the memalloc_*_restore() functions restore the previous
> flags is obviously correct and only requires 2 runtime logic
> operations because the compiler calculates the ~ operation on the
> constant. So why do it differently here? i.e.:
>
>         current->flags = (current->flags & ~KSWAPD_PF_FLAGS) | flags;
>

I will change it as you suggested if Matthew doesn't have a different
opinion, Matthew ?


> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -3870,19 +3870,7 @@ static int kswapd(void *p)
> >       if (!cpumask_empty(cpumask))
> >               set_cpus_allowed_ptr(tsk, cpumask);
> >
> > -     /*
> > -      * Tell the memory management that we're a "memory allocator",
> > -      * and that if we need more memory we should get access to it
> > -      * regardless (see "__alloc_pages()"). "kswapd" should
> > -      * never get caught in the normal page freeing logic.
> > -      *
> > -      * (Kswapd normally doesn't need memory anyway, but sometimes
> > -      * you need a small amount of memory in order to be able to
> > -      * page out something else, and this flag essentially protects
> > -      * us from recursively trying to free more memory as we're
> > -      * trying to free the first piece of memory in the first place).
> > -      */
> > -     tsk->flags |= PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD;
> > +     become_kswapd();
> >       set_freezable();
> >
> >       WRITE_ONCE(pgdat->kswapd_order, 0);
> > @@ -3932,8 +3920,6 @@ static int kswapd(void *p)
> >                       goto kswapd_try_sleep;
> >       }
> >
> > -     tsk->flags &= ~(PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD);
> > -
>
> Missing a restore_kswapd()?
>
> Cheers,
>
> Dave.
> --
> Dave Chinner
> david@fromorbit.com



-- 
Thanks
Yafang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

