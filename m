Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5449842029C
	for <lists+linux-cachefs@lfdr.de>; Sun,  3 Oct 2021 18:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633277664;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2IinfSvtKvFl/IzVzMM87iJc+KsDP0XJ4oin5eVIacM=;
	b=FHzzBqSwAYU4OgynkNR93IP33/KAMeZEyLRO+/MDzzj4lYoht8srHcmQ6aBRAGHAtuH4aJ
	dTfbnOUc5DyMVtLrqECQl7siakwNthkyXMPQ7VVjoAATgUGJa5WYxafU/MvAxqd3Hno3by
	dehDwX3jJU5y51i671x9aQDveULpefM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-iN9DlKT1Mb6xBMQhSNSaNg-1; Sun, 03 Oct 2021 12:14:22 -0400
X-MC-Unique: iN9DlKT1Mb6xBMQhSNSaNg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97EB0835DE1;
	Sun,  3 Oct 2021 16:14:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EC58652A0;
	Sun,  3 Oct 2021 16:14:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF7624E58F;
	Sun,  3 Oct 2021 16:14:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 193GEBQ7012301 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 3 Oct 2021 12:14:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 259BB5C3E0; Sun,  3 Oct 2021 16:14:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0C285C1BB;
	Sun,  3 Oct 2021 16:14:10 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: dhowells@redhat.com
Date: Sun,  3 Oct 2021 12:14:00 -0400
Message-Id: <1633277640-2332-2-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1633277640-2332-1-git-send-email-dwysocha@redhat.com>
References: <1633277640-2332-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 1/1] cachefiles: Fix oops with
	cachefiles_cull() due to NULL object
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

When cachefiles_cull() calls cachefiles_bury_object(), it passes
a NULL object.  When this occurs, either trace_cachefiles_unlink()
or trace_cachefiles_rename() may oops due to the NULL object.
Check for NULL object in the tracepoint and if so, set debug_id
to MAX_UINT as was done in 2908f5e101e3.

The following oops was seen with xfstests generic/100.
BUG: kernel NULL pointer dereference, address: 0000000000000010
...
RIP: 0010:trace_event_raw_event_cachefiles_unlink+0x4e/0xa0 [cachefiles]
...
 Call Trace:
   cachefiles_bury_object+0x242/0x430 [cachefiles]
   ? __vfs_removexattr_locked+0x10f/0x150
   ? vfs_removexattr+0x51/0xd0
   cachefiles_cull+0x84/0x120 [cachefiles]
   cachefiles_daemon_cull+0xd1/0x120 [cachefiles]
   cachefiles_daemon_write+0x158/0x190 [cachefiles]
   vfs_write+0xbc/0x260
   ksys_write+0x4f/0xc0
   do_syscall_64+0x3b/0x90

The following oops was seen with xfstests generic/290.
BUG: kernel NULL pointer dereference, address: 0000000000000010
...
RIP: 0010:trace_event_raw_event_cachefiles_rename+0x54/0xa0 [cachefiles]
...
Call Trace:
  cachefiles_bury_object+0x35c/0x430 [cachefiles]
  cachefiles_cull+0x84/0x120 [cachefiles]
  cachefiles_daemon_cull+0xd1/0x120 [cachefiles]
  cachefiles_daemon_write+0x158/0x190 [cachefiles]
  vfs_write+0xbc/0x260
  ksys_write+0x4f/0xc0
  do_syscall_64+0x3b/0x90

Fixes: 2908f5e101e3 ("fscache: Add a cookie debug ID and use that in traces")
Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 include/trace/events/cachefiles.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index 695bfdbfdcad..920b6a303d60 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -178,7 +178,7 @@ enum cachefiles_obj_ref_trace {
 			     ),
 
 	    TP_fast_assign(
-		    __entry->obj	= obj->fscache.debug_id;
+		    __entry->obj	= obj ? obj->fscache.debug_id : UINT_MAX;
 		    __entry->de		= de;
 		    __entry->why	= why;
 			   ),
@@ -205,7 +205,7 @@ enum cachefiles_obj_ref_trace {
 			     ),
 
 	    TP_fast_assign(
-		    __entry->obj	= obj->fscache.debug_id;
+		    __entry->obj	= obj ? obj->fscache.debug_id : UINT_MAX;
 		    __entry->de		= de;
 		    __entry->to		= to;
 		    __entry->why	= why;
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

