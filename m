Return-Path: <linux-cachefs+bncBDLIXLMFVAERBY7ZSCWAMGQEYFXZMRY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 4001F81B774
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:25:56 +0100 (CET)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-427917d9e84sf10652901cf.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:25:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165155; cv=pass;
        d=google.com; s=arc-20160816;
        b=qzArVf7214iOBQwegstijMAK0TWuXJnOxchuIDYWiZUuHhf/QFlSFtHyNq4PQpR6WB
         CJ4ZaxJHkCOayYEhzwekERbaKXm3uCvDaeuPubYYS4ut/5+lgMAPqm8PKTiD/UQBsJSU
         IeZ55MOwRwLU71H3fKp71vx2/HIWSzHiW26sziaNNqmSUjKQmZjEQZZfAkJIrmHfaWYk
         P8mOX/Mt6pbZMCMsih5B6bzJ6PgJnhTVxCAqSSBS/8a6J2SxGmkyb5vJEVKortTZ5pc/
         21uCl5kxZsP8L1FAYZFq5TTob/ute7nbUn5dd6OWvBURFadwLVTCGHCnaXVZB3v9fcVR
         7Hfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=j6qgLad6ih6afnWwATg8lAQ2LHKYQEGm2J9vEs36pwU=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=yN4kgCxejAYvRrER4V3VNvmlUu9cbsZ5zbWQo33VAef2AwHtOlln5ADEmay3QZPzQI
         Zx9tl8CZAbteyCaOfSw7us5Jqip+1rcbdRpoc2JfdMcqtEFlVZXgPQjLfXsuXsgZHQiq
         pLiNZ6W0XQQbgUb/kKoWjczZp7oH0b3mti5eMAtVBXel3VtdSLkut8FYfXKl6YRHgP16
         f+35tUbBfYgT7l3eoTtCyGzrHKG955HZkXLG6UuLKoqQj/nn3rZj/I5Vvbhpc862bsFw
         wr4bdjPpOaQK4LELKdcOT9ONYE32bFOBT67mNgA6G0FSOafwLzTcBOwxGkXXKogtFCYO
         j8oA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165155; x=1703769955;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6qgLad6ih6afnWwATg8lAQ2LHKYQEGm2J9vEs36pwU=;
        b=mWFizfianwzLSDEgyXJbMpf3vGcJBxYmo9Vbaa9XC151Q7xEwNsBpX5Um3Ij+G/S/6
         EKRvDHwbXQAjgxptEpxQ3+Y7UbK0soyr8MPGKz0C/jlFrPg4nddiM/kZ2FlvHBPwkaft
         SkfjcJi2JwDVXY1pFEN0aK3e7HQlJ8IfPv5mxhmEseUP0PUGuxa6bDX7A9DCSusUdODL
         g0toDS41Tw3K5Tecqc9KFv7N+6l/x3fV+bqhD6/wh38O94Gl0JxySBY9JdEsOcTLtppO
         jb6Hxcd5nY0HboWjtvvE/ENJT+bGJfwsLvxibBEYmRCMnir4vRWY+Xn3ULKm/dR1YCHZ
         Cx/g==
X-Gm-Message-State: AOJu0YzkzZJV1kX3WF9kpHrrHc0V8JV61+JvDKnSkvfdRoymsKd5EXN9
	6Y1BrTdUIMqzS1/mqK2cn8suQw==
X-Google-Smtp-Source: AGHT+IEVNPXrvaLQFr0aVOYF1tAHeva/es0xCE1DB2UZmYDx1+yvZIQXB86oKoHXuAfV6nQkQ+TF3A==
X-Received: by 2002:ac8:7fc6:0:b0:427:87d3:6128 with SMTP id b6-20020ac87fc6000000b0042787d36128mr3701934qtk.4.1703165155215;
        Thu, 21 Dec 2023 05:25:55 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1885:b0:427:99bc:aa08 with SMTP id
 v5-20020a05622a188500b0042799bcaa08ls840715qtc.1.-pod-prod-05-us; Thu, 21 Dec
 2023 05:25:54 -0800 (PST)
X-Received: by 2002:ac8:5fd1:0:b0:425:4043:50e4 with SMTP id k17-20020ac85fd1000000b00425404350e4mr30868508qta.115.1703165154614;
        Thu, 21 Dec 2023 05:25:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165154; cv=none;
        d=google.com; s=arc-20160816;
        b=sRfQLpEGbMUBsAvNKlYaCHKDX4fUa9cXMk4mm5QgYfMlRGbBscF9PIMKGl9dOhAPFb
         Vzho4EYWYOaag/ADqP8bkAFFYzXjGX3LeO0vG1aKtGWA2WAyGakDK4Qt0HedDaKxRUPX
         xatMHgxO5BeRlsFzCCPkZuIebgcpKZKTOaYuHJ8Wf0UaWHAOca9AwsIMwM1tZa0eMce9
         SHAwEb3MdJHJzVbecinSc5B7+pKMwcrsvoRAaWtKCcq8E59/7i12q6v/K74EI1yOjeho
         qVopZr4e5MkUsE0AHX/VUwzXNBkYFw2T2xwPIlutVf3mPJ2UnPShVlLVakyAFOZHreKt
         31uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=F04VxOeVZfr5rMV3EFhozlzx4IfD02HSumkhJFCPR1c=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=y2wG9wDP7jRRgABlhJ2UDOWBB6i+V3NBtP1dWNXGu6KhO/fVZrCpW1CYwvMOMZHAx5
         ATpBC/lC3lPURckBaErRpWgYepQ4OUOFPXo58so+tpMsf0q9e6dbbeVVuPWXfnomgQ3P
         QfBOBag48r5rOa80Uu3WDcZQK4tAaOtGL1VON1y6DJrUpQz0DODB2/M8BQQ4NL8fD+fw
         QT3z0yWD8TwVodY1vzBmxFAQpulu0443zYRzPcOZIqtruN5Sa3eC7XiwMQWr5edT61mQ
         JAadMAxUb9YFVMPkzN0Q+VPerIh0kadD2OF4uPvK17r5xyFT8jc9Kb/ldF9LKK6tnO/S
         9QvA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id s6-20020ac85cc6000000b0042548953dffsi2071146qta.698.2023.12.21.05.25.54
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:25:54 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-ejppNgpaO6qQmv2DNOfemg-1; Thu, 21 Dec 2023 08:25:52 -0500
X-MC-Unique: ejppNgpaO6qQmv2DNOfemg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97A5385CEA2
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:25:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 92047492BC8; Thu, 21 Dec 2023 13:25:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 747CE492BC6;
	Thu, 21 Dec 2023 13:25:49 +0000 (UTC)
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
Subject: [PATCH v5 28/40] netfs: Implement unbuffered/DIO read support
Date: Thu, 21 Dec 2023 13:23:23 +0000
Message-ID: <20231221132400.1601991-29-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
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

Implement support for unbuffered and DIO reads in the netfs library,
utilising the existing read helper code to do block splitting and
individual queuing.  The code also handles extraction of the destination
buffer from the supplied iterator, allowing async unbuffered reads to take
place.

The read will be split up according to the rsize setting and, if supplied,
the ->clamp_length() method.  Note that the next subrequest will be issued
as soon as issue_op returns, without waiting for previous ones to finish.
The network filesystem needs to pause or handle queuing them if it doesn't
want to fire them all at the server simultaneously.

Once all the subrequests have finished, the state will be assessed and the
amount of data to be indicated as having being obtained will be
determined.  As the subrequests may finish in any order, if an intermediate
subrequest is short, any further subrequests may be copied into the buffer
and then abandoned.

In the future, this will also take care of doing an unbuffered read from
encrypted content, with the decryption being done by the library.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---

Notes:
    Changes
    =======
    ver #5)
     - Drop bounce buffer handling.

 fs/netfs/Makefile            |   1 +
 fs/netfs/direct_read.c       | 125 +++++++++++++++++++++++++++++++++++
 fs/netfs/internal.h          |   1 +
 fs/netfs/io.c                |  83 ++++++++++++++++++++---
 fs/netfs/main.c              |   1 +
 fs/netfs/objects.c           |   5 +-
 fs/netfs/stats.c             |   4 +-
 include/linux/netfs.h        |   9 +++
 include/trace/events/netfs.h |   7 +-
 mm/filemap.c                 |   1 +
 10 files changed, 226 insertions(+), 11 deletions(-)
 create mode 100644 fs/netfs/direct_read.c

diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index 85d8333a1ed4..e968ab1eca40 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -3,6 +3,7 @@
 netfs-y := \
 	buffered_read.o \
 	buffered_write.o \
+	direct_read.o \
 	io.o \
 	iterator.o \
 	locking.o \
diff --git a/fs/netfs/direct_read.c b/fs/netfs/direct_read.c
new file mode 100644
index 000000000000..ad4370b3935d
--- /dev/null
+++ b/fs/netfs/direct_read.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Direct I/O support.
+ *
+ * Copyright (C) 2023 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/export.h>
+#include <linux/fs.h>
+#include <linux/mm.h>
+#include <linux/pagemap.h>
+#include <linux/slab.h>
+#include <linux/uio.h>
+#include <linux/sched/mm.h>
+#include <linux/task_io_accounting_ops.h>
+#include <linux/netfs.h>
+#include "internal.h"
+
+/**
+ * netfs_unbuffered_read_iter_locked - Perform an unbuffered or direct I/O read
+ * @iocb: The I/O control descriptor describing the read
+ * @iter: The output buffer (also specifies read length)
+ *
+ * Perform an unbuffered I/O or direct I/O from the file in @iocb to the
+ * output buffer.  No use is made of the pagecache.
+ *
+ * The caller must hold any appropriate locks.
+ */
+static ssize_t netfs_unbuffered_read_iter_locked(struct kiocb *iocb, struct iov_iter *iter)
+{
+	struct netfs_io_request *rreq;
+	ssize_t ret;
+	size_t orig_count = iov_iter_count(iter);
+	bool async = !is_sync_kiocb(iocb);
+
+	_enter("");
+
+	if (!orig_count)
+		return 0; /* Don't update atime */
+
+	ret = kiocb_write_and_wait(iocb, orig_count);
+	if (ret < 0)
+		return ret;
+	file_accessed(iocb->ki_filp);
+
+	rreq = netfs_alloc_request(iocb->ki_filp->f_mapping, iocb->ki_filp,
+				   iocb->ki_pos, orig_count,
+				   NETFS_DIO_READ);
+	if (IS_ERR(rreq))
+		return PTR_ERR(rreq);
+
+	netfs_stat(&netfs_n_rh_dio_read);
+	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_dio_read);
+
+	/* If this is an async op, we have to keep track of the destination
+	 * buffer for ourselves as the caller's iterator will be trashed when
+	 * we return.
+	 *
+	 * In such a case, extract an iterator to represent as much of the the
+	 * output buffer as we can manage.  Note that the extraction might not
+	 * be able to allocate a sufficiently large bvec array and may shorten
+	 * the request.
+	 */
+	if (user_backed_iter(iter)) {
+		ret = netfs_extract_user_iter(iter, rreq->len, &rreq->iter, 0);
+		if (ret < 0)
+			goto out;
+		rreq->direct_bv = (struct bio_vec *)rreq->iter.bvec;
+		rreq->direct_bv_count = ret;
+		rreq->direct_bv_unpin = iov_iter_extract_will_pin(iter);
+		rreq->len = iov_iter_count(&rreq->iter);
+	} else {
+		rreq->iter = *iter;
+		rreq->len = orig_count;
+		rreq->direct_bv_unpin = false;
+		iov_iter_advance(iter, orig_count);
+	}
+
+	// TODO: Set up bounce buffer if needed
+
+	if (async)
+		rreq->iocb = iocb;
+
+	ret = netfs_begin_read(rreq, is_sync_kiocb(iocb));
+	if (ret < 0)
+		goto out; /* May be -EIOCBQUEUED */
+	if (!async) {
+		// TODO: Copy from bounce buffer
+		iocb->ki_pos += rreq->transferred;
+		ret = rreq->transferred;
+	}
+
+out:
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
+	if (ret > 0)
+		orig_count -= ret;
+	if (ret != -EIOCBQUEUED)
+		iov_iter_revert(iter, orig_count - iov_iter_count(iter));
+	return ret;
+}
+
+/**
+ * netfs_unbuffered_read_iter - Perform an unbuffered or direct I/O read
+ * @iocb: The I/O control descriptor describing the read
+ * @iter: The output buffer (also specifies read length)
+ *
+ * Perform an unbuffered I/O or direct I/O from the file in @iocb to the
+ * output buffer.  No use is made of the pagecache.
+ */
+ssize_t netfs_unbuffered_read_iter(struct kiocb *iocb, struct iov_iter *iter)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+	ssize_t ret;
+
+	if (!iter->count)
+		return 0; /* Don't update atime */
+
+	ret = netfs_start_io_direct(inode);
+	if (ret == 0) {
+		ret = netfs_unbuffered_read_iter_locked(iocb, iter);
+		netfs_end_io_direct(inode);
+	}
+	return ret;
+}
+EXPORT_SYMBOL(netfs_unbuffered_read_iter);
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 17e4ea4456c7..886c2e8f841f 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -100,6 +100,7 @@ int netfs_begin_write(struct netfs_io_request *wreq, bool may_wait,
  * stats.c
  */
 #ifdef CONFIG_NETFS_STATS
+extern atomic_t netfs_n_rh_dio_read;
 extern atomic_t netfs_n_rh_readahead;
 extern atomic_t netfs_n_rh_readpage;
 extern atomic_t netfs_n_rh_rreq;
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 774aef6ea4cb..c972415c8aad 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -78,7 +78,9 @@ static void netfs_read_from_server(struct netfs_io_request *rreq,
 				   struct netfs_io_subrequest *subreq)
 {
 	netfs_stat(&netfs_n_rh_download);
-	if (iov_iter_count(&subreq->io_iter) != subreq->len - subreq->transferred)
+
+	if (rreq->origin != NETFS_DIO_READ &&
+	    iov_iter_count(&subreq->io_iter) != subreq->len - subreq->transferred)
 		pr_warn("R=%08x[%u] ITER PRE-MISMATCH %zx != %zx-%zx %lx\n",
 			rreq->debug_id, subreq->debug_index,
 			iov_iter_count(&subreq->io_iter), subreq->len,
@@ -341,6 +343,43 @@ static void netfs_rreq_is_still_valid(struct netfs_io_request *rreq)
 	}
 }
 
+/*
+ * Determine how much we can admit to having read from a DIO read.
+ */
+static void netfs_rreq_assess_dio(struct netfs_io_request *rreq)
+{
+	struct netfs_io_subrequest *subreq;
+	unsigned int i;
+	size_t transferred = 0;
+
+	for (i = 0; i < rreq->direct_bv_count; i++)
+		flush_dcache_page(rreq->direct_bv[i].bv_page);
+
+	list_for_each_entry(subreq, &rreq->subrequests, rreq_link) {
+		if (subreq->error || subreq->transferred == 0)
+			break;
+		transferred += subreq->transferred;
+		if (subreq->transferred < subreq->len)
+			break;
+	}
+
+	for (i = 0; i < rreq->direct_bv_count; i++)
+		flush_dcache_page(rreq->direct_bv[i].bv_page);
+
+	rreq->transferred = transferred;
+	task_io_account_read(transferred);
+
+	if (rreq->iocb) {
+		rreq->iocb->ki_pos += transferred;
+		if (rreq->iocb->ki_complete)
+			rreq->iocb->ki_complete(
+				rreq->iocb, rreq->error ? rreq->error : transferred);
+	}
+	if (rreq->netfs_ops->done)
+		rreq->netfs_ops->done(rreq);
+	inode_dio_end(rreq->inode);
+}
+
 /*
  * Assess the state of a read request and decide what to do next.
  *
@@ -361,7 +400,10 @@ static void netfs_rreq_assess(struct netfs_io_request *rreq, bool was_async)
 		return;
 	}
 
-	netfs_rreq_unlock_folios(rreq);
+	if (rreq->origin != NETFS_DIO_READ)
+		netfs_rreq_unlock_folios(rreq);
+	else
+		netfs_rreq_assess_dio(rreq);
 
 	trace_netfs_rreq(rreq, netfs_rreq_trace_wake_ip);
 	clear_bit_unlock(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
@@ -526,14 +568,16 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
 			struct netfs_io_subrequest *subreq,
 			struct iov_iter *io_iter)
 {
-	enum netfs_io_source source;
+	enum netfs_io_source source = NETFS_DOWNLOAD_FROM_SERVER;
 	size_t lsize;
 
 	_enter("%llx-%llx,%llx", subreq->start, subreq->start + subreq->len, rreq->i_size);
 
-	source = netfs_cache_prepare_read(subreq, rreq->i_size);
-	if (source == NETFS_INVALID_READ)
-		goto out;
+	if (rreq->origin != NETFS_DIO_READ) {
+		source = netfs_cache_prepare_read(subreq, rreq->i_size);
+		if (source == NETFS_INVALID_READ)
+			goto out;
+	}
 
 	if (source == NETFS_DOWNLOAD_FROM_SERVER) {
 		/* Call out to the netfs to let it shrink the request to fit
@@ -544,6 +588,8 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
 		 */
 		if (subreq->len > rreq->i_size - subreq->start)
 			subreq->len = rreq->i_size - subreq->start;
+		if (rreq->rsize && subreq->len > rreq->rsize)
+			subreq->len = rreq->rsize;
 
 		if (rreq->netfs_ops->clamp_length &&
 		    !rreq->netfs_ops->clamp_length(subreq)) {
@@ -662,6 +708,10 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 		return -EIO;
 	}
 
+	if (rreq->origin == NETFS_DIO_READ)
+		inode_dio_begin(rreq->inode);
+
+	// TODO: Use bounce buffer if requested
 	rreq->io_iter = rreq->iter;
 
 	INIT_WORK(&rreq->work, netfs_rreq_work);
@@ -673,11 +723,25 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 	atomic_set(&rreq->nr_outstanding, 1);
 	io_iter = rreq->io_iter;
 	do {
+		_debug("submit %llx + %zx >= %llx",
+		       rreq->start, rreq->submitted, rreq->i_size);
+		if (rreq->origin == NETFS_DIO_READ &&
+		    rreq->start + rreq->submitted >= rreq->i_size)
+			break;
 		if (!netfs_rreq_submit_slice(rreq, &io_iter, &debug_index))
 			break;
+		if (test_bit(NETFS_RREQ_BLOCKED, &rreq->flags) &&
+		    test_bit(NETFS_RREQ_NONBLOCK, &rreq->flags))
+			break;
 
 	} while (rreq->submitted < rreq->len);
 
+	if (!rreq->submitted) {
+		netfs_put_request(rreq, false, netfs_rreq_trace_put_no_submit);
+		ret = 0;
+		goto out;
+	}
+
 	if (sync) {
 		/* Keep nr_outstanding incremented so that the ref always
 		 * belongs to us, and the service code isn't punted off to a
@@ -694,7 +758,8 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 			    TASK_UNINTERRUPTIBLE);
 
 		ret = rreq->error;
-		if (ret == 0 && rreq->submitted < rreq->len) {
+		if (ret == 0 && rreq->submitted < rreq->len &&
+		    rreq->origin != NETFS_DIO_READ) {
 			trace_netfs_failure(rreq, NULL, ret, netfs_fail_short_read);
 			ret = -EIO;
 		}
@@ -702,7 +767,9 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 		/* If we decrement nr_outstanding to 0, the ref belongs to us. */
 		if (atomic_dec_and_test(&rreq->nr_outstanding))
 			netfs_rreq_assess(rreq, false);
-		ret = 0;
+		ret = -EIOCBQUEUED;
 	}
+
+out:
 	return ret;
 }
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index ab6cac110676..abb8857486ee 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -30,6 +30,7 @@ static const char *netfs_origins[nr__netfs_io_origin] = {
 	[NETFS_READPAGE]	= "RP",
 	[NETFS_READ_FOR_WRITE]	= "RW",
 	[NETFS_WRITEBACK]	= "WB",
+	[NETFS_DIO_READ]	= "DR",
 };
 
 /*
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 3aa0bfbc04ec..7153f24e8034 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -20,7 +20,8 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	struct inode *inode = file ? file_inode(file) : mapping->host;
 	struct netfs_inode *ctx = netfs_inode(inode);
 	struct netfs_io_request *rreq;
-	bool cached = netfs_is_cache_enabled(ctx);
+	bool is_dio = (origin == NETFS_DIO_READ);
+	bool cached = is_dio && netfs_is_cache_enabled(ctx);
 	int ret;
 
 	rreq = kzalloc(ctx->ops->io_request_size ?: sizeof(struct netfs_io_request),
@@ -42,6 +43,8 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
 	if (cached)
 		__set_bit(NETFS_RREQ_WRITE_TO_CACHE, &rreq->flags);
+	if (file && file->f_flags & O_NONBLOCK)
+		__set_bit(NETFS_RREQ_NONBLOCK, &rreq->flags);
 	if (rreq->netfs_ops->init_request) {
 		ret = rreq->netfs_ops->init_request(rreq, file);
 		if (ret < 0) {
diff --git a/fs/netfs/stats.c b/fs/netfs/stats.c
index c1f85cd595a4..15fd5c3f0f39 100644
--- a/fs/netfs/stats.c
+++ b/fs/netfs/stats.c
@@ -9,6 +9,7 @@
 #include <linux/seq_file.h>
 #include "internal.h"
 
+atomic_t netfs_n_rh_dio_read;
 atomic_t netfs_n_rh_readahead;
 atomic_t netfs_n_rh_readpage;
 atomic_t netfs_n_rh_rreq;
@@ -36,7 +37,8 @@ atomic_t netfs_n_wh_write_failed;
 
 int netfs_stats_show(struct seq_file *m, void *v)
 {
-	seq_printf(m, "Netfs  : RA=%u RP=%u WB=%u WBZ=%u rr=%u sr=%u\n",
+	seq_printf(m, "Netfs  : DR=%u RA=%u RP=%u WB=%u WBZ=%u rr=%u sr=%u\n",
+		   atomic_read(&netfs_n_rh_dio_read),
 		   atomic_read(&netfs_n_rh_readahead),
 		   atomic_read(&netfs_n_rh_readpage),
 		   atomic_read(&netfs_n_rh_write_begin),
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 34b4cd9a56a6..784afaff8c78 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -226,6 +226,7 @@ enum netfs_io_origin {
 	NETFS_READPAGE,			/* This read is a synchronous read */
 	NETFS_READ_FOR_WRITE,		/* This read is to prepare a write */
 	NETFS_WRITEBACK,		/* This write was triggered by writepages */
+	NETFS_DIO_READ,			/* This is a direct I/O read */
 	nr__netfs_io_origin
 } __mode(byte);
 
@@ -240,6 +241,7 @@ struct netfs_io_request {
 	};
 	struct inode		*inode;		/* The file being accessed */
 	struct address_space	*mapping;	/* The mapping being accessed */
+	struct kiocb		*iocb;		/* AIO completion vector */
 	struct netfs_cache_resources cache_resources;
 	struct list_head	proc_link;	/* Link in netfs_iorequests */
 	struct list_head	subrequests;	/* Contributory I/O operations */
@@ -250,12 +252,14 @@ struct netfs_io_request {
 	__counted_by(direct_bv_count);
 	unsigned int		direct_bv_count; /* Number of elements in direct_bv[] */
 	unsigned int		debug_id;
+	unsigned int		rsize;		/* Maximum read size (0 for none) */
 	unsigned int		wsize;		/* Maximum write size (0 for none) */
 	unsigned int		subreq_counter;	/* Next subreq->debug_index */
 	atomic_t		nr_outstanding;	/* Number of ops in progress */
 	atomic_t		nr_copy_ops;	/* Number of copy-to-cache ops in progress */
 	size_t			submitted;	/* Amount submitted for I/O so far */
 	size_t			len;		/* Length of the request */
+	size_t			transferred;	/* Amount to be indicated as transferred */
 	short			error;		/* 0 or error that occurred */
 	enum netfs_io_origin	origin;		/* Origin of the request */
 	bool			direct_bv_unpin; /* T if direct_bv[] must be unpinned */
@@ -272,6 +276,8 @@ struct netfs_io_request {
 #define NETFS_RREQ_IN_PROGRESS		5	/* Unlocked when the request completes */
 #define NETFS_RREQ_WRITE_TO_CACHE	7	/* Need to write to the cache */
 #define NETFS_RREQ_UPLOAD_TO_SERVER	8	/* Need to write to the server */
+#define NETFS_RREQ_NONBLOCK		9	/* Don't block if possible (O_NONBLOCK) */
+#define NETFS_RREQ_BLOCKED		10	/* We blocked */
 	const struct netfs_request_ops *netfs_ops;
 	void (*cleanup)(struct netfs_io_request *req);
 };
@@ -368,6 +374,9 @@ struct netfs_cache_ops {
 			       loff_t *_data_start, size_t *_data_len);
 };
 
+/* High-level read API. */
+ssize_t netfs_unbuffered_read_iter(struct kiocb *iocb, struct iov_iter *iter);
+
 /* High-level write API */
 ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 			    struct netfs_group *netfs_group);
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 082a5e717b58..5a4edadf0e59 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -16,6 +16,7 @@
  * Define enums for tracing information.
  */
 #define netfs_read_traces					\
+	EM(netfs_read_trace_dio_read,		"DIO-READ ")	\
 	EM(netfs_read_trace_expanded,		"EXPANDED ")	\
 	EM(netfs_read_trace_readahead,		"READAHEAD")	\
 	EM(netfs_read_trace_readpage,		"READPAGE ")	\
@@ -31,7 +32,8 @@
 	EM(NETFS_READAHEAD,			"RA")		\
 	EM(NETFS_READPAGE,			"RP")		\
 	EM(NETFS_READ_FOR_WRITE,		"RW")		\
-	E_(NETFS_WRITEBACK,			"WB")
+	EM(NETFS_WRITEBACK,			"WB")		\
+	E_(NETFS_DIO_READ,			"DR")
 
 #define netfs_rreq_traces					\
 	EM(netfs_rreq_trace_assess,		"ASSESS ")	\
@@ -70,6 +72,8 @@
 #define netfs_failures							\
 	EM(netfs_fail_check_write_begin,	"check-write-begin")	\
 	EM(netfs_fail_copy_to_cache,		"copy-to-cache")	\
+	EM(netfs_fail_dio_read_short,		"dio-read-short")	\
+	EM(netfs_fail_dio_read_zero,		"dio-read-zero")	\
 	EM(netfs_fail_read,			"read")			\
 	EM(netfs_fail_short_read,		"short-read")		\
 	EM(netfs_fail_prepare_write,		"prep-write")		\
@@ -81,6 +85,7 @@
 	EM(netfs_rreq_trace_put_complete,	"PUT COMPLT ")	\
 	EM(netfs_rreq_trace_put_discard,	"PUT DISCARD")	\
 	EM(netfs_rreq_trace_put_failed,		"PUT FAILED ")	\
+	EM(netfs_rreq_trace_put_no_submit,	"PUT NO-SUBM")	\
 	EM(netfs_rreq_trace_put_return,		"PUT RETURN ")	\
 	EM(netfs_rreq_trace_put_subreq,		"PUT SUBREQ ")	\
 	EM(netfs_rreq_trace_put_work,		"PUT WORK   ")	\
diff --git a/mm/filemap.c b/mm/filemap.c
index f1c8c278310f..1c5271ed0cc0 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2678,6 +2678,7 @@ int kiocb_write_and_wait(struct kiocb *iocb, size_t count)
 
 	return filemap_write_and_wait_range(mapping, pos, end);
 }
+EXPORT_SYMBOL_GPL(kiocb_write_and_wait);
 
 int kiocb_invalidate_pages(struct kiocb *iocb, size_t count)
 {

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

