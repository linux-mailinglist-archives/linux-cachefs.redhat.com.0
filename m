Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE587C893D
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Oct 2023 17:57:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697212664;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4IS6/rxq95I0RN/n0obRxzgWYHGtHYcIHwIRwkxGfsE=;
	b=dIJhAJmk7XHwGNHZv9V6yzmpRXHNcdlQEffOiB16YYz18e6aPyu7nWGWTlvyUbHndW8Mjt
	b8iszgaYWy9TmoxpNhl9DG1iZqO7aRPrgRmy3IyHs6nNG7i+1WTxBPrxZA9C4gz6saQXUi
	VmH6UMWWebJujNLP/82kV/KB6OcVonw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-z71o5BAhN3mWKxlN-ugh3w-1; Fri, 13 Oct 2023 11:57:41 -0400
X-MC-Unique: z71o5BAhN3mWKxlN-ugh3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1A15801E80;
	Fri, 13 Oct 2023 15:57:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 984381C06535;
	Fri, 13 Oct 2023 15:57:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 578491946589;
	Fri, 13 Oct 2023 15:57:40 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0DB4E1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Oct 2023 15:57:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F24BE25D9; Fri, 13 Oct 2023 15:57:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4664425C0;
 Fri, 13 Oct 2023 15:57:36 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Date: Fri, 13 Oct 2023 16:56:35 +0100
Message-ID: <20231013155727.2217781-3-dhowells@redhat.com>
In-Reply-To: <20231013155727.2217781-1-dhowells@redhat.com>
References: <20231013155727.2217781-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Subject: [Linux-cachefs] [RFC PATCH 02/53] netfs: Track the fpos above which
 the server has no data
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-kernel@vger.kernel.org,
 linux-cifs@vger.kernel.org, netdev@vger.kernel.org,
 Dominique Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-mm@kvack.org,
 Marc Dionne <marc.dionne@auristor.com>, v9fs@lists.linux.dev,
 Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
 Christian Brauner <christian@brauner.io>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Track the file position above which the server is not expected to have any
data and preemptively assume that we can simply fill blocks with zeroes
locally rather than attempting to download them - even if we've written
data back to the server.  Assume that any data that was written back above
that position is held in the local cache.  Call this the "zero point".

Make use of this to optimise away some reads from the server.  We need to
set the zero point in the following circumstances:

 (1) When we see an extant remote inode and have no cache for it, we set
     the zero_point to i_size.

 (2) On local inode creation, we set zero_point to 0.

 (3) On local truncation down, we reduce zero_point to the new i_size if
     the new i_size is lower.

 (4) On local truncation up, we don't change zero_point.

 (5) On local modification, we don't change zero_point.

 (6) On remote invalidation, we set zero_point to the new i_size.

 (7) If stored data is culled from the local cache, we must set zero_point
     above that if the data also got written to the server.

 (8) If dirty data is written back to the server, but not the local cache,
     we must set zero_point above that.

Assuming the above, any read from the server at or above the zero_point
position will return all zeroes.

The zero_point value can be stored in the cache, provided the above rules
are applied to it by any code that culls part of the local cache.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/afs/inode.c           | 13 +++++++------
 fs/netfs/buffered_read.c | 40 +++++++++++++++++++++++++---------------
 include/linux/netfs.h    |  5 +++++
 3 files changed, 37 insertions(+), 21 deletions(-)

diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 1c794a1896aa..46bc5574d6f5 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -252,6 +252,7 @@ static void afs_apply_status(struct afs_operation *op,
 		vnode->netfs.remote_i_size = status->size;
 		if (change_size) {
 			afs_set_i_size(vnode, status->size);
+			vnode->netfs.zero_point = status->size;
 			inode_set_ctime_to_ts(inode, t);
 			inode->i_atime = t;
 		}
@@ -865,17 +866,17 @@ static void afs_setattr_success(struct afs_operation *op)
 static void afs_setattr_edit_file(struct afs_operation *op)
 {
 	struct afs_vnode_param *vp = &op->file[0];
-	struct inode *inode = &vp->vnode->netfs.inode;
+	struct afs_vnode *vnode = vp->vnode;
 
 	if (op->setattr.attr->ia_valid & ATTR_SIZE) {
 		loff_t size = op->setattr.attr->ia_size;
 		loff_t i_size = op->setattr.old_i_size;
 
-		if (size < i_size)
-			truncate_pagecache(inode, size);
-		if (size != i_size)
-			fscache_resize_cookie(afs_vnode_cache(vp->vnode),
-					      vp->scb.status.size);
+		if (size != i_size) {
+			truncate_pagecache(&vnode->netfs.inode, size);
+			netfs_resize_file(&vnode->netfs, size);
+			fscache_resize_cookie(afs_vnode_cache(vnode), size);
+		}
 	}
 }
 
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 2cd3ccf4c439..a2852fa64ad0 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -147,6 +147,22 @@ static void netfs_rreq_expand(struct netfs_io_request *rreq,
 	}
 }
 
+/*
+ * Begin an operation, and fetch the stored zero point value from the cookie if
+ * available.
+ */
+static int netfs_begin_cache_operation(struct netfs_io_request *rreq,
+				       struct netfs_inode *ctx)
+{
+	int ret = -ENOBUFS;
+
+	if (ctx->ops->begin_cache_operation) {
+		ret = ctx->ops->begin_cache_operation(rreq);
+		/* TODO: Get the zero point value from the cache */
+	}
+	return ret;
+}
+
 /**
  * netfs_readahead - Helper to manage a read request
  * @ractl: The description of the readahead request
@@ -180,11 +196,9 @@ void netfs_readahead(struct readahead_control *ractl)
 	if (IS_ERR(rreq))
 		return;
 
-	if (ctx->ops->begin_cache_operation) {
-		ret = ctx->ops->begin_cache_operation(rreq);
-		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
-			goto cleanup_free;
-	}
+	ret = netfs_begin_cache_operation(rreq, ctx);
+	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
+		goto cleanup_free;
 
 	netfs_stat(&netfs_n_rh_readahead);
 	trace_netfs_read(rreq, readahead_pos(ractl), readahead_length(ractl),
@@ -238,11 +252,9 @@ int netfs_read_folio(struct file *file, struct folio *folio)
 		goto alloc_error;
 	}
 
-	if (ctx->ops->begin_cache_operation) {
-		ret = ctx->ops->begin_cache_operation(rreq);
-		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
-			goto discard;
-	}
+	ret = netfs_begin_cache_operation(rreq, ctx);
+	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
+		goto discard;
 
 	netfs_stat(&netfs_n_rh_readpage);
 	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
@@ -390,11 +402,9 @@ int netfs_write_begin(struct netfs_inode *ctx,
 	rreq->no_unlock_folio	= folio_index(folio);
 	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
 
-	if (ctx->ops->begin_cache_operation) {
-		ret = ctx->ops->begin_cache_operation(rreq);
-		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
-			goto error_put;
-	}
+	ret = netfs_begin_cache_operation(rreq, ctx);
+	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
+		goto error_put;
 
 	netfs_stat(&netfs_n_rh_write_begin);
 	trace_netfs_read(rreq, pos, len, netfs_read_trace_write_begin);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index b447cb67f599..282511090ead 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -129,6 +129,8 @@ struct netfs_inode {
 	struct fscache_cookie	*cache;
 #endif
 	loff_t			remote_i_size;	/* Size of the remote file */
+	loff_t			zero_point;	/* Size after which we assume there's no data
+						 * on the server */
 };
 
 /*
@@ -330,6 +332,7 @@ static inline void netfs_inode_init(struct netfs_inode *ctx,
 {
 	ctx->ops = ops;
 	ctx->remote_i_size = i_size_read(&ctx->inode);
+	ctx->zero_point = ctx->remote_i_size;
 #if IS_ENABLED(CONFIG_FSCACHE)
 	ctx->cache = NULL;
 #endif
@@ -345,6 +348,8 @@ static inline void netfs_inode_init(struct netfs_inode *ctx,
 static inline void netfs_resize_file(struct netfs_inode *ctx, loff_t new_i_size)
 {
 	ctx->remote_i_size = new_i_size;
+	if (new_i_size < ctx->zero_point)
+		ctx->zero_point = new_i_size;
 }
 
 /**
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

