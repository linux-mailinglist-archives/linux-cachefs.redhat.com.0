Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D2027345D6F
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Mar 2021 12:55:49 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-X-f8qXsoOF2sGXGj1BYUdw-1; Tue, 23 Mar 2021 07:55:45 -0400
X-MC-Unique: X-f8qXsoOF2sGXGj1BYUdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E9EA19251AD;
	Tue, 23 Mar 2021 11:55:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2907519744;
	Tue, 23 Mar 2021 11:55:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A5C01809C83;
	Tue, 23 Mar 2021 11:55:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12MHxWts022208 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 22 Mar 2021 13:59:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F64A49B01; Mon, 22 Mar 2021 17:59:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17DB649AEC
	for <linux-cachefs@redhat.com>; Mon, 22 Mar 2021 17:59:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FB13811E9B
	for <linux-cachefs@redhat.com>; Mon, 22 Mar 2021 17:59:29 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
	[209.85.219.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-485-3o2YfWxJOzmMS9jZrIipoA-1; Mon, 22 Mar 2021 13:59:26 -0400
X-MC-Unique: 3o2YfWxJOzmMS9jZrIipoA-1
Received: by mail-qv1-f45.google.com with SMTP id o19so9161704qvu.0
	for <linux-cachefs@redhat.com>; Mon, 22 Mar 2021 10:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=3tW5FS73Z71P6K0t+SWrxwMHeSjJgqydDxKdhSwwjsI=;
	b=JChaOSc33i5UBri3WTRX2yl1VBRAtYMaH7lJ5DBpwQH9ZCP2JvCX1eOh1VIREudM4p
	9zjEQn1ggK3OhZsblAd803JOC5osKTR8p9PF1eF4GKfy6Ne1FPxRfFSbJ4Yh2dY35jQz
	YlM6mAYP23qFAg1LXchzbuGfbBH9r/KQcNjASmnPERH10dS+CyRlW+CJAZtGgvmNpfXJ
	hYk6cWH0MNarlt0zO4QTNI0HZjVWQeL+tcSb80lTxIbFdAMGLquN/xEzx7zk1bXxdkxu
	GxWmo64bHqviTbWSEddw13NbFiRbch1opiWF2Pp0rH+6gdRPiXnZlg9igUyKSHKRoLky
	8NsQ==
X-Gm-Message-State: AOAM531yx1vMZg66ioitE1BR82yTRoyp1ewqgWQi9LudKdDeMGqTHGWB
	OXme/6EnLFu3mXQNvaoIoi/9eRKl5Hb2dQ==
X-Google-Smtp-Source: ABdhPJzoBehbHbQuiCGVnZz0UStxWXiZmLz4h7BLRs4yncS1FgXzNF2X65GrLZMvZblfqSGPbGw/UQ==
X-Received: by 2002:a0c:9ad7:: with SMTP id k23mr958345qvf.52.1616435966072;
	Mon, 22 Mar 2021 10:59:26 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:b54e])
	by smtp.gmail.com with ESMTPSA id
	h8sm11266266qkk.116.2021.03.22.10.59.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 22 Mar 2021 10:59:25 -0700 (PDT)
Date: Mon, 22 Mar 2021 13:59:24 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <YFja/LRC1NI6quL6@cmpxchg.org>
References: <20210320054104.1300774-1-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210320054104.1300774-1-willy@infradead.org>
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
X-Mailman-Approved-At: Tue, 23 Mar 2021 07:55:41 -0400
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v5 00/27] Memory Folios
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 20, 2021 at 05:40:37AM +0000, Matthew Wilcox (Oracle) wrote:
> Managing memory in 4KiB pages is a serious overhead.  Many benchmarks
> exist which show the benefits of a larger "page size".  As an example,
> an earlier iteration of this idea which used compound pages got a 7%
> performance boost when compiling the kernel using kernbench without any
> particular tuning.
> 
> Using compound pages or THPs exposes a serious weakness in our type
> system.  Functions are often unprepared for compound pages to be passed
> to them, and may only act on PAGE_SIZE chunks.  Even functions which are
> aware of compound pages may expect a head page, and do the wrong thing
> if passed a tail page.
> 
> There have been efforts to label function parameters as 'head' instead
> of 'page' to indicate that the function expects a head page, but this
> leaves us with runtime assertions instead of using the compiler to prove
> that nobody has mistakenly passed a tail page.  Calling a struct page
> 'head' is also inaccurate as they will work perfectly well on base pages.
> The term 'nottail' has not proven popular.
> 
> We also waste a lot of instructions ensuring that we're not looking at
> a tail page.  Almost every call to PageFoo() contains one or more hidden
> calls to compound_head().  This also happens for get_page(), put_page()
> and many more functions.  There does not appear to be a way to tell gcc
> that it can cache the result of compound_head(), nor is there a way to
> tell it that compound_head() is idempotent.
> 
> This series introduces the 'struct folio' as a replacement for
> head-or-base pages.  This initial set reduces the kernel size by
> approximately 6kB, although its real purpose is adding infrastructure
> to enable further use of the folio.
> 
> The intent is to convert all filesystems and some device drivers to work
> in terms of folios.  This series contains a lot of explicit conversions,
> but it's important to realise it's removing a lot of implicit conversions
> in some relatively hot paths.  There will be very few conversions from
> folios when this work is completed; filesystems, the page cache, the
> LRU and so on will generally only deal with folios.

If that is the case, shouldn't there in the long term only be very
few, easy to review instances of things like compound_head(),
PAGE_SIZE etc. deep in the heart of MM? And everybody else should 1)
never see tail pages and 2) never assume a compile-time page size?

What are the higher-level places that in the long-term should be
dealing with tail pages at all? Are there legit ones besides the page
allocator, THP splitting internals & pte-mapped compound pages?

I do agree that the current confusion around which layer sees which
types of pages is a problem. But I also think a lot of it is the
result of us being in a transitional period where we've added THP in
more places but not all code and data structures are or were fully
native yet, and so we had things leak out or into where maybe they
shouldn't be to make things work in the short term.

But this part is already getting better, and has gotten better, with
the page cache (largely?) going native for example.

Some compound_head() that are currently in the codebase are already
unnecessary. Like the one in activate_page().

And looking at grep, I wouldn't be surprised if only the page table
walkers need the page_compound() that mark_page_accessed() does. We
would be better off if they did the translation once and explicitly in
the outer scope, where it's clear they're dealing with a pte-mapped
compound page, instead of having a series of rather low level helpers
(page flags testing, refcount operations, LRU operations, stat
accounting) all trying to be clever but really just obscuring things
and imposing unnecessary costs on the vast majority of cases.

So I fully agree with the motivation behind this patch. But I do
wonder why it's special-casing the commmon case instead of the rare
case. It comes at a huge cost. Short term, the churn of replacing
'page' with 'folio' in pretty much all instances is enormous.

And longer term, I'm not convinced folio is the abstraction we want
throughout the kernel. If nobody should be dealing with tail pages in
the first place, why are we making everybody think in 'folios'? Why
does a filesystem care that huge pages are composed of multiple base
pages internally? This feels like an implementation detail leaking out
of the MM code. The vast majority of places should be thinking 'page'
with a size of 'page_size()'. Including most parts of the MM itself.

The compile-time check is nice, but I'm not sure it would be that much
more effective at catching things than a few centrally placed warns
inside PageFoo(), get_page() etc. and other things that should not
encounter tail pages in the first place (with __helpers for the few
instances that do). And given the invasiveness of this change, they
ought to be very drastically better at it, and obviously so, IMO.

>  Documentation/core-api/mm-api.rst |   7 +
>  fs/afs/write.c                    |   3 +-
>  fs/cachefiles/rdwr.c              |  19 ++-
>  fs/io_uring.c                     |   2 +-
>  include/linux/memcontrol.h        |  21 +++
>  include/linux/mm.h                | 156 +++++++++++++++----
>  include/linux/mm_types.h          |  52 +++++++
>  include/linux/mmdebug.h           |  20 +++
>  include/linux/netfs.h             |   2 +-
>  include/linux/page-flags.h        | 120 +++++++++++---
>  include/linux/pagemap.h           | 249 ++++++++++++++++++++++--------
>  include/linux/swap.h              |   6 +
>  include/linux/vmstat.h            | 107 +++++++++++++
>  mm/Makefile                       |   2 +-
>  mm/filemap.c                      | 237 ++++++++++++++--------------
>  mm/folio-compat.c                 |  37 +++++
>  mm/memory.c                       |   8 +-
>  mm/page-writeback.c               |  62 ++++++--
>  mm/swapfile.c                     |   8 +-
>  mm/util.c                         |  30 ++--
>  20 files changed, 857 insertions(+), 291 deletions(-)
>  create mode 100644 mm/folio-compat.c

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

