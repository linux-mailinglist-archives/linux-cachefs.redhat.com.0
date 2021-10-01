Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 566CC41EFAD
	for <lists+linux-cachefs@lfdr.de>; Fri,  1 Oct 2021 16:37:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633099065;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bv3hSIxuF+aQy6qR4YRSrujV2tLSO3nnoI2bNqMc39A=;
	b=fhwStUtRCF1aTyNUyrcXkZP0tTTU1I0/2uAEqOx5CIB1pZDttB3W0kKpR0scBYgJr0v90P
	9cWMW8JyKrrcS0tlrWoSeidGb+jTl2FgzW/BOo6Rqz8BMm0nMRVtZpLucaWUbtNVwoH0uA
	Iz84mvYTe5M5tQVSl/hJogOHM3qTNLc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-XogM-GHsMi-DIQhGLP2bfw-1; Fri, 01 Oct 2021 10:37:44 -0400
X-MC-Unique: XogM-GHsMi-DIQhGLP2bfw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17E3D8015C7;
	Fri,  1 Oct 2021 14:37:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8CE35DA61;
	Fri,  1 Oct 2021 14:37:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E86604E58F;
	Fri,  1 Oct 2021 14:37:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 191EbcWR017806 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 1 Oct 2021 10:37:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6681760BD8; Fri,  1 Oct 2021 14:37:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C23A652A4;
	Fri,  1 Oct 2021 14:37:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Date: Fri, 01 Oct 2021 15:37:31 +0100
Message-ID: <163309905120.80461.1932497502647013780.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH] cachefiles: Fix oops in
 trace_cachefiles_mark_buried due to NULL object
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

From: Dave Wysochanski <dwysocha@redhat.com>

In cachefiles_mark_object_buried, the dentry in question may
not have an owner, and thus our cachefiles_object pointer
may be NULL when calling the tracepoint, in which case we
will also not have a valid debug_id to print in the tracepoint.
Check for NULL object in the tracepoint and if so, just set
debug_id to MAX_UINT as was done in 2908f5e101e3.

This fixes the following oops:

    FS-Cache: Cache "mycache" added (type cachefiles)
    CacheFiles: File cache on vdc registered
    ...
    Workqueue: fscache_object fscache_object_work_func [fscache]
    RIP: 0010:trace_event_raw_event_cachefiles_mark_buried+0x4e/0xa0 [cachefiles]
    ....
    Call Trace:
     cachefiles_mark_object_buried+0xa5/0xb0 [cachefiles]
     cachefiles_bury_object+0x270/0x430 [cachefiles]
     ? kfree+0xaa/0x3a0
     ? vfs_getxattr+0x15a/0x180
     cachefiles_walk_to_object+0x195/0x9c0 [cachefiles]
     ? trace_event_buffer_commit+0x61/0x220
     cachefiles_lookup_object+0x5a/0xc0 [cachefiles]
     fscache_look_up_object+0xd7/0x160 [fscache]
     fscache_object_work_func+0xb2/0x340 [fscache]
     process_one_work+0x1f1/0x390
     worker_thread+0x53/0x3e0
     ? process_one_work+0x390/0x390
     kthread+0x127/0x150
     ? set_kthread_struct+0x40/0x40
     ret_from_fork+0x22/0x30

Fixes: 2908f5e101e3 ("fscache: Add a cookie debug ID and use that in traces")
Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 include/trace/events/cachefiles.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index 9a448fe9355d..695bfdbfdcad 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -305,7 +305,7 @@ TRACE_EVENT(cachefiles_mark_buried,
 			     ),
 
 	    TP_fast_assign(
-		    __entry->obj	= obj->fscache.debug_id;
+		    __entry->obj	= obj ? obj->fscache.debug_id : UINT_MAX;
 		    __entry->de		= de;
 		    __entry->why	= why;
 			   ),


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

