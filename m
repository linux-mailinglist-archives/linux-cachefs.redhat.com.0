Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1A443209E
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 16:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634568891;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3dNp+OXnSbSx7TinTlHtmrCbNjvG5yH+z5qdoHoYMAw=;
	b=aiIpwTE6zuyUBBWLVIH15rtgYQdbA+nyEGdiuAnJCinR2fjCNtuq7t0zHBtXPUzPvTrtMR
	HS6SAiMefyBmFz4GdFW3cXP2siI5Ci6tZAFMEh7/CTT9g9W2dU8qNWDGNl9Ar8hJkpwmGU
	AR4wsnYgDLJ/pm9AL9WkSSB5YgSsitY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-ATIGk4gUNmqWuVdCTOLvog-1; Mon, 18 Oct 2021 10:54:48 -0400
X-MC-Unique: ATIGk4gUNmqWuVdCTOLvog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FBDA802682;
	Mon, 18 Oct 2021 14:54:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02E9D5DF21;
	Mon, 18 Oct 2021 14:54:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF62B180BAD1;
	Mon, 18 Oct 2021 14:54:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IEshGu027999 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 10:54:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3D1445DF56; Mon, 18 Oct 2021 14:54:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F03675DF21;
	Mon, 18 Oct 2021 14:54:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 15:54:39 +0100
Message-ID: <163456887921.2614702.840718814028578881.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH 15/67] fscache: Disable
	fscache_begin_operation()
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

Disable fscache_begin_operation() so that the operation manager can be
removed and replaced.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/io.c |   13 ++++++++++++-
 fs/fscache/io.c    |    2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 5ead97de4bb7..4cc57be88f37 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -271,6 +271,7 @@ static int cachefiles_write(struct netfs_cache_resources *cres,
 static enum netfs_read_source cachefiles_prepare_read(struct netfs_read_subrequest *subreq,
 						      loff_t i_size)
 {
+#if 0
 	struct fscache_operation *op = subreq->rreq->cache_resources.cache_priv;
 	struct cachefiles_object *object;
 	struct cachefiles_cache *cache;
@@ -335,6 +336,9 @@ static enum netfs_read_source cachefiles_prepare_read(struct netfs_read_subreque
 out:
 	cachefiles_end_secure(cache, saved_cred);
 	return ret;
+#endif
+	return subreq->start >= i_size ?
+		NETFS_FILL_WITH_ZEROES : NETFS_DOWNLOAD_FROM_SERVER;
 }
 
 /*
@@ -359,6 +363,7 @@ static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
 static int cachefiles_prepare_fallback_write(struct netfs_cache_resources *cres,
 					     pgoff_t index)
 {
+#if 0
 	struct fscache_operation *op = cres->cache_priv;
 	struct cachefiles_object *object;
 	struct cachefiles_cache *cache;
@@ -369,6 +374,8 @@ static int cachefiles_prepare_fallback_write(struct netfs_cache_resources *cres,
 	cache = container_of(object->fscache.cache,
 			     struct cachefiles_cache, cache);
 	return cachefiles_has_space(cache, 0, 1);
+#endif
+	return -ENOBUFS;
 }
 
 /*
@@ -376,6 +383,7 @@ static int cachefiles_prepare_fallback_write(struct netfs_cache_resources *cres,
  */
 static void cachefiles_end_operation(struct netfs_cache_resources *cres)
 {
+#if 0
 	struct fscache_operation *op = cres->cache_priv;
 	struct file *file = cres->cache_priv2;
 
@@ -387,8 +395,8 @@ static void cachefiles_end_operation(struct netfs_cache_resources *cres)
 		fscache_op_complete(op, false);
 		fscache_put_operation(op);
 	}
-
 	_leave("");
+#endif
 }
 
 static const struct netfs_cache_ops cachefiles_netfs_cache_ops = {
@@ -406,6 +414,7 @@ static const struct netfs_cache_ops cachefiles_netfs_cache_ops = {
 int cachefiles_begin_operation(struct netfs_cache_resources *cres,
 			       struct fscache_operation *op)
 {
+#if 0
 	struct cachefiles_object *object;
 	struct cachefiles_cache *cache;
 	struct path path;
@@ -441,5 +450,7 @@ int cachefiles_begin_operation(struct netfs_cache_resources *cres,
 
 error_file:
 	fput(file);
+#endif
+	cres->ops = &cachefiles_netfs_cache_ops;
 	return -EIO;
 }
diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index 7ac34c2e45fe..2547892a6064 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -31,6 +31,7 @@ int __fscache_begin_operation(struct netfs_cache_resources *cres,
 			      struct fscache_cookie *cookie,
 			      bool for_write)
 {
+#if 0
 	struct fscache_operation *op;
 	struct fscache_object *object;
 	bool wake_cookie = false;
@@ -144,6 +145,7 @@ int __fscache_begin_operation(struct netfs_cache_resources *cres,
 		fscache_stat(&fscache_n_stores_nobufs);
 	else
 		fscache_stat(&fscache_n_retrievals_nobufs);
+#endif
 	_leave(" = -ENOBUFS");
 	return -ENOBUFS;
 }


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

