Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFAF60F28D
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Oct 2022 10:36:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666859807;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KdNjuIiUMlG5Dd6PI+MTl6w0PPNS6FSw0uUkRPRiUh4=;
	b=GL2gkWGAa8SKfGiaP/mKk1HPdpOltUF6M7s/qTWlbm7SEhSZLKN9riDlkQ+dl53yJkeyU1
	cE6pURCxpLwH9UOGU1xCZ9ieEuz4FVsNeSsvhhPzv9hduzzK0moL2CmDUrbbFBJfTjpAcb
	Y535a/R+EJCyBnAOP6J4BKpois4KCvo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-hD_aQSDeP9SIZv4pfu525Q-1; Thu, 27 Oct 2022 04:36:42 -0400
X-MC-Unique: hD_aQSDeP9SIZv4pfu525Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0ECF3C0F684;
	Thu, 27 Oct 2022 08:36:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEEB34A927E;
	Thu, 27 Oct 2022 08:36:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 75C141946A7F;
	Thu, 27 Oct 2022 08:36:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 624231946A40 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 08:36:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2C7F514152E8; Thu, 27 Oct 2022 08:36:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24A9A1415117
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 162441C0690E
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:00 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-457-p8hcQkJvMx-hdZUlamhR7A-1; Thu, 27 Oct 2022 04:35:57 -0400
X-MC-Unique: p8hcQkJvMx-hdZUlamhR7A-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VTAsArv_1666859753
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VTAsArv_1666859753) by smtp.aliyun-inc.com;
 Thu, 27 Oct 2022 16:35:54 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, jlayton@kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org
Date: Thu, 27 Oct 2022 16:35:42 +0800
Message-Id: <20221027083547.46933-5-jefflexu@linux.alibaba.com>
In-Reply-To: <20221027083547.46933-1-jefflexu@linux.alibaba.com>
References: <20221027083547.46933-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH 4/9] fscache,
 netfs: rename netfs_read_from_hole as fscache_read_from_hole
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
Cc: linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename netfs_read_from_hole as fscache_read_from_hole to make raw
fscache APIs more neutral independent on libnetfs.

This is a cleanup without logic change.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/io.c      |  6 +++---
 fs/cifs/fscache.c       |  2 +-
 fs/erofs/fscache.c      |  2 +-
 fs/netfs/io.c           |  6 +++---
 fs/nfs/fscache.c        |  2 +-
 include/linux/fscache.h |  8 ++++----
 include/linux/netfs.h   | 10 +++++-----
 7 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 6931032b837c..2dce7af0fbcf 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -73,7 +73,7 @@ static void cachefiles_read_complete(struct kiocb *iocb, long ret)
 static int cachefiles_read(struct netfs_cache_resources *cres,
 			   loff_t start_pos,
 			   struct iov_iter *iter,
-			   enum netfs_read_from_hole read_hole,
+			   enum fscache_read_from_hole read_hole,
 			   fscache_io_terminated_t term_func,
 			   void *term_func_priv)
 {
@@ -98,7 +98,7 @@ static int cachefiles_read(struct netfs_cache_resources *cres,
 	/* If the caller asked us to seek for data before doing the read, then
 	 * we should do that now.  If we find a gap, we fill it with zeros.
 	 */
-	if (read_hole != NETFS_READ_HOLE_IGNORE) {
+	if (read_hole != FSCACHE_READ_HOLE_IGNORE) {
 		loff_t off = start_pos, off2;
 
 		off2 = cachefiles_inject_read_error();
@@ -116,7 +116,7 @@ static int cachefiles_read(struct netfs_cache_resources *cres,
 			 * return success.
 			 */
 			ret = -ENODATA;
-			if (read_hole == NETFS_READ_HOLE_FAIL)
+			if (read_hole == FSCACHE_READ_HOLE_FAIL)
 				goto presubmission_error;
 
 			iov_iter_zero(len, iter);
diff --git a/fs/cifs/fscache.c b/fs/cifs/fscache.c
index a1751b956318..3145e0993313 100644
--- a/fs/cifs/fscache.c
+++ b/fs/cifs/fscache.c
@@ -156,7 +156,7 @@ static int fscache_fallback_read_page(struct inode *inode, struct page *page)
 	if (ret < 0)
 		return ret;
 
-	ret = fscache_read(&cres, page_offset(page), &iter, NETFS_READ_HOLE_FAIL,
+	ret = fscache_read(&cres, page_offset(page), &iter, FSCACHE_READ_HOLE_FAIL,
 			   NULL, NULL);
 	fscache_end_operation(&cres);
 	return ret;
diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index bf216478afa2..1cc0437eab50 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -195,7 +195,7 @@ static int erofs_fscache_read_folios_async(struct fscache_cookie *cookie,
 				start + done, subreq->len);
 
 		ret = fscache_read(cres, subreq->start, &iter,
-				   NETFS_READ_HOLE_FAIL,
+				   FSCACHE_READ_HOLE_FAIL,
 				   erofc_fscache_subreq_complete, subreq);
 		if (ret == -EIOCBQUEUED)
 			ret = 0;
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 992f3eebd2ee..2fc211376dc2 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -43,7 +43,7 @@ static void netfs_cache_read_terminated(void *priv, ssize_t transferred_or_error
  */
 static void netfs_read_from_cache(struct netfs_io_request *rreq,
 				  struct netfs_io_subrequest *subreq,
-				  enum netfs_read_from_hole read_hole)
+				  enum fscache_read_from_hole read_hole)
 {
 	struct netfs_cache_resources *cres = &rreq->cache_resources;
 	struct iov_iter iter;
@@ -251,7 +251,7 @@ static void netfs_rreq_short_read(struct netfs_io_request *rreq,
 	netfs_get_subrequest(subreq, netfs_sreq_trace_get_short_read);
 	atomic_inc(&rreq->nr_outstanding);
 	if (subreq->source == FSCACHE_READ_FROM_CACHE)
-		netfs_read_from_cache(rreq, subreq, NETFS_READ_HOLE_CLEAR);
+		netfs_read_from_cache(rreq, subreq, FSCACHE_READ_HOLE_CLEAR);
 	else
 		netfs_read_from_server(rreq, subreq);
 }
@@ -580,7 +580,7 @@ static bool netfs_rreq_submit_slice(struct netfs_io_request *rreq,
 		netfs_read_from_server(rreq, subreq);
 		break;
 	case FSCACHE_READ_FROM_CACHE:
-		netfs_read_from_cache(rreq, subreq, NETFS_READ_HOLE_IGNORE);
+		netfs_read_from_cache(rreq, subreq, FSCACHE_READ_HOLE_IGNORE);
 		break;
 	default:
 		BUG();
diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index e861d7bae305..509236f8b750 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -258,7 +258,7 @@ static int fscache_fallback_read_page(struct inode *inode, struct page *page)
 	if (ret < 0)
 		return ret;
 
-	ret = fscache_read(&cres, page_offset(page), &iter, NETFS_READ_HOLE_FAIL,
+	ret = fscache_read(&cres, page_offset(page), &iter, FSCACHE_READ_HOLE_FAIL,
 			   NULL, NULL);
 	fscache_end_operation(&cres);
 	return ret;
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index ee8e14f142e8..80455e00c520 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -496,18 +496,18 @@ static inline void fscache_end_operation(struct netfs_cache_resources *cres)
  * @read_hole indicates how a partially populated region in the cache should be
  * handled.  It can be one of a number of settings:
  *
- *	NETFS_READ_HOLE_IGNORE - Just try to read (may return a short read).
+ *	FSCACHE_READ_HOLE_IGNORE - Just try to read (may return a short read).
  *
- *	NETFS_READ_HOLE_CLEAR - Seek for data, clearing the part of the buffer
+ *	FSCACHE_READ_HOLE_CLEAR - Seek for data, clearing the part of the buffer
  *				skipped over, then do as for IGNORE.
  *
- *	NETFS_READ_HOLE_FAIL - Give ENODATA if we encounter a hole.
+ *	FSCACHE_READ_HOLE_FAIL - Give ENODATA if we encounter a hole.
  */
 static inline
 int fscache_read(struct netfs_cache_resources *cres,
 		 loff_t start_pos,
 		 struct iov_iter *iter,
-		 enum netfs_read_from_hole read_hole,
+		 enum fscache_read_from_hole read_hole,
 		 fscache_io_terminated_t term_func,
 		 void *term_func_priv)
 {
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 2cac478607a8..998402e34c00 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -221,10 +221,10 @@ struct netfs_request_ops {
 /*
  * How to handle reading from a hole.
  */
-enum netfs_read_from_hole {
-	NETFS_READ_HOLE_IGNORE,
-	NETFS_READ_HOLE_CLEAR,
-	NETFS_READ_HOLE_FAIL,
+enum fscache_read_from_hole {
+	FSCACHE_READ_HOLE_IGNORE,
+	FSCACHE_READ_HOLE_CLEAR,
+	FSCACHE_READ_HOLE_FAIL,
 };
 
 /*
@@ -239,7 +239,7 @@ struct netfs_cache_ops {
 	int (*read)(struct netfs_cache_resources *cres,
 		    loff_t start_pos,
 		    struct iov_iter *iter,
-		    enum netfs_read_from_hole read_hole,
+		    enum fscache_read_from_hole read_hole,
 		    fscache_io_terminated_t term_func,
 		    void *term_func_priv);
 
-- 
2.19.1.6.gb485710b

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

