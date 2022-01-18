Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFD24927A2
	for <lists+linux-cachefs@lfdr.de>; Tue, 18 Jan 2022 14:54:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642514078;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O8yboa158KKG50K5RDRgkmld3TJNWZefeselcsiJXkE=;
	b=g5zXWxgTOMZ26WmzcYHxrPXOP44YxtuT6WqCVObFaMssBWxHRFrL+H/idnqBsYyRMAz1zw
	4H66bVLl3IneBL9tZsRvzTlej64vA+Rn7qimRa6IYMN0dXNTXAlZIyYNMaFVwGOTt2OzSA
	W7AQ81V/SxC0QOoCijAR4XxW8C+lw60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-1VO568odP_-TTd8_Ln9WJw-1; Tue, 18 Jan 2022 08:54:35 -0500
X-MC-Unique: 1VO568odP_-TTd8_Ln9WJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 263E718C8C20;
	Tue, 18 Jan 2022 13:54:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAFD210589CF;
	Tue, 18 Jan 2022 13:54:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 523F84BB7B;
	Tue, 18 Jan 2022 13:54:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IDqsve013982 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 08:52:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D12878049D; Tue, 18 Jan 2022 13:52:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54B1F8049C;
	Tue, 18 Jan 2022 13:52:50 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Tue, 18 Jan 2022 13:52:49 +0000
Message-ID: <164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <smfrench@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	v9fs-developer@lists.sourceforge.net
Subject: [Linux-cachefs] [PATCH 00/11] fscache,
	cachefiles: Rewrite fixes/updates
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Here's a set of fixes and minor updates for the fscache rewrite[1]:

 (1) Fix mishandling of volume collisions (the wait condition is inverted
     and so it was only waiting if the volume collision was already
     resolved).

And for cachefiles, including addressing some of Jeff Layton's review
comments:

 (2) Fix miscalculation of whether there's space available.

 (3) Make sure a default cache name is set on a cache if the user hasn't
     set one by the time they bind the cache.

 (4) Adjust the way the backing inode is presented in tracepoints, add a
     tracepoint for mkdir and trace directory lookup.

 (5) Trace failure to set the active file mark.

 (6) Add explanation of the checks made on the backing filesystem.

 (7) Check that the backing filesystem supports tmpfile.

 (8) Document how the page-release cancellation of the read-skip
     optimisation works.

 (9) Add an IS_KERNEL_FILE() check macro for the S_KERNEL_FILE inode flag.

And I've included a change for netfslib:

(10) Make ops->init_rreq() optional.

I've also added the patch to rewrite cifs's fscache indexing.


Link: https://lore.kernel.org/r/164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk/ [1]

---
David Howells (9):
      fscache: Fix the volume collision wait condition
      cachefiles: Calculate the blockshift in terms of bytes, not pages
      cachefiles: Make some tracepoint adjustments
      cachefiles: Trace active-mark failure
      cachefiles: Explain checks in a comment
      cachefiles: Check that the backing filesystem supports tmpfiles
      fscache: Add a comment explaining how page-release optimisation works
      vfs, fscache: Add an IS_KERNEL_FILE() macro for the S_KERNEL_FILE flag
      cifs: Support fscache indexing rewrite

Jeffle Xu (2):
      cachefiles: set default tag name if it's unspecified
      netfs: Make ops->init_rreq() optional


 fs/cachefiles/cache.c             |  17 +-
 fs/cachefiles/daemon.c            |  11 +
 fs/cachefiles/internal.h          |   2 +-
 fs/cachefiles/io.c                |   2 +-
 fs/cachefiles/namei.c             |  18 +-
 fs/ceph/addr.c                    |   5 -
 fs/cifs/Kconfig                   |   2 +-
 fs/cifs/Makefile                  |   2 +-
 fs/cifs/cache.c                   | 105 ----------
 fs/cifs/cifsfs.c                  |  19 +-
 fs/cifs/cifsglob.h                |   5 +-
 fs/cifs/connect.c                 |  15 +-
 fs/cifs/dir.c                     |   5 +
 fs/cifs/file.c                    |  70 ++++---
 fs/cifs/fscache.c                 | 333 +++++++-----------------------
 fs/cifs/fscache.h                 | 126 ++++-------
 fs/cifs/inode.c                   |  19 +-
 fs/namei.c                        |   2 +-
 fs/netfs/read_helper.c            |   3 +-
 include/linux/fs.h                |   1 +
 include/linux/fscache.h           |   5 +
 include/trace/events/cachefiles.h | 103 ++++++---
 22 files changed, 313 insertions(+), 557 deletions(-)
 delete mode 100644 fs/cifs/cache.c


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

