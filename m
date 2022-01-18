Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A23492784
	for <lists+linux-cachefs@lfdr.de>; Tue, 18 Jan 2022 14:53:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642514004;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZRuDqzb5D9SMhbiTirLAGHgcLLcTD4e7/j7VyMvsulU=;
	b=dcFDH9qSkDvtY5ZTxj6exM4+e2tSFIjOF6/s+8GUwmPO4ZAnu1lFFtjq9CCyFlalxOzgvR
	a6Q6lbGAd0eDMz0FzfqsCdD3Q3LuvvOU0JuHD6Je5kOKL17TJB3BVQF0h8z0xs5kZWaueB
	PEmLa0ypvhD8KdBx9oOhDPqW5VH/mGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-W1SRyydVNpy1aQHGTPPlNw-1; Tue, 18 Jan 2022 08:53:21 -0500
X-MC-Unique: W1SRyydVNpy1aQHGTPPlNw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17ED6101AFCD;
	Tue, 18 Jan 2022 13:53:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 456517A418;
	Tue, 18 Jan 2022 13:53:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1E1D4BB7C;
	Tue, 18 Jan 2022 13:53:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IDrDun014009 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 08:53:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DEE11798B1; Tue, 18 Jan 2022 13:53:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 686FD798DA;
	Tue, 18 Jan 2022 13:53:10 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Tue, 18 Jan 2022 13:53:09 +0000
Message-ID: <164251398954.3435901.7138806620218474123.stgit@warthog.procyon.org.uk>
In-Reply-To: <164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
References: <164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <smfrench@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	v9fs-developer@lists.sourceforge.net
Subject: [Linux-cachefs] [PATCH 02/11] cachefiles: Calculate the blockshift
 in terms of bytes, not pages
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Cachefiles keeps track of how much space is available on the backing
filesystem and refuses new writes permission to start if there isn't enough
(we especially don't want ENOSPC happening).  It also tracks the amount of
data pending in DIO writes (cache->b_writing) and reduces the amount of
free space available by this amount before deciding if it can set up a new
write.

However, the old fscache I/O API was very much page-granularity dependent
and, as such, cachefiles's cache->bshift was meant to be a multiplier to
get from PAGE_SIZE to block size (ie. a blocksize of 512 would give a shift
of 3 for a 4KiB page) - and this was incorrectly being used to turn the
number of bytes in a DIO write into a number of blocks, leading to a
massive over estimation of the amount of data in flight.

Fix this by changing cache->bshift to be a multiplier from bytes to
blocksize and deal with quantities of blocks, not quantities of pages.

Fix also the rounding in the calculation in cachefiles_write() which needs
a "- 1" inserting.

Fixes: 047487c947e8 ("cachefiles: Implement the I/O routines")
Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/cachefiles/cache.c    |    7 ++-----
 fs/cachefiles/internal.h |    2 +-
 fs/cachefiles/io.c       |    2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/cachefiles/cache.c b/fs/cachefiles/cache.c
index ce4d4785003c..1e9c71666c6a 100644
--- a/fs/cachefiles/cache.c
+++ b/fs/cachefiles/cache.c
@@ -84,9 +84,7 @@ int cachefiles_add_cache(struct cachefiles_cache *cache)
 		goto error_unsupported;
 
 	cache->bsize = stats.f_bsize;
-	cache->bshift = 0;
-	if (stats.f_bsize < PAGE_SIZE)
-		cache->bshift = PAGE_SHIFT - ilog2(stats.f_bsize);
+	cache->bshift = ilog2(stats.f_bsize);
 
 	_debug("blksize %u (shift %u)",
 	       cache->bsize, cache->bshift);
@@ -106,7 +104,6 @@ int cachefiles_add_cache(struct cachefiles_cache *cache)
 	       (unsigned long long) cache->fcull,
 	       (unsigned long long) cache->fstop);
 
-	stats.f_blocks >>= cache->bshift;
 	do_div(stats.f_blocks, 100);
 	cache->bstop = stats.f_blocks * cache->bstop_percent;
 	cache->bcull = stats.f_blocks * cache->bcull_percent;
@@ -209,7 +206,7 @@ int cachefiles_has_space(struct cachefiles_cache *cache,
 		return ret;
 	}
 
-	b_avail = stats.f_bavail >> cache->bshift;
+	b_avail = stats.f_bavail;
 	b_writing = atomic_long_read(&cache->b_writing);
 	if (b_avail > b_writing)
 		b_avail -= b_writing;
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 8dd54d9375b6..c793d33b0224 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -86,7 +86,7 @@ struct cachefiles_cache {
 	unsigned			bcull_percent;	/* when to start culling (% blocks) */
 	unsigned			bstop_percent;	/* when to stop allocating (% blocks) */
 	unsigned			bsize;		/* cache's block size */
-	unsigned			bshift;		/* min(ilog2(PAGE_SIZE / bsize), 0) */
+	unsigned			bshift;		/* ilog2(bsize) */
 	uint64_t			frun;		/* when to stop culling */
 	uint64_t			fcull;		/* when to start culling */
 	uint64_t			fstop;		/* when to stop allocating */
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 60b1eac2ce78..04eb52736990 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -264,7 +264,7 @@ static int cachefiles_write(struct netfs_cache_resources *cres,
 	ki->term_func		= term_func;
 	ki->term_func_priv	= term_func_priv;
 	ki->was_async		= true;
-	ki->b_writing		= (len + (1 << cache->bshift)) >> cache->bshift;
+	ki->b_writing		= (len + (1 << cache->bshift) - 1) >> cache->bshift;
 
 	if (ki->term_func)
 		ki->iocb.ki_complete = cachefiles_write_complete;


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

