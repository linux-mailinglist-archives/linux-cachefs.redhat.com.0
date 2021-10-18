Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B99432169
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 17:01:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569306;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rAM5P113cEi8DhGhyLImW7KvXeRyQJpiqTooJ6c1eNI=;
	b=dUzXFGa8Mh9vgUOkHZd9smVyIl/bT367Z7CJtqwJ8j2lujQ03/YIBDa2gPePL4vR4iTMBT
	grSf19hivsFWO7uZctPJiiGn7xt2av2JAEDnR2C7Gc87GstFnc0MwS51sccPq7NGNP6xn2
	i9I01sxFTbRZAZ72wkorlyfLthspT7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-YE4p1tucOVyCXJvkyocDAg-1; Mon, 18 Oct 2021 11:01:42 -0400
X-MC-Unique: YE4p1tucOVyCXJvkyocDAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46565100CCCE;
	Mon, 18 Oct 2021 15:01:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E6CD79450;
	Mon, 18 Oct 2021 15:01:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCC5F4EA29;
	Mon, 18 Oct 2021 15:01:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IF1btw029332 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 11:01:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AB6B23AEA; Mon, 18 Oct 2021 15:01:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B51751A7E9;
	Mon, 18 Oct 2021 15:01:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 16:01:24 +0100
Message-ID: <163456928482.2614702.6139737560803005640.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH 44/67] fscache: disable cookie when doing an
 invalidation for DIO write
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Jeff Layton <jlayton@kernel.org>

O_DIRECT I/O is probably a good indicator that we don't need to be
caching this file at the moment. Disable the cookie by treating it
as we would a NULL cookie after the invalidation completes. Reenable
when the last unuse is done.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/file.c           |    2 +-
 fs/fscache/cookie.c     |    5 +++++
 include/linux/fscache.h |   15 ++++++++++-----
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 5e29d433960d..5e674a503c1b 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -357,7 +357,7 @@ static bool afs_is_cache_enabled(struct inode *inode)
 {
 	struct fscache_cookie *cookie = afs_vnode_cache(AFS_FS_I(inode));
 
-	return fscache_cookie_valid(cookie) && cookie->cache_priv;
+	return fscache_cookie_enabled(cookie) && cookie->cache_priv;
 }
 
 static int afs_begin_cache_operation(struct netfs_read_request *rreq)
diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 8731188a5ac7..70bfbd269652 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -522,6 +522,7 @@ void __fscache_unuse_cookie(struct fscache_cookie *cookie,
 		__fscache_update_cookie(cookie, aux_data, object_size);
 	cookie->unused_at = jiffies;
 	if (atomic_dec_return(&cookie->n_active) == 0) {
+		clear_bit(FSCACHE_COOKIE_DISABLED, &cookie->flags);
 		if (test_bit(FSCACHE_COOKIE_IS_CACHING, &cookie->flags)) {
 			spin_lock(&fscache_cookie_lru_lock);
 			if (list_empty(&cookie->commit_link)) {
@@ -715,6 +716,10 @@ void __fscache_invalidate(struct fscache_cookie *cookie,
 		 "Trying to invalidate relinquished cookie\n"))
 		return;
 
+	if ((flags & FSCACHE_INVAL_DIO_WRITE) &&
+	    test_and_set_bit(FSCACHE_COOKIE_DISABLED, &cookie->flags))
+		return;
+
 	spin_lock(&cookie->lock);
 	set_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
 	fscache_update_aux(cookie, aux_data, &new_size);
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index a29bd81996ea..08663ad7feed 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -28,12 +28,14 @@
 #define fscache_volume_valid(volume) (volume)
 #define fscache_cookie_valid(cookie) (cookie)
 #define fscache_resources_valid(cres) ((cres)->cache_priv)
+#define fscache_cookie_enabled(cookie) (cookie && !test_bit(FSCACHE_COOKIE_DISABLED, &cookie->flags))
 #else
 #define __fscache_available (0)
 #define fscache_available() (0)
 #define fscache_volume_valid(volume) (0)
 #define fscache_cookie_valid(cookie) (0)
 #define fscache_resources_valid(cres) (false)
+#define fscache_cookie_enabled(cookie) (0)
 #endif
 
 struct fscache_cookie;
@@ -43,6 +45,8 @@ struct fscache_cookie;
 #define FSCACHE_ADV_WRITE_NOCACHE	0x02 /* Don't cache if written to locally */
 #define FSCACHE_ADV_FALLBACK_IO		0x04 /* Going to use the fallback I/O API (dangerous) */
 
+#define FSCACHE_INVAL_DIO_WRITE		0x01 /* Invalidate due to DIO write */
+
 enum fscache_want_stage {
 	FSCACHE_WANT_PARAMS,
 	FSCACHE_WANT_WRITE,
@@ -120,6 +124,7 @@ struct fscache_cookie {
 #define FSCACHE_COOKIE_NO_DATA_TO_READ	3		/* T if this cookie has nothing to read */
 #define FSCACHE_COOKIE_NEEDS_UPDATE	4		/* T if attrs have been updated */
 #define FSCACHE_COOKIE_HAS_BEEN_CACHED	5		/* T if cookie needs withdraw-on-relinq */
+#define FSCACHE_COOKIE_DISABLED		6		/* T if cookie has been disabled */
 #define FSCACHE_COOKIE_NACC_ELEVATED	8		/* T if n_accesses is incremented */
 #define FSCACHE_COOKIE_DO_RELINQUISH	9		/* T if this cookie needs relinquishment */
 #define FSCACHE_COOKIE_DO_WITHDRAW	10		/* T if this cookie needs withdrawing */
@@ -352,7 +357,7 @@ static inline
 void fscache_update_cookie(struct fscache_cookie *cookie, const void *aux_data,
 			   const loff_t *object_size)
 {
-	if (fscache_cookie_valid(cookie))
+	if (fscache_cookie_enabled(cookie))
 		__fscache_update_cookie(cookie, aux_data, object_size);
 }
 
@@ -410,7 +415,7 @@ static inline
 void fscache_invalidate(struct fscache_cookie *cookie,
 			const void *aux_data, loff_t size, unsigned int flags)
 {
-	if (fscache_cookie_valid(cookie))
+	if (fscache_cookie_enabled(cookie))
 		__fscache_invalidate(cookie, aux_data, size, flags);
 }
 
@@ -449,7 +454,7 @@ static inline
 int fscache_begin_read_operation(struct netfs_cache_resources *cres,
 				 struct fscache_cookie *cookie)
 {
-	if (fscache_cookie_valid(cookie))
+	if (fscache_cookie_enabled(cookie))
 		return __fscache_begin_read_operation(cres, cookie);
 	return -ENOBUFS;
 }
@@ -578,7 +583,7 @@ static inline void fscache_clear_inode_writeback(struct fscache_cookie *cookie,
 static inline
 int fscache_fallback_read_page(struct fscache_cookie *cookie, struct page *page)
 {
-	if (fscache_cookie_valid(cookie))
+	if (fscache_cookie_enabled(cookie))
 		return __fscache_fallback_read_page(cookie, page);
 	return -ENOBUFS;
 }
@@ -598,7 +603,7 @@ int fscache_fallback_read_page(struct fscache_cookie *cookie, struct page *page)
 static inline
 int fscache_fallback_write_page(struct fscache_cookie *cookie, struct page *page)
 {
-	if (fscache_cookie_valid(cookie))
+	if (fscache_cookie_enabled(cookie))
 		return __fscache_fallback_write_page(cookie, page);
 	return -ENOBUFS;
 }


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

