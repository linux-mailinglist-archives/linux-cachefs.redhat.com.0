Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 006AE2E9386
	for <lists+linux-cachefs@lfdr.de>; Mon,  4 Jan 2021 11:43:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-RYRxF4b3MImeiL92c_tKvw-1; Mon, 04 Jan 2021 05:43:35 -0500
X-MC-Unique: RYRxF4b3MImeiL92c_tKvw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F9221572D;
	Mon,  4 Jan 2021 10:43:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B65C10023AB;
	Mon,  4 Jan 2021 10:43:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E5B0B4A7C6;
	Mon,  4 Jan 2021 10:43:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 104AhOn8002240 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 05:43:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 65E309E80; Mon,  4 Jan 2021 10:43:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6079D9E86
	for <linux-cachefs@redhat.com>; Mon,  4 Jan 2021 10:43:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB931101A561
	for <linux-cachefs@redhat.com>; Mon,  4 Jan 2021 10:43:21 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
	[209.85.166.174]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-131-q_FH7ql8PKy0WBH6tEwyZw-1; Mon, 04 Jan 2021 05:43:17 -0500
X-MC-Unique: q_FH7ql8PKy0WBH6tEwyZw-1
Received: by mail-il1-f174.google.com with SMTP id q5so24828551ilc.10;
	Mon, 04 Jan 2021 02:43:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3l9UhkzSQuGNhhSoOB/EKfTtvl8Ybm/n2gWJAEInW68=;
	b=JyLY6qPEVe+tupoYNgtJoy2TUNWKLbDSkAPt5eXls+ugWLbNnuso5yy0cbyA481kQ6
	Sad2cyQZondYTzCZ4UPIDB8xTLeUyeg6XwRLJKP6uOrstsnVSFSvO/c7u/mMg31Dkarp
	Kj03aVewRnJPVsf6JC9gfEQBgH4MM5OBr9xmfiCw+SiCd5IpfK4cPclL5R1/z2vuNiKQ
	HhROg78iqi+w4xWWVk7cSP4rMSpKP45/sETd3ooMWsm7lJj1wldwUVcF1E37gD9E5uPE
	unGPbd61vsmBxqa4zeiHly4k9R/5FdpvwU66EzzJkA+m9Tp8kKxV5mupS3oMIrfZOVEY
	qPww==
X-Gm-Message-State: AOAM533JieSXNEQzxmBlhvl7pvEabu7UW5xU2uI7TxC03JPPBZxdJTd5
	LwQv0wivMBliXePuqkqJ7BPubSeM5tJzvYCgEyasKT+XjEAN1rSA
X-Google-Smtp-Source: ABdhPJyRLGSMPviRnCBw25zlf1PIUYFkgyAVvONCYe415ftLgiibcjOVK2zvUCm3SC+BrBMWag5Jjy51CpT3lgimRiE=
X-Received: by 2002:a05:6e02:102f:: with SMTP id
	o15mr70104237ilj.142.1609756996831; 
	Mon, 04 Jan 2021 02:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20201222012131.47020-5-laoar.shao@gmail.com>
	<20201231030158.GB379@xsang-OptiPlex-9020>
	<CALOAHbD+mLMJSizToKPsx0iUd5Z71sJBOyMaV2enVvUHfHwLzg@mail.gmail.com>
	<20210101215353.GB331610@dread.disaster.area>
In-Reply-To: <20210101215353.GB331610@dread.disaster.area>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 4 Jan 2021 18:42:41 +0800
Message-ID: <CALOAHbDTCm4XdCJdeN7bP6ChA=8EZi50x2hSA4eSWG-nSSKDsA@mail.gmail.com>
To: Dave Chinner <david@fromorbit.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jan 2, 2021 at 5:53 AM Dave Chinner <david@fromorbit.com> wrote:
>
> On Fri, Jan 01, 2021 at 05:10:49PM +0800, Yafang Shao wrote:
> > On Thu, Dec 31, 2020 at 10:46 AM kernel test robot
> > <oliver.sang@intel.com> wrote:
> .....
> > > [  552.905799] XFS: Assertion failed: !current->journal_info, file: fs/xfs/xfs_trans.h, line: 280
> > > [  553.104459]  xfs_trans_reserve+0x225/0x320 [xfs]
> > > [  553.110556]  xfs_trans_roll+0x6e/0xe0 [xfs]
> > > [  553.116134]  xfs_defer_trans_roll+0x104/0x2a0 [xfs]
> > > [  553.122489]  ? xfs_extent_free_create_intent+0x62/0xc0 [xfs]
> > > [  553.129780]  xfs_defer_finish_noroll+0xb8/0x620 [xfs]
> > > [  553.136299]  xfs_defer_finish+0x11/0xa0 [xfs]
> > > [  553.142017]  xfs_itruncate_extents_flags+0x141/0x440 [xfs]
> > > [  553.149053]  xfs_setattr_size+0x3da/0x480 [xfs]
> > > [  553.154939]  ? setattr_prepare+0x6a/0x1e0
> > > [  553.160250]  xfs_vn_setattr+0x70/0x120 [xfs]
> > > [  553.165833]  notify_change+0x364/0x500
> > > [  553.170820]  ? do_truncate+0x76/0xe0
> > > [  553.175673]  do_truncate+0x76/0xe0
> > > [  553.180184]  path_openat+0xe6c/0x10a0
> > > [  553.184981]  do_filp_open+0x91/0x100
> > > [  553.189707]  ? __check_object_size+0x136/0x160
> > > [  553.195493]  do_sys_openat2+0x20d/0x2e0
> > > [  553.200481]  do_sys_open+0x44/0x80
> > > [  553.204926]  do_syscall_64+0x33/0x40
> > > [  553.209588]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >
> > Thanks for the report.
> >
> > At a first glance, it seems we should make a similar change as we did
> > in xfs_trans_context_clear().
> >
> > static inline void
> > xfs_trans_context_set(struct xfs_trans *tp)
> > {
> >     /*
> >      * We have already handed over the context via xfs_trans_context_swap().
> >      */
> >     if (current->journal_info)
> >         return;
> >     current->journal_info = tp;
> >     tp->t_pflags = memalloc_nofs_save();
> > }
>
> Ah, no.
>
> Remember how I said "split out the wrapping of transaction
> context setup in xfs_trans_reserve() from
> the lifting of the context setting into xfs_trans_alloc()"?
>
> Well, you did the former and dropped the latter out of the patch
> set.
>

I misunderstood what you mean.

> Now when a transaction rolls after xfs_trans_context_swap(), it
> calls xfs_trans_reserve() and tries to do transaction context setup
> work inside a transaction context that already exists.  IOWs, you
> need to put the patch that lifts of the context setting up into
> xfs_trans_alloc() back into the patchset before adding the
> current->journal functionality patch.
>

Sure.

> Also, you need to test XFS code with CONFIG_XFS_DEBUG=y so that
> asserts are actually built into the code and exercised, because this
> ASSERT should have fired on the first rolling transaction that the
> kernel executes...
>

I really forgot to enable CONFIG_XFS_DEBUG...   -_-b


-- 
Thanks
Yafang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

