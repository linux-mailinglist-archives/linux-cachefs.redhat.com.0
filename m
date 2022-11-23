Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 82531636D7E
	for <lists+linux-cachefs@lfdr.de>; Wed, 23 Nov 2022 23:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669243718;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Vv5pZ2tDwSuuKned7+1iHxZF8Jjr1gR94KOuu07B5yk=;
	b=XlUjRafrkEbbWjZtjP2FHtCx6N11OfYkVcrTN/DfQTMRDXiYbDBmWsJTnuZhzptJikWc69
	scmBUT7qd3uwmXzo+6Y/c7psVYQrwc/dymXQ/4vjvdr9mxLvl8ySA8RFviAcG70NcbX2Md
	t8qp9SxeKzHUg8uMhuQi7kGJH2q82y0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-GknNFGMlOAq84f-J_eUpEg-1; Wed, 23 Nov 2022 17:48:35 -0500
X-MC-Unique: GknNFGMlOAq84f-J_eUpEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAED529AB3E2;
	Wed, 23 Nov 2022 22:48:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9453A40C6EC5;
	Wed, 23 Nov 2022 22:48:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 62CEF194658D;
	Wed, 23 Nov 2022 22:48:31 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0BF261946587 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 23 Nov 2022 22:48:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BCDF3401D41; Wed, 23 Nov 2022 22:48:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6684249BB62;
 Wed, 23 Nov 2022 22:48:28 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Nov 2022 22:48:25 +0000
Message-ID: <166924370539.1772793.13730698360771821317.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.5
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH v4 0/3] mm, netfs,
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
 linux-mm@kvack.org, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 linux-erofs@lists.ozlabs.org, Dominique Martinet <asmadeus@codewreck.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi Linus,

How about this then?

I've split the folio_has_private()/filemap_release_folio() call pair
merging into its own patch, separate from the actual bugfix and pulled out
the folio_needs_release() function into mm/internal.h and made
filemap_release_folio() use it.  I've also got rid of the bit clearances
from the network filesystem evict_inode functions as they doesn't seem to
be necessary.

I've also added an additional experimental patch to see if the pair in
shrink_folio_list() can be reduced cleanly to just the release call.  This
involves making filemap_release_folio() have a three-state return.

David

Changes:
========
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
---
David Howells (3):
      mm: Merge folio_has_private()/filemap_release_folio() call pairs
      mm, netfs, fscache: Stop read optimisation when folio removed from pagecache
      mm: Make filemap_release_folio() better inform shrink_folio_list()


 fs/9p/cache.c           |  2 ++
 fs/afs/internal.h       |  2 ++
 fs/cachefiles/namei.c   |  2 ++
 fs/ceph/cache.c         |  2 ++
 fs/cifs/fscache.c       |  2 ++
 fs/splice.c             |  3 +--
 include/linux/pagemap.h | 23 ++++++++++++++++++++++-
 mm/filemap.c            | 20 +++++++++++++++-----
 mm/huge_memory.c        |  3 +--
 mm/internal.h           | 11 +++++++++++
 mm/khugepaged.c         |  3 +--
 mm/memory-failure.c     |  3 +--
 mm/migrate.c            |  3 +--
 mm/truncate.c           |  6 ++----
 mm/vmscan.c             | 34 +++++++++++++++++-----------------
 15 files changed, 82 insertions(+), 37 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

