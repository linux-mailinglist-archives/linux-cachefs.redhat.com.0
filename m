Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 110E840E09D
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Sep 2021 18:21:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-rv4w_2WhPO60KHrNb82YjQ-1; Thu, 16 Sep 2021 12:21:34 -0400
X-MC-Unique: rv4w_2WhPO60KHrNb82YjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E75061006AA2;
	Thu, 16 Sep 2021 16:21:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA3A160CC6;
	Thu, 16 Sep 2021 16:21:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6ED61801241;
	Thu, 16 Sep 2021 16:21:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18GGGfOM002886 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 16 Sep 2021 12:16:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 96A2021F1AED; Thu, 16 Sep 2021 16:16:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9046521EC5FD
	for <linux-cachefs@redhat.com>; Thu, 16 Sep 2021 16:16:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8CD080A0B9
	for <linux-cachefs@redhat.com>; Thu, 16 Sep 2021 16:16:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-358-NKQGREiMNiy1WJVK2nBgTg-1;
	Thu, 16 Sep 2021 12:16:34 -0400
X-MC-Unique: NKQGREiMNiy1WJVK2nBgTg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id E396F61283;
	Thu, 16 Sep 2021 16:07:40 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 16 Sep 2021 17:57:23 +0200
Message-Id: <20210916155757.406572188@linuxfoundation.org>
In-Reply-To: <20210916155753.903069397@linuxfoundation.org>
References: <20210916155753.903069397@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 5.10 098/306] fscache: Fix cookie key hashing
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: David Howells <dhowells@redhat.com>

[ Upstream commit 35b72573e977ed6b18b094136a4fa3e0ffb13603 ]

The current hash algorithm used for hashing cookie keys is really bad,
producing almost no dispersion (after a test kernel build, ~30000 files
were split over just 18 out of the 32768 hash buckets).

Borrow the full_name_hash() hash function into fscache to do the hashing
for cookie keys and, in the future, volume keys.

I don't want to use full_name_hash() as-is because I want the hash value to
be consistent across arches and over time as the hash value produced may
get used on disk.

I can also optimise parts of it away as the key will always be a padded
array of aligned 32-bit words.

Fixes: ec0328e46d6e ("fscache: Maintain a catalogue of allocated cookies")
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/162431201844.2908479.8293647220901514696.stgit@warthog.procyon.org.uk/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/fscache/cookie.c   | 14 +-------------
 fs/fscache/internal.h |  2 ++
 fs/fscache/main.c     | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 751bc5b1cddf..6104f627cc71 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -74,10 +74,8 @@ void fscache_free_cookie(struct fscache_cookie *cookie)
 static int fscache_set_key(struct fscache_cookie *cookie,
 			   const void *index_key, size_t index_key_len)
 {
-	unsigned long long h;
 	u32 *buf;
 	int bufs;
-	int i;
 
 	bufs = DIV_ROUND_UP(index_key_len, sizeof(*buf));
 
@@ -91,17 +89,7 @@ static int fscache_set_key(struct fscache_cookie *cookie,
 	}
 
 	memcpy(buf, index_key, index_key_len);
-
-	/* Calculate a hash and combine this with the length in the first word
-	 * or first half word
-	 */
-	h = (unsigned long)cookie->parent;
-	h += index_key_len + cookie->type;
-
-	for (i = 0; i < bufs; i++)
-		h += buf[i];
-
-	cookie->key_hash = h ^ (h >> 32);
+	cookie->key_hash = fscache_hash(0, buf, bufs);
 	return 0;
 }
 
diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index 08e91efbce53..64aa552b296d 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -97,6 +97,8 @@ extern struct workqueue_struct *fscache_object_wq;
 extern struct workqueue_struct *fscache_op_wq;
 DECLARE_PER_CPU(wait_queue_head_t, fscache_object_cong_wait);
 
+extern unsigned int fscache_hash(unsigned int salt, unsigned int *data, unsigned int n);
+
 static inline bool fscache_object_congested(void)
 {
 	return workqueue_congested(WORK_CPU_UNBOUND, fscache_object_wq);
diff --git a/fs/fscache/main.c b/fs/fscache/main.c
index c1e6cc9091aa..4207f98e405f 100644
--- a/fs/fscache/main.c
+++ b/fs/fscache/main.c
@@ -93,6 +93,45 @@ static struct ctl_table fscache_sysctls_root[] = {
 };
 #endif
 
+/*
+ * Mixing scores (in bits) for (7,20):
+ * Input delta: 1-bit      2-bit
+ * 1 round:     330.3     9201.6
+ * 2 rounds:   1246.4    25475.4
+ * 3 rounds:   1907.1    31295.1
+ * 4 rounds:   2042.3    31718.6
+ * Perfect:    2048      31744
+ *            (32*64)   (32*31/2 * 64)
+ */
+#define HASH_MIX(x, y, a)	\
+	(	x ^= (a),	\
+	y ^= x,	x = rol32(x, 7),\
+	x += y,	y = rol32(y,20),\
+	y *= 9			)
+
+static inline unsigned int fold_hash(unsigned long x, unsigned long y)
+{
+	/* Use arch-optimized multiply if one exists */
+	return __hash_32(y ^ __hash_32(x));
+}
+
+/*
+ * Generate a hash.  This is derived from full_name_hash(), but we want to be
+ * sure it is arch independent and that it doesn't change as bits of the
+ * computed hash value might appear on disk.  The caller also guarantees that
+ * the hashed data will be a series of aligned 32-bit words.
+ */
+unsigned int fscache_hash(unsigned int salt, unsigned int *data, unsigned int n)
+{
+	unsigned int a, x = 0, y = salt;
+
+	for (; n; n--) {
+		a = *data++;
+		HASH_MIX(x, y, a);
+	}
+	return fold_hash(x, y);
+}
+
 /*
  * initialise the fs caching module
  */
-- 
2.30.2



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

