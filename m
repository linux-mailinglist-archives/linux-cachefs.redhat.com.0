Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E65461840
	for <lists+linux-cachefs@lfdr.de>; Mon, 29 Nov 2021 15:26:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638195998;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RZgtBaswINrkAuPeBDV+TdNvoucxZuPjZkSijpG66cQ=;
	b=CGWUUB2zZR8S4AY+SHtce8oJHnPUJr/EoHWbM+EFZMrkFNncdaoEA250FkU/EuJR3IgB4i
	crqHmmFFk5lR6uClUhvVgOjdreMZ1OUgz2zSSD9Th3/GeaRNJ7lQ6YgdbnvR41odC47o9D
	+eVE654jUGc3hOwlq+HJ2Xffy48Imog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-EHX6z-oXNkKOSWI53J45ZQ-1; Mon, 29 Nov 2021 09:26:35 -0500
X-MC-Unique: EHX6z-oXNkKOSWI53J45ZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13DC4344E3;
	Mon, 29 Nov 2021 14:26:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0367C57CAA;
	Mon, 29 Nov 2021 14:26:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E73731809C89;
	Mon, 29 Nov 2021 14:26:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ATEQVIf000420 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 29 Nov 2021 09:26:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 563835D9DE; Mon, 29 Nov 2021 14:26:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A73E5D9C0;
	Mon, 29 Nov 2021 14:26:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 29 Nov 2021 14:26:27 +0000
Message-ID: <163819598741.215744.891281275151382095.stgit@warthog.procyon.org.uk>
In-Reply-To: <163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
References: <163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Subject: [Linux-cachefs] [PATCH 16/64] fscache: Add a function for a cache
 backend to note an I/O error
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

Add a function to the backend API to note an I/O error in a cache.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/fscache/cache.c            |   20 ++++++++++++++++++++
 include/linux/fscache-cache.h |    2 ++
 2 files changed, 22 insertions(+)

diff --git a/fs/fscache/cache.c b/fs/fscache/cache.c
index bbd102be91c4..25eac61f1c29 100644
--- a/fs/fscache/cache.c
+++ b/fs/fscache/cache.c
@@ -321,6 +321,26 @@ void fscache_end_cache_access(struct fscache_cache *cache, enum fscache_access_t
 		wake_up_var(&cache->n_accesses);
 }
 
+/**
+ * fscache_io_error - Note a cache I/O error
+ * @cache: The record describing the cache
+ *
+ * Note that an I/O error occurred in a cache and that it should no longer be
+ * used for anything.  This also reports the error into the kernel log.
+ *
+ * See Documentation/filesystems/caching/backend-api.rst for a complete
+ * description.
+ */
+void fscache_io_error(struct fscache_cache *cache)
+{
+	if (fscache_set_cache_state_maybe(cache,
+					  FSCACHE_CACHE_IS_ACTIVE,
+					  FSCACHE_CACHE_GOT_IOERROR))
+		pr_err("Cache '%s' stopped due to I/O error\n",
+		       cache->name);
+}
+EXPORT_SYMBOL(fscache_io_error);
+
 /**
  * fscache_withdraw_cache - Withdraw a cache from the active service
  * @cache: The cache cookie
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index a10b66ca3544..936ef731bbc7 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -73,6 +73,8 @@ extern int fscache_add_cache(struct fscache_cache *cache,
 extern void fscache_withdraw_cache(struct fscache_cache *cache);
 extern void fscache_withdraw_volume(struct fscache_volume *volume);
 
+extern void fscache_io_error(struct fscache_cache *cache);
+
 extern void fscache_end_volume_access(struct fscache_volume *volume,
 				      struct fscache_cookie *cookie,
 				      enum fscache_access_trace why);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

