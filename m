Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5253C4CA729
	for <lists+linux-cachefs@lfdr.de>; Wed,  2 Mar 2022 15:05:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646229927;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AN4R3m03ZX1p/aIg25Rp4oLZThDQrTK7CHD6iAc2RUk=;
	b=gbwj5wZGRFFPCfAUlHsdXk/SlP5Lf1iIVOdO2ohJrpowOlSAVT+85Tqdx8YIJ9hqTPw6z+
	mxQmbHGZffVXnK6yanhFCkj68XLacd+cns1ZCXNF/fjhNxddRcuUOJM0ykSEnt4DHoZ/gB
	HYZShUHciA9dw/pmfDT+NkAaoe759Ww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-b1s90VQbPA6osauMQif6GA-1; Wed, 02 Mar 2022 09:05:24 -0500
X-MC-Unique: b1s90VQbPA6osauMQif6GA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C396835DE0;
	Wed,  2 Mar 2022 14:05:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B77B6838D0;
	Wed,  2 Mar 2022 14:05:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 779AA1809C83;
	Wed,  2 Mar 2022 14:05:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 222E5JWU020476 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 2 Mar 2022 09:05:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1871A26E48; Wed,  2 Mar 2022 14:05:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E74926E45;
	Wed,  2 Mar 2022 14:04:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 02 Mar 2022 14:04:50 +0000
Message-ID: <164622989020.3564931.17517006047854958747.stgit@warthog.procyon.org.uk>
In-Reply-To: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
References: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Ilya Dryomov <idryomov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH 05/19] netfs: Refactor arguments for
	netfs_alloc_read_request
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Jeff Layton <jlayton@kernel.org>

Pass start and len to the rreq allocator. This should ensure that the
fields are set so that init_rreq can use them.

Also add a parameter to indicates the origin of the request.  Ceph can use
this to tell whether to get caps.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/netfs/read_helper.c |   25 ++++++++++++++++---------
 include/linux/netfs.h  |    7 +++++++
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index a90b3fbcb93f..37125ed95d1a 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -36,8 +36,11 @@ static void netfs_put_subrequest(struct netfs_io_subrequest *subreq,
 		__netfs_put_subrequest(subreq, was_async);
 }
 
-static struct netfs_io_request *netfs_alloc_read_request(struct address_space *mapping,
-							   struct file *file)
+static struct netfs_io_request *netfs_alloc_read_request(
+	struct address_space *mapping,
+	struct file *file,
+	loff_t start, size_t len,
+	enum netfs_read_origin origin)
 {
 	static atomic_t debug_ids;
 	struct inode *inode = file ? file_inode(file) : mapping->host;
@@ -46,8 +49,11 @@ static struct netfs_io_request *netfs_alloc_read_request(struct address_space *m
 
 	rreq = kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
 	if (rreq) {
+		rreq->start	= start;
+		rreq->len	= len;
 		rreq->mapping	= mapping;
 		rreq->inode	= inode;
+		rreq->origin	= origin;
 		rreq->netfs_ops	= ctx->ops;
 		rreq->i_size	= i_size_read(inode);
 		rreq->debug_id	= atomic_inc_return(&debug_ids);
@@ -874,11 +880,12 @@ void netfs_readahead(struct readahead_control *ractl)
 	if (readahead_count(ractl) == 0)
 		return;
 
-	rreq = netfs_alloc_read_request(ractl->mapping, ractl->file);
+	rreq = netfs_alloc_read_request(ractl->mapping, ractl->file,
+					readahead_pos(ractl),
+					readahead_length(ractl),
+					NETFS_READAHEAD);
 	if (!rreq)
 		return;
-	rreq->start	= readahead_pos(ractl);
-	rreq->len	= readahead_length(ractl);
 
 	if (ctx->ops->begin_cache_operation) {
 		ret = ctx->ops->begin_cache_operation(rreq);
@@ -941,11 +948,10 @@ int netfs_readpage(struct file *file, struct page *subpage)
 
 	_enter("%lx", folio_index(folio));
 
-	rreq = netfs_alloc_read_request(mapping, file);
+	rreq = netfs_alloc_read_request(mapping, file, folio_file_pos(folio),
+					folio_size(folio), NETFS_READPAGE);
 	if (!rreq)
 		goto nomem;
-	rreq->start	= folio_file_pos(folio);
-	rreq->len	= folio_size(folio);
 
 	if (ctx->ops->begin_cache_operation) {
 		ret = ctx->ops->begin_cache_operation(rreq);
@@ -1118,7 +1124,8 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	}
 
 	ret = -ENOMEM;
-	rreq = netfs_alloc_read_request(mapping, file);
+	rreq = netfs_alloc_read_request(mapping, file, folio_file_pos(folio),
+					folio_size(folio), NETFS_READ_FOR_WRITE);
 	if (!rreq)
 		goto error;
 	rreq->start		= folio_file_pos(folio);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 630b0400e9fa..a5434bc80e1c 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -158,6 +158,12 @@ struct netfs_io_subrequest {
 #define NETFS_SREQ_NO_PROGRESS		4	/* Set if we didn't manage to read any data */
 };
 
+enum netfs_read_origin {
+	NETFS_READAHEAD,		/* This read was triggered by readahead */
+	NETFS_READPAGE,			/* This read is a synchronous read */
+	NETFS_READ_FOR_WRITE,		/* This read is to prepare a write */
+} __mode(byte);
+
 /*
  * Descriptor for a read helper request.  This is used to make multiple I/O
  * requests on a variety of sources and then stitch the result together.
@@ -175,6 +181,7 @@ struct netfs_io_request {
 	size_t			submitted;	/* Amount submitted for I/O so far */
 	size_t			len;		/* Length of the request */
 	short			error;		/* 0 or error that occurred */
+	enum netfs_read_origin	origin;		/* Origin of the read */
 	loff_t			i_size;		/* Size of the file */
 	loff_t			start;		/* Start position */
 	pgoff_t			no_unlock_folio; /* Don't unlock this folio after read */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

