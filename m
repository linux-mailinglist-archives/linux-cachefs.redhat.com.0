Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1C343FDF4
	for <lists+linux-cachefs@lfdr.de>; Fri, 29 Oct 2021 16:10:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635516601;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lVzZAg0ReoXHS6NszGq13654smPKGLSM0RRZxUSdjeI=;
	b=JI5nneMDM8uxe7Te/IHA8ymPw5vFhpJhdmsc6AQqt0HfUxdvOMPaDosCC/vyIYAP5RX/k2
	Z7V51f3odc1cAt1NDf6GAB8H6g/XEOXSCizwQI2sGqQlVxSO0/JCsKVu50B3JNA0idCiso
	GAYEwtvB2hyjZ+hfY7ejoeSlPj/0ZKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-4ZHWGILaOryG_13Tt98CRA-1; Fri, 29 Oct 2021 10:09:59 -0400
X-MC-Unique: 4ZHWGILaOryG_13Tt98CRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C79D1006AA6;
	Fri, 29 Oct 2021 14:09:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EB955D9CA;
	Fri, 29 Oct 2021 14:09:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C2451809C81;
	Fri, 29 Oct 2021 14:09:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19TE9uPL014748 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 29 Oct 2021 10:09:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 809F12B0B8; Fri, 29 Oct 2021 14:09:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A422A60854;
	Fri, 29 Oct 2021 14:09:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Fri, 29 Oct 2021 15:09:52 +0100
Message-ID: <163551659286.1877519.2951437510049163050.stgit@warthog.procyon.org.uk>
In-Reply-To: <163551653404.1877519.12363794970541005441.stgit@warthog.procyon.org.uk>
References: <163551653404.1877519.12363794970541005441.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH v4 03/10] cachefiles: Always indicate we
 should fill a post-EOF page with zeros
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In cachefiles_prepare_read(), always indicate to the netfs lib that a page
beyond the EOF should be filled with zeros, even if we don't have a cache
file attached because it's still being created.

This avoids confusion in netfs_rreq_prepare_read() where it sees source ==
NETFS_DOWNLOAD_FROM_SERVER, where it consequently sees the read after the
EOF getting reduced to 0 size and thus triggers the WARN_ON and marking the
read invalid.

Also don't try to check for data if there's a flag set indicating we don't
yet have anything stored in the cache.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/io.c |   29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 08b3183e0dce..dbc1c4421116 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -273,6 +273,7 @@ static enum netfs_read_source cachefiles_prepare_read(struct netfs_read_subreque
 	struct cachefiles_cache *cache;
 	const struct cred *saved_cred;
 	struct file *file = subreq->rreq->cache_resources.cache_priv2;
+	enum netfs_read_source ret = NETFS_DOWNLOAD_FROM_SERVER;
 	loff_t off, to;
 
 	_enter("%zx @%llx/%llx", subreq->len, subreq->start, i_size);
@@ -281,19 +282,24 @@ static enum netfs_read_source cachefiles_prepare_read(struct netfs_read_subreque
 	cache = container_of(object->fscache.cache,
 			     struct cachefiles_cache, cache);
 
-	if (!file)
-		goto cache_fail_nosec;
+	cachefiles_begin_secure(cache, &saved_cred);
 
-	if (subreq->start >= i_size)
-		return NETFS_FILL_WITH_ZEROES;
+	if (subreq->start >= i_size) {
+		ret = NETFS_FILL_WITH_ZEROES;
+		goto out;
+	}
 
-	cachefiles_begin_secure(cache, &saved_cred);
+	if (!file)
+		goto out;
+
+	if (test_bit(FSCACHE_COOKIE_NO_DATA_YET, &object->fscache.cookie->flags))
+		goto download_and_store;
 
 	off = vfs_llseek(file, subreq->start, SEEK_DATA);
 	if (off < 0 && off >= (loff_t)-MAX_ERRNO) {
 		if (off == (loff_t)-ENXIO)
 			goto download_and_store;
-		goto cache_fail;
+		goto out;
 	}
 
 	if (off >= subreq->start + subreq->len)
@@ -307,7 +313,7 @@ static enum netfs_read_source cachefiles_prepare_read(struct netfs_read_subreque
 
 	to = vfs_llseek(file, subreq->start, SEEK_HOLE);
 	if (to < 0 && to >= (loff_t)-MAX_ERRNO)
-		goto cache_fail;
+		goto out;
 
 	if (to < subreq->start + subreq->len) {
 		if (subreq->start + subreq->len >= i_size)
@@ -317,16 +323,15 @@ static enum netfs_read_source cachefiles_prepare_read(struct netfs_read_subreque
 		subreq->len = to - subreq->start;
 	}
 
-	cachefiles_end_secure(cache, saved_cred);
-	return NETFS_READ_FROM_CACHE;
+	ret = NETFS_READ_FROM_CACHE;
+	goto out;
 
 download_and_store:
 	if (cachefiles_has_space(cache, 0, (subreq->len + PAGE_SIZE - 1) / PAGE_SIZE) == 0)
 		__set_bit(NETFS_SREQ_WRITE_TO_CACHE, &subreq->flags);
-cache_fail:
+out:
 	cachefiles_end_secure(cache, saved_cred);
-cache_fail_nosec:
-	return NETFS_DOWNLOAD_FROM_SERVER;
+	return ret;
 }
 
 /*


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

