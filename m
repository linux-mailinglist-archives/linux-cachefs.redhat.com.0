Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 27F222D3864
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Dec 2020 02:48:32 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-QyJ1H9sAMH6ikGlYMzNRrA-1; Tue, 08 Dec 2020 20:48:29 -0500
X-MC-Unique: QyJ1H9sAMH6ikGlYMzNRrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D78510054FF;
	Wed,  9 Dec 2020 01:48:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF25713470;
	Wed,  9 Dec 2020 01:48:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7CF64BB7B;
	Wed,  9 Dec 2020 01:48:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B91mMKq010115 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 20:48:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 409171007A5E; Wed,  9 Dec 2020 01:48:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C719112C08B
	for <linux-cachefs@redhat.com>; Wed,  9 Dec 2020 01:48:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27484100FBC5
	for <linux-cachefs@redhat.com>; Wed,  9 Dec 2020 01:48:20 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-440-nMlC8S8fPYChAVNW8GCyBA-1; Tue, 08 Dec 2020 20:48:16 -0500
X-MC-Unique: nMlC8S8fPYChAVNW8GCyBA-1
Received: by mail-io1-f67.google.com with SMTP id 81so496704ioc.13;
	Tue, 08 Dec 2020 17:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lIdrxZcmnEf8fT9FhjlZhkJALNm4RIibbyZ6dc4FDbg=;
	b=mBM1k3he9L0BxaRjtRonMlj1cjtxD+UFq3h8ndzeJLLxFrLak76ZWgUkrB3UlmbhNU
	k5stKVahmArVltmFxzj4z5Tk0Dead3a0byIEOnFG3NRfCA2KSJ1iOCMnUsGR/DBYvMgO
	wAjuIA36uYNLkSsu+pp7mZfu2ljTxwoWzmhF8kcIK72PKXm4BKpnhuWrH+51iGOC5eSI
	Bl7NwTvxE278wKmaQ2O88Ri8gT2l+jLDnj0YAVnKKRpXCiGhT0Z8GGFmGWkoUV2iuSeU
	rCXbmp8d0G/cRhK9PCmi0y/CmwpTYqyOAvE8yXy3AMh516d+aeWJEAvl3eAR0en6Ccul
	OTgg==
X-Gm-Message-State: AOAM533v8rwl8Q5hF9HK53oHPT06Nwq/fqMk5a43CEZx14pv40/V0gWr
	w1WWm0ZV94+DVBHKita/GFTtsLUXceIbA8+jWW8=
X-Google-Smtp-Source: ABdhPJx4KGBCCqGmbInWVkmZVA0USU7cZFjsIYCbQIzJoPiEIGZnpg7Z5nrRQjx9tYLEkONtbdu6BgmwEgbCmTI3qYw=
X-Received: by 2002:a05:6602:2c8f:: with SMTP id
	i15mr180914iow.66.1607478495159; 
	Tue, 08 Dec 2020 17:48:15 -0800 (PST)
MIME-Version: 1.0
References: <20201208122824.16118-1-laoar.shao@gmail.com>
	<20201208122824.16118-4-laoar.shao@gmail.com>
	<20201208185946.GC1943235@magnolia>
In-Reply-To: <20201208185946.GC1943235@magnolia>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 9 Dec 2020 09:47:38 +0800
Message-ID: <CALOAHbB1uKmQ7ns08KW4zH1ikqD0GAY_Y7VySzmTY0=LTEPURA@mail.gmail.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
	Michal Hocko <mhocko@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Linux MM <linux-mm@kvack.org>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v11 3/4] xfs: refactor the usage around
	xfs_trans_context_{set, clear}
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

On Wed, Dec 9, 2020 at 2:59 AM Darrick J. Wong <darrick.wong@oracle.com> wrote:
>
> On Tue, Dec 08, 2020 at 08:28:23PM +0800, Yafang Shao wrote:
> > The xfs_trans context should be active after it is allocated, and
> > deactive when it is freed.
> >
> > So these two helpers are refactored as,
> > - xfs_trans_context_set()
> >   Used in xfs_trans_alloc()
> > - xfs_trans_context_clear()
> >   Used in xfs_trans_free()
> >
> > This patch is based on Darrick's work to fix the issue in xfs/141 in the
> > earlier version. [1]
> >
> > 1. https://lore.kernel.org/linux-xfs/20201104001649.GN7123@magnolia
> >
> > Cc: Darrick J. Wong <darrick.wong@oracle.com>
> > Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Dave Chinner <david@fromorbit.com>
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > ---
> >  fs/xfs/xfs_trans.c | 20 +++++++-------------
> >  1 file changed, 7 insertions(+), 13 deletions(-)
> >
> > diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
> > index 11d390f0d3f2..fe20398a214e 100644
> > --- a/fs/xfs/xfs_trans.c
> > +++ b/fs/xfs/xfs_trans.c
> > @@ -67,6 +67,9 @@ xfs_trans_free(
> >       xfs_extent_busy_sort(&tp->t_busy);
> >       xfs_extent_busy_clear(tp->t_mountp, &tp->t_busy, false);
> >
> > +     /* Detach the transaction from this thread. */
> > +     xfs_trans_context_clear(tp);
>
> Don't you need to check if tp is still the current transaction before
> you clear PF_MEMALLOC_NOFS, now that the NOFS is bound to the lifespan
> of the transaction itself instead of the reservation?
>

The current->journal_info is always the same with tp here in my verification.
I don't know in which case they are different. It would be better if
you could explain in detail.
Anyway I can add the check with your comment in the next version.


>
> > +
> >       trace_xfs_trans_free(tp, _RET_IP_);
> >       if (!(tp->t_flags & XFS_TRANS_NO_WRITECOUNT))
> >               sb_end_intwrite(tp->t_mountp->m_super);
> > @@ -153,9 +156,6 @@ xfs_trans_reserve(
> >       int                     error = 0;
> >       bool                    rsvd = (tp->t_flags & XFS_TRANS_RESERVE) != 0;
> >
> > -     /* Mark this thread as being in a transaction */
> > -     xfs_trans_context_set(tp);
> > -
> >       /*
> >        * Attempt to reserve the needed disk blocks by decrementing
> >        * the number needed from the number available.  This will
> > @@ -163,10 +163,9 @@ xfs_trans_reserve(
> >        */
> >       if (blocks > 0) {
> >               error = xfs_mod_fdblocks(mp, -((int64_t)blocks), rsvd);
> > -             if (error != 0) {
> > -                     xfs_trans_context_clear(tp);
> > +             if (error != 0)
> >                       return -ENOSPC;
> > -             }
> > +
> >               tp->t_blk_res += blocks;
> >       }
> >
> > @@ -241,8 +240,6 @@ xfs_trans_reserve(
> >               tp->t_blk_res = 0;
> >       }
> >
> > -     xfs_trans_context_clear(tp);
> > -
> >       return error;
> >  }
> >
> > @@ -284,6 +281,8 @@ xfs_trans_alloc(
> >       INIT_LIST_HEAD(&tp->t_dfops);
> >       tp->t_firstblock = NULLFSBLOCK;
> >
> > +     /* Mark this thread as being in a transaction */
> > +     xfs_trans_context_set(tp);
> >       error = xfs_trans_reserve(tp, resp, blocks, rtextents);
> >       if (error) {
> >               xfs_trans_cancel(tp);
> > @@ -878,7 +877,6 @@ __xfs_trans_commit(
> >
> >       xfs_log_commit_cil(mp, tp, &commit_lsn, regrant);
> >
> > -     xfs_trans_context_clear(tp);
> >       xfs_trans_free(tp);
> >
> >       /*
> > @@ -911,7 +909,6 @@ __xfs_trans_commit(
> >               tp->t_ticket = NULL;
> >       }
> >
> > -     xfs_trans_context_clear(tp);
> >       xfs_trans_free_items(tp, !!error);
> >       xfs_trans_free(tp);
> >
> > @@ -971,9 +968,6 @@ xfs_trans_cancel(
> >               tp->t_ticket = NULL;
> >       }
> >
> > -     /* mark this thread as no longer being in a transaction */
> > -     xfs_trans_context_clear(tp);
> > -
> >       xfs_trans_free_items(tp, dirty);
> >       xfs_trans_free(tp);
> >  }
> > --
> > 2.18.4
> >



-- 
Thanks
Yafang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

