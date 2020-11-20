Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDD82BAD16
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 16:09:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605884963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6t3tL1GPZ1Ts053kyJ8qbhKIx6FL40qLEZFThr0SYbo=;
	b=e8qBFtoRRPmmn1q1z+1p9VM6sQWdmjUnWZqfSZDLXJd5swjyL24/Vqje/vk2Hs27xa5A8I
	6MHbxOMUoJmwS8oWvtzx0Vt9y5ZFpLok2vBnVtUMwpg12b+VFvqHpIaq8nRp1H+zYDJhF9
	27aUyBN550MbqGEef3Nd66J2pQfhzS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-rHKOnbAEMaC6pwkROzqFJQ-1; Fri, 20 Nov 2020 10:09:21 -0500
X-MC-Unique: rHKOnbAEMaC6pwkROzqFJQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C79918B9F03;
	Fri, 20 Nov 2020 15:09:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C8CF1349A;
	Fri, 20 Nov 2020 15:09:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 39C4E180954D;
	Fri, 20 Nov 2020 15:09:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKF9HYF013981 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 10:09:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 970F260BD8; Fri, 20 Nov 2020 15:09:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-246.rdu2.redhat.com
	[10.10.112.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8BC566064B;
	Fri, 20 Nov 2020 15:09:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Fri, 20 Nov 2020 15:09:10 +0000
Message-ID: <160588495077.3465195.15576038355511521763.stgit@warthog.procyon.org.uk>
In-Reply-To: <160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk>
References: <160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [RFC PATCH 31/76] fscache: Allow ->put_super() to
 be used to wait for cache operations
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
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

Provide a helper to allow ->put_super() to be used to wait for outstanding
cache operations that are pinning inodes.  The helper has a loop that waits
for the first inode that has a non-zero usage and a cookie.  It then calls
evict_inodes() to reduce the list and loops round again until it finds no
more candidate inodes.

Without this, evict_inodes() won't get rid of such operations, and the
"VFS: Busy inodes ..." message will be displayed and the inode abandoned.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/fscache/io.c         |   50 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fscache.h |    2 ++
 2 files changed, 52 insertions(+)

diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index 87ffe84c9f27..de9ffc16eb4f 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -180,3 +180,53 @@ int fscache_set_page_dirty(struct page *page, struct fscache_cookie *cookie)
 	return 1;
 }
 EXPORT_SYMBOL(fscache_set_page_dirty);
+
+/**
+ * fscache_put_super - Wait for outstanding ops to complete
+ * @sb: The superblock to wait on
+ * @get_cookie: Function to get the cookie on an inode
+ *
+ * Wait for outstanding cache operations on the inodes of a superblock to
+ * complete as they might be pinning an inode.  This is designed to be called
+ * from ->put_super(), right before the "VFS: Busy inodes" check.
+ */
+void fscache_put_super(struct super_block *sb,
+		       struct fscache_cookie *(*get_cookie)(struct inode *inode))
+{
+	struct fscache_cookie *cookie;
+	struct inode *inode, *p;
+
+	while (!list_empty(&sb->s_inodes)) {
+		/* Find the first inode that we need to wait on */
+		inode = NULL;
+		cookie = NULL;
+		spin_lock(&sb->s_inode_list_lock);
+		list_for_each_entry(p, &sb->s_inodes, i_sb_list) {
+			if (atomic_inc_not_zero(&p->i_count)) {
+				inode = p;
+				cookie = get_cookie(inode);
+				if (!cookie) {
+					iput(inode);
+					inode = NULL;
+					cookie = NULL;
+					continue;
+				}
+				break;
+			}
+		}
+		spin_unlock(&sb->s_inode_list_lock);
+
+		if (inode) {
+			/* n_ops is kept artificially raised to stop wakeups */
+			atomic_dec(&cookie->n_ops);
+			wait_var_event(&cookie->n_ops, atomic_read(&cookie->n_ops) == 0);
+			atomic_inc(&cookie->n_ops);
+			iput(inode);
+		}
+
+		evict_inodes(sb);
+		if (!inode)
+			break;
+	}
+}
+EXPORT_SYMBOL(fscache_put_super);
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index d2fc98a5755a..38a252b06b54 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -204,6 +204,8 @@ extern int __fscache_begin_operation(struct fscache_cookie *, struct fscache_op_
 extern void __fscache_relinquish_cookie(struct fscache_cookie *, bool);
 extern void __fscache_update_cookie(struct fscache_cookie *, const void *, const loff_t *);
 extern void __fscache_invalidate(struct fscache_cookie *, loff_t);
+extern void fscache_put_super(struct super_block *,
+			      struct fscache_cookie *(*get_cookie)(struct inode *));
 
 /**
  * fscache_register_netfs - Register a filesystem as desiring caching services


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

