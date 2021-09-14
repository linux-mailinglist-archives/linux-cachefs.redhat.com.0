Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7D18F40B005
	for <lists+linux-cachefs@lfdr.de>; Tue, 14 Sep 2021 15:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631627918;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T1TqmRQXC8jN0ehF14js48eoY/jyHTYqjY22vkXmEuA=;
	b=U+8Xk5pKm2ANUUK8u2bEv8uNfRObNrzS1MalutRlX+bA/F/9Km+NYSdn9A+GeSzVF3ey+S
	Hj5NbHU+cFqdA6ponCvtRqcZU2aZVJbVZZcBmsuDTaTGtqsUE2vJ/X4jW6i7uQZpOOmEl2
	+7YlwV+Qqw+JOLCCUIHfuEzau7tQdoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-tbDDQ5UBOS6gfqgO07fbOg-1; Tue, 14 Sep 2021 09:58:37 -0400
X-MC-Unique: tbDDQ5UBOS6gfqgO07fbOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACF0850754;
	Tue, 14 Sep 2021 13:58:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F4C066FFF;
	Tue, 14 Sep 2021 13:58:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83D874E58E;
	Tue, 14 Sep 2021 13:58:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18EDshrZ015707 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 14 Sep 2021 09:54:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 962F3179B3; Tue, 14 Sep 2021 13:54:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C68460583;
	Tue, 14 Sep 2021 13:54:36 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Tue, 14 Sep 2021 14:54:36 +0100
Message-ID: <163162767601.438332.9017034724960075707.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: [Linux-cachefs] [RFC PATCH 0/8] fscache: Replace and remove old I/O
	API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Here's a set of patches that removes the old fscache I/O API by the following
means:

 (1) A simple fallback API is added that can read or write a single page
     synchronously.  The functions for this have "deprecated" in their names
     as they have to be removed at some point.

 (2) An implementation of this is provided in cachefiles.  It creates a kiocb
     to use DIO to the backing file rather than calling readpage on the
     backing filesystem page and then snooping the page wait queue.

 (3) NFS is switched to use the fallback API.

 (4) CIFS is switched to use the fallback API also for the moment.

 (5) 9P is switched to using netfslib.

 (6) The old I/O API is removed from fscache and the page snooping
     implementation is removed from cachefiles.

The reasons for doing this are:

 (A) Using a kiocb to do asynchronous DIO from/to the pages of the backing
     file is now a possibility that didn't exist when cachefiles was created.
     This is much simpler than the snooping mechanism with a proper callback
     path and it also requires fewer copies and less memory.

 (B) We have to stop using bmap() or SEEK_DATA/SEEK_HOLE to work out what
     blocks are present in the backing file is dangerous and can lead to data
     corruption if the backing filesystem can insert or remove blocks of zeros
     arbitrarily in order to optimise its extent list[1].

     Whilst this patchset doesn't fix that yet, it does simplify the code and
     the fix for that can be made in a subsequent patchset.

 (C) In order to fix (B), the cache will need to keep track itself of what
     data is present.  To make this easier to manage, the intention is to
     increase the cache block granularity to, say, 256KiB - importantly, a
     size that will span multiple pages - which means the single-page
     interface will have to go away.  netfslib is designed to deal with
     that on behalf of a filesystem, though a filesystem could use raw
     cache calls instead and manage things itself.

These patches can be found also on:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-iter-3

David

Link: https://lore.kernel.org/r/YO17ZNOcq+9PajfQ@mit.edu [1]
---
David Howells (8):
      fscache: Generalise the ->begin_read_operation method
      fscache: Implement an alternate I/O interface to replace the old API
      nfs: Move to using the alternate (deprecated) fscache I/O API
      9p: (untested) Convert to using the netfs helper lib to do reads and caching
      cifs: (untested) Move to using the alternate (deprecated) fscache I/O API
      fscache: Remove the old I/O API
      fscache: Remove stats that are no longer used
      fscache: Update the documentation to reflect I/O API changes


 .../filesystems/caching/backend-api.rst       |  138 +--
 .../filesystems/caching/netfs-api.rst         |  386 +-----
 fs/9p/Kconfig                                 |    1 +
 fs/9p/cache.c                                 |  137 ---
 fs/9p/cache.h                                 |   98 +-
 fs/9p/v9fs.h                                  |    9 +
 fs/9p/vfs_addr.c                              |  174 ++-
 fs/9p/vfs_file.c                              |   21 +-
 fs/cachefiles/Makefile                        |    1 -
 fs/cachefiles/interface.c                     |   15 -
 fs/cachefiles/internal.h                      |   38 -
 fs/cachefiles/io.c                            |   28 +-
 fs/cachefiles/main.c                          |    1 -
 fs/cachefiles/rdwr.c                          |  972 ---------------
 fs/cifs/file.c                                |   64 +-
 fs/cifs/fscache.c                             |  105 +-
 fs/cifs/fscache.h                             |   74 +-
 fs/fscache/cache.c                            |    6 -
 fs/fscache/cookie.c                           |   10 -
 fs/fscache/internal.h                         |   58 +-
 fs/fscache/io.c                               |  140 ++-
 fs/fscache/object.c                           |    2 -
 fs/fscache/page.c                             | 1066 -----------------
 fs/fscache/stats.c                            |   73 +-
 fs/nfs/file.c                                 |   14 +-
 fs/nfs/fscache-index.c                        |   26 -
 fs/nfs/fscache.c                              |  161 +--
 fs/nfs/fscache.h                              |   84 +-
 fs/nfs/read.c                                 |   25 +-
 fs/nfs/write.c                                |    7 +-
 include/linux/fscache-cache.h                 |  131 --
 include/linux/fscache.h                       |  418 ++-----
 include/linux/netfs.h                         |   17 +-
 33 files changed, 508 insertions(+), 3992 deletions(-)
 delete mode 100644 fs/cachefiles/rdwr.c


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

