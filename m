Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 364504F6E3A
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 01:03:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649286224;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vAXj4WVdSsf1rF4zItOw9PEwpPORgJQvuBzwwXBc6Fg=;
	b=ORsMF2zPgpCFWmSQ6YxG7vz76fLCMuKzUcPPzeiXcvSYbJ0KDnmoyyj7wnjhMFDMb2iT9G
	cAwqEfjtg2xe5OlvzU1dByZZwOjFwseK46KGHjTr1h5cAgyS6C4KFySNMQWB8rLIHo8c9m
	k7ZsBvxm2aPSb1Vg0Ug5yiEXxRg42pw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-LJWKvEgnN06fWAt0fnpKZA-1; Wed, 06 Apr 2022 19:03:43 -0400
X-MC-Unique: LJWKvEgnN06fWAt0fnpKZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A31F185A7A4;
	Wed,  6 Apr 2022 23:03:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E0C0407DEC7;
	Wed,  6 Apr 2022 23:03:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 281AB194036B;
	Wed,  6 Apr 2022 23:03:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 606891949763 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 23:03:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5249C482CE0; Wed,  6 Apr 2022 23:03:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8977426338;
 Wed,  6 Apr 2022 23:03:38 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 07 Apr 2022 00:03:38 +0100
Message-ID: <164928621823.457102.8777804402615654773.stgit@warthog.procyon.org.uk>
In-Reply-To: <164928615045.457102.10607899252434268982.stgit@warthog.procyon.org.uk>
References: <164928615045.457102.10607899252434268982.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH 05/14] cifs: Remove unused code
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 Rohith Surabattula <rohiths.msft@gmail.com>, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove a bunch of functions that are no longer used and are commented out
after the conversion to use iterators throughout the I/O path.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: linux-cifs@vger.kernel.org
---

 fs/cifs/file.c |  590 --------------------------------------------------------
 1 file changed, 590 deletions(-)

diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index 1063ec88a118..aa72be9dcf4e 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -2262,298 +2262,6 @@ static int cifs_partialpagewrite(struct page *page, unsigned from, unsigned to)
 	return rc;
 }
 
-#if 0 // TODO: Remove for iov_iter support
-static struct cifs_writedata *
-wdata_alloc_and_fillpages(pgoff_t tofind, struct address_space *mapping,
-			  pgoff_t end, pgoff_t *index,
-			  unsigned int *found_pages)
-{
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
-
-static unsigned int
-wdata_prepare_pages(struct cifs_writedata *wdata, unsigned int found_pages,
-		    struct address_space *mapping,
-		    struct writeback_control *wbc,
-		    pgoff_t end, pgoff_t *index, pgoff_t *next, bool *done)
-{
-	unsigned int nr_pages = 0, i;
-	struct page *page;
-
-	for (i = 0; i < found_pages; i++) {
-		page = wdata->pages[i];
-		/*
-		 * At this point we hold neither the i_pages lock nor the
-		 * page lock: the page may be truncated or invalidated
-		 * (changing page->mapping to NULL), or even swizzled
-		 * back from swapper_space to tmpfs file mapping
-		 */
-
-		if (nr_pages == 0)
-			lock_page(page);
-		else if (!trylock_page(page))
-			break;
-
-		if (unlikely(page->mapping != mapping)) {
-			unlock_page(page);
-			break;
-		}
-
-		if (!wbc->range_cyclic && page->index > end) {
-			*done = true;
-			unlock_page(page);
-			break;
-		}
-
-		if (*next && (page->index != *next)) {
-			/* Not next consecutive page */
-			unlock_page(page);
-			break;
-		}
-
-		if (wbc->sync_mode != WB_SYNC_NONE)
-			wait_on_page_writeback(page);
-
-		if (PageWriteback(page) ||
-				!clear_page_dirty_for_io(page)) {
-			unlock_page(page);
-			break;
-		}
-
-		/*
-		 * This actually clears the dirty bit in the radix tree.
-		 * See cifs_writepage() for more commentary.
-		 */
-		set_page_writeback(page);
-		if (page_offset(page) >= i_size_read(mapping->host)) {
-			*done = true;
-			unlock_page(page);
-			end_page_writeback(page);
-			break;
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
-
-static int
-wdata_send_pages(struct cifs_writedata *wdata, unsigned int nr_pages,
-		 struct address_space *mapping, struct writeback_control *wbc)
-{
-	int rc;
-
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
-
-	if (wdata->cfile->invalidHandle)
-		rc = -EAGAIN;
-	else
-		rc = wdata->server->ops->async_writev(wdata,
-						      cifs_writedata_release);
-
-	return rc;
-}
-
-static int cifs_writepages(struct address_space *mapping,
-			   struct writeback_control *wbc)
-{
-	struct inode *inode = mapping->host;
-	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
-	struct TCP_Server_Info *server;
-	bool done = false, scanned = false, range_whole = false;
-	pgoff_t end, index;
-	struct cifs_writedata *wdata;
-	struct cifsFileInfo *cfile = NULL;
-	int rc = 0;
-	int saved_rc = 0;
-	unsigned int xid;
-
-	/*
-	 * If wsize is smaller than the page cache size, default to writing
-	 * one page at a time via cifs_writepage
-	 */
-	if (cifs_sb->ctx->wsize < PAGE_SIZE)
-		return generic_writepages(mapping, wbc);
-
-	xid = get_xid();
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
-	server = cifs_pick_channel(cifs_sb_master_tcon(cifs_sb)->ses);
-
-retry:
-	while (!done && index <= end) {
-		unsigned int i, nr_pages, found_pages, wsize;
-		pgoff_t next = 0, tofind, saved_index = index;
-		struct cifs_credits credits_on_stack;
-		struct cifs_credits *credits = &credits_on_stack;
-		int get_file_rc = 0;
-
-		if (cfile)
-			cifsFileInfo_put(cfile);
-
-		rc = cifs_get_writable_file(CIFS_I(inode), FIND_WR_ANY, &cfile);
-
-		/* in case of an error store it to return later */
-		if (rc)
-			get_file_rc = rc;
-
-		rc = server->ops->wait_mtu_credits(server, cifs_sb->ctx->wsize,
-						   &wsize, credits);
-		if (rc != 0) {
-			done = true;
-			break;
-		}
-
-		tofind = min((wsize / PAGE_SIZE) - 1, end - index) + 1;
-
-		wdata = wdata_alloc_and_fillpages(tofind, mapping, end, &index,
-						  &found_pages);
-		if (!wdata) {
-			rc = -ENOMEM;
-			done = true;
-			add_credits_and_wake_if(server, credits, 0);
-			break;
-		}
-
-		if (found_pages == 0) {
-			kref_put(&wdata->refcount, cifs_writedata_release);
-			add_credits_and_wake_if(server, credits, 0);
-			break;
-		}
-
-		nr_pages = wdata_prepare_pages(wdata, found_pages, mapping, wbc,
-					       end, &index, &next, &done);
-
-		/* nothing to write? */
-		if (nr_pages == 0) {
-			kref_put(&wdata->refcount, cifs_writedata_release);
-			add_credits_and_wake_if(server, credits, 0);
-			continue;
-		}
-
-		wdata->credits = credits_on_stack;
-		wdata->cfile = cfile;
-		wdata->server = server;
-		cfile = NULL;
-
-		if (!wdata->cfile) {
-			cifs_dbg(VFS, "No writable handle in writepages rc=%d\n",
-				 get_file_rc);
-			if (is_retryable_error(get_file_rc))
-				rc = get_file_rc;
-			else
-				rc = -EBADF;
-		} else
-			rc = wdata_send_pages(wdata, nr_pages, mapping, wbc);
-
-		for (i = 0; i < nr_pages; ++i)
-			unlock_page(wdata->pages[i]);
-
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
-			}
-			if (!is_retryable_error(rc))
-				mapping_set_error(mapping, rc);
-		}
-		kref_put(&wdata->refcount, cifs_writedata_release);
-
-		if (wbc->sync_mode == WB_SYNC_ALL && rc == -EAGAIN) {
-			index = saved_index;
-			continue;
-		}
-
-		/* Return immediately if we received a signal during writing */
-		if (is_interrupt_error(rc)) {
-			done = true;
-			break;
-		}
-
-		if (rc != 0 && saved_rc == 0)
-			saved_rc = rc;
-
-		wbc->nr_to_write -= nr_pages;
-		if (wbc->nr_to_write <= 0)
-			done = true;
-
-		index = next;
-	}
-
-	if (!scanned && !done) {
-		/*
-		 * We hit the last page and there is more work to be done: wrap
-		 * back to the start of the file
-		 */
-		scanned = true;
-		index = 0;
-		goto retry;
-	}
-
-	if (saved_rc != 0)
-		rc = saved_rc;
-
-	if (wbc->range_cyclic || (range_whole && wbc->nr_to_write > 0))
-		mapping->writeback_index = index;
-
-	if (cfile)
-		cifsFileInfo_put(cfile);
-	free_xid(xid);
-	/* Indication to update ctime and mtime as close is deferred */
-	set_bit(CIFS_INO_MODIFIED_ATTR, &CIFS_I(inode)->flags);
-	return rc;
-}
-#endif
-
 /*
  * Extend the region to be written back to include subsequent contiguously
  * dirty pages if possible, but don't sleep while doing so.
@@ -3131,49 +2839,6 @@ int cifs_flush(struct file *file, fl_owner_t id)
 	return rc;
 }
 
-#if 0 // TODO: Remove for iov_iter support
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
-#endif
-
 static void
 cifs_uncached_writedata_release(struct kref *refcount)
 {
@@ -3206,50 +2871,6 @@ cifs_uncached_writev_complete(struct work_struct *work)
 	kref_put(&wdata->refcount, cifs_uncached_writedata_release);
 }
 
-#if 0 // TODO: Remove for iov_iter support
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
-#endif
-
 static int
 cifs_resend_wdata(struct cifs_writedata *wdata, struct list_head *wdata_list,
 	struct cifs_aio_ctx *ctx)
@@ -3749,83 +3370,6 @@ cifs_uncached_readv_complete(struct work_struct *work)
 	kref_put(&rdata->refcount, cifs_readdata_release);
 }
 
-#if 0 // TODO: Remove for iov_iter support
-
-static int
-uncached_fill_pages(struct TCP_Server_Info *server,
-		    struct cifs_readdata *rdata, struct iov_iter *iter,
-		    unsigned int len)
-{
-	int result = 0;
-	unsigned int i;
-	unsigned int nr_pages = rdata->nr_pages;
-	unsigned int page_offset = rdata->page_offset;
-
-	rdata->got_bytes = 0;
-	rdata->tailsz = PAGE_SIZE;
-	for (i = 0; i < nr_pages; i++) {
-		struct page *page = rdata->pages[i];
-		size_t n;
-		unsigned int segment_size = rdata->pagesz;
-
-		if (i == 0)
-			segment_size -= page_offset;
-		else
-			page_offset = 0;
-
-
-		if (len <= 0) {
-			/* no need to hold page hostage */
-			rdata->pages[i] = NULL;
-			rdata->nr_pages--;
-			put_page(page);
-			continue;
-		}
-
-		n = len;
-		if (len >= segment_size)
-			/* enough data to fill the page */
-			n = segment_size;
-		else
-			rdata->tailsz = len;
-		len -= n;
-
-		if (iter)
-			result = copy_page_from_iter(
-					page, page_offset, n, iter);
-#ifdef CONFIG_CIFS_SMB_DIRECT
-		else if (rdata->mr)
-			result = n;
-#endif
-		else
-			result = cifs_read_page_from_socket(
-					server, page, page_offset, n);
-		if (result < 0)
-			break;
-
-		rdata->got_bytes += result;
-	}
-
-	return rdata->got_bytes > 0 && result != -ECONNABORTED ?
-						rdata->got_bytes : result;
-}
-
-static int
-cifs_uncached_read_into_pages(struct TCP_Server_Info *server,
-			      struct cifs_readdata *rdata, unsigned int len)
-{
-	return uncached_fill_pages(server, rdata, NULL, len);
-}
-
-static int
-cifs_uncached_copy_into_pages(struct TCP_Server_Info *server,
-			      struct cifs_readdata *rdata,
-			      struct iov_iter *iter)
-{
-	return uncached_fill_pages(server, rdata, iter, iter->count);
-}
-#endif
-
 static int cifs_resend_rdata(struct cifs_readdata *rdata,
 			struct list_head *rdata_list,
 			struct cifs_aio_ctx *ctx)
@@ -4381,140 +3925,6 @@ int cifs_file_mmap(struct file *file, struct vm_area_struct *vma)
 	return rc;
 }
 
-#if 0 // TODO: Remove for iov_iter support
-
-static void
-cifs_readv_complete(struct work_struct *work)
-{
-	unsigned int i, got_bytes;
-	struct cifs_readdata *rdata = container_of(work,
-						struct cifs_readdata, work);
-
-	got_bytes = rdata->got_bytes;
-	for (i = 0; i < rdata->nr_pages; i++) {
-		struct page *page = rdata->pages[i];
-
-		if (rdata->result == 0 ||
-		    (rdata->result == -EAGAIN && got_bytes)) {
-			flush_dcache_page(page);
-			SetPageUptodate(page);
-		} else
-			SetPageError(page);
-
-		if (rdata->result == 0 ||
-		    (rdata->result == -EAGAIN && got_bytes))
-			cifs_readpage_to_fscache(rdata->mapping->host, page);
-
-		unlock_page(page);
-
-		got_bytes -= min_t(unsigned int, PAGE_SIZE, got_bytes);
-
-		put_page(page);
-		rdata->pages[i] = NULL;
-	}
-	kref_put(&rdata->refcount, cifs_readdata_release);
-}
-
-static int
-readpages_fill_pages(struct TCP_Server_Info *server,
-		     struct cifs_readdata *rdata, struct iov_iter *iter,
-		     unsigned int len)
-{
-	int result = 0;
-	unsigned int i;
-	u64 eof;
-	pgoff_t eof_index;
-	unsigned int nr_pages = rdata->nr_pages;
-	unsigned int page_offset = rdata->page_offset;
-
-	/* determine the eof that the server (probably) has */
-	eof = CIFS_I(rdata->mapping->host)->server_eof;
-	eof_index = eof ? (eof - 1) >> PAGE_SHIFT : 0;
-	cifs_dbg(FYI, "eof=%llu eof_index=%lu\n", eof, eof_index);
-
-	rdata->got_bytes = 0;
-	rdata->tailsz = PAGE_SIZE;
-	for (i = 0; i < nr_pages; i++) {
-		struct page *page = rdata->pages[i];
-		unsigned int to_read = rdata->pagesz;
-		size_t n;
-
-		if (i == 0)
-			to_read -= page_offset;
-		else
-			page_offset = 0;
-
-		n = to_read;
-
-		if (len >= to_read) {
-			len -= to_read;
-		} else if (len > 0) {
-			/* enough for partial page, fill and zero the rest */
-			zero_user(page, len + page_offset, to_read - len);
-			n = rdata->tailsz = len;
-			len = 0;
-		} else if (page->index > eof_index) {
-			/*
-			 * The VFS will not try to do readahead past the
-			 * i_size, but it's possible that we have outstanding
-			 * writes with gaps in the middle and the i_size hasn't
-			 * caught up yet. Populate those with zeroed out pages
-			 * to prevent the VFS from repeatedly attempting to
-			 * fill them until the writes are flushed.
-			 */
-			zero_user(page, 0, PAGE_SIZE);
-			flush_dcache_page(page);
-			SetPageUptodate(page);
-			unlock_page(page);
-			put_page(page);
-			rdata->pages[i] = NULL;
-			rdata->nr_pages--;
-			continue;
-		} else {
-			/* no need to hold page hostage */
-			unlock_page(page);
-			put_page(page);
-			rdata->pages[i] = NULL;
-			rdata->nr_pages--;
-			continue;
-		}
-
-		if (iter)
-			result = copy_page_from_iter(
-					page, page_offset, n, iter);
-#ifdef CONFIG_CIFS_SMB_DIRECT
-		else if (rdata->mr)
-			result = n;
-#endif
-		else
-			result = cifs_read_page_from_socket(
-					server, page, page_offset, n);
-		if (result < 0)
-			break;
-
-		rdata->got_bytes += result;
-	}
-
-	return rdata->got_bytes > 0 && result != -ECONNABORTED ?
-						rdata->got_bytes : result;
-}
-
-static int
-cifs_readpages_read_into_pages(struct TCP_Server_Info *server,
-			       struct cifs_readdata *rdata, unsigned int len)
-{
-	return readpages_fill_pages(server, rdata, NULL, len);
-}
-
-static int
-cifs_readpages_copy_into_pages(struct TCP_Server_Info *server,
-			       struct cifs_readdata *rdata,
-			       struct iov_iter *iter)
-{
-	return readpages_fill_pages(server, rdata, iter, iter->count);
-}
-#endif
-
 /*
  * Unlock a bunch of folios in the pagecache.
  */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

