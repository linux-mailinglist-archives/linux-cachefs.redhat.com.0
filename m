Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D858B41E9EA
	for <lists+linux-cachefs@lfdr.de>; Fri,  1 Oct 2021 11:42:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633081356;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4NZdK7EmVMY8esSsjDL+O2gSo2iEqvzJ4OgH40McXv4=;
	b=as3AapfY+lKAWGuRndSdFOMvvVp897oTGLey9m35KYEI+aKvsklk1c2FvGN2PqtxGhqcyt
	tquOHurIO3PoGa/+Ie28fISSSPhb//XYlAwizpFU5sGoaE+ad3WGBO2lsV1LhEyEWmtl83
	zvpGLSerM2QI3D5h6epzSOwhZF9L/64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-CznF8PBuOI-vYau_PEe79Q-1; Fri, 01 Oct 2021 05:42:34 -0400
X-MC-Unique: CznF8PBuOI-vYau_PEe79Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2195B1006AA3;
	Fri,  1 Oct 2021 09:42:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8A196060F;
	Fri,  1 Oct 2021 09:42:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F253E1800B8B;
	Fri,  1 Oct 2021 09:42:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1919gQD8023283 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 1 Oct 2021 05:42:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB76860CA0; Fri,  1 Oct 2021 09:42:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 606A160BF4;
	Fri,  1 Oct 2021 09:42:15 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: dhowells@redhat.com
Date: Fri,  1 Oct 2021 05:42:08 -0400
Message-Id: <1633081328-26339-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
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
MIME-Version: 1.0
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In cachefiles_mark_object_buried, the dentry in question may
not have an owner, and thus our cachefiles_object pointer
may be NULL when calling the tracepoint, in which case we
will also not have a valid debug_id to print in the tracepoint.
Check for NULL object in the tracepoint and if so, just set
debug_id to MAX_UINT as was done in 2908f5e101e3.

This fixes the following oops:
[  115.179145] FS-Cache: Cache "mycache" added (type cachefiles)
[  115.182243] CacheFiles: File cache on vdc registered
[  128.333709] t1_rsize_lt_rea (3600): drop_caches: 3
[  128.401940] BUG: kernel NULL pointer dereference, address: 0000000000000010
[  128.404908] #PF: supervisor read access in kernel mode
[  128.407073] #PF: error_code(0x0000) - not-present page
[  128.409738] PGD 0 P4D 0
[  128.410960] Oops: 0000 [#1] SMP PTI
[  128.411777] CPU: 1 PID: 178 Comm: kworker/u16:5 Kdump: loaded Not tainted 5.15.0-rc3 #61
[  128.413182] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-4.fc34 04/01/2014
[  128.414641] Workqueue: fscache_object fscache_object_work_func [fscache]
[  128.415825] RIP: 0010:trace_event_raw_event_cachefiles_mark_buried+0x4e/0xa0 [cachefiles]
[  128.417565] Code: 41 f6 c6 80 75 47 41 f6 c6 40 75 34 41 f7 c6 00 02 00 00 75 4b ba 20 00 00 00 48 89 ee 48 89 e7 e8 27 30 69 d2 48 85 c0 74 16 <41> 8b 55 10 4c 89 60 10 48 89 e7 89 58 18 89 50
08 e8 bc fd 67 d2
[  128.420892] RSP: 0018:ffffaf8d4117fc08 EFLAGS: 00010282
[  128.422032] RAX: ffff949d803b5834 RBX: 0000000000000000 RCX: 0000000000000088
[  128.423348] RDX: ffff949d803b5834 RSI: ffff949d803b5830 RDI: ffff949d803b5830
[  128.424506] RBP: ffff949d84041a50 R08: 0000001ea0136adf R09: ffffaf8d4117fb20
[  128.425656] R10: ffff949d86c78f18 R11: 0000000000000000 R12: ffff949ded1f5780
[  128.426932] R13: 0000000000000000 R14: 0000000000000403 R15: ffff949d887d8664
[  128.428318] FS:  0000000000000000(0000) GS:ffff949ef7c40000(0000) knlGS:0000000000000000
[  128.429761] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  128.430681] CR2: 0000000000000010 CR3: 0000000157404004 CR4: 0000000000770ee0
[  128.431824] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  128.432953] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  128.434061] PKRU: 55555554
[  128.434512] Call Trace:
[  128.434944]  cachefiles_mark_object_buried+0xa5/0xb0 [cachefiles]
[  128.435903]  cachefiles_bury_object+0x270/0x430 [cachefiles]
[  128.436862]  ? kfree+0xaa/0x3a0
[  128.437396]  ? vfs_getxattr+0x15a/0x180
[  128.438038]  cachefiles_walk_to_object+0x195/0x9c0 [cachefiles]
[  128.438984]  ? trace_event_buffer_commit+0x61/0x220
[  128.439822]  cachefiles_lookup_object+0x5a/0xc0 [cachefiles]
[  128.440741]  fscache_look_up_object+0xd7/0x160 [fscache]
[  128.441615]  fscache_object_work_func+0xb2/0x340 [fscache]
[  128.442547]  process_one_work+0x1f1/0x390
[  128.443225]  worker_thread+0x53/0x3e0
[  128.443854]  ? process_one_work+0x390/0x390
[  128.444527]  kthread+0x127/0x150
[  128.445058]  ? set_kthread_struct+0x40/0x40
[  128.445726]  ret_from_fork+0x22/0x30

Fixes: 2908f5e101e3 ("fscache: Add a cookie debug ID and use that in traces")
Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 include/trace/events/cachefiles.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index 9a448fe9355d..695bfdbfdcad 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -305,7 +305,7 @@ enum cachefiles_obj_ref_trace {
 			     ),
 
 	    TP_fast_assign(
-		    __entry->obj	= obj->fscache.debug_id;
+		    __entry->obj	= obj ? obj->fscache.debug_id : UINT_MAX;
 		    __entry->de		= de;
 		    __entry->why	= why;
 			   ),
-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

