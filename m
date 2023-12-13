Return-Path: <linux-cachefs+bncBDLIXLMFVAERBGMZ46VQMGQEK2GYYTA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F12811622
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:24:11 +0100 (CET)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-58d11a85f90sf8608473eaf.3
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:24:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481050; cv=pass;
        d=google.com; s=arc-20160816;
        b=crHAiYzmi3zfuRcGsGyRFJY9xodJf6CTtaXYnhsphwDlcuf9aieUdemt3iu8oezmWy
         cV8zqUNMXo1jvvp/c516/YnfV64W5jY7bFtr5VALKxq9YxruxgmKP8sR/zPLDmvhhh5k
         oB8a5rERYpgvyXyNUOQtod9Z4OG7WnkHI68ZlGCkOT8w5NO0Nj6znLCeu980XZGmLRPd
         69525I0MAFA9BmhWaLNTN/aqqTg1rPEnTxobueoUXsjj/Sj4VRnDgI91YVW7VBOfVq5D
         GzWZ52bLX/aqdPtBRIkorJIxYT2lBd28YU+BWpGzJaAgxyI/Gdny5XxCenKCDwnbYesm
         yDGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=DtruUFso9W1IPundLbPEG5PUkpoV3JpyqvuizYylZQE=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=V/xmI/T6Afn+6g/+yujMhrQ5xX+xAvsARC54ATFpDnNkfJcR0Hur1CJEgoiqIJBD4W
         F72fx1MiBBC9Aw19GJXWiS/sPsRraD9i3ZRKxGVkx/tE9OcYqZxNsYJwZkirBvFkgf+Q
         +v9Kpbyp2CZ1LZZzZbNb+Dos2X02hEnoyRZEM6g+ZBAyrlYuYGTF8EcZTnhNYDJmQSMc
         47UdBGdWkCARXv5aW8lOmnit7CKAcLZvzBlHxN3Sdiy164HOBh0yS9BfAE6y2Jkwn+Hm
         u3xYlk9tBHwmGRDQwewEKzOFKuisjCfohRQIiOCfOafoR5dYJGQfmwa//7RfUJIkf1Gp
         0atA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481050; x=1703085850;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtruUFso9W1IPundLbPEG5PUkpoV3JpyqvuizYylZQE=;
        b=a0flNqP86Jq7kUoH0JlKXAEc0ga5ljkgt/y1jHZdDwVn7aTvq6WiVBO2dqEJN9NjiN
         ONDk7w0AxOXkCXCnjFpg63Um8owB7CQdjUhPsLg9sy2sQtRRSx5u+d4NW1rNcn3ynJvD
         mF75pHkziS1VvdGAmwS02yC5xIXIiY+SYfP35Of+UWpg/ySZodApeJ//THIsN+MW0i04
         xjYbq1K71Wdh3730V5wXsgsPxvt+g3ysH06vmNjflIYqgfWNRwuEzN/H8hxCFyQPyw0v
         ECDo7+8Cw/M+xpRBbyVExB4Ub03V+Xjf242kjGZnzcwHDIVXw+iBlNDH1mOFneFIceR3
         NuGg==
X-Gm-Message-State: AOJu0YzuVEYPpj4oRYr+zrGP4QG/4W6XLCT2tlijyWJRFhTrVkOT/xu/
	Tcl8qECcLqUv8Ch6fa95ecFYuQ==
X-Google-Smtp-Source: AGHT+IEhnBeV/bP5TWIyMVSomQWPAq7xVqsYdJmjwvhLqq90+mjRF6701vFM6i/WtjREHKUwJJmO0w==
X-Received: by 2002:a05:6358:7201:b0:16d:fcf8:ea7 with SMTP id h1-20020a056358720100b0016dfcf80ea7mr9141786rwa.16.1702481049781;
        Wed, 13 Dec 2023 07:24:09 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:ee26:0:b0:67a:b34a:6626 with SMTP id l6-20020a0cee26000000b0067ab34a6626ls1858532qvs.0.-pod-prod-05-us;
 Wed, 13 Dec 2023 07:24:09 -0800 (PST)
X-Received: by 2002:a05:6214:189:b0:67a:a721:cb16 with SMTP id q9-20020a056214018900b0067aa721cb16mr7393084qvr.119.1702481049185;
        Wed, 13 Dec 2023 07:24:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481049; cv=none;
        d=google.com; s=arc-20160816;
        b=eAUQdWkmPztEKzC7P+4KI+ilf49JtyCbzXGII/M6yjlAEsospSLip/bO+C8wCTfnuo
         dRjkQsSKK6j6qGVyrrsjSUPe+NT6XogpcYCcR5FcvprmCkydnKcB2YY2KrDCskwye7i5
         Tn/yiQSGGntm2rQbexTHzPESeL7d85YrHLQb2T2Hz8IRP1VXKVXEgKu9Rb1cUBHbQTeu
         IwjLeIIDglvJg6TMtIVxcQOzMJabG8DvS7uwx0PISC8pP+o+v/OEn/wdmY5GNCnyuV3l
         ZT/J7XBlhf+O4KqQJnicsm1N4ZyW5mthLiSAGqGTDU72Eji5Zo+Lh6ag4SwKkFISf4HE
         4wog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=OcMZgNlV77xdSoN3X7eszXopt58ZURHGiYs5iCbwsVE=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=NcZe7au/gIO+jvBdazs7PHNdYpgkf0KBZO/0Z5Mdeuo/H+I3yvi9djo079j+IlopQi
         U2LMX1GUm1vhIQqPmiVooKUcrGxpoqokNgn4GqJ8ZO3ARlNZrPPRsFGUpSexw+SmEATE
         ahneUbZ8HdRVjmd52K1hVcc2xTs2mPZG5ffEVYLsmfA2aPIzUD76+fV2CZgtkahtJqqm
         +Qi2ZlvRXS9V1CDqgxF6NxnQJPKCV67Rsr6tlyDTnWVtTQWHaHR7LqynEMyNJHyiTUum
         pqN/d1GYFE9IxsOpuepeTQ8DyKWjZ7CnL9Z+WWZ+Gweg1lvMhURR+ptZWQZCAdT2dSTh
         LIeg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id u17-20020a0cdd11000000b0067aa75148d6si52193qvk.588.2023.12.13.07.24.09
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:24:09 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-xlzwCmUFMZiiFa6FYsaTdw-1; Wed, 13 Dec 2023 10:24:07 -0500
X-MC-Unique: xlzwCmUFMZiiFa6FYsaTdw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D636101AA45
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:24:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 586691C060B3; Wed, 13 Dec 2023 15:24:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B8341C060B1;
	Wed, 13 Dec 2023 15:24:04 +0000 (UTC)
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
Subject: [PATCH v4 03/39] netfs, fscache: Remove ->begin_cache_operation
Date: Wed, 13 Dec 2023 15:23:13 +0000
Message-ID: <20231213152350.431591-4-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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

Remove ->begin_cache_operation() in favour of just calling fscache directly.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: Christian Brauner <christian@brauner.io>
cc: linux-fsdevel@vger.kernel.org
cc: linux-cachefs@redhat.com
---
 Documentation/filesystems/netfs_library.rst | 23 +++-----------
 fs/9p/vfs_addr.c                            | 16 ----------
 fs/afs/file.c                               | 13 --------
 fs/ceph/addr.c                              |  1 -
 fs/ceph/cache.h                             | 12 --------
 fs/netfs/buffered_read.c                    | 33 +++++++++++----------
 fs/nfs/fscache.c                            |  7 -----
 include/linux/fscache.h                     |  3 --
 include/linux/netfs.h                       |  4 +--
 9 files changed, 23 insertions(+), 89 deletions(-)

diff --git a/Documentation/filesystems/netfs_library.rst b/Documentation/filesystems/netfs_library.rst
index 48b95d04f72d..4cc657d743f7 100644
--- a/Documentation/filesystems/netfs_library.rst
+++ b/Documentation/filesystems/netfs_library.rst
@@ -295,7 +295,6 @@ through which it can issue requests and negotiate::
 	struct netfs_request_ops {
 		void (*init_request)(struct netfs_io_request *rreq, struct file *file);
 		void (*free_request)(struct netfs_io_request *rreq);
-		int (*begin_cache_operation)(struct netfs_io_request *rreq);
 		void (*expand_readahead)(struct netfs_io_request *rreq);
 		bool (*clamp_length)(struct netfs_io_subrequest *subreq);
 		void (*issue_read)(struct netfs_io_subrequest *subreq);
@@ -317,20 +316,6 @@ The operations are as follows:
    [Optional] This is called as the request is being deallocated so that the
    filesystem can clean up any state it has attached there.
 
- * ``begin_cache_operation()``
-
-   [Optional] This is called to ask the network filesystem to call into the
-   cache (if present) to initialise the caching state for this read.  The netfs
-   library module cannot access the cache directly, so the cache should call
-   something like fscache_begin_read_operation() to do this.
-
-   The cache gets to store its state in ->cache_resources and must set a table
-   of operations of its own there (though of a different type).
-
-   This should return 0 on success and an error code otherwise.  If an error is
-   reported, the operation may proceed anyway, just without local caching (only
-   out of memory and interruption errors cause failure here).
-
  * ``expand_readahead()``
 
    [Optional] This is called to allow the filesystem to expand the size of a
@@ -460,14 +445,14 @@ When implementing a local cache to be used by the read helpers, two things are
 required: some way for the network filesystem to initialise the caching for a
 read request and a table of operations for the helpers to call.
 
-The network filesystem's ->begin_cache_operation() method is called to set up a
-cache and this must call into the cache to do the work.  If using fscache, for
-example, the cache would call::
+To begin a cache operation on an fscache object, the following function is
+called::
 
 	int fscache_begin_read_operation(struct netfs_io_request *rreq,
 					 struct fscache_cookie *cookie);
 
-passing in the request pointer and the cookie corresponding to the file.
+passing in the request pointer and the cookie corresponding to the file.  This
+fills in the cache resources mentioned below.
 
 The netfs_io_request object contains a place for the cache to hang its
 state::
diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 8a635999a7d6..39db7c01e30a 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -82,25 +82,9 @@ static void v9fs_free_request(struct netfs_io_request *rreq)
 	p9_fid_put(fid);
 }
 
-/**
- * v9fs_begin_cache_operation - Begin a cache operation for a read
- * @rreq: The read request
- */
-static int v9fs_begin_cache_operation(struct netfs_io_request *rreq)
-{
-#ifdef CONFIG_9P_FSCACHE
-	struct fscache_cookie *cookie = v9fs_inode_cookie(V9FS_I(rreq->inode));
-
-	return fscache_begin_read_operation(&rreq->cache_resources, cookie);
-#else
-	return -ENOBUFS;
-#endif
-}
-
 const struct netfs_request_ops v9fs_req_ops = {
 	.init_request		= v9fs_init_request,
 	.free_request		= v9fs_free_request,
-	.begin_cache_operation	= v9fs_begin_cache_operation,
 	.issue_read		= v9fs_issue_read,
 };
 
diff --git a/fs/afs/file.c b/fs/afs/file.c
index 30914e0d9cb2..0326ae21fbea 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -363,18 +363,6 @@ static int afs_init_request(struct netfs_io_request *rreq, struct file *file)
 	return 0;
 }
 
-static int afs_begin_cache_operation(struct netfs_io_request *rreq)
-{
-#ifdef CONFIG_AFS_FSCACHE
-	struct afs_vnode *vnode = AFS_FS_I(rreq->inode);
-
-	return fscache_begin_read_operation(&rreq->cache_resources,
-					    afs_vnode_cache(vnode));
-#else
-	return -ENOBUFS;
-#endif
-}
-
 static int afs_check_write_begin(struct file *file, loff_t pos, unsigned len,
 				 struct folio **foliop, void **_fsdata)
 {
@@ -391,7 +379,6 @@ static void afs_free_request(struct netfs_io_request *rreq)
 const struct netfs_request_ops afs_req_ops = {
 	.init_request		= afs_init_request,
 	.free_request		= afs_free_request,
-	.begin_cache_operation	= afs_begin_cache_operation,
 	.check_write_begin	= afs_check_write_begin,
 	.issue_read		= afs_issue_read,
 };
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 13af429ab030..654f408a0aca 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -509,7 +509,6 @@ static void ceph_netfs_free_request(struct netfs_io_request *rreq)
 const struct netfs_request_ops ceph_netfs_ops = {
 	.init_request		= ceph_init_request,
 	.free_request		= ceph_netfs_free_request,
-	.begin_cache_operation	= ceph_begin_cache_operation,
 	.issue_read		= ceph_netfs_issue_read,
 	.expand_readahead	= ceph_netfs_expand_readahead,
 	.clamp_length		= ceph_netfs_clamp_length,
diff --git a/fs/ceph/cache.h b/fs/ceph/cache.h
index dc502daac49a..b804f1094764 100644
--- a/fs/ceph/cache.h
+++ b/fs/ceph/cache.h
@@ -57,13 +57,6 @@ static inline int ceph_fscache_dirty_folio(struct address_space *mapping,
 	return fscache_dirty_folio(mapping, folio, ceph_fscache_cookie(ci));
 }
 
-static inline int ceph_begin_cache_operation(struct netfs_io_request *rreq)
-{
-	struct fscache_cookie *cookie = ceph_fscache_cookie(ceph_inode(rreq->inode));
-
-	return fscache_begin_read_operation(&rreq->cache_resources, cookie);
-}
-
 static inline bool ceph_is_cache_enabled(struct inode *inode)
 {
 	return fscache_cookie_enabled(ceph_fscache_cookie(ceph_inode(inode)));
@@ -135,11 +128,6 @@ static inline bool ceph_is_cache_enabled(struct inode *inode)
 	return false;
 }
 
-static inline int ceph_begin_cache_operation(struct netfs_io_request *rreq)
-{
-	return -ENOBUFS;
-}
-
 static inline void ceph_fscache_note_page_release(struct inode *inode)
 {
 }
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 2cd3ccf4c439..d39d0ffe75d2 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -147,6 +147,15 @@ static void netfs_rreq_expand(struct netfs_io_request *rreq,
 	}
 }
 
+/*
+ * Begin an operation, and fetch the stored zero point value from the cookie if
+ * available.
+ */
+static int netfs_begin_cache_read(struct netfs_io_request *rreq, struct netfs_inode *ctx)
+{
+	return fscache_begin_read_operation(&rreq->cache_resources, netfs_i_cookie(ctx));
+}
+
 /**
  * netfs_readahead - Helper to manage a read request
  * @ractl: The description of the readahead request
@@ -180,11 +189,9 @@ void netfs_readahead(struct readahead_control *ractl)
 	if (IS_ERR(rreq))
 		return;
 
-	if (ctx->ops->begin_cache_operation) {
-		ret = ctx->ops->begin_cache_operation(rreq);
-		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
-			goto cleanup_free;
-	}
+	ret = netfs_begin_cache_read(rreq, ctx);
+	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
+		goto cleanup_free;
 
 	netfs_stat(&netfs_n_rh_readahead);
 	trace_netfs_read(rreq, readahead_pos(ractl), readahead_length(ractl),
@@ -238,11 +245,9 @@ int netfs_read_folio(struct file *file, struct folio *folio)
 		goto alloc_error;
 	}
 
-	if (ctx->ops->begin_cache_operation) {
-		ret = ctx->ops->begin_cache_operation(rreq);
-		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
-			goto discard;
-	}
+	ret = netfs_begin_cache_read(rreq, ctx);
+	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
+		goto discard;
 
 	netfs_stat(&netfs_n_rh_readpage);
 	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
@@ -390,11 +395,9 @@ int netfs_write_begin(struct netfs_inode *ctx,
 	rreq->no_unlock_folio	= folio_index(folio);
 	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
 
-	if (ctx->ops->begin_cache_operation) {
-		ret = ctx->ops->begin_cache_operation(rreq);
-		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
-			goto error_put;
-	}
+	ret = netfs_begin_cache_read(rreq, ctx);
+	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
+		goto error_put;
 
 	netfs_stat(&netfs_n_rh_write_begin);
 	trace_netfs_read(rreq, pos, len, netfs_read_trace_write_begin);
diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index b05717fe0d4e..2d1bfee225c3 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -274,12 +274,6 @@ static void nfs_netfs_free_request(struct netfs_io_request *rreq)
 	put_nfs_open_context(rreq->netfs_priv);
 }
 
-static inline int nfs_netfs_begin_cache_operation(struct netfs_io_request *rreq)
-{
-	return fscache_begin_read_operation(&rreq->cache_resources,
-					    netfs_i_cookie(netfs_inode(rreq->inode)));
-}
-
 static struct nfs_netfs_io_data *nfs_netfs_alloc(struct netfs_io_subrequest *sreq)
 {
 	struct nfs_netfs_io_data *netfs;
@@ -387,7 +381,6 @@ void nfs_netfs_read_completion(struct nfs_pgio_header *hdr)
 const struct netfs_request_ops nfs_netfs_ops = {
 	.init_request		= nfs_netfs_init_request,
 	.free_request		= nfs_netfs_free_request,
-	.begin_cache_operation	= nfs_netfs_begin_cache_operation,
 	.issue_read		= nfs_netfs_issue_read,
 	.clamp_length		= nfs_netfs_clamp_length
 };
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 8e312c8323a8..9ed6696aee7a 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -437,9 +437,6 @@ const struct netfs_cache_ops *fscache_operation_valid(const struct netfs_cache_r
  * indicates the cache resources to which the operation state should be
  * attached; @cookie indicates the cache object that will be accessed.
  *
- * This is intended to be called from the ->begin_cache_operation() netfs lib
- * operation as implemented by the network filesystem.
- *
  * @cres->inval_counter is set from @cookie->inval_counter for comparison at
  * the end of the operation.  This allows invalidation during the operation to
  * be detected by the caller.
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index b11a84f6c32b..d294ff8f9ae4 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -208,7 +208,6 @@ struct netfs_io_request {
 struct netfs_request_ops {
 	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
 	void (*free_request)(struct netfs_io_request *rreq);
-	int (*begin_cache_operation)(struct netfs_io_request *rreq);
 
 	void (*expand_readahead)(struct netfs_io_request *rreq);
 	bool (*clamp_length)(struct netfs_io_subrequest *subreq);
@@ -229,8 +228,7 @@ enum netfs_read_from_hole {
 };
 
 /*
- * Table of operations for access to a cache.  This is obtained by
- * rreq->ops->begin_cache_operation().
+ * Table of operations for access to a cache.
  */
 struct netfs_cache_ops {
 	/* End an operation */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

