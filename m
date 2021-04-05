Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 83D2B354729
	for <lists+linux-cachefs@lfdr.de>; Mon,  5 Apr 2021 21:32:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-Jo_IHpljOrCe7xlbkjHjsg-1; Mon, 05 Apr 2021 15:32:04 -0400
X-MC-Unique: Jo_IHpljOrCe7xlbkjHjsg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99E631884821;
	Mon,  5 Apr 2021 19:32:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86E065C6AB;
	Mon,  5 Apr 2021 19:32:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8EC81809C83;
	Mon,  5 Apr 2021 19:32:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 135JVx7G007681 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 5 Apr 2021 15:31:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 281F12026D64; Mon,  5 Apr 2021 19:31:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22FF32026D60
	for <linux-cachefs@redhat.com>; Mon,  5 Apr 2021 19:31:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38D21104D9A4
	for <linux-cachefs@redhat.com>; Mon,  5 Apr 2021 19:31:56 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-246-Tc-Vi7eiMnmA0vHGs19g_w-1; Mon, 05 Apr 2021 15:31:51 -0400
X-MC-Unique: Tc-Vi7eiMnmA0vHGs19g_w-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lTUwS-00BnIa-8v; Mon, 05 Apr 2021 19:31:28 +0000
Date: Mon, 5 Apr 2021 20:31:20 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20210405193120.GL2531743@casper.infradead.org>
References: <20210331184728.1188084-1-willy@infradead.org>
	<759cfbb63ca960b2893f2b879035c2a42c80462d.camel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <759cfbb63ca960b2893f2b879035c2a42c80462d.camel@kernel.org>
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v6 00/27] Memory Folios
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 05, 2021 at 03:14:29PM -0400, Jeff Layton wrote:
> On Wed, 2021-03-31 at 19:47 +0100, Matthew Wilcox (Oracle) wrote:
> > Managing memory in 4KiB pages is a serious overhead.  Many benchmarks
> > exist which show the benefits of a larger "page size".  As an example,
> > an earlier iteration of this idea which used compound pages got a 7%
> > performance boost when compiling the kernel using kernbench without any
> > particular tuning.
> > 
> > Using compound pages or THPs exposes a serious weakness in our type
> > system.  Functions are often unprepared for compound pages to be passed
> > to them, and may only act on PAGE_SIZE chunks.  Even functions which are
> > aware of compound pages may expect a head page, and do the wrong thing
> > if passed a tail page.
> > 
> > There have been efforts to label function parameters as 'head' instead
> > of 'page' to indicate that the function expects a head page, but this
> > leaves us with runtime assertions instead of using the compiler to prove
> > that nobody has mistakenly passed a tail page.  Calling a struct page
> > 'head' is also inaccurate as they will work perfectly well on base pages.
> > The term 'nottail' has not proven popular.
> > 
> > We also waste a lot of instructions ensuring that we're not looking at
> > a tail page.  Almost every call to PageFoo() contains one or more hidden
> > calls to compound_head().  This also happens for get_page(), put_page()
> > and many more functions.  There does not appear to be a way to tell gcc
> > that it can cache the result of compound_head(), nor is there a way to
> > tell it that compound_head() is idempotent.
> > 
> > This series introduces the 'struct folio' as a replacement for
> > head-or-base pages.  This initial set reduces the kernel size by
> > approximately 5kB by removing conversions from tail pages to head pages.
> > The real purpose of this series is adding infrastructure to enable
> > further use of the folio.
> > 
> > The medium-term goal is to convert all filesystems and some device
> > drivers to work in terms of folios.  This series contains a lot of
> > explicit conversions, but it's important to realise it's removing a lot
> > of implicit conversions in some relatively hot paths.  There will be very
> > few conversions from folios when this work is completed; filesystems,
> > the page cache, the LRU and so on will generally only deal with folios.
> 
> I too am a little concerned about the amount of churn this is likely to
> cause, but this does seem like a fairly promising way forward for
> actually using THPs in the pagecache. The set is fairly straightforward.
> 
> That said, there are few callers of these new functions in here. Is this
> set enough to allow converting some subsystem to use folios? It might be
> good to do that if possible, so we can get an idea of how much work
> we're in for.

It isn't enough to start converting much.  There needs to be a second set
of patches which add all the infrastructure for converting a filesystem.
Then we can start working on the filesystems.  I have a start at that
here:

https://git.infradead.org/users/willy/pagecache.git/shortlog/refs/heads/folio

I don't know if it's exactly how I'll arrange it for submission.  It might
be better to convert all the filesystem implementations of readpage
to work on a folio, and then the big bang conversion of ->readpage to
->read_folio will look much more mechanical.

But if I can't convince people that a folio approach is what we need,
then I should stop working on it, and go back to fixing the endless
stream of bugs that the thp-based approach surfaces.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

