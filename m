Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AF346EF3B
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Dec 2021 18:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639069214;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fFK4obZmFGlLA3GK13M6H8HvdtTPBhFTUAwb1F0+kTA=;
	b=Ace6lJpvDfo0s64iEwOHQFqeRwjdqI1vagSSogC+/uAkIPaAlT300SjuegBIgL4N20JSG4
	GF0l+AbAEKIhQLNoqcp1IozyHPF2b7ohadjO3vxDAaU5xvi2nRQaqaNEAgqXlPcKll3/h7
	2OTklCNC/N3P/K7ksVdMU0RSS60ZW0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-236-Xmfxr28cO6KoKxkE2MIhPw-1; Thu, 09 Dec 2021 12:00:12 -0500
X-MC-Unique: Xmfxr28cO6KoKxkE2MIhPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1593F871117;
	Thu,  9 Dec 2021 17:00:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07C758049B;
	Thu,  9 Dec 2021 17:00:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E255F4BB7B;
	Thu,  9 Dec 2021 16:59:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B9GxwTE018972 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 9 Dec 2021 11:59:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4D5C8795A7; Thu,  9 Dec 2021 16:59:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89A144DA21;
	Thu,  9 Dec 2021 16:59:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 09 Dec 2021 16:59:38 +0000
Message-ID: <163906917856.143852.8224898306177154573.stgit@warthog.procyon.org.uk>
In-Reply-To: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
References: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Subject: [Linux-cachefs] [PATCH v2 27/67] vfs,
 fscache: Implement pinning of cache usage for writeback
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

Cachefiles has a problem in that it needs to keep the backing file for a
cookie open whilst there are local modifications pending that need to be
written to it.  However, we don't want to keep the file open indefinitely,
as that causes EMFILE/ENFILE/ENOMEM problems.

Reopening the cache file, however, is a problem if this is being done due
to writeback triggered by exit().  Some filesystems will oops if we try to
open a file in that context because they want to access current->fs or
other resources that have already been dismantled.

To get around this, I added the following:

 (1) An inode flag, I_PINNING_FSCACHE_WB, to be set on a network filesystem
     inode to indicate that we have a usage count on the cookie caching
     that inode.

 (2) A flag in struct writeback_control, unpinned_fscache_wb, that is set
     when __writeback_single_inode() clears the last dirty page from
     i_pages - at which point it clears I_PINNING_FSCACHE_WB and sets this
     flag.

     This has to be done here so that clearing I_PINNING_FSCACHE_WB can be
     done atomically with the check of PAGECACHE_TAG_DIRTY that clears
     I_DIRTY_PAGES.

 (3) A function, fscache_set_page_dirty(), which if it is not set, sets
     I_PINNING_FSCACHE_WB and calls fscache_use_cookie() to pin the cache
     resources.

 (4) A function, fscache_unpin_writeback(), to be called by ->write_inode()
     to unuse the cookie.

 (5) A function, fscache_clear_inode_writeback(), to be called when the
     inode is evicted, before clear_inode() is called.  This cleans up any
     lingering I_PINNING_FSCACHE_WB.

The network filesystem can then use these tools to make sure that
fscache_write_to_cache() can write locally modified data to the cache as
well as to the server.

For the future, I'm working on write helpers for netfs lib that should
allow this facility to be removed by keeping track of the dirty regions
separately - but that's incomplete at the moment and is also going to be
affected by folios, one way or another, since it deals with pages

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819615157.215744.17623791756928043114.stgit@warthog.procyon.org.uk/ # v1
---

 fs/fs-writeback.c         |    8 ++++++++
 fs/fscache/io.c           |   38 ++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h        |    3 +++
 include/linux/fscache.h   |   41 +++++++++++++++++++++++++++++++++++++++++
 include/linux/writeback.h |    1 +
 5 files changed, 91 insertions(+)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 67f0e88eed01..8294a60ce323 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -1666,6 +1666,13 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
 
 	if (mapping_tagged(mapping, PAGECACHE_TAG_DIRTY))
 		inode->i_state |= I_DIRTY_PAGES;
+	else if (unlikely(inode->i_state & I_PINNING_FSCACHE_WB)) {
+		if (!(inode->i_state & I_DIRTY_PAGES)) {
+			inode->i_state &= ~I_PINNING_FSCACHE_WB;
+			wbc->unpinned_fscache_wb = true;
+			dirty |= I_PINNING_FSCACHE_WB; /* Cause write_inode */
+		}
+	}
 
 	spin_unlock(&inode->i_lock);
 
@@ -1675,6 +1682,7 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
 		if (ret == 0)
 			ret = err;
 	}
+	wbc->unpinned_fscache_wb = false;
 	trace_writeback_single_inode(inode, wbc, nr_to_write);
 	return ret;
 }
diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index 74cde7acf434..e9e5d6758ea8 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -150,6 +150,44 @@ int __fscache_begin_read_operation(struct netfs_cache_resources *cres,
 }
 EXPORT_SYMBOL(__fscache_begin_read_operation);
 
+/**
+ * fscache_set_page_dirty - Mark page dirty and pin a cache object for writeback
+ * @page: The page being dirtied
+ * @cookie: The cookie referring to the cache object
+ *
+ * Set the dirty flag on a page and pin an in-use cache object in memory when
+ * dirtying a page so that writeback can later write to it.  This is intended
+ * to be called from the filesystem's ->set_page_dirty() method.
+ *
+ *  Returns 1 if PG_dirty was set on the page, 0 otherwise.
+ */
+int fscache_set_page_dirty(struct page *page, struct fscache_cookie *cookie)
+{
+	struct inode *inode = page->mapping->host;
+	bool need_use = false;
+
+	_enter("");
+
+	if (!__set_page_dirty_nobuffers(page))
+		return 0;
+	if (!fscache_cookie_valid(cookie))
+		return 1;
+
+	if (!(inode->i_state & I_PINNING_FSCACHE_WB)) {
+		spin_lock(&inode->i_lock);
+		if (!(inode->i_state & I_PINNING_FSCACHE_WB)) {
+			inode->i_state |= I_PINNING_FSCACHE_WB;
+			need_use = true;
+		}
+		spin_unlock(&inode->i_lock);
+
+		if (need_use)
+			fscache_use_cookie(cookie, true);
+	}
+	return 1;
+}
+EXPORT_SYMBOL(fscache_set_page_dirty);
+
 struct fscache_write_request {
 	struct netfs_cache_resources cache_resources;
 	struct address_space	*mapping;
diff --git a/include/linux/fs.h b/include/linux/fs.h
index bbf812ce89a8..2c0b8e77d9ab 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2418,6 +2418,8 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
  *			Used to detect that mark_inode_dirty() should not move
  * 			inode between dirty lists.
  *
+ * I_PINNING_FSCACHE_WB	Inode is pinning an fscache object for writeback.
+ *
  * Q: What is the difference between I_WILL_FREE and I_FREEING?
  */
 #define I_DIRTY_SYNC		(1 << 0)
@@ -2440,6 +2442,7 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
 #define I_CREATING		(1 << 15)
 #define I_DONTCACHE		(1 << 16)
 #define I_SYNC_QUEUED		(1 << 17)
+#define I_PINNING_FSCACHE_WB	(1 << 18)
 
 #define I_DIRTY_INODE (I_DIRTY_SYNC | I_DIRTY_DATASYNC)
 #define I_DIRTY (I_DIRTY_INODE | I_DIRTY_PAGES)
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 1a018964d418..73942b4e9aee 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -16,6 +16,7 @@
 
 #include <linux/fs.h>
 #include <linux/netfs.h>
+#include <linux/writeback.h>
 
 #if defined(CONFIG_FSCACHE) || defined(CONFIG_FSCACHE_MODULE)
 #define __fscache_available (1)
@@ -562,4 +563,44 @@ static inline void fscache_write_to_cache(struct fscache_cookie *cookie,
 
 }
 
+#if __fscache_available
+extern int fscache_set_page_dirty(struct page *page, struct fscache_cookie *cookie);
+#else
+#define fscache_set_page_dirty(PAGE, COOKIE) (__set_page_dirty_nobuffers((PAGE)))
+#endif
+
+/**
+ * fscache_unpin_writeback - Unpin writeback resources
+ * @wbc: The writeback control
+ * @cookie: The cookie referring to the cache object
+ *
+ * Unpin the writeback resources pinned by fscache_set_page_dirty().  This is
+ * intended to be called by the netfs's ->write_inode() method.
+ */
+static inline void fscache_unpin_writeback(struct writeback_control *wbc,
+					   struct fscache_cookie *cookie)
+{
+	if (wbc->unpinned_fscache_wb)
+		fscache_unuse_cookie(cookie, NULL, NULL);
+}
+
+/**
+ * fscache_clear_inode_writeback - Clear writeback resources pinned by an inode
+ * @cookie: The cookie referring to the cache object
+ * @inode: The inode to clean up
+ * @aux: Auxiliary data to apply to the inode
+ *
+ * Clear any writeback resources held by an inode when the inode is evicted.
+ * This must be called before clear_inode() is called.
+ */
+static inline void fscache_clear_inode_writeback(struct fscache_cookie *cookie,
+						 struct inode *inode,
+						 const void *aux)
+{
+	if (inode->i_state & I_PINNING_FSCACHE_WB) {
+		loff_t i_size = i_size_read(inode);
+		fscache_unuse_cookie(cookie, aux, &i_size);
+	}
+}
+
 #endif /* _LINUX_FSCACHE_H */
diff --git a/include/linux/writeback.h b/include/linux/writeback.h
index 3bfd487d1dd2..fec248ab1fec 100644
--- a/include/linux/writeback.h
+++ b/include/linux/writeback.h
@@ -68,6 +68,7 @@ struct writeback_control {
 	unsigned for_reclaim:1;		/* Invoked from the page allocator */
 	unsigned range_cyclic:1;	/* range_start is cyclic */
 	unsigned for_sync:1;		/* sync(2) WB_SYNC_ALL writeback */
+	unsigned unpinned_fscache_wb:1;	/* Cleared I_PINNING_FSCACHE_WB */
 
 	/*
 	 * When writeback IOs are bounced through async layers, only the


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

