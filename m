Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B89AA2DCB2E
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Dec 2020 04:06:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-6ihaFkPpMyGGiN69BMMgCQ-1; Wed, 16 Dec 2020 22:06:35 -0500
X-MC-Unique: 6ihaFkPpMyGGiN69BMMgCQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9580800D53;
	Thu, 17 Dec 2020 03:06:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E90FB5D9D5;
	Thu, 17 Dec 2020 03:06:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7E224BB7B;
	Thu, 17 Dec 2020 03:06:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BH36PNd009185 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 16 Dec 2020 22:06:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 183EFD7B12; Thu, 17 Dec 2020 03:06:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12A13D7B01
	for <linux-cachefs@redhat.com>; Thu, 17 Dec 2020 03:06:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7216811E78
	for <linux-cachefs@redhat.com>; Thu, 17 Dec 2020 03:06:22 +0000 (UTC)
Received: from mail106.syd.optusnet.com.au (mail106.syd.optusnet.com.au
	[211.29.132.42]) by relay.mimecast.com with ESMTP id
	us-mta-215-kxc6Au12NfORLUKU14KFKA-1; Wed, 16 Dec 2020 22:06:17 -0500
X-MC-Unique: kxc6Au12NfORLUKU14KFKA-1
Received: from dread.disaster.area (pa49-179-6-140.pa.nsw.optusnet.com.au
	[49.179.6.140])
	by mail106.syd.optusnet.com.au (Postfix) with ESMTPS id 53DC35AE4BD;
	Thu, 17 Dec 2020 14:06:14 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1kpjcH-004mBp-SK; Thu, 17 Dec 2020 14:06:09 +1100
Date: Thu, 17 Dec 2020 14:06:09 +1100
From: Dave Chinner <david@fromorbit.com>
To: Yafang Shao <laoar.shao@gmail.com>
Message-ID: <20201217030609.GP632069@dread.disaster.area>
References: <20201217011157.92549-1-laoar.shao@gmail.com>
	<20201217011157.92549-2-laoar.shao@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201217011157.92549-2-laoar.shao@gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=YKPhNiOx c=1 sm=1 tr=0 cx=a_idp_d
	a=uDU3YIYVKEaHT0eX+MXYOQ==:117 a=uDU3YIYVKEaHT0eX+MXYOQ==:17
	a=kj9zAlcOel0A:10 a=zTNgK-yGK50A:10 a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8
	a=iox4zFpeAAAA:8 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8
	a=4_ML_MP96qNlA5ZoDggA:9
	a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
	a=WzC6qhA0u3u7Ye7llzcV:22
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
Cc: Michal Hocko <mhocko@suse.com>, darrick.wong@oracle.com,
	willy@infradead.org, mhocko@kernel.org, hch@infradead.org,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
	Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v13 1/4] mm: Add become_kswapd and
	restore_kswapd
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

On Thu, Dec 17, 2020 at 09:11:54AM +0800, Yafang Shao wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> Since XFS needs to pretend to be kswapd in some of its worker threads,
> create methods to save & restore kswapd state.  Don't bother restoring
> kswapd state in kswapd -- the only time we reach this code is when we're
> exiting and the task_struct is about to be destroyed anyway.
> 
> Cc: Dave Chinner <david@fromorbit.com>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> ---
>  fs/xfs/libxfs/xfs_btree.c | 14 ++++++++------
>  include/linux/sched/mm.h  | 23 +++++++++++++++++++++++
>  mm/vmscan.c               | 16 +---------------
>  3 files changed, 32 insertions(+), 21 deletions(-)
> 
> diff --git a/fs/xfs/libxfs/xfs_btree.c b/fs/xfs/libxfs/xfs_btree.c
> index 51dbff9b0908..0f35b7a38e76 100644
> --- a/fs/xfs/libxfs/xfs_btree.c
> +++ b/fs/xfs/libxfs/xfs_btree.c
> @@ -2813,8 +2813,9 @@ xfs_btree_split_worker(
>  {
>  	struct xfs_btree_split_args	*args = container_of(work,
>  						struct xfs_btree_split_args, work);
> +	bool			is_kswapd = args->kswapd;
>  	unsigned long		pflags;
> -	unsigned long		new_pflags = PF_MEMALLOC_NOFS;
> +	int			memalloc_nofs;
>  
>  	/*
>  	 * we are in a transaction context here, but may also be doing work
> @@ -2822,16 +2823,17 @@ xfs_btree_split_worker(
>  	 * temporarily to ensure that we don't block waiting for memory reclaim
>  	 * in any way.
>  	 */
> -	if (args->kswapd)
> -		new_pflags |= PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD;
> -
> -	current_set_flags_nested(&pflags, new_pflags);
> +	if (is_kswapd)
> +		pflags = become_kswapd();
> +	memalloc_nofs = memalloc_nofs_save();
>  
>  	args->result = __xfs_btree_split(args->cur, args->level, args->ptrp,
>  					 args->key, args->curp, args->stat);
>  	complete(args->done);
>  
> -	current_restore_flags_nested(&pflags, new_pflags);
> +	memalloc_nofs_restore(memalloc_nofs);
> +	if (is_kswapd)
> +		restore_kswapd(pflags);
>  }
>  
>  /*
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index d5ece7a9a403..2faf03e79a1e 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -278,6 +278,29 @@ static inline void memalloc_nocma_restore(unsigned int flags)
>  }
>  #endif
>  
> +/*
> + * Tell the memory management code that this thread is working on behalf
> + * of background memory reclaim (like kswapd).  That means that it will
> + * get access to memory reserves should it need to allocate memory in
> + * order to make forward progress.  With this great power comes great
> + * responsibility to not exhaust those reserves.
> + */
> +#define KSWAPD_PF_FLAGS		(PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD)
> +
> +static inline unsigned long become_kswapd(void)
> +{
> +	unsigned long flags = current->flags & KSWAPD_PF_FLAGS;
> +
> +	current->flags |= KSWAPD_PF_FLAGS;
> +
> +	return flags;
> +}

You can get rid of the empty lines out of this function.

> +static inline void restore_kswapd(unsigned long flags)
> +{
> +	current->flags &= ~(flags ^ KSWAPD_PF_FLAGS);
> +}

Urk, that requires thinking about to determine whether it is
correct. And it is 3 runtime logic operations (^, ~ and &) too. The
way all the memalloc_*_restore() functions restore the previous
flags is obviously correct and only requires 2 runtime logic
operations because the compiler calculates the ~ operation on the
constant. So why do it differently here? i.e.:

	current->flags = (current->flags & ~KSWAPD_PF_FLAGS) | flags;

> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3870,19 +3870,7 @@ static int kswapd(void *p)
>  	if (!cpumask_empty(cpumask))
>  		set_cpus_allowed_ptr(tsk, cpumask);
>  
> -	/*
> -	 * Tell the memory management that we're a "memory allocator",
> -	 * and that if we need more memory we should get access to it
> -	 * regardless (see "__alloc_pages()"). "kswapd" should
> -	 * never get caught in the normal page freeing logic.
> -	 *
> -	 * (Kswapd normally doesn't need memory anyway, but sometimes
> -	 * you need a small amount of memory in order to be able to
> -	 * page out something else, and this flag essentially protects
> -	 * us from recursively trying to free more memory as we're
> -	 * trying to free the first piece of memory in the first place).
> -	 */
> -	tsk->flags |= PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD;
> +	become_kswapd();
>  	set_freezable();
>  
>  	WRITE_ONCE(pgdat->kswapd_order, 0);
> @@ -3932,8 +3920,6 @@ static int kswapd(void *p)
>  			goto kswapd_try_sleep;
>  	}
>  
> -	tsk->flags &= ~(PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD);
> -

Missing a restore_kswapd()?

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

