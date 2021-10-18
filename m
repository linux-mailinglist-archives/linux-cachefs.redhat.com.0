Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C4443212D
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 17:00:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569199;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sjKo6pM9SgpQFiAbtS8Zj7aYWi+MlQCHErF9eaiHJls=;
	b=AlPgH0+4OVAS7xwWZBxC5loN14OOC8bq4Dc7D25rCwcQHJaqG2CwNncBM1K/js659/i5TX
	d3HL8JGcqwKht+FgEr2O0kUnbHSfc8CQ1qLz9VM5vB1EJ0ufsvLM6rKHelEs87mEw9R7Q6
	a5+MPMWFyO8IGCkbHIzP8Zn5Met2r9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-2Oy2kR0zO16wT_DzwpmmPQ-1; Mon, 18 Oct 2021 10:59:56 -0400
X-MC-Unique: 2Oy2kR0zO16wT_DzwpmmPQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 362E0802682;
	Mon, 18 Oct 2021 14:59:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28A4B102ADE5;
	Mon, 18 Oct 2021 14:59:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 154B74EA2F;
	Mon, 18 Oct 2021 14:59:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IExqOh028973 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 10:59:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B3021037F38; Mon, 18 Oct 2021 14:59:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 728301037F36;
	Mon, 18 Oct 2021 14:59:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 15:59:48 +0100
Message-ID: <163456918862.2614702.15568944072409008939.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Subject: [Linux-cachefs] [PATCH 34/67] cachefiles: Make
 cachefiles_write_prepare() check for space
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make the cachefiles_write_prepare() function check that there's sufficient
space to fully satisfy a proposed write.

If we already checked for allocated data during read preparation, then this
fact can be used to skip the more thorough checks here.

If there's enough space in the cache, we just allow the write.

If we're uncertain, then we use SEEK_DATA/SEEK_HOLE to check if the block
is already fully allocated - and if it is, we just allow the write.

However, if there's insufficient space for the whole write and there's
partially allocated data in the file, we punch out that data and disallow
the write.  This frees up some space and removes old data from the cache.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/io.c     |   82 ++++++++++++++++++++++++++++++++++++++++++++----
 fs/netfs/read_helper.c |    2 +
 include/linux/netfs.h  |    3 +-
 3 files changed, 79 insertions(+), 8 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index c05f64cdfd0e..350243b45dd5 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/file.h>
 #include <linux/uio.h>
+#include <linux/falloc.h>
 #include <linux/sched/mm.h>
 #include <trace/events/fscache.h>
 #include "internal.h"
@@ -385,8 +386,7 @@ static enum netfs_read_source cachefiles_prepare_read(struct netfs_read_subreque
 	goto out;
 
 download_and_store:
-	if (cachefiles_has_space(cache, 0, (subreq->len + PAGE_SIZE - 1) / PAGE_SIZE) == 0)
-		__set_bit(NETFS_SREQ_WRITE_TO_CACHE, &subreq->flags);
+	__set_bit(NETFS_SREQ_WRITE_TO_CACHE, &subreq->flags);
 out:
 	cachefiles_end_secure(cache, saved_cred);
 out_no_object:
@@ -397,17 +397,87 @@ static enum netfs_read_source cachefiles_prepare_read(struct netfs_read_subreque
 /*
  * Prepare for a write to occur.
  */
-static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
-				    loff_t *_start, size_t *_len, loff_t i_size)
+static int __cachefiles_prepare_write(struct netfs_cache_resources *cres,
+				      loff_t *_start, size_t *_len, loff_t i_size,
+				      bool no_space_allocated_yet)
 {
-	loff_t start = *_start;
+	struct cachefiles_object *object = cachefiles_cres_object(cres);
+	struct cachefiles_cache *cache = object->volume->cache;
+	struct file *file = cachefiles_cres_file(cres);
+	loff_t start = *_start, pos;
 	size_t len = *_len, down;
+	int ret;
 
 	/* Round to DIO size */
 	down = start - round_down(start, PAGE_SIZE);
 	*_start = start - down;
 	*_len = round_up(down + len, PAGE_SIZE);
-	return 0;
+
+	/* We need to work out whether there's sufficient disk space to perform
+	 * the write - but we can skip that check if we have space already
+	 * allocated.
+	 */
+	if (no_space_allocated_yet)
+		goto check_space;
+
+	pos = vfs_llseek(file, *_start, SEEK_DATA);
+	if (pos < 0 && pos >= (loff_t)-MAX_ERRNO) {
+		if (pos == -ENXIO)
+			goto check_space; /* Unallocated tail */
+		return pos;
+	}
+	if ((u64)pos >= (u64)*_start + *_len)
+		goto check_space; /* Unallocated region */
+
+	/* We have a block that's at least partially filled - if we're low on
+	 * space, we need to see if it's fully allocated.  If it's not, we may
+	 * want to cull it.
+	 */
+	if (cachefiles_has_space(cache, 0, *_len / PAGE_SIZE) == 0)
+		return 0; /* Enough space to simply overwrite the whole block */
+
+	pos = vfs_llseek(file, *_start, SEEK_HOLE);
+	if (pos < 0 && pos >= (loff_t)-MAX_ERRNO)
+		return pos;
+	if ((u64)pos >= (u64)*_start + *_len)
+		return 0; /* Fully allocated */
+
+	/* Partially allocated, but insufficient space: cull. */
+	ret = vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
+			    *_start, *_len);
+	if (ret < 0) {
+		cachefiles_io_error_obj(object,
+					"CacheFiles: fallocate failed (%d)\n", ret);
+		ret = -EIO;
+	}
+
+	return ret;
+
+check_space:
+	return cachefiles_has_space(cache, 0, *_len / PAGE_SIZE);
+}
+
+static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
+				    loff_t *_start, size_t *_len, loff_t i_size,
+				    bool no_space_allocated_yet)
+{
+	struct cachefiles_object *object = cachefiles_cres_object(cres);
+	struct cachefiles_cache *cache = object->volume->cache;
+	const struct cred *saved_cred;
+	int ret;
+
+	if (!cachefiles_cres_file(cres)) {
+		if (!fscache_wait_for_operation(cres, FSCACHE_WANT_WRITE))
+			return -ENOBUFS;
+		if (!cachefiles_cres_file(cres))
+			return -ENOBUFS;
+	}
+
+	cachefiles_begin_secure(cache, &saved_cred);
+	ret = __cachefiles_prepare_write(cres, _start, _len, i_size,
+					 no_space_allocated_yet);
+	cachefiles_end_secure(cache, saved_cred);
+	return ret;
 }
 
 /*
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index dfc60c79a9f3..80f8e334371d 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -323,7 +323,7 @@ static void netfs_rreq_do_write_to_cache(struct netfs_read_request *rreq)
 		}
 
 		ret = cres->ops->prepare_write(cres, &subreq->start, &subreq->len,
-					       rreq->i_size);
+					       rreq->i_size, true);
 		if (ret < 0) {
 			trace_netfs_failure(rreq, subreq, ret, netfs_fail_prepare_write);
 			trace_netfs_sreq(subreq, netfs_sreq_trace_write_skip);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 014fb502fd91..99137486d351 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -220,7 +220,8 @@ struct netfs_cache_ops {
 	 * actually do.
 	 */
 	int (*prepare_write)(struct netfs_cache_resources *cres,
-			     loff_t *_start, size_t *_len, loff_t i_size);
+			     loff_t *_start, size_t *_len, loff_t i_size,
+			     bool no_space_allocated_yet);
 
 	/* Prepare a write operation for the fallback fscache API, working out
 	 * whether we can cache a page or not.


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

