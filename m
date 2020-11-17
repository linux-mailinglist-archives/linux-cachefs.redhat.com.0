Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 250EF2BAF1D
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 16:39:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605886754;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8gCjW9AP0UumJuvFl7ettdAOE7In8TtQwFNJDyTj/RQ=;
	b=V0HtwcbJ/MtvjZ8TRl/TrdaXjqO0xUaoTJUXqn0OhcBUXHg6SjaWAaz0p7qU1Onv35jKmo
	NiqD5pBaFobCa40/QILEjvWsbPtW8hCb4Hmet6TPgLlyeUTETBppWvKOHQhUL3wwebxrkP
	euRjRHWJBCc4cZa+KQolhghWKwFUjQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-X8YKD8w_NUihWBrLGM6WSA-1; Fri, 20 Nov 2020 10:39:11 -0500
X-MC-Unique: X8YKD8w_NUihWBrLGM6WSA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 790D1106F6E9;
	Fri, 20 Nov 2020 15:39:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66366F6F5;
	Fri, 20 Nov 2020 15:39:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D40B11809CA3;
	Fri, 20 Nov 2020 15:39:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AH3IHvT002021 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 22:18:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 01EA92166BA3; Tue, 17 Nov 2020 03:18:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0E222166BA0
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 03:18:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D14B5811E97
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 03:18:14 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-415-9d6wcpYxPCGIVXOFkiKBXg-1;
	Mon, 16 Nov 2020 22:18:09 -0500
X-MC-Unique: 9d6wcpYxPCGIVXOFkiKBXg-1
Received: by fieldses.org (Postfix, from userid 2815)
	id CBBE61C29; Mon, 16 Nov 2020 22:18:08 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org CBBE61C29
From: "J. Bruce Fields" <bfields@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Date: Mon, 16 Nov 2020 22:18:05 -0500
Message-Id: <1605583086-19869-3-git-send-email-bfields@redhat.com>
In-Reply-To: <1605583086-19869-1-git-send-email-bfields@redhat.com>
References: <20201117031601.GB10526@fieldses.org>
	<1605583086-19869-1-git-send-email-bfields@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 20 Nov 2020 10:39:06 -0500
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	"J. Bruce Fields" <bfields@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: [Linux-cachefs] [PATCH 3/4] nfs: don't mangle i_version on NFS
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "J. Bruce Fields" <bfields@redhat.com>

The i_version on NFS has pretty much opaque to the client, so we don't
want to give the low bit any special interpretation.

Define a new FS_PRIVATE_I_VERSION flag for filesystems that manage the
i_version on their own.

Signed-off-by: J. Bruce Fields <bfields@redhat.com>
---
 fs/nfs/export.c          | 1 +
 include/linux/exportfs.h | 1 +
 include/linux/iversion.h | 4 ++++
 3 files changed, 6 insertions(+)

diff --git a/fs/nfs/export.c b/fs/nfs/export.c
index 3430d6891e89..c2eb915a54ca 100644
--- a/fs/nfs/export.c
+++ b/fs/nfs/export.c
@@ -171,4 +171,5 @@ const struct export_operations nfs_export_ops = {
 	.encode_fh = nfs_encode_fh,
 	.fh_to_dentry = nfs_fh_to_dentry,
 	.get_parent = nfs_get_parent,
+	.fetch_iversion = inode_peek_iversion_raw,
 };
diff --git a/include/linux/exportfs.h b/include/linux/exportfs.h
index 3ceb72b67a7a..6000121a201f 100644
--- a/include/linux/exportfs.h
+++ b/include/linux/exportfs.h
@@ -213,6 +213,7 @@ struct export_operations {
 			  bool write, u32 *device_generation);
 	int (*commit_blocks)(struct inode *inode, struct iomap *iomaps,
 			     int nr_iomaps, struct iattr *iattr);
+	u64 (*fetch_iversion)(const struct inode *);
 };
 
 extern int exportfs_encode_inode_fh(struct inode *inode, struct fid *fid,
diff --git a/include/linux/iversion.h b/include/linux/iversion.h
index 2917ef990d43..481b3debf6bb 100644
--- a/include/linux/iversion.h
+++ b/include/linux/iversion.h
@@ -3,6 +3,7 @@
 #define _LINUX_IVERSION_H
 
 #include <linux/fs.h>
+#include <linux/exportfs.h>
 
 /*
  * The inode->i_version field:
@@ -306,6 +307,9 @@ inode_query_iversion(struct inode *inode)
 {
 	u64 cur, old, new;
 
+	if (inode->i_sb->s_export_op->fetch_iversion)
+		return inode->i_sb->s_export_op->fetch_iversion(inode);
+
 	cur = inode_peek_iversion_raw(inode);
 	for (;;) {
 		/* If flag is already set, then no need to swap */
-- 
2.28.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

