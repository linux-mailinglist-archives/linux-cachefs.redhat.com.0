Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 065FE60F28E
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Oct 2022 10:36:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666859814;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EcskeutqpOsqcP8fgrX09Mo0/dxLKNYwiQ7W91aW8Xo=;
	b=NoGRA+t6gt6H8d7DfDBGTs9LjYZhNL4Y9ZhUFRek/2TuznfUDUMHNYSzZL+vi5frZCvsUI
	ntQPXOoDmJR3JvKJjJDmfE9iHSAz6lVWB96IjES+3/BqdSysujveQqu/zpTC2+8aHOXD8S
	vc6DSbDrETXesOdRfqPGkr3NHy7LKqM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-Pqxl8bLsMsmdblJUEzSXiw-1; Thu, 27 Oct 2022 04:36:53 -0400
X-MC-Unique: Pqxl8bLsMsmdblJUEzSXiw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFE82100F809;
	Thu, 27 Oct 2022 08:36:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0715112D178;
	Thu, 27 Oct 2022 08:36:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 342F3194707D;
	Thu, 27 Oct 2022 08:36:16 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E78301946597 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 08:36:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 595B82166B4C; Thu, 27 Oct 2022 08:36:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51F372166BA4
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B816E3C0F67D
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:13 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-175-lXvVzlSaP-Kv10JaOUc8qw-1; Thu, 27 Oct 2022 04:36:01 -0400
X-MC-Unique: lXvVzlSaP-Kv10JaOUc8qw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R911e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VTAl7c2_1666859756
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VTAl7c2_1666859756) by smtp.aliyun-inc.com;
 Thu, 27 Oct 2022 16:35:57 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, jlayton@kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org
Date: Thu, 27 Oct 2022 16:35:45 +0800
Message-Id: <20221027083547.46933-8-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH 7/9] fscache,
 netfs: define flags for prepare_read()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Decouple flags used in prepare_read() from netfs_io_subrequest flags to
make raw fscache APIs more neutral independent on libnetfs.  Currently
only *REQ_[COPY_TO_CACHE|ONDEMAND] flags are exposed to fscache, thus
define these two flags for fscache variant, while keep other
netfs_io_subrequest flags untouched.

This is a cleanup without logic change.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/io.c      | 10 +++++-----
 fs/erofs/fscache.c      |  5 +++--
 fs/netfs/io.c           | 14 ++++++++++----
 include/linux/fscache.h |  3 +++
 include/linux/netfs.h   |  1 -
 5 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 9aace92a7503..a9c7463eb3e1 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -415,9 +415,9 @@ static enum fscache_io_source cachefiles_prepare_read(struct fscache_resources *
 	}
 
 	if (test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags)) {
-		__set_bit(NETFS_SREQ_COPY_TO_CACHE, _flags);
+		__set_bit(FSCACHE_REQ_COPY_TO_CACHE, _flags);
 		why = cachefiles_trace_read_no_data;
-		if (!test_bit(NETFS_SREQ_ONDEMAND, _flags))
+		if (!test_bit(FSCACHE_REQ_ONDEMAND, _flags))
 			goto out_no_object;
 	}
 
@@ -487,11 +487,11 @@ static enum fscache_io_source cachefiles_prepare_read(struct fscache_resources *
 	goto out;
 
 download_and_store:
-	__set_bit(NETFS_SREQ_COPY_TO_CACHE, _flags);
-	if (test_bit(NETFS_SREQ_ONDEMAND, _flags)) {
+	__set_bit(FSCACHE_REQ_COPY_TO_CACHE, _flags);
+	if (test_bit(FSCACHE_REQ_ONDEMAND, _flags)) {
 		rc = cachefiles_ondemand_read(object, start, len);
 		if (!rc) {
-			__clear_bit(NETFS_SREQ_ONDEMAND, _flags);
+			__clear_bit(FSCACHE_REQ_ONDEMAND, _flags);
 			goto retry;
 		}
 		ret = FSCACHE_INVALID_READ;
diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 6fbdf067a669..e30a42a35ae7 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -148,6 +148,7 @@ static int erofs_fscache_read_folios_async(struct fscache_cookie *cookie,
 	struct iov_iter iter;
 	loff_t start = rreq->start;
 	size_t len = rreq->len;
+	unsigned long flags;
 	size_t done = 0;
 	int ret;
 
@@ -172,12 +173,12 @@ static int erofs_fscache_read_folios_async(struct fscache_cookie *cookie,
 
 		subreq->start = pstart + done;
 		subreq->len	=  len - done;
-		subreq->flags = 1 << NETFS_SREQ_ONDEMAND;
 
 		list_add_tail(&subreq->rreq_link, &rreq->subrequests);
 
+		flags = 1 << FSCACHE_REQ_ONDEMAND;
 		source = cres->ops->prepare_read(cres, &subreq->start,
-				&subreq->len, &subreq->flags, LLONG_MAX);
+				&subreq->len, &flags, LLONG_MAX);
 		if (WARN_ON(subreq->len == 0))
 			source = FSCACHE_INVALID_READ;
 		if (source != FSCACHE_READ_FROM_CACHE) {
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 7fd2627e259a..13ac74f2e32f 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -485,10 +485,16 @@ static enum fscache_io_source netfs_cache_prepare_read(struct netfs_io_subreques
 {
 	struct netfs_io_request *rreq = subreq->rreq;
 	struct fscache_resources *cres = &rreq->cache_resources;
-
-	if (cres->ops)
-		return cres->ops->prepare_read(cres, &subreq->start,
-				&subreq->len, &subreq->flags, i_size);
+	enum fscache_io_source source;
+	unsigned long flags = 0;
+
+	if (cres->ops) {
+		source = cres->ops->prepare_read(cres, &subreq->start,
+				&subreq->len, &flags, i_size);
+		if (test_bit(FSCACHE_REQ_COPY_TO_CACHE, &flags))
+			__set_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
+		return source;
+	}
 	if (subreq->start >= rreq->i_size)
 		return FSCACHE_FILL_WITH_ZEROES;
 	return FSCACHE_DOWNLOAD_FROM_SERVER;
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index e955df30845b..9df2988be804 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -147,6 +147,9 @@ struct fscache_cookie {
 	};
 };
 
+#define FSCACHE_REQ_COPY_TO_CACHE	0	/* Set if should copy the data to the cache */
+#define FSCACHE_REQ_ONDEMAND		1	/* Set if it's from on-demand read mode */
+
 /*
  * slow-path functions for when there is actually caching available, and the
  * netfs does actually have a valid token
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 91a4382cbd1f..146a13e6a9d2 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -160,7 +160,6 @@ struct netfs_io_subrequest {
 #define NETFS_SREQ_SHORT_IO		2	/* Set if the I/O was short */
 #define NETFS_SREQ_SEEK_DATA_READ	3	/* Set if ->read() should SEEK_DATA first */
 #define NETFS_SREQ_NO_PROGRESS		4	/* Set if we didn't manage to read any data */
-#define NETFS_SREQ_ONDEMAND		5	/* Set if it's from on-demand read mode */
 };
 
 enum netfs_io_origin {
-- 
2.19.1.6.gb485710b

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

