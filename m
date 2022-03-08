Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBED4D24E6
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 00:29:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646782184;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vj4C87C5p0gMNEH+bJphaUymqKL5Z6vG3VIMo6BLTP0=;
	b=epultq6SdZGr3LWhUFUoknfLaN2VizN9h+gu6iDyhxIhER/jZwlsdCjqIBy3HiZJ6LSTiT
	LwiGg7qDFSIMEeOl9TDK6r2rogVY1TNyKRl4TNkwNoJuZa9TsNGskfm6vJKWzQLB4TU+lb
	JdUicOx9LhXZA02lvKYHuJ3DYUPipZs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-ZVQq_KJHOjK9nhBt24inyQ-1; Tue, 08 Mar 2022 18:29:41 -0500
X-MC-Unique: ZVQq_KJHOjK9nhBt24inyQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B00A6802809;
	Tue,  8 Mar 2022 23:29:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6ACCF463ED4;
	Tue,  8 Mar 2022 23:29:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 403D2195F424;
	Tue,  8 Mar 2022 23:29:40 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1EB83194F4AE for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  8 Mar 2022 23:29:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CE06478C0F; Tue,  8 Mar 2022 23:29:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92B7A78C09;
 Tue,  8 Mar 2022 23:29:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Tue, 08 Mar 2022 23:29:30 +0000
Message-ID: <164678217075.1200972.5101072043126828757.stgit@warthog.procyon.org.uk>
In-Reply-To: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
References: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Subject: [Linux-cachefs] [PATCH v2 16/19] netfs: Split fs/netfs/read_helper.c
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
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 Dominique Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Split fs/netfs/read_helper.c into two pieces, one to deal with buffered
writes and one to deal with the I/O mechanism.

Changes
=======
ver #2)
 - Add kdoc reference to new file.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com

Link: https://lore.kernel.org/r/164623005586.3564931.6149556072728481767.stgit@warthog.procyon.org.uk/ # v1
---

 fs/netfs/Makefile        |    1 
 fs/netfs/buffered_read.c |  428 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/netfs/io.c            |  418 ---------------------------------------------
 3 files changed, 429 insertions(+), 418 deletions(-)
 create mode 100644 fs/netfs/buffered_read.c

diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index 51ece4f7bc77..88b904532bc7 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 netfs-y := \
+	buffered_read.o \
 	io.o \
 	objects.o
 
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
new file mode 100644
index 000000000000..09ba7097a970
--- /dev/null
+++ b/fs/netfs/buffered_read.c
@@ -0,0 +1,428 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Network filesystem high-level buffered read support.
+ *
+ * Copyright (C) 2021 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/export.h>
+#include <linux/task_io_accounting_ops.h>
+#include "internal.h"
+
+/*
+ * Unlock the folios in a read operation.  We need to set PG_fscache on any
+ * folios we're going to write back before we unlock them.
+ */
+void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
+{
+	struct netfs_io_subrequest *subreq;
+	struct folio *folio;
+	unsigned int iopos, account = 0;
+	pgoff_t start_page = rreq->start / PAGE_SIZE;
+	pgoff_t last_page = ((rreq->start + rreq->len) / PAGE_SIZE) - 1;
+	bool subreq_failed = false;
+
+	XA_STATE(xas, &rreq->mapping->i_pages, start_page);
+
+	if (test_bit(NETFS_RREQ_FAILED, &rreq->flags)) {
+		__clear_bit(NETFS_RREQ_COPY_TO_CACHE, &rreq->flags);
+		list_for_each_entry(subreq, &rreq->subrequests, rreq_link) {
+			__clear_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
+		}
+	}
+
+	/* Walk through the pagecache and the I/O request lists simultaneously.
+	 * We may have a mixture of cached and uncached sections and we only
+	 * really want to write out the uncached sections.  This is slightly
+	 * complicated by the possibility that we might have huge pages with a
+	 * mixture inside.
+	 */
+	subreq = list_first_entry(&rreq->subrequests,
+				  struct netfs_io_subrequest, rreq_link);
+	iopos = 0;
+	subreq_failed = (subreq->error < 0);
+
+	trace_netfs_rreq(rreq, netfs_rreq_trace_unlock);
+
+	rcu_read_lock();
+	xas_for_each(&xas, folio, last_page) {
+		unsigned int pgpos = (folio_index(folio) - start_page) * PAGE_SIZE;
+		unsigned int pgend = pgpos + folio_size(folio);
+		bool pg_failed = false;
+
+		for (;;) {
+			if (!subreq) {
+				pg_failed = true;
+				break;
+			}
+			if (test_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags))
+				folio_start_fscache(folio);
+			pg_failed |= subreq_failed;
+			if (pgend < iopos + subreq->len)
+				break;
+
+			account += subreq->transferred;
+			iopos += subreq->len;
+			if (!list_is_last(&subreq->rreq_link, &rreq->subrequests)) {
+				subreq = list_next_entry(subreq, rreq_link);
+				subreq_failed = (subreq->error < 0);
+			} else {
+				subreq = NULL;
+				subreq_failed = false;
+			}
+			if (pgend == iopos)
+				break;
+		}
+
+		if (!pg_failed) {
+			flush_dcache_folio(folio);
+			folio_mark_uptodate(folio);
+		}
+
+		if (!test_bit(NETFS_RREQ_DONT_UNLOCK_FOLIOS, &rreq->flags)) {
+			if (folio_index(folio) == rreq->no_unlock_folio &&
+			    test_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags))
+				_debug("no unlock");
+			else
+				folio_unlock(folio);
+		}
+	}
+	rcu_read_unlock();
+
+	task_io_account_read(account);
+	if (rreq->netfs_ops->done)
+		rreq->netfs_ops->done(rreq);
+}
+
+static void netfs_cache_expand_readahead(struct netfs_io_request *rreq,
+					 loff_t *_start, size_t *_len, loff_t i_size)
+{
+	struct netfs_cache_resources *cres = &rreq->cache_resources;
+
+	if (cres->ops && cres->ops->expand_readahead)
+		cres->ops->expand_readahead(cres, _start, _len, i_size);
+}
+
+static void netfs_rreq_expand(struct netfs_io_request *rreq,
+			      struct readahead_control *ractl)
+{
+	/* Give the cache a chance to change the request parameters.  The
+	 * resultant request must contain the original region.
+	 */
+	netfs_cache_expand_readahead(rreq, &rreq->start, &rreq->len, rreq->i_size);
+
+	/* Give the netfs a chance to change the request parameters.  The
+	 * resultant request must contain the original region.
+	 */
+	if (rreq->netfs_ops->expand_readahead)
+		rreq->netfs_ops->expand_readahead(rreq);
+
+	/* Expand the request if the cache wants it to start earlier.  Note
+	 * that the expansion may get further extended if the VM wishes to
+	 * insert THPs and the preferred start and/or end wind up in the middle
+	 * of THPs.
+	 *
+	 * If this is the case, however, the THP size should be an integer
+	 * multiple of the cache granule size, so we get a whole number of
+	 * granules to deal with.
+	 */
+	if (rreq->start  != readahead_pos(ractl) ||
+	    rreq->len != readahead_length(ractl)) {
+		readahead_expand(ractl, rreq->start, rreq->len);
+		rreq->start  = readahead_pos(ractl);
+		rreq->len = readahead_length(ractl);
+
+		trace_netfs_read(rreq, readahead_pos(ractl), readahead_length(ractl),
+				 netfs_read_trace_expanded);
+	}
+}
+
+/**
+ * netfs_readahead - Helper to manage a read request
+ * @ractl: The description of the readahead request
+ *
+ * Fulfil a readahead request by drawing data from the cache if possible, or
+ * the netfs if not.  Space beyond the EOF is zero-filled.  Multiple I/O
+ * requests from different sources will get munged together.  If necessary, the
+ * readahead window can be expanded in either direction to a more convenient
+ * alighment for RPC efficiency or to make storage in the cache feasible.
+ *
+ * The calling netfs must initialise a netfs context contiguous to the vfs
+ * inode before calling this.
+ *
+ * This is usable whether or not caching is enabled.
+ */
+void netfs_readahead(struct readahead_control *ractl)
+{
+	struct netfs_io_request *rreq;
+	struct netfs_i_context *ctx = netfs_i_context(ractl->mapping->host);
+	int ret;
+
+	_enter("%lx,%x", readahead_index(ractl), readahead_count(ractl));
+
+	if (readahead_count(ractl) == 0)
+		return;
+
+	rreq = netfs_alloc_request(ractl->mapping, ractl->file,
+				   readahead_pos(ractl),
+				   readahead_length(ractl),
+				   NETFS_READAHEAD);
+	if (IS_ERR(rreq))
+		return;
+
+	if (ctx->ops->begin_cache_operation) {
+		ret = ctx->ops->begin_cache_operation(rreq);
+		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
+			goto cleanup_free;
+	}
+
+	netfs_stat(&netfs_n_rh_readahead);
+	trace_netfs_read(rreq, readahead_pos(ractl), readahead_length(ractl),
+			 netfs_read_trace_readahead);
+
+	netfs_rreq_expand(rreq, ractl);
+
+	/* Drop the refs on the folios here rather than in the cache or
+	 * filesystem.  The locks will be dropped in netfs_rreq_unlock().
+	 */
+	while (readahead_folio(ractl))
+		;
+
+	netfs_begin_read(rreq, false);
+	return;
+
+cleanup_free:
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_failed);
+	return;
+}
+EXPORT_SYMBOL(netfs_readahead);
+
+/**
+ * netfs_readpage - Helper to manage a readpage request
+ * @file: The file to read from
+ * @subpage: A subpage of the folio to read
+ *
+ * Fulfil a readpage request by drawing data from the cache if possible, or the
+ * netfs if not.  Space beyond the EOF is zero-filled.  Multiple I/O requests
+ * from different sources will get munged together.
+ *
+ * The calling netfs must initialise a netfs context contiguous to the vfs
+ * inode before calling this.
+ *
+ * This is usable whether or not caching is enabled.
+ */
+int netfs_readpage(struct file *file, struct page *subpage)
+{
+	struct folio *folio = page_folio(subpage);
+	struct address_space *mapping = folio_file_mapping(folio);
+	struct netfs_io_request *rreq;
+	struct netfs_i_context *ctx = netfs_i_context(mapping->host);
+	int ret;
+
+	_enter("%lx", folio_index(folio));
+
+	rreq = netfs_alloc_request(mapping, file,
+				   folio_file_pos(folio), folio_size(folio),
+				   NETFS_READPAGE);
+	if (IS_ERR(rreq)) {
+		ret = PTR_ERR(rreq);
+		goto alloc_error;
+	}
+
+	if (ctx->ops->begin_cache_operation) {
+		ret = ctx->ops->begin_cache_operation(rreq);
+		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
+			goto discard;
+	}
+
+	netfs_stat(&netfs_n_rh_readpage);
+	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
+	return netfs_begin_read(rreq, true);
+
+discard:
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_discard);
+alloc_error:
+	folio_unlock(folio);
+	return ret;
+}
+EXPORT_SYMBOL(netfs_readpage);
+
+/*
+ * Prepare a folio for writing without reading first
+ * @folio: The folio being prepared
+ * @pos: starting position for the write
+ * @len: length of write
+ * @always_fill: T if the folio should always be completely filled/cleared
+ *
+ * In some cases, write_begin doesn't need to read at all:
+ * - full folio write
+ * - write that lies in a folio that is completely beyond EOF
+ * - write that covers the folio from start to EOF or beyond it
+ *
+ * If any of these criteria are met, then zero out the unwritten parts
+ * of the folio and return true. Otherwise, return false.
+ */
+static bool netfs_skip_folio_read(struct folio *folio, loff_t pos, size_t len,
+				 bool always_fill)
+{
+	struct inode *inode = folio_inode(folio);
+	loff_t i_size = i_size_read(inode);
+	size_t offset = offset_in_folio(folio, pos);
+	size_t plen = folio_size(folio);
+
+	if (unlikely(always_fill)) {
+		if (pos - offset + len <= i_size)
+			return false; /* Page entirely before EOF */
+		zero_user_segment(&folio->page, 0, plen);
+		folio_mark_uptodate(folio);
+		return true;
+	}
+
+	/* Full folio write */
+	if (offset == 0 && len >= plen)
+		return true;
+
+	/* Page entirely beyond the end of the file */
+	if (pos - offset >= i_size)
+		goto zero_out;
+
+	/* Write that covers from the start of the folio to EOF or beyond */
+	if (offset == 0 && (pos + len) >= i_size)
+		goto zero_out;
+
+	return false;
+zero_out:
+	zero_user_segments(&folio->page, 0, offset, offset + len, len);
+	return true;
+}
+
+/**
+ * netfs_write_begin - Helper to prepare for writing
+ * @file: The file to read from
+ * @mapping: The mapping to read from
+ * @pos: File position at which the write will begin
+ * @len: The length of the write (may extend beyond the end of the folio chosen)
+ * @aop_flags: AOP_* flags
+ * @_folio: Where to put the resultant folio
+ * @_fsdata: Place for the netfs to store a cookie
+ *
+ * Pre-read data for a write-begin request by drawing data from the cache if
+ * possible, or the netfs if not.  Space beyond the EOF is zero-filled.
+ * Multiple I/O requests from different sources will get munged together.  If
+ * necessary, the readahead window can be expanded in either direction to a
+ * more convenient alighment for RPC efficiency or to make storage in the cache
+ * feasible.
+ *
+ * The calling netfs must provide a table of operations, only one of which,
+ * issue_op, is mandatory.
+ *
+ * The check_write_begin() operation can be provided to check for and flush
+ * conflicting writes once the folio is grabbed and locked.  It is passed a
+ * pointer to the fsdata cookie that gets returned to the VM to be passed to
+ * write_end.  It is permitted to sleep.  It should return 0 if the request
+ * should go ahead; unlock the folio and return -EAGAIN to cause the folio to
+ * be regot; or return an error.
+ *
+ * The calling netfs must initialise a netfs context contiguous to the vfs
+ * inode before calling this.
+ *
+ * This is usable whether or not caching is enabled.
+ */
+int netfs_write_begin(struct file *file, struct address_space *mapping,
+		      loff_t pos, unsigned int len, unsigned int aop_flags,
+		      struct folio **_folio, void **_fsdata)
+{
+	struct netfs_io_request *rreq;
+	struct netfs_i_context *ctx = netfs_i_context(file_inode(file ));
+	struct folio *folio;
+	unsigned int fgp_flags;
+	pgoff_t index = pos >> PAGE_SHIFT;
+	int ret;
+
+	DEFINE_READAHEAD(ractl, file, NULL, mapping, index);
+
+retry:
+	fgp_flags = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_STABLE;
+	if (aop_flags & AOP_FLAG_NOFS)
+		fgp_flags |= FGP_NOFS;
+	folio = __filemap_get_folio(mapping, index, fgp_flags,
+				    mapping_gfp_mask(mapping));
+	if (!folio)
+		return -ENOMEM;
+
+	if (ctx->ops->check_write_begin) {
+		/* Allow the netfs (eg. ceph) to flush conflicts. */
+		ret = ctx->ops->check_write_begin(file, pos, len, folio, _fsdata);
+		if (ret < 0) {
+			trace_netfs_failure(NULL, NULL, ret, netfs_fail_check_write_begin);
+			if (ret == -EAGAIN)
+				goto retry;
+			goto error;
+		}
+	}
+
+	if (folio_test_uptodate(folio))
+		goto have_folio;
+
+	/* If the page is beyond the EOF, we want to clear it - unless it's
+	 * within the cache granule containing the EOF, in which case we need
+	 * to preload the granule.
+	 */
+	if (!netfs_is_cache_enabled(ctx) &&
+	    netfs_skip_folio_read(folio, pos, len, false)) {
+		netfs_stat(&netfs_n_rh_write_zskip);
+		goto have_folio_no_wait;
+	}
+
+	rreq = netfs_alloc_request(mapping, file,
+				   folio_file_pos(folio), folio_size(folio),
+				   NETFS_READ_FOR_WRITE);
+	if (IS_ERR(rreq)) {
+		ret = PTR_ERR(rreq);
+		goto error;
+	}
+	rreq->no_unlock_folio	= folio_index(folio);
+	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
+
+	if (ctx->ops->begin_cache_operation) {
+		ret = ctx->ops->begin_cache_operation(rreq);
+		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
+			goto error_put;
+	}
+
+	netfs_stat(&netfs_n_rh_write_begin);
+	trace_netfs_read(rreq, pos, len, netfs_read_trace_write_begin);
+
+	/* Expand the request to meet caching requirements and download
+	 * preferences.
+	 */
+	ractl._nr_pages = folio_nr_pages(folio);
+	netfs_rreq_expand(rreq, &ractl);
+
+	/* We hold the folio locks, so we can drop the references */
+	folio_get(folio);
+	while (readahead_folio(&ractl))
+		;
+
+	ret = netfs_begin_read(rreq, true);
+	if (ret < 0)
+		goto error;
+
+have_folio:
+	ret = folio_wait_fscache_killable(folio);
+	if (ret < 0)
+		goto error;
+have_folio_no_wait:
+	*_folio = folio;
+	_leave(" = 0");
+	return 0;
+
+error_put:
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_failed);
+error:
+	folio_unlock(folio);
+	folio_put(folio);
+	_leave(" = %d", ret);
+	return ret;
+}
+EXPORT_SYMBOL(netfs_write_begin);
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 058a534ba917..1fe9706c58a5 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -246,91 +246,6 @@ static void netfs_rreq_write_to_cache(struct netfs_io_request *rreq)
 		BUG();
 }
 
-/*
- * Unlock the folios in a read operation.  We need to set PG_fscache on any
- * folios we're going to write back before we unlock them.
- */
-void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
-{
-	struct netfs_io_subrequest *subreq;
-	struct folio *folio;
-	unsigned int iopos, account = 0;
-	pgoff_t start_page = rreq->start / PAGE_SIZE;
-	pgoff_t last_page = ((rreq->start + rreq->len) / PAGE_SIZE) - 1;
-	bool subreq_failed = false;
-
-	XA_STATE(xas, &rreq->mapping->i_pages, start_page);
-
-	if (test_bit(NETFS_RREQ_FAILED, &rreq->flags)) {
-		__clear_bit(NETFS_RREQ_COPY_TO_CACHE, &rreq->flags);
-		list_for_each_entry(subreq, &rreq->subrequests, rreq_link) {
-			__clear_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
-		}
-	}
-
-	/* Walk through the pagecache and the I/O request lists simultaneously.
-	 * We may have a mixture of cached and uncached sections and we only
-	 * really want to write out the uncached sections.  This is slightly
-	 * complicated by the possibility that we might have huge pages with a
-	 * mixture inside.
-	 */
-	subreq = list_first_entry(&rreq->subrequests,
-				  struct netfs_io_subrequest, rreq_link);
-	iopos = 0;
-	subreq_failed = (subreq->error < 0);
-
-	trace_netfs_rreq(rreq, netfs_rreq_trace_unlock);
-
-	rcu_read_lock();
-	xas_for_each(&xas, folio, last_page) {
-		unsigned int pgpos = (folio_index(folio) - start_page) * PAGE_SIZE;
-		unsigned int pgend = pgpos + folio_size(folio);
-		bool pg_failed = false;
-
-		for (;;) {
-			if (!subreq) {
-				pg_failed = true;
-				break;
-			}
-			if (test_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags))
-				folio_start_fscache(folio);
-			pg_failed |= subreq_failed;
-			if (pgend < iopos + subreq->len)
-				break;
-
-			account += subreq->transferred;
-			iopos += subreq->len;
-			if (!list_is_last(&subreq->rreq_link, &rreq->subrequests)) {
-				subreq = list_next_entry(subreq, rreq_link);
-				subreq_failed = (subreq->error < 0);
-			} else {
-				subreq = NULL;
-				subreq_failed = false;
-			}
-			if (pgend == iopos)
-				break;
-		}
-
-		if (!pg_failed) {
-			flush_dcache_folio(folio);
-			folio_mark_uptodate(folio);
-		}
-
-		if (!test_bit(NETFS_RREQ_DONT_UNLOCK_FOLIOS, &rreq->flags)) {
-			if (folio_index(folio) == rreq->no_unlock_folio &&
-			    test_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags))
-				_debug("no unlock");
-			else
-				folio_unlock(folio);
-		}
-	}
-	rcu_read_unlock();
-
-	task_io_account_read(account);
-	if (rreq->netfs_ops->done)
-		rreq->netfs_ops->done(rreq);
-}
-
 /*
  * Handle a short read.
  */
@@ -750,336 +665,3 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 	}
 	return ret;
 }
-
-static void netfs_cache_expand_readahead(struct netfs_io_request *rreq,
-					 loff_t *_start, size_t *_len, loff_t i_size)
-{
-	struct netfs_cache_resources *cres = &rreq->cache_resources;
-
-	if (cres->ops && cres->ops->expand_readahead)
-		cres->ops->expand_readahead(cres, _start, _len, i_size);
-}
-
-static void netfs_rreq_expand(struct netfs_io_request *rreq,
-			      struct readahead_control *ractl)
-{
-	/* Give the cache a chance to change the request parameters.  The
-	 * resultant request must contain the original region.
-	 */
-	netfs_cache_expand_readahead(rreq, &rreq->start, &rreq->len, rreq->i_size);
-
-	/* Give the netfs a chance to change the request parameters.  The
-	 * resultant request must contain the original region.
-	 */
-	if (rreq->netfs_ops->expand_readahead)
-		rreq->netfs_ops->expand_readahead(rreq);
-
-	/* Expand the request if the cache wants it to start earlier.  Note
-	 * that the expansion may get further extended if the VM wishes to
-	 * insert THPs and the preferred start and/or end wind up in the middle
-	 * of THPs.
-	 *
-	 * If this is the case, however, the THP size should be an integer
-	 * multiple of the cache granule size, so we get a whole number of
-	 * granules to deal with.
-	 */
-	if (rreq->start  != readahead_pos(ractl) ||
-	    rreq->len != readahead_length(ractl)) {
-		readahead_expand(ractl, rreq->start, rreq->len);
-		rreq->start  = readahead_pos(ractl);
-		rreq->len = readahead_length(ractl);
-
-		trace_netfs_read(rreq, readahead_pos(ractl), readahead_length(ractl),
-				 netfs_read_trace_expanded);
-	}
-}
-
-/**
- * netfs_readahead - Helper to manage a read request
- * @ractl: The description of the readahead request
- *
- * Fulfil a readahead request by drawing data from the cache if possible, or
- * the netfs if not.  Space beyond the EOF is zero-filled.  Multiple I/O
- * requests from different sources will get munged together.  If necessary, the
- * readahead window can be expanded in either direction to a more convenient
- * alighment for RPC efficiency or to make storage in the cache feasible.
- *
- * The calling netfs must initialise a netfs context contiguous to the vfs
- * inode before calling this.
- *
- * This is usable whether or not caching is enabled.
- */
-void netfs_readahead(struct readahead_control *ractl)
-{
-	struct netfs_io_request *rreq;
-	struct netfs_i_context *ctx = netfs_i_context(ractl->mapping->host);
-	int ret;
-
-	_enter("%lx,%x", readahead_index(ractl), readahead_count(ractl));
-
-	if (readahead_count(ractl) == 0)
-		return;
-
-	rreq = netfs_alloc_request(ractl->mapping, ractl->file,
-				   readahead_pos(ractl),
-				   readahead_length(ractl),
-				   NETFS_READAHEAD);
-	if (IS_ERR(rreq))
-		return;
-
-	if (ctx->ops->begin_cache_operation) {
-		ret = ctx->ops->begin_cache_operation(rreq);
-		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
-			goto cleanup_free;
-	}
-
-	netfs_stat(&netfs_n_rh_readahead);
-	trace_netfs_read(rreq, readahead_pos(ractl), readahead_length(ractl),
-			 netfs_read_trace_readahead);
-
-	netfs_rreq_expand(rreq, ractl);
-
-	/* Drop the refs on the folios here rather than in the cache or
-	 * filesystem.  The locks will be dropped in netfs_rreq_unlock().
-	 */
-	while (readahead_folio(ractl))
-		;
-
-	netfs_begin_read(rreq, false);
-	return;
-
-cleanup_free:
-	netfs_put_request(rreq, false, netfs_rreq_trace_put_failed);
-	return;
-}
-EXPORT_SYMBOL(netfs_readahead);
-
-/**
- * netfs_readpage - Helper to manage a readpage request
- * @file: The file to read from
- * @subpage: A subpage of the folio to read
- *
- * Fulfil a readpage request by drawing data from the cache if possible, or the
- * netfs if not.  Space beyond the EOF is zero-filled.  Multiple I/O requests
- * from different sources will get munged together.
- *
- * The calling netfs must initialise a netfs context contiguous to the vfs
- * inode before calling this.
- *
- * This is usable whether or not caching is enabled.
- */
-int netfs_readpage(struct file *file, struct page *subpage)
-{
-	struct folio *folio = page_folio(subpage);
-	struct address_space *mapping = folio->mapping;
-	struct netfs_io_request *rreq;
-	struct netfs_i_context *ctx = netfs_i_context(mapping->host);
-	int ret;
-
-	_enter("%lx", folio_index(folio));
-
-	rreq = netfs_alloc_request(mapping, file,
-				   folio_file_pos(folio), folio_size(folio),
-				   NETFS_READPAGE);
-	if (IS_ERR(rreq)) {
-		ret = PTR_ERR(rreq);
-		goto alloc_error;
-	}
-
-	if (ctx->ops->begin_cache_operation) {
-		ret = ctx->ops->begin_cache_operation(rreq);
-		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
-			goto discard;
-	}
-
-	netfs_stat(&netfs_n_rh_readpage);
-	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
-	return netfs_begin_read(rreq, true);
-
-discard:
-	netfs_put_request(rreq, false, netfs_rreq_trace_put_discard);
-alloc_error:
-	folio_unlock(folio);
-	return ret;
-}
-EXPORT_SYMBOL(netfs_readpage);
-
-/*
- * Prepare a folio for writing without reading first
- * @folio: The folio being prepared
- * @pos: starting position for the write
- * @len: length of write
- * @always_fill: T if the folio should always be completely filled/cleared
- *
- * In some cases, write_begin doesn't need to read at all:
- * - full folio write
- * - write that lies in a folio that is completely beyond EOF
- * - write that covers the folio from start to EOF or beyond it
- *
- * If any of these criteria are met, then zero out the unwritten parts
- * of the folio and return true. Otherwise, return false.
- */
-static bool netfs_skip_folio_read(struct folio *folio, loff_t pos, size_t len,
-				 bool always_fill)
-{
-	struct inode *inode = folio_inode(folio);
-	loff_t i_size = i_size_read(inode);
-	size_t offset = offset_in_folio(folio, pos);
-	size_t plen = folio_size(folio);
-
-	if (unlikely(always_fill)) {
-		if (pos - offset + len <= i_size)
-			return false; /* Page entirely before EOF */
-		zero_user_segment(&folio->page, 0, plen);
-		folio_mark_uptodate(folio);
-		return true;
-	}
-
-	/* Full folio write */
-	if (offset == 0 && len >= plen)
-		return true;
-
-	/* Page entirely beyond the end of the file */
-	if (pos - offset >= i_size)
-		goto zero_out;
-
-	/* Write that covers from the start of the folio to EOF or beyond */
-	if (offset == 0 && (pos + len) >= i_size)
-		goto zero_out;
-
-	return false;
-zero_out:
-	zero_user_segments(&folio->page, 0, offset, offset + len, len);
-	return true;
-}
-
-/**
- * netfs_write_begin - Helper to prepare for writing
- * @file: The file to read from
- * @mapping: The mapping to read from
- * @pos: File position at which the write will begin
- * @len: The length of the write (may extend beyond the end of the folio chosen)
- * @aop_flags: AOP_* flags
- * @_folio: Where to put the resultant folio
- * @_fsdata: Place for the netfs to store a cookie
- *
- * Pre-read data for a write-begin request by drawing data from the cache if
- * possible, or the netfs if not.  Space beyond the EOF is zero-filled.
- * Multiple I/O requests from different sources will get munged together.  If
- * necessary, the readahead window can be expanded in either direction to a
- * more convenient alighment for RPC efficiency or to make storage in the cache
- * feasible.
- *
- * The calling netfs must provide a table of operations, only one of which,
- * issue_op, is mandatory.
- *
- * The check_write_begin() operation can be provided to check for and flush
- * conflicting writes once the folio is grabbed and locked.  It is passed a
- * pointer to the fsdata cookie that gets returned to the VM to be passed to
- * write_end.  It is permitted to sleep.  It should return 0 if the request
- * should go ahead; unlock the folio and return -EAGAIN to cause the folio to
- * be regot; or return an error.
- *
- * The calling netfs must initialise a netfs context contiguous to the vfs
- * inode before calling this.
- *
- * This is usable whether or not caching is enabled.
- */
-int netfs_write_begin(struct file *file, struct address_space *mapping,
-		      loff_t pos, unsigned int len, unsigned int aop_flags,
-		      struct folio **_folio, void **_fsdata)
-{
-	struct netfs_io_request *rreq;
-	struct netfs_i_context *ctx = netfs_i_context(file_inode(file ));
-	struct folio *folio;
-	unsigned int fgp_flags;
-	pgoff_t index = pos >> PAGE_SHIFT;
-	int ret;
-
-	DEFINE_READAHEAD(ractl, file, NULL, mapping, index);
-
-retry:
-	fgp_flags = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_STABLE;
-	if (aop_flags & AOP_FLAG_NOFS)
-		fgp_flags |= FGP_NOFS;
-	folio = __filemap_get_folio(mapping, index, fgp_flags,
-				    mapping_gfp_mask(mapping));
-	if (!folio)
-		return -ENOMEM;
-
-	if (ctx->ops->check_write_begin) {
-		/* Allow the netfs (eg. ceph) to flush conflicts. */
-		ret = ctx->ops->check_write_begin(file, pos, len, folio, _fsdata);
-		if (ret < 0) {
-			trace_netfs_failure(NULL, NULL, ret, netfs_fail_check_write_begin);
-			if (ret == -EAGAIN)
-				goto retry;
-			goto error;
-		}
-	}
-
-	if (folio_test_uptodate(folio))
-		goto have_folio;
-
-	/* If the page is beyond the EOF, we want to clear it - unless it's
-	 * within the cache granule containing the EOF, in which case we need
-	 * to preload the granule.
-	 */
-	if (!netfs_is_cache_enabled(ctx) &&
-	    netfs_skip_folio_read(folio, pos, len, false)) {
-		netfs_stat(&netfs_n_rh_write_zskip);
-		goto have_folio_no_wait;
-	}
-
-	rreq = netfs_alloc_request(mapping, file,
-				   folio_file_pos(folio), folio_size(folio),
-				   NETFS_READ_FOR_WRITE);
-	if (IS_ERR(rreq)) {
-		ret = PTR_ERR(rreq);
-		goto error;
-	}
-	rreq->no_unlock_folio	= folio_index(folio);
-	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
-
-	if (ctx->ops->begin_cache_operation) {
-		ret = ctx->ops->begin_cache_operation(rreq);
-		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
-			goto error_put;
-	}
-
-	netfs_stat(&netfs_n_rh_write_begin);
-	trace_netfs_read(rreq, pos, len, netfs_read_trace_write_begin);
-
-	/* Expand the request to meet caching requirements and download
-	 * preferences.
-	 */
-	ractl._nr_pages = folio_nr_pages(folio);
-	netfs_rreq_expand(rreq, &ractl);
-
-	/* We hold the folio locks, so we can drop the references */
-	folio_get(folio);
-	while (readahead_folio(&ractl))
-		;
-
-	ret = netfs_begin_read(rreq, true);
-	if (ret < 0)
-		goto error;
-
-have_folio:
-	ret = folio_wait_fscache_killable(folio);
-	if (ret < 0)
-		goto error;
-have_folio_no_wait:
-	*_folio = folio;
-	_leave(" = 0");
-	return 0;
-
-error_put:
-	netfs_put_request(rreq, false, netfs_rreq_trace_put_failed);
-error:
-	folio_unlock(folio);
-	folio_put(folio);
-	_leave(" = %d", ret);
-	return ret;
-}
-EXPORT_SYMBOL(netfs_write_begin);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

