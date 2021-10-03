Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9785A4203B2
	for <lists+linux-cachefs@lfdr.de>; Sun,  3 Oct 2021 21:22:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633288977;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FwBymV7eRa1X3UKulWqNebKriETWEuRZlOkQxS0qncA=;
	b=Gm5aVAxCIorItzuMIbT40BQ6VJV5ys98wiom89BfHDjDP9eekILmjluK6gqsaTb5MOgTa1
	+C1OI0kcVw9bh82MH4pXZZuLOcJFjytnWQ8qr+uTijwiFQiQEuWwcS2bhyIpxhxwnprgpz
	BZ+AQo+6NwqZD5qfsx46dBB3/t2F0tY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-tSOM1Ls7MLiybHUdFhH-CQ-1; Sun, 03 Oct 2021 15:22:56 -0400
X-MC-Unique: tSOM1Ls7MLiybHUdFhH-CQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BD3819057A1;
	Sun,  3 Oct 2021 19:22:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38DC25C1CF;
	Sun,  3 Oct 2021 19:22:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 249B41806D02;
	Sun,  3 Oct 2021 19:22:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 193JMjFZ025515 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 3 Oct 2021 15:22:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C75A5F4E8; Sun,  3 Oct 2021 19:22:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72E9E5F4E9;
	Sun,  3 Oct 2021 19:22:44 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	David Howells <dhowells@redhat.com>
Date: Sun,  3 Oct 2021 15:22:33 -0400
Message-Id: <1633288958-8481-3-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1633288958-8481-1-git-send-email-dwysocha@redhat.com>
References: <1633288958-8481-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH v1 2/7] NFS: Use nfs_i_fscache()
	consistently within NFS fscache code
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The nfs_i_fscache() is the API defined to check whether fscache
is enabled on an NFS inode or not, so use it consistently through
the code.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/fscache.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/nfs/fscache.h b/fs/nfs/fscache.h
index 679055720dae..f4deea2908e9 100644
--- a/fs/nfs/fscache.h
+++ b/fs/nfs/fscache.h
@@ -105,7 +105,7 @@ extern void __nfs_read_completion_to_fscache(struct nfs_pgio_header *hdr,
 static inline int nfs_readpage_from_fscache(struct inode *inode,
 					    struct page *page)
 {
-	if (NFS_I(inode)->fscache)
+	if (nfs_i_fscache(inode))
 		return __nfs_readpage_from_fscache(inode, page);
 	return -ENOBUFS;
 }
@@ -117,7 +117,7 @@ static inline int nfs_readpage_from_fscache(struct inode *inode,
 static inline void nfs_readpage_to_fscache(struct inode *inode,
 					   struct page *page)
 {
-	if (NFS_I(inode)->fscache)
+	if (nfs_i_fscache(inode))
 		__nfs_readpage_to_fscache(inode, page);
 }
 
@@ -126,7 +126,7 @@ static inline void nfs_readpage_to_fscache(struct inode *inode,
  */
 static inline void nfs_fscache_invalidate(struct inode *inode)
 {
-	fscache_invalidate(NFS_I(inode)->fscache);
+	fscache_invalidate(nfs_i_fscache(inode));
 }
 
 /*
@@ -134,7 +134,7 @@ static inline void nfs_fscache_invalidate(struct inode *inode)
  */
 static inline void nfs_fscache_wait_on_invalidate(struct inode *inode)
 {
-	fscache_wait_on_invalidate(NFS_I(inode)->fscache);
+	fscache_wait_on_invalidate(nfs_i_fscache(inode));
 }
 
 /*
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

