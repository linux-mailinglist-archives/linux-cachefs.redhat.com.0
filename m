Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 28488422127
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Oct 2021 10:49:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633423787;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HsWmOXQLvCb2xaWLBHABV1W3uwAXn5V2O1SQWvfEGwQ=;
	b=N88rd8MVL72XVfDU0F9N4JYtUK7aDMa/t25sVvm29Xzx5fFO2ahN4hhmcbn5BylMeVXFzk
	6NwyKKJykBvkbxliExTwJ2mq+d83roEKLdmDjf5iqvsFeJX7CE6P3XozZjxD87Wh2hYFqk
	eU9Yw1j+meRynPp8LA1je+wIRMk7JQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-xsMFs3N5PMaKnKO3s0vFzA-1; Tue, 05 Oct 2021 04:49:46 -0400
X-MC-Unique: xsMFs3N5PMaKnKO3s0vFzA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14A4B84A5E0;
	Tue,  5 Oct 2021 08:49:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 628EB19723;
	Tue,  5 Oct 2021 08:49:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C7CB1809C84;
	Tue,  5 Oct 2021 08:49:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1958na97016114 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 5 Oct 2021 04:49:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5E17418A8F; Tue,  5 Oct 2021 08:49:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A15360657;
	Tue,  5 Oct 2021 08:49:24 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Tue, 05 Oct 2021 09:49:23 +0100
Message-ID: <163342376338.876192.10313278824682848704.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-doc@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-afs@lists.infradead.org,
	Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
	Mauro Carvalho Chehab <mchehab@kernel.org>, torvalds@linux-foundation.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH v3 0/5] fscache, afs, 9p, nfs: Warning fixes
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Here's a set of warning fixes for fscache, afs, 9p and nfs. It's mostly
kerneldoc fixes plus one unused static variable removal.  I've split the
old patch up into per-subsys chunks and put the variable removal in its own
patch at the end.

The patches are on a branch here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-fixes

Thanks,
David

Changes
=======
ver #3:
 - Dealt with the kerneldoc warnings in fs/9p/cache.c.
 - Split the single patch up.

ver #2:
 - Dropped already upstreamed cifs changes.
 - Fixed more 9p kerneldoc bits.

Link: https://lore.kernel.org/r/163214005516.2945267.7000234432243167892.stgit@warthog.procyon.org.uk/ # rfc v1
Link: https://lore.kernel.org/r/163281899704.2790286.9177774252843775348.stgit@warthog.procyon.org.uk/ # rfc v2
---
David Howells (5):
      nfs: Fix kerneldoc warning shown up by W=1
      afs: Fix kerneldoc warning shown up by W=1
      9p: Fix a bunch of kerneldoc warnings shown up by W=1
      fscache: Fix some kerneldoc warnings shown up by W=1
      fscache: Remove an unused static variable


 fs/9p/cache.c          |  8 ++++----
 fs/9p/fid.c            | 14 +++++++-------
 fs/9p/v9fs.c           |  8 +++-----
 fs/9p/vfs_addr.c       | 14 +++++++++-----
 fs/9p/vfs_file.c       | 33 ++++++++++++---------------------
 fs/9p/vfs_inode.c      | 24 ++++++++++++++++--------
 fs/9p/vfs_inode_dotl.c | 11 +++++++++--
 fs/afs/dir_silly.c     |  4 ++--
 fs/fscache/object.c    |  2 +-
 fs/fscache/operation.c |  3 +++
 10 files changed, 66 insertions(+), 55 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

