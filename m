Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 85D3323468B
	for <lists+linux-cachefs@lfdr.de>; Fri, 31 Jul 2020 15:05:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-m1j1pvngM9eZIcWOiwpk4Q-1; Fri, 31 Jul 2020 09:05:29 -0400
X-MC-Unique: m1j1pvngM9eZIcWOiwpk4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87B2B106B242;
	Fri, 31 Jul 2020 13:05:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78E3A7C0E7;
	Fri, 31 Jul 2020 13:05:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63A881809557;
	Fri, 31 Jul 2020 13:05:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06VD4U9Y009879 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 31 Jul 2020 09:04:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 08E7F2166B27; Fri, 31 Jul 2020 13:04:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEB332166BA4
	for <linux-cachefs@redhat.com>; Fri, 31 Jul 2020 13:04:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E8D2801180
	for <linux-cachefs@redhat.com>; Fri, 31 Jul 2020 13:04:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-139-YFr2U6OJNemG-Nf6aft-kA-1;
	Fri, 31 Jul 2020 09:04:24 -0400
X-MC-Unique: YFr2U6OJNemG-Nf6aft-kA-1
Received: from tleilax.com (68-20-15-154.lightspeed.rlghnc.sbcglobal.net
	[68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D859B2245C;
	Fri, 31 Jul 2020 13:04:22 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 31 Jul 2020 09:04:10 -0400
Message-Id: <20200731130421.127022-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06VD4U9Y009879
X-loop: linux-cachefs@redhat.com
Cc: idryomov@gmail.com, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v2 00/11] ceph: convert to new FSCache
	API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset converts ceph to use the new (not yet merged) FSCache API.
Trying to use fscache+ceph today usually results in oopses. With this
series, it seems to be quite stable.

Where possible, I've converted the code to use the new read helper,
which hides away a lot of the gory details of page handling, which I think
makes the resulting code clearer than it was.

It starts with a few cleanup/reorganization patches to prepare the code. I then
rip out most of the old ceph fscache helpers and replace them with new
ones for the new API.

The rest of the series then plugs buffered read/write caching support
back into the code, with the most of the read-side routines using the
fscache_read_helper.

This passes xfstests' quick group run with the cache disabled. With it
enabled, it passed most of it, but I hit some OOM kills on generic/531.
Still tracking that bit down, but we suspect the problem is in
fscache/cachefiles code and not in these patches.

This is based on top of David's latest fscache-iter branch:

    https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-iter

...my branch is here:

    https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/log/?h=ceph-fscache-iter

Jeff Layton (11):
  ceph: break out writeback of incompatible snap context to separate
    function
  ceph: don't call ceph_update_writeable_page from page_mkwrite
  ceph: fold ceph_sync_readpages into ceph_readpage
  ceph: fold ceph_sync_writepages into writepage_nounlock
  ceph: fold ceph_update_writeable_page into ceph_write_begin
  ceph: conversion to new fscache API
  ceph: convert readpage to fscache read helper
  ceph: plug write_begin into read helper
  ceph: convert readpages to fscache_read_helper
  ceph: add fscache writeback support
  ceph: re-enable fscache support

 fs/ceph/Kconfig |   4 +-
 fs/ceph/addr.c  | 939 +++++++++++++++++++++++++++---------------------
 fs/ceph/cache.c | 290 ++++-----------
 fs/ceph/cache.h | 106 ++----
 fs/ceph/caps.c  |  11 +-
 fs/ceph/file.c  |  13 +-
 fs/ceph/inode.c |  14 +-
 fs/ceph/super.h |   1 -
 8 files changed, 645 insertions(+), 733 deletions(-)

-- 
2.26.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

