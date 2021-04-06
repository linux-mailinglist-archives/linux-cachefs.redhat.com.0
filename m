Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA6835577B
	for <lists+linux-cachefs@lfdr.de>; Tue,  6 Apr 2021 17:14:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-2APX96JRMWqsCLjCa5gcLA-1; Tue, 06 Apr 2021 11:14:40 -0400
X-MC-Unique: 2APX96JRMWqsCLjCa5gcLA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39131190B2B4;
	Tue,  6 Apr 2021 15:14:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00879607CB;
	Tue,  6 Apr 2021 15:14:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 864EC4A700;
	Tue,  6 Apr 2021 15:14:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 136FEYvW021971 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 11:14:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 88C952166B44; Tue,  6 Apr 2021 15:14:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 838E72166B2D
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 15:14:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4181880C8DC
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 15:14:32 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-320-vmSDbkHqOAOC_1fn_We-tQ-1;
	Tue, 06 Apr 2021 11:14:30 -0400
X-MC-Unique: vmSDbkHqOAOC_1fn_We-tQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0DD561363;
	Tue,  6 Apr 2021 15:14:28 +0000 (UTC)
Message-ID: <fa4fa9fc7236ff4a5f582ead8df4fd12ce08057d.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Date: Tue, 06 Apr 2021 11:14:27 -0400
In-Reply-To: <20210405193120.GL2531743@casper.infradead.org>
References: <20210331184728.1188084-1-willy@infradead.org>
	<759cfbb63ca960b2893f2b879035c2a42c80462d.camel@kernel.org>
	<20210405193120.GL2531743@casper.infradead.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-04-05 at 20:31 +0100, Matthew Wilcox wrote:
> On Mon, Apr 05, 2021 at 03:14:29PM -0400, Jeff Layton wrote:
> > On Wed, 2021-03-31 at 19:47 +0100, Matthew Wilcox (Oracle) wrote:
> > > Managing memory in 4KiB pages is a serious overhead.  Many benchmarks
> > > exist which show the benefits of a larger "page size".  As an example,
> > > an earlier iteration of this idea which used compound pages got a 7%
> > > performance boost when compiling the kernel using kernbench without any
> > > particular tuning.
> > > 
> > > Using compound pages or THPs exposes a serious weakness in our type
> > > system.  Functions are often unprepared for compound pages to be passed
> > > to them, and may only act on PAGE_SIZE chunks.  Even functions which are
> > > aware of compound pages may expect a head page, and do the wrong thing
> > > if passed a tail page.
> > > 
> > > There have been efforts to label function parameters as 'head' instead
> > > of 'page' to indicate that the function expects a head page, but this
> > > leaves us with runtime assertions instead of using the compiler to prove
> > > that nobody has mistakenly passed a tail page.  Calling a struct page
> > > 'head' is also inaccurate as they will work perfectly well on base pages.
> > > The term 'nottail' has not proven popular.
> > > 
> > > We also waste a lot of instructions ensuring that we're not looking at
> > > a tail page.  Almost every call to PageFoo() contains one or more hidden
> > > calls to compound_head().  This also happens for get_page(), put_page()
> > > and many more functions.  There does not appear to be a way to tell gcc
> > > that it can cache the result of compound_head(), nor is there a way to
> > > tell it that compound_head() is idempotent.
> > > 
> > > This series introduces the 'struct folio' as a replacement for
> > > head-or-base pages.  This initial set reduces the kernel size by
> > > approximately 5kB by removing conversions from tail pages to head pages.
> > > The real purpose of this series is adding infrastructure to enable
> > > further use of the folio.
> > > 
> > > The medium-term goal is to convert all filesystems and some device
> > > drivers to work in terms of folios.  This series contains a lot of
> > > explicit conversions, but it's important to realise it's removing a lot
> > > of implicit conversions in some relatively hot paths.  There will be very
> > > few conversions from folios when this work is completed; filesystems,
> > > the page cache, the LRU and so on will generally only deal with folios.
> > 
> > I too am a little concerned about the amount of churn this is likely to
> > cause, but this does seem like a fairly promising way forward for
> > actually using THPs in the pagecache. The set is fairly straightforward.
> > 
> > That said, there are few callers of these new functions in here. Is this
> > set enough to allow converting some subsystem to use folios? It might be
> > good to do that if possible, so we can get an idea of how much work
> > we're in for.
> 
> It isn't enough to start converting much.  There needs to be a second set
> of patches which add all the infrastructure for converting a filesystem.
> Then we can start working on the filesystems.  I have a start at that
> here:
> 
> https://git.infradead.org/users/willy/pagecache.git/shortlog/refs/heads/folio
> 
> I don't know if it's exactly how I'll arrange it for submission.  It might
> be better to convert all the filesystem implementations of readpage
> to work on a folio, and then the big bang conversion of ->readpage to
> ->read_folio will look much more mechanical.
> 
> But if I can't convince people that a folio approach is what we need,
> then I should stop working on it, and go back to fixing the endless
> stream of bugs that the thp-based approach surfaces.

Fair enough. I generally prefer to see some callers added at the same
time as new functions, but I understand that the scale of this patchset
makes that difficult. You can add this to the whole series. I don't see
any major show-stoppers here:

Acked-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

