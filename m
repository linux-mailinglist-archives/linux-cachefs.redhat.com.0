Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6751C2DEC6F
	for <lists+linux-cachefs@lfdr.de>; Sat, 19 Dec 2020 01:33:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-dFVoYK6RPwaUjL1I0Ww7nw-1; Fri, 18 Dec 2020 19:33:02 -0500
X-MC-Unique: dFVoYK6RPwaUjL1I0Ww7nw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0236A107ACFC;
	Sat, 19 Dec 2020 00:33:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4F315D6DC;
	Sat, 19 Dec 2020 00:32:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CBDF4180954D;
	Sat, 19 Dec 2020 00:32:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJ0WfG8004660 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 19:32:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9C05A2166B28; Sat, 19 Dec 2020 00:32:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 971D42166B27
	for <linux-cachefs@redhat.com>; Sat, 19 Dec 2020 00:32:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84860185A7BC
	for <linux-cachefs@redhat.com>; Sat, 19 Dec 2020 00:32:39 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
	[209.85.166.171]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-323-No9Q_nrPNS2qUoqRG39ikw-1; Fri, 18 Dec 2020 19:32:35 -0500
X-MC-Unique: No9Q_nrPNS2qUoqRG39ikw-1
Received: by mail-il1-f171.google.com with SMTP id 75so3769272ilv.13;
	Fri, 18 Dec 2020 16:32:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JitJkpTV7wl8VuDaQVYn0aa0uVhFO5sQBwVgoYVnyaU=;
	b=QeBJOG2afjvRMyW6Dq/HkN2vhHF4JSL+IWPY6oiaUBIIz3ygaW5KOm6+4ry4oC+qlV
	gJ7LfJ/SiXNDqXWQ/fH9VZejU81xfoojvi0mskvDNRyZbY5XsJ53sXJCd4GbZlnnv67v
	tcmwjqGjE8QMUvI+pZC7l9rFUraTHN9V6pG1pOw2LfKdMzhWdjobaXPF9d5petkREKOM
	hi5sImsypC3efKXM4Lt2C1shOXF5Aeur5hPk22jbRj39UPWoK48eHsERz/KyJhwNBRje
	dNp5OX5uyyQWaRYnCF2Hn4EzJz6w9tQC+mysH6g1Vh12beOFRe0yGu/Wo3pikeSuJExk
	1jcA==
X-Gm-Message-State: AOAM533Munnf0/8lTcyoW9+fNKKiW+nefytCOdtNOy+hvy+G9g3UMdcK
	3CGfF7cikXzfdLEpnjrIX/mccNtAhHUrs1ViHe4=
X-Google-Smtp-Source: ABdhPJzBhTlloThFSbngFUSOPAeYALZjLbpAe0za2X9hBcKTdxptneepWBoejNXqYFr1PxGnGFPWlotevXhOJRLtZRY=
X-Received: by 2002:a05:6e02:c32:: with SMTP id
	q18mr6716194ilg.203.1608337954743; 
	Fri, 18 Dec 2020 16:32:34 -0800 (PST)
MIME-Version: 1.0
References: <20201217011157.92549-1-laoar.shao@gmail.com>
	<20201217011157.92549-4-laoar.shao@gmail.com>
	<20201217221509.GQ632069@dread.disaster.area>
	<20201217230627.GB6911@magnolia>
	<20201218000705.GR632069@dread.disaster.area>
In-Reply-To: <20201218000705.GR632069@dread.disaster.area>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sat, 19 Dec 2020 08:31:58 +0800
Message-ID: <CALOAHbAAJSU5xZiNktX=z4-SHF6=xY4z8H1+VggSttFcgDeMHQ@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 18, 2020 at 8:07 AM Dave Chinner <david@fromorbit.com> wrote:
>
> On Thu, Dec 17, 2020 at 03:06:27PM -0800, Darrick J. Wong wrote:
> > On Fri, Dec 18, 2020 at 09:15:09AM +1100, Dave Chinner wrote:
> > > The obvious solution: we've moved the saved process state to a
> > > different context, so it is no longer needed for the current
> > > transaction we are about to commit. So How about just clearing the
> > > saved state from the original transaction when swappingi like so:
> > >
> > > static inline void
> > > xfs_trans_context_swap(struct xfs_trans *tp, struct xfs_trans *ntp)
> > > {
> > >     ntp->t_pflags = tp->t_pflags;
> > >     tp->t_flags = 0;
> > > }
> > >
> > > And now, when we go to clear the transaction context, we can simply
> > > do this:
> > >
> > > static inline void
> > > xfs_trans_context_clear(struct xfs_trans *tp)
> > > {
> > >     if (tp->t_pflags)
> > >             memalloc_nofs_restore(tp->t_pflags);
> > > }
> > >
> > > and the problem is solved. The NOFS state will follow the active
> > > transaction and not be reset until the entire transaction chain is
> > > completed.
> >
> > Er... correct me if I'm wrong, but I thought t_pflags stores the old
> > state of current->flags from before we call xfs_trans_alloc?  So if we
> > call into xfs_trans_alloc with current->flags==0 and we commit the
> > transaction having not rolled, we won't unset the _NOFS state, and exit
> > back to userspace with _NOFS set.
>
> Minor thinko.
>
> tp->t_pflags only stores a single bit of information w.r.t
> PF_MEMALLOC_NOFS state, not the entire set of current task flags:
> whether it should be cleared or not on a call to
> memalloc_nofs_restore(). See memalloc_nofs_save():
>
> static inline unsigned int memalloc_nofs_save(void)
> {
>         unsigned int flags = current->flags & PF_MEMALLOC_NOFS;
>         current->flags |= PF_MEMALLOC_NOFS;
>         return flags;
> }
>
> So, yeah, I got the t_pflags logic the wrong way around here - zero
> means clear it, non-zero means don't clear it. IOWs, swap:
>
>         ntp->t_pflags = tp->t_pflags;
>         tp->t_flags = -1;
>
> and clear:
>
>         if (!tp->t_flags)
>                 memalloc_nofs_restore(tp->t_pflags);
>
> This should only be temporary code, anyway. The next patch should
> change this state clearing check to use current->journal_info, then
> we aren't dependent on process flags state at all.
>
> > I think the logic is correct here -- we transfer the old pflags value
> > from @tp to @ntp, which effectively puts @ntp in charge of restoring the
> > old pflags value; and then we set tp->t_pflags to current->flags, which
> > means that @tp will "restore" the current pflags value into pflags, which
> > is a nop.
>
> That's pretty much what the current logic guarantees. Once the
> wrappers provide this same guarantee, we can greatly simply the the
> transaction context state management (i.e. set on alloc, swap on
> dup, clear on free). And thread handoffs can just use clear/set
> appropriately.
>

Make sense to me.


-- 
Thanks
Yafang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

