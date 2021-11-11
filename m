Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C56D844DA54
	for <lists+linux-cachefs@lfdr.de>; Thu, 11 Nov 2021 17:26:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636647971;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LUZwXLZhjvPCML9LJPf54XaO/3g8967Pcj/5DRu6+Mo=;
	b=WZ8DGBMYGy7eP78l5FkliqWTU6kVAMms7/yeAmJ5uXARFjP2QqKaAamRE552dmQBGMjak5
	bdvsJ9aXSDg95hR6Bk3VRT/dNMEFeYZt4YQo053q0KmK/cTKFfutxxZ0Ninaobhhp1r5Vv
	Xsm73eceu8Vf/S6Ur6zUZmEdp04znCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-5nIp_O-zMROS3XOCxws6qg-1; Thu, 11 Nov 2021 11:26:08 -0500
X-MC-Unique: 5nIp_O-zMROS3XOCxws6qg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CD0A101AFA8;
	Thu, 11 Nov 2021 16:26:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7F865E278;
	Thu, 11 Nov 2021 16:26:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93FEC4E58F;
	Thu, 11 Nov 2021 16:26:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ABGQ0KZ013035 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 11 Nov 2021 11:26:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 304AF76608; Thu, 11 Nov 2021 16:26:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BD4A5C1D5;
	Thu, 11 Nov 2021 16:25:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
MIME-Version: 1.0
Date: Thu, 11 Nov 2021 16:25:52 +0000
Message-ID: <1134871.1636647952@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1ABGQ0KZ013035
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Jeffrey E Altman <jaltman@auristor.com>, linux-mm@kvack.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [GIT PULL] netfs, 9p, afs, ceph: Use folios
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1134870.1636647952.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

[Apologies for the late request, but I needed to wait for folios and 9p to
be pulled into your tree so that I could get rid of the temporary merge I
was using and then I had to wait for my branch to be retested before I
could send this your way - and then Willy changed his mind about how to
handle foliation of page_endio().]

Anyway, could you consider pulling this please?  It converts netfslib, 9p
and afs to use folios.  It also partially converts ceph so that it uses
folios on the boundaries with netfslib.

To help with this, a couple of folio helper functions are added in the
first two patches.  If you don't want to take the netfs/9p/afs/ceph bits,
could you at least consider taking the folio helpers?  Then they would be
available to others.

These patches don't touch fscache and cachefiles as I intend to remove all
the code that deals with pages directly from there.  Only nfs and cifs are
using the old fscache I/O API now.  The new API uses iov_iter instead.

Thanks to Jeff Layton, Dominique Martinet and AuriStor for testing and
retesting the patches.

Thanks,
David

Changes
=======
ver #5:
 - Got rid of the folio_endio bits again as Willy changed his mind and
   would rather I inlined the code directly instead.

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

Link: https://lore.kernel.org/r/YST/0e92OdSH0zjg@casper.infradead.org/ [1]
Link: https://lore.kernel.org/r/YST8OcVNy02Rivbm@casper.infradead.org/ [2]
Link: https://lore.kernel.org/r/163551653404.1877519.12363794970541005441.stgit@warthog.procyon.org.uk/ [3]
Link: https://lore.kernel.org/r/YYKa3bfQZxK5/wDN@casper.infradead.org/ [4]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f89ce84bc33330607a782e47a8b19406ed109b15 [5]
Link: https://lore.kernel.org/r/2408234.1628687271@warthog.procyon.org.uk/ # v0
Link: https://lore.kernel.org/r/162981147473.1901565.1455657509200944265.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/163005740700.2472992.12365214290752300378.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/163584174921.4023316.8927114426959755223.stgit@warthog.procyon.org.uk>/ # v3
Link: https://lore.kernel.org/r/163649323416.309189.4637503793406396694.stgit@warthog.procyon.org.uk/ # v4
Link: https://lore.kernel.org/r/163657847613.834781.7923681076643317435.stgit@warthog.procyon.org.uk/ # v5

---
The following changes since commit f89ce84bc33330607a782e47a8b19406ed109b15:

  Merge tag '9p-for-5.16-rc1' of git://github.com/martinetd/linux (2021-11-09 10:30:13 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/netfs-folio-20211111

for you to fetch changes up to 255ed63638da190e2485d32c0f696cd04d34fbc0:

  afs: Use folios in directory handling (2021-11-10 21:17:09 +0000)

----------------------------------------------------------------
netfs, 9p, afs and ceph (partial) foliation

----------------------------------------------------------------
David Howells (4):
      folio: Add a function to change the private data attached to a folio
      folio: Add a function to get the host inode for a folio
      netfs, 9p, afs, ceph: Use folios
      afs: Use folios in directory handling

 fs/9p/vfs_addr.c           |  83 ++++++-----
 fs/9p/vfs_file.c           |  20 +--
 fs/afs/dir.c               | 229 +++++++++++++-----------------
 fs/afs/dir_edit.c          | 154 ++++++++++----------
 fs/afs/file.c              |  70 +++++----
 fs/afs/internal.h          |  46 +++---
 fs/afs/write.c             | 347 ++++++++++++++++++++++-----------------------
 fs/ceph/addr.c             |  80 ++++++-----
 fs/netfs/read_helper.c     | 165 ++++++++++-----------
 include/linux/netfs.h      |  12 +-
 include/linux/pagemap.h    |  33 +++++
 include/trace/events/afs.h |  21 +--
 mm/page-writeback.c        |   2 +-
 13 files changed, 636 insertions(+), 626 deletions(-)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

