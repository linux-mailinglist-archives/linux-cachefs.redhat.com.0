Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8EA4CBD2E
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Mar 2022 12:56:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646308565;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wTkS21XMUs0H8yWrAbk13GW05AOGtB/gm2QyGAoJW48=;
	b=jF89xUg/ddi0FKVJx2pdJ+KdvarfNesHcJVBrVLmZHIqUF8CUD6/M7PvAdTBkDGwZ+OSL6
	GdDs1MOpThMFnv9b9Rmv5KqcisvENZmHG/GS/c1/aWzFN9YcqUDrsiOLMP2IzbtOjXYaZN
	FfPQdqMK4PHxHoWJQfcrcxrgRNTaQSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-JUhZgxT2PXmsAV3Xwe-ngQ-1; Thu, 03 Mar 2022 06:56:02 -0500
X-MC-Unique: JUhZgxT2PXmsAV3Xwe-ngQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2A8E824FA7;
	Thu,  3 Mar 2022 11:55:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 527127B5F3;
	Thu,  3 Mar 2022 11:55:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DFB731809C83;
	Thu,  3 Mar 2022 11:55:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 223BtoBv012888 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Mar 2022 06:55:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A4685842DA; Thu,  3 Mar 2022 11:55:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 76C0F842D4;
	Thu,  3 Mar 2022 11:55:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: jlayton@kernel.org
Date: Thu, 03 Mar 2022 11:55:48 +0000
Message-ID: <164630854858.3665356.17419701804248490708.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH] cachefiles: Fix incorrect length to
	fallocate()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When cachefiles_shorten_object() calls fallocate() to shape the cache file
to match the DIO size, it passes the total file size it wants to achieve,
not the amount of zeros that should be inserted.  Since this is meant to
preallocate that amount of storage for the file, it can cause the cache to
fill up the disk and hit ENOSPC.

Fix this by passing the length actually required to go from the current EOF
to the desired EOF.

Fixes: 7623ed6772de ("cachefiles: Implement cookie resize for truncate")
Reported-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/cachefiles/interface.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 51c968cd00a6..ae93cee9d25d 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -254,7 +254,7 @@ static bool cachefiles_shorten_object(struct cachefiles_object *object,
 		ret = cachefiles_inject_write_error();
 		if (ret == 0)
 			ret = vfs_fallocate(file, FALLOC_FL_ZERO_RANGE,
-					    new_size, dio_size);
+					    new_size, dio_size - new_size);
 		if (ret < 0) {
 			trace_cachefiles_io_error(object, file_inode(file), ret,
 						  cachefiles_trace_fallocate_error);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

