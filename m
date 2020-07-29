Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C5329232015
	for <lists+linux-cachefs@lfdr.de>; Wed, 29 Jul 2020 16:13:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596032005;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=diwOGlXOPYwjnubc6jQa6QDkDBRd1sv4Ljid2CSekp8=;
	b=C8m8Y5LH3CyYRxAIJyB2AmVB6qVfvkHXflSuRr1OewSgwTW8qz+A6W2J4YDv2Z5Fbud8az
	xgpua6HICnvQKbk6M9QD3D4DRebztpf37fcUGFHqWrU+fcfFXWeRfozcQ4Xotfh8G8nRYW
	2eTQZqDThWlit776t208Y66eZ1/QejY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-CZUrNzyCMGSsEXyZhdIBYA-1; Wed, 29 Jul 2020 10:13:22 -0400
X-MC-Unique: CZUrNzyCMGSsEXyZhdIBYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C30C18015F7;
	Wed, 29 Jul 2020 14:13:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2771619B5;
	Wed, 29 Jul 2020 14:13:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DBA01809547;
	Wed, 29 Jul 2020 14:13:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06TECgtx020605 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 29 Jul 2020 10:12:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 852AB71920; Wed, 29 Jul 2020 14:12:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (ovpn-113-23.rdu2.redhat.com [10.10.113.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0169D71906;
	Wed, 29 Jul 2020 14:12:41 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 29 Jul 2020 10:12:17 -0400
Message-Id: <1596031949-26793-3-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
References: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v2 02/14] NFS: In nfs_readpage() only
	increment NFSIOS_READPAGES when read succeeds
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is a small inconsistency with nfs_readpage() vs nfs_readpages() with
regards to NFSIOS_READPAGES.  In readpage we unconditionally increment
NFSIOS_READPAGES at the top, which means even if the read fails.  In
readpages, we increment NFSIOS_READPAGES at the bottom based on how
many pages were successfully read.  Change readpage to be consistent with
readpages and so NFSIOS_READPAGES only reflects successful, non-fscache
reads.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/read.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/read.c b/fs/nfs/read.c
index a05fb3904ddf..1153c4e0a155 100644
--- a/fs/nfs/read.c
+++ b/fs/nfs/read.c
@@ -319,7 +319,6 @@ int nfs_readpage(struct file *filp, struct page *page)
 	dprintk("NFS: nfs_readpage (%p %ld@%lu)\n",
 		page, PAGE_SIZE, page_index(page));
 	nfs_inc_stats(inode, NFSIOS_VFSREADPAGE);
-	nfs_add_stats(inode, NFSIOS_READPAGES, 1);
 
 	/*
 	 * Try to flush any pending writes to the file..
@@ -359,6 +358,7 @@ int nfs_readpage(struct file *filp, struct page *page)
 		if (!PageUptodate(page) && !ret)
 			ret = xchg(&ctx->error, 0);
 	}
+	nfs_add_stats(inode, NFSIOS_READPAGES, 1);
 out:
 	put_nfs_open_context(ctx);
 	return ret;
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

