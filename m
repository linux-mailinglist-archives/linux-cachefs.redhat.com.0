Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7F898425FEE
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Oct 2021 00:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633645858;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=se1v8+Z04Gpn4TPOmI0325ZA58GIcoru5XDFj4vZsKg=;
	b=SyN1CksLgmfk8af5WhR4jZRmMy4Zuym7BBQ9rLqkAgeyrIVeFqQhk4IdVc5Ch+g+MIKPvN
	E1qkqZuD3E10C7pWt+ccnlG8QMHk/9GjYQlss7vf6CarXcjvegPto3gdQov2SCPu2P0vpp
	7ebYhy4Jclo7Tgs8F0DfoYfsjmE13wA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-uhtyqVqZPTuDzzn-09oixw-1; Thu, 07 Oct 2021 18:30:51 -0400
X-MC-Unique: uhtyqVqZPTuDzzn-09oixw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEECB801ADA;
	Thu,  7 Oct 2021 22:30:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E08515C1A3;
	Thu,  7 Oct 2021 22:30:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E04C04E9F5;
	Thu,  7 Oct 2021 22:30:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 197MUh9A017870 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 7 Oct 2021 18:30:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CD4C55D9F0; Thu,  7 Oct 2021 22:30:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.139])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F6CE5D9C6;
	Thu,  7 Oct 2021 22:30:25 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	David Howells <dhowells@redhat.com>
Date: Thu,  7 Oct 2021 18:30:16 -0400
Message-Id: <1633645823-31235-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH v2 0/7] Various NFS fscache cleanups
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset is on top of David Howells patchset he just posted as
v3 of "fscache: Replace and remove old I/O API" and is based on his
fscache-remove-old-io branch at
https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-remove-old-io
NOTE: fscache-remove-old-io was previously "fscache-iter-3" but it's been
renamed to better reflect the purpose.

The series is also at:
https://github.com/DaveWysochanskiRH/kernel.git
https://github.com/DaveWysochanskiRH/kernel/tree/fscache-remove-old-io-nfs-fixes

Testing is looking ok so far and is still ongoing at BakeAThon and in
my local testbed with tracepoints enabled via:
trace-cmd start -e fscache:* -e nfs:* -e nfs4:* -e cachefiles:*

Changes in v2 of this series
- Dropped first patch of v1 series (dhowells updated his patch)
- Don't rename or change the value of NFSDBG_FSCACHE (Trond)
- Rename nfs_readpage_from_fscache and nfs_readpage_to_fscache
- Rename enable/disable tracepoints to start with "nfs_fscache"
- Rename fscache IO tracepoints to better reflect the new function names
- Place the fscache IO tracepoints at begin and end of the functions

Dave Wysochanski (7):
  NFS: Use nfs_i_fscache() consistently within NFS fscache code
  NFS: Cleanup usage of nfs_inode in fscache interface and handle i_size
    properly
  NFS: Convert NFS fscache enable/disable dfprintks to tracepoints
  NFS: Rename fscache read and write pages functions
  NFS: Replace dfprintks with tracepoints in read and write page
    functions
  NFS: Remove remaining dfprintks related to fscache cookies
  NFS: Remove remaining usages of NFSDBG_FSCACHE

 fs/nfs/fscache-index.c      |  2 -
 fs/nfs/fscache.c            | 76 +++++++++++++----------------------
 fs/nfs/fscache.h            | 25 ++++++------
 fs/nfs/nfstrace.h           | 98 +++++++++++++++++++++++++++++++++++++++++++++
 fs/nfs/read.c               |  4 +-
 include/uapi/linux/nfs_fs.h |  2 +-
 6 files changed, 140 insertions(+), 67 deletions(-)

-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

