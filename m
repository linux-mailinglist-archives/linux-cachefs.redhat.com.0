Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 16062354716
	for <lists+linux-cachefs@lfdr.de>; Mon,  5 Apr 2021 21:23:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-5Y9yidD2Ml-cVQHbQEr6GQ-1; Mon, 05 Apr 2021 15:23:19 -0400
X-MC-Unique: 5Y9yidD2Ml-cVQHbQEr6GQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8104E107ACCA;
	Mon,  5 Apr 2021 19:23:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F58F5D749;
	Mon,  5 Apr 2021 19:23:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B5894BB7B;
	Mon,  5 Apr 2021 19:23:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 135JN7FU007028 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 5 Apr 2021 15:23:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77EE62166BA3; Mon,  5 Apr 2021 19:23:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72A552166B2D
	for <linux-cachefs@redhat.com>; Mon,  5 Apr 2021 19:23:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 222A2104D99D
	for <linux-cachefs@redhat.com>; Mon,  5 Apr 2021 19:23:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-104-FGW-NEhcM7yMS31LVtdRow-1;
	Mon, 05 Apr 2021 15:23:03 -0400
X-MC-Unique: FGW-NEhcM7yMS31LVtdRow-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 344456138D;
	Mon,  5 Apr 2021 19:14:30 +0000 (UTC)
Message-ID: <759cfbb63ca960b2893f2b879035c2a42c80462d.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-mm@kvack.org
Date: Mon, 05 Apr 2021 15:14:29 -0400
In-Reply-To: <20210331184728.1188084-1-willy@infradead.org>
References: <20210331184728.1188084-1-willy@infradead.org>
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2021-03-31 at 19:47 +0100, Matthew Wilcox (Oracle) wrote:
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
> approximately 5kB by removing conversions from tail pages to head pages.
> The real purpose of this series is adding infrastructure to enable
> further use of the folio.
> 
> The medium-term goal is to convert all filesystems and some device
> drivers to work in terms of folios.  This series contains a lot of
> explicit conversions, but it's important to realise it's removing a lot
> of implicit conversions in some relatively hot paths.  There will be very
> few conversions from folios when this work is completed; filesystems,
> the page cache, the LRU and so on will generally only deal with folios.
> 
> I analysed the text size reduction using a config based on Oracle UEK
> with all modules changed to built-in.  That's obviously not a kernel
> which makes sense to run, but it serves to compare the effects on (many
> common) filesystems & drivers, not just the core.
> 
> add/remove: 34266/34260 grow/shrink: 5220/3206 up/down: 1083860/-1088546 (-4686)
> 
> Current tree at:
> https://git.infradead.org/users/willy/pagecache.git/shortlog/refs/heads/folio
> 
> (contains another ~100 patches on top of this batch, not all of which are
> in good shape for submission)
> 
> v6:
>  - Rebase on next-20210330
>    - wait_bit_key patch merged by Linus
>    - wait_on_page_writeback_killable() patches merged by Linus
>    - Documentation patch merged by Andrew
>  - Move folio_next_index() into this series
>  - Move folio_offset() and folio_file_offset() into this series
>  - Mirror members of struct page (for pagecache / anon) into struct folio,
>    so (eg) you can use folio->mapping instead of folio->page.mapping
>  - Add folio_ref_* functions, including kernel-doc for folio_ref_count().
>  - Add count_memcg_folio_event()
>  - Add put_folio_testzero()
>  - Add folio_mapcount()
>  - Add FolioKsm()
>  - Fix afs_page_mkwrite() compilation
>  - Fix/improve kernel-doc for
>    - struct folio
>    - add_folio_wait_queue()
>    - wait_for_stable_folio()
>    - wait_on_folio_writeback()
>    - wait_on_folio_writeback_killable()
> v5:
>  - Rebase on next-20210319
>  - Pull out three bug-fix patches to the front of the series, allowing
>    them to be applied earlier.
>  - Fix folio_page() against pages being moved between swap & page cache
>  - Fix FolioDoubleMap to use the right page flags
>  - Rename next_folio() to folio_next() (akpm)
>  - Renamed folio stat functions (akpm)
>  - Add 'mod' versions of the folio stats for users that already have 'nr'
>  - Renamed folio_page to folio_file_page() (akpm)
>  - Added kernel-doc for struct folio, folio_next(), folio_index(),
>    folio_file_page(), folio_contains(), folio_order(), folio_nr_pages(),
>    folio_shift(), folio_size(), page_folio(), get_folio(), put_folio()
>  - Make folio_private() work in terms of void * instead of unsigned long
>  - Used page_folio() in attach/detach page_private() (hch)
>  - Drop afs_page_mkwrite folio conversion from this series
>  - Add wait_on_folio_writeback_killable()
>  - Convert add_page_wait_queue() to add_folio_wait_queue()
>  - Add folio_swap_entry() helper
>  - Drop the additions of *FolioFsCache
>  - Simplify the addition of lock_folio_memcg() et al
>  - Drop test_clear_page_writeback() conversion from this series
>  - Add FolioTransHuge() definition
>  - Rename __folio_file_mapping() to swapcache_mapping()
>  - Added swapcache_index() helper
>  - Removed lock_folio_async()
>  - Made __lock_folio_async() static to filemap.c
>  - Converted unlock_page_private_2() to use a folio internally
> v4:
>  - Rebase on current Linus tree (including swap fix)
>  - Analyse each patch in terms of its effects on kernel text size.
>    A few were modified to improve their effect.  In particular, where
>    pushing calls to page_folio() into the callers resulted in unacceptable
>    size increases, the wrapper was placed in mm/folio-compat.c.  This lets
>    us see all the places which are good targets for conversion to folios.
>  - Some of the patches were reordered, split or merged in order to make
>    more logical sense.
>  - Use nth_page() for folio_next() if we're using SPARSEMEM and not
>    VMEMMAP (Zi Yan)
>  - Increment and decrement page stats in units of pages instead of units
>    of folios (Zi Yan)
> v3:
>  - Rebase on next-20210127.  Two major sources of conflict, the
>    generic_file_buffered_read refactoring (in akpm tree) and the
>    fscache work (in dhowells tree).
> v2:
>  - Pare patch series back to just infrastructure and the page waiting
>    parts.
> 
> Matthew Wilcox (Oracle) (27):
>   mm: Introduce struct folio
>   mm: Add folio_pgdat and folio_zone
>   mm/vmstat: Add functions to account folio statistics
>   mm/debug: Add VM_BUG_ON_FOLIO and VM_WARN_ON_ONCE_FOLIO
>   mm: Add folio reference count functions
>   mm: Add put_folio
>   mm: Add get_folio
>   mm: Create FolioFlags
>   mm: Handle per-folio private data
>   mm/filemap: Add folio_index, folio_file_page and folio_contains
>   mm/filemap: Add folio_next_index
>   mm/filemap: Add folio_offset and folio_file_offset
>   mm/util: Add folio_mapping and folio_file_mapping
>   mm: Add folio_mapcount
>   mm/memcg: Add folio wrappers for various functions
>   mm/filemap: Add unlock_folio
>   mm/filemap: Add lock_folio
>   mm/filemap: Add lock_folio_killable
>   mm/filemap: Add __lock_folio_async
>   mm/filemap: Add __lock_folio_or_retry
>   mm/filemap: Add wait_on_folio_locked
>   mm/filemap: Add end_folio_writeback
>   mm/writeback: Add wait_on_folio_writeback
>   mm/writeback: Add wait_for_stable_folio
>   mm/filemap: Convert wait_on_page_bit to wait_on_folio_bit
>   mm/filemap: Convert wake_up_page_bit to wake_up_folio_bit
>   mm/filemap: Convert page wait queues to be folios
> 
>  Documentation/core-api/mm-api.rst |   3 +
>  fs/afs/write.c                    |   7 +-
>  fs/cachefiles/rdwr.c              |  16 +-
>  fs/io_uring.c                     |   2 +-
>  include/linux/memcontrol.h        |  30 ++++
>  include/linux/mm.h                | 177 ++++++++++++++++----
>  include/linux/mm_types.h          |  81 +++++++++
>  include/linux/mmdebug.h           |  20 +++
>  include/linux/netfs.h             |   2 +-
>  include/linux/page-flags.h        | 130 +++++++++++---
>  include/linux/page_ref.h          |  88 +++++++++-
>  include/linux/pagemap.h           | 270 ++++++++++++++++++++++--------
>  include/linux/swap.h              |   6 +
>  include/linux/vmstat.h            | 107 ++++++++++++
>  mm/Makefile                       |   2 +-
>  mm/filemap.c                      | 242 +++++++++++++-------------
>  mm/folio-compat.c                 |  37 ++++
>  mm/memory.c                       |   8 +-
>  mm/page-writeback.c               |  72 +++++---
>  mm/swapfile.c                     |   8 +-
>  mm/util.c                         |  49 ++++--
>  21 files changed, 1051 insertions(+), 306 deletions(-)
>  create mode 100644 mm/folio-compat.c
> 
> -- 
> 2.30.2
> 
> 
> From 99da34311602826672621c3d69bad13813993c1a Mon Sep 17 00:00:00 2001
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Date: Tue, 30 Mar 2021 10:47:46 -0400
> Subject: [PATCH v6 00/25] *** SUBJECT HERE ***
> To: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org,
>     linux-fsdevel@vger.kernel.org,
>     linux-cachefs@redhat.com,
>     linux-afs@lists.infradead.org
> 
> *** BLURB HERE ***
> 
> Matthew Wilcox (Oracle) (25):
>   mm: Introduce struct folio
>   mm: Add folio_pgdat and folio_zone
>   mm/vmstat: Add functions to account folio statistics
>   mm/debug: Add VM_BUG_ON_FOLIO and VM_WARN_ON_ONCE_FOLIO
>   mm: Add put_folio
>   mm: Add get_folio
>   mm: Create FolioFlags
>   mm: Handle per-folio private data
>   mm/filemap: Add folio_index, folio_file_page and folio_contains
>   mm/filemap: Add folio_next_index
>   mm/filemap: Add folio_offset and folio_file_offset
>   mm/util: Add folio_mapping and folio_file_mapping
>   mm/memcg: Add folio wrappers for various functions
>   mm/filemap: Add unlock_folio
>   mm/filemap: Add lock_folio
>   mm/filemap: Add lock_folio_killable
>   mm/filemap: Add __lock_folio_async
>   mm/filemap: Add __lock_folio_or_retry
>   mm/filemap: Add wait_on_folio_locked
>   mm/filemap: Add end_folio_writeback
>   mm/writeback: Add wait_on_folio_writeback
>   mm/writeback: Add wait_for_stable_folio
>   mm/filemap: Convert wait_on_page_bit to wait_on_folio_bit
>   mm/filemap: Convert wake_up_page_bit to wake_up_folio_bit
>   mm/filemap: Convert page wait queues to be folios
> 
>  Documentation/core-api/mm-api.rst |   2 +
>  fs/afs/write.c                    |   7 +-
>  fs/cachefiles/rdwr.c              |  16 +-
>  fs/io_uring.c                     |   2 +-
>  include/linux/memcontrol.h        |  21 +++
>  include/linux/mm.h                | 156 +++++++++++++----
>  include/linux/mm_types.h          |  81 +++++++++
>  include/linux/mmdebug.h           |  20 +++
>  include/linux/netfs.h             |   2 +-
>  include/linux/page-flags.h        | 120 ++++++++++---
>  include/linux/pagemap.h           | 270 ++++++++++++++++++++++--------
>  include/linux/swap.h              |   6 +
>  include/linux/vmstat.h            | 107 ++++++++++++
>  mm/Makefile                       |   2 +-
>  mm/filemap.c                      | 242 +++++++++++++-------------
>  mm/folio-compat.c                 |  37 ++++
>  mm/memory.c                       |   8 +-
>  mm/page-writeback.c               |  72 +++++---
>  mm/swapfile.c                     |   8 +-
>  mm/util.c                         |  49 ++++--
>  20 files changed, 926 insertions(+), 302 deletions(-)
>  create mode 100644 mm/folio-compat.c
> 

I too am a little concerned about the amount of churn this is likely to
cause, but this does seem like a fairly promising way forward for
actually using THPs in the pagecache. The set is fairly straightforward.

That said, there are few callers of these new functions in here. Is this
set enough to allow converting some subsystem to use folios? It might be
good to do that if possible, so we can get an idea of how much work
we're in for.

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

