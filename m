Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B344F9FE5
	for <lists+linux-cachefs@lfdr.de>; Sat,  9 Apr 2022 01:06:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649459215;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H4PNHjBVv2AsppoKJDaHVWAzI42z/ZZQsf33TwqdIwY=;
	b=aY1YgOVNU/sphMNWj4We7QjD/uAOtiOhP5HSLJknk0UnAnxAyfOOtscgaZVc6o3GNC8Kx2
	+BZKpQgPp8hgPDKIiitC2Sj5p0hPue69nM6B6hn4L5XL3ROoRGiHspjgUyn7h2t1VgY1BW
	Hchd39s7BjfAz7dTDd7GYbWeUegTLXA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-bkVVvAgONlSFAH-AUDnesA-1; Fri, 08 Apr 2022 19:06:52 -0400
X-MC-Unique: bkVVvAgONlSFAH-AUDnesA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0158A1C0173A;
	Fri,  8 Apr 2022 23:06:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC80C145831D;
	Fri,  8 Apr 2022 23:06:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B993A194034A;
	Fri,  8 Apr 2022 23:06:51 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 031751940341 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  8 Apr 2022 23:06:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D9C3820296A8; Fri,  8 Apr 2022 23:06:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 155B420296A6;
 Fri,  8 Apr 2022 23:06:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Sat, 09 Apr 2022 00:06:39 +0100
Message-ID: <164945919939.773423.16389718107369702519.stgit@warthog.procyon.org.uk>
In-Reply-To: <164945915630.773423.14655306154231712324.stgit@warthog.procyon.org.uk>
References: <164945915630.773423.14655306154231712324.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Linux-cachefs] [PATCH 5/8] fscache: Remove the cookie parameter
 from fscache_clear_page_bits()
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Yue Hu <huyue2@coolpad.com>,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Yue Hu <huyue2@coolpad.com>

The cookie is not used at all, remove it and update the usage in io.c
and afs/write.c (which is the only user outside of fscache currently)
at the same time.

[DH: Amended the documentation also]

Signed-off-by: Yue Hu <huyue2@coolpad.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://listman.redhat.com/archives/linux-cachefs/2022-April/006659.html
---

 Documentation/filesystems/caching/netfs-api.rst |   25 +++++++++++------------
 fs/afs/write.c                                  |    3 +--
 fs/fscache/io.c                                 |    5 ++---
 include/linux/fscache.h                         |    4 +---
 4 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/Documentation/filesystems/caching/netfs-api.rst b/Documentation/filesystems/caching/netfs-api.rst
index 5066113acad5..7308d76a29dc 100644
--- a/Documentation/filesystems/caching/netfs-api.rst
+++ b/Documentation/filesystems/caching/netfs-api.rst
@@ -404,22 +404,21 @@ schedule a write of that region::
 And if an error occurs before that point is reached, the marks can be removed
 by calling::
 
-	void fscache_clear_page_bits(struct fscache_cookie *cookie,
-				     struct address_space *mapping,
+	void fscache_clear_page_bits(struct address_space *mapping,
 				     loff_t start, size_t len,
 				     bool caching)
 
-In both of these functions, the cookie representing the cache object to be
-written to and a pointer to the mapping to which the source pages are attached
-are passed in; start and len indicate the size of the region that's going to be
-written (it doesn't have to align to page boundaries necessarily, but it does
-have to align to DIO boundaries on the backing filesystem).  The caching
-parameter indicates if caching should be skipped, and if false, the functions
-do nothing.
-
-The write function takes some additional parameters: i_size indicates the size
-of the netfs file and term_func indicates an optional completion function, to
-which term_func_priv will be passed, along with the error or amount written.
+In these functions, a pointer to the mapping to which the source pages are
+attached is passed in and start and len indicate the size of the region that's
+going to be written (it doesn't have to align to page boundaries necessarily,
+but it does have to align to DIO boundaries on the backing filesystem).  The
+caching parameter indicates if caching should be skipped, and if false, the
+functions do nothing.
+
+The write function takes some additional parameters: the cookie representing
+the cache object to be written to, i_size indicates the size of the netfs file
+and term_func indicates an optional completion function, to which
+term_func_priv will be passed, along with the error or amount written.
 
 Note that the write function will always run asynchronously and will unmark all
 the pages upon completion before calling term_func.
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 6bcf1475511b..4763132ca57e 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -616,8 +616,7 @@ static ssize_t afs_write_back_from_locked_folio(struct address_space *mapping,
 		_debug("write discard %x @%llx [%llx]", len, start, i_size);
 
 		/* The dirty region was entirely beyond the EOF. */
-		fscache_clear_page_bits(afs_vnode_cache(vnode),
-					mapping, start, len, caching);
+		fscache_clear_page_bits(mapping, start, len, caching);
 		afs_pages_written_back(vnode, start, len);
 		ret = 0;
 	}
diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index c8c7fe9e9a6e..3af3b08a9bb3 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -235,8 +235,7 @@ static void fscache_wreq_done(void *priv, ssize_t transferred_or_error,
 {
 	struct fscache_write_request *wreq = priv;
 
-	fscache_clear_page_bits(fscache_cres_cookie(&wreq->cache_resources),
-				wreq->mapping, wreq->start, wreq->len,
+	fscache_clear_page_bits(wreq->mapping, wreq->start, wreq->len,
 				wreq->set_bits);
 
 	if (wreq->term_func)
@@ -296,7 +295,7 @@ void __fscache_write_to_cache(struct fscache_cookie *cookie,
 abandon_free:
 	kfree(wreq);
 abandon:
-	fscache_clear_page_bits(cookie, mapping, start, len, cond);
+	fscache_clear_page_bits(mapping, start, len, cond);
 	if (term_func)
 		term_func(term_func_priv, ret, false);
 }
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 6727fb0db619..e25539072463 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -573,7 +573,6 @@ int fscache_write(struct netfs_cache_resources *cres,
 
 /**
  * fscache_clear_page_bits - Clear the PG_fscache bits from a set of pages
- * @cookie: The cookie representing the cache object
  * @mapping: The netfs inode to use as the source
  * @start: The start position in @mapping
  * @len: The amount of data to unlock
@@ -582,8 +581,7 @@ int fscache_write(struct netfs_cache_resources *cres,
  * Clear the PG_fscache flag from a sequence of pages and wake up anyone who's
  * waiting.
  */
-static inline void fscache_clear_page_bits(struct fscache_cookie *cookie,
-					   struct address_space *mapping,
+static inline void fscache_clear_page_bits(struct address_space *mapping,
 					   loff_t start, size_t len,
 					   bool caching)
 {


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

