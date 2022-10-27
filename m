Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 592A560F28B
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Oct 2022 10:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666859795;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jji2ZnmiopTljl/kzxXrrboRacHf42dBnIPqp5UUlOw=;
	b=ROs1TWR5yXcmhNI4snUN0zYIGVRPfpEuCQ4UaR9ZK5juwv0Njt+tif9NDH3KSWywA2Dpwu
	oSHS7kf3veXrZGfNnwR6chsopGope0+u1Rwpt9JUoo6dFT9W6dCHjq9psmQAYsoqpnDNg6
	Cfxk0CytZO/VQaEl0KHuT+vLi9W67to=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-RZTIKz1bNOODmhCO1IJ2mg-1; Thu, 27 Oct 2022 04:36:32 -0400
X-MC-Unique: RZTIKz1bNOODmhCO1IJ2mg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBFFF833B07;
	Thu, 27 Oct 2022 08:36:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8C5E492B23;
	Thu, 27 Oct 2022 08:36:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 89F8B1947066;
	Thu, 27 Oct 2022 08:36:04 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 83C3A194704E for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 08:36:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A45A94EA48; Thu, 27 Oct 2022 08:36:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C41739DB3
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1080238041C9
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:00 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-282-6sNxGC42OjSVar_akyxS7w-1; Thu, 27 Oct 2022 04:35:55 -0400
X-MC-Unique: 6sNxGC42OjSVar_akyxS7w-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R491e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VTAawYM_1666859751
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VTAawYM_1666859751) by smtp.aliyun-inc.com;
 Thu, 27 Oct 2022 16:35:52 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, jlayton@kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org
Date: Thu, 27 Oct 2022 16:35:41 +0800
Message-Id: <20221027083547.46933-4-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Linux-cachefs] [PATCH 3/9] fscache,
 netfs: rename netfs_io_terminated_t as fscache_io_terminated_t
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename netfs_io_terminated_t as fscache_io_terminated_t to make raw
fscache APIs more neutral independent on libnetfs.

This is a cleanup without logic change.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/internal.h | 2 +-
 fs/cachefiles/io.c       | 8 ++++----
 fs/fscache/io.c          | 4 ++--
 include/linux/fscache.h  | 8 ++++----
 include/linux/netfs.h    | 6 +++---
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 2ad58c465208..897cc01b8b56 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -239,7 +239,7 @@ extern int __cachefiles_write(struct cachefiles_object *object,
 			      struct file *file,
 			      loff_t start_pos,
 			      struct iov_iter *iter,
-			      netfs_io_terminated_t term_func,
+			      fscache_io_terminated_t term_func,
 			      void *term_func_priv);
 
 /*
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 9214060b4781..6931032b837c 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -23,7 +23,7 @@ struct cachefiles_kiocb {
 		size_t		len;
 	};
 	struct cachefiles_object *object;
-	netfs_io_terminated_t	term_func;
+	fscache_io_terminated_t	term_func;
 	void			*term_func_priv;
 	bool			was_async;
 	unsigned int		inval_counter;	/* Copy of cookie->inval_counter */
@@ -74,7 +74,7 @@ static int cachefiles_read(struct netfs_cache_resources *cres,
 			   loff_t start_pos,
 			   struct iov_iter *iter,
 			   enum netfs_read_from_hole read_hole,
-			   netfs_io_terminated_t term_func,
+			   fscache_io_terminated_t term_func,
 			   void *term_func_priv)
 {
 	struct cachefiles_object *object;
@@ -281,7 +281,7 @@ int __cachefiles_write(struct cachefiles_object *object,
 		       struct file *file,
 		       loff_t start_pos,
 		       struct iov_iter *iter,
-		       netfs_io_terminated_t term_func,
+		       fscache_io_terminated_t term_func,
 		       void *term_func_priv)
 {
 	struct cachefiles_cache *cache;
@@ -370,7 +370,7 @@ int __cachefiles_write(struct cachefiles_object *object,
 static int cachefiles_write(struct netfs_cache_resources *cres,
 			    loff_t start_pos,
 			    struct iov_iter *iter,
-			    netfs_io_terminated_t term_func,
+			    fscache_io_terminated_t term_func,
 			    void *term_func_priv)
 {
 	if (!fscache_wait_for_operation(cres, FSCACHE_WANT_WRITE)) {
diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index 3af3b08a9bb3..3ef93fdcb3b3 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -204,7 +204,7 @@ struct fscache_write_request {
 	loff_t			start;
 	size_t			len;
 	bool			set_bits;
-	netfs_io_terminated_t	term_func;
+	fscache_io_terminated_t	term_func;
 	void			*term_func_priv;
 };
 
@@ -248,7 +248,7 @@ static void fscache_wreq_done(void *priv, ssize_t transferred_or_error,
 void __fscache_write_to_cache(struct fscache_cookie *cookie,
 			      struct address_space *mapping,
 			      loff_t start, size_t len, loff_t i_size,
-			      netfs_io_terminated_t term_func,
+			      fscache_io_terminated_t term_func,
 			      void *term_func_priv,
 			      bool cond)
 {
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 36e5dd84cf59..ee8e14f142e8 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -173,7 +173,7 @@ extern int __fscache_begin_read_operation(struct netfs_cache_resources *, struct
 extern int __fscache_begin_write_operation(struct netfs_cache_resources *, struct fscache_cookie *);
 
 extern void __fscache_write_to_cache(struct fscache_cookie *, struct address_space *,
-				     loff_t, size_t, loff_t, netfs_io_terminated_t, void *,
+				     loff_t, size_t, loff_t, fscache_io_terminated_t, void *,
 				     bool);
 extern void __fscache_clear_page_bits(struct address_space *, loff_t, size_t);
 
@@ -508,7 +508,7 @@ int fscache_read(struct netfs_cache_resources *cres,
 		 loff_t start_pos,
 		 struct iov_iter *iter,
 		 enum netfs_read_from_hole read_hole,
-		 netfs_io_terminated_t term_func,
+		 fscache_io_terminated_t term_func,
 		 void *term_func_priv)
 {
 	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
@@ -566,7 +566,7 @@ static inline
 int fscache_write(struct netfs_cache_resources *cres,
 		  loff_t start_pos,
 		  struct iov_iter *iter,
-		  netfs_io_terminated_t term_func,
+		  fscache_io_terminated_t term_func,
 		  void *term_func_priv)
 {
 	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
@@ -617,7 +617,7 @@ static inline void fscache_clear_page_bits(struct address_space *mapping,
 static inline void fscache_write_to_cache(struct fscache_cookie *cookie,
 					  struct address_space *mapping,
 					  loff_t start, size_t len, loff_t i_size,
-					  netfs_io_terminated_t term_func,
+					  fscache_io_terminated_t term_func,
 					  void *term_func_priv,
 					  bool caching)
 {
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 4cd7341c79b4..2cac478607a8 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -115,7 +115,7 @@ enum fscache_io_source {
 	FSCACHE_INVALID_READ,
 } __mode(byte);
 
-typedef void (*netfs_io_terminated_t)(void *priv, ssize_t transferred_or_error,
+typedef void (*fscache_io_terminated_t)(void *priv, ssize_t transferred_or_error,
 				      bool was_async);
 
 /*
@@ -240,14 +240,14 @@ struct netfs_cache_ops {
 		    loff_t start_pos,
 		    struct iov_iter *iter,
 		    enum netfs_read_from_hole read_hole,
-		    netfs_io_terminated_t term_func,
+		    fscache_io_terminated_t term_func,
 		    void *term_func_priv);
 
 	/* Write data to the cache */
 	int (*write)(struct netfs_cache_resources *cres,
 		     loff_t start_pos,
 		     struct iov_iter *iter,
-		     netfs_io_terminated_t term_func,
+		     fscache_io_terminated_t term_func,
 		     void *term_func_priv);
 
 	/* Expand readahead request */
-- 
2.19.1.6.gb485710b

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

