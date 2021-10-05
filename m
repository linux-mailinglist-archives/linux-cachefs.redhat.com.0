Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 74BF542270F
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Oct 2021 14:53:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633438381;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/bnC/wZBmXDRnwmQX6utmwFM8PDsEOmual2/ANQdBZk=;
	b=agcB3NBnG0E0Gx/ImlnZ3Fc6iPQ5qAztjYyFW+QgRS7x2wCO2o4dDx0x5MOSOH3ygJS6gP
	wmaBS3a3wHY450oYYVUFaKuEa6UMHiq0fBz+14gjCDfbu4id7c+Kets26BhZgTzPU0JsRn
	+rIYZOVfQXj9FJy9WWqE8Xl9jom438Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-cGhvz-A_P6mIE860abz1Hg-1; Tue, 05 Oct 2021 08:53:00 -0400
X-MC-Unique: cGhvz-A_P6mIE860abz1Hg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 351BE19067EB;
	Tue,  5 Oct 2021 12:52:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2DBD60C05;
	Tue,  5 Oct 2021 12:52:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0815D4EA2A;
	Tue,  5 Oct 2021 12:52:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 195Cqswn004281 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 5 Oct 2021 08:52:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 981C0E73F; Tue,  5 Oct 2021 12:52:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C1C881F422;
	Tue,  5 Oct 2021 12:52:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1633288958-8481-2-git-send-email-dwysocha@redhat.com>
References: <1633288958-8481-2-git-send-email-dwysocha@redhat.com>
	<1633288958-8481-1-git-send-email-dwysocha@redhat.com>
To: Dave Wysochanski <dwysocha@redhat.com>
MIME-Version: 1.0
Date: Tue, 05 Oct 2021 13:52:49 +0100
Message-ID: <1078846.1633438369@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 195Cqswn004281
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH v1 1/7] NFS: Fixup patch 3/8 of
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
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1078845.1633438369.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dave Wysochanski <dwysocha@redhat.com> wrote:

> 
> Handle failed return values of fscache_fallback_read_page() in
> switch statement.

After some discussion on IRC, the attached is probably better.  Returning 1
might result in 1 being returned through ->readpage(), which could be a
problem.

David
---
diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index 5b0e78742444..68e266a37675 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -346,33 +346,18 @@ int __nfs_readpage_from_fscache(struct inode *inode, struct page *page)
 
 	ret = fscache_fallback_read_page(nfs_i_fscache(inode), page);
 	if (ret < 0) {
-		dfprintk(FSCACHE, "NFS:    readpage_from_fscache: "
-			 "fscache_fallback_read_page failed ret = %d\n", ret);
-		return ret;
-	}
-
-	switch (ret) {
-	case 0: /* Read completed synchronously */
-		dfprintk(FSCACHE,
-			 "NFS:    readpage_from_fscache: read successful\n");
-		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_OK);
-		SetPageUptodate(page);
-		return 0;
-
-	case -ENOBUFS: /* inode not in cache */
-	case -ENODATA: /* page not in cache */
 		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL);
 		dfprintk(FSCACHE,
-			 "NFS:    readpage_from_fscache %d\n", ret);
-		SetPageChecked(page);
-		return 1;
-
-	default:
-		dfprintk(FSCACHE, "NFS:    readpage_from_fscache %d\n", ret);
-		nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL);
+			 "NFS:    readpage_from_fscache failed %d\n", ret);
 		SetPageChecked(page);
+		return ret;
 	}
-	return ret;
+
+	/* Read completed synchronously */
+	dfprintk(FSCACHE, "NFS:    readpage_from_fscache: read successful\n");
+	nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_OK);
+	SetPageUptodate(page);
+	return 0;
 }
 
 /*

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

