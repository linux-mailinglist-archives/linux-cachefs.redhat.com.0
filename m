Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C158569979
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Jul 2022 06:51:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657169511;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zKlLCatf/YPzOG6HiyvhcGTK6n2y8wU33ZL6iXugdyM=;
	b=AgXUbgRoE6tr7bnizHoxsy4NHQTtlJpJi2RlKG44ZBB7wBZVJSmf8EY3S58gn4sbAuuHGE
	ufmhsDZv/iro15/9N/7uoHPa7/NF+Mc+9JjgjzS/vHo9zO0n63PPkNEGizODIjcdb4El3g
	vqq00K32d/3De43wUHPA+SjO95mMiM0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-r5BF6OFmOvSAkDCnjmWsYg-1; Thu, 07 Jul 2022 00:51:50 -0400
X-MC-Unique: r5BF6OFmOvSAkDCnjmWsYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F36A93802B81;
	Thu,  7 Jul 2022 04:51:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E64632026D64;
	Thu,  7 Jul 2022 04:51:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 915AE194706A;
	Thu,  7 Jul 2022 04:51:49 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A7B961947068 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Jul 2022 04:51:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 88B242EF97; Thu,  7 Jul 2022 04:51:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from lxbceph1.gsslab.pek2.redhat.com (unknown [10.72.47.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86CA418EC9;
 Thu,  7 Jul 2022 04:51:42 +0000 (UTC)
From: xiubli@redhat.com
To: dhowells@redhat.com,
	idryomov@gmail.com,
	jlayton@kernel.org
Date: Thu,  7 Jul 2022 12:51:11 +0800
Message-Id: <20220707045112.10177-2-xiubli@redhat.com>
In-Reply-To: <20220707045112.10177-1-xiubli@redhat.com>
References: <20220707045112.10177-1-xiubli@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Linux-cachefs] [PATCH v3 1/2] netfs: do not unlock and put the
 folio twice
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
Cc: keescook@chromium.org, linux-kernel@vger.kernel.org, willy@infradead.org,
 william.kucharski@oracle.com, linux-cachefs@redhat.com, vshankar@redhat.com,
 marc.dionne@auristor.com, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, kirill.shutemov@linux.intel.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Xiubo Li <xiubli@redhat.com>

check_write_begin() will unlock and put the folio when return
non-zero. So we should avoid unlocking and putting it twice in
netfs layer.

At the same time pass a **folio to check_write_begin(), in which
the folio should be cleared after being put.

URL: https://tracker.ceph.com/issues/56423
Signed-off-by: Xiubo Li <xiubli@redhat.com>
---
 fs/afs/file.c            |  2 +-
 fs/ceph/addr.c           | 11 ++++++-----
 fs/netfs/buffered_read.c | 18 ++++++++++--------
 include/linux/netfs.h    |  2 +-
 4 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 42118a4f3383..afacce797fb9 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -375,7 +375,7 @@ static int afs_begin_cache_operation(struct netfs_io_request *rreq)
 }
 
 static int afs_check_write_begin(struct file *file, loff_t pos, unsigned len,
-				 struct folio *folio, void **_fsdata)
+				 struct folio **folio, void **_fsdata)
 {
 	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
 
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 8095fc47230e..cf909b08907f 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -63,7 +63,7 @@
 	 (CONGESTION_ON_THRESH(congestion_kb) >> 2))
 
 static int ceph_netfs_check_write_begin(struct file *file, loff_t pos, unsigned int len,
-					struct folio *folio, void **_fsdata);
+					struct folio **folio, void **_fsdata);
 
 static inline struct ceph_snap_context *page_snap_context(struct page *page)
 {
@@ -1280,18 +1280,19 @@ ceph_find_incompatible(struct page *page)
 }
 
 static int ceph_netfs_check_write_begin(struct file *file, loff_t pos, unsigned int len,
-					struct folio *folio, void **_fsdata)
+					struct folio **folio, void **_fsdata)
 {
 	struct inode *inode = file_inode(file);
 	struct ceph_inode_info *ci = ceph_inode(inode);
 	struct ceph_snap_context *snapc;
 
-	snapc = ceph_find_incompatible(folio_page(folio, 0));
+	snapc = ceph_find_incompatible(folio_page(*folio, 0));
 	if (snapc) {
 		int r;
 
-		folio_unlock(folio);
-		folio_put(folio);
+		folio_unlock(*folio);
+		folio_put(*folio);
+		*folio = NULL;
 		if (IS_ERR(snapc))
 			return PTR_ERR(snapc);
 
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 42f892c5712e..308c2ad4da8e 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -319,8 +319,8 @@ static bool netfs_skip_folio_read(struct folio *folio, loff_t pos, size_t len,
  * conflicting writes once the folio is grabbed and locked.  It is passed a
  * pointer to the fsdata cookie that gets returned to the VM to be passed to
  * write_end.  It is permitted to sleep.  It should return 0 if the request
- * should go ahead; unlock the folio and return -EAGAIN to cause the folio to
- * be regot; or return an error.
+ * should go ahead; otherwise unlock, put and clear the folio and then return
+ * an error, -EAGAIN will cause the folio to be regot.
  *
  * The calling netfs must initialise a netfs context contiguous to the vfs
  * inode before calling this.
@@ -348,13 +348,14 @@ int netfs_write_begin(struct netfs_inode *ctx,
 
 	if (ctx->ops->check_write_begin) {
 		/* Allow the netfs (eg. ceph) to flush conflicts. */
-		ret = ctx->ops->check_write_begin(file, pos, len, folio, _fsdata);
+		ret = ctx->ops->check_write_begin(file, pos, len, &folio, _fsdata);
 		if (ret < 0) {
 			trace_netfs_failure(NULL, NULL, ret, netfs_fail_check_write_begin);
 			if (ret == -EAGAIN)
 				goto retry;
-			goto error;
+			goto error_unlocked;
 		}
+		BUG_ON(!folio);
 	}
 
 	if (folio_test_uptodate(folio))
@@ -375,7 +376,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
 				   NETFS_READ_FOR_WRITE);
 	if (IS_ERR(rreq)) {
 		ret = PTR_ERR(rreq);
-		goto error;
+		goto error_locked;
 	}
 	rreq->no_unlock_folio	= folio_index(folio);
 	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
@@ -402,12 +403,12 @@ int netfs_write_begin(struct netfs_inode *ctx,
 
 	ret = netfs_begin_read(rreq, true);
 	if (ret < 0)
-		goto error;
+		goto error_locked;
 
 have_folio:
 	ret = folio_wait_fscache_killable(folio);
 	if (ret < 0)
-		goto error;
+		goto error_locked;
 have_folio_no_wait:
 	*_folio = folio;
 	_leave(" = 0");
@@ -415,9 +416,10 @@ int netfs_write_begin(struct netfs_inode *ctx,
 
 error_put:
 	netfs_put_request(rreq, false, netfs_rreq_trace_put_failed);
-error:
+error_locked:
 	folio_unlock(folio);
 	folio_put(folio);
+error_unlocked:
 	_leave(" = %d", ret);
 	return ret;
 }
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 1773e5df8e65..88c4eb85c6f7 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -214,7 +214,7 @@ struct netfs_request_ops {
 	void (*issue_read)(struct netfs_io_subrequest *subreq);
 	bool (*is_still_valid)(struct netfs_io_request *rreq);
 	int (*check_write_begin)(struct file *file, loff_t pos, unsigned len,
-				 struct folio *folio, void **_fsdata);
+				 struct folio **folio, void **_fsdata);
 	void (*done)(struct netfs_io_request *rreq);
 };
 
-- 
2.36.0.rc1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

