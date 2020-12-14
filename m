Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA6E2DA24E
	for <lists+linux-cachefs@lfdr.de>; Mon, 14 Dec 2020 22:09:00 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-hYi44bidMaamv8zVsU7wXw-1; Mon, 14 Dec 2020 16:08:57 -0500
X-MC-Unique: hYi44bidMaamv8zVsU7wXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84E3C192202E;
	Mon, 14 Dec 2020 21:08:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26F78722C8;
	Mon, 14 Dec 2020 21:08:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 326C14A7C6;
	Mon, 14 Dec 2020 21:08:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BEL8jLK026292 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 16:08:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7F6D42166B2B; Mon, 14 Dec 2020 21:08:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79F012166B2A
	for <linux-cachefs@redhat.com>; Mon, 14 Dec 2020 21:08:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B6C8101042B
	for <linux-cachefs@redhat.com>; Mon, 14 Dec 2020 21:08:42 +0000 (UTC)
Received: from mail109.syd.optusnet.com.au (mail109.syd.optusnet.com.au
	[211.29.132.80]) by relay.mimecast.com with ESMTP id
	us-mta-121-GvCSb3INO8GEhFtC1ea_lw-1; Mon, 14 Dec 2020 16:08:40 -0500
X-MC-Unique: GvCSb3INO8GEhFtC1ea_lw-1
Received: from dread.disaster.area (pa49-179-6-140.pa.nsw.optusnet.com.au
	[49.179.6.140])
	by mail109.syd.optusnet.com.au (Postfix) with ESMTPS id B9B5749952;
	Tue, 15 Dec 2020 08:08:33 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1kov57-003zjp-3R; Tue, 15 Dec 2020 08:08:33 +1100
Date: Tue, 15 Dec 2020 08:08:33 +1100
From: Dave Chinner <david@fromorbit.com>
To: Yafang Shao <laoar.shao@gmail.com>
Message-ID: <20201214210833.GE632069@dread.disaster.area>
References: <20201209131146.67289-1-laoar.shao@gmail.com>
	<20201209131146.67289-4-laoar.shao@gmail.com>
	<20201209195235.GN1943235@magnolia>
	<CALOAHbD_DK9w=s9RDsVBNaYwgeRi4UUEGDHFb3zEsqh_V8gLMA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALOAHbD_DK9w=s9RDsVBNaYwgeRi4UUEGDHFb3zEsqh_V8gLMA@mail.gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=Ubgvt5aN c=1 sm=1 tr=0 cx=a_idp_d
	a=uDU3YIYVKEaHT0eX+MXYOQ==:117 a=uDU3YIYVKEaHT0eX+MXYOQ==:17
	a=kj9zAlcOel0A:10 a=zTNgK-yGK50A:10 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8
	a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=pGLkceISAAAA:8
	a=rA-29Kngl8b7e2x1wjEA:9
	a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=1CNFftbPRP8L7MoqJWF3:22
	a=biEYGPWJfzWAr4FL6Ov7:22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 13, 2020 at 05:09:02PM +0800, Yafang Shao wrote:
> On Thu, Dec 10, 2020 at 3:52 AM Darrick J. Wong <darrick.wong@oracle.com> wrote:
> >
> > On Wed, Dec 09, 2020 at 09:11:45PM +0800, Yafang Shao wrote:
> > > The xfs_trans context should be active after it is allocated, and
> > > deactive when it is freed.
> > >
> > > So these two helpers are refactored as,
> > > - xfs_trans_context_set()
> > >   Used in xfs_trans_alloc()
> > > - xfs_trans_context_clear()
> > >   Used in xfs_trans_free()
> > >
> > > This patch is based on Darrick's work to fix the issue in xfs/141 in the
> > > earlier version. [1]
> > >
> > > 1. https://lore.kernel.org/linux-xfs/20201104001649.GN7123@magnolia
> > >
> > > Cc: Darrick J. Wong <darrick.wong@oracle.com>
> > > Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> > > Cc: Christoph Hellwig <hch@lst.de>
> > > Cc: Dave Chinner <david@fromorbit.com>
> > > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > > ---
> > >  fs/xfs/xfs_trans.c | 28 +++++++++++++++-------------
> > >  1 file changed, 15 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
> > > index 11d390f0d3f2..4f4645329bb2 100644
> > > --- a/fs/xfs/xfs_trans.c
> > > +++ b/fs/xfs/xfs_trans.c
> > > @@ -67,6 +67,17 @@ xfs_trans_free(
> > >       xfs_extent_busy_sort(&tp->t_busy);
> > >       xfs_extent_busy_clear(tp->t_mountp, &tp->t_busy, false);
> > >
> > > +
> > > +     /* Detach the transaction from this thread. */
> > > +     ASSERT(current->journal_info != NULL);
> > > +     /*
> > > +      * The PF_MEMALLOC_NOFS is bound to the transaction itself instead
> > > +      * of the reservation, so we need to check if tp is still the
> > > +      * current transaction before clearing the flag.
> > > +      */
> > > +     if (current->journal_info == tp)
> >
> > Um, you don't start setting journal_info until the next patch, so this
> > means that someone who lands on this commit with git bisect will have a
> > xfs with broken logic.
> >
> > Because this is the patch that changes where we set and restore NOFS
> > context, I think you have to introduce xfs_trans_context_swap here,
> > and not in the next patch.
> >
> 
> Thanks for the review. I will change it in the next version.
> 
> > I also think the _swap routine has to move the old NOFS state to the
> > new transaction's t_pflags,
> 
> Sure
> 
> > and then set NOFS in the old transaction's
> > t_pflags so that when we clear the context on the old transaction we
> > don't actually change the thread's NOFS state.
> >
> 
> Both thread's NOFS state and thead's journal_info state can't be
> changed in that case, right ?
> So should it better be,
> 
>     __xfs_trans_commit(tp, regrant)
>         xfs_trans_free(tp, regrant)
>             if (!regrant). // don't clear the xfs_trans_context if
> regrant is true.
>                 xfs_trans_context_clear()

No. You are trying to make this way more complex than it needs to be.
The logic in the core XFS code is *already correct* and all we need
to do is move that logic to wrapper functions, then slightly modify
the implementation inside the wrapper functions.

That is, xfs_trans_context_clear() should end up like this:

static inline void
xfs_trans_context_clear(struct xfs_trans *tp)
{
	/*
	 * If xfs_trans_context_swap() handed the NOFS context to a
	 * new transaction we do not clear the context here.
	 */
	if (current->journal_info != tp)
		return;
	current->journal_info = NULL;
	memalloc_nofs_restore(tp->t_pflags);
}

-Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

