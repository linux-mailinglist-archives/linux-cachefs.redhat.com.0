Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A27432173
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 17:02:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569336;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iZ0d0QxM5KeqRslU1rGEvTnNyRaqhPntjIEY/mUtZe4=;
	b=UMw9jXrsl6vFX2WzZl4EoPn+nV9gwy4nxL4vMYiycVNKAdejI+yGlSiuD4nqHVvmkymv/q
	Z6PJ6rqvqHsbvBp17TfH3J3z2IGYhb2qb4akx4S23CvB/TswYr8rw7v59ZEYwOOPEzxgA2
	4765lgn3pU/PEgXABd1FaxcMO8BbWG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-uxvtoEshOWiS5XfrKjP6vw-1; Mon, 18 Oct 2021 11:02:13 -0400
X-MC-Unique: uxvtoEshOWiS5XfrKjP6vw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24B2F802575;
	Mon, 18 Oct 2021 15:02:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEF7D707B6;
	Mon, 18 Oct 2021 15:02:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC30F4EA2F;
	Mon, 18 Oct 2021 15:02:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IF28Oc029406 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 11:02:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CC72370F5A; Mon, 18 Oct 2021 15:02:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A731D62A44;
	Mon, 18 Oct 2021 15:02:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 16:02:01 +0100
Message-ID: <163456932180.2614702.9793858366854318097.stgit@warthog.procyon.org.uk>
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
Subject: [Linux-cachefs] [PATCH 47/67] cachefiles: Put more information in
 the xattr attached to the cache file
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Put some more information into the xattr attached to a cache file including
the size of the object (i_size may get rounded to a block size for DIO
purposes), the point after which the server has no data and a content
mapping type.

Note that the new cache and the old cache will see each other's cache files
as being incoherent and discard them.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/interface.c |    1 +
 fs/cachefiles/internal.h  |   11 +++++++++++
 fs/cachefiles/xattr.c     |   25 +++++++++++++++++++------
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index f90f6ddd07a5..751b0fec4591 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -420,6 +420,7 @@ static bool cachefiles_invalidate_cookie(struct fscache_cookie *cookie)
 
 	old_file = object->file;
 	object->file = new_file;
+	object->content_info = CACHEFILES_CONTENT_NO_DATA;
 	set_bit(CACHEFILES_OBJECT_USING_TMPFILE, &object->flags);
 	set_bit(FSCACHE_COOKIE_NEEDS_UPDATE, &object->cookie->flags);
 
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index a2d2ed2f19eb..1d3e37bca087 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -31,6 +31,16 @@ extern unsigned cachefiles_debug;
 
 #define cachefiles_gfp (__GFP_RECLAIM | __GFP_NORETRY | __GFP_NOMEMALLOC)
 
+enum cachefiles_content {
+	/* These values are saved on disk */
+	CACHEFILES_CONTENT_NO_DATA	= 0, /* No content stored */
+	CACHEFILES_CONTENT_SINGLE	= 1, /* Content is monolithic, all is present */
+	CACHEFILES_CONTENT_ALL		= 2, /* Content is all present, no map */
+	CACHEFILES_CONTENT_BACKFS_MAP	= 3, /* Content is piecemeal, mapped through backing fs */
+	CACHEFILES_CONTENT_DIRTY	= 4, /* Content is dirty (only seen on disk) */
+	nr__cachefiles_content
+};
+
 /*
  * Cached volume representation.
  */
@@ -59,6 +69,7 @@ struct cachefiles_object {
 	u8				key_hash;	/* Hash of object key */
 	unsigned long			flags;
 #define CACHEFILES_OBJECT_USING_TMPFILE	0		/* Have an unlinked tmpfile */
+	enum cachefiles_content		content_info:8;	/* Info about content presence */
 };
 
 extern struct kmem_cache *cachefiles_object_jar;
diff --git a/fs/cachefiles/xattr.c b/fs/cachefiles/xattr.c
index 50b2a4588946..ba3d050a5174 100644
--- a/fs/cachefiles/xattr.c
+++ b/fs/cachefiles/xattr.c
@@ -18,8 +18,11 @@
 #define CACHEFILES_COOKIE_TYPE_DATA 1
 
 struct cachefiles_xattr {
-	uint8_t				type;
-	uint8_t				data[];
+	__be64	object_size;	/* Actual size of the object */
+	__be64	zero_point;	/* Size after which server has no data not written by us */
+	__u8	type;		/* Type of object */
+	__u8	content;	/* Content presence (enum cachefiles_content) */
+	__u8	data[];		/* netfs coherency data */
 } __packed;
 
 static const char cachefiles_xattr_cache[] =
@@ -46,7 +49,10 @@ int cachefiles_set_object_xattr(struct cachefiles_object *object)
 	if (!buf)
 		return -ENOMEM;
 
-	buf->type = CACHEFILES_COOKIE_TYPE_DATA;
+	buf->object_size	= cpu_to_be64(object->cookie->object_size);
+	buf->zero_point		= 0;
+	buf->type		= CACHEFILES_COOKIE_TYPE_DATA;
+	buf->content		= object->content_info;
 	if (len > 0)
 		memcpy(buf->data, fscache_get_aux(object->cookie), len);
 
@@ -54,7 +60,7 @@ int cachefiles_set_object_xattr(struct cachefiles_object *object)
 			   buf, sizeof(struct cachefiles_xattr) + len, 0);
 	if (ret < 0) {
 		trace_cachefiles_coherency(object, file_inode(file)->i_ino,
-					   0,
+					   buf->content,
 					   cachefiles_coherency_set_fail);
 		if (ret != -ENOMEM)
 			cachefiles_io_error_obj(
@@ -62,7 +68,7 @@ int cachefiles_set_object_xattr(struct cachefiles_object *object)
 				"Failed to set xattr with error %d", ret);
 	} else {
 		trace_cachefiles_coherency(object, file_inode(file)->i_ino,
-					   0,
+					   buf->content,
 					   cachefiles_coherency_set_ok);
 	}
 
@@ -100,12 +106,19 @@ int cachefiles_check_auxdata(struct cachefiles_object *object, struct file *file
 		why = cachefiles_coherency_check_type;
 	} else if (memcmp(buf->data, p, len) != 0) {
 		why = cachefiles_coherency_check_aux;
+	} else if (be64_to_cpu(buf->object_size) != object->cookie->object_size) {
+		why = cachefiles_coherency_check_objsize;
+	} else if (buf->content == CACHEFILES_CONTENT_DIRTY) {
+		// TODO: Begin conflict resolution
+		pr_warn("Dirty object in cache\n");
+		why = cachefiles_coherency_check_dirty;
 	} else {
 		why = cachefiles_coherency_check_ok;
 		ret = 0;
 	}
 
-	trace_cachefiles_coherency(object, file_inode(file)->i_ino, 0, why);
+	trace_cachefiles_coherency(object, file_inode(file)->i_ino,
+				   buf->content, why);
 	kfree(buf);
 	return ret;
 }


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

