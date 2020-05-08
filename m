Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F33291CBA82
	for <lists+linux-cachefs@lfdr.de>; Sat,  9 May 2020 00:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588976211;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A0xf93aeur+SSmsc7jnbGDmWr1SMMwTmX4XEJDXyvBQ=;
	b=eCa/Q0TXNtlLjWyi9jeNaAvlxPMCu+GP6KQ9xodTzM0koYlSB/NDEiZFb8ycA0AGsgdPt2
	WgsVRo1NbOxZcEbmxQmSsbRsK6W2vKy3UTwELIRhl+0pvawy3r33YNo1vx0KqSuWFP9GBJ
	6Ez3D3iQapjFfIRoUGrBammYnEwZzhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-1HraDn0eMrKjj34ufzPYsQ-1; Fri, 08 May 2020 18:16:50 -0400
X-MC-Unique: 1HraDn0eMrKjj34ufzPYsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DAF81800D42;
	Fri,  8 May 2020 22:16:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA65660CD1;
	Fri,  8 May 2020 22:16:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FC5B4CAA0;
	Fri,  8 May 2020 22:16:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048MGiWs023735 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 18:16:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70A5A1CF; Fri,  8 May 2020 22:16:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-225.rdu2.redhat.com
	[10.10.118.225])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 928776AD09;
	Fri,  8 May 2020 22:16:37 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Date: Fri, 08 May 2020 23:16:36 +0100
Message-ID: <158897619675.1119820.2203023452686054109.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, Lei Xue <carmark.dlut@gmail.com>,
	Carlos Maiolino <cmaiolino@redhat.com>,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH 0/5] cachefiles, nfs: Fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi Linus, Trond, Anna,

Can you pull these fixes for cachefiles and NFS's use of fscache?  Should
they go through the NFS tree or directly upstream?  The things fixed are:

 (1) The reorganisation of bmap() use accidentally caused the return value
     of cachefiles_read_or_alloc_pages() to get corrupted.

 (2) The NFS superblock index key accidentally got changed to include a
     number of kernel pointers - meaning that the key isn't matchable after
     a reboot.

 (3) A redundant check in nfs_fscache_get_super_cookie().

 (4) The NFS change_attr sometimes set in the auxiliary data for the
     caching of an file and sometimes not, which causes the cache to get
     discarded when it shouldn't.

 (5) There's a race between cachefiles_read_waiter() and
     cachefiles_read_copier() that causes an occasional assertion failure.

The patches are tagged here:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	tag fscache-fixes-20200508-2

Thanks,
David
---
Dave Wysochanski (3):
      NFS: Fix fscache super_cookie index_key from changing after umount
      NFS: Fix fscache super_cookie allocation
      NFSv4: Fix fscache cookie aux_data to ensure change_attr is included

David Howells (1):
      cachefiles: Fix corruption of the return value in cachefiles_read_or_alloc_pages()

Lei Xue (1):
      cachefiles: Fix race between read_waiter and read_copier involving op->to_do


 fs/cachefiles/rdwr.c |   12 ++++++------
 fs/nfs/fscache.c     |   39 ++++++++++++++++++---------------------
 fs/nfs/super.c       |    1 -
 3 files changed, 24 insertions(+), 28 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

