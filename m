Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5CEB74203B0
	for <lists+linux-cachefs@lfdr.de>; Sun,  3 Oct 2021 21:22:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633288977;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J/+0nfYVh0c3E/FkqFE7Fe3psM7XxmwzrQ4h3IUhHE0=;
	b=QzOMCqi8bkHEZ5gSsyXh56jcshlFBkmxrsq5u/polz2zeMyKrYY36YqodCxwt27qE3AHTk
	KstCCHS9IuiTcZHAFy/73NxGPY1JA9weO8rPH7yawHFoZY89SqeK9Q3XOZ7I7nvS4kT6ZN
	vKbythV8c103A9MoJDYsx8XsCMW9MKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-E6e6z2fYMUGOOOc5vz617w-1; Sun, 03 Oct 2021 15:22:56 -0400
X-MC-Unique: E6e6z2fYMUGOOOc5vz617w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BB2A57223;
	Sun,  3 Oct 2021 19:22:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE47260C17;
	Sun,  3 Oct 2021 19:22:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB1331803B30;
	Sun,  3 Oct 2021 19:22:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 193JMhS1025504 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 3 Oct 2021 15:22:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8741E5F4EC; Sun,  3 Oct 2021 19:22:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F7745F4E8;
	Sun,  3 Oct 2021 19:22:40 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	David Howells <dhowells@redhat.com>
Date: Sun,  3 Oct 2021 15:22:31 -0400
Message-Id: <1633288958-8481-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH v1 0/7] Various NFS fscache cleanups
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
MIME-Version: 1.0
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset is on top of David Howells fscache-iter-3 branch, which
he posted v2 recently
https://lore.kernel.org/all/163189104510.2509237.10805032055807259087.stgit@warthog.procyon.org.uk/

The first patch in this series should probably be merged into David Howells
3/8 patch of that series.  Otherwise, these patches are applied on top of
his series, and this series is mostly orthogonal to fscache-iter-3 branch.

The second and third patches are a few cleanups, and the last 4 remove
dfprintks in the NFS fscache code, and add in few new tracepoints.  I am
not sure about the new tracepoints, but I think we need at least a couple
tracepoints with the NFS fscache interface to tie in NFS tracepoints with
fscache and cachefiles ones.

These have been tested with xfstests against various NFS versions (NFS4.0,
NFS4.1, and NFS4.2) and servers (hammerspace, Netapp Ontap 9.x, RHEL8.4),
and all tracepoints enabled per the following:
trace-cmd start -e fscache:* -e nfs:* -e nfs4:* -e cachefiles:*

I plan to use this series at the BakeAThon this week for further testing
and refinement.

Dave Wysochanski (7):
  NFS: Fixup patch 3/8 of fscache-iter-3 v2
  NFS: Use nfs_i_fscache() consistently within NFS fscache code
  NFS: Cleanup usage of nfs_inode in fscache interface and handle i_size
    properly
  NFS: Convert NFS fscache enable/disable dfprintks to tracepoints
  NFS: Replace dfprintks in favor of tracepoints in fscache IO paths
  NFS: Remove remaining dfprintks related to fscache cookies
  NFS: Remove remaining usages of NFSDBG_FSCACHE

 fs/nfs/fscache-index.c      |  2 -
 fs/nfs/fscache.c            | 70 +++++++++-----------------------
 fs/nfs/fscache.h            |  8 ++--
 fs/nfs/nfstrace.h           | 99 +++++++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/nfs_fs.h |  2 +-
 5 files changed, 123 insertions(+), 58 deletions(-)

-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

