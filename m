Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 94F3A302E1B
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Jan 2021 22:41:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611610885;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rNUjHVsXCC/hMjcYonsa/bgVMC5CQD04Y4xZsGJbU8Y=;
	b=aevBXBqenv6vdUeLegoqD/H7mAsUpRTmZSMwnXKNnOX3hzHig6EHaPUiSwjyHU9BkKR1ce
	loKqC1muV5cGWVYoUXtxRfbPOL0FpDxWchYFt2gf2N6q6tUE61TlL6qcH7Wau7OyDSbrPT
	pTKEuGAc0oyqrhVLijOMyzdErIl5yRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-zYgOMvvyPIq-Uh4A7A69xw-1; Mon, 25 Jan 2021 16:41:24 -0500
X-MC-Unique: zYgOMvvyPIq-Uh4A7A69xw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55513107ACE6;
	Mon, 25 Jan 2021 21:41:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45B8A5D9DB;
	Mon, 25 Jan 2021 21:41:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F810180954D;
	Mon, 25 Jan 2021 21:41:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10PLUvhY027531 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 16:30:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DFD2110016FF; Mon, 25 Jan 2021 21:30:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D1FE10013C1;
	Mon, 25 Jan 2021 21:30:51 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Mon, 25 Jan 2021 21:30:50 +0000
Message-ID: <161161025063.2537118.2009249444682241405.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 25 Jan 2021 16:41:19 -0500
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 00/32] Network fs helper library & fscache
	kiocb API [ver #2]
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Here's a set of patches to do two things:

 (1) Add a helper library to handle the new VM readahead interface.  This
     is intended to be used unconditionally by the filesystem (whether or
     not caching is enabled) and provides a common framework for doing
     caching, transparent huge pages and, in the future, possibly fscrypt
     and read bandwidth maximisation.  It also allows the netfs and the
     cache to align, expand and slice up a read request from the VM in
     various ways; the netfs need only provide a function to read a stretch
     of data to the pagecache and the helper takes care of the rest.

 (2) Add an alternative fscache/cachfiles I/O API that uses the kiocb
     facility to do async DIO to transfer data to/from the netfs's pages,
     rather than using readpage with wait queue snooping on one side and
     vfs_write() on the other.  It also uses less memory, since it doesn't
     do buffered I/O on the backing file.

     Note that this uses SEEK_HOLE/SEEK_DATA to locate the data available
     to be read from the cache.  Whilst this is an improvement from the
     bmap interface, it still has a problem with regard to a modern
     extent-based filesystem inserting or removing bridging blocks of
     zeros.  Fixing that requires a much greater overhaul.

This is a step towards overhauling the fscache API.  The change is opt-in
on the part of the network filesystem.  A netfs should not try to mix the
old and the new API because of conflicting ways of handling pages and the
PG_fscache page flag and because it would be mixing DIO with buffered I/O.
Further, the helper library can't be used with the old API.

This does not change any of the fscache cookie handling APIs or the way
invalidation is done.

In the near term, I intend to deprecate and remove the old I/O API
(fscache_allocate_page{,s}(), fscache_read_or_alloc_page{,s}(),
fscache_write_page() and fscache_uncache_page()) and eventually replace
most of fscache/cachefiles with something simpler and easier to follow.

The patchset contains five parts:

 (1) Some helper patches, including provision of an ITER_XARRAY iov
     iterator and a function to do readahead expansion.

 (2) Patches to add the netfs helper library.

 (3) A patch to add the fscache/cachefiles kiocb API

 (4) Patches to add support in AFS for this.

 (5) Patches from David Wysochanski to add support in NFS for this.

Jeff Layton also has patches for Ceph for this, though they're not included
on this branch.

With this, AFS without a cache passes all expected xfstests; with a cache,
there's an extra failure, but that's also there before these patches.
Fixing that probably requires a greater overhaul.  Ceph and NFS also pass
the expected tests.

These patches can be found also on:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-netfs-lib


Changes
=======

 (v2) Fix some bugs and add NFS support.

David
---
Dave Wysochanski (8):
      NFS: Clean up nfs_readpage() and nfs_readpages()
      NFS: In nfs_readpage() only increment NFSIOS_READPAGES when read succeeds
      NFS: Refactor nfs_readpage() and nfs_readpage_async() to use nfs_readdesc
      NFS: Call readpage_async_filler() from nfs_readpage_async()
      NFS: Add nfs_pageio_complete_read() and remove nfs_readpage_async()
      NFS: Allow internal use of read structs and functions
      NFS: Convert to the netfs API and nfs_readpage to use netfs_readpage
      NFS: Convert readpage to readahead and use netfs_readahead for fscache

David Howells (24):
      iov_iter: Add ITER_XARRAY
      vm: Add wait/unlock functions for PG_fscache
      mm: Implement readahead_control pageset expansion
      vfs: Export rw_verify_area() for use by cachefiles
      netfs: Make a netfs helper module
      netfs: Provide readahead and readpage netfs helpers
      netfs: Add tracepoints
      netfs: Gather stats
      netfs: Add write_begin helper
      netfs: Define an interface to talk to a cache
      fscache, cachefiles: Add alternate API to use kiocb for read/write to cache
      afs: Disable use of the fscache I/O routines
      afs: Pass page into dirty region helpers to provide THP size
      afs: Print the operation debug_id when logging an unexpected data version
      afs: Move key to afs_read struct
      afs: Don't truncate iter during data fetch
      afs: Log remote unmarshalling errors
      afs: Set up the iov_iter before calling afs_extract_data()
      afs: Use ITER_XARRAY for writing
      afs: Wait on PG_fscache before modifying/releasing a page
      afs: Extract writeback extension into its own function
      afs: Prepare for use of THPs
      afs: Use the fs operation ops to handle FetchData completion
      afs: Use new fscache read helper API


 fs/Kconfig                    |    1 +
 fs/Makefile                   |    1 +
 fs/afs/Kconfig                |    1 +
 fs/afs/dir.c                  |  225 ++++---
 fs/afs/file.c                 |  472 ++++----------
 fs/afs/fs_operation.c         |    4 +-
 fs/afs/fsclient.c             |  108 +--
 fs/afs/inode.c                |    7 +-
 fs/afs/internal.h             |   57 +-
 fs/afs/rxrpc.c                |  150 ++---
 fs/afs/write.c                |  610 +++++++++--------
 fs/afs/yfsclient.c            |   82 +--
 fs/cachefiles/Makefile        |    1 +
 fs/cachefiles/interface.c     |    5 +-
 fs/cachefiles/internal.h      |    9 +
 fs/cachefiles/rdwr2.c         |  412 ++++++++++++
 fs/fscache/Kconfig            |    1 +
 fs/fscache/Makefile           |    3 +-
 fs/fscache/internal.h         |    3 +
 fs/fscache/page.c             |    2 +-
 fs/fscache/page2.c            |  116 ++++
 fs/fscache/stats.c            |    1 +
 fs/internal.h                 |    5 -
 fs/netfs/Kconfig              |   23 +
 fs/netfs/Makefile             |    5 +
 fs/netfs/internal.h           |   97 +++
 fs/netfs/read_helper.c        | 1155 +++++++++++++++++++++++++++++++++
 fs/netfs/stats.c              |   59 ++
 fs/nfs/file.c                 |    2 +-
 fs/nfs/fscache.c              |  206 +++---
 fs/nfs/fscache.h              |   66 +-
 fs/nfs/internal.h             |    8 +
 fs/nfs/pagelist.c             |    2 +
 fs/nfs/read.c                 |  244 ++++---
 fs/read_write.c               |    1 +
 include/linux/fs.h            |    1 +
 include/linux/fscache-cache.h |    4 +
 include/linux/fscache.h       |   28 +-
 include/linux/netfs.h         |  167 +++++
 include/linux/nfs_fs.h        |    5 +-
 include/linux/nfs_iostat.h    |    2 +-
 include/linux/nfs_page.h      |    1 +
 include/linux/nfs_xdr.h       |    1 +
 include/linux/pagemap.h       |   16 +
 include/net/af_rxrpc.h        |    2 +-
 include/trace/events/afs.h    |   74 +--
 include/trace/events/netfs.h  |  201 ++++++
 mm/filemap.c                  |   18 +
 mm/readahead.c                |   70 ++
 net/rxrpc/recvmsg.c           |    9 +-
 50 files changed, 3457 insertions(+), 1286 deletions(-)
 create mode 100644 fs/cachefiles/rdwr2.c
 create mode 100644 fs/fscache/page2.c
 create mode 100644 fs/netfs/Kconfig
 create mode 100644 fs/netfs/Makefile
 create mode 100644 fs/netfs/internal.h
 create mode 100644 fs/netfs/read_helper.c
 create mode 100644 fs/netfs/stats.c
 create mode 100644 include/linux/netfs.h
 create mode 100644 include/trace/events/netfs.h


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

