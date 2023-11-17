Return-Path: <linux-cachefs+bncBDLIXLMFVAERBY5Q36VAMGQETEADUBA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F137EF99E
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:17:24 +0100 (CET)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1efb84e655asf2374152fac.2
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:17:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255843; cv=pass;
        d=google.com; s=arc-20160816;
        b=PGvcudHKyxptFCl74413GAjXBrEqxM6xtvqL13j+N0QbvRmOeJLVPl0gg5GjgNp5ww
         9CCxxv5E4EnxiiF+kR8mwpryIWY+0W/nota1BWIT7FUhiL3P7sw+Dp0y+pHkbrm07CtU
         FFeLl0vJV0t/1gcZj9kUvqEB8b7HsWB0L7BNF02D3ExaZx8D/euOnl9XO8Dfc5VCvOu0
         A5O3ev615BOkpTuhTq7ilJvEBw1QQmK3vxfm62/2ULQ+PDvfF086z4RsMT7Zg995SS6P
         YYG4mzr3bMjKCE0j52lxfQI02Cvxy3gO4rlzz5mHVSWGDww/OqWKH8LgClnbc7/eTQ/G
         iKuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=9UpX2IXbvsL5906/g3pk5QqUHvitF5CvSNZEMHKS4vQ=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=nwcp3W3nHpAoHC0wEp9jwTLsyX4B+uX7bKCmNVJYmTr1BI8dQQwFLRVfZ4C3G9eltb
         ci+IZiiZVxDadCrz5MlNU+GI1uyGiHOyu/RzuJGVK2PcByvyf7UyrI5017CH83gODLZg
         vJq6Kew+MMLWl6CGYiIcS/3ilzhuyWu2VNX+W16IMdyLe3YgGJ9V0KcbYFwp/PTx3cjl
         yhNPTEXXvmkV3m84bXEqdy8BaiyKTNrlENNeUT1F2/dZ1FelkIHsqYK5sDl7IpWRPZTj
         xoQV0VNvZN7Ak/6aLZ+eMSoVfJFPoeHOqLxRTvRYFJaTrO/Q7zYB5jr1atUIKKMSSF1P
         QeVA==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255843; x=1700860643;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UpX2IXbvsL5906/g3pk5QqUHvitF5CvSNZEMHKS4vQ=;
        b=soUZBY7Q/2c24yygtwAEohs3x9lVD1+fSYVO8JFIRD4TdY8o9mGLOr/yDmQ0hPwBxG
         cmfEpCPnQeOL+3y49Ru6m5TP8Tb/EDJpxz4zZEANF/F+q6hJDurAjrtUTCF/lT4LiFg4
         sxMSuaUiTwKzIup52CKuLBXEVqOJfHLrkvYXfvZn+o9bCIm85GSyzSxrkhEEshKLZyLk
         dAN129datrXCzEkywRJlEJ1RSkucOXMfgvBrhNbCXDY/Uz3jP4l3jiTbTfVNByV3Yiqb
         16iIW6ybnaVOyzRb1TvifKzRClu2moYlq/WXGqdkX/5ZzA1MOLY2u/y/teongI4D6eDb
         MVjA==
X-Gm-Message-State: AOJu0YyhEY2SisUAszAklrtENTkSRZnOW3MkyQoX2nxsq/bHokg8QpJ1
	CBVi7ouyq3OFxs+YvwNeLXz5rg==
X-Google-Smtp-Source: AGHT+IGLZfT0cZYmd0tq46atxGCJMiZsfX0eC41E/OJh+iSwxr7+yssfqn9KacQiiX0VeyTO8e08DA==
X-Received: by 2002:a05:6871:e7c6:b0:1ef:f14e:6f4c with SMTP id qc6-20020a056871e7c600b001eff14e6f4cmr464591oac.2.1700255843232;
        Fri, 17 Nov 2023 13:17:23 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1a17:b0:421:961f:1af7 with SMTP id
 f23-20020a05622a1a1700b00421961f1af7ls981668qtb.0.-pod-prod-09-us; Fri, 17
 Nov 2023 13:17:22 -0800 (PST)
X-Received: by 2002:a05:622a:145:b0:41e:9953:ff93 with SMTP id v5-20020a05622a014500b0041e9953ff93mr1032018qtw.19.1700255842487;
        Fri, 17 Nov 2023 13:17:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255842; cv=none;
        d=google.com; s=arc-20160816;
        b=M7jMg3f9TCRkjytVzhJk0dnkLT8XHXMGM75GQSjPCyaijj118SQn6a1k+JAO2CFZEP
         uN+86fHicK5dMAl5cL/FMGGLxHOI+2WeLtRGcLvjK6WvsEXLJv0RUAnNnTmeUiSe1Vn1
         p5zaaG1SbzZP0RGVzaB0P//MXumsenhgAwMSoeQ8OnMGXQS+BMPVt4HogNKBOFfec6en
         6yu/rzQB2tyNjsJz3mxqzXFlHujoFCIlcAp0AcMTylR+EAni+QnyCF/IoSoyEmSma/XM
         VseEUh6uNT2XwIdarAIJEvMqQIro8N3ztUbj6nrj5uFAH3jcHmUcG8RVc8fI/YzPNBMh
         2BDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=+yOm4IVDywiZCKzho20tXVCA+H7Y5PDWdjKfTEAhMyo=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=bJgZytntqB3/bWLlCZphj6fff3C44njGSMH9zGEWa3mXnq0bAQlKW69r1lPK9l8YfP
         GVTENufQLnDxM4vTOVKwx9dXng9obVsWj9kBBdbuiE2/N1K5JjXbfeZ17gtLm56bGgq+
         +yRiS6HqXM9NrpAX+AoDKezaJv0nftbbcm8bWNOElDe/ZSX9eOQNLAVR7H4Fz2+qyeg0
         EmXu01SDptNxZS+k6xeTJTXTgnE9YK+mtqwXM3ysKHgRwLiAzgx0H2OzMH9NrYioCKkn
         DjGnTMIwo0TaEWLEvaZZyNszCOnFYyT3UqoENV/1lk6sglLw3+nDsfcvD6ilvmy8P9/f
         Vfyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id c9-20020ac87d89000000b00419785380fesi2378621qtd.508.2023.11.17.13.17.21
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:17:22 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-7-mtjdrB-iM9qGQEew7R4J-A-1; Fri,
 17 Nov 2023 16:17:19 -0500
X-MC-Unique: mtjdrB-iM9qGQEew7R4J-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 801C11C06525
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:17:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 7BEB436E9; Fri, 17 Nov 2023 21:17:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A6F3636E2;
	Fri, 17 Nov 2023 21:16:57 +0000 (UTC)
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
Subject: [PATCH v2 21/51] netfs: Dispatch write requests to process a writeback slice
Date: Fri, 17 Nov 2023 21:15:13 +0000
Message-ID: <20231117211544.1740466-22-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Dispatch one or more write reqeusts to process a writeback slice, where a
slice is tailored more to logical block divisions within the file (such as
crypto blocks, an object layout or cache granules) than the protocol RPC
maximum capacity.

The dispatch doesn't happen until throttling allows, at which point the
entire writeback slice is processed and queued.  A slice may be written to
multiple destinations (one or more servers and the local cache) and the
writes to each destination might be split up along different lines.

The writeback slice holds the required folios pinned.  An iov_iter is
provided in netfs_write_request that describes the buffer to be used.  This
may be part of the pagecache, may have auxiliary padding pages attached or
may be a bounce buffer resulting from crypto or compression.  Consequently,
the filesystem must not twiddle the folio markings directly.

The following API is available to the filesystem:

 (1) The ->create_write_requests() method is called to ask the filesystem
     to create the requests it needs.  This is passed the writeback slice
     to be processed.

 (2) The filesystem should then call netfs_create_write_request() to create
     the requests it needs.

 (3) Once a request is initialised, netfs_queue_write_request() can be
     called to dispatch it asynchronously, if not completed immediately.

 (4) netfs_write_request_completed() should be called to note the
     completion of a request.

 (5) netfs_get_write_request() and netfs_put_write_request() are provided
     to refcount a request.  These take constants from the netfs_wreq_trace
     enum for logging into ftrace.

 (6) The ->free_write_request is method is called to ask the filesystem to
     clean up a request.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/Makefile            |   3 +-
 fs/netfs/internal.h          |   6 +
 fs/netfs/output.c            | 366 +++++++++++++++++++++++++++++++++++
 include/linux/netfs.h        |  13 ++
 include/trace/events/netfs.h |  50 ++++-
 5 files changed, 435 insertions(+), 3 deletions(-)
 create mode 100644 fs/netfs/output.c

diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index 647ce1935674..ce1197713276 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -7,7 +7,8 @@ netfs-y := \
 	locking.o \
 	main.o \
 	misc.o \
-	objects.o
+	objects.o \
+	output.o
 
 netfs-$(CONFIG_NETFS_STATS) += stats.o
 
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 985647c4648a..c2a4da8f5efb 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -84,6 +84,12 @@ static inline void netfs_see_request(struct netfs_io_request *rreq,
 	trace_netfs_rreq_ref(rreq->debug_id, refcount_read(&rreq->ref), what);
 }
 
+/*
+ * output.c
+ */
+int netfs_begin_write(struct netfs_io_request *wreq, bool may_wait,
+		      enum netfs_write_trace what);
+
 /*
  * stats.c
  */
diff --git a/fs/netfs/output.c b/fs/netfs/output.c
new file mode 100644
index 000000000000..e93453f4372d
--- /dev/null
+++ b/fs/netfs/output.c
@@ -0,0 +1,366 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Network filesystem high-level write support.
+ *
+ * Copyright (C) 2023 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/fs.h>
+#include <linux/mm.h>
+#include <linux/pagemap.h>
+#include <linux/slab.h>
+#include <linux/writeback.h>
+#include <linux/pagevec.h>
+#include "internal.h"
+
+/**
+ * netfs_create_write_request - Create a write operation.
+ * @wreq: The write request this is storing from.
+ * @dest: The destination type
+ * @start: Start of the region this write will modify
+ * @len: Length of the modification
+ * @worker: The worker function to handle the write(s)
+ *
+ * Allocate a write operation, set it up and add it to the list on a write
+ * request.
+ */
+struct netfs_io_subrequest *netfs_create_write_request(struct netfs_io_request *wreq,
+						       enum netfs_io_source dest,
+						       loff_t start, size_t len,
+						       work_func_t worker)
+{
+	struct netfs_io_subrequest *subreq;
+
+	subreq = netfs_alloc_subrequest(wreq);
+	if (subreq) {
+		INIT_WORK(&subreq->work, worker);
+		subreq->source	= dest;
+		subreq->start	= start;
+		subreq->len	= len;
+		subreq->debug_index = wreq->subreq_counter++;
+
+		switch (subreq->source) {
+		case NETFS_UPLOAD_TO_SERVER:
+			netfs_stat(&netfs_n_wh_upload);
+			break;
+		case NETFS_WRITE_TO_CACHE:
+			netfs_stat(&netfs_n_wh_write);
+			break;
+		default:
+			BUG();
+		}
+
+		subreq->io_iter = wreq->io_iter;
+		iov_iter_advance(&subreq->io_iter, subreq->start - wreq->start);
+		iov_iter_truncate(&subreq->io_iter, subreq->len);
+
+		trace_netfs_sreq_ref(wreq->debug_id, subreq->debug_index,
+				     refcount_read(&subreq->ref),
+				     netfs_sreq_trace_new);
+		atomic_inc(&wreq->nr_outstanding);
+		list_add_tail(&subreq->rreq_link, &wreq->subrequests);
+		trace_netfs_sreq(subreq, netfs_sreq_trace_prepare);
+	}
+
+	return subreq;
+}
+EXPORT_SYMBOL(netfs_create_write_request);
+
+/*
+ * Process a completed write request once all the component operations have
+ * been completed.
+ */
+static void netfs_write_terminated(struct netfs_io_request *wreq, bool was_async)
+{
+	struct netfs_io_subrequest *subreq;
+	struct netfs_inode *ctx = netfs_inode(wreq->inode);
+
+	_enter("R=%x[]", wreq->debug_id);
+
+	trace_netfs_rreq(wreq, netfs_rreq_trace_write_done);
+
+	list_for_each_entry(subreq, &wreq->subrequests, rreq_link) {
+		if (!subreq->error)
+			continue;
+		switch (subreq->source) {
+		case NETFS_UPLOAD_TO_SERVER:
+			/* Depending on the type of failure, this may prevent
+			 * writeback completion unless we're in disconnected
+			 * mode.
+			 */
+			if (!wreq->error)
+				wreq->error = subreq->error;
+			break;
+
+		case NETFS_WRITE_TO_CACHE:
+			/* Failure doesn't prevent writeback completion unless
+			 * we're in disconnected mode.
+			 */
+			if (subreq->error != -ENOBUFS)
+				ctx->ops->invalidate_cache(wreq);
+			break;
+
+		default:
+			WARN_ON_ONCE(1);
+			if (!wreq->error)
+				wreq->error = -EIO;
+			return;
+		}
+	}
+
+	wreq->cleanup(wreq);
+
+	_debug("finished");
+	trace_netfs_rreq(wreq, netfs_rreq_trace_wake_ip);
+	clear_bit_unlock(NETFS_RREQ_IN_PROGRESS, &wreq->flags);
+	wake_up_bit(&wreq->flags, NETFS_RREQ_IN_PROGRESS);
+
+	netfs_clear_subrequests(wreq, was_async);
+	netfs_put_request(wreq, was_async, netfs_rreq_trace_put_complete);
+}
+
+/*
+ * Deal with the completion of writing the data to the cache.
+ */
+void netfs_write_subrequest_terminated(void *_op, ssize_t transferred_or_error,
+				       bool was_async)
+{
+	struct netfs_io_subrequest *subreq = _op;
+	struct netfs_io_request *wreq = subreq->rreq;
+	unsigned int u;
+
+	_enter("%x[%x] %zd", wreq->debug_id, subreq->debug_index, transferred_or_error);
+
+	switch (subreq->source) {
+	case NETFS_UPLOAD_TO_SERVER:
+		netfs_stat(&netfs_n_wh_upload_done);
+		break;
+	case NETFS_WRITE_TO_CACHE:
+		netfs_stat(&netfs_n_wh_write_done);
+		break;
+	case NETFS_INVALID_WRITE:
+		break;
+	default:
+		BUG();
+	}
+
+	if (IS_ERR_VALUE(transferred_or_error)) {
+		subreq->error = transferred_or_error;
+		trace_netfs_failure(wreq, subreq, transferred_or_error,
+				    netfs_fail_write);
+		goto failed;
+	}
+
+	if (WARN(transferred_or_error > subreq->len - subreq->transferred,
+		 "Subreq excess write: R%x[%x] %zd > %zu - %zu",
+		 wreq->debug_id, subreq->debug_index,
+		 transferred_or_error, subreq->len, subreq->transferred))
+		transferred_or_error = subreq->len - subreq->transferred;
+
+	subreq->error = 0;
+	subreq->transferred += transferred_or_error;
+
+	if (iov_iter_count(&subreq->io_iter) != subreq->len - subreq->transferred)
+		pr_warn("R=%08x[%u] ITER POST-MISMATCH %zx != %zx-%zx %x\n",
+			wreq->debug_id, subreq->debug_index,
+			iov_iter_count(&subreq->io_iter), subreq->len,
+			subreq->transferred, subreq->io_iter.iter_type);
+
+	if (subreq->transferred < subreq->len)
+		goto incomplete;
+
+	__clear_bit(NETFS_SREQ_NO_PROGRESS, &subreq->flags);
+out:
+	trace_netfs_sreq(subreq, netfs_sreq_trace_terminated);
+
+	/* If we decrement nr_outstanding to 0, the ref belongs to us. */
+	u = atomic_dec_return(&wreq->nr_outstanding);
+	if (u == 0)
+		netfs_write_terminated(wreq, was_async);
+	else if (u == 1)
+		wake_up_var(&wreq->nr_outstanding);
+
+	netfs_put_subrequest(subreq, was_async, netfs_sreq_trace_put_terminated);
+	return;
+
+incomplete:
+	if (transferred_or_error == 0) {
+		if (__test_and_set_bit(NETFS_SREQ_NO_PROGRESS, &subreq->flags)) {
+			subreq->error = -ENODATA;
+			goto failed;
+		}
+	} else {
+		__clear_bit(NETFS_SREQ_NO_PROGRESS, &subreq->flags);
+	}
+
+	__set_bit(NETFS_SREQ_SHORT_IO, &subreq->flags);
+	set_bit(NETFS_RREQ_INCOMPLETE_IO, &wreq->flags);
+	goto out;
+
+failed:
+	switch (subreq->source) {
+	case NETFS_WRITE_TO_CACHE:
+		netfs_stat(&netfs_n_wh_write_failed);
+		set_bit(NETFS_RREQ_INCOMPLETE_IO, &wreq->flags);
+		break;
+	case NETFS_UPLOAD_TO_SERVER:
+		netfs_stat(&netfs_n_wh_upload_failed);
+		set_bit(NETFS_RREQ_FAILED, &wreq->flags);
+		wreq->error = subreq->error;
+		break;
+	default:
+		break;
+	}
+	goto out;
+}
+EXPORT_SYMBOL(netfs_write_subrequest_terminated);
+
+static void netfs_write_to_cache_op(struct netfs_io_subrequest *subreq)
+{
+	struct netfs_io_request *wreq = subreq->rreq;
+	struct netfs_cache_resources *cres = &wreq->cache_resources;
+
+	trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
+
+	cres->ops->write(cres, subreq->start, &subreq->io_iter,
+			 netfs_write_subrequest_terminated, subreq);
+}
+
+static void netfs_write_to_cache_op_worker(struct work_struct *work)
+{
+	struct netfs_io_subrequest *subreq =
+		container_of(work, struct netfs_io_subrequest, work);
+
+	netfs_write_to_cache_op(subreq);
+	netfs_put_subrequest(subreq, false, netfs_sreq_trace_put_work);
+}
+
+/**
+ * netfs_queue_write_request - Queue a write request for attention
+ * @subreq: The write request to be queued
+ *
+ * Queue the specified write request for processing by a worker thread.  We
+ * pass the caller's ref on the request to the worker thread.
+ */
+void netfs_queue_write_request(struct netfs_io_subrequest *subreq)
+{
+	if (!queue_work(system_unbound_wq, &subreq->work))
+		netfs_put_subrequest(subreq, false, netfs_sreq_trace_put_wip);
+}
+EXPORT_SYMBOL(netfs_queue_write_request);
+
+/*
+ * Set up a op for writing to the cache.
+ */
+static void netfs_set_up_write_to_cache(struct netfs_io_request *wreq)
+{
+	struct netfs_cache_resources *cres;
+	struct netfs_io_subrequest *subreq;
+	struct netfs_inode *ctx = netfs_inode(wreq->inode);
+	struct fscache_cookie *cookie = netfs_i_cookie(ctx);
+	loff_t start = wreq->start;
+	size_t len = wreq->len;
+	int ret;
+
+	if (!fscache_cookie_enabled(cookie)) {
+		clear_bit(NETFS_RREQ_WRITE_TO_CACHE, &wreq->flags);
+		return;
+	}
+
+	_debug("write to cache");
+	subreq = netfs_create_write_request(wreq, NETFS_WRITE_TO_CACHE, start, len,
+					    netfs_write_to_cache_op_worker);
+	if (!subreq)
+		return;
+
+	cres = &wreq->cache_resources;
+	ret = -ENOBUFS;
+	if (wreq->netfs_ops->begin_cache_operation)
+		ret = wreq->netfs_ops->begin_cache_operation(wreq);
+	if (ret < 0) {
+		netfs_write_subrequest_terminated(subreq, ret, false);
+		return;
+	}
+
+	ret = cres->ops->prepare_write(cres, &start, &len, i_size_read(wreq->inode),
+				       true);
+	if (ret < 0) {
+		netfs_write_subrequest_terminated(subreq, ret, false);
+		return;
+	}
+
+	netfs_queue_write_request(subreq);
+}
+
+/*
+ * Begin the process of writing out a chunk of data.
+ *
+ * We are given a write request that holds a series of dirty regions and
+ * (partially) covers a sequence of folios, all of which are present.  The
+ * pages must have been marked as writeback as appropriate.
+ *
+ * We need to perform the following steps:
+ *
+ * (1) If encrypting, create an output buffer and encrypt each block of the
+ *     data into it, otherwise the output buffer will point to the original
+ *     folios.
+ *
+ * (2) If the data is to be cached, set up a write op for the entire output
+ *     buffer to the cache, if the cache wants to accept it.
+ *
+ * (3) If the data is to be uploaded (ie. not merely cached):
+ *
+ *     (a) If the data is to be compressed, create a compression buffer and
+ *         compress the data into it.
+ *
+ *     (b) For each destination we want to upload to, set up write ops to write
+ *         to that destination.  We may need multiple writes if the data is not
+ *         contiguous or the span exceeds wsize for a server.
+ */
+int netfs_begin_write(struct netfs_io_request *wreq, bool may_wait,
+		      enum netfs_write_trace what)
+{
+	struct netfs_inode *ctx = netfs_inode(wreq->inode);
+
+	_enter("R=%x %llx-%llx f=%lx",
+	       wreq->debug_id, wreq->start, wreq->start + wreq->len - 1,
+	       wreq->flags);
+
+	trace_netfs_write(wreq, what);
+	if (wreq->len == 0 || wreq->iter.count == 0) {
+		pr_err("Zero-sized write [R=%x]\n", wreq->debug_id);
+		return -EIO;
+	}
+
+	wreq->io_iter = wreq->iter;
+
+	/* ->outstanding > 0 carries a ref */
+	netfs_get_request(wreq, netfs_rreq_trace_get_for_outstanding);
+	atomic_set(&wreq->nr_outstanding, 1);
+
+	/* Start the encryption/compression going.  We can do that in the
+	 * background whilst we generate a list of write ops that we want to
+	 * perform.
+	 */
+	// TODO: Encrypt or compress the region as appropriate
+
+	/* We need to write all of the region to the cache */
+	if (test_bit(NETFS_RREQ_WRITE_TO_CACHE, &wreq->flags))
+		netfs_set_up_write_to_cache(wreq);
+
+	/* However, we don't necessarily write all of the region to the server.
+	 * Caching of reads is being managed this way also.
+	 */
+	if (test_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags))
+		ctx->ops->create_write_requests(wreq, wreq->start, wreq->len);
+
+	if (atomic_dec_and_test(&wreq->nr_outstanding))
+		netfs_write_terminated(wreq, false);
+
+	if (!may_wait)
+		return -EIOCBQUEUED;
+
+	wait_on_bit(&wreq->flags, NETFS_RREQ_IN_PROGRESS,
+		    TASK_UNINTERRUPTIBLE);
+	return wreq->error;
+}
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 6f4e24da27e2..3df6422488de 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -253,6 +253,7 @@ struct netfs_io_request {
 	__counted_by(direct_bv_count);
 	unsigned int		direct_bv_count; /* Number of elements in direct_bv[] */
 	unsigned int		debug_id;
+	unsigned int		wsize;		/* Maximum write size (0 for none) */
 	unsigned int		subreq_counter;	/* Next subreq->debug_index */
 	atomic_t		nr_outstanding;	/* Number of ops in progress */
 	atomic_t		nr_copy_ops;	/* Number of copy-to-cache ops in progress */
@@ -276,6 +277,7 @@ struct netfs_io_request {
 #define NETFS_RREQ_WRITE_TO_CACHE	7	/* Need to write to the cache */
 #define NETFS_RREQ_UPLOAD_TO_SERVER	8	/* Need to write to the server */
 	const struct netfs_request_ops *netfs_ops;
+	void (*cleanup)(struct netfs_io_request *req);
 };
 
 /*
@@ -300,6 +302,11 @@ struct netfs_request_ops {
 
 	/* Modification handling */
 	void (*update_i_size)(struct inode *inode, loff_t i_size);
+
+	/* Write request handling */
+	void (*create_write_requests)(struct netfs_io_request *wreq,
+				      loff_t start, size_t len);
+	void (*invalidate_cache)(struct netfs_io_request *wreq);
 };
 
 /*
@@ -387,6 +394,12 @@ ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
 				iov_iter_extraction_t extraction_flags);
 size_t netfs_limit_iter(const struct iov_iter *iter, size_t start_offset,
 			size_t max_size, size_t max_segs);
+struct netfs_io_subrequest *netfs_create_write_request(
+	struct netfs_io_request *wreq, enum netfs_io_source dest,
+	loff_t start, size_t len, work_func_t worker);
+void netfs_write_subrequest_terminated(void *_op, ssize_t transferred_or_error,
+				       bool was_async);
+void netfs_queue_write_request(struct netfs_io_subrequest *subreq);
 
 int netfs_start_io_read(struct inode *inode);
 void netfs_end_io_read(struct inode *inode);
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 6daadf2aac8a..e03635172760 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -21,6 +21,11 @@
 	EM(netfs_read_trace_readpage,		"READPAGE ")	\
 	E_(netfs_read_trace_write_begin,	"WRITEBEGN")
 
+#define netfs_write_traces					\
+	EM(netfs_write_trace_dio_write,		"DIO-WRITE")	\
+	EM(netfs_write_trace_unbuffered_write,	"UNB-WRITE")	\
+	E_(netfs_write_trace_writeback,		"WRITEBACK")
+
 #define netfs_rreq_origins					\
 	EM(NETFS_READAHEAD,			"RA")		\
 	EM(NETFS_READPAGE,			"RP")		\
@@ -32,11 +37,13 @@
 	EM(netfs_rreq_trace_copy,		"COPY   ")	\
 	EM(netfs_rreq_trace_done,		"DONE   ")	\
 	EM(netfs_rreq_trace_free,		"FREE   ")	\
+	EM(netfs_rreq_trace_redirty,		"REDIRTY")	\
 	EM(netfs_rreq_trace_resubmit,		"RESUBMT")	\
 	EM(netfs_rreq_trace_unlock,		"UNLOCK ")	\
 	EM(netfs_rreq_trace_unmark,		"UNMARK ")	\
 	EM(netfs_rreq_trace_wait_ip,		"WAIT-IP")	\
-	E_(netfs_rreq_trace_wake_ip,		"WAKE-IP")
+	EM(netfs_rreq_trace_wake_ip,		"WAKE-IP")	\
+	E_(netfs_rreq_trace_write_done,		"WR-DONE")
 
 #define netfs_sreq_sources					\
 	EM(NETFS_FILL_WITH_ZEROES,		"ZERO")		\
@@ -64,7 +71,8 @@
 	EM(netfs_fail_copy_to_cache,		"copy-to-cache")	\
 	EM(netfs_fail_read,			"read")			\
 	EM(netfs_fail_short_read,		"short-read")		\
-	E_(netfs_fail_prepare_write,		"prep-write")
+	EM(netfs_fail_prepare_write,		"prep-write")		\
+	E_(netfs_fail_write,			"write")
 
 #define netfs_rreq_ref_traces					\
 	EM(netfs_rreq_trace_get_for_outstanding,"GET OUTSTND")	\
@@ -74,6 +82,8 @@
 	EM(netfs_rreq_trace_put_failed,		"PUT FAILED ")	\
 	EM(netfs_rreq_trace_put_return,		"PUT RETURN ")	\
 	EM(netfs_rreq_trace_put_subreq,		"PUT SUBREQ ")	\
+	EM(netfs_rreq_trace_put_work,		"PUT WORK   ")	\
+	EM(netfs_rreq_trace_see_work,		"SEE WORK   ")	\
 	E_(netfs_rreq_trace_new,		"NEW        ")
 
 #define netfs_sreq_ref_traces					\
@@ -82,9 +92,12 @@
 	EM(netfs_sreq_trace_get_short_read,	"GET SHORTRD")	\
 	EM(netfs_sreq_trace_new,		"NEW        ")	\
 	EM(netfs_sreq_trace_put_clear,		"PUT CLEAR  ")	\
+	EM(netfs_sreq_trace_put_discard,	"PUT DISCARD")	\
 	EM(netfs_sreq_trace_put_failed,		"PUT FAILED ")	\
 	EM(netfs_sreq_trace_put_merged,		"PUT MERGED ")	\
 	EM(netfs_sreq_trace_put_no_copy,	"PUT NO COPY")	\
+	EM(netfs_sreq_trace_put_wip,		"PUT WIP    ")	\
+	EM(netfs_sreq_trace_put_work,		"PUT WORK   ")	\
 	E_(netfs_sreq_trace_put_terminated,	"PUT TERM   ")
 
 #ifndef __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
@@ -96,6 +109,7 @@
 #define E_(a, b) a
 
 enum netfs_read_trace { netfs_read_traces } __mode(byte);
+enum netfs_write_trace { netfs_write_traces } __mode(byte);
 enum netfs_rreq_trace { netfs_rreq_traces } __mode(byte);
 enum netfs_sreq_trace { netfs_sreq_traces } __mode(byte);
 enum netfs_failure { netfs_failures } __mode(byte);
@@ -113,6 +127,7 @@ enum netfs_sreq_ref_trace { netfs_sreq_ref_traces } __mode(byte);
 #define E_(a, b) TRACE_DEFINE_ENUM(a);
 
 netfs_read_traces;
+netfs_write_traces;
 netfs_rreq_origins;
 netfs_rreq_traces;
 netfs_sreq_sources;
@@ -320,6 +335,37 @@ TRACE_EVENT(netfs_sreq_ref,
 		      __entry->ref)
 	    );
 
+TRACE_EVENT(netfs_write,
+	    TP_PROTO(const struct netfs_io_request *wreq,
+		     enum netfs_write_trace what),
+
+	    TP_ARGS(wreq, what),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,		wreq		)
+		    __field(unsigned int,		cookie		)
+		    __field(enum netfs_write_trace,	what		)
+		    __field(unsigned long long,		start		)
+		    __field(size_t,			len		)
+			     ),
+
+	    TP_fast_assign(
+		    struct netfs_inode *__ctx = netfs_inode(wreq->inode);
+		    struct fscache_cookie *__cookie = netfs_i_cookie(__ctx);
+		    __entry->wreq	= wreq->debug_id;
+		    __entry->cookie	= __cookie ? __cookie->debug_id : 0;
+		    __entry->what	= what;
+		    __entry->start	= wreq->start;
+		    __entry->len	= wreq->len;
+			   ),
+
+	    TP_printk("R=%08x %s c=%08x by=%llx-%llx",
+		      __entry->wreq,
+		      __print_symbolic(__entry->what, netfs_write_traces),
+		      __entry->cookie,
+		      __entry->start, __entry->start + __entry->len - 1)
+	    );
+
 #undef EM
 #undef E_
 #endif /* _TRACE_NETFS_H */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

