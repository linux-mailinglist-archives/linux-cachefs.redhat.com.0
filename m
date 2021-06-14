Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC463A667E
	for <lists+linux-cachefs@lfdr.de>; Mon, 14 Jun 2021 14:25:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623673543;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k7weiVzKdDNvgHQrUCRVRDqilHnYTWAVgfAENkjnnoo=;
	b=TA56Inkq/JcItBTeTnJMkOMWEHlO4ph9fprydRiBbWldrEDFuqBZIq05UoU903sRoj1nyd
	hM85R/inkrLeog6JOmP0jmnI07wTaMK4z7Td4j9Mk11D6nT0lh1IgMNDvhD2pjmbWAq/Hh
	KAHtsdDoz/5lRaRcV/D14mDWsXj5M6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-mwzDg_U1NTW8CuBrhq6GIA-1; Mon, 14 Jun 2021 08:25:42 -0400
X-MC-Unique: mwzDg_U1NTW8CuBrhq6GIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C258E8015D0;
	Mon, 14 Jun 2021 12:25:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFBAF5D6D3;
	Mon, 14 Jun 2021 12:25:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9538F46F59;
	Mon, 14 Jun 2021 12:25:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15ECPcp9026989 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 14 Jun 2021 08:25:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 403746091B; Mon, 14 Jun 2021 12:25:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-65.rdu2.redhat.com
	[10.10.118.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AEF486060F;
	Mon, 14 Jun 2021 12:25:33 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210613233345.113565-1-jlayton@kernel.org>
References: <20210613233345.113565-1-jlayton@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Jun 2021 13:25:32 +0100
Message-ID: <398005.1623673532@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 15ECPcp9026989
X-loop: linux-cachefs@redhat.com
Cc: Andrew W Elble <aweits@rit.edu>, willy@infradead.org,
	linux-cachefs@redhat.com, pfmeec@rit.edu, idryomov@gmail.com,
	ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] netfs: fix test for whether we can skip
	read when writing beyond EOF
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
Content-ID: <398004.1623673532.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Here's my take on Jeff's patch.

David
---
commit 2821dcb8a99b5da3b914cfc57ba6010635719b12
Author: Jeff Layton <jlayton@kernel.org>
Date:   Sun Jun 13 19:33:45 2021 -0400

    netfs: fix test for whether we can skip read when writing beyond EOF
    
    It's not sufficient to skip reading when the pos is beyond the EOF.
    There may be data at the head of the page that we need to fill in
    before the write.
    
    Add a new helper function that corrects and clarifies the logic of
    when we can skip reads, and have it only zero out the part of the page
    that won't have data copied in for the write.
    
    Finally, don't set the page Uptodate after zeroing. It's not up to date
    since the write data won't have been copied in yet.
    
    [DH made the following changes:
    
     - Prefixed the new function with "netfs_".
    
     - Don't call zero_user_segments() for a full-page write.
    
     - Altered the beyond-last-page check to avoid a DIV instruction and got
       rid of then-redundant zero-length file check.
    
     - Made afs handle a short copy (didn't matter before as the page was fully
       set up before the copy).  Now it returns 0 from afs_write_end() if the
       page was not uptodate as commit b9de313cf05fe08fa59efaf19756ec5283af672a
       does for ceph.
    
     - Made afs handle len indicating a write that extended over the end of the
       page allocated.]
    
    Fixes: e1b1240c1ff5f ("netfs: Add write_begin helper")
    Reported-by: Andrew W Elble <aweits@rit.edu>
    Signed-off-by: Jeff Layton <jlayton@kernel.org>
    Signed-off-by: David Howells <dhowells@redhat.com>
    Link: https://lore.kernel.org/r/340984.1623666185@warthog.procyon.org.uk/T/#m5e9b155310973bc71cf101d3dea6aced492bfd49
---
 fs/afs/write.c         |   23 ++++++++++++++++------
 fs/netfs/read_helper.c |   50 ++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 54 insertions(+), 19 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index 4e90e094d770..15fdc3f8a3ae 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -28,7 +28,8 @@ int afs_set_page_dirty(struct page *page)
 }
 
 /*
- * prepare to perform part of a write to a page
+ * Prepare to perform part of a write to a page.  Note that len may extend
+ * beyond the end of the page.
  */
 int afs_write_begin(struct file *file, struct address_space *mapping,
 		    loff_t pos, unsigned len, unsigned flags,
@@ -55,7 +56,8 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
 		return ret;
 
 	index = page->index;
-	from = pos - index * PAGE_SIZE;
+	from = offset_in_thp(page, pos);
+	len = min_t(size_t, len, thp_size(page) - from);
 	to = from + len;
 
 try_again:
@@ -106,7 +108,8 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
 }
 
 /*
- * finalise part of a write to a page
+ * Finalise part of a write to a page.  Note that len may extend beyond the end
+ * of the page.
  */
 int afs_write_end(struct file *file, struct address_space *mapping,
 		  loff_t pos, unsigned len, unsigned copied,
@@ -115,13 +118,23 @@ int afs_write_end(struct file *file, struct address_space *mapping,
 	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
 	struct page *page = thp_head(subpage);
 	unsigned long priv;
-	unsigned int f, from = pos & (thp_size(page) - 1);
+	unsigned int f, from = offset_in_thp(page, pos);
 	unsigned int t, to = from + copied;
+	unsigned int l = min_t(size_t, len, thp_size(page) - from);
 	loff_t i_size, write_end_pos;
 
 	_enter("{%llx:%llu},{%lx}",
 	       vnode->fid.vid, vnode->fid.vnode, page->index);
 
+	if (!PageUptodate(page)) {
+		if (copied < l) {
+			copied = 0;
+			goto out;
+		}
+
+		SetPageUptodate(page);
+	}
+
 	if (copied == 0)
 		goto out;
 
@@ -137,8 +150,6 @@ int afs_write_end(struct file *file, struct address_space *mapping,
 		fscache_update_cookie(afs_vnode_cache(vnode), NULL, &write_end_pos);
 	}
 
-	ASSERT(PageUptodate(page));
-
 	if (PagePrivate(page)) {
 		priv = page_private(page);
 		f = afs_page_dirty_from(page, priv);
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 725614625ed4..0c4e68ae8127 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -1011,12 +1011,43 @@ int netfs_readpage(struct file *file,
 }
 EXPORT_SYMBOL(netfs_readpage);
 
-static void netfs_clear_thp(struct page *page)
+/**
+ * prep_noread_page - prep a page for writing without reading first
+ * @page: page being prepared
+ * @pos: starting position for the write
+ * @len: length of write
+ *
+ * In some cases, write_begin doesn't need to read at all:
+ * - full page write
+ * - file is currently zero-length
+ * - write that lies in a page that is completely beyond EOF
+ * - write that covers the the page from start to EOF or beyond it
+ *
+ * If any of these criteria are met, then zero out the unwritten parts
+ * of the page and return true. Otherwise, return false.
+ */
+static noinline bool netfs_prep_noread_page(struct page *page, loff_t pos, size_t len)
 {
-	unsigned int i;
+	struct inode *inode = page->mapping->host;
+	loff_t i_size = i_size_read(inode);
+	size_t offset = offset_in_thp(page, pos);
+
+	/* Full page write */
+	if (offset == 0 && len >= thp_size(page))
+		return true;
+
+	/* pos beyond last page in the file */
+	if (pos - offset >= i_size)
+		goto zero_out;
+
+	/* Write that covers from the start of the page  to EOF or beyond */
+	if (offset == 0 && (pos + len) >= i_size)
+		goto zero_out;
 
-	for (i = 0; i < thp_nr_pages(page); i++)
-		clear_highpage(page + i);
+	return false;
+zero_out:
+	zero_user_segments(page, 0, offset, offset + len, thp_size(page));
+	return true;
 }
 
 /**
@@ -1024,7 +1055,7 @@ static void netfs_clear_thp(struct page *page)
  * @file: The file to read from
  * @mapping: The mapping to read from
  * @pos: File position at which the write will begin
- * @len: The length of the write in this page
+ * @len: The length of the write (may extend beyond the end of the page chosen)
  * @flags: AOP_* flags
  * @_page: Where to put the resultant page
  * @_fsdata: Place for the netfs to store a cookie
@@ -1061,8 +1092,6 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	struct inode *inode = file_inode(file);
 	unsigned int debug_index = 0;
 	pgoff_t index = pos >> PAGE_SHIFT;
-	int pos_in_page = pos & ~PAGE_MASK;
-	loff_t size;
 	int ret;
 
 	DEFINE_READAHEAD(ractl, file, NULL, mapping, index);
@@ -1090,13 +1119,8 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	 * within the cache granule containing the EOF, in which case we need
 	 * to preload the granule.
 	 */
-	size = i_size_read(inode);
 	if (!ops->is_cache_enabled(inode) &&
-	    ((pos_in_page == 0 && len == thp_size(page)) ||
-	     (pos >= size) ||
-	     (pos_in_page == 0 && (pos + len) >= size))) {
-		netfs_clear_thp(page);
-		SetPageUptodate(page);
+	    netfs_prep_noread_page(page, pos, len)) {
 		netfs_stat(&netfs_n_rh_write_zskip);
 		goto have_page_no_wait;
 	}

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

