Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB66546DB6
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Jun 2022 21:56:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654891015;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ok1/9fz6CFMjZyrbAJyZQ/ossTimsJoY/qnF59nfdZg=;
	b=eOv6ocOoH2DBudiHpAz/vjAklTa/LzKOoSebbWukGx/KqUUwK4tRUKoNk4tMxxrYxszBUM
	Gc/4w5GrIgQX9JBuBbjqtxwNUoX5EsSIQzqzcQdSPvZoGqDT+UO5mOT1ZEKdZ0DbWcr9lw
	N1/kjya74868FwCcbF2+Z+66j2Y3UoA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-9_53oQhnMO6x3-6pboOJeg-1; Fri, 10 Jun 2022 15:56:52 -0400
X-MC-Unique: 9_53oQhnMO6x3-6pboOJeg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14FD585A582;
	Fri, 10 Jun 2022 19:56:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D6F62026D64;
	Fri, 10 Jun 2022 19:56:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6BCBD1947057;
	Fri, 10 Jun 2022 19:56:49 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7F4D41947054 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 10 Jun 2022 19:56:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6A8DC40CFD0A; Fri, 10 Jun 2022 19:56:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1B6F40CF8EF;
 Fri, 10 Jun 2022 19:56:46 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
Date: Fri, 10 Jun 2022 20:56:45 +0100
Message-ID: <165489100590.703883.11054313979289027590.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Linux-cachefs] [RFC][PATCH 0/3] netfs, afs: Cleanups
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi Linus,

Here are some cleanups, one for afs and a couple for netfs:

 (1) The afs patch cleans up a checker complaint.

 (2) The first netfs patch is your netfs_inode changes plus the requisite
     documentation changes.

 (3) The second netfs patch replaces the ->cleanup op with a ->free_request
     op.  This is possible as the I/O request is now always available at
     the cleanup point as the stuff to be cleaned up is no longer passed
     into the API functions, but rather obtained by ->init_request.

I've run the patches through xfstests with -g quick on afs.

The patches are on a branch here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-fixes

David

---
David Howells (2):
      afs: Fix some checker issues
      netfs: Rename the netfs_io_request cleanup op and give it an op pointer

Linus Torvalds (1):
      netfs: Further cleanups after struct netfs_inode wrapper introduced


 Documentation/filesystems/netfs_library.rst | 33 +++++++++++----------
 fs/9p/v9fs.h                                |  2 +-
 fs/9p/vfs_addr.c                            | 13 ++++----
 fs/9p/vfs_inode.c                           |  3 +-
 fs/afs/dynroot.c                            |  2 +-
 fs/afs/file.c                               |  6 ++--
 fs/afs/inode.c                              |  2 +-
 fs/afs/internal.h                           |  2 +-
 fs/afs/volume.c                             |  3 +-
 fs/afs/write.c                              |  2 +-
 fs/ceph/addr.c                              | 12 ++++----
 fs/ceph/cache.h                             |  2 +-
 fs/ceph/inode.c                             |  2 +-
 fs/cifs/fscache.h                           |  2 +-
 fs/netfs/buffered_read.c                    |  5 ++--
 fs/netfs/objects.c                          |  6 ++--
 include/linux/netfs.h                       | 25 +++++++---------
 17 files changed, 60 insertions(+), 62 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

