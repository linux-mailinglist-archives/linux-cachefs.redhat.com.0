Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 875CE221077
	for <lists+linux-cachefs@lfdr.de>; Wed, 15 Jul 2020 17:11:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594825918;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eBBCdvmUbrpPMainviki8tmDUt5x8j5hXl6rdo8KAB0=;
	b=WgqZpzSr+7FQTdhDBdDL+EqskKEFk1JQvlyy9pE2Ys0SY6K6zvuduB1bn/1w9ArLahALPm
	pp6Z9a+RMNK0jw+eaKWegvqCUDLyNHiLLEIne+ftkiNH3d639KbYliIoGeS1DNPZuQREtQ
	3XKS0aINXvXnqDOvorsS7meP6wJ0LvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-duXBn6CUNL-hS_G4ViAa1g-1; Wed, 15 Jul 2020 11:11:56 -0400
X-MC-Unique: duXBn6CUNL-hS_G4ViAa1g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE5D1106B1CD;
	Wed, 15 Jul 2020 15:10:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD1C17980F;
	Wed, 15 Jul 2020 15:10:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C72EB180954D;
	Wed, 15 Jul 2020 15:10:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06FFAuEW021727 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 11:10:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1A2BF60BF1; Wed, 15 Jul 2020 15:10:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (ovpn-118-79.rdu2.redhat.com [10.10.118.79])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A411560BF4;
	Wed, 15 Jul 2020 15:10:55 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 15 Jul 2020 11:10:44 -0400
Message-Id: <1594825849-24991-9-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1594825849-24991-1-git-send-email-dwysocha@redhat.com>
References: <1594825849-24991-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v1 08/13] NFS: Allow
	nfs_async_read_completion_ops to be used by other NFS code
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The standard read nfs_pgio_completion_ops will be needed when
fscache read path is converted to the new API, so export just to
other NFS code.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/internal.h | 1 +
 fs/nfs/read.c     | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index df4ffe9afb6a..5590f0883f94 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -443,6 +443,7 @@ extern char *nfs_path(char **p, struct dentry *dentry,
 
 struct nfs_pgio_completion_ops;
 /* read.c */
+extern const struct nfs_pgio_completion_ops nfs_async_read_completion_ops;
 extern void nfs_pageio_init_read(struct nfs_pageio_descriptor *pgio,
 			struct inode *inode, bool force_mds,
 			const struct nfs_pgio_completion_ops *compl_ops);
diff --git a/fs/nfs/read.c b/fs/nfs/read.c
index de57bb692a4b..2f2c32346212 100644
--- a/fs/nfs/read.c
+++ b/fs/nfs/read.c
@@ -30,7 +30,7 @@
 
 #define NFSDBG_FACILITY		NFSDBG_PAGECACHE
 
-static const struct nfs_pgio_completion_ops nfs_async_read_completion_ops;
+const struct nfs_pgio_completion_ops nfs_async_read_completion_ops;
 static const struct nfs_rw_ops nfs_rw_read_ops;
 
 static struct kmem_cache *nfs_rdata_cachep;
@@ -215,7 +215,7 @@ static void nfs_initiate_read(struct nfs_pgio_header *hdr,
 	}
 }
 
-static const struct nfs_pgio_completion_ops nfs_async_read_completion_ops = {
+const struct nfs_pgio_completion_ops nfs_async_read_completion_ops = {
 	.error_cleanup = nfs_async_read_error,
 	.completion = nfs_read_completion,
 };
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

