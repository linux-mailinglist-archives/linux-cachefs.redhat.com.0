Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B52A4776E2
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Dec 2021 17:07:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639670855;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Cct4y+WANwKLXSrgu1pFejimU+tBp6hFbIYXXGVjB3E=;
	b=cCdGL8AuBkq1WkcIcvmLA6vYIUC169yj2rQ5pS+h/Q6aUz08iSWEW4vFWvjkumGaOaHo1S
	7dfQudvSrcyMg5s+KG+qzElAahabO1MMxFr3BhPiWjl/9C8iOQhchCE10vz+rk5hkEyd81
	xAU1XulxhHx73h+2SpqvPylyS9MJYZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-euFvvHyhN5Oi6GQr6AJtKA-1; Thu, 16 Dec 2021 11:07:32 -0500
X-MC-Unique: euFvvHyhN5Oi6GQr6AJtKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 827BF874980;
	Thu, 16 Dec 2021 16:07:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9D267A22D;
	Thu, 16 Dec 2021 16:07:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 980EA1809CB8;
	Thu, 16 Dec 2021 16:07:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BGG7PkC006352 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 16 Dec 2021 11:07:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 900665BD09; Thu, 16 Dec 2021 16:07:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 562395BD06;
	Thu, 16 Dec 2021 16:07:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 16 Dec 2021 16:07:03 +0000
Message-ID: <163967082342.1823006.8915671045444488742.stgit@warthog.procyon.org.uk>
In-Reply-To: <163967073889.1823006.12237147297060239168.stgit@warthog.procyon.org.uk>
References: <163967073889.1823006.12237147297060239168.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH v3 07/68] fscache: Implement a hash function
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

Implement a function to generate hashes.  It needs to be stable over time
and endianness-independent as the hashes will appear on disk in future
patches.  It can assume that its input is a multiple of four bytes in size
and alignment.

This is borrowed from the VFS and simplified.  le32_to_cpu() is added to
make it endianness-independent.

Changes
=======
ver #3:
 - Read the data being hashed in an endianness-independent way[1].
 - Change the size parameter to be in bytes rather than words.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/CAHk-=whtkzB446+hX0zdLsdcUJsJ=8_-0S1mE_R+YurThfUbLA@mail.gmail.com [1]
Link: https://lore.kernel.org/r/163819586113.215744.1699465806130102367.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/163906888735.143852.10944614318596881429.stgit@warthog.procyon.org.uk/ # v2
---

 fs/fscache/internal.h |    2 ++
 fs/fscache/main.c     |   40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index ea52f8594a77..f345bdb018ba 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -22,6 +22,8 @@
  */
 extern unsigned fscache_debug;
 
+extern unsigned int fscache_hash(unsigned int salt, const void *data, size_t len);
+
 /*
  * proc.c
  */
diff --git a/fs/fscache/main.c b/fs/fscache/main.c
index 819de2ee1276..687b34903d5b 100644
--- a/fs/fscache/main.c
+++ b/fs/fscache/main.c
@@ -24,6 +24,46 @@ MODULE_PARM_DESC(fscache_debug,
 struct workqueue_struct *fscache_wq;
 EXPORT_SYMBOL(fscache_wq);
 
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
+ * computed hash value might appear on disk.  The caller must guarantee that
+ * the source data is a multiple of four bytes in size.
+ */
+unsigned int fscache_hash(unsigned int salt, const void *data, size_t len)
+{
+	const __le32 *p = data;
+	unsigned int a, x = 0, y = salt, n = len / sizeof(__le32);
+
+	for (; n; n--) {
+		a = le32_to_cpu(*p++);
+		HASH_MIX(x, y, a);
+	}
+	return fold_hash(x, y);
+}
+
 /*
  * initialise the fs caching module
  */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

