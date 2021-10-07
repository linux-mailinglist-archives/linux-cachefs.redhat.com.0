Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AEDB9425FE3
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Oct 2021 00:30:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633645852;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FwBymV7eRa1X3UKulWqNebKriETWEuRZlOkQxS0qncA=;
	b=SG/jA979/bSKFsWpIG+7/QsX3mbxY5KzoEw1kZOSqLI22VoHh/B6TqOW2orui4/X9QTODK
	PuQalBE5DM6S8lT0T1hVc+olxpJgKeDpAgJKeqPfEiXixnK5I7iWQ9b5Qvo6W1WiIB1d89
	MRXLyFzwZVKIR/4BpU21V5e9xN+zFGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-nzaX05SfPHm2Xrd2QXPy8A-1; Thu, 07 Oct 2021 18:30:51 -0400
X-MC-Unique: nzaX05SfPHm2Xrd2QXPy8A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 392A63626D;
	Thu,  7 Oct 2021 22:30:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CC78179B3;
	Thu,  7 Oct 2021 22:30:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2A9E1803B30;
	Thu,  7 Oct 2021 22:30:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 197MUitL017880 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 7 Oct 2021 18:30:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F660ADC0; Thu,  7 Oct 2021 22:30:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.139])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F36CE5D9C6;
	Thu,  7 Oct 2021 22:30:43 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	David Howells <dhowells@redhat.com>
Date: Thu,  7 Oct 2021 18:30:17 -0400
Message-Id: <1633645823-31235-2-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1633645823-31235-1-git-send-email-dwysocha@redhat.com>
References: <1633645823-31235-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH v2 1/7] NFS: Use nfs_i_fscache()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

