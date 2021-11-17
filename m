Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D2B455045
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Nov 2021 23:17:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637187459;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TCNlb8QgPbT/MuuF+WPuKblfJ3K9XQtFn0vKyzUK7Gw=;
	b=QS714DCfyVR6kVbl2C7jRf848+oipM8i93mwHszZ9vosUM4SyxhwjlZgMgGSCvGvtAvXdg
	gOU88+ONDVUJHgJjEsu2JSJ8x34AF9lUBbv5cDftiddKYb72La0M0skonzFHYadpR7F/Gz
	brUGlQKZU2KpCXR9lOXEY80JSiCa3u4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-3t760IRVMbqf4WBmpwXb2A-1; Wed, 17 Nov 2021 17:17:35 -0500
X-MC-Unique: 3t760IRVMbqf4WBmpwXb2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7A5A87D545;
	Wed, 17 Nov 2021 22:17:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A863F5C22B;
	Wed, 17 Nov 2021 22:17:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28AEF180BAD2;
	Wed, 17 Nov 2021 22:17:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHMHQ1Y030991 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 17:17:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 438A5604CC; Wed, 17 Nov 2021 22:17:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.32.4])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B770760657;
	Wed, 17 Nov 2021 22:17:25 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 17 Nov 2021 17:17:13 -0500
Message-Id: <1637187438-18858-3-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1637187438-18858-1-git-send-email-dwysocha@redhat.com>
References: <1637187438-18858-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 2/7] NFS: Cleanup usage of nfs_inode in
	fscache interface and handle i_size properly
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A number of places in the fscache interface used nfs_inode when inode could
be used, simplifying the code.  Also, handle the read of i_size properly by
utilizing the i_size_read() interface.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/fscache.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index d743629e05e1..ebc91e4b7655 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -226,16 +226,16 @@ void nfs_fscache_release_super_cookie(struct super_block *sb)
 }
 
 static void nfs_fscache_update_auxdata(struct nfs_fscache_inode_auxdata *auxdata,
-				  struct nfs_inode *nfsi)
+				  struct inode *inode)
 {
 	memset(auxdata, 0, sizeof(*auxdata));
-	auxdata->mtime_sec  = nfsi->vfs_inode.i_mtime.tv_sec;
-	auxdata->mtime_nsec = nfsi->vfs_inode.i_mtime.tv_nsec;
-	auxdata->ctime_sec  = nfsi->vfs_inode.i_ctime.tv_sec;
-	auxdata->ctime_nsec = nfsi->vfs_inode.i_ctime.tv_nsec;
+	auxdata->mtime_sec  = inode->i_mtime.tv_sec;
+	auxdata->mtime_nsec = inode->i_mtime.tv_nsec;
+	auxdata->ctime_sec  = inode->i_ctime.tv_sec;
+	auxdata->ctime_nsec = inode->i_ctime.tv_nsec;
 
-	if (NFS_SERVER(&nfsi->vfs_inode)->nfs_client->rpc_ops->version == 4)
-		auxdata->change_attr = inode_peek_iversion_raw(&nfsi->vfs_inode);
+	if (NFS_SERVER(inode)->nfs_client->rpc_ops->version == 4)
+		auxdata->change_attr = inode_peek_iversion_raw(inode);
 }
 
 /*
@@ -251,13 +251,13 @@ void nfs_fscache_init_inode(struct inode *inode)
 	if (!(nfss->fscache && S_ISREG(inode->i_mode)))
 		return;
 
-	nfs_fscache_update_auxdata(&auxdata, nfsi);
+	nfs_fscache_update_auxdata(&auxdata, inode);
 
 	nfsi->fscache = fscache_acquire_cookie(NFS_SB(inode->i_sb)->fscache,
 					       &nfs_fscache_inode_object_def,
 					       nfsi->fh.data, nfsi->fh.size,
 					       &auxdata, sizeof(auxdata),
-					       nfsi, nfsi->vfs_inode.i_size, false);
+					       nfsi, i_size_read(inode), false);
 }
 
 /*
@@ -271,7 +271,7 @@ void nfs_fscache_clear_inode(struct inode *inode)
 
 	dfprintk(FSCACHE, "NFS: clear cookie (0x%p/0x%p)\n", nfsi, cookie);
 
-	nfs_fscache_update_auxdata(&auxdata, nfsi);
+	nfs_fscache_update_auxdata(&auxdata, inode);
 	fscache_relinquish_cookie(cookie, &auxdata, false);
 	nfsi->fscache = NULL;
 }
@@ -311,7 +311,7 @@ void nfs_fscache_open_file(struct inode *inode, struct file *filp)
 	if (!fscache_cookie_valid(cookie))
 		return;
 
-	nfs_fscache_update_auxdata(&auxdata, nfsi);
+	nfs_fscache_update_auxdata(&auxdata, inode);
 
 	if (inode_is_open_for_write(inode)) {
 		dfprintk(FSCACHE, "NFS: nfsi 0x%p disabling cache\n", nfsi);
@@ -320,7 +320,7 @@ void nfs_fscache_open_file(struct inode *inode, struct file *filp)
 		fscache_uncache_all_inode_pages(cookie, inode);
 	} else {
 		dfprintk(FSCACHE, "NFS: nfsi 0x%p enabling cache\n", nfsi);
-		fscache_enable_cookie(cookie, &auxdata, nfsi->vfs_inode.i_size,
+		fscache_enable_cookie(cookie, &auxdata, i_size_read(inode),
 				      nfs_fscache_can_enable, inode);
 		if (fscache_cookie_enabled(cookie))
 			set_bit(NFS_INO_FSCACHE, &NFS_I(inode)->flags);
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

