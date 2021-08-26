Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DC7CC3F8A9F
	for <lists+linux-cachefs@lfdr.de>; Thu, 26 Aug 2021 17:01:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629990072;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1pvd1Or679uimY9tpyoSP13IwwYaVhRWfz5/33Ms8aU=;
	b=DgliGvKe5+SaMNetpYR1RNe64b0iJtpsLDDPipfOrfBQVBhgikktkNo0LFClcHKBrxHqWj
	sba65iHn+5lqQ7+ZUFwWJDAi779DiXeECMbt055HzyxAaRO2A77ObS7DPEajXBpaNX7SSg
	U+z2ifr/Uyq9F6UycD6pR7zxiIcBRHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-Da1dUmj9ODmEjDRTETWX4w-1; Thu, 26 Aug 2021 11:01:11 -0400
X-MC-Unique: Da1dUmj9ODmEjDRTETWX4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE56193920;
	Thu, 26 Aug 2021 15:01:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 433D360C04;
	Thu, 26 Aug 2021 15:01:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07F97181A0F7;
	Thu, 26 Aug 2021 15:01:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17QF1372031076 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 26 Aug 2021 11:01:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8A125C1D5; Thu, 26 Aug 2021 15:01:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F0E62CB37;
	Thu, 26 Aug 2021 15:00:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210826132443.64047-2-jlayton@kernel.org>
References: <20210826132443.64047-2-jlayton@kernel.org>
	<20210826132443.64047-1-jlayton@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Thu, 26 Aug 2021 16:00:58 +0100
Message-ID: <2295996.1629990058@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 17QF1372031076
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH 1/2] netfs: refactor arguments for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2295995.1629990058.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Below is my take on this.  I've moved it earlier in the patchset, so some bits
have migrated to other patches.

---
commit b32c31951d58c605a0993da59de0132cb5ef0723
Author: Jeff Layton <jlayton@kernel.org>
Date:   Thu Aug 26 09:24:42 2021 -0400

    netfs: refactor arguments for netfs_alloc_read_request
    
    Pass start and len to the rreq allocator. This should ensure that the
    fields are set so that init_rreq can use them.
    
    Also add a parameter to indicates the origin of the request.  Ceph can use
    this to tell whether to get caps.
    
    Signed-off-by: Jeff Layton <jlayton@kernel.org>
    Signed-off-by: David Howells <dhowells@redhat.com>

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index b4122653c259..19eb114ebf2a 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -29,8 +29,11 @@ MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
 static void netfs_rreq_work(struct work_struct *);
 static void netfs_rreq_clear_buffer(struct netfs_read_request *);
 
-static struct netfs_read_request *netfs_alloc_read_request(struct address_space *mapping,
-							   struct file *file)
+static struct netfs_read_request *netfs_alloc_read_request(
+	struct address_space *mapping,
+	struct file *file,
+	loff_t start, size_t len,
+	enum netfs_read_origin origin)
 {
 	static atomic_t debug_ids;
 	struct inode *inode = file ? file_inode(file) : mapping->host;
@@ -39,8 +42,11 @@ static struct netfs_read_request *netfs_alloc_read_request(struct address_space
 
 	rreq = kzalloc(sizeof(struct netfs_read_request), GFP_KERNEL);
 	if (rreq) {
+		rreq->start	= start;
+		rreq->len	= len;
 		rreq->mapping	= mapping;
 		rreq->inode	= inode;
+		rreq->origin	= origin;
 		rreq->netfs_ops	= ctx->ops;
 		rreq->i_size	= i_size_read(inode);
 		rreq->debug_id	= atomic_inc_return(&debug_ids);
@@ -1026,11 +1032,12 @@ void netfs_readahead(struct readahead_control *ractl)
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
 
 	ret = netfs_begin_cache_operation(rreq, ctx);
 	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
@@ -1091,11 +1098,10 @@ int netfs_readpage(struct file *file, struct page *subpage)
 
 	_enter("%lx", folio_index(folio));
 
-	rreq = netfs_alloc_read_request(mapping, file);
+	rreq = netfs_alloc_read_request(mapping, file, folio_file_pos(folio),
+					folio_size(folio), NETFS_SYNC_READ);
 	if (!rreq)
 		goto nomem;
-	rreq->start	= folio_file_pos(folio);
-	rreq->len	= folio_size(folio);
 
 	ret = netfs_begin_cache_operation(rreq, ctx);
 	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS) {
@@ -1272,7 +1278,8 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	}
 
 	ret = -ENOMEM;
-	rreq = netfs_alloc_read_request(mapping, file);
+	rreq = netfs_alloc_read_request(mapping, file, folio_file_pos(folio),
+					folio_size(folio), NETFS_READ_FOR_WRITE);
 	if (!rreq)
 		goto error;
 	rreq->start		= folio_file_pos(folio);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index cd572bf1dfa3..210f9414747c 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -168,6 +168,12 @@ struct netfs_read_subrequest {
 #define NETFS_SREQ_NO_PROGRESS		4	/* Set if we didn't manage to read any data */
 };
 
+enum netfs_read_origin {
+	NETFS_READAHEAD,		/* This read was triggered by readahead */
+	NETFS_SYNC_READ,		/* This read is a synchronous read */
+	NETFS_READ_FOR_WRITE,		/* This read is to prepare a write */
+} __mode(byte);
+
 /*
  * Descriptor for a read helper request.  This is used to make multiple I/O
  * requests on a variety of sources and then stitch the result together.
@@ -186,6 +192,7 @@ struct netfs_read_request {
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

