Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1765A3F9D
	for <lists+linux-cachefs@lfdr.de>; Sun, 28 Aug 2022 22:39:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661719163;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VuneawRPXqo0s5rUmUElyS2Bz5KrMJdvoSqv8qgpWCY=;
	b=MW6ngiplIWshMo03lfJ//vf4OfznAN2LyTTkM1+TqkUGn9TD7vNc5LxVG3QVhmX/e0Jr2b
	uQKsdIQfLQs8ZsNb42WSoWtNRkmsUZlJmxJZuthd3DlW9pUdenjoks5q/KOpeekDGDFvVa
	lZBSg99CGeppayoPDWHQJt80iJ1fkiU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-0zFZfCWkOFee79re0ErFHg-1; Sun, 28 Aug 2022 16:39:22 -0400
X-MC-Unique: 0zFZfCWkOFee79re0ErFHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F77880418F;
	Sun, 28 Aug 2022 20:39:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D50711121314;
	Sun, 28 Aug 2022 20:39:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9C9E91946A50;
	Sun, 28 Aug 2022 20:39:18 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B93501946A45 for <linux-cachefs@listman.corp.redhat.com>;
 Sun, 28 Aug 2022 20:39:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9EEAA4010D43; Sun, 28 Aug 2022 20:39:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 578FA40C141D;
 Sun, 28 Aug 2022 20:39:16 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 David Howells <dhowells@redhat.com>
Date: Sun, 28 Aug 2022 16:39:12 -0400
Message-Id: <20220828203913.956306-3-dwysocha@redhat.com>
In-Reply-To: <20220828203913.956306-1-dwysocha@redhat.com>
References: <20220828203913.956306-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Linux-cachefs] [RFC PATCH v2 2/3] NFS: Configure support for netfs
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com,
 Benjamin Maynard <benmaynard@google.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As first steps for support of the netfs library when NFS_FSCACHE is
configured, add NETFS_SUPPORT to Kconfig and add the required netfs_inode
into struct nfs_inode.

Using netfs requires we move the VFS inode structure to be stored
inside struct netfs_inode, along with the fscache_cookie.
Thus, create a new helper, NFSI_TO_INODE(), which is defined
differently depending on whether NFS_FSCACHE is configured.
In addition, use the netfs_inode() and netfs_i_cookie() helpers,
and remove our own helper, nfs_i_fscache().

Later patches will convert NFS fscache to fully use netfs.

Link: https://lore.kernel.org/linux-nfs/da9200f1bded9b8b078a7aef227fd6b92eb028fb.camel@hammerspace.com/

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/Kconfig         |  1 +
 fs/nfs/delegation.c    |  2 +-
 fs/nfs/dir.c           |  2 +-
 fs/nfs/fscache.c       | 20 +++++++++-----------
 fs/nfs/fscache.h       | 15 ++++++---------
 fs/nfs/inode.c         |  6 +++---
 fs/nfs/internal.h      |  2 +-
 fs/nfs/pnfs.c          | 12 ++++++------
 fs/nfs/write.c         |  2 +-
 include/linux/nfs_fs.h | 36 ++++++++++++++++++++++++------------
 10 files changed, 53 insertions(+), 45 deletions(-)

diff --git a/fs/nfs/Kconfig b/fs/nfs/Kconfig
index 14a72224b657..8fbb6caf3481 100644
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
diff --git a/fs/nfs/delegation.c b/fs/nfs/delegation.c
index 5c97cad741a7..41a2c5176783 100644
--- a/fs/nfs/delegation.c
+++ b/fs/nfs/delegation.c
@@ -306,7 +306,7 @@ nfs_start_delegation_return_locked(struct nfs_inode *nfsi)
 	}
 	spin_unlock(&delegation->lock);
 	if (ret)
-		nfs_clear_verifier_delegated(&nfsi->vfs_inode);
+		nfs_clear_verifier_delegated(NFSI_TO_INODE(nfsi));
 out:
 	return ret;
 }
diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index dbab3caa15ed..12e6c05edfcb 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -2796,7 +2796,7 @@ nfs_do_access_cache_scan(unsigned int nr_to_scan)
 
 		if (nr_to_scan-- == 0)
 			break;
-		inode = &nfsi->vfs_inode;
+		inode = NFSI_TO_INODE(nfsi);
 		spin_lock(&inode->i_lock);
 		if (list_empty(&nfsi->access_cache_entry_lru))
 			goto remove_lru_entry;
diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index e861d7bae305..a6fc1c8b6644 100644
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
+	fscache_relinquish_cookie(netfs_i_cookie(&NFS_I(inode)->netfs), false);
+	netfs_inode(inode)->cache = NULL;
 }
 
 /*
@@ -212,7 +210,7 @@ void nfs_fscache_clear_inode(struct inode *inode)
 void nfs_fscache_open_file(struct inode *inode, struct file *filp)
 {
 	struct nfs_fscache_inode_auxdata auxdata;
-	struct fscache_cookie *cookie = nfs_i_fscache(inode);
+	struct fscache_cookie *cookie = netfs_i_cookie(&NFS_I(inode)->netfs);
 	bool open_for_write = inode_is_open_for_write(inode);
 
 	if (!fscache_cookie_valid(cookie))
@@ -230,7 +228,7 @@ EXPORT_SYMBOL_GPL(nfs_fscache_open_file);
 void nfs_fscache_release_file(struct inode *inode, struct file *filp)
 {
 	struct nfs_fscache_inode_auxdata auxdata;
-	struct fscache_cookie *cookie = nfs_i_fscache(inode);
+	struct fscache_cookie *cookie = netfs_i_cookie(&NFS_I(inode)->netfs);
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
diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index b4e46b0ffa2d..94b7ed2a9b8b 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -1410,7 +1410,7 @@ int nfs_revalidate_mapping(struct inode *inode, struct address_space *mapping)
 
 static bool nfs_file_has_writers(struct nfs_inode *nfsi)
 {
-	struct inode *inode = &nfsi->vfs_inode;
+	struct inode *inode = NFSI_TO_INODE(nfsi);
 
 	if (!S_ISREG(inode->i_mode))
 		return false;
@@ -2248,7 +2248,7 @@ struct inode *nfs_alloc_inode(struct super_block *sb)
 #ifdef CONFIG_NFS_V4_2
 	nfsi->xattr_cache = NULL;
 #endif
-	return &nfsi->vfs_inode;
+	return NFSI_TO_INODE(nfsi);
 }
 EXPORT_SYMBOL_GPL(nfs_alloc_inode);
 
@@ -2272,7 +2272,7 @@ static void init_once(void *foo)
 {
 	struct nfs_inode *nfsi = (struct nfs_inode *) foo;
 
-	inode_init_once(&nfsi->vfs_inode);
+	inode_init_once(NFSI_TO_INODE(nfsi));
 	INIT_LIST_HEAD(&nfsi->open_files);
 	INIT_LIST_HEAD(&nfsi->access_cache_entry_lru);
 	INIT_LIST_HEAD(&nfsi->access_cache_inode_lru);
diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index 27c720d71b4e..78d945f5f97f 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -355,7 +355,7 @@ nfs4_label_copy(struct nfs4_label *dst, struct nfs4_label *src)
 
 static inline void nfs_zap_label_cache_locked(struct nfs_inode *nfsi)
 {
-	if (nfs_server_capable(&nfsi->vfs_inode, NFS_CAP_SECURITY_LABEL))
+	if (nfs_server_capable(NFSI_TO_INODE(nfsi), NFS_CAP_SECURITY_LABEL))
 		nfsi->cache_validity |= NFS_INO_INVALID_LABEL;
 }
 #else
diff --git a/fs/nfs/pnfs.c b/fs/nfs/pnfs.c
index 41a9b6b58fb9..a3cc8a561458 100644
--- a/fs/nfs/pnfs.c
+++ b/fs/nfs/pnfs.c
@@ -763,19 +763,19 @@ static struct pnfs_layout_hdr *__pnfs_destroy_layout(struct nfs_inode *nfsi)
 	struct pnfs_layout_hdr *lo;
 	LIST_HEAD(tmp_list);
 
-	spin_lock(&nfsi->vfs_inode.i_lock);
+	spin_lock(&NFSI_TO_INODE(nfsi)->i_lock);
 	lo = nfsi->layout;
 	if (lo) {
 		pnfs_get_layout_hdr(lo);
 		pnfs_mark_layout_stateid_invalid(lo, &tmp_list);
 		pnfs_layout_clear_fail_bit(lo, NFS_LAYOUT_RO_FAILED);
 		pnfs_layout_clear_fail_bit(lo, NFS_LAYOUT_RW_FAILED);
-		spin_unlock(&nfsi->vfs_inode.i_lock);
+		spin_unlock(&NFSI_TO_INODE(nfsi)->i_lock);
 		pnfs_free_lseg_list(&tmp_list);
-		nfs_commit_inode(&nfsi->vfs_inode, 0);
+		nfs_commit_inode(NFSI_TO_INODE(nfsi), 0);
 		pnfs_put_layout_hdr(lo);
 	} else
-		spin_unlock(&nfsi->vfs_inode.i_lock);
+		spin_unlock(&NFSI_TO_INODE(nfsi)->i_lock);
 	return lo;
 }
 
@@ -790,9 +790,9 @@ static bool pnfs_layout_removed(struct nfs_inode *nfsi,
 {
 	bool ret;
 
-	spin_lock(&nfsi->vfs_inode.i_lock);
+	spin_lock(&NFSI_TO_INODE(nfsi)->i_lock);
 	ret = nfsi->layout != lo;
-	spin_unlock(&nfsi->vfs_inode.i_lock);
+	spin_unlock(&NFSI_TO_INODE(nfsi)->i_lock);
 	return ret;
 }
 
diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index 51a7e202d6e5..af40b947aed8 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -828,7 +828,7 @@ nfs_page_search_commits_for_head_request_locked(struct nfs_inode *nfsi,
 {
 	struct nfs_page *freq, *t;
 	struct nfs_commit_info cinfo;
-	struct inode *inode = &nfsi->vfs_inode;
+	struct inode *inode = NFSI_TO_INODE(nfsi);
 
 	nfs_init_cinfo_from_inode(&cinfo, inode);
 
diff --git a/include/linux/nfs_fs.h b/include/linux/nfs_fs.h
index b32ed68e7dc4..314912991736 100644
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
@@ -122,6 +126,10 @@ struct nfs4_xattr_cache;
  * nfs fs inode data in memory
  */
 struct nfs_inode {
+#ifdef CONFIG_NFS_FSCACHE
+	struct netfs_inode netfs; /* Netfslib context and inode */
+#endif
+
 	/*
 	 * The 64bit 'inode number'
 	 */
@@ -203,10 +211,10 @@ struct nfs_inode {
 	/* how many bytes have been written/read and how many bytes queued up */
 	__u64 write_io;
 	__u64 read_io;
-#ifdef CONFIG_NFS_FSCACHE
-	struct fscache_cookie	*fscache;
+#ifndef CONFIG_NFS_FSCACHE
+	/* fscache uses netfs, and netfs_inode contains the inode */
+	struct inode	vfs_inode;
 #endif
-	struct inode		vfs_inode;
 
 #ifdef CONFIG_NFS_V4_2
 	struct nfs4_xattr_cache *xattr_cache;
@@ -281,9 +289,22 @@ struct nfs4_copy_state {
 #define NFS_INO_LAYOUTSTATS	(11)		/* layoutstats inflight */
 #define NFS_INO_ODIRECT		(12)		/* I/O setting is O_DIRECT */
 
+static inline struct inode *NFSI_TO_INODE(struct nfs_inode *nfsi)
+{
+#ifdef CONFIG_NFS_FSCACHE
+	return &nfsi->netfs.inode;
+#else
+	return &nfsi->vfs_inode;
+#endif
+}
+
 static inline struct nfs_inode *NFS_I(const struct inode *inode)
 {
+#ifdef CONFIG_NFS_FSCACHE
+	return container_of(inode, struct nfs_inode, netfs.inode);
+#else
 	return container_of(inode, struct nfs_inode, vfs_inode);
+#endif
 }
 
 static inline struct nfs_server *NFS_SB(const struct super_block *s)
@@ -328,15 +349,6 @@ static inline int NFS_STALE(const struct inode *inode)
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

