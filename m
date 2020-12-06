Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2382D073A
	for <lists+linux-cachefs@lfdr.de>; Sun,  6 Dec 2020 22:05:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-9OfVti-rNVmUEVgVIBrzUA-1; Sun, 06 Dec 2020 16:05:20 -0500
X-MC-Unique: 9OfVti-rNVmUEVgVIBrzUA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AE265201;
	Sun,  6 Dec 2020 21:05:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A91B5D9C2;
	Sun,  6 Dec 2020 21:05:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85E884A7C7;
	Sun,  6 Dec 2020 21:05:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B6L50l8003047 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 6 Dec 2020 16:05:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0DB272166B28; Sun,  6 Dec 2020 21:05:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08CC82166B27
	for <linux-cachefs@redhat.com>; Sun,  6 Dec 2020 21:04:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B96B6185A794
	for <linux-cachefs@redhat.com>; Sun,  6 Dec 2020 21:04:57 +0000 (UTC)
Received: from mail108.syd.optusnet.com.au (mail108.syd.optusnet.com.au
	[211.29.132.59]) by relay.mimecast.com with ESMTP id
	us-mta-594-_zQhVYxwPVSWez4fENgn1g-1; Sun, 06 Dec 2020 16:04:53 -0500
X-MC-Unique: _zQhVYxwPVSWez4fENgn1g-1
Received: from dread.disaster.area (pa49-179-6-140.pa.nsw.optusnet.com.au
	[49.179.6.140])
	by mail108.syd.optusnet.com.au (Postfix) with ESMTPS id F08A11AC887;
	Mon,  7 Dec 2020 08:04:48 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1km1D3-001Dtb-0V; Mon, 07 Dec 2020 08:04:45 +1100
Date: Mon, 7 Dec 2020 08:04:45 +1100
From: Dave Chinner <david@fromorbit.com>
To: Yafang Shao <laoar.shao@gmail.com>
Message-ID: <20201206210445.GI3913616@dread.disaster.area>
References: <20201206064046.2921-1-laoar.shao@gmail.com>
	<20201206064046.2921-3-laoar.shao@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201206064046.2921-3-laoar.shao@gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=YKPhNiOx c=1 sm=1 tr=0 cx=a_idp_d
	a=uDU3YIYVKEaHT0eX+MXYOQ==:117 a=uDU3YIYVKEaHT0eX+MXYOQ==:17
	a=kj9zAlcOel0A:10 a=zTNgK-yGK50A:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
	a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8
	a=FYxHPdz51nehZZpLQW4A:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
	a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
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
Cc: darrick.wong@oracle.com, willy@infradead.org, 000akpm@linux-foundation.org,
	hch@infradead.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, mhocko@kernel.org,
	Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v9 2/2] xfs: avoid transaction
	reservation recursion
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 06, 2020 at 02:40:46PM +0800, Yafang Shao wrote:
> PF_FSTRANS which is used to avoid transaction reservation recursion, is
> dropped since commit 9070733b4efa ("xfs: abstract PF_FSTRANS to
> PF_MEMALLOC_NOFS") and commit 7dea19f9ee63 ("mm: introduce
> memalloc_nofs_{save,restore} API") and replaced by PF_MEMALLOC_NOFS which
> means to avoid filesystem reclaim recursion. That change is subtle.
> Let's take the exmple of the check of WARN_ON_ONCE(current->flags &
> PF_MEMALLOC_NOFS)) to explain why this abstraction from PF_FSTRANS to
> PF_MEMALLOC_NOFS is not proper.
> Below comment is quoted from Dave,
> > It wasn't for memory allocation recursion protection in XFS - it was for
> > transaction reservation recursion protection by something trying to flush
> > data pages while holding a transaction reservation. Doing
> > this could deadlock the journal because the existing reservation
> > could prevent the nested reservation for being able to reserve space
> > in the journal and that is a self-deadlock vector.
> > IOWs, this check is not protecting against memory reclaim recursion
> > bugs at all (that's the previous check [1]). This check is
> > protecting against the filesystem calling writepages directly from a
> > context where it can self-deadlock.
> > So what we are seeing here is that the PF_FSTRANS ->
> > PF_MEMALLOC_NOFS abstraction lost all the actual useful information
> > about what type of error this check was protecting against.
> 
> As a result, we should reintroduce PF_FSTRANS. As current->journal_info
> isn't used in XFS, we can reuse it to indicate whehter the task is in
> fstrans or not, Per Willy. To achieve that, some new helpers are introduce
> in this patch, per Dave:
> - xfs_trans_context_set()
>   Used in xfs_trans_alloc()
> - xfs_trans_context_clear()
>   Used in xfs_trans_commit() and xfs_trans_cancel()
> - xfs_trans_context_active()
>   To check whehter current is in fs transcation or not
> 
> Darrick helped fix the error occurred in xfs/141.[2]
> 
> No obvious error occurred when I run xfstests in my test machine.
> 
> [1]. Below check is to avoid memory reclaim recursion.
> if (WARN_ON_ONCE((current->flags & (PF_MEMALLOC|PF_KSWAPD)) ==
>         PF_MEMALLOC))
>         goto redirty;
> 
> [2]. https://lore.kernel.org/linux-xfs/20201104001649.GN7123@magnolia/
> 
> Cc: Darrick J. Wong <darrick.wong@oracle.com>
> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Dave Chinner <david@fromorbit.com>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: David Howells <dhowells@redhat.com>
> Cc: Jeff Layton <jlayton@redhat.com>
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> ---
>  fs/iomap/buffered-io.c |  7 -------
>  fs/xfs/xfs_aops.c      | 23 +++++++++++++++++++++--
>  fs/xfs/xfs_linux.h     |  4 ----
>  fs/xfs/xfs_trans.c     | 25 +++++++++++++------------
>  fs/xfs/xfs_trans.h     | 23 +++++++++++++++++++++++
>  5 files changed, 57 insertions(+), 25 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 10cc7979ce38..3c53fa6ce64d 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -1458,13 +1458,6 @@ iomap_do_writepage(struct page *page, struct writeback_control *wbc, void *data)
>  			PF_MEMALLOC))
>  		goto redirty;
>  
> -	/*
> -	 * Given that we do not allow direct reclaim to call us, we should
> -	 * never be called in a recursive filesystem reclaim context.
> -	 */
> -	if (WARN_ON_ONCE(current->flags & PF_MEMALLOC_NOFS))
> -		goto redirty;
> -

So this would have given us a warning if something went wrong...

> @@ -568,6 +569,16 @@ xfs_vm_writepage(
>  {
>  	struct xfs_writepage_ctx wpc = { };
>  
> +	/*
> +	 * Given that we do not allow direct reclaim to call us, we should
> +	 * never be called while in a filesystem transaction.
> +	 */
> +	if (xfs_trans_context_active()) {
> +		redirty_page_for_writepage(wbc, page);
> +		unlock_page(page);
> +		return 0;
> +	}
> +
>  	return iomap_writepage(page, wbc, &wpc.ctx, &xfs_writeback_ops);
>  }
>  
> @@ -579,6 +590,14 @@ xfs_vm_writepages(
>  	struct xfs_writepage_ctx wpc = { };
>  
>  	xfs_iflags_clear(XFS_I(mapping->host), XFS_ITRUNCATED);
> +
> +	/*
> +	 * Given that we do not allow direct reclaim to call us, we should
> +	 * never be called while in a filesystem transaction.
> +	 */
> +	if (xfs_trans_context_active())
> +		return 0;
> +
>  	return iomap_writepages(mapping, wbc, &wpc.ctx, &xfs_writeback_ops);
>  }

But neither of these will trigger a warning at all, so we won't know
that there's a bug in the code at all. Given this is primarily a "we
have a bug in the code" deadlock avoidance check, we really need the
noisy warnings if these fire...

> diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
> index c94e71f741b6..09ae5c181299 100644
> --- a/fs/xfs/xfs_trans.c
> +++ b/fs/xfs/xfs_trans.c
> @@ -67,6 +67,11 @@ xfs_trans_free(
>  	xfs_extent_busy_sort(&tp->t_busy);
>  	xfs_extent_busy_clear(tp->t_mountp, &tp->t_busy, false);
>  
> +	/* Detach the transaction from this thread. */
> +	ASSERT(current->journal_info != NULL);
> +	if (current->journal_info == tp)
> +		xfs_trans_context_clear(tp);

>From the context of this patch and the code it is replacing, I have
no idea why this condition could occur, so this needs a comment
explaining when current->journal_info is not equal to the
transaction we are freeing.

> +
>  	trace_xfs_trans_free(tp, _RET_IP_);
>  	if (!(tp->t_flags & XFS_TRANS_NO_WRITECOUNT))
>  		sb_end_intwrite(tp->t_mountp->m_super);
> @@ -119,7 +124,11 @@ xfs_trans_dup(
>  
>  	ntp->t_rtx_res = tp->t_rtx_res - tp->t_rtx_res_used;
>  	tp->t_rtx_res = tp->t_rtx_res_used;
> +
> +	/* Associate the new transaction with this thread. */
> +	ASSERT(current->journal_info == tp);
>  	ntp->t_pflags = tp->t_pflags;
> +	current->journal_info = ntp;

Why is this open coded and not in a helper like all the
current->journal_info manipulations? Something like
xfs_trans_context_swap(tp, ntp) with a comment explaining that it is
used to transfer the transaction context when rolling a permanent
transaction?

>  
>  	/* move deferred ops over to the new tp */
>  	xfs_defer_move(ntp, tp);
> @@ -153,8 +162,6 @@ xfs_trans_reserve(
>  	int			error = 0;
>  	bool			rsvd = (tp->t_flags & XFS_TRANS_RESERVE) != 0;
>  
> -	/* Mark this thread as being in a transaction */
> -	current_set_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
>  
>  	/*
>  	 * Attempt to reserve the needed disk blocks by decrementing
> @@ -163,10 +170,8 @@ xfs_trans_reserve(
>  	 */
>  	if (blocks > 0) {
>  		error = xfs_mod_fdblocks(mp, -((int64_t)blocks), rsvd);
> -		if (error != 0) {
> -			current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> +		if (error != 0)
>  			return -ENOSPC;
> -		}
>  		tp->t_blk_res += blocks;
>  	}
>  
> @@ -241,8 +246,6 @@ xfs_trans_reserve(
>  		tp->t_blk_res = 0;
>  	}
>  
> -	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> -
>  	return error;
>  }
>  
> @@ -284,6 +287,8 @@ xfs_trans_alloc(
>  	INIT_LIST_HEAD(&tp->t_dfops);
>  	tp->t_firstblock = NULLFSBLOCK;
>  
> +	/* Mark this thread as being in a transaction */
> +	xfs_trans_context_set(tp);
>  	error = xfs_trans_reserve(tp, resp, blocks, rtextents);
>  	if (error) {
>  		xfs_trans_cancel(tp);

This refactoring should probably be a separate patch, done first.

> @@ -878,7 +883,6 @@ __xfs_trans_commit(
>  
>  	xfs_log_commit_cil(mp, tp, &commit_lsn, regrant);
>  
> -	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
>  	xfs_trans_free(tp);
>  
>  	/*
> @@ -910,7 +914,7 @@ __xfs_trans_commit(
>  			xfs_log_ticket_ungrant(mp->m_log, tp->t_ticket);
>  		tp->t_ticket = NULL;
>  	}
> -	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> +
>  	xfs_trans_free_items(tp, !!error);
>  	xfs_trans_free(tp);
>  
> @@ -970,9 +974,6 @@ xfs_trans_cancel(
>  		tp->t_ticket = NULL;
>  	}
>  
> -	/* mark this thread as no longer being in a transaction */
> -	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> -
>  	xfs_trans_free_items(tp, dirty);
>  	xfs_trans_free(tp);
>  }

And moving current_restore_flags_nested() into xfs_trans_free()
should also probably be a separate patch.

That way this patch is simply changing all the flags manipulations
to use the new wrappers, and not a mix of refactoring and API
rework...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

