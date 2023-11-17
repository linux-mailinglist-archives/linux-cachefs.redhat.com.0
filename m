Return-Path: <linux-cachefs+bncBDLIXLMFVAERBZNQ36VAMGQEYW6TZWQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 955277EF99F
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:17:26 +0100 (CET)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3b3f893e38asf3065937b6e.0
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:17:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255845; cv=pass;
        d=google.com; s=arc-20160816;
        b=uI4BGvR9khERauuCP39lUunp/dZLOgdGGfDl47DbhF95oEDWEum7y2cDWPp6aeYSxW
         hlPvQtX5FNZl4xoHC3FmF1HjBqR7vPzfO58vt09cnrmnIRTaq0PR4ErIzLnlRx6tjGVe
         HFqUIIBGvHrAZm2juXXAdq2964gaII3b2T4O4rClskYYmLNaUM5b318UP1vhSyvMa7Q/
         NUB2UPUdUziCrBbkpGYuY+W3mZCk+LkMYhaxeatXAffmAHxO4Hdkr9C+08Vj49orKkv4
         oByI+ycJT4TPccGi+cvPp70NoGu1KdiHdtl6mWCwOv9OvKUQAxBaeShD0USwMRFLLgK3
         lI1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=20X7uhuv5NlPexm9+z15dPh9uJxjkjzOPyF6a2e7tVg=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=bMKSte4uFbOMYn/R0C/uKhPZ/1cJdimVCcWK/+ykVxqZqYBwETJPbOEa0iSFQsBjAZ
         nlVAN8+DT9Wmo39Tbf5gIfi3PnElIUXrHFCrj8vN+dpHEEp9KimO/CsVTZv+MbAesWq/
         loEMb7s6DpMdDlWhye7R7/n9Ny0afmKtylVlMP3sXTPPtcO/t/nhwLvu52dnqGr+SgX5
         isBm6nJCUkuo+/862IJ2FQJuhAp6FqFzZtFKupnCvCtUwBdx29e/1Ub+4SrwFZa/mf7b
         K7YJVNiPr0nqkbqHzjOtobUyAXbbpCGJRAVP816O9EcffW7Fv4qA5u28lQbfUpgqjqto
         DTPQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255845; x=1700860645;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20X7uhuv5NlPexm9+z15dPh9uJxjkjzOPyF6a2e7tVg=;
        b=eirY47ODJgaimnK/wLifZ8mJGEdJtGoyLTagCyiOKdKyEfVErjE8ODGjbshZqWYgyT
         OlUy4e/zKfeLH/wdIbawLtu2ZMnXFI6XaSLxsZ5PfsgjBzorUg10Wf2SlP/Xdf9lty9X
         g+V5uRRTBHZ9srUj1MupLRQbeaiNea+TnN/mawSr3rmJ0G/uAnPxl0n/tVzHXwPKAPML
         gUCZQJO3IeMsrgAqKpTo4M+SKbDOEmrcXfJ474QmB/6dctyPOs9Z6v1yMEe7d00mJj8n
         0xnmETtAIiSyid9iDPadi//jYdux07kbRo4xFsxdQS1XRPwzMgf3e7P91YJV5SwUAi6k
         h3tA==
X-Gm-Message-State: AOJu0YzScWVOowN9AwwWEpcaweFTODLWuiCxdFkRwelv9MzIO6YxJGbe
	2/jlgj1XQuuI6pIFSybnK4J8jA==
X-Google-Smtp-Source: AGHT+IGNpsyjGH0MXe1nZCV2dChaFXrM39nRSxtcKiOHx48XNBWSgBTZuyXp/Pz1GsdutvE2BsoeLQ==
X-Received: by 2002:a05:6808:3191:b0:3b2:e5c1:adef with SMTP id cd17-20020a056808319100b003b2e5c1adefmr647188oib.56.1700255845468;
        Fri, 17 Nov 2023 13:17:25 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:e5c6:0:b0:65d:b9b:f30e with SMTP id u6-20020a0ce5c6000000b0065d0b9bf30els1626501qvm.0.-pod-prod-03-us;
 Fri, 17 Nov 2023 13:17:25 -0800 (PST)
X-Received: by 2002:a05:6214:1946:b0:66d:2e59:4fc2 with SMTP id q6-20020a056214194600b0066d2e594fc2mr399743qvk.40.1700255844833;
        Fri, 17 Nov 2023 13:17:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255844; cv=none;
        d=google.com; s=arc-20160816;
        b=YFnDt0V0tF8g8CUe/aPiAKAJYwibm2W/GkbM81oo3qrgmEYK4qm86GPrebVxpgVyIW
         vs3Q2hxU51/IwhgeMOJlq+J6oFBZktIwUHBlFXWaCXr0cqswbWJKU+zANo/NbwXg+NsM
         4lCf55hiLWPfRuVFHrL9qXPZ33KVYu6wjm2gJKqKNIJrTBo0PAApe/RE+6s1RGEJU3cA
         5JrQJ4F9sObMGrsCMmYK5XOfaAvdh64j0yBuYLwNivOtHCC/pphTGYcUBp6xJ3pjDb4L
         3BNTKorrORuZKcrc24WuXGlsBQsNvbl9wbvP8FwjYZ0YeZvBjrWMXxFWacXTVEH+MMJk
         blbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=isIs8RERko9/3i7pNdjxpIF73sK3TWBofNdC7wpH/LQ=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=KJC100gAc2rAIXn+OhZj56/XCtXIJOaaXDkl46PtW84XrWl+MiHAij2PdSLd569EPz
         2KfV/ocGkRg1NWcnM4R+CGUv8eKtZgcdCnIgGGCiJiCb0F5DcrPhXnROGe46Ite6LBm/
         sIsiz/zh25bRZnTzQ2qh/Cm8ToiVeaN8iVpZ5P7Rtn3PymVTZr+QIt0Ma1FeF9BQY5xP
         rr0bxf+7Z3dZo8nuDJAaxSSChB9KAF7v9WhLbfvmN0ArxZKxOFIhfwnCxjAuo/RYxPEc
         +5Ex6/dKduwjEseFBt0FxFZUA+3iQDxl4MVWwBowxTF6bsdcjFGFdNszVLYj2RCOvCXQ
         GAnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id a4-20020a0cc584000000b0065afaecdbfcsi2311052qvj.190.2023.11.17.13.17.24
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:17:24 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-M_6hy61JOcWwkBR8F2bnGQ-1; Fri, 17 Nov 2023 16:17:23 -0500
X-MC-Unique: M_6hy61JOcWwkBR8F2bnGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1911282193B
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:17:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 15D1B503A; Fri, 17 Nov 2023 21:17:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 464F610E45;
	Fri, 17 Nov 2023 21:17:20 +0000 (UTC)
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
Subject: [PATCH v2 22/51] netfs: Provide func to copy data to pagecache for buffered write
Date: Fri, 17 Nov 2023 21:15:14 +0000
Message-ID: <20231117211544.1740466-23-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Provide a netfs write helper, netfs_perform_write() to buffer data to be
written in the pagecache and mark the modified folios dirty.

It will perform "streaming writes" for folios that aren't currently
resident, if possible, storing data in partially modified folios that are
marked dirty, but not uptodate.  It will also tag pages as belonging to
fs-specific write groups if so directed by the filesystem.

This is derived from generic_perform_write(), but doesn't use
->write_begin() and ->write_end(), having that logic rolled in instead.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/Makefile            |   1 +
 fs/netfs/buffered_read.c     |  48 +++++
 fs/netfs/buffered_write.c    | 327 +++++++++++++++++++++++++++++++++++
 fs/netfs/internal.h          |   2 +
 include/linux/netfs.h        |   5 +
 include/trace/events/netfs.h |  70 ++++++++
 6 files changed, 453 insertions(+)
 create mode 100644 fs/netfs/buffered_write.c

diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index ce1197713276..90d76e9bb40d 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -2,6 +2,7 @@
 
 netfs-y := \
 	buffered_read.o \
+	buffered_write.o \
 	io.o \
 	iterator.o \
 	locking.o \
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 05824f73cfc7..2f06344bba21 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -461,3 +461,51 @@ int netfs_write_begin(struct netfs_inode *ctx,
 	return ret;
 }
 EXPORT_SYMBOL(netfs_write_begin);
+
+/*
+ * Preload the data into a page we're proposing to write into.
+ */
+int netfs_prefetch_for_write(struct file *file, struct folio *folio,
+			     size_t offset, size_t len)
+{
+	struct netfs_io_request *rreq;
+	struct address_space *mapping = folio_file_mapping(folio);
+	struct netfs_inode *ctx = netfs_inode(mapping->host);
+	unsigned long long start = folio_pos(folio);
+	size_t flen = folio_size(folio);
+	int ret;
+
+	_enter("%zx @%llx", flen, start);
+
+	ret = -ENOMEM;
+
+	rreq = netfs_alloc_request(mapping, file, start, flen,
+				   NETFS_READ_FOR_WRITE);
+	if (IS_ERR(rreq)) {
+		ret = PTR_ERR(rreq);
+		goto error;
+	}
+
+	rreq->no_unlock_folio = folio_index(folio);
+	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
+	ret = netfs_begin_cache_operation(rreq, ctx);
+	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
+		goto error_put;
+
+	netfs_stat(&netfs_n_rh_write_begin);
+	trace_netfs_read(rreq, start, flen, netfs_read_trace_prefetch_for_write);
+
+	/* Set up the output buffer */
+	iov_iter_xarray(&rreq->iter, ITER_DEST, &mapping->i_pages,
+			rreq->start, rreq->len);
+
+	ret = netfs_begin_read(rreq, true);
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
+	return ret;
+
+error_put:
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_discard);
+error:
+	_leave(" = %d", ret);
+	return ret;
+}
diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
new file mode 100644
index 000000000000..406c3f3666fa
--- /dev/null
+++ b/fs/netfs/buffered_write.c
@@ -0,0 +1,327 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Network filesystem high-level write support.
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
+#include <linux/pagevec.h>
+#include "internal.h"
+
+/*
+ * Determined write method.  Adjust netfs_folio_traces if this is changed.
+ */
+enum netfs_how_to_modify {
+	NETFS_FOLIO_IS_UPTODATE,	/* Folio is uptodate already */
+	NETFS_JUST_PREFETCH,		/* We have to read the folio anyway */
+	NETFS_WHOLE_FOLIO_MODIFY,	/* We're going to overwrite the whole folio */
+	NETFS_MODIFY_AND_CLEAR,		/* We can assume there is no data to be downloaded. */
+	NETFS_STREAMING_WRITE,		/* Store incomplete data in non-uptodate page. */
+	NETFS_STREAMING_WRITE_CONT,	/* Continue streaming write. */
+	NETFS_FLUSH_CONTENT,		/* Flush incompatible content. */
+};
+
+static void netfs_set_group(struct folio *folio, struct netfs_group *netfs_group)
+{
+	if (netfs_group && !folio_get_private(folio))
+		folio_attach_private(folio, netfs_get_group(netfs_group));
+}
+
+/*
+ * Decide how we should modify a folio.  We might be attempting to do
+ * write-streaming, in which case we don't want to a local RMW cycle if we can
+ * avoid it.  If we're doing local caching or content crypto, we award that
+ * priority over avoiding RMW.  If the file is open readably, then we also
+ * assume that we may want to read what we wrote.
+ */
+static enum netfs_how_to_modify netfs_how_to_modify(struct netfs_inode *ctx,
+						    struct file *file,
+						    struct folio *folio,
+						    void *netfs_group,
+						    size_t flen,
+						    size_t offset,
+						    size_t len,
+						    bool maybe_trouble)
+{
+	struct netfs_folio *finfo = netfs_folio_info(folio);
+	loff_t pos = folio_file_pos(folio);
+
+	_enter("z=%llx", ctx->zero_point);
+
+	if (netfs_folio_group(folio) != netfs_group)
+		return NETFS_FLUSH_CONTENT;
+
+	if (folio_test_uptodate(folio))
+		return NETFS_FOLIO_IS_UPTODATE;
+
+	if (pos >= ctx->zero_point)
+		return NETFS_MODIFY_AND_CLEAR;
+
+	if (!maybe_trouble && offset == 0 && len >= flen)
+		return NETFS_WHOLE_FOLIO_MODIFY;
+
+	if (file->f_mode & FMODE_READ)
+		return NETFS_JUST_PREFETCH;
+
+	if (netfs_is_cache_enabled(ctx))
+		return NETFS_JUST_PREFETCH;
+
+	if (!finfo)
+		return NETFS_STREAMING_WRITE;
+
+	/* We can continue a streaming write only if it continues on from the
+	 * previous.  If it overlaps, we must flush lest we suffer a partial
+	 * copy and disjoint dirty regions.
+	 */
+	if (offset == finfo->dirty_offset + finfo->dirty_len)
+		return NETFS_STREAMING_WRITE_CONT;
+	return NETFS_FLUSH_CONTENT;
+}
+
+/*
+ * Grab a folio for writing and lock it.
+ */
+static struct folio *netfs_grab_folio_for_write(struct address_space *mapping,
+						loff_t pos, size_t part)
+{
+	pgoff_t index = pos / PAGE_SIZE;
+
+	return __filemap_get_folio(mapping, index, FGP_WRITEBEGIN,
+				   mapping_gfp_mask(mapping));
+}
+
+/**
+ * netfs_perform_write - Copy data into the pagecache.
+ * @iocb: The operation parameters
+ * @iter: The source buffer
+ * @netfs_group: Grouping for dirty pages (eg. ceph snaps).
+ *
+ * Copy data into pagecache pages attached to the inode specified by @iocb.
+ * The caller must hold appropriate inode locks.
+ *
+ * Dirty pages are tagged with a netfs_folio struct if they're not up to date
+ * to indicate the range modified.  Dirty pages may also be tagged with a
+ * netfs-specific grouping such that data from an old group gets flushed before
+ * a new one is started.
+ */
+ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
+			    struct netfs_group *netfs_group)
+{
+	struct file *file = iocb->ki_filp;
+	struct inode *inode = file_inode(file);
+	struct address_space *mapping = inode->i_mapping;
+	struct netfs_inode *ctx = netfs_inode(inode);
+	struct netfs_folio *finfo;
+	struct folio *folio;
+	enum netfs_how_to_modify howto;
+	enum netfs_folio_trace trace;
+	unsigned int bdp_flags = (iocb->ki_flags & IOCB_SYNC) ? 0: BDP_ASYNC;
+	ssize_t written = 0, ret;
+	loff_t i_size, pos = iocb->ki_pos, from, to;
+	size_t max_chunk = PAGE_SIZE << MAX_PAGECACHE_ORDER;
+	bool maybe_trouble = false;
+
+	do {
+		size_t flen;
+		size_t offset;	/* Offset into pagecache folio */
+		size_t part;	/* Bytes to write to folio */
+		size_t copied;	/* Bytes copied from user */
+
+		ret = balance_dirty_pages_ratelimited_flags(mapping, bdp_flags);
+		if (unlikely(ret < 0))
+			break;
+
+		offset = pos & (max_chunk - 1);
+		part = min(max_chunk - offset, iov_iter_count(iter));
+
+		/* Bring in the user pages that we will copy from _first_ lest
+		 * we hit a nasty deadlock on copying from the same page as
+		 * we're writing to, without it being marked uptodate.
+		 *
+		 * Not only is this an optimisation, but it is also required to
+		 * check that the address is actually valid, when atomic
+		 * usercopies are used below.
+		 *
+		 * We rely on the page being held onto long enough by the LRU
+		 * that we can grab it below if this causes it to be read.
+		 */
+		ret = -EFAULT;
+		if (unlikely(fault_in_iov_iter_readable(iter, part) == part))
+			break;
+
+		ret = -ENOMEM;
+		folio = netfs_grab_folio_for_write(mapping, pos, part);
+		if (!folio)
+			break;
+
+		flen = folio_size(folio);
+		offset = pos & (flen - 1);
+		part = min_t(size_t, flen - offset, part);
+
+		if (signal_pending(current)) {
+			ret = written ? -EINTR : -ERESTARTSYS;
+			goto error_folio_unlock;
+		}
+
+		/* See if we need to prefetch the area we're going to modify.
+		 * We need to do this before we get a lock on the folio in case
+		 * there's more than one writer competing for the same cache
+		 * block.
+		 */
+		howto = netfs_how_to_modify(ctx, file, folio, netfs_group,
+					    flen, offset, part, maybe_trouble);
+		_debug("howto %u", howto);
+		switch (howto) {
+		case NETFS_JUST_PREFETCH:
+			ret = netfs_prefetch_for_write(file, folio, offset, part);
+			if (ret < 0) {
+				_debug("prefetch = %zd", ret);
+				goto error_folio_unlock;
+			}
+			break;
+		case NETFS_FOLIO_IS_UPTODATE:
+		case NETFS_WHOLE_FOLIO_MODIFY:
+		case NETFS_STREAMING_WRITE_CONT:
+			break;
+		case NETFS_MODIFY_AND_CLEAR:
+			zero_user_segment(&folio->page, 0, offset);
+			break;
+		case NETFS_STREAMING_WRITE:
+			ret = -EIO;
+			if (WARN_ON(folio_get_private(folio)))
+				goto error_folio_unlock;
+			break;
+		case NETFS_FLUSH_CONTENT:
+			trace_netfs_folio(folio, netfs_flush_content);
+			from = folio_pos(folio);
+			to = from + folio_size(folio) - 1;
+			folio_unlock(folio);
+			folio_put(folio);
+			ret = filemap_write_and_wait_range(mapping, from, to);
+			if (ret < 0)
+				goto error_folio_unlock;
+			continue;
+		}
+
+		if (mapping_writably_mapped(mapping))
+			flush_dcache_folio(folio);
+
+		copied = copy_folio_from_iter_atomic(folio, offset, part, iter);
+
+		flush_dcache_folio(folio);
+
+		/* Deal with a (partially) failed copy */
+		if (copied == 0) {
+			ret = -EFAULT;
+			goto error_folio_unlock;
+		}
+
+		trace = (enum netfs_folio_trace)howto;
+		switch (howto) {
+		case NETFS_FOLIO_IS_UPTODATE:
+		case NETFS_JUST_PREFETCH:
+			netfs_set_group(folio, netfs_group);
+			break;
+		case NETFS_MODIFY_AND_CLEAR:
+			zero_user_segment(&folio->page, offset + copied, flen);
+			netfs_set_group(folio, netfs_group);
+			folio_mark_uptodate(folio);
+			break;
+		case NETFS_WHOLE_FOLIO_MODIFY:
+			if (unlikely(copied < part)) {
+				maybe_trouble = true;
+				iov_iter_revert(iter, copied);
+				copied = 0;
+				goto retry;
+			}
+			netfs_set_group(folio, netfs_group);
+			folio_mark_uptodate(folio);
+			break;
+		case NETFS_STREAMING_WRITE:
+			if (offset == 0 && copied == flen) {
+				netfs_set_group(folio, netfs_group);
+				folio_mark_uptodate(folio);
+				trace = netfs_streaming_filled_page;
+				break;
+			}
+			finfo = kzalloc(sizeof(*finfo), GFP_KERNEL);
+			if (!finfo) {
+				iov_iter_revert(iter, copied);
+				ret = -ENOMEM;
+				goto error_folio_unlock;
+			}
+			finfo->netfs_group = netfs_get_group(netfs_group);
+			finfo->dirty_offset = offset;
+			finfo->dirty_len = copied;
+			folio_attach_private(folio, (void *)((unsigned long)finfo |
+							     NETFS_FOLIO_INFO));
+			break;
+		case NETFS_STREAMING_WRITE_CONT:
+			finfo = netfs_folio_info(folio);
+			finfo->dirty_len += copied;
+			if (finfo->dirty_offset == 0 && finfo->dirty_len == flen) {
+				folio_change_private(folio, finfo->netfs_group);
+				folio_mark_uptodate(folio);
+				kfree(finfo);
+				trace = netfs_streaming_filled_page;
+			}
+			break;
+		default:
+			WARN(true, "Unexpected modify type %u ix=%lx\n",
+			     howto, folio_index(folio));
+			ret = -EIO;
+			goto error_folio_unlock;
+		}
+
+		trace_netfs_folio(folio, trace);
+
+		/* Update the inode size if we moved the EOF marker */
+		i_size = i_size_read(inode);
+		pos += copied;
+		if (pos > i_size) {
+			if (ctx->ops->update_i_size) {
+				ctx->ops->update_i_size(inode, pos);
+			} else {
+				i_size_write(inode, pos);
+#if IS_ENABLED(CONFIG_FSCACHE)
+				fscache_update_cookie(ctx->cache, NULL, &pos);
+#endif
+			}
+		}
+		written += copied;
+
+		folio_mark_dirty(folio);
+	retry:
+		folio_unlock(folio);
+		folio_put(folio);
+		folio = NULL;
+
+		cond_resched();
+	} while (iov_iter_count(iter));
+
+out:
+	if (likely(written)) {
+		/* Flush and wait for a write that requires immediate synchronisation. */
+		if (iocb->ki_flags & (IOCB_DSYNC | IOCB_SYNC)) {
+			_debug("dsync");
+			ret = filemap_fdatawait_range(mapping, iocb->ki_pos,
+						      iocb->ki_pos + written);
+		}
+
+		iocb->ki_pos += written;
+	}
+
+	_leave(" = %zd [%zd]", written, ret);
+	return written ? written : ret;
+
+error_folio_unlock:
+	folio_unlock(folio);
+	folio_put(folio);
+	goto out;
+}
+EXPORT_SYMBOL(netfs_perform_write);
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index c2a4da8f5efb..f0bd755ef288 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -19,6 +19,8 @@
  * buffered_read.c
  */
 void netfs_rreq_unlock_folios(struct netfs_io_request *rreq);
+int netfs_prefetch_for_write(struct file *file, struct folio *folio,
+			     size_t offset, size_t len);
 
 /*
  * io.c
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 3df6422488de..81bbd29a6b7b 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -374,6 +374,11 @@ struct netfs_cache_ops {
 			       loff_t *_data_start, size_t *_data_len);
 };
 
+/* High-level write API */
+ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
+			    struct netfs_group *netfs_group);
+
+/* Address operations API */
 struct readahead_control;
 void netfs_readahead(struct readahead_control *);
 int netfs_read_folio(struct file *, struct folio *);
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index e03635172760..94793f842000 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -19,6 +19,7 @@
 	EM(netfs_read_trace_expanded,		"EXPANDED ")	\
 	EM(netfs_read_trace_readahead,		"READAHEAD")	\
 	EM(netfs_read_trace_readpage,		"READPAGE ")	\
+	EM(netfs_read_trace_prefetch_for_write,	"PREFETCHW")	\
 	E_(netfs_read_trace_write_begin,	"WRITEBEGN")
 
 #define netfs_write_traces					\
@@ -100,6 +101,28 @@
 	EM(netfs_sreq_trace_put_work,		"PUT WORK   ")	\
 	E_(netfs_sreq_trace_put_terminated,	"PUT TERM   ")
 
+#define netfs_folio_traces					\
+	/* The first few correspond to enum netfs_how_to_modify */	\
+	EM(netfs_folio_is_uptodate,		"mod-uptodate")	\
+	EM(netfs_just_prefetch,			"mod-prefetch")	\
+	EM(netfs_whole_folio_modify,		"mod-whole-f")	\
+	EM(netfs_modify_and_clear,		"mod-n-clear")	\
+	EM(netfs_streaming_write,		"mod-streamw")	\
+	EM(netfs_streaming_write_cont,		"mod-streamw+")	\
+	EM(netfs_flush_content,			"flush")	\
+	EM(netfs_streaming_filled_page,		"mod-streamw-f") \
+	/* The rest are for writeback */			\
+	EM(netfs_folio_trace_clear,		"clear")	\
+	EM(netfs_folio_trace_clear_s,		"clear-s")	\
+	EM(netfs_folio_trace_clear_g,		"clear-g")	\
+	EM(netfs_folio_trace_kill,		"kill")		\
+	EM(netfs_folio_trace_mkwrite,		"mkwrite")	\
+	EM(netfs_folio_trace_mkwrite_plus,	"mkwrite+")	\
+	EM(netfs_folio_trace_redirty,		"redirty")	\
+	EM(netfs_folio_trace_redirtied,		"redirtied")	\
+	EM(netfs_folio_trace_store,		"store")	\
+	E_(netfs_folio_trace_store_plus,	"store+")
+
 #ifndef __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
 #define __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
 
@@ -115,6 +138,7 @@ enum netfs_sreq_trace { netfs_sreq_traces } __mode(byte);
 enum netfs_failure { netfs_failures } __mode(byte);
 enum netfs_rreq_ref_trace { netfs_rreq_ref_traces } __mode(byte);
 enum netfs_sreq_ref_trace { netfs_sreq_ref_traces } __mode(byte);
+enum netfs_folio_trace { netfs_folio_traces } __mode(byte);
 
 #endif
 
@@ -135,6 +159,7 @@ netfs_sreq_traces;
 netfs_failures;
 netfs_rreq_ref_traces;
 netfs_sreq_ref_traces;
+netfs_folio_traces;
 
 /*
  * Now redefine the EM() and E_() macros to map the enums to the strings that
@@ -335,6 +360,51 @@ TRACE_EVENT(netfs_sreq_ref,
 		      __entry->ref)
 	    );
 
+TRACE_EVENT(netfs_folio,
+	    TP_PROTO(struct folio *folio, enum netfs_folio_trace why),
+
+	    TP_ARGS(folio, why),
+
+	    TP_STRUCT__entry(
+		    __field(ino_t,			ino)
+		    __field(pgoff_t,			index)
+		    __field(unsigned int,		nr)
+		    __field(enum netfs_folio_trace,	why)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->ino = folio->mapping->host->i_ino;
+		    __entry->why = why;
+		    __entry->index = folio_index(folio);
+		    __entry->nr = folio_nr_pages(folio);
+			   ),
+
+	    TP_printk("i=%05lx ix=%05lx-%05lx %s",
+		      __entry->ino, __entry->index, __entry->index + __entry->nr - 1,
+		      __print_symbolic(__entry->why, netfs_folio_traces))
+	    );
+
+TRACE_EVENT(netfs_write_iter,
+	    TP_PROTO(const struct kiocb *iocb, const struct iov_iter *from),
+
+	    TP_ARGS(iocb, from),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned long long,		start		)
+		    __field(size_t,			len		)
+		    __field(unsigned int,		flags		)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->start	= iocb->ki_pos;
+		    __entry->len	= iov_iter_count(from);
+		    __entry->flags	= iocb->ki_flags;
+			   ),
+
+	    TP_printk("WRITE-ITER s=%llx l=%zx f=%x",
+		      __entry->start, __entry->len, __entry->flags)
+	    );
+
 TRACE_EVENT(netfs_write,
 	    TP_PROTO(const struct netfs_io_request *wreq,
 		     enum netfs_write_trace what),

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

