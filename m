Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B306E461871
	for <lists+linux-cachefs@lfdr.de>; Mon, 29 Nov 2021 15:28:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638196105;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PuTG/dtRzjcCFxc3tecnalM6iDx0s1d8ZDx1D4e6bAM=;
	b=K7aPPQgTGCVOV0sB6+LJWdihHkdPgJNDVjMOs+t1Rk/vNso6TJx1WcwCwepsZq2bR8lBtD
	iYue8Md1G1xDFMV4LbBbd+1MsOfmPC8k/2rwJRYT2ntkRlaZcbh8dTIrjyOyh1ft20Ldsj
	409sVWZvslBrh0KYwfKyZv7vT9hVsWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-qqr2et57NdSaZctKD0qpXw-1; Mon, 29 Nov 2021 09:28:22 -0500
X-MC-Unique: qqr2et57NdSaZctKD0qpXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97E7684E258;
	Mon, 29 Nov 2021 14:28:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86DE672FA4;
	Mon, 29 Nov 2021 14:28:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 712024BB7C;
	Mon, 29 Nov 2021 14:28:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ATESJ8A000606 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 29 Nov 2021 09:28:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 283BB5C22B; Mon, 29 Nov 2021 14:28:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24E505FC22;
	Mon, 29 Nov 2021 14:28:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 29 Nov 2021 14:28:15 +0000
Message-ID: <163819609532.215744.10821082637727410554.stgit@warthog.procyon.org.uk>
In-Reply-To: <163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
References: <163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Subject: [Linux-cachefs] [PATCH 22/64] fscache: Provide read/write stat
	counters for the cache
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide read/write stat counters for the cache backend to use.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/fscache/stats.c            |    9 +++++++++
 include/linux/fscache-cache.h |   10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/fs/fscache/stats.c b/fs/fscache/stats.c
index cdbb672a274f..db42beb1ba3f 100644
--- a/fs/fscache/stats.c
+++ b/fs/fscache/stats.c
@@ -35,6 +35,11 @@ atomic_t fscache_n_relinquishes;
 atomic_t fscache_n_relinquishes_retire;
 atomic_t fscache_n_relinquishes_dropped;
 
+atomic_t fscache_n_read;
+EXPORT_SYMBOL(fscache_n_read);
+atomic_t fscache_n_write;
+EXPORT_SYMBOL(fscache_n_write);
+
 /*
  * display the general statistics
  */
@@ -72,6 +77,10 @@ int fscache_stats_show(struct seq_file *m, void *v)
 		   atomic_read(&fscache_n_relinquishes_retire),
 		   atomic_read(&fscache_n_relinquishes_dropped));
 
+	seq_printf(m, "IO     : rd=%u wr=%u\n",
+		   atomic_read(&fscache_n_read),
+		   atomic_read(&fscache_n_write));
+
 	netfs_stats_show(m);
 	return 0;
 }
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index 5525df056877..1398b71539ae 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -179,4 +179,14 @@ static inline void fscache_wait_for_objects(struct fscache_cache *cache)
 		   atomic_read(&cache->object_count) == 0);
 }
 
+#ifdef CONFIG_FSCACHE_STATS
+extern atomic_t fscache_n_read;
+extern atomic_t fscache_n_write;
+#define fscache_count_read() atomic_inc(&fscache_n_read)
+#define fscache_count_write() atomic_inc(&fscache_n_write)
+#else
+#define fscache_count_read() do {} while(0)
+#define fscache_count_write() do {} while(0)
+#endif
+
 #endif /* _LINUX_FSCACHE_CACHE_H */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

