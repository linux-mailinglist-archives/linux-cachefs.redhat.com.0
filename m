Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 55DC12DEC4E
	for <lists+linux-cachefs@lfdr.de>; Sat, 19 Dec 2020 01:17:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-Jq77wo08NMKcUahiUtdDFw-1; Fri, 18 Dec 2020 19:17:15 -0500
X-MC-Unique: Jq77wo08NMKcUahiUtdDFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F33B180A08A;
	Sat, 19 Dec 2020 00:17:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 940235C1C5;
	Sat, 19 Dec 2020 00:17:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C539A4BB40;
	Sat, 19 Dec 2020 00:17:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJ0H1fd003755 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 19:17:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0F5112166B28; Sat, 19 Dec 2020 00:17:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A5B02166B27
	for <linux-cachefs@redhat.com>; Sat, 19 Dec 2020 00:16:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC7AE800140
	for <linux-cachefs@redhat.com>; Sat, 19 Dec 2020 00:16:58 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
	[209.85.166.182]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-90-rekWH5gLORWzVVQBzdM8QQ-1; Fri, 18 Dec 2020 19:16:56 -0500
X-MC-Unique: rekWH5gLORWzVVQBzdM8QQ-1
Received: by mail-il1-f182.google.com with SMTP id u12so3799386ilv.3;
	Fri, 18 Dec 2020 16:16:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o+srfVk5LFUit/NQt+S2ivZ9seQ6hbpnwEWB584IB1M=;
	b=PdcnxsgfTF/1bmNmNR9HSpzyo6asvg1V9YUAPYo4mm0A+nU9XMsHIQcTwxGfb5gG2i
	I1zEYepuwaxGdzCrzW76F4eMSXd14Z6pzQ7JOlAZts8/8KaMmKIynSyYvOY6j9ASLcqZ
	fRjE2ZdW9VbPUpEbMEHcPc1UsnR6JjpSbZx09BcU5e9m2qD/QspWSRd1TB5dPV/PKLaB
	8SM+mU8ZKhyrT1Iap2GjB66sRXNr30GSsrNLq2HUhElayyhVsVEDEXBKuaT+ZjtSpOCr
	wo+9896E6IpvpTziBx2VEKpyqwIW4NeW4DMGz/REJSgYebYM3QMV6eE/1o2a/JPwB5p3
	0Apg==
X-Gm-Message-State: AOAM530iB89SsAKyXwiTbmXxersIPcEiodIVNOEcUvNNADL/2VStydY+
	Tmz9FzFLk3HAnEg2nMPnuW8ab3U1vQVuCwFx7njJnnVak44WDg==
X-Google-Smtp-Source: ABdhPJzSxqkvV+NbAPCJQWZJzXNqRmylB8moClwA0C9kvg1T5xDU8dIs76SfXzjOTqJ1BXo3tRJj9ii5YSitobTpRSU=
X-Received: by 2002:a05:6e02:c32:: with SMTP id
	q18mr6667563ilg.203.1608337015728; 
	Fri, 18 Dec 2020 16:16:55 -0800 (PST)
MIME-Version: 1.0
References: <20201217011157.92549-1-laoar.shao@gmail.com>
	<20201217011157.92549-5-laoar.shao@gmail.com>
	<20201218001442.GS632069@dread.disaster.area>
In-Reply-To: <20201218001442.GS632069@dread.disaster.area>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sat, 19 Dec 2020 08:16:19 +0800
Message-ID: <CALOAHbAKJ3G5VrsMhHeCy44rp2rhVUk2rWb1qdEF0BvRDuYYAA@mail.gmail.com>
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
Subject: Re: [Linux-cachefs] [PATCH v13 4/4] xfs: use current->journal_info
 to avoid transaction reservation recursion
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 18, 2020 at 8:14 AM Dave Chinner <david@fromorbit.com> wrote:
>
> On Thu, Dec 17, 2020 at 09:11:57AM +0800, Yafang Shao wrote:
> > PF_FSTRANS which is used to avoid transaction reservation recursion, is
> > dropped since commit 9070733b4efa ("xfs: abstract PF_FSTRANS to
> > PF_MEMALLOC_NOFS") and replaced by PF_MEMALLOC_NOFS which means to avoid
> > filesystem reclaim recursion.
> >
> > As these two flags have different meanings, we'd better reintroduce
> > PF_FSTRANS back. To avoid wasting the space of PF_* flags in task_struct,
> > we can reuse the current->journal_info to do that, per Willy. As the
> > check of transaction reservation recursion is used by XFS only, we can
> > move the check into xfs_vm_writepage(s), per Dave.
> >
> > Cc: Darrick J. Wong <darrick.wong@oracle.com>
> > Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Dave Chinner <david@fromorbit.com>
> > Cc: Michal Hocko <mhocko@kernel.org>
> > Cc: David Howells <dhowells@redhat.com>
> > Cc: Jeff Layton <jlayton@redhat.com>
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > ---
> >  fs/iomap/buffered-io.c |  7 -------
> >  fs/xfs/xfs_aops.c      | 17 +++++++++++++++++
> >  fs/xfs/xfs_trans.h     | 26 +++++++++++++++++++-------
> >  3 files changed, 36 insertions(+), 14 deletions(-)
> >
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index 10cc7979ce38..3c53fa6ce64d 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -1458,13 +1458,6 @@ iomap_do_writepage(struct page *page, struct writeback_control *wbc, void *data)
> >                       PF_MEMALLOC))
> >               goto redirty;
> >
> > -     /*
> > -      * Given that we do not allow direct reclaim to call us, we should
> > -      * never be called in a recursive filesystem reclaim context.
> > -      */
> > -     if (WARN_ON_ONCE(current->flags & PF_MEMALLOC_NOFS))
> > -             goto redirty;
> > -
> >       /*
> >        * Is this page beyond the end of the file?
> >        *
> > diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
> > index 2371187b7615..0da0242d42c3 100644
> > --- a/fs/xfs/xfs_aops.c
> > +++ b/fs/xfs/xfs_aops.c
> > @@ -568,6 +568,16 @@ xfs_vm_writepage(
> >  {
> >       struct xfs_writepage_ctx wpc = { };
> >
> > +     /*
> > +      * Given that we do not allow direct reclaim to call us, we should
> > +      * never be called while in a filesystem transaction.
> > +      */
>
> Comment is wrong. This is not protecting against direct reclaim
> recursion, this is protecting against writeback from within a
> transaction context.
>

Ah, I forgot to change this comment after copy and paste. Thanks for
pointing it out.

> Best to remove the comment altogether, because it is largely
> redundant.
>

Sure, I will remove these comments.

> > +     if (WARN_ON_ONCE(xfs_trans_context_active())) {
> > +             redirty_page_for_writepage(wbc, page);
> > +             unlock_page(page);
> > +             return 0;
> > +     }
> > +
> >       return iomap_writepage(page, wbc, &wpc.ctx, &xfs_writeback_ops);
> >  }
> >
> > @@ -579,6 +589,13 @@ xfs_vm_writepages(
> >       struct xfs_writepage_ctx wpc = { };
> >
> >       xfs_iflags_clear(XFS_I(mapping->host), XFS_ITRUNCATED);
> > +     /*
> > +      * Given that we do not allow direct reclaim to call us, we should
> > +      * never be called while in a filesystem transaction.
> > +      */
>
> same here.
>
> > +     if (WARN_ON_ONCE(xfs_trans_context_active()))
> > +             return 0;
> > +
> >       return iomap_writepages(mapping, wbc, &wpc.ctx, &xfs_writeback_ops);
> >  }
> >
> > diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
> > index 12380eaaf7ce..0c8140147b9b 100644
> > --- a/fs/xfs/xfs_trans.h
> > +++ b/fs/xfs/xfs_trans.h
> > @@ -268,29 +268,41 @@ xfs_trans_item_relog(
> >       return lip->li_ops->iop_relog(lip, tp);
> >  }
> >
> > +static inline bool
> > +xfs_trans_context_active(void)
> > +{
> > +     /* Use journal_info to indicate current is in a transaction */
> > +     return current->journal_info != NULL;
> > +}
>
> Comment is not necessary.
>
> > +
> >  static inline void
> >  xfs_trans_context_set(struct xfs_trans *tp)
> >  {
> > +     ASSERT(!current->journal_info);
> > +     current->journal_info = tp;
> >       tp->t_pflags = memalloc_nofs_save();
> >  }
> >
> >  static inline void
> >  xfs_trans_context_clear(struct xfs_trans *tp)
> >  {
> > +     /*
> > +      * If xfs_trans_context_swap() handed the NOFS context to a
> > +      * new transaction we do not clear the context here.
> > +      */
>
> It's a transaction context, not a "NOFS context". Setting NOFS is
> just something we implement inside the transaction context. More
> correct would be:
>
>         /*
>          * If we handed over the context via xfs_trans_context_swap() then
>          * the context is no longer ours to clear.
>          */
>

Sure, I will change it.


-- 
Thanks
Yafang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

