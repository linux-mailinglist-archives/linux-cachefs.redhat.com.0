Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 288B22DEC6E
	for <lists+linux-cachefs@lfdr.de>; Sat, 19 Dec 2020 01:33:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-GMjSvevkOxWA3UypE8JwRw-1; Fri, 18 Dec 2020 19:33:01 -0500
X-MC-Unique: GMjSvevkOxWA3UypE8JwRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADDA31572E;
	Sat, 19 Dec 2020 00:32:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A0FF60C43;
	Sat, 19 Dec 2020 00:32:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A5A0180954D;
	Sat, 19 Dec 2020 00:32:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJ0Shrb004424 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 19:28:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 25A8710DCF62; Sat, 19 Dec 2020 00:28:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2021210DCF60
	for <linux-cachefs@redhat.com>; Sat, 19 Dec 2020 00:28:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F18298007D9
	for <linux-cachefs@redhat.com>; Sat, 19 Dec 2020 00:28:40 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
	[209.85.166.171]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-501-n7p7R8IFN0S69wMTomwx7w-1; Fri, 18 Dec 2020 19:28:38 -0500
X-MC-Unique: n7p7R8IFN0S69wMTomwx7w-1
Received: by mail-il1-f171.google.com with SMTP id r17so3770091ilo.11;
	Fri, 18 Dec 2020 16:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jPVM+h1yU+rYtYYm/wlc4NEIQ0PzwsacEydpO06K9XE=;
	b=ZMJoQzOHWgfODxzTslx8GgFoOEfml4EJvyq8CFyDq0/3EIxN6knAsv2ksIerU33x5s
	jS8ee5Oc07ino7Itx1YR4Z+JZkIITnfs9eAeuxT5UvGwQJz88aaqT3BCvZbaY5b2UuZS
	M0itgGZws2wrFhTa6JXuwQUWofBNTAIVkkDjEj7wxZ7swMMk6+7V4grUAjS8fjdoXJgF
	8T4t7XPy2y6l6lMfHmR5qvgeAuECRDqU3xM0j6Oc2sJnvH4EaQGPim8r9Q3krz0E50CU
	Eez25eyI1X0lj2QKaaQjjiUnNLqjU05zPJ1QwUlrnmQCgAhH0DwTz8xQyVemamokt4Nk
	TMSw==
X-Gm-Message-State: AOAM532pbxtbxL2tCPkKcTyfxhdVWjhhlFty5zZwGqLp1wDCKqaqSKcI
	QAfsLoeWm2eKAEaL2DhnTpOX3f1lgnFv2kaDPqo=
X-Google-Smtp-Source: ABdhPJz+KJh7dGrxqQVVQCtCBTrQGXNchHDSEESjWTprd7z6kNilqN06QJJfnHMx9qKQkDTMmhKgdvbax3MdOwj737w=
X-Received: by 2002:a92:489b:: with SMTP id j27mr6630232ilg.168.1608337718154; 
	Fri, 18 Dec 2020 16:28:38 -0800 (PST)
MIME-Version: 1.0
References: <20201217011157.92549-1-laoar.shao@gmail.com>
	<20201217011157.92549-4-laoar.shao@gmail.com>
	<20201217221509.GQ632069@dread.disaster.area>
In-Reply-To: <20201217221509.GQ632069@dread.disaster.area>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sat, 19 Dec 2020 08:28:02 +0800
Message-ID: <CALOAHbAWLVGFO8QGQK05HHzokji+=XsCE3tt3E5eCx87smrDtg@mail.gmail.com>
To: Dave Chinner <david@fromorbit.com>
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
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>,
	Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Linux MM <linux-mm@kvack.org>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v13 3/4] xfs: refactor the usage around
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 18, 2020 at 6:15 AM Dave Chinner <david@fromorbit.com> wrote:
>
> On Thu, Dec 17, 2020 at 09:11:56AM +0800, Yafang Shao wrote:
> > The xfs_trans context should be active after it is allocated, and
> > deactive when it is freed.
> > The rolling transaction should be specially considered, because in the
> > case when we clear the old transaction the thread's NOFS state shouldn't
> > be changed, as a result we have to set NOFS in the old transaction's
> > t_pflags in xfs_trans_context_swap().
> >
> > So these helpers are refactored as,
> > - xfs_trans_context_set()
> >   Used in xfs_trans_alloc()
> > - xfs_trans_context_clear()
> >   Used in xfs_trans_free()
> >
> > And a new helper is instroduced to handle the rolling transaction,
> > - xfs_trans_context_swap()
> >   Used in rolling transaction
> >
> > This patch is based on Darrick's work to fix the issue in xfs/141 in the
> > earlier version. [1]
> >
> > 1. https://lore.kernel.org/linux-xfs/20201104001649.GN7123@magnolia
>
> As I said in my last comments, this change of logic is not
> necessary.  All we need to do is transfer the NOFS state to the new
> transactions and *remove it from the old one*.
>

Thanks for the explanation, I will change it.

> IOWs, all this patch should do is:
>
> > @@ -119,7 +123,9 @@ xfs_trans_dup(
> >
> >       ntp->t_rtx_res = tp->t_rtx_res - tp->t_rtx_res_used;
> >       tp->t_rtx_res = tp->t_rtx_res_used;
> > -     ntp->t_pflags = tp->t_pflags;
> > +
> > +     /* Associate the new transaction with this thread. */
> > +     xfs_trans_context_swap(tp, ntp);
> >
> >       /* move deferred ops over to the new tp */
> >       xfs_defer_move(ntp, tp);
>
> This, and
>
> > diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
> > index 44b11c64a15e..12380eaaf7ce 100644
> > --- a/fs/xfs/xfs_trans.h
> > +++ b/fs/xfs/xfs_trans.h
> > @@ -280,4 +280,17 @@ xfs_trans_context_clear(struct xfs_trans *tp)
> >       memalloc_nofs_restore(tp->t_pflags);
> >  }
> >
> > +static inline void
> > +xfs_trans_context_swap(struct xfs_trans *tp, struct xfs_trans *ntp)
> > +{
>
> introduce this wrapper.
>
> > +     ntp->t_pflags = tp->t_pflags;
> > +     /*
> > +      * For the rolling transaction, we have to set NOFS in the old
> > +      * transaction's t_pflags so that when we clear the context on
> > +      * the old transaction we don't actually change the thread's NOFS
> > +      * state.
> > +      */
> > +     tp->t_pflags = current->flags | PF_MEMALLOC_NOFS;
> > +}
>
> But not with this implementation.
>
> Think for a minute, please. All we want to do is avoid clearing
> the nofs state when we call xfs_trans_context_clear(tp) if the state
> has been handed to another transaction.
>
> Your current implementation hands the state to ntp, but *then leaves
> it on tp* as well. So then you hack a PF_MEMALLOC_NOFS flag into
> tp->t_pflags so that it doesn't clear that flag (abusing the masking
> done during clearing). That's just nasty because it relies on
> internal memalloc_nofs_restore() details for correct functionality.
>
> The obvious solution: we've moved the saved process state to a
> different context, so it is no longer needed for the current
> transaction we are about to commit. So How about just clearing the
> saved state from the original transaction when swappingi like so:
>
> static inline void
> xfs_trans_context_swap(struct xfs_trans *tp, struct xfs_trans *ntp)
> {
>         ntp->t_pflags = tp->t_pflags;
>         tp->t_flags = 0;
> }
>
> And now, when we go to clear the transaction context, we can simply
> do this:
>
> static inline void
> xfs_trans_context_clear(struct xfs_trans *tp)
> {
>         if (tp->t_pflags)
>                 memalloc_nofs_restore(tp->t_pflags);
> }
>
> and the problem is solved. The NOFS state will follow the active
> transaction and not be reset until the entire transaction chain is
> completed.
>
> In the next patch you can go and introduce current->journal_info
> into just the wrapper functions, maintaining the same overall
> logic.
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

