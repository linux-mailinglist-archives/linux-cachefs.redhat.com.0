Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA6C43211A
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 16:59:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569145;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z9lt7W+uDXgezZ0dAfVNbq2RfjfBlJbqvOogmo0mq7w=;
	b=H4wFOctTOxn8Q4vqdbvwr+85q7epAKRf3Tv9FBOdXZbtGG4Gf4C8thVpAHnLDsmTD5LGoe
	OhlefJfco8mWrt59dTqGqaMbILh4Yv2iwMGCrfNdP1emGm4a4CD4v7nwauKvKXkNThFyND
	+HYfAwE5GIYqumqTuO4fzwxOcjl2u0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-507xbcNyMECGTCNowEHKCw-1; Mon, 18 Oct 2021 10:59:01 -0400
X-MC-Unique: 507xbcNyMECGTCNowEHKCw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E60F71006AA9;
	Mon, 18 Oct 2021 14:58:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8863102AE44;
	Mon, 18 Oct 2021 14:58:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE77E1806D03;
	Mon, 18 Oct 2021 14:58:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IEwwho028829 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 10:58:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A66762AEE; Mon, 18 Oct 2021 14:58:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 84A8B5F4EE;
	Mon, 18 Oct 2021 14:58:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 15:58:51 +0100
Message-ID: <163456913173.2614702.12279776553978969628.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Subject: [Linux-cachefs] [PATCH 31/67] cachefiles: Don't use XATTR_ flags
	with vfs_setxattr()
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

Don't pass XATTR_CREATE/XATTR_REPLACE to vfs_setxattr(); just pass 0 as we
don't want to have to deal with the error or try to guess which we want to
use.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/interface.c |    2 +-
 fs/cachefiles/internal.h  |    3 +--
 fs/cachefiles/namei.c     |    2 +-
 fs/cachefiles/xattr.c     |    6 ++----
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 3e678ab14c85..674d3d75fa70 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -132,7 +132,7 @@ static void cachefiles_update_object(struct cachefiles_object *object)
 	cache = container_of(object->cache, struct cachefiles_cache, cache);
 
 	cachefiles_begin_secure(cache, &saved_cred);
-	cachefiles_set_object_xattr(object, XATTR_REPLACE);
+	cachefiles_set_object_xattr(object);
 	cachefiles_end_secure(cache, saved_cred);
 	_leave("");
 }
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index ff00c5249f4f..92f90a5a4e93 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -162,8 +162,7 @@ static inline void cachefiles_end_secure(struct cachefiles_cache *cache,
 /*
  * xattr.c
  */
-extern int cachefiles_set_object_xattr(struct cachefiles_object *object,
-				       unsigned int xattr_flags);
+extern int cachefiles_set_object_xattr(struct cachefiles_object *object);
 extern int cachefiles_check_auxdata(struct cachefiles_object *object);
 extern int cachefiles_remove_object_xattr(struct cachefiles_cache *cache,
 					  struct dentry *dentry);
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index a60ef6f1cf1e..cb08be5fb28e 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -291,7 +291,7 @@ static int cachefiles_check_open_object(struct cachefiles_cache *cache,
 
 	if (object->new) {
 		/* attach data to a newly constructed terminal object */
-		ret = cachefiles_set_object_xattr(object, XATTR_CREATE);
+		ret = cachefiles_set_object_xattr(object);
 		if (ret < 0)
 			goto error_unmark;
 	} else {
diff --git a/fs/cachefiles/xattr.c b/fs/cachefiles/xattr.c
index bfb2f4d605af..82c822bb71af 100644
--- a/fs/cachefiles/xattr.c
+++ b/fs/cachefiles/xattr.c
@@ -26,8 +26,7 @@ static const char cachefiles_xattr_cache[] =
 /*
  * set the state xattr on a cache file
  */
-int cachefiles_set_object_xattr(struct cachefiles_object *object,
-				unsigned int xattr_flags)
+int cachefiles_set_object_xattr(struct cachefiles_object *object)
 {
 	struct cachefiles_xattr *buf;
 	struct dentry *dentry;
@@ -51,8 +50,7 @@ int cachefiles_set_object_xattr(struct cachefiles_object *object,
 
 	clear_bit(FSCACHE_COOKIE_AUX_UPDATED, &object->cookie->flags);
 	ret = vfs_setxattr(&init_user_ns, dentry, cachefiles_xattr_cache,
-			   buf, sizeof(struct cachefiles_xattr) + len,
-			   xattr_flags);
+			   buf, sizeof(struct cachefiles_xattr) + len, 0);
 	if (ret < 0) {
 		trace_cachefiles_coherency(object, file_inode(file)->i_ino,
 					   0,


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

