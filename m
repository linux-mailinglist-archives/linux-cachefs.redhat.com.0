Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CBF4CFE94
	for <lists+linux-cachefs@lfdr.de>; Mon,  7 Mar 2022 13:33:28 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-2CFuOUKtN1unSyia5tvwwA-1; Mon, 07 Mar 2022 07:33:24 -0500
X-MC-Unique: 2CFuOUKtN1unSyia5tvwwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AEC83C17B4C;
	Mon,  7 Mar 2022 12:33:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0F522026987;
	Mon,  7 Mar 2022 12:33:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6A35919305A7;
	Mon,  7 Mar 2022 12:33:23 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 66FCE1931BE7 for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  7 Mar 2022 12:33:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5765F200AD52; Mon,  7 Mar 2022 12:33:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 521372026614
 for <linux-cachefs@redhat.com>; Mon,  7 Mar 2022 12:33:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC66D8038E3
 for <linux-cachefs@redhat.com>; Mon,  7 Mar 2022 12:33:17 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-d3-AWlBkPZmsXN-cRXBmtg-1; Mon, 07 Mar 2022 07:33:13 -0500
X-MC-Unique: d3-AWlBkPZmsXN-cRXBmtg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=15; SR=0; TI=SMTPD_---0V6WFbBz_1646656388
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V6WFbBz_1646656388) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 07 Mar 2022 20:33:09 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon,  7 Mar 2022 20:32:46 +0800
Message-Id: <20220307123305.79520-3-jefflexu@linux.alibaba.com>
In-Reply-To: <20220307123305.79520-1-jefflexu@linux.alibaba.com>
References: <20220307123305.79520-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Linux-cachefs] [PATCH v4 02/21] cachefiles: export write routine
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
Cc: gregkh@linuxfoundation.org, tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Extract and export the generic routine of writing data to cache files.

This is used by the following patch implementing on-demand read mode.
Since it will be called inside cachefiles, make the interface generic
and unrelated to netfs_cache_resources.

It is worth nothing that, ki->inval_counter is not initialized after
this cleanup. It shall not make any visible difference, since
inval_counter is no longer used in the write completion routine, i.e.
cachefiles_write_complete().

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/internal.h | 10 +++++++
 fs/cachefiles/io.c       | 61 +++++++++++++++++++++++-----------------
 2 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index c793d33b0224..e80673d0ab97 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -201,6 +201,16 @@ extern void cachefiles_put_object(struct cachefiles_object *object,
  */
 extern bool cachefiles_begin_operation(struct netfs_cache_resources *cres,
 				       enum fscache_want_state want_state);
+extern int __cachefiles_prepare_write(struct cachefiles_object *object,
+				      struct file *file,
+				      loff_t *_start, size_t *_len,
+				      bool no_space_allocated_yet);
+extern int __cachefiles_write(struct cachefiles_object *object,
+			      struct file *file,
+			      loff_t start_pos,
+			      struct iov_iter *iter,
+			      netfs_io_terminated_t term_func,
+			      void *term_func_priv);
 
 /*
  * key.c
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 753986ea1583..8dbc1eb254a3 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -278,36 +278,33 @@ static void cachefiles_write_complete(struct kiocb *iocb, long ret)
 /*
  * Initiate a write to the cache.
  */
-static int cachefiles_write(struct netfs_cache_resources *cres,
-			    loff_t start_pos,
-			    struct iov_iter *iter,
-			    netfs_io_terminated_t term_func,
-			    void *term_func_priv)
+int __cachefiles_write(struct cachefiles_object *object,
+		       struct file *file,
+		       loff_t start_pos,
+		       struct iov_iter *iter,
+		       netfs_io_terminated_t term_func,
+		       void *term_func_priv)
 {
-	struct cachefiles_object *object;
 	struct cachefiles_cache *cache;
 	struct cachefiles_kiocb *ki;
 	struct inode *inode;
-	struct file *file;
 	unsigned int old_nofs;
-	ssize_t ret = -ENOBUFS;
+	ssize_t ret;
 	size_t len = iov_iter_count(iter);
 
-	if (!fscache_wait_for_operation(cres, FSCACHE_WANT_WRITE))
-		goto presubmission_error;
 	fscache_count_write();
-	object = cachefiles_cres_object(cres);
 	cache = object->volume->cache;
-	file = cachefiles_cres_file(cres);
 
 	_enter("%pD,%li,%llx,%zx/%llx",
 	       file, file_inode(file)->i_ino, start_pos, len,
 	       i_size_read(file_inode(file)));
 
-	ret = -ENOMEM;
 	ki = kzalloc(sizeof(struct cachefiles_kiocb), GFP_KERNEL);
-	if (!ki)
-		goto presubmission_error;
+	if (!ki) {
+		if (term_func)
+			term_func(term_func_priv, -ENOMEM, false);
+		return -ENOMEM;
+	}
 
 	refcount_set(&ki->ki_refcnt, 2);
 	ki->iocb.ki_filp	= file;
@@ -316,7 +313,6 @@ static int cachefiles_write(struct netfs_cache_resources *cres,
 	ki->iocb.ki_hint	= ki_hint_validate(file_write_hint(file));
 	ki->iocb.ki_ioprio	= get_current_ioprio();
 	ki->object		= object;
-	ki->inval_counter	= cres->inval_counter;
 	ki->start		= start_pos;
 	ki->len			= len;
 	ki->term_func		= term_func;
@@ -371,11 +367,24 @@ static int cachefiles_write(struct netfs_cache_resources *cres,
 	cachefiles_put_kiocb(ki);
 	_leave(" = %zd", ret);
 	return ret;
+}
 
-presubmission_error:
-	if (term_func)
-		term_func(term_func_priv, ret, false);
-	return ret;
+static int cachefiles_write(struct netfs_cache_resources *cres,
+			    loff_t start_pos,
+			    struct iov_iter *iter,
+			    netfs_io_terminated_t term_func,
+			    void *term_func_priv)
+{
+	if (!fscache_wait_for_operation(cres, FSCACHE_WANT_WRITE)) {
+		if (term_func)
+			term_func(term_func_priv, -ENOBUFS, false);
+		return -ENOBUFS;
+	}
+
+	return __cachefiles_write(cachefiles_cres_object(cres),
+				  cachefiles_cres_file(cres),
+				  start_pos, iter,
+				  term_func, term_func_priv);
 }
 
 /*
@@ -486,13 +495,12 @@ static enum netfs_read_source cachefiles_prepare_read(struct netfs_read_subreque
 /*
  * Prepare for a write to occur.
  */
-static int __cachefiles_prepare_write(struct netfs_cache_resources *cres,
-				      loff_t *_start, size_t *_len, loff_t i_size,
-				      bool no_space_allocated_yet)
+int __cachefiles_prepare_write(struct cachefiles_object *object,
+			       struct file *file,
+			       loff_t *_start, size_t *_len,
+			       bool no_space_allocated_yet)
 {
-	struct cachefiles_object *object = cachefiles_cres_object(cres);
 	struct cachefiles_cache *cache = object->volume->cache;
-	struct file *file = cachefiles_cres_file(cres);
 	loff_t start = *_start, pos;
 	size_t len = *_len, down;
 	int ret;
@@ -579,7 +587,8 @@ static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
 	}
 
 	cachefiles_begin_secure(cache, &saved_cred);
-	ret = __cachefiles_prepare_write(cres, _start, _len, i_size,
+	ret = __cachefiles_prepare_write(object, cachefiles_cres_file(cres),
+					 _start, _len,
 					 no_space_allocated_yet);
 	cachefiles_end_secure(cache, saved_cred);
 	return ret;
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

