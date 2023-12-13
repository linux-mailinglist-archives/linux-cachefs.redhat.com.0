Return-Path: <linux-cachefs+bncBDLIXLMFVAERBEE246VQMGQENBMLOSY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D4781166A
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:26:09 +0100 (CET)
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-dbcca990ee9sf1168102276.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:26:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481168; cv=pass;
        d=google.com; s=arc-20160816;
        b=PPMPnYCVkwfz5+edZtdXt50ci2+WSQGeSrTZH1W2hhhXLnqfWOu3XXcFIzUvysttHQ
         IxpGQLuld+5KeUs5pWrMv4z0sgqlm8z0xV74W0kYK88M0YxTGNEww/BqqDD7D2gZuWzg
         EIycIkHiOiJXZ0eysubHvqzDIsvddzoqHXEnTu7Yjyq+/4Ys3gj4y6+AatIQ3ZiBP7mZ
         0DeXUw0j5GCkfZt3Ng1O0mqx1jS//C2dUuxqR24+hMm089xSI2IboKaTAOeSIfvwEJbo
         R8o22jMjhIEa67PKvQh0m5wVMibdeyfsazLg8uR4ZCVxp8jsRLO4YyGxL4qIx/Bac5Fg
         sjXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=XGYrxp4Za7QKH1onezps5ckL3chHoJb/ZDFKFTysZUg=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=wbOGbuZGy0i1AoFerTR/huqUGen9gtmJQ6b7d9UfDR2AdqLhbRSuS0LEL9PfhNxXpC
         dlLuldkk/4LxKHyQ680uDsTH5rUWeUTPoTSxQ0YGcMPrMxwAMChZzktNSaIYpnFYj9tm
         gBDd57lJhB9xaYBaqcECWifF/gaiFkjOUb6gWhBjBTtj4EJQqXfNt4n3U1/fXWYikzJO
         DyPLEExU8EQs7/0II3tesKjkmfm1+JLvsrFLRP/7+KFbvoaM4bPsbgIdRMxUoR8Viejf
         6HMqAHKwvcAlFRV1s7c0jEGEY7kWeKnW7LxYHQE4ZfDpQAV8vAkw+xcNda1w4h6nJhBn
         jwww==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481168; x=1703085968;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGYrxp4Za7QKH1onezps5ckL3chHoJb/ZDFKFTysZUg=;
        b=nDJMmyd4ixRs+zlOFWvnLmh80BVcQbkEl0ZB5w5uWVtlXNIMekcYTEuNSGZhr02LzO
         oxieM84a9Y6k6BeYOTlZMCziQszgpgFMH2dOH6ExJ2cHY+1T52y4Pq6fhiP3xmzSODVe
         p7GeWTkpfPMg3qgjskcAS/x6PV76gFMdxrgBSu5GVXDCABt40W4I5TIpf7QsW4fObD5F
         M9Q1GMj+yF+1BzopmiC9UnH8w2uz2/rpmuYcHEzLeW5p6ipFIoggN0V+3e2pZGVVSpPm
         JlU/s1ysf+riQG74Gj+YptAnwLMJq7ZRy7DXaNq2ybTRe60/ZvKLIuHmi1hHIm/Yt17p
         KxGw==
X-Gm-Message-State: AOJu0Yzc+BG24LQSx0fRXr8NibbXuSS8tMUNcyXUaR662R9fl9F5U3Je
	aYCkXRYHjP5aoU738msSb2wMdw==
X-Google-Smtp-Source: AGHT+IF7tHabBpw/IhMEOjFtMWsDwreWlXk2tbNLOIatFQ0y6FY6+eWW9nhUQFhwaoY/pmWgGwj4bg==
X-Received: by 2002:a25:9701:0:b0:dbc:c5ab:65b2 with SMTP id d1-20020a259701000000b00dbcc5ab65b2mr1555216ybo.62.1702481168464;
        Wed, 13 Dec 2023 07:26:08 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:b0b:0:b0:dbc:c4ee:5ea3 with SMTP id 11-20020a250b0b000000b00dbcc4ee5ea3ls317366ybl.2.-pod-prod-01-us;
 Wed, 13 Dec 2023 07:26:07 -0800 (PST)
X-Received: by 2002:a25:840d:0:b0:dbc:de2d:5a55 with SMTP id u13-20020a25840d000000b00dbcde2d5a55mr101224ybk.76.1702481167714;
        Wed, 13 Dec 2023 07:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481167; cv=none;
        d=google.com; s=arc-20160816;
        b=bBb1AGFG84AUAhRelWIGJQrp7oygEBlslQ/lHWeuT2tKla8GElwy1rUGL/gLkaeovm
         pOQTkCHALhQ9T0xlQfYvY77uvft8CwqsaLGqPZymimriU0IBN6q0h3v2QxFFcZtnhiVQ
         BdtQmay3sIr3lwNbL/CYLWj+bHkOPr+e/+G/jXxrcxJ3LzWoaYbVI8mSeTb3CRcY8Bdc
         VV7FKBxCQ6nGKlo9Y6zbFYNwmLbkrgMK0SjZcrq5wIq0/l9YPDH5KT81VLqw1RxVvxas
         89RONNqNc0wyFZ4GN/tqS26PfC+TaghGQmGPrMNfEPubRzJROFFDPpb1Ky3gE+q4P/VD
         FCNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=soahaV3Ag+Cs3wN9SRRVq/36ef3xCwusWO4Gbn5hYDY=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=GJ9Yx7D+ytAijkyC8y358yUivJTfEE3dRhUFFJ9tkWNlaUjMAxVwrFbrm00dPxZeJc
         sP5jZgTBZA32n51aSuLXrRedGjkKjPx+SGu8ATkvXaG+R6gnRoUecdz8QjshRkPEw94g
         72n2Zo+6+Lb1R/3cV39ioTrqeIYt+oO525lVWOE+eK11XlzZgIXqvvQT10Uvb0yzkVLy
         jYEZOANdLpWOaoOHUjA/wHmEJzMvF+H98n3HtuMPzTgvGRvA00NSHvnO42INTtod3fzL
         cwjWrYB6vCedW7XZsdUfDj1TSBlmeCpF9f5UyXG+HKB2n6F88vWxLoWbnKeZj8V1RcA3
         t6yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id v48-20020a25abb3000000b00da086d7a8b0si2172989ybi.339.2023.12.13.07.26.07
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:26:07 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-uSa5P60INwORdue4sqLViw-1; Wed, 13 Dec 2023 10:26:03 -0500
X-MC-Unique: uSa5P60INwORdue4sqLViw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A68D85A596
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:26:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 980743C2F; Wed, 13 Dec 2023 15:26:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E15ED3C25;
	Wed, 13 Dec 2023 15:25:58 +0000 (UTC)
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
Subject: [PATCH v4 29/39] netfs: Implement unbuffered/DIO write support
Date: Wed, 13 Dec 2023 15:23:39 +0000
Message-ID: <20231213152350.431591-30-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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

Implement support for unbuffered writes and direct I/O writes.  If the
write is misaligned with respect to the fscrypt block size, then RMW cycles
are performed if necessary.  DIO writes are a special case of unbuffered
writes with extra restriction imposed, such as block size alignment
requirements.

Also provide a field that can tell the code to add some extra space onto
the bounce buffer for use by the filesystem in the case of a
content-encrypted file.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/afs/inode.c               |   2 +-
 fs/netfs/Makefile            |   1 +
 fs/netfs/direct_write.c      | 166 +++++++++++++++++++++++++++++++++++
 fs/netfs/internal.h          |   6 ++
 fs/netfs/io.c                |   2 +-
 fs/netfs/main.c              |  12 +--
 fs/netfs/objects.c           |   6 +-
 fs/netfs/output.c            |  30 +++++++
 include/linux/netfs.h        |   4 +
 include/trace/events/netfs.h |   4 +-
 10 files changed, 223 insertions(+), 10 deletions(-)
 create mode 100644 fs/netfs/direct_write.c

diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index de3e8fec54b7..c43112dcbbbb 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -249,7 +249,7 @@ static void afs_apply_status(struct afs_operation *op,
 		 * what's on the server.
 		 */
 		vnode->netfs.remote_i_size = status->size;
-		if (change_size) {
+		if (change_size || status->size > i_size_read(inode)) {
 			afs_set_i_size(vnode, status->size);
 			inode_set_ctime_to_ts(inode, t);
 			inode_set_atime_to_ts(inode, t);
diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index e968ab1eca40..d4d1d799819e 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -4,6 +4,7 @@ netfs-y := \
 	buffered_read.o \
 	buffered_write.o \
 	direct_read.o \
+	direct_write.o \
 	io.o \
 	iterator.o \
 	locking.o \
diff --git a/fs/netfs/direct_write.c b/fs/netfs/direct_write.c
new file mode 100644
index 000000000000..bb0c2718f57b
--- /dev/null
+++ b/fs/netfs/direct_write.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Unbuffered and direct write support.
+ *
+ * Copyright (C) 2023 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/export.h>
+#include <linux/uio.h>
+#include "internal.h"
+
+static void netfs_cleanup_dio_write(struct netfs_io_request *wreq)
+{
+	struct inode *inode = wreq->inode;
+	unsigned long long end = wreq->start + wreq->len;
+
+	if (!wreq->error &&
+	    i_size_read(inode) < end) {
+		if (wreq->netfs_ops->update_i_size)
+			wreq->netfs_ops->update_i_size(inode, end);
+		else
+			i_size_write(inode, end);
+	}
+}
+
+/*
+ * Perform an unbuffered write where we may have to do an RMW operation on an
+ * encrypted file.  This can also be used for direct I/O writes.
+ */
+ssize_t netfs_unbuffered_write_iter_locked(struct kiocb *iocb, struct iov_iter *iter,
+					   struct netfs_group *netfs_group)
+{
+	struct netfs_io_request *wreq;
+	unsigned long long start = iocb->ki_pos;
+	unsigned long long end = start + iov_iter_count(iter);
+	ssize_t ret, n;
+	bool async = !is_sync_kiocb(iocb);
+
+	_enter("");
+
+	/* We're going to need a bounce buffer if what we transmit is going to
+	 * be different in some way to the source buffer, e.g. because it gets
+	 * encrypted/compressed or because it needs expanding to a block size.
+	 */
+	// TODO
+
+	_debug("uw %llx-%llx", start, end);
+
+	wreq = netfs_alloc_request(iocb->ki_filp->f_mapping, iocb->ki_filp,
+				   start, end - start,
+				   iocb->ki_flags & IOCB_DIRECT ?
+				   NETFS_DIO_WRITE : NETFS_UNBUFFERED_WRITE);
+	if (IS_ERR(wreq))
+		return PTR_ERR(wreq);
+
+	{
+		/* If this is an async op and we're not using a bounce buffer,
+		 * we have to save the source buffer as the iterator is only
+		 * good until we return.  In such a case, extract an iterator
+		 * to represent as much of the the output buffer as we can
+		 * manage.  Note that the extraction might not be able to
+		 * allocate a sufficiently large bvec array and may shorten the
+		 * request.
+		 */
+		if (async || user_backed_iter(iter)) {
+			n = netfs_extract_user_iter(iter, wreq->len, &wreq->iter, 0);
+			if (n < 0) {
+				ret = n;
+				goto out;
+			}
+			wreq->direct_bv = (struct bio_vec *)wreq->iter.bvec;
+			wreq->direct_bv_count = n;
+			wreq->direct_bv_unpin = iov_iter_extract_will_pin(iter);
+			wreq->len = iov_iter_count(&wreq->iter);
+		} else {
+			wreq->iter = *iter;
+		}
+
+		wreq->io_iter = wreq->iter;
+	}
+
+	/* Copy the data into the bounce buffer and encrypt it. */
+	// TODO
+
+	/* Dispatch the write. */
+	__set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags);
+	if (async)
+		wreq->iocb = iocb;
+	wreq->cleanup = netfs_cleanup_dio_write;
+	ret = netfs_begin_write(wreq, is_sync_kiocb(iocb),
+				iocb->ki_flags & IOCB_DIRECT ?
+				netfs_write_trace_dio_write :
+				netfs_write_trace_unbuffered_write);
+	if (ret < 0) {
+		_debug("begin = %zd", ret);
+		goto out;
+	}
+
+	if (!async) {
+		trace_netfs_rreq(wreq, netfs_rreq_trace_wait_ip);
+		wait_on_bit(&wreq->flags, NETFS_RREQ_IN_PROGRESS,
+			    TASK_UNINTERRUPTIBLE);
+
+		ret = wreq->error;
+		_debug("waited = %zd", ret);
+		if (ret == 0) {
+			ret = wreq->transferred;
+			iocb->ki_pos += ret;
+		}
+	} else {
+		ret = -EIOCBQUEUED;
+	}
+
+out:
+	netfs_put_request(wreq, false, netfs_rreq_trace_put_return);
+	return ret;
+}
+
+/**
+ * netfs_unbuffered_write_iter - Unbuffered write to a file
+ * @iocb: IO state structure
+ * @from: iov_iter with data to write
+ *
+ * Do an unbuffered write to a file, writing the data directly to the server
+ * and not lodging the data in the pagecache.
+ *
+ * Return:
+ * * Negative error code if no data has been written at all of
+ *   vfs_fsync_range() failed for a synchronous write
+ * * Number of bytes written, even for truncated writes
+ */
+ssize_t netfs_unbuffered_write_iter(struct kiocb *iocb, struct iov_iter *from)
+{
+	struct file *file = iocb->ki_filp;
+	struct inode *inode = file->f_mapping->host;
+	struct netfs_inode *ictx = netfs_inode(inode);
+	ssize_t ret;
+
+	_enter("%llx,%zx,%llx", iocb->ki_pos, iov_iter_count(from), i_size_read(inode));
+
+	trace_netfs_write_iter(iocb, from);
+
+	ret = netfs_start_io_direct(inode);
+	if (ret < 0)
+		return ret;
+	ret = generic_write_checks(iocb, from);
+	if (ret < 0)
+		goto out;
+	ret = file_remove_privs(file);
+	if (ret < 0)
+		goto out;
+	ret = file_update_time(file);
+	if (ret < 0)
+		goto out;
+	ret = kiocb_invalidate_pages(iocb, iov_iter_count(from));
+	if (ret < 0)
+		goto out;
+
+	fscache_invalidate(netfs_i_cookie(ictx), NULL, i_size_read(inode),
+			   FSCACHE_INVAL_DIO_WRITE);
+	ret = netfs_unbuffered_write_iter_locked(iocb, from, NULL);
+out:
+	netfs_end_io_direct(inode);
+	return ret;
+}
+EXPORT_SYMBOL(netfs_unbuffered_write_iter);
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 5bb1cdbdee0e..fe72280b0f30 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -26,6 +26,12 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq);
 int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 			     size_t offset, size_t len);
 
+/*
+ * direct_write.c
+ */
+ssize_t netfs_unbuffered_write_iter_locked(struct kiocb *iocb, struct iov_iter *iter,
+					   struct netfs_group *netfs_group);
+
 /*
  * io.c
  */
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index e017dc735cdb..894c3305710d 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -645,7 +645,7 @@ static bool netfs_rreq_submit_slice(struct netfs_io_request *rreq,
 
 	subreq->debug_index	= (*_debug_index)++;
 	subreq->start		= rreq->start + rreq->submitted;
-	subreq->len		= rreq->len   - rreq->submitted;
+	subreq->len		= io_iter->count;
 
 	_debug("slice %llx,%zx,%zx", subreq->start, subreq->len, rreq->submitted);
 	list_add_tail(&subreq->rreq_link, &rreq->subrequests);
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index d4430b51b03c..9fe96de6960e 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -29,11 +29,13 @@ LIST_HEAD(netfs_io_requests);
 DEFINE_SPINLOCK(netfs_proc_lock);
 
 static const char *netfs_origins[nr__netfs_io_origin] = {
-	[NETFS_READAHEAD]	= "RA",
-	[NETFS_READPAGE]	= "RP",
-	[NETFS_READ_FOR_WRITE]	= "RW",
-	[NETFS_WRITEBACK]	= "WB",
-	[NETFS_DIO_READ]	= "DR",
+	[NETFS_READAHEAD]		= "RA",
+	[NETFS_READPAGE]		= "RP",
+	[NETFS_READ_FOR_WRITE]		= "RW",
+	[NETFS_WRITEBACK]		= "WB",
+	[NETFS_UNBUFFERED_WRITE]	= "UW",
+	[NETFS_DIO_READ]		= "DR",
+	[NETFS_DIO_WRITE]		= "DW",
 };
 
 /*
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index d46e957812a6..c1218b183197 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -20,8 +20,10 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	struct inode *inode = file ? file_inode(file) : mapping->host;
 	struct netfs_inode *ctx = netfs_inode(inode);
 	struct netfs_io_request *rreq;
-	bool is_dio = (origin == NETFS_DIO_READ);
-	bool cached = is_dio && netfs_is_cache_enabled(ctx);
+	bool is_unbuffered = (origin == NETFS_UNBUFFERED_WRITE ||
+			      origin == NETFS_DIO_READ ||
+			      origin == NETFS_DIO_WRITE);
+	bool cached = !is_unbuffered && netfs_is_cache_enabled(ctx);
 	int ret;
 
 	rreq = kzalloc(ctx->ops->io_request_size ?: sizeof(struct netfs_io_request),
diff --git a/fs/netfs/output.c b/fs/netfs/output.c
index 2ad0fd8c32be..560cbcea0c0a 100644
--- a/fs/netfs/output.c
+++ b/fs/netfs/output.c
@@ -74,11 +74,21 @@ static void netfs_write_terminated(struct netfs_io_request *wreq, bool was_async
 {
 	struct netfs_io_subrequest *subreq;
 	struct netfs_inode *ctx = netfs_inode(wreq->inode);
+	size_t transferred = 0;
 
 	_enter("R=%x[]", wreq->debug_id);
 
 	trace_netfs_rreq(wreq, netfs_rreq_trace_write_done);
 
+	list_for_each_entry(subreq, &wreq->subrequests, rreq_link) {
+		if (subreq->error || subreq->transferred == 0)
+			break;
+		transferred += subreq->transferred;
+		if (subreq->transferred < subreq->len)
+			break;
+	}
+	wreq->transferred = transferred;
+
 	list_for_each_entry(subreq, &wreq->subrequests, rreq_link) {
 		if (!subreq->error)
 			continue;
@@ -110,11 +120,28 @@ static void netfs_write_terminated(struct netfs_io_request *wreq, bool was_async
 
 	wreq->cleanup(wreq);
 
+	if (wreq->origin == NETFS_DIO_WRITE &&
+	    wreq->mapping->nrpages) {
+		pgoff_t first = wreq->start >> PAGE_SHIFT;
+		pgoff_t last = (wreq->start + wreq->transferred - 1) >> PAGE_SHIFT;
+		invalidate_inode_pages2_range(wreq->mapping, first, last);
+	}
+
+	if (wreq->origin == NETFS_DIO_WRITE)
+		inode_dio_end(wreq->inode);
+
 	_debug("finished");
 	trace_netfs_rreq(wreq, netfs_rreq_trace_wake_ip);
 	clear_bit_unlock(NETFS_RREQ_IN_PROGRESS, &wreq->flags);
 	wake_up_bit(&wreq->flags, NETFS_RREQ_IN_PROGRESS);
 
+	if (wreq->iocb) {
+		wreq->iocb->ki_pos += transferred;
+		if (wreq->iocb->ki_complete)
+			wreq->iocb->ki_complete(
+				wreq->iocb, wreq->error ? wreq->error : transferred);
+	}
+
 	netfs_clear_subrequests(wreq, was_async);
 	netfs_put_request(wreq, was_async, netfs_rreq_trace_put_complete);
 }
@@ -329,6 +356,9 @@ int netfs_begin_write(struct netfs_io_request *wreq, bool may_wait,
 		return -EIO;
 	}
 
+	if (wreq->origin == NETFS_DIO_WRITE)
+		inode_dio_begin(wreq->inode);
+
 	wreq->io_iter = wreq->iter;
 
 	/* ->outstanding > 0 carries a ref */
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index da391f8c81c7..00c87f4e809c 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -138,6 +138,7 @@ struct netfs_inode {
 	loff_t			remote_i_size;	/* Size of the remote file */
 	unsigned long		flags;
 #define NETFS_ICTX_ODIRECT	0		/* The file has DIO in progress */
+#define NETFS_ICTX_UNBUFFERED	1		/* I/O should not use the pagecache */
 };
 
 /*
@@ -226,7 +227,9 @@ enum netfs_io_origin {
 	NETFS_READPAGE,			/* This read is a synchronous read */
 	NETFS_READ_FOR_WRITE,		/* This read is to prepare a write */
 	NETFS_WRITEBACK,		/* This write was triggered by writepages */
+	NETFS_UNBUFFERED_WRITE,		/* This is an unbuffered write */
 	NETFS_DIO_READ,			/* This is a direct I/O read */
+	NETFS_DIO_WRITE,		/* This is a direct I/O write */
 	nr__netfs_io_origin
 } __mode(byte);
 
@@ -382,6 +385,7 @@ ssize_t netfs_unbuffered_read_iter(struct kiocb *iocb, struct iov_iter *iter);
 /* High-level write API */
 ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 			    struct netfs_group *netfs_group);
+ssize_t netfs_unbuffered_write_iter(struct kiocb *iocb, struct iov_iter *from);
 
 /* Address operations API */
 struct readahead_control;
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 5a4edadf0e59..914a24b03d08 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -33,7 +33,9 @@
 	EM(NETFS_READPAGE,			"RP")		\
 	EM(NETFS_READ_FOR_WRITE,		"RW")		\
 	EM(NETFS_WRITEBACK,			"WB")		\
-	E_(NETFS_DIO_READ,			"DR")
+	EM(NETFS_UNBUFFERED_WRITE,		"UW")		\
+	EM(NETFS_DIO_READ,			"DR")		\
+	E_(NETFS_DIO_WRITE,			"DW")
 
 #define netfs_rreq_traces					\
 	EM(netfs_rreq_trace_assess,		"ASSESS ")	\

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

