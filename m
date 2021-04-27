Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6A12C36BCA2
	for <lists+linux-cachefs@lfdr.de>; Tue, 27 Apr 2021 02:26:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619483212;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JmUFR2OoTXBcvXxbTXt8SSWtpNty0gzLczjQOmyMhq8=;
	b=EoB61ARsH3FJe2nZSt6a5U13nKFR4RNkdjmF5YEIbFIP7FKVy5EmyiMWEgkF+DBSow7ZdU
	4Lrk0BnJP2Ps/nj0nDVhw/qHdOLQL/YTORfHp/wyBnybNB/3BhlthDOSnKRJsLQKsXWwRb
	g2lG2HncMtJOjD5ff7eexbqjncfcruA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-3BZEJKtRPZihbQu2QcshbA-1; Mon, 26 Apr 2021 20:26:50 -0400
X-MC-Unique: 3BZEJKtRPZihbQu2QcshbA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1533C18B9E81;
	Tue, 27 Apr 2021 00:26:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E65802B0D1;
	Tue, 27 Apr 2021 00:26:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A6FD4ED86;
	Tue, 27 Apr 2021 00:26:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13R0E1KC012594 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 26 Apr 2021 20:14:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E5C97610AE; Tue, 27 Apr 2021 00:14:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-20.rdu2.redhat.com
	[10.10.112.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD9C260C4A;
	Tue, 27 Apr 2021 00:13:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <3779937.1619478404@warthog.procyon.org.uk>
References: <3779937.1619478404@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Tue, 27 Apr 2021 01:13:49 +0100
Message-ID: <3785063.1619482429@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13R0E1KC012594
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 26 Apr 2021 20:26:43 -0400
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	linux-cifs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-mm@kvack.org,
	Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Mike Marshall <hubcap@omnibond.com>
Subject: [Linux-cachefs] [GIT PULL] afs: Preparation for fscache overhaul
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3785062.1619482429.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Here's a set of patches for the AFS filesystem for 5.13 to begin the
process of overhauling the use of the fscache API by AFS and the
introduction of support for features such as Transparent Huge Pages (THPs).

 (1) Add some support for THPs, including using core VM helper functions to
     find details of pages.

 (2) Use the ITER_XARRAY I/O iterator to mediate access to the pagecache as
     this handles THPs and doesn't require allocation of large bvec arrays.

 (3) Delegate address_space read/pre-write I/O methods for AFS to the netfs
     helper library.  A method is provided to the library that allows it to
     issue a read against the server.

     This includes a change in use for PG_fscache (it now indicates a DIO
     write in progress from the marked page), so a number of waits need to
     be deployed for it.

 (4) Split the core AFS writeback function to make it easier to modify in
     future patches to handle writing to the cache.  [This might feasibly
     make more sense moved out into my fscache-iter branch].

I've tested these with "xfstests -g quick" against an AFS volume (xfstests
needs patching to make it work).  With this, AFS without a cache passes all
expected xfstests; with a cache, there's an extra failure, but that's also
there before these patches.  Fixing that probably requires a greater
overhaul (as can be found on my fscache-iter branch, but that's for a later
time).

Thanks should go to Marc Dionne and Jeff Altman of AuriStor for exercising
the patches in their test farm also.


Changes
=======

These patches are dependent on the netfs-lib branch and have been posted in
association with them.  The changes relevant to these patches are:

ver #6:
      Split the afs patches out into their own branch.

ver #5:
      Fixed some review comments from Matthew Wilcox:

      - Better names for wrangling functions for PG_private_2 and
        PG_fscache wrangling functions[3].  Came up with
        {set,end,wait_for}_page_private_2() and aliased these for fscache.

      Moved the taking of/dropping a page ref for the PG_private_2 flag
      into the set and end functions.

ver #4:
      Rebased to v5.12-rc2 and added a bunch of references into individual
      commits.

ver #3:
      Adjusted the functions that unlock and wait for PG_fscache according
      to Linus's suggestion[1].

      Hold a ref on a page when PG_fscache is set as per Linus's
      suggestion[2].

Link: https://lore.kernel.org/r/CAHk-=wh+2gbF7XEjYc=HV9w_2uVzVf7vs60BPz0gFA=+pUm3ww@mail.gmail.com/ [1]
Link: https://lore.kernel.org/r/CAHk-=wjgA-74ddehziVk=XAEMTKswPu1Yw4uaro1R3ibs27ztw@mail.gmail.com/ [2]
Link: https://lore.kernel.org/r/20210321105309.GG3420@casper.infradead.org/ [3]

References
==========

These patches have been published for review before, firstly as part of a
larger set:

Link: https://lore.kernel.org/r/158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk/

Link: https://lore.kernel.org/r/159465766378.1376105.11619976251039287525.stgit@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/159465821598.1377938.2046362270225008168.stgit@warthog.procyon.org.uk/

Link: https://lore.kernel.org/r/160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk/

Then as a cut-down set:

Link: https://lore.kernel.org/r/161118128472.1232039.11746799833066425131.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/161161025063.2537118.2009249444682241405.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk/ # v3
Link: https://lore.kernel.org/r/161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk/ # v4
Link: https://lore.kernel.org/r/161653784755.2770958.11820491619308713741.stgit@warthog.procyon.org.uk/ # v5
Link: https://lore.kernel.org/r/161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk/ # v6
Link: https://lore.kernel.org/r/161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk # v7

David
---
The following changes since commit 26aaeffcafe6cbb7c3978fa6ed7555122f8c9f8c:

  fscache, cachefiles: Add alternate API to use kiocb for read/write to cache (2021-04-23 10:14:32 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-netfs-lib-20210426

for you to fetch changes up to 3003bbd0697b659944237f3459489cb596ba196c:

  afs: Use the netfs_write_begin() helper (2021-04-23 10:17:28 +0100)

----------------------------------------------------------------
AFS: Use the new netfs lib

----------------------------------------------------------------
David Howells (14):
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
      afs: Use new netfs lib read helper API
      afs: Use the netfs_write_begin() helper

 fs/afs/Kconfig             |   1 +
 fs/afs/dir.c               | 225 +++++++++++-----
 fs/afs/file.c              | 483 +++++++++------------------------
 fs/afs/fs_operation.c      |   4 +-
 fs/afs/fsclient.c          | 108 +++-----
 fs/afs/inode.c             |   7 +-
 fs/afs/internal.h          |  59 ++--
 fs/afs/rxrpc.c             | 150 ++++-------
 fs/afs/write.c             | 657 +++++++++++++++++++++++----------------------
 fs/afs/yfsclient.c         |  82 ++----
 include/net/af_rxrpc.h     |   2 +-
 include/trace/events/afs.h |  74 +++--
 net/rxrpc/recvmsg.c        |   9 +-
 13 files changed, 805 insertions(+), 1056 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

