Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BAC94426069
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Oct 2021 01:33:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633649617;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Jgbfn20d69bEomuVMzcEURTYaFu+pbfB+OU/JMGhcow=;
	b=i976877EGcvmFpk6tDkIkUDMUVqUEk6YOVVy79+RIRWQLssr4ajlXSzHzqAzD+tp5cuqy+
	RpFX7ABbzcw+GwzAJ9g9VTjo8S/Nr9Y8eMKnpkiWvQyiWf++uXcS+AkjpzoqS3M5vKYWeN
	ULSQX240Gu03x12Vg7PQT6gIRMuimzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-zCMrrMkVOx2y12LAlbKX7Q-1; Thu, 07 Oct 2021 19:33:36 -0400
X-MC-Unique: zCMrrMkVOx2y12LAlbKX7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACB5618D7BD7;
	Thu,  7 Oct 2021 23:32:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EFB2669ED;
	Thu,  7 Oct 2021 23:32:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A77BD18006DF;
	Thu,  7 Oct 2021 23:32:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 197NWDwB022249 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 7 Oct 2021 19:32:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A27C35F4E3; Thu,  7 Oct 2021 23:32:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.139])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD9935D6D5;
	Thu,  7 Oct 2021 23:32:12 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Thu,  7 Oct 2021 19:32:08 -0400
Message-Id: <1633649528-1321-2-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1633649528-1321-1-git-send-email-dwysocha@redhat.com>
References: <1633649528-1321-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
	Chuck Lever <chuck.lever@oracle.com>, Matthew Wilcox <willy@infradead.org>
Subject: [Linux-cachefs] [PATCH 1/1] NFS: Convert from readpages() to
	readahead()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert to the new VM readahead() API which is the preferred API
to read multiple pages, and rename the NFSIOS_* counters and the
tracepoint as needed.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/file.c              |  2 +-
 fs/nfs/nfstrace.h          |  2 +-
 fs/nfs/read.c              | 21 +++++++++++++++------
 include/linux/nfs_fs.h     |  3 +--
 include/linux/nfs_iostat.h |  6 +++---
 5 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/fs/nfs/file.c b/fs/nfs/file.c
index 209dac208477..cc76d17fa97f 100644
--- a/fs/nfs/file.c
+++ b/fs/nfs/file.c
@@ -519,7 +519,7 @@ static void nfs_swap_deactivate(struct file *file)
 
 const struct address_space_operations nfs_file_aops = {
 	.readpage = nfs_readpage,
-	.readpages = nfs_readpages,
+	.readahead = nfs_readahead,
 	.set_page_dirty = __set_page_dirty_nobuffers,
 	.writepage = nfs_writepage,
 	.writepages = nfs_writepages,
diff --git a/fs/nfs/nfstrace.h b/fs/nfs/nfstrace.h
index 78b0f649dd09..d2b2080765a6 100644
--- a/fs/nfs/nfstrace.h
+++ b/fs/nfs/nfstrace.h
@@ -915,7 +915,7 @@
 		)
 );
 
-TRACE_EVENT(nfs_aops_readpages,
+TRACE_EVENT(nfs_aops_readahead,
 		TP_PROTO(
 			const struct inode *inode,
 			unsigned int nr_pages
diff --git a/fs/nfs/read.c b/fs/nfs/read.c
index 927504605e0f..5c2aab47cf1d 100644
--- a/fs/nfs/read.c
+++ b/fs/nfs/read.c
@@ -395,15 +395,19 @@ int nfs_readpage(struct file *file, struct page *page)
 	return ret;
 }
 
-int nfs_readpages(struct file *file, struct address_space *mapping,
-		struct list_head *pages, unsigned nr_pages)
+void nfs_readahead(struct readahead_control *ractl)
 {
+	struct file *file = ractl->file;
+	struct address_space *mapping = ractl->mapping;
+	struct page *page;
+	unsigned int nr_pages = readahead_count(ractl);
+
 	struct nfs_readdesc desc;
 	struct inode *inode = mapping->host;
 	int ret;
 
-	trace_nfs_aops_readpages(inode, nr_pages);
-	nfs_inc_stats(inode, NFSIOS_VFSREADPAGES);
+	trace_nfs_aops_readahead(inode, nr_pages);
+	nfs_inc_stats(inode, NFSIOS_VFSREADAHEAD);
 
 	ret = -ESTALE;
 	if (NFS_STALE(inode))
@@ -420,13 +424,18 @@ int nfs_readpages(struct file *file, struct address_space *mapping,
 	nfs_pageio_init_read(&desc.pgio, inode, false,
 			     &nfs_async_read_completion_ops);
 
-	ret = read_cache_pages(mapping, pages, readpage_async_filler, &desc);
+	ret = 0;
+	while (!ret && (page = readahead_page(ractl))) {
+		prefetchw(&page->flags);
+		ret = readpage_async_filler(&desc, page);
+		put_page(page);
+	}
 
 	nfs_pageio_complete_read(&desc.pgio);
 
 	put_nfs_open_context(desc.ctx);
 out:
-	return ret;
+	return;
 }
 
 int __init nfs_init_readpagecache(void)
diff --git a/include/linux/nfs_fs.h b/include/linux/nfs_fs.h
index b9a8b925db43..6cbe3f2c5669 100644
--- a/include/linux/nfs_fs.h
+++ b/include/linux/nfs_fs.h
@@ -580,8 +580,7 @@ extern int nfs_access_get_cached(struct inode *inode, const struct cred *cred, s
  * linux/fs/nfs/read.c
  */
 extern int  nfs_readpage(struct file *, struct page *);
-extern int  nfs_readpages(struct file *, struct address_space *,
-		struct list_head *, unsigned);
+extern void nfs_readahead(struct readahead_control *);
 
 /*
  * inline functions
diff --git a/include/linux/nfs_iostat.h b/include/linux/nfs_iostat.h
index 027874c36c88..418145f23700 100644
--- a/include/linux/nfs_iostat.h
+++ b/include/linux/nfs_iostat.h
@@ -22,7 +22,7 @@
 #ifndef _LINUX_NFS_IOSTAT
 #define _LINUX_NFS_IOSTAT
 
-#define NFS_IOSTAT_VERS		"1.1"
+#define NFS_IOSTAT_VERS		"1.2"
 
 /*
  * NFS byte counters
@@ -53,7 +53,7 @@
  * NFS page counters
  *
  * These count the number of pages read or written via nfs_readpage(),
- * nfs_readpages(), or their write equivalents.
+ * nfs_readahead(), or their write equivalents.
  *
  * NB: When adding new byte counters, please include the measured
  * units in the name of each byte counter to help users of this
@@ -98,7 +98,7 @@ enum nfs_stat_eventcounters {
 	NFSIOS_VFSACCESS,
 	NFSIOS_VFSUPDATEPAGE,
 	NFSIOS_VFSREADPAGE,
-	NFSIOS_VFSREADPAGES,
+	NFSIOS_VFSREADAHEAD,
 	NFSIOS_VFSWRITEPAGE,
 	NFSIOS_VFSWRITEPAGES,
 	NFSIOS_VFSGETDENTS,
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

