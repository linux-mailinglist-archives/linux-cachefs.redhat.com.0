Return-Path: <linux-cachefs+bncBDLIXLMFVAERBMM246VQMGQEEMUNJVY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D15811679
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:26:43 +0100 (CET)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2030e197634sf1904448fac.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:26:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481202; cv=pass;
        d=google.com; s=arc-20160816;
        b=PDJ+VrFIlXSvLEimWssCpMOZTwz0o3H+TurJ58h1V1bupVtA8nvhvLSs6c7s94ZRey
         7OAUx924nw9ktI56k1cHujeFM5Iz4IKOuP/Z/eQgfiI6rV97yOn1kqs8o9S4qovehjG5
         A21Ef4Z/pJxgbm6xujF1xfHWODk67npAam8z4mtMNcwTE7UiZd2HYRTsb9DFKw3Ckwub
         ktmUUFeG2+PHEu/JUspBJSwf24tMkLDt8Kfcl7j8iyIIc4tvZeA+VaKuNpU3EBEMI5xt
         F+O57Y0E0r2MqDHGXTv/K+g3HLs62YSrKMilH09JHMu9/wxn5Ua8ZcAXRdgRSaN38GbU
         zx9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=EMpeB65EMxnBnB6/FopIZ77DdJfypS+23pQIEkqmWak=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=AowEBKtS1mYp8X/qh8fJNi8Bmp7009Fwgezo/HY1Hm+POrQLbBcPJJEHcQrZ1SEkzK
         BzyKkiTTF4/hzI08tvvxMaKj3nQVSDK0r0nHGozWvZ7oYbX2LEqCxK68yzdNDR9g3yMz
         dTEPcGaW/y4gQPxL8Vl9tX4up1a4y7kyRaVjt8sV5U8OmfZHAraNyHM3mQ7GfFy01rhr
         EIPILEdGTVikruT36FZodX/NqbMdeeC1JaAhGMsZqKzuhqkIawITLb8NIRag60mMMj13
         9nWwuT1KVK3aTJj7XePgbiSz75xNuVhCfbE9KMeQWrLHZkyGiM987XLAPJdHNpg8aTbt
         rlnQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481202; x=1703086002;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMpeB65EMxnBnB6/FopIZ77DdJfypS+23pQIEkqmWak=;
        b=U3EefzvtrCCx7wpfG40/6Ec4LxRBDZ0qj0Zjw/8LMuzpt9B6/XkhtPfXSN/GZibWqD
         5sc/L08YiRAuJmYQ9/Pg/roj5QSZC2fRYsWoe73UXsDbCNie2SEFcO7jD0eaNBmubZp7
         0+2JoWyCfetCfxSaMA/Ov4i4/jrv7ZNnFB+ohF745lHXo2cwT0lrc9p6n1fZdTfqJR4w
         mUVPNkVg9Vc+8xKTLxmV/zhR0wXCtnS6X4f+1wz/tm0HSDhA3IGbs8qoct/I1ufhb68z
         eYTMEQ1CZbLgjqLUgTLX9yEsjNJ8xYEI5VgqULzibMZOC5zwWkDvf6n/8Bqj9ndmWE14
         01lw==
X-Gm-Message-State: AOJu0YwQ5nW/gcHadYQbIp9saVDLHo4csAS9XNBFvqvrc5otNljr3gWO
	4tBfvUP2xPUa160CPTinvZZwzQ==
X-Google-Smtp-Source: AGHT+IHIK3lG8itiD06ZLqno8nb0R98BbG4iEts/QWw5kxXjBXFEjPtub8okzg6U5tZpF/Ks0HdHgA==
X-Received: by 2002:a05:6871:6114:b0:1fb:15c3:2882 with SMTP id ra20-20020a056871611400b001fb15c32882mr10502882oab.100.1702481201870;
        Wed, 13 Dec 2023 07:26:41 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:4b62:0:b0:67a:94b0:82e3 with SMTP id m2-20020ad44b62000000b0067a94b082e3ls1929321qvx.0.-pod-prod-07-us;
 Wed, 13 Dec 2023 07:26:41 -0800 (PST)
X-Received: by 2002:a0c:ea2f:0:b0:67a:94e2:6d1c with SMTP id t15-20020a0cea2f000000b0067a94e26d1cmr9331619qvp.5.1702481201276;
        Wed, 13 Dec 2023 07:26:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481201; cv=none;
        d=google.com; s=arc-20160816;
        b=Gy1+p98N3iIbBmXJi4WyCafxq70Wbrj8D0ydTCz0wEQHk+J5FBad4DYi9l8/CqCt9g
         FfTlcBrbTVHuo0U7CGnMkPzsAxJXsTrdLnAuGv3lZLZoIm62v2c27VdRt06Cq7q2/ul2
         zIm79bZAIb+e15k+TXzoTWFP/WrOd2V38VvmTzeZjfkD6gMkEuw+2/4rOI2IrJMs7u3N
         aelivq6bCOfqj7uGNCks/MEKsSick6VgHOTjqji+x86WJyVE+P7GngC56ZgErI+1jKoQ
         K12/CAtOOExi0hJrgjGau6l+NjSy+iptW44+nv4zgXHCgSQdUYvtd0V/4YU32g32MQCA
         Veyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=DMHsdIxXvUk6Wbv0Mmvq6RSRYJtgXuGRYMsHtscd1pE=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=kwnGWvwk5GNZl0OlgZSn/cKmL21gIw5efi3exzTYDtA5jucwrEHIz0pUUFUMPrZw9Y
         vMozP5CwMyq+BkrSXcdWb/tPsQ5Ahs5vx6+kiiuDxDbhEiC4Xtt0VpfiZtLlqDd64hNO
         tdYsDJqkTW+eEAto2oY3OwPz/kQZyyZY3tM2YzBOGae2Lezct4ilpQZzMVeOlMvQatgH
         XEtpIBVeAcACPlI5uB+Ka7BsRdw3bjaxthSd6gx3GY0ZMPWoU/PnXQhoP2jKQfwl3BEX
         2qSUA9Tg4j7hYHv5AVwR9J+Sa/O8OvcBVyJ61IuIgFygXDe5uZai6RhpExRyZBytlgg+
         OfMg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id ea1-20020ad458a1000000b0067ab901521fsi12558621qvb.291.2023.12.13.07.26.41
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:26:41 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-zmIxPUW6PLOGpB86LBSDhg-1; Wed, 13 Dec 2023 10:26:39 -0500
X-MC-Unique: zmIxPUW6PLOGpB86LBSDhg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3DCE890FC1
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:26:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id E1033492BC9; Wed, 13 Dec 2023 15:26:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 84755492BC6;
	Wed, 13 Dec 2023 15:26:35 +0000 (UTC)
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
Subject: [PATCH v4 36/39] netfs: Implement a write-through caching option
Date: Wed, 13 Dec 2023 15:23:46 +0000
Message-ID: <20231213152350.431591-37-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
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
index 8e0ebb7175a4..dce6995fb644 100644
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
index fe72280b0f30..b3749d6ec1ff 100644
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
index 8d5ee0f56f28..7139397931b7 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -33,6 +33,7 @@ static const char *netfs_origins[nr__netfs_io_origin] = {
 	[NETFS_READPAGE]		= "RP",
 	[NETFS_READ_FOR_WRITE]		= "RW",
 	[NETFS_WRITEBACK]		= "WB",
+	[NETFS_WRITETHROUGH]		= "WT",
 	[NETFS_LAUNDER_WRITE]		= "LW",
 	[NETFS_UNBUFFERED_WRITE]	= "UW",
 	[NETFS_DIO_READ]		= "DR",
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 16252cc4576e..37626328577e 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -42,6 +42,7 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	rreq->debug_id	= atomic_inc_return(&debug_ids);
 	xa_init(&rreq->bounce);
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
index a7c2cb856e81..fc77f7be220a 100644
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

