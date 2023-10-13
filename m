Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D33A7C89E1
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Oct 2023 18:07:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697213231;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jzurDgDZ9/HPCSzUN+Sysvq9Whv8sj7xVeRF08DE0hQ=;
	b=K0YS4zgDyoxA4pJ5sqsPEMrr5ioblCmwFPfIJXCW9yIO3dtb/lFQvweFtIKMeF4efanrVy
	Vc5tNygouHTF0lBeS7ATxkDSka2a1RiwiL5aGMxhpBccnoZdXdK3n3HjJ3nKAox6Dv8Hdu
	GDjj/irhDDY858Kbjj/qEg5YPXtvolA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-DwINRyMNPXSzuWylCOmxHQ-1; Fri, 13 Oct 2023 12:07:08 -0400
X-MC-Unique: DwINRyMNPXSzuWylCOmxHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48C643C1F13F;
	Fri, 13 Oct 2023 16:07:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3CBB825C2;
	Fri, 13 Oct 2023 16:07:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0DAB119465A2;
	Fri, 13 Oct 2023 16:07:07 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 999051946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Oct 2023 16:07:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 897B540C6CA3; Fri, 13 Oct 2023 16:07:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7102C40C6F79;
 Fri, 13 Oct 2023 16:07:02 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Date: Fri, 13 Oct 2023 17:04:14 +0100
Message-ID: <20231013160423.2218093-46-dhowells@redhat.com>
In-Reply-To: <20231013160423.2218093-1-dhowells@redhat.com>
References: <20231013160423.2218093-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Subject: [Linux-cachefs] [RFC PATCH 45/53] cifs: Replace cifs_writedata with
 a wrapper around netfs_io_subrequest
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Dominique Martinet <asmadeus@codewreck.org>, linux-mm@kvack.org,
 Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
 Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, Shyam Prasad N <nspmangalore@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 ceph-devel@vger.kernel.org, Christian Brauner <christian@brauner.io>,
 linux-nfs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 netdev@vger.kernel.org, v9fs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace the cifs_writedata struct with the same wrapper around
netfs_io_subrequest that was used to replace cifs_readdata.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cifs@vger.kernel.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/smb/client/cifsglob.h  | 30 +++------------
 fs/smb/client/cifsproto.h | 16 ++++++--
 fs/smb/client/cifssmb.c   |  9 ++---
 fs/smb/client/file.c      | 79 ++++++++++++++++-----------------------
 fs/smb/client/smb2pdu.c   |  9 ++---
 fs/smb/client/smb2proto.h |  3 +-
 6 files changed, 58 insertions(+), 88 deletions(-)

diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index 1943d035b8d3..0b1835751bda 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -238,7 +238,6 @@ struct cifs_fattr;
 struct smb3_fs_context;
 struct cifs_fid;
 struct cifs_io_subrequest;
-struct cifs_writedata;
 struct cifs_io_parms;
 struct cifs_search_info;
 struct cifsInodeInfo;
@@ -413,8 +412,7 @@ struct smb_version_operations {
 	/* async read from the server */
 	int (*async_readv)(struct cifs_io_subrequest *);
 	/* async write to the server */
-	int (*async_writev)(struct cifs_writedata *,
-			    void (*release)(struct kref *));
+	int (*async_writev)(struct cifs_io_subrequest *);
 	/* sync read from the server */
 	int (*sync_read)(const unsigned int, struct cifs_fid *,
 			 struct cifs_io_parms *, unsigned int *, char **,
@@ -1438,35 +1436,17 @@ struct cifs_io_subrequest {
 #endif
 	struct cifs_credits		credits;
 
-	// TODO: Remove following elements
-	struct list_head		list;
-	struct completion		done;
-	struct work_struct		work;
-	struct iov_iter			iter;
-	__u64				offset;
-	unsigned int			bytes;
-};
+	enum writeback_sync_modes	sync_mode;
+	bool				uncached;
+	struct bio_vec			*bv;
 
-/* asynchronous write support */
-struct cifs_writedata {
-	struct kref			refcount;
+	// TODO: Remove following elements
 	struct list_head		list;
 	struct completion		done;
-	enum writeback_sync_modes	sync_mode;
 	struct work_struct		work;
-	struct cifsFileInfo		*cfile;
-	struct cifs_aio_ctx		*ctx;
 	struct iov_iter			iter;
-	struct bio_vec			*bv;
 	__u64				offset;
-	pid_t				pid;
 	unsigned int			bytes;
-	int				result;
-	struct TCP_Server_Info		*server;
-#ifdef CONFIG_CIFS_SMB_DIRECT
-	struct smbd_mr			*mr;
-#endif
-	struct cifs_credits		credits;
 };
 
 /*
diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
index 7748fe148fb4..561dac1576a5 100644
--- a/fs/smb/client/cifsproto.h
+++ b/fs/smb/client/cifsproto.h
@@ -589,11 +589,19 @@ static inline void cifs_put_readdata(struct cifs_io_subrequest *rdata)
 int cifs_async_readv(struct cifs_io_subrequest *rdata);
 int cifs_readv_receive(struct TCP_Server_Info *server, struct mid_q_entry *mid);
 
-int cifs_async_writev(struct cifs_writedata *wdata,
-		      void (*release)(struct kref *kref));
+int cifs_async_writev(struct cifs_io_subrequest *wdata);
 void cifs_writev_complete(struct work_struct *work);
-struct cifs_writedata *cifs_writedata_alloc(work_func_t complete);
-void cifs_writedata_release(struct kref *refcount);
+struct cifs_io_subrequest *cifs_writedata_alloc(work_func_t complete);
+void cifs_writedata_release(struct cifs_io_subrequest *rdata);
+static inline void cifs_get_writedata(struct cifs_io_subrequest *wdata)
+{
+	refcount_inc(&wdata->subreq.ref);
+}
+static inline void cifs_put_writedata(struct cifs_io_subrequest *wdata)
+{
+	if (refcount_dec_and_test(&wdata->subreq.ref))
+		cifs_writedata_release(wdata);
+}
 int cifs_query_mf_symlink(unsigned int xid, struct cifs_tcon *tcon,
 			  struct cifs_sb_info *cifs_sb,
 			  const unsigned char *path, char *pbuf,
diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
index 76005b3d5ffe..14fca3fa3e08 100644
--- a/fs/smb/client/cifssmb.c
+++ b/fs/smb/client/cifssmb.c
@@ -1610,7 +1610,7 @@ CIFSSMBWrite(const unsigned int xid, struct cifs_io_parms *io_parms,
 static void
 cifs_writev_callback(struct mid_q_entry *mid)
 {
-	struct cifs_writedata *wdata = mid->callback_data;
+	struct cifs_io_subrequest *wdata = mid->callback_data;
 	struct cifs_tcon *tcon = tlink_tcon(wdata->cfile->tlink);
 	unsigned int written;
 	WRITE_RSP *smb = (WRITE_RSP *)mid->resp_buf;
@@ -1655,8 +1655,7 @@ cifs_writev_callback(struct mid_q_entry *mid)
 
 /* cifs_async_writev - send an async write, and set up mid to handle result */
 int
-cifs_async_writev(struct cifs_writedata *wdata,
-		  void (*release)(struct kref *kref))
+cifs_async_writev(struct cifs_io_subrequest *wdata)
 {
 	int rc = -EACCES;
 	WRITE_REQ *smb = NULL;
@@ -1723,14 +1722,14 @@ cifs_async_writev(struct cifs_writedata *wdata,
 		iov[1].iov_len += 4; /* pad bigger by four bytes */
 	}
 
-	kref_get(&wdata->refcount);
+	cifs_get_writedata(wdata);
 	rc = cifs_call_async(tcon->ses->server, &rqst, NULL,
 			     cifs_writev_callback, NULL, wdata, 0, NULL);
 
 	if (rc == 0)
 		cifs_stats_inc(&tcon->stats.cifs_stats.num_writes);
 	else
-		kref_put(&wdata->refcount, release);
+		cifs_put_writedata(wdata);
 
 async_writev_out:
 	cifs_small_buf_release(smb);
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index 0383ce61ac35..c192a38b1b7c 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -2410,10 +2410,10 @@ cifs_get_readable_path(struct cifs_tcon *tcon, const char *name,
 }
 
 void
-cifs_writedata_release(struct kref *refcount)
+cifs_writedata_release(struct cifs_io_subrequest *wdata)
 {
-	struct cifs_writedata *wdata = container_of(refcount,
-					struct cifs_writedata, refcount);
+	if (wdata->uncached)
+		kref_put(&wdata->ctx->refcount, cifs_aio_ctx_release);
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	if (wdata->mr) {
 		smbd_deregister_mr(wdata->mr);
@@ -2432,7 +2432,7 @@ cifs_writedata_release(struct kref *refcount)
  * possible that the page was redirtied so re-clean the page.
  */
 static void
-cifs_writev_requeue(struct cifs_writedata *wdata)
+cifs_writev_requeue(struct cifs_io_subrequest *wdata)
 {
 	int rc = 0;
 	struct inode *inode = d_inode(wdata->cfile->dentry);
@@ -2442,7 +2442,7 @@ cifs_writev_requeue(struct cifs_writedata *wdata)
 
 	server = tlink_tcon(wdata->cfile->tlink)->ses->server;
 	do {
-		struct cifs_writedata *wdata2;
+		struct cifs_io_subrequest *wdata2;
 		unsigned int wsize, cur_len;
 
 		wsize = server->ops->wp_retry_size(inode);
@@ -2465,7 +2465,7 @@ cifs_writev_requeue(struct cifs_writedata *wdata)
 		wdata2->sync_mode = wdata->sync_mode;
 		wdata2->offset	= fpos;
 		wdata2->bytes	= cur_len;
-		wdata2->iter	= wdata->iter;
+		wdata2->iter = wdata->iter;
 
 		iov_iter_advance(&wdata2->iter, fpos - wdata->offset);
 		iov_iter_truncate(&wdata2->iter, wdata2->bytes);
@@ -2487,11 +2487,10 @@ cifs_writev_requeue(struct cifs_writedata *wdata)
 				rc = -EBADF;
 		} else {
 			wdata2->pid = wdata2->cfile->pid;
-			rc = server->ops->async_writev(wdata2,
-						       cifs_writedata_release);
+			rc = server->ops->async_writev(wdata2);
 		}
 
-		kref_put(&wdata2->refcount, cifs_writedata_release);
+		cifs_put_writedata(wdata2);
 		if (rc) {
 			if (is_retryable_error(rc))
 				continue;
@@ -2510,14 +2509,14 @@ cifs_writev_requeue(struct cifs_writedata *wdata)
 
 	if (rc != 0 && !is_retryable_error(rc))
 		mapping_set_error(inode->i_mapping, rc);
-	kref_put(&wdata->refcount, cifs_writedata_release);
+	cifs_put_writedata(wdata);
 }
 
 void
 cifs_writev_complete(struct work_struct *work)
 {
-	struct cifs_writedata *wdata = container_of(work,
-						struct cifs_writedata, work);
+	struct cifs_io_subrequest *wdata = container_of(work,
+						struct cifs_io_subrequest, work);
 	struct inode *inode = d_inode(wdata->cfile->dentry);
 
 	if (wdata->result == 0) {
@@ -2538,16 +2537,16 @@ cifs_writev_complete(struct work_struct *work)
 
 	if (wdata->result != -EAGAIN)
 		mapping_set_error(inode->i_mapping, wdata->result);
-	kref_put(&wdata->refcount, cifs_writedata_release);
+	cifs_put_writedata(wdata);
 }
 
-struct cifs_writedata *cifs_writedata_alloc(work_func_t complete)
+struct cifs_io_subrequest *cifs_writedata_alloc(work_func_t complete)
 {
-	struct cifs_writedata *wdata;
+	struct cifs_io_subrequest *wdata;
 
 	wdata = kzalloc(sizeof(*wdata), GFP_NOFS);
 	if (wdata != NULL) {
-		kref_init(&wdata->refcount);
+		refcount_set(&wdata->subreq.ref, 1);
 		INIT_LIST_HEAD(&wdata->list);
 		init_completion(&wdata->done);
 		INIT_WORK(&wdata->work, complete);
@@ -2729,7 +2728,7 @@ static ssize_t cifs_write_back_from_locked_folio(struct address_space *mapping,
 {
 	struct inode *inode = mapping->host;
 	struct TCP_Server_Info *server;
-	struct cifs_writedata *wdata;
+	struct cifs_io_subrequest *wdata;
 	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
 	struct cifs_credits credits_on_stack;
 	struct cifs_credits *credits = &credits_on_stack;
@@ -2822,10 +2821,9 @@ static ssize_t cifs_write_back_from_locked_folio(struct address_space *mapping,
 		if (wdata->cfile->invalidHandle)
 			rc = -EAGAIN;
 		else
-			rc = wdata->server->ops->async_writev(wdata,
-							      cifs_writedata_release);
+			rc = wdata->server->ops->async_writev(wdata);
 		if (rc >= 0) {
-			kref_put(&wdata->refcount, cifs_writedata_release);
+			cifs_put_writedata(wdata);
 			goto err_close;
 		}
 	} else {
@@ -2835,7 +2833,7 @@ static ssize_t cifs_write_back_from_locked_folio(struct address_space *mapping,
 	}
 
 err_wdata:
-	kref_put(&wdata->refcount, cifs_writedata_release);
+	cifs_put_writedata(wdata);
 err_uncredit:
 	add_credits_and_wake_if(server, credits, 0);
 err_close:
@@ -3224,23 +3222,13 @@ int cifs_flush(struct file *file, fl_owner_t id)
 	return rc;
 }
 
-static void
-cifs_uncached_writedata_release(struct kref *refcount)
-{
-	struct cifs_writedata *wdata = container_of(refcount,
-					struct cifs_writedata, refcount);
-
-	kref_put(&wdata->ctx->refcount, cifs_aio_ctx_release);
-	cifs_writedata_release(refcount);
-}
-
 static void collect_uncached_write_data(struct cifs_aio_ctx *ctx);
 
 static void
 cifs_uncached_writev_complete(struct work_struct *work)
 {
-	struct cifs_writedata *wdata = container_of(work,
-					struct cifs_writedata, work);
+	struct cifs_io_subrequest *wdata = container_of(work,
+					struct cifs_io_subrequest, work);
 	struct inode *inode = d_inode(wdata->cfile->dentry);
 	struct cifsInodeInfo *cifsi = CIFS_I(inode);
 
@@ -3253,11 +3241,11 @@ cifs_uncached_writev_complete(struct work_struct *work)
 	complete(&wdata->done);
 	collect_uncached_write_data(wdata->ctx);
 	/* the below call can possibly free the last ref to aio ctx */
-	kref_put(&wdata->refcount, cifs_uncached_writedata_release);
+	cifs_put_writedata(wdata);
 }
 
 static int
-cifs_resend_wdata(struct cifs_writedata *wdata, struct list_head *wdata_list,
+cifs_resend_wdata(struct cifs_io_subrequest *wdata, struct list_head *wdata_list,
 	struct cifs_aio_ctx *ctx)
 {
 	unsigned int wsize;
@@ -3306,8 +3294,7 @@ cifs_resend_wdata(struct cifs_writedata *wdata, struct list_head *wdata_list,
 					wdata->mr = NULL;
 				}
 #endif
-				rc = server->ops->async_writev(wdata,
-					cifs_uncached_writedata_release);
+				rc = server->ops->async_writev(wdata);
 			}
 		}
 
@@ -3322,7 +3309,7 @@ cifs_resend_wdata(struct cifs_writedata *wdata, struct list_head *wdata_list,
 	} while (rc == -EAGAIN);
 
 fail:
-	kref_put(&wdata->refcount, cifs_uncached_writedata_release);
+	cifs_put_writedata(wdata);
 	return rc;
 }
 
@@ -3374,7 +3361,7 @@ cifs_write_from_iter(loff_t fpos, size_t len, struct iov_iter *from,
 {
 	int rc = 0;
 	size_t cur_len, max_len;
-	struct cifs_writedata *wdata;
+	struct cifs_io_subrequest *wdata;
 	pid_t pid;
 	struct TCP_Server_Info *server;
 	unsigned int xid, max_segs = INT_MAX;
@@ -3438,6 +3425,7 @@ cifs_write_from_iter(loff_t fpos, size_t len, struct iov_iter *from,
 			break;
 		}
 
+		wdata->uncached	= true;
 		wdata->sync_mode = WB_SYNC_ALL;
 		wdata->offset	= (__u64)fpos;
 		wdata->cfile	= cifsFileInfo_get(open_file);
@@ -3457,14 +3445,12 @@ cifs_write_from_iter(loff_t fpos, size_t len, struct iov_iter *from,
 			if (wdata->cfile->invalidHandle)
 				rc = -EAGAIN;
 			else
-				rc = server->ops->async_writev(wdata,
-					cifs_uncached_writedata_release);
+				rc = server->ops->async_writev(wdata);
 		}
 
 		if (rc) {
 			add_credits_and_wake_if(server, &wdata->credits, 0);
-			kref_put(&wdata->refcount,
-				 cifs_uncached_writedata_release);
+			cifs_put_writedata(wdata);
 			if (rc == -EAGAIN)
 				continue;
 			break;
@@ -3482,7 +3468,7 @@ cifs_write_from_iter(loff_t fpos, size_t len, struct iov_iter *from,
 
 static void collect_uncached_write_data(struct cifs_aio_ctx *ctx)
 {
-	struct cifs_writedata *wdata, *tmp;
+	struct cifs_io_subrequest *wdata, *tmp;
 	struct cifs_tcon *tcon;
 	struct cifs_sb_info *cifs_sb;
 	struct dentry *dentry = ctx->cfile->dentry;
@@ -3537,8 +3523,7 @@ static void collect_uncached_write_data(struct cifs_aio_ctx *ctx)
 						ctx->cfile, cifs_sb, &tmp_list,
 						ctx);
 
-					kref_put(&wdata->refcount,
-						cifs_uncached_writedata_release);
+					cifs_put_writedata(wdata);
 				}
 
 				list_splice(&tmp_list, &ctx->list);
@@ -3546,7 +3531,7 @@ static void collect_uncached_write_data(struct cifs_aio_ctx *ctx)
 			}
 		}
 		list_del_init(&wdata->list);
-		kref_put(&wdata->refcount, cifs_uncached_writedata_release);
+		cifs_put_writedata(wdata);
 	}
 
 	cifs_stats_bytes_written(tcon, ctx->total_len);
diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index cc3d80a66869..4f98631f2cf4 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -4415,7 +4415,7 @@ SMB2_read(const unsigned int xid, struct cifs_io_parms *io_parms,
 static void
 smb2_writev_callback(struct mid_q_entry *mid)
 {
-	struct cifs_writedata *wdata = mid->callback_data;
+	struct cifs_io_subrequest *wdata = mid->callback_data;
 	struct cifs_tcon *tcon = tlink_tcon(wdata->cfile->tlink);
 	struct TCP_Server_Info *server = wdata->server;
 	unsigned int written;
@@ -4496,8 +4496,7 @@ smb2_writev_callback(struct mid_q_entry *mid)
 
 /* smb2_async_writev - send an async write, and set up mid to handle result */
 int
-smb2_async_writev(struct cifs_writedata *wdata,
-		  void (*release)(struct kref *kref))
+smb2_async_writev(struct cifs_io_subrequest *wdata)
 {
 	int rc = -EACCES, flags = 0;
 	struct smb2_write_req *req = NULL;
@@ -4629,7 +4628,7 @@ smb2_async_writev(struct cifs_writedata *wdata,
 		flags |= CIFS_HAS_CREDITS;
 	}
 
-	kref_get(&wdata->refcount);
+	cifs_get_writedata(wdata);
 	rc = cifs_call_async(server, &rqst, NULL, smb2_writev_callback, NULL,
 			     wdata, flags, &wdata->credits);
 
@@ -4641,7 +4640,7 @@ smb2_async_writev(struct cifs_writedata *wdata,
 				     io_parms->offset,
 				     io_parms->length,
 				     rc);
-		kref_put(&wdata->refcount, release);
+		cifs_put_writedata(wdata);
 		cifs_stats_fail_inc(tcon, SMB2_WRITE_HE);
 	}
 
diff --git a/fs/smb/client/smb2proto.h b/fs/smb/client/smb2proto.h
index 02ffe5ec9b21..4d3d51e42d3c 100644
--- a/fs/smb/client/smb2proto.h
+++ b/fs/smb/client/smb2proto.h
@@ -189,8 +189,7 @@ extern int SMB2_get_srv_num(const unsigned int xid, struct cifs_tcon *tcon,
 extern int smb2_async_readv(struct cifs_io_subrequest *rdata);
 extern int SMB2_read(const unsigned int xid, struct cifs_io_parms *io_parms,
 		     unsigned int *nbytes, char **buf, int *buf_type);
-extern int smb2_async_writev(struct cifs_writedata *wdata,
-			     void (*release)(struct kref *kref));
+extern int smb2_async_writev(struct cifs_io_subrequest *wdata);
 extern int SMB2_write(const unsigned int xid, struct cifs_io_parms *io_parms,
 		      unsigned int *nbytes, struct kvec *iov, int n_vec);
 extern int SMB2_echo(struct TCP_Server_Info *server);
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

