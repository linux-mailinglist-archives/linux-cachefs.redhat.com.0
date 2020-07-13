Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BEEDA21DD39
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Jul 2020 18:37:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594658256;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v0SLhYYg5NCjwgyEZeVv5LobkDe9KBBPEJzHvA12W00=;
	b=a6QOrY3XUlqB5FhS0fugSj/j5DjnmPilfSbssihs4TS15BTUs/mQF2JiMib2tZ/eZKfW2H
	5uW13S4ZYpZsSXud/n8BQcNQ8zpNIbI8W46HIJ5/ZNXl6pAmHMZkUVvIp6nAWtfaCf1yQq
	HVdZ+I5G48XMxD00WCh1wY3Ix2b3RS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-sQZTjd09OH-kMGEF0Hn2Rw-1; Mon, 13 Jul 2020 12:37:35 -0400
X-MC-Unique: sQZTjd09OH-kMGEF0Hn2Rw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDF2180040A;
	Mon, 13 Jul 2020 16:37:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE03C5C1D0;
	Mon, 13 Jul 2020 16:37:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 964E294EF4;
	Mon, 13 Jul 2020 16:37:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DGb2f9028387 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 12:37:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A328C19D7E; Mon, 13 Jul 2020 16:37:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-113.rdu2.redhat.com
	[10.10.112.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BAAD219C66;
	Mon, 13 Jul 2020 16:36:56 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>
Date: Mon, 13 Jul 2020 17:36:56 +0100
Message-ID: <159465821598.1377938.2046362270225008168.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 00/13] fscache: Rewrite 3: Make AFS use it
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Here's a set of patches that makes AFS use the fscache rewrite.

These patches can be found as part of the branch here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-iter

David
---
David Howells (1):
      afs: Add O_DIRECT read support


 fs/9p/Kconfig                          |    2 +-
 fs/Makefile                            |    2 +-
 fs/afs/Kconfig                         |    1 +
 fs/afs/cache.c                         |   54 --
 fs/afs/cell.c                          |    9 +-
 fs/afs/dir.c                           |  242 +++++--
 fs/afs/file.c                          |  575 +++++++--------
 fs/afs/fs_operation.c                  |    4 +-
 fs/afs/fsclient.c                      |  154 ++--
 fs/afs/inode.c                         |   57 +-
 fs/afs/internal.h                      |   58 +-
 fs/afs/rxrpc.c                         |  150 ++--
 fs/afs/volume.c                        |    9 +-
 fs/afs/write.c                         |  413 +++++++----
 fs/afs/yfsclient.c                     |  113 ++-
 fs/cachefiles/Makefile                 |    3 +-
 fs/cachefiles/bind.c                   |   11 +-
 fs/cachefiles/content-map.c            |  476 ++++++++++++
 fs/cachefiles/daemon.c                 |   10 +-
 fs/cachefiles/interface.c              |  564 ++++++++-------
 fs/cachefiles/internal.h               |  139 ++--
 fs/cachefiles/io.c                     |  279 +++++++
 fs/cachefiles/main.c                   |   12 +-
 fs/cachefiles/namei.c                  |  508 +++++--------
 fs/cachefiles/rdwr.c                   |  974 -------------------------
 fs/cachefiles/xattr.c                  |  263 +++----
 fs/ceph/Kconfig                        |    2 +-
 fs/cifs/Kconfig                        |    2 +-
 fs/fscache/Kconfig                     |    8 +
 fs/fscache/Makefile                    |   10 +-
 fs/fscache/cache.c                     |  136 ++--
 fs/fscache/cookie.c                    |  769 ++++++++------------
 fs/fscache/dispatcher.c                |  150 ++++
 fs/fscache/fsdef.c                     |   56 +-
 fs/fscache/histogram.c                 |    2 +-
 fs/fscache/internal.h                  |  260 +++----
 fs/fscache/io.c                        |  201 +++++
 fs/fscache/main.c                      |   35 +-
 fs/fscache/netfs.c                     |   10 +-
 fs/fscache/obj.c                       |  345 +++++++++
 fs/fscache/object-list.c               |  129 +---
 fs/fscache/object.c                    | 1133 -----------------------------
 fs/fscache/object_bits.c               |  120 +++
 fs/fscache/operation.c                 |  633 ----------------
 fs/fscache/page.c                      | 1248 --------------------------------
 fs/fscache/proc.c                      |   13 +-
 fs/fscache/read_helper.c               |  688 ++++++++++++++++++
 fs/fscache/stats.c                     |  265 +++----
 fs/internal.h                          |    5 -
 fs/nfs/Kconfig                         |    2 +-
 fs/nfs/fscache-index.c                 |    4 +-
 fs/read_write.c                        |    1 +
 include/linux/fs.h                     |    2 +
 include/linux/fscache-cache.h          |  508 +++----------
 include/linux/fscache-obsolete.h       |   13 +
 include/linux/fscache.h                |  814 ++++++++-------------
 include/linux/mm.h                     |    1 +
 include/linux/pagemap.h                |   14 +
 include/linux/uio.h                    |   11 +
 include/net/af_rxrpc.h                 |    2 +-
 include/trace/events/afs.h             |   51 +-
 include/trace/events/cachefiles.h      |  285 ++++++--
 include/trace/events/fscache.h         |  421 ++---------
 include/trace/events/fscache_support.h |   91 +++
 lib/iov_iter.c                         |  286 +++++++-
 mm/filemap.c                           |   27 +-
 net/rxrpc/recvmsg.c                    |    9 +-
 67 files changed, 5598 insertions(+), 8246 deletions(-)
 create mode 100644 fs/cachefiles/content-map.c
 create mode 100644 fs/cachefiles/io.c
 delete mode 100644 fs/cachefiles/rdwr.c
 create mode 100644 fs/fscache/dispatcher.c
 create mode 100644 fs/fscache/io.c
 create mode 100644 fs/fscache/obj.c
 delete mode 100644 fs/fscache/object.c
 create mode 100644 fs/fscache/object_bits.c
 delete mode 100644 fs/fscache/operation.c
 delete mode 100644 fs/fscache/page.c
 create mode 100644 fs/fscache/read_helper.c
 create mode 100644 include/linux/fscache-obsolete.h
 create mode 100644 include/trace/events/fscache_support.h


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

