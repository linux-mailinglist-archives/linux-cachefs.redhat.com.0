Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C11794F6E54
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 01:05:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649286312;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0PG5L1NGu9+XgQvp3pKQfxjfnjPHS5Uro06zTexZrHs=;
	b=MPFyzrhBP63jjVhBSq2B1EPlf1nj52WrE1E9WJTWkVTjqfolaFxfozcljSSj/48x5/recy
	GhihAhx1Amp9BI1JQNFCPk14CuK72NNhaI5f6KLCamlg+/XZJgj65ksf8lySnkdJYH6uFr
	r1l/78gq3mEFcNk3JHP6uYKRKiY/KIw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-83Gapr6cNeOWjbfUI5FfyA-1; Wed, 06 Apr 2022 19:05:09 -0400
X-MC-Unique: 83Gapr6cNeOWjbfUI5FfyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38AB985A5A8;
	Wed,  6 Apr 2022 23:05:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D6A740CF91A;
	Wed,  6 Apr 2022 23:05:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E18CB194036B;
	Wed,  6 Apr 2022 23:05:08 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 29B45194034B for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 23:05:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 05C22C28105; Wed,  6 Apr 2022 23:05:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CFC4C28102;
 Wed,  6 Apr 2022 23:05:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 07 Apr 2022 00:05:05 +0100
Message-ID: <164928630577.457102.8519251179327601178.stgit@warthog.procyon.org.uk>
In-Reply-To: <164928615045.457102.10607899252434268982.stgit@warthog.procyon.org.uk>
References: <164928615045.457102.10607899252434268982.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Linux-cachefs] [PATCH 14/14] mm, netfs,
 fscache: Stop read optimisation when folio removed from pagecache
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
 Matthew Wilcox <willy@infradead.org>, Steve French <sfrench@samba.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fscache has an optimisation by which reads from the cache are skipped until
we know that (a) there's data there to be read and (b) that data isn't
entirely covered by pages resident in the netfs pagecache.  This is done
with two flags manipulated by fscache_note_page_release():

	if (...
	    test_bit(FSCACHE_COOKIE_HAVE_DATA, &cookie->flags) &&
	    test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags))
		clear_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);

where the NO_DATA_TO_READ flag causes cachefiles_prepare_read() to indicate
that netfslib should download from the server or clear the page instead.

The fscache_note_page_release() function is intended to be called from
->releasepage() - but that only gets called if PG_private or PG_private_2
is set - and currently the former is at the discretion of the netfs and the
latter is only set whilst a page is being written to the cache, so
sometimes we miss clearing the optimisation.

Fix this by adding an extra address_space operation, ->removing folio(),
and flag, AS_NOTIFY_REMOVING_FOLIO.  The operation is called if the flag is
set when a folio is removed from the pagecache.  The flag should be set if
a non-NULL cookie is obtained from fscache and cleared in ->evict_inode()
before truncate_inode_pages_final() is called.

This can be tested by reading some data and then dropping caches.  The
number of times the new op is called is counted in /proc/fs/fscache/stats:

	RdHelp : DR=0 RA=4100 RP=0 WB=0 WBZ=0 rm=131072 <----

Reported-by: Rohith Surabattula <rohiths.msft@gmail.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Matthew Wilcox <willy@infradead.org>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: linux-cifs@vger.kernel.org
---

 fs/afs/file.c           |    1 +
 fs/afs/inode.c          |    1 +
 fs/afs/internal.h       |    2 ++
 fs/cifs/cifsfs.c        |    1 +
 fs/cifs/file.c          |    1 +
 fs/cifs/fscache.c       |    3 +++
 fs/netfs/internal.h     |    1 +
 fs/netfs/misc.c         |   13 ++++++++++++-
 fs/netfs/stats.c        |    9 ++++++---
 include/linux/fs.h      |    2 ++
 include/linux/netfs.h   |    1 +
 include/linux/pagemap.h |    1 +
 mm/filemap.c            |   15 +++++++++++++++
 13 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 1398b3fc6fef..b833f440903d 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -54,6 +54,7 @@ const struct address_space_operations afs_file_aops = {
 	.launder_folio	= afs_launder_folio,
 	.releasepage	= netfs_releasepage,
 	.invalidate_folio = netfs_invalidate_folio,
+	.removing_folio	= netfs_removing_folio,
 	.write_begin	= afs_write_begin,
 	.write_end	= afs_write_end,
 	.writepage	= afs_writepage,
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 12d2438661fc..6b8891402df5 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -790,6 +790,7 @@ void afs_evict_inode(struct inode *inode)
 
 	ASSERTCMP(inode->i_ino, ==, vnode->fid.vnode);
 
+	clear_bit(AS_NOTIFY_REMOVING_FOLIO, &inode->i_mapping->flags);
 	truncate_inode_pages_final(&inode->i_data);
 
 	afs_set_cache_aux(vnode, &aux);
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 7b7ef945dc78..7756217dab09 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -686,6 +686,8 @@ static inline void afs_vnode_set_cache(struct afs_vnode *vnode,
 {
 #ifdef CONFIG_AFS_FSCACHE
 	vnode->netfs_ctx.cache = cookie;
+	if (cookie)
+		set_bit(AS_NOTIFY_REMOVING_FOLIO, &vnode->vfs_inode.i_mapping->flags);
 #endif
 }
 
diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
index d07cb28652f2..125d303c5038 100644
--- a/fs/cifs/cifsfs.c
+++ b/fs/cifs/cifsfs.c
@@ -404,6 +404,7 @@ cifs_free_inode(struct inode *inode)
 static void
 cifs_evict_inode(struct inode *inode)
 {
+	clear_bit(AS_NOTIFY_REMOVING_FOLIO, &inode->i_mapping->flags);
 	truncate_inode_pages_final(&inode->i_data);
 	if (inode->i_state & I_PINNING_FSCACHE_WB)
 		cifs_fscache_unuse_inode_cookie(inode, true);
diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index 12663d9d1e51..71f96701e602 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -3923,6 +3923,7 @@ const struct address_space_operations cifs_addr_ops = {
 	.direct_IO = cifs_direct_io,
 	.invalidate_folio = netfs_invalidate_folio,
 	.launder_folio = cifs_launder_folio,
+	.removing_folio	= netfs_removing_folio,
 	/*
 	 * TODO: investigate and if useful we could add an cifs_migratePage
 	 * helper (under an CONFIG_MIGRATION) in the future, and also
diff --git a/fs/cifs/fscache.c b/fs/cifs/fscache.c
index bb1c3a372de4..5d8464bed798 100644
--- a/fs/cifs/fscache.c
+++ b/fs/cifs/fscache.c
@@ -108,6 +108,9 @@ void cifs_fscache_get_inode_cookie(struct inode *inode)
 				       &cifsi->uniqueid, sizeof(cifsi->uniqueid),
 				       &cd, sizeof(cd),
 				       i_size_read(&cifsi->vfs_inode));
+	if (cifsi->netfs_ctx.cache)
+		set_bit(AS_NOTIFY_REMOVING_FOLIO, inode->i_mapping->flags);
+
 }
 
 void cifs_fscache_unuse_inode_cookie(struct inode *inode, bool update)
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index bc4db520d5c7..f373b9da6258 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -114,6 +114,7 @@ extern atomic_t netfs_n_rh_write_begin;
 extern atomic_t netfs_n_rh_write_done;
 extern atomic_t netfs_n_rh_write_failed;
 extern atomic_t netfs_n_rh_write_zskip;
+extern atomic_t netfs_n_rh_remove_folio;
 
 
 static inline void netfs_stat(atomic_t *stat)
diff --git a/fs/netfs/misc.c b/fs/netfs/misc.c
index a9e8abfa89f8..59ac380c2b08 100644
--- a/fs/netfs/misc.c
+++ b/fs/netfs/misc.c
@@ -178,7 +178,18 @@ int netfs_releasepage(struct page *page, gfp_t gfp)
 		folio_wait_fscache(folio);
 	}
 
-	fscache_note_page_release(netfs_i_cookie(folio_inode(folio)));
 	return true;
 }
 EXPORT_SYMBOL(netfs_releasepage);
+
+/**
+ * netfs_removing_folio - Notification of a folio about to be removed
+ * @mapping: The pagecache about to be altered
+ * @folio: The folio about to be removed
+ */
+void netfs_removing_folio(struct address_space *mapping, struct folio *folio)
+{
+	netfs_stat(&netfs_n_rh_remove_folio);
+	fscache_note_page_release(netfs_i_cookie(mapping->host));
+}
+EXPORT_SYMBOL(netfs_removing_folio);
diff --git a/fs/netfs/stats.c b/fs/netfs/stats.c
index 85aef51cc6cf..9a0c49540979 100644
--- a/fs/netfs/stats.c
+++ b/fs/netfs/stats.c
@@ -28,17 +28,20 @@ atomic_t netfs_n_rh_write_begin;
 atomic_t netfs_n_rh_write_done;
 atomic_t netfs_n_rh_write_failed;
 atomic_t netfs_n_rh_write_zskip;
+atomic_t netfs_n_rh_remove_folio;
 
 void netfs_stats_show(struct seq_file *m)
 {
-	seq_printf(m, "RdHelp : DR=%u RA=%u RP=%u WB=%u WBZ=%u rr=%u sr=%u\n",
+	seq_printf(m, "RdHelp : rr=%u sr=%u\n",
+		   atomic_read(&netfs_n_rh_rreq),
+		   atomic_read(&netfs_n_rh_sreq));
+	seq_printf(m, "RdHelp : DR=%u RA=%u RP=%u WB=%u WBZ=%u rm=%u\n",
 		   atomic_read(&netfs_n_rh_dio_read),
 		   atomic_read(&netfs_n_rh_readahead),
 		   atomic_read(&netfs_n_rh_readpage),
 		   atomic_read(&netfs_n_rh_write_begin),
 		   atomic_read(&netfs_n_rh_write_zskip),
-		   atomic_read(&netfs_n_rh_rreq),
-		   atomic_read(&netfs_n_rh_sreq));
+		   atomic_read(&netfs_n_rh_remove_folio));
 	seq_printf(m, "RdHelp : ZR=%u sh=%u sk=%u\n",
 		   atomic_read(&netfs_n_rh_zero),
 		   atomic_read(&netfs_n_rh_short_read),
diff --git a/include/linux/fs.h b/include/linux/fs.h
index bbde95387a23..269327d36bd7 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -360,6 +360,8 @@ struct address_space_operations {
 	sector_t (*bmap)(struct address_space *, sector_t);
 	void (*invalidate_folio) (struct folio *, size_t offset, size_t len);
 	int (*releasepage) (struct page *, gfp_t);
+	void (*removing_folio)(struct address_space *mapping,
+			       struct folio *folio);
 	void (*freepage)(struct page *);
 	ssize_t (*direct_IO)(struct kiocb *, struct iov_iter *iter);
 	/*
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index b503d13061f4..717114531da9 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -316,6 +316,7 @@ extern int netfs_write_begin(struct file *, struct address_space *,
 			     void **);
 extern void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 extern int netfs_releasepage(struct page *page, gfp_t gfp_flags);
+extern void netfs_removing_folio(struct address_space *mapping, struct folio *folio);
 
 extern void netfs_subreq_terminated(struct netfs_io_subrequest *, ssize_t, bool);
 extern void netfs_get_subrequest(struct netfs_io_subrequest *subreq,
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 993994cd943a..976b56180700 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -199,6 +199,7 @@ enum mapping_flags {
 	/* writeback related tags are not used */
 	AS_NO_WRITEBACK_TAGS = 5,
 	AS_LARGE_FOLIO_SUPPORT = 6,
+	AS_NOTIFY_REMOVING_FOLIO,	/* Call aops->removing_folio() */
 };
 
 /**
diff --git a/mm/filemap.c b/mm/filemap.c
index 3a5ffb5587cd..1cacf11369d9 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -209,6 +209,20 @@ static void filemap_unaccount_folio(struct address_space *mapping,
 		folio_account_cleaned(folio, inode_to_wb(mapping->host));
 }
 
+/*
+ * Note that a page is about to be removed from the pagecache.  If a page that
+ * is about to be removed had been copied to the cache, then in future fscache
+ * won't be able to skip checking in the cache.  We do, however, need to do the
+ * notification before the removal lest we race with the page being brought
+ * back again.
+ */
+static void fscache_notify_removing_page(struct address_space *mapping,
+					 struct folio *folio)
+{
+	if (unlikely(test_bit(AS_NOTIFY_REMOVING_FOLIO, &mapping->flags)))
+		mapping->a_ops->removing_folio(mapping, folio);
+}
+
 /*
  * Delete a page from the page cache and free it. Caller has to make
  * sure the page is locked and that nobody else uses it - or that usage
@@ -219,6 +233,7 @@ void __filemap_remove_folio(struct folio *folio, void *shadow)
 	struct address_space *mapping = folio->mapping;
 
 	trace_mm_filemap_delete_from_page_cache(folio);
+	fscache_notify_removing_page(mapping, folio);
 	filemap_unaccount_folio(mapping, folio);
 	page_cache_delete(mapping, folio, shadow);
 }


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

