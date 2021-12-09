Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD9946F09E
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Dec 2021 18:06:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639069616;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Eaxt5HP44eqkr4nJoK+YRUHxBuLthfjOynn0IuqjGUw=;
	b=b7bLLFyHGKsDpGx63WH1fkAGD6kStiqdl8fRbZyVHCRJeAQlEsgU4cE8UBIWtLG8OwnFAv
	zWJiSm4mrddU+hpMi9AFD0a62dBtvYAiwROLiahjZGyOUMmS9PLU1+j2lYAPRCs7dxnLaZ
	xl59QBKoHc/LKkjHpAjG+wJxPBFgWT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-lqk9BgVCN6mqVK4M3gMDZA-1; Thu, 09 Dec 2021 12:06:53 -0500
X-MC-Unique: lqk9BgVCN6mqVK4M3gMDZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1515C3E74D;
	Thu,  9 Dec 2021 17:06:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05D615ED33;
	Thu,  9 Dec 2021 17:06:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD92E4A71A;
	Thu,  9 Dec 2021 17:06:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B9H5fSV019872 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 9 Dec 2021 12:05:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6C61F60C4A; Thu,  9 Dec 2021 17:05:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 976D560C82;
	Thu,  9 Dec 2021 17:05:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 09 Dec 2021 17:05:28 +0000
Message-ID: <163906952877.143852.4140962906331914859.stgit@warthog.procyon.org.uk>
In-Reply-To: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
References: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
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
Subject: [Linux-cachefs] [PATCH v2 50/67] cachefiles: Implement cookie
	resize for truncate
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

Implement resizing an object, using truncate and/or fallocate to adjust the
object.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819646631.215744.13819016478175576761.stgit@warthog.procyon.org.uk/ # v1
---

 fs/cachefiles/interface.c |   78 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index ad9d311413ff..51c968cd00a6 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -220,6 +220,83 @@ static bool cachefiles_lookup_cookie(struct fscache_cookie *cookie)
 	return false;
 }
 
+/*
+ * Shorten the backing object to discard any dirty data and free up
+ * any unused granules.
+ */
+static bool cachefiles_shorten_object(struct cachefiles_object *object,
+				      struct file *file, loff_t new_size)
+{
+	struct cachefiles_cache *cache = object->volume->cache;
+	struct inode *inode = file_inode(file);
+	loff_t i_size, dio_size;
+	int ret;
+
+	dio_size = round_up(new_size, CACHEFILES_DIO_BLOCK_SIZE);
+	i_size = i_size_read(inode);
+
+	trace_cachefiles_trunc(object, inode, i_size, dio_size,
+			       cachefiles_trunc_shrink);
+	ret = cachefiles_inject_remove_error();
+	if (ret == 0)
+		ret = vfs_truncate(&file->f_path, dio_size);
+	if (ret < 0) {
+		trace_cachefiles_io_error(object, file_inode(file), ret,
+					  cachefiles_trace_trunc_error);
+		cachefiles_io_error_obj(object, "Trunc-to-size failed %d", ret);
+		cachefiles_remove_object_xattr(cache, object, file->f_path.dentry);
+		return false;
+	}
+
+	if (new_size < dio_size) {
+		trace_cachefiles_trunc(object, inode, dio_size, new_size,
+				       cachefiles_trunc_dio_adjust);
+		ret = cachefiles_inject_write_error();
+		if (ret == 0)
+			ret = vfs_fallocate(file, FALLOC_FL_ZERO_RANGE,
+					    new_size, dio_size);
+		if (ret < 0) {
+			trace_cachefiles_io_error(object, file_inode(file), ret,
+						  cachefiles_trace_fallocate_error);
+			cachefiles_io_error_obj(object, "Trunc-to-dio-size failed %d", ret);
+			cachefiles_remove_object_xattr(cache, object, file->f_path.dentry);
+			return false;
+		}
+	}
+
+	return true;
+}
+
+/*
+ * Resize the backing object.
+ */
+static void cachefiles_resize_cookie(struct netfs_cache_resources *cres,
+				     loff_t new_size)
+{
+	struct cachefiles_object *object = cachefiles_cres_object(cres);
+	struct cachefiles_cache *cache = object->volume->cache;
+	struct fscache_cookie *cookie = object->cookie;
+	const struct cred *saved_cred;
+	struct file *file = cachefiles_cres_file(cres);
+	loff_t old_size = cookie->object_size;
+
+	_enter("%llu->%llu", old_size, new_size);
+
+	if (new_size < old_size) {
+		cachefiles_begin_secure(cache, &saved_cred);
+		cachefiles_shorten_object(object, file, new_size);
+		cachefiles_end_secure(cache, saved_cred);
+		object->cookie->object_size = new_size;
+		return;
+	}
+
+	/* The file is being expanded.  We don't need to do anything
+	 * particularly.  cookie->initial_size doesn't change and so the point
+	 * at which we have to download before doesn't change.
+	 */
+	cookie->object_size = new_size;
+}
+
 /*
  * Commit changes to the object as we drop it.
  */
@@ -363,5 +440,6 @@ const struct fscache_cache_ops cachefiles_cache_ops = {
 	.withdraw_cookie	= cachefiles_withdraw_cookie,
 	.invalidate_cookie	= cachefiles_invalidate_cookie,
 	.begin_operation	= cachefiles_begin_operation,
+	.resize_cookie		= cachefiles_resize_cookie,
 	.prepare_to_write	= cachefiles_prepare_to_write,
 };


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

