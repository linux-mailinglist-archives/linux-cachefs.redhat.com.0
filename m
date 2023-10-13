Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A087C89D5
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Oct 2023 18:06:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697213209;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fS0QTyECqEb0OKCVQTqt/YrBsaWIZ9prDA7xycQRnqE=;
	b=b7Sj4IMjNPnfDPw8OcRNxHWtWXdo7+LB2JLSQI6TfkdmYcEjwAKHXriPyA78AFFQrzGK7S
	J+de3H3VrIzwu6Wtttshb1ZsKa+S2QnaXmgsLxZFaav1vqTzGVZmsoEkeOQrWYOoFVDTNb
	Gx6guNno14W2dyXpf/6q7P+DnkuD+lg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-B5B-GO9ZOuynBCCLbeFwlA-1; Fri, 13 Oct 2023 12:06:46 -0400
X-MC-Unique: B5B-GO9ZOuynBCCLbeFwlA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B65E42810D53;
	Fri, 13 Oct 2023 16:06:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD5742157F5A;
	Fri, 13 Oct 2023 16:06:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 72B3119465A2;
	Fri, 13 Oct 2023 16:06:45 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 20AED1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Oct 2023 16:06:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 11FAA1C06536; Fri, 13 Oct 2023 16:06:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83A9F1C060DF;
 Fri, 13 Oct 2023 16:06:41 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Date: Fri, 13 Oct 2023 17:04:08 +0100
Message-ID: <20231013160423.2218093-40-dhowells@redhat.com>
In-Reply-To: <20231013160423.2218093-1-dhowells@redhat.com>
References: <20231013160423.2218093-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Subject: [Linux-cachefs] [RFC PATCH 39/53] netfs: Provide a launder_folio
 implementation
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
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 netdev@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com, linux-mm@kvack.org,
 Marc Dionne <marc.dionne@auristor.com>, v9fs@lists.linux.dev,
 Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
 Christian Brauner <christian@brauner.io>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide a launder_folio implementation for netfslib.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_write.c    | 71 ++++++++++++++++++++++++++++++++++++
 fs/netfs/main.c              |  1 +
 include/linux/netfs.h        |  2 +
 include/trace/events/netfs.h |  3 ++
 4 files changed, 77 insertions(+)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index b81d807f89f0..5695bc3acf6c 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -1101,3 +1101,74 @@ int netfs_writepages(struct address_space *mapping,
 	return ret;
 }
 EXPORT_SYMBOL(netfs_writepages);
+
+/*
+ * Deal with the disposition of a laundered folio.
+ */
+static void netfs_cleanup_launder_folio(struct netfs_io_request *wreq)
+{
+	if (wreq->error) {
+		pr_notice("R=%08x Laundering error %d\n", wreq->debug_id, wreq->error);
+		mapping_set_error(wreq->mapping, wreq->error);
+	}
+}
+
+/**
+ * netfs_launder_folio - Clean up a dirty folio that's being invalidated
+ * @folio: The folio to clean
+ *
+ * This is called to write back a folio that's being invalidated when an inode
+ * is getting torn down.  Ideally, writepages would be used instead.
+ */
+int netfs_launder_folio(struct folio *folio)
+{
+	struct netfs_io_request *wreq;
+	struct address_space *mapping = folio->mapping;
+	struct netfs_folio *finfo;
+	struct bio_vec bvec;
+	unsigned long long i_size = i_size_read(mapping->host);
+	unsigned long long start = folio_pos(folio);
+	size_t offset = 0, len;
+	int ret = 0;
+
+	finfo = netfs_folio_info(folio);
+	if (finfo) {
+		offset = finfo->dirty_offset;
+		start += offset;
+		len = finfo->dirty_len;
+	} else {
+		len = folio_size(folio);
+	}
+	len = min_t(unsigned long long, len, i_size - start);
+
+	wreq = netfs_alloc_request(mapping, NULL, start, len, NETFS_LAUNDER_WRITE);
+	if (IS_ERR(wreq)) {
+		ret = PTR_ERR(wreq);
+		goto out;
+	}
+
+	if (!folio_clear_dirty_for_io(folio))
+		goto out_put;
+
+	trace_netfs_folio(folio, netfs_folio_trace_launder);
+
+	_debug("launder %llx-%llx", start, start + len - 1);
+
+	/* Speculatively write to the cache.  We have to fix this up later if
+	 * the store fails.
+	 */
+	wreq->cleanup = netfs_cleanup_launder_folio;
+
+	bvec_set_folio(&bvec, folio, len, offset);
+	iov_iter_bvec(&wreq->iter, ITER_SOURCE, &bvec, 1, len);
+	__set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags);
+	ret = netfs_begin_write(wreq, true, netfs_write_trace_launder);
+
+out_put:
+	netfs_put_request(wreq, false, netfs_rreq_trace_put_return);
+out:
+	folio_wait_fscache(folio);
+	_leave(" = %d", ret);
+	return ret;
+}
+EXPORT_SYMBOL(netfs_launder_folio);
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index b335e6a50f9c..577c8a9fc0f2 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -33,6 +33,7 @@ static const char *netfs_origins[nr__netfs_io_origin] = {
 	[NETFS_READPAGE]		= "RP",
 	[NETFS_READ_FOR_WRITE]		= "RW",
 	[NETFS_WRITEBACK]		= "WB",
+	[NETFS_LAUNDER_WRITE]		= "LW",
 	[NETFS_RMW_READ]		= "RM",
 	[NETFS_UNBUFFERED_WRITE]	= "UW",
 	[NETFS_DIO_READ]		= "DR",
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 9661ae24120f..d4a1073cc541 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -234,6 +234,7 @@ enum netfs_io_origin {
 	NETFS_READPAGE,			/* This read is a synchronous read */
 	NETFS_READ_FOR_WRITE,		/* This read is to prepare a write */
 	NETFS_WRITEBACK,		/* This write was triggered by writepages */
+	NETFS_LAUNDER_WRITE,		/* This is triggered by ->launder_folio() */
 	NETFS_RMW_READ,			/* This is an unbuffered read for RMW */
 	NETFS_UNBUFFERED_WRITE,		/* This is an unbuffered write */
 	NETFS_DIO_READ,			/* This is a direct I/O read */
@@ -422,6 +423,7 @@ int netfs_writepages(struct address_space *mapping,
 		     struct writeback_control *wbc);
 void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool netfs_release_folio(struct folio *folio, gfp_t gfp);
+int netfs_launder_folio(struct folio *folio);
 
 /* VMA operations API. */
 vm_fault_t netfs_page_mkwrite(struct vm_fault *vmf, struct netfs_group *netfs_group);
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 825946f510ee..54b2d781d3a9 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -25,6 +25,7 @@
 
 #define netfs_write_traces					\
 	EM(netfs_write_trace_dio_write,		"DIO-WRITE")	\
+	EM(netfs_write_trace_launder,		"LAUNDER  ")	\
 	EM(netfs_write_trace_unbuffered_write,	"UNB-WRITE")	\
 	E_(netfs_write_trace_writeback,		"WRITEBACK")
 
@@ -33,6 +34,7 @@
 	EM(NETFS_READPAGE,			"RP")		\
 	EM(NETFS_READ_FOR_WRITE,		"RW")		\
 	EM(NETFS_WRITEBACK,			"WB")		\
+	EM(NETFS_LAUNDER_WRITE,			"LW")		\
 	EM(NETFS_RMW_READ,			"RM")		\
 	EM(NETFS_UNBUFFERED_WRITE,		"UW")		\
 	EM(NETFS_DIO_READ,			"DR")		\
@@ -129,6 +131,7 @@
 	EM(netfs_folio_trace_clear_g,		"clear-g")	\
 	EM(netfs_folio_trace_filled_gaps,	"filled-gaps")	\
 	EM(netfs_folio_trace_kill,		"kill")		\
+	EM(netfs_folio_trace_launder,		"launder")	\
 	EM(netfs_folio_trace_mkwrite,		"mkwrite")	\
 	EM(netfs_folio_trace_mkwrite_plus,	"mkwrite+")	\
 	EM(netfs_folio_trace_read_gaps,		"read-gaps")	\
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

