Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFF9437E60
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:13:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634929979;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jSwsghNHF77vroXECxyOsLgv3hNqe1H2Zevvz8YmSJ0=;
	b=Kw0Grcfjv/WGvglgHCpcqtzuYW1epwBTi7dZkjhlqRT4DlMVVwx3nouuQjohJNB/jdYTye
	fS1LXxnsOQAPGav21PzbGOeG9gqQIw160hT88ERYGgQ0sCYXKHP2UsEgc59cPqnebkhlMZ
	cArFMIy7iIrglpNdR7er4wNhKQOwu9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-vOGCmKIkPdqyhTMBit8ocQ-1; Fri, 22 Oct 2021 15:12:56 -0400
X-MC-Unique: vOGCmKIkPdqyhTMBit8ocQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 183EC362FA;
	Fri, 22 Oct 2021 19:12:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0845A5F4E9;
	Fri, 22 Oct 2021 19:12:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E981218199EE;
	Fri, 22 Oct 2021 19:12:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJ9lxY013029 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:09:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5969C60C13; Fri, 22 Oct 2021 19:09:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1282960C04;
	Fri, 22 Oct 2021 19:09:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Fri, 22 Oct 2021 20:09:40 +0100
Message-ID: <163492978023.1038219.13345268757845593653.stgit@warthog.procyon.org.uk>
In-Reply-To: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Jeff Layton <jlayton@kernel.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH v2 47/53] afs: Add synchronous O_DIRECT
	support
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

Add synchronous O_DIRECT support to AFS (no AIO yet).  It can theoretically
handle reads and writes up to the maximum size describable by an s64 - and
given an iterator with sufficiently capacity to handle that and given
support on the server.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: linux-afs@lists.infradead.org
cc: linux-cachefs@redhat.com
---

 fs/afs/file.c     |   59 +++++++++++++++++++++++++++++++++++++++++++
 fs/afs/fsclient.c |    2 +
 fs/afs/internal.h |    1 +
 fs/afs/write.c    |   72 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+), 1 deletion(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index c0cf8bfa00e8..7fe57f210259 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -28,6 +28,7 @@ static ssize_t afs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter);
 static void afs_vm_open(struct vm_area_struct *area);
 static void afs_vm_close(struct vm_area_struct *area);
 static vm_fault_t afs_vm_map_pages(struct vm_fault *vmf, pgoff_t start_pgoff, pgoff_t end_pgoff);
+static ssize_t afs_direct_IO(struct kiocb *iocb, struct iov_iter *iter);
 
 const struct file_operations afs_file_operations = {
 	.open		= afs_open,
@@ -56,6 +57,7 @@ const struct address_space_operations afs_fs_aops = {
 	.launder_page	= afs_launder_page,
 	.releasepage	= afs_releasepage,
 	.invalidatepage	= afs_invalidatepage,
+	.direct_IO	= afs_direct_IO,
 	.write_begin	= afs_write_begin,
 	.write_end	= afs_write_end,
 	.writepage	= afs_writepage,
@@ -602,3 +604,60 @@ static ssize_t afs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 
 	return generic_file_read_iter(iocb, iter);
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
+	req->pos	= iocb->ki_pos;
+	req->len	= iov_iter_count(iter);
+	req->iter	= iter;
+
+	task_io_account_read(req->len);
+
+	// TODO nfs_start_io_direct(inode);
+	ret = afs_fetch_data(vnode, req);
+	if (ret == 0)
+		transferred = req->actual_len;
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
index 4943413d9c5f..a7273106803c 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -439,7 +439,7 @@ static void afs_fs_fetch_data64(struct afs_operation *op)
 	bp[3] = htonl(vp->fid.unique);
 	bp[4] = htonl(upper_32_bits(req->pos));
 	bp[5] = htonl(lower_32_bits(req->pos));
-	bp[6] = 0;
+	bp[6] = htonl(upper_32_bits(req->len));
 	bp[7] = htonl(lower_32_bits(req->len));
 
 	trace_afs_make_fs_call(call, &vp->fid);
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 07d34291bf4f..3d640e84588e 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1538,6 +1538,7 @@ extern int afs_fsync(struct file *, loff_t, loff_t, int);
 extern vm_fault_t afs_page_mkwrite(struct vm_fault *vmf);
 extern void afs_prune_wb_keys(struct afs_vnode *);
 extern int afs_launder_page(struct page *);
+extern ssize_t afs_file_direct_write(struct kiocb *, struct iov_iter *);
 
 /*
  * xattr.c
diff --git a/fs/afs/write.c b/fs/afs/write.c
index fa96a65d28be..94a21ee974c0 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -1040,3 +1040,75 @@ static void afs_write_to_cache(struct afs_vnode *vnode,
 			       vnode->vfs_inode.i_mapping, start, len, i_size,
 			       afs_write_to_cache_done, vnode);
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
+	op->file[0].set_size	= true;
+	op->file[0].modification = true;
+	op->store.write_iter	= iter;
+	op->store.pos		= iocb->ki_pos;
+	op->store.size		= size;
+	op->store.i_size	= max(iocb->ki_pos + size, i_size);
+	op->mtime		= current_time(&vnode->vfs_inode);
+	op->ops			= &afs_dio_store_data_operation;
+
+	//if (!is_sync_kiocb(iocb)) {
+
+	ret = afs_do_sync_operation(op);
+	if (ret == 0)
+		ret = size;
+
+	afs_invalidate_cache(vnode, FSCACHE_INVAL_DIO_WRITE);
+
+	//if (iocb->ki_complete)
+	//	iocb->ki_complete(iocb, ret, 0); // only if ret == -EIOCBQUEUED
+
+	_leave(" = %zd", ret);
+	return ret;
+}


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

