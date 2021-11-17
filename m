Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E83E455044
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Nov 2021 23:17:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637187459;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B0JiTpVz34sugknhO54SD52kaRHvbJxsOOMnu4Lt9lQ=;
	b=JY3bvLi/59LfNFyIlU44TJeqomjUhBRucA/hDusXgessaCYTqMmDaed/KlbXKM2oO2YmXj
	z/BxG+zMCkgCv/N7fppFm0t8pTQY7etQRZGN71g/eF/BgzhbUHWCNq5rccpq3cDmUTl022
	ibhPRgvnk+38laPXQu7SzpNbikiCdZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-AImrIL8MNn2PK6c58E9x_Q-1; Wed, 17 Nov 2021 17:17:35 -0500
X-MC-Unique: AImrIL8MNn2PK6c58E9x_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCE9E1017970;
	Wed, 17 Nov 2021 22:17:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0B1610246F8;
	Wed, 17 Nov 2021 22:17:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF2CC4EA29;
	Wed, 17 Nov 2021 22:17:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHMHTpP031043 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 17:17:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A7B2C604CC; Wed, 17 Nov 2021 22:17:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.32.4])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2486F60657;
	Wed, 17 Nov 2021 22:17:29 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 17 Nov 2021 17:17:18 -0500
Message-Id: <1637187438-18858-8-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1637187438-18858-1-git-send-email-dwysocha@redhat.com>
References: <1637187438-18858-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 7/7] NFS: Remove remaining usages of
	NFSDBG_FSCACHE
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The NFS fscache interface has removed all dfprintks so remove the
NFSDBG_FSCACHE defines.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/fscache-index.c      | 2 --
 fs/nfs/fscache.c            | 2 --
 include/uapi/linux/nfs_fs.h | 2 +-
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/nfs/fscache-index.c b/fs/nfs/fscache-index.c
index 573b1da9342c..4205fb031fae 100644
--- a/fs/nfs/fscache-index.c
+++ b/fs/nfs/fscache-index.c
@@ -17,8 +17,6 @@
 #include "internal.h"
 #include "fscache.h"
 
-#define NFSDBG_FACILITY		NFSDBG_FSCACHE
-
 /*
  * Define the NFS filesystem for FS-Cache.  Upon registration FS-Cache sticks
  * the cookie for the top-level index object for NFS into here.  The top-level
diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index e62629feeebf..e21ab23fa8d0 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -21,8 +21,6 @@
 #include "fscache.h"
 #include "nfstrace.h"
 
-#define NFSDBG_FACILITY                NFSDBG_FSCACHE
-
 static struct rb_root nfs_fscache_keys = RB_ROOT;
 static DEFINE_SPINLOCK(nfs_fscache_keys_lock);
 
diff --git a/include/uapi/linux/nfs_fs.h b/include/uapi/linux/nfs_fs.h
index 3afe3767c55d..ae0de165c014 100644
--- a/include/uapi/linux/nfs_fs.h
+++ b/include/uapi/linux/nfs_fs.h
@@ -52,7 +52,7 @@
 #define NFSDBG_CALLBACK		0x0100
 #define NFSDBG_CLIENT		0x0200
 #define NFSDBG_MOUNT		0x0400
-#define NFSDBG_FSCACHE		0x0800
+#define NFSDBG_FSCACHE		0x0800 /* unused */
 #define NFSDBG_PNFS		0x1000
 #define NFSDBG_PNFS_LD		0x2000
 #define NFSDBG_STATE		0x4000
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

