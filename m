Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA074321AC
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 17:04:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569439;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Pg+IFGSFzczp3+LuImGvalre9jc8QXcpaYo12po1d2c=;
	b=hZIMuPywm54iJl28TnIdR2FGN9Y5tp4BsM5VkxIl9qbNsmK/8bJIldqe6BpTGf1ybuvKkf
	/h6IgYVwqK8FIPc5AhsceISsDj9V22xPhISHGItazplAgB2ANpLzJcEIJmfRYgw0IuYens
	TBtrG5ZjbP2cP2+T8U+zz9MvcwtmUyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-L5fyYSxONBioAw1AWVFpqA-1; Mon, 18 Oct 2021 11:03:55 -0400
X-MC-Unique: L5fyYSxONBioAw1AWVFpqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DABA31922961;
	Mon, 18 Oct 2021 15:03:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6697641AB;
	Mon, 18 Oct 2021 15:03:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1EE74EA30;
	Mon, 18 Oct 2021 15:03:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IF3oC4029582 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 11:03:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B8FB41980E; Mon, 18 Oct 2021 15:03:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2D3057CA4;
	Mon, 18 Oct 2021 15:03:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 16:03:46 +0100
Message-ID: <163456942676.2614702.13709221260564510952.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Subject: [Linux-cachefs] [PATCH 51/67] fscache: Make
 fscache_write_to_cache() conditional on cookie
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make fscache_write_to_cache() conditional on cookie not being NULL, rather
than merely conditional on CONFIG_FSCACHE=[ym].  The problem with the
latter is if a filesystem, say afs, has CONFIG_AFS_FSCACHE=n but calls into
this function - linkage will fail if CONFIG_FSCACHE is less than
CONFIG_AFS.  Analogous problems can affect other filesystems, e.g. 9p.

Making fscache_write_to_cache() conditional on the cookie achieves two
things:

 (1) If cookie optimises down to constant NULL, term_func is called
     directly and may be inlined and the slow path is never called.

 (2) __fscache_write_to_cache() isn't called if cookie is dynamically NULL
     - and so, in such a case, term_func is called immediately.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/linux/fscache.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 847c076d05a6..ba192567d099 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -593,7 +593,7 @@ static inline void fscache_write_to_cache(struct fscache_cookie *cookie,
 					  netfs_io_terminated_t term_func,
 					  void *term_func_priv)
 {
-	if (fscache_available()) {
+	if (fscache_cookie_valid(cookie)) {
 		__fscache_write_to_cache(cookie, mapping, start, len, i_size,
 					 term_func, term_func_priv);
 	} else {


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

