Return-Path: <linux-cachefs+bncBDLIXLMFVAERB7ET62WAMGQEI25YEXA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 4954B828BB2
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Jan 2024 19:01:39 +0100 (CET)
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-dbdad99096fsf4309765276.2
        for <lists+linux-cachefs@lfdr.de>; Tue, 09 Jan 2024 10:01:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704823293; cv=pass;
        d=google.com; s=arc-20160816;
        b=K6zFX1agqzPq0BCXeFJDaECnJqITDILx6qbXDqXZbliP3Pi39SNFnYFbQYyYt6YO1n
         jrmlPUHWDWLgK4T2VMV9BmZbzaJnEElO/E5MBFZPJSVjLueClFHNLoghJzVJLLz+eWHY
         Khrv0yWZOdUUqHsZr7TRe0Al1Z6Qew2zDWHlPkXyUMv8qMlA741tGnmw5RMxMcxO967P
         pLnQnq22KVFt7CPchcNyQneVoChH7NFpeT0fElHClVTihjmpmoTH+QuiZJQONpBw7waG
         daffU4TgPISxSlAS9csgcMyJQdNqNg0vGL/bT+C3Gg3y5fc9Bl+zoFcbAMHFA68Ot1mt
         Suvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=U6J27Vil1JJqKulM3GmgHdiGq/PwU4/CIVDbAB5EFE0=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=Su6MGPSbPTfcj29ji0yERENPdlV+BsJPjdW+Jp8L4wpy56kNdd979UcmQIOzxPqecP
         HVWYfo3cKnPDn3Bya2suMcNfudhutPYQ+xm6HRZpZuzzurBdnbBEYki2ubpuzJ4Tw9+8
         V0xdW2B5nXjWrNKXcoxf4MUd8LcT1BIcZaUjH57NFAa2uqnR3JIfiuNmygxWxiC+Sk5K
         VGX9N7Iho7Qk3uP8RHo/LNbx4U1w+9p35xNarYF8Owp4fs7+r51HWW1B1z44Iu2tGfxy
         s2iY4eaVwe3qTwh+VNY3yWpTbJcWl4VENJ9xpW+vCVAqruO/2lxkJhH6Z6/YdigohcX5
         7eVQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823293; x=1705428093;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6J27Vil1JJqKulM3GmgHdiGq/PwU4/CIVDbAB5EFE0=;
        b=XH8mT7ODmAuVdK6lqAO1GdO3OI1SlFETMUVjYJxM6t4tDx2KxBotuuGHKnfFLJEIMb
         4pNy1B2almnz5+SYHJaZbxd5WODIclLCODZPjf6zD8GIwrPy84nULjgx4+tt4+cfVUtG
         R1QKDS4Z9MZNsqcBqxIeS/4R1Fz4nCUkpgxSZlSpDtP58Jk+psYf1JhpCH0g1czE8Chk
         L/YLWCBubXpMxnw55bzgLhYt/CGXOj1jp8OU0Woll5GLxDI+xYFmsRxgei7bO7cSM4X4
         u6QFYt+CivRKv/h/iHNGC+d+AKZz0pI26XE14BbrBH/t4Zyd1+ZRyoFNcavimYFIOoWn
         Vb8Q==
X-Gm-Message-State: AOJu0Yy5GcxttVs8yKOKzeyMnHoGfEfGQwCrcRyYzhGJFBn9LJ8C8zJl
	VxR6TDvIMeNDACe3VqN9N7DgA5QVA8l8Kw==
X-Google-Smtp-Source: AGHT+IGBM6QUUzL6vPrG8gl9FfUKVorRTw9487Uqdudxen3eWGdZLCGQ68ETtiJAGSjxXZnto6zRhg==
X-Received: by 2002:a05:6902:250c:b0:dbe:9f4a:6bb0 with SMTP id dt12-20020a056902250c00b00dbe9f4a6bb0mr3330167ybb.56.1704823292895;
        Tue, 09 Jan 2024 10:01:32 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:e093:0:b0:dbd:4632:de3 with SMTP id x141-20020a25e093000000b00dbd46320de3ls473412ybg.0.-pod-prod-06-us;
 Tue, 09 Jan 2024 10:01:32 -0800 (PST)
X-Received: by 2002:a25:9d01:0:b0:dbf:196c:b615 with SMTP id i1-20020a259d01000000b00dbf196cb615mr662764ybp.0.1704823292151;
        Tue, 09 Jan 2024 10:01:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823292; cv=none;
        d=google.com; s=arc-20160816;
        b=UaGB/fRcG+jIUttPW9o5EfLuwxNp24jBzwVrku7M1eIGnMRRGmgTsIsvn4oPse2KDU
         C/MQtlu6Z8BIr/AXApHbR9j9Y2VLIdEPpukMsGqYGYBcdRipQpk4b69/4CFz7Z43Klvh
         BOi2ZnDZ9KcAadPth7LbsgLI8Ywc1idPMZcUE4ts2fmhxM9EBep7vbOMBFxQoNZ1456a
         xLoUV0NH4LfLFR4PkyBWivcGAL5StcxIjdkR3c7OPpP8y0lhk/CAYdXvR7O5s8EPo4gQ
         da4Nh+h/X4oki6bX98l2+/J/HJDn1q2lt/Ny7nUi1x2s90wh8DE3CvCKyvaH2CDDfpOX
         yg2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=D4ihKq2RSkKhUM5kA055LwpHV4/BqtYxlxEJ8VssZ38=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=im0JPftG2iDw4w7VutX0IL/LAYv+zUl/lov/Elisc9HsozzkrqN6yzbaRy6CNG9/Nc
         gbti5K+jr2qRsxg5ngB7HTYE9M9sHd9yaBJjKZHtILlYsI3hbixCjCTlDMyce08yIt8V
         NL2pyG7ZpUKLlUR/Te6nPs8lcws1gD0y9+0qNq+i7waftbrXKqcAIw+7DCCWIRJ8vQvD
         SSTNDCyvd+xoctZTA3ay/S7tnKRHwsiL8EOqHT4rVzm7Mod7NisliIhp5/9twF/7s4l3
         hqLRB7ZlpNsYxMHJX+CAeMFND3pywMVi95itU8aGCMx3Ag1KCFLGS6qACsWPc+FpxTsS
         VSPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id l8-20020a056902072800b00dbcbfe64929si1620308ybt.577.2024.01.09.10.01.32
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 10:01:32 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-2i4x9H80O0Gk4eV8gOtMXw-1; Tue, 09 Jan 2024 13:01:30 -0500
X-MC-Unique: 2i4x9H80O0Gk4eV8gOtMXw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49F0E811E86
	for <linux-cachefs@gapps.redhat.com>; Tue,  9 Jan 2024 18:01:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 439D2C15E6A; Tue,  9 Jan 2024 18:01:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BE45C15A0C;
	Tue,  9 Jan 2024 18:01:26 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Steve French <smfrench@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] netfs: Don't use certain internal folio_*() functions
Date: Tue,  9 Jan 2024 18:01:12 +0000
Message-ID: <20240109180117.1669008-2-dhowells@redhat.com>
In-Reply-To: <20240109180117.1669008-1-dhowells@redhat.com>
References: <20240109180117.1669008-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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

Filesystems should not be using folio->index not folio_index(folio) and
folio->mapping, not folio_mapping() or folio_file_mapping() in filesystem
code.

Change this automagically with:

perl -p -i -e 's/folio_mapping[(]([^)]*)[)]/\1->mapping/g' fs/netfs/*.c
perl -p -i -e 's/folio_file_mapping[(]([^)]*)[)]/\1->mapping/g' fs/netfs/*.c
perl -p -i -e 's/folio_index[(]([^)]*)[)]/\1->index/g' fs/netfs/*.c

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-afs@lists.infradead.org
cc: linux-cachefs@redhat.com
cc: linux-cifs@vger.kernel.org
cc: linux-erofs@lists.ozlabs.org
cc: linux-fsdevel@vger.kernel.org
---
 fs/netfs/buffered_read.c  | 12 ++++++------
 fs/netfs/buffered_write.c | 10 +++++-----
 fs/netfs/io.c             |  2 +-
 fs/netfs/misc.c           |  2 +-
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index a59e7b2edaac..3298c29b5548 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -101,7 +101,7 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 		}
 
 		if (!test_bit(NETFS_RREQ_DONT_UNLOCK_FOLIOS, &rreq->flags)) {
-			if (folio_index(folio) == rreq->no_unlock_folio &&
+			if (folio->index == rreq->no_unlock_folio &&
 			    test_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags))
 				_debug("no unlock");
 			else
@@ -246,13 +246,13 @@ EXPORT_SYMBOL(netfs_readahead);
  */
 int netfs_read_folio(struct file *file, struct folio *folio)
 {
-	struct address_space *mapping = folio_file_mapping(folio);
+	struct address_space *mapping = folio->mapping;
 	struct netfs_io_request *rreq;
 	struct netfs_inode *ctx = netfs_inode(mapping->host);
 	struct folio *sink = NULL;
 	int ret;
 
-	_enter("%lx", folio_index(folio));
+	_enter("%lx", folio->index);
 
 	rreq = netfs_alloc_request(mapping, file,
 				   folio_file_pos(folio), folio_size(folio),
@@ -460,7 +460,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
 		ret = PTR_ERR(rreq);
 		goto error;
 	}
-	rreq->no_unlock_folio	= folio_index(folio);
+	rreq->no_unlock_folio	= folio->index;
 	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
 
 	ret = netfs_begin_cache_read(rreq, ctx);
@@ -518,7 +518,7 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 			     size_t offset, size_t len)
 {
 	struct netfs_io_request *rreq;
-	struct address_space *mapping = folio_file_mapping(folio);
+	struct address_space *mapping = folio->mapping;
 	struct netfs_inode *ctx = netfs_inode(mapping->host);
 	unsigned long long start = folio_pos(folio);
 	size_t flen = folio_size(folio);
@@ -535,7 +535,7 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 		goto error;
 	}
 
-	rreq->no_unlock_folio = folio_index(folio);
+	rreq->no_unlock_folio = folio->index;
 	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
 	ret = netfs_begin_cache_read(rreq, ctx);
 	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index de517ca70d91..3afb1a0f92d1 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -343,7 +343,7 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 			break;
 		default:
 			WARN(true, "Unexpected modify type %u ix=%lx\n",
-			     howto, folio_index(folio));
+			     howto, folio->index);
 			ret = -EIO;
 			goto error_folio_unlock;
 		}
@@ -648,7 +648,7 @@ static void netfs_pages_written_back(struct netfs_io_request *wreq)
 	xas_for_each(&xas, folio, last) {
 		WARN(!folio_test_writeback(folio),
 		     "bad %zx @%llx page %lx %lx\n",
-		     wreq->len, wreq->start, folio_index(folio), last);
+		     wreq->len, wreq->start, folio->index, last);
 
 		if ((finfo = netfs_folio_info(folio))) {
 			/* Streaming writes cannot be redirtied whilst under
@@ -795,7 +795,7 @@ static void netfs_extend_writeback(struct address_space *mapping,
 				continue;
 			if (xa_is_value(folio))
 				break;
-			if (folio_index(folio) != index) {
+			if (folio->index != index) {
 				xas_reset(xas);
 				break;
 			}
@@ -901,7 +901,7 @@ static ssize_t netfs_write_back_from_locked_folio(struct address_space *mapping,
 	long count = wbc->nr_to_write;
 	int ret;
 
-	_enter(",%lx,%llx-%llx,%u", folio_index(folio), start, end, caching);
+	_enter(",%lx,%llx-%llx,%u", folio->index, start, end, caching);
 
 	wreq = netfs_alloc_request(mapping, NULL, start, folio_size(folio),
 				   NETFS_WRITEBACK);
@@ -1047,7 +1047,7 @@ static ssize_t netfs_writepages_begin(struct address_space *mapping,
 
 	start = folio_pos(folio); /* May regress with THPs */
 
-	_debug("wback %lx", folio_index(folio));
+	_debug("wback %lx", folio->index);
 
 	/* At this point we hold neither the i_pages lock nor the page lock:
 	 * the page may be truncated or invalidated (changing page->mapping to
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 4309edf33862..e8ff1e61ce79 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -124,7 +124,7 @@ static void netfs_rreq_unmark_after_write(struct netfs_io_request *rreq,
 			/* We might have multiple writes from the same huge
 			 * folio, but we mustn't unlock a folio more than once.
 			 */
-			if (have_unlocked && folio_index(folio) <= unlocked)
+			if (have_unlocked && folio->index <= unlocked)
 				continue;
 			unlocked = folio_next_index(folio) - 1;
 			trace_netfs_folio(folio, netfs_folio_trace_end_copy);
diff --git a/fs/netfs/misc.c b/fs/netfs/misc.c
index 0e3af37fc924..90051ced8e2a 100644
--- a/fs/netfs/misc.c
+++ b/fs/netfs/misc.c
@@ -180,7 +180,7 @@ void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 	struct netfs_folio *finfo = NULL;
 	size_t flen = folio_size(folio);
 
-	_enter("{%lx},%zx,%zx", folio_index(folio), offset, length);
+	_enter("{%lx},%zx,%zx", folio->index, offset, length);
 
 	folio_wait_fscache(folio);
 

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

