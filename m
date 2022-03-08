Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C504D24C7
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 00:25:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646781904;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8aYcWBbDst0eqT+ZaUhMc3SuOxe6SY54rPejjxI8DGc=;
	b=fNVadAvj/jATgK2Gpc8ikNEfbVpdlroh1hPsbltCsq5x5SIFjYw6rVoo53DXyAjhVWBOC/
	9ou6UF6E7bOv74Mw9f+MF4w6AGsCKk0D6U09GRkW/Y+C2kb6oDMmjbV0XU24eddpEu6h6S
	tmVIxvoY9TMX5LJCVu2GU/s8QITNWlo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-EiLlPiqROgOc-8IqoMTGLA-1; Tue, 08 Mar 2022 18:25:03 -0500
X-MC-Unique: EiLlPiqROgOc-8IqoMTGLA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9643F85A5A8;
	Tue,  8 Mar 2022 23:25:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1EB8C53CD;
	Tue,  8 Mar 2022 23:25:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9DE181932130;
	Tue,  8 Mar 2022 23:24:59 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DDEA0194F4AE for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  8 Mar 2022 23:24:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 385DC78C12; Tue,  8 Mar 2022 23:24:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E08C678C0F;
 Tue,  8 Mar 2022 23:24:17 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Tue, 08 Mar 2022 23:24:17 +0000
Message-ID: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Subject: [Linux-cachefs] [PATCH v2 00/19] netfs: Prep for write helpers
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Having had a go at implementing write helpers and content encryption
support in netfslib, it seems that the netfs_read_{,sub}request structs and
the equivalent write request structs were almost the same and so should be
merged, thereby requiring only one set of alloc/get/put functions and a
common set of tracepoints.

Merging the structs also has the advantage that if a bounce buffer is added
to the request struct, a read operation can be performed to fill the bounce
buffer, the contents of the buffer can be modified and then a write
operation can be performed on it to send the data wherever it needs to go
using the same request structure all the way through.  The I/O handlers
would then transparently perform any required crypto.  This should make it
easy to perform RMW cycles if needed.

The potentially common functions and structs, however, by their names all
proclaim themselves to be associated with the read side of things.  The
bulk of these changes alter this in the following ways:

 (1) Rename struct netfs_read_{,sub}request to netfs_io_{,sub}request.

 (2) Rename some enums, members and flags to make them more appropriate.

 (3) Adjust some comments to match.

 (4) Drop "read"/"rreq" from the names of common functions.  For instance,
     netfs_get_read_request() becomes netfs_get_request().

 (5) The ->init_rreq() and ->issue_op() methods become ->init_request() and
     ->issue_read().  I've kept the latter as a read-specific function and
     in another branch added an ->issue_write() method.

The driver source is then reorganised into a number of files:

	fs/netfs/buffered_read.c	Create read reqs to the pagecache
	fs/netfs/io.c			Dispatchers for read and write reqs
	fs/netfs/main.c			Some general miscellaneous bits
	fs/netfs/objects.c		Alloc, get and put functions
	fs/netfs/stats.c		Optional procfs statistics.

and future development can be fitted into this scheme, e.g.:

	fs/netfs/buffered_write.c	Modify the pagecache
	fs/netfs/buffered_flush.c	Writeback from the pagecache
	fs/netfs/direct_read.c		DIO read support
	fs/netfs/direct_write.c		DIO write support
	fs/netfs/unbuffered_write.c	Write modifications directly back

Beyond the above changes, there are also some changes that affect how
things work:

 (1) Make fscache_end_operation() generally available.

 (2) In the netfs tracing header, generate enums from the symbol -> string
     mapping tables rather than manually coding them.

 (3) Add a struct for filesystems that uses netfslib to put into their
     inode wrapper structs to hold extra state that netfslib is interested
     in, such as the fscache cookie.  This allows netfslib functions to be
     set in filesystem operation tables and jumped to directly without
     having to have a filesystem wrapper.

 (4) Add a member to the struct added in (3) to track the remote inode
     length as that may differ if local modifications are buffered.  We may
     need to supply an appropriate EOF pointer when storing data (in AFS
     for example).

 (5) Pass extra information to netfs_alloc_request() so that the
     ->init_request() hook can access it and retain information to indicate
     the origin of the operation.

 (6) Make the ->init_request() hook return an error, thereby allowing a
     filesystem that isn't allowed to cache an inode (ceph or cifs, for
     example) to skip readahead.

 (7) Switch to using refcount_t for subrequests and add tracepoints to log
     refcount changes for the request and subrequest structs.

 (8) Add a function to consolidate dispatching a read request.  Similar
     code is used in three places and another couple are likely to be added
     in the future.


The patches can be found on this branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-next

This is based on top of ceph's master branch as some of the patches
conflict.

David
---

Changes
=======
ver #2)
 - Change kdoc references to renamed files[1].
 - Switched the begin-read-function patch and the prepare-to-split patch as
   fewer functions then need unstatic'ing.
 - Fixed an uninitialised var in netfs_begin_read()[2][3].
 - Fixed a refleak caused by an unremoved line when netfs_begin_read() was
   introduced.
 - Use "#if IS_ENABLED()" in netfs_i_cookie(), not "#ifdef".
 - Implemented missing bit of ceph readahead through netfs_readahead().
 - Rearranged the patch order to make the ceph readahead possible.

Link: https://lore.kernel.org/r/20220303202811.6a1d53a1@canb.auug.org.au/ [1]
Link: https://lore.kernel.org/r/20220303163826.1120936-1-nathan@kernel.org/ [2]
Link: https://lore.kernel.org/r/20220303235647.1297171-1-colin.i.king@gmail.com/ [3]
Link: https://lore.kernel.org/r/164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk/ # v1

---
David Howells (17):
      netfs: Generate enums from trace symbol mapping lists
      netfs: Rename netfs_read_*request to netfs_io_*request
      netfs: Finish off rename of netfs_read_request to netfs_io_request
      netfs: Split netfs_io_* object handling out
      netfs: Adjust the netfs_rreq tracepoint slightly
      netfs: Trace refcounting on the netfs_io_request struct
      netfs: Trace refcounting on the netfs_io_subrequest struct
      netfs: Adjust the netfs_failure tracepoint to indicate non-subreq lines
      netfs: Change ->init_request() to return an error code
      netfs: Add a netfs inode context
      netfs: Add a function to consolidate beginning a read
      netfs: Prepare to split read_helper.c
      netfs: Rename read_helper.c to io.c
      netfs: Split fs/netfs/read_helper.c
      netfs: Split some core bits out into their own file
      netfs: Keep track of the actual remote file size
      afs: Maintain netfs_i_context::remote_i_size

Jeff Layton (1):
      netfs: Refactor arguments for netfs_alloc_read_request

Jeffle Xu (1):
      fscache: export fscache_end_operation()


 Documentation/filesystems/netfs_library.rst |  139 ++-
 fs/9p/cache.c                               |   10 +-
 fs/9p/v9fs.c                                |    4 +-
 fs/9p/v9fs.h                                |   12 +-
 fs/9p/vfs_addr.c                            |   62 +-
 fs/9p/vfs_inode.c                           |   13 +-
 fs/afs/dynroot.c                            |    1 +
 fs/afs/file.c                               |   41 +-
 fs/afs/inode.c                              |   32 +-
 fs/afs/internal.h                           |   23 +-
 fs/afs/super.c                              |    4 +-
 fs/afs/write.c                              |   10 +-
 fs/cachefiles/io.c                          |   10 +-
 fs/ceph/addr.c                              |  113 +-
 fs/ceph/cache.c                             |   28 +-
 fs/ceph/cache.h                             |   15 +-
 fs/ceph/inode.c                             |    6 +-
 fs/ceph/super.h                             |   16 +-
 fs/cifs/cifsglob.h                          |   10 +-
 fs/cifs/fscache.c                           |   19 +-
 fs/cifs/fscache.h                           |    2 +-
 fs/fscache/internal.h                       |   11 -
 fs/netfs/Makefile                           |    8 +-
 fs/netfs/buffered_read.c                    |  428 +++++++
 fs/netfs/internal.h                         |   49 +-
 fs/netfs/io.c                               |  657 ++++++++++
 fs/netfs/main.c                             |   20 +
 fs/netfs/objects.c                          |  161 +++
 fs/netfs/read_helper.c                      | 1205 -------------------
 fs/netfs/stats.c                            |    1 -
 fs/nfs/fscache.c                            |    8 -
 include/linux/fscache.h                     |   14 +
 include/linux/netfs.h                       |  162 ++-
 include/trace/events/cachefiles.h           |    6 +-
 include/trace/events/netfs.h                |  188 ++-
 35 files changed, 1860 insertions(+), 1628 deletions(-)
 create mode 100644 fs/netfs/buffered_read.c
 create mode 100644 fs/netfs/io.c
 create mode 100644 fs/netfs/main.c
 create mode 100644 fs/netfs/objects.c
 delete mode 100644 fs/netfs/read_helper.c


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

