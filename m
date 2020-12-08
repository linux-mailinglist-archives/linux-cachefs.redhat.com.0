Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EFA1A2D3633
	for <lists+linux-cachefs@lfdr.de>; Tue,  8 Dec 2020 23:26:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-r5c_X9DzM0-FOJC7yHrtyA-1; Tue, 08 Dec 2020 17:26:20 -0500
X-MC-Unique: r5c_X9DzM0-FOJC7yHrtyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD10F1034B22;
	Tue,  8 Dec 2020 22:26:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69B8F10023BD;
	Tue,  8 Dec 2020 22:26:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 04E2D180954D;
	Tue,  8 Dec 2020 22:26:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B8MQDJC018445 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 17:26:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7D9482166B2C; Tue,  8 Dec 2020 22:26:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7710B2166B2A
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 22:26:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FF6E858284
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 22:26:11 +0000 (UTC)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-502--zEosRgoP1mTWEocEWX44g-1; Tue, 08 Dec 2020 17:26:07 -0500
X-MC-Unique: -zEosRgoP1mTWEocEWX44g-1
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	0B8ItgNN077047; Tue, 8 Dec 2020 19:00:03 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2130.oracle.com with ESMTP id 357yqbvk6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 08 Dec 2020 19:00:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	0B8IuUHX094441; Tue, 8 Dec 2020 19:00:03 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3020.oracle.com with ESMTP id 358m3y5d3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Dec 2020 19:00:02 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B8J01TJ007389;
	Tue, 8 Dec 2020 19:00:01 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 08 Dec 2020 11:00:00 -0800
Date: Tue, 8 Dec 2020 10:59:59 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Yafang Shao <laoar.shao@gmail.com>
Message-ID: <20201208185959.GD1943235@magnolia>
References: <20201208122824.16118-1-laoar.shao@gmail.com>
	<20201208122824.16118-5-laoar.shao@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201208122824.16118-5-laoar.shao@gmail.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	malwarescore=0 adultscore=0
	bulkscore=0 phishscore=0 suspectscore=1 mlxscore=0 mlxlogscore=999
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2012080115
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	mlxlogscore=999
	clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
	spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
	impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2012080115
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
Cc: david@fromorbit.com, willy@infradead.org, mhocko@kernel.org,
	hch@infradead.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
	Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v11 4/4] xfs: use current->journal_info
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

On Tue, Dec 08, 2020 at 08:28:24PM +0800, Yafang Shao wrote:
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
>  fs/xfs/xfs_trans.h     | 22 ++++++++++++++++++++++
>  4 files changed, 42 insertions(+), 7 deletions(-)
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
> +	if (WARN_ON_ONCE(xfs_trans_context_active()))
> +		return 0;
> +
>  	return iomap_writepages(mapping, wbc, &wpc.ctx, &xfs_writeback_ops);
>  }
>  
> diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
> index fe20398a214e..08d4916ffb13 100644
> --- a/fs/xfs/xfs_trans.c
> +++ b/fs/xfs/xfs_trans.c
> @@ -124,6 +124,9 @@ xfs_trans_dup(
>  	tp->t_rtx_res = tp->t_rtx_res_used;
>  	ntp->t_pflags = tp->t_pflags;

This one line (ntp->t_pflags = tp->t_pflags) should move to
xfs_trans_context_swap.

--D

>  
> +	/* Associate the new transaction with this thread. */
> +	xfs_trans_context_swap(tp, ntp);
> +
>  	/* move deferred ops over to the new tp */
>  	xfs_defer_move(ntp, tp);
>  
> diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
> index 44b11c64a15e..d596a375e3bf 100644
> --- a/fs/xfs/xfs_trans.h
> +++ b/fs/xfs/xfs_trans.h
> @@ -268,16 +268,38 @@ xfs_trans_item_relog(
>  	return lip->li_ops->iop_relog(lip, tp);
>  }
>  
> +static inline bool
> +xfs_trans_context_active(void)
> +{
> +	/* Use journal_info to indicate current is in a transaction */
> +	return current->journal_info != NULL;
> +}
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
> +	ASSERT(current->journal_info == tp);
> +	current->journal_info = NULL;
>  	memalloc_nofs_restore(tp->t_pflags);
>  }
>  
> +/*
> + * Transfer the transaction context when rolling a permanent
> + * transaction.
> + */
> +static inline void
> +xfs_trans_context_swap(struct xfs_trans *tp, struct xfs_trans *ntp)
> +{
> +	ASSERT(current->journal_info == tp);
> +	current->journal_info = ntp;
> +}
> +
>  #endif	/* __XFS_TRANS_H__ */
> -- 
> 2.18.4
> 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

