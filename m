Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 043AA2BB91F
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 23:39:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605911977;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Uk4m/IO7Dv4nBpJ983wMV5QT+1z070tX4JA7V11lDRs=;
	b=bJin88d8137dpHSgcUshvXv9Bvg9llnhqA2kQI6xds/vCihROzNSmFsCZeqnvYX3Jf/fSH
	OY23Hzl7+i32Zo9qHVcbIfobcG91gxSLbE4wkPBwGseOTDN1ZeWN9+sW3Xl+2tUi0Vtn8t
	ejblw+TQlUXJEFhHFU5lD4ACsqb47Ko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-c-G874SCO_CwyhFIN9ep8Q-1; Fri, 20 Nov 2020 17:39:34 -0500
X-MC-Unique: c-G874SCO_CwyhFIN9ep8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59FB4879511;
	Fri, 20 Nov 2020 22:39:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48DD010021B3;
	Fri, 20 Nov 2020 22:39:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C5384A7C6;
	Fri, 20 Nov 2020 22:39:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKMdUg5019110 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 17:39:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 52390101F0C5; Fri, 20 Nov 2020 22:39:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E46C1000DBD
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 22:39:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34D13186E122
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 22:39:28 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-300-jrQgltrgNha_KDtSlsHkoA-1;
	Fri, 20 Nov 2020 17:39:23 -0500
X-MC-Unique: jrQgltrgNha_KDtSlsHkoA-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 3CAF76E9D; Fri, 20 Nov 2020 17:39:22 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 3CAF76E9D
From: "J. Bruce Fields" <bfields@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Date: Fri, 20 Nov 2020 17:39:17 -0500
Message-Id: <1605911960-12516-5-git-send-email-bfields@redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	"J. Bruce Fields" <bfields@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: [Linux-cachefs] [PATCH 5/8] nfs: use change attribute for NFS
	re-exports
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "J. Bruce Fields" <bfields@redhat.com>

When exporting NFS, we may as well use the real change attribute
returned by the original server instead of faking up a change attribute
from the ctime.

Note we can't do that by setting I_VERSION--that would also turn on the
logic in iversion.h which treats the lower bit specially, and that
doesn't make sense for NFS.

So instead we define a new export operation for filesystems like NFS
that want to manage the change attribute themselves.

Signed-off-by: J. Bruce Fields <bfields@redhat.com>
---
 fs/nfs/export.c          | 18 ++++++++++++++++++
 fs/nfsd/nfsfh.h          |  5 ++++-
 include/linux/exportfs.h |  1 +
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/export.c b/fs/nfs/export.c
index 3430d6891e89..0b10c5946060 100644
--- a/fs/nfs/export.c
+++ b/fs/nfs/export.c
@@ -167,8 +167,26 @@ nfs_get_parent(struct dentry *dentry)
 	return parent;
 }
 
+static u64 nfs_fetch_iversion(struct inode *inode)
+{
+	struct nfs_server *server = NFS_SERVER(inode);
+
+	/* Is this the right call?: */
+	nfs_revalidate_inode(server, inode);
+	/*
+	 * Also, note we're ignoring any returned error.  That seems to be
+	 * the practice for cache consistency information elsewhere in
+	 * the server, but I'm not sure why.
+	 */
+	if (server->nfs_client->rpc_ops->version >= 4)
+		return inode_peek_iversion_raw(inode);
+	else
+		return time_to_chattr(&inode->i_ctime);
+}
+
 const struct export_operations nfs_export_ops = {
 	.encode_fh = nfs_encode_fh,
 	.fh_to_dentry = nfs_fh_to_dentry,
 	.get_parent = nfs_get_parent,
+	.fetch_iversion = nfs_fetch_iversion,
 };
diff --git a/fs/nfsd/nfsfh.h b/fs/nfsd/nfsfh.h
index 45bd776290d5..2656a3464c6c 100644
--- a/fs/nfsd/nfsfh.h
+++ b/fs/nfsd/nfsfh.h
@@ -12,6 +12,7 @@
 #include <linux/sunrpc/svc.h>
 #include <uapi/linux/nfsd/nfsfh.h>
 #include <linux/iversion.h>
+#include <linux/exportfs.h>
 
 static inline __u32 ino_t_to_u32(ino_t ino)
 {
@@ -259,7 +260,9 @@ fh_clear_wcc(struct svc_fh *fhp)
 static inline u64 nfsd4_change_attribute(struct kstat *stat,
 					 struct inode *inode)
 {
-	if (IS_I_VERSION(inode)) {
+	if (inode->i_sb->s_export_op->fetch_iversion)
+		return inode->i_sb->s_export_op->fetch_iversion(inode);
+	else if (IS_I_VERSION(inode)) {
 		u64 chattr;
 
 		chattr =  stat->ctime.tv_sec;
diff --git a/include/linux/exportfs.h b/include/linux/exportfs.h
index 3ceb72b67a7a..da6f0a905b94 100644
--- a/include/linux/exportfs.h
+++ b/include/linux/exportfs.h
@@ -213,6 +213,7 @@ struct export_operations {
 			  bool write, u32 *device_generation);
 	int (*commit_blocks)(struct inode *inode, struct iomap *iomaps,
 			     int nr_iomaps, struct iattr *iattr);
+	u64 (*fetch_iversion)(struct inode *);
 };
 
 extern int exportfs_encode_inode_fh(struct inode *inode, struct fid *fid,
-- 
2.28.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

