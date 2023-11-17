Return-Path: <linux-cachefs+bncBDLIXLMFVAERBG5R36VAMGQE45BJMWQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DBD7EF9CC
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:18:20 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-670b32845a7sf29405936d6.3
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:18:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255899; cv=pass;
        d=google.com; s=arc-20160816;
        b=I4t2O7p0LyQFrdDl3JNou8HrO8jfAyg3gIGmE/XlnbOV67jUHtW0zaAmEUkNEeYK+Q
         1GFSPIDoNQm81IExuOjBd+iKCSDJJTi8JZUtqXHvVJ8vF4CGglpLeSur8Iu2F392pX/R
         xlvf/qige0Mh4TBd1H8G8vRB3H3ATdjnrIzemFAHN66pB3xHBI84E+gCFFKtaqlxRJFN
         d81s7rKlU+mAFWneCD+Tt7PChLDQ7GgaU60/1s++P2AMQcfHsQtNhKE6dzqVelqhWidT
         Ked3vc9t/hCD0faDSOOcH1GRj8NCSMgGL5oSeWi/ab40uwYe9gRJlW8CYrsWWQLnbdoc
         TUNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Atx6K+DXbPYwA7AtsqFYX5RpALLorkpDdgvtbIU9mNo=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=SSQspxr7bpHRdMIcqy7sHbE0lEWtmoqj5RdAdnxsOwsSRhy3FCtW5wJkmBRGxzbQ5F
         z5KhZQKD+uBDbY48XQmTWF7kCt8fymFRNeV1WX+ZQY2Ra1gFgaMiVV3E5JAIuov4Otm1
         VcSs/Tq5rp4k7293aOX7BpiQpSL/8jLxdyxANZXwyDRvdmwkCbMRR72R4C8Rp45r+iRz
         dLivpLCotnJoQ9KSx5eHuUo3925Id0r1khg3PoFhaRZGKpyTgPT4PyWN+h0yevYSP9sM
         tUnLpkD17R5Y7gJkXm1OfsYuNQR9qe8C74fPs/njzwYr5QSBwiCsnTJHyAU61YosYNnU
         /0NQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255899; x=1700860699;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Atx6K+DXbPYwA7AtsqFYX5RpALLorkpDdgvtbIU9mNo=;
        b=rKiG4Ga4sChhY5Kx4LpzFn9vCyhsn5IUJz95Hhj190+9yB8nntwK7SPRjVw03g4KzM
         Jl9DuBUtc/ZIFtspMYj9EZ4CYtYlqq4pl070F5DpM75RPpnF8mm/PBA+mXJ9l9o3Zxvf
         GpqWyAWcxMGhpD51ZM+p4QF5vfDIuXiRkDQmY4vWvQTlT0tnz+pM4gHJXCcPjhzDCNxt
         Fa4GzGFHzBv/2gOmBHRGl1PK5e6kQ5QfIJw99lmTlx6H+xB7rhh2eamik/oI9KG7GZw2
         IhlwU8WW3WcYBJFvmgaF64A6vx00lfojJ/szi24WfPpA2guVKnkh3G11K2wFgNR5oqKY
         Evqg==
X-Gm-Message-State: AOJu0Yxw3UWcBUtgJEsme2cSk5qXKELk38VnulVydlbXLipy5Gnuhq44
	8/dxiD37lj5pQCRODcH9Slzshw==
X-Google-Smtp-Source: AGHT+IFfBFsobpXIWJnmSS0fLl/HdogHGSH1d7eBq3ca1mGmXU7zDCtc4tqBdSIsb/wQPZH0fR023A==
X-Received: by 2002:a05:6214:494:b0:675:65d6:d0f3 with SMTP id pt20-20020a056214049400b0067565d6d0f3mr447186qvb.24.1700255899723;
        Fri, 17 Nov 2023 13:18:19 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:e5c6:0:b0:65d:b9b:f30e with SMTP id u6-20020a0ce5c6000000b0065d0b9bf30els1626977qvm.0.-pod-prod-03-us;
 Fri, 17 Nov 2023 13:18:19 -0800 (PST)
X-Received: by 2002:ad4:5d64:0:b0:66d:6919:7bf7 with SMTP id fn4-20020ad45d64000000b0066d69197bf7mr255746qvb.27.1700255899169;
        Fri, 17 Nov 2023 13:18:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255899; cv=none;
        d=google.com; s=arc-20160816;
        b=ru0bCkjPBuu93tm5bpICrn24DzjG66af1430CGwHYeGvsAaGiRNoeIMB0xuK+IjTz9
         8YYsChmFs1wBOZCh1hm3tfLp2ELzXUalTr6gQ27E8cigyQhKzbcMIRKgIIe8jfey8ShS
         9y0dP2HsAChTwpvhYsfzQ2jVrKuKvM1QWtp59I9NsQP2NHHyZ8w02n8QinDuiQKJMVp7
         1lATCSaAMHUUbbUnJ4Dp5Zm0YcrbAIJcF75vHU4uWEzlqSb2h+x/Vcjk7UTmrF+xJc5I
         WfyfCCOtfJHNc3c8mHxibCo9F1NG5meIMHDize1Nu6vI1D+j0pOwPEbJUT/fZwdeI0aC
         Rt6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=PC5znrgVdeDTK8h747pYH7QIEJHuL7LxC8/q4NHF5Co=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=vpFkQYm0XcjuTLSM1phLPjbM89HAt47amGj7MverbZFZLyjnDeY1x9oys9X6jKymws
         aa6WxBikO+EsDjKezMsCMsQyoVJ22URzQiScydXgE8BCiOP4hPUSxyXTowo9iKCRN5BE
         vPqJewUSPMTlPrwFE17Cl7WY7sG9Jrxw57inkpE18RtSzkRf81ZaEpCRlpigl1u+vbbS
         1HGhjoO3YVd4GPhRNjzeFwxW4JlS5aHwMDSiIyBn95dqw45sOX0CAVf9GIpQ8Q+tDeEV
         jTrQKC8Fj7eLTr61dft/fSn58i61XaIPD+pJkUAx/h7AfZWhVqBvTpjNLuvGbgPN3H4/
         jVrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id n8-20020a0cfbc8000000b00670b3a8241bsi2388419qvp.350.2023.11.17.13.18.19
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:18:19 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-QEayF1fWPcGEJnNDnehAIA-1; Fri, 17 Nov 2023 16:18:17 -0500
X-MC-Unique: QEayF1fWPcGEJnNDnehAIA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12D7681B56C
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:18:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 0CE87492B2F; Fri, 17 Nov 2023 21:18:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52FD6492BFE;
	Fri, 17 Nov 2023 21:18:14 +0000 (UTC)
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
Subject: [PATCH v2 38/51] netfs: Implement a write-through caching option
Date: Fri, 17 Nov 2023 21:15:30 +0000
Message-ID: <20231117211544.1740466-39-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
 fs/netfs/buffered_write.c    | 67 +++++++++++++++++++++++----
 fs/netfs/internal.h          |  3 ++
 fs/netfs/main.c              |  1 +
 fs/netfs/objects.c           |  1 +
 fs/netfs/output.c            | 90 ++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h        |  2 +
 include/trace/events/netfs.h |  8 +++-
 7 files changed, 160 insertions(+), 12 deletions(-)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 43e825b882ff..1e8829ad2cbf 100644
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
@@ -135,6 +137,14 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
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
@@ -145,6 +155,30 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
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
@@ -314,7 +348,23 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
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
+				folio_start_writeback(folio);
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
@@ -324,17 +374,14 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
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
index 782b73b1f5a7..d7f31e660645 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -111,6 +111,9 @@ static inline void netfs_see_request(struct netfs_io_request *rreq,
  */
 int netfs_begin_write(struct netfs_io_request *wreq, bool may_wait,
 		      enum netfs_write_trace what);
+struct netfs_io_request *netfs_begin_writethrough(struct kiocb *iocb, size_t len);
+int netfs_advance_writethrough(struct netfs_io_request *wreq, size_t copied, bool to_page_end);
+int netfs_end_writethrough(struct netfs_io_request *wreq, struct kiocb *iocb);
 
 /*
  * stats.c
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 577c8a9fc0f2..ed540c5dec8d 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -33,6 +33,7 @@ static const char *netfs_origins[nr__netfs_io_origin] = {
 	[NETFS_READPAGE]		= "RP",
 	[NETFS_READ_FOR_WRITE]		= "RW",
 	[NETFS_WRITEBACK]		= "WB",
+	[NETFS_WRITETHROUGH]		= "WT",
 	[NETFS_LAUNDER_WRITE]		= "LW",
 	[NETFS_RMW_READ]		= "RM",
 	[NETFS_UNBUFFERED_WRITE]	= "UW",
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 6bf3b3f51499..14cdf34e767e 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -41,6 +41,7 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	rreq->debug_id	= atomic_inc_return(&debug_ids);
 	xa_init(&rreq->bounce);
 	INIT_LIST_HEAD(&rreq->subrequests);
+	INIT_WORK(&rreq->work, NULL);
 	refcount_set(&rreq->ref, 1);
 
 	__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
diff --git a/fs/netfs/output.c b/fs/netfs/output.c
index 2d2530dc9507..255027b472d7 100644
--- a/fs/netfs/output.c
+++ b/fs/netfs/output.c
@@ -393,3 +393,93 @@ int netfs_begin_write(struct netfs_io_request *wreq, bool may_wait,
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
index 474b3a0f202a..39f885fea383 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -143,6 +143,7 @@ struct netfs_inode {
 #define NETFS_ICTX_ODIRECT	0		/* The file has DIO in progress */
 #define NETFS_ICTX_UNBUFFERED	1		/* I/O should not use the pagecache */
 #define NETFS_ICTX_ENCRYPTED	2		/* The file contents are encrypted */
+#define NETFS_ICTX_WRITETHROUGH	3		/* Write-through caching */
 	unsigned char		min_bshift;	/* log2 min block size for bounding box or 0 */
 	unsigned char		crypto_bshift;	/* log2 of crypto block size */
 	unsigned char		crypto_trailer;	/* Size of crypto trailer */
@@ -234,6 +235,7 @@ enum netfs_io_origin {
 	NETFS_READPAGE,			/* This read is a synchronous read */
 	NETFS_READ_FOR_WRITE,		/* This read is to prepare a write */
 	NETFS_WRITEBACK,		/* This write was triggered by writepages */
+	NETFS_WRITETHROUGH,		/* This write was made by netfs_perform_write() */
 	NETFS_LAUNDER_WRITE,		/* This is triggered by ->launder_folio() */
 	NETFS_RMW_READ,			/* This is an unbuffered read for RMW */
 	NETFS_UNBUFFERED_WRITE,		/* This is an unbuffered write */
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 54b2d781d3a9..04cbe803c251 100644
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
 	EM(NETFS_RMW_READ,			"RM")		\
 	EM(NETFS_UNBUFFERED_WRITE,		"UW")		\
@@ -138,7 +140,9 @@
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

