Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2013134F2E1
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Mar 2021 23:14:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-jekUafqHPwKu0FzruAudfw-1; Tue, 30 Mar 2021 17:14:13 -0400
X-MC-Unique: jekUafqHPwKu0FzruAudfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 757271084D6E;
	Tue, 30 Mar 2021 21:14:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC98C62A22;
	Tue, 30 Mar 2021 21:14:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E13B31809C83;
	Tue, 30 Mar 2021 21:14:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12ULAIxx002403 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 17:10:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5569E2026D07; Tue, 30 Mar 2021 21:10:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 502172026D6B
	for <linux-cachefs@redhat.com>; Tue, 30 Mar 2021 21:10:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB2A9800B23
	for <linux-cachefs@redhat.com>; Tue, 30 Mar 2021 21:10:15 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-588-RRdPZs3POIu-ojNzqvyebA-1; Tue, 30 Mar 2021 17:10:11 -0400
X-MC-Unique: RRdPZs3POIu-ojNzqvyebA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lRLc9-003bpa-7a; Tue, 30 Mar 2021 21:09:38 +0000
Date: Tue, 30 Mar 2021 22:09:29 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Message-ID: <20210330210929.GR351017@casper.infradead.org>
References: <20210320054104.1300774-1-willy@infradead.org>
	<YFja/LRC1NI6quL6@cmpxchg.org>
	<20210322184744.GU1719932@casper.infradead.org>
	<YFqH3B80Gn8pcPqB@cmpxchg.org>
	<20210324062421.GQ1719932@casper.infradead.org>
	<YF4eX/VBPLmontA+@cmpxchg.org>
	<20210329165832.GG351017@casper.infradead.org>
	<YGN8biqigvPP0SGN@cmpxchg.org>
MIME-Version: 1.0
In-Reply-To: <YGN8biqigvPP0SGN@cmpxchg.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 30, 2021 at 03:30:54PM -0400, Johannes Weiner wrote:
> Hi Willy,
> 
> On Mon, Mar 29, 2021 at 05:58:32PM +0100, Matthew Wilcox wrote:
> > I'm going to respond to some points in detail below, but there are a
> > couple of overarching themes that I want to bring out up here.
> > 
> > Grand Vision
> > ~~~~~~~~~~~~
> > 
> > I haven't outlined my long-term plan.  Partly because it is a _very_
> > long way off, and partly because I think what I'm doing stands on its
> > own.  But some of the points below bear on this, so I'll do it now.
> > 
> > Eventually, I want to make struct page optional for allocations.  It's too
> > small for some things (allocating page tables, for example), and overly
> > large for others (allocating a 2MB page, networking page_pool).  I don't
> > want to change its size in the meantime; having a struct page refer to
> > PAGE_SIZE bytes is something that's quite deeply baked in.
> 
> Right, I think it's overloaded and it needs to go away from many
> contexts it's used in today.
> 
> I think it describes a real physical thing, though, and won't go away
> as a concept. More on that below.

I'm at least 90% with you on this, and we're just quibbling over details
at this point, I think.

> > In broad strokes, I think that having a Power Of Two Allocator
> > with Descriptor (POTAD) is a useful foundational allocator to have.
> > The specific allocator that we call the buddy allocator is very clever for
> > the 1990s, but touches too many cachelines to be good with today's CPUs.
> > The generalisation of the buddy allocator to the POTAD lets us allocate
> > smaller quantities (eg a 512 byte block) and allocate descriptors which
> > differ in size from a struct page.  For an extreme example, see xfs_buf
> > which is 360 bytes and is the descriptor for an allocation between 512
> > and 65536 bytes.
> 
> I actually disagree with this rather strongly. If anything, the buddy
> allocator has turned out to be a pretty poor fit for the foundational
> allocator.
> 
> On paper, it is elegant and versatile in serving essentially arbitrary
> memory blocks. In practice, we mostly just need 4k and 2M chunks from
> it. And it sucks at the 2M ones because of the fragmentation caused by
> the ungrouped 4k blocks.

That's a very Intel-centric way of looking at it.  Other architectures
support a multitude of page sizes, from the insane ia64 (4k, 8k, 16k, then
every power of four up to 4GB) to more reasonable options like (4k, 32k,
256k, 2M, 16M, 128M).  But we (in software) shouldn't constrain ourselves
to thinking in terms of what the hardware currently supports.  Google
have data showing that for their workloads, 32kB is the goldilocks size.
I'm sure for some workloads, it's much higher and for others it's lower.
But for almost no workload is 4kB the right choice any more, and probably
hasn't been since the late 90s.

> The great thing about the slab allocator isn't just that it manages
> internal fragmentation of the larger underlying blocks. It also groups
> related objects by lifetime/age and reclaimability, which dramatically
> mitigates the external fragmentation of the memory space.
> 
> The buddy allocator on the other hand has no idea what you want that
> 4k block for, and whether it pairs up well with the 4k block it just
> handed to somebody else. But the decision it makes in that moment is
> crucial for its ability to serve larger blocks later on.
> 
> We do some mobility grouping based on how reclaimable or migratable
> the memory is, but it's not the full answer.

I don't think that's entirely true.  The vast majority of memory in any
machine is either anonymous or page cache.  The problem is that right now,
all anonymous and page cache allocations are order-0 (... or order-9).
So the buddy allocator can't know anything useful about the pages and will
often allocate one order-0 page to the page cache, then allocate its buddy
to the slab cache in order to allocate the radix_tree_node to store the
pointer to the page in (ok, radix tree nodes come from an order-2 cache,
but it still prevents this order-9 page from being assembled).

If the movable allocations suddenly start being order-3 and order-4,
the unmovable, unreclaimable allocations are naturally going to group
down in the lower orders, and we won't have the problem that a single
dentry blocks the allocation of an entire 2MB page.

The problem, for me, with the ZONE_MOVABLE stuff is that it requires
sysadmin intervention to set up.  I don't have a ZONE_MOVABLE on
my laptop.  The allocator should be automatically handling movability
hints without my intervention.

> A variable size allocator without object type grouping will always
> have difficulties producing anything but the smallest block size after
> some uptime. It's inherently flawed that way.

I think our buddy allocator is flawed, to be sure, but only because
it doesn't handle movable hints more aggressively.  For example, at
the point that a largeish block gets a single non-movable allocation,
all the movable allocations within that block should be migrated out.
If the offending allocation is freed quickly, it all collapses into a
large, useful chunk, or if not, then it provides a sponge to soak up
other non-movable allocations.

> > What I haven't touched on anywhere in this, is whether a folio is the
> > descriptor for all POTA or whether it's specifically the page cache
> > descriptor.  I like the idea of having separate descriptors for objects
> > in the page cache from anonymous or other allocations.  But I'm not very
> > familiar with the rmap code, and that wants to do things like manipulate
> > the refcount on a descriptor without knowing whether it's a file or
> > anon page.  Or neither (eg device driver memory mapped to userspace.
> > Or vmalloc memory mapped to userspace.  Or ...)
> 
> The rmap code is all about the page type specifics, but once you get
> into mmap, page reclaim, page migration, we're dealing with fully
> fungible blocks of memory.
> 
> I do like the idea of using actual language typing for the different
> things struct page can be today (fs page), but with a common type to
> manage the fungible block of memory backing it (allocation state, LRU
> & aging state, mmap state etc.)
> 
> New types for the former are an easier sell. We all agree that there
> are too many details of the page - including the compound page
> implementation detail - inside the cache library, fs code and drivers.
> 
> It's a slightly tougher sell to say that the core VM code itself
> (outside the cache library) needs a tighter abstraction for the struct
> page building block and the compound page structure. At least at this
> time while we're still sorting out how it all may work down the line.
> Certainly, we need something to describe fungible memory blocks:
> either a struct page that can be 4k and 2M compound, or a new thing
> that can be backed by a 2M struct page or a 4k struct smallpage. We
> don't know yet, so I would table the new abstraction type for this.
> 
> I generally don't think we want a new type that does everything that
> the overloaded struct page already does PLUS the compound
> abstraction. Whatever name we pick for it, it'll always be difficult
> to wrap your head around such a beast.
> 
> IMO starting with an explicit page cache descriptor that resolves to
> struct page inside core VM code (and maybe ->fault) for now makes the
> most sense: it greatly mitigates the PAGE_SIZE and tail page issue
> right away, and it's not in conflict with, but rather helps work
> toward, replacing the fungible memory unit behind it.

Right, and that's what struct folio is today.  It eliminates tail pages
from consideration in a lot of paths.  I think it also makes sense for
struct folio to be used for anonymous memory.  But I think that's where it
stops; it isn't for Slab, it isn't for page table pages, and it's not
for ZONE_DEVICE pages.

> There isn't too much overlap or generic code between cache and anon
> pages such that sharing a common descriptor would be a huge win (most
> overlap is at the fungible memory block level, and the physical struct
> page layout of course), so I don't think we should aim for a generic
> abstraction for both.

They're both on the LRU list, they use a lot of the same PageFlags,
they both have a mapcount and refcount, and they both have memcg_data.
The only things they really use differently are mapping, index and
private.  And then we have to consider shmem which uses both in a
pretty eldritch way.

> As drivers go, I think there are slightly different requirements to
> filesystems, too. For filesystems, when the VM can finally do it (and
> the file range permits it), I assume we want to rather transparently
> increase the unit of data transfer from 4k to 2M. Most drivers that
> currently hardcode alloc_page() or PAGE_SIZE OTOH probably don't want
> us to bump their allocation sizes.

If you take a look at my earlier work, you'll see me using a range of
sizes in the page cache, starting at 16kB and gradually increasing to
(theoretically) 2MB, although the algorithm tended to top out around
256kB.  Doing particularly large reads could see 512kB/1MB reads, but
it was very hard to hit 2MB in practice.  I wasn't too concerned at the
time, but my point is that we do want to automatically tune the size
of the allocation unit to the workload.  An application which reads in
64kB chunks is giving us a pretty clear signal that they want to manage
memory in 64kB chunks.

> > It'd probably be better to have the dcache realise that its old entries
> > aren't useful any more and age them out instead of relying on memory
> > pressure to remove old entries, so this is probably an unnecessary
> > digression.
> 
> It's difficult to identify a universally acceptable line for
> usefulness of caches other than physical memory pressure.
> 
> The good thing about the memory pressure threshold is that you KNOW
> somebody else has immediate use for the memory, and you're justified
> in recycling and reallocating caches from the cold end.
> 
> Without that, you'd either have to set an arbitrary size cutoff or an
> arbitrary aging cutoff (not used in the last minute e.g.). But optimal
> settings for either of those depend on the workload, and aren't very
> intuitive to configure.

For the dentry cache, I think there is a more useful metric, and that's
length of the hash chain.  If it gets too long, we're spending more time
walking it than we're saving by having entries cached.  Starting reclaim
based on "this bucket of the dcache has twenty entries in it" would
probably work quite well.

> Our levels of internal fragmentation are historically low, which of
> course is nice by itself. But that's also what's causing problems in
> the form of external fragmentation, and why we struggle to produce 2M
> blocks. It's multitudes easier to free one 2M slab page of
> consecutively allocated inodes than it is to free 512 batches of
> different objects with conflicting lifetimes, ages, or potentially
> even reclaimability.

Unf.  I don't think freeing 2MB worth of _anything_ is ever going to be
easy enough to rely on.  My actual root filesystem:

xfs_inode         143134 144460   1024   32    8 : tunables    0    0    0 : slabdata   4517   4517      0

So we'd have to be able to free 2048 of those 143k inodes, and they all
have to be consecutive (and aligned).  I suppose we could model that and
try to work out how many we'd have to be able to free in order to get all
2048 in any page free, but I bet it's a variant of the Birthday Paradox,
and we'd find it's something crazy like half of them.

Without slab gaining the ability to ask users to relocate allocations,
I think any memory sent to slab is never coming back.


So ... even if I accept every part of your vision as the way things
are going to be, I think the folio patchset I have now is a step in the
right direction.  I'm going to send a v6 now and hope it's not too late
for this merge window.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

