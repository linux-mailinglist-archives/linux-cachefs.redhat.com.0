Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 77B74427A2A
	for <lists+linux-cachefs@lfdr.de>; Sat,  9 Oct 2021 14:36:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633782988;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PNr7Dh4kJx/JYmj2FzBjQjfBVguiUyvXuWLbLKiVlLA=;
	b=LPx9+3ecXXY4UUv+tTwr+Bo5p73qhbGRlGY2kQtivvKV20sXoDti8R8X7xh8HC9vZSulN2
	eMMAXQM0MqBv3E/Rsdkad2E/4XujEJ+cD9//hw9OZ1p/j7w6zHWBnyjVRgXm0cjzXu26GE
	+7c1VKnPNZHPGwMPC01ovUsD+1f//t4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-4KC8mFEjOxahniH1ULBm1g-1; Sat, 09 Oct 2021 08:36:27 -0400
X-MC-Unique: 4KC8mFEjOxahniH1ULBm1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 666CF1006AA8;
	Sat,  9 Oct 2021 12:36:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57B0D60BD8;
	Sat,  9 Oct 2021 12:36:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 171504E590;
	Sat,  9 Oct 2021 12:36:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 199CaNNH032474 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 9 Oct 2021 08:36:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A1C91100763C; Sat,  9 Oct 2021 12:36:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE79010027C4;
	Sat,  9 Oct 2021 12:36:22 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Sat,  9 Oct 2021 08:36:02 -0400
Message-Id: <1633782962-18335-2-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1633782962-18335-1-git-send-email-dwysocha@redhat.com>
References: <1633782962-18335-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
	Chuck Lever <chuck.lever@oracle.com>, Matthew Wilcox <willy@infradead.org>
Subject: [Linux-cachefs] [PATCH v2 1/1] NFS: Convert from readpages() to
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 fs/nfs/read.c              | 18 +++++++++++++-----
 include/linux/nfs_fs.h     |  3 +--
 include/linux/nfs_iostat.h |  6 +++---
 4 files changed, 18 insertions(+), 11 deletions(-)

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
diff --git a/fs/nfs/read.c b/fs/nfs/read.c
index d06b91a101d2..296ea9a9b6ce 100644
--- a/fs/nfs/read.c
+++ b/fs/nfs/read.c
@@ -397,15 +397,19 @@ int nfs_readpage(struct file *file, struct page *page)
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
 
 	trace_nfs_aop_readahead(inode, nr_pages);
-	nfs_inc_stats(inode, NFSIOS_VFSREADPAGES);
+	nfs_inc_stats(inode, NFSIOS_VFSREADAHEAD);
 
 	ret = -ESTALE;
 	if (NFS_STALE(inode))
@@ -422,14 +426,18 @@ int nfs_readpages(struct file *file, struct address_space *mapping,
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
 	trace_nfs_aop_readahead_done(inode, nr_pages, ret);
-	return ret;
 }
 
 int __init nfs_init_readpagecache(void)
diff --git a/include/linux/nfs_fs.h b/include/linux/nfs_fs.h
index 140187b57db8..a5aef2cbe4ee 100644
--- a/include/linux/nfs_fs.h
+++ b/include/linux/nfs_fs.h
@@ -586,8 +586,7 @@ extern int nfs_access_get_cached(struct inode *inode, const struct cred *cred, s
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

