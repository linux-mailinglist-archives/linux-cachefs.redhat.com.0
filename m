Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F77166D29B
	for <lists+linux-cachefs@lfdr.de>; Tue, 17 Jan 2023 00:09:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673910583;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uHPRodiPTh3RBfKSar9qtCP7fA9UpTX/hopT+Ma7uW4=;
	b=ELOa+iKLupZs8aGfM/2ZlccyYHPK00OXosYVkKP7a/mNPK67Pk3TRehzBID33A9J0+Hsl9
	+/RyEIs1KdxLgV5WvGxcqDjFsUzxOLBn8yk49xvE9VsCuCFehP7Ro4Z048z8Dc/X+Z2bY7
	Kqu7aFm5khDsmkzuQ852qkOkFkbDPdo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-toVsgJrrO965_Xlq8mFDwQ-1; Mon, 16 Jan 2023 18:09:40 -0500
X-MC-Unique: toVsgJrrO965_Xlq8mFDwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08BC3858F09;
	Mon, 16 Jan 2023 23:09:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B647B40C6EC4;
	Mon, 16 Jan 2023 23:09:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0A6A01946595;
	Mon, 16 Jan 2023 23:09:38 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D8BE61946589 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 16 Jan 2023 23:09:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C957840C2006; Mon, 16 Jan 2023 23:09:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3F3140C2064;
 Mon, 16 Jan 2023 23:09:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Date: Mon, 16 Jan 2023 23:09:34 +0000
Message-ID: <167391057444.2311931.12321968641492694017.stgit@warthog.procyon.org.uk>
In-Reply-To: <167391047703.2311931.8115712773222260073.stgit@warthog.procyon.org.uk>
References: <167391047703.2311931.8115712773222260073.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.5
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Linux-cachefs] [PATCH v6 13/34] netfs: Add a function to extract a
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@infradead.org>,
 Rohith Surabattula <rohiths.msft@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
 linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a function to extract the pages from a user-space supplied iterator
(UBUF- or IOVEC-type) into a BVEC-type iterator, retaining the pages by
getting a ref on them (FOLL_SOURCE_BUF is indicated) or pinning them
(FOLL_DEST_BUF is indicated) as we go.

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

Changes:
========
ver #6)
 - Pass in a gup_flags argument to allow FOLL_SOURCE_BUF and FOLL_DEST_BUF
   and other FOLL_* flags to be passed in.
 - Don't pass back the cleanup mode - iov_iter_extract_mode() can be used
   to determine that.

ver #3)
 - Switch to using EXPORT_SYMBOL_GPL to prevent indirect 3rd-party access
   to get/pin_user_pages_fast()[1].

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: linux-cachefs@redhat.com
cc: linux-cifs@vger.kernel.org
cc: linux-fsdevel@vger.kernel.org

Link: https://lore.kernel.org/r/Y3zFzdWnWlEJ8X8/@infradead.org/ [1]
Link: https://lore.kernel.org/r/166697255265.61150.6289490555867717077.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/166732026503.3186319.12020462741051772825.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/166869690376.3723671.8813331570219190705.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/166920904810.1461876.11603559311247187100.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/166997422579.9475.12101700945635692496.stgit@warthog.procyon.org.uk/ # v3
Link: https://lore.kernel.org/r/167305164634.1521586.12199658904363317567.stgit@warthog.procyon.org.uk/ # v4
Link: https://lore.kernel.org/r/167344729278.2425628.3277966637577509831.stgit@warthog.procyon.org.uk/ # v5
---

 fs/netfs/Makefile     |    1 
 fs/netfs/iterator.c   |  102 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h |    2 +
 3 files changed, 105 insertions(+)
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
index 000000000000..f7f26de1a247
--- /dev/null
+++ b/fs/netfs/iterator.c
@@ -0,0 +1,102 @@
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
+ * @gup_flags: Direction indicator and additional flags
+ *
+ * Extract the page fragments from the given amount of the source iterator and
+ * build up a second iterator that refers to all of those bits.  This allows
+ * the original iterator to disposed of.
+ *
+ * @gup_flags should indicate FOLL_SOURCE_BUF or FOLL_DEST_BUF plus any
+ * additional flags needed.
+ *
+ * On success, the number of elements in the bvec is returned, the original
+ * iterator will have been advanced by the amount extracted.
+ *
+ * The iov_iter_extract_mode() function should be used to query how cleanup
+ * should be performed.
+ */
+ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
+				struct iov_iter *new, unsigned int gup_flags)
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
+					     max_pages - npages, gup_flags,
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
index 4c76ddfb6a67..a45757dd382d 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -296,6 +296,8 @@ void netfs_get_subrequest(struct netfs_io_subrequest *subreq,
 void netfs_put_subrequest(struct netfs_io_subrequest *subreq,
 			  bool was_async, enum netfs_sreq_ref_trace what);
 void netfs_stats_show(struct seq_file *);
+ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
+				struct iov_iter *new, unsigned int gup_flags);
 
 /**
  * netfs_inode - Get the netfs inode context from the inode


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

