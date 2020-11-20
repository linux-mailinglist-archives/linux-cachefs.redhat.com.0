Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 932442BB921
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 23:39:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605911978;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HDYqD7v4O4sySzUHb7j1wKHOM6zk+M5MaB99+/vT9rQ=;
	b=SuRoDOipU/YTwwQfvlF946x175rllrMSpxBoZJgKFC3Sukv7/bBaOFaRSqGRoR1yCAf+Sv
	bGYCAOjIxtTV3ULBTwc14OrYRHJxT6tWO7NrHTMAUd8AcJPFC+fk7yzx8fi5yaq9zdqYYJ
	u+2Qbx3F7Z0bR5BvALJdt8Aoa8C/Wig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-s9n0PvrUPJiIvISuAtBr3g-1; Fri, 20 Nov 2020 17:39:36 -0500
X-MC-Unique: s9n0PvrUPJiIvISuAtBr3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C99C425FA;
	Fri, 20 Nov 2020 22:39:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D9FA18996;
	Fri, 20 Nov 2020 22:39:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 668831809CA1;
	Fri, 20 Nov 2020 22:39:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKMdU1b019102 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 17:39:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 005DA2026D48; Fri, 20 Nov 2020 22:39:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF3982026D47
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 22:39:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBBC3858EEC
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 22:39:29 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-465-bCoL4SI4M2yqfqWFvSL7iw-1;
	Fri, 20 Nov 2020 17:39:25 -0500
X-MC-Unique: bCoL4SI4M2yqfqWFvSL7iw-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 542176E9E; Fri, 20 Nov 2020 17:39:22 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 542176E9E
From: "J. Bruce Fields" <bfields@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Date: Fri, 20 Nov 2020 17:39:18 -0500
Message-Id: <1605911960-12516-6-git-send-email-bfields@redhat.com>
In-Reply-To: <1605911960-12516-1-git-send-email-bfields@redhat.com>
References: <20201120223831.GB7705@fieldses.org>
	<1605911960-12516-1-git-send-email-bfields@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	"J. Bruce Fields" <bfields@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: [Linux-cachefs] [PATCH 6/8] nfsd: move change attribute generation
	to filesystem
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
MIME-Version: 1.0
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "J. Bruce Fields" <bfields@redhat.com>

After this, only filesystems lacking change attribute support will leave
the fetch_iversion export op NULL.

This seems cleaner to me, and will allow some minor optimizations in the
nfsd code.

Signed-off-by: J. Bruce Fields <bfields@redhat.com>
---
 fs/btrfs/export.c        |  2 ++
 fs/ext4/super.c          |  9 +++++++++
 fs/nfsd/nfs4xdr.c        |  2 +-
 fs/nfsd/nfsfh.h          | 25 +++----------------------
 fs/nfsd/xdr4.h           |  4 +++-
 fs/xfs/xfs_export.c      |  2 ++
 include/linux/iversion.h | 26 ++++++++++++++++++++++++++
 7 files changed, 46 insertions(+), 24 deletions(-)

diff --git a/fs/btrfs/export.c b/fs/btrfs/export.c
index 1a8d419d9e1f..ece32440999a 100644
--- a/fs/btrfs/export.c
+++ b/fs/btrfs/export.c
@@ -7,6 +7,7 @@
 #include "btrfs_inode.h"
 #include "print-tree.h"
 #include "export.h"
+#include <linux/iversion.h>
 
 #define BTRFS_FID_SIZE_NON_CONNECTABLE (offsetof(struct btrfs_fid, \
 						 parent_objectid) / 4)
@@ -279,4 +280,5 @@ const struct export_operations btrfs_export_ops = {
 	.fh_to_parent	= btrfs_fh_to_parent,
 	.get_parent	= btrfs_get_parent,
 	.get_name	= btrfs_get_name,
+	.fetch_iversion	= generic_fetch_iversion,
 };
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index ef4734b40e2a..a4f48273d435 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1685,11 +1685,20 @@ static const struct super_operations ext4_sops = {
 	.bdev_try_to_free_page = bdev_try_to_free_page,
 };
 
+static u64 ext4_fetch_iversion(struct inode *inode)
+{
+	if (IS_I_VERSION(inode))
+		return generic_fetch_iversion(inode);
+	else
+		return time_to_chattr(&inode->i_ctime);
+}
+
 static const struct export_operations ext4_export_ops = {
 	.fh_to_dentry = ext4_fh_to_dentry,
 	.fh_to_parent = ext4_fh_to_parent,
 	.get_parent = ext4_get_parent,
 	.commit_metadata = ext4_nfs_commit_metadata,
+	.fetch_iversion = ext4_fetch_iversion,
 };
 
 enum {
diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index 18c912930947..182190684792 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -3187,7 +3187,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 		p = xdr_reserve_space(xdr, 4);
 		if (!p)
 			goto out_resource;
-		if (IS_I_VERSION(d_inode(dentry)))
+		if (IS_I_VERSION(d_inode(dentry))
 			*p++ = cpu_to_be32(NFS4_CHANGE_TYPE_IS_MONOTONIC_INCR);
 		else
 			*p++ = cpu_to_be32(NFS4_CHANGE_TYPE_IS_TIME_METADATA);
diff --git a/fs/nfsd/nfsfh.h b/fs/nfsd/nfsfh.h
index 2656a3464c6c..ac3e309d7339 100644
--- a/fs/nfsd/nfsfh.h
+++ b/fs/nfsd/nfsfh.h
@@ -46,8 +46,8 @@ typedef struct svc_fh {
 	struct timespec64	fh_pre_mtime;	/* mtime before oper */
 	struct timespec64	fh_pre_ctime;	/* ctime before oper */
 	/*
-	 * pre-op nfsv4 change attr: note must check IS_I_VERSION(inode)
-	 *  to find out if it is valid.
+	 * pre-op nfsv4 change attr: note must check for fetch_iversion
+	 * op to find out if it is valid.
 	 */
 	u64			fh_pre_change;
 
@@ -246,31 +246,12 @@ fh_clear_wcc(struct svc_fh *fhp)
 	fhp->fh_pre_saved = false;
 }
 
-/*
- * We could use i_version alone as the change attribute.  However,
- * i_version can go backwards after a reboot.  On its own that doesn't
- * necessarily cause a problem, but if i_version goes backwards and then
- * is incremented again it could reuse a value that was previously used
- * before boot, and a client who queried the two values might
- * incorrectly assume nothing changed.
- *
- * By using both ctime and the i_version counter we guarantee that as
- * long as time doesn't go backwards we never reuse an old value.
- */
 static inline u64 nfsd4_change_attribute(struct kstat *stat,
 					 struct inode *inode)
 {
 	if (inode->i_sb->s_export_op->fetch_iversion)
 		return inode->i_sb->s_export_op->fetch_iversion(inode);
-	else if (IS_I_VERSION(inode)) {
-		u64 chattr;
-
-		chattr =  stat->ctime.tv_sec;
-		chattr <<= 30;
-		chattr += stat->ctime.tv_nsec;
-		chattr += inode_query_iversion(inode);
-		return chattr;
-	} else
+	else
 		return time_to_chattr(&stat->ctime);
 }
 
diff --git a/fs/nfsd/xdr4.h b/fs/nfsd/xdr4.h
index 9c2d942d055d..f0c8fbe704a2 100644
--- a/fs/nfsd/xdr4.h
+++ b/fs/nfsd/xdr4.h
@@ -761,10 +761,12 @@ void warn_on_nonidempotent_op(struct nfsd4_op *op);
 static inline void
 set_change_info(struct nfsd4_change_info *cinfo, struct svc_fh *fhp)
 {
+	struct inode *inode = d_inode(fhp->fh_dentry);
+
 	BUG_ON(!fhp->fh_pre_saved);
 	cinfo->atomic = (u32)fhp->fh_post_saved;
 
-	if (IS_I_VERSION(d_inode(fhp->fh_dentry))) {
+	if (inode->i_sb->s_export_op->fetch_iversion) {
 		cinfo->before_change = fhp->fh_pre_change;
 		cinfo->after_change = fhp->fh_post_change;
 	} else {
diff --git a/fs/xfs/xfs_export.c b/fs/xfs/xfs_export.c
index 465fd9e048d4..b950fac3d7df 100644
--- a/fs/xfs/xfs_export.c
+++ b/fs/xfs/xfs_export.c
@@ -16,6 +16,7 @@
 #include "xfs_inode_item.h"
 #include "xfs_icache.h"
 #include "xfs_pnfs.h"
+#include <linux/iversion.h>
 
 /*
  * Note that we only accept fileids which are long enough rather than allow
@@ -234,4 +235,5 @@ const struct export_operations xfs_export_operations = {
 	.map_blocks		= xfs_fs_map_blocks,
 	.commit_blocks		= xfs_fs_commit_blocks,
 #endif
+	.fetch_iversion		= generic_fetch_iversion,
 };
diff --git a/include/linux/iversion.h b/include/linux/iversion.h
index 3bfebde5a1a6..ded74523c8a6 100644
--- a/include/linux/iversion.h
+++ b/include/linux/iversion.h
@@ -328,6 +328,32 @@ inode_query_iversion(struct inode *inode)
 	return cur >> I_VERSION_QUERIED_SHIFT;
 }
 
+/*
+ * We could use i_version alone as the NFSv4 change attribute.  However,
+ * i_version can go backwards after a reboot.  On its own that doesn't
+ * necessarily cause a problem, but if i_version goes backwards and then
+ * is incremented again it could reuse a value that was previously used
+ * before boot, and a client who queried the two values might
+ * incorrectly assume nothing changed.
+ *
+ * By using both ctime and the i_version counter we guarantee that as
+ * long as time doesn't go backwards we never reuse an old value.
+ *
+ * A filesystem that has an on-disk boot counter or similar might prefer
+ * to use that to avoid the risk of the change attribute going backwards
+ * if system time is set backwards.
+ */
+static inline u64 generic_fetch_iversion(struct inode *inode)
+{
+	u64 chattr;
+
+	chattr =  inode->i_ctime.tv_sec;
+	chattr <<= 30;
+	chattr += inode->i_ctime.tv_nsec;
+	chattr += inode_query_iversion(inode);
+	return chattr;
+}
+
 /*
  * For filesystems without any sort of change attribute, the best we can
  * do is fake one up from the ctime:
-- 
2.28.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

