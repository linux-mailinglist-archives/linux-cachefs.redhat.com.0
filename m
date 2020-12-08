Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5710A2D2117
	for <lists+linux-cachefs@lfdr.de>; Tue,  8 Dec 2020 03:46:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-7twz18cIMvGKGgR7BVWkOg-1; Mon, 07 Dec 2020 21:46:56 -0500
X-MC-Unique: 7twz18cIMvGKGgR7BVWkOg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67D54801B12;
	Tue,  8 Dec 2020 02:46:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDB92272D2;
	Tue,  8 Dec 2020 02:46:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B5304BB40;
	Tue,  8 Dec 2020 02:46:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B82kpJB020419 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 21:46:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BBEB52166B2A; Tue,  8 Dec 2020 02:46:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6ACE2166B27
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 02:46:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6148280018D
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 02:46:49 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-220-PmZlmNJmOJWPZkV1tkB-Jg-1; Mon, 07 Dec 2020 21:46:47 -0500
X-MC-Unique: PmZlmNJmOJWPZkV1tkB-Jg-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1kmT1R-00036C-IO; Tue, 08 Dec 2020 02:46:37 +0000
Date: Tue, 8 Dec 2020 02:46:37 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Yafang Shao <laoar.shao@gmail.com>
Message-ID: <20201208024637.GG7338@casper.infradead.org>
References: <20201208021543.76501-1-laoar.shao@gmail.com>
	<20201208021543.76501-3-laoar.shao@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201208021543.76501-3-laoar.shao@gmail.com>
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
Cc: darrick.wong@oracle.com, david@fromorbit.com, mhocko@kernel.org,
	hch@infradead.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 08, 2020 at 10:15:41AM +0800, Yafang Shao wrote:
> memalloc_nofs_{save,restore} API is introduced in
> commit 7dea19f9ee63 ("mm: introduce memalloc_nofs_{save,restore} API"),
> which gives a better abstraction of the usage around PF_MEMALLOC_NOFS. We'd
> better use this API in XFS instead of using PF_MEMALLOC_NOFS directly as
> well.
> 
> To prepare for the followup patch, two new helpers are introduced in XFS
> to wrap the memalloc_nofs_{save,restore} API, as follows,
> 
> static inline void
> xfs_trans_context_set(struct xfs_trans *tp)
> {
> 	tp->t_pflags = memalloc_nofs_save();
> }
> 
> static inline void
> xfs_trans_context_clear(struct xfs_trans *tp)
> {
> 	memalloc_nofs_restore(tp->t_pflags);
> }

Don't repeat the contents of the patch in the changelog.

Also, this ordering of patches doesn't make sense.  If I saw this
patch by itself instead of part of the series, there's no good reason
to replace one xfs-specific wrapper (current_set_flags_nested) with
another (xfs_trans_context_set).

If the changelog here said something like ...

Introduce a new API to mark the start and end of XFS transactions.
For now, just save and restore the memalloc_nofs flags.

... then it might make more sense to do things in this order.

> These two new helpers are added into xfs_tans.h as they are used in xfs
> transaction only.
> 
> Cc: Darrick J. Wong <darrick.wong@oracle.com>
> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Dave Chinner <david@fromorbit.com>
> Cc: Michal Hocko <mhocko@kernel.org>
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> ---
>  fs/xfs/xfs_aops.c  |  4 ++--
>  fs/xfs/xfs_linux.h |  4 ----
>  fs/xfs/xfs_trans.c | 13 +++++++------
>  fs/xfs/xfs_trans.h | 12 ++++++++++++
>  4 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
> index 4304c6416fbb..2371187b7615 100644
> --- a/fs/xfs/xfs_aops.c
> +++ b/fs/xfs/xfs_aops.c
> @@ -62,7 +62,7 @@ xfs_setfilesize_trans_alloc(
>  	 * We hand off the transaction to the completion thread now, so
>  	 * clear the flag here.
>  	 */
> -	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> +	xfs_trans_context_clear(tp);
>  	return 0;
>  }
>  
> @@ -125,7 +125,7 @@ xfs_setfilesize_ioend(
>  	 * thus we need to mark ourselves as being in a transaction manually.
>  	 * Similarly for freeze protection.
>  	 */
> -	current_set_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> +	xfs_trans_context_set(tp);
>  	__sb_writers_acquired(VFS_I(ip)->i_sb, SB_FREEZE_FS);
>  
>  	/* we abort the update if there was an IO error */
> diff --git a/fs/xfs/xfs_linux.h b/fs/xfs/xfs_linux.h
> index 5b7a1e201559..6ab0f8043c73 100644
> --- a/fs/xfs/xfs_linux.h
> +++ b/fs/xfs/xfs_linux.h
> @@ -102,10 +102,6 @@ typedef __u32			xfs_nlink_t;
>  #define xfs_cowb_secs		xfs_params.cowb_timer.val
>  
>  #define current_cpu()		(raw_smp_processor_id())
> -#define current_set_flags_nested(sp, f)		\
> -		(*(sp) = current->flags, current->flags |= (f))
> -#define current_restore_flags_nested(sp, f)	\
> -		(current->flags = ((current->flags & ~(f)) | (*(sp) & (f))))
>  
>  #define NBBY		8		/* number of bits per byte */
>  
> diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
> index c94e71f741b6..11d390f0d3f2 100644
> --- a/fs/xfs/xfs_trans.c
> +++ b/fs/xfs/xfs_trans.c
> @@ -154,7 +154,7 @@ xfs_trans_reserve(
>  	bool			rsvd = (tp->t_flags & XFS_TRANS_RESERVE) != 0;
>  
>  	/* Mark this thread as being in a transaction */
> -	current_set_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> +	xfs_trans_context_set(tp);
>  
>  	/*
>  	 * Attempt to reserve the needed disk blocks by decrementing
> @@ -164,7 +164,7 @@ xfs_trans_reserve(
>  	if (blocks > 0) {
>  		error = xfs_mod_fdblocks(mp, -((int64_t)blocks), rsvd);
>  		if (error != 0) {
> -			current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> +			xfs_trans_context_clear(tp);
>  			return -ENOSPC;
>  		}
>  		tp->t_blk_res += blocks;
> @@ -241,7 +241,7 @@ xfs_trans_reserve(
>  		tp->t_blk_res = 0;
>  	}
>  
> -	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> +	xfs_trans_context_clear(tp);
>  
>  	return error;
>  }
> @@ -878,7 +878,7 @@ __xfs_trans_commit(
>  
>  	xfs_log_commit_cil(mp, tp, &commit_lsn, regrant);
>  
> -	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> +	xfs_trans_context_clear(tp);
>  	xfs_trans_free(tp);
>  
>  	/*
> @@ -910,7 +910,8 @@ __xfs_trans_commit(
>  			xfs_log_ticket_ungrant(mp->m_log, tp->t_ticket);
>  		tp->t_ticket = NULL;
>  	}
> -	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> +
> +	xfs_trans_context_clear(tp);
>  	xfs_trans_free_items(tp, !!error);
>  	xfs_trans_free(tp);
>  
> @@ -971,7 +972,7 @@ xfs_trans_cancel(
>  	}
>  
>  	/* mark this thread as no longer being in a transaction */
> -	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
> +	xfs_trans_context_clear(tp);
>  
>  	xfs_trans_free_items(tp, dirty);
>  	xfs_trans_free(tp);
> diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
> index 084658946cc8..44b11c64a15e 100644
> --- a/fs/xfs/xfs_trans.h
> +++ b/fs/xfs/xfs_trans.h
> @@ -268,4 +268,16 @@ xfs_trans_item_relog(
>  	return lip->li_ops->iop_relog(lip, tp);
>  }
>  
> +static inline void
> +xfs_trans_context_set(struct xfs_trans *tp)
> +{
> +	tp->t_pflags = memalloc_nofs_save();
> +}
> +
> +static inline void
> +xfs_trans_context_clear(struct xfs_trans *tp)
> +{
> +	memalloc_nofs_restore(tp->t_pflags);
> +}
> +
>  #endif	/* __XFS_TRANS_H__ */
> -- 
> 2.18.4
> 
> 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

