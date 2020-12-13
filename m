Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 046672D8C79
	for <lists+linux-cachefs@lfdr.de>; Sun, 13 Dec 2020 10:10:02 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-_h9XxjyNPTmlBnpSDE9YWA-1; Sun, 13 Dec 2020 04:10:00 -0500
X-MC-Unique: _h9XxjyNPTmlBnpSDE9YWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CA14801817;
	Sun, 13 Dec 2020 09:09:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 495045D9C2;
	Sun, 13 Dec 2020 09:09:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35E1318095C9;
	Sun, 13 Dec 2020 09:09:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BD99ksG017872 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 13 Dec 2020 04:09:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EFB545EDC0; Sun, 13 Dec 2020 09:09:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA3435D22C
	for <linux-cachefs@redhat.com>; Sun, 13 Dec 2020 09:09:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C626D185A794
	for <linux-cachefs@redhat.com>; Sun, 13 Dec 2020 09:09:43 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-231-_m4UpfzIPQyvx9Y1w18iRg-1; Sun, 13 Dec 2020 04:09:39 -0500
X-MC-Unique: _m4UpfzIPQyvx9Y1w18iRg-1
Received: by mail-il1-f195.google.com with SMTP id v3so13000653ilo.5;
	Sun, 13 Dec 2020 01:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D7GTvYEsVIVwjvV23D7RG5wUssdQLZojxIkxkNlOkWI=;
	b=f1iODXXLqROPdmKCUtaKOfac/FNqgHg78OC7d5ck2YQq49njoL7ivnqSZ53BBZVuUc
	LpYGty/7cxVBnn3qxWJhcvF/b7Vg2uPoIKPItgJ0XVAzbPN6VLRtn38CVpantFMD3eFK
	d5gO9YTYDT1c+vOgeDrcp0GktTHxFxUnSiDnv74vk3jSomvWKV9P9LU6iEoHSyZCIcot
	5hIefCusqJG3/3xdP1D90Xk78ef6OLeW4PWFNmoV4qbBX0YjCYTyR4v7dCaoydsTg+kO
	getEAxdyo4b5Wmzngl3gs68NA4z61zogs9hTXzpDlSJombI/hEVppyH+KfE/7sOccqOI
	caGQ==
X-Gm-Message-State: AOAM531HAVZVeRZm1MbcWOMq9CewFlds9hLeeuqhyxKuPPQkcgdzXBsw
	LvxLaZDou5msgeqMTHCRy6zDL5nsTlJAZLW2WfUOW/vHXSdqqQ==
X-Google-Smtp-Source: ABdhPJxSjfFeaIvKMeUtKyBFgh0BXATRF6yhOG6j7VgiMcuP7Alm48/FakLeqW9J+sdvHIt3tJBWychg6p4AMtF5CBw=
X-Received: by 2002:a05:6e02:68f:: with SMTP id
	o15mr27943384ils.93.1607850578855; 
	Sun, 13 Dec 2020 01:09:38 -0800 (PST)
MIME-Version: 1.0
References: <20201209131146.67289-1-laoar.shao@gmail.com>
	<20201209131146.67289-4-laoar.shao@gmail.com>
	<20201209195235.GN1943235@magnolia>
In-Reply-To: <20201209195235.GN1943235@magnolia>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 13 Dec 2020 17:09:02 +0800
Message-ID: <CALOAHbD_DK9w=s9RDsVBNaYwgeRi4UUEGDHFb3zEsqh_V8gLMA@mail.gmail.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
	Michal Hocko <mhocko@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Linux MM <linux-mm@kvack.org>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v12 3/4] xfs: refactor the usage around
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 10, 2020 at 3:52 AM Darrick J. Wong <darrick.wong@oracle.com> wrote:
>
> On Wed, Dec 09, 2020 at 09:11:45PM +0800, Yafang Shao wrote:
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
> >  fs/xfs/xfs_trans.c | 28 +++++++++++++++-------------
> >  1 file changed, 15 insertions(+), 13 deletions(-)
> >
> > diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
> > index 11d390f0d3f2..4f4645329bb2 100644
> > --- a/fs/xfs/xfs_trans.c
> > +++ b/fs/xfs/xfs_trans.c
> > @@ -67,6 +67,17 @@ xfs_trans_free(
> >       xfs_extent_busy_sort(&tp->t_busy);
> >       xfs_extent_busy_clear(tp->t_mountp, &tp->t_busy, false);
> >
> > +
> > +     /* Detach the transaction from this thread. */
> > +     ASSERT(current->journal_info != NULL);
> > +     /*
> > +      * The PF_MEMALLOC_NOFS is bound to the transaction itself instead
> > +      * of the reservation, so we need to check if tp is still the
> > +      * current transaction before clearing the flag.
> > +      */
> > +     if (current->journal_info == tp)
>
> Um, you don't start setting journal_info until the next patch, so this
> means that someone who lands on this commit with git bisect will have a
> xfs with broken logic.
>
> Because this is the patch that changes where we set and restore NOFS
> context, I think you have to introduce xfs_trans_context_swap here,
> and not in the next patch.
>

Thanks for the review. I will change it in the next version.

> I also think the _swap routine has to move the old NOFS state to the
> new transaction's t_pflags,

Sure

> and then set NOFS in the old transaction's
> t_pflags so that when we clear the context on the old transaction we
> don't actually change the thread's NOFS state.
>

Both thread's NOFS state and thead's journal_info state can't be
changed in that case, right ?
So should it better be,

    __xfs_trans_commit(tp, regrant)
        xfs_trans_free(tp, regrant)
            if (!regrant). // don't clear the xfs_trans_context if
regrant is true.
                xfs_trans_context_clear()



> --D
>
> > +             xfs_trans_context_clear(tp);
> > +
> >       trace_xfs_trans_free(tp, _RET_IP_);
> >       if (!(tp->t_flags & XFS_TRANS_NO_WRITECOUNT))
> >               sb_end_intwrite(tp->t_mountp->m_super);
> > @@ -153,9 +164,6 @@ xfs_trans_reserve(
> >       int                     error = 0;
> >       bool                    rsvd = (tp->t_flags & XFS_TRANS_RESERVE) != 0;
> >
> > -     /* Mark this thread as being in a transaction */
> > -     xfs_trans_context_set(tp);
> > -
> >       /*
> >        * Attempt to reserve the needed disk blocks by decrementing
> >        * the number needed from the number available.  This will
> > @@ -163,10 +171,9 @@ xfs_trans_reserve(
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
> > @@ -241,8 +248,6 @@ xfs_trans_reserve(
> >               tp->t_blk_res = 0;
> >       }
> >
> > -     xfs_trans_context_clear(tp);
> > -
> >       return error;
> >  }
> >
> > @@ -284,6 +289,8 @@ xfs_trans_alloc(
> >       INIT_LIST_HEAD(&tp->t_dfops);
> >       tp->t_firstblock = NULLFSBLOCK;
> >
> > +     /* Mark this thread as being in a transaction */
> > +     xfs_trans_context_set(tp);
> >       error = xfs_trans_reserve(tp, resp, blocks, rtextents);
> >       if (error) {
> >               xfs_trans_cancel(tp);
> > @@ -878,7 +885,6 @@ __xfs_trans_commit(
> >
> >       xfs_log_commit_cil(mp, tp, &commit_lsn, regrant);
> >
> > -     xfs_trans_context_clear(tp);
> >       xfs_trans_free(tp);
> >
> >       /*
> > @@ -911,7 +917,6 @@ __xfs_trans_commit(
> >               tp->t_ticket = NULL;
> >       }
> >
> > -     xfs_trans_context_clear(tp);
> >       xfs_trans_free_items(tp, !!error);
> >       xfs_trans_free(tp);
> >
> > @@ -971,9 +976,6 @@ xfs_trans_cancel(
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

