Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A531D78D3FE
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Aug 2023 10:23:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693383813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SQ8Cs+lJ5jlqJ23Ctdh0NFBwiA7Cgp1hCzE/qNks8YQ=;
	b=X/QAKP19FWjaaPcOAa3VHUR4dPyEIr4FyngSASm0JJuQlJMUnPRGy4YZ7phMKR4pHHU8lN
	f/0qFQupk4ow7wtLaduZchLbXLFFHwYEjipw9HmuJbR99vloJ67NXDpvV4QmOPMIo5h6QH
	bJQ+1hZLNRGPTYfZJu9RC0EVRxDZvD0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-J4xUBT8fONC_Ug9W9-u8ag-1; Wed, 30 Aug 2023 04:23:30 -0400
X-MC-Unique: J4xUBT8fONC_Ug9W9-u8ag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC89B800CA8;
	Wed, 30 Aug 2023 08:23:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D296140D283D;
	Wed, 30 Aug 2023 08:23:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C55AA1946A73;
	Wed, 30 Aug 2023 08:23:08 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8A75419465A8 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:02:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7898540C2079; Fri, 25 Aug 2023 14:02:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7102940C2073
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 14:02:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54D223806629
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 14:02:18 +0000 (UTC)
Received: from out-243.mta1.migadu.com (out-243.mta1.migadu.com
 [95.215.58.243]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-AYxFTfGtOyCHDda1JpIabw-1; Fri, 25 Aug 2023 10:02:16 -0400
X-MC-Unique: AYxFTfGtOyCHDda1JpIabw-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:18 +0800
Message-Id: <20230825135431.1317785-17-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Wed, 30 Aug 2023 08:22:42 +0000
Subject: [Linux-cachefs] [PATCH 16/29] xfs: add nowait parameter for
 xfs_inode_item_init()
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bpf@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-btrfs@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Hao Xu <howeyxu@tencent.com>

Add nowait parameter for xfs_inode_item_init() to support nowait
semantics.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/libxfs/xfs_trans_inode.c |  3 ++-
 fs/xfs/xfs_inode_item.c         | 12 ++++++++----
 fs/xfs/xfs_inode_item.h         |  3 ++-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_trans_inode.c b/fs/xfs/libxfs/xfs_trans_inode.c
index cb4796b6e693..e7a8f63c8975 100644
--- a/fs/xfs/libxfs/xfs_trans_inode.c
+++ b/fs/xfs/libxfs/xfs_trans_inode.c
@@ -33,7 +33,8 @@ xfs_trans_ijoin(
 
 	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
 	if (ip->i_itemp == NULL)
-		xfs_inode_item_init(ip, ip->i_mount);
+		xfs_inode_item_init(ip, ip->i_mount,
+				    tp->t_flags & XFS_TRANS_NOWAIT);
 	iip = ip->i_itemp;
 
 	ASSERT(iip->ili_lock_flags == 0);
diff --git a/fs/xfs/xfs_inode_item.c b/fs/xfs/xfs_inode_item.c
index 91c847a84e10..1742920bb4ce 100644
--- a/fs/xfs/xfs_inode_item.c
+++ b/fs/xfs/xfs_inode_item.c
@@ -825,21 +825,25 @@ static const struct xfs_item_ops xfs_inode_item_ops = {
 /*
  * Initialize the inode log item for a newly allocated (in-core) inode.
  */
-void
+int
 xfs_inode_item_init(
 	struct xfs_inode	*ip,
-	struct xfs_mount	*mp)
+	struct xfs_mount	*mp,
+	bool			nowait)
 {
 	struct xfs_inode_log_item *iip;
+	gfp_t gfp_flags = GFP_KERNEL | (nowait ? 0 : __GFP_NOFAIL);
 
 	ASSERT(ip->i_itemp == NULL);
-	iip = ip->i_itemp = kmem_cache_zalloc(xfs_ili_cache,
-					      GFP_KERNEL | __GFP_NOFAIL);
+	iip = ip->i_itemp = kmem_cache_zalloc(xfs_ili_cache, gfp_flags);
+	if (!iip)
+		return -EAGAIN;
 
 	iip->ili_inode = ip;
 	spin_lock_init(&iip->ili_lock);
 	xfs_log_item_init(mp, &iip->ili_item, XFS_LI_INODE,
 						&xfs_inode_item_ops);
+	return 0;
 }
 
 /*
diff --git a/fs/xfs/xfs_inode_item.h b/fs/xfs/xfs_inode_item.h
index 377e06007804..7ba6f8a6b243 100644
--- a/fs/xfs/xfs_inode_item.h
+++ b/fs/xfs/xfs_inode_item.h
@@ -42,7 +42,8 @@ static inline int xfs_inode_clean(struct xfs_inode *ip)
 	return !ip->i_itemp || !(ip->i_itemp->ili_fields & XFS_ILOG_ALL);
 }
 
-extern void xfs_inode_item_init(struct xfs_inode *, struct xfs_mount *);
+extern int xfs_inode_item_init(struct xfs_inode *ip, struct xfs_mount *mp,
+			       bool nowait);
 extern void xfs_inode_item_destroy(struct xfs_inode *);
 extern void xfs_iflush_abort(struct xfs_inode *);
 extern void xfs_iflush_shutdown_abort(struct xfs_inode *);
-- 
2.25.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

