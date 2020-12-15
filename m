Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE1C2DA500
	for <lists+linux-cachefs@lfdr.de>; Tue, 15 Dec 2020 01:43:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-6jIoH5ZaOxyrYEF5KYkhFQ-1; Mon, 14 Dec 2020 19:43:03 -0500
X-MC-Unique: 6jIoH5ZaOxyrYEF5KYkhFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C199D107ACE3;
	Tue, 15 Dec 2020 00:42:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69F9F709B8;
	Tue, 15 Dec 2020 00:42:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88D2E180954D;
	Tue, 15 Dec 2020 00:42:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BF0gpEs018296 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 19:42:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 320ED2166B2D; Tue, 15 Dec 2020 00:42:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D7802166B2B
	for <linux-cachefs@redhat.com>; Tue, 15 Dec 2020 00:42:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBC278007DF
	for <linux-cachefs@redhat.com>; Tue, 15 Dec 2020 00:42:48 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-550-iU_Kh4Y4OBm2E5cNRelk0g-1; Mon, 14 Dec 2020 19:42:46 -0500
X-MC-Unique: iU_Kh4Y4OBm2E5cNRelk0g-1
Received: by mail-il1-f195.google.com with SMTP id k8so17635559ilr.4;
	Mon, 14 Dec 2020 16:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AQ8sWYcc6++GKAUXS48FF0Tzgm+rRka2SqEuWOPEWKY=;
	b=sfgkUHeyiSfYX8WcxFKzzrGYfkmb0SxoP2hat8uPcIt+bGSGQ54vUGWefcEYaRARg1
	AJSvxToay+GWnmnDcbU1dEO7aTRqbE76kALS9oFP5G9eMKKBp1HQvxtovCURuSOBiOJL
	fKpQfV7LZlauaGler2DfcUZ7eG4WnS+T1z2i4Lm0QY8re+vidbt49YLolGrRBlQPhyOm
	KEfVwAnmS05wsI7VOZmtYhkbOIvuU6d/sqUN02QAWxoJVrbecSSbHrVnEoQvIrnx3fMf
	Hf1uSmtaQBJj9F+ApR2fj2vFrHs9J0Sg/Bn+pPkVng2hKqhurlonixCkiEXkghWjVD6t
	b0wg==
X-Gm-Message-State: AOAM530hoRzQKBuhDFpbjuc97wDCGgAVLqCeeuTZ7YnJSQEbjG+g2Z7Z
	9o+ciXyqedTzgeV0jVUzz1G90/thuiejR5Gn8LE=
X-Google-Smtp-Source: ABdhPJzEyU9JNu0fnNhUilOe+9j6k4b6rE292AN0DfQ1OORKBk0RqCWZOtCSN7nTK5XdJ0tiHr7sd+RqSKkpVM+935M=
X-Received: by 2002:a05:6e02:68f:: with SMTP id
	o15mr39228993ils.93.1607992965458; 
	Mon, 14 Dec 2020 16:42:45 -0800 (PST)
MIME-Version: 1.0
References: <20201209131146.67289-1-laoar.shao@gmail.com>
	<20201209131146.67289-4-laoar.shao@gmail.com>
	<20201209195235.GN1943235@magnolia>
	<CALOAHbD_DK9w=s9RDsVBNaYwgeRi4UUEGDHFb3zEsqh_V8gLMA@mail.gmail.com>
	<20201214210833.GE632069@dread.disaster.area>
In-Reply-To: <20201214210833.GE632069@dread.disaster.area>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 15 Dec 2020 08:42:08 +0800
Message-ID: <CALOAHbAK=OB1NQKwNYHttBuM=QZjc04cjU=YRw5MoTWT34HXvg@mail.gmail.com>
To: Dave Chinner <david@fromorbit.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>,
	Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 15, 2020 at 5:08 AM Dave Chinner <david@fromorbit.com> wrote:
>
> On Sun, Dec 13, 2020 at 05:09:02PM +0800, Yafang Shao wrote:
> > On Thu, Dec 10, 2020 at 3:52 AM Darrick J. Wong <darrick.wong@oracle.com> wrote:
> > >
> > > On Wed, Dec 09, 2020 at 09:11:45PM +0800, Yafang Shao wrote:
> > > > The xfs_trans context should be active after it is allocated, and
> > > > deactive when it is freed.
> > > >
> > > > So these two helpers are refactored as,
> > > > - xfs_trans_context_set()
> > > >   Used in xfs_trans_alloc()
> > > > - xfs_trans_context_clear()
> > > >   Used in xfs_trans_free()
> > > >
> > > > This patch is based on Darrick's work to fix the issue in xfs/141 in the
> > > > earlier version. [1]
> > > >
> > > > 1. https://lore.kernel.org/linux-xfs/20201104001649.GN7123@magnolia
> > > >
> > > > Cc: Darrick J. Wong <darrick.wong@oracle.com>
> > > > Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> > > > Cc: Christoph Hellwig <hch@lst.de>
> > > > Cc: Dave Chinner <david@fromorbit.com>
> > > > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > > > ---
> > > >  fs/xfs/xfs_trans.c | 28 +++++++++++++++-------------
> > > >  1 file changed, 15 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
> > > > index 11d390f0d3f2..4f4645329bb2 100644
> > > > --- a/fs/xfs/xfs_trans.c
> > > > +++ b/fs/xfs/xfs_trans.c
> > > > @@ -67,6 +67,17 @@ xfs_trans_free(
> > > >       xfs_extent_busy_sort(&tp->t_busy);
> > > >       xfs_extent_busy_clear(tp->t_mountp, &tp->t_busy, false);
> > > >
> > > > +
> > > > +     /* Detach the transaction from this thread. */
> > > > +     ASSERT(current->journal_info != NULL);
> > > > +     /*
> > > > +      * The PF_MEMALLOC_NOFS is bound to the transaction itself instead
> > > > +      * of the reservation, so we need to check if tp is still the
> > > > +      * current transaction before clearing the flag.
> > > > +      */
> > > > +     if (current->journal_info == tp)
> > >
> > > Um, you don't start setting journal_info until the next patch, so this
> > > means that someone who lands on this commit with git bisect will have a
> > > xfs with broken logic.
> > >
> > > Because this is the patch that changes where we set and restore NOFS
> > > context, I think you have to introduce xfs_trans_context_swap here,
> > > and not in the next patch.
> > >
> >
> > Thanks for the review. I will change it in the next version.
> >
> > > I also think the _swap routine has to move the old NOFS state to the
> > > new transaction's t_pflags,
> >
> > Sure
> >
> > > and then set NOFS in the old transaction's
> > > t_pflags so that when we clear the context on the old transaction we
> > > don't actually change the thread's NOFS state.
> > >
> >
> > Both thread's NOFS state and thead's journal_info state can't be
> > changed in that case, right ?
> > So should it better be,
> >
> >     __xfs_trans_commit(tp, regrant)
> >         xfs_trans_free(tp, regrant)
> >             if (!regrant). // don't clear the xfs_trans_context if
> > regrant is true.
> >                 xfs_trans_context_clear()
>
> No. You are trying to make this way more complex than it needs to be.
> The logic in the core XFS code is *already correct* and all we need
> to do is move that logic to wrapper functions, then slightly modify
> the implementation inside the wrapper functions.
>

Thanks for the explanation.

>
> That is, xfs_trans_context_clear() should end up like this:
>

Agreed.

> static inline void
> xfs_trans_context_clear(struct xfs_trans *tp)
> {
>         /*
>          * If xfs_trans_context_swap() handed the NOFS context to a
>          * new transaction we do not clear the context here.
>          */
>         if (current->journal_info != tp)

current->journal_info hasn't been used in patch #3, that will make
patch #3 a little more complex.
We have to do some workaround in patch #3. I will think about it.

>                 return;
>         current->journal_info = NULL;
>         memalloc_nofs_restore(tp->t_pflags);
> }
>
> -Dave.
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

