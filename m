Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F07F3232018
	for <lists+linux-cachefs@lfdr.de>; Wed, 29 Jul 2020 16:13:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596032008;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6EdX+yMtyRbT/soW9TwvZ489WHHHxubG0yf0w/L3Nn4=;
	b=W3JJRDImfzSPoNpZPMi6nuqCurJjjhmAChNGRFz5puEEi/Xk80P5zFXrWqjgbs94kGDwyz
	T286K3dVyzXN/OE6s4cr/vM2EXHI5unQX9+Q+UnrYn3rfdd0iMKixvbJsVrArzmdkE9lpW
	zdhMwTSMlBkbf7i4mbmy2n5yTU86SNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-emZgeR5CP9-DaUVUcBT-eg-1; Wed, 29 Jul 2020 10:13:26 -0400
X-MC-Unique: emZgeR5CP9-DaUVUcBT-eg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE8431DE4;
	Wed, 29 Jul 2020 14:13:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AED1970BB9;
	Wed, 29 Jul 2020 14:13:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A2901809563;
	Wed, 29 Jul 2020 14:13:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06TECnfY020719 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 29 Jul 2020 10:12:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8A26671925; Wed, 29 Jul 2020 14:12:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (ovpn-113-23.rdu2.redhat.com [10.10.113.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13B2271906;
	Wed, 29 Jul 2020 14:12:49 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Date: Wed, 29 Jul 2020 10:12:28 -0400
Message-Id: <1596031949-26793-14-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
References: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v2 13/14] NFS: Call
	fscache_resize_cookie() when inode size changes due to setattr
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

Handle truncate / setattr when fscache is enabled by calling
fscache_resize_cookie().

Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index 45067303348c..6b814246d07d 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -667,6 +667,7 @@ static int nfs_vmtruncate(struct inode * inode, loff_t offset)
 	spin_unlock(&inode->i_lock);
 	truncate_pagecache(inode, offset);
 	spin_lock(&inode->i_lock);
+	fscache_resize_cookie(nfs_i_fscache(inode), i_size_read(inode));
 out:
 	return err;
 }
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

