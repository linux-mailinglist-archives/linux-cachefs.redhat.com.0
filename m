Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE8969CCC6
	for <lists+linux-cachefs@lfdr.de>; Mon, 20 Feb 2023 14:43:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676900605;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a1BF9tsmLqwGjc1rxSlh/lL3QE8O7waHXoghNIQgBh4=;
	b=BoVbgGrX6nKlqCkIiQZXgs80ZV6SFn/ZYR+TQWtkLwT6B5XFMQo0dJWw08ulCILwUfy9YP
	GSMuW6d9B5GZzlqtalNRmLSt/AcDWfaxEFoH3pk72ExTBtxewbSwREdWSJCNVpceRuGOrt
	xDnBG0XRyGd3aUTPoVppWv8JxL3clvg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-RNhjvVW3Oeus0t4FoOzS4Q-1; Mon, 20 Feb 2023 08:43:22 -0500
X-MC-Unique: RNhjvVW3Oeus0t4FoOzS4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 010A687B2A2;
	Mon, 20 Feb 2023 13:43:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC7C32166B26;
	Mon, 20 Feb 2023 13:43:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4BA9819465B2;
	Mon, 20 Feb 2023 13:43:12 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6DFDB1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 20 Feb 2023 13:43:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 52BDE404CD85; Mon, 20 Feb 2023 13:43:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F22D404CD84;
 Mon, 20 Feb 2023 13:43:10 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 David Howells <dhowells@redhat.com>,
 Benjamin Maynard <benmaynard@google.com>,
 Daire Byrne <daire.byrne@gmail.com>
Date: Mon, 20 Feb 2023 08:43:05 -0500
Message-Id: <20230220134308.1193219-3-dwysocha@redhat.com>
In-Reply-To: <20230220134308.1193219-1-dwysocha@redhat.com>
References: <20230220134308.1193219-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH v11 2/5] NFS: Configure support for netfs
 when NFS fscache is configured
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As first steps for support of the netfs library when NFS_FSCACHE is
configured, add NETFS_SUPPORT to Kconfig and add the required netfs_inode
into struct nfs_inode.

Using netfs requires we move the VFS inode structure to be stored
inside struct netfs_inode, along with the fscache_cookie.
Thus, if NFS_FSCACHE is configured, place netfs_inode inside an
anonymous union so the vfs_inode memory is the same and we do
not need to modify other non-fscache areas of NFS.
In addition, inside the NFS fscache code, use the new helpers,
netfs_inode() and netfs_i_cookie() helpers, and remove our own
helper, nfs_i_fscache().

Later patches will convert NFS fscache to fully use netfs.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/Kconfig         |  1 +
 fs/nfs/fscache.c       | 20 +++++++++-----------
 fs/nfs/fscache.h       | 15 ++++++---------
 include/linux/nfs_fs.h | 24 ++++++++++--------------
 4 files changed, 26 insertions(+), 34 deletions(-)

diff --git a/fs/nfs/Kconfig b/fs/nfs/Kconfig
index 1ead5bd740c2..a7942c77415d 100644
--- a/fs/nfs/Kconfig
+++ b/fs/nfs/Kconfig
@@ -171,6 +171,7 @@ config ROOT_NFS
 config NFS_FSCACHE
 	bool "Provide NFS client caching support"
 	depends on NFS_FS=m && FSCACHE || NFS_FS=y && FSCACHE=y
+	select NETFS_SUPPORT
 	help
 	  Say Y here if you want NFS data to be cached locally on disc through
 	  the general filesystem cache manager
diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index e731c00a9fcb..313c1519510c 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -163,13 +163,14 @@ void nfs_fscache_init_inode(struct inode *inode)
 	struct nfs_server *nfss = NFS_SERVER(inode);
 	struct nfs_inode *nfsi = NFS_I(inode);
 
-	nfsi->fscache = NULL;
+	netfs_inode(inode)->cache = NULL;
 	if (!(nfss->fscache && S_ISREG(inode->i_mode)))
 		return;
 
 	nfs_fscache_update_auxdata(&auxdata, inode);
 
-	nfsi->fscache = fscache_acquire_cookie(NFS_SB(inode->i_sb)->fscache,
+	netfs_inode(inode)->cache = fscache_acquire_cookie(
+					       nfss->fscache,
 					       0,
 					       nfsi->fh.data, /* index_key */
 					       nfsi->fh.size,
@@ -183,11 +184,8 @@ void nfs_fscache_init_inode(struct inode *inode)
  */
 void nfs_fscache_clear_inode(struct inode *inode)
 {
-	struct nfs_inode *nfsi = NFS_I(inode);
-	struct fscache_cookie *cookie = nfs_i_fscache(inode);
-
-	fscache_relinquish_cookie(cookie, false);
-	nfsi->fscache = NULL;
+	fscache_relinquish_cookie(netfs_i_cookie(netfs_inode(inode)), false);
+	netfs_inode(inode)->cache = NULL;
 }
 
 /*
@@ -212,7 +210,7 @@ void nfs_fscache_clear_inode(struct inode *inode)
 void nfs_fscache_open_file(struct inode *inode, struct file *filp)
 {
 	struct nfs_fscache_inode_auxdata auxdata;
-	struct fscache_cookie *cookie = nfs_i_fscache(inode);
+	struct fscache_cookie *cookie = netfs_i_cookie(netfs_inode(inode));
 	bool open_for_write = inode_is_open_for_write(inode);
 
 	if (!fscache_cookie_valid(cookie))
@@ -230,7 +228,7 @@ EXPORT_SYMBOL_GPL(nfs_fscache_open_file);
 void nfs_fscache_release_file(struct inode *inode, struct file *filp)
 {
 	struct nfs_fscache_inode_auxdata auxdata;
-	struct fscache_cookie *cookie = nfs_i_fscache(inode);
+	struct fscache_cookie *cookie = netfs_i_cookie(netfs_inode(inode));
 	loff_t i_size = i_size_read(inode);
 
 	nfs_fscache_update_auxdata(&auxdata, inode);
@@ -243,7 +241,7 @@ void nfs_fscache_release_file(struct inode *inode, struct file *filp)
 static int fscache_fallback_read_page(struct inode *inode, struct page *page)
 {
 	struct netfs_cache_resources cres;
-	struct fscache_cookie *cookie = nfs_i_fscache(inode);
+	struct fscache_cookie *cookie = netfs_i_cookie(&NFS_I(inode)->netfs);
 	struct iov_iter iter;
 	struct bio_vec bvec[1];
 	int ret;
@@ -271,7 +269,7 @@ static int fscache_fallback_write_page(struct inode *inode, struct page *page,
 				       bool no_space_allocated_yet)
 {
 	struct netfs_cache_resources cres;
-	struct fscache_cookie *cookie = nfs_i_fscache(inode);
+	struct fscache_cookie *cookie = netfs_i_cookie(&NFS_I(inode)->netfs);
 	struct iov_iter iter;
 	struct bio_vec bvec[1];
 	loff_t start = page_offset(page);
diff --git a/fs/nfs/fscache.h b/fs/nfs/fscache.h
index 2a37af880978..38614ed8f951 100644
--- a/fs/nfs/fscache.h
+++ b/fs/nfs/fscache.h
@@ -54,7 +54,7 @@ static inline bool nfs_fscache_release_folio(struct folio *folio, gfp_t gfp)
 		if (current_is_kswapd() || !(gfp & __GFP_FS))
 			return false;
 		folio_wait_fscache(folio);
-		fscache_note_page_release(nfs_i_fscache(folio->mapping->host));
+		fscache_note_page_release(netfs_i_cookie(&NFS_I(folio->mapping->host)->netfs));
 		nfs_inc_fscache_stats(folio->mapping->host,
 				      NFSIOS_FSCACHE_PAGES_UNCACHED);
 	}
@@ -66,7 +66,7 @@ static inline bool nfs_fscache_release_folio(struct folio *folio, gfp_t gfp)
  */
 static inline int nfs_fscache_read_page(struct inode *inode, struct page *page)
 {
-	if (nfs_i_fscache(inode))
+	if (netfs_inode(inode)->cache)
 		return __nfs_fscache_read_page(inode, page);
 	return -ENOBUFS;
 }
@@ -78,7 +78,7 @@ static inline int nfs_fscache_read_page(struct inode *inode, struct page *page)
 static inline void nfs_fscache_write_page(struct inode *inode,
 					   struct page *page)
 {
-	if (nfs_i_fscache(inode))
+	if (netfs_inode(inode)->cache)
 		__nfs_fscache_write_page(inode, page);
 }
 
@@ -101,13 +101,10 @@ static inline void nfs_fscache_update_auxdata(struct nfs_fscache_inode_auxdata *
 static inline void nfs_fscache_invalidate(struct inode *inode, int flags)
 {
 	struct nfs_fscache_inode_auxdata auxdata;
-	struct nfs_inode *nfsi = NFS_I(inode);
+	struct fscache_cookie *cookie =  netfs_i_cookie(&NFS_I(inode)->netfs);
 
-	if (nfsi->fscache) {
-		nfs_fscache_update_auxdata(&auxdata, inode);
-		fscache_invalidate(nfsi->fscache, &auxdata,
-				   i_size_read(inode), flags);
-	}
+	nfs_fscache_update_auxdata(&auxdata, inode);
+	fscache_invalidate(cookie, &auxdata, i_size_read(inode), flags);
 }
 
 /*
diff --git a/include/linux/nfs_fs.h b/include/linux/nfs_fs.h
index 45c44211e50e..580847c70fec 100644
--- a/include/linux/nfs_fs.h
+++ b/include/linux/nfs_fs.h
@@ -31,6 +31,10 @@
 #include <linux/sunrpc/auth.h>
 #include <linux/sunrpc/clnt.h>
 
+#ifdef CONFIG_NFS_FSCACHE
+#include <linux/netfs.h>
+#endif
+
 #include <linux/nfs.h>
 #include <linux/nfs2.h>
 #include <linux/nfs3.h>
@@ -204,14 +208,15 @@ struct nfs_inode {
 	/* how many bytes have been written/read and how many bytes queued up */
 	__u64 write_io;
 	__u64 read_io;
-#ifdef CONFIG_NFS_FSCACHE
-	struct fscache_cookie	*fscache;
-#endif
-	struct inode		vfs_inode;
-
 #ifdef CONFIG_NFS_V4_2
 	struct nfs4_xattr_cache *xattr_cache;
 #endif
+	union {
+		struct inode		vfs_inode;
+#ifdef CONFIG_NFS_FSCACHE
+		struct netfs_inode	netfs; /* netfs context and VFS inode */
+#endif
+	};
 };
 
 struct nfs4_copy_state {
@@ -329,15 +334,6 @@ static inline int NFS_STALE(const struct inode *inode)
 	return test_bit(NFS_INO_STALE, &NFS_I(inode)->flags);
 }
 
-static inline struct fscache_cookie *nfs_i_fscache(struct inode *inode)
-{
-#ifdef CONFIG_NFS_FSCACHE
-	return NFS_I(inode)->fscache;
-#else
-	return NULL;
-#endif
-}
-
 static inline __u64 NFS_FILEID(const struct inode *inode)
 {
 	return NFS_I(inode)->fileid;
-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

