Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 871EA426066
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Oct 2021 01:33:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633649616;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/SwqNKtnTAtMNeQH5h52fiFnoJecLdJ+li2MFEXeU/Y=;
	b=PUuD5b8XivXUvtudWp5UX1+13cPfI3YI0kYasNFidedvhvZ9nUPFbdBKDkBJm+UEeGrcYK
	nspgHJ27IudFFMmq8IMdU82NgkB2v/7y2sx+2XRqZvZXO3i/KkEk2wnlYt7e4wIq0CYaf3
	eAuAYSBc2lslrOW24QI7hdBBqfI+sUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-ucX-L98BM3iytvfL_5kXEw-1; Thu, 07 Oct 2021 19:33:35 -0400
X-MC-Unique: ucX-L98BM3iytvfL_5kXEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D82CF10A0BF8;
	Thu,  7 Oct 2021 23:32:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 752A519D9D;
	Thu,  7 Oct 2021 23:32:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A4921800B8B;
	Thu,  7 Oct 2021 23:32:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 197NWCnD022244 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 7 Oct 2021 19:32:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 933AD6CA38; Thu,  7 Oct 2021 23:32:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.139])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF4BF6A902;
	Thu,  7 Oct 2021 23:32:10 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Thu,  7 Oct 2021 19:32:07 -0400
Message-Id: <1633649528-1321-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
	Chuck Lever <chuck.lever@oracle.com>, Matthew Wilcox <willy@infradead.org>
Subject: [Linux-cachefs] [PATCH 0/1] Convert nfs_readpages() to
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch converts nfs_readpages() to nfs_readahead().  It was
applied on top of the set I just posted [1] plus Chuck's v1 patch to
convert dfprintks to tracepoints [2].  It is being tested on top of
these patches at BakeAThon against various servers, cthon, xfstests,
and my fscache unit tests.  Note that Chuck may post a v3 of his
patch and this would need rebased on that patch.

Note that a nfs-utils patch will need to be done to properly account
for the changed NFSIOS_* counters.

I would consider this a "nice to have" for this cycle but I wanted
to get it out there sooner than later.  As far as I know this has
been an outstanding item for the NFS client for a while and the
fscache fallback IO API clears the way for this patch.

[1] https://marc.info/?l=linux-nfs&m=163364580324243&w=2
[2] https://marc.info/?l=linux-nfs&m=163345402812426&w=2


Dave Wysochanski (1):
  NFS: Convert from readpages() to readahead()

 fs/nfs/file.c              |  2 +-
 fs/nfs/nfstrace.h          |  2 +-
 fs/nfs/read.c              | 21 +++++++++++++++------
 include/linux/nfs_fs.h     |  3 +--
 include/linux/nfs_iostat.h |  6 +++---
 5 files changed, 21 insertions(+), 13 deletions(-)

-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

