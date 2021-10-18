Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3050E4320D1
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 16:56:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634568994;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9BCVNEPmuVs/OR06uXZ7goMTF8xmIaDd1dCsyTyhD8A=;
	b=V4BzpcrebIDEoEAP+sdD9o2Bd+bfxlbkdrfbsAmkxm0TIuD5m9mPsN17IQMO+EfW7tU2wL
	Itzyv3WdcPRTANRkDUYCBpVhyIsmNQD/EyUnNrMuTAsFaU1PwuIauUAatPFaElKbL7NSgX
	9DXGeu0udxeDro4BE5iO7BUG7ol9Qp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-S0vlJjSkNgm4QEsVhWQdJQ-1; Mon, 18 Oct 2021 10:56:31 -0400
X-MC-Unique: S0vlJjSkNgm4QEsVhWQdJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 186D910A8E01;
	Mon, 18 Oct 2021 14:56:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 080925DF56;
	Mon, 18 Oct 2021 14:56:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBD91180BAD1;
	Mon, 18 Oct 2021 14:56:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IEte8R028279 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 10:55:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7373E641A7; Mon, 18 Oct 2021 14:55:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97EE85D6D7;
	Mon, 18 Oct 2021 14:55:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 15:55:33 +0100
Message-ID: <163456893374.2614702.11747731163000539462.stgit@warthog.procyon.org.uk>
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
Subject: [Linux-cachefs] [PATCH 19/67] cachefiles: Don't set an xattr on the
	root of the cache
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

cachefiles_check_object_type() sets an xattr on the root of the cache, but
it's pointless because it never conveys any useful information, so don't do
that.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/bind.c     |    4 --
 fs/cachefiles/internal.h |    1 -
 fs/cachefiles/xattr.c    |   76 ----------------------------------------------
 3 files changed, 81 deletions(-)

diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
index d463d89f5db8..6720c07f3d85 100644
--- a/fs/cachefiles/bind.c
+++ b/fs/cachefiles/bind.c
@@ -199,10 +199,6 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 	fsdef->dentry = cachedir;
 	fsdef->fscache.cookie = NULL;
 
-	ret = cachefiles_check_object_type(fsdef);
-	if (ret < 0)
-		goto error_unsupported;
-
 	/* get the graveyard directory */
 	graveyard = cachefiles_get_directory(cache, root, "graveyard");
 	if (IS_ERR(graveyard)) {
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 0515add2b7e8..6464a6821bfb 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -169,7 +169,6 @@ static inline void cachefiles_end_secure(struct cachefiles_cache *cache,
 /*
  * xattr.c
  */
-extern int cachefiles_check_object_type(struct cachefiles_object *object);
 extern int cachefiles_set_object_xattr(struct cachefiles_object *object,
 				       unsigned int xattr_flags);
 extern int cachefiles_check_auxdata(struct cachefiles_object *object);
diff --git a/fs/cachefiles/xattr.c b/fs/cachefiles/xattr.c
index bcc4a2dfe1e8..8b9f30f9ce21 100644
--- a/fs/cachefiles/xattr.c
+++ b/fs/cachefiles/xattr.c
@@ -23,82 +23,6 @@ struct cachefiles_xattr {
 static const char cachefiles_xattr_cache[] =
 	XATTR_USER_PREFIX "CacheFiles.cache";
 
-/*
- * check the type label on an object
- * - done using xattrs
- */
-int cachefiles_check_object_type(struct cachefiles_object *object)
-{
-	struct dentry *dentry = object->dentry;
-	char type[3], xtype[3];
-	int ret;
-
-	ASSERT(dentry);
-	ASSERT(d_backing_inode(dentry));
-
-	if (!object->fscache.cookie)
-		strcpy(type, "C3");
-	else
-		snprintf(type, 3, "%02x", object->fscache.cookie->type);
-
-	_enter("%x{%s}", object->fscache.debug_id, type);
-
-	/* attempt to install a type label directly */
-	ret = vfs_setxattr(&init_user_ns, dentry, cachefiles_xattr_cache, type,
-			   2, XATTR_CREATE);
-	if (ret == 0) {
-		_debug("SET"); /* we succeeded */
-		goto error;
-	}
-
-	if (ret != -EEXIST) {
-		pr_err("Can't set xattr on %pd [%lu] (err %d)\n",
-		       dentry, d_backing_inode(dentry)->i_ino,
-		       -ret);
-		goto error;
-	}
-
-	/* read the current type label */
-	ret = vfs_getxattr(&init_user_ns, dentry, cachefiles_xattr_cache, xtype,
-			   3);
-	if (ret < 0) {
-		if (ret == -ERANGE)
-			goto bad_type_length;
-
-		pr_err("Can't read xattr on %pd [%lu] (err %d)\n",
-		       dentry, d_backing_inode(dentry)->i_ino,
-		       -ret);
-		goto error;
-	}
-
-	/* check the type is what we're expecting */
-	if (ret != 2)
-		goto bad_type_length;
-
-	if (xtype[0] != type[0] || xtype[1] != type[1])
-		goto bad_type;
-
-	ret = 0;
-
-error:
-	_leave(" = %d", ret);
-	return ret;
-
-bad_type_length:
-	pr_err("Cache object %lu type xattr length incorrect\n",
-	       d_backing_inode(dentry)->i_ino);
-	ret = -EIO;
-	goto error;
-
-bad_type:
-	xtype[2] = 0;
-	pr_err("Cache object %pd [%lu] type %s not %s\n",
-	       dentry, d_backing_inode(dentry)->i_ino,
-	       xtype, type);
-	ret = -EIO;
-	goto error;
-}
-
 /*
  * set the state xattr on a cache file
  */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

