Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 075712DDB37
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Dec 2020 23:15:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-jMZzdB6kM6OcS3e6a_Jv4w-1; Thu, 17 Dec 2020 17:15:34 -0500
X-MC-Unique: jMZzdB6kM6OcS3e6a_Jv4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3937801B15;
	Thu, 17 Dec 2020 22:15:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73100669EC;
	Thu, 17 Dec 2020 22:15:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79A7C180954D;
	Thu, 17 Dec 2020 22:15:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BHMFNOg005162 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 17 Dec 2020 17:15:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 680272026D13; Thu, 17 Dec 2020 22:15:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6308B2026D48
	for <linux-cachefs@redhat.com>; Thu, 17 Dec 2020 22:15:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C65B380018D
	for <linux-cachefs@redhat.com>; Thu, 17 Dec 2020 22:15:19 +0000 (UTC)
Received: from mail109.syd.optusnet.com.au (mail109.syd.optusnet.com.au
	[211.29.132.80]) by relay.mimecast.com with ESMTP id
	us-mta-358-YMea7cIoPsKui3TF5RrKAQ-1; Thu, 17 Dec 2020 17:15:15 -0500
X-MC-Unique: YMea7cIoPsKui3TF5RrKAQ-1
Received: from dread.disaster.area (pa49-179-6-140.pa.nsw.optusnet.com.au
	[49.179.6.140])
	by mail109.syd.optusnet.com.au (Postfix) with ESMTPS id 3716D63828;
	Fri, 18 Dec 2020 09:15:10 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1kq1YD-0053Mh-6c; Fri, 18 Dec 2020 09:15:09 +1100
Date: Fri, 18 Dec 2020 09:15:09 +1100
From: Dave Chinner <david@fromorbit.com>
To: Yafang Shao <laoar.shao@gmail.com>
Message-ID: <20201217221509.GQ632069@dread.disaster.area>
References: <20201217011157.92549-1-laoar.shao@gmail.com>
	<20201217011157.92549-4-laoar.shao@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201217011157.92549-4-laoar.shao@gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=YKPhNiOx c=1 sm=1 tr=0 cx=a_idp_d
	a=uDU3YIYVKEaHT0eX+MXYOQ==:117 a=uDU3YIYVKEaHT0eX+MXYOQ==:17
	a=kj9zAlcOel0A:10 a=zTNgK-yGK50A:10 a=VwQbUJbxAAAA:8 a=7-415B0cAAAA:8
	a=JnNKH_yNLsiQyFxd-UEA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
	a=biEYGPWJfzWAr4FL6Ov7:22
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: darrick.wong@oracle.com, willy@infradead.org, mhocko@kernel.org,
	hch@infradead.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 17, 2020 at 09:11:56AM +0800, Yafang Shao wrote:
> The xfs_trans context should be active after it is allocated, and
> deactive when it is freed.
> The rolling transaction should be specially considered, because in the
> case when we clear the old transaction the thread's NOFS state shouldn't
> be changed, as a result we have to set NOFS in the old transaction's
> t_pflags in xfs_trans_context_swap().
> 
> So these helpers are refactored as,
> - xfs_trans_context_set()
>   Used in xfs_trans_alloc()
> - xfs_trans_context_clear()
>   Used in xfs_trans_free()
> 
> And a new helper is instroduced to handle the rolling transaction,
> - xfs_trans_context_swap()
>   Used in rolling transaction
> 
> This patch is based on Darrick's work to fix the issue in xfs/141 in the
> earlier version. [1]
> 
> 1. https://lore.kernel.org/linux-xfs/20201104001649.GN7123@magnolia

As I said in my last comments, this change of logic is not
necessary.  All we need to do is transfer the NOFS state to the new
transactions and *remove it from the old one*.

IOWs, all this patch should do is:

> @@ -119,7 +123,9 @@ xfs_trans_dup(
>  
>  	ntp->t_rtx_res = tp->t_rtx_res - tp->t_rtx_res_used;
>  	tp->t_rtx_res = tp->t_rtx_res_used;
> -	ntp->t_pflags = tp->t_pflags;
> +
> +	/* Associate the new transaction with this thread. */
> +	xfs_trans_context_swap(tp, ntp);
>  
>  	/* move deferred ops over to the new tp */
>  	xfs_defer_move(ntp, tp);

This, and

> diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
> index 44b11c64a15e..12380eaaf7ce 100644
> --- a/fs/xfs/xfs_trans.h
> +++ b/fs/xfs/xfs_trans.h
> @@ -280,4 +280,17 @@ xfs_trans_context_clear(struct xfs_trans *tp)
>  	memalloc_nofs_restore(tp->t_pflags);
>  }
>  
> +static inline void
> +xfs_trans_context_swap(struct xfs_trans *tp, struct xfs_trans *ntp)
> +{

introduce this wrapper.

> +	ntp->t_pflags = tp->t_pflags;
> +	/*
> +	 * For the rolling transaction, we have to set NOFS in the old
> +	 * transaction's t_pflags so that when we clear the context on
> +	 * the old transaction we don't actually change the thread's NOFS
> +	 * state.
> +	 */
> +	tp->t_pflags = current->flags | PF_MEMALLOC_NOFS;
> +}

But not with this implementation.

Think for a minute, please. All we want to do is avoid clearing
the nofs state when we call xfs_trans_context_clear(tp) if the state
has been handed to another transaction.

Your current implementation hands the state to ntp, but *then leaves
it on tp* as well. So then you hack a PF_MEMALLOC_NOFS flag into
tp->t_pflags so that it doesn't clear that flag (abusing the masking
done during clearing). That's just nasty because it relies on
internal memalloc_nofs_restore() details for correct functionality.

The obvious solution: we've moved the saved process state to a
different context, so it is no longer needed for the current
transaction we are about to commit. So How about just clearing the
saved state from the original transaction when swappingi like so:

static inline void
xfs_trans_context_swap(struct xfs_trans *tp, struct xfs_trans *ntp)
{
	ntp->t_pflags = tp->t_pflags;
	tp->t_flags = 0;
}

And now, when we go to clear the transaction context, we can simply
do this:

static inline void
xfs_trans_context_clear(struct xfs_trans *tp)
{
	if (tp->t_pflags)
		memalloc_nofs_restore(tp->t_pflags);
}

and the problem is solved. The NOFS state will follow the active
transaction and not be reset until the entire transaction chain is
completed.

In the next patch you can go and introduce current->journal_info
into just the wrapper functions, maintaining the same overall
logic.

-Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

