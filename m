Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5356321DD92
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Jul 2020 18:39:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594658383;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zkb9f/txcr871cTd6aPhBpXzi5ued2JrEeBLH6RXdNY=;
	b=EicExDhaNMhuzPXRq6nIp8G6/Cmjd+DxBwNLQd+a0rE+78ESQrbb2gDNP0KqnuZZRm2C1k
	ItYemX0rzIoRJHdj7pTYL4yTzbkOl+mSkld0E/wYN7+I6zBRcbIsXIuvJRG4VYr3l6FZ0S
	cKF/B3SeKfJ+VsYcOvzmEVp8N+Gb8Kg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-31y1pJu2PnuZqEmG1psz6A-1; Mon, 13 Jul 2020 12:39:41 -0400
X-MC-Unique: 31y1pJu2PnuZqEmG1psz6A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B7571081;
	Mon, 13 Jul 2020 16:39:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ACD36FEF3;
	Mon, 13 Jul 2020 16:39:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9B9B1809554;
	Mon, 13 Jul 2020 16:39:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DGdbUK029145 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 12:39:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4628872E42; Mon, 13 Jul 2020 16:39:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-113.rdu2.redhat.com
	[10.10.112.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7FF2072E41;
	Mon, 13 Jul 2020 16:39:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>
Date: Mon, 13 Jul 2020 17:39:30 +0100
Message-ID: <159465837067.1377938.13569650454944979305.stgit@warthog.procyon.org.uk>
In-Reply-To: <159465821598.1377938.2046362270225008168.stgit@warthog.procyon.org.uk>
References: <159465821598.1377938.2046362270225008168.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 13/13] afs: Add O_DIRECT read support
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

Add synchronous O_DIRECT read support to AFS (no AIO yet).  It can
theoretically handle reads up to the maximum size describable by loff_t -
and given an iterator with sufficiently capacity to handle that and given
support on the server.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/file.c      |   59 +++++++++++++++++++++++++++++++++++++++
 fs/afs/fsclient.c  |   18 +++++++++---
 fs/afs/internal.h  |    2 +
 fs/afs/write.c     |   78 ++++++++++++++++++++++++++++++++++++++++++++++------
 fs/afs/yfsclient.c |   12 +++++---
 mm/filemap.c       |    9 +++++-
 6 files changed, 159 insertions(+), 19 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 5aa7b89e7359..0ee0e94ba042 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -24,6 +24,7 @@ static int afs_releasepage(struct page *page, gfp_t gfp_flags);
 
 static int afs_readpages(struct file *filp, struct address_space *mapping,
 			 struct list_head *pages, unsigned nr_pages);
+static ssize_t afs_direct_IO(struct kiocb *iocb, struct iov_iter *iter);
 
 const struct file_operations afs_file_operations = {
 	.open		= afs_open,
@@ -52,6 +53,7 @@ const struct address_space_operations afs_fs_aops = {
 	.launder_page	= afs_launder_page,
 	.releasepage	= afs_releasepage,
 	.invalidatepage	= afs_invalidatepage,
+	.direct_IO	= afs_direct_IO,
 	.write_begin	= afs_write_begin,
 	.write_end	= afs_write_end,
 	.writepage	= afs_writepage,
@@ -586,3 +588,60 @@ static int afs_file_mmap(struct file *file, struct vm_area_struct *vma)
 		vma->vm_ops = &afs_vm_ops;
 	return ret;
 }
+
+/*
+ * Direct file read operation for an AFS file.
+ *
+ * TODO: To support AIO, the pages in the iterator have to be copied and
+ * refs taken on them.  Then -EIOCBQUEUED needs to be returned.
+ * iocb->ki_complete must then be called upon completion of the operation.
+ */
+static ssize_t afs_file_direct_read(struct kiocb *iocb, struct iov_iter *iter)
+{
+	struct file *file = iocb->ki_filp;
+	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
+	struct afs_read *req;
+	ssize_t ret, transferred;
+
+	_enter("%llx,%zx", iocb->ki_pos, iov_iter_count(iter));
+
+	req = afs_alloc_read(GFP_KERNEL);
+	if (!req)
+		return -ENOMEM;
+
+	req->vnode	= vnode;
+	req->key	= key_get(afs_file_key(file));
+	req->cache.pos	= iocb->ki_pos;
+	req->cache.len	= iov_iter_count(iter);
+	req->iter	= iter;
+
+	task_io_account_read(req->cache.len);
+
+	// TODO nfs_start_io_direct(inode);
+	ret = afs_fetch_data(vnode, req);
+	if (ret == 0)
+		transferred = req->cache.transferred;
+	afs_put_read(req);
+
+	// TODO nfs_end_io_direct(inode);
+
+	if (ret == 0)
+		ret = transferred;
+
+	BUG_ON(ret == -EIOCBQUEUED); // TODO
+	//if (iocb->ki_complete)
+	//	iocb->ki_complete(iocb, ret, 0); // only if ret == -EIOCBQUEUED
+
+	_leave(" = %zu", ret);
+	return ret;
+}
+
+/*
+ * Do direct I/O.
+ */
+static ssize_t afs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
+{
+	if (iov_iter_rw(iter) == READ)
+		return afs_file_direct_read(iocb, iter);
+	return afs_file_direct_write(iocb, iter);
+}
diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index e729a19f28c5..1d0465654256 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -446,7 +446,7 @@ static void afs_fs_fetch_data64(struct afs_operation *op)
 	bp[3] = htonl(vp->fid.unique);
 	bp[4] = htonl(upper_32_bits(req->cache.pos));
 	bp[5] = htonl(lower_32_bits(req->cache.pos));
-	bp[6] = 0;
+	bp[6] = htonl(upper_32_bits(req->cache.len));
 	bp[7] = htonl(lower_32_bits(req->cache.len));
 
 	trace_afs_make_fs_call(call, &vp->fid);
@@ -1066,6 +1066,7 @@ static void afs_fs_store_data64(struct afs_operation *op)
 	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
 	__be32 *bp;
+	u32 mask = 0;
 
 	_enter(",%x,{%llx:%llu},,",
 	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
@@ -1078,6 +1079,9 @@ static void afs_fs_store_data64(struct afs_operation *op)
 
 	call->write_iter = op->store.write_iter;
 
+	if (op->flags & AFS_OPERATION_SET_MTIME)
+		mask |= AFS_SET_MTIME;
+
 	/* marshall the parameters */
 	bp = call->request;
 	*bp++ = htonl(FSSTOREDATA64);
@@ -1085,8 +1089,8 @@ static void afs_fs_store_data64(struct afs_operation *op)
 	*bp++ = htonl(vp->fid.vnode);
 	*bp++ = htonl(vp->fid.unique);
 
-	*bp++ = htonl(AFS_SET_MTIME); /* mask */
-	*bp++ = htonl(op->mtime.tv_sec); /* mtime */
+	*bp++ = htonl(mask);
+	*bp++ = htonl(op->mtime.tv_sec);
 	*bp++ = 0; /* owner */
 	*bp++ = 0; /* group */
 	*bp++ = 0; /* unix mode */
@@ -1111,6 +1115,7 @@ void afs_fs_store_data(struct afs_operation *op)
 	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
 	__be32 *bp;
+	u32 mask = 0;
 
 	_enter(",%x,{%llx:%llu},,",
 	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
@@ -1133,6 +1138,9 @@ void afs_fs_store_data(struct afs_operation *op)
 
 	call->write_iter = op->store.write_iter;
 
+	if (op->flags & AFS_OPERATION_SET_MTIME)
+		mask |= AFS_SET_MTIME;
+
 	/* marshall the parameters */
 	bp = call->request;
 	*bp++ = htonl(FSSTOREDATA);
@@ -1140,8 +1148,8 @@ void afs_fs_store_data(struct afs_operation *op)
 	*bp++ = htonl(vp->fid.vnode);
 	*bp++ = htonl(vp->fid.unique);
 
-	*bp++ = htonl(AFS_SET_MTIME); /* mask */
-	*bp++ = htonl(op->mtime.tv_sec); /* mtime */
+	*bp++ = htonl(mask);
+	*bp++ = htonl(op->mtime.tv_sec);
 	*bp++ = 0; /* owner */
 	*bp++ = 0; /* group */
 	*bp++ = 0; /* unix mode */
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 8c9abfa33a91..7bb26975080f 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -843,6 +843,7 @@ struct afs_operation {
 #define AFS_OPERATION_TRIED_ALL		0x0400	/* Set if we've tried all the fileservers */
 #define AFS_OPERATION_RETRY_SERVER	0x0800	/* Set if we should retry the current server */
 #define AFS_OPERATION_DIR_CONFLICT	0x1000	/* Set if we detected a 3rd-party dir change */
+#define AFS_OPERATION_SET_MTIME		0x2000	/* Set if we should try to store the mtime */
 };
 
 /*
@@ -1440,6 +1441,7 @@ extern int afs_fsync(struct file *, loff_t, loff_t, int);
 extern vm_fault_t afs_page_mkwrite(struct vm_fault *vmf);
 extern void afs_prune_wb_keys(struct afs_vnode *);
 extern int afs_launder_page(struct page *);
+extern ssize_t afs_file_direct_write(struct kiocb *, struct iov_iter *);
 
 /*
  * xattr.c
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 10c60837775e..14d31adf4825 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -377,7 +377,7 @@ static int afs_store_data(struct afs_vnode *vnode, struct iov_iter *iter,
 	op->store.size = size;
 	op->store.i_size = max(pos + size, i_size);
 	op->mtime = vnode->vfs_inode.i_mtime;
-	op->flags |= AFS_OPERATION_UNINTR;
+	op->flags |= AFS_OPERATION_SET_MTIME | AFS_OPERATION_UNINTR;
 	op->ops = &afs_store_data_operation;
 
 try_next_key:
@@ -732,7 +732,6 @@ int afs_writepages(struct address_space *mapping,
 ssize_t afs_file_write(struct kiocb *iocb, struct iov_iter *from)
 {
 	struct afs_vnode *vnode = AFS_FS_I(file_inode(iocb->ki_filp));
-	ssize_t result;
 	size_t count = iov_iter_count(from);
 
 	_enter("{%llx:%llu},{%zu},",
@@ -744,13 +743,7 @@ ssize_t afs_file_write(struct kiocb *iocb, struct iov_iter *from)
 		return -EBUSY;
 	}
 
-	if (!count)
-		return 0;
-
-	result = generic_file_write_iter(iocb, from);
-
-	_leave(" = %zd", result);
-	return result;
+	return generic_file_write_iter(iocb, from);
 }
 
 /*
@@ -992,3 +985,70 @@ static void afs_write_to_cache(struct afs_vnode *vnode,
 abandon:
 	afs_clear_fscache_bits(vnode->vfs_inode.i_mapping, start, last);
 }
+
+static void afs_dio_store_data_success(struct afs_operation *op)
+{
+	struct afs_vnode *vnode = op->file[0].vnode;
+
+	op->ctime = op->file[0].scb.status.mtime_client;
+	afs_vnode_commit_status(op, &op->file[0]);
+	if (op->error == 0) {
+		afs_stat_v(vnode, n_stores);
+		atomic_long_add(op->store.size, &afs_v2net(vnode)->n_store_bytes);
+	}
+}
+
+static const struct afs_operation_ops afs_dio_store_data_operation = {
+	.issue_afs_rpc	= afs_fs_store_data,
+	.issue_yfs_rpc	= yfs_fs_store_data,
+	.success	= afs_dio_store_data_success,
+};
+
+/*
+ * Direct file write operation for an AFS file.
+ *
+ * TODO: To support AIO, the pages in the iterator have to be copied and
+ * refs taken on them.  Then -EIOCBQUEUED needs to be returned.
+ * iocb->ki_complete must then be called upon completion of the operation.
+ */
+ssize_t afs_file_direct_write(struct kiocb *iocb, struct iov_iter *iter)
+{
+	struct file *file = iocb->ki_filp;
+	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
+	struct afs_operation *op;
+	loff_t size = iov_iter_count(iter), i_size;
+	ssize_t ret;
+
+	_enter("%s{%llx:%llu.%u},%llx,%llx",
+	       vnode->volume->name,
+	       vnode->fid.vid,
+	       vnode->fid.vnode,
+	       vnode->fid.unique,
+	       size, iocb->ki_pos);
+
+	op = afs_alloc_operation(afs_file_key(file), vnode->volume);
+	if (IS_ERR(op))
+		return -ENOMEM;
+
+	i_size = i_size_read(&vnode->vfs_inode);
+
+	afs_op_set_vnode(op, 0, vnode);
+	op->file[0].dv_delta	= 1;
+	op->store.write_iter	= iter;
+	op->store.pos		= iocb->ki_pos;
+	op->store.size		= size;
+	op->store.i_size	= max(iocb->ki_pos + size, i_size);
+	op->ops			= &afs_dio_store_data_operation;
+
+	//if (!is_sync_kiocb(iocb)) {
+
+	ret = afs_do_sync_operation(op);
+	if (ret == 0)
+		ret = size;
+
+	//if (iocb->ki_complete)
+	//	iocb->ki_complete(iocb, ret, 0); // only if ret == -EIOCBQUEUED
+
+	_leave(" = %zd", ret);
+	return ret;
+}
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index 4ead0c1f9014..04c285e6b4ed 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -95,12 +95,16 @@ static __be32 *xdr_encode_YFSStoreStatus_mode(__be32 *bp, mode_t mode)
 	return bp + xdr_size(x);
 }
 
-static __be32 *xdr_encode_YFSStoreStatus_mtime(__be32 *bp, const struct timespec64 *t)
+static __be32 *xdr_encode_YFSStoreStatus_mtime(__be32 *bp, struct afs_operation *op)
 {
 	struct yfs_xdr_YFSStoreStatus *x = (void *)bp;
-	s64 mtime = linux_to_yfs_time(t);
+	s64 mtime = linux_to_yfs_time(&op->mtime);
+	u32 mask = 0;
 
-	x->mask		= htonl(AFS_SET_MTIME);
+	if (op->flags & AFS_OPERATION_SET_MTIME)
+		mask |= AFS_SET_MTIME;
+
+	x->mask		= htonl(mask);
 	x->mode		= htonl(0);
 	x->mtime_client	= u64_to_xdr(mtime);
 	x->owner	= u64_to_xdr(0);
@@ -1112,7 +1116,7 @@ void yfs_fs_store_data(struct afs_operation *op)
 	bp = xdr_encode_u32(bp, YFSSTOREDATA64);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
 	bp = xdr_encode_YFSFid(bp, &vp->fid);
-	bp = xdr_encode_YFSStoreStatus_mtime(bp, &op->mtime);
+	bp = xdr_encode_YFSStoreStatus_mtime(bp, op);
 	bp = xdr_encode_u64(bp, op->store.pos);
 	bp = xdr_encode_u64(bp, op->store.size);
 	bp = xdr_encode_u64(bp, op->store.i_size);
diff --git a/mm/filemap.c b/mm/filemap.c
index 4894e9705d34..6c52de0674eb 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3245,7 +3245,14 @@ generic_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 		}
 		iocb->ki_pos = pos;
 	}
-	iov_iter_revert(from, write_len - iov_iter_count(from));
+	{
+		size_t unroll = write_len - iov_iter_count(from);
+		if (unroll > MAX_RW_COUNT)
+			pr_warn("XXX unroll %zd [%zd - %zd]",
+				unroll, write_len, iov_iter_count(from));
+		else
+			iov_iter_revert(from, unroll);
+	}
 out:
 	return written;
 }


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

