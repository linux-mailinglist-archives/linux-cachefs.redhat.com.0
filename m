Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 704754CA77F
	for <lists+linux-cachefs@lfdr.de>; Wed,  2 Mar 2022 15:09:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646230141;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iVy9OOwL5YqVzNUsNG/WC4aG8GmQ5HkXK1r1YZ/KMIs=;
	b=MBeOallUyQrGc70nis6/biPyoWuMB4pFPJJxLErx/EJ+ChT469MMJL3hsIN2tIkidFTxcs
	d9hQwXEyXIYaC+FeEjDy/ugxB2sbOzT68RJ5MCmiktGXwilEoBzRTXuhzyO+s4qs8/i594
	9FjUWuS2MARATY/XKej3/lbCFK12id4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-p6U9SHVwPq2cV8gbWg8A3g-1; Wed, 02 Mar 2022 09:08:55 -0500
X-MC-Unique: p6U9SHVwPq2cV8gbWg8A3g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 811851091DA1;
	Wed,  2 Mar 2022 14:08:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 752E97B608;
	Wed,  2 Mar 2022 14:08:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 339E71809CB3;
	Wed,  2 Mar 2022 14:08:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 222E8p8N021189 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 2 Mar 2022 09:08:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0BACA8359D; Wed,  2 Mar 2022 14:08:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB9158378A;
	Wed,  2 Mar 2022 14:08:38 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 02 Mar 2022 14:08:38 +0000
Message-ID: <164623011809.3564931.17244403673288197944.stgit@warthog.procyon.org.uk>
In-Reply-To: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
References: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [Linux-cachefs] [PATCH 17/19] netfs: Change ->init_rreq() to return
	an error code
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change the read-request initialisation function to return an error code so
that the network filesystem can return a failure (ENOMEM, for example).

This will also allow ceph to abort a ->readahead() op if the server refuses
to give it a cap allowing local caching from within the netfslib framework
(errors aren't passed back through ->readahead(), so returning, say,
-ENOBUFS will cause the op to be aborted).

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/9p/vfs_addr.c         |    3 ++-
 fs/afs/file.c            |    3 ++-
 fs/netfs/buffered_read.c |   15 +++++++++------
 fs/netfs/objects.c       |   40 ++++++++++++++++++++++++----------------
 include/linux/netfs.h    |    2 +-
 5 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 840111da1172..e50326d11e8f 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -56,12 +56,13 @@ static void v9fs_issue_read(struct netfs_io_subrequest *subreq)
  * @rreq: The read request
  * @file: The file being read from
  */
-static void v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
+static int v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
 {
 	struct p9_fid *fid = file->private_data;
 
 	refcount_inc(&fid->count);
 	rreq->netfs_priv = fid;
+	return 0;
 }
 
 /**
diff --git a/fs/afs/file.c b/fs/afs/file.c
index aef0fbbd834d..2b68b2070248 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -357,9 +357,10 @@ static int afs_symlink_readpage(struct file *file, struct page *page)
 	return ret;
 }
 
-static void afs_init_request(struct netfs_io_request *rreq, struct file *file)
+static int afs_init_request(struct netfs_io_request *rreq, struct file *file)
 {
 	rreq->netfs_priv = key_get(afs_file_key(file));
+	return 0;
 }
 
 static int afs_begin_cache_operation(struct netfs_io_request *rreq)
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 343c0957ae27..64049e123185 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -167,7 +167,7 @@ void netfs_readahead(struct readahead_control *ractl)
 				   readahead_pos(ractl),
 				   readahead_length(ractl),
 				   NETFS_READAHEAD);
-	if (!rreq)
+	if (IS_ERR(rreq))
 		return;
 
 	if (ctx->ops->begin_cache_operation) {
@@ -223,8 +223,10 @@ int netfs_readpage(struct file *file, struct page *subpage)
 
 	rreq = netfs_alloc_request(mapping, file, folio_file_pos(folio),
 				   folio_size(folio), NETFS_READPAGE);
-	if (!rreq)
-		goto nomem;
+	if (IS_ERR(rreq)) {
+		ret = PTR_ERR(rreq);
+		goto alloc_error;
+	}
 
 	if (ctx->ops->begin_cache_operation) {
 		ret = ctx->ops->begin_cache_operation(rreq);
@@ -238,7 +240,7 @@ int netfs_readpage(struct file *file, struct page *subpage)
 
 discard:
 	netfs_put_request(rreq, false, netfs_rreq_trace_put_discard);
-nomem:
+alloc_error:
 	folio_unlock(folio);
 	return ret;
 }
@@ -371,11 +373,12 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 		goto have_folio_no_wait;
 	}
 
-	ret = -ENOMEM;
 	rreq = netfs_alloc_request(mapping, file, folio_file_pos(folio),
 				   folio_size(folio), NETFS_READ_FOR_WRITE);
-	if (!rreq)
+	if (IS_ERR(rreq)) {
+		ret = PTR_ERR(rreq);
 		goto error;
+	}
 	rreq->start		= folio_file_pos(folio);
 	rreq->len		= folio_size(folio);
 	rreq->no_unlock_folio	= folio_index(folio);
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 8f99269c5344..d8a07df03427 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -20,26 +20,34 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	struct inode *inode = file ? file_inode(file) : mapping->host;
 	struct netfs_i_context *ctx = netfs_i_context(inode);
 	struct netfs_io_request *rreq;
+	int ret;
 
 	rreq = kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
-	if (rreq) {
-		rreq->start	= start;
-		rreq->len	= len;
-		rreq->mapping	= mapping;
-		rreq->inode	= inode;
-		rreq->origin	= origin;
-		rreq->netfs_ops	= ctx->ops;
-		rreq->i_size	= i_size_read(inode);
-		rreq->debug_id	= atomic_inc_return(&debug_ids);
-		INIT_LIST_HEAD(&rreq->subrequests);
-		INIT_WORK(&rreq->work, NULL);
-		refcount_set(&rreq->ref, 1);
-		__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
-		if (ctx->ops->init_request)
-			ctx->ops->init_request(rreq, file);
-		netfs_stat(&netfs_n_rh_rreq);
+	if (!rreq)
+		return ERR_PTR(-ENOMEM);
+
+	rreq->start	= start;
+	rreq->len	= len;
+	rreq->mapping	= mapping;
+	rreq->inode	= inode;
+	rreq->origin	= origin;
+	rreq->netfs_ops	= ctx->ops;
+	rreq->i_size	= i_size_read(inode);
+	rreq->debug_id	= atomic_inc_return(&debug_ids);
+	INIT_LIST_HEAD(&rreq->subrequests);
+	INIT_WORK(&rreq->work, NULL);
+	refcount_set(&rreq->ref, 1);
+	__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
+
+	if (ctx->ops->init_request) {
+		ret = ctx->ops->init_request(rreq, file);
+		if (ret < 0) {
+			kfree(rreq);
+			return ERR_PTR(ret);
+		}
 	}
 
+	netfs_stat(&netfs_n_rh_rreq);
 	return rreq;
 }
 
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 725b8fb8e4bb..c925596c1bb3 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -202,7 +202,7 @@ struct netfs_io_request {
  * Operations the network filesystem can/must provide to the helpers.
  */
 struct netfs_request_ops {
-	void (*init_request)(struct netfs_io_request *rreq, struct file *file);
+	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
 	int (*begin_cache_operation)(struct netfs_io_request *rreq);
 	void (*expand_readahead)(struct netfs_io_request *rreq);
 	bool (*clamp_length)(struct netfs_io_subrequest *subreq);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

