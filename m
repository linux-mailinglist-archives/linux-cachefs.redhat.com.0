Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E19699852
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Feb 2023 16:07:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676560033;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s5c9sWS1bpYZ7Fac6rQkvfkB1o9b0uDpuRAq3LF/B6o=;
	b=OZGIFH+L8K1FfRX/h2hMaFpLw74e1IS/+FLccUTWSS80NVBsfwsJ7hGsbH+kRNWOO4xYvC
	GGehQWkxzjoz3xq61Uo6Pg7aXCwI7xRT5xMdiA0pIN1YtUaMpSve5L+wnHTcK4L4dQIN18
	TDAB9pbasOsHWDhZHRk1FI3oxRW8Bdw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-0HqYrQyzPxyru2DHbYkPCA-1; Thu, 16 Feb 2023 10:07:10 -0500
X-MC-Unique: 0HqYrQyzPxyru2DHbYkPCA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B8FE100F90B;
	Thu, 16 Feb 2023 15:07:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACBFC40C945A;
	Thu, 16 Feb 2023 15:07:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 90F18194658D;
	Thu, 16 Feb 2023 15:07:08 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4F0CF1946588 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 16 Feb 2023 15:07:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2EADD40CF8E4; Thu, 16 Feb 2023 15:07:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E53A4010E85;
 Thu, 16 Feb 2023 15:07:05 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Matthew Wilcox <willy@infradead.org>
Date: Thu, 16 Feb 2023 15:06:59 +0000
Message-Id: <20230216150701.3654894-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Linux-cachefs] [PATCH v6 0/2] mm, netfs,
 fscache: Stop read optimisation when folio removed from pagecache
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
Cc: Christoph Hellwig <hch@infradead.org>, linux-nfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Willy,

Is this okay by you?  You said you wanted to look at the remaining uses of
page_has_private(), of which there are then three after these patches, not
counting folio_has_private():

	arch/s390/kernel/uv.c:          if (page_has_private(page))
	mm/khugepaged.c:                    1 + page_mapcount(page) + page_has_private(page)) {
	mm/migrate_device.c:            extra += 1 + page_has_private(page);

--
I've split the folio_has_private()/filemap_release_folio() call pair
merging into its own patch, separate from the actual bugfix and pulled out
the folio_needs_release() function into mm/internal.h and made
filemap_release_folio() use it.  I've also got rid of the bit clearances
from the network filesystem evict_inode functions as they doesn't seem to
be necessary.

Note that the last vestiges of try_to_release_page() got swept away, so I
rebased and dealt with that.  One comment remained, which is removed by the
first patch.

David

Changes:
========
ver #6)
 - Drop the third patch which removes a duplicate check in vmscan().

ver #5)
 - Rebased on linus/master.  try_to_release_page() has now been entirely
   replaced by filemap_release_folio(), barring one comment.
 - Cleaned up some pairs in ext4.

ver #4)
 - Split has_private/release call pairs into own patch.
 - Moved folio_needs_release() to mm/internal.h and removed open-coded
   version from filemap_release_folio().
 - Don't need to clear AS_RELEASE_ALWAYS in ->evict_inode().
 - Added experimental patch to reduce shrink_folio_list().

ver #3)
 - Fixed mapping_clear_release_always() to use clear_bit() not set_bit().
 - Moved a '&&' to the correct line.

ver #2)
 - Rewrote entirely according to Willy's suggestion[1].

Link: https://lore.kernel.org/r/Yk9V/03wgdYi65Lb@casper.infradead.org/ [1]
Link: https://lore.kernel.org/r/164928630577.457102.8519251179327601178.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/166844174069.1124521.10890506360974169994.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/166869495238.3720468.4878151409085146764.stgit@warthog.procyon.org.uk/ # v3
Link: https://lore.kernel.org/r/1459152.1669208550@warthog.procyon.org.uk/ # v3 also
Link: https://lore.kernel.org/r/166924370539.1772793.13730698360771821317.stgit@warthog.procyon.org.uk/ # v4
Link: https://lore.kernel.org/r/167172131368.2334525.8569808925687731937.stgit@warthog.procyon.org.uk/ # v5
---
%(shortlog)s
%(diffstat)s

David Howells (2):
  mm: Merge folio_has_private()/filemap_release_folio() call pairs
  mm, netfs, fscache: Stop read optimisation when folio removed from
    pagecache

 fs/9p/cache.c           |  2 ++
 fs/afs/internal.h       |  2 ++
 fs/cachefiles/namei.c   |  2 ++
 fs/ceph/cache.c         |  2 ++
 fs/cifs/fscache.c       |  2 ++
 fs/ext4/move_extent.c   | 12 ++++--------
 fs/splice.c             |  3 +--
 include/linux/pagemap.h | 16 ++++++++++++++++
 mm/filemap.c            |  2 ++
 mm/huge_memory.c        |  3 +--
 mm/internal.h           | 11 +++++++++++
 mm/khugepaged.c         |  3 +--
 mm/memory-failure.c     |  8 +++-----
 mm/migrate.c            |  3 +--
 mm/truncate.c           |  6 ++----
 mm/vmscan.c             |  8 ++++----
 16 files changed, 56 insertions(+), 29 deletions(-)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

