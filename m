Return-Path: <linux-cachefs+bncBDLIXLMFVAERBYGDXGWQMGQEANUHVQQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE1F83635F
	for <lists+linux-cachefs@lfdr.de>; Mon, 22 Jan 2024 13:38:57 +0100 (CET)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-598a658276csf4389432eaf.2
        for <lists+linux-cachefs@lfdr.de>; Mon, 22 Jan 2024 04:38:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705927136; cv=pass;
        d=google.com; s=arc-20160816;
        b=ESLXFC6Gt8Rfmm3bcgqRmvQvuYAOxZ54HZvVjA/F0BI+yIGUdi+xigqEvOgxvvJfd0
         U0TquY7oVlxXoWE1NCdZk1c/FP/ga8tSzRKPJ4v8Tsfbl3EQw0NXlNezrBhsC+c+PKXc
         ZP039B1AUoerH/+aa6Gpti8isTCqEgX6xcJ5bi5oOChmrOJtBLrY+/Hx5eaB7T2yRfeR
         gqxX/crF+kr0F/glMG6wnV5CCWf+21dlwysUJ4EKm70nZnl7UONMPjsdj+0SHlIIk7jY
         QsU4OXJInH6i4TWcYZF6LGxJD9U7vfyDFnO7VcKoW65iGfjJVSlk+GfO2AGlkWhk2iwY
         YqYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=orcfJEM6D13wYYH17k3rkW4d4+DqtWzrfX6lVOh4oQQ=;
        fh=FnpNaEs7ZBq56/QlUA2bXulYV7BZWdOFZjGg77Ohe5s=;
        b=e46kHwOh/+2luqJjc0FYJy6xgnACNJxKyc2jFTWhuwvKZUZtxQmjvXy/ULS8zR465r
         VbaseD6KMkgKr2EZt2bXg+R8M6D/l+n4VqcIwkUIf8AmjAl1nHxBsH0sgbmju5HY/OL6
         5HRb6f2n1NKkvJKEBl9TdLmJt4aASHb0cS2yds4OZ4QajsTCoserEqGuNdcAmfFoIZzf
         38uBCq6Mx8MmdwSZICO/DMAcd8aLftRnYPKhJj0yBazFK95FvFkU3f+UKU8x8nt/MLQP
         OUwzsFh2+faTLSx8b+qVHTx4CIZc4gjew1+t/KowK/h1Nxhsr9OpnN4M4m0g3fg31f8B
         bYiw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705927136; x=1706531936;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orcfJEM6D13wYYH17k3rkW4d4+DqtWzrfX6lVOh4oQQ=;
        b=bChOALxqfo9x18WORPAbcW+w0VlXonzTykeNVbhwmKW2ULkK07hJtvBAYh2LsiQcPI
         ZaGN+EhhSLQLMtndT6NGE8e1o5ABvnTfIlk3h2QlAoTE7A6+nLIGhtckBz8KPlwaAw2+
         T2AeeoV83riPbw7xwoeA1L3ruk84VLy6e88VFxc0sqUonpepJJtEXceyC2c3R/VD2WDz
         GxcjpJNQee2VbJKXiqlf2VqbnmZgy59d9VaId90o9OobBCqZontg4fsdEGl1R9Qe7fui
         2gzBZWS6Yum/iQPg7AHlXUg6VC/xUtwKCTdJNe244HHnXwNuJ4Wmz7J8cUIlIwubOR8d
         LcMQ==
X-Gm-Message-State: AOJu0Yz8Y3m+/DpyFNiXyV/VNbbwSr8cGYSYKgB0xk98bh8OunlpolJb
	BVZR3kW3OOnE0iahHFTOhePuK1dH/YIOQtQqkttfb5zkRl2H5sneQLRLlsN6G8Y=
X-Google-Smtp-Source: AGHT+IGdHWAAqbbBjfrVLnSPVYN2KdvrQT6t1d6diId6XU35ElCvYCW6mIOSj5Sp4Fc6y5mctLwgqw==
X-Received: by 2002:a4a:c306:0:b0:599:441e:14f9 with SMTP id c6-20020a4ac306000000b00599441e14f9mr2163045ooq.2.1705927136279;
        Mon, 22 Jan 2024 04:38:56 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a4a:5803:0:b0:598:c95b:c3bc with SMTP id f3-20020a4a5803000000b00598c95bc3bcls2128156oob.0.-pod-prod-05-us;
 Mon, 22 Jan 2024 04:38:55 -0800 (PST)
X-Received: by 2002:a05:6808:f8f:b0:3bd:c08d:91f6 with SMTP id o15-20020a0568080f8f00b003bdc08d91f6mr172143oiw.29.1705927135616;
        Mon, 22 Jan 2024 04:38:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705927135; cv=none;
        d=google.com; s=arc-20160816;
        b=Q2q6ohLD8MesZzl44Wo3i8dFKU18gHUjj0cuC2OK7y3N3DvxGypAjlLg9SjjPaKb5I
         qtLgj+CShEsAG690SRn4IQHjCDxsaqmh9CV9QCUuJuztTCn+GWzWMW6gC6WzmSDHbwhn
         rE8krK1mcEA681fVXDWPjo5+uGgt79D1pcH7CuTQ55lS4urfqRuaAUiDSJvS0ZiSngMB
         g9wQhWMCYHhNYzGxM0aVTmjbPUXRuZNOSPE3rIps8y41z8omcjDQDCEZ7DD+9meADNML
         XScVF3tHwrm+TvTTGtFALCVLUCZdYolEwCNPJZl2ysr/HKs0Jm1icxZzS6t1YuBOIQxi
         njrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=LLfnoKn4t/yDid+WiN3BaWAqYKQWNZ/dauf1CAfFF1o=;
        fh=FnpNaEs7ZBq56/QlUA2bXulYV7BZWdOFZjGg77Ohe5s=;
        b=Tvtg1HSRNiZ1aKTowSv7G+7XqdC6c/JMlTbAGhmVMVssfYE3nVhkg13dOHR+gr/GWP
         3Of8PWwSXIn741yCrK7kT6O7+Vrcg8qfP1TeWJSx13zyVJ9h5uuucts2lU6Qw3uWu0k7
         2DxCtPgHx0akbh+WTzdpGa9YRrMf9s089oFJT/qxms3wz+RlZERWMKxVT9Dnv5SnlEH5
         Q/nsTAegV5K+WUgMomfDfTd/43aexOCNr4WL3e0Lo71b0Y/l8VMZjQOJf4FYMgSX2p/I
         f8SCiPV2SjYfsoWDWZGZjNNCPt6Wo3/+6QrEbz5nVBsv9WBUb7VUOskQHusdZOeSJMhc
         xq7g==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id z11-20020a05620a08cb00b00783871a5064si5344695qkz.711.2024.01.22.04.38.55
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 04:38:55 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-263-0IFqv_CWNcezFVgf-WIqKg-1; Mon,
 22 Jan 2024 07:38:54 -0500
X-MC-Unique: 0IFqv_CWNcezFVgf-WIqKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1C4B28C976A
	for <linux-cachefs@gapps.redhat.com>; Mon, 22 Jan 2024 12:38:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id DEA39111E40C; Mon, 22 Jan 2024 12:38:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0330D111E408;
	Mon, 22 Jan 2024 12:38:51 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>
Cc: David Howells <dhowells@redhat.com>,
	Jeff Layton <jlayton@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	netfs@lists.linux.dev,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-cachefs@redhat.com
Subject: [PATCH 01/10] netfs: Don't use certain internal folio_*() functions
Date: Mon, 22 Jan 2024 12:38:34 +0000
Message-ID: <20240122123845.3822570-2-dhowells@redhat.com>
In-Reply-To: <20240122123845.3822570-1-dhowells@redhat.com>
References: <20240122123845.3822570-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
index 93dc76f34e39..e7f9ba6fb16b 100644
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

