Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9481534ADD9
	for <lists+linux-cachefs@lfdr.de>; Fri, 26 Mar 2021 18:49:40 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-ApVjRkiUPZy4K-m9WFV6HQ-1; Fri, 26 Mar 2021 13:49:37 -0400
X-MC-Unique: ApVjRkiUPZy4K-m9WFV6HQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E47D01052BAF;
	Fri, 26 Mar 2021 17:48:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC12860CE9;
	Fri, 26 Mar 2021 17:48:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96BD91809C82;
	Fri, 26 Mar 2021 17:48:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12QHmMjt010583 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 13:48:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 66E5B10545CB; Fri, 26 Mar 2021 17:48:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6255810545CA
	for <linux-cachefs@redhat.com>; Fri, 26 Mar 2021 17:48:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09DA7100DE79
	for <linux-cachefs@redhat.com>; Fri, 26 Mar 2021 17:48:20 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-389-kGiTpmCIMtGIgu_YbaoJIw-1; Fri, 26 Mar 2021 13:48:17 -0400
X-MC-Unique: kGiTpmCIMtGIgu_YbaoJIw-1
Received: by mail-qk1-f177.google.com with SMTP id z10so6029025qkz.13
	for <linux-cachefs@redhat.com>; Fri, 26 Mar 2021 10:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=Rt7+HTA/2CLzV1i70E0AKartOxdm4iJIzlacuo9e8fY=;
	b=WPHD6BuKnkLnW/7VjQZA0ccSCsTzxSgM/WUFnP35xPghH1vAmx8Uhxwrn5ix70kFPI
	h6OZwr3Y9aSMEAaU8b+nhso/GdSwD9SJOn7VBYcDxiTqcw3GhhU3Ntk63L9dXW7q5PJz
	y09RasKvn2d160qJZdLmcCu6fWQ59DxzRuR29F1a2WHItWfByOxiQVJntfsvcSUB4kxV
	TKyFVy49gihc/jTjTKx1AW7vcCVR9tpr/4BfwuW93Zk4P9cUDq2J/BRZ19UEuLWkAxZG
	XQtyMNaRZDWdgJGxflpRebjl1KAxKcoJhc4mTY/B5vQIdCpuEv0qyOtVuszs86155D4v
	wCyg==
X-Gm-Message-State: AOAM533h6lBk8t32BzIe37KpyLyg/U5TnNfUzTVtA0Rp3aFLdZUha4LO
	uR2wClW+Ck8hsyipEO3lo6rTRQ==
X-Google-Smtp-Source: ABdhPJxmYdPXJeXFGWC9Yo9XPOA0Y5gzi1Sfmmprpnrvf80Wcyq9D5Z4HGvVoeyScc4heSWNnly/fg==
X-Received: by 2002:a05:620a:10a7:: with SMTP id
	h7mr14326489qkk.402.1616780896593; 
	Fri, 26 Mar 2021 10:48:16 -0700 (PDT)
Received: from localhost (70.44.39.90.res-cmts.bus.ptd.net. [70.44.39.90])
	by smtp.gmail.com with ESMTPSA id
	r133sm7438957qke.20.2021.03.26.10.48.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 10:48:15 -0700 (PDT)
Date: Fri, 26 Mar 2021 13:48:15 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <YF4eX/VBPLmontA+@cmpxchg.org>
References: <20210320054104.1300774-1-willy@infradead.org>
	<YFja/LRC1NI6quL6@cmpxchg.org>
	<20210322184744.GU1719932@casper.infradead.org>
	<YFqH3B80Gn8pcPqB@cmpxchg.org>
	<20210324062421.GQ1719932@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210324062421.GQ1719932@casper.infradead.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 24, 2021 at 06:24:21AM +0000, Matthew Wilcox wrote:
> On Tue, Mar 23, 2021 at 08:29:16PM -0400, Johannes Weiner wrote:
> > On Mon, Mar 22, 2021 at 06:47:44PM +0000, Matthew Wilcox wrote:
> > > On Mon, Mar 22, 2021 at 01:59:24PM -0400, Johannes Weiner wrote:
> One of the patches I haven't posted yet starts to try to deal with kmap()/mem*()/kunmap():
> 
>     mm: Add kmap_local_folio
>     
>     This allows us to map a portion of a folio.  Callers can only expect
>     to access up to the next page boundary.
>     
>     Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> 
> diff --git a/include/linux/highmem-internal.h b/include/linux/highmem-internal.h
> index 7902c7d8b55f..55a29c9d562f 100644
> --- a/include/linux/highmem-internal.h
> +++ b/include/linux/highmem-internal.h
> @@ -73,6 +73,12 @@ static inline void *kmap_local_page(struct page *page)
>         return __kmap_local_page_prot(page, kmap_prot);
>  }
>  
> +static inline void *kmap_local_folio(struct folio *folio, size_t offset)
> +{
> +       struct page *page = &folio->page + offset / PAGE_SIZE;
> +       return __kmap_local_page_prot(page, kmap_prot) + offset % PAGE_SIZE;
> +}
> 
> Partly I haven't shared that one because I'm not 100% sure that 'byte
> offset relative to start of folio' is the correct interface.  I'm looking
> at some users and thinking that maybe 'byte offset relative to start
> of file' might be better.  Or perhaps that's just filesystem-centric
> thinking.

Right, this doesn't seem specific to files just because they would be
the primary users of it.

> > But for that to work, we'll need the allocator to produce huge pages
> > at the necessary rate, too. The current implementation likely won't
> > scale. Compaction is expensive enough that we have to weigh when to
> > allocate huge pages for long-lived anon regions, let alone allocate
> > them for streaming IO cache entries.
> 
> Heh, I have that as a work item for later this year -- give the page
> allocator per-cpu lists of compound pages, not just order-0 pages.
> That'll save us turning compound pages back into buddy pages, only to
> turn them into compound pages again.
> 
> I also have a feeling that the page allocator either needs to become a
> sub-allocator of an allocator that deals in, say, 1GB chunks of memory,
> or it needs to become reluctant to break up larger orders.  eg if the
> dcache asks for just one more dentry, it should have to go through at
> least one round of reclaim before we choose to break up a high-order
> page to satisfy that request.

Slub already allocates higher-order pages for dentries:

slabinfo - version: 2.1
# name            <active_objs> <num_objs> <objsize> <objperslab> <pagesperslab> : tunables <limit> <batchcount> <sharedfactor> : slabdata <active_slabs> <num_slabs> <sharedavail>
dentry            133350 133350    192   42    2 : tunables    0    0    0 : slabdata   3175   3175      0

                                               ^ here

and it could avoid even more internal fragmentation with bigger
orders. It only doesn't because of the overhead of allocating them.

If the default block size in the allocator were 2M, we'd also get slab
packing at that granularity, and we wouldn't have to worry about small
objects breaking huge pages any more than we worry about slab objects
fragmenting 4k pages today.

> > But if the overwhelming number of requests going to the page allocator
> > are larger than 4k pages - anon regions? check. page cache? likely a
> > sizable share. slub? check. network? check - does it even make sense
> > to have that as the default block size for the page allocator anymore?
> > Or even allocate struct page at this granularity?
> 
> Yep, others have talked about that as well.  I think I may even have said
> a few times at LSFMM, "What if we just make PAGE_SIZE 2MB?".  After all,
> my first 386 Linux system was 4-8MB of RAM (it got upgraded).  The 16GB
> laptop that I now have is 2048 times more RAM, so 4x the number of pages
> that system had.
> 
> But people seem attached to being able to use smaller page sizes.
> There's that pesky "compatibility" argument.

Right, that's why I'm NOT saying we should eliminate the support for
4k chunks in the page cache and page tables. That's still useful if
you have lots of small files.

I'm just saying it doesn't have to be the default that everything is
primarily optimized for. We can make the default allocation size of
the allocator correspond to a hugepage and have a secondary allocator
level for 4k chunks. Like slab, but fixed-size and highmem-aware.

It makes sense to make struct page 2M as well. It would save a ton of
memory on average and reduce the pressure we have on struct page's
size today.

And we really don't need struct page at 4k just to support this unit
of paging when necesary: page tables don't care, they use pfns and can
point to any 4k offset, struct page or no struct page. For the page
cache, we can move mapping, index, lru. etc from today's struct page
into an entry descriptor that could either sit in a native 2M struct
page (just like today), or be be allocated on demand and point into a
chunked struct page. Same for <2M anonymous mappings.

Hey, didn't you just move EXACTLY those fields into the folio? ;)

All this to reiterate, I really do agree with the concept of a new
type of object for paging, page cache entries, etc. But I think there
are good reasons to assume that this unit of paging needs to support
sizes smaller than the standard page size used by the kernel at large,
and so 'bundle of pages' is not a good way of defining it.

It can easily cause problems down the line again if people continue to
assume that there is at least one PAGE_SIZE struct page in a folio.

And it's not obvious to me why it really NEEDS to be 'bundle of pages'
instead of just 'chunk of memory'.

> > So I think transitioning away from ye olde page is a great idea. I
> > wonder this: have we mapped out the near future of the VM enough to
> > say that the folio is the right abstraction?
> > 
> > What does 'folio' mean when it corresponds to either a single page or
> > some slab-type object with no dedicated page?
> > 
> > If we go through with all the churn now anyway, IMO it makes at least
> > sense to ditch all association and conceptual proximity to the
> > hardware page or collections thereof. Simply say it's some length of
> > memory, and keep thing-to-page translations out of the public API from
> > the start. I mean, is there a good reason to keep this baggage?
> > 
> > mem_t or something.
> > 
> > mem = find_get_mem(mapping, offset);
> > p = kmap(mem, offset - mem_file_offset(mem), len);
> > copy_from_user(p, buf, len);
> > kunmap(mem);
> > SetMemDirty(mem);
> > put_mem(mem);
> 
> I think there's still value to the "new thing" being a power of two
> in size.  I'm not sure you were suggesting otherwise, but it's worth
> putting on the table as something we explicitly agree on (or not!)

Ha, I wasn't thinking about minimum alignment. I used the byte offsets
because I figured that's what's natural to the fs and saw no reason to
have it think in terms of page size in this example.

>From an implementation pov, since anything in the page cache can end
up in a page table, it probably doesn't make a whole lot of sense to
allow quantities smaller than the smallest unit of paging supported by
the processor. But I wonder if that's mostly something the MM would
care about when it allocates these objects, not necessarily something
that needs to be reflected in the interface or the filesystem.

The other point I was trying to make was just the alternate name. As I
said above, I think 'bundle of pages' as a concept is a strategic
error that will probably come back to haunt us.

I also have to admit, I really hate the name. We may want to stop
people thinking of PAGE_SIZE, but this term doesn't give people any
clue WHAT to think of. Ten years down the line, when the possible
confusion between folio and page and PAGE_SIZE has been eradicated,
people still will have to google what a folio is, and then have a hard
time retaining a mental image. I *know* what it is and I still have a
hard time reading code that uses it.

That's why I drafted around with the above code, to see if it would go
down easier. I think it does. It's simple, self-explanatory, but
abstract enough as to not make assumptions around its implementation.
Filesystem look up cache memory, write data in it, mark memory dirty.

Maybe folio makes more sense to native speakers, but I have never
heard this term. Of course when you look it up, it's "something to do
with pages" :D

As a strategy to unseat the obsolete mental model around pages, IMO
redirection would be preferable to confusion.

> > There are 10k instances of 'page' in mm/ outside the page allocator, a
> > majority of which will be the new thing. 14k in fs. I don't think I
> > have the strength to type shrink_folio_list(), or explain to new
> > people what it means, years after it has stopped making sense.
> 
> One of the things I don't like about the current iteration of folio
> is that getting to things is folio->page.mapping.  I think it does want
> to be folio->mapping, and I'm playing around with this:
> 
>  struct folio {
> -       struct page page;
> +       union {
> +               struct page page;
> +               struct {
> +                       unsigned long flags;
> +                       struct list_head lru;
> +                       struct address_space *mapping;
> +                       pgoff_t index;
> +                       unsigned long private;
> +                       atomic_t _mapcount;
> +                       atomic_t _refcount;
> +               };
> +       };
>  };
> 
> +static inline void folio_build_bug(void)
> +{
> +#define FOLIO_MATCH(pg, fl)                                            \
> +BUILD_BUG_ON(offsetof(struct page, pg) != offsetof(struct folio, fl));
> +
> +       FOLIO_MATCH(flags, flags);
> +       FOLIO_MATCH(lru, lru);
> +       FOLIO_MATCH(mapping, mapping);
> +       FOLIO_MATCH(index, index);
> +       FOLIO_MATCH(private, private);
> +       FOLIO_MATCH(_mapcount, _mapcount);
> +       FOLIO_MATCH(_refcount, _refcount);
> +#undef FOLIO_MATCH
> +       BUILD_BUG_ON(sizeof(struct page) != sizeof(struct folio));
> +}
> 
> with the intent of eventually renaming page->mapping to page->__mapping
> so people can't look at page->mapping on a tail page.  If we even have
> tail pages eventually.  I could see a future where we have pte_to_pfn(),
> pfn_to_folio() and are completely page-free (... the vm_fault would
> presumably return a pfn instead of a page at that point ...).  But that's
> too ambitious a project to succeed any time soon.
>
> There's a lot of transitional stuff in these patches where I do
> &folio->page.  I cringe a little every time I write that.

Instead of the union in there, could you do this?

	struct thing {
		struct address_space *mapping;
		pgoff_t index;
		...
	};

	struct page {
		union {
			struct thing thing;
			...
		}
	}

and use container_of() to get to the page in those places?

> So yes, let's ask the question of "Is this the right short term, medium
> term or long term approach?"  I think it is, at least in broad strokes.
> Let's keep refining it.

Yes, yes, and yes. :)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

