Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3360B47DAD1
	for <lists+linux-cachefs@lfdr.de>; Thu, 23 Dec 2021 00:25:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640215551;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iQQyJL69ZClTpuRKp9BbZWpKKOGkaR4jM6aR3pkO4hs=;
	b=WPVplekHQ2/QZ34L+N1pwvViMoOXtismpbgL8YLCa9837cgZxVEYZgzCWgSXCb42u2P1ud
	CgVZt2CnqiHgg5tF4a6TDtGXW6BO6cscHnJlbDmHjDFR6mmbg1A3/FabADwSp+U2T7nyTO
	DjpXjldMN2H1qHALih8CbmWQGq5PkhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-JHz8ZgRyMqG2eOrudkWVFg-1; Wed, 22 Dec 2021 18:25:50 -0500
X-MC-Unique: JHz8ZgRyMqG2eOrudkWVFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B31EA1006AA4;
	Wed, 22 Dec 2021 23:25:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4BBA2B5AC;
	Wed, 22 Dec 2021 23:25:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 649DB1806D1C;
	Wed, 22 Dec 2021 23:25:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BMNPjUi001334 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 22 Dec 2021 18:25:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 235C07EFC3; Wed, 22 Dec 2021 23:25:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7D787EFF9;
	Wed, 22 Dec 2021 23:25:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 22 Dec 2021 23:25:23 +0000
Message-ID: <164021552299.640689.10578652796777392062.stgit@warthog.procyon.org.uk>
In-Reply-To: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Subject: [Linux-cachefs] [PATCH v4 46/68] cachefiles: Mark a backing file in
 use with an inode flag
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use an inode flag, S_KERNEL_FILE, to mark that a backing file is in use by
the kernel to prevent cachefiles or other kernel services from interfering
with that file.

Using S_SWAPFILE instead isn't really viable as that has other effects in
the I/O paths.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819642273.215744.6414248677118690672.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/163906943215.143852.16972351425323967014.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/163967154118.1823006.13227551961786743991.stgit@warthog.procyon.org.uk/ # v3
---

 fs/cachefiles/internal.h |    2 ++
 fs/cachefiles/namei.c    |   35 +++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 01071e7a7c02..7c67a70a3dff 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -187,6 +187,8 @@ extern struct kmem_cache *cachefiles_object_jar;
 /*
  * namei.c
  */
+extern void cachefiles_unmark_inode_in_use(struct cachefiles_object *object,
+					   struct file *file);
 extern struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 					       struct dentry *dir,
 					       const char *name,
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index 11a33209ab5f..db60a671c3fc 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -31,6 +31,18 @@ static bool __cachefiles_mark_inode_in_use(struct cachefiles_object *object,
 	return can_use;
 }
 
+static bool cachefiles_mark_inode_in_use(struct cachefiles_object *object,
+					 struct dentry *dentry)
+{
+	struct inode *inode = d_backing_inode(dentry);
+	bool can_use;
+
+	inode_lock(inode);
+	can_use = __cachefiles_mark_inode_in_use(object, dentry);
+	inode_unlock(inode);
+	return can_use;
+}
+
 /*
  * Unmark a backing inode.  The caller must hold the inode lock.
  */
@@ -43,6 +55,29 @@ static void __cachefiles_unmark_inode_in_use(struct cachefiles_object *object,
 	trace_cachefiles_mark_inactive(object, inode);
 }
 
+/*
+ * Unmark a backing inode and tell cachefilesd that there's something that can
+ * be culled.
+ */
+void cachefiles_unmark_inode_in_use(struct cachefiles_object *object,
+				    struct file *file)
+{
+	struct cachefiles_cache *cache = object->volume->cache;
+	struct inode *inode = file_inode(file);
+
+	if (inode) {
+		inode_lock(inode);
+		__cachefiles_unmark_inode_in_use(object, file->f_path.dentry);
+		inode_unlock(inode);
+
+		if (!test_bit(CACHEFILES_OBJECT_USING_TMPFILE, &object->flags)) {
+			atomic_long_add(inode->i_blocks, &cache->b_released);
+			if (atomic_inc_return(&cache->f_released))
+				cachefiles_state_changed(cache);
+		}
+	}
+}
+
 /*
  * get a subdirectory
  */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

