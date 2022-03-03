Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E18F4CBE7E
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Mar 2022 14:06:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646312768;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=87JVNshnu3qWhlUtjfbQxLgZsW4yRBZQIFtZOOztn9Y=;
	b=PVhxstfJK5Xy4Jr5WyqgrQ5ar78LTngz97X+/GTVQbvHslWpuZxm09MmOr5mxQI4iLYvNC
	3DrQREyQNSvSWSztV8viNlTQkNnfoa/bNlMy7m4DYj2UJGiMpXMEWaZr9h36IuXz5y4qej
	U6uh95bSral4zblXOOs9Ef34op54GzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-JVU-TLnQOryvToG3kpHZIw-1; Thu, 03 Mar 2022 08:06:05 -0500
X-MC-Unique: JVU-TLnQOryvToG3kpHZIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2F5883DBC4;
	Thu,  3 Mar 2022 13:06:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E05383288;
	Thu,  3 Mar 2022 13:06:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D2365E20C;
	Thu,  3 Mar 2022 13:06:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 223D61D0019424 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Mar 2022 08:06:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 390E183292; Thu,  3 Mar 2022 13:06:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3003A83289;
	Thu,  3 Mar 2022 13:05:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Date: Thu, 03 Mar 2022 13:05:18 +0000
Message-ID: <164631271818.3677819.29893671575083538.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Tested-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/164630854858.3665356.17419701804248490708.stgit@warthog.procyon.org.uk # v1
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

