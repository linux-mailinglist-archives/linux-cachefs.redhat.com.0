Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ABA4777F4
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Dec 2021 17:17:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639671430;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b39vk/ngc0amgiMst9CmFErUGji+p2BwR9uX+83Dsm4=;
	b=GSK+JQ7bwonJeMX9TD1RzAm1oqvEeRNmvKDpvXQpRSx52Im+PjuF94v4mlFcFYQ1nQsOvl
	AJBNMAJO6V/YqqRpO7WXaAfUV4xHAlKbljBnXcT0FEh76GHD+traSc98I3kz3vYt3Wlsgx
	AWw/a04RdZn44r99tJS/a7bYbaU9JVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-Y6cCqJ24P-O-6FweRklLeg-1; Thu, 16 Dec 2021 11:17:08 -0500
X-MC-Unique: Y6cCqJ24P-O-6FweRklLeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B1B880BCAF;
	Thu, 16 Dec 2021 16:17:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CA675BE1F;
	Thu, 16 Dec 2021 16:17:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DA9D4BB7C;
	Thu, 16 Dec 2021 16:17:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BGGH3QP007682 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 16 Dec 2021 11:17:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C5C481037F4C; Thu, 16 Dec 2021 16:17:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64BBD1037F42;
	Thu, 16 Dec 2021 16:17:00 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 16 Dec 2021 16:16:59 +0000
Message-ID: <163967141952.1823006.7832985646370603833.stgit@warthog.procyon.org.uk>
In-Reply-To: <163967073889.1823006.12237147297060239168.stgit@warthog.procyon.org.uk>
References: <163967073889.1823006.12237147297060239168.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Subject: [Linux-cachefs] [PATCH v3 39/68] cachefiles: Implement a function
 to get/create a directory in the cache
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

Implement a function to get/create structural directories in the cache.
This is used for setting up a cache and creating volume substructures.  The
directory in memory are marked with the S_KERNEL_FILE inode flag whilst
they're in use to tell rmdir to reject attempts to remove them.

Changes
=======
ver #3:
 - Return an indication as to whether the directory was freshly created.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819631182.215744.3322471539523262619.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/163906933130.143852.962088616746509062.stgit@warthog.procyon.org.uk/ # v2
---

 fs/cachefiles/internal.h |    9 +++
 fs/cachefiles/namei.c    |  141 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 150 insertions(+)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 3783a3e01027..48768a3ab105 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -125,6 +125,15 @@ static inline int cachefiles_inject_remove_error(void)
 	return cachefiles_error_injection_state & 2 ? -EIO : 0;
 }
 
+/*
+ * namei.c
+ */
+extern struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
+					       struct dentry *dir,
+					       const char *name,
+					       bool *_is_new);
+extern void cachefiles_put_directory(struct dentry *dir);
+
 /*
  * security.c
  */
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index 913f83f1c900..11a33209ab5f 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/fs.h>
+#include <linux/namei.h>
 #include "internal.h"
 
 /*
@@ -41,3 +42,143 @@ static void __cachefiles_unmark_inode_in_use(struct cachefiles_object *object,
 	inode->i_flags &= ~S_KERNEL_FILE;
 	trace_cachefiles_mark_inactive(object, inode);
 }
+
+/*
+ * get a subdirectory
+ */
+struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
+					struct dentry *dir,
+					const char *dirname,
+					bool *_is_new)
+{
+	struct dentry *subdir;
+	struct path path;
+	int ret;
+
+	_enter(",,%s", dirname);
+
+	/* search the current directory for the element name */
+	inode_lock_nested(d_inode(dir), I_MUTEX_PARENT);
+
+retry:
+	ret = cachefiles_inject_read_error();
+	if (ret == 0)
+		subdir = lookup_one_len(dirname, dir, strlen(dirname));
+	else
+		subdir = ERR_PTR(ret);
+	if (IS_ERR(subdir)) {
+		trace_cachefiles_vfs_error(NULL, d_backing_inode(dir),
+					   PTR_ERR(subdir),
+					   cachefiles_trace_lookup_error);
+		if (PTR_ERR(subdir) == -ENOMEM)
+			goto nomem_d_alloc;
+		goto lookup_error;
+	}
+
+	_debug("subdir -> %pd %s",
+	       subdir, d_backing_inode(subdir) ? "positive" : "negative");
+
+	/* we need to create the subdir if it doesn't exist yet */
+	if (d_is_negative(subdir)) {
+		ret = cachefiles_has_space(cache, 1, 0);
+		if (ret < 0)
+			goto mkdir_error;
+
+		_debug("attempt mkdir");
+
+		path.mnt = cache->mnt;
+		path.dentry = dir;
+		ret = security_path_mkdir(&path, subdir, 0700);
+		if (ret < 0)
+			goto mkdir_error;
+		ret = cachefiles_inject_write_error();
+		if (ret == 0)
+			ret = vfs_mkdir(&init_user_ns, d_inode(dir), subdir, 0700);
+		if (ret < 0) {
+			trace_cachefiles_vfs_error(NULL, d_inode(dir), ret,
+						   cachefiles_trace_mkdir_error);
+			goto mkdir_error;
+		}
+
+		if (unlikely(d_unhashed(subdir))) {
+			cachefiles_put_directory(subdir);
+			goto retry;
+		}
+		ASSERT(d_backing_inode(subdir));
+
+		_debug("mkdir -> %pd{ino=%lu}",
+		       subdir, d_backing_inode(subdir)->i_ino);
+		if (_is_new)
+			*_is_new = true;
+	}
+
+	/* Tell rmdir() it's not allowed to delete the subdir */
+	inode_lock(d_inode(subdir));
+	inode_unlock(d_inode(dir));
+
+	if (!__cachefiles_mark_inode_in_use(NULL, subdir))
+		goto mark_error;
+
+	inode_unlock(d_inode(subdir));
+
+	/* we need to make sure the subdir is a directory */
+	ASSERT(d_backing_inode(subdir));
+
+	if (!d_can_lookup(subdir)) {
+		pr_err("%s is not a directory\n", dirname);
+		ret = -EIO;
+		goto check_error;
+	}
+
+	ret = -EPERM;
+	if (!(d_backing_inode(subdir)->i_opflags & IOP_XATTR) ||
+	    !d_backing_inode(subdir)->i_op->lookup ||
+	    !d_backing_inode(subdir)->i_op->mkdir ||
+	    !d_backing_inode(subdir)->i_op->rename ||
+	    !d_backing_inode(subdir)->i_op->rmdir ||
+	    !d_backing_inode(subdir)->i_op->unlink)
+		goto check_error;
+
+	_leave(" = [%lu]", d_backing_inode(subdir)->i_ino);
+	return subdir;
+
+check_error:
+	cachefiles_put_directory(subdir);
+	_leave(" = %d [check]", ret);
+	return ERR_PTR(ret);
+
+mark_error:
+	inode_unlock(d_inode(subdir));
+	dput(subdir);
+	return ERR_PTR(-EBUSY);
+
+mkdir_error:
+	inode_unlock(d_inode(dir));
+	dput(subdir);
+	pr_err("mkdir %s failed with error %d\n", dirname, ret);
+	return ERR_PTR(ret);
+
+lookup_error:
+	inode_unlock(d_inode(dir));
+	ret = PTR_ERR(subdir);
+	pr_err("Lookup %s failed with error %d\n", dirname, ret);
+	return ERR_PTR(ret);
+
+nomem_d_alloc:
+	inode_unlock(d_inode(dir));
+	_leave(" = -ENOMEM");
+	return ERR_PTR(-ENOMEM);
+}
+
+/*
+ * Put a subdirectory.
+ */
+void cachefiles_put_directory(struct dentry *dir)
+{
+	if (dir) {
+		inode_lock(dir->d_inode);
+		__cachefiles_unmark_inode_in_use(NULL, dir);
+		inode_unlock(dir->d_inode);
+		dput(dir);
+	}
+}


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

