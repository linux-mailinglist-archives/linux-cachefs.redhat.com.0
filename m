Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A6B46EF10
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Dec 2021 17:59:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639069179;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SrKX/0ux9uQRo7Rj+YiYuzsZDCfAdnvrThXmiW5gP3k=;
	b=T/uL92sBh5Oedn1e8f9Fc0/6Zy/YTW4Ezh3xKhTI8c8gAU+WsPyfbq8279/83n8XJvku7/
	5T9/9iyjpzaI2KD5rTb8tECuLv+oYI5ykzmVX3PRWEBF2gUFW/2UoCzg2FLzabCh/xZ3bD
	SN7npJCJTut/aW/QJWMcrZ2mQmLNAm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-NtcMkIc9Pqyd45dfZ4rxXQ-1; Thu, 09 Dec 2021 11:59:36 -0500
X-MC-Unique: NtcMkIc9Pqyd45dfZ4rxXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89DC7802C99;
	Thu,  9 Dec 2021 16:59:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D32D45D74;
	Thu,  9 Dec 2021 16:59:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B0471809CB8;
	Thu,  9 Dec 2021 16:59:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B9GxXW6018945 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 9 Dec 2021 11:59:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5282A45D66; Thu,  9 Dec 2021 16:59:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F44660657;
	Thu,  9 Dec 2021 16:59:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 09 Dec 2021 16:59:23 +0000
Message-ID: <163906916346.143852.15632773570362489926.stgit@warthog.procyon.org.uk>
In-Reply-To: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
References: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Subject: [Linux-cachefs] [PATCH v2 26/67] fscache: Implement higher-level
	write I/O interface
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide a higher-level function than fscache_write() to perform a write
from an inode's pagecache to the cache, whilst fending off concurrent
writes by means of the PG_fscache mark on a page:

	void fscache_write_to_cache(struct fscache_cookie *cookie,
				    struct address_space *mapping,
				    loff_t start,
				    size_t len,
				    loff_t i_size,
				    netfs_io_terminated_t term_func,
				    void *term_func_priv,
				    bool caching);

If caching is false, this function does nothing except call (*term_func)()
if given.  It assumes that, in such a case, PG_fscache will not have been
set on the pages.

Otherwise, if caching is true, this function requires the source pages to
have had PG_fscache set on them before calling.  start and len define the
region of the file to be modified and i_size indicates the new file size.
The source pages are extracted from the mapping.

term_func and term_func_priv work as for fscache_write().  The PG_fscache
marks will be cleared at the end of the operation, before term_func is
called or the function otherwise returns.

There is an additonal helper function to clear the PG_fscache bits from a
range of pages:

	void fscache_clear_page_bits(struct fscache_cookie *cookie,
				     struct address_space *mapping,
				     loff_t start, size_t len,
				     bool caching);

If caching is true, the pages to be managed are expected to be located on
mapping in the range defined by start and len.  If caching is false, it
does nothing.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819614155.215744.5528123235123721230.stgit@warthog.procyon.org.uk/ # v1
---

 fs/fscache/io.c         |  104 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fscache.h |   63 ++++++++++++++++++++++++++++
 2 files changed, 167 insertions(+)

diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index 460a43473019..74cde7acf434 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -149,3 +149,107 @@ int __fscache_begin_read_operation(struct netfs_cache_resources *cres,
 				       fscache_access_io_read);
 }
 EXPORT_SYMBOL(__fscache_begin_read_operation);
+
+struct fscache_write_request {
+	struct netfs_cache_resources cache_resources;
+	struct address_space	*mapping;
+	loff_t			start;
+	size_t			len;
+	bool			set_bits;
+	netfs_io_terminated_t	term_func;
+	void			*term_func_priv;
+};
+
+void __fscache_clear_page_bits(struct address_space *mapping,
+			       loff_t start, size_t len)
+{
+	pgoff_t first = start / PAGE_SIZE;
+	pgoff_t last = (start + len - 1) / PAGE_SIZE;
+	struct page *page;
+
+	if (len) {
+		XA_STATE(xas, &mapping->i_pages, first);
+
+		rcu_read_lock();
+		xas_for_each(&xas, page, last) {
+			end_page_fscache(page);
+		}
+		rcu_read_unlock();
+	}
+}
+EXPORT_SYMBOL(__fscache_clear_page_bits);
+
+/*
+ * Deal with the completion of writing the data to the cache.
+ */
+static void fscache_wreq_done(void *priv, ssize_t transferred_or_error,
+			      bool was_async)
+{
+	struct fscache_write_request *wreq = priv;
+
+	fscache_clear_page_bits(fscache_cres_cookie(&wreq->cache_resources),
+				wreq->mapping, wreq->start, wreq->len,
+				wreq->set_bits);
+
+	if (wreq->term_func)
+		wreq->term_func(wreq->term_func_priv, transferred_or_error,
+				was_async);
+	fscache_end_operation(&wreq->cache_resources);
+	kfree(wreq);
+}
+
+void __fscache_write_to_cache(struct fscache_cookie *cookie,
+			      struct address_space *mapping,
+			      loff_t start, size_t len, loff_t i_size,
+			      netfs_io_terminated_t term_func,
+			      void *term_func_priv,
+			      bool cond)
+{
+	struct fscache_write_request *wreq;
+	struct netfs_cache_resources *cres;
+	struct iov_iter iter;
+	int ret = -ENOBUFS;
+
+	if (len == 0)
+		goto abandon;
+
+	_enter("%llx,%zx", start, len);
+
+	wreq = kzalloc(sizeof(struct fscache_write_request), GFP_NOFS);
+	if (!wreq)
+		goto abandon;
+	wreq->mapping		= mapping;
+	wreq->start		= start;
+	wreq->len		= len;
+	wreq->set_bits		= cond;
+	wreq->term_func		= term_func;
+	wreq->term_func_priv	= term_func_priv;
+
+	cres = &wreq->cache_resources;
+	if (fscache_begin_operation(cres, cookie, FSCACHE_WANT_WRITE,
+				    fscache_access_io_write) < 0)
+		goto abandon_free;
+
+	ret = cres->ops->prepare_write(cres, &start, &len, i_size, false);
+	if (ret < 0)
+		goto abandon_end;
+
+	/* TODO: Consider clearing page bits now for space the write isn't
+	 * covering.  This is more complicated than it appears when THPs are
+	 * taken into account.
+	 */
+
+	iov_iter_xarray(&iter, WRITE, &mapping->i_pages, start, len);
+	fscache_write(cres, start, &iter, fscache_wreq_done, wreq);
+	return;
+
+abandon_end:
+	return fscache_wreq_done(wreq, ret, false);
+abandon_free:
+	kfree(wreq);
+abandon:
+	fscache_clear_page_bits(cookie, mapping, start, len, cond);
+	if (term_func)
+		term_func(term_func_priv, ret, false);
+}
+EXPORT_SYMBOL(__fscache_write_to_cache);
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 55ea296fe4db..1a018964d418 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -164,6 +164,11 @@ extern void __fscache_relinquish_cookie(struct fscache_cookie *, bool);
 extern void __fscache_invalidate(struct fscache_cookie *, const void *, loff_t, unsigned int);
 extern int __fscache_begin_read_operation(struct netfs_cache_resources *, struct fscache_cookie *);
 
+extern void __fscache_write_to_cache(struct fscache_cookie *, struct address_space *,
+				     loff_t, size_t, loff_t, netfs_io_terminated_t, void *,
+				     bool);
+extern void __fscache_clear_page_bits(struct address_space *, loff_t, size_t);
+
 /**
  * fscache_acquire_volume - Register a volume as desiring caching services
  * @volume_key: An identification string for the volume
@@ -499,4 +504,62 @@ int fscache_write(struct netfs_cache_resources *cres,
 	return ops->write(cres, start_pos, iter, term_func, term_func_priv);
 }
 
+/**
+ * fscache_clear_page_bits - Clear the PG_fscache bits from a set of pages
+ * @cookie: The cookie representing the cache object
+ * @mapping: The netfs inode to use as the source
+ * @start: The start position in @mapping
+ * @len: The amount of data to unlock
+ * @caching: If PG_fscache has been set
+ *
+ * Clear the PG_fscache flag from a sequence of pages and wake up anyone who's
+ * waiting.
+ */
+static inline void fscache_clear_page_bits(struct fscache_cookie *cookie,
+					   struct address_space *mapping,
+					   loff_t start, size_t len,
+					   bool caching)
+{
+	if (caching)
+		__fscache_clear_page_bits(mapping, start, len);
+}
+
+/**
+ * fscache_write_to_cache - Save a write to the cache and clear PG_fscache
+ * @cookie: The cookie representing the cache object
+ * @mapping: The netfs inode to use as the source
+ * @start: The start position in @mapping
+ * @len: The amount of data to write back
+ * @i_size: The new size of the inode
+ * @term_func: The function to call upon completion
+ * @term_func_priv: The private data for @term_func
+ * @caching: If PG_fscache has been set
+ *
+ * Helper function for a netfs to write dirty data from an inode into the cache
+ * object that's backing it.
+ *
+ * @start and @len describe the range of the data.  This does not need to be
+ * page-aligned, but to satisfy DIO requirements, the cache may expand it up to
+ * the page boundaries on either end.  All the pages covering the range must be
+ * marked with PG_fscache.
+ *
+ * If given, @term_func will be called upon completion and supplied with
+ * @term_func_priv.  Note that the PG_fscache flags will have been cleared by
+ * this point, so the netfs must retain its own pin on the mapping.
+ */
+static inline void fscache_write_to_cache(struct fscache_cookie *cookie,
+					  struct address_space *mapping,
+					  loff_t start, size_t len, loff_t i_size,
+					  netfs_io_terminated_t term_func,
+					  void *term_func_priv,
+					  bool caching)
+{
+	if (caching)
+		__fscache_write_to_cache(cookie, mapping, start, len, i_size,
+					 term_func, term_func_priv, caching);
+	else if (term_func)
+		term_func(term_func_priv, -ENOBUFS, false);
+
+}
+
 #endif /* _LINUX_FSCACHE_H */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

