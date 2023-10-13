Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E027C89C6
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Oct 2023 18:06:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697213180;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6FXOtTSPVn03NSc2qoVJu6sBySATpfwkTummedt4Wuc=;
	b=WA3OpsNEC6wihHyCDIBBx42Azd4pSDb0AZWEH4/vh537xlqRn6hLPcslnYaN5XfqKJTPhC
	LcHzH2wwhxOdQ+fcPLKacasEN1vvWUiyZzEibSxaxaC3bhuPiUGLu0bTYuGnUdcxyYGIfl
	wbDl2dPDDONtSYKcoxzX3bdMDGDaOR8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-HaNp-3vBO2iPkRuj4TOA5Q-1; Fri, 13 Oct 2023 12:06:17 -0400
X-MC-Unique: HaNp-3vBO2iPkRuj4TOA5Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB02085C06C;
	Fri, 13 Oct 2023 16:06:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFBF9492BD9;
	Fri, 13 Oct 2023 16:06:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A163619465A2;
	Fri, 13 Oct 2023 16:06:16 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3D6591946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Oct 2023 16:06:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2B9EB1C06536; Fri, 13 Oct 2023 16:06:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 950EF1C060DF;
 Fri, 13 Oct 2023 16:06:12 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Date: Fri, 13 Oct 2023 17:04:00 +0100
Message-ID: <20231013160423.2218093-32-dhowells@redhat.com>
In-Reply-To: <20231013160423.2218093-1-dhowells@redhat.com>
References: <20231013160423.2218093-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Subject: [Linux-cachefs] [RFC PATCH 31/53] netfs: Provide
 netfs_file_read_iter()
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide a top-level-ish function that can be pointed to directly by
->read_iter file op.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_read.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/netfs.h    |  1 +
 2 files changed, 34 insertions(+)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 374707df6575..ab9f8e123245 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -564,3 +564,36 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 	_leave(" = %d", ret);
 	return ret;
 }
+
+/**
+ * netfs_file_read_iter - Generic filesystem read routine
+ * @iocb: kernel I/O control block
+ * @iter: destination for the data read
+ *
+ * This is the ->read_iter() routine for all filesystems that can use the page
+ * cache directly.
+ *
+ * The IOCB_NOWAIT flag in iocb->ki_flags indicates that -EAGAIN shall be
+ * returned when no data can be read without waiting for I/O requests to
+ * complete; it doesn't prevent readahead.
+ *
+ * The IOCB_NOIO flag in iocb->ki_flags indicates that no new I/O requests
+ * shall be made for the read or for readahead.  When no data can be read,
+ * -EAGAIN shall be returned.  When readahead would be triggered, a partial,
+ * possibly empty read shall be returned.
+ *
+ * Return:
+ * * number of bytes copied, even for partial reads
+ * * negative error code (or 0 if IOCB_NOIO) if nothing was read
+ */
+ssize_t netfs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
+{
+	struct netfs_inode *ictx = netfs_inode(iocb->ki_filp->f_mapping->host);
+
+	if ((iocb->ki_flags & IOCB_DIRECT) ||
+	    test_bit(NETFS_ICTX_UNBUFFERED, &ictx->flags))
+		return netfs_unbuffered_read_iter(iocb, iter);
+
+	return filemap_read(iocb, iter, 0);
+}
+EXPORT_SYMBOL(netfs_file_read_iter);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index e2a5a441b7fc..6e02a68a51f7 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -384,6 +384,7 @@ struct netfs_cache_ops {
 
 /* High-level read API. */
 ssize_t netfs_unbuffered_read_iter(struct kiocb *iocb, struct iov_iter *iter);
+ssize_t netfs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter);
 
 /* High-level write API */
 ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

