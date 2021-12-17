Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F067D479328
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Dec 2021 18:54:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639763682;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gys/OfKX7xqfsyV27rtUzjSkveU9Ioq6qZ3frQ1n/Uc=;
	b=bw0qja8etFyMuE1jyT2lmjfJ+5kMfDp47/fQHWSKwFgnrCc5S6moUftcj5Yymk61JExfXs
	IHAp9O7CWlI9AlVeEAmR8KTi6KmFRySxn924iU3ou+hi7XIT+b4RUbdpZFlKayMWNEqxhL
	1k7F8vdNnewPGRuxovMq4N8iarwZ6Cc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-fJboNicJPLuwJ3jA7Gi5FA-1; Fri, 17 Dec 2021 12:54:40 -0500
X-MC-Unique: fJboNicJPLuwJ3jA7Gi5FA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B890594DC6;
	Fri, 17 Dec 2021 17:54:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42DBA1037F39;
	Fri, 17 Dec 2021 17:54:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA0284A7CA;
	Fri, 17 Dec 2021 17:54:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BHHsWS5007943 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 17 Dec 2021 12:54:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6E17E1037F3C; Fri, 17 Dec 2021 17:54:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.133])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 002371037F39;
	Fri, 17 Dec 2021 17:54:31 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
	David Howells <dhowells@redhat.com>
Date: Fri, 17 Dec 2021 12:54:23 -0500
Message-Id: <1639763665-4917-3-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1639763665-4917-1-git-send-email-dwysocha@redhat.com>
References: <1639763665-4917-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH v2 2/4] NFS: Rename fscache read and write
	pages functions
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

Rename NFS fscache functions in a more consistent fashion
to better reflect when we read from and write to fscache.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/fscache.c |  6 +++---
 fs/nfs/fscache.h | 27 ++++++++++-----------------
 fs/nfs/read.c    |  4 ++--
 3 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index 81bd2770e640..62fbce28fe85 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -317,7 +317,7 @@ static int fscache_fallback_write_page(struct inode *inode, struct page *page,
 /*
  * Retrieve a page from fscache
  */
-int __nfs_readpage_from_fscache(struct inode *inode, struct page *page)
+int __nfs_fscache_read_page(struct inode *inode, struct page *page)
 {
 	int ret;
 
@@ -351,7 +351,7 @@ int __nfs_readpage_from_fscache(struct inode *inode, struct page *page)
  * Store a newly fetched page in fscache.  We can be certain there's no page
  * stored in the cache as yet otherwise we would've read it from there.
  */
-void __nfs_readpage_to_fscache(struct inode *inode, struct page *page)
+void __nfs_fscache_write_page(struct inode *inode, struct page *page)
 {
 	int ret;
 
@@ -362,7 +362,7 @@ void __nfs_readpage_to_fscache(struct inode *inode, struct page *page)
 	ret = fscache_fallback_write_page(inode, page, true);
 
 	dfprintk(FSCACHE,
-		 "NFS:     readpage_to_fscache: p:%p(i:%lu f:%lx) ret %d\n",
+		 "NFS:     nfs_fscache_write_page: p:%p(i:%lu f:%lx) ret %d\n",
 		 page, page->index, page->flags, ret);
 
 	if (ret != 0) {
diff --git a/fs/nfs/fscache.h b/fs/nfs/fscache.h
index 5cf7238e4886..ab7962ffe5f0 100644
--- a/fs/nfs/fscache.h
+++ b/fs/nfs/fscache.h
@@ -44,10 +44,8 @@ struct nfs_fscache_inode_auxdata {
 extern void nfs_fscache_open_file(struct inode *, struct file *);
 extern void nfs_fscache_release_file(struct inode *, struct file *);
 
-extern int __nfs_readpage_from_fscache(struct inode *, struct page *);
-extern void __nfs_read_completion_to_fscache(struct nfs_pgio_header *hdr,
-					     unsigned long bytes);
-extern void __nfs_readpage_to_fscache(struct inode *, struct page *);
+extern int __nfs_fscache_read_page(struct inode *, struct page *);
+extern void __nfs_fscache_write_page(struct inode *, struct page *);
 
 static inline int nfs_fscache_release_page(struct page *page, gfp_t gfp)
 {
@@ -65,11 +63,10 @@ static inline int nfs_fscache_release_page(struct page *page, gfp_t gfp)
 /*
  * Retrieve a page from an inode data storage object.
  */
-static inline int nfs_readpage_from_fscache(struct inode *inode,
-					    struct page *page)
+static inline int nfs_fscache_read_page(struct inode *inode, struct page *page)
 {
-	if (NFS_I(inode)->fscache)
-		return __nfs_readpage_from_fscache(inode, page);
+	if (nfs_i_fscache(inode))
+		return __nfs_fscache_read_page(inode, page);
 	return -ENOBUFS;
 }
 
@@ -77,11 +74,11 @@ static inline int nfs_readpage_from_fscache(struct inode *inode,
  * Store a page newly fetched from the server in an inode data storage object
  * in the cache.
  */
-static inline void nfs_readpage_to_fscache(struct inode *inode,
+static inline void nfs_fscache_write_page(struct inode *inode,
 					   struct page *page)
 {
-	if (NFS_I(inode)->fscache)
-		__nfs_readpage_to_fscache(inode, page);
+	if (nfs_i_fscache(inode))
+		__nfs_fscache_write_page(inode, page);
 }
 
 static inline void nfs_fscache_update_auxdata(struct nfs_fscache_inode_auxdata *auxdata,
@@ -135,15 +132,11 @@ static inline int nfs_fscache_release_page(struct page *page, gfp_t gfp)
 {
 	return 1; /* True: may release page */
 }
-static inline int nfs_readpage_from_fscache(struct inode *inode,
-					    struct page *page)
+static inline int nfs_fscache_read_page(struct inode *inode, struct page *page)
 {
 	return -ENOBUFS;
 }
-static inline void nfs_readpage_to_fscache(struct inode *inode,
-					   struct page *page) {}
-
-
+static inline void nfs_fscache_write_page(struct inode *inode, struct page *page) {}
 static inline void nfs_fscache_invalidate(struct inode *inode, int flags) {}
 
 static inline const char *nfs_server_fscache_state(struct nfs_server *server)
diff --git a/fs/nfs/read.c b/fs/nfs/read.c
index eb00229c1a50..f84b6b73c45b 100644
--- a/fs/nfs/read.c
+++ b/fs/nfs/read.c
@@ -123,7 +123,7 @@ static void nfs_readpage_release(struct nfs_page *req, int error)
 		struct address_space *mapping = page_file_mapping(page);
 
 		if (PageUptodate(page))
-			nfs_readpage_to_fscache(inode, page);
+			nfs_fscache_write_page(inode, page);
 		else if (!PageError(page) && !PagePrivate(page))
 			generic_error_remove_page(mapping, page);
 		unlock_page(page);
@@ -306,7 +306,7 @@ static void nfs_readpage_result(struct rpc_task *task,
 	aligned_len = min_t(unsigned int, ALIGN(len, rsize), PAGE_SIZE);
 
 	if (!IS_SYNC(page->mapping->host)) {
-		error = nfs_readpage_from_fscache(page->mapping->host, page);
+		error = nfs_fscache_read_page(page->mapping->host, page);
 		if (error == 0)
 			goto out_unlock;
 	}
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

