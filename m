Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C298268A3E1
	for <lists+linux-cachefs@lfdr.de>; Fri,  3 Feb 2023 21:59:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675457983;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=58NaOLUwEn97ZDthzHRkgzhwZvGDNikPyB/pPKFXN1Q=;
	b=dOQcwiijjRP8PeLbA1m3NqoQGa3Tv+T8shewXKsQUwHJ5lZKis+yU0F09c/a3cxzbamVys
	YBJ6WgSZOYGhGYOHEWHJ7twW0Y05jxdNf94Px2Tel/hDow3LmxzdsPhNHuEUx95QEvDrVT
	Osp/huM2bNP6DPEfqhpFn74YZH24gW8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-xoeyJAkbMY6Wnt3NoY1QYA-1; Fri, 03 Feb 2023 15:59:42 -0500
X-MC-Unique: xoeyJAkbMY6Wnt3NoY1QYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E2EE885628;
	Fri,  3 Feb 2023 20:59:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE7C4C15BAE;
	Fri,  3 Feb 2023 20:59:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 41DAE19465A3;
	Fri,  3 Feb 2023 20:59:38 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 71CAA1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  3 Feb 2023 20:59:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B453A492C1B; Fri,  3 Feb 2023 20:59:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk.com (unknown [10.33.36.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2023492C14;
 Fri,  3 Feb 2023 20:59:34 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Steve French <smfrench@gmail.com>
Date: Fri,  3 Feb 2023 20:59:19 +0000
Message-Id: <20230203205929.2126634-2-dhowells@redhat.com>
In-Reply-To: <20230203205929.2126634-1-dhowells@redhat.com>
References: <20230203205929.2126634-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH 01/11] netfs: Add a function to extract a
 UBUF or IOVEC into a BVEC iterator
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Tom Talpey <tom@talpey.com>,
 Stefan Metzmacher <metze@samba.org>, Christoph Hellwig <hch@infradead.org>,
 Rohith Surabattula <rohiths.msft@gmail.com>, linux-cifs@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Steve French <sfrench@samba.org>,
 linux-cachefs@redhat.com, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a function to extract the pages from a user-space supplied iterator
(UBUF- or IOVEC-type) into a BVEC-type iterator, retaining the pages by
getting a pin on them (as FOLL_PIN) as we go.

This is useful in three situations:

 (1) A userspace thread may have a sibling that unmaps or remaps the
     process's VM during the operation, changing the assignment of the
     pages and potentially causing an error.  Retaining the pages keeps
     some pages around, even if this occurs; futher, we find out at the
     point of extraction if EFAULT is going to be incurred.

 (2) Pages might get swapped out/discarded if not retained, so we want to
     retain them to avoid the reload causing a deadlock due to a DIO
     from/to an mmapped region on the same file.

 (3) The iterator may get passed to sendmsg() by the filesystem.  If a
     fault occurs, we may get a short write to a TCP stream that's then
     tricky to recover from.

We don't deal with other types of iterator here, leaving it to other
mechanisms to retain the pages (eg. PG_locked, PG_writeback and the pipe
lock).

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: linux-cachefs@redhat.com
cc: linux-cifs@vger.kernel.org
cc: linux-fsdevel@vger.kernel.org
---
 fs/netfs/Makefile     |   1 +
 fs/netfs/iterator.c   | 103 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h |   4 ++
 3 files changed, 108 insertions(+)
 create mode 100644 fs/netfs/iterator.c

diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index f684c0cd1ec5..386d6fb92793 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -3,6 +3,7 @@
 netfs-y := \
 	buffered_read.o \
 	io.o \
+	iterator.o \
 	main.o \
 	objects.o
 
diff --git a/fs/netfs/iterator.c b/fs/netfs/iterator.c
new file mode 100644
index 000000000000..6f0d79080abc
--- /dev/null
+++ b/fs/netfs/iterator.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Iterator helpers.
+ *
+ * Copyright (C) 2022 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/export.h>
+#include <linux/slab.h>
+#include <linux/uio.h>
+#include <linux/netfs.h>
+#include "internal.h"
+
+/**
+ * netfs_extract_user_iter - Extract the pages from a user iterator into a bvec
+ * @orig: The original iterator
+ * @orig_len: The amount of iterator to copy
+ * @new: The iterator to be set up
+ * @extraction_flags: Flags to qualify the request
+ *
+ * Extract the page fragments from the given amount of the source iterator and
+ * build up a second iterator that refers to all of those bits.  This allows
+ * the original iterator to disposed of.
+ *
+ * @extraction_flags can have ITER_ALLOW_P2PDMA set to request peer-to-peer DMA be
+ * allowed on the pages extracted.
+ *
+ * On success, the number of elements in the bvec is returned, the original
+ * iterator will have been advanced by the amount extracted.
+ *
+ * The iov_iter_extract_mode() function should be used to query how cleanup
+ * should be performed.
+ */
+ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
+				struct iov_iter *new,
+				iov_iter_extraction_t extraction_flags)
+{
+	struct bio_vec *bv = NULL;
+	struct page **pages;
+	unsigned int cur_npages;
+	unsigned int max_pages;
+	unsigned int npages = 0;
+	unsigned int i;
+	ssize_t ret;
+	size_t count = orig_len, offset, len;
+	size_t bv_size, pg_size;
+
+	if (WARN_ON_ONCE(!iter_is_ubuf(orig) && !iter_is_iovec(orig)))
+		return -EIO;
+
+	max_pages = iov_iter_npages(orig, INT_MAX);
+	bv_size = array_size(max_pages, sizeof(*bv));
+	bv = kvmalloc(bv_size, GFP_KERNEL);
+	if (!bv)
+		return -ENOMEM;
+
+	/* Put the page list at the end of the bvec list storage.  bvec
+	 * elements are larger than page pointers, so as long as we work
+	 * 0->last, we should be fine.
+	 */
+	pg_size = array_size(max_pages, sizeof(*pages));
+	pages = (void *)bv + bv_size - pg_size;
+
+	while (count && npages < max_pages) {
+		ret = iov_iter_extract_pages(orig, &pages, count,
+					     max_pages - npages, extraction_flags,
+					     &offset);
+		if (ret < 0) {
+			pr_err("Couldn't get user pages (rc=%zd)\n", ret);
+			break;
+		}
+
+		if (ret > count) {
+			pr_err("get_pages rc=%zd more than %zu\n", ret, count);
+			break;
+		}
+
+		count -= ret;
+		ret += offset;
+		cur_npages = DIV_ROUND_UP(ret, PAGE_SIZE);
+
+		if (npages + cur_npages > max_pages) {
+			pr_err("Out of bvec array capacity (%u vs %u)\n",
+			       npages + cur_npages, max_pages);
+			break;
+		}
+
+		for (i = 0; i < cur_npages; i++) {
+			len = ret > PAGE_SIZE ? PAGE_SIZE : ret;
+			bv[npages + i].bv_page	 = *pages++;
+			bv[npages + i].bv_offset = offset;
+			bv[npages + i].bv_len	 = len - offset;
+			ret -= len;
+			offset = 0;
+		}
+
+		npages += cur_npages;
+	}
+
+	iov_iter_bvec(new, orig->data_source, bv, npages, orig_len - count);
+	return npages;
+}
+EXPORT_SYMBOL_GPL(netfs_extract_user_iter);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 4c76ddfb6a67..b11a84f6c32b 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -17,6 +17,7 @@
 #include <linux/workqueue.h>
 #include <linux/fs.h>
 #include <linux/pagemap.h>
+#include <linux/uio.h>
 
 enum netfs_sreq_ref_trace;
 
@@ -296,6 +297,9 @@ void netfs_get_subrequest(struct netfs_io_subrequest *subreq,
 void netfs_put_subrequest(struct netfs_io_subrequest *subreq,
 			  bool was_async, enum netfs_sreq_ref_trace what);
 void netfs_stats_show(struct seq_file *);
+ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
+				struct iov_iter *new,
+				iov_iter_extraction_t extraction_flags);
 
 /**
  * netfs_inode - Get the netfs inode context from the inode
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

