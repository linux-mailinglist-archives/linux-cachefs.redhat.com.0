Return-Path: <linux-cachefs+bncBDLIXLMFVAERBCFQ36VAMGQE4JKW3FY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mail.lfdr.de (Postfix) with ESMTPS id A86D07EF951
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:15:53 +0100 (CET)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1ef4f8d26ecsf2131652fac.1
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:15:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255752; cv=pass;
        d=google.com; s=arc-20160816;
        b=bg+Vi/1siW4KYmZBMkAR+xaiUH9oE4ktulEVgKLkKsbpWFChgZdOBHWyGPD0r4UNZj
         491Mgs7dJOUqSGGTw0fJAx9AVgvvXboWe2OK6IMdWjupAiPpvP2iTTk1g4SXGN/Iffc+
         VeEm7NG0MSEuDqKKdOsUVk5qyRehT4Mrpo6nkBiXjSU7t8yuqft7LcTtr75lzN5qqK5k
         xhIxGcFKY8mqAHIttg8ehU3EYEeCKHSXRPu3rFjWYA38qxaow8UF0szIpA0FwOAW7b6E
         4ZWZcJ6fSJHsnMIAUvBKVlGmj20oTHr1G5S6HrfkKxQy1Tt9X+KsxStrAb1r55a+ISz1
         mAUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:message-id:date:subject:cc:to
         :from:delivered-to;
        bh=2SW25NNWstZ6Hy0WQJ0zQKftlRpvL12YstP9qSgNTBg=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=0YvtFtBFURI0sYEf9v1e9FhBg/pIxL3oyLYSx1t3IIpY/e8mb21UnpZ5KyCNiFCTIi
         ohDP1uQZFEL7qie533Met6jC3j5DpWsF23JGYhISoTDNFnJ6p+gqmgKKGvPKzMoY0iiR
         CzgAq3KTeeuwPsO1ORfEGBt501/t2gF9Cd4l+U4/s7vR8NvKgyCPFOXpnhBQ+3JASHi+
         QkN9ZUrCVHA8wwbplnSRAbRZ04cdvKh/vMMIOPsAtI7Dz/69uRroCEORob9PRu/nkyJo
         TmeoR7vxF3krHUVVhPvMtl1DmEp/ewAMRAhb6cdjQZezs1Ojn0kWSkKyb5elNf/nosQv
         iojg==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255752; x=1700860552;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SW25NNWstZ6Hy0WQJ0zQKftlRpvL12YstP9qSgNTBg=;
        b=hDEoNc2yNrcgHTX66gUGl48cEFOHXeOpmAIJ0eY52CpJv2fkYXOgoH4k7PCnWlkkOe
         1XB7NAHIxmMa5WKobNbRmaYV3cXu7BJuyV+TvYyyOx8+5B2+cmJHYWKX5SMCctDjk11G
         w/Hs9sx2DY6Lsv2PZ+HJ8+SbyZSadOspJCAW72u2WIs+2kSk4N76KCuC/RI8Apdm9AqV
         1KxOOFT98ic5ozKQQ9p8N5dx6iNFxtxQY4NShFVfU8ugiLjyERjlPkuz/nf+au3WqqvV
         ECRCcqP3lo4RL3nE3yJnhq1r1L2gE4RDlXLpn09Un33yRoDDLnaVQGqRmkGKk1B+CNb1
         1UTA==
X-Gm-Message-State: AOJu0YxkwVU2IZdsCTaS5tVYOjHbJTq5LSJk7NfqlovkTILRDZzoYrc+
	UwFyd3jK4o9A0a8Z8UNzu4pPIQ==
X-Google-Smtp-Source: AGHT+IHchzjSD7ElajFKmnHuMT3hjMNnqjMY7FcTeLcawSOozWZhSXsI9/Pjsd6xkptsg5ez3JBLhw==
X-Received: by 2002:a05:6870:a706:b0:1ef:d2b2:fe16 with SMTP id g6-20020a056870a70600b001efd2b2fe16mr488735oam.43.1700255752307;
        Fri, 17 Nov 2023 13:15:52 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:460d:b0:1e9:a843:fd57 with SMTP id
 z13-20020a056870460d00b001e9a843fd57ls1353282oao.2.-pod-prod-06-us; Fri, 17
 Nov 2023 13:15:51 -0800 (PST)
X-Received: by 2002:a05:6808:e86:b0:3a7:4e0c:faa2 with SMTP id k6-20020a0568080e8600b003a74e0cfaa2mr713077oil.27.1700255751513;
        Fri, 17 Nov 2023 13:15:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255751; cv=none;
        d=google.com; s=arc-20160816;
        b=nUFb0jIcYPSKOroVLyEYET3p0TbWIXFBp1LLxiweXOb6TYkQ4C6QtkENPgmeFAtSes
         XATz90CayjGFDYzCDt2JUVxGHIDNEMoY/RCKyoqptnqWhUWH/VyZFObI3yRWkM8ky3TT
         txMLNy7pzG0VRQI4eIjvTXn2/fvh53U9s+jtsJSo2oW9EIAiQwmuJ/vfvdg8+wIsI6Ry
         DtSPDSuOF2OmdV0xYLB24A73AWZxTrbZaxxbKdl4A1192heqNOY+HAkb+xsYoTeNVOys
         VJHQ71z10Mw+x9I8dNpaWM1Y5L4TWD/oRhvqF7ZSme/VNSCuhrz5K7kce2pPVxysMTNr
         sYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:delivered-to;
        bh=zmgz+RO4IBEi06nJNW7BTq3HzmL9Zd7Q0n4eYGePCXg=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=DFLFoVJB7/D+XtEGEP8vg8LYZDI4oVdyKxRNX3YhFOa8ZEZMWqEi8hGe/7kusp1dyM
         bvEL35Epb+Up+BybgSpyiL+aY88+uCz4jSc0LSJp2wj4hsSRyjHM2VIyS3b9pKhjLfRi
         rhRtO7KME3cYJT3R9wPsJUXvQRqFWsYnBKB3fJnV/GQKfNzwCCfiOQBq5FYJBfRXfZuA
         0/n7rqxwNVXu96Xhu2rpQcZBu/tQ5IRnWkLaQNfgnak6CjvwIrDkaQl1YYXR20f65mBE
         r8j8s7szm8ifZ4PAfw0aIgk46ShnSPcAKZyqDO/u+P/Y5GZ9YOmE9KgjC0MLuOSu5Hx3
         61tw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id pc18-20020a05620a841200b0077893a5a7fdsi2334884qkn.740.2023.11.17.13.15.51
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:15:51 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-58-3ikBbyczOq24wR-2suMZpw-1; Fri,
 17 Nov 2023 16:15:49 -0500
X-MC-Unique: 3ikBbyczOq24wR-2suMZpw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F2EC28040B4
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:15:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 6C60D1C060B5; Fri, 17 Nov 2023 21:15:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 916841C060AE;
	Fri, 17 Nov 2023 21:15:46 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/51] netfs, afs, cifs: Delegate high-level I/O to netfslib
Date: Fri, 17 Nov 2023 21:14:52 +0000
Message-ID: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Hi Jeff, Steve,

I have been working on my netfslib helpers to the point that I can run
xfstests on AFS to completion (both with write-back buffering and, with a
small patch, write-through buffering in the pagecache).  I can also run a
certain amount of xfstests on CIFS, though that requires some more
debugging.  However, this seems like a good time to post a preview of the
patches.

The patches remove a little over 800 lines from AFS and over 2000 from
CIFS, albeit with around 3000 lines added to netfs.  Hopefully, I will be
able to remove a bunch of lines from 9P and Ceph too.

The main aims of these patches are to get high-level I/O and knowledge of
the pagecache out of the filesystem drivers as much as possible and to get
rid, as much of possible, of the knowledge that pages/folios exist.

Further, I would like to see ->write_begin, ->write_end and ->launder_folio
go away.

Features that are added by these patches to that which is already there in
netfslib:

 (1) NFS-style (and Ceph-style) locking around DIO vs buffered I/O calls to
     prevent these from happening at the same time.  mmap'd I/O can, of
     necessity, happen at any time ignoring these locks.

 (2) Support for unbuffered I/O.  The data is kept in the bounce buffer and
     the pagecache is not used.  This can be turned on with an inode flag.

 (3) Support for direct I/O.  This is basically unbuffered I/O with some
     extra restrictions and no RMW.

 (4) Support for using a bounce buffer in an operation.  The bounce buffer
     may be bigger than the target data/buffer, allowing for crypto
     rounding.

 (5) Support for content encryption.  This isn't supported yet by AFS/CIFS
     but is aimed initially at Ceph.

 (6) ->write_begin() and ->write_end() are ignored in favour of merging all
     of that into one function, netfs_perform_write(), thereby avoiding the
     function pointer traversals.

 (7) Support for write-through caching in the pagecache.
     netfs_perform_write() adds the pages is modifies to an I/O operation
     as it goes and directly marks them writeback rather than dirty.  When
     writing back from write-through, it limits the range written back.
     This should allow CIFS to deal with byte-range mandatory locks
     correctly.

 (8) O_*SYNC and RWF_*SYNC writes use write-through rather than writing to
     the pagecache and then flushing afterwards.  An AIO O_*SYNC write will
     notify of completion when the sub-writes all complete.

 (9) Support for write-streaming where modifed data is held in !uptodate
     folios, with a private struct attached indicating the range that is
     valid.

(10) Support for write grouping, multiplexing a pointer to a group in the
     folio private data with the write-streaming data.  The writepages
     algorithm only writes stuff back that's in the nominated group.  This
     is intended for use by Ceph to write is snaps in order.

(11) Skipping reads for which we know the server could only supply zeros or
     EOF (for instance if we've done a local write that leaves a hole in
     the file and extends the local inode size).


General notes:

 (1) netfslib now makes use of folio->private, which means the filesystem
     can't use it.

 (2) Use of fscache is not yet tested.  I'm not sure whether to allow a
     cache to be used with a write-through write.

 (3) The filesystem provides wrappers to call the write helpers, allowing
     it to do pre-validation, oplock/capability fetching and the passing in
     of write group info.

 (4) I want to try flushing the data when tearing down an inode before
     invalidating it to try and render launder_folio unnecessary.

 (5) Write-through caching will generate and dispatch write subrequests as
     it gathers enough data to hit wsize and has whole pages that at least
     span that size.  This needs to be a bit more flexible, allowing for a
     filesystem such as CIFS to have a variable wsize.

 (6) The filesystem driver is just given read and write calls with an
     iov_iter describing the data/buffer to use.  Ideally, they don't see
     pages or folios at all.  A function, extract_iter_to_sg(), is already
     available to decant part of an iterator into a scatterlist for crypto
     purposes.


CIFS notes:

 (1) CIFS is made to use unbuffered I/O for unbuffered caching modes and
     write-through caching for cache=strict.

 (2) cifs_init_request() occasionally throws an error that it can't get a
     writable file when trying to do writeback.

 (3) Apparent file corruption frequently appears in the target file when
     cifs_copy_file_range(), even though it doesn't use any netfslib
     helpers and even if it doesn't overlap with any pages in the
     pagecache.

 (4) I should be able to turn multipage folio support on in CIFS now.

 (5) The then-unused CIFS code is removed in three patches, not one, to
     avoid the git patch generator from producing confusing patches in
     which it thinks code is being moved around rather than just being
     removed.


Changes
=======
ver #2)
 - Folded the addition of NETFS_RREQ_NONBLOCK/BLOCKED into first patch that
   uses them.
 - Folded addition of rsize member into first user.
 - Don't set rsize in ceph (yet) and set it in kafs to 256KiB.  cifs sets
   it dynamically.
 - Moved direct_bv next to direct_bv_count in struct netfs_io_request and
   labelled it with a __counted_by().
 - Passed flags into netfs_xa_store_and_mark() rather than two bools.
 - Removed netfs_set_up_buffer() as it wasn't used.

David

Link: https://lore.kernel.org/r/20231013160423.2218093-1-dhowells@redhat.com/ # v1

David Howells (51):
  netfs: Add a procfile to list in-progress requests
  netfs: Track the fpos above which the server has no data
  netfs: Allow the netfs to make the io (sub)request alloc larger
  netfs: Add a ->free_subrequest() op
  afs: Don't use folio->private to record partial modification
  netfs: Provide invalidate_folio and release_folio calls
  netfs: Implement unbuffered/DIO vs buffered I/O locking
  netfs: Add iov_iters to (sub)requests to describe various buffers
  netfs: Add support for DIO buffering
  netfs: Provide tools to create a buffer in an xarray
  netfs: Add bounce buffering support
  netfs: Add func to calculate pagecount/size-limited span of an
    iterator
  netfs: Limit subrequest by size or number of segments
  netfs: Export netfs_put_subrequest() and some tracepoints
  netfs: Extend the netfs_io_*request structs to handle writes
  netfs: Add a hook to allow tell the netfs to update its i_size
  netfs: Make netfs_put_request() handle a NULL pointer
  fscache: Add a function to begin an cache op from a netfslib request
  netfs: Make the refcounting of netfs_begin_read() easier to use
  netfs: Prep to use folio->private for write grouping and streaming
    write
  netfs: Dispatch write requests to process a writeback slice
  netfs: Provide func to copy data to pagecache for buffered write
  netfs: Make netfs_read_folio() handle streaming-write pages
  netfs: Allocate multipage folios in the writepath
  netfs: Implement support for unbuffered/DIO read
  netfs: Implement unbuffered/DIO write support
  netfs: Implement buffered write API
  netfs: Allow buffered shared-writeable mmap through
    netfs_page_mkwrite()
  netfs: Provide netfs_file_read_iter()
  netfs: Provide a writepages implementation
  netfs: Provide minimum blocksize parameter
  netfs: Make netfs_skip_folio_read() take account of blocksize
  netfs: Perform content encryption
  netfs: Decrypt encrypted content
  netfs: Support decryption on ubuffered/DIO read
  netfs: Support encryption on Unbuffered/DIO write
  netfs: Provide a launder_folio implementation
  netfs: Implement a write-through caching option
  netfs: Rearrange netfs_io_subrequest to put request pointer first
  afs: Use the netfs write helpers
  cifs: Replace cifs_readdata with a wrapper around netfs_io_subrequest
  cifs: Share server EOF pos with netfslib
  cifs: Replace cifs_writedata with a wrapper around netfs_io_subrequest
  cifs: Use more fields from netfs_io_subrequest
  cifs: Make wait_mtu_credits take size_t args
  cifs: Implement netfslib hooks
  cifs: Move cifs_loose_read_iter() and cifs_file_write_iter() to file.c
  cifs: Cut over to using netfslib
  cifs: Remove some code that's no longer used, part 1
  cifs: Remove some code that's no longer used, part 2
  cifs: Remove some code that's no longer used, part 3

 fs/9p/vfs_addr.c             |   51 +-
 fs/afs/file.c                |  206 +--
 fs/afs/inode.c               |   15 +-
 fs/afs/internal.h            |   66 +-
 fs/afs/write.c               |  814 +---------
 fs/ceph/addr.c               |   26 +-
 fs/ceph/cache.h              |   12 -
 fs/fscache/io.c              |   42 +
 fs/netfs/Makefile            |    9 +-
 fs/netfs/buffered_read.c     |  245 ++-
 fs/netfs/buffered_write.c    | 1222 ++++++++++++++
 fs/netfs/crypto.c            |  148 ++
 fs/netfs/direct_read.c       |  263 +++
 fs/netfs/direct_write.c      |  359 +++++
 fs/netfs/internal.h          |  118 ++
 fs/netfs/io.c                |  325 +++-
 fs/netfs/iterator.c          |   97 ++
 fs/netfs/locking.c           |  215 +++
 fs/netfs/main.c              |  101 ++
 fs/netfs/misc.c              |  178 +++
 fs/netfs/objects.c           |   64 +-
 fs/netfs/output.c            |  485 ++++++
 fs/netfs/stats.c             |   22 +-
 fs/smb/client/Kconfig        |    1 +
 fs/smb/client/cifsfs.c       |   65 +-
 fs/smb/client/cifsfs.h       |   10 +-
 fs/smb/client/cifsglob.h     |   59 +-
 fs/smb/client/cifsproto.h    |   10 +-
 fs/smb/client/cifssmb.c      |  111 +-
 fs/smb/client/file.c         | 2904 ++++++----------------------------
 fs/smb/client/fscache.c      |  109 --
 fs/smb/client/fscache.h      |   54 -
 fs/smb/client/inode.c        |   25 +-
 fs/smb/client/smb2ops.c      |   20 +-
 fs/smb/client/smb2pdu.c      |  168 +-
 fs/smb/client/smb2proto.h    |    5 +-
 fs/smb/client/trace.h        |  144 +-
 fs/smb/client/transport.c    |   17 +-
 include/linux/fscache.h      |    6 +
 include/linux/netfs.h        |  174 +-
 include/trace/events/afs.h   |   31 -
 include/trace/events/netfs.h |  158 +-
 mm/filemap.c                 |    1 +
 43 files changed, 5079 insertions(+), 4076 deletions(-)
 create mode 100644 fs/netfs/buffered_write.c
 create mode 100644 fs/netfs/crypto.c
 create mode 100644 fs/netfs/direct_read.c
 create mode 100644 fs/netfs/direct_write.c
 create mode 100644 fs/netfs/locking.c
 create mode 100644 fs/netfs/misc.c
 create mode 100644 fs/netfs/output.c

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

