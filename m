Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C644321CC
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 17:05:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569534;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FhZr8nZT4QQAdivb39rG8JBpXEMwhm435ZyF9YlgFO8=;
	b=ijxkI6xd0Vr8Kx8kaB3Svf3l0RUzZwF2DLYJG4KN5UDO/MnOCYN0XagwzwI0GMWRkGLNPQ
	pquTJBKSXuml9fQdNjspoj+ELD1jc/HgHJd6Q4lpDsXM2ZRdzWMQoz168b1hAcvrjpfIoi
	O/Nxpoit9Ktn2XJVtuW30g9YSPwsUBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-nR3eVYYuPc-AHEgO_jo9_g-1; Mon, 18 Oct 2021 11:05:31 -0400
X-MC-Unique: nR3eVYYuPc-AHEgO_jo9_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 853061922962;
	Mon, 18 Oct 2021 15:05:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 765B15C1D0;
	Mon, 18 Oct 2021 15:05:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 371E24EA2A;
	Mon, 18 Oct 2021 15:05:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IF5RJ0029824 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 11:05:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70AE560657; Mon, 18 Oct 2021 15:05:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A12FE57CA4;
	Mon, 18 Oct 2021 15:05:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 16:05:11 +0100
Message-ID: <163456951186.2614702.16840420880926305225.stgit@warthog.procyon.org.uk>
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
Subject: [Linux-cachefs] [PATCH 55/67] afs: Skip truncation on the server of
 data we haven't written yet
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't send a truncation RPC to the server if we're only shortening data
that's in the pagecache and is beyond the server's EOF.

Also don't automatically force writeback on setattr, but do wait to store
RPCs that are in the region to be removed on a shortening truncation.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/inode.c |   45 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index c4af4fda37dd..4c66a2b86add 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -848,42 +848,67 @@ static const struct afs_operation_ops afs_setattr_operation = {
 int afs_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
 		struct iattr *attr)
 {
+	const unsigned int supported =
+		ATTR_SIZE | ATTR_MODE | ATTR_UID | ATTR_GID |
+		ATTR_MTIME | ATTR_MTIME_SET | ATTR_TIMES_SET | ATTR_TOUCH;
 	struct afs_operation *op;
 	struct afs_vnode *vnode = AFS_FS_I(d_inode(dentry));
+	struct inode *inode = &vnode->vfs_inode;
+	loff_t i_size;
 	int ret;
 
 	_enter("{%llx:%llu},{n=%pd},%x",
 	       vnode->fid.vid, vnode->fid.vnode, dentry,
 	       attr->ia_valid);
 
-	if (!(attr->ia_valid & (ATTR_SIZE | ATTR_MODE | ATTR_UID | ATTR_GID |
-				ATTR_MTIME | ATTR_MTIME_SET | ATTR_TIMES_SET |
-				ATTR_TOUCH))) {
+	if (!(attr->ia_valid & supported)) {
 		_leave(" = 0 [unsupported]");
 		return 0;
 	}
 
+	i_size = i_size_read(inode);
 	if (attr->ia_valid & ATTR_SIZE) {
-		if (!S_ISREG(vnode->vfs_inode.i_mode))
+		if (!S_ISREG(inode->i_mode))
 			return -EISDIR;
 
-		ret = inode_newsize_ok(&vnode->vfs_inode, attr->ia_size);
+		ret = inode_newsize_ok(inode, attr->ia_size);
 		if (ret)
 			return ret;
 
-		if (attr->ia_size == i_size_read(&vnode->vfs_inode))
+		if (attr->ia_size == i_size)
 			attr->ia_valid &= ~ATTR_SIZE;
 	}
 
 	fscache_use_cookie(afs_vnode_cache(vnode), true);
 
-	/* flush any dirty data outstanding on a regular file */
-	if (S_ISREG(vnode->vfs_inode.i_mode))
-		filemap_write_and_wait(vnode->vfs_inode.i_mapping);
-
 	/* Prevent any new writebacks from starting whilst we do this. */
 	down_write(&vnode->validate_lock);
 
+	if ((attr->ia_valid & ATTR_SIZE) && S_ISREG(inode->i_mode)) {
+		loff_t size = attr->ia_size;
+
+		/* Wait for any outstanding writes to the server to complete */
+		loff_t from = min(size, i_size);
+		loff_t to = max(size, i_size);
+		ret = filemap_fdatawait_range(inode->i_mapping, from, to);
+		if (ret < 0)
+			goto out_unlock;
+
+		/* Don't talk to the server if we're just shortening in-memory
+		 * writes that haven't gone to the server yet.
+		 */
+		if (!(attr->ia_valid & (supported & ~ATTR_SIZE & ~ATTR_MTIME)) &&
+		    attr->ia_size < i_size &&
+		    attr->ia_size > vnode->status.size) {
+			truncate_pagecache(inode, attr->ia_size);
+			fscache_resize_cookie(afs_vnode_cache(vnode),
+					      attr->ia_size);
+			i_size_write(inode, attr->ia_size);
+			ret = 0;
+			goto out_unlock;
+		}
+	}
+
 	op = afs_alloc_operation(((attr->ia_valid & ATTR_FILE) ?
 				  afs_file_key(attr->ia_file) : NULL),
 				 vnode->volume);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

