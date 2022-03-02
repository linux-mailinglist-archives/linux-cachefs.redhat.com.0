Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DE64CA6E5
	for <lists+linux-cachefs@lfdr.de>; Wed,  2 Mar 2022 15:03:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646229810;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yDz/enyII4pb2usb9zanEzUVbuBPufqgR6D7TsjWPrM=;
	b=dM1oPS+k05h/7MUwJ80YdcrnDctTzi99T98JxLjxKzzF2MFoHJtMBhoOsgneybtpNEUDjU
	N2u6t7XcPYndPHvf8U8l53WCee07ZmvVc74JsAlxfOUYXLBD94eB0xFsy29Bw4YpQT48ea
	mrk8L0HdG8wOI/APVngDATYYLad4nJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-jqSjjZbbNDmY2RijJNFcgQ-1; Wed, 02 Mar 2022 09:03:27 -0500
X-MC-Unique: jqSjjZbbNDmY2RijJNFcgQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53CF8A0C0B;
	Wed,  2 Mar 2022 14:03:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D44D8495C;
	Wed,  2 Mar 2022 14:03:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C49244ED27;
	Wed,  2 Mar 2022 14:03:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 222E3NP1020030 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 2 Mar 2022 09:03:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 278E47C127; Wed,  2 Mar 2022 14:03:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D06477D3DA;
	Wed,  2 Mar 2022 14:01:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 02 Mar 2022 14:01:54 +0000
Message-ID: <164622971432.3564931.12184135678781328146.stgit@warthog.procyon.org.uk>
In-Reply-To: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
References: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH 01/19] fscache: export
	fscache_end_operation()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Jeffle Xu <jefflexu@linux.alibaba.com>

Export fscache_end_operation() to avoid code duplication.

Besides, considering the paired fscache_begin_read_operation() is
already exported, it shall make sense to also export
fscache_end_operation().

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/cifs/fscache.c       |    8 --------
 fs/fscache/internal.h   |   11 -----------
 fs/nfs/fscache.c        |    8 --------
 include/linux/fscache.h |   14 ++++++++++++++
 4 files changed, 14 insertions(+), 27 deletions(-)

diff --git a/fs/cifs/fscache.c b/fs/cifs/fscache.c
index 33af72e0ac0c..b47c2011ce5b 100644
--- a/fs/cifs/fscache.c
+++ b/fs/cifs/fscache.c
@@ -134,14 +134,6 @@ void cifs_fscache_release_inode_cookie(struct inode *inode)
 	}
 }
 
-static inline void fscache_end_operation(struct netfs_cache_resources *cres)
-{
-	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
-
-	if (ops)
-		ops->end_operation(cres);
-}
-
 /*
  * Fallback page reading interface.
  */
diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index f121c21590dc..ed1c9ed737f2 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -70,17 +70,6 @@ static inline void fscache_see_cookie(struct fscache_cookie *cookie,
 			     where);
 }
 
-/*
- * io.c
- */
-static inline void fscache_end_operation(struct netfs_cache_resources *cres)
-{
-	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
-
-	if (ops)
-		ops->end_operation(cres);
-}
-
 /*
  * main.c
  */
diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index cfe901650ab0..39654ca72d3d 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -249,14 +249,6 @@ void nfs_fscache_release_file(struct inode *inode, struct file *filp)
 	}
 }
 
-static inline void fscache_end_operation(struct netfs_cache_resources *cres)
-{
-	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
-
-	if (ops)
-		ops->end_operation(cres);
-}
-
 /*
  * Fallback page reading interface.
  */
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 296c5f1d9f35..d2430da8aa67 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -456,6 +456,20 @@ int fscache_begin_read_operation(struct netfs_cache_resources *cres,
 	return -ENOBUFS;
 }
 
+/**
+ * fscache_end_operation - End the read operation for the netfs lib
+ * @cres: The cache resources for the read operation
+ *
+ * Clean up the resources at the end of the read request.
+ */
+static inline void fscache_end_operation(struct netfs_cache_resources *cres)
+{
+	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
+
+	if (ops)
+		ops->end_operation(cres);
+}
+
 /**
  * fscache_read - Start a read from the cache.
  * @cres: The cache resources to use


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

