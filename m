Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 80AC02D2140
	for <lists+linux-cachefs@lfdr.de>; Tue,  8 Dec 2020 04:05:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-FROu9aEYP2SKo55NSsrOGA-1; Mon, 07 Dec 2020 22:05:51 -0500
X-MC-Unique: FROu9aEYP2SKo55NSsrOGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E27B18C89DC;
	Tue,  8 Dec 2020 03:05:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EFB75D9E2;
	Tue,  8 Dec 2020 03:05:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79FE2180954D;
	Tue,  8 Dec 2020 03:05:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B835mUr021648 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 22:05:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E033A86D66; Tue,  8 Dec 2020 03:05:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA3E58A4B0
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 03:05:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EB28811E84
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 03:05:45 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-112--H1_1QNaMrK67VBbOfN3gQ-1; Mon, 07 Dec 2020 22:05:42 -0500
X-MC-Unique: -H1_1QNaMrK67VBbOfN3gQ-1
Received: by mail-io1-f65.google.com with SMTP id n4so15526781iow.12;
	Mon, 07 Dec 2020 19:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ozr90VGBYbWlh1y66ehF1CrNRHOaukDgzG0FfD0U5rQ=;
	b=dT8uBp3UHFynJQ3dkb7gvjh6tvbAwQxcnwC3jLD7/lElFu3d4Jogm4WgVKpBdC3dJt
	tT3hzEjpQEFfupXK4K56aalxl7TV8RPhb+amGDw7D0lPxXSDLJla79LHvl6f/EntgFvo
	ysuFBolGTNdX+IITtvx0gCEcf2XinayqlV7lCo88QB+lmt5M5mM07yZE7AIQ2N2HNVz7
	iD7eOC/4EksFGk1J6zCHvEIJyAkpUzK7u7mDgC0TTeAWs2q+fCEcH5swPHYUorQI6gIl
	5i1WxGcLSMhTHaYohtpu6nvr2Is83XyRYmU/fd823s6oM1O9f3ohqgjIDbCdSdxsfjLH
	ai1g==
X-Gm-Message-State: AOAM530izXnU9ndF50dq4/bRrhqmRorc7Rmyt7vfhdixmCrEWDRk52FT
	kh/qJ4wsX+t2X3nnE1XZgy9AGywf9OPQ/tjyaFXK0EK4K4M=
X-Google-Smtp-Source: ABdhPJzO/Z1mQm5Wubaj1F0ITFfQTsPZoRC8wJ4I1X7pE/zdNjTZ/nTVVkMwEIoI9Vte3qzs3jUEjltiHBxhWPy6YQE=
X-Received: by 2002:a02:a304:: with SMTP id q4mr24109925jai.97.1607396742053; 
	Mon, 07 Dec 2020 19:05:42 -0800 (PST)
MIME-Version: 1.0
References: <20201208021543.76501-1-laoar.shao@gmail.com>
	<20201208021543.76501-3-laoar.shao@gmail.com>
	<20201208024637.GG7338@casper.infradead.org>
In-Reply-To: <20201208024637.GG7338@casper.infradead.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 8 Dec 2020 11:05:06 +0800
Message-ID: <CALOAHbAe_BQzNEJNZCa-ixt4FUEoxHvxkj=jNCGiMF4LnzSwtw@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
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
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>,
	Dave Chinner <david@fromorbit.com>, Michal Hocko <mhocko@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Linux MM <linux-mm@kvack.org>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v10 2/4] xfs: use memalloc_nofs_{save,
	restore} in xfs transaction
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

On Tue, Dec 8, 2020 at 10:46 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Dec 08, 2020 at 10:15:41AM +0800, Yafang Shao wrote:
> > memalloc_nofs_{save,restore} API is introduced in
> > commit 7dea19f9ee63 ("mm: introduce memalloc_nofs_{save,restore} API"),
> > which gives a better abstraction of the usage around PF_MEMALLOC_NOFS. We'd
> > better use this API in XFS instead of using PF_MEMALLOC_NOFS directly as
> > well.
> >
> > To prepare for the followup patch, two new helpers are introduced in XFS
> > to wrap the memalloc_nofs_{save,restore} API, as follows,
> >
> > static inline void
> > xfs_trans_context_set(struct xfs_trans *tp)
> > {
> >       tp->t_pflags = memalloc_nofs_save();
> > }
> >
> > static inline void
> > xfs_trans_context_clear(struct xfs_trans *tp)
> > {
> >       memalloc_nofs_restore(tp->t_pflags);
> > }
>
> Don't repeat the contents of the patch in the changelog.
>

Sure.

> Also, this ordering of patches doesn't make sense.  If I saw this
> patch by itself instead of part of the series, there's no good reason
> to replace one xfs-specific wrapper (current_set_flags_nested) with
> another (xfs_trans_context_set).
>
> If the changelog here said something like ...
>
> Introduce a new API to mark the start and end of XFS transactions.
> For now, just save and restore the memalloc_nofs flags.
>
> ... then it might make more sense to do things in this order.
>

Thanks. I will update it in the next version.

> > These two new helpers are added into xfs_tans.h as they are used in xfs
> > transaction only.
> >
> > Cc: Darrick J. Wong <darrick.wong@oracle.com>
> > Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Dave Chinner <david@fromorbit.com>
> > Cc: Michal Hocko <mhocko@kernel.org>
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > ---
> >  fs/xfs/xfs_aops.c  |  4 ++--
> >  fs/xfs/xfs_linux.h |  4 ----
> >  fs/xfs/xfs_trans.c | 13 +++++++------
> >  fs/xfs/xfs_trans.h | 12 ++++++++++++
> >  4 files changed, 21 insertions(+), 12 deletions(-)
> >
> > diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
> > index 4304c6416fbb..2371187b7615 100644
> > --- a/fs/xfs/xfs_aops.c
> > +++ b/fs/xfs/xfs_aops.c
> > @@ -62,7 +62,7 @@ xfs_setfilesize_trans_alloc(
> >        * We hand off the transaction to the completion thread now, so
> >        * clear the flag here.
> >        */
> > -     current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> > +     xfs_trans_context_clear(tp);
> >       return 0;
> >  }
> >
> > @@ -125,7 +125,7 @@ xfs_setfilesize_ioend(
> >        * thus we need to mark ourselves as being in a transaction manually.
> >        * Similarly for freeze protection.
> >        */
> > -     current_set_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> > +     xfs_trans_context_set(tp);
> >       __sb_writers_acquired(VFS_I(ip)->i_sb, SB_FREEZE_FS);
> >
> >       /* we abort the update if there was an IO error */
> > diff --git a/fs/xfs/xfs_linux.h b/fs/xfs/xfs_linux.h
> > index 5b7a1e201559..6ab0f8043c73 100644
> > --- a/fs/xfs/xfs_linux.h
> > +++ b/fs/xfs/xfs_linux.h
> > @@ -102,10 +102,6 @@ typedef __u32                    xfs_nlink_t;
> >  #define xfs_cowb_secs                xfs_params.cowb_timer.val
> >
> >  #define current_cpu()                (raw_smp_processor_id())
> > -#define current_set_flags_nested(sp, f)              \
> > -             (*(sp) = current->flags, current->flags |= (f))
> > -#define current_restore_flags_nested(sp, f)  \
> > -             (current->flags = ((current->flags & ~(f)) | (*(sp) & (f))))
> >
> >  #define NBBY         8               /* number of bits per byte */
> >
> > diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
> > index c94e71f741b6..11d390f0d3f2 100644
> > --- a/fs/xfs/xfs_trans.c
> > +++ b/fs/xfs/xfs_trans.c
> > @@ -154,7 +154,7 @@ xfs_trans_reserve(
> >       bool                    rsvd = (tp->t_flags & XFS_TRANS_RESERVE) != 0;
> >
> >       /* Mark this thread as being in a transaction */
> > -     current_set_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> > +     xfs_trans_context_set(tp);
> >
> >       /*
> >        * Attempt to reserve the needed disk blocks by decrementing
> > @@ -164,7 +164,7 @@ xfs_trans_reserve(
> >       if (blocks > 0) {
> >               error = xfs_mod_fdblocks(mp, -((int64_t)blocks), rsvd);
> >               if (error != 0) {
> > -                     current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> > +                     xfs_trans_context_clear(tp);
> >                       return -ENOSPC;
> >               }
> >               tp->t_blk_res += blocks;
> > @@ -241,7 +241,7 @@ xfs_trans_reserve(
> >               tp->t_blk_res = 0;
> >       }
> >
> > -     current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> > +     xfs_trans_context_clear(tp);
> >
> >       return error;
> >  }
> > @@ -878,7 +878,7 @@ __xfs_trans_commit(
> >
> >       xfs_log_commit_cil(mp, tp, &commit_lsn, regrant);
> >
> > -     current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> > +     xfs_trans_context_clear(tp);
> >       xfs_trans_free(tp);
> >
> >       /*
> > @@ -910,7 +910,8 @@ __xfs_trans_commit(
> >                       xfs_log_ticket_ungrant(mp->m_log, tp->t_ticket);
> >               tp->t_ticket = NULL;
> >       }
> > -     current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> > +
> > +     xfs_trans_context_clear(tp);
> >       xfs_trans_free_items(tp, !!error);
> >       xfs_trans_free(tp);
> >
> > @@ -971,7 +972,7 @@ xfs_trans_cancel(
> >       }
> >
> >       /* mark this thread as no longer being in a transaction */
> > -     current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> > +     xfs_trans_context_clear(tp);
> >
> >       xfs_trans_free_items(tp, dirty);
> >       xfs_trans_free(tp);
> > diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
> > index 084658946cc8..44b11c64a15e 100644
> > --- a/fs/xfs/xfs_trans.h
> > +++ b/fs/xfs/xfs_trans.h
> > @@ -268,4 +268,16 @@ xfs_trans_item_relog(
> >       return lip->li_ops->iop_relog(lip, tp);
> >  }
> >
> > +static inline void
> > +xfs_trans_context_set(struct xfs_trans *tp)
> > +{
> > +     tp->t_pflags = memalloc_nofs_save();
> > +}
> > +
> > +static inline void
> > +xfs_trans_context_clear(struct xfs_trans *tp)
> > +{
> > +     memalloc_nofs_restore(tp->t_pflags);
> > +}
> > +
> >  #endif       /* __XFS_TRANS_H__ */
> > --
> > 2.18.4
> >
> >



-- 
Thanks
Yafang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

