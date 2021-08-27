Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EF5F63F9769
	for <lists+linux-cachefs@lfdr.de>; Fri, 27 Aug 2021 11:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630057450;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9Ry9bs/LRgBybKZ/uJV1UFil9LzySF10ci8SBSPTPOM=;
	b=WtYFpcEUjg6A09IuhXjt8ma//3n2Vx0pn553d6pEQGNUYw2/0nixheXY3ACZVxgRMVLhEJ
	hSyORTI15kBvOy/yaTtWGwJ6NuCU2KBunqevJYMNo9P5nGtSFgiYe0FNm4zlXBp1hsb8Is
	7qIkpqMIk4gR4hAe2P3KDhtvCHhgZ3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-xcfN-0zlM9-THZ_C4YefPw-1; Fri, 27 Aug 2021 05:44:09 -0400
X-MC-Unique: xcfN-0zlM9-THZ_C4YefPw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 918AD8042E5;
	Fri, 27 Aug 2021 09:43:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82E235C1D5;
	Fri, 27 Aug 2021 09:43:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F7554BB7C;
	Fri, 27 Aug 2021 09:43:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17R9hnHj002285 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 05:43:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 953781ACC7; Fri, 27 Aug 2021 09:43:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0D605D6B1;
	Fri, 27 Aug 2021 09:43:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Date: Fri, 27 Aug 2021 10:43:45 +0100
Message-ID: <163005742570.2472992.7800423440314043178.stgit@warthog.procyon.org.uk>
In-Reply-To: <163005740700.2472992.12365214290752300378.stgit@warthog.procyon.org.uk>
References: <163005740700.2472992.12365214290752300378.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	v9fs-developer@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
	devel@lists.orangefs.org
Subject: [Linux-cachefs] [PATCH v2 2/6] afs: Sort out symlink reading
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

afs_readpage() doesn't get a file pointer when called for a symlink, so
separate it from regular file pointer handling.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@redhat.com>
Link: https://lore.kernel.org/r/162687508008.276387.6418924257569297305.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/162981152280.1901565.2264055504466731917.stgit@warthog.procyon.org.uk/
---

 fs/afs/file.c     |   14 +++++++++-----
 fs/afs/inode.c    |    6 +++---
 fs/afs/internal.h |    3 ++-
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index db035ae2a134..daa9106b9654 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -19,6 +19,7 @@
 
 static int afs_file_mmap(struct file *file, struct vm_area_struct *vma);
 static int afs_readpage(struct file *file, struct page *page);
+static int afs_symlink_readpage(struct file *file, struct page *page);
 static void afs_invalidatepage(struct page *page, unsigned int offset,
 			       unsigned int length);
 static int afs_releasepage(struct page *page, gfp_t gfp_flags);
@@ -45,7 +46,7 @@ const struct inode_operations afs_file_inode_operations = {
 	.permission	= afs_permission,
 };
 
-const struct address_space_operations afs_fs_aops = {
+const struct address_space_operations afs_file_aops = {
 	.readpage	= afs_readpage,
 	.readahead	= afs_readahead,
 	.set_page_dirty	= afs_set_page_dirty,
@@ -58,6 +59,12 @@ const struct address_space_operations afs_fs_aops = {
 	.writepages	= afs_writepages,
 };
 
+const struct address_space_operations afs_symlink_aops = {
+	.readpage	= afs_symlink_readpage,
+	.releasepage	= afs_releasepage,
+	.invalidatepage	= afs_invalidatepage,
+};
+
 static const struct vm_operations_struct afs_vm_ops = {
 	.fault		= filemap_fault,
 	.map_pages	= filemap_map_pages,
@@ -306,7 +313,7 @@ static void afs_req_issue_op(struct netfs_read_subrequest *subreq)
 	afs_fetch_data(fsreq->vnode, fsreq);
 }
 
-static int afs_symlink_readpage(struct page *page)
+static int afs_symlink_readpage(struct file *file, struct page *page)
 {
 	struct afs_vnode *vnode = AFS_FS_I(page->mapping->host);
 	struct afs_read *fsreq;
@@ -371,9 +378,6 @@ const struct netfs_read_request_ops afs_req_ops = {
 
 static int afs_readpage(struct file *file, struct page *page)
 {
-	if (!file)
-		return afs_symlink_readpage(page);
-
 	return netfs_readpage(file, page, &afs_req_ops, NULL);
 }
 
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 80b6c8d967d5..0dc71b24859f 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -105,7 +105,7 @@ static int afs_inode_init_from_status(struct afs_operation *op,
 		inode->i_mode	= S_IFREG | (status->mode & S_IALLUGO);
 		inode->i_op	= &afs_file_inode_operations;
 		inode->i_fop	= &afs_file_operations;
-		inode->i_mapping->a_ops	= &afs_fs_aops;
+		inode->i_mapping->a_ops	= &afs_file_aops;
 		break;
 	case AFS_FTYPE_DIR:
 		inode->i_mode	= S_IFDIR |  (status->mode & S_IALLUGO);
@@ -123,11 +123,11 @@ static int afs_inode_init_from_status(struct afs_operation *op,
 			inode->i_mode	= S_IFDIR | 0555;
 			inode->i_op	= &afs_mntpt_inode_operations;
 			inode->i_fop	= &afs_mntpt_file_operations;
-			inode->i_mapping->a_ops	= &afs_fs_aops;
+			inode->i_mapping->a_ops	= &afs_symlink_aops;
 		} else {
 			inode->i_mode	= S_IFLNK | status->mode;
 			inode->i_op	= &afs_symlink_inode_operations;
-			inode->i_mapping->a_ops	= &afs_fs_aops;
+			inode->i_mapping->a_ops	= &afs_symlink_aops;
 		}
 		inode_nohighmem(inode);
 		break;
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 5ed416f4ff33..beaef0387e85 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1044,7 +1044,8 @@ extern void afs_dynroot_depopulate(struct super_block *);
 /*
  * file.c
  */
-extern const struct address_space_operations afs_fs_aops;
+extern const struct address_space_operations afs_file_aops;
+extern const struct address_space_operations afs_symlink_aops;
 extern const struct inode_operations afs_file_inode_operations;
 extern const struct file_operations afs_file_operations;
 extern const struct netfs_read_request_ops afs_req_ops;


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

