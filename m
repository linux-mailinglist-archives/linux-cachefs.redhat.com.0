Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F101486BF0
	for <lists+linux-cachefs@lfdr.de>; Thu,  6 Jan 2022 22:33:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641504792;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SmH41qZHb9EJuHamipbK4txAnOrbfEB6ktEsnunnw/E=;
	b=YcF7An3u8o5ZMkazvNA3KkPbX1jiYAJnio+9Zm6aCX3ozBKI7x4THg4dK3kDVQ0kCC6SDN
	25O8rScEoATUQxaJ3m8rurdxnRXVWoN4e1cneGNA5FTyA/kls9pVNp3NqffE6J9IjwSI8d
	2SrLcdRih+6U/C+jbXlBCRP8GNrBU3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-nAOk6tn1NCGMzCMFyUqFGQ-1; Thu, 06 Jan 2022 16:33:09 -0500
X-MC-Unique: nAOk6tn1NCGMzCMFyUqFGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F030581CCB6;
	Thu,  6 Jan 2022 21:33:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B45E25BE3B;
	Thu,  6 Jan 2022 21:33:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 529094BB7C;
	Thu,  6 Jan 2022 21:33:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 206LX5iO027295 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 6 Jan 2022 16:33:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0BFA65DF3A; Thu,  6 Jan 2022 21:33:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E2565DF37;
	Thu,  6 Jan 2022 21:32:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: smfrench@gmail.com
Date: Thu, 06 Jan 2022 21:32:45 +0000
Message-ID: <164150476548.2994594.12291632629854686642.stgit@warthog.procyon.org.uk>
In-Reply-To: <164150471440.2994594.16990036181824162931.stgit@warthog.procyon.org.uk>
References: <164150471440.2994594.16990036181824162931.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: nspmangalore@gmail.com, linux-cachefs@redhat.com, jlayton@kernel.org,
	linux-cifs@vger.kernel.org
Subject: [Linux-cachefs] [PATCH v2 3/3] cifs: Eliminate pages list from
 cifs_readdata, cifs_writedata and smb_rqst
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

Replace the list of pages in the cifs_readdata, cifs_writedata and smb_rqst
structs with iterators.
---

 fs/cifs/cifsencrypt.c |   40 +-
 fs/cifs/cifsfs.h      |    3 
 fs/cifs/cifsglob.h    |   22 -
 fs/cifs/cifsproto.h   |    7 
 fs/cifs/cifssmb.c     |  206 ++++++++----
 fs/cifs/file.c        |  808 +++++++++++++++++++------------------------------
 fs/cifs/misc.c        |   19 -
 fs/cifs/smb2ops.c     |  134 ++++----
 fs/cifs/smb2pdu.c     |   12 -
 fs/cifs/transport.c   |   41 --
 include/linux/uio.h   |    4 
 lib/iov_iter.c        |   42 +++
 12 files changed, 603 insertions(+), 735 deletions(-)

diff --git a/fs/cifs/cifsencrypt.c b/fs/cifs/cifsencrypt.c
index d118282071b3..1b83c72462d2 100644
--- a/fs/cifs/cifsencrypt.c
+++ b/fs/cifs/cifsencrypt.c
@@ -24,12 +24,27 @@
 #include "../smbfs_common/arc4.h"
 #include <crypto/aead.h>
 
+static ssize_t cifs_signature_scan(struct iov_iter *i, const void *p,
+				   size_t len, size_t off, void *priv)
+{
+	struct shash_desc *shash = priv;
+	int rc;
+
+	rc = crypto_shash_update(shash, p, len);
+	if (rc) {
+		cifs_dbg(VFS, "%s: Could not update with payload\n", __func__);
+		return rc;
+	}
+
+	return len;
+}
+
 int __cifs_calc_signature(struct smb_rqst *rqst,
 			struct TCP_Server_Info *server, char *signature,
 			struct shash_desc *shash)
 {
 	int i;
-	int rc;
+	ssize_t rc;
 	struct kvec *iov = rqst->rq_iov;
 	int n_vec = rqst->rq_nvec;
 	int is_smb2 = server->vals->header_preamble_size == 0;
@@ -62,25 +77,10 @@ int __cifs_calc_signature(struct smb_rqst *rqst,
 		}
 	}
 
-	/* now hash over the rq_pages array */
-	for (i = 0; i < rqst->rq_npages; i++) {
-		void *kaddr;
-		unsigned int len, offset;
-
-		rqst_page_get_length(rqst, i, &len, &offset);
-
-		kaddr = (char *) kmap(rqst->rq_pages[i]) + offset;
-
-		rc = crypto_shash_update(shash, kaddr, len);
-		if (rc) {
-			cifs_dbg(VFS, "%s: Could not update with payload\n",
-				 __func__);
-			kunmap(rqst->rq_pages[i]);
-			return rc;
-		}
-
-		kunmap(rqst->rq_pages[i]);
-	}
+	rc = iov_iter_scan(&rqst->rq_iter, iov_iter_count(&rqst->rq_iter),
+			   cifs_signature_scan, shash);
+	if (rc < 0)
+		return rc;
 
 	rc = crypto_shash_final(shash, signature);
 	if (rc)
diff --git a/fs/cifs/cifsfs.h b/fs/cifs/cifsfs.h
index 9e5d9e192ef0..c4b679dd6d5e 100644
--- a/fs/cifs/cifsfs.h
+++ b/fs/cifs/cifsfs.h
@@ -110,6 +110,9 @@ extern int cifs_file_strict_mmap(struct file * , struct vm_area_struct *);
 extern const struct file_operations cifs_dir_ops;
 extern int cifs_dir_open(struct inode *inode, struct file *file);
 extern int cifs_readdir(struct file *file, struct dir_context *ctx);
+extern void cifs_pages_written_back(struct inode *inode, loff_t start, unsigned int len);
+extern void cifs_pages_write_failed(struct inode *inode, loff_t start, unsigned int len);
+extern void cifs_pages_write_redirty(struct inode *inode, loff_t start, unsigned int len);
 
 /* Functions related to dir entries */
 extern const struct dentry_operations cifs_dentry_ops;
diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
index c1665ef5b946..c33803141712 100644
--- a/fs/cifs/cifsglob.h
+++ b/fs/cifs/cifsglob.h
@@ -185,11 +185,8 @@ struct cifs_cred {
 struct smb_rqst {
 	struct kvec	*rq_iov;	/* array of kvecs */
 	unsigned int	rq_nvec;	/* number of kvecs in array */
-	struct page	**rq_pages;	/* pointer to array of page ptrs */
-	unsigned int	rq_offset;	/* the offset to the 1st page */
-	unsigned int	rq_npages;	/* number pages in array */
-	unsigned int	rq_pagesz;	/* page size to use */
-	unsigned int	rq_tailsz;	/* length of last page */
+	struct iov_iter	rq_iter;	/* Data iterator */
+	struct xarray	rq_buffer;	/* Page buffer for encryption */
 };
 
 struct mid_q_entry;
@@ -1330,21 +1327,18 @@ struct cifs_readdata {
 	__u64				offset;
 	unsigned int			bytes;
 	unsigned int			got_bytes;
+	unsigned int			bv_count;
 	pid_t				pid;
 	int				result;
 	struct work_struct		work;
 	struct iov_iter			iter;
+	struct bio_vec			*bv;
 	struct kvec			iov[2];
 	struct TCP_Server_Info		*server;
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	struct smbd_mr			*mr;
 #endif
-	unsigned int			pagesz;
-	unsigned int			page_offset;
-	unsigned int			tailsz;
 	struct cifs_credits		credits;
-	unsigned int			nr_pages;
-	struct page			**pages;
 };
 
 /* asynchronous write support */
@@ -1356,20 +1350,18 @@ struct cifs_writedata {
 	struct work_struct		work;
 	struct cifsFileInfo		*cfile;
 	struct cifs_aio_ctx		*ctx;
+	struct iov_iter			iter;
+	struct bio_vec			*bv;
 	__u64				offset;
 	pid_t				pid;
 	unsigned int			bytes;
+	unsigned int			bv_count;
 	int				result;
 	struct TCP_Server_Info		*server;
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	struct smbd_mr			*mr;
 #endif
-	unsigned int			pagesz;
-	unsigned int			page_offset;
-	unsigned int			tailsz;
 	struct cifs_credits		credits;
-	unsigned int			nr_pages;
-	struct page			**pages;
 };
 
 /*
diff --git a/fs/cifs/cifsproto.h b/fs/cifs/cifsproto.h
index 9cfc160897e9..799c28f90bf1 100644
--- a/fs/cifs/cifsproto.h
+++ b/fs/cifs/cifsproto.h
@@ -567,10 +567,7 @@ int cifs_readv_receive(struct TCP_Server_Info *server, struct mid_q_entry *mid);
 int cifs_async_writev(struct cifs_writedata *wdata,
 		      void (*release)(struct kref *kref));
 void cifs_writev_complete(struct work_struct *work);
-struct cifs_writedata *cifs_writedata_alloc(unsigned int nr_pages,
-						work_func_t complete);
-struct cifs_writedata *cifs_writedata_direct_alloc(struct page **pages,
-						work_func_t complete);
+struct cifs_writedata *cifs_writedata_alloc(work_func_t complete);
 void cifs_writedata_release(struct kref *refcount);
 int cifs_query_mf_symlink(unsigned int xid, struct cifs_tcon *tcon,
 			  struct cifs_sb_info *cifs_sb,
@@ -593,8 +590,6 @@ int cifs_alloc_hash(const char *name, struct crypto_shash **shash,
 		    struct sdesc **sdesc);
 void cifs_free_hash(struct crypto_shash **shash, struct sdesc **sdesc);
 
-extern void rqst_page_get_length(struct smb_rqst *rqst, unsigned int page,
-				unsigned int *len, unsigned int *offset);
 struct cifs_chan *
 cifs_ses_find_chan(struct cifs_ses *ses, struct TCP_Server_Info *server);
 int cifs_try_adding_channels(struct cifs_sb_info *cifs_sb, struct cifs_ses *ses);
diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
index 96c901ed1524..11a6cf44a88f 100644
--- a/fs/cifs/cifssmb.c
+++ b/fs/cifs/cifssmb.c
@@ -25,6 +25,7 @@
 #include <linux/uaccess.h>
 #include <linux/netfs.h>
 #include "cifspdu.h"
+#include "cifsfs.h"
 #include "cifsglob.h"
 #include "cifsacl.h"
 #include "cifsproto.h"
@@ -1516,11 +1517,7 @@ cifs_readv_callback(struct mid_q_entry *mid)
 	struct TCP_Server_Info *server = tcon->ses->server;
 	struct smb_rqst rqst = { .rq_iov = rdata->iov,
 				 .rq_nvec = 2,
-				 .rq_pages = rdata->pages,
-				 .rq_offset = rdata->page_offset,
-				 .rq_npages = rdata->nr_pages,
-				 .rq_pagesz = rdata->pagesz,
-				 .rq_tailsz = rdata->tailsz };
+				 .rq_iter = rdata->iter };
 	struct cifs_credits credits = { .value = 1, .instance = 0 };
 
 	cifs_dbg(FYI, "%s: mid=%llu state=%d result=%d bytes=%u\n",
@@ -1883,10 +1880,93 @@ cifs_writedata_release(struct kref *refcount)
 	if (wdata->cfile)
 		cifsFileInfo_put(wdata->cfile);
 
-	kvfree(wdata->pages);
 	kfree(wdata);
 }
 
+/*
+ * Completion of write to server.
+ */
+void cifs_pages_written_back(struct inode *inode, loff_t start, unsigned int len)
+{
+	struct address_space *mapping = inode->i_mapping;
+	struct folio *folio;
+	pgoff_t end;
+
+	XA_STATE(xas, &mapping->i_pages, start / PAGE_SIZE);
+
+	rcu_read_lock();
+
+	end = (start + len - 1) / PAGE_SIZE;
+	xas_for_each(&xas, folio, end) {
+		if (!folio_test_writeback(folio)) {
+			pr_err("bad %x @%llx page %lx %lx\n",
+			       len, start, folio_index(folio), end);
+			BUG();
+		}
+
+		folio_detach_private(folio);
+		folio_end_writeback(folio);
+	}
+
+	rcu_read_unlock();
+}
+
+/*
+ * Failure of write to server.
+ */
+void cifs_pages_write_failed(struct inode *inode, loff_t start, unsigned int len)
+{
+	struct address_space *mapping = inode->i_mapping;
+	struct folio *folio;
+	pgoff_t end;
+
+	XA_STATE(xas, &mapping->i_pages, start / PAGE_SIZE);
+
+	rcu_read_lock();
+
+	end = (start + len - 1) / PAGE_SIZE;
+	xas_for_each(&xas, folio, end) {
+		if (!folio_test_writeback(folio)) {
+			pr_err("bad %x @%llx page %lx %lx\n",
+			       len, start, folio_index(folio), end);
+			BUG();
+		}
+
+		folio_set_error(folio);
+		folio_end_writeback(folio);
+	}
+
+	rcu_read_unlock();
+}
+
+/*
+ * Redirty pages after a temporary failure.
+ */
+void cifs_pages_write_redirty(struct inode *inode, loff_t start, unsigned int len)
+{
+	struct address_space *mapping = inode->i_mapping;
+	struct folio *folio;
+	pgoff_t end;
+
+	XA_STATE(xas, &mapping->i_pages, start / PAGE_SIZE);
+
+	rcu_read_lock();
+
+	end = (start + len - 1) / PAGE_SIZE;
+	xas_for_each(&xas, folio, end) {
+		if (!folio_test_writeback(folio)) {
+			pr_err("bad %x @%llx page %lx %lx\n",
+			       len, start, folio_index(folio), end);
+			BUG();
+		}
+
+		filemap_dirty_folio(folio->mapping, folio);
+		folio_end_writeback(folio);
+	}
+
+	rcu_read_unlock();
+}
+
 /*
  * Write failed with a retryable error. Resend the write request. It's also
  * possible that the page was redirtied so re-clean the page.
@@ -1894,51 +1974,56 @@ cifs_writedata_release(struct kref *refcount)
 static void
 cifs_writev_requeue(struct cifs_writedata *wdata)
 {
-	int i, rc = 0;
+	int rc = 0;
 	struct inode *inode = d_inode(wdata->cfile->dentry);
 	struct TCP_Server_Info *server;
-	unsigned int rest_len;
+	unsigned int rest_len = wdata->bytes;
+	loff_t fpos = wdata->offset;
 
 	server = tlink_tcon(wdata->cfile->tlink)->ses->server;
-	i = 0;
-	rest_len = wdata->bytes;
 	do {
 		struct cifs_writedata *wdata2;
-		unsigned int j, nr_pages, wsize, tailsz, cur_len;
+		unsigned int wsize, cur_len;
 
 		wsize = server->ops->wp_retry_size(inode);
 		if (wsize < rest_len) {
-			nr_pages = wsize / PAGE_SIZE;
-			if (!nr_pages) {
+			if (wsize < PAGE_SIZE) {
 				rc = -ENOTSUPP;
 				break;
 			}
-			cur_len = nr_pages * PAGE_SIZE;
-			tailsz = PAGE_SIZE;
+			cur_len = min(round_down(wsize, PAGE_SIZE), rest_len);
 		} else {
-			nr_pages = DIV_ROUND_UP(rest_len, PAGE_SIZE);
 			cur_len = rest_len;
-			tailsz = rest_len - (nr_pages - 1) * PAGE_SIZE;
 		}
 
-		wdata2 = cifs_writedata_alloc(nr_pages, cifs_writev_complete);
+		wdata2 = cifs_writedata_alloc(cifs_writev_complete);
 		if (!wdata2) {
 			rc = -ENOMEM;
 			break;
 		}
 
-		for (j = 0; j < nr_pages; j++) {
-			wdata2->pages[j] = wdata->pages[i + j];
-			lock_page(wdata2->pages[j]);
-			clear_page_dirty_for_io(wdata2->pages[j]);
-		}
-
 		wdata2->sync_mode = wdata->sync_mode;
-		wdata2->nr_pages = nr_pages;
-		wdata2->offset = page_offset(wdata2->pages[0]);
-		wdata2->pagesz = PAGE_SIZE;
-		wdata2->tailsz = tailsz;
-		wdata2->bytes = cur_len;
+		wdata2->offset	= fpos;
+		wdata2->bytes	= cur_len;
+		wdata2->iter	= wdata->iter;
+
+		iov_iter_advance(&wdata2->iter, fpos - wdata->offset);
+		iov_iter_truncate(&wdata2->iter, wdata2->bytes);
+
+#if 0
+		if (iov_iter_is_xarray(&wdata2->iter)) {
+			/* TODO: Check for pages having been redirtied and
+			 * clean them.  We can do this by walking the xarray.
+			 * If it's not an xarray, then it's a DIO and we
+			 * shouldn't be mucking around with the page bits.
+			 */
+			for (j = 0; j < nr_pages; j++) {
+				wdata2->pages[j] = wdata->pages[i + j];
+				lock_page(wdata2->pages[j]);
+				clear_page_dirty_for_io(wdata2->pages[j]);
+			}
+		}
+#endif
 
 		rc = cifs_get_writable_file(CIFS_I(inode), FIND_WR_ANY,
 					    &wdata2->cfile);
@@ -1953,33 +2038,25 @@ cifs_writev_requeue(struct cifs_writedata *wdata)
 						       cifs_writedata_release);
 		}
 
-		for (j = 0; j < nr_pages; j++) {
-			unlock_page(wdata2->pages[j]);
-			if (rc != 0 && !is_retryable_error(rc)) {
-				SetPageError(wdata2->pages[j]);
-				end_page_writeback(wdata2->pages[j]);
-				put_page(wdata2->pages[j]);
-			}
-		}
+		if (iov_iter_is_xarray(&wdata2->iter))
+			cifs_pages_written_back(inode, wdata2->offset, wdata2->bytes);
 
 		kref_put(&wdata2->refcount, cifs_writedata_release);
 		if (rc) {
 			if (is_retryable_error(rc))
 				continue;
-			i += nr_pages;
+			fpos += cur_len;
+			rest_len -= cur_len;
 			break;
 		}
 
+		fpos += cur_len;
 		rest_len -= cur_len;
-		i += nr_pages;
-	} while (i < wdata->nr_pages);
+	} while (rest_len > 0);
 
-	/* cleanup remaining pages from the original wdata */
-	for (; i < wdata->nr_pages; i++) {
-		SetPageError(wdata->pages[i]);
-		end_page_writeback(wdata->pages[i]);
-		put_page(wdata->pages[i]);
-	}
+	/* Clean up remaining pages from the original wdata */
+	if (iov_iter_is_xarray(&wdata->iter))
+		cifs_pages_written_back(inode, fpos, rest_len);
 
 	if (rc != 0 && !is_retryable_error(rc))
 		mapping_set_error(inode->i_mapping, rc);
@@ -1992,7 +2069,6 @@ cifs_writev_complete(struct work_struct *work)
 	struct cifs_writedata *wdata = container_of(work,
 						struct cifs_writedata, work);
 	struct inode *inode = d_inode(wdata->cfile->dentry);
-	int i = 0;
 
 	if (wdata->result == 0) {
 		spin_lock(&inode->i_lock);
@@ -2003,39 +2079,25 @@ cifs_writev_complete(struct work_struct *work)
 	} else if (wdata->sync_mode == WB_SYNC_ALL && wdata->result == -EAGAIN)
 		return cifs_writev_requeue(wdata);
 
-	for (i = 0; i < wdata->nr_pages; i++) {
-		struct page *page = wdata->pages[i];
-		if (wdata->result == -EAGAIN)
-			__set_page_dirty_nobuffers(page);
-		else if (wdata->result < 0)
-			SetPageError(page);
-		end_page_writeback(page);
-		put_page(page);
-	}
+	if (wdata->result == -EAGAIN)
+		cifs_pages_write_redirty(inode, wdata->offset, wdata->bytes);
+	else if (wdata->result < 0)
+		cifs_pages_write_failed(inode, wdata->offset, wdata->bytes);
+	else
+		cifs_pages_written_back(inode, wdata->offset, wdata->bytes);
+
 	if (wdata->result != -EAGAIN)
 		mapping_set_error(inode->i_mapping, wdata->result);
 	kref_put(&wdata->refcount, cifs_writedata_release);
 }
 
 struct cifs_writedata *
-cifs_writedata_alloc(unsigned int nr_pages, work_func_t complete)
-{
-	struct page **pages =
-		kcalloc(nr_pages, sizeof(struct page *), GFP_NOFS);
-	if (pages)
-		return cifs_writedata_direct_alloc(pages, complete);
-
-	return NULL;
-}
-
-struct cifs_writedata *
-cifs_writedata_direct_alloc(struct page **pages, work_func_t complete)
+cifs_writedata_alloc(work_func_t complete)
 {
 	struct cifs_writedata *wdata;
 
 	wdata = kzalloc(sizeof(*wdata), GFP_NOFS);
 	if (wdata != NULL) {
-		wdata->pages = pages;
 		kref_init(&wdata->refcount);
 		INIT_LIST_HEAD(&wdata->list);
 		init_completion(&wdata->done);
@@ -2143,11 +2205,7 @@ cifs_async_writev(struct cifs_writedata *wdata,
 
 	rqst.rq_iov = iov;
 	rqst.rq_nvec = 2;
-	rqst.rq_pages = wdata->pages;
-	rqst.rq_offset = wdata->page_offset;
-	rqst.rq_npages = wdata->nr_pages;
-	rqst.rq_pagesz = wdata->pagesz;
-	rqst.rq_tailsz = wdata->tailsz;
+	rqst.rq_iter = wdata->iter;
 
 	cifs_dbg(FYI, "async write at %llu %u bytes\n",
 		 wdata->offset, wdata->bytes);
diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index a12feb3ffdc4..e53df5398dc4 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -2269,294 +2269,333 @@ static int cifs_partialpagewrite(struct page *page, unsigned from, unsigned to)
 	return rc;
 }
 
-static struct cifs_writedata *
-wdata_alloc_and_fillpages(pgoff_t tofind, struct address_space *mapping,
-			  pgoff_t end, pgoff_t *index,
-			  unsigned int *found_pages)
+/*
+ * Extend the region to be written back to include subsequent contiguously
+ * dirty pages if possible, but don't sleep while doing so.
+ */
+static void cifs_extend_writeback(struct address_space *mapping,
+				  long *_count,
+				  loff_t start,
+				  loff_t max_len,
+				  unsigned int *_len)
 {
-	struct cifs_writedata *wdata;
-
-	wdata = cifs_writedata_alloc((unsigned int)tofind,
-				     cifs_writev_complete);
-	if (!wdata)
-		return NULL;
-
-	*found_pages = find_get_pages_range_tag(mapping, index, end,
-				PAGECACHE_TAG_DIRTY, tofind, wdata->pages);
-	return wdata;
-}
+	struct pagevec pvec;
+	struct folio *folio;
+	unsigned int psize;
+	loff_t len = *_len;
+	pgoff_t index = (start + len) / PAGE_SIZE;
+	bool stop = true;
+	unsigned int i;
 
-static unsigned int
-wdata_prepare_pages(struct cifs_writedata *wdata, unsigned int found_pages,
-		    struct address_space *mapping,
-		    struct writeback_control *wbc,
-		    pgoff_t end, pgoff_t *index, pgoff_t *next, bool *done)
-{
-	unsigned int nr_pages = 0, i;
-	struct page *page;
+	XA_STATE(xas, &mapping->i_pages, index);
+	pagevec_init(&pvec);
 
-	for (i = 0; i < found_pages; i++) {
-		page = wdata->pages[i];
-		/*
-		 * At this point we hold neither the i_pages lock nor the
-		 * page lock: the page may be truncated or invalidated
-		 * (changing page->mapping to NULL), or even swizzled
-		 * back from swapper_space to tmpfs file mapping
+	do {
+		/* Firstly, we gather up a batch of contiguous dirty pages
+		 * under the RCU read lock - but we can't clear the dirty flags
+		 * there if any of those pages are mapped.
 		 */
+		rcu_read_lock();
 
-		if (nr_pages == 0)
-			lock_page(page);
-		else if (!trylock_page(page))
-			break;
+		xas_for_each(&xas, folio, ULONG_MAX) {
+			stop = true;
+			if (xas_retry(&xas, folio))
+				continue;
+			if (xa_is_value(folio))
+				break;
+			if (folio_index(folio) != index)
+				break;
 
-		if (unlikely(page->mapping != mapping)) {
-			unlock_page(page);
-			break;
-		}
+			if (!folio_try_get_rcu(folio)) {
+				xas_reset(&xas);
+				continue;
+			}
 
-		if (!wbc->range_cyclic && page->index > end) {
-			*done = true;
-			unlock_page(page);
-			break;
-		}
+			/* Has the page moved or been split? */
+			if (unlikely(folio != xas_reload(&xas))) {
+				folio_put(folio);
+				break;
+			}
 
-		if (*next && (page->index != *next)) {
-			/* Not next consecutive page */
-			unlock_page(page);
-			break;
-		}
+			if (!folio_trylock(folio)) {
+				folio_put(folio);
+				break;
+			}
+			if (!folio_test_dirty(folio) || folio_test_writeback(folio)) {
+				folio_unlock(folio);
+				folio_put(folio);
+				break;
+			}
 
-		if (wbc->sync_mode != WB_SYNC_NONE)
-			wait_on_page_writeback(page);
+			psize = folio_size(folio);
+			len += psize;
+			if (len >= max_len || *_count <= 0)
+				stop = true;
 
-		if (PageWriteback(page) ||
-				!clear_page_dirty_for_io(page)) {
-			unlock_page(page);
-			break;
+			index += folio_nr_pages(folio);
+			if (!pagevec_add(&pvec, &folio->page))
+				break;
+			if (stop)
+				break;
 		}
 
-		/*
-		 * This actually clears the dirty bit in the radix tree.
-		 * See cifs_writepage() for more commentary.
+		if (!stop)
+			xas_pause(&xas);
+		rcu_read_unlock();
+
+		/* Now, if we obtained any pages, we can shift them to being
+		 * writable and mark them for caching.
 		 */
-		set_page_writeback(page);
-		if (page_offset(page) >= i_size_read(mapping->host)) {
-			*done = true;
-			unlock_page(page);
-			end_page_writeback(page);
+		if (!pagevec_count(&pvec))
 			break;
-		}
-
-		wdata->pages[i] = page;
-		*next = page->index + 1;
-		++nr_pages;
-	}
-
-	/* reset index to refind any pages skipped */
-	if (nr_pages == 0)
-		*index = wdata->pages[0]->index + 1;
-
-	/* put any pages we aren't going to use */
-	for (i = nr_pages; i < found_pages; i++) {
-		put_page(wdata->pages[i]);
-		wdata->pages[i] = NULL;
-	}
-
-	return nr_pages;
-}
 
-static int
-wdata_send_pages(struct cifs_writedata *wdata, unsigned int nr_pages,
-		 struct address_space *mapping, struct writeback_control *wbc)
-{
-	int rc;
+		for (i = 0; i < pagevec_count(&pvec); i++) {
+			folio = page_folio(pvec.pages[i]);
+			if (!folio_clear_dirty_for_io(folio))
+				BUG();
+			if (folio_start_writeback(folio))
+				BUG();
 
-	wdata->sync_mode = wbc->sync_mode;
-	wdata->nr_pages = nr_pages;
-	wdata->offset = page_offset(wdata->pages[0]);
-	wdata->pagesz = PAGE_SIZE;
-	wdata->tailsz = min(i_size_read(mapping->host) -
-			page_offset(wdata->pages[nr_pages - 1]),
-			(loff_t)PAGE_SIZE);
-	wdata->bytes = ((nr_pages - 1) * PAGE_SIZE) + wdata->tailsz;
-	wdata->pid = wdata->cfile->pid;
-
-	rc = adjust_credits(wdata->server, &wdata->credits, wdata->bytes);
-	if (rc)
-		return rc;
+			*_count -= folio_nr_pages(folio);
+			folio_unlock(folio);
+		}
 
-	if (wdata->cfile->invalidHandle)
-		rc = -EAGAIN;
-	else
-		rc = wdata->server->ops->async_writev(wdata,
-						      cifs_writedata_release);
+		pagevec_release(&pvec);
+		cond_resched();
+	} while (!stop);
 
-	return rc;
+	*_len = len;
 }
 
-static int cifs_writepages(struct address_space *mapping,
-			   struct writeback_control *wbc)
+/*
+ * Write back the locked page and any subsequent non-locked dirty pages.
+ */
+static ssize_t cifs_write_back_from_locked_folio(struct address_space *mapping,
+						 struct writeback_control *wbc,
+						 struct folio *folio,
+						 loff_t start, loff_t end)
 {
 	struct inode *inode = mapping->host;
-	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
 	struct TCP_Server_Info *server;
-	bool done = false, scanned = false, range_whole = false;
-	pgoff_t end, index;
 	struct cifs_writedata *wdata;
+	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
+	struct cifs_credits credits_on_stack;
+	struct cifs_credits *credits = &credits_on_stack;
 	struct cifsFileInfo *cfile = NULL;
-	int rc = 0;
-	int saved_rc = 0;
-	unsigned int xid;
+	unsigned int xid, wsize, len, max_len;
+	loff_t i_size = i_size_read(inode);
+	long count = wbc->nr_to_write;
+	int rc;
 
-	/*
-	 * If wsize is smaller than the page cache size, default to writing
-	 * one page at a time via cifs_writepage
-	 */
-	if (cifs_sb->ctx->wsize < PAGE_SIZE)
-		return generic_writepages(mapping, wbc);
+	if (folio_start_writeback(folio))
+		BUG();
+
+	count -= folio_nr_pages(folio);
 
 	xid = get_xid();
-	if (wbc->range_cyclic) {
-		index = mapping->writeback_index; /* Start from prev offset */
-		end = -1;
-	} else {
-		index = wbc->range_start >> PAGE_SHIFT;
-		end = wbc->range_end >> PAGE_SHIFT;
-		if (wbc->range_start == 0 && wbc->range_end == LLONG_MAX)
-			range_whole = true;
-		scanned = true;
-	}
 	server = cifs_pick_channel(cifs_sb_master_tcon(cifs_sb)->ses);
 
-retry:
-	while (!done && index <= end) {
-		unsigned int i, nr_pages, found_pages, wsize;
-		pgoff_t next = 0, tofind, saved_index = index;
-		struct cifs_credits credits_on_stack;
-		struct cifs_credits *credits = &credits_on_stack;
-		int get_file_rc = 0;
+	rc = cifs_get_writable_file(CIFS_I(inode), FIND_WR_ANY, &cfile);
+	if (rc) {
+		cifs_dbg(VFS, "No writable handle in writepages rc=%d\n", rc);
+		goto err_xid;
+	}
 
-		if (cfile)
-			cifsFileInfo_put(cfile);
+	rc = server->ops->wait_mtu_credits(server, cifs_sb->ctx->wsize,
+					   &wsize, credits);
+	if (rc != 0)
+		goto err_close;
 
-		rc = cifs_get_writable_file(CIFS_I(inode), FIND_WR_ANY, &cfile);
+	wdata = cifs_writedata_alloc(cifs_writev_complete);
+	if (!wdata) {
+		rc = -ENOMEM;
+		goto err_uncredit;
+	}
 
-		/* in case of an error store it to return later */
-		if (rc)
-			get_file_rc = rc;
+	wdata->sync_mode = wbc->sync_mode;
+	wdata->offset = folio_pos(folio);
+	wdata->pid = wdata->cfile->pid;
+	wdata->credits = credits_on_stack;
+	wdata->cfile = cfile;
+	wdata->server = server;
+	cfile = NULL;
+
+	/* Find all consecutive lockable dirty pages, stopping when we find a
+	 * page that is not immediately lockable, is not dirty or is missing,
+	 * or we reach the end of the range.
+	 */
+	if (start < i_size) {
+		/* Trim the write to the EOF; the extra data is ignored.  Also
+		 * put an upper limit on the size of a single storedata op.
+		 */
+		max_len = wsize;
+		max_len = min_t(unsigned long long, max_len, end - start + 1);
+		max_len = min_t(unsigned long long, max_len, i_size - start);
+
+		if (len < max_len)
+			cifs_extend_writeback(mapping, &count, start,
+					      max_len, &len);
+		len = min_t(loff_t, len, max_len);
+	}
 
-		rc = server->ops->wait_mtu_credits(server, cifs_sb->ctx->wsize,
-						   &wsize, credits);
-		if (rc != 0) {
-			done = true;
-			break;
-		}
+	wdata->bytes = len;
 
-		tofind = min((wsize / PAGE_SIZE) - 1, end - index) + 1;
+	/* We now have a contiguous set of dirty pages, each with writeback
+	 * set; the first page is still locked at this point, but all the rest
+	 * have been unlocked.
+	 */
+	folio_unlock(folio);
 
-		wdata = wdata_alloc_and_fillpages(tofind, mapping, end, &index,
-						  &found_pages);
-		if (!wdata) {
-			rc = -ENOMEM;
-			done = true;
-			add_credits_and_wake_if(server, credits, 0);
-			break;
-		}
+	if (start < i_size) {
+		iov_iter_xarray(&wdata->iter, WRITE, &mapping->i_pages, start, len);
 
-		if (found_pages == 0) {
-			kref_put(&wdata->refcount, cifs_writedata_release);
-			add_credits_and_wake_if(server, credits, 0);
-			break;
-		}
+		rc = adjust_credits(wdata->server, &wdata->credits, wdata->bytes);
+		if (rc)
+			goto err_wdata;
 
-		nr_pages = wdata_prepare_pages(wdata, found_pages, mapping, wbc,
-					       end, &index, &next, &done);
+		if (wdata->cfile->invalidHandle)
+			rc = -EAGAIN;
+		else
+			rc = wdata->server->ops->async_writev(wdata,
+							      cifs_writedata_release);
+	} else {
+		/* The dirty region was entirely beyond the EOF. */
+		rc = 0;
+	}
 
-		/* nothing to write? */
-		if (nr_pages == 0) {
-			kref_put(&wdata->refcount, cifs_writedata_release);
-			add_credits_and_wake_if(server, credits, 0);
-			continue;
-		}
+err_wdata:
+	kref_put(&wdata->refcount, cifs_writedata_release);
+err_uncredit:
+	add_credits_and_wake_if(server, credits, 0);
+err_close:
+	if (cfile)
+		cifsFileInfo_put(cfile);
+err_xid:
+	free_xid(xid);
+	if (rc == 0) {
+		cifs_pages_written_back(inode, start, len);
+		wbc->nr_to_write = count;
+	} else if (is_retryable_error(rc)) {
+		cifs_pages_write_redirty(inode, start, len);
+	} else {
+		cifs_pages_write_failed(inode, start, len);
+		mapping_set_error(mapping, rc);
+	}
+	/* Indication to update ctime and mtime as close is deferred */
+	set_bit(CIFS_INO_MODIFIED_ATTR, &CIFS_I(inode)->flags);
+	return rc;
+}
 
-		wdata->credits = credits_on_stack;
-		wdata->cfile = cfile;
-		wdata->server = server;
-		cfile = NULL;
+/*
+ * write a region of pages back to the server
+ */
+static int cifs_writepages_region(struct address_space *mapping,
+				  struct writeback_control *wbc,
+				  loff_t start, loff_t end, loff_t *_next)
+{
+	struct folio *folio;
+	struct page *head_page;
+	ssize_t ret;
+	int n;
 
-		if (!wdata->cfile) {
-			cifs_dbg(VFS, "No writable handle in writepages rc=%d\n",
-				 get_file_rc);
-			if (is_retryable_error(get_file_rc))
-				rc = get_file_rc;
-			else
-				rc = -EBADF;
-		} else
-			rc = wdata_send_pages(wdata, nr_pages, mapping, wbc);
+	do {
+		pgoff_t index = start / PAGE_SIZE;
 
-		for (i = 0; i < nr_pages; ++i)
-			unlock_page(wdata->pages[i]);
+		n = find_get_pages_range_tag(mapping, &index, end / PAGE_SIZE,
+					     PAGECACHE_TAG_DIRTY, 1, &head_page);
+		if (!n)
+			break;
 
-		/* send failure -- clean up the mess */
-		if (rc != 0) {
-			add_credits_and_wake_if(server, &wdata->credits, 0);
-			for (i = 0; i < nr_pages; ++i) {
-				if (is_retryable_error(rc))
-					redirty_page_for_writepage(wbc,
-							   wdata->pages[i]);
-				else
-					SetPageError(wdata->pages[i]);
-				end_page_writeback(wdata->pages[i]);
-				put_page(wdata->pages[i]);
+		folio = page_folio(head_page);
+		start = folio_pos(folio); /* May regress with THPs */
+
+		/* At this point we hold neither the i_pages lock nor the
+		 * page lock: the page may be truncated or invalidated
+		 * (changing page->mapping to NULL), or even swizzled
+		 * back from swapper_space to tmpfs file mapping
+		 */
+		if (wbc->sync_mode != WB_SYNC_NONE) {
+			ret = folio_lock_killable(folio);
+			if (ret < 0) {
+				folio_put(folio);
+				return ret;
+			}
+		} else {
+			if (!folio_trylock(folio)) {
+				folio_put(folio);
+				return 0;
 			}
-			if (!is_retryable_error(rc))
-				mapping_set_error(mapping, rc);
 		}
-		kref_put(&wdata->refcount, cifs_writedata_release);
 
-		if (wbc->sync_mode == WB_SYNC_ALL && rc == -EAGAIN) {
-			index = saved_index;
+		if (folio_mapping(folio) != mapping ||
+		    !folio_test_dirty(folio)) {
+			start += folio_size(folio);
+			folio_unlock(folio);
+			folio_put(folio);
 			continue;
 		}
 
-		/* Return immediately if we received a signal during writing */
-		if (is_interrupt_error(rc)) {
-			done = true;
-			break;
+		if (folio_test_writeback(folio)) {
+			folio_unlock(folio);
+			if (wbc->sync_mode != WB_SYNC_NONE)
+				folio_wait_writeback(folio);
+			folio_put(folio);
+			continue;
 		}
 
-		if (rc != 0 && saved_rc == 0)
-			saved_rc = rc;
+		if (!folio_clear_dirty_for_io(folio))
+			BUG();
 
-		wbc->nr_to_write -= nr_pages;
-		if (wbc->nr_to_write <= 0)
-			done = true;
+		ret = cifs_write_back_from_locked_folio(mapping, wbc, folio, start, end);
+		folio_put(folio);
+		if (ret < 0)
+			return ret;
 
-		index = next;
-	}
+		start += ret;
+		cond_resched();
+	} while (wbc->nr_to_write > 0);
 
-	if (!scanned && !done) {
-		/*
-		 * We hit the last page and there is more work to be done: wrap
-		 * back to the start of the file
-		 */
-		scanned = true;
-		index = 0;
-		goto retry;
-	}
+	*_next = start;
+	return 0;
+}
 
-	if (saved_rc != 0)
-		rc = saved_rc;
+/*
+ * Write some of the pending data back to the server
+ */
+static int cifs_writepages(struct address_space *mapping,
+			   struct writeback_control *wbc)
+{
+	loff_t start, next;
+	int ret;
 
-	if (wbc->range_cyclic || (range_whole && wbc->nr_to_write > 0))
-		mapping->writeback_index = index;
+	/* We have to be careful as we can end up racing with setattr()
+	 * truncating the pagecache since the caller doesn't take a lock here
+	 * to prevent it.
+	 */
 
-	if (cfile)
-		cifsFileInfo_put(cfile);
-	free_xid(xid);
-	/* Indication to update ctime and mtime as close is deferred */
-	set_bit(CIFS_INO_MODIFIED_ATTR, &CIFS_I(inode)->flags);
-	return rc;
+	if (wbc->range_cyclic) {
+		start = mapping->writeback_index * PAGE_SIZE;
+		ret = cifs_writepages_region(mapping, wbc, start, LLONG_MAX, &next);
+		if (ret == 0) {
+			mapping->writeback_index = next / PAGE_SIZE;
+			if (start > 0 && wbc->nr_to_write > 0) {
+				ret = cifs_writepages_region(mapping, wbc, 0,
+							     start, &next);
+				if (ret == 0)
+					mapping->writeback_index =
+						next / PAGE_SIZE;
+			}
+		}
+	} else if (wbc->range_start == 0 && wbc->range_end == LLONG_MAX) {
+		ret = cifs_writepages_region(mapping, wbc, 0, LLONG_MAX, &next);
+		if (wbc->nr_to_write > 0 && ret == 0)
+			mapping->writeback_index = next / PAGE_SIZE;
+	} else {
+		ret = cifs_writepages_region(mapping, wbc,
+					     wbc->range_start, wbc->range_end, &next);
+	}
+
+	return ret;
 }
 
 static int
@@ -2790,47 +2829,6 @@ int cifs_flush(struct file *file, fl_owner_t id)
 	return rc;
 }
 
-static int
-cifs_write_allocate_pages(struct page **pages, unsigned long num_pages)
-{
-	int rc = 0;
-	unsigned long i;
-
-	for (i = 0; i < num_pages; i++) {
-		pages[i] = alloc_page(GFP_KERNEL|__GFP_HIGHMEM);
-		if (!pages[i]) {
-			/*
-			 * save number of pages we have already allocated and
-			 * return with ENOMEM error
-			 */
-			num_pages = i;
-			rc = -ENOMEM;
-			break;
-		}
-	}
-
-	if (rc) {
-		for (i = 0; i < num_pages; i++)
-			put_page(pages[i]);
-	}
-	return rc;
-}
-
-static inline
-size_t get_numpages(const size_t wsize, const size_t len, size_t *cur_len)
-{
-	size_t num_pages;
-	size_t clen;
-
-	clen = min_t(const size_t, len, wsize);
-	num_pages = DIV_ROUND_UP(clen, PAGE_SIZE);
-
-	if (cur_len)
-		*cur_len = clen;
-
-	return num_pages;
-}
-
 static void
 cifs_uncached_writedata_release(struct kref *refcount)
 {
@@ -2839,8 +2837,11 @@ cifs_uncached_writedata_release(struct kref *refcount)
 					struct cifs_writedata, refcount);
 
 	kref_put(&wdata->ctx->refcount, cifs_aio_ctx_release);
-	for (i = 0; i < wdata->nr_pages; i++)
-		put_page(wdata->pages[i]);
+	if (wdata->bv) {
+		for (i = 0; i < wdata->bv_count; i++)
+			if (wdata->bv[i].bv_page)
+				put_page(wdata->bv[i].bv_page);
+	}
 	cifs_writedata_release(refcount);
 }
 
@@ -2866,48 +2867,6 @@ cifs_uncached_writev_complete(struct work_struct *work)
 	kref_put(&wdata->refcount, cifs_uncached_writedata_release);
 }
 
-static int
-wdata_fill_from_iovec(struct cifs_writedata *wdata, struct iov_iter *from,
-		      size_t *len, unsigned long *num_pages)
-{
-	size_t save_len, copied, bytes, cur_len = *len;
-	unsigned long i, nr_pages = *num_pages;
-
-	save_len = cur_len;
-	for (i = 0; i < nr_pages; i++) {
-		bytes = min_t(const size_t, cur_len, PAGE_SIZE);
-		copied = copy_page_from_iter(wdata->pages[i], 0, bytes, from);
-		cur_len -= copied;
-		/*
-		 * If we didn't copy as much as we expected, then that
-		 * may mean we trod into an unmapped area. Stop copying
-		 * at that point. On the next pass through the big
-		 * loop, we'll likely end up getting a zero-length
-		 * write and bailing out of it.
-		 */
-		if (copied < bytes)
-			break;
-	}
-	cur_len = save_len - cur_len;
-	*len = cur_len;
-
-	/*
-	 * If we have no data to send, then that probably means that
-	 * the copy above failed altogether. That's most likely because
-	 * the address in the iovec was bogus. Return -EFAULT and let
-	 * the caller free anything we allocated and bail out.
-	 */
-	if (!cur_len)
-		return -EFAULT;
-
-	/*
-	 * i + 1 now represents the number of pages we actually used in
-	 * the copy phase above.
-	 */
-	*num_pages = i + 1;
-	return 0;
-}
-
 static int
 cifs_resend_wdata(struct cifs_writedata *wdata, struct list_head *wdata_list,
 	struct cifs_aio_ctx *ctx)
@@ -2986,14 +2945,11 @@ cifs_write_from_iter(loff_t offset, size_t len, struct iov_iter *from,
 {
 	int rc = 0;
 	size_t cur_len;
-	unsigned long nr_pages, num_pages, i;
 	struct cifs_writedata *wdata;
 	struct iov_iter saved_from = *from;
 	loff_t saved_offset = offset;
 	pid_t pid;
 	struct TCP_Server_Info *server;
-	struct page **pagevec;
-	size_t start;
 	unsigned int xid;
 
 	if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_RWPIDFORWARD)
@@ -3024,95 +2980,30 @@ cifs_write_from_iter(loff_t offset, size_t len, struct iov_iter *from,
 
 		cur_len = min_t(const size_t, len, wsize);
 
-		if (ctx->direct_io) {
-			ssize_t result;
-
-			result = iov_iter_get_pages_alloc(
-				from, &pagevec, cur_len, &start);
-			if (result < 0) {
-				cifs_dbg(VFS,
-					 "direct_writev couldn't get user pages (rc=%zd) iter type %d iov_offset %zd count %zd\n",
-					 result, iov_iter_type(from),
-					 from->iov_offset, from->count);
-				dump_stack();
-
-				rc = result;
-				add_credits_and_wake_if(server, credits, 0);
-				break;
-			}
-			cur_len = (size_t)result;
-			iov_iter_advance(from, cur_len);
-
-			nr_pages =
-				(cur_len + start + PAGE_SIZE - 1) / PAGE_SIZE;
-
-			wdata = cifs_writedata_direct_alloc(pagevec,
-					     cifs_uncached_writev_complete);
-			if (!wdata) {
-				rc = -ENOMEM;
-				add_credits_and_wake_if(server, credits, 0);
-				break;
-			}
-
-
-			wdata->page_offset = start;
-			wdata->tailsz =
-				nr_pages > 1 ?
-					cur_len - (PAGE_SIZE - start) -
-					(nr_pages - 2) * PAGE_SIZE :
-					cur_len;
-		} else {
-			nr_pages = get_numpages(wsize, len, &cur_len);
-			wdata = cifs_writedata_alloc(nr_pages,
-					     cifs_uncached_writev_complete);
-			if (!wdata) {
-				rc = -ENOMEM;
-				add_credits_and_wake_if(server, credits, 0);
-				break;
-			}
-
-			rc = cifs_write_allocate_pages(wdata->pages, nr_pages);
-			if (rc) {
-				kvfree(wdata->pages);
-				kfree(wdata);
-				add_credits_and_wake_if(server, credits, 0);
-				break;
-			}
-
-			num_pages = nr_pages;
-			rc = wdata_fill_from_iovec(
-				wdata, from, &cur_len, &num_pages);
-			if (rc) {
-				for (i = 0; i < nr_pages; i++)
-					put_page(wdata->pages[i]);
-				kvfree(wdata->pages);
-				kfree(wdata);
-				add_credits_and_wake_if(server, credits, 0);
-				break;
-			}
-
-			/*
-			 * Bring nr_pages down to the number of pages we
-			 * actually used, and free any pages that we didn't use.
-			 */
-			for ( ; nr_pages > num_pages; nr_pages--)
-				put_page(wdata->pages[nr_pages - 1]);
-
-			wdata->tailsz = cur_len - ((nr_pages - 1) * PAGE_SIZE);
+		wdata = cifs_writedata_alloc(cifs_uncached_writev_complete);
+		if (!wdata) {
+			rc = -ENOMEM;
+			add_credits_and_wake_if(server, credits, 0);
+			break;
 		}
 
 		wdata->sync_mode = WB_SYNC_ALL;
-		wdata->nr_pages = nr_pages;
 		wdata->offset = (__u64)offset;
 		wdata->cfile = cifsFileInfo_get(open_file);
 		wdata->server = server;
 		wdata->pid = pid;
 		wdata->bytes = cur_len;
-		wdata->pagesz = PAGE_SIZE;
 		wdata->credits = credits_on_stack;
 		wdata->ctx = ctx;
 		kref_get(&ctx->refcount);
 
+		if (ctx->direct_io) {
+			wdata->bv_count = extract_iter_to_iter(&ctx->iter, &wdata->iter,
+							       &wdata->bv);
+			cur_len = iov_iter_count(&wdata->iter);
+			iov_iter_advance(&ctx->iter, cur_len);
+		}
+
 		rc = adjust_credits(server, &wdata->credits, wdata->bytes);
 
 		if (!rc) {
@@ -3429,13 +3320,12 @@ cifs_strict_writev(struct kiocb *iocb, struct iov_iter *from)
 }
 
 static struct cifs_readdata *
-cifs_readdata_direct_alloc(struct page **pages, work_func_t complete)
+cifs_readdata_alloc(work_func_t complete)
 {
 	struct cifs_readdata *rdata;
 
 	rdata = kzalloc(sizeof(*rdata), GFP_KERNEL);
 	if (rdata != NULL) {
-		rdata->pages = pages;
 		kref_init(&rdata->refcount);
 		INIT_LIST_HEAD(&rdata->list);
 		init_completion(&rdata->done);
@@ -3445,22 +3335,6 @@ cifs_readdata_direct_alloc(struct page **pages, work_func_t complete)
 	return rdata;
 }
 
-static struct cifs_readdata *
-cifs_readdata_alloc(unsigned int nr_pages, work_func_t complete)
-{
-	struct page **pages =
-		kcalloc(nr_pages, sizeof(struct page *), GFP_KERNEL);
-	struct cifs_readdata *ret = NULL;
-
-	if (pages) {
-		ret = cifs_readdata_direct_alloc(pages, complete);
-		if (!ret)
-			kfree(pages);
-	}
-
-	return ret;
-}
-
 void
 cifs_readdata_release(struct kref *refcount)
 {
@@ -3475,37 +3349,9 @@ cifs_readdata_release(struct kref *refcount)
 	if (rdata->cfile)
 		cifsFileInfo_put(rdata->cfile);
 
-	kvfree(rdata->pages);
 	kfree(rdata);
 }
 
-static int
-cifs_read_allocate_pages(struct cifs_readdata *rdata, unsigned int nr_pages)
-{
-	int rc = 0;
-	struct page *page;
-	unsigned int i;
-
-	for (i = 0; i < nr_pages; i++) {
-		page = alloc_page(GFP_KERNEL|__GFP_HIGHMEM);
-		if (!page) {
-			rc = -ENOMEM;
-			break;
-		}
-		rdata->pages[i] = page;
-	}
-
-	if (rc) {
-		unsigned int nr_page_failed = i;
-
-		for (i = 0; i < nr_page_failed; i++) {
-			put_page(rdata->pages[i]);
-			rdata->pages[i] = NULL;
-		}
-	}
-	return rc;
-}
-
 static void
 cifs_uncached_readdata_release(struct kref *refcount)
 {
@@ -3514,12 +3360,15 @@ cifs_uncached_readdata_release(struct kref *refcount)
 	unsigned int i;
 
 	kref_put(&rdata->ctx->refcount, cifs_aio_ctx_release);
-	for (i = 0; i < rdata->nr_pages; i++) {
-		put_page(rdata->pages[i]);
+	if (rdata->bv) {
+		for (i = 0; i < rdata->bv_count; i++)
+			if (rdata->bv[i].bv_page)
+				put_page(rdata->bv[i].bv_page);
 	}
 	cifs_readdata_release(refcount);
 }
 
+#if 0
 /**
  * cifs_readdata_to_iov - copy data from pages in response to an iovec
  * @rdata:	the readdata response with list of pages holding data
@@ -3553,6 +3402,7 @@ cifs_readdata_to_iov(struct cifs_readdata *rdata, struct iov_iter *iter)
 	}
 	return remaining ? -EFAULT : 0;
 }
+#endif
 
 static void collect_uncached_read_data(struct cifs_aio_ctx *ctx);
 
@@ -3568,6 +3418,7 @@ cifs_uncached_readv_complete(struct work_struct *work)
 	kref_put(&rdata->refcount, cifs_uncached_readdata_release);
 }
 
+#if 0
 static int cifs_resend_rdata(struct cifs_readdata *rdata,
 			struct list_head *rdata_list,
 			struct cifs_aio_ctx *ctx)
@@ -3639,6 +3490,7 @@ static int cifs_resend_rdata(struct cifs_readdata *rdata,
 	kref_put(&rdata->refcount, cifs_uncached_readdata_release);
 	return rc;
 }
+#endif
 
 static int
 cifs_send_async_read(loff_t offset, size_t len, struct cifsFileInfo *open_file,
@@ -3646,14 +3498,13 @@ cifs_send_async_read(loff_t offset, size_t len, struct cifsFileInfo *open_file,
 		     struct cifs_aio_ctx *ctx)
 {
 	struct cifs_readdata *rdata;
-	unsigned int npages, rsize;
+	unsigned int rsize;
 	struct cifs_credits credits_on_stack;
 	struct cifs_credits *credits = &credits_on_stack;
 	size_t cur_len;
 	int rc;
 	pid_t pid;
 	struct TCP_Server_Info *server;
-	size_t start;
 	struct iov_iter direct_iov = ctx->iter;
 
 	server = cifs_pick_channel(tlink_tcon(open_file->tlink)->ses);
@@ -3682,59 +3533,28 @@ cifs_send_async_read(loff_t offset, size_t len, struct cifsFileInfo *open_file,
 
 		cur_len = min_t(const size_t, len, rsize);
 
-		if (ctx->direct_io) {
-			cur_len = (size_t)result;
-			iov_iter_advance(&direct_iov, cur_len);
-
-			rdata = cifs_readdata_direct_alloc(
-					pagevec, cifs_uncached_readv_complete);
-			if (!rdata) {
-				add_credits_and_wake_if(server, credits, 0);
-				rc = -ENOMEM;
-				break;
-			}
-
-			npages = (cur_len + start + PAGE_SIZE-1) / PAGE_SIZE;
-			rdata->page_offset = start;
-			rdata->tailsz = npages > 1 ?
-				cur_len-(PAGE_SIZE-start)-(npages-2)*PAGE_SIZE :
-				cur_len;
-
-		} else {
-
-			npages = DIV_ROUND_UP(cur_len, PAGE_SIZE);
-			/* allocate a readdata struct */
-			rdata = cifs_readdata_alloc(npages,
-					    cifs_uncached_readv_complete);
-			if (!rdata) {
-				add_credits_and_wake_if(server, credits, 0);
-				rc = -ENOMEM;
-				break;
-			}
-
-			rc = cifs_read_allocate_pages(rdata, npages);
-			if (rc) {
-				kvfree(rdata->pages);
-				kfree(rdata);
-				add_credits_and_wake_if(server, credits, 0);
-				break;
-			}
-
-			rdata->tailsz = PAGE_SIZE;
+		rdata = cifs_readdata_alloc(cifs_uncached_readv_complete);
+		if (!rdata) {
+			add_credits_and_wake_if(server, credits, 0);
+			rc = -ENOMEM;
+			break;
 		}
 
 		rdata->server = server;
 		rdata->cfile = cifsFileInfo_get(open_file);
-		rdata->nr_pages = ctx->npages;
 		rdata->offset = offset;
 		rdata->bytes = cur_len;
 		rdata->pid = pid;
-		rdata->pagesz = PAGE_SIZE;
 		rdata->credits = credits_on_stack;
 		rdata->ctx = ctx;
 		rdata->iter = ctx->iter;
 		kref_get(&ctx->refcount);
 
+		if (ctx->direct_io) {
+			cur_len = iov_iter_count(&ctx->iter);
+			iov_iter_advance(&direct_iov, cur_len);
+		}
+
 		rc = adjust_credits(server, &rdata->credits, rdata->bytes);
 
 		if (!rc) {
@@ -3768,11 +3588,9 @@ collect_uncached_read_data(struct cifs_aio_ctx *ctx)
 {
 	struct cifs_readdata *rdata, *tmp;
 	struct iov_iter *to = &ctx->iter;
-	struct cifs_sb_info *cifs_sb;
+	//struct cifs_sb_info *cifs_sb = CIFS_SB(ctx->cfile->dentry->d_sb);
 	int rc;
 
-	cifs_sb = CIFS_SB(ctx->cfile->dentry->d_sb);
-
 	mutex_lock(&ctx->aio_mutex);
 
 	if (list_empty(&ctx->list)) {
@@ -3782,7 +3600,7 @@ collect_uncached_read_data(struct cifs_aio_ctx *ctx)
 
 	rc = ctx->rc;
 	/* the loop below should proceed in the order of increasing offsets */
-again:
+//again:
 	list_for_each_entry_safe(rdata, tmp, &ctx->list, list) {
 		if (!rc) {
 			if (!try_wait_for_completion(&rdata->done)) {
@@ -3790,6 +3608,7 @@ collect_uncached_read_data(struct cifs_aio_ctx *ctx)
 				return;
 			}
 
+#if 0 // TODO
 			if (rdata->result == -EAGAIN) {
 				/* resend call if it's a retryable error */
 				struct list_head tmp_list;
@@ -3840,6 +3659,9 @@ collect_uncached_read_data(struct cifs_aio_ctx *ctx)
 				rc = rdata->result;
 			else if (!ctx->direct_io)
 				rc = cifs_readdata_to_iov(rdata, to);
+#else
+			rc = rdata->result;
+#endif
 
 			/* if there was a short read -- discard anything left */
 			if (rdata->got_bytes && rdata->got_bytes < rdata->bytes)
@@ -4135,7 +3957,7 @@ static void cifs_req_issue_op(struct netfs_read_subrequest *subreq)
 	if (rc)
 		goto out;
 
-	rdata = cifs_readdata_alloc(0, NULL);
+	rdata = cifs_readdata_alloc(NULL);
 	if (!rdata) {
 		add_credits_and_wake_if(server, credits, 0);
 		rc = -ENOMEM;
@@ -4149,8 +3971,6 @@ static void cifs_req_issue_op(struct netfs_read_subrequest *subreq)
 	rdata->offset	= subreq->start + subreq->transferred;
 	rdata->bytes	= subreq->len   - subreq->transferred;
 	rdata->pid	= pid;
-	rdata->pagesz	= PAGE_SIZE;
-	rdata->tailsz	= PAGE_SIZE;
 	rdata->credits	= credits_on_stack;
 
 	iov_iter_xarray(&rdata->iter, READ, &rreq->mapping->i_pages,
diff --git a/fs/cifs/misc.c b/fs/cifs/misc.c
index ece7fc8a7740..2c012fef9da8 100644
--- a/fs/cifs/misc.c
+++ b/fs/cifs/misc.c
@@ -1032,25 +1032,6 @@ cifs_free_hash(struct crypto_shash **shash, struct sdesc **sdesc)
 	*shash = NULL;
 }
 
-/**
- * rqst_page_get_length - obtain the length and offset for a page in smb_rqst
- * @rqst: The request descriptor
- * @page: The index of the page to query
- * @len: Where to store the length for this page:
- * @offset: Where to store the offset for this page
- */
-void rqst_page_get_length(struct smb_rqst *rqst, unsigned int page,
-				unsigned int *len, unsigned int *offset)
-{
-	*len = rqst->rq_pagesz;
-	*offset = (page == 0) ? rqst->rq_offset : 0;
-
-	if (rqst->rq_npages == 1 || page == rqst->rq_npages-1)
-		*len = rqst->rq_tailsz;
-	else if (page == 0)
-		*len = rqst->rq_pagesz - rqst->rq_offset;
-}
-
 void extract_unc_hostname(const char *unc, const char **h, size_t *len)
 {
 	const char *end;
diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index a5ce04331613..fc07cd353b81 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -4406,6 +4406,20 @@ static inline void smb2_sg_set_buf(struct scatterlist *sg, const void *buf,
 	sg_set_page(sg, addr, buflen, offset_in_page(buf));
 }
 
+struct cifs_init_sg_priv {
+		struct scatterlist *sg;
+		unsigned int idx;
+};
+
+static ssize_t cifs_init_sg_scan(struct iov_iter *i, const void *p,
+				 size_t len, size_t off, void *_priv)
+{
+	struct cifs_init_sg_priv *priv = _priv;
+
+	smb2_sg_set_buf(&priv->sg[priv->idx++], p, len);
+	return 0;
+}
+
 /* Assumes the first rqst has a transform header as the first iov.
  * I.e.
  * rqst[0].rq_iov[0]  is transform header
@@ -4415,43 +4429,44 @@ static inline void smb2_sg_set_buf(struct scatterlist *sg, const void *buf,
 static struct scatterlist *
 init_sg(int num_rqst, struct smb_rqst *rqst, u8 *sign)
 {
+	struct cifs_init_sg_priv priv;
 	unsigned int sg_len;
-	struct scatterlist *sg;
 	unsigned int i;
 	unsigned int j;
-	unsigned int idx = 0;
+	ssize_t rc;
 	int skip;
 
 	sg_len = 1;
-	for (i = 0; i < num_rqst; i++)
-		sg_len += rqst[i].rq_nvec + rqst[i].rq_npages;
+	for (i = 0; i < num_rqst; i++) {
+		sg_len += rqst[i].rq_nvec;
+		sg_len += iov_iter_npages(&rqst[i].rq_iter, INT_MAX);
+	}
 
-	sg = kmalloc_array(sg_len, sizeof(struct scatterlist), GFP_KERNEL);
-	if (!sg)
+	priv.sg = kmalloc_array(sg_len, sizeof(struct scatterlist), GFP_KERNEL);
+	if (!priv.sg)
 		return NULL;
 
-	sg_init_table(sg, sg_len);
+	sg_init_table(priv.sg, sg_len);
 	for (i = 0; i < num_rqst; i++) {
+		struct iov_iter *iter = &rqst[i].rq_iter;
+
 		for (j = 0; j < rqst[i].rq_nvec; j++) {
 			/*
 			 * The first rqst has a transform header where the
 			 * first 20 bytes are not part of the encrypted blob
 			 */
 			skip = (i == 0) && (j == 0) ? 20 : 0;
-			smb2_sg_set_buf(&sg[idx++],
+			smb2_sg_set_buf(&priv.sg[priv.idx++],
 					rqst[i].rq_iov[j].iov_base + skip,
 					rqst[i].rq_iov[j].iov_len - skip);
-			}
-
-		for (j = 0; j < rqst[i].rq_npages; j++) {
-			unsigned int len, offset;
-
-			rqst_page_get_length(&rqst[i], j, &len, &offset);
-			sg_set_page(&sg[idx++], rqst[i].rq_pages[j], len, offset);
 		}
+
+		rc = iov_iter_scan(iter, iov_iter_count(iter),
+				   cifs_init_sg_scan, &priv);
+		WARN_ON(rc < 0);
 	}
-	smb2_sg_set_buf(&sg[idx], sign, SMB2_SIGNATURE_SIZE);
-	return sg;
+	smb2_sg_set_buf(&priv.sg[priv.idx], sign, SMB2_SIGNATURE_SIZE);
+	return priv.sg;
 }
 
 static int
@@ -4588,18 +4603,30 @@ crypt_message(struct TCP_Server_Info *server, int num_rqst,
 	return rc;
 }
 
+/*
+ * Clear a read buffer, discarding the folios which have XA_MARK_0 set.
+ */
+static void netfs_clear_buffer(struct xarray *buffer)
+{
+       struct folio *folio;
+       XA_STATE(xas, buffer, 0);
+
+       rcu_read_lock();
+       xas_for_each_marked(&xas, folio, ULONG_MAX, XA_MARK_0) {
+               folio_put(folio);
+       }
+       rcu_read_unlock();
+       xa_destroy(buffer);
+}
+
 void
 smb3_free_compound_rqst(int num_rqst, struct smb_rqst *rqst)
 {
-	int i, j;
+	int i;
 
-	for (i = 0; i < num_rqst; i++) {
-		if (rqst[i].rq_pages) {
-			for (j = rqst[i].rq_npages - 1; j >= 0; j--)
-				put_page(rqst[i].rq_pages[j]);
-			kfree(rqst[i].rq_pages);
-		}
-	}
+	for (i = 0; i < num_rqst; i++)
+		if (!xa_empty(&rqst[i].rq_buffer))
+			netfs_clear_buffer(&rqst[i].rq_buffer);
 }
 
 /*
@@ -4619,50 +4646,37 @@ static int
 smb3_init_transform_rq(struct TCP_Server_Info *server, int num_rqst,
 		       struct smb_rqst *new_rq, struct smb_rqst *old_rq)
 {
-	struct page **pages;
 	struct smb2_transform_hdr *tr_hdr = new_rq[0].rq_iov[0].iov_base;
-	unsigned int npages;
+	struct page *page;
 	unsigned int orig_len = 0;
 	int i, j;
 	int rc = -ENOMEM;
 
 	for (i = 1; i < num_rqst; i++) {
-		npages = old_rq[i - 1].rq_npages;
-		pages = kmalloc_array(npages, sizeof(struct page *),
-				      GFP_KERNEL);
-		if (!pages)
-			goto err_free;
-
-		new_rq[i].rq_pages = pages;
-		new_rq[i].rq_npages = npages;
-		new_rq[i].rq_offset = old_rq[i - 1].rq_offset;
-		new_rq[i].rq_pagesz = old_rq[i - 1].rq_pagesz;
-		new_rq[i].rq_tailsz = old_rq[i - 1].rq_tailsz;
-		new_rq[i].rq_iov = old_rq[i - 1].rq_iov;
-		new_rq[i].rq_nvec = old_rq[i - 1].rq_nvec;
-
-		orig_len += smb_rqst_len(server, &old_rq[i - 1]);
+		struct smb_rqst *old = &old_rq[i - 1];
+		struct smb_rqst *new = &new_rq[i];
+		struct xarray *buffer = &new->rq_buffer;
+		unsigned int npages;
+		size_t size = iov_iter_count(&old->rq_iter), seg;
 
-		for (j = 0; j < npages; j++) {
-			pages[j] = alloc_page(GFP_KERNEL|__GFP_HIGHMEM);
-			if (!pages[j])
-				goto err_free;
-		}
+		orig_len += size;
+		xa_init(buffer);
 
-		/* copy pages form the old */
+		npages = DIV_ROUND_UP(size, PAGE_SIZE);
 		for (j = 0; j < npages; j++) {
-			char *dst, *src;
-			unsigned int offset, len;
-
-			rqst_page_get_length(&new_rq[i], j, &len, &offset);
-
-			dst = (char *) kmap(new_rq[i].rq_pages[j]) + offset;
-			src = (char *) kmap(old_rq[i - 1].rq_pages[j]) + offset;
+			page = alloc_page(GFP_KERNEL|__GFP_HIGHMEM);
+			if (!xa_store(buffer, j, page, GFP_KERNEL))
+				goto err_free;
 
-			memcpy(dst, src, len);
-			kunmap(new_rq[i].rq_pages[j]);
-			kunmap(old_rq[i - 1].rq_pages[j]);
+			seg = min(size, PAGE_SIZE);
+			if (copy_page_from_iter(page, 0, seg, &old->rq_iter) != seg) {
+				rc = -EFAULT;
+				goto err_free;
+			}
 		}
+
+		new->rq_iov = old->rq_iov;
+		new->rq_nvec = old->rq_nvec;
 	}
 
 	/* fill the 1st iov with a transform header */
@@ -4705,10 +4719,6 @@ decrypt_raw_data(struct TCP_Server_Info *server, char *buf,
 
 	rqst.rq_iov = iov;
 	rqst.rq_nvec = 2;
-	rqst.rq_pages = pages;
-	rqst.rq_npages = npages;
-	rqst.rq_pagesz = PAGE_SIZE;
-	rqst.rq_tailsz = (page_data_size % PAGE_SIZE) ? : PAGE_SIZE;
 
 	rc = crypt_message(server, 1, &rqst, 0);
 	cifs_dbg(FYI, "Decrypt message returned %d\n", rc);
diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index ea2f8a2d9e57..4d43e06c5a32 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -4014,11 +4014,7 @@ smb2_readv_callback(struct mid_q_entry *mid)
 	struct cifs_credits credits = { .value = 0, .instance = 0 };
 	struct smb_rqst rqst = { .rq_iov = &rdata->iov[1],
 				 .rq_nvec = 1,
-				 .rq_pages = rdata->pages,
-				 .rq_offset = rdata->page_offset,
-				 .rq_npages = rdata->nr_pages,
-				 .rq_pagesz = rdata->pagesz,
-				 .rq_tailsz = rdata->tailsz };
+				 .rq_iter = rdata->iter };
 
 	WARN_ONCE(rdata->server != mid->server,
 		  "rdata server %p != mid server %p",
@@ -4425,11 +4421,7 @@ smb2_async_writev(struct cifs_writedata *wdata,
 
 	rqst.rq_iov = iov;
 	rqst.rq_nvec = 1;
-	rqst.rq_pages = wdata->pages;
-	rqst.rq_offset = wdata->page_offset;
-	rqst.rq_npages = wdata->nr_pages;
-	rqst.rq_pagesz = wdata->pagesz;
-	rqst.rq_tailsz = wdata->tailsz;
+	rqst.rq_iter = wdata->iter;
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	if (wdata->mr) {
 		iov[0].iov_len += sizeof(struct smbd_buffer_descriptor_v1);
diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
index 61ea3d3f95b4..2c4574ae832e 100644
--- a/fs/cifs/transport.c
+++ b/fs/cifs/transport.c
@@ -276,26 +276,7 @@ smb_rqst_len(struct TCP_Server_Info *server, struct smb_rqst *rqst)
 	for (i = 0; i < nvec; i++)
 		buflen += iov[i].iov_len;
 
-	/*
-	 * Add in the page array if there is one. The caller needs to make
-	 * sure rq_offset and rq_tailsz are set correctly. If a buffer of
-	 * multiple pages ends at page boundary, rq_tailsz needs to be set to
-	 * PAGE_SIZE.
-	 */
-	if (rqst->rq_npages) {
-		if (rqst->rq_npages == 1)
-			buflen += rqst->rq_tailsz;
-		else {
-			/*
-			 * If there is more than one page, calculate the
-			 * buffer length based on rq_offset and rq_tailsz
-			 */
-			buflen += rqst->rq_pagesz * (rqst->rq_npages - 1) -
-					rqst->rq_offset;
-			buflen += rqst->rq_tailsz;
-		}
-	}
-
+	buflen += iov_iter_count(&rqst->rq_iter);
 	return buflen;
 }
 
@@ -382,22 +363,12 @@ __smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
 
 		total_len += sent;
 
-		/* now walk the page array and send each page in it */
-		for (i = 0; i < rqst[j].rq_npages; i++) {
-			struct bio_vec bvec;
-
-			bvec.bv_page = rqst[j].rq_pages[i];
-			rqst_page_get_length(&rqst[j], i, &bvec.bv_len,
-					     &bvec.bv_offset);
-
-			iov_iter_bvec(&smb_msg.msg_iter, WRITE,
-				      &bvec, 1, bvec.bv_len);
-			rc = smb_send_kvec(server, &smb_msg, &sent);
-			if (rc < 0)
-				break;
+		smb_msg.msg_iter = rqst[j].rq_iter;
+		rc = smb_send_kvec(server, &smb_msg, &sent);
+		if (rc < 0)
+			break;
 
-			total_len += sent;
-		}
+		total_len += sent;
 	}
 
 unmask:
diff --git a/include/linux/uio.h b/include/linux/uio.h
index 931528bc2eab..c6f84416425e 100644
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@ -254,6 +254,10 @@ int iov_iter_npages(const struct iov_iter *i, int maxpages);
 void iov_iter_restore(struct iov_iter *i, struct iov_iter_state *state);
 
 const void *dup_iter(struct iov_iter *new, struct iov_iter *old, gfp_t flags);
+ssize_t iov_iter_scan(struct iov_iter *i, size_t bytes,
+		      ssize_t (*scanner)(struct iov_iter *i, const void *p,
+					 size_t len, size_t off, void *priv),
+		      void *priv);
 
 static inline size_t iov_iter_count(const struct iov_iter *i)
 {
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index cebfdb617fd8..3cd53e7ed5b9 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -1790,6 +1790,48 @@ ssize_t extract_iter_to_iter(struct iov_iter *orig,
 }
 EXPORT_SYMBOL(extract_iter_to_iter);
 
+/**
+ * iov_iter_scan - Scan a source iter
+ * @i: The iterator to scan
+ * @bytes: The amount of data to scan
+ * @scanner: The function to call for each bit
+ * @priv: Private data to pass to the scanner function
+ *
+ * Scan a source iterator (WRITE-type), passing each segment to the scanner
+ * function.  If the scanner returns an error at any time, scanning stops and
+ * the error is returned, otherwise the sum of the scanner results is returned.
+ */
+ssize_t iov_iter_scan(struct iov_iter *i, size_t bytes,
+		      ssize_t (*scanner)(struct iov_iter *i, const void *p,
+					 size_t len, size_t off, void *priv),
+		      void *priv)
+{
+	ssize_t ret = 0, scanned = 0;
+
+	if (!bytes)
+		return 0;
+	if (WARN_ON(iov_iter_rw(i) != WRITE))
+		return 0;
+	if (iter_is_iovec(i))
+		might_fault();
+
+	iterate_and_advance(
+		i, bytes, base, len, off, ({
+				ret = scanner(i, base, len, off, priv);
+				if (ret < 0)
+					break;
+				scanned += ret;
+			}), ({
+				ret = scanner(i, base, len, off, priv);
+				if (ret < 0)
+					break;
+				scanned += ret;
+			})
+	);
+	return ret < 0 ? ret : scanned;
+}
+EXPORT_SYMBOL(iov_iter_scan);
+
 size_t csum_and_copy_from_iter(void *addr, size_t bytes, __wsum *csum,
 			       struct iov_iter *i)
 {


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

