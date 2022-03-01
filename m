Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B93D4C947B
	for <lists+linux-cachefs@lfdr.de>; Tue,  1 Mar 2022 20:38:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646163521;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ofxujo7zEB6SWd+01Mumb5ZZSv35JOoyGXSWVo7P2KU=;
	b=IXl2OWHgGmBpNcUYcRKimmsvopC78CAQTTxZgeVzfhEJsAHvt59ImNAec+rhHXlsJxRSp8
	Bjk0kQSBUiLTuJtx2xN70/A/YdKyC8baKQHHg6Z2odb1+9mVo9szs0POQhE5UaL2zCmWso
	VBFG3B3JfYxNSJccu2+v2hBk0U+NAxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-k37GedtPPzaVG6v1uqfPYQ-1; Tue, 01 Mar 2022 14:38:38 -0500
X-MC-Unique: k37GedtPPzaVG6v1uqfPYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 383A4835DE0;
	Tue,  1 Mar 2022 19:38:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED36B1811A;
	Tue,  1 Mar 2022 19:38:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1FF91809CB2;
	Tue,  1 Mar 2022 19:38:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 221JcYmY020362 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 1 Mar 2022 14:38:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2453EADE5; Tue,  1 Mar 2022 19:38:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.9.75])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E3765DF37;
	Tue,  1 Mar 2022 19:38:33 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Date: Tue,  1 Mar 2022 14:37:27 -0500
Message-Id: <20220301193727.18847-5-dwysocha@redhat.com>
In-Reply-To: <20220301193727.18847-1-dwysocha@redhat.com>
References: <20220301193727.18847-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 4/4] NFS: Remove remaining dfprintks related
	to fscache and remove NFSDBG_FSCACHE
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

The NFS fscache interface has removed all dfprintks so remove the
NFSDBG_FSCACHE defines.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/fscache.c            | 10 ----------
 include/uapi/linux/nfs_fs.h |  2 +-
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index 841b69aef189..4dee53ceb941 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -21,8 +21,6 @@
 #include "fscache.h"
 #include "nfstrace.h"
 
-#define NFSDBG_FACILITY		NFSDBG_FSCACHE
-
 #define NFS_MAX_KEY_LEN 1000
 
 static bool nfs_append_int(char *key, int *_len, unsigned long long x)
@@ -129,8 +127,6 @@ int nfs_fscache_get_super_cookie(struct super_block *sb, const char *uniq, int u
 	vcookie = fscache_acquire_volume(key,
 					 NULL, /* preferred_cache */
 					 NULL, 0 /* coherency_data */);
-	dfprintk(FSCACHE, "NFS: get superblock cookie (0x%p/0x%p)\n",
-		 nfss, vcookie);
 	if (IS_ERR(vcookie)) {
 		if (vcookie != ERR_PTR(-EBUSY)) {
 			kfree(key);
@@ -153,9 +149,6 @@ void nfs_fscache_release_super_cookie(struct super_block *sb)
 {
 	struct nfs_server *nfss = NFS_SB(sb);
 
-	dfprintk(FSCACHE, "NFS: releasing superblock cookie (0x%p/0x%p)\n",
-		 nfss, nfss->fscache);
-
 	fscache_relinquish_volume(nfss->fscache, NULL, false);
 	nfss->fscache = NULL;
 	kfree(nfss->fscache_uniq);
@@ -193,8 +186,6 @@ void nfs_fscache_clear_inode(struct inode *inode)
 	struct nfs_inode *nfsi = NFS_I(inode);
 	struct fscache_cookie *cookie = nfs_i_fscache(inode);
 
-	dfprintk(FSCACHE, "NFS: clear cookie (0x%p/0x%p)\n", nfsi, cookie);
-
 	fscache_relinquish_cookie(cookie, false);
 	nfsi->fscache = NULL;
 }
@@ -229,7 +220,6 @@ void nfs_fscache_open_file(struct inode *inode, struct file *filp)
 
 	fscache_use_cookie(cookie, open_for_write);
 	if (open_for_write) {
-		dfprintk(FSCACHE, "NFS: nfsi 0x%p disabling cache\n", nfsi);
 		nfs_fscache_update_auxdata(&auxdata, inode);
 		fscache_invalidate(cookie, &auxdata, i_size_read(inode),
 				   FSCACHE_INVAL_DIO_WRITE);
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
2.27.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

