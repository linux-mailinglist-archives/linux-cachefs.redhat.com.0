Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 729DC425FE7
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Oct 2021 00:30:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633645854;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4FtdDCfaOg/DVR+vOOu15tMOm9kwXPCNiziP35vUiFc=;
	b=OB7OKEsj/aQ39AKHHw1epcRha59dz9aUqz1o1DN5SWZ/DMOmK2/cI6vyjWUdZUyZcDSI/i
	nzOliWN9FKtudzZL3dwdR+ZpIiadIadwkF3+666t6pF4TKJd2iLiEweIGMkvFzUP+3bSrO
	+BR82UGIWSz5pSyZoExzBrF6Mjqbhd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-E_wxchMkNIWRjIbqQuiCwg-1; Thu, 07 Oct 2021 18:30:52 -0400
X-MC-Unique: E_wxchMkNIWRjIbqQuiCwg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B3F810A8E06;
	Thu,  7 Oct 2021 22:30:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ED895BAE1;
	Thu,  7 Oct 2021 22:30:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BFCC4EA30;
	Thu,  7 Oct 2021 22:30:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 197MUnef017931 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 7 Oct 2021 18:30:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 11D405DEFB; Thu,  7 Oct 2021 22:30:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.139])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 741215D9C6;
	Thu,  7 Oct 2021 22:30:48 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	David Howells <dhowells@redhat.com>
Date: Thu,  7 Oct 2021 18:30:23 -0400
Message-Id: <1633645823-31235-8-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1633645823-31235-1-git-send-email-dwysocha@redhat.com>
References: <1633645823-31235-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH v2 7/7] NFS: Remove remaining usages of
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
index 4bd5ce736193..71bb4270641f 100644
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
index 06c4d8ee7281..57cc242ae916 100644
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

