Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id F2DB83F9768
	for <lists+linux-cachefs@lfdr.de>; Fri, 27 Aug 2021 11:44:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630057447;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m7fFKulmwm1nyLDDKNKlA2HQNXz1CEdvFGHHMsCX/98=;
	b=gnwB747fszBjgT3dtjtQAL4pnJJtvrZOBFQugKzEKkGQyCivQmY5PsV87dt36L0HfDti3n
	V7XslPm8w5GzEa3op4GsA4WQAbuL3TSHK0kxOmkxU8tfFd9ppBuyl4MXqY6FRmmEYe5qwE
	rTEiTbb/faB/bxqaVawdObp1XKsLJf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-duHTFjmrN5C_-iuoW8hsPw-1; Fri, 27 Aug 2021 05:44:05 -0400
X-MC-Unique: duHTFjmrN5C_-iuoW8hsPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C188F1086A81;
	Fri, 27 Aug 2021 09:43:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28DFA608BA;
	Fri, 27 Aug 2021 09:43:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A56A4181A0F0;
	Fri, 27 Aug 2021 09:43:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17R9hVZg002242 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 05:43:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6CCE05DA60; Fri, 27 Aug 2021 09:43:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 07ED9752A0;
	Fri, 27 Aug 2021 09:43:27 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Date: Fri, 27 Aug 2021 10:43:27 +0100
Message-ID: <163005740700.2472992.12365214290752300378.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Jeffrey Altman <jaltman@auristor.com>, linux-mm@kvack.org,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
	devel@lists.orangefs.org
Subject: [Linux-cachefs] [PATCH v2 0/6] netfs, afs, ceph: Support folios,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Here's a set of patches to convert netfs and afs to use folios and to
provide sufficient conversion for ceph that it can continue to use the
netfs library.  Jeff Layton is working on fully converting ceph.

This based on top of part of Matthew Wilcox's folio changes[1]

Changes:

ver #2:
 - Reorder the patches to put both non-folio afs patches to the front.
 - Use page_offset() rather than manual calculation[2].
 - Fix folio_inode() to directly access the inode[3].

David

Link: https://git.infradead.org/users/willy/pagecache.git/shortlog/refs/heads/for-next [1]
Link: https://lore.kernel.org/r/YST/0e92OdSH0zjg@casper.infradead.org/ [2]
Link: https://lore.kernel.org/r/YST8OcVNy02Rivbm@casper.infradead.org/ [3]
Link: https://lore.kernel.org/r/2408234.1628687271@warthog.procyon.org.uk/ # v0
Link: https://lore.kernel.org/r/162981147473.1901565.1455657509200944265.stgit@warthog.procyon.org.uk/ # v1
---
David Howells (6):
      afs: Fix afs_launder_page() to set correct start file position
      afs: Sort out symlink reading
      folio: Add a function to change the private data attached to a folio
      folio: Add a function to get the host inode for a folio
      netfs, afs, ceph: Use folios
      afs: Use folios in directory handling


 fs/afs/dir.c               | 229 +++++++++++--------------
 fs/afs/dir_edit.c          | 154 ++++++++---------
 fs/afs/file.c              |  82 +++++----
 fs/afs/inode.c             |   6 +-
 fs/afs/internal.h          |  49 +++---
 fs/afs/write.c             | 332 ++++++++++++++++++-------------------
 fs/ceph/addr.c             |  80 ++++-----
 fs/netfs/read_helper.c     | 165 +++++++++---------
 include/linux/netfs.h      |  12 +-
 include/linux/pagemap.h    |  33 ++++
 include/trace/events/afs.h |  21 +--
 mm/page-writeback.c        |   2 +-
 12 files changed, 584 insertions(+), 581 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

