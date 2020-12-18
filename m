Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1437A2DDC47
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Dec 2020 01:07:28 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-P0eXjh5MOPmD5Bsc2lmUtg-1; Thu, 17 Dec 2020 19:07:26 -0500
X-MC-Unique: P0eXjh5MOPmD5Bsc2lmUtg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13169800D62;
	Fri, 18 Dec 2020 00:07:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 427E52BFE1;
	Fri, 18 Dec 2020 00:07:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84662180954D;
	Fri, 18 Dec 2020 00:07:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BI07HJZ016135 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 17 Dec 2020 19:07:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BF339EC4A1; Fri, 18 Dec 2020 00:07:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9220EE854
	for <linux-cachefs@redhat.com>; Fri, 18 Dec 2020 00:07:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 567AA185A794
	for <linux-cachefs@redhat.com>; Fri, 18 Dec 2020 00:07:15 +0000 (UTC)
Received: from mail106.syd.optusnet.com.au (mail106.syd.optusnet.com.au
	[211.29.132.42]) by relay.mimecast.com with ESMTP id
	us-mta-277-5sJei6fEOBWR_nY6XmbYTQ-1; Thu, 17 Dec 2020 19:07:11 -0500
X-MC-Unique: 5sJei6fEOBWR_nY6XmbYTQ-1
Received: from dread.disaster.area (pa49-179-6-140.pa.nsw.optusnet.com.au
	[49.179.6.140])
	by mail106.syd.optusnet.com.au (Postfix) with ESMTPS id C77C65AF178;
	Fri, 18 Dec 2020 11:07:06 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1kq3IX-00554r-Gw; Fri, 18 Dec 2020 11:07:05 +1100
Date: Fri, 18 Dec 2020 11:07:05 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20201218000705.GR632069@dread.disaster.area>
References: <20201217011157.92549-1-laoar.shao@gmail.com>
	<20201217011157.92549-4-laoar.shao@gmail.com>
	<20201217221509.GQ632069@dread.disaster.area>
	<20201217230627.GB6911@magnolia>
MIME-Version: 1.0
In-Reply-To: <20201217230627.GB6911@magnolia>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=F8MpiZpN c=1 sm=1 tr=0 cx=a_idp_d
	a=uDU3YIYVKEaHT0eX+MXYOQ==:117 a=uDU3YIYVKEaHT0eX+MXYOQ==:17
	a=kj9zAlcOel0A:10 a=zTNgK-yGK50A:10 a=7-415B0cAAAA:8
	a=qwrxGE5TCmE8IEyY0b0A:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
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
Cc: linux-cachefs@redhat.com, willy@infradead.org, mhocko@kernel.org,
	hch@infradead.org, linux-mm@kvack.org, Yafang Shao <laoar.shao@gmail.com>,
	linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 17, 2020 at 03:06:27PM -0800, Darrick J. Wong wrote:
> On Fri, Dec 18, 2020 at 09:15:09AM +1100, Dave Chinner wrote:
> > The obvious solution: we've moved the saved process state to a
> > different context, so it is no longer needed for the current
> > transaction we are about to commit. So How about just clearing the
> > saved state from the original transaction when swappingi like so:
> > 
> > static inline void
> > xfs_trans_context_swap(struct xfs_trans *tp, struct xfs_trans *ntp)
> > {
> > 	ntp->t_pflags = tp->t_pflags;
> > 	tp->t_flags = 0;
> > }
> > 
> > And now, when we go to clear the transaction context, we can simply
> > do this:
> > 
> > static inline void
> > xfs_trans_context_clear(struct xfs_trans *tp)
> > {
> > 	if (tp->t_pflags)
> > 		memalloc_nofs_restore(tp->t_pflags);
> > }
> > 
> > and the problem is solved. The NOFS state will follow the active
> > transaction and not be reset until the entire transaction chain is
> > completed.
> 
> Er... correct me if I'm wrong, but I thought t_pflags stores the old
> state of current->flags from before we call xfs_trans_alloc?  So if we
> call into xfs_trans_alloc with current->flags==0 and we commit the
> transaction having not rolled, we won't unset the _NOFS state, and exit
> back to userspace with _NOFS set.

Minor thinko.

tp->t_pflags only stores a single bit of information w.r.t
PF_MEMALLOC_NOFS state, not the entire set of current task flags:
whether it should be cleared or not on a call to
memalloc_nofs_restore(). See memalloc_nofs_save():

static inline unsigned int memalloc_nofs_save(void)
{
        unsigned int flags = current->flags & PF_MEMALLOC_NOFS;
        current->flags |= PF_MEMALLOC_NOFS;
        return flags;
}

So, yeah, I got the t_pflags logic the wrong way around here - zero
means clear it, non-zero means don't clear it. IOWs, swap:

	ntp->t_pflags = tp->t_pflags;
	tp->t_flags = -1;

and clear:

	if (!tp->t_flags)
		memalloc_nofs_restore(tp->t_pflags);

This should only be temporary code, anyway. The next patch should
change this state clearing check to use current->journal_info, then
we aren't dependent on process flags state at all.

> I think the logic is correct here -- we transfer the old pflags value
> from @tp to @ntp, which effectively puts @ntp in charge of restoring the
> old pflags value; and then we set tp->t_pflags to current->flags, which
> means that @tp will "restore" the current pflags value into pflags, which
> is a nop.

That's pretty much what the current logic guarantees. Once the
wrappers provide this same guarantee, we can greatly simply the the
transaction context state management (i.e. set on alloc, swap on
dup, clear on free). And thread handoffs can just use clear/set
appropriately.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

