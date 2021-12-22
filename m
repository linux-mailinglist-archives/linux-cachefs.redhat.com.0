Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8504147DB14
	for <lists+linux-cachefs@lfdr.de>; Thu, 23 Dec 2021 00:28:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640215691;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J3eYVUpzHaeDj9xuGgVJH5BX6caTw/n+c60hDEQXOho=;
	b=HIXibIiZHWWGzcvwGVcPKxvqej8/XkhqRYwZSocWOHEB//kzsnTtKYG9qmHlMLhfYzs1Lp
	/t402nnIG7PFLE90Zp0p6yh3Gm8gYhHwKPXGGF+SNKMRavFW+cfCccAmwhyZ35PLGknVye
	TzVxU2Q3Q8j4fOzkRUO7r1rZC/FXY8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-m3XZKDf5OYCOC3roT2JGDA-1; Wed, 22 Dec 2021 18:28:08 -0500
X-MC-Unique: m3XZKDf5OYCOC3roT2JGDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2024B1030C23;
	Wed, 22 Dec 2021 23:28:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFDD17EFC3;
	Wed, 22 Dec 2021 23:28:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3BB61809CB8;
	Wed, 22 Dec 2021 23:28:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BMNS3Sv001541 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 22 Dec 2021 18:28:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2B4BA7EFDF; Wed, 22 Dec 2021 23:28:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14DFB7EFF7;
	Wed, 22 Dec 2021 23:27:56 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 22 Dec 2021 23:27:56 +0000
Message-ID: <164021567619.640689.4339228906248763197.stgit@warthog.procyon.org.uk>
In-Reply-To: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Subject: [Linux-cachefs] [PATCH v4 55/68] fscache,
	cachefiles: Display stat of culling events
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

Add a stat counter of culling events whereby the cache backend culls a file
to make space (when asked by cachefilesd in this case) and display in
/proc/fs/fscache/stats.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819654165.215744.3797804661644212436.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/163906961387.143852.9291157239960289090.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/163967168266.1823006.14436200166581605746.stgit@warthog.procyon.org.uk/ # v3
---

 fs/cachefiles/namei.c         |    1 +
 fs/fscache/stats.c            |    7 +++++--
 include/linux/fscache-cache.h |    3 +++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index ab3ca598acac..9bd692870617 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -805,6 +805,7 @@ int cachefiles_cull(struct cachefiles_cache *cache, struct dentry *dir,
 	if (ret < 0)
 		goto error;
 
+	fscache_count_culled();
 	dput(victim);
 	_leave(" = 0");
 	return 0;
diff --git a/fs/fscache/stats.c b/fs/fscache/stats.c
index db2f4e225dd9..fc94e5e79f1c 100644
--- a/fs/fscache/stats.c
+++ b/fs/fscache/stats.c
@@ -46,6 +46,8 @@ atomic_t fscache_n_no_write_space;
 EXPORT_SYMBOL(fscache_n_no_write_space);
 atomic_t fscache_n_no_create_space;
 EXPORT_SYMBOL(fscache_n_no_create_space);
+atomic_t fscache_n_culled;
+EXPORT_SYMBOL(fscache_n_culled);
 
 /*
  * display the general statistics
@@ -86,9 +88,10 @@ int fscache_stats_show(struct seq_file *m, void *v)
 		   atomic_read(&fscache_n_relinquishes_retire),
 		   atomic_read(&fscache_n_relinquishes_dropped));
 
-	seq_printf(m, "NoSpace: nwr=%u ncr=%u\n",
+	seq_printf(m, "NoSpace: nwr=%u ncr=%u cull=%u\n",
 		   atomic_read(&fscache_n_no_write_space),
-		   atomic_read(&fscache_n_no_create_space));
+		   atomic_read(&fscache_n_no_create_space),
+		   atomic_read(&fscache_n_culled));
 
 	seq_printf(m, "IO     : rd=%u wr=%u\n",
 		   atomic_read(&fscache_n_read),
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index 007e47f38610..a174cedf4d90 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -188,15 +188,18 @@ extern atomic_t fscache_n_read;
 extern atomic_t fscache_n_write;
 extern atomic_t fscache_n_no_write_space;
 extern atomic_t fscache_n_no_create_space;
+extern atomic_t fscache_n_culled;
 #define fscache_count_read() atomic_inc(&fscache_n_read)
 #define fscache_count_write() atomic_inc(&fscache_n_write)
 #define fscache_count_no_write_space() atomic_inc(&fscache_n_no_write_space)
 #define fscache_count_no_create_space() atomic_inc(&fscache_n_no_create_space)
+#define fscache_count_culled() atomic_inc(&fscache_n_culled)
 #else
 #define fscache_count_read() do {} while(0)
 #define fscache_count_write() do {} while(0)
 #define fscache_count_no_write_space() do {} while(0)
 #define fscache_count_no_create_space() do {} while(0)
+#define fscache_count_culled() do {} while(0)
 #endif
 
 #endif /* _LINUX_FSCACHE_CACHE_H */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

