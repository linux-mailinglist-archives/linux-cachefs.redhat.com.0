Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C0644B50C
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Nov 2021 22:57:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636495072;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SsoYgFS6A+BtG/NvfCg+Y8oL0GPyXKBIFuHQ6Nq1G8c=;
	b=IVZP5vGKeek2MafyyyfXz773LIsbm6pEhXsz2qG7cm4sqNGwaM/5Kiceqoc8XCJAGEdNOo
	5kmsfREsVHZHQWJhpXRtDvfzgTsLkwJlfUcNfm0BI+QDxCLc9HWMRrgXKy8d8okqxryY8c
	Zyqq6XjH/VZJnDuaaUoRSO38J21lsYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-3j7u6Ht4P1-yaNnHsREVug-1; Tue, 09 Nov 2021 16:57:49 -0500
X-MC-Unique: 3j7u6Ht4P1-yaNnHsREVug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B4BD802C8F;
	Tue,  9 Nov 2021 21:57:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 298FC60C0F;
	Tue,  9 Nov 2021 21:57:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE7CB1800FE4;
	Tue,  9 Nov 2021 21:57:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A9LRI1O006517 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 9 Nov 2021 16:27:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 00E7D1007605; Tue,  9 Nov 2021 21:27:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0D7110016F4;
	Tue,  9 Nov 2021 21:27:14 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Date: Tue, 09 Nov 2021 21:27:14 +0000
Message-ID: <163649323416.309189.4637503793406396694.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	kafs-testing@auristor.com, linux-mm@kvack.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-cachefs@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org,
	devel@lists.orangefs.org
Subject: [Linux-cachefs] [PATCH v4 0/5] netfs, 9p, afs, ceph: Support folios,
 at least partially
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Here's a set of patches to convert netfs, 9p and afs to use folios and to
provide sufficient conversion for ceph that it can continue to use the
netfs library.  Jeff Layton is working on fully converting ceph.

This has been rebased on to the 9p merge in Linus's tree[5] so that it has
access to both the 9p conversion to fscache and folios.

Changes
=======
ver #4:
 - Detached and sent the afs symlink split patch separately.
 - Handed the 9p netfslibisation patch off to Dominique Martinet.
 - Added a patch to foliate page_endio().
 - Fixed a bug in afs_redirty_page() whereby it didn't set the next page
   index in the loop and returned too early.
 - Simplified a check in v9fs_vfs_write_folio_locked()[4].
 - Undid a change to afs_symlink_readpage()[4].
 - Used offset_in_folio() in afs_write_end()[4].
 - Rebased on 9p-folio merge upstream[5].

ver #3:
 - Rebased on upstream as folios have been pulled.
 - Imported a patch to convert 9p to netfslib from my
   fscache-remove-old-api branch[3].
 - Foliated netfslib.

ver #2:
 - Reorder the patches to put both non-folio afs patches to the front.
 - Use page_offset() rather than manual calculation[1].
 - Fix folio_inode() to directly access the inode[2].

David

Link: https://lore.kernel.org/r/YST/0e92OdSH0zjg@casper.infradead.org/ [1]
Link: https://lore.kernel.org/r/YST8OcVNy02Rivbm@casper.infradead.org/ [2]
Link: https://lore.kernel.org/r/163551653404.1877519.12363794970541005441.stgit@warthog.procyon.org.uk/ [3]
Link: https://lore.kernel.org/r/YYKa3bfQZxK5/wDN@casper.infradead.org/ [4]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f89ce84bc33330607a782e47a8b19406ed109b15 [5]
Link: https://lore.kernel.org/r/2408234.1628687271@warthog.procyon.org.uk/ # v0
Link: https://lore.kernel.org/r/162981147473.1901565.1455657509200944265.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/163005740700.2472992.12365214290752300378.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/163584174921.4023316.8927114426959755223.stgit@warthog.procyon.org.uk>/ # v3
---
David Howells (5):
      folio: Add a function to change the private data attached to a folio
      folio: Add a function to get the host inode for a folio
      folio: Add replacements for page_endio()
      netfs, 9p, afs, ceph: Use folios
      afs: Use folios in directory handling


 fs/9p/vfs_addr.c           |  83 +++++----
 fs/9p/vfs_file.c           |  20 +--
 fs/afs/dir.c               | 229 ++++++++++--------------
 fs/afs/dir_edit.c          | 154 ++++++++--------
 fs/afs/file.c              |  68 ++++----
 fs/afs/internal.h          |  46 ++---
 fs/afs/write.c             | 347 ++++++++++++++++++-------------------
 fs/ceph/addr.c             |  80 +++++----
 fs/netfs/read_helper.c     | 165 +++++++++---------
 include/linux/netfs.h      |  12 +-
 include/linux/pagemap.h    |  23 ++-
 include/trace/events/afs.h |  21 +--
 mm/filemap.c               |  64 ++++---
 mm/page-writeback.c        |   2 +-
 14 files changed, 666 insertions(+), 648 deletions(-)



Tested-by: Jeff Layton <jlayton@kernel.org>
Tested-by: Dominique Martinet <asmadeus@codewreck.org>
Tested-by: kafs-testing@auristor.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

