Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B578487E92
	for <lists+linux-cachefs@lfdr.de>; Fri,  7 Jan 2022 22:53:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641592387;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DG9JIdr5RNvBznt2kPH/u+9Zi3wggFQo0tjwgtsc1TY=;
	b=ixLb7uIkdGSJLrlvjhWfYbcQjjFuoZaPcVrgV8z2IMq18TV0RfKJX0kbQpw/tW3at9Fei4
	sxR6mXTuXzD0yL407M0LD670AxLJid/xsE34Gup6bsO5ackwrxECqgzORpB1ph2ss7Aw+6
	UP1CKkDwGee0AOWy8FQqtcpdz/nnMQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-3p71g0pRMcy973gnXpiprQ-1; Fri, 07 Jan 2022 16:53:03 -0500
X-MC-Unique: 3p71g0pRMcy973gnXpiprQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51846100C609;
	Fri,  7 Jan 2022 21:53:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08D6556F74;
	Fri,  7 Jan 2022 21:53:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31FE21809CB8;
	Fri,  7 Jan 2022 21:53:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 207Lqs3v030482 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 7 Jan 2022 16:52:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CFE355E26C; Fri,  7 Jan 2022 21:52:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD776519D5;
	Fri,  7 Jan 2022 21:52:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <164021579335.640689.2681324337038770579.stgit@warthog.procyon.org.uk>
References: <164021579335.640689.2681324337038770579.stgit@warthog.procyon.org.uk>
	<164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
To: linux-cachefs@redhat.com, Steve French <sfrench@samba.org>
MIME-Version: 1.0
Date: Fri, 07 Jan 2022 21:52:42 +0000
Message-ID: <3419813.1641592362@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 207Lqs3v030482
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 63/68] cifs: Support fscache indexing
	rewrite (untested)
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
Content-ID: <3419812.1641592362.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch isn't quite right and needs a fix.  The attached patch fixes it.
I'll fold that in and post a v5 of this patch.

David
---
cifs: Fix the fscache cookie management

Fix the fscache cookie management in cifs in the following ways:

 (1) The cookie should be released in cifs_evict_inode() after it has been
     unused from being pinned by cifs_set_page_dirty().

 (2) The cookie shouldn't be released in cifsFileInfo_put_final().  That's
     dealing with closing a file, not getting rid of an inode.  The cookie
     needs to persist beyond the last file close because writepages may
     happen after closure.

 (3) The cookie needs to be used in cifs_atomic_open() to match
     cifs_open().  As yet unknown files being opened for writing seem to go
     by the former route rather than the latter.

This can be triggered by something like:

        # systemctl start cachefilesd
        # mount //carina/test /xfstest.test -o user=shares,pass=xxxx.fsc
        # bash 5</xfstest.test/bar
        # echo hello >/xfstest.test/bar

The key is to open the file R/O and then open it R/W and write to it whilst
it's still open for R/O.  A cookie isn't acquired if it's just opened R/W
as it goes through the atomic_open method rather than the open method.

Signed-off-by: David Howells <dhowells@redhat.com>
---
 fs/cifs/cifsfs.c |    8 ++++++++
 fs/cifs/dir.c    |    4 ++++
 fs/cifs/file.c   |    2 --
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
index d3f3acf340f1..26cf2193c9a2 100644
--- a/fs/cifs/cifsfs.c
+++ b/fs/cifs/cifsfs.c
@@ -398,6 +398,7 @@ cifs_evict_inode(struct inode *inode)
 	truncate_inode_pages_final(&inode->i_data);
 	if (inode->i_state & I_PINNING_FSCACHE_WB)
 		cifs_fscache_unuse_inode_cookie(inode, true);
+	cifs_fscache_release_inode_cookie(inode);
 	clear_inode(inode);
 }
 
@@ -722,6 +723,12 @@ static int cifs_show_stats(struct seq_file *s, struct dentry *root)
 }
 #endif
 
+static int cifs_write_inode(struct inode *inode, struct writeback_control *wbc)
+{
+	fscache_unpin_writeback(wbc, cifs_inode_cookie(inode));
+	return 0;
+}
+
 static int cifs_drop_inode(struct inode *inode)
 {
 	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
@@ -734,6 +741,7 @@ static int cifs_drop_inode(struct inode *inode)
 static const struct super_operations cifs_super_ops = {
 	.statfs = cifs_statfs,
 	.alloc_inode = cifs_alloc_inode,
+	.write_inode	= cifs_write_inode,
 	.free_inode = cifs_free_inode,
 	.drop_inode	= cifs_drop_inode,
 	.evict_inode	= cifs_evict_inode,
diff --git a/fs/cifs/dir.c b/fs/cifs/dir.c
index 6e8e7cc26ae2..6186824b366e 100644
--- a/fs/cifs/dir.c
+++ b/fs/cifs/dir.c
@@ -22,6 +22,7 @@
 #include "cifs_unicode.h"
 #include "fs_context.h"
 #include "cifs_ioctl.h"
+#include "fscache.h"
 
 static void
 renew_parental_timestamps(struct dentry *direntry)
@@ -509,6 +510,9 @@ cifs_atomic_open(struct inode *inode, struct dentry *direntry,
 		rc = -ENOMEM;
 	}
 
+	fscache_use_cookie(cifs_inode_cookie(file_inode(file)),
+			   file->f_mode & FMODE_WRITE);
+
 out:
 	cifs_put_tlink(tlink);
 out_free_xid:
diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index d872f6fe8e7d..44da7646f789 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -376,8 +376,6 @@ static void cifsFileInfo_put_final(struct cifsFileInfo *cifs_file)
 	struct cifsLockInfo *li, *tmp;
 	struct super_block *sb = inode->i_sb;
 
-	cifs_fscache_release_inode_cookie(inode);
-
 	/*
 	 * Delete any outstanding lock records. We'll lose them when the file
 	 * is closed anyway.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

