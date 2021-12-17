Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2EB47932E
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Dec 2021 18:54:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639763688;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pQESXvz3QELWzXLnUDNBHNAmtstU41zO/wqz5WIeFMw=;
	b=TCLcfNZ9wqAFWf+t5LrrnZhGn8pyy6AKSZdrE2QtVF2yiJRPqSFqwRJ9AxOHK6KnGn+VVB
	NC/xpEAP7T02OcSlND83YrA86A96Y330lTXhw+GU/rHFxzQxBxpDuYmXZ3S2J7XXVC3at+
	GQBC27qZj+kXpja+J5LWPME6o6FI/dg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-HyrjMP5_PYigdl3d5eliaA-1; Fri, 17 Dec 2021 12:54:40 -0500
X-MC-Unique: HyrjMP5_PYigdl3d5eliaA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8AF610144E1;
	Fri, 17 Dec 2021 17:54:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41A0278C19;
	Fri, 17 Dec 2021 17:54:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA2191809CB8;
	Fri, 17 Dec 2021 17:54:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BHHsVQp007932 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 17 Dec 2021 12:54:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D39761037F3D; Fri, 17 Dec 2021 17:54:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.133])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 671E41037F39;
	Fri, 17 Dec 2021 17:54:31 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
	David Howells <dhowells@redhat.com>
Date: Fri, 17 Dec 2021 12:54:22 -0500
Message-Id: <1639763665-4917-2-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1639763665-4917-1-git-send-email-dwysocha@redhat.com>
References: <1639763665-4917-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH v2 1/4] NFS: Cleanup usage of nfs_inode in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 fs/nfs/fscache.c | 10 ++++------
 fs/nfs/fscache.h | 18 +++++++++---------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index cfe901650ab0..81bd2770e640 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -173,7 +173,7 @@ void nfs_fscache_init_inode(struct inode *inode)
 	if (!(nfss->fscache && S_ISREG(inode->i_mode)))
 		return;
 
-	nfs_fscache_update_auxdata(&auxdata, nfsi);
+	nfs_fscache_update_auxdata(&auxdata, inode);
 
 	nfsi->fscache = fscache_acquire_cookie(NFS_SB(inode->i_sb)->fscache,
 					       0,
@@ -181,7 +181,7 @@ void nfs_fscache_init_inode(struct inode *inode)
 					       nfsi->fh.size,
 					       &auxdata,      /* aux_data */
 					       sizeof(auxdata),
-					       i_size_read(&nfsi->vfs_inode));
+					       i_size_read(inode));
 }
 
 /*
@@ -220,7 +220,6 @@ void nfs_fscache_clear_inode(struct inode *inode)
 void nfs_fscache_open_file(struct inode *inode, struct file *filp)
 {
 	struct nfs_fscache_inode_auxdata auxdata;
-	struct nfs_inode *nfsi = NFS_I(inode);
 	struct fscache_cookie *cookie = nfs_i_fscache(inode);
 	bool open_for_write = inode_is_open_for_write(inode);
 
@@ -230,7 +229,7 @@ void nfs_fscache_open_file(struct inode *inode, struct file *filp)
 	fscache_use_cookie(cookie, open_for_write);
 	if (open_for_write) {
 		dfprintk(FSCACHE, "NFS: nfsi 0x%p disabling cache\n", nfsi);
-		nfs_fscache_update_auxdata(&auxdata, nfsi);
+		nfs_fscache_update_auxdata(&auxdata, inode);
 		fscache_invalidate(cookie, &auxdata, i_size_read(inode),
 				   FSCACHE_INVAL_DIO_WRITE);
 	}
@@ -240,11 +239,10 @@ void nfs_fscache_open_file(struct inode *inode, struct file *filp)
 void nfs_fscache_release_file(struct inode *inode, struct file *filp)
 {
 	struct nfs_fscache_inode_auxdata auxdata;
-	struct nfs_inode *nfsi = NFS_I(inode);
 	struct fscache_cookie *cookie = nfs_i_fscache(inode);
 
 	if (fscache_cookie_valid(cookie)) {
-		nfs_fscache_update_auxdata(&auxdata, nfsi);
+		nfs_fscache_update_auxdata(&auxdata, inode);
 		fscache_unuse_cookie(cookie, &auxdata, NULL);
 	}
 }
diff --git a/fs/nfs/fscache.h b/fs/nfs/fscache.h
index e0220fc40366..5cf7238e4886 100644
--- a/fs/nfs/fscache.h
+++ b/fs/nfs/fscache.h
@@ -85,16 +85,16 @@ static inline void nfs_readpage_to_fscache(struct inode *inode,
 }
 
 static inline void nfs_fscache_update_auxdata(struct nfs_fscache_inode_auxdata *auxdata,
-					      struct nfs_inode *nfsi)
+					      struct inode *inode)
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
@@ -106,9 +106,9 @@ static inline void nfs_fscache_invalidate(struct inode *inode, int flags)
 	struct nfs_inode *nfsi = NFS_I(inode);
 
 	if (nfsi->fscache) {
-		nfs_fscache_update_auxdata(&auxdata, nfsi);
+		nfs_fscache_update_auxdata(&auxdata, inode);
 		fscache_invalidate(nfsi->fscache, &auxdata,
-				   i_size_read(&nfsi->vfs_inode), flags);
+				   i_size_read(inode), flags);
 	}
 }
 
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

