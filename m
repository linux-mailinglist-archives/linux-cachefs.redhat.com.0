Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE2443978A
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Oct 2021 15:26:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-_o-kuIbcNOW6suiUqwyJ9g-1; Mon, 25 Oct 2021 09:26:42 -0400
X-MC-Unique: _o-kuIbcNOW6suiUqwyJ9g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 738CE1006AA6;
	Mon, 25 Oct 2021 13:26:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DE9D5BAE2;
	Mon, 25 Oct 2021 13:26:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 451464EA3B;
	Mon, 25 Oct 2021 13:26:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19PDOv0l002837 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 25 Oct 2021 09:24:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8DE764010FF0; Mon, 25 Oct 2021 13:24:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 896C1400DEF8
	for <linux-cachefs@redhat.com>; Mon, 25 Oct 2021 13:24:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 717B71066684
	for <linux-cachefs@redhat.com>; Mon, 25 Oct 2021 13:24:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-190-0jpgSBDaO_6vG4gHplrDxg-1;
	Mon, 25 Oct 2021 09:24:55 -0400
X-MC-Unique: 0jpgSBDaO_6vG4gHplrDxg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6DA060724;
	Mon, 25 Oct 2021 13:24:53 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Mon, 25 Oct 2021 09:24:50 -0400
Message-Id: <20211025132452.101591-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH 0/2] ceph: conversion to fscache API rewrite
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

Last week, David Howells posted a set of patches to modernize fscache
and cachefiles [1] (and in the process fix a ton of bugs). The patches
in this set convert ceph over to use the new API.

The first patch in this series switches ceph over to use the new API.
The second patch adds support for caching files that are open for write.

I've tested caching and non-caching setups with xfstests and it seems to
work well. The only remaining issue I see is that sometimes fsstress
will cause the cachefiles backend fs to fill up. When this happens, the
cache goes offline, but everything otherwise keeps working.

This is still an improvement over the existing code, however, and I
think that problem may be solveable by a more aggressive culling cycle.

[1]: https://lore.kernel.org/ceph-devel/CAHk-=wi7K64wo4PtROxq_cLhfq-c-3aCbW5CjRfnKYA439YFUw@mail.gmail.com/T/#t

Jeff Layton (2):
  ceph: conversion to new fscache API
  ceph: add fscache writeback support

 fs/ceph/Kconfig |   2 +-
 fs/ceph/addr.c  |  98 +++++++++++++++++++-----
 fs/ceph/cache.c | 196 +++++++++++++++++++++---------------------------
 fs/ceph/cache.h |  96 +++++++++++++++++-------
 fs/ceph/caps.c  |   3 +-
 fs/ceph/file.c  |  13 +++-
 fs/ceph/inode.c |  22 ++++--
 fs/ceph/super.c |  10 +--
 fs/ceph/super.h |   4 +-
 9 files changed, 263 insertions(+), 181 deletions(-)

-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

