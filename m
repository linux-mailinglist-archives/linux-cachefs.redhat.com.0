Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EB5473AF7A6
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Jun 2021 23:45:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624311902;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QKDjZt1dkKrnficVKjwO2qz/7Eggp8eig0+5vMcbyp4=;
	b=FHBSxbCCGsV86tnPZFQfKLGl3l8EgaljfMk2MeJZkB0dnFdtzDbEsozO9f/8YuG0ph9Dyo
	5QlwKaCbFcKdBRtEi0X6xKOA59I9UexO/t7egPyJg8V5+BL5KVStxkDV3nTDs3SfIxssIb
	2nfTkzx1V6AJjp17KzTuN50P6LDC9ho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-BmXRFYO6M7GtCt-NBjHAvw-1; Mon, 21 Jun 2021 17:45:00 -0400
X-MC-Unique: BmXRFYO6M7GtCt-NBjHAvw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB6B0100CF6F;
	Mon, 21 Jun 2021 21:44:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C5265D9CA;
	Mon, 21 Jun 2021 21:44:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF49B18095C2;
	Mon, 21 Jun 2021 21:44:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15LLipSZ030678 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 17:44:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F4D260938; Mon, 21 Jun 2021 21:44:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-65.rdu2.redhat.com
	[10.10.118.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34A51608BA;
	Mon, 21 Jun 2021 21:44:45 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 21 Jun 2021 22:44:44 +0100
Message-ID: <162431188431.2908479.14031376932042135080.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH 00/12] fscache: Some prep work for fscache
	rewrite
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Here are some patches that perform some preparatory work for the fscache
rewrite that's being worked on.  These include:

 (1) Always select netfs stats when enabling fscache stats since they're
     displayed through the same procfile.

 (2) Add a cookie debug ID that can be used in tracepoints instead of a
     pointer and cache it in the netfs_cache_resources struct rather than
     in the netfs_read_request struct to make it more available.

 (3) Use file_inode() in cachefiles rather than dereferencing file->f_inode
     directly.

 (4) Provide a procfile to display fscache cookies.

 (5) Remove the fscache and cachefiles histogram procfiles.

 (6) Remove the fscache object list procfile.

 (7) Avoid using %p in fscache and cachefiles as the value is hashed and
     not comparable to the register dump in an oops trace.

 (8) Fix the cookie hash function to actually achieve useful dispersion.

 (9) Fix fscache_cookie_put() so that it doesn't dereference the cookie
     pointer in the tracepoint after the refcount has been decremented
     (we're only allowed to do that if we decremented it to zero).

(10) Use refcount_t rather than atomic_t for the fscache_cookie refcount.

The patches can be found on this branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-next

David
---
David Howells (12):
      fscache: Select netfs stats if fscache stats are enabled
      netfs: Move cookie debug ID to struct netfs_cache_resources
      cachefiles: Use file_inode() rather than accessing ->f_inode
      fscache: Add a cookie debug ID and use that in traces
      fscache: Procfile to display cookies
      fscache, cachefiles: Remove the histogram stuff
      fscache: Remove the object list procfile
      fscache: Change %p in format strings to something else
      cachefiles: Change %p in format strings to something else
      fscache: Fix cookie key hashing
      fscache: Fix fscache_cookie_put() to not deref after dec
      fscache: Use refcount_t for the cookie refcount instead of atomic_t


 fs/cachefiles/Kconfig             |  19 --
 fs/cachefiles/Makefile            |   2 -
 fs/cachefiles/bind.c              |   2 -
 fs/cachefiles/interface.c         |   6 +-
 fs/cachefiles/internal.h          |  25 --
 fs/cachefiles/io.c                |   6 +-
 fs/cachefiles/key.c               |   2 +-
 fs/cachefiles/main.c              |   7 -
 fs/cachefiles/namei.c             |  61 ++---
 fs/cachefiles/proc.c              | 114 --------
 fs/cachefiles/xattr.c             |   4 +-
 fs/fscache/Kconfig                |  24 --
 fs/fscache/Makefile               |   2 -
 fs/fscache/cache.c                |  11 +-
 fs/fscache/cookie.c               | 201 +++++++++++----
 fs/fscache/fsdef.c                |   3 +-
 fs/fscache/histogram.c            |  87 -------
 fs/fscache/internal.h             |  57 +---
 fs/fscache/main.c                 |  39 +++
 fs/fscache/netfs.c                |   2 +-
 fs/fscache/object-list.c          | 414 ------------------------------
 fs/fscache/object.c               |   8 -
 fs/fscache/operation.c            |   3 -
 fs/fscache/page.c                 |   6 -
 fs/fscache/proc.c                 |  20 +-
 include/linux/fscache-cache.h     |   4 -
 include/linux/fscache.h           |   4 +-
 include/linux/netfs.h             |   2 +-
 include/trace/events/cachefiles.h |  68 ++---
 include/trace/events/fscache.h    | 160 ++++++------
 include/trace/events/netfs.h      |   2 +-
 31 files changed, 367 insertions(+), 998 deletions(-)
 delete mode 100644 fs/cachefiles/proc.c
 delete mode 100644 fs/fscache/histogram.c
 delete mode 100644 fs/fscache/object-list.c


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

