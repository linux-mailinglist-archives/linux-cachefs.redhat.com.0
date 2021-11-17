Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0763445503E
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Nov 2021 23:17:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637187458;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=otVZ8RGnw8t1RFmlz41jS0D37Jr14FSkbDKsiBDi7cQ=;
	b=MAMQ8oJ2WDhOw6UyC1yfOG4ERnNFLYO/sfWeLx1wGPAhOmMg3W8uPCWJPkyO7MFlWNPTEC
	YNDiNUPId7Jc0LbbUQ7IsecvFwuUcZDXGKNhPw4COthkwFP29M1VGUo1iMp8k/wQOpwnY2
	IPLCa5/4rAZoaL6l/nTxY3broVvXUfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-dXrUr_wGPoiJ9PigrXTRYA-1; Wed, 17 Nov 2021 17:17:34 -0500
X-MC-Unique: dXrUr_wGPoiJ9PigrXTRYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F8F2100C66C;
	Wed, 17 Nov 2021 22:17:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72C3C60BF1;
	Wed, 17 Nov 2021 22:17:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C7754EA29;
	Wed, 17 Nov 2021 22:17:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHMHSqH031026 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 17:17:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F10CF197FC; Wed, 17 Nov 2021 22:17:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.32.4])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7255C604CC;
	Wed, 17 Nov 2021 22:17:28 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 17 Nov 2021 17:17:17 -0500
Message-Id: <1637187438-18858-7-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1637187438-18858-1-git-send-email-dwysocha@redhat.com>
References: <1637187438-18858-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 6/7] NFS: Remove remaining dfprintks related
	to fscache cookies
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

The fscache cookie APIs including fscache_acquire_cookie() and
fscache_relinquish_cookie() now have very good tracing.  Thus,
there is no real need for dfprintks in the NFS fscache interface.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/fscache.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index f4147a7915bd..e62629feeebf 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -21,7 +21,7 @@
 #include "fscache.h"
 #include "nfstrace.h"
 
-#define NFSDBG_FACILITY		NFSDBG_FSCACHE
+#define NFSDBG_FACILITY                NFSDBG_FSCACHE
 
 static struct rb_root nfs_fscache_keys = RB_ROOT;
 static DEFINE_SPINLOCK(nfs_fscache_keys_lock);
@@ -86,8 +86,6 @@ void nfs_fscache_get_client_cookie(struct nfs_client *clp)
 					      &key, len,
 					      NULL, 0,
 					      clp, 0, true);
-	dfprintk(FSCACHE, "NFS: get client cookie (0x%p/0x%p)\n",
-		 clp, clp->fscache);
 }
 
 /*
@@ -95,9 +93,6 @@ void nfs_fscache_get_client_cookie(struct nfs_client *clp)
  */
 void nfs_fscache_release_client_cookie(struct nfs_client *clp)
 {
-	dfprintk(FSCACHE, "NFS: releasing client cookie (0x%p/0x%p)\n",
-		 clp, clp->fscache);
-
 	fscache_relinquish_cookie(clp->fscache, NULL, false);
 	clp->fscache = NULL;
 }
@@ -191,8 +186,6 @@ void nfs_fscache_get_super_cookie(struct super_block *sb, const char *uniq, int
 					       sizeof(key->key) + ulen,
 					       NULL, 0,
 					       nfss, 0, true);
-	dfprintk(FSCACHE, "NFS: get superblock cookie (0x%p/0x%p)\n",
-		 nfss, nfss->fscache);
 	return;
 
 non_unique:
@@ -211,9 +204,6 @@ void nfs_fscache_release_super_cookie(struct super_block *sb)
 {
 	struct nfs_server *nfss = NFS_SB(sb);
 
-	dfprintk(FSCACHE, "NFS: releasing superblock cookie (0x%p/0x%p)\n",
-		 nfss, nfss->fscache);
-
 	fscache_relinquish_cookie(nfss->fscache, NULL, false);
 	nfss->fscache = NULL;
 
@@ -270,8 +260,6 @@ void nfs_fscache_clear_inode(struct inode *inode)
 	struct nfs_inode *nfsi = NFS_I(inode);
 	struct fscache_cookie *cookie = nfs_i_fscache(inode);
 
-	dfprintk(FSCACHE, "NFS: clear cookie (0x%p/0x%p)\n", nfsi, cookie);
-
 	nfs_fscache_update_auxdata(&auxdata, inode);
 	fscache_relinquish_cookie(cookie, &auxdata, false);
 	nfsi->fscache = NULL;
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

