Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 22EA323201A
	for <lists+linux-cachefs@lfdr.de>; Wed, 29 Jul 2020 16:13:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596032008;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=05t/sXvpH8xSI7RlC25DTNpmVj+aGMV2LJOeGNjlY/0=;
	b=M0dWbXx4dW0imWbLSLSO3JA/kSYGu61iS+RsPwu9F2eWYoeEzEg35iXeN04tyE/wCm7oWh
	KYJJLzHrkSX/XjhNy6U1AQA6JLLBQchguV0HxG3bONYNaoHSxSGOKb6iV7JaU+Dfb3rzeP
	iMyfInc5HFeXQZOvGg3QHsr2+CLKfq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-a081zUnsPcK9fPP-gN4ReQ-1; Wed, 29 Jul 2020 10:13:24 -0400
X-MC-Unique: a081zUnsPcK9fPP-gN4ReQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AA67801504;
	Wed, 29 Jul 2020 14:13:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF5D861100;
	Wed, 29 Jul 2020 14:13:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9D321809561;
	Wed, 29 Jul 2020 14:13:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06TECmhF020698 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 29 Jul 2020 10:12:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 48E3F71925; Wed, 29 Jul 2020 14:12:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (ovpn-113-23.rdu2.redhat.com [10.10.113.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C623E71906;
	Wed, 29 Jul 2020 14:12:47 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 29 Jul 2020 10:12:26 -0400
Message-Id: <1596031949-26793-12-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
References: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v2 11/14] NFS: Call
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
 fs/nfs/write.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index 005eea29e0ec..2da99814da51 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -290,6 +290,7 @@ static void nfs_grow_file(struct page *page, unsigned int offset, unsigned int c
 		goto out;
 	i_size_write(inode, end);
 	NFS_I(inode)->cache_validity &= ~NFS_INO_INVALID_SIZE;
+	nfs_fscache_invalidate(inode);
 	nfs_inc_stats(inode, NFSIOS_EXTENDWRITE);
 out:
 	spin_unlock(&inode->i_lock);
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

