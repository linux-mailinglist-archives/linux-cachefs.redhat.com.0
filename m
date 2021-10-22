Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA30437E19
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:10:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634929821;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P6T9Po2zYqEYQ6D1+3RDil6x4yZbQYiYtvzJFlns9fQ=;
	b=GyKkChRf7P1/1G7+mvgpgpAvNHIV60IdN0dWoNXI2BmgmBShP2nMhGPtaGp6YS7XaOsmCl
	dEV/fb5XRtLUyY0orh9SMBb26akQIuOZkzhExPaSZR5xrLdL/DeYGkkXucbzPWGlul8mkb
	HyJ0GPq42G5t+5TBJqZo3cJ+dwAU/ZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-TdAix1YlP2WCuihsf9OTSQ-1; Fri, 22 Oct 2021 15:10:18 -0400
X-MC-Unique: TdAix1YlP2WCuihsf9OTSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8787618D6A25;
	Fri, 22 Oct 2021 19:10:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5202D13ABD;
	Fri, 22 Oct 2021 19:10:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0EC774E58F;
	Fri, 22 Oct 2021 19:10:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJ8RIT012910 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:08:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C632C19723; Fri, 22 Oct 2021 19:08:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C58119D9B;
	Fri, 22 Oct 2021 19:08:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Fri, 22 Oct 2021 20:08:21 +0100
Message-ID: <163492970118.1038219.11123464029809592583.stgit@warthog.procyon.org.uk>
In-Reply-To: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Jeff Layton <jlayton@kernel.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-afs@lists.infradead.org, v9fs-developer@lists.sourceforge.net
Subject: [Linux-cachefs] [PATCH v2 41/53] afs: Handle len being extending
 over page end in write_begin/write_end
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

With transparent huge pages, in the future, write_begin() and write_end()
may be passed a length parameter that, in combination with the offset into
the page, exceeds the length of that page.  This allows
grab_cache_page_write_begin() to better choose the size of THP to allocate.

Fix afs's functions to handle this by trimming the length as needed after
the page has been allocated.

[Removed the now-unnecessary index var; spotted by kernel test robot]

Fixes: e1b1240c1ff5 ("netfs: Add write_begin helper")
Reported-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Acked-by: Jeff Layton <jlayton@kernel.org>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: linux-afs@lists.infradead.org
Link: https://lore.kernel.org/r/162367681795.460125.11729955608839747375.stgit@warthog.procyon.org.uk/ # v1
---

 fs/afs/write.c |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index 8e9cb1fcb412..ced72c6b9a80 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -25,7 +25,8 @@ int afs_set_page_dirty(struct page *page)
 }
 
 /*
- * prepare to perform part of a write to a page
+ * Prepare to perform part of a write to a page.  Note that len may extend
+ * beyond the end of the page.
  */
 int afs_write_begin(struct file *file, struct address_space *mapping,
 		    loff_t pos, unsigned len, unsigned flags,
@@ -36,7 +37,6 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
 	unsigned long priv;
 	unsigned f, from;
 	unsigned t, to;
-	pgoff_t index;
 	int ret;
 
 	_enter("{%llx:%llu},%llx,%x",
@@ -51,8 +51,8 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
 	if (ret < 0)
 		return ret;
 
-	index = page->index;
-	from = pos - index * PAGE_SIZE;
+	from = offset_in_thp(page, pos);
+	len = min_t(size_t, len, thp_size(page) - from);
 	to = from + len;
 
 try_again:
@@ -103,7 +103,8 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
 }
 
 /*
- * finalise part of a write to a page
+ * Finalise part of a write to a page.  Note that len may extend beyond the end
+ * of the page.
  */
 int afs_write_end(struct file *file, struct address_space *mapping,
 		  loff_t pos, unsigned len, unsigned copied,
@@ -111,7 +112,7 @@ int afs_write_end(struct file *file, struct address_space *mapping,
 {
 	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
 	unsigned long priv;
-	unsigned int f, from = pos & (thp_size(page) - 1);
+	unsigned int f, from = offset_in_thp(page, pos);
 	unsigned int t, to = from + copied;
 	loff_t i_size, maybe_i_size;
 


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

