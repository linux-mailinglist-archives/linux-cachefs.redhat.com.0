Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 119204D24C9
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 00:25:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646781925;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=r8oULLThNYy8bVXEi0A1DJzzfam/UEL6R5aO/tkw21I=;
	b=jDdrwSq8WhMYkJfXYEROTZZ7ASqmyi4zFqeHGAF2zaZIKECGirFoH1MNsS5OMNEmz+2eRd
	i6gfS3DmoUE/oout14WnMFLvWwdA+9s8gLc90cI+fSpeSh4R1ACBtWJL7C8ixkItAQ4kqZ
	WL7DupVNJaH6YRlg14bBQ452VwFrJ/U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-BcJCOuX0OSaXsuYMqvJxvw-1; Tue, 08 Mar 2022 18:25:22 -0500
X-MC-Unique: BcJCOuX0OSaXsuYMqvJxvw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 898D9857A82;
	Tue,  8 Mar 2022 23:25:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EDC41410F3B;
	Tue,  8 Mar 2022 23:25:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2F1FA1932131;
	Tue,  8 Mar 2022 23:25:21 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D02041932129 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  8 Mar 2022 23:25:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4C60E1006918; Tue,  8 Mar 2022 23:25:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A1021006910;
 Tue,  8 Mar 2022 23:25:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Tue, 08 Mar 2022 23:25:03 +0000
Message-ID: <164678190346.1200972.7453733431978569479.stgit@warthog.procyon.org.uk>
In-Reply-To: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
References: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Subject: [Linux-cachefs] [PATCH v2 01/19] fscache: export
 fscache_end_operation()
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
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

Link: https://lore.kernel.org/r/20220302125134.131039-2-jefflexu@linux.alibaba.com/ # Jeffle's v4
Link: https://lore.kernel.org/r/164622971432.3564931.12184135678781328146.stgit@warthog.procyon.org.uk/ # v1
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

