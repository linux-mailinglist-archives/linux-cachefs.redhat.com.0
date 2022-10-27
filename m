Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE6860F287
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Oct 2022 10:36:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666859786;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ebR/g3xfiYzDLa6OpgnatZbsqRhQO3+6leouvtS7OCI=;
	b=dZbSStDRLgCLDebEC6rDebTLX7WVnSj3f+MYQUYxkEtp5afN2fSfwogIsabT/Ic6UT7XGA
	tZ4semHPw3e6l2bxkQgaaR9ar2csurb2vWjb2u4Bs8eyeVgYZNr6+cw0upe5xh3nHDMFld
	ddcSydTdiUz1a6IXHN672HhyhO/MxwE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-e-ktbHV0NB2Ax7XS1Llfmg-1; Thu, 27 Oct 2022 04:36:23 -0400
X-MC-Unique: e-ktbHV0NB2Ax7XS1Llfmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FE09101E14C;
	Thu, 27 Oct 2022 08:36:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29BAB4EA5C;
	Thu, 27 Oct 2022 08:36:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F34631946A7F;
	Thu, 27 Oct 2022 08:36:09 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DEACA1946597 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 08:36:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4C49B4010E4B; Thu, 27 Oct 2022 08:36:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44CC64014CE8
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EDBA38041E4
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:07 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-113-HmksF6zRMnGY0KHwLUrQiA-1; Thu, 27 Oct 2022 04:36:00 -0400
X-MC-Unique: HmksF6zRMnGY0KHwLUrQiA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VTAtIf8_1666859755
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VTAtIf8_1666859755) by smtp.aliyun-inc.com;
 Thu, 27 Oct 2022 16:35:56 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, jlayton@kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org
Date: Thu, 27 Oct 2022 16:35:44 +0800
Message-Id: <20221027083547.46933-7-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH 6/9] fscache,
 netfs: rename netfs_cache_resources as fscache_resources
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename netfs_cache_resources as fscache_resources to make raw fscache
APIs more neutral independent on libnetfs.

This is a cleanup without logic change.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/interface.c     |  2 +-
 fs/cachefiles/internal.h      |  6 +++---
 fs/cachefiles/io.c            | 14 +++++++-------
 fs/cifs/fscache.c             |  6 +++---
 fs/erofs/fscache.c            |  2 +-
 fs/fscache/io.c               | 14 +++++++-------
 fs/netfs/buffered_read.c      |  2 +-
 fs/netfs/io.c                 |  6 +++---
 fs/nfs/fscache.c              |  4 ++--
 include/linux/fscache-cache.h |  8 ++++----
 include/linux/fscache.h       | 16 ++++++++--------
 include/linux/netfs.h         | 18 +++++++++---------
 12 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index a69073a1d3f0..82ccbd957725 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -270,7 +270,7 @@ static bool cachefiles_shorten_object(struct cachefiles_object *object,
 /*
  * Resize the backing object.
  */
-static void cachefiles_resize_cookie(struct netfs_cache_resources *cres,
+static void cachefiles_resize_cookie(struct fscache_resources *cres,
 				     loff_t new_size)
 {
 	struct cachefiles_object *object = cachefiles_cres_object(cres);
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 897cc01b8b56..be8e0367ca0f 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -134,13 +134,13 @@ struct cachefiles_req {
 #include <trace/events/cachefiles.h>
 
 static inline
-struct file *cachefiles_cres_file(struct netfs_cache_resources *cres)
+struct file *cachefiles_cres_file(struct fscache_resources *cres)
 {
 	return cres->cache_priv2;
 }
 
 static inline
-struct cachefiles_object *cachefiles_cres_object(struct netfs_cache_resources *cres)
+struct cachefiles_object *cachefiles_cres_object(struct fscache_resources *cres)
 {
 	return fscache_cres_cookie(cres)->cache_priv;
 }
@@ -229,7 +229,7 @@ extern void cachefiles_put_object(struct cachefiles_object *object,
 /*
  * io.c
  */
-extern bool cachefiles_begin_operation(struct netfs_cache_resources *cres,
+extern bool cachefiles_begin_operation(struct fscache_resources *cres,
 				       enum fscache_want_state want_state);
 extern int __cachefiles_prepare_write(struct cachefiles_object *object,
 				      struct file *file,
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index ff4d8a309d51..9aace92a7503 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -70,7 +70,7 @@ static void cachefiles_read_complete(struct kiocb *iocb, long ret)
 /*
  * Initiate a read from the cache.
  */
-static int cachefiles_read(struct netfs_cache_resources *cres,
+static int cachefiles_read(struct fscache_resources *cres,
 			   loff_t start_pos,
 			   struct iov_iter *iter,
 			   enum fscache_read_from_hole read_hole,
@@ -194,7 +194,7 @@ static int cachefiles_read(struct netfs_cache_resources *cres,
  * Query the occupancy of the cache in a region, returning where the next chunk
  * of data starts and how long it is.
  */
-static int cachefiles_query_occupancy(struct netfs_cache_resources *cres,
+static int cachefiles_query_occupancy(struct fscache_resources *cres,
 				      loff_t start, size_t len, size_t granularity,
 				      loff_t *_data_start, size_t *_data_len)
 {
@@ -367,7 +367,7 @@ int __cachefiles_write(struct cachefiles_object *object,
 	return ret;
 }
 
-static int cachefiles_write(struct netfs_cache_resources *cres,
+static int cachefiles_write(struct fscache_resources *cres,
 			    loff_t start_pos,
 			    struct iov_iter *iter,
 			    fscache_io_terminated_t term_func,
@@ -389,7 +389,7 @@ static int cachefiles_write(struct netfs_cache_resources *cres,
  * Prepare a read operation, shortening it to a cached/uncached
  * boundary as appropriate.
  */
-static enum fscache_io_source cachefiles_prepare_read(struct netfs_cache_resources *cres,
+static enum fscache_io_source cachefiles_prepare_read(struct fscache_resources *cres,
 					loff_t *_start, size_t *_len,
 					unsigned long *_flags, loff_t i_size)
 {
@@ -581,7 +581,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 				    cachefiles_has_space_for_write);
 }
 
-static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
+static int cachefiles_prepare_write(struct fscache_resources *cres,
 				    loff_t *_start, size_t *_len, loff_t i_size,
 				    bool no_space_allocated_yet)
 {
@@ -608,7 +608,7 @@ static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
 /*
  * Clean up an operation.
  */
-static void cachefiles_end_operation(struct netfs_cache_resources *cres)
+static void cachefiles_end_operation(struct fscache_resources *cres)
 {
 	struct file *file = cachefiles_cres_file(cres);
 
@@ -629,7 +629,7 @@ static const struct fscache_ops cachefiles_fscache_ops = {
 /*
  * Open the cache file when beginning a cache operation.
  */
-bool cachefiles_begin_operation(struct netfs_cache_resources *cres,
+bool cachefiles_begin_operation(struct fscache_resources *cres,
 				enum fscache_want_state want_state)
 {
 	struct cachefiles_object *object = cachefiles_cres_object(cres);
diff --git a/fs/cifs/fscache.c b/fs/cifs/fscache.c
index 3145e0993313..6d5431a6a9a0 100644
--- a/fs/cifs/fscache.c
+++ b/fs/cifs/fscache.c
@@ -140,7 +140,7 @@ void cifs_fscache_release_inode_cookie(struct inode *inode)
  */
 static int fscache_fallback_read_page(struct inode *inode, struct page *page)
 {
-	struct netfs_cache_resources cres;
+	struct fscache_resources cres;
 	struct fscache_cookie *cookie = cifs_inode_cookie(inode);
 	struct iov_iter iter;
 	struct bio_vec bvec[1];
@@ -168,7 +168,7 @@ static int fscache_fallback_read_page(struct inode *inode, struct page *page)
 static int fscache_fallback_write_page(struct inode *inode, struct page *page,
 				       bool no_space_allocated_yet)
 {
-	struct netfs_cache_resources cres;
+	struct fscache_resources cres;
 	struct fscache_cookie *cookie = cifs_inode_cookie(inode);
 	struct iov_iter iter;
 	struct bio_vec bvec[1];
@@ -229,7 +229,7 @@ int __cifs_fscache_query_occupancy(struct inode *inode,
 				   pgoff_t *_data_first,
 				   unsigned int *_data_nr_pages)
 {
-	struct netfs_cache_resources cres;
+	struct fscache_resources cres;
 	struct fscache_cookie *cookie = cifs_inode_cookie(inode);
 	loff_t start, data_start;
 	size_t len, data_len;
diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 1cc0437eab50..6fbdf067a669 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -144,7 +144,7 @@ static int erofs_fscache_read_folios_async(struct fscache_cookie *cookie,
 	enum fscache_io_source source;
 	struct super_block *sb = rreq->mapping->host->i_sb;
 	struct netfs_io_subrequest *subreq;
-	struct netfs_cache_resources *cres = &rreq->cache_resources;
+	struct fscache_resources *cres = &rreq->cache_resources;
 	struct iov_iter iter;
 	loff_t start = rreq->start;
 	size_t len = rreq->len;
diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index 3ef93fdcb3b3..b328914c2ba5 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -20,7 +20,7 @@
  * See if the target cache object is at the specified minimum state of
  * accessibility yet, and if not, wait for it.
  */
-bool fscache_wait_for_operation(struct netfs_cache_resources *cres,
+bool fscache_wait_for_operation(struct fscache_resources *cres,
 				enum fscache_want_state want_state)
 {
 	struct fscache_cookie *cookie = fscache_cres_cookie(cres);
@@ -68,7 +68,7 @@ EXPORT_SYMBOL(fscache_wait_for_operation);
  *
  * Attaches the resources required to the operation resources record.
  */
-static int fscache_begin_operation(struct netfs_cache_resources *cres,
+static int fscache_begin_operation(struct fscache_resources *cres,
 				   struct fscache_cookie *cookie,
 				   enum fscache_want_state want_state,
 				   enum fscache_access_trace why)
@@ -142,7 +142,7 @@ static int fscache_begin_operation(struct netfs_cache_resources *cres,
 	return -ENOBUFS;
 }
 
-int __fscache_begin_read_operation(struct netfs_cache_resources *cres,
+int __fscache_begin_read_operation(struct fscache_resources *cres,
 				   struct fscache_cookie *cookie)
 {
 	return fscache_begin_operation(cres, cookie, FSCACHE_WANT_PARAMS,
@@ -150,7 +150,7 @@ int __fscache_begin_read_operation(struct netfs_cache_resources *cres,
 }
 EXPORT_SYMBOL(__fscache_begin_read_operation);
 
-int __fscache_begin_write_operation(struct netfs_cache_resources *cres,
+int __fscache_begin_write_operation(struct fscache_resources *cres,
 				    struct fscache_cookie *cookie)
 {
 	return fscache_begin_operation(cres, cookie, FSCACHE_WANT_PARAMS,
@@ -199,7 +199,7 @@ bool fscache_dirty_folio(struct address_space *mapping, struct folio *folio,
 EXPORT_SYMBOL(fscache_dirty_folio);
 
 struct fscache_write_request {
-	struct netfs_cache_resources cache_resources;
+	struct fscache_resources cache_resources;
 	struct address_space	*mapping;
 	loff_t			start;
 	size_t			len;
@@ -253,7 +253,7 @@ void __fscache_write_to_cache(struct fscache_cookie *cookie,
 			      bool cond)
 {
 	struct fscache_write_request *wreq;
-	struct netfs_cache_resources *cres;
+	struct fscache_resources *cres;
 	struct iov_iter iter;
 	int ret = -ENOBUFS;
 
@@ -306,7 +306,7 @@ EXPORT_SYMBOL(__fscache_write_to_cache);
  */
 void __fscache_resize_cookie(struct fscache_cookie *cookie, loff_t new_size)
 {
-	struct netfs_cache_resources cres;
+	struct fscache_resources cres;
 
 	trace_fscache_resize(cookie, new_size);
 	if (fscache_begin_operation(&cres, cookie, FSCACHE_WANT_WRITE,
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 0ce535852151..6bf215da4c93 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -97,7 +97,7 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 static void netfs_cache_expand_readahead(struct netfs_io_request *rreq,
 					 loff_t *_start, size_t *_len, loff_t i_size)
 {
-	struct netfs_cache_resources *cres = &rreq->cache_resources;
+	struct fscache_resources *cres = &rreq->cache_resources;
 
 	if (cres->ops && cres->ops->expand_readahead)
 		cres->ops->expand_readahead(cres, _start, _len, i_size);
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 2fc211376dc2..7fd2627e259a 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -45,7 +45,7 @@ static void netfs_read_from_cache(struct netfs_io_request *rreq,
 				  struct netfs_io_subrequest *subreq,
 				  enum fscache_read_from_hole read_hole)
 {
-	struct netfs_cache_resources *cres = &rreq->cache_resources;
+	struct fscache_resources *cres = &rreq->cache_resources;
 	struct iov_iter iter;
 
 	netfs_stat(&netfs_n_rh_read);
@@ -165,7 +165,7 @@ static void netfs_rreq_copy_terminated(void *priv, ssize_t transferred_or_error,
  */
 static void netfs_rreq_do_write_to_cache(struct netfs_io_request *rreq)
 {
-	struct netfs_cache_resources *cres = &rreq->cache_resources;
+	struct fscache_resources *cres = &rreq->cache_resources;
 	struct netfs_io_subrequest *subreq, *next, *p;
 	struct iov_iter iter;
 	int ret;
@@ -484,7 +484,7 @@ static enum fscache_io_source netfs_cache_prepare_read(struct netfs_io_subreques
 						       loff_t i_size)
 {
 	struct netfs_io_request *rreq = subreq->rreq;
-	struct netfs_cache_resources *cres = &rreq->cache_resources;
+	struct fscache_resources *cres = &rreq->cache_resources;
 
 	if (cres->ops)
 		return cres->ops->prepare_read(cres, &subreq->start,
diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index 509236f8b750..cea5f11c0af9 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -242,7 +242,7 @@ void nfs_fscache_release_file(struct inode *inode, struct file *filp)
  */
 static int fscache_fallback_read_page(struct inode *inode, struct page *page)
 {
-	struct netfs_cache_resources cres;
+	struct fscache_resources cres;
 	struct fscache_cookie *cookie = nfs_i_fscache(inode);
 	struct iov_iter iter;
 	struct bio_vec bvec[1];
@@ -270,7 +270,7 @@ static int fscache_fallback_read_page(struct inode *inode, struct page *page)
 static int fscache_fallback_write_page(struct inode *inode, struct page *page,
 				       bool no_space_allocated_yet)
 {
-	struct netfs_cache_resources cres;
+	struct fscache_resources cres;
 	struct fscache_cookie *cookie = nfs_i_fscache(inode);
 	struct iov_iter iter;
 	struct bio_vec bvec[1];
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index a174cedf4d90..a05ab349c26e 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -65,14 +65,14 @@ struct fscache_cache_ops {
 	void (*withdraw_cookie)(struct fscache_cookie *cookie);
 
 	/* Change the size of a data object */
-	void (*resize_cookie)(struct netfs_cache_resources *cres,
+	void (*resize_cookie)(struct fscache_resources *cres,
 			      loff_t new_size);
 
 	/* Invalidate an object */
 	bool (*invalidate_cookie)(struct fscache_cookie *cookie);
 
 	/* Begin an operation for the netfs lib */
-	bool (*begin_operation)(struct netfs_cache_resources *cres,
+	bool (*begin_operation)(struct fscache_resources *cres,
 				enum fscache_want_state want_state);
 
 	/* Prepare to write to a live cache object */
@@ -110,7 +110,7 @@ extern void fscache_end_cookie_access(struct fscache_cookie *cookie,
 extern void fscache_cookie_lookup_negative(struct fscache_cookie *cookie);
 extern void fscache_resume_after_invalidation(struct fscache_cookie *cookie);
 extern void fscache_caching_failed(struct fscache_cookie *cookie);
-extern bool fscache_wait_for_operation(struct netfs_cache_resources *cred,
+extern bool fscache_wait_for_operation(struct fscache_resources *cres,
 				       enum fscache_want_state state);
 
 /**
@@ -140,7 +140,7 @@ static inline void *fscache_get_key(struct fscache_cookie *cookie)
 		return cookie->key;
 }
 
-static inline struct fscache_cookie *fscache_cres_cookie(struct netfs_cache_resources *cres)
+static inline struct fscache_cookie *fscache_cres_cookie(struct fscache_resources *cres)
 {
 	return cres->cache_priv;
 }
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index d6546dc714b8..e955df30845b 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -169,8 +169,8 @@ extern void __fscache_unuse_cookie(struct fscache_cookie *, const void *, const
 extern void __fscache_relinquish_cookie(struct fscache_cookie *, bool);
 extern void __fscache_resize_cookie(struct fscache_cookie *, loff_t);
 extern void __fscache_invalidate(struct fscache_cookie *, const void *, loff_t, unsigned int);
-extern int __fscache_begin_read_operation(struct netfs_cache_resources *, struct fscache_cookie *);
-extern int __fscache_begin_write_operation(struct netfs_cache_resources *, struct fscache_cookie *);
+extern int __fscache_begin_read_operation(struct fscache_resources *, struct fscache_cookie *);
+extern int __fscache_begin_write_operation(struct fscache_resources *, struct fscache_cookie *);
 
 extern void __fscache_write_to_cache(struct fscache_cookie *, struct address_space *,
 				     loff_t, size_t, loff_t, fscache_io_terminated_t, void *,
@@ -423,7 +423,7 @@ void fscache_invalidate(struct fscache_cookie *cookie,
  * Returns a pointer to the operations table if usable or NULL if not.
  */
 static inline
-const struct fscache_ops *fscache_operation_valid(const struct netfs_cache_resources *cres)
+const struct fscache_ops *fscache_operation_valid(const struct fscache_resources *cres)
 {
 	return fscache_resources_valid(cres) ? cres->ops : NULL;
 }
@@ -450,7 +450,7 @@ const struct fscache_ops *fscache_operation_valid(const struct netfs_cache_resou
  * * Other error code from the cache, such as -ENOMEM.
  */
 static inline
-int fscache_begin_read_operation(struct netfs_cache_resources *cres,
+int fscache_begin_read_operation(struct fscache_resources *cres,
 				 struct fscache_cookie *cookie)
 {
 	if (fscache_cookie_enabled(cookie))
@@ -464,7 +464,7 @@ int fscache_begin_read_operation(struct netfs_cache_resources *cres,
  *
  * Clean up the resources at the end of the read request.
  */
-static inline void fscache_end_operation(struct netfs_cache_resources *cres)
+static inline void fscache_end_operation(struct fscache_resources *cres)
 {
 	const struct fscache_ops *ops = fscache_operation_valid(cres);
 
@@ -504,7 +504,7 @@ static inline void fscache_end_operation(struct netfs_cache_resources *cres)
  *	FSCACHE_READ_HOLE_FAIL - Give ENODATA if we encounter a hole.
  */
 static inline
-int fscache_read(struct netfs_cache_resources *cres,
+int fscache_read(struct fscache_resources *cres,
 		 loff_t start_pos,
 		 struct iov_iter *iter,
 		 enum fscache_read_from_hole read_hole,
@@ -535,7 +535,7 @@ int fscache_read(struct netfs_cache_resources *cres,
  * * Other error code from the cache, such as -ENOMEM.
  */
 static inline
-int fscache_begin_write_operation(struct netfs_cache_resources *cres,
+int fscache_begin_write_operation(struct fscache_resources *cres,
 				  struct fscache_cookie *cookie)
 {
 	if (fscache_cookie_enabled(cookie))
@@ -563,7 +563,7 @@ int fscache_begin_write_operation(struct netfs_cache_resources *cres,
  * error code otherwise.
  */
 static inline
-int fscache_write(struct netfs_cache_resources *cres,
+int fscache_write(struct fscache_resources *cres,
 		  loff_t start_pos,
 		  struct iov_iter *iter,
 		  fscache_io_terminated_t term_func,
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 2ff3a65458a6..91a4382cbd1f 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -133,7 +133,7 @@ struct netfs_inode {
 /*
  * Resources required to do operations on a cache.
  */
-struct netfs_cache_resources {
+struct fscache_resources {
 	const struct fscache_ops	*ops;
 	void				*cache_priv;
 	void				*cache_priv2;
@@ -177,7 +177,7 @@ struct netfs_io_request {
 	struct work_struct	work;
 	struct inode		*inode;		/* The file being accessed */
 	struct address_space	*mapping;	/* The mapping being accessed */
-	struct netfs_cache_resources cache_resources;
+	struct fscache_resources cache_resources;
 	struct list_head	subrequests;	/* Contributory I/O operations */
 	void			*netfs_priv;	/* Private data for the netfs */
 	unsigned int		debug_id;
@@ -233,10 +233,10 @@ enum fscache_read_from_hole {
  */
 struct fscache_ops {
 	/* End an operation */
-	void (*end_operation)(struct netfs_cache_resources *cres);
+	void (*end_operation)(struct fscache_resources *cres);
 
 	/* Read data from the cache */
-	int (*read)(struct netfs_cache_resources *cres,
+	int (*read)(struct fscache_resources *cres,
 		    loff_t start_pos,
 		    struct iov_iter *iter,
 		    enum fscache_read_from_hole read_hole,
@@ -244,34 +244,34 @@ struct fscache_ops {
 		    void *term_func_priv);
 
 	/* Write data to the cache */
-	int (*write)(struct netfs_cache_resources *cres,
+	int (*write)(struct fscache_resources *cres,
 		     loff_t start_pos,
 		     struct iov_iter *iter,
 		     fscache_io_terminated_t term_func,
 		     void *term_func_priv);
 
 	/* Expand readahead request */
-	void (*expand_readahead)(struct netfs_cache_resources *cres,
+	void (*expand_readahead)(struct fscache_resources *cres,
 				 loff_t *_start, size_t *_len, loff_t i_size);
 
 	/* Prepare a read operation, shortening it to a cached/uncached
 	 * boundary as appropriate.
 	 */
-	enum fscache_io_source (*prepare_read)(struct netfs_cache_resources *cres,
+	enum fscache_io_source (*prepare_read)(struct fscache_resources *cres,
 					     loff_t *_start, size_t *_len,
 					     unsigned long *_flags, loff_t i_size);
 
 	/* Prepare a write operation, working out what part of the write we can
 	 * actually do.
 	 */
-	int (*prepare_write)(struct netfs_cache_resources *cres,
+	int (*prepare_write)(struct fscache_resources *cres,
 			     loff_t *_start, size_t *_len, loff_t i_size,
 			     bool no_space_allocated_yet);
 
 	/* Query the occupancy of the cache in a region, returning where the
 	 * next chunk of data starts and how long it is.
 	 */
-	int (*query_occupancy)(struct netfs_cache_resources *cres,
+	int (*query_occupancy)(struct fscache_resources *cres,
 			       loff_t start, size_t len, size_t granularity,
 			       loff_t *_data_start, size_t *_data_len);
 };
-- 
2.19.1.6.gb485710b

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

