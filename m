Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4841E45503C
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Nov 2021 23:17:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637187457;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Pee8IylQ95myklcWfX7M5UqH7Gy2SCaodkDtk1CECvw=;
	b=DXGt/pFrX8aUYxg3IBw4ZG4+1JMgN2hYY2AubDH6FXx+WArlGMzM5W04KikC+iYXJGy+hS
	14ea4lz21JpXKKjE6mts+ITGJZ2BH7Psi85lJ41bxQn9lZgZ+ZHCcgfq0MU/+WxQqgLeIp
	HFxHXPt3gyXfv/8n12XqecPlDNLTgAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-C1OheA2MMhC6EDP_sh3o-w-1; Wed, 17 Nov 2021 17:17:34 -0500
X-MC-Unique: C1OheA2MMhC6EDP_sh3o-w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDC2C87D549;
	Wed, 17 Nov 2021 22:17:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B78B26DC0;
	Wed, 17 Nov 2021 22:17:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 209834A702;
	Wed, 17 Nov 2021 22:17:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHMHO2B030978 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 17:17:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CF1B2604CC; Wed, 17 Nov 2021 22:17:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.32.4])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2070460657;
	Wed, 17 Nov 2021 22:17:20 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 17 Nov 2021 17:17:11 -0500
Message-Id: <1637187438-18858-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 0/7] Cleanups for NFS fscache and convert
	from dfprintk to trace events
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

The first 3 patches are cleanups and refactorings of the NFS fscache code.
The last 4 patches convert dfprintks to trace events in the NFS fscache code.
These patches were built / tested on 5.16.0-rc1.

Dave Wysochanski (7):
  NFS: Use nfs_i_fscache() consistently within NFS fscache code
  NFS: Cleanup usage of nfs_inode in fscache interface and handle i_size
    properly
  NFS: Rename fscache read and write pages functions
  NFS: Convert NFS fscache enable/disable dfprintks to tracepoints
  NFS: Replace dfprintks with tracepoints in fscache read and write page
    functions
  NFS: Remove remaining dfprintks related to fscache cookies
  NFS: Remove remaining usages of NFSDBG_FSCACHE

 fs/nfs/fscache-index.c      |   2 -
 fs/nfs/fscache.c            | 106 ++++++++++++++++----------------------------
 fs/nfs/fscache.h            |  33 +++++++-------
 fs/nfs/nfstrace.h           | 103 ++++++++++++++++++++++++++++++++++++++++++
 fs/nfs/read.c               |   6 +--
 include/uapi/linux/nfs_fs.h |   2 +-
 6 files changed, 162 insertions(+), 90 deletions(-)

-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

