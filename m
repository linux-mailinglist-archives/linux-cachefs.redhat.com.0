Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4694F7E8D
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 14:02:47 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-KHV5DWfKPjaOdd6eoOY0Sw-1; Thu, 07 Apr 2022 08:02:42 -0400
X-MC-Unique: KHV5DWfKPjaOdd6eoOY0Sw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C72FC1C0171B;
	Thu,  7 Apr 2022 12:02:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44A459E60;
	Thu,  7 Apr 2022 12:02:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2E0B11940342;
	Thu,  7 Apr 2022 12:02:37 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EFBAB1947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 12:02:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D112240CFD0B; Thu,  7 Apr 2022 12:02:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC75440CFD06
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 12:02:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B47FA800882
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 12:02:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-Fc0krWEFMbOwzkD7CwGmlQ-1; Thu, 07 Apr 2022 08:02:30 -0400
X-MC-Unique: Fc0krWEFMbOwzkD7CwGmlQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 14FBE617A0;
 Thu,  7 Apr 2022 12:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9AA9C385A0;
 Thu,  7 Apr 2022 12:02:27 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org,
	dhowells@redhat.com
Date: Thu,  7 Apr 2022 08:02:21 -0400
Message-Id: <20220407120224.76156-3-jlayton@kernel.org>
In-Reply-To: <20220407120224.76156-1-jlayton@kernel.org>
References: <20220407120224.76156-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Linux-cachefs] [RFC PATCH 2/5] ceph: set rsize in netfs_i_context
 from mount options
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
Cc: linux-cachefs@redhat.com, idryomov@gmail.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
index 1dad69a0ab70..8ea1b53b6ce9 100644
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -450,6 +450,7 @@ static int ceph_fill_fragtree(struct inode *inode,
  */
 struct inode *ceph_alloc_inode(struct super_block *sb)
 {
+	struct ceph_mount_options *fsopt = ceph_sb_to_client(sb)->mount_options;
 	struct ceph_inode_info *ci;
 	struct netfs_i_context *ctx;
 	int i;
@@ -463,7 +464,7 @@ struct inode *ceph_alloc_inode(struct super_block *sb)
 	/* Set parameters for the netfs library */
 	ctx = netfs_i_context(&ci->vfs_inode);
 	netfs_i_context_init(&ci->vfs_inode, &ceph_netfs_ops);
-	ctx->rsize = 1024 * 1024;
+	ctx->rsize = fsopt->rsize;
 
 	spin_lock_init(&ci->i_ceph_lock);
 
-- 
2.35.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

