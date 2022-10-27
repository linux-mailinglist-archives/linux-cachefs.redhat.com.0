Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE7860F299
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Oct 2022 10:37:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666859839;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oB+oJrXDgqz0goA93dn2F6f2gDi7ar+6GSwYN/Cv38g=;
	b=fAZ8sL1x4L4jALjGrR8RpLvnmGP+hwcVEeqoGMM8xSUal/7AQTL3W6AsLdg+0s8NEWcfy4
	R7EoJt0MQeoim896kq2aDFkBkQ2ahbY0tUEOJh/XDmiliyxht6OAQUefd6Xnbz4zNTWRIw
	apes56TvgX10uRda4IZbbqF83NZpaV4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-b630JiKwNhOUuEhElLPZvw-1; Thu, 27 Oct 2022 04:37:16 -0400
X-MC-Unique: b630JiKwNhOUuEhElLPZvw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C3F629ABA1F;
	Thu, 27 Oct 2022 08:36:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71F30403159;
	Thu, 27 Oct 2022 08:36:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 66B1D194706A;
	Thu, 27 Oct 2022 08:36:45 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D792F19465B2 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 08:36:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1AE092024CC5; Thu, 27 Oct 2022 08:36:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 138262024CBB
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF8CE8027FD
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:10 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-364-zE9dDANSP961QOkBk6TKOw-1; Thu, 27 Oct 2022 04:35:58 -0400
X-MC-Unique: zE9dDANSP961QOkBk6TKOw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R811e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VTAtIeX_1666859754
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VTAtIeX_1666859754) by smtp.aliyun-inc.com;
 Thu, 27 Oct 2022 16:35:55 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, jlayton@kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org
Date: Thu, 27 Oct 2022 16:35:43 +0800
Message-Id: <20221027083547.46933-6-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Linux-cachefs] [PATCH 5/9] fscache,
 netfs: rename netfs_cache_ops as fscache_ops
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

Rename netfs_cache_ops as fscache_ops to make raw fscache APIs more
neutral independent on libnetfs.

This is a cleanup without logic change.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/io.c      | 4 ++--
 include/linux/fscache.h | 8 ++++----
 include/linux/netfs.h   | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 2dce7af0fbcf..ff4d8a309d51 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -617,7 +617,7 @@ static void cachefiles_end_operation(struct netfs_cache_resources *cres)
 	fscache_end_cookie_access(fscache_cres_cookie(cres), fscache_access_io_end);
 }
 
-static const struct netfs_cache_ops cachefiles_netfs_cache_ops = {
+static const struct fscache_ops cachefiles_fscache_ops = {
 	.end_operation		= cachefiles_end_operation,
 	.read			= cachefiles_read,
 	.write			= cachefiles_write,
@@ -635,7 +635,7 @@ bool cachefiles_begin_operation(struct netfs_cache_resources *cres,
 	struct cachefiles_object *object = cachefiles_cres_object(cres);
 
 	if (!cachefiles_cres_file(cres)) {
-		cres->ops = &cachefiles_netfs_cache_ops;
+		cres->ops = &cachefiles_fscache_ops;
 		if (object->file) {
 			spin_lock(&object->lock);
 			if (!cres->cache_priv2 && object->file)
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 80455e00c520..d6546dc714b8 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -423,7 +423,7 @@ void fscache_invalidate(struct fscache_cookie *cookie,
  * Returns a pointer to the operations table if usable or NULL if not.
  */
 static inline
-const struct netfs_cache_ops *fscache_operation_valid(const struct netfs_cache_resources *cres)
+const struct fscache_ops *fscache_operation_valid(const struct netfs_cache_resources *cres)
 {
 	return fscache_resources_valid(cres) ? cres->ops : NULL;
 }
@@ -466,7 +466,7 @@ int fscache_begin_read_operation(struct netfs_cache_resources *cres,
  */
 static inline void fscache_end_operation(struct netfs_cache_resources *cres)
 {
-	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
+	const struct fscache_ops *ops = fscache_operation_valid(cres);
 
 	if (ops)
 		ops->end_operation(cres);
@@ -511,7 +511,7 @@ int fscache_read(struct netfs_cache_resources *cres,
 		 fscache_io_terminated_t term_func,
 		 void *term_func_priv)
 {
-	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
+	const struct fscache_ops *ops = fscache_operation_valid(cres);
 	return ops->read(cres, start_pos, iter, read_hole,
 			 term_func, term_func_priv);
 }
@@ -569,7 +569,7 @@ int fscache_write(struct netfs_cache_resources *cres,
 		  fscache_io_terminated_t term_func,
 		  void *term_func_priv)
 {
-	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
+	const struct fscache_ops *ops = fscache_operation_valid(cres);
 	return ops->write(cres, start_pos, iter, term_func, term_func_priv);
 }
 
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 998402e34c00..2ff3a65458a6 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -134,7 +134,7 @@ struct netfs_inode {
  * Resources required to do operations on a cache.
  */
 struct netfs_cache_resources {
-	const struct netfs_cache_ops	*ops;
+	const struct fscache_ops	*ops;
 	void				*cache_priv;
 	void				*cache_priv2;
 	unsigned int			debug_id;	/* Cookie debug ID */
@@ -231,7 +231,7 @@ enum fscache_read_from_hole {
  * Table of operations for access to a cache.  This is obtained by
  * rreq->ops->begin_cache_operation().
  */
-struct netfs_cache_ops {
+struct fscache_ops {
 	/* End an operation */
 	void (*end_operation)(struct netfs_cache_resources *cres);
 
-- 
2.19.1.6.gb485710b

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

