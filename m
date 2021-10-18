Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9AD4321FB
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 17:07:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569665;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LQmy1BBG+KIqMK+esi6E4BYhUxSUHagRh9Qneqc3iy4=;
	b=JfW8ce607gVdU7fa0E5zHNZrKuCiKSU6w/bHQ9xMThWK3BjY7icSbH7vF708RR7dX1sx5t
	45UFS694VSnKk1vzRoW/NplDapLFDiVM1nLtZr7tv9d0J8JsH3VbbqFJpunUgtGincxsyE
	Eeea/0tJJvkVO1VHwoxPpgzK+peiqvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-CBWm-c59OWC6eneyK2tYoA-1; Mon, 18 Oct 2021 11:07:41 -0400
X-MC-Unique: CBWm-c59OWC6eneyK2tYoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1DBA1082FA1;
	Mon, 18 Oct 2021 15:07:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFF9060CD1;
	Mon, 18 Oct 2021 15:07:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB4FB1806D03;
	Mon, 18 Oct 2021 15:07:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IF6snT029973 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 11:06:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CCF647086D; Mon, 18 Oct 2021 15:06:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F64A60D30;
	Mon, 18 Oct 2021 15:06:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 16:06:24 +0100
Message-ID: <163456958468.2614702.7692988896929155656.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Subject: [Linux-cachefs] [PATCH 58/67] NFS: Convert fscache_acquire_cookie
 and fscache_relinquish_cookie
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

From: Dave Wysochanski <dwysocha@redhat.com>

The new FS-Cache netfs API changes the cookie API slightly.

The changes to fscache_acquire_cookie are:
* remove struct fscache_cookie_def
* add 'type' of cookie (was member of fscache_cookie_def)
* add 'name' of cookie (was member of fscache_cookie_def)
* add 'advice' flags (tells cache how to handle object); set to 0
* add 'preferred_cache' tag (if NULL, derive from parent)
* remove 'netfs_data'
* remove 'enable' (See fscache_use_cookie())

The changes to fscache_relinquish_cookie are:
* remove 'aux_data'

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Trond Myklebust <trond.myklebust@hammerspace.com>
cc: Anna Schumaker <anna.schumaker@netapp.com>
cc: linux-nfs@vger.kernel.org
---

 fs/nfs/fscache-index.c |   68 ------------------------------------------------
 fs/nfs/fscache.c       |   44 ++++++++++++++++++++-----------
 fs/nfs/fscache.h       |    3 --
 3 files changed, 29 insertions(+), 86 deletions(-)

diff --git a/fs/nfs/fscache-index.c b/fs/nfs/fscache-index.c
index 4bd5ce736193..b4fdacd955f3 100644
--- a/fs/nfs/fscache-index.c
+++ b/fs/nfs/fscache-index.c
@@ -44,71 +44,3 @@ void nfs_fscache_unregister(void)
 {
 	fscache_unregister_netfs(&nfs_fscache_netfs);
 }
-
-/*
- * Define the server object for FS-Cache.  This is used to describe a server
- * object to fscache_acquire_cookie().  It is keyed by the NFS protocol and
- * server address parameters.
- */
-const struct fscache_cookie_def nfs_fscache_server_index_def = {
-	.name		= "NFS.server",
-	.type 		= FSCACHE_COOKIE_TYPE_INDEX,
-};
-
-/*
- * Define the superblock object for FS-Cache.  This is used to describe a
- * superblock object to fscache_acquire_cookie().  It is keyed by all the NFS
- * parameters that might cause a separate superblock.
- */
-const struct fscache_cookie_def nfs_fscache_super_index_def = {
-	.name		= "NFS.super",
-	.type 		= FSCACHE_COOKIE_TYPE_INDEX,
-};
-
-/*
- * Consult the netfs about the state of an object
- * - This function can be absent if the index carries no state data
- * - The netfs data from the cookie being used as the target is
- *   presented, as is the auxiliary data
- */
-static
-enum fscache_checkaux nfs_fscache_inode_check_aux(void *cookie_netfs_data,
-						  const void *data,
-						  uint16_t datalen,
-						  loff_t object_size)
-{
-	struct nfs_fscache_inode_auxdata auxdata;
-	struct nfs_inode *nfsi = cookie_netfs_data;
-
-	if (datalen != sizeof(auxdata))
-		return FSCACHE_CHECKAUX_OBSOLETE;
-
-	memset(&auxdata, 0, sizeof(auxdata));
-	auxdata.mtime_sec  = nfsi->vfs_inode.i_mtime.tv_sec;
-	auxdata.mtime_nsec = nfsi->vfs_inode.i_mtime.tv_nsec;
-	auxdata.ctime_sec  = nfsi->vfs_inode.i_ctime.tv_sec;
-	auxdata.ctime_nsec = nfsi->vfs_inode.i_ctime.tv_nsec;
-
-	if (NFS_SERVER(&nfsi->vfs_inode)->nfs_client->rpc_ops->version == 4)
-		auxdata.change_attr = inode_peek_iversion_raw(&nfsi->vfs_inode);
-
-	if (memcmp(data, &auxdata, datalen) != 0)
-		return FSCACHE_CHECKAUX_OBSOLETE;
-
-	return FSCACHE_CHECKAUX_OKAY;
-}
-
-/*
- * Define the inode object for FS-Cache.  This is used to describe an inode
- * object to fscache_acquire_cookie().  It is keyed by the NFS file handle for
- * an inode.
- *
- * Coherency is managed by comparing the copies of i_size, i_mtime and i_ctime
- * held in the cache auxiliary data for the data storage object with those in
- * the inode struct in memory.
- */
-const struct fscache_cookie_def nfs_fscache_inode_object_def = {
-	.name		= "NFS.fh",
-	.type		= FSCACHE_COOKIE_TYPE_DATAFILE,
-	.check_aux	= nfs_fscache_inode_check_aux,
-};
diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index 68e266a37675..514d50d079a2 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -81,10 +81,15 @@ void nfs_fscache_get_client_cookie(struct nfs_client *clp)
 
 	/* create a cache index for looking up filehandles */
 	clp->fscache = fscache_acquire_cookie(nfs_fscache_netfs.primary_index,
-					      &nfs_fscache_server_index_def,
-					      &key, len,
-					      NULL, 0,
-					      clp, 0, true);
+					      FSCACHE_COOKIE_TYPE_INDEX,
+					      "NFS.server",
+					      0,    /* advice */
+					      NULL, /* preferred_cache */
+					      &key, /* index_key */
+					      len,
+					      NULL, /* aux_data */
+					      0,
+					      0);
 	dfprintk(FSCACHE, "NFS: get client cookie (0x%p/0x%p)\n",
 		 clp, clp->fscache);
 }
@@ -97,7 +102,7 @@ void nfs_fscache_release_client_cookie(struct nfs_client *clp)
 	dfprintk(FSCACHE, "NFS: releasing client cookie (0x%p/0x%p)\n",
 		 clp, clp->fscache);
 
-	fscache_relinquish_cookie(clp->fscache, NULL, false);
+	fscache_relinquish_cookie(clp->fscache, false);
 	clp->fscache = NULL;
 }
 
@@ -185,11 +190,15 @@ void nfs_fscache_get_super_cookie(struct super_block *sb, const char *uniq, int
 
 	/* create a cache index for looking up filehandles */
 	nfss->fscache = fscache_acquire_cookie(nfss->nfs_client->fscache,
-					       &nfs_fscache_super_index_def,
-					       &key->key,
+					       FSCACHE_COOKIE_TYPE_INDEX,
+					       "NFS.super",
+					       0,    /* advice */
+					       NULL, /* preferred_cache */
+					       &key->key,  /* index_key */
 					       sizeof(key->key) + ulen,
-					       NULL, 0,
-					       nfss, 0, true);
+					       NULL, /* aux_data */
+					       0,
+					       0);
 	dfprintk(FSCACHE, "NFS: get superblock cookie (0x%p/0x%p)\n",
 		 nfss, nfss->fscache);
 	return;
@@ -213,7 +222,7 @@ void nfs_fscache_release_super_cookie(struct super_block *sb)
 	dfprintk(FSCACHE, "NFS: releasing superblock cookie (0x%p/0x%p)\n",
 		 nfss, nfss->fscache);
 
-	fscache_relinquish_cookie(nfss->fscache, NULL, false);
+	fscache_relinquish_cookie(nfss->fscache, false);
 	nfss->fscache = NULL;
 
 	if (nfss->fscache_key) {
@@ -254,10 +263,15 @@ void nfs_fscache_init_inode(struct inode *inode)
 	nfs_fscache_update_auxdata(&auxdata, nfsi);
 
 	nfsi->fscache = fscache_acquire_cookie(NFS_SB(inode->i_sb)->fscache,
-					       &nfs_fscache_inode_object_def,
-					       nfsi->fh.data, nfsi->fh.size,
-					       &auxdata, sizeof(auxdata),
-					       nfsi, nfsi->vfs_inode.i_size, false);
+					       FSCACHE_COOKIE_TYPE_DATAFILE,
+					       "NFS.fh",
+					       0,             /* advice */
+					       NULL, /* preferred_cache */
+					       nfsi->fh.data, /* index_key */
+					       nfsi->fh.size,
+					       &auxdata,      /* aux_data */
+					       sizeof(auxdata),
+					       i_size_read(&nfsi->vfs_inode));
 }
 
 /*
@@ -272,7 +286,7 @@ void nfs_fscache_clear_inode(struct inode *inode)
 	dfprintk(FSCACHE, "NFS: clear cookie (0x%p/0x%p)\n", nfsi, cookie);
 
 	nfs_fscache_update_auxdata(&auxdata, nfsi);
-	fscache_relinquish_cookie(cookie, &auxdata, false);
+	fscache_relinquish_cookie(cookie, false);
 	nfsi->fscache = NULL;
 }
 
diff --git a/fs/nfs/fscache.h b/fs/nfs/fscache.h
index 679055720dae..1e30fcb45665 100644
--- a/fs/nfs/fscache.h
+++ b/fs/nfs/fscache.h
@@ -74,9 +74,6 @@ struct nfs_fscache_inode_auxdata {
  * fscache-index.c
  */
 extern struct fscache_netfs nfs_fscache_netfs;
-extern const struct fscache_cookie_def nfs_fscache_server_index_def;
-extern const struct fscache_cookie_def nfs_fscache_super_index_def;
-extern const struct fscache_cookie_def nfs_fscache_inode_object_def;
 
 extern int nfs_fscache_register(void);
 extern void nfs_fscache_unregister(void);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

