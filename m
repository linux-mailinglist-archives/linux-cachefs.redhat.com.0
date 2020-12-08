Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A46272D3590
	for <lists+linux-cachefs@lfdr.de>; Tue,  8 Dec 2020 22:50:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-6TR7FOwcOuSwDqU-DqfuZg-1; Tue, 08 Dec 2020 16:50:33 -0500
X-MC-Unique: 6TR7FOwcOuSwDqU-DqfuZg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80A601005504;
	Tue,  8 Dec 2020 21:50:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE0745D6AB;
	Tue,  8 Dec 2020 21:50:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AAFF1180954D;
	Tue,  8 Dec 2020 21:50:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B8J5GBT029613 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 14:05:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 87E172166B29; Tue,  8 Dec 2020 19:05:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82C9D2166B27
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 19:05:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 292DA100FBC5
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 19:05:14 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-557-p58GPpriMWGpEuvZ1nLi7w-1; Tue, 08 Dec 2020 14:05:09 -0500
X-MC-Unique: p58GPpriMWGpEuvZ1nLi7w-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	0B8Itcot067615; Tue, 8 Dec 2020 19:04:58 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2120.oracle.com with ESMTP id 35825m4h13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 08 Dec 2020 19:04:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	0B8Ismhj150107; Tue, 8 Dec 2020 19:02:58 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 358ksp0d65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Dec 2020 19:02:58 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B8J2uWR021934;
	Tue, 8 Dec 2020 19:02:56 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 08 Dec 2020 11:02:56 -0800
Date: Tue, 8 Dec 2020 11:02:54 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Yafang Shao <laoar.shao@gmail.com>
Message-ID: <20201208190254.GE1943235@magnolia>
References: <20201208122824.16118-1-laoar.shao@gmail.com>
	<20201208122824.16118-3-laoar.shao@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201208122824.16118-3-laoar.shao@gmail.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
	suspectscore=5
	bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2012080115
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=5
	adultscore=0 bulkscore=0
	phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
	mlxscore=0
	spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
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
X-Mailman-Approved-At: Tue, 08 Dec 2020 16:50:22 -0500
Cc: david@fromorbit.com, willy@infradead.org, mhocko@kernel.org,
	hch@infradead.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
	Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v11 2/4] xfs: use memalloc_nofs_{save,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 08, 2020 at 08:28:22PM +0800, Yafang Shao wrote:
> Introduce a new API to mark the start and end of XFS transactions.
> For now, just save and restore the memalloc_nofs flags.
> 
> The new helpers as follows,
> - xfs_trans_context_set
>   Mark the start of XFS transactions
> - xfs_trans_context_clear
>   Mark the end of XFS transactions
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

It's a little strange to add the wrappers and convert the current->flags
modification macros to the memalloc_nofs_* functions in one patch, but
whatever, I'm more concerned about the things I complained about in the
next two patches.

Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

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

