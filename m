Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F21814927A8
	for <lists+linux-cachefs@lfdr.de>; Tue, 18 Jan 2022 14:55:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642514108;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M1+sgL/kCWrv/rub4zRuJEtNREihC46sl1HuMLhfguU=;
	b=HU2e+Wj+rD0W8wwowZRHrWV6B9CGyoErplrFcuE9jP2bSpQnDFua/NSvhSbpdM9Kx4hWrp
	XcMV/o4pNYwUp/FnMRs8HaNkEM8h8ysoT46P8JTsums6C7xsqKV515OGxaewqrpTPcZyml
	pbZ8vbq3agGsgY9T7hbKuUaFfoSemPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-e0E2s5WHOzeG_kNFkx3bFA-1; Tue, 18 Jan 2022 08:55:04 -0500
X-MC-Unique: e0E2s5WHOzeG_kNFkx3bFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2625344E8;
	Tue, 18 Jan 2022 13:55:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61E812B6E9;
	Tue, 18 Jan 2022 13:55:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F76D1806D03;
	Tue, 18 Jan 2022 13:55:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IDswGn014178 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 08:54:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9D2B32B6FE; Tue, 18 Jan 2022 13:54:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 578142B6E9;
	Tue, 18 Jan 2022 13:54:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Tue, 18 Jan 2022 13:54:54 +0000
Message-ID: <164251409447.3435901.10092442643336534999.stgit@warthog.procyon.org.uk>
In-Reply-To: <164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
References: <164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <smfrench@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	v9fs-developer@lists.sourceforge.net
Subject: [Linux-cachefs] [PATCH 09/11] vfs,
 fscache: Add an IS_KERNEL_FILE() macro for the S_KERNEL_FILE flag
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

Add an IS_KERNEL_FILE() macro to test the S_KERNEL_FILE inode flag as is
common practice for the other inode flags[1].

Suggested-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/88d7f8970dcc0fd0ead891b1f42f160b8d17d60e.camel@kernel.org/ [1]
---

 fs/cachefiles/namei.c |    6 +++---
 fs/namei.c            |    2 +-
 include/linux/fs.h    |    1 +
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index f256c8aff7bb..04563f759e99 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -20,7 +20,7 @@ static bool __cachefiles_mark_inode_in_use(struct cachefiles_object *object,
 	struct inode *inode = d_backing_inode(dentry);
 	bool can_use = false;
 
-	if (!(inode->i_flags & S_KERNEL_FILE)) {
+	if (!IS_KERNEL_FILE(inode)) {
 		inode->i_flags |= S_KERNEL_FILE;
 		trace_cachefiles_mark_active(object, inode);
 		can_use = true;
@@ -746,7 +746,7 @@ static struct dentry *cachefiles_lookup_for_cull(struct cachefiles_cache *cache,
 		goto lookup_error;
 	if (d_is_negative(victim))
 		goto lookup_put;
-	if (d_inode(victim)->i_flags & S_KERNEL_FILE)
+	if (IS_KERNEL_FILE(d_inode(victim)))
 		goto lookup_busy;
 	return victim;
 
@@ -793,7 +793,7 @@ int cachefiles_cull(struct cachefiles_cache *cache, struct dentry *dir,
 	/* check to see if someone is using this object */
 	inode = d_inode(victim);
 	inode_lock(inode);
-	if (inode->i_flags & S_KERNEL_FILE) {
+	if (IS_KERNEL_FILE(inode)) {
 		ret = -EBUSY;
 	} else {
 		/* Stop the cache from picking it back up */
diff --git a/fs/namei.c b/fs/namei.c
index d81f04f8d818..c2175ab3849d 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3959,7 +3959,7 @@ int vfs_rmdir(struct user_namespace *mnt_userns, struct inode *dir,
 
 	error = -EBUSY;
 	if (is_local_mountpoint(dentry) ||
-	    (dentry->d_inode->i_flags & S_KERNEL_FILE))
+	    IS_KERNEL_FILE(dentry->d_inode))
 		goto out;
 
 	error = security_inode_rmdir(dir, dentry);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index f5d3bf5b69a6..227497793282 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2216,6 +2216,7 @@ static inline bool sb_rdonly(const struct super_block *sb) { return sb->s_flags
 #define IS_ENCRYPTED(inode)	((inode)->i_flags & S_ENCRYPTED)
 #define IS_CASEFOLDED(inode)	((inode)->i_flags & S_CASEFOLD)
 #define IS_VERITY(inode)	((inode)->i_flags & S_VERITY)
+#define IS_KERNEL_FILE(inode)	((inode)->i_flags & S_KERNEL_FILE)
 
 #define IS_WHITEOUT(inode)	(S_ISCHR(inode->i_mode) && \
 				 (inode)->i_rdev == WHITEOUT_DEV)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

