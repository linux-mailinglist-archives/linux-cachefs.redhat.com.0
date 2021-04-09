Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3634D35A599
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 20:17:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617992230;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XJgNkyfvquIQ5g2C57VicOeC4wcg4TGmFbN9jhsEon0=;
	b=jWhnA3NvPTdH7EErThZStxapvd+BBPdqRgM6l8hvr4ZhdrHl/0jgqezJH8wWB2bllHe7Va
	T3zCV87NNM8/f54J933LpQ+eWjFL6xL6BU7KOtlbdpwo0vSAyD8Dh3M6JAUreBQhJ5zG+B
	7EYQf98GDl+6ahbzEUoO/1h9laTJV5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-Lj9idTCeOlaUwwJbLmDXTg-1; Fri, 09 Apr 2021 14:17:08 -0400
X-MC-Unique: Lj9idTCeOlaUwwJbLmDXTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A80816415B;
	Fri,  9 Apr 2021 18:17:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 742AB1007610;
	Fri,  9 Apr 2021 18:17:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 032A844A5A;
	Fri,  9 Apr 2021 18:17:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139IBDs2014383 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 14:11:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 070316E523; Fri,  9 Apr 2021 18:11:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-35.rdu2.redhat.com
	[10.10.119.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E08160D79;
	Fri,  9 Apr 2021 18:11:07 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: viro@zeniv.linux.org.uk
Date: Fri, 09 Apr 2021 19:11:06 +0100
Message-ID: <161799186664.847742.14555840742293852768.stgit@warthog.procyon.org.uk>
In-Reply-To: <YG+s0iw5o91KQIlW@zeniv-ca.linux.org.uk>
References: <YG+s0iw5o91KQIlW@zeniv-ca.linux.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, jlayton@kernel.org,
	linux-kernel@vger.kernel.org, willy@infradead.org,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	hch@lst.de
Subject: [Linux-cachefs] [RFC PATCH 2/2] iov_iter: Drop the X argument from
 iterate_all_kinds() and use B instead
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

Drop the X argument from iterate_all_kinds() and use the B argument instead
as it's always the same unless the ITER_XARRAY is handled specially.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 lib/iov_iter.c |   42 ++++++++++++------------------------------
 1 file changed, 12 insertions(+), 30 deletions(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 93e9838c128d..144abdac11db 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -79,8 +79,8 @@
 #define iterate_xarray(i, n, __v, skip, STEP) {		\
 	struct page *head = NULL;				\
 	size_t wanted = n, seg, offset;				\
-	loff_t start = i->xarray_start + skip;			\
-	pgoff_t index = start >> PAGE_SHIFT;			\
+	loff_t xarray_start = i->xarray_start + skip;		\
+	pgoff_t index = xarray_start >> PAGE_SHIFT;		\
 	int j;							\
 								\
 	XA_STATE(xas, i->xarray, index);			\
@@ -113,7 +113,7 @@
 	n = wanted - n;						\
 }
 
-#define iterate_all_kinds(i, n, v, I, B, K, X) {		\
+#define iterate_all_kinds(i, n, v, I, B, K) {			\
 	if (likely(n)) {					\
 		size_t skip = i->iov_offset;			\
 		if (unlikely(i->type & ITER_BVEC)) {		\
@@ -127,7 +127,7 @@
 		} else if (unlikely(i->type & ITER_DISCARD)) {	\
 		} else if (unlikely(i->type & ITER_XARRAY)) {	\
 			struct bio_vec v;			\
-			iterate_xarray(i, n, v, skip, (X));	\
+			iterate_xarray(i, n, v, skip, (B));	\
 		} else {					\
 			const struct iovec *iov;		\
 			struct iovec v;				\
@@ -842,9 +842,7 @@ bool _copy_from_iter_full(void *addr, size_t bytes, struct iov_iter *i)
 		0;}),
 		memcpy_from_page((to += v.bv_len) - v.bv_len, v.bv_page,
 				 v.bv_offset, v.bv_len),
-		memcpy((to += v.iov_len) - v.iov_len, v.iov_base, v.iov_len),
-		memcpy_from_page((to += v.bv_len) - v.bv_len, v.bv_page,
-				 v.bv_offset, v.bv_len)
+		memcpy((to += v.iov_len) - v.iov_len, v.iov_base, v.iov_len)
 	)
 
 	iov_iter_advance(i, bytes);
@@ -927,9 +925,7 @@ bool _copy_from_iter_full_nocache(void *addr, size_t bytes, struct iov_iter *i)
 		0;}),
 		memcpy_from_page((to += v.bv_len) - v.bv_len, v.bv_page,
 				 v.bv_offset, v.bv_len),
-		memcpy((to += v.iov_len) - v.iov_len, v.iov_base, v.iov_len),
-		memcpy_from_page((to += v.bv_len) - v.bv_len, v.bv_page,
-				 v.bv_offset, v.bv_len)
+		memcpy((to += v.iov_len) - v.iov_len, v.iov_base, v.iov_len)
 	)
 
 	iov_iter_advance(i, bytes);
@@ -1058,9 +1054,7 @@ size_t iov_iter_copy_from_user_atomic(struct page *page,
 		copyin((p += v.iov_len) - v.iov_len, v.iov_base, v.iov_len),
 		memcpy_from_page((p += v.bv_len) - v.bv_len, v.bv_page,
 				 v.bv_offset, v.bv_len),
-		memcpy((p += v.iov_len) - v.iov_len, v.iov_base, v.iov_len),
-		memcpy_from_page((p += v.bv_len) - v.bv_len, v.bv_page,
-				 v.bv_offset, v.bv_len)
+		memcpy((p += v.iov_len) - v.iov_len, v.iov_base, v.iov_len)
 	)
 	kunmap_atomic(kaddr);
 	return bytes;
@@ -1349,8 +1343,7 @@ unsigned long iov_iter_alignment(const struct iov_iter *i)
 	iterate_all_kinds(i, size, v,
 		(res |= (unsigned long)v.iov_base | v.iov_len, 0),
 		res |= v.bv_offset | v.bv_len,
-		res |= (unsigned long)v.iov_base | v.iov_len,
-		res |= v.bv_offset | v.bv_len
+		res |= (unsigned long)v.iov_base | v.iov_len
 	)
 	return res;
 }
@@ -1372,9 +1365,7 @@ unsigned long iov_iter_gap_alignment(const struct iov_iter *i)
 		(res |= (!res ? 0 : (unsigned long)v.bv_offset) |
 			(size != v.bv_len ? size : 0)),
 		(res |= (!res ? 0 : (unsigned long)v.iov_base) |
-			(size != v.iov_len ? size : 0)),
-		(res |= (!res ? 0 : (unsigned long)v.bv_offset) |
-			(size != v.bv_len ? size : 0))
+			(size != v.iov_len ? size : 0))
 		);
 	return res;
 }
@@ -1530,8 +1521,7 @@ ssize_t iov_iter_get_pages(struct iov_iter *i,
 		return v.bv_len;
 	}),({
 		return -EFAULT;
-	}),
-	0
+	})
 	)
 	return 0;
 }
@@ -1665,7 +1655,7 @@ ssize_t iov_iter_get_pages_alloc(struct iov_iter *i,
 		return v.bv_len;
 	}),({
 		return -EFAULT;
-	}), 0
+	})
 	)
 	return 0;
 }
@@ -1751,13 +1741,6 @@ bool csum_and_copy_from_iter_full(void *addr, size_t bytes, __wsum *csum,
 				      v.iov_base, v.iov_len,
 				      sum, off);
 		off += v.iov_len;
-	}), ({
-		char *p = kmap_atomic(v.bv_page);
-		sum = csum_and_memcpy((to += v.bv_len) - v.bv_len,
-				      p + v.bv_offset, v.bv_len,
-				      sum, off);
-		kunmap_atomic(p);
-		off += v.bv_len;
 	})
 	)
 	*csum = sum;
@@ -1892,8 +1875,7 @@ int iov_iter_npages(const struct iov_iter *i, int maxpages)
 			- p / PAGE_SIZE;
 		if (npages >= maxpages)
 			return maxpages;
-	}),
-	0
+	})
 	)
 	return npages;
 }


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

