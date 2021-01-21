Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D8C0A2FF121
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Jan 2021 17:56:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-0WV_E7tHOmC2y-BQfmpEoQ-1; Thu, 21 Jan 2021 11:56:10 -0500
X-MC-Unique: 0WV_E7tHOmC2y-BQfmpEoQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFE391005513;
	Thu, 21 Jan 2021 16:56:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A0C260BF3;
	Thu, 21 Jan 2021 16:56:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 634724BB40;
	Thu, 21 Jan 2021 16:56:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10LGrewF001643 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 21 Jan 2021 11:53:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6E863DAF0E; Thu, 21 Jan 2021 16:53:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 686AFDAF0D
	for <linux-cachefs@redhat.com>; Thu, 21 Jan 2021 16:53:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22BE9800883
	for <linux-cachefs@redhat.com>; Thu, 21 Jan 2021 16:53:36 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-155-rroNcq86PumkgoMuIWDiAA-1;
	Thu, 21 Jan 2021 11:53:32 -0500
X-MC-Unique: rroNcq86PumkgoMuIWDiAA-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 936E66EA0; Thu, 21 Jan 2021 11:46:45 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 936E66EA0
Date: Thu, 21 Jan 2021 11:46:45 -0500
To: David Howells <dhowells@redhat.com>
Message-ID: <20210121164645.GA20964@fieldses.org>
References: <161118128472.1232039.11746799833066425131.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <161118128472.1232039.11746799833066425131.stgit@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
From: bfields@fieldses.org (J. Bruce Fields)
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [RFC][PATCH 00/25] Network fs helper library &
	fscache kiocb API
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

On Wed, Jan 20, 2021 at 10:21:24PM +0000, David Howells wrote:
>      Note that this uses SEEK_HOLE/SEEK_DATA to locate the data available
>      to be read from the cache.  Whilst this is an improvement from the
>      bmap interface, it still has a problem with regard to a modern
>      extent-based filesystem inserting or removing bridging blocks of
>      zeros.

What are the consequences from the point of view of a user?

--b.

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
> The patchset contains four parts:
> 
>  (1) Some helper patches, including provision of an ITER_XARRAY iov
>      iterator and a function to do readahead expansion.
> 
>  (2) Patches to add the netfs helper library.
> 
>  (3) A patch to add the fscache/cachefiles kiocb API
> 
>  (4) Patches to add support in AFS for this.
> 
> With this, AFS without a cache passes all expected xfstests; with a cache,
> there's an extra failure, but that's also there before these patches.
> Fixing that probably requires a greater overhaul.
> 
> These patches can be found also on:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-netfs-lib
> 
> David
> ---
> David Howells (24):
>       iov_iter: Add ITER_XARRAY
>       vm: Add wait/unlock functions for PG_fscache
>       mm: Implement readahead_control pageset expansion
>       vfs: Export rw_verify_area() for use by cachefiles
>       netfs: Make a netfs helper module
>       netfs: Provide readahead and readpage netfs helpers
>       netfs: Add tracepoints
>       netfs: Gather stats
>       netfs: Add write_begin helper
>       netfs: Define an interface to talk to a cache
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
>       afs: Use new fscache read helper API
> 
> Takashi Iwai (1):
>       cachefiles: Drop superfluous readpages aops NULL check
> 
> 
>  fs/Kconfig                    |    1 +
>  fs/Makefile                   |    1 +
>  fs/afs/Kconfig                |    1 +
>  fs/afs/dir.c                  |  225 ++++---
>  fs/afs/file.c                 |  472 ++++----------
>  fs/afs/fs_operation.c         |    4 +-
>  fs/afs/fsclient.c             |  108 ++--
>  fs/afs/inode.c                |    7 +-
>  fs/afs/internal.h             |   57 +-
>  fs/afs/rxrpc.c                |  150 ++---
>  fs/afs/write.c                |  610 ++++++++++--------
>  fs/afs/yfsclient.c            |   82 +--
>  fs/cachefiles/Makefile        |    1 +
>  fs/cachefiles/interface.c     |    5 +-
>  fs/cachefiles/internal.h      |    9 +
>  fs/cachefiles/rdwr.c          |    2 -
>  fs/cachefiles/rdwr2.c         |  406 ++++++++++++
>  fs/fscache/Makefile           |    3 +-
>  fs/fscache/internal.h         |    3 +
>  fs/fscache/page.c             |    2 +-
>  fs/fscache/page2.c            |  116 ++++
>  fs/fscache/stats.c            |    1 +
>  fs/internal.h                 |    5 -
>  fs/netfs/Kconfig              |   23 +
>  fs/netfs/Makefile             |    5 +
>  fs/netfs/internal.h           |   97 +++
>  fs/netfs/read_helper.c        | 1142 +++++++++++++++++++++++++++++++++
>  fs/netfs/stats.c              |   57 ++
>  fs/read_write.c               |    1 +
>  include/linux/fs.h            |    1 +
>  include/linux/fscache-cache.h |    4 +
>  include/linux/fscache.h       |   28 +-
>  include/linux/netfs.h         |  167 +++++
>  include/linux/pagemap.h       |   16 +
>  include/net/af_rxrpc.h        |    2 +-
>  include/trace/events/afs.h    |   74 +--
>  include/trace/events/netfs.h  |  201 ++++++
>  mm/filemap.c                  |   18 +
>  mm/readahead.c                |   70 ++
>  net/rxrpc/recvmsg.c           |    9 +-
>  40 files changed, 3171 insertions(+), 1015 deletions(-)
>  create mode 100644 fs/cachefiles/rdwr2.c
>  create mode 100644 fs/fscache/page2.c
>  create mode 100644 fs/netfs/Kconfig
>  create mode 100644 fs/netfs/Makefile
>  create mode 100644 fs/netfs/internal.h
>  create mode 100644 fs/netfs/read_helper.c
>  create mode 100644 fs/netfs/stats.c
>  create mode 100644 include/linux/netfs.h
>  create mode 100644 include/trace/events/netfs.h
> 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

