Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 256AF425FE5
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Oct 2021 00:30:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633645854;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wJL1uM3Dw7RKfr+podUO65ntjg3ztXeXt2NhFOVQl4o=;
	b=g76f6T984Mz2qqIs4w7KNgF6sPJkK7EQPX+X3u6yndfHH1k73Iot9IrJOqfilni8ZCb8bq
	QlcdS16XBAXGLfW5BhOqX0jmCzZ82ZqIki7G7Xe79Fmnxwkjgbm3ZRlL/hCpgY3Z8Zds18
	7IdFaorjXaG4Ws9zffKQAoBoqSSkaHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-rvJh6amCMPOwDS8fXkodpw-1; Thu, 07 Oct 2021 18:30:51 -0400
X-MC-Unique: rvJh6amCMPOwDS8fXkodpw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC5F2801AC5;
	Thu,  7 Oct 2021 22:30:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE97E10013C1;
	Thu,  7 Oct 2021 22:30:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F20D0180598A;
	Thu,  7 Oct 2021 22:30:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 197MUk5Y017895 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 7 Oct 2021 18:30:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 13F215DEFB; Thu,  7 Oct 2021 22:30:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.139])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76C205D9C6;
	Thu,  7 Oct 2021 22:30:45 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	David Howells <dhowells@redhat.com>
Date: Thu,  7 Oct 2021 18:30:19 -0400
Message-Id: <1633645823-31235-4-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1633645823-31235-1-git-send-email-dwysocha@redhat.com>
References: <1633645823-31235-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH v2 3/7] NFS: Convert NFS fscache
	enable/disable dfprintks to tracepoints
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert the enable / disable NFS fscache dfprintks to tracepoints.
Utilize the existing NFS inode trace event class, which allows us
to keep the same output format to other NFS inode tracepoints.
Start the names of the tracepoints with "nfs_fscache" for easy
identification.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/fscache.c  | 5 +++--
 fs/nfs/nfstrace.h | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index 6764938eca2d..5f9be4a1b5f8 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -19,6 +19,7 @@
 #include "internal.h"
 #include "iostat.h"
 #include "fscache.h"
+#include "nfstrace.h"
 
 #define NFSDBG_FACILITY		NFSDBG_FSCACHE
 
@@ -314,11 +315,11 @@ void nfs_fscache_open_file(struct inode *inode, struct file *filp)
 	nfs_fscache_update_auxdata(&auxdata, inode);
 
 	if (inode_is_open_for_write(inode)) {
-		dfprintk(FSCACHE, "NFS: nfsi 0x%p disabling cache\n", nfsi);
+		trace_nfs_fscache_disable_inode(inode);
 		clear_bit(NFS_INO_FSCACHE, &nfsi->flags);
 		fscache_disable_cookie(cookie, &auxdata, true);
 	} else {
-		dfprintk(FSCACHE, "NFS: nfsi 0x%p enabling cache\n", nfsi);
+		trace_nfs_fscache_enable_inode(inode);
 		fscache_enable_cookie(cookie, &auxdata, i_size_read(inode),
 				      nfs_fscache_can_enable, inode);
 		if (fscache_cookie_enabled(cookie))
diff --git a/fs/nfs/nfstrace.h b/fs/nfs/nfstrace.h
index 8a224871be74..b79f5fe2e39d 100644
--- a/fs/nfs/nfstrace.h
+++ b/fs/nfs/nfstrace.h
@@ -209,6 +209,8 @@
 DEFINE_NFS_INODE_EVENT(nfs_fsync_enter);
 DEFINE_NFS_INODE_EVENT_DONE(nfs_fsync_exit);
 DEFINE_NFS_INODE_EVENT(nfs_access_enter);
+DEFINE_NFS_INODE_EVENT(nfs_fscache_enable_inode);
+DEFINE_NFS_INODE_EVENT(nfs_fscache_disable_inode);
 
 TRACE_EVENT(nfs_access_exit,
 		TP_PROTO(
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

