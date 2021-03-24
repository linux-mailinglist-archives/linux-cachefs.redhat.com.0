Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C5864346E45
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Mar 2021 01:30:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-6E60SYAwNDG_UN8ENiqGRQ-1; Tue, 23 Mar 2021 20:30:31 -0400
X-MC-Unique: 6E60SYAwNDG_UN8ENiqGRQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2013180FCA4;
	Wed, 24 Mar 2021 00:30:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B87271002EE6;
	Wed, 24 Mar 2021 00:30:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5995B1809C83;
	Wed, 24 Mar 2021 00:30:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12O0TPv2004595 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 20:29:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 14DFE2026D64; Wed, 24 Mar 2021 00:29:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F0F72026D60
	for <linux-cachefs@redhat.com>; Wed, 24 Mar 2021 00:29:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F2BE185A7B2
	for <linux-cachefs@redhat.com>; Wed, 24 Mar 2021 00:29:21 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
	[209.85.219.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-596-0pz4oKF1Po-qmc_ZIMsyDQ-1; Tue, 23 Mar 2021 20:29:18 -0400
X-MC-Unique: 0pz4oKF1Po-qmc_ZIMsyDQ-1
Received: by mail-qv1-f48.google.com with SMTP id cx5so11460145qvb.10
	for <linux-cachefs@redhat.com>; Tue, 23 Mar 2021 17:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=o793av76d5QREaLMGc3Zyr40g65dWuVTHvGR0zwXnJ0=;
	b=NDL4bJ0DZt7xro3GfYV5LqTrlZH5hF/rW5xETpLRxpESfZ4z/46TBhU+WIKgT7NTvz
	fYpKM8N5Prr4vUpGBdsKSuDZLVnqgJKIYtxfzO90gCYATY4tf8QrAav6cT1IZtK62CUQ
	LaFBr48tjGkiv9nlIjLkUBkKSt1534pVns7jF/JmE/XnpfIYhavtzaLw5gGBectjMWQ5
	Yijkt3IGnZHy9Hc0XPJD0vW5LLWtMOU7jBPqhjIEXtxqu//7r3GPBSUjHF5kH6wrt16a
	i9zSX6HLM7+bn1NKUiNSKfV3MVZHzkxi/ZWVCp6HXScBkvdgrtr5Dn/VOBVyBOEsE6/A
	eB2Q==
X-Gm-Message-State: AOAM532hevZUbZ7W97c98EaC9iph2sglbj7GLixPRU2LVXQe+T4JrZ7h
	h6O7E4csUjHPRuVbqkL/oTKyEQ==
X-Google-Smtp-Source: ABdhPJxM1qwoDIMNU2rcWbGJ51eKoZ3ESpkuDbA/jjeeXe9w2xUQB+9yCzJR7gVyhbjKuneejHSO1w==
X-Received: by 2002:ad4:4745:: with SMTP id c5mr579042qvx.39.1616545758084;
	Tue, 23 Mar 2021 17:29:18 -0700 (PDT)
Received: from localhost (70.44.39.90.res-cmts.bus.ptd.net. [70.44.39.90])
	by smtp.gmail.com with ESMTPSA id a14sm349828qtw.80.2021.03.23.17.29.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 23 Mar 2021 17:29:17 -0700 (PDT)
Date: Tue, 23 Mar 2021 20:29:16 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <YFqH3B80Gn8pcPqB@cmpxchg.org>
References: <20210320054104.1300774-1-willy@infradead.org>
	<YFja/LRC1NI6quL6@cmpxchg.org>
	<20210322184744.GU1719932@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210322184744.GU1719932@casper.infradead.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 22, 2021 at 06:47:44PM +0000, Matthew Wilcox wrote:
> On Mon, Mar 22, 2021 at 01:59:24PM -0400, Johannes Weiner wrote:
> > On Sat, Mar 20, 2021 at 05:40:37AM +0000, Matthew Wilcox (Oracle) wrote:
> > > This series introduces the 'struct folio' as a replacement for
> > > head-or-base pages.  This initial set reduces the kernel size by
> > > approximately 6kB, although its real purpose is adding infrastructure
> > > to enable further use of the folio.
> > > 
> > > The intent is to convert all filesystems and some device drivers to work
> > > in terms of folios.  This series contains a lot of explicit conversions,
> > > but it's important to realise it's removing a lot of implicit conversions
> > > in some relatively hot paths.  There will be very few conversions from
> > > folios when this work is completed; filesystems, the page cache, the
> > > LRU and so on will generally only deal with folios.
> > 
> > If that is the case, shouldn't there in the long term only be very
> > few, easy to review instances of things like compound_head(),
> > PAGE_SIZE etc. deep in the heart of MM? And everybody else should 1)
> > never see tail pages and 2) never assume a compile-time page size?
> 
> I don't know exactly where we get to eventually.  There are definitely
> some aspects of the filesystem<->mm interface which are page-based
> (eg ->fault needs to look up the exact page, regardless of its
> head/tail/base nature), while ->readpage needs to talk in terms of
> folios.

I can imagine we'd eventually want fault handlers that can also fill
in larger chunks of data if the file is of the right size and the MM
is able to (and policy/heuristics determine to) go with a huge page.

> > What are the higher-level places that in the long-term should be
> > dealing with tail pages at all? Are there legit ones besides the page
> > allocator, THP splitting internals & pte-mapped compound pages?
> 
> I can't tell.  I think this patch maybe illustrates some of the
> problems, but maybe it's just an intermediate problem:
> 
> https://git.infradead.org/users/willy/pagecache.git/commitdiff/047e9185dc146b18f56c6df0b49fe798f1805c7b
> 
> It deals mostly in terms of folios, but when it needs to kmap() and
> memcmp(), then it needs to work in terms of pages.  I don't think it's
> avoidable (maybe we bury the "dealing with pages" inside a kmap()
> wrapper somewhere, but I'm not sure that's better).

Yeah it'd be nice to get low-level, PAGE_SIZE pages out of there. We
may be able to just kmap whole folios too, which are more likely to be
small pages on highmem systems anyway.

> > Some compound_head() that are currently in the codebase are already
> > unnecessary. Like the one in activate_page().
> 
> Right!  And it's hard to find & remove them without very careful analysis,
> or particularly deep knowledge.  With folios, we can remove them without
> terribly deep thought.

True. It definitely also helps mark the places that have been
converted from the top down and which ones haven't. Without that you
need to think harder about the context ("How would a tail page even
get here?" vs. "No page can get here, only folios" ;-))

Again, I think that's something that would automatically be better in
the long term when compound_page() and PAGE_SIZE themselves would
stand out like sore thumbs. But you raise a good point: there is such
an overwhelming amount of them right now that it's difficult to do
this without a clearer marker and help from the type system.

> > And looking at grep, I wouldn't be surprised if only the page table
> > walkers need the page_compound() that mark_page_accessed() does. We
> > would be better off if they did the translation once and explicitly in
> > the outer scope, where it's clear they're dealing with a pte-mapped
> > compound page, instead of having a series of rather low level helpers
> > (page flags testing, refcount operations, LRU operations, stat
> > accounting) all trying to be clever but really just obscuring things
> > and imposing unnecessary costs on the vast majority of cases.
> > 
> > So I fully agree with the motivation behind this patch. But I do
> > wonder why it's special-casing the commmon case instead of the rare
> > case. It comes at a huge cost. Short term, the churn of replacing
> > 'page' with 'folio' in pretty much all instances is enormous.
> 
> Because people (think they) know what a page is.  It's PAGE_SIZE bytes
> long, it occupies one PTE, etc, etc.  A folio is new and instead of
> changing how something familiar (a page) behaves, we're asking them
> to think about something new instead that behaves a lot like a page,
> but has differences.

Yeah, that makes sense.

> > And longer term, I'm not convinced folio is the abstraction we want
> > throughout the kernel. If nobody should be dealing with tail pages in
> > the first place, why are we making everybody think in 'folios'? Why
> > does a filesystem care that huge pages are composed of multiple base
> > pages internally? This feels like an implementation detail leaking out
> > of the MM code. The vast majority of places should be thinking 'page'
> > with a size of 'page_size()'. Including most parts of the MM itself.
> 
> I think pages already leaked out of the MM and into filesystems (and
> most of the filesystem writers seem pretty unknowledgable about how
> pages and the page cache work, TBH).  That's OK!  Or it should be OK.
> Filesystem authors should be experts on how their filesystem works.
> Everywhere that they have to learn about the page cache is a distraction
> and annoyance for them.
>
> I mean, I already tried what you're suggesting.  It's really freaking
> hard.  It's hard to do, it's hard to explain, it's hard to know if you
> got it right.  With folios, I've got the compiler working for me, telling
> me that I got some of the low-level bits right (or wrong), leaving me
> free to notice "Oh, wait, we got the accounting wrong because writeback
> assumes that a page is only PAGE_SIZE bytes".  I would _never_ have
> noticed that with the THP tree.  I only noticed it because transitioning
> things to folios made me read the writeback code and wonder about the
> 'inc_wb_stat' call, see that it's measuring something in 'number of pages'
> and realise that the wb_stat accounting needs to be fixed.

I agree with all of this whole-heartedly.

The reason I asked about who would deal with tail pages in the long
term is because I think optimally most places would just think of
these things as descriptors for variable lengths of memory. And only
the allocator looks behind the curtain and deals with the (current!)
reality that they're stitched together from fixed-size objects.

To me, folios seem to further highlight this implementation detail,
more so than saying a page is now page_size() - although I readily
accept that the latter didn't turn out to be a viable mid-term
strategy in practice at all, and that a clean break is necessary
sooner rather than later (instead of cleaning up the page api now and
replacing the backing pages with struct hwpage or something later).

The name of the abstraction indicates how we think we're supposed to
use it, what behavior stands out as undesirable.

For example, you brought up kmap/memcpy/usercopy, which is a pretty
common operation. Should they continue to deal with individual tail
pages, and thereby perpetuate the exposure of these low-level MM
building blocks to drivers and filesystems?

It means portfolio -> page lookups will remain common - and certainly
the concept of the folio suggests thinking of it as a couple of pages
strung together. And the more this is the case, the less it stands out
when somebody is dealing with low-level pages when really they
shouldn't be - the thing this is trying to fix. Granted it's narrowing
the channel quite a bit. But it's also so pervasively used that I do
wonder if it's possible to keep up with creative new abuses.

But I also worry about the longevity of the concept in general. This
is one of the most central and fundamental concepts in the kernel. Is
this going to make sense in the future? In 5 years even?

> > The compile-time check is nice, but I'm not sure it would be that much
> > more effective at catching things than a few centrally placed warns
> > inside PageFoo(), get_page() etc. and other things that should not
> > encounter tail pages in the first place (with __helpers for the few
> > instances that do). And given the invasiveness of this change, they
> > ought to be very drastically better at it, and obviously so, IMO.
> 
> We should have come up with a new type 15 years ago instead of doing THP.
> But the second best time to invent a new type for "memory objects which
> are at least as big as a page" is right now.  Because it only gets more
> painful over time.

Yes and no.

Yes because I fully agree that too much detail of the pages have
leaked into all kinds of places where they shouldn't be, and a new
abstraction for what most places interact with is a good idea IMO.

But we're also headed in a direction with the VM that give me pause
about the folios-are-multiple-pages abstraction.

How long are we going to have multiple pages behind a huge page?

Common storage drives are getting fast enough that simple buffered IO
workloads are becoming limited by CPU, just because it's too many
individual pages to push through the cache. We have pending patches to
rewrite the reclaim algorithm because rmap is falling apart with the
rate of paging we're doing. We'll need larger pages in the VM not just
for optimizing TLB access, but to cut transaction overhead for paging
in general (I know you're already onboard with this, especially on the
page cache side, just stating it for completeness).

But for that to work, we'll need the allocator to produce huge pages
at the necessary rate, too. The current implementation likely won't
scale. Compaction is expensive enough that we have to weigh when to
allocate huge pages for long-lived anon regions, let alone allocate
them for streaming IO cache entries.

But if the overwhelming number of requests going to the page allocator
are larger than 4k pages - anon regions? check. page cache? likely a
sizable share. slub? check. network? check - does it even make sense
to have that as the default block size for the page allocator anymore?
Or even allocate struct page at this granularity?

So I think transitioning away from ye olde page is a great idea. I
wonder this: have we mapped out the near future of the VM enough to
say that the folio is the right abstraction?

What does 'folio' mean when it corresponds to either a single page or
some slab-type object with no dedicated page?

If we go through with all the churn now anyway, IMO it makes at least
sense to ditch all association and conceptual proximity to the
hardware page or collections thereof. Simply say it's some length of
memory, and keep thing-to-page translations out of the public API from
the start. I mean, is there a good reason to keep this baggage?

mem_t or something.

mem = find_get_mem(mapping, offset);
p = kmap(mem, offset - mem_file_offset(mem), len);
copy_from_user(p, buf, len);
kunmap(mem);
SetMemDirty(mem);
put_mem(mem);

There are 10k instances of 'page' in mm/ outside the page allocator, a
majority of which will be the new thing. 14k in fs. I don't think I
have the strength to type shrink_folio_list(), or explain to new
people what it means, years after it has stopped making sense.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

