Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C1EE52DCB8E
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Dec 2020 05:00:56 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-m44l29x1Ot2W4fcb_t1nZA-1; Wed, 16 Dec 2020 23:00:53 -0500
X-MC-Unique: m44l29x1Ot2W4fcb_t1nZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF5DF18C43C5;
	Thu, 17 Dec 2020 04:00:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E874418017;
	Thu, 17 Dec 2020 04:00:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B9B4180954D;
	Thu, 17 Dec 2020 04:00:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BH40l78014354 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 16 Dec 2020 23:00:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 07C3B2026D13; Thu, 17 Dec 2020 04:00:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03BC32026D76
	for <linux-cachefs@redhat.com>; Thu, 17 Dec 2020 04:00:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E0E3186E120
	for <linux-cachefs@redhat.com>; Thu, 17 Dec 2020 04:00:44 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-156-NQAAMtpHPNCzagZARoE_Zg-1; Wed, 16 Dec 2020 23:00:40 -0500
X-MC-Unique: NQAAMtpHPNCzagZARoE_Zg-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1kpkSr-0003IO-Dp; Thu, 17 Dec 2020 04:00:29 +0000
Date: Thu, 17 Dec 2020 04:00:29 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20201217040029.GC15600@casper.infradead.org>
References: <20201217011157.92549-1-laoar.shao@gmail.com>
	<20201217011157.92549-2-laoar.shao@gmail.com>
	<20201217030609.GP632069@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20201217030609.GP632069@dread.disaster.area>
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
Cc: Michal Hocko <mhocko@suse.com>, linux-cachefs@redhat.com,
	darrick.wong@oracle.com, mhocko@kernel.org, hch@infradead.org,
	linux-mm@kvack.org, Yafang Shao <laoar.shao@gmail.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 17, 2020 at 02:06:09PM +1100, Dave Chinner wrote:
> On Thu, Dec 17, 2020 at 09:11:54AM +0800, Yafang Shao wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > 
> > Since XFS needs to pretend to be kswapd in some of its worker threads,
> > create methods to save & restore kswapd state.  Don't bother restoring
> > kswapd state in kswapd -- the only time we reach this code is when we're
> > exiting and the task_struct is about to be destroyed anyway.
...
> > @@ -3932,8 +3920,6 @@ static int kswapd(void *p)
> >  			goto kswapd_try_sleep;
> >  	}
> >  
> > -	tsk->flags &= ~(PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD);
> > -
> 
> Missing a restore_kswapd()?

Deliberately.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

