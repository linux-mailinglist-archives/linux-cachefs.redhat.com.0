Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 80BEF232014
	for <lists+linux-cachefs@lfdr.de>; Wed, 29 Jul 2020 16:13:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596032005;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o1iXVKtXeC2uaaD+PDzZ7lumji8iU/anf0rkzDck6A8=;
	b=JK1DcmlhuNZFJjKZ4Dhkr/88rX8l5Xu88STOorEX/TNjnmdsB+Ydg+VxyVg/NNYkxzV56s
	Ij69jlJr2O5v3J/nzHvNRKzqfdPER8l09CaKYxLw+Knvr0A6Vh2kTF+lVLas7ljYAOkhhn
	U16NJCgy9BCgczA5Bi+6o9pvd9Na6WQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-4hKtRtRxPxWvqnufJC3g8w-1; Wed, 29 Jul 2020 10:13:23 -0400
X-MC-Unique: 4hKtRtRxPxWvqnufJC3g8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89D3310CE78F;
	Wed, 29 Jul 2020 14:13:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BB3D5DA73;
	Wed, 29 Jul 2020 14:13:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65F981809554;
	Wed, 29 Jul 2020 14:13:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06TECkl8020664 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 29 Jul 2020 10:12:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E556771906; Wed, 29 Jul 2020 14:12:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (ovpn-113-23.rdu2.redhat.com [10.10.113.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E6BA71923;
	Wed, 29 Jul 2020 14:12:46 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 29 Jul 2020 10:12:24 -0400
Message-Id: <1596031949-26793-10-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
References: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v2 09/14] NFS: Only use and unuse an
	fscache cookie a single time based on NFS_INO_FSCACHE
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For NFS, we only want to make a decision whether to "use" a inode based
fscache cookie one time, not multiple times, and based on whether the
inode is open for write by any process.  Achieve this by gating the
call to fscache_use_cookie / fscache_unuse_cookie by the NFS_INO_FSCACHE
flag on the nfs_inode.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/fscache.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index 1c4ced273fb7..00bb720cccfa 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -285,8 +285,10 @@ void nfs_fscache_clear_inode(struct inode *inode)
 
 	dfprintk(FSCACHE, "NFS: clear cookie (0x%p/0x%p)\n", nfsi, cookie);
 
-	nfs_fscache_update_auxdata(&auxdata, nfsi);
-	fscache_unuse_cookie(cookie, &auxdata, NULL);
+	if (test_and_clear_bit(NFS_INO_FSCACHE, &NFS_I(inode)->flags)) {
+		nfs_fscache_update_auxdata(&auxdata, nfsi);
+		fscache_unuse_cookie(cookie, &auxdata, NULL);
+	}
 	fscache_relinquish_cookie(cookie, false);
 	nfsi->fscache = NULL;
 }
@@ -321,18 +323,23 @@ void nfs_fscache_open_file(struct inode *inode, struct file *filp)
 {
 	struct nfs_inode *nfsi = NFS_I(inode);
 	struct fscache_cookie *cookie = nfs_i_fscache(inode);
+	struct nfs_fscache_inode_auxdata auxdata;
 
 	if (!fscache_cookie_valid(cookie))
 		return;
 
 	if (inode_is_open_for_write(inode)) {
-		dfprintk(FSCACHE, "NFS: nfsi 0x%p disabling cache\n", nfsi);
-		clear_bit(NFS_INO_FSCACHE, &nfsi->flags);
+		if (test_and_clear_bit(NFS_INO_FSCACHE, &nfsi->flags)) {
+			dfprintk(FSCACHE, "NFS: nfsi 0x%p disabling cache\n", nfsi);
+			nfs_fscache_update_auxdata(&auxdata, nfsi);
+			fscache_unuse_cookie(cookie, &auxdata, NULL);
+		}
 	} else {
-		dfprintk(FSCACHE, "NFS: nfsi 0x%p enabling cache\n", nfsi);
-		set_bit(NFS_INO_FSCACHE, &NFS_I(inode)->flags);
+		if (!test_and_set_bit(NFS_INO_FSCACHE, &nfsi->flags)) {
+			dfprintk(FSCACHE, "NFS: nfsi 0x%p enabling cache\n", nfsi);
+			fscache_use_cookie(cookie, false);
+		}
 	}
-	fscache_use_cookie(cookie, false);
 }
 EXPORT_SYMBOL_GPL(nfs_fscache_open_file);
 
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

