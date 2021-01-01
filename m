Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A7AFA2E85C2
	for <lists+linux-cachefs@lfdr.de>; Fri,  1 Jan 2021 22:54:21 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-wec-xKEQP4mRzGqpM3OdRQ-1; Fri, 01 Jan 2021 16:54:18 -0500
X-MC-Unique: wec-xKEQP4mRzGqpM3OdRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8403F1005504;
	Fri,  1 Jan 2021 21:54:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4196460BF3;
	Fri,  1 Jan 2021 21:54:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E3364BB7B;
	Fri,  1 Jan 2021 21:54:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 101Ls6oe004539 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 1 Jan 2021 16:54:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 69893112D169; Fri,  1 Jan 2021 21:54:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 654CA112D165
	for <linux-cachefs@redhat.com>; Fri,  1 Jan 2021 21:54:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40601858EEC
	for <linux-cachefs@redhat.com>; Fri,  1 Jan 2021 21:54:04 +0000 (UTC)
Received: from mail109.syd.optusnet.com.au (mail109.syd.optusnet.com.au
	[211.29.132.80]) by relay.mimecast.com with ESMTP id
	us-mta-383-EnZFRVPvPOq-CPlv57P-8A-1; Fri, 01 Jan 2021 16:53:59 -0500
X-MC-Unique: EnZFRVPvPOq-CPlv57P-8A-1
Received: from dread.disaster.area (pa49-179-167-107.pa.nsw.optusnet.com.au
	[49.179.167.107])
	by mail109.syd.optusnet.com.au (Postfix) with ESMTPS id 0D56D8BF5;
	Sat,  2 Jan 2021 08:53:54 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1kvSMr-00244f-HB; Sat, 02 Jan 2021 08:53:53 +1100
Date: Sat, 2 Jan 2021 08:53:53 +1100
From: Dave Chinner <david@fromorbit.com>
To: Yafang Shao <laoar.shao@gmail.com>
Message-ID: <20210101215353.GB331610@dread.disaster.area>
References: <20201222012131.47020-5-laoar.shao@gmail.com>
	<20201231030158.GB379@xsang-OptiPlex-9020>
	<CALOAHbD+mLMJSizToKPsx0iUd5Z71sJBOyMaV2enVvUHfHwLzg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALOAHbD+mLMJSizToKPsx0iUd5Z71sJBOyMaV2enVvUHfHwLzg@mail.gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=Ubgvt5aN c=1 sm=1 tr=0 cx=a_idp_d
	a=+wqVUQIkAh0lLYI+QRsciw==:117 a=+wqVUQIkAh0lLYI+QRsciw==:17
	a=kj9zAlcOel0A:10 a=EmqxpYm9HcoA:10 a=QyXUC8HyAAAA:8 a=7-415B0cAAAA:8
	a=XA52iYJiZECpFeylV-IA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, 0day robot <lkp@intel.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
	Michal Hocko <mhocko@kernel.org>, lkp@lists.01.org,
	linux-cachefs@redhat.com, kernel test robot <oliver.sang@intel.com>,
	Linux MM <linux-mm@kvack.org>, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-xfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [xfs] db962cd266: Assertion_failed
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 01, 2021 at 05:10:49PM +0800, Yafang Shao wrote:
> On Thu, Dec 31, 2020 at 10:46 AM kernel test robot
> <oliver.sang@intel.com> wrote:
.....
> > [  552.905799] XFS: Assertion failed: !current->journal_info, file: fs/xfs/xfs_trans.h, line: 280
> > [  553.104459]  xfs_trans_reserve+0x225/0x320 [xfs]
> > [  553.110556]  xfs_trans_roll+0x6e/0xe0 [xfs]
> > [  553.116134]  xfs_defer_trans_roll+0x104/0x2a0 [xfs]
> > [  553.122489]  ? xfs_extent_free_create_intent+0x62/0xc0 [xfs]
> > [  553.129780]  xfs_defer_finish_noroll+0xb8/0x620 [xfs]
> > [  553.136299]  xfs_defer_finish+0x11/0xa0 [xfs]
> > [  553.142017]  xfs_itruncate_extents_flags+0x141/0x440 [xfs]
> > [  553.149053]  xfs_setattr_size+0x3da/0x480 [xfs]
> > [  553.154939]  ? setattr_prepare+0x6a/0x1e0
> > [  553.160250]  xfs_vn_setattr+0x70/0x120 [xfs]
> > [  553.165833]  notify_change+0x364/0x500
> > [  553.170820]  ? do_truncate+0x76/0xe0
> > [  553.175673]  do_truncate+0x76/0xe0
> > [  553.180184]  path_openat+0xe6c/0x10a0
> > [  553.184981]  do_filp_open+0x91/0x100
> > [  553.189707]  ? __check_object_size+0x136/0x160
> > [  553.195493]  do_sys_openat2+0x20d/0x2e0
> > [  553.200481]  do_sys_open+0x44/0x80
> > [  553.204926]  do_syscall_64+0x33/0x40
> > [  553.209588]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> Thanks for the report.
> 
> At a first glance, it seems we should make a similar change as we did
> in xfs_trans_context_clear().
> 
> static inline void
> xfs_trans_context_set(struct xfs_trans *tp)
> {
>     /*
>      * We have already handed over the context via xfs_trans_context_swap().
>      */
>     if (current->journal_info)
>         return;
>     current->journal_info = tp;
>     tp->t_pflags = memalloc_nofs_save();
> }

Ah, no.

Remember how I said "split out the wrapping of transaction
context setup in xfs_trans_reserve() from
the lifting of the context setting into xfs_trans_alloc()"?

Well, you did the former and dropped the latter out of the patch
set.

Now when a transaction rolls after xfs_trans_context_swap(), it
calls xfs_trans_reserve() and tries to do transaction context setup
work inside a transaction context that already exists.  IOWs, you
need to put the patch that lifts of the context setting up into
xfs_trans_alloc() back into the patchset before adding the
current->journal functionality patch.

Also, you need to test XFS code with CONFIG_XFS_DEBUG=y so that
asserts are actually built into the code and exercised, because this
ASSERT should have fired on the first rolling transaction that the
kernel executes...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

