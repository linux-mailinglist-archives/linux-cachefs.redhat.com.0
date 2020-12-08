Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 653232D228A
	for <lists+linux-cachefs@lfdr.de>; Tue,  8 Dec 2020 06:02:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-suhwBueOMumy7IFebAEoVA-1; Tue, 08 Dec 2020 00:02:30 -0500
X-MC-Unique: suhwBueOMumy7IFebAEoVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 385C0800D53;
	Tue,  8 Dec 2020 05:02:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E64736E41D;
	Tue,  8 Dec 2020 05:02:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 468514BB7B;
	Tue,  8 Dec 2020 05:02:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B852NXT000892 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 00:02:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A4ECE2166B2B; Tue,  8 Dec 2020 05:02:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FD6B2166B27
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 05:02:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2928858287
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 05:02:20 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-369-TJK2VgEFNIiWmi8bhYfS7w-1; Tue, 08 Dec 2020 00:02:16 -0500
X-MC-Unique: TJK2VgEFNIiWmi8bhYfS7w-1
Received: by mail-io1-f68.google.com with SMTP id z136so15732950iof.3;
	Mon, 07 Dec 2020 21:02:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BjOIiNIARLKGbCL4WsNHg/y/9CkG9Qa/Drt1maYW5Iw=;
	b=bVsZ7GxS4aP5S5qSeOEj7HHS85fgbSrHBeP8jJo+0rjr9K/sZumclEeZMpLmJMK5fH
	X8qd+1Hw0XOk5KgR4E9VQ+tCU4Nv7JFp5tm+M6YgdkNsVnBJZBMWRJvPfzUy40hncDaI
	t7yTPXkV1ms+Kvvz83idD/6Ixz2qcCFVcbacHYp/SD/kpfFo6Xxt40zmLHzjm78wX5x6
	nBXy4cm9aSPk8deHiYTNP4Zk+Bp69N6pKtq1H/siImqCc5737yodxiKAVN/YjezFo+kh
	E2+5kxFSzHLSt0sXAsfJ9e4ZiPC6OHgfT4WdHWXhtaL6x9hII/cO1VabfxSoxaIvsvkq
	nnxA==
X-Gm-Message-State: AOAM530OVeuVFNyO8G7jt8UcMcIG1sjgidLpfGL43isqwlssa5lub8GU
	NR+GFXAuaYE6v1wnclRn8WCNPiOhqc1PVs3YXyRetqtyHfw=
X-Google-Smtp-Source: ABdhPJwPNOB4pambcCqF8NeCShr9QVSscoPYVupfFDxLMbWV7TrxXDU8JlSbny5pUwIt8GLXX7rbcfbn+tbfJaRJcCM=
X-Received: by 2002:a02:a152:: with SMTP id m18mr24542685jah.64.1607403736011; 
	Mon, 07 Dec 2020 21:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20201208021543.76501-1-laoar.shao@gmail.com>
	<20201208021543.76501-5-laoar.shao@gmail.com>
	<20201208042026.GW3913616@dread.disaster.area>
In-Reply-To: <20201208042026.GW3913616@dread.disaster.area>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 8 Dec 2020 13:01:40 +0800
Message-ID: <CALOAHbA8QtaxKx85U7UraU4D4MzjU=pR7rs0duVfPRvyarymSQ@mail.gmail.com>
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
Subject: Re: [Linux-cachefs] [PATCH v10 4/4] xfs: use current->journal_info
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 8, 2020 at 12:20 PM Dave Chinner <david@fromorbit.com> wrote:
>
> On Tue, Dec 08, 2020 at 10:15:43AM +0800, Yafang Shao wrote:
> > PF_FSTRANS which is used to avoid transaction reservation recursion, is
> > dropped since commit 9070733b4efa ("xfs: abstract PF_FSTRANS to
> > PF_MEMALLOC_NOFS") and commit 7dea19f9ee63 ("mm: introduce
> > memalloc_nofs_{save,restore} API") and replaced by PF_MEMALLOC_NOFS which
> > means to avoid filesystem reclaim recursion.
> >
> > As these two flags have different meanings, we'd better reintroduce
> > PF_FSTRANS back. To avoid wasting the space of PF_* flags in task_struct,
> > we can reuse the current->journal_info to do that, per Willy. As the
> > check of transaction reservation recursion is used by XFS only, we can
> > move the check into xfs_vm_writepage(s), per Dave.
> >
> > To better abstract that behavoir, two new helpers are introduced, as
> > follows,
> > - xfs_trans_context_active
> >   To check whehter current is in fs transcation or not
> > - xfs_trans_context_swap
> >   Transfer the transaction context when rolling a permanent transaction
> >
> > These two new helpers are instroduced in xfs_trans.h.
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
> >  fs/xfs/xfs_trans.c     |  3 +++
> >  fs/xfs/xfs_trans.h     | 25 +++++++++++++++++++++++++
> >  4 files changed, 45 insertions(+), 7 deletions(-)
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
> > index 2371187b7615..28db93d0da97 100644
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
> > +     if (xfs_trans_context_active()) {
> > +             redirty_page_for_writepage(wbc, page);
> > +             unlock_page(page);
> > +             return 0;
> > +     }
>
> hmmm. Missing warning....
>
> > diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
> > index 44b11c64a15e..82c6735e40fc 100644
> > --- a/fs/xfs/xfs_trans.h
> > +++ b/fs/xfs/xfs_trans.h
> > @@ -268,16 +268,41 @@ xfs_trans_item_relog(
> >       return lip->li_ops->iop_relog(lip, tp);
> >  }
> >
> > +static inline bool
> > +xfs_trans_context_active(void)
> > +{
> > +     /* Use journal_info to indicate current is in a transaction */
> > +     if (WARN_ON_ONCE(current->journal_info != NULL))
> > +             return true;
> > +
> > +     return false;
> > +}
>
> Ah, this is wrong. The call sites should be:
>
>         if (WARN_ON_ONCE(xfs_trans_context_active())) {
>                 /* do error handling */
>                 return error_value;
>         }
>
> because we might want to use xfs_trans_context_active() to check if
> we are in a transaction context or not and that should not generate
> a warning. Also, placing the warning at the call site gives a more
> accurate indication of which IO path generated the warning....
>

Thanks for the explanation. I will update it in the next version.


-- 
Thanks
Yafang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

