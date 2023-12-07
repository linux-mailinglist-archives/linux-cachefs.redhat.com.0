Return-Path: <linux-cachefs+bncBDLIXLMFVAERBUHQZCVQMGQE6MTGA3Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 380658093B3
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:25:38 +0100 (CET)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-58db6bfe269sf1412655eaf.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:25:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984337; cv=pass;
        d=google.com; s=arc-20160816;
        b=uI8S2bOg+KEY2MUzAv9Tucp2s6FuKfIJLBYaUDlkkfSajFJMJm6VFfGVrsL6eINYNf
         WttSJ7PmrIPnRbpAFgpYpUbVA1JRnCXfAWZ2FvAVnuG2Ja1xC38RL4iHK+mdg2yq/Acm
         47FJaDexaZCayKF5lQvjm+AMmt+gqcm8YrbbuECkZMqVeQQg4v3TQK8nOMHTKf3/bCmF
         XIVkdOnreU4h5F1zJO6IWt+/MPINg+esIILsj5RBrOWt0wm1RQY9Y5vP0Yzk7UGIcKLk
         TU00OKXnuJqRsWeQZIvu8aLN1sFS592FPfEY7XCVSpXWu4OveZNCPXKxt3acQ780Akc/
         U0AQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=8GYn5SAPk844JZkYxBOpYuU+PQ/w/bfXageIuqzM0GM=;
        fh=sYq5GRr4z4u7NkcTE0XnshsPQiXi0MpumQuI5P4a1/E=;
        b=RbZJl3Tw+srShcRcbQBOfBRxPaQUCfSCInPonzoEjMMry68IGntPXoS+UndgUElzck
         VD/uepIZdqgcgMyTu+uHey53UjdWgXvQ8I8f4mGOEooT6YypOSMKDcIFdggYXvAc27o1
         dqZhpXhbjP6b2rB/Pn+EJWCea0vxCm45A8wwkFDpX5O3VgBQOzYzk5w80PPcV0kyjBgP
         sjzpO6/wqt0rCnqArL2i3dWa3MJsBwmAVs4fbvq/gEaxlA7xyRWACWDijLPGjI/taNNC
         iVt2tJB4SYtly21SNxGQVJK3f8dVFpzUKfOKxaY1U9vjO18l5kkQzEYtVPO2JpjsCt3p
         UjNA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984337; x=1702589137;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GYn5SAPk844JZkYxBOpYuU+PQ/w/bfXageIuqzM0GM=;
        b=XFcDViiOuO8hXWId0ICzBki/RZP958DA1sGNHR673m/yZi5uJ6TJ9ymzJnHmz9vQqP
         6qDy4QfqQftDHp9pdL3w3zTqTR2wwyU6sECqib/5GoRdo8AFEJxvLveZ6JLqVa9KrDon
         HTnttykVCbIWOCpDiZAwFIklGHOZgHeyMEAnG62EBLmjoyYQNl0bLtFZMvr/LOGt6ikT
         w+Rrr9bPA6HM/VPkRIgAwVNn3NHXqFNEyvwHcpktl0InRsaNHIn0uayPlNFSVYc4W6E+
         H1OSjj7krx3dZsWXqBa8LeACh3Csk6grYOwmD7KTof0ycD7pYoJEJMgIORLqpmt8D7W2
         5H0Q==
X-Gm-Message-State: AOJu0YxDAhZGCc1Wa97jmCG4K/L207VvOfWwQ2QwWe7O18ZylSpUCMcx
	OJMA9NwwpPcwB6JKIiKk/wLgIQ==
X-Google-Smtp-Source: AGHT+IGksOHB+MtbTFRNOGh6vnDlU8E2IE5hQ7qDzwJ5a66/xCJeVpcsArHt5jbed4DkkzJTc/2rzQ==
X-Received: by 2002:a05:6820:2225:b0:58e:4c67:f35 with SMTP id cj37-20020a056820222500b0058e4c670f35mr3699428oob.0.1701984336896;
        Thu, 07 Dec 2023 13:25:36 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:602:b0:58a:758e:d0b5 with SMTP id
 e2-20020a056820060200b0058a758ed0b5ls2034715oow.0.-pod-prod-06-us; Thu, 07
 Dec 2023 13:25:36 -0800 (PST)
X-Received: by 2002:a05:6830:187:b0:6d8:7a7a:2d7f with SMTP id q7-20020a056830018700b006d87a7a2d7fmr3248944ota.41.1701984336239;
        Thu, 07 Dec 2023 13:25:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984336; cv=none;
        d=google.com; s=arc-20160816;
        b=d5e8F8HQeDm6g9LkLs1VfjVaCK0/NhsxHHvO90zjv8tCm4J+UTI+2jBUAyZOejvOpI
         Xfo9tPqngSWeqG22jVZILHxDtl2iNLSOPKNRTqk8jn0WVASpZInFQ0HemQjhO5nc+22f
         23ifvPLd+nQofAsrI4YB/WFY2+8NKsG1SROiQJWeJJ31B2fnAbN9biouSeIRps6wdOBf
         vQuYVQb+jADMPuPFauHb1/6AWlkseDG3DG49Zhv/QjIOoLQlyPuKFm2I/40fUujPWBZj
         HXJZ0CZQn6AftOh8jiR3ekGy2XKfZmmgJ4jn/VobHfYuCTVsT+/LKMIHvVRhKu8PPFcV
         ySNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=kmkaf0neIrm9B9vkqD0UfqMhopsdIzTpX/mUSNKoLoE=;
        fh=sYq5GRr4z4u7NkcTE0XnshsPQiXi0MpumQuI5P4a1/E=;
        b=GlO+D6MOM8MIJRVEneFyErjm0wwfAUO+g00Ejjr7woDnG/kXVNsKXu0d6deyO5mLE7
         dG9A9koSP6XXhSjogNs0dVVZWzdPf6QuznlKtAKI8SGkHr5QOIBCXT3VtewiQZN2gBFs
         x4MHinrUji9pWKyyT04mafG9QguhJEKr9pMJ4jg9JvfGlfJcMkQ6+HS1wv9PSxUPOdcU
         l6AXtc95tDTqnFCHRPQNnaZC16mq+2Xbm/aft/z4zn/Mzd4xuc3CjNn1ZwQhY1Hl7zeV
         Nxn8WZnIwibcQmHUIoxPxwUKlNrEjanqtLmqXj/JPGUQNy1gaAcVuN5DqpQ3mcei+KpV
         bF5w==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id fe14-20020a05622a4d4e00b00423d3459f72si759624qtb.808.2023.12.07.13.25.36
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:25:36 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-_gYtCbfXP66VfzwcId0cCw-1; Thu,
 07 Dec 2023 16:25:34 -0500
X-MC-Unique: _gYtCbfXP66VfzwcId0cCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BD7F386A0A1
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:25:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 284DE20271F4; Thu,  7 Dec 2023 21:25:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2160A2026D66;
	Thu,  7 Dec 2023 21:25:31 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>
Subject: [PATCH v3 57/59] cifs: Remove some code that's no longer used, part 2
Date: Thu,  7 Dec 2023 21:22:04 +0000
Message-ID: <20231207212206.1379128-58-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Remove some code that was #if'd out with the netfslib conversion.  This is
split into parts for file.c as the diff generator otherwise produces a hard
to read diff for part of it where a big chunk is cut out.

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
 fs/smb/client/file.c | 694 +------------------------------------------
 1 file changed, 1 insertion(+), 693 deletions(-)

diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index d3cb65e3234b..7e51c2702cdb 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -2561,699 +2561,6 @@ cifs_get_readable_path(struct cifs_tcon *tcon, const char *name,
 	return -ENOENT;
 }
 
-#if 0 // TODO remove 2773
-void
-cifs_writedata_release(struct cifs_io_subrequest *wdata)
-{
-	if (wdata->uncached)
-		kref_put(&wdata->ctx->refcount, cifs_aio_ctx_release);
-#ifdef CONFIG_CIFS_SMB_DIRECT
-	if (wdata->mr) {
-		smbd_deregister_mr(wdata->mr);
-		wdata->mr = NULL;
-	}
-#endif
-
-	if (wdata->cfile)
-		cifsFileInfo_put(wdata->cfile);
-
-	kfree(wdata);
-}
-
-/*
- * Write failed with a retryable error. Resend the write request. It's also
- * possible that the page was redirtied so re-clean the page.
- */
-static void
-cifs_writev_requeue(struct cifs_io_subrequest *wdata)
-{
-	int rc = 0;
-	struct inode *inode = d_inode(wdata->cfile->dentry);
-	struct TCP_Server_Info *server;
-	unsigned int rest_len = wdata->subreq.len;
-	loff_t fpos = wdata->subreq.start;
-
-	server = tlink_tcon(wdata->cfile->tlink)->ses->server;
-	do {
-		struct cifs_io_subrequest *wdata2;
-		unsigned int wsize, cur_len;
-
-		wsize = server->ops->wp_retry_size(inode);
-		if (wsize < rest_len) {
-			if (wsize < PAGE_SIZE) {
-				rc = -EOPNOTSUPP;
-				break;
-			}
-			cur_len = min(round_down(wsize, PAGE_SIZE), rest_len);
-		} else {
-			cur_len = rest_len;
-		}
-
-		wdata2 = cifs_writedata_alloc(cifs_writev_complete);
-		if (!wdata2) {
-			rc = -ENOMEM;
-			break;
-		}
-
-		wdata2->sync_mode = wdata->sync_mode;
-		wdata2->subreq.start	= fpos;
-		wdata2->subreq.len	= cur_len;
-		wdata2->subreq.io_iter = wdata->subreq.io_iter;
-
-		iov_iter_advance(&wdata2->subreq.io_iter, fpos - wdata->subreq.start);
-		iov_iter_truncate(&wdata2->subreq.io_iter, wdata2->subreq.len);
-
-		if (iov_iter_is_xarray(&wdata2->subreq.io_iter))
-			/* Check for pages having been redirtied and clean
-			 * them.  We can do this by walking the xarray.  If
-			 * it's not an xarray, then it's a DIO and we shouldn't
-			 * be mucking around with the page bits.
-			 */
-			cifs_undirty_folios(inode, fpos, cur_len);
-
-		rc = cifs_get_writable_file(CIFS_I(inode), FIND_WR_ANY,
-					    &wdata2->cfile);
-		if (!wdata2->cfile) {
-			cifs_dbg(VFS, "No writable handle to retry writepages rc=%d\n",
-				 rc);
-			if (!is_retryable_error(rc))
-				rc = -EBADF;
-		} else {
-			wdata2->pid = wdata2->cfile->pid;
-			rc = server->ops->async_writev(wdata2);
-		}
-
-		cifs_put_writedata(wdata2);
-		if (rc) {
-			if (is_retryable_error(rc))
-				continue;
-			fpos += cur_len;
-			rest_len -= cur_len;
-			break;
-		}
-
-		fpos += cur_len;
-		rest_len -= cur_len;
-	} while (rest_len > 0);
-
-	/* Clean up remaining pages from the original wdata */
-	if (iov_iter_is_xarray(&wdata->subreq.io_iter))
-		cifs_pages_write_failed(inode, fpos, rest_len);
-
-	if (rc != 0 && !is_retryable_error(rc))
-		mapping_set_error(inode->i_mapping, rc);
-	cifs_put_writedata(wdata);
-}
-
-void
-cifs_writev_complete(struct work_struct *work)
-{
-	struct cifs_io_subrequest *wdata = container_of(work,
-						struct cifs_io_subrequest, work);
-	struct inode *inode = d_inode(wdata->cfile->dentry);
-
-	if (wdata->result == 0) {
-		spin_lock(&inode->i_lock);
-		cifs_update_eof(CIFS_I(inode), wdata->subreq.start, wdata->subreq.len);
-		spin_unlock(&inode->i_lock);
-		cifs_stats_bytes_written(tlink_tcon(wdata->cfile->tlink),
-					 wdata->subreq.len);
-	} else if (wdata->sync_mode == WB_SYNC_ALL && wdata->result == -EAGAIN)
-		return cifs_writev_requeue(wdata);
-
-	if (wdata->result == -EAGAIN)
-		cifs_pages_write_redirty(inode, wdata->subreq.start, wdata->subreq.len);
-	else if (wdata->result < 0)
-		cifs_pages_write_failed(inode, wdata->subreq.start, wdata->subreq.len);
-	else
-		cifs_pages_written_back(inode, wdata->subreq.start, wdata->subreq.len);
-
-	if (wdata->result != -EAGAIN)
-		mapping_set_error(inode->i_mapping, wdata->result);
-	cifs_put_writedata(wdata);
-}
-
-struct cifs_io_subrequest *cifs_writedata_alloc(work_func_t complete)
-{
-	struct cifs_io_subrequest *wdata;
-
-	wdata = kzalloc(sizeof(*wdata), GFP_NOFS);
-	if (wdata != NULL) {
-		refcount_set(&wdata->subreq.ref, 1);
-		INIT_LIST_HEAD(&wdata->list);
-		init_completion(&wdata->done);
-		INIT_WORK(&wdata->work, complete);
-	}
-	return wdata;
-}
-
-static int cifs_partialpagewrite(struct page *page, unsigned from, unsigned to)
-{
-	struct address_space *mapping = page->mapping;
-	loff_t offset = (loff_t)page->index << PAGE_SHIFT;
-	char *write_data;
-	int rc = -EFAULT;
-	int bytes_written = 0;
-	struct inode *inode;
-	struct cifsFileInfo *open_file;
-
-	if (!mapping || !mapping->host)
-		return -EFAULT;
-
-	inode = page->mapping->host;
-
-	offset += (loff_t)from;
-	write_data = kmap(page);
-	write_data += from;
-
-	if ((to > PAGE_SIZE) || (from > to)) {
-		kunmap(page);
-		return -EIO;
-	}
-
-	/* racing with truncate? */
-	if (offset > mapping->host->i_size) {
-		kunmap(page);
-		return 0; /* don't care */
-	}
-
-	/* check to make sure that we are not extending the file */
-	if (mapping->host->i_size - offset < (loff_t)to)
-		to = (unsigned)(mapping->host->i_size - offset);
-
-	rc = cifs_get_writable_file(CIFS_I(mapping->host), FIND_WR_ANY,
-				    &open_file);
-	if (!rc) {
-		bytes_written = cifs_write(open_file, open_file->pid,
-					   write_data, to - from, &offset);
-		cifsFileInfo_put(open_file);
-		/* Does mm or vfs already set times? */
-		simple_inode_init_ts(inode);
-		if ((bytes_written > 0) && (offset))
-			rc = 0;
-		else if (bytes_written < 0)
-			rc = bytes_written;
-		else
-			rc = -EFAULT;
-	} else {
-		cifs_dbg(FYI, "No writable handle for write page rc=%d\n", rc);
-		if (!is_retryable_error(rc))
-			rc = -EIO;
-	}
-
-	kunmap(page);
-	return rc;
-}
-
-/*
- * Extend the region to be written back to include subsequent contiguously
- * dirty pages if possible, but don't sleep while doing so.
- */
-static void cifs_extend_writeback(struct address_space *mapping,
-				  long *_count,
-				  loff_t start,
-				  int max_pages,
-				  size_t max_len,
-				  unsigned int *_len)
-{
-	struct folio_batch batch;
-	struct folio *folio;
-	unsigned int psize, nr_pages;
-	size_t len = *_len;
-	pgoff_t index = (start + len) / PAGE_SIZE;
-	bool stop = true;
-	unsigned int i;
-	XA_STATE(xas, &mapping->i_pages, index);
-
-	folio_batch_init(&batch);
-
-	do {
-		/* Firstly, we gather up a batch of contiguous dirty pages
-		 * under the RCU read lock - but we can't clear the dirty flags
-		 * there if any of those pages are mapped.
-		 */
-		rcu_read_lock();
-
-		xas_for_each(&xas, folio, ULONG_MAX) {
-			stop = true;
-			if (xas_retry(&xas, folio))
-				continue;
-			if (xa_is_value(folio))
-				break;
-			if (folio_index(folio) != index)
-				break;
-			if (!folio_try_get_rcu(folio)) {
-				xas_reset(&xas);
-				continue;
-			}
-			nr_pages = folio_nr_pages(folio);
-			if (nr_pages > max_pages)
-				break;
-
-			/* Has the page moved or been split? */
-			if (unlikely(folio != xas_reload(&xas))) {
-				folio_put(folio);
-				break;
-			}
-
-			if (!folio_trylock(folio)) {
-				folio_put(folio);
-				break;
-			}
-			if (!folio_test_dirty(folio) || folio_test_writeback(folio)) {
-				folio_unlock(folio);
-				folio_put(folio);
-				break;
-			}
-
-			max_pages -= nr_pages;
-			psize = folio_size(folio);
-			len += psize;
-			stop = false;
-			if (max_pages <= 0 || len >= max_len || *_count <= 0)
-				stop = true;
-
-			index += nr_pages;
-			if (!folio_batch_add(&batch, folio))
-				break;
-			if (stop)
-				break;
-		}
-
-		if (!stop)
-			xas_pause(&xas);
-		rcu_read_unlock();
-
-		/* Now, if we obtained any pages, we can shift them to being
-		 * writable and mark them for caching.
-		 */
-		if (!folio_batch_count(&batch))
-			break;
-
-		for (i = 0; i < folio_batch_count(&batch); i++) {
-			folio = batch.folios[i];
-			/* The folio should be locked, dirty and not undergoing
-			 * writeback from the loop above.
-			 */
-			if (!folio_clear_dirty_for_io(folio))
-				WARN_ON(1);
-			folio_start_writeback(folio);
-
-			*_count -= folio_nr_pages(folio);
-			folio_unlock(folio);
-		}
-
-		folio_batch_release(&batch);
-		cond_resched();
-	} while (!stop);
-
-	*_len = len;
-}
-
-/*
- * Write back the locked page and any subsequent non-locked dirty pages.
- */
-static ssize_t cifs_write_back_from_locked_folio(struct address_space *mapping,
-						 struct writeback_control *wbc,
-						 struct folio *folio,
-						 loff_t start, loff_t end)
-{
-	struct inode *inode = mapping->host;
-	struct TCP_Server_Info *server;
-	struct cifs_io_subrequest *wdata;
-	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
-	struct cifs_credits credits_on_stack;
-	struct cifs_credits *credits = &credits_on_stack;
-	struct cifsFileInfo *cfile = NULL;
-	unsigned int xid, len;
-	loff_t i_size = i_size_read(inode);
-	size_t max_len, wsize;
-	long count = wbc->nr_to_write;
-	int rc;
-
-	/* The folio should be locked, dirty and not undergoing writeback. */
-	folio_start_writeback(folio);
-
-	count -= folio_nr_pages(folio);
-	len = folio_size(folio);
-
-	xid = get_xid();
-	server = cifs_pick_channel(cifs_sb_master_tcon(cifs_sb)->ses);
-
-	rc = cifs_get_writable_file(CIFS_I(inode), FIND_WR_ANY, &cfile);
-	if (rc) {
-		cifs_dbg(VFS, "No writable handle in writepages rc=%d\n", rc);
-		goto err_xid;
-	}
-
-	rc = server->ops->wait_mtu_credits(server, cifs_sb->ctx->wsize,
-					   &wsize, credits);
-	if (rc != 0)
-		goto err_close;
-
-	wdata = cifs_writedata_alloc(cifs_writev_complete);
-	if (!wdata) {
-		rc = -ENOMEM;
-		goto err_uncredit;
-	}
-
-	wdata->sync_mode = wbc->sync_mode;
-	wdata->subreq.start = folio_pos(folio);
-	wdata->pid = cfile->pid;
-	wdata->credits = credits_on_stack;
-	wdata->cfile = cfile;
-	wdata->server = server;
-	cfile = NULL;
-
-	/* Find all consecutive lockable dirty pages, stopping when we find a
-	 * page that is not immediately lockable, is not dirty or is missing,
-	 * or we reach the end of the range.
-	 */
-	if (start < i_size) {
-		/* Trim the write to the EOF; the extra data is ignored.  Also
-		 * put an upper limit on the size of a single storedata op.
-		 */
-		max_len = wsize;
-		max_len = min_t(unsigned long long, max_len, end - start + 1);
-		max_len = min_t(unsigned long long, max_len, i_size - start);
-
-		if (len < max_len) {
-			int max_pages = INT_MAX;
-
-#ifdef CONFIG_CIFS_SMB_DIRECT
-			if (server->smbd_conn)
-				max_pages = server->smbd_conn->max_frmr_depth;
-#endif
-			max_pages -= folio_nr_pages(folio);
-
-			if (max_pages > 0)
-				cifs_extend_writeback(mapping, &count, start,
-						      max_pages, max_len, &len);
-		}
-		len = min_t(loff_t, len, max_len);
-	}
-
-	wdata->subreq.len = len;
-
-	/* We now have a contiguous set of dirty pages, each with writeback
-	 * set; the first page is still locked at this point, but all the rest
-	 * have been unlocked.
-	 */
-	folio_unlock(folio);
-
-	if (start < i_size) {
-		iov_iter_xarray(&wdata->subreq.io_iter, ITER_SOURCE, &mapping->i_pages,
-				start, len);
-
-		rc = adjust_credits(wdata->server, &wdata->credits, wdata->subreq.len);
-		if (rc)
-			goto err_wdata;
-
-		if (wdata->cfile->invalidHandle)
-			rc = -EAGAIN;
-		else
-			rc = wdata->server->ops->async_writev(wdata);
-		if (rc >= 0) {
-			cifs_put_writedata(wdata);
-			goto err_close;
-		}
-	} else {
-		/* The dirty region was entirely beyond the EOF. */
-		cifs_pages_written_back(inode, start, len);
-		rc = 0;
-	}
-
-err_wdata:
-	cifs_put_writedata(wdata);
-err_uncredit:
-	add_credits_and_wake_if(server, credits, 0);
-err_close:
-	if (cfile)
-		cifsFileInfo_put(cfile);
-err_xid:
-	free_xid(xid);
-	if (rc == 0) {
-		wbc->nr_to_write = count;
-		rc = len;
-	} else if (is_retryable_error(rc)) {
-		cifs_pages_write_redirty(inode, start, len);
-	} else {
-		cifs_pages_write_failed(inode, start, len);
-		mapping_set_error(mapping, rc);
-	}
-	/* Indication to update ctime and mtime as close is deferred */
-	set_bit(CIFS_INO_MODIFIED_ATTR, &CIFS_I(inode)->flags);
-	return rc;
-}
-
-/*
- * write a region of pages back to the server
- */
-static int cifs_writepages_region(struct address_space *mapping,
-				  struct writeback_control *wbc,
-				  loff_t start, loff_t end, loff_t *_next)
-{
-	struct folio_batch fbatch;
-	int skips = 0;
-
-	folio_batch_init(&fbatch);
-	do {
-		int nr;
-		pgoff_t index = start / PAGE_SIZE;
-
-		nr = filemap_get_folios_tag(mapping, &index, end / PAGE_SIZE,
-					    PAGECACHE_TAG_DIRTY, &fbatch);
-		if (!nr)
-			break;
-
-		for (int i = 0; i < nr; i++) {
-			ssize_t ret;
-			struct folio *folio = fbatch.folios[i];
-
-redo_folio:
-			start = folio_pos(folio); /* May regress with THPs */
-
-			/* At this point we hold neither the i_pages lock nor the
-			 * page lock: the page may be truncated or invalidated
-			 * (changing page->mapping to NULL), or even swizzled
-			 * back from swapper_space to tmpfs file mapping
-			 */
-			if (wbc->sync_mode != WB_SYNC_NONE) {
-				ret = folio_lock_killable(folio);
-				if (ret < 0)
-					goto write_error;
-			} else {
-				if (!folio_trylock(folio))
-					goto skip_write;
-			}
-
-			if (folio_mapping(folio) != mapping ||
-			    !folio_test_dirty(folio)) {
-				start += folio_size(folio);
-				folio_unlock(folio);
-				continue;
-			}
-
-			if (folio_test_writeback(folio) ||
-			    folio_test_fscache(folio)) {
-				folio_unlock(folio);
-				if (wbc->sync_mode == WB_SYNC_NONE)
-					goto skip_write;
-
-				folio_wait_writeback(folio);
-#ifdef CONFIG_CIFS_FSCACHE
-				folio_wait_fscache(folio);
-#endif
-				goto redo_folio;
-			}
-
-			if (!folio_clear_dirty_for_io(folio))
-				/* We hold the page lock - it should've been dirty. */
-				WARN_ON(1);
-
-			ret = cifs_write_back_from_locked_folio(mapping, wbc, folio, start, end);
-			if (ret < 0)
-				goto write_error;
-
-			start += ret;
-			continue;
-
-write_error:
-			folio_batch_release(&fbatch);
-			*_next = start;
-			return ret;
-
-skip_write:
-			/*
-			 * Too many skipped writes, or need to reschedule?
-			 * Treat it as a write error without an error code.
-			 */
-			if (skips >= 5 || need_resched()) {
-				ret = 0;
-				goto write_error;
-			}
-
-			/* Otherwise, just skip that folio and go on to the next */
-			skips++;
-			start += folio_size(folio);
-			continue;
-		}
-
-		folio_batch_release(&fbatch);
-		cond_resched();
-	} while (wbc->nr_to_write > 0);
-
-	*_next = start;
-	return 0;
-}
-
-/*
- * Write some of the pending data back to the server
- */
-static int cifs_writepages(struct address_space *mapping,
-			   struct writeback_control *wbc)
-{
-	loff_t start, next;
-	int ret;
-
-	/* We have to be careful as we can end up racing with setattr()
-	 * truncating the pagecache since the caller doesn't take a lock here
-	 * to prevent it.
-	 */
-
-	if (wbc->range_cyclic) {
-		start = mapping->writeback_index * PAGE_SIZE;
-		ret = cifs_writepages_region(mapping, wbc, start, LLONG_MAX, &next);
-		if (ret == 0) {
-			mapping->writeback_index = next / PAGE_SIZE;
-			if (start > 0 && wbc->nr_to_write > 0) {
-				ret = cifs_writepages_region(mapping, wbc, 0,
-							     start, &next);
-				if (ret == 0)
-					mapping->writeback_index =
-						next / PAGE_SIZE;
-			}
-		}
-	} else if (wbc->range_start == 0 && wbc->range_end == LLONG_MAX) {
-		ret = cifs_writepages_region(mapping, wbc, 0, LLONG_MAX, &next);
-		if (wbc->nr_to_write > 0 && ret == 0)
-			mapping->writeback_index = next / PAGE_SIZE;
-	} else {
-		ret = cifs_writepages_region(mapping, wbc,
-					     wbc->range_start, wbc->range_end, &next);
-	}
-
-	return ret;
-}
-
-static int
-cifs_writepage_locked(struct page *page, struct writeback_control *wbc)
-{
-	int rc;
-	unsigned int xid;
-
-	xid = get_xid();
-/* BB add check for wbc flags */
-	get_page(page);
-	if (!PageUptodate(page))
-		cifs_dbg(FYI, "ppw - page not up to date\n");
-
-	/*
-	 * Set the "writeback" flag, and clear "dirty" in the radix tree.
-	 *
-	 * A writepage() implementation always needs to do either this,
-	 * or re-dirty the page with "redirty_page_for_writepage()" in
-	 * the case of a failure.
-	 *
-	 * Just unlocking the page will cause the radix tree tag-bits
-	 * to fail to update with the state of the page correctly.
-	 */
-	set_page_writeback(page);
-retry_write:
-	rc = cifs_partialpagewrite(page, 0, PAGE_SIZE);
-	if (is_retryable_error(rc)) {
-		if (wbc->sync_mode == WB_SYNC_ALL && rc == -EAGAIN)
-			goto retry_write;
-		redirty_page_for_writepage(wbc, page);
-	} else if (rc != 0) {
-		SetPageError(page);
-		mapping_set_error(page->mapping, rc);
-	} else {
-		SetPageUptodate(page);
-	}
-	end_page_writeback(page);
-	put_page(page);
-	free_xid(xid);
-	return rc;
-}
-
-static int cifs_write_end(struct file *file, struct address_space *mapping,
-			loff_t pos, unsigned len, unsigned copied,
-			struct page *page, void *fsdata)
-{
-	int rc;
-	struct inode *inode = mapping->host;
-	struct cifsFileInfo *cfile = file->private_data;
-	struct cifs_sb_info *cifs_sb = CIFS_SB(cfile->dentry->d_sb);
-	struct folio *folio = page_folio(page);
-	__u32 pid;
-
-	if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_RWPIDFORWARD)
-		pid = cfile->pid;
-	else
-		pid = current->tgid;
-
-	cifs_dbg(FYI, "write_end for page %p from pos %lld with %d bytes\n",
-		 page, pos, copied);
-
-	if (folio_test_checked(folio)) {
-		if (copied == len)
-			folio_mark_uptodate(folio);
-		folio_clear_checked(folio);
-	} else if (!folio_test_uptodate(folio) && copied == PAGE_SIZE)
-		folio_mark_uptodate(folio);
-
-	if (!folio_test_uptodate(folio)) {
-		char *page_data;
-		unsigned offset = pos & (PAGE_SIZE - 1);
-		unsigned int xid;
-
-		xid = get_xid();
-		/* this is probably better than directly calling
-		   partialpage_write since in this function the file handle is
-		   known which we might as well	leverage */
-		/* BB check if anything else missing out of ppw
-		   such as updating last write time */
-		page_data = kmap(page);
-		rc = cifs_write(cfile, pid, page_data + offset, copied, &pos);
-		/* if (rc < 0) should we set writebehind rc? */
-		kunmap(page);
-
-		free_xid(xid);
-	} else {
-		rc = copied;
-		pos += copied;
-		set_page_dirty(page);
-	}
-
-	if (rc > 0) {
-		spin_lock(&inode->i_lock);
-		if (pos > inode->i_size) {
-			i_size_write(inode, pos);
-			inode->i_blocks = (512 - 1 + pos) >> 9;
-		}
-		spin_unlock(&inode->i_lock);
-	}
-
-	unlock_page(page);
-	put_page(page);
-	/* Indication to update ctime and mtime as close is deferred */
-	set_bit(CIFS_INO_MODIFIED_ATTR, &CIFS_I(inode)->flags);
-
-	return rc;
-}
-#endif // End netfs removal 2773
-
 /*
  * Flush data on a strict file.
  */
@@ -4568,6 +3875,7 @@ cifs_read(struct file *file, char *read_data, size_t read_size, loff_t *offset)
 }
 #endif // end netfslib remove 4633
 
+
 static vm_fault_t cifs_page_mkwrite(struct vm_fault *vmf)
 {
 	return netfs_page_mkwrite(vmf, NULL);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

