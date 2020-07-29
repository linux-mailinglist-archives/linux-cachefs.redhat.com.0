Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A2ECA232017
	for <lists+linux-cachefs@lfdr.de>; Wed, 29 Jul 2020 16:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596032006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xG3oxvZ/UMcv+AVfwd2fmTwjnydXjgkkd4mTwLtP68Q=;
	b=MUDx5+YuPHCxWunxuDXTJyNXYXt/M+0N++aQsp/+uYZk9Aodic9BO2qZ8c3XIGy5o85vlY
	PKDIrZ/tsyrbYCayGm57/ez3V0Z0lyz52+oeQViWUPBiWJ+/v6sCW0BMkmKLBOY4zIHKww
	sI/vQmIgFlmSa+txs3xBdb5ycBvsxmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-k4NEdf5ZNHO21uvHSjM57w-1; Wed, 29 Jul 2020 10:13:24 -0400
X-MC-Unique: k4NEdf5ZNHO21uvHSjM57w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CA9E80BCAB;
	Wed, 29 Jul 2020 14:13:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D40910013C4;
	Wed, 29 Jul 2020 14:13:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A79E95A71;
	Wed, 29 Jul 2020 14:13:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06TECmZI020706 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 29 Jul 2020 10:12:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E468E71906; Wed, 29 Jul 2020 14:12:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (ovpn-113-23.rdu2.redhat.com [10.10.113.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C90371927;
	Wed, 29 Jul 2020 14:12:48 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 29 Jul 2020 10:12:27 -0400
Message-Id: <1596031949-26793-13-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
References: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v2 12/14] NFS: Invalidate fscache for
	direct writes
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We must call into fscache to invalidate when doing a direct write.
This fixes issues seen with NFSv4.x when direct writes are
followed by non-direct (buffered) reads.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/direct.c   | 2 ++
 fs/nfs/file.c     | 2 +-
 fs/nfs/fscache.h  | 6 +++---
 fs/nfs/inode.c    | 2 +-
 fs/nfs/nfs4proc.c | 2 +-
 fs/nfs/write.c    | 2 +-
 6 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/fs/nfs/direct.c b/fs/nfs/direct.c
index 3d113cf8908a..3360e161dbf1 100644
--- a/fs/nfs/direct.c
+++ b/fs/nfs/direct.c
@@ -59,6 +59,7 @@
 #include "internal.h"
 #include "iostat.h"
 #include "pnfs.h"
+#include "fscache.h"
 
 #define NFSDBG_FACILITY		NFSDBG_VFS
 
@@ -967,6 +968,7 @@ ssize_t nfs_file_direct_write(struct kiocb *iocb, struct iov_iter *iter)
 	} else {
 		result = requested;
 	}
+	nfs_fscache_invalidate(inode, FSCACHE_INVAL_DIO_WRITE);
 out_release:
 	nfs_direct_req_release(dreq);
 out:
diff --git a/fs/nfs/file.c b/fs/nfs/file.c
index 7af528c423c0..0f65617f84c9 100644
--- a/fs/nfs/file.c
+++ b/fs/nfs/file.c
@@ -414,7 +414,7 @@ static void nfs_invalidate_page(struct page *page, unsigned int offset,
 	/* Cancel any unstarted writes on this page */
 	nfs_wb_page_cancel(page_file_mapping(page)->host, page);
 	wait_on_page_fscache(page);
-	nfs_fscache_invalidate(page_file_mapping(page)->host);
+	nfs_fscache_invalidate(page_file_mapping(page)->host, 0);
 }
 
 /*
diff --git a/fs/nfs/fscache.h b/fs/nfs/fscache.h
index de060f61cadd..7bc2f364a931 100644
--- a/fs/nfs/fscache.h
+++ b/fs/nfs/fscache.h
@@ -150,7 +150,7 @@ static inline void nfs_fscache_update_auxdata(struct nfs_fscache_inode_auxdata *
 /*
  * Invalidate the contents of fscache for this inode.  This will not sleep.
  */
-static inline void nfs_fscache_invalidate(struct inode *inode)
+static inline void nfs_fscache_invalidate(struct inode *inode, int flags)
 {
 	struct nfs_fscache_inode_auxdata auxdata;
 	struct nfs_inode *nfsi = NFS_I(inode);
@@ -158,7 +158,7 @@ static inline void nfs_fscache_invalidate(struct inode *inode)
 	if (nfsi->fscache) {
 		nfs_fscache_update_auxdata(&auxdata, nfsi);
 		fscache_invalidate(nfsi->fscache, &auxdata,
-				   i_size_read(&nfsi->vfs_inode), 0);
+				   i_size_read(&nfsi->vfs_inode), flags);
 	}
 }
 
@@ -202,7 +202,7 @@ static inline int nfs_readpages_from_fscache(struct nfs_open_context *ctx,
 static inline void nfs_read_completion_to_fscache(struct nfs_pgio_header *hdr,
 						  unsigned long bytes) {}
 
-static inline void nfs_fscache_invalidate(struct inode *inode) {}
+static inline void nfs_fscache_invalidate(struct inode *inode, int flags) {}
 
 static inline const char *nfs_server_fscache_state(struct nfs_server *server)
 {
diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index b9a84f1c1a5c..45067303348c 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -211,7 +211,7 @@ static void nfs_set_cache_invalid(struct inode *inode, unsigned long flags)
 		flags &= ~(NFS_INO_INVALID_DATA|NFS_INO_DATA_INVAL_DEFER);
 	nfsi->cache_validity |= flags;
 	if (flags & NFS_INO_INVALID_DATA)
-		nfs_fscache_invalidate(inode);
+		nfs_fscache_invalidate(inode, 0);
 }
 
 /*
diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index e32717fd1169..2602fd633e56 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -1179,7 +1179,7 @@ int nfs4_call_sync(struct rpc_clnt *clnt,
 	nfsi->read_cache_jiffies = timestamp;
 	nfsi->attr_gencount = nfs_inc_attr_generation_counter();
 	nfsi->cache_validity &= ~NFS_INO_INVALID_CHANGE;
-	nfs_fscache_invalidate(dir);
+	nfs_fscache_invalidate(dir, 0);
 }
 
 static void
diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index 2da99814da51..0de914a581d2 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -290,7 +290,7 @@ static void nfs_grow_file(struct page *page, unsigned int offset, unsigned int c
 		goto out;
 	i_size_write(inode, end);
 	NFS_I(inode)->cache_validity &= ~NFS_INO_INVALID_SIZE;
-	nfs_fscache_invalidate(inode);
+	nfs_fscache_invalidate(inode, 0);
 	nfs_inc_stats(inode, NFSIOS_EXTENDWRITE);
 out:
 	spin_unlock(&inode->i_lock);
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

