Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 398DD232007
	for <lists+linux-cachefs@lfdr.de>; Wed, 29 Jul 2020 16:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596031975;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/bTjBV97lnBvvc9n3e/UJ+8+To+ktOICq8nfDmjVZzc=;
	b=THRalY7hO2TCTVAe3jQkvpP5xmOE50LmkL39SIfh2FJBgnGbnLSj72U+0vk3WmO+1BZIeQ
	dI7g58Ty99qS8NudlCGyobzIwLv52lh76n92GYtAb2NhwL4SWjgDaIJsXeXfRtEqfPqiOT
	QlzIlBZHn+3sP1Wj66nAtPmuQ04gcSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-nwdep66nMgSZJjxJhfFjMA-1; Wed, 29 Jul 2020 10:12:52 -0400
X-MC-Unique: nwdep66nMgSZJjxJhfFjMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89DC359;
	Wed, 29 Jul 2020 14:12:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 803796932A;
	Wed, 29 Jul 2020 14:12:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64D471809554;
	Wed, 29 Jul 2020 14:12:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06TECfFJ020595 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 29 Jul 2020 10:12:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 385B171906; Wed, 29 Jul 2020 14:12:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (ovpn-113-23.rdu2.redhat.com [10.10.113.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D47E371923;
	Wed, 29 Jul 2020 14:12:35 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 29 Jul 2020 10:12:15 -0400
Message-Id: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v2 0/14] Convert NFS to new FS-Cache
	iter API
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
MIME-Version: 1.0
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These patches update the nfs client to use the new FS-Cache API and are at:
https://github.com/DaveWysochanskiRH/kernel/tree/fscache-iter-nfs
https://github.com/DaveWysochanskiRH/kernel/commit/467796a0c75d64401c8963e9266f27d87863ed3e

They are based on David Howells fscache-iter tree at 757ac8b16a0edd3befa15c9bdcb2ab3811be945d
https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?h=fscache-iter&id=757ac8b16a0edd3befa15c9bdcb2ab3811be945d

The first 5 patches refactor some of the NFS read code to facilitate
re-use, while the last 9 patches do the conversion to the new FS-Cache
API.

Changes since v1
* Refactor and general cleanup of read code paths
* Fixes a few build errors when NFS_FSCACHE is not configured
* Fixes directIO data corruption (needed fscache_invalidate() on directIO write)

Summary
* Takes a "least invasive to existing code" approach
  * most fscache bits stay fs/nfs/fscache.[ch]
  * only enable fscache for files open for READ (disable for WRITE)
  * may not be the best approach (see future patcheset items below)
* Basically works and passes a series of tests (see below)
  * No kernel oopses or hangs seen with tests run

Future patchset items
* Call fscache_read_helper_* directly rather than isolation into
  fs/nfs/fscache.c, similar to the AFS conversion
* Add write-through support
  * Eliminate on/off switching of fscache based on whether a
  file is open for read or write
  * TODO: Work out any limitations of NFS versions
* Rework dfprintks and/or add ftrace points
  * fscache/cachefiles has 'debug' logging similar to rpcdebug
  * convert IO path to ftrace, leave non-IO path as dfprintk?

Tests run
* A few individual NFS/fscache unit tests: PASS
* cthon04 (fsc/non-fsc, vers=3,4.0,4.1,4.2, sec=sys): PASS
* iozone tests (fsc, vers=3,4.0,4.1,4.2, sec=sys): PASS
* xfstests/generic (fsc,vers=4.2): 17/151 (Failed/Ran) 595/444 (Total/NotRan)
Failures: generic/029 generic/030 generic/240 generic/294 generic/306 generic/356 generic/357 generic/452 generic/472 generic/493 generic/494 generic/495 generic/496 generic/497 generic/554 generic/568 generic/569
Failed 17 of 595 tests
* kernel build: FAIL (linking module fails; truncate / invalidate related?)

Test not run
* error injections (for example, connection disruptions, server errors during IO, etc)
* pNFS
* many process mixed read/write on same file
* sec=krb5

Dave Wysochanski (14):
  NFS: Clean up nfs_readpage() and nfs_readpages()
  NFS: In nfs_readpage() only increment NFSIOS_READPAGES when read
    succeeds
  NFS: Refactor nfs_readpage() and nfs_readpage_async() to use
    nfs_readdesc
  NFS: Call readpage_async_filler() from nfs_readpage_async()
  NFS: Add nfs_pageio_complete_read() and remove nfs_readpage_async()
  NFS: Allow internal use of read structs and functions
  NFS: Convert nfs_readpage() and readpages() to new fscache API
  NFS: Convert fscache_acquire_cookie and fscache_relinquish_cookie
  NFS: Only use and unuse an fscache cookie a single time based on
    NFS_INO_FSCACHE
  NFS: Convert fscache invalidation and update aux_data and i_size
  NFS: Call nfs_fscache_invalidate() when write extends the size of the
    file
  NFS: Invalidate fscache for direct writes
  NFS: Call fscache_resize_cookie() when inode size changes due to
    setattr
  NFS: Allow NFS use of new fscache API in build

 fs/nfs/Kconfig           |   2 +-
 fs/nfs/direct.c          |   2 +
 fs/nfs/file.c            |  20 +--
 fs/nfs/fscache-index.c   |  94 --------------
 fs/nfs/fscache.c         | 309 +++++++++++++++++++++++------------------------
 fs/nfs/fscache.h         |  99 ++++++---------
 fs/nfs/inode.c           |   4 +-
 fs/nfs/internal.h        |   9 ++
 fs/nfs/nfs4proc.c        |   2 +-
 fs/nfs/pagelist.c        |   1 +
 fs/nfs/read.c            | 217 +++++++++++++++------------------
 fs/nfs/write.c           |   3 +-
 include/linux/nfs_fs.h   |   2 -
 include/linux/nfs_page.h |   1 +
 include/linux/nfs_xdr.h  |   1 +
 15 files changed, 316 insertions(+), 450 deletions(-)

-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

