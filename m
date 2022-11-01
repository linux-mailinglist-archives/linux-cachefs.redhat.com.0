Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C2042614F3D
	for <lists+linux-cachefs@lfdr.de>; Tue,  1 Nov 2022 17:30:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667320250;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uGnRlbmZn22fuK+3M7RsT6MnXEkklhcOyGLxCnEu9HQ=;
	b=EIqiiLXA3nlsXrYyV/mj6Ldue4i7lMUfalPRng00EdBky+CuCxFjiNF1Y5k0aJ2Q9yvD7g
	w+DqgrquFu+Taau4/QiOYZS98pF4modgRV2BpQhd1J9QaY1Twvhhujplu6bm4VHamrKQU8
	/CDYvbSm7BsoNN25IGzzyTGmGulfUQA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-WOnwmCqcOM-Zm_k1rm9W9Q-1; Tue, 01 Nov 2022 12:30:47 -0400
X-MC-Unique: WOnwmCqcOM-Zm_k1rm9W9Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B77F800159;
	Tue,  1 Nov 2022 16:30:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A21A492B18;
	Tue,  1 Nov 2022 16:30:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 140531946A45;
	Tue,  1 Nov 2022 16:30:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2AA931946594 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  1 Nov 2022 16:30:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EAC014EA5D; Tue,  1 Nov 2022 16:30:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD9AC4EA49;
 Tue,  1 Nov 2022 16:30:42 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Steve French <smfrench@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>
Date: Tue, 01 Nov 2022 16:30:41 +0000
Message-ID: <166732024173.3186319.18204305072070871546.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.5
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Linux-cachefs] [RFC PATCH 00/12] smb3: Add iter helpers and use
 iov_iters down to the network transport
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
 linux-cachefs@redhat.com, Tom Talpey <tom@talpey.com>,
 linux-crypto@vger.kernel.org, linux-mm@vger.kernel.org,
 Rohith Surabattula <rohiths.msft@gmail.com>, Christoph Hellwig <hch@lst.de>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi Steve, Al, Christoph,

Here's an updated version of a subset of my branch to make the cifs/smb3
driver pass iov_iters down to the lowest layers where they can be passed to
the network transport.

The first couple of patches provide iov_iter general stuff:

 (1) Move the FOLL_* flags to linux/mm_types.h so that linux/uio.h can make
     use of them.

 (2) Add a function to extract/get/pin pages from an iterator as a future
     replacement for iov_iter_get_pages*().  It also adds a function by
     which the caller can determine which of "extract/get/pin" the
     extraction function will actually do to aid in cleaning up.

Then there are a couple of patches that add stuff to netfslib that I want
to use there as well as in cifs:

 (3) Add a netfslib function to use (2) to extract pages from an ITER_IOBUF
     or ITER_UBUF iterator into an ITER_BVEC iterator.

 (4) Add a netfslib function to use (2) to extract pages from an iterator
     that's of type ITER_UBUF/IOVEC/BVEC/KVEC/XARRAY and add them to a
     scatterlist.  The function in (2) is used for a UBUF and IOVEC
     iterators, so those need cleaning up afterwards; BVEC and XARRAY
     iterators can be rendered into elements that span multiple pages.

Then there are some cifs helpers that work with iterators:

 (5) Implement cifs_splice_read() to use an ITER_BVEC rather than an
     ITER_PIPE, bulk-allocating the pages, attaching them to the bvec,
     doing the I/O and then pushing the pages into the pipe.  This avoids
     the problem with cifs wanting to split the pipe iterator in a later
     patch.

 (6) Add a function to walk through an ITER_BVEC/KVEC/XARRAY iterator and
     add elements to an RDMA SGE list.  Only the DMA addresses are stored,
     and an element may span multiple pages (say if an xarray contains a
     multipage folio).

 (7) Add a function to walk through an ITER_BVEC/KVEC/XARRAY iterator and
     pass the contents into a shash function.

 (8) Add functions to walk through an ITER_XARRAY iterator and perform
     various sorts of cleanup on the folios held therein, to be used on I/o
     completion.

 (9) Add a function to read from the transport TCP socket directly into an
     iterator.

Then come the patches that actually do the work of iteratorising cifs:

(10) The main patch.  Replace page lists with iterators.  It extracts the
     pages from ITER_UBUF and ITER_IOVEC iterators to an ITER_BVEC
     iterator, pinning or getting refs on them, before passing them down as
     the I/O may be done from a worker thread.

     The iterator is extracted into a scatterlist in order to talk to the
     crypto interface or to do RDMA.

(11) In the cifs RDMA code, extract the iterator into an RDMA SGE[] list,
     removing the scatterlist intermediate - at least for smbd_send().
     There appear to be other ways for cifs to talk to the RDMA layer that
     don't go through that that I haven't managed to work out.

(12) Remove a chunk of now-unused code.

Note also that I haven't managed to test all the combinations of transport.
Samba doesn't support RDMA and ksmbd doesn't support encryption.  I can
test them separately, but not together.  That said, rdma, sign, seal and
sign+seal seem to work.

I've pushed the patches here also:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=cifs-for-viro

Note that this is based on a merge of Al's work.iov_iter branch with
v6.1-rc2.

David

Link: https://lore.kernel.org/r/166697254399.61150.1256557652599252121.stgit@warthog.procyon.org.uk/
---
David Howells (12):
      mm: Move FOLL_* defs to mm_types.h
      iov_iter: Add a function to extract a page list from an iterator
      netfs: Add a function to extract a UBUF or IOVEC into a BVEC iterator
      netfs: Add a function to extract an iterator into a scatterlist
      cifs: Implement splice_read to pass down ITER_BVEC not ITER_PIPE
      cifs: Add a function to build an RDMA SGE list from an iterator
      cifs: Add a function to Hash the contents of an iterator
      cifs: Add some helper functions
      cifs: Add a function to read into an iter from a socket
      cifs: Change the I/O paths to use an iterator rather than a page list
      cifs: Build the RDMA SGE list directly from an iterator
      cifs: Remove unused code


 fs/cifs/Kconfig          |    1 +
 fs/cifs/cifsencrypt.c    |  172 +++-
 fs/cifs/cifsfs.c         |   12 +-
 fs/cifs/cifsfs.h         |    6 +
 fs/cifs/cifsglob.h       |   31 +-
 fs/cifs/cifsproto.h      |   11 +-
 fs/cifs/cifssmb.c        |   13 +-
 fs/cifs/connect.c        |   16 +
 fs/cifs/file.c           | 1793 ++++++++++++++++++--------------------
 fs/cifs/fscache.c        |   22 +-
 fs/cifs/fscache.h        |   10 +-
 fs/cifs/misc.c           |  127 +--
 fs/cifs/smb2ops.c        |  378 ++++----
 fs/cifs/smb2pdu.c        |   45 +-
 fs/cifs/smbdirect.c      |  503 +++++++----
 fs/cifs/smbdirect.h      |    4 +-
 fs/cifs/transport.c      |   57 +-
 fs/netfs/Makefile        |    1 +
 fs/netfs/iterator.c      |  346 ++++++++
 include/linux/mm.h       |   74 --
 include/linux/mm_types.h |   73 ++
 include/linux/netfs.h    |    5 +
 include/linux/uio.h      |   29 +
 lib/iov_iter.c           |  333 +++++++
 24 files changed, 2390 insertions(+), 1672 deletions(-)
 create mode 100644 fs/netfs/iterator.c


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

