Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 74C662DDC53
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Dec 2020 01:15:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-FnXR7U6ZNZiqEcwhF4WF4Q-1; Thu, 17 Dec 2020 19:15:50 -0500
X-MC-Unique: FnXR7U6ZNZiqEcwhF4WF4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 764381E7C0;
	Fri, 18 Dec 2020 00:15:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF6CA60CE7;
	Fri, 18 Dec 2020 00:15:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D0F74BB40;
	Fri, 18 Dec 2020 00:15:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BI0Es6l017769 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 17 Dec 2020 19:14:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6A482EE38C; Fri, 18 Dec 2020 00:14:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64807EE37D
	for <linux-cachefs@redhat.com>; Fri, 18 Dec 2020 00:14:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 024FD811E76
	for <linux-cachefs@redhat.com>; Fri, 18 Dec 2020 00:14:52 +0000 (UTC)
Received: from mail108.syd.optusnet.com.au (mail108.syd.optusnet.com.au
	[211.29.132.59]) by relay.mimecast.com with ESMTP id
	us-mta-469-eRZVsyk9MZeqPCefm11ujA-1; Thu, 17 Dec 2020 19:14:47 -0500
X-MC-Unique: eRZVsyk9MZeqPCefm11ujA-1
Received: from dread.disaster.area (pa49-179-6-140.pa.nsw.optusnet.com.au
	[49.179.6.140])
	by mail108.syd.optusnet.com.au (Postfix) with ESMTPS id A2DC51B3DEC;
	Fri, 18 Dec 2020 11:14:43 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1kq3Pu-00559F-Q5; Fri, 18 Dec 2020 11:14:42 +1100
Date: Fri, 18 Dec 2020 11:14:42 +1100
From: Dave Chinner <david@fromorbit.com>
To: Yafang Shao <laoar.shao@gmail.com>
Message-ID: <20201218001442.GS632069@dread.disaster.area>
References: <20201217011157.92549-1-laoar.shao@gmail.com>
	<20201217011157.92549-5-laoar.shao@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201217011157.92549-5-laoar.shao@gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=Ubgvt5aN c=1 sm=1 tr=0 cx=a_idp_d
	a=uDU3YIYVKEaHT0eX+MXYOQ==:117 a=uDU3YIYVKEaHT0eX+MXYOQ==:17
	a=kj9zAlcOel0A:10 a=zTNgK-yGK50A:10 a=yPCof4ZbAAAA:8 a=JfrnYn6hAAAA:8
	a=7-415B0cAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8
	a=g3Vo3s_gVwYIqt0w1rsA:9 a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22
	a=biEYGPWJfzWAr4FL6Ov7:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: darrick.wong@oracle.com, willy@infradead.org, mhocko@kernel.org,
	hch@infradead.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 17, 2020 at 09:11:57AM +0800, Yafang Shao wrote:
> PF_FSTRANS which is used to avoid transaction reservation recursion, is
> dropped since commit 9070733b4efa ("xfs: abstract PF_FSTRANS to
> PF_MEMALLOC_NOFS") and replaced by PF_MEMALLOC_NOFS which means to avoid
> filesystem reclaim recursion.
> 
> As these two flags have different meanings, we'd better reintroduce
> PF_FSTRANS back. To avoid wasting the space of PF_* flags in task_struct,
> we can reuse the current->journal_info to do that, per Willy. As the
> check of transaction reservation recursion is used by XFS only, we can
> move the check into xfs_vm_writepage(s), per Dave.
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
>  fs/xfs/xfs_aops.c      | 17 +++++++++++++++++
>  fs/xfs/xfs_trans.h     | 26 +++++++++++++++++++-------
>  3 files changed, 36 insertions(+), 14 deletions(-)
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
>  	/*
>  	 * Is this page beyond the end of the file?
>  	 *
> diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
> index 2371187b7615..0da0242d42c3 100644
> --- a/fs/xfs/xfs_aops.c
> +++ b/fs/xfs/xfs_aops.c
> @@ -568,6 +568,16 @@ xfs_vm_writepage(
>  {
>  	struct xfs_writepage_ctx wpc = { };
>  
> +	/*
> +	 * Given that we do not allow direct reclaim to call us, we should
> +	 * never be called while in a filesystem transaction.
> +	 */

Comment is wrong. This is not protecting against direct reclaim
recursion, this is protecting against writeback from within a
transaction context.

Best to remove the comment altogether, because it is largely
redundant.

> +	if (WARN_ON_ONCE(xfs_trans_context_active())) {
> +		redirty_page_for_writepage(wbc, page);
> +		unlock_page(page);
> +		return 0;
> +	}
> +
>  	return iomap_writepage(page, wbc, &wpc.ctx, &xfs_writeback_ops);
>  }
>  
> @@ -579,6 +589,13 @@ xfs_vm_writepages(
>  	struct xfs_writepage_ctx wpc = { };
>  
>  	xfs_iflags_clear(XFS_I(mapping->host), XFS_ITRUNCATED);
> +	/*
> +	 * Given that we do not allow direct reclaim to call us, we should
> +	 * never be called while in a filesystem transaction.
> +	 */

same here.

> +	if (WARN_ON_ONCE(xfs_trans_context_active()))
> +		return 0;
> +
>  	return iomap_writepages(mapping, wbc, &wpc.ctx, &xfs_writeback_ops);
>  }
>  
> diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
> index 12380eaaf7ce..0c8140147b9b 100644
> --- a/fs/xfs/xfs_trans.h
> +++ b/fs/xfs/xfs_trans.h
> @@ -268,29 +268,41 @@ xfs_trans_item_relog(
>  	return lip->li_ops->iop_relog(lip, tp);
>  }
>  
> +static inline bool
> +xfs_trans_context_active(void)
> +{
> +	/* Use journal_info to indicate current is in a transaction */
> +	return current->journal_info != NULL;
> +}

Comment is not necessary.

> +
>  static inline void
>  xfs_trans_context_set(struct xfs_trans *tp)
>  {
> +	ASSERT(!current->journal_info);
> +	current->journal_info = tp;
>  	tp->t_pflags = memalloc_nofs_save();
>  }
>  
>  static inline void
>  xfs_trans_context_clear(struct xfs_trans *tp)
>  {
> +	/*
> +	 * If xfs_trans_context_swap() handed the NOFS context to a
> +	 * new transaction we do not clear the context here.
> +	 */

It's a transaction context, not a "NOFS context". Setting NOFS is
just something we implement inside the transaction context. More
correct would be:

	/*
	 * If we handed over the context via xfs_trans_context_swap() then 
	 * the context is no longer ours to clear.
	 */

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

