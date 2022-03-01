Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BC44C9477
	for <lists+linux-cachefs@lfdr.de>; Tue,  1 Mar 2022 20:38:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646163519;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HKrcCY3wVwn68TxX0oH+6Sbq4fNgX4lMEzpF8iqw51A=;
	b=QExKBfz2Ri06j+OrxmNFqANzZhI7X2RLeZG4g9+jjI4Z7mtqJmYtmIa7PuZDtr5cYbJ3eu
	7GmIxIZTD8SaIC0mFyk1m7oDeYa7or7K6bht4ynCcIGeFRg1R5cY9kpm/aonofX9G6VQ12
	Is5rpAtnHbm+cgtAN64pBjNTb80OW1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-oWQ4f2ENOKK4w8GCLxXbQA-1; Tue, 01 Mar 2022 14:38:36 -0500
X-MC-Unique: oWQ4f2ENOKK4w8GCLxXbQA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 788241006AA9;
	Tue,  1 Mar 2022 19:38:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A9505F4F4;
	Tue,  1 Mar 2022 19:38:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 545614EE45;
	Tue,  1 Mar 2022 19:38:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 221JcX1H020357 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 1 Mar 2022 14:38:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7DBF55DF5F; Tue,  1 Mar 2022 19:38:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.9.75])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03B8F5DF37;
	Tue,  1 Mar 2022 19:38:32 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Date: Tue,  1 Mar 2022 14:37:26 -0500
Message-Id: <20220301193727.18847-4-dwysocha@redhat.com>
In-Reply-To: <20220301193727.18847-1-dwysocha@redhat.com>
References: <20220301193727.18847-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 3/4] NFS: Replace dfprintks with tracepoints
	in fscache read and write page functions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Most of fscache and other NFS IO paths are now using tracepoints.
Remove the dfprintks in the NFS fscache read/write page functions
and replace with tracepoints at the begin and end of the functions.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/fscache.c  | 29 ++++++---------
 fs/nfs/nfstrace.h | 91 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+), 18 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index 62fbce28fe85..841b69aef189 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -19,6 +19,7 @@
 #include "internal.h"
 #include "iostat.h"
 #include "fscache.h"
+#include "nfstrace.h"
 
 #define NFSDBG_FACILITY		NFSDBG_FSCACHE
 
@@ -321,30 +322,27 @@ int __nfs_fscache_read_page(struct inode *inode, struct page *page)
 {
 	int ret;
 
-	dfprintk(FSCACHE,
-		 "NFS: readpage_from_fscache(fsc:%p/p:%p(i:%lx f:%lx)/0x%p)\n",
-		 nfs_i_fscache(inode), page, page->index, page->flags, inode);
-
+	trace_nfs_fscache_read_page(inode, page);
 	if (PageChecked(page)) {
-		dfprintk(FSCACHE, "NFS:    readpage_from_fscache: PageChecked\n");
 		ClearPageChecked(page);
-		return 1;
+		ret = 1;
+		goto out;
 	}
 
 	ret = fscache_fallback_read_page(inode, page);
 	if (ret < 0) {
 		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL);
-		dfprintk(FSCACHE,
-			 "NFS:    readpage_from_fscache failed %d\n", ret);
 		SetPageChecked(page);
-		return ret;
+		goto out;
 	}
 
 	/* Read completed synchronously */
-	dfprintk(FSCACHE, "NFS:    readpage_from_fscache: read successful\n");
 	nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_OK);
 	SetPageUptodate(page);
-	return 0;
+	ret = 0;
+out:
+	trace_nfs_fscache_read_page_exit(inode, page, ret);
+	return ret;
 }
 
 /*
@@ -355,20 +353,15 @@ void __nfs_fscache_write_page(struct inode *inode, struct page *page)
 {
 	int ret;
 
-	dfprintk(FSCACHE,
-		 "NFS: readpage_to_fscache(fsc:%p/p:%p(i:%lx f:%lx))\n",
-		 nfs_i_fscache(inode), page, page->index, page->flags);
+	trace_nfs_fscache_write_page(inode, page);
 
 	ret = fscache_fallback_write_page(inode, page, true);
 
-	dfprintk(FSCACHE,
-		 "NFS:     nfs_fscache_write_page: p:%p(i:%lu f:%lx) ret %d\n",
-		 page, page->index, page->flags, ret);
-
 	if (ret != 0) {
 		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_WRITTEN_FAIL);
 		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_UNCACHED);
 	} else {
 		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_WRITTEN_OK);
 	}
+	trace_nfs_fscache_write_page_exit(inode, page, ret);
 }
diff --git a/fs/nfs/nfstrace.h b/fs/nfs/nfstrace.h
index 317ce27bdc4b..f4d335c22113 100644
--- a/fs/nfs/nfstrace.h
+++ b/fs/nfs/nfstrace.h
@@ -1095,6 +1095,97 @@ TRACE_EVENT(nfs_readpage_short,
 		)
 );
 
+DECLARE_EVENT_CLASS(nfs_fscache_page_event,
+		TP_PROTO(
+			const struct inode *inode,
+			struct page *page
+		),
+
+		TP_ARGS(inode, page),
+
+		TP_STRUCT__entry(
+			__field(dev_t, dev)
+			__field(u32, fhandle)
+			__field(u64, fileid)
+			__field(loff_t, offset)
+		),
+
+		TP_fast_assign(
+			const struct nfs_inode *nfsi = NFS_I(inode);
+			const struct nfs_fh *fh = &nfsi->fh;
+
+			__entry->offset = page_index(page) << PAGE_SHIFT;
+			__entry->dev = inode->i_sb->s_dev;
+			__entry->fileid = nfsi->fileid;
+			__entry->fhandle = nfs_fhandle_hash(fh);
+		),
+
+		TP_printk(
+			"fileid=%02x:%02x:%llu fhandle=0x%08x "
+			"offset=%lld",
+			MAJOR(__entry->dev), MINOR(__entry->dev),
+			(unsigned long long)__entry->fileid,
+			__entry->fhandle,
+			(long long)__entry->offset
+		)
+);
+DECLARE_EVENT_CLASS(nfs_fscache_page_event_done,
+		TP_PROTO(
+			const struct inode *inode,
+			struct page *page,
+			int error
+		),
+
+		TP_ARGS(inode, page, error),
+
+		TP_STRUCT__entry(
+			__field(int, error)
+			__field(dev_t, dev)
+			__field(u32, fhandle)
+			__field(u64, fileid)
+			__field(loff_t, offset)
+		),
+
+		TP_fast_assign(
+			const struct nfs_inode *nfsi = NFS_I(inode);
+			const struct nfs_fh *fh = &nfsi->fh;
+
+			__entry->offset = page_index(page) << PAGE_SHIFT;
+			__entry->dev = inode->i_sb->s_dev;
+			__entry->fileid = nfsi->fileid;
+			__entry->fhandle = nfs_fhandle_hash(fh);
+			__entry->error = error;
+		),
+
+		TP_printk(
+			"fileid=%02x:%02x:%llu fhandle=0x%08x "
+			"offset=%lld error=%d",
+			MAJOR(__entry->dev), MINOR(__entry->dev),
+			(unsigned long long)__entry->fileid,
+			__entry->fhandle,
+			(long long)__entry->offset, __entry->error
+		)
+);
+#define DEFINE_NFS_FSCACHE_PAGE_EVENT(name) \
+	DEFINE_EVENT(nfs_fscache_page_event, name, \
+			TP_PROTO( \
+				const struct inode *inode, \
+				struct page *page \
+			), \
+			TP_ARGS(inode, page))
+#define DEFINE_NFS_FSCACHE_PAGE_EVENT_DONE(name) \
+	DEFINE_EVENT(nfs_fscache_page_event_done, name, \
+			TP_PROTO( \
+				const struct inode *inode, \
+				struct page *page, \
+				int error \
+			), \
+			TP_ARGS(inode, page, error))
+DEFINE_NFS_FSCACHE_PAGE_EVENT(nfs_fscache_read_page);
+DEFINE_NFS_FSCACHE_PAGE_EVENT_DONE(nfs_fscache_read_page_exit);
+DEFINE_NFS_FSCACHE_PAGE_EVENT(nfs_fscache_write_page);
+DEFINE_NFS_FSCACHE_PAGE_EVENT_DONE(nfs_fscache_write_page_exit);
+
 TRACE_EVENT(nfs_pgio_error,
 	TP_PROTO(
 		const struct nfs_pgio_header *hdr,
-- 
2.27.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

