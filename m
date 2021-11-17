Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DC145503B
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Nov 2021 23:17:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637187457;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KcmKVhq015ZcouxxwgZAbTa+6dKPRLxY9+TBkE6o9tE=;
	b=XDrDzGTZZibuyizO3yGbtq2JG56uJCO9iktmDfYJYUupzYqMG/FTs7rNEC8VQgXJHrlDZB
	vx+Sd12PQrxbRR2eP8ITbONi2BkXK+c9a/sFC0v/cvMZEH1TsOakKhX/5kQ4GWw+GglPQb
	KDovMuo0q7DhziH7UBdg3valGPVCdqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-174-1-CaNHEgMUmh3HjLmUUrGw-1; Wed, 17 Nov 2021 17:17:33 -0500
X-MC-Unique: 1-CaNHEgMUmh3HjLmUUrGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8B1B420EE;
	Wed, 17 Nov 2021 22:17:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D14CADCD;
	Wed, 17 Nov 2021 22:17:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AEE504E58E;
	Wed, 17 Nov 2021 22:17:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHMHRWe031007 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 17:17:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 997D7197FC; Wed, 17 Nov 2021 22:17:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.32.4])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B6D160657;
	Wed, 17 Nov 2021 22:17:27 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 17 Nov 2021 17:17:15 -0500
Message-Id: <1637187438-18858-5-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1637187438-18858-1-git-send-email-dwysocha@redhat.com>
References: <1637187438-18858-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 4/7] NFS: Convert NFS fscache enable/disable
	dfprintks to tracepoints
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

Convert the enable / disable NFS fscache dfprintks to tracepoints.
Utilize the existing NFS inode trace event class, which allows us
to keep the same output format to other NFS inode tracepoints.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/fscache.c  | 5 +++--
 fs/nfs/nfstrace.h | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index cb701d9c4e47..913a29f2b9e4 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -19,6 +19,7 @@
 #include "internal.h"
 #include "iostat.h"
 #include "fscache.h"
+#include "nfstrace.h"
 
 #define NFSDBG_FACILITY		NFSDBG_FSCACHE
 
@@ -314,12 +315,12 @@ void nfs_fscache_open_file(struct inode *inode, struct file *filp)
 	nfs_fscache_update_auxdata(&auxdata, inode);
 
 	if (inode_is_open_for_write(inode)) {
-		dfprintk(FSCACHE, "NFS: nfsi 0x%p disabling cache\n", nfsi);
+		trace_nfs_fscache_disable_inode(inode);
 		clear_bit(NFS_INO_FSCACHE, &nfsi->flags);
 		fscache_disable_cookie(cookie, &auxdata, true);
 		fscache_uncache_all_inode_pages(cookie, inode);
 	} else {
-		dfprintk(FSCACHE, "NFS: nfsi 0x%p enabling cache\n", nfsi);
+		trace_nfs_fscache_enable_inode(inode);
 		fscache_enable_cookie(cookie, &auxdata, i_size_read(inode),
 				      nfs_fscache_can_enable, inode);
 		if (fscache_cookie_enabled(cookie))
diff --git a/fs/nfs/nfstrace.h b/fs/nfs/nfstrace.h
index 21dac847f1e4..2da68adda88f 100644
--- a/fs/nfs/nfstrace.h
+++ b/fs/nfs/nfstrace.h
@@ -144,6 +144,8 @@
 				int error \
 			), \
 			TP_ARGS(inode, error))
+DEFINE_NFS_INODE_EVENT(nfs_fscache_enable_inode);
+DEFINE_NFS_INODE_EVENT(nfs_fscache_disable_inode);
 DEFINE_NFS_INODE_EVENT(nfs_set_inode_stale);
 DEFINE_NFS_INODE_EVENT(nfs_refresh_inode_enter);
 DEFINE_NFS_INODE_EVENT_DONE(nfs_refresh_inode_exit);
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

