Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 666A3221078
	for <lists+linux-cachefs@lfdr.de>; Wed, 15 Jul 2020 17:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594825919;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ikYAiklJ3BrylV2Zo0+5y023KSKJsKkNnaSy3iKH8cw=;
	b=W7ojx/QScp/2HEFETqktcJkqJH/gLPyotTV8Q9qd6k1sPQwxMzBf/liXXxlJdoXT3UuiJi
	yA5qpHc6LfIec1+JqHpqPc3osXuyit0iFrq++sH3xPPLmU/bTUSWeTdGlRSVNaNUsJg0d1
	aRRMltQR9mIncyTv9Wn4AfGAloeVvSs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-Bg6t6kJnM7yfzRoMIBhE6w-1; Wed, 15 Jul 2020 11:11:56 -0400
X-MC-Unique: Bg6t6kJnM7yfzRoMIBhE6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5446A804355;
	Wed, 15 Jul 2020 15:11:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43D8460BF1;
	Wed, 15 Jul 2020 15:11:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CF3994F13;
	Wed, 15 Jul 2020 15:11:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06FFAwaf021791 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 11:10:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EE91760BF4; Wed, 15 Jul 2020 15:10:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (ovpn-118-79.rdu2.redhat.com [10.10.118.79])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84B4860BF1;
	Wed, 15 Jul 2020 15:10:58 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 15 Jul 2020 11:10:49 -0400
Message-Id: <1594825849-24991-14-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1594825849-24991-1-git-send-email-dwysocha@redhat.com>
References: <1594825849-24991-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v1 13/13] NFS: Call
	nfs_fscache_invalidate() when write extends the size of the file
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a write extends the size of the file and fscache is enabled, we
need to invalidate the object with the new size.  Otherwise, the next
read from the cache may fail inside cachefiles_shape_extent() due to
cookie->zero_point being smaller than the size of the file.

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/write.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index 005eea29e0ec..0f2f15da27f0 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -277,6 +277,7 @@ static struct nfs_page *nfs_find_and_lock_page_request(struct page *page)
 static void nfs_grow_file(struct page *page, unsigned int offset, unsigned int count)
 {
 	struct inode *inode = page_file_mapping(page)->host;
+	struct nfs_inode *nfsi = NFS_I(inode);
 	loff_t end, i_size;
 	pgoff_t end_index;
 
@@ -289,10 +290,14 @@ static void nfs_grow_file(struct page *page, unsigned int offset, unsigned int c
 	if (i_size >= end)
 		goto out;
 	i_size_write(inode, end);
-	NFS_I(inode)->cache_validity &= ~NFS_INO_INVALID_SIZE;
+	nfsi->cache_validity &= ~NFS_INO_INVALID_SIZE;
+	if (nfsi->fscache)
+		nfs_fscache_invalidate(inode);
 	nfs_inc_stats(inode, NFSIOS_EXTENDWRITE);
 out:
 	spin_unlock(&inode->i_lock);
+	dprintk("NFS:       nfs_grow_file (0x%p/0x%p) i_size=%lld\n",
+		  nfsi, nfsi->fscache, end);
 }
 
 /* A writeback failed: mark the page as bad, and invalidate the page cache */
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

