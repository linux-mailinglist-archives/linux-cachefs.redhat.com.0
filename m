Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6E94203B5
	for <lists+linux-cachefs@lfdr.de>; Sun,  3 Oct 2021 21:22:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633288978;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0sbJU207TpeUMgNVdzk6B0cuxOWp0ENnUzCKhJzO5gk=;
	b=QfW76FRDDtlDeoke0TWZoBTBHg3KbCXtS1xS+1+h3+4vq3IYAB/uw7nWH8edgmJ7aHc+/l
	WsNhMJ4ZlPNbrpictLmxQ9oYm74r3fPOOfYOlWjuVfXia4ostsrtY7hPT7XoGWmk89QIWv
	Yd7Ix1zuFeEgYxbUip3TNmXw3oehFgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-3a7a4mkZN7ifWEUNeZWYrg-1; Sun, 03 Oct 2021 15:22:56 -0400
X-MC-Unique: 3a7a4mkZN7ifWEUNeZWYrg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30E09814270;
	Sun,  3 Oct 2021 19:22:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADA9060843;
	Sun,  3 Oct 2021 19:22:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB0ED1809C81;
	Sun,  3 Oct 2021 19:22:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 193JMibb025509 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 3 Oct 2021 15:22:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 479CC5F4E9; Sun,  3 Oct 2021 19:22:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC8F65F4E8;
	Sun,  3 Oct 2021 19:22:43 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	David Howells <dhowells@redhat.com>
Date: Sun,  3 Oct 2021 15:22:32 -0400
Message-Id: <1633288958-8481-2-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1633288958-8481-1-git-send-email-dwysocha@redhat.com>
References: <1633288958-8481-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH v1 1/7] NFS: Fixup patch 3/8 of
	fscache-iter-3 v2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Handle failed return values of fscache_fallback_read_page() in
switch statement.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/fscache.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index 5b0e78742444..d3efb8ba4fb7 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -345,11 +345,6 @@ int __nfs_readpage_from_fscache(struct inode *inode, struct page *page)
 	}
 
 	ret = fscache_fallback_read_page(nfs_i_fscache(inode), page);
-	if (ret < 0) {
-		dfprintk(FSCACHE, "NFS:    readpage_from_fscache: "
-			 "fscache_fallback_read_page failed ret = %d\n", ret);
-		return ret;
-	}
 
 	switch (ret) {
 	case 0: /* Read completed synchronously */
@@ -363,7 +358,7 @@ int __nfs_readpage_from_fscache(struct inode *inode, struct page *page)
 	case -ENODATA: /* page not in cache */
 		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL);
 		dfprintk(FSCACHE,
-			 "NFS:    readpage_from_fscache %d\n", ret);
+			 "NFS:    readpage_from_fscache failed %d\n", ret);
 		SetPageChecked(page);
 		return 1;
 
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

