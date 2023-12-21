Return-Path: <linux-cachefs+bncBDLIXLMFVAERBBH2SCWAMGQERBZHLWY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D86381B785
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:26:29 +0100 (CET)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-58d5604c050sf632869eaf.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:26:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165188; cv=pass;
        d=google.com; s=arc-20160816;
        b=PZ1vpEq6LaEyjM1SXHlLNp1QISWCAF3z2fxnfjXj43SqMNHH4IyKptgOeku/zWMIXH
         vHpYmOMBYj+eaIVbhwfZWdUIjcCJoJ+k24uIpi64XT7qZsVjPLxpLDU7DqRk/mRzJrw6
         YrIm2plpXhDtuqcwPynL+VY88sxEzTcoK7gN2jp+jFU+VQ7phojDTJvaxnpei4k1yNGt
         3Mc8Hdmu0Z8+xQJQMszwlkrC34ezShCAHEqrk6UyyGdnbb+RjIrI+RJUT749j6xRjyPq
         a55yB9oPbpgCVVtvIbFFt6ut9emq4m7ujHjIbvjm7elIGrup57xQq5yUl4EOYea54qa4
         KOYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=AYhA2TF6LNpR1k/lzbbvohW2L5mhapDsEqE/x91i4Vc=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=ppSTsk/aPOZH1PHiXzMeNuPfQ2HY4/9O3NKMR3psT6671kVguPetZ6Ti3Dz7uj50r4
         wlANgq7U/lOjmPPBnD91yLqSV08FinMvJ1bvyYJOyW2BYoGxiZTRM+0+caQsEtMTyy/r
         /0qJAIdcNK5x7Jc7XOf2g53nRzgeFLbsb4W0xO1VZvloDjZkPgLauny59d7sr+S/vEUR
         5+/CR/TleF2VCi4Eshh7TxCxD7b16H775HGWhihxHASlxf+ZVpJ7x+w+fA5Rz/GcKdyY
         1fvZ2DAs+mJ0Z7Mx4dWlFxkZ1utQOD4NUIYpXDhCsX/xPf4tpoqynUa8sLxxSB5dgOwW
         PRYQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165188; x=1703769988;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYhA2TF6LNpR1k/lzbbvohW2L5mhapDsEqE/x91i4Vc=;
        b=tjAdeQVauluBHonRP5VfBrmvIohbp+WaKaIcNasWAhUnv8bApXXOHLrVezIye2tUJ3
         kCMGbsz16oJRiXzrnuQh4tCaD9UQt/ixW8SA5/GSHQ28SMJ0iAgz3atl79uKcWQpZ1Gr
         u1UFgMYH7kyxmGox+spdQMfVao2GjA2JLpZggknwb8EAwSnJfCskT9OELxeyblE2KaBY
         0Q+KLbcRD4X/oqycqJiC/z9hwj/1Lk+iFsh2B2lg1W+oxNUvApZq/fwIh0DqpLh4H6B8
         N+o1ZIErpxCNulOhR8jjHrZb/XvypGlRVaEurKCeenq8FLQhKjtv1cgRGOpcBcKK5ZqL
         tfTA==
X-Gm-Message-State: AOJu0YwWAh4ejHaAKdXvtwoYLkKOViBNBxozNE8TX2fUS2UMD/wvTy2/
	Suv6cGcyigLEFaK3SJI3hcD/HQ==
X-Google-Smtp-Source: AGHT+IGdcc9EfzQvTEK7kWgMbvRCC18BlKdGcPeMGbuXadsDgz3OqasfzTuDyjg1IbfLl5z4KvPAYQ==
X-Received: by 2002:a4a:1486:0:b0:594:25d9:5057 with SMTP id 128-20020a4a1486000000b0059425d95057mr449962ood.4.1703165188341;
        Thu, 21 Dec 2023 05:26:28 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a4a:315c:0:b0:590:5af1:43ad with SMTP id v28-20020a4a315c000000b005905af143adls598050oog.2.-pod-prod-06-us;
 Thu, 21 Dec 2023 05:26:27 -0800 (PST)
X-Received: by 2002:a05:6808:1416:b0:3bb:74a5:4778 with SMTP id w22-20020a056808141600b003bb74a54778mr2252216oiv.35.1703165187654;
        Thu, 21 Dec 2023 05:26:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165187; cv=none;
        d=google.com; s=arc-20160816;
        b=ZTEcPVp75uz4/dLG2bE7nxWYotb0y8wSfUANvGT6jAsCwc7kYZ/0ZqyApkqrdmdO2X
         AVkbAmT3BgoB3zUiUMpVr4VCq3KFRdI1bZtru17SROxk1Nqiy9prVKySsssANxo/p/NJ
         pRfCWyA9iY7rM1I8ypmjSOgnGaNbbJ6+/+Wu58/6aCvaclnIcgI4zLKT6fMcecDT9v1c
         j9I9UABu+k7cWJSS/l6alACzefH0CYZOfSZECCvFs3qv7R7zIpdKYAFyT1pYgloauMQP
         samuOFxtCl7IXWOwbxVYVOwa7HqGfNfnyOfDye6EWL7XAyS9c0AJ3/LKNniG5XUj4Xd8
         A8rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=21bm0l+BhDuYlny9Ngjk+7mGhbvQdboWCvSUTaoHTsg=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=028er5PdnlfKH9YnxN9dEhb5qFBDlUL4YBP02V7Tzb7P/Ct1XnieJgnuHB/umGb2be
         zVtuCq5pxfwXig5uUFzWdL2q4gQFZV8zmcPEjHzEZdbAQh3YonXxC7shmXbYkvZoFZ+R
         +gavL7WwF8GLiMbtaBvWfJ73ENf2JF0551tjRvnv+JmS18wSwqRegPpNIJ4uWWthg+lQ
         oJsLLdGU6bZnXsX4UXOWcCWhDKfS+m2gqcigDOdGkZBvYTc83dY9X4B8iYRb1++HZdEf
         pOeQeRmVyUVAfT1i5Wd5m2pORyPftY8+IqeS3ZWHsdRW6og9rXGCuGyo1xEM085qhvSx
         VbFA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id q11-20020a0ce20b000000b0067f8c4235f0si318435qvl.415.2023.12.21.05.26.27
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:26:27 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-496-vYoi7CxDMBCE2IbF7ekfyw-1; Thu,
 21 Dec 2023 08:26:26 -0500
X-MC-Unique: vYoi7CxDMBCE2IbF7ekfyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4E61280D469
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:26:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id CE866112132A; Thu, 21 Dec 2023 13:26:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C49EB1121313;
	Thu, 21 Dec 2023 13:26:22 +0000 (UTC)
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
Subject: [PATCH v5 36/40] netfs: Implement a write-through caching option
Date: Thu, 21 Dec 2023 13:23:31 +0000
Message-ID: <20231221132400.1601991-37-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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

Provide a flag whereby a filesystem may request that cifs_perform_write()
perform write-through caching.  This involves putting pages directly into
writeback rather than dirty and attaching them to a write operation as we
go.

Further, the writes being made are limited to the byte range being written
rather than whole folios being written.  This can be used by cifs, for
example, to deal with strict byte-range locking.

This can't be used with content encryption as that may require expansion of
the write RPC beyond the write being made.

This doesn't affect writes via mmap - those are written back in the normal
way; similarly failed writethrough writes are marked dirty and left to
writeback to retry.  Another option would be to simply invalidate them, but
the contents can be simultaneously accessed by read() and through mmap.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_write.c    | 69 +++++++++++++++++++++++----
 fs/netfs/internal.h          |  3 ++
 fs/netfs/main.c              |  1 +
 fs/netfs/objects.c           |  1 +
 fs/netfs/output.c            | 90 ++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h        |  2 +
 include/trace/events/netfs.h |  8 +++-
 7 files changed, 162 insertions(+), 12 deletions(-)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 50be8fe3ca43..6ca6c4bde5eb 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -26,6 +26,8 @@ enum netfs_how_to_modify {
 	NETFS_FLUSH_CONTENT,		/* Flush incompatible content. */
 };
 
+static void netfs_cleanup_buffered_write(struct netfs_io_request *wreq);
+
 static void netfs_set_group(struct folio *folio, struct netfs_group *netfs_group)
 {
 	if (netfs_group && !folio_get_private(folio))
@@ -133,6 +135,14 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 	struct inode *inode = file_inode(file);
 	struct address_space *mapping = inode->i_mapping;
 	struct netfs_inode *ctx = netfs_inode(inode);
+	struct writeback_control wbc = {
+		.sync_mode	= WB_SYNC_NONE,
+		.for_sync	= true,
+		.nr_to_write	= LONG_MAX,
+		.range_start	= iocb->ki_pos,
+		.range_end	= iocb->ki_pos + iter->count,
+	};
+	struct netfs_io_request *wreq = NULL;
 	struct netfs_folio *finfo;
 	struct folio *folio;
 	enum netfs_how_to_modify howto;
@@ -143,6 +153,30 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 	size_t max_chunk = PAGE_SIZE << MAX_PAGECACHE_ORDER;
 	bool maybe_trouble = false;
 
+	if (unlikely(test_bit(NETFS_ICTX_WRITETHROUGH, &ctx->flags) ||
+		     iocb->ki_flags & (IOCB_DSYNC | IOCB_SYNC))
+	    ) {
+		if (pos < i_size_read(inode)) {
+			ret = filemap_write_and_wait_range(mapping, pos, pos + iter->count);
+			if (ret < 0) {
+				goto out;
+			}
+		}
+
+		wbc_attach_fdatawrite_inode(&wbc, mapping->host);
+
+		wreq = netfs_begin_writethrough(iocb, iter->count);
+		if (IS_ERR(wreq)) {
+			wbc_detach_inode(&wbc);
+			ret = PTR_ERR(wreq);
+			wreq = NULL;
+			goto out;
+		}
+		if (!is_sync_kiocb(iocb))
+			wreq->iocb = iocb;
+		wreq->cleanup = netfs_cleanup_buffered_write;
+	}
+
 	do {
 		size_t flen;
 		size_t offset;	/* Offset into pagecache folio */
@@ -315,7 +349,25 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 		}
 		written += copied;
 
-		folio_mark_dirty(folio);
+		if (likely(!wreq)) {
+			folio_mark_dirty(folio);
+		} else {
+			if (folio_test_dirty(folio))
+				/* Sigh.  mmap. */
+				folio_clear_dirty_for_io(folio);
+			/* We make multiple writes to the folio... */
+			if (!folio_test_writeback(folio)) {
+				folio_wait_fscache(folio);
+				folio_start_writeback(folio);
+				folio_start_fscache(folio);
+				if (wreq->iter.count == 0)
+					trace_netfs_folio(folio, netfs_folio_trace_wthru);
+				else
+					trace_netfs_folio(folio, netfs_folio_trace_wthru_plus);
+			}
+			netfs_advance_writethrough(wreq, copied,
+						   offset + copied == flen);
+		}
 	retry:
 		folio_unlock(folio);
 		folio_put(folio);
@@ -325,17 +377,14 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 	} while (iov_iter_count(iter));
 
 out:
-	if (likely(written)) {
-		/* Flush and wait for a write that requires immediate synchronisation. */
-		if (iocb->ki_flags & (IOCB_DSYNC | IOCB_SYNC)) {
-			_debug("dsync");
-			ret = filemap_fdatawait_range(mapping, iocb->ki_pos,
-						      iocb->ki_pos + written);
-		}
-
-		iocb->ki_pos += written;
+	if (unlikely(wreq)) {
+		ret = netfs_end_writethrough(wreq, iocb);
+		wbc_detach_inode(&wbc);
+		if (ret == -EIOCBQUEUED)
+			return ret;
 	}
 
+	iocb->ki_pos += written;
 	_leave(" = %zd [%zd]", written, ret);
 	return written ? written : ret;
 
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 2de4f826dbe4..d2d63120ac60 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -101,6 +101,9 @@ static inline void netfs_see_request(struct netfs_io_request *rreq,
  */
 int netfs_begin_write(struct netfs_io_request *wreq, bool may_wait,
 		      enum netfs_write_trace what);
+struct netfs_io_request *netfs_begin_writethrough(struct kiocb *iocb, size_t len);
+int netfs_advance_writethrough(struct netfs_io_request *wreq, size_t copied, bool to_page_end);
+int netfs_end_writethrough(struct netfs_io_request *wreq, struct kiocb *iocb);
 
 /*
  * stats.c
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 473f889e1bd1..81a13071b258 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -30,6 +30,7 @@ static const char *netfs_origins[nr__netfs_io_origin] = {
 	[NETFS_READPAGE]		= "RP",
 	[NETFS_READ_FOR_WRITE]		= "RW",
 	[NETFS_WRITEBACK]		= "WB",
+	[NETFS_WRITETHROUGH]		= "WT",
 	[NETFS_LAUNDER_WRITE]		= "LW",
 	[NETFS_UNBUFFERED_WRITE]	= "UW",
 	[NETFS_DIO_READ]		= "DR",
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index b4e3bd836e5d..610ceb5bd86c 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -41,6 +41,7 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	rreq->i_size	= i_size_read(inode);
 	rreq->debug_id	= atomic_inc_return(&debug_ids);
 	INIT_LIST_HEAD(&rreq->subrequests);
+	INIT_WORK(&rreq->work, NULL);
 	refcount_set(&rreq->ref, 1);
 
 	__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
diff --git a/fs/netfs/output.c b/fs/netfs/output.c
index cc9065733b42..625eb68f3e5a 100644
--- a/fs/netfs/output.c
+++ b/fs/netfs/output.c
@@ -386,3 +386,93 @@ int netfs_begin_write(struct netfs_io_request *wreq, bool may_wait,
 		    TASK_UNINTERRUPTIBLE);
 	return wreq->error;
 }
+
+/*
+ * Begin a write operation for writing through the pagecache.
+ */
+struct netfs_io_request *netfs_begin_writethrough(struct kiocb *iocb, size_t len)
+{
+	struct netfs_io_request *wreq;
+	struct file *file = iocb->ki_filp;
+
+	wreq = netfs_alloc_request(file->f_mapping, file, iocb->ki_pos, len,
+				   NETFS_WRITETHROUGH);
+	if (IS_ERR(wreq))
+		return wreq;
+
+	trace_netfs_write(wreq, netfs_write_trace_writethrough);
+
+	__set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags);
+	iov_iter_xarray(&wreq->iter, ITER_SOURCE, &wreq->mapping->i_pages, wreq->start, 0);
+	wreq->io_iter = wreq->iter;
+
+	/* ->outstanding > 0 carries a ref */
+	netfs_get_request(wreq, netfs_rreq_trace_get_for_outstanding);
+	atomic_set(&wreq->nr_outstanding, 1);
+	return wreq;
+}
+
+static void netfs_submit_writethrough(struct netfs_io_request *wreq, bool final)
+{
+	struct netfs_inode *ictx = netfs_inode(wreq->inode);
+	unsigned long long start;
+	size_t len;
+
+	if (!test_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags))
+		return;
+
+	start = wreq->start + wreq->submitted;
+	len = wreq->iter.count - wreq->submitted;
+	if (!final) {
+		len /= wreq->wsize; /* Round to number of maximum packets */
+		len *= wreq->wsize;
+	}
+
+	ictx->ops->create_write_requests(wreq, start, len);
+	wreq->submitted += len;
+}
+
+/*
+ * Advance the state of the write operation used when writing through the
+ * pagecache.  Data has been copied into the pagecache that we need to append
+ * to the request.  If we've added more than wsize then we need to create a new
+ * subrequest.
+ */
+int netfs_advance_writethrough(struct netfs_io_request *wreq, size_t copied, bool to_page_end)
+{
+	_enter("ic=%zu sb=%zu ws=%u cp=%zu tp=%u",
+	       wreq->iter.count, wreq->submitted, wreq->wsize, copied, to_page_end);
+
+	wreq->iter.count += copied;
+	wreq->io_iter.count += copied;
+	if (to_page_end && wreq->io_iter.count - wreq->submitted >= wreq->wsize)
+		netfs_submit_writethrough(wreq, false);
+
+	return wreq->error;
+}
+
+/*
+ * End a write operation used when writing through the pagecache.
+ */
+int netfs_end_writethrough(struct netfs_io_request *wreq, struct kiocb *iocb)
+{
+	int ret = -EIOCBQUEUED;
+
+	_enter("ic=%zu sb=%zu ws=%u",
+	       wreq->iter.count, wreq->submitted, wreq->wsize);
+
+	if (wreq->submitted < wreq->io_iter.count)
+		netfs_submit_writethrough(wreq, true);
+
+	if (atomic_dec_and_test(&wreq->nr_outstanding))
+		netfs_write_terminated(wreq, false);
+
+	if (is_sync_kiocb(iocb)) {
+		wait_on_bit(&wreq->flags, NETFS_RREQ_IN_PROGRESS,
+			    TASK_UNINTERRUPTIBLE);
+		ret = wreq->error;
+	}
+
+	netfs_put_request(wreq, false, netfs_rreq_trace_put_return);
+	return ret;
+}
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 3413d06033ed..8cde618cf6d9 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -139,6 +139,7 @@ struct netfs_inode {
 	unsigned long		flags;
 #define NETFS_ICTX_ODIRECT	0		/* The file has DIO in progress */
 #define NETFS_ICTX_UNBUFFERED	1		/* I/O should not use the pagecache */
+#define NETFS_ICTX_WRITETHROUGH	2		/* Write-through caching */
 };
 
 /*
@@ -227,6 +228,7 @@ enum netfs_io_origin {
 	NETFS_READPAGE,			/* This read is a synchronous read */
 	NETFS_READ_FOR_WRITE,		/* This read is to prepare a write */
 	NETFS_WRITEBACK,		/* This write was triggered by writepages */
+	NETFS_WRITETHROUGH,		/* This write was made by netfs_perform_write() */
 	NETFS_LAUNDER_WRITE,		/* This is triggered by ->launder_folio() */
 	NETFS_UNBUFFERED_WRITE,		/* This is an unbuffered write */
 	NETFS_DIO_READ,			/* This is a direct I/O read */
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index cc998798e20a..447a8c21cf57 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -27,13 +27,15 @@
 	EM(netfs_write_trace_dio_write,		"DIO-WRITE")	\
 	EM(netfs_write_trace_launder,		"LAUNDER  ")	\
 	EM(netfs_write_trace_unbuffered_write,	"UNB-WRITE")	\
-	E_(netfs_write_trace_writeback,		"WRITEBACK")
+	EM(netfs_write_trace_writeback,		"WRITEBACK")	\
+	E_(netfs_write_trace_writethrough,	"WRITETHRU")
 
 #define netfs_rreq_origins					\
 	EM(NETFS_READAHEAD,			"RA")		\
 	EM(NETFS_READPAGE,			"RP")		\
 	EM(NETFS_READ_FOR_WRITE,		"RW")		\
 	EM(NETFS_WRITEBACK,			"WB")		\
+	EM(NETFS_WRITETHROUGH,			"WT")		\
 	EM(NETFS_LAUNDER_WRITE,			"LW")		\
 	EM(NETFS_UNBUFFERED_WRITE,		"UW")		\
 	EM(NETFS_DIO_READ,			"DR")		\
@@ -136,7 +138,9 @@
 	EM(netfs_folio_trace_redirty,		"redirty")	\
 	EM(netfs_folio_trace_redirtied,		"redirtied")	\
 	EM(netfs_folio_trace_store,		"store")	\
-	E_(netfs_folio_trace_store_plus,	"store+")
+	EM(netfs_folio_trace_store_plus,	"store+")	\
+	EM(netfs_folio_trace_wthru,		"wthru")	\
+	E_(netfs_folio_trace_wthru_plus,	"wthru+")
 
 #ifndef __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
 #define __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

