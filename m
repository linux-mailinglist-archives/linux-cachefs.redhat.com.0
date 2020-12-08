Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3B52E2D21F5
	for <lists+linux-cachefs@lfdr.de>; Tue,  8 Dec 2020 05:21:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-zTF0s3H_M6Ws5QzPcZgMdg-1; Mon, 07 Dec 2020 23:21:06 -0500
X-MC-Unique: zTF0s3H_M6Ws5QzPcZgMdg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E452BBBEE3;
	Tue,  8 Dec 2020 04:21:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E008C10016DB;
	Tue,  8 Dec 2020 04:21:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8F134BB40;
	Tue,  8 Dec 2020 04:20:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B84KbjO028236 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 23:20:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8C0BA2166B2A; Tue,  8 Dec 2020 04:20:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 871DF2166B27
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 04:20:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52FC2103B802
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 04:20:35 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-459-oHORyhnCMeGiFeiG6q2ZBg-1; Mon, 07 Dec 2020 23:20:31 -0500
X-MC-Unique: oHORyhnCMeGiFeiG6q2ZBg-1
Received: from dread.disaster.area (pa49-179-6-140.pa.nsw.optusnet.com.au
	[49.179.6.140])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id DACF93C1F3C;
	Tue,  8 Dec 2020 15:20:27 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1kmUUE-001fsm-VI; Tue, 08 Dec 2020 15:20:26 +1100
Date: Tue, 8 Dec 2020 15:20:26 +1100
From: Dave Chinner <david@fromorbit.com>
To: Yafang Shao <laoar.shao@gmail.com>
Message-ID: <20201208042026.GW3913616@dread.disaster.area>
References: <20201208021543.76501-1-laoar.shao@gmail.com>
	<20201208021543.76501-5-laoar.shao@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201208021543.76501-5-laoar.shao@gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=Ubgvt5aN c=1 sm=1 tr=0 cx=a_idp_d
	a=uDU3YIYVKEaHT0eX+MXYOQ==:117 a=uDU3YIYVKEaHT0eX+MXYOQ==:17
	a=kj9zAlcOel0A:10 a=zTNgK-yGK50A:10 a=yPCof4ZbAAAA:8 a=JfrnYn6hAAAA:8
	a=7-415B0cAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8
	a=EgeNp9WBsctHnM1Kfy0A:9 a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22
	a=biEYGPWJfzWAr4FL6Ov7:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: darrick.wong@oracle.com, willy@infradead.org, mhocko@kernel.org,
	hch@infradead.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 08, 2020 at 10:15:43AM +0800, Yafang Shao wrote:
> PF_FSTRANS which is used to avoid transaction reservation recursion, is
> dropped since commit 9070733b4efa ("xfs: abstract PF_FSTRANS to
> PF_MEMALLOC_NOFS") and commit 7dea19f9ee63 ("mm: introduce
> memalloc_nofs_{save,restore} API") and replaced by PF_MEMALLOC_NOFS which
> means to avoid filesystem reclaim recursion.
> 
> As these two flags have different meanings, we'd better reintroduce
> PF_FSTRANS back. To avoid wasting the space of PF_* flags in task_struct,
> we can reuse the current->journal_info to do that, per Willy. As the
> check of transaction reservation recursion is used by XFS only, we can
> move the check into xfs_vm_writepage(s), per Dave.
> 
> To better abstract that behavoir, two new helpers are introduced, as
> follows,
> - xfs_trans_context_active
>   To check whehter current is in fs transcation or not
> - xfs_trans_context_swap
>   Transfer the transaction context when rolling a permanent transaction
> 
> These two new helpers are instroduced in xfs_trans.h.
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
>  fs/xfs/xfs_trans.c     |  3 +++
>  fs/xfs/xfs_trans.h     | 25 +++++++++++++++++++++++++
>  4 files changed, 45 insertions(+), 7 deletions(-)
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
> index 2371187b7615..28db93d0da97 100644
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
> +	if (xfs_trans_context_active()) {
> +		redirty_page_for_writepage(wbc, page);
> +		unlock_page(page);
> +		return 0;
> +	}

hmmm. Missing warning....

> diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
> index 44b11c64a15e..82c6735e40fc 100644
> --- a/fs/xfs/xfs_trans.h
> +++ b/fs/xfs/xfs_trans.h
> @@ -268,16 +268,41 @@ xfs_trans_item_relog(
>  	return lip->li_ops->iop_relog(lip, tp);
>  }
>  
> +static inline bool
> +xfs_trans_context_active(void)
> +{
> +	/* Use journal_info to indicate current is in a transaction */
> +	if (WARN_ON_ONCE(current->journal_info != NULL))
> +		return true;
> +
> +	return false;
> +}

Ah, this is wrong. The call sites should be:

	if (WARN_ON_ONCE(xfs_trans_context_active())) {
		/* do error handling */
		return error_value;
	}

because we might want to use xfs_trans_context_active() to check if
we are in a transaction context or not and that should not generate
a warning. Also, placing the warning at the call site gives a more
accurate indication of which IO path generated the warning....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

