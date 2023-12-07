Return-Path: <linux-cachefs+bncBDLIXLMFVAERBBPQZCVQMGQEZQONCYQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C9A809388
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:24:22 +0100 (CET)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-423f290bbfdsf44553961cf.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:24:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984261; cv=pass;
        d=google.com; s=arc-20160816;
        b=hMI6I6oXtKMgJFRcGENUiUZkTsFBIanpzR6i+6uhH64+V5B/LBPyXEirm1DnuGZxNB
         gMSAdUWQC93XOpvtR6yh1vwreWEFUWs+RJ7R3vI+TaiVzFFqQi0I+tt61RtnJI4bd3+6
         A6M07gIpolfMejf4LsZpZ6BAmVHolravi9+Xj+uRkp33sk1qYw0k7DRiLxGebK7LDWWB
         RdnixccLev3XEA4lkEPzE8L7rWmeIk6nZKAO5ENhJY2MJqMKKtexNuSoe5BdJFyATfxP
         asO4esByKC0OgzwDFCGbg47NtaXLbzS0pGjkSbAcckleVEQMgs4eoiwzdXer1yZ1DEvF
         XP7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=X0phQIAJGr/0qe0HC3kPLPMnhX4dzCskTl7DO4lDC0I=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=fgrn2N1lWVoBg1S4G2Rgy9Jov4liQAxMzeEM3U9vOdG0bME96ytcLCkKH+BWTZrIoF
         858vueXUkm87FRhsizqoLSSLBKaZr5IdfSD2EdsbR3Il60wi69ShzjlB6UWl3GuOnsM/
         rHUPTsNQTET+ZSVDui92KwGBmK/RH9GnSBgr7BmIjYNI4yN+Tz9FHlnvqDBkVrLWZYa4
         GjIz1nC4/pxwVrFpAXYgNLy0G4zjLkr/LqjEVH5zExMy1unvFgFLB87ZA2n2VyUkaS7q
         IlZe4MBtQdUBzHr+1qfkM/ODaI8r1gHDdjlR7WlvJHNVugl5ZK7P1Ve7+hnFM1MACVAB
         /Uqg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984261; x=1702589061;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0phQIAJGr/0qe0HC3kPLPMnhX4dzCskTl7DO4lDC0I=;
        b=DCsfc0+/V6714NnjZH9sLlzay22ArBidnSBrnY6bywmtOD9TBBi2Fpp5dDriF+fgNC
         8xEkXGJutlhkMSNAZHM7tHBLqkT1lrc+Ampq16DacfKIO1VLjJTfQiB4gsZVxjt8EgYz
         lnOj2orPcGvBRZ05XiVv0SuzbG4mgMIFwQbwbaClgtT+pD5nPHVNYM2vs8T0FBzpc3ND
         VaFSoKGgsB8+WIGAv8yvvGJPZdgnDM0C4e3hunEb/I2pRavWOGPb0dLn1f30XfxNbqnd
         ++wy+VXVsYdoPU4bimxcMczbjJ/I3/qRDnWtSIo9KKSSVqScyRMuegClUZtkaQdQyHtx
         qByA==
X-Gm-Message-State: AOJu0YwDYOVI+QMSaZ8u5wp0RK9sd87Bv/4URamjKgR9sf+3SMLoXtT2
	dWogGV9E0EQoMvm8mZ+yajIbhA==
X-Google-Smtp-Source: AGHT+IFljKREqBKQAZanoAnvp7IDAAGnuNNozT+Z3veYJ6BZGjoaAS654Rs9eJxZKJ/nx1vArdNeew==
X-Received: by 2002:ac8:7d06:0:b0:3f9:aa80:b48a with SMTP id g6-20020ac87d06000000b003f9aa80b48amr5602094qtb.8.1701984261660;
        Thu, 07 Dec 2023 13:24:21 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:7c44:0:b0:423:8463:9511 with SMTP id o4-20020ac87c44000000b0042384639511ls2650200qtv.2.-pod-prod-00-us;
 Thu, 07 Dec 2023 13:24:21 -0800 (PST)
X-Received: by 2002:a05:620a:3b0f:b0:77d:7cfd:e46a with SMTP id tl15-20020a05620a3b0f00b0077d7cfde46amr2895812qkn.15.1701984261010;
        Thu, 07 Dec 2023 13:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984260; cv=none;
        d=google.com; s=arc-20160816;
        b=OkE00qOBPJJEaHbU+e+CpgKWvD06LvTHU/Q7mNjesVX4SGo3h9l9E482aKQ9zH6XDP
         tbetbLZq4rGYYV1Du8Jwnak0NRk8X2dMIrxUrrD01hTIJ6iJvxy4N5a59OPdbagh3/ys
         ZizrjazHiLhwSIMouBqeNVYzsjBvn0P14YwfYQB4971HHDGgAP38TxiEzbkIgc3GKIR6
         jhzUZQs66xgyQMQjGpmRcTW1eHwMsoJQTWAsejFrTTSr321GNpLI9mJEpriVLExhU0MT
         OaUYx1OXiVk7toL3Wnxw6cmD1pWvPme3aUD/tG3Vpa8eBMc2+llYT5HH33BlhnBA0nUs
         8txA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=+RGhYTY83CzEEwD3sxxlcJDtqFoFg1xQiYrcAXYGcq4=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=DOM0TtOJ4k3KDhmmkq85bIAevO/YzxXFhXy6PXQwdwFObxmjcAw8WfBAZP9gJGwDkF
         Yl6vAUTB2ocGZXbc7BT1paYrfzTWca60P88HvT9gQLJPu7rtqxmEuKivxKhFwYlIwQCN
         Rs6E+oiuwEmmmoJOWH+bkduwXSwQXdwRuDVBPAun7TOTMVzvEJ/rvNwrp5fT6ndh7M1c
         6ZRA48t0BrnpJ/1riYqgofzulY9VvqnWWUACxtYZ8eMMFjDgisru+xYEFEtGww5ngJn6
         s+x3P7G8EhcCIg5PCxQ5ctW+loUtyJbgsMawdHb0rbbfKhrrs5lj4v6F5zzBTEFShySd
         af5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id n5-20020a05620a294500b00779db6b77dcsi609762qkp.353.2023.12.07.13.24.20
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:24:20 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-hCV_52G3Nk-ED6yw-YKUkA-1; Thu, 07 Dec 2023 16:24:19 -0500
X-MC-Unique: hCV_52G3Nk-ED6yw-YKUkA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE48E85A58C
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:24:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id EB2CEC0164E; Thu,  7 Dec 2023 21:24:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51189C15880;
	Thu,  7 Dec 2023 21:24:16 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 37/59] netfs: Perform content encryption
Date: Thu,  7 Dec 2023 21:21:44 +0000
Message-ID: <20231207212206.1379128-38-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

When dealing with an encrypted file, we gather together sufficient pages
from the pagecache to constitute a logical crypto block, allocate a bounce
buffer and then ask the filesystem to encrypt between the buffers.  The
bounce buffer is then passed to the filesystem to upload.

The network filesystem must set a flag to indicate what service is desired
and what the logical blocksize will be.

The netfs library iterates through each block to be processed, providing a
pair of scatterlists to describe the start and end buffers.

Note that it should be possible in future to encrypt DIO writes also by
this same mechanism.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/Makefile            |  1 +
 fs/netfs/buffered_write.c    |  3 +-
 fs/netfs/crypto.c            | 89 ++++++++++++++++++++++++++++++++++++
 fs/netfs/internal.h          |  5 ++
 fs/netfs/objects.c           |  2 +
 fs/netfs/output.c            |  7 ++-
 include/linux/netfs.h        | 11 +++++
 include/trace/events/netfs.h |  2 +
 8 files changed, 118 insertions(+), 2 deletions(-)
 create mode 100644 fs/netfs/crypto.c

diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index d4d1d799819e..0c433fce15dc 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -3,6 +3,7 @@
 netfs-y := \
 	buffered_read.o \
 	buffered_write.o \
+	crypto.o \
 	direct_read.o \
 	direct_write.o \
 	io.o \
diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 8339e3f753af..bffa508945cb 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -77,7 +77,8 @@ static enum netfs_how_to_modify netfs_how_to_modify(struct netfs_inode *ctx,
 	if (!maybe_trouble && offset == 0 && len >= flen)
 		return NETFS_WHOLE_FOLIO_MODIFY;
 
-	if (file->f_mode & FMODE_READ)
+	if (file->f_mode & FMODE_READ ||
+	    test_bit(NETFS_ICTX_ENCRYPTED, &ctx->flags))
 		return NETFS_JUST_PREFETCH;
 
 	if (netfs_is_cache_enabled(ctx) ||
diff --git a/fs/netfs/crypto.c b/fs/netfs/crypto.c
new file mode 100644
index 000000000000..943d01f430e2
--- /dev/null
+++ b/fs/netfs/crypto.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Network filesystem content encryption support.
+ *
+ * Copyright (C) 2023 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/fs.h>
+#include <linux/mm.h>
+#include <linux/pagemap.h>
+#include <linux/slab.h>
+#include <linux/scatterlist.h>
+#include "internal.h"
+
+/*
+ * Populate a scatterlist from the next bufferage of an I/O iterator.
+ */
+static int netfs_iter_to_sglist(const struct iov_iter *iter, size_t len,
+				struct scatterlist *sg, unsigned int n_sg)
+{
+	struct iov_iter tmp_iter = *iter;
+	struct sg_table sgtable = { .sgl = sg };
+	ssize_t ret;
+
+	_enter("%zx/%zx", len, iov_iter_count(iter));
+
+	sg_init_table(sg, n_sg);
+	ret = extract_iter_to_sg(&tmp_iter, len, &sgtable, n_sg, 0);
+	if (ret < 0)
+		return ret;
+	sg_mark_end(&sg[sgtable.nents - 1]);
+	return sgtable.nents;
+}
+
+/*
+ * Prepare a write request for writing.  We encrypt in/into the bounce buffer.
+ */
+bool netfs_encrypt(struct netfs_io_request *wreq)
+{
+	struct netfs_inode *ctx = netfs_inode(wreq->inode);
+	struct scatterlist source_sg[16], dest_sg[16];
+	unsigned int n_dest;
+	size_t n, chunk, bsize = 1UL << ctx->crypto_bshift;
+	loff_t pos;
+	int ret;
+
+	_enter("");
+
+	trace_netfs_rreq(wreq, netfs_rreq_trace_encrypt);
+
+	pos = wreq->start;
+	n = wreq->len;
+	_debug("ENCRYPT %llx-%llx", pos, pos + n - 1);
+
+	for (; n > 0; n -= chunk, pos += chunk) {
+		chunk = min(n, bsize);
+
+		ret = netfs_iter_to_sglist(&wreq->io_iter, chunk,
+					   dest_sg, ARRAY_SIZE(dest_sg));
+		if (ret < 0)
+			goto error;
+		n_dest = ret;
+
+		if (test_bit(NETFS_RREQ_CRYPT_IN_PLACE, &wreq->flags)) {
+			ret = ctx->ops->encrypt_block(wreq, pos, chunk,
+						      dest_sg, n_dest,
+						      dest_sg, n_dest);
+		} else {
+			ret = netfs_iter_to_sglist(&wreq->iter, chunk,
+						   source_sg, ARRAY_SIZE(source_sg));
+			if (ret < 0)
+				goto error;
+			ret = ctx->ops->encrypt_block(wreq, pos, chunk,
+						      source_sg, ret,
+						      dest_sg, n_dest);
+		}
+
+		if (ret < 0)
+			goto error_failed;
+	}
+
+	return true;
+
+error_failed:
+	trace_netfs_failure(wreq, NULL, ret, netfs_fail_encryption);
+error:
+	wreq->error = ret;
+	return false;
+}
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index ae7a6aedc7cb..9412ec886df1 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -26,6 +26,11 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq);
 int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 			     size_t offset, size_t len);
 
+/*
+ * crypto.c
+ */
+bool netfs_encrypt(struct netfs_io_request *wreq);
+
 /*
  * direct_write.c
  */
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 16252cc4576e..8e4585216fc7 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -45,6 +45,8 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	refcount_set(&rreq->ref, 1);
 
 	__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
+	if (test_bit(NETFS_ICTX_ENCRYPTED, &ctx->flags))
+		__set_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &rreq->flags);
 	if (cached)
 		__set_bit(NETFS_RREQ_WRITE_TO_CACHE, &rreq->flags);
 	if (file && file->f_flags & O_NONBLOCK)
diff --git a/fs/netfs/output.c b/fs/netfs/output.c
index cc9065733b42..c0ac3ac57861 100644
--- a/fs/netfs/output.c
+++ b/fs/netfs/output.c
@@ -364,7 +364,11 @@ int netfs_begin_write(struct netfs_io_request *wreq, bool may_wait,
 	 * background whilst we generate a list of write ops that we want to
 	 * perform.
 	 */
-	// TODO: Encrypt or compress the region as appropriate
+	if (test_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &wreq->flags) &&
+	    !netfs_encrypt(wreq)) {
+		may_wait = true;
+		goto out;
+	}
 
 	/* We need to write all of the region to the cache */
 	if (test_bit(NETFS_RREQ_WRITE_TO_CACHE, &wreq->flags))
@@ -376,6 +380,7 @@ int netfs_begin_write(struct netfs_io_request *wreq, bool may_wait,
 	if (test_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags))
 		ctx->ops->create_write_requests(wreq, wreq->start, wreq->len);
 
+out:
 	if (atomic_dec_and_test(&wreq->nr_outstanding))
 		netfs_write_terminated(wreq, false);
 
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 69ff5d652931..c2985f73d870 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -19,6 +19,7 @@
 #include <linux/pagemap.h>
 #include <linux/uio.h>
 
+struct scatterlist;
 enum netfs_sreq_ref_trace;
 
 /*
@@ -139,7 +140,9 @@ struct netfs_inode {
 	unsigned long		flags;
 #define NETFS_ICTX_ODIRECT	0		/* The file has DIO in progress */
 #define NETFS_ICTX_UNBUFFERED	1		/* I/O should not use the pagecache */
+#define NETFS_ICTX_ENCRYPTED	2		/* The file contents are encrypted */
 	unsigned char		min_bshift;	/* log2 min block size for bounding box or 0 */
+	unsigned char		crypto_bshift;	/* log2 of crypto block size */
 };
 
 /*
@@ -285,6 +288,8 @@ struct netfs_io_request {
 #define NETFS_RREQ_UPLOAD_TO_SERVER	8	/* Need to write to the server */
 #define NETFS_RREQ_NONBLOCK		9	/* Don't block if possible (O_NONBLOCK) */
 #define NETFS_RREQ_BLOCKED		10	/* We blocked */
+#define NETFS_RREQ_CONTENT_ENCRYPTION	11	/* Content encryption is in use */
+#define NETFS_RREQ_CRYPT_IN_PLACE	12	/* Enc/dec in place in ->io_iter */
 	const struct netfs_request_ops *netfs_ops;
 	void (*cleanup)(struct netfs_io_request *req);
 };
@@ -315,6 +320,11 @@ struct netfs_request_ops {
 	void (*create_write_requests)(struct netfs_io_request *wreq,
 				      loff_t start, size_t len);
 	void (*invalidate_cache)(struct netfs_io_request *wreq);
+
+	/* Content encryption */
+	int (*encrypt_block)(struct netfs_io_request *wreq, loff_t pos, size_t len,
+			     struct scatterlist *source_sg, unsigned int n_source,
+			     struct scatterlist *dest_sg, unsigned int n_dest);
 };
 
 /*
@@ -464,6 +474,7 @@ static inline void netfs_inode_init(struct netfs_inode *ctx,
 	ctx->remote_i_size = i_size_read(&ctx->inode);
 	ctx->flags = 0;
 	ctx->min_bshift = 0;
+	ctx->crypto_bshift = 0;
 #if IS_ENABLED(CONFIG_FSCACHE)
 	ctx->cache = NULL;
 #endif
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 914a24b03d08..3f50819613e2 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -41,6 +41,7 @@
 	EM(netfs_rreq_trace_assess,		"ASSESS ")	\
 	EM(netfs_rreq_trace_copy,		"COPY   ")	\
 	EM(netfs_rreq_trace_done,		"DONE   ")	\
+	EM(netfs_rreq_trace_encrypt,		"ENCRYPT")	\
 	EM(netfs_rreq_trace_free,		"FREE   ")	\
 	EM(netfs_rreq_trace_redirty,		"REDIRTY")	\
 	EM(netfs_rreq_trace_resubmit,		"RESUBMT")	\
@@ -76,6 +77,7 @@
 	EM(netfs_fail_copy_to_cache,		"copy-to-cache")	\
 	EM(netfs_fail_dio_read_short,		"dio-read-short")	\
 	EM(netfs_fail_dio_read_zero,		"dio-read-zero")	\
+	EM(netfs_fail_encryption,		"encryption")		\
 	EM(netfs_fail_read,			"read")			\
 	EM(netfs_fail_short_read,		"short-read")		\
 	EM(netfs_fail_prepare_write,		"prep-write")		\

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

