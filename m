Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC904D24DB
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 00:28:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646782125;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eo+8mAf+gjOGyLRK3noe2jB7VNpMpAvor2vix4fWKe8=;
	b=ZmHuIoLy21vrcu7AIvbdf4xutxE+qgMLkDG9KQGabEt4DpRqKX1EoGin8ExNNL8QYKbIXp
	kzJFA7MzjOy49VGRqHCkCbkQyTIQ7UUGY0gXZbvC0jFvxui0AcOCpNg24x+OF3EPm/ZjQp
	0zGnVNdCszX6qI9pFVleDFS2zyuTPDQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-NndLc0MEPp2Ra3S3riSLgw-1; Tue, 08 Mar 2022 18:28:42 -0500
X-MC-Unique: NndLc0MEPp2Ra3S3riSLgw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67D6F18E5281;
	Tue,  8 Mar 2022 23:28:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 19C582166B4F;
	Tue,  8 Mar 2022 23:28:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E62E7195F419;
	Tue,  8 Mar 2022 23:28:40 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 42D88194F4AE for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  8 Mar 2022 23:28:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BEB5A5DBA7; Tue,  8 Mar 2022 23:28:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3C9E5DBA0;
 Tue,  8 Mar 2022 23:28:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Tue, 08 Mar 2022 23:28:05 +0000
Message-ID: <164678208569.1200972.12153682697842916557.stgit@warthog.procyon.org.uk>
In-Reply-To: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
References: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Subject: [Linux-cachefs] [PATCH v2 10/19] netfs: Refactor arguments for
 netfs_alloc_read_request
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
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Jeff Layton <jlayton@kernel.org>

Pass start and len to the rreq allocator. This should ensure that the
fields are set so that ->init_request() can use them.

Also add a parameter to indicates the origin of the request.  Ceph can use
this to tell whether to get caps.

Changes
=======
ver #2)
 - Show the request origin in the netfs_rreq tracepoint.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com

Link: https://lore.kernel.org/r/164622989020.3564931.17517006047854958747.stgit@warthog.procyon.org.uk/ # v1
---

 fs/netfs/internal.h          |    7 +++++--
 fs/netfs/objects.c           |   13 ++++++++++---
 fs/netfs/read_helper.c       |   23 +++++++++++------------
 include/linux/netfs.h        |    7 +++++++
 include/trace/events/netfs.h |   11 ++++++++++-
 5 files changed, 43 insertions(+), 18 deletions(-)

diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index a0b7d1bf9f3d..89837e904fa7 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -17,9 +17,12 @@
 /*
  * objects.c
  */
-struct netfs_io_request *netfs_alloc_request(const struct netfs_request_ops *ops,
+struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
+					     struct file *file,
+					     const struct netfs_request_ops *ops,
 					     void *netfs_priv,
-					     struct file *file);
+					     loff_t start, size_t len,
+					     enum netfs_io_origin origin);
 void netfs_get_request(struct netfs_io_request *rreq, enum netfs_rreq_ref_trace what);
 void netfs_clear_subrequests(struct netfs_io_request *rreq, bool was_async);
 void netfs_put_request(struct netfs_io_request *rreq, bool was_async,
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 39097893e847..986d7a9d25dd 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -11,17 +11,24 @@
 /*
  * Allocate an I/O request and initialise it.
  */
-struct netfs_io_request *netfs_alloc_request(
-	const struct netfs_request_ops *ops, void *netfs_priv,
-	struct file *file)
+struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
+					     struct file *file,
+					     const struct netfs_request_ops *ops,
+					     void *netfs_priv,
+					     loff_t start, size_t len,
+					     enum netfs_io_origin origin)
 {
 	static atomic_t debug_ids;
 	struct netfs_io_request *rreq;
 
 	rreq = kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
 	if (rreq) {
+		rreq->start	= start;
+		rreq->len	= len;
+		rreq->origin	= origin;
 		rreq->netfs_ops	= ops;
 		rreq->netfs_priv = netfs_priv;
+		rreq->mapping	= mapping;
 		rreq->inode	= file_inode(file);
 		rreq->i_size	= i_size_read(rreq->inode);
 		rreq->debug_id	= atomic_inc_return(&debug_ids);
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 8f277da487b6..dea085715286 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -763,12 +763,13 @@ void netfs_readahead(struct readahead_control *ractl,
 	if (readahead_count(ractl) == 0)
 		goto cleanup;
 
-	rreq = netfs_alloc_request(ops, netfs_priv, ractl->file);
+	rreq = netfs_alloc_request(ractl->mapping, ractl->file,
+				   ops, netfs_priv,
+				   readahead_pos(ractl),
+				   readahead_length(ractl),
+				   NETFS_READAHEAD);
 	if (!rreq)
 		goto cleanup;
-	rreq->mapping	= ractl->mapping;
-	rreq->start	= readahead_pos(ractl);
-	rreq->len	= readahead_length(ractl);
 
 	if (ops->begin_cache_operation) {
 		ret = ops->begin_cache_operation(rreq);
@@ -838,16 +839,15 @@ int netfs_readpage(struct file *file,
 
 	_enter("%lx", folio_index(folio));
 
-	rreq = netfs_alloc_request(ops, netfs_priv, file);
+	rreq = netfs_alloc_request(folio->mapping, file, ops, netfs_priv,
+				   folio_file_pos(folio), folio_size(folio),
+				   NETFS_READPAGE);
 	if (!rreq) {
 		if (netfs_priv)
 			ops->cleanup(folio_file_mapping(folio), netfs_priv);
 		folio_unlock(folio);
 		return -ENOMEM;
 	}
-	rreq->mapping	= folio_file_mapping(folio);
-	rreq->start	= folio_file_pos(folio);
-	rreq->len	= folio_size(folio);
 
 	if (ops->begin_cache_operation) {
 		ret = ops->begin_cache_operation(rreq);
@@ -1008,12 +1008,11 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	}
 
 	ret = -ENOMEM;
-	rreq = netfs_alloc_request(ops, netfs_priv, file);
+	rreq = netfs_alloc_request(mapping, file, ops, netfs_priv,
+				   folio_file_pos(folio), folio_size(folio),
+				   NETFS_READ_FOR_WRITE);
 	if (!rreq)
 		goto error;
-	rreq->mapping		= folio_file_mapping(folio);
-	rreq->start		= folio_file_pos(folio);
-	rreq->len		= folio_size(folio);
 	rreq->no_unlock_folio	= folio_index(folio);
 	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
 	netfs_priv = NULL;
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index c702bd8ea8da..7dc741d9b21b 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -150,6 +150,12 @@ struct netfs_io_subrequest {
 #define NETFS_SREQ_NO_PROGRESS		4	/* Set if we didn't manage to read any data */
 };
 
+enum netfs_io_origin {
+	NETFS_READAHEAD,		/* This read was triggered by readahead */
+	NETFS_READPAGE,			/* This read is a synchronous read */
+	NETFS_READ_FOR_WRITE,		/* This read is to prepare a write */
+} __mode(byte);
+
 /*
  * Descriptor for an I/O helper request.  This is used to make multiple I/O
  * operations to a variety of data stores and then stitch the result together.
@@ -167,6 +173,7 @@ struct netfs_io_request {
 	size_t			submitted;	/* Amount submitted for I/O so far */
 	size_t			len;		/* Length of the request */
 	short			error;		/* 0 or error that occurred */
+	enum netfs_io_origin	origin;		/* Origin of the request */
 	loff_t			i_size;		/* Size of the file */
 	loff_t			start;		/* Start position */
 	pgoff_t			no_unlock_folio; /* Don't unlock this folio after read */
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 273ae5f6a54c..685b07573394 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -21,6 +21,11 @@
 	EM(netfs_read_trace_readpage,		"READPAGE ")	\
 	E_(netfs_read_trace_write_begin,	"WRITEBEGN")
 
+#define netfs_rreq_origins					\
+	EM(NETFS_READAHEAD,			"RA")		\
+	EM(NETFS_READPAGE,			"RP")		\
+	E_(NETFS_READ_FOR_WRITE,		"RW")
+
 #define netfs_rreq_traces					\
 	EM(netfs_rreq_trace_assess,		"ASSESS ")	\
 	EM(netfs_rreq_trace_copy,		"COPY   ")	\
@@ -101,6 +106,7 @@ enum netfs_sreq_ref_trace { netfs_sreq_ref_traces } __mode(byte);
 #define E_(a, b) TRACE_DEFINE_ENUM(a);
 
 netfs_read_traces;
+netfs_rreq_origins;
 netfs_rreq_traces;
 netfs_sreq_sources;
 netfs_sreq_traces;
@@ -159,17 +165,20 @@ TRACE_EVENT(netfs_rreq,
 	    TP_STRUCT__entry(
 		    __field(unsigned int,		rreq		)
 		    __field(unsigned int,		flags		)
+		    __field(enum netfs_io_origin,	origin		)
 		    __field(enum netfs_rreq_trace,	what		)
 			     ),
 
 	    TP_fast_assign(
 		    __entry->rreq	= rreq->debug_id;
 		    __entry->flags	= rreq->flags;
+		    __entry->origin	= rreq->origin;
 		    __entry->what	= what;
 			   ),
 
-	    TP_printk("R=%08x %s f=%02x",
+	    TP_printk("R=%08x %s %s f=%02x",
 		      __entry->rreq,
+		      __print_symbolic(__entry->origin, netfs_rreq_origins),
 		      __print_symbolic(__entry->what, netfs_rreq_traces),
 		      __entry->flags)
 	    );


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

