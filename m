Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C42E2427A2B
	for <lists+linux-cachefs@lfdr.de>; Sat,  9 Oct 2021 14:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633782995;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+pfpTaJ9IvoMGPctiO8I4YQm99l2o1DyK4+0oBBL0jE=;
	b=hLt7DXFg/daBzdbOA/cJT0tv/PZWyxalqFxpx3lFLHOkvBlxaRwHDN1MipYqkTRQc+ULyY
	zsfJju52+xNwNIsmfM22Y7iet76g6I+UOJp5IM6NOWHec49XOy3A7wnivuMv2gCd8FJcn3
	zZqAkiWEdkK5LTu6Sg06m9X34Bmbvlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-BVAgCPRKMUWu3zj9UmSrbg-1; Sat, 09 Oct 2021 08:36:26 -0400
X-MC-Unique: BVAgCPRKMUWu3zj9UmSrbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF6FC5127;
	Sat,  9 Oct 2021 12:36:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2D62652A5;
	Sat,  9 Oct 2021 12:36:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C2371809C81;
	Sat,  9 Oct 2021 12:36:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 199CaM49032469 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 9 Oct 2021 08:36:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B886810027C4; Sat,  9 Oct 2021 12:36:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9495110016FF;
	Sat,  9 Oct 2021 12:36:04 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Sat,  9 Oct 2021 08:36:01 -0400
Message-Id: <1633782962-18335-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
	Chuck Lever <chuck.lever@oracle.com>, Matthew Wilcox <willy@infradead.org>
Subject: [Linux-cachefs] [PATCH v2 0/1] Convert nfs_readpages() to
	nfs_readahead()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch converts nfs_readpages() to nfs_readahead().  It was
applied as follows:
0. Start with trond's testing branch at
0abb8895b065 NFS: Fix an Oops in pnfs_mark_request_commit()
1. Apply David Howells v3 of "fscache: Replace and remove old I/O API" [1]
2. Apply my fscache patches v2 of "Various NFS fscache cleanups" [2]
3. Apply Chucks v3 of "NFS: Replace dprintk callsites in nfs_readpage(s)"
plus one fixup (remove the "read_complete:" label in last hunk, which
conflicts with #2) [3]
4. Apply this patch

So far the existing BakeAThon tests have gone well with no oops or any
failure differences in xfstests (generic) between 5.15.0-rc4 and kernel
with #2 and #3 above.  I will continue testing now with all patches as
described above (#1 - #5).

As far as I know this has been an outstanding item for the NFS client
for a while and the fscache fallback IO API clears the way for this
patch.

I also just posted a v2 of the nfs-utils patch to display a "VFS readahead"
count rather than a readpages count [4].

[1] https://marc.info/?l=linux-nfs&m=163363955619832&w=2
[2] https://marc.info/?l=linux-nfs&m=163364580324243&w=2
[3] https://marc.info/?l=linux-nfs&m=163370503223875&w=2
[4] https://marc.info/?l=linux-nfs&m=163378240328297&w=2

Dave Wysochanski (1):
  NFS: Convert from readpages() to readahead()

 fs/nfs/file.c              |  2 +-
 fs/nfs/read.c              | 18 +++++++++++++-----
 include/linux/nfs_fs.h     |  3 +--
 include/linux/nfs_iostat.h |  6 +++---
 4 files changed, 18 insertions(+), 11 deletions(-)

-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

