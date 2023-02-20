Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A6369CCC5
	for <lists+linux-cachefs@lfdr.de>; Mon, 20 Feb 2023 14:43:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676900607;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i/tSxhqFtr09VdFqZbebIFnrihGMqgFku+vTO9UkzLc=;
	b=DwVRwCZSDA0NtKYaDXFE0GPaLt5NDLuyKxhAxkf43QqobGHVn9Zf/OOBK2JfuIAeRQsCFT
	bj80ke/ibT/CqwMAIVemqp85dl/q4cvhd7VT5geTkqk/Ha1VVUocw9oceu/sgybX9T5do3
	XDDOTsRy6dQLFuMe5oz7J1rvKqLd42Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-eXKZFcTsMCSmh6jnpt34ug-1; Mon, 20 Feb 2023 08:43:23 -0500
X-MC-Unique: eXKZFcTsMCSmh6jnpt34ug-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8844718A6462;
	Mon, 20 Feb 2023 13:43:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F536492B04;
	Mon, 20 Feb 2023 13:43:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5F911194658D;
	Mon, 20 Feb 2023 13:43:17 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 719121946587 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 20 Feb 2023 13:43:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4D720404CD86; Mon, 20 Feb 2023 13:43:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06067404CD84;
 Mon, 20 Feb 2023 13:43:10 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 David Howells <dhowells@redhat.com>,
 Benjamin Maynard <benmaynard@google.com>,
 Daire Byrne <daire.byrne@gmail.com>
Date: Mon, 20 Feb 2023 08:43:08 -0500
Message-Id: <20230220134308.1193219-6-dwysocha@redhat.com>
In-Reply-To: <20230220134308.1193219-1-dwysocha@redhat.com>
References: <20230220134308.1193219-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH v11 5/5] NFS: Remove fscache specific trace
 points and NFS_INO_FSCACHE bit
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The NFS specific trace points are no longer needed as tracing is well
covered by netfs and fscache.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nfs/nfstrace.h      | 91 ------------------------------------------
 include/linux/nfs_fs.h |  1 -
 2 files changed, 92 deletions(-)

diff --git a/fs/nfs/nfstrace.h b/fs/nfs/nfstrace.h
index a778713343df..4e90ca531176 100644
--- a/fs/nfs/nfstrace.h
+++ b/fs/nfs/nfstrace.h
@@ -39,7 +39,6 @@
 			{ BIT(NFS_INO_STALE), "STALE" }, \
 			{ BIT(NFS_INO_ACL_LRU_SET), "ACL_LRU_SET" }, \
 			{ BIT(NFS_INO_INVALIDATING), "INVALIDATING" }, \
-			{ BIT(NFS_INO_FSCACHE), "FSCACHE" }, \
 			{ BIT(NFS_INO_LAYOUTCOMMIT), "NEED_LAYOUTCOMMIT" }, \
 			{ BIT(NFS_INO_LAYOUTCOMMITTING), "LAYOUTCOMMIT" }, \
 			{ BIT(NFS_INO_LAYOUTSTATS), "LAYOUTSTATS" }, \
@@ -1243,96 +1242,6 @@ TRACE_EVENT(nfs_readpage_short,
 		)
 );
 
-DECLARE_EVENT_CLASS(nfs_fscache_page_event,
-		TP_PROTO(
-			const struct inode *inode,
-			struct page *page
-		),
-
-		TP_ARGS(inode, page),
-
-		TP_STRUCT__entry(
-			__field(dev_t, dev)
-			__field(u32, fhandle)
-			__field(u64, fileid)
-			__field(loff_t, offset)
-		),
-
-		TP_fast_assign(
-			const struct nfs_inode *nfsi = NFS_I(inode);
-			const struct nfs_fh *fh = &nfsi->fh;
-
-			__entry->offset = page_index(page) << PAGE_SHIFT;
-			__entry->dev = inode->i_sb->s_dev;
-			__entry->fileid = nfsi->fileid;
-			__entry->fhandle = nfs_fhandle_hash(fh);
-		),
-
-		TP_printk(
-			"fileid=%02x:%02x:%llu fhandle=0x%08x "
-			"offset=%lld",
-			MAJOR(__entry->dev), MINOR(__entry->dev),
-			(unsigned long long)__entry->fileid,
-			__entry->fhandle,
-			(long long)__entry->offset
-		)
-);
-DECLARE_EVENT_CLASS(nfs_fscache_page_event_done,
-		TP_PROTO(
-			const struct inode *inode,
-			struct page *page,
-			int error
-		),
-
-		TP_ARGS(inode, page, error),
-
-		TP_STRUCT__entry(
-			__field(int, error)
-			__field(dev_t, dev)
-			__field(u32, fhandle)
-			__field(u64, fileid)
-			__field(loff_t, offset)
-		),
-
-		TP_fast_assign(
-			const struct nfs_inode *nfsi = NFS_I(inode);
-			const struct nfs_fh *fh = &nfsi->fh;
-
-			__entry->offset = page_index(page) << PAGE_SHIFT;
-			__entry->dev = inode->i_sb->s_dev;
-			__entry->fileid = nfsi->fileid;
-			__entry->fhandle = nfs_fhandle_hash(fh);
-			__entry->error = error;
-		),
-
-		TP_printk(
-			"fileid=%02x:%02x:%llu fhandle=0x%08x "
-			"offset=%lld error=%d",
-			MAJOR(__entry->dev), MINOR(__entry->dev),
-			(unsigned long long)__entry->fileid,
-			__entry->fhandle,
-			(long long)__entry->offset, __entry->error
-		)
-);
-#define DEFINE_NFS_FSCACHE_PAGE_EVENT(name) \
-	DEFINE_EVENT(nfs_fscache_page_event, name, \
-			TP_PROTO( \
-				const struct inode *inode, \
-				struct page *page \
-			), \
-			TP_ARGS(inode, page))
-#define DEFINE_NFS_FSCACHE_PAGE_EVENT_DONE(name) \
-	DEFINE_EVENT(nfs_fscache_page_event_done, name, \
-			TP_PROTO( \
-				const struct inode *inode, \
-				struct page *page, \
-				int error \
-			), \
-			TP_ARGS(inode, page, error))
-DEFINE_NFS_FSCACHE_PAGE_EVENT(nfs_fscache_read_page);
-DEFINE_NFS_FSCACHE_PAGE_EVENT_DONE(nfs_fscache_read_page_exit);
-DEFINE_NFS_FSCACHE_PAGE_EVENT(nfs_fscache_write_page);
-DEFINE_NFS_FSCACHE_PAGE_EVENT_DONE(nfs_fscache_write_page_exit);
 
 TRACE_EVENT(nfs_pgio_error,
 	TP_PROTO(
diff --git a/include/linux/nfs_fs.h b/include/linux/nfs_fs.h
index 580847c70fec..137d296e6002 100644
--- a/include/linux/nfs_fs.h
+++ b/include/linux/nfs_fs.h
@@ -281,7 +281,6 @@ struct nfs4_copy_state {
 #define NFS_INO_ACL_LRU_SET	(2)		/* Inode is on the LRU list */
 #define NFS_INO_INVALIDATING	(3)		/* inode is being invalidated */
 #define NFS_INO_PRESERVE_UNLINKED (4)		/* preserve file if removed while open */
-#define NFS_INO_FSCACHE		(5)		/* inode can be cached by FS-Cache */
 #define NFS_INO_LAYOUTCOMMIT	(9)		/* layoutcommit required */
 #define NFS_INO_LAYOUTCOMMITTING (10)		/* layoutcommit inflight */
 #define NFS_INO_LAYOUTSTATS	(11)		/* layoutstats inflight */
-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

