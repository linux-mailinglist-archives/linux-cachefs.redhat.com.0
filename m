Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2AF35ABBC
	for <lists+linux-cachefs@lfdr.de>; Sat, 10 Apr 2021 09:43:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618040612;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aQ5+ER6I7+i3xeK2ZLnXf5mdxxuSaHc2N5zF6LbLxmY=;
	b=gYK3AiC3qyzZn3TjBlxHwoKw03uOzinQVPtNlpeYzrdYmrCFlJTbUNhTJVautv9kj5XTFz
	lm4BYB4jC6+o0Lz34ez3c+Lbxg2YcNG+HlIEUOjzaNFazijkx6Lqwu38/N4flIS4TguOTK
	5Dhy6iy8ZjUxQJ2FpZP4V5mLSf3WMDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-fIS65aCSNtCHT5OepnUdAQ-1; Sat, 10 Apr 2021 03:43:30 -0400
X-MC-Unique: fIS65aCSNtCHT5OepnUdAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F171780D6A9;
	Sat, 10 Apr 2021 07:43:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B086369A;
	Sat, 10 Apr 2021 07:43:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 143791806D10;
	Sat, 10 Apr 2021 07:43:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139C5Mev003339 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 08:05:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7EBA110379D; Fri,  9 Apr 2021 12:05:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7936A10482D
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 12:05:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 843C3802C1B
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 12:05:19 +0000 (UTC)
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
	[209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-564-Di6FS_KKN1mbvPzmaMZmiA-1; Fri, 09 Apr 2021 08:05:18 -0400
X-MC-Unique: Di6FS_KKN1mbvPzmaMZmiA-1
Received: by mail-yb1-f198.google.com with SMTP id k199so2374367ybf.0
	for <linux-cachefs@redhat.com>; Fri, 09 Apr 2021 05:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4YB/yXO3WcXh4gjqG/AQitp/ke5dP3pJqtYgeLFW/yc=;
	b=UEJKgeosrIBk+3qTK4edDcKPq011z5uOanIaD7ngHL2u00yX5k2QE+qxGENC6wxAL8
	kl/fVZ05Jm8Uc2QVq0CkZh2TUcqHJqoxZEpdLDTP+33PmQffetuFIKj8PEONLD15sDvq
	s85qv9WfTtSZ3+iAtVlymgqXpnw04VgeLQrrxrcjfFKl49JUhjKWLHkGTZJbyvzOM5X6
	loK03Sk+cg152QCaNtMBVpTQr1ocYDtIywcic5j7nsiMf1z+jiPku3HkDW0563ksSi0N
	pznMcvnRapSOhw6I9E78eB99+glmdscoJuW418IAdA+61VOff5MH1bSYaqWoVKR/cnBN
	hF1g==
X-Gm-Message-State: AOAM530WBvSP7RgIrbxuwmAAoD5MShwFnFnJoftVYUGs1Piv6VGCqotf
	uNGXZsFgaVitS5AD9CyinqpxW9zDtrvtGMIYOqnNwQI3zeZGYZd98Yq9I1zFklDJiGcDZbdx1ja
	JPLhjXfHufsQWlg5Tp/NeVRhnDgabqBk1WWvW4A==
X-Received: by 2002:a25:e74d:: with SMTP id e74mr311353ybh.423.1617969917340; 
	Fri, 09 Apr 2021 05:05:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrfhli/GqXEIu7O2+MBCMr0DO9wHQ+dDGo3RAQZykmzV29kae/Yag/SpnsVYRWRFi/mIP1/YLMR5luzXtOgcg=
X-Received: by 2002:a25:e74d:: with SMTP id e74mr311297ybh.423.1617969916792; 
	Fri, 09 Apr 2021 05:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
In-Reply-To: <161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Fri, 9 Apr 2021 08:04:41 -0400
Message-ID: <CALF+zO=AV-uqUi9kwyGhGQU3jNpE8TEk_BS8z73z68cexGPz_w@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Sat, 10 Apr 2021 03:43:19 -0400
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Christoph Hellwig <hch@lst.de>, Steve French <sfrench@samba.org>,
	linux-mm@kvack.org, linux-cachefs <linux-cachefs@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-afs@lists.infradead.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Mike Marshall <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] [PATCH v6 00/30] Network fs helper library &
	fscache kiocb API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 8, 2021 at 10:04 AM David Howells <dhowells@redhat.com> wrote:
>
>
> Here's a set of patches to do two things:
>
>  (1) Add a helper library to handle the new VM readahead interface.  This
>      is intended to be used unconditionally by the filesystem (whether or
>      not caching is enabled) and provides a common framework for doing
>      caching, transparent huge pages and, in the future, possibly fscrypt
>      and read bandwidth maximisation.  It also allows the netfs and the
>      cache to align, expand and slice up a read request from the VM in
>      various ways; the netfs need only provide a function to read a stretch
>      of data to the pagecache and the helper takes care of the rest.
>
>  (2) Add an alternative fscache/cachfiles I/O API that uses the kiocb
>      facility to do async DIO to transfer data to/from the netfs's pages,
>      rather than using readpage with wait queue snooping on one side and
>      vfs_write() on the other.  It also uses less memory, since it doesn't
>      do buffered I/O on the backing file.
>
>      Note that this uses SEEK_HOLE/SEEK_DATA to locate the data available
>      to be read from the cache.  Whilst this is an improvement from the
>      bmap interface, it still has a problem with regard to a modern
>      extent-based filesystem inserting or removing bridging blocks of
>      zeros.  Fixing that requires a much greater overhaul.
>
> This is a step towards overhauling the fscache API.  The change is opt-in
> on the part of the network filesystem.  A netfs should not try to mix the
> old and the new API because of conflicting ways of handling pages and the
> PG_fscache page flag and because it would be mixing DIO with buffered I/O.
> Further, the helper library can't be used with the old API.
>
> This does not change any of the fscache cookie handling APIs or the way
> invalidation is done.
>
> In the near term, I intend to deprecate and remove the old I/O API
> (fscache_allocate_page{,s}(), fscache_read_or_alloc_page{,s}(),
> fscache_write_page() and fscache_uncache_page()) and eventually replace
> most of fscache/cachefiles with something simpler and easier to follow.
>
> The patchset contains the following parts:
>
>  (1) Some helper patches, including provision of an ITER_XARRAY iov
>      iterator and a function to do readahead expansion.
>
>  (2) Patches to add the netfs helper library.
>
>  (3) A patch to add the fscache/cachefiles kiocb API.
>
>  (4) Patches to add support in AFS for this.
>
> Jeff Layton has patches to add support in Ceph for this.
>
> With this, AFS without a cache passes all expected xfstests; with a cache,
> there's an extra failure, but that's also there before these patches.
> Fixing that probably requires a greater overhaul.  Ceph also passes the
> expected tests.
>
> The netfs lib and fscache/cachefiles patches can be found also on:
>
>         https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=netfs-lib
>
> The afs patches can be found on:
>
>         https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=afs-netfs-lib
>
>
> Changes
> =======
>
> ver #6:
>       Merged in some fixes and added an additional tracepoint[8], including
>       fixing the amalgamation of contiguous subrequests that are to be
>       written to the cache.
>
>       Added/merged some patches from Matthew Wilcox to make
>       readahead_expand() appropriately adjust the trigger for the next
>       readahead[9].  Also included is a patch to kerneldocify the
>       file_ra_state struct.
>
>       Altered netfs_write_begin() to use DEFINE_READAHEAD()[10].
>
>       Split the afs patches out into their own branch.
>
> ver #5:
>       Fixed some review comments from Matthew Wilcox:
>
>       - Put a comment into netfs_readahead() to indicate why there's a loop
>         that puts, but doesn't unlock, "unconsumed" pages at the end when
>         it could just return said pages to the caller to dispose of[6].
>         (This is because where those pages are marked consumed).
>
>       - Use the page_file_mapping() and page_index() helper functions
>         rather than accessing the page struct directly[6].
>
>       - Better names for wrangling functions for PG_private_2 and
>         PG_fscache wrangling functions[7].  Came up with
>         {set,end,wait_for}_page_private_2() and aliased these for fscache.
>
>       Moved the taking of/dropping a page ref for the PG_private_2 flag
>       into the set and end functions.
>
> ver #4:
>       Fixed some review comments from Christoph Hellwig, including dropping
>       the export of rw_verify_area()[3] and some minor stuff[4].
>
>       Moved the declaration of readahead_expand() to a better location[5].
>
>       Rebased to v5.12-rc2 and added a bunch of references into individual
>       commits.
>
>       Dropped Ceph support - that will go through the maintainer's tree.
>
>       Added interface documentation for the netfs helper library.
>
> ver #3:
>       Rolled in the bug fixes.
>
>       Adjusted the functions that unlock and wait for PG_fscache according
>       to Linus's suggestion[1].
>
>       Hold a ref on a page when PG_fscache is set as per Linus's
>       suggestion[2].
>
>       Dropped NFS support and added Ceph support.
>
> ver #2:
>       Fixed some bugs and added NFS support.
>
> Link: https://lore.kernel.org/r/CAHk-=wh+2gbF7XEjYc=HV9w_2uVzVf7vs60BPz0gFA=+pUm3ww@mail.gmail.com/ [1]
> Link: https://lore.kernel.org/r/CAHk-=wjgA-74ddehziVk=XAEMTKswPu1Yw4uaro1R3ibs27ztw@mail.gmail.com/ [2]
> Link: https://lore.kernel.org/r/20210216102614.GA27555@lst.de/ [3]
> Link: https://lore.kernel.org/r/20210216084230.GA23669@lst.de/ [4]
> Link: https://lore.kernel.org/r/20210217161358.GM2858050@casper.infradead.org/ [5]
> Link: https://lore.kernel.org/r/20210321014202.GF3420@casper.infradead.org/ [6]
> Link: https://lore.kernel.org/r/20210321105309.GG3420@casper.infradead.org/ [7]
> Link: https://lore.kernel.org/r/161781041339.463527.18139104281901492882.stgit@warthog.procyon.org.uk/ [8]
> Link: https://lore.kernel.org/r/20210407201857.3582797-1-willy@infradead.org/ [9]
> Link: https://lore.kernel.org/r/1234933.1617886271@warthog.procyon.org.uk/ [10]
>
> References
> ==========
>
> These patches have been published for review before, firstly as part of a
> larger set:
>
> Link: https://lore.kernel.org/r/158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk/
>
> Link: https://lore.kernel.org/r/159465766378.1376105.11619976251039287525.stgit@warthog.procyon.org.uk/
> Link: https://lore.kernel.org/r/159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk/
> Link: https://lore.kernel.org/r/159465821598.1377938.2046362270225008168.stgit@warthog.procyon.org.uk/
>
> Link: https://lore.kernel.org/r/160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk/
>
> Then as a cut-down set:
>
> Link: https://lore.kernel.org/r/161118128472.1232039.11746799833066425131.stgit@warthog.procyon.org.uk/ # v1
>
> Link: https://lore.kernel.org/r/161161025063.2537118.2009249444682241405.stgit@warthog.procyon.org.uk/ # v2
>
> Link: https://lore.kernel.org/r/161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk/ # v3
>
> Link: https://lore.kernel.org/r/161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk/ # v4
>
> Link: https://lore.kernel.org/r/161653784755.2770958.11820491619308713741.stgit@warthog.procyon.org.uk/ # v5
>
> Proposals/information about the design has been published here:
>
> Link: https://lore.kernel.org/r/24942.1573667720@warthog.procyon.org.uk/
> Link: https://lore.kernel.org/r/2758811.1610621106@warthog.procyon.org.uk/
> Link: https://lore.kernel.org/r/1441311.1598547738@warthog.procyon.org.uk/
> Link: https://lore.kernel.org/r/160655.1611012999@warthog.procyon.org.uk/
>
> And requests for information:
>
> Link: https://lore.kernel.org/r/3326.1579019665@warthog.procyon.org.uk/
> Link: https://lore.kernel.org/r/4467.1579020509@warthog.procyon.org.uk/
> Link: https://lore.kernel.org/r/3577430.1579705075@warthog.procyon.org.uk/
>
> I've posted partial patches to try and help 9p and cifs along:
>
> Link: https://lore.kernel.org/r/1514086.1605697347@warthog.procyon.org.uk/
> Link: https://lore.kernel.org/r/1794123.1605713481@warthog.procyon.org.uk/
> Link: https://lore.kernel.org/r/241017.1612263863@warthog.procyon.org.uk/
> Link: https://lore.kernel.org/r/270998.1612265397@warthog.procyon.org.uk/
>
> David
> ---
> David Howells (28):
>       iov_iter: Add ITER_XARRAY
>       mm: Add set/end/wait functions for PG_private_2
>       mm: Implement readahead_control pageset expansion
>       netfs: Make a netfs helper module
>       netfs: Documentation for helper library
>       netfs, mm: Move PG_fscache helper funcs to linux/netfs.h
>       netfs, mm: Add set/end/wait_on_page_fscache() aliases
>       netfs: Provide readahead and readpage netfs helpers
>       netfs: Add tracepoints
>       netfs: Gather stats
>       netfs: Add write_begin helper
>       netfs: Define an interface to talk to a cache
>       netfs: Add a tracepoint to log failures that would be otherwise unseen
>       fscache, cachefiles: Add alternate API to use kiocb for read/write to cache
>       afs: Disable use of the fscache I/O routines
>       afs: Pass page into dirty region helpers to provide THP size
>       afs: Print the operation debug_id when logging an unexpected data version
>       afs: Move key to afs_read struct
>       afs: Don't truncate iter during data fetch
>       afs: Log remote unmarshalling errors
>       afs: Set up the iov_iter before calling afs_extract_data()
>       afs: Use ITER_XARRAY for writing
>       afs: Wait on PG_fscache before modifying/releasing a page
>       afs: Extract writeback extension into its own function
>       afs: Prepare for use of THPs
>       afs: Use the fs operation ops to handle FetchData completion
>       afs: Use new netfs lib read helper API
>       afs: Use the netfs_write_begin() helper
>
> Matthew Wilcox (Oracle) (2):
>       mm/filemap: Pass the file_ra_state in the ractl
>       fs: Document file_ra_state
>
>
>  Documentation/filesystems/index.rst         |    1 +
>  Documentation/filesystems/netfs_library.rst |  526 ++++++++
>  fs/Kconfig                                  |    1 +
>  fs/Makefile                                 |    1 +
>  fs/afs/Kconfig                              |    1 +
>  fs/afs/dir.c                                |  225 ++--
>  fs/afs/file.c                               |  483 ++------
>  fs/afs/fs_operation.c                       |    4 +-
>  fs/afs/fsclient.c                           |  108 +-
>  fs/afs/inode.c                              |    7 +-
>  fs/afs/internal.h                           |   59 +-
>  fs/afs/rxrpc.c                              |  150 +--
>  fs/afs/write.c                              |  657 +++++-----
>  fs/afs/yfsclient.c                          |   82 +-
>  fs/cachefiles/Makefile                      |    1 +
>  fs/cachefiles/interface.c                   |    5 +-
>  fs/cachefiles/internal.h                    |    9 +
>  fs/cachefiles/io.c                          |  420 +++++++
>  fs/ext4/verity.c                            |    2 +-
>  fs/f2fs/file.c                              |    2 +-
>  fs/f2fs/verity.c                            |    2 +-
>  fs/fscache/Kconfig                          |    1 +
>  fs/fscache/Makefile                         |    1 +
>  fs/fscache/internal.h                       |    4 +
>  fs/fscache/io.c                             |  116 ++
>  fs/fscache/page.c                           |    2 +-
>  fs/fscache/stats.c                          |    1 +
>  fs/netfs/Kconfig                            |   23 +
>  fs/netfs/Makefile                           |    5 +
>  fs/netfs/internal.h                         |   97 ++
>  fs/netfs/read_helper.c                      | 1185 +++++++++++++++++++
>  fs/netfs/stats.c                            |   59 +
>  include/linux/fs.h                          |   24 +-
>  include/linux/fscache-cache.h               |    4 +
>  include/linux/fscache.h                     |   50 +-
>  include/linux/netfs.h                       |  234 ++++
>  include/linux/pagemap.h                     |   41 +-
>  include/net/af_rxrpc.h                      |    2 +-
>  include/trace/events/afs.h                  |   74 +-
>  include/trace/events/netfs.h                |  261 ++++
>  mm/filemap.c                                |   63 +-
>  mm/internal.h                               |    7 +-
>  mm/readahead.c                              |   97 +-
>  net/rxrpc/recvmsg.c                         |    9 +-
>  44 files changed, 3998 insertions(+), 1108 deletions(-)
>  create mode 100644 Documentation/filesystems/netfs_library.rst
>  create mode 100644 fs/cachefiles/io.c
>  create mode 100644 fs/fscache/io.c
>  create mode 100644 fs/netfs/Kconfig
>  create mode 100644 fs/netfs/Makefile
>  create mode 100644 fs/netfs/internal.h
>  create mode 100644 fs/netfs/read_helper.c
>  create mode 100644 fs/netfs/stats.c
>  create mode 100644 include/linux/netfs.h
>  create mode 100644 include/trace/events/netfs.h
>
>

Similar to Jeff, for most of first 16 patches (except patch 1 and 13)
you can add
Tested-by: Dave Wysochanski <dwysocha@redhat.com>

I rebased my latest NFS patches on top of your netfs-lib branch at the
below commit (the 16th patch here)
fce8d8a1ae46 fscache, cachefiles: Add alternate API to use kiocb for
read/write to cache

With netfs and fscache enabled mount, I ran the following tests, and
found the series to be very solid, with no obvious failures (hangs,
oopses, etc), and results matched tests run on vanilla 5.12-rc6:
* unit tests: NFSv3, 4.0, 4.1, 4.2; localhost server; with/without all
tracepoints enabled (fscache, cachefiles, netfs)
* NFS connectathon: NFSv3, 4.0, 4.1, 4.2; rhel7 server; with/without
all tracepoints enabled (fscache, cachefiles, netfs)
* xfstests generic: NFSv3, 4.0, 4.1, 4.2; rhel7, rhel8 server
Notes
1. I still have not resolved the pNFS issues so I did not run fscache
enabled pNFS tests.
2. Current NFS patches do not use ITER_XARRAY (patch 1/30) or
write_begin helper (patch 13/30)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

