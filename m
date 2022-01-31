Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8074B4A49F9
	for <lists+linux-cachefs@lfdr.de>; Mon, 31 Jan 2022 16:14:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643642049;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XBtCQpb4nqb79faEccklsomQwvKMfFxCG/8HUur5jpI=;
	b=K/e1qlwlpNpLA5CtHzO6lm2anbHFrAu+ON53kwQjeFgGCn0GgPYdx4za2pOegWn5sBWxdS
	hoj6Q36EUKK2+pjLRgfDiPySCvRMfXxLn41yNgVvE3XquHm7ytRSOI6xXcssVXVzmI+fk5
	EM69c9NQYcabxIGXLwdFeZZSupo2Fvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-wyMEtMxoOJW_jMxqdO3v9g-1; Mon, 31 Jan 2022 10:14:06 -0500
X-MC-Unique: wyMEtMxoOJW_jMxqdO3v9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E56818C89CF;
	Mon, 31 Jan 2022 15:14:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B5CD72417;
	Mon, 31 Jan 2022 15:14:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE80318095C9;
	Mon, 31 Jan 2022 15:14:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VFE3gj007274 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 10:14:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5787070F60; Mon, 31 Jan 2022 15:14:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39D117243D;
	Mon, 31 Jan 2022 15:14:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 31 Jan 2022 15:14:00 +0000
Message-ID: <164364204024.1476539.3811417846576668364.stgit@warthog.procyon.org.uk>
In-Reply-To: <164364196407.1476539.8450117784231043601.stgit@warthog.procyon.org.uk>
References: <164364196407.1476539.8450117784231043601.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, Miklos Szeredi <miklos@szeredi.hu>,
	Jeff Layton <jlayton@kernel.org>, linux-unionfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org
Subject: [Linux-cachefs] [PATCH 4/5] cachefiles: Use I_EXCL_INUSE instead of
	S_KERNEL_FILE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Get rid of S_KERNEL_FILE and use I_EXCL_INUSE instead, thereby sharing that
flag with overlayfs.  This is used by cachefiles for two purposes: firstly,
to prevent simultaneous access to a backing file, which could cause data
corruption, and secondly, to allow cachefilesd to find out if it's allowed
to cull a backing file without having to have duplicate lookup
infrastructure (the VFS already has all the infrastructure that is
necessary to do the lookup; cachefiles just needs a single bit flag).

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Amir Goldstein <amir73il@gmail.com>
cc: Miklos Szeredi <miklos@szeredi.hu>
cc: linux-cachefs@redhat.com
cc: linux-unionfs@vger.kernel.org
Link: https://lore.kernel.org/r/CAOQ4uxhRS3MGEnCUDcsB1RL0d1Oy0g0Rzm75hVFAJw2dJ7uKSA@mail.gmail.com/ [1]
---

 fs/cachefiles/namei.c |   46 ++++++++++++++++++++--------------------------
 include/linux/fs.h    |    2 +-
 2 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index 8930c767d93a..0c88c82c188f 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -18,22 +18,19 @@ static bool __cachefiles_mark_inode_in_use(struct cachefiles_object *object,
 					   struct dentry *dentry)
 {
 	struct inode *inode = d_backing_inode(dentry);
-	bool can_use = false;
+	bool locked;
 
-	spin_lock(&inode->i_lock);
-	if (!(inode->i_flags & S_KERNEL_FILE)) {
-		inode->i_flags |= S_KERNEL_FILE;
+	locked = inode_excl_inuse_trylock(dentry, object ? object->debug_id : 0,
+					  inode_excl_inuse_by_cachefiles);
+	if (locked) {
+		spin_lock(&inode->i_lock);
 		inode->i_state |= I_NO_REMOVE;
-		trace_cachefiles_mark_active(object, inode);
-		can_use = true;
+		spin_unlock(&inode->i_lock);
 	} else {
-		trace_cachefiles_mark_failed(object, inode);
 		pr_notice("cachefiles: Inode already in use: %pd (B=%lx)\n",
 			  dentry, inode->i_ino);
 	}
-	spin_unlock(&inode->i_lock);
-
-	return can_use;
+	return locked;
 }
 
 static bool cachefiles_mark_inode_in_use(struct cachefiles_object *object,
@@ -57,10 +54,9 @@ static void __cachefiles_unmark_inode_in_use(struct cachefiles_object *object,
 	struct inode *inode = d_backing_inode(dentry);
 
 	spin_lock(&inode->i_lock);
-	inode->i_flags &= ~S_KERNEL_FILE;
-	inode->i_state &= ~I_NO_REMOVE;
+	inode->i_state |= I_NO_REMOVE;
 	spin_unlock(&inode->i_lock);
-	trace_cachefiles_mark_inactive(object, inode);
+	inode_excl_inuse_unlock(dentry, object ? object->debug_id : 0);
 }
 
 /*
@@ -754,7 +750,7 @@ static struct dentry *cachefiles_lookup_for_cull(struct cachefiles_cache *cache,
 		goto lookup_error;
 	if (d_is_negative(victim))
 		goto lookup_put;
-	if (d_inode(victim)->i_flags & S_KERNEL_FILE)
+	if (inode_is_excl_inuse(victim))
 		goto lookup_busy;
 	return victim;
 
@@ -790,6 +786,7 @@ int cachefiles_cull(struct cachefiles_cache *cache, struct dentry *dir,
 {
 	struct dentry *victim;
 	struct inode *inode;
+	bool locked;
 	int ret;
 
 	_enter(",%pd/,%s", dir, filename);
@@ -798,19 +795,16 @@ int cachefiles_cull(struct cachefiles_cache *cache, struct dentry *dir,
 	if (IS_ERR(victim))
 		return PTR_ERR(victim);
 
-	/* check to see if someone is using this object */
+	/* Check to see if someone is using this object and, if not, stop the
+	 * cache from picking it back up.
+	 */
 	inode = d_inode(victim);
 	inode_lock(inode);
-	if (inode->i_flags & S_KERNEL_FILE) {
-		ret = -EBUSY;
-	} else {
-		/* Stop the cache from picking it back up */
-		inode->i_flags |= S_KERNEL_FILE;
-		ret = 0;
-	}
+	locked = inode_excl_inuse_trylock(victim, 0,
+					  inode_excl_inuse_by_cachefiles);
 	inode_unlock(inode);
-	if (ret < 0)
-		goto error_unlock;
+	if (!locked)
+		goto busy;
 
 	ret = cachefiles_bury_object(cache, NULL, dir, victim,
 				     FSCACHE_OBJECT_WAS_CULLED);
@@ -822,8 +816,8 @@ int cachefiles_cull(struct cachefiles_cache *cache, struct dentry *dir,
 	_leave(" = 0");
 	return 0;
 
-error_unlock:
-	inode_unlock(d_inode(dir));
+busy:
+	ret = -EBUSY;
 error:
 	dput(victim);
 	if (ret == -ENOENT)
diff --git a/include/linux/fs.h b/include/linux/fs.h
index a273d5cde731..009ca9f783bd 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2161,7 +2161,6 @@ struct super_operations {
 #define S_ENCRYPTED	(1 << 14) /* Encrypted file (using fs/crypto/) */
 #define S_CASEFOLD	(1 << 15) /* Casefolded file */
 #define S_VERITY	(1 << 16) /* Verity file (using fs/verity/) */
-#define S_KERNEL_FILE	(1 << 17) /* File is in use by the kernel (eg. fs/cachefiles) */
 
 /*
  * Note that nosuid etc flags are inode-specific: setting some file-system
@@ -2394,6 +2393,7 @@ static inline bool inode_is_dirtytime_only(struct inode *inode)
 }
 
 enum inode_excl_inuse_by {
+	inode_excl_inuse_by_cachefiles,
 	inode_excl_inuse_by_overlayfs,
 };
 


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

