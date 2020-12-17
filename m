Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 82FBC2DDBC0
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Dec 2020 00:07:14 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-ArOP8GutObi-va2w9zm75w-1; Thu, 17 Dec 2020 18:07:12 -0500
X-MC-Unique: ArOP8GutObi-va2w9zm75w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 206FB800D55;
	Thu, 17 Dec 2020 23:07:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1EEC10013C0;
	Thu, 17 Dec 2020 23:07:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 02FD84BB40;
	Thu, 17 Dec 2020 23:07:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BHN75HR009632 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 17 Dec 2020 18:07:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4B4E9EE388; Thu, 17 Dec 2020 23:07:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42953EE844
	for <linux-cachefs@redhat.com>; Thu, 17 Dec 2020 23:07:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73BAA8007DF
	for <linux-cachefs@redhat.com>; Thu, 17 Dec 2020 23:07:01 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-100-6tWpWZOiNuO_0FZ5YRSixQ-1; Thu, 17 Dec 2020 18:06:57 -0500
X-MC-Unique: 6tWpWZOiNuO_0FZ5YRSixQ-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	0BHMxmD2167996; Thu, 17 Dec 2020 23:06:33 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2120.oracle.com with ESMTP id 35cntmfwfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 17 Dec 2020 23:06:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	0BHN1JBp144449; Thu, 17 Dec 2020 23:06:33 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 35d7erjp92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Dec 2020 23:06:33 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BHN6TUd022834;
	Thu, 17 Dec 2020 23:06:29 GMT
Received: from localhost (/10.159.157.202)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 17 Dec 2020 15:06:29 -0800
Date: Thu, 17 Dec 2020 15:06:27 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20201217230627.GB6911@magnolia>
References: <20201217011157.92549-1-laoar.shao@gmail.com>
	<20201217011157.92549-4-laoar.shao@gmail.com>
	<20201217221509.GQ632069@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20201217221509.GQ632069@dread.disaster.area>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	spamscore=0 bulkscore=0
	suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2012170149
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
	phishscore=0 mlxscore=0
	lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
	suspectscore=0
	mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1015
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2012170149
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 18, 2020 at 09:15:09AM +1100, Dave Chinner wrote:
> On Thu, Dec 17, 2020 at 09:11:56AM +0800, Yafang Shao wrote:
> > The xfs_trans context should be active after it is allocated, and
> > deactive when it is freed.
> > The rolling transaction should be specially considered, because in the
> > case when we clear the old transaction the thread's NOFS state shouldn't
> > be changed, as a result we have to set NOFS in the old transaction's
> > t_pflags in xfs_trans_context_swap().
> > 
> > So these helpers are refactored as,
> > - xfs_trans_context_set()
> >   Used in xfs_trans_alloc()
> > - xfs_trans_context_clear()
> >   Used in xfs_trans_free()
> > 
> > And a new helper is instroduced to handle the rolling transaction,
> > - xfs_trans_context_swap()
> >   Used in rolling transaction
> > 
> > This patch is based on Darrick's work to fix the issue in xfs/141 in the
> > earlier version. [1]
> > 
> > 1. https://lore.kernel.org/linux-xfs/20201104001649.GN7123@magnolia
> 
> As I said in my last comments, this change of logic is not
> necessary.  All we need to do is transfer the NOFS state to the new
> transactions and *remove it from the old one*.
> 
> IOWs, all this patch should do is:
> 
> > @@ -119,7 +123,9 @@ xfs_trans_dup(
> >  
> >  	ntp->t_rtx_res = tp->t_rtx_res - tp->t_rtx_res_used;
> >  	tp->t_rtx_res = tp->t_rtx_res_used;
> > -	ntp->t_pflags = tp->t_pflags;
> > +
> > +	/* Associate the new transaction with this thread. */
> > +	xfs_trans_context_swap(tp, ntp);
> >  
> >  	/* move deferred ops over to the new tp */
> >  	xfs_defer_move(ntp, tp);
> 
> This, and
> 
> > diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
> > index 44b11c64a15e..12380eaaf7ce 100644
> > --- a/fs/xfs/xfs_trans.h
> > +++ b/fs/xfs/xfs_trans.h
> > @@ -280,4 +280,17 @@ xfs_trans_context_clear(struct xfs_trans *tp)
> >  	memalloc_nofs_restore(tp->t_pflags);
> >  }
> >  
> > +static inline void
> > +xfs_trans_context_swap(struct xfs_trans *tp, struct xfs_trans *ntp)
> > +{
> 
> introduce this wrapper.
> 
> > +	ntp->t_pflags = tp->t_pflags;
> > +	/*
> > +	 * For the rolling transaction, we have to set NOFS in the old
> > +	 * transaction's t_pflags so that when we clear the context on
> > +	 * the old transaction we don't actually change the thread's NOFS
> > +	 * state.
> > +	 */
> > +	tp->t_pflags = current->flags | PF_MEMALLOC_NOFS;
> > +}
> 
> But not with this implementation.
> 
> Think for a minute, please. All we want to do is avoid clearing
> the nofs state when we call xfs_trans_context_clear(tp) if the state
> has been handed to another transaction.
> 
> Your current implementation hands the state to ntp, but *then leaves
> it on tp* as well. So then you hack a PF_MEMALLOC_NOFS flag into
> tp->t_pflags so that it doesn't clear that flag (abusing the masking
> done during clearing). That's just nasty because it relies on
> internal memalloc_nofs_restore() details for correct functionality.
> 
> The obvious solution: we've moved the saved process state to a
> different context, so it is no longer needed for the current
> transaction we are about to commit. So How about just clearing the
> saved state from the original transaction when swappingi like so:
> 
> static inline void
> xfs_trans_context_swap(struct xfs_trans *tp, struct xfs_trans *ntp)
> {
> 	ntp->t_pflags = tp->t_pflags;
> 	tp->t_flags = 0;
> }
> 
> And now, when we go to clear the transaction context, we can simply
> do this:
> 
> static inline void
> xfs_trans_context_clear(struct xfs_trans *tp)
> {
> 	if (tp->t_pflags)
> 		memalloc_nofs_restore(tp->t_pflags);
> }
> 
> and the problem is solved. The NOFS state will follow the active
> transaction and not be reset until the entire transaction chain is
> completed.

Er... correct me if I'm wrong, but I thought t_pflags stores the old
state of current->flags from before we call xfs_trans_alloc?  So if we
call into xfs_trans_alloc with current->flags==0 and we commit the
transaction having not rolled, we won't unset the _NOFS state, and exit
back to userspace with _NOFS set.

I think the logic is correct here -- we transfer the old pflags value
from @tp to @ntp, which effectively puts @ntp in charge of restoring the
old pflags value; and then we set tp->t_pflags to current->flags, which
means that @tp will "restore" the current pflags value into pflags, which
is a nop.

--D

> In the next patch you can go and introduce current->journal_info
> into just the wrapper functions, maintaining the same overall
> logic.
> 
> -Dave.
> -- 
> Dave Chinner
> david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

