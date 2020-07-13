Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CB39C21DC67
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Jul 2020 18:32:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594657962;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DvrxT+urXuQDiveYztL5bAqSIVA2tzT/HNIgFm62A/Q=;
	b=aRZN4jUsnJis1aUJg+89MkP/ydH1Ed3y4/uZkvWxXxdMtsKziXVKSKtjI3hN1OlqFlyWNH
	ZLzfORSHDv4gFlrbvVUV6yk5SFoswsVU9rEAg9Jqh8oKfwTivbvRDsYLsuxEqOnDxqzoU3
	1X5BwcXSebdngZLNQhq6KJtUMPB46I0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-JHGCC1RFN8iMVfzwQ-Z1zw-1; Mon, 13 Jul 2020 12:32:41 -0400
X-MC-Unique: JHGCC1RFN8iMVfzwQ-Z1zw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7775880040A;
	Mon, 13 Jul 2020 16:32:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67E2B6FEDF;
	Mon, 13 Jul 2020 16:32:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 510A094EF2;
	Mon, 13 Jul 2020 16:32:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DGWb57027233 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 12:32:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9655960CD1; Mon, 13 Jul 2020 16:32:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-113.rdu2.redhat.com
	[10.10.112.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25C8760BF3;
	Mon, 13 Jul 2020 16:32:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>
Date: Mon, 13 Jul 2020 17:32:31 +0100
Message-ID: <159465795136.1376674.599056208279354471.stgit@warthog.procyon.org.uk>
In-Reply-To: <159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk>
References: <159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 10/32] fscache: Remove
	fscache_wait_on_invalidate()
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove fscache_wait_on_invalidate() as the invalidation wait is now built into
the I/O path.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/fscache/cookie.c     |   14 --------------
 include/linux/fscache.h |   17 -----------------
 2 files changed, 31 deletions(-)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index a8aa1639e93b..a1eba3be9ce8 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -492,20 +492,6 @@ void __fscache_invalidate(struct fscache_cookie *cookie)
 }
 EXPORT_SYMBOL(__fscache_invalidate);
 
-/*
- * Wait for object invalidation to complete.
- */
-void __fscache_wait_on_invalidate(struct fscache_cookie *cookie)
-{
-	_enter("%p", cookie);
-
-	wait_on_bit(&cookie->flags, FSCACHE_COOKIE_INVALIDATING,
-		    TASK_UNINTERRUPTIBLE);
-
-	_leave("");
-}
-EXPORT_SYMBOL(__fscache_wait_on_invalidate);
-
 /*
  * Update the index entries backing a cookie.  The writeback is done lazily.
  */
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index aec75fc0d297..56fdd0e74a88 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -217,7 +217,6 @@ extern void __fscache_unuse_cookie(struct fscache_cookie *, const void *, const
 extern void __fscache_relinquish_cookie(struct fscache_cookie *, bool);
 extern void __fscache_update_cookie(struct fscache_cookie *, const void *, const loff_t *);
 extern void __fscache_invalidate(struct fscache_cookie *);
-extern void __fscache_wait_on_invalidate(struct fscache_cookie *);
 extern void __fscache_shape_request(struct fscache_cookie *, struct fscache_request_shape *);
 extern void __fscache_init_io_request(struct fscache_io_request *,
 				      struct fscache_cookie *);
@@ -466,22 +465,6 @@ void fscache_invalidate(struct fscache_cookie *cookie)
 		__fscache_invalidate(cookie);
 }
 
-/**
- * fscache_wait_on_invalidate - Wait for invalidation to complete
- * @cookie: The cookie representing the cache object
- *
- * Wait for the invalidation of an object to complete.
- *
- * See Documentation/filesystems/caching/netfs-api.rst for a complete
- * description.
- */
-static inline
-void fscache_wait_on_invalidate(struct fscache_cookie *cookie)
-{
-	if (fscache_cookie_valid(cookie))
-		__fscache_wait_on_invalidate(cookie);
-}
-
 /**
  * fscache_init_io_request - Initialise an I/O request
  * @req: The I/O request to initialise


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

