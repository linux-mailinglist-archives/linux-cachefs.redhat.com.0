Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E597A4A8A
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Sep 2023 15:17:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695043046;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UmI7wESrsgvs9KpZbZM3SFsCWSs/0LwPhRFV6h/vMl4=;
	b=A7e9nnA7XnETV1uAbimu2aKPoAcBiJw2u+QR9XBJL0mlRWkeX12LLld8mNXSEjrLws5mYs
	nkMlSXxLMf09F/eTzPu3UFopjvtW+hVMqKdvZ8FpXZ6aNGj4AM5Bcbb3i8ALb/gXH5g8nP
	Bn6Qnki9z2UujrzxsjUgwGDPdcKw0KY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-0h3TGvmUPG2jN95SML-wOA-1; Mon, 18 Sep 2023 09:17:23 -0400
X-MC-Unique: 0h3TGvmUPG2jN95SML-wOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF9011C0514D;
	Mon, 18 Sep 2023 13:17:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16B4640C2064;
	Mon, 18 Sep 2023 13:17:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7D7A11946594;
	Mon, 18 Sep 2023 13:17:14 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E4FED194658C for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 18 Sep 2023 13:17:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 90721C154CB; Mon, 18 Sep 2023 13:17:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96ADAC158BA;
 Mon, 18 Sep 2023 13:17:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
MIME-Version: 1.0
Date: Mon, 18 Sep 2023 14:17:11 +0100
Message-ID: <3993457.1695043031@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Linux-cachefs] [PATCH v2] netfs: Only call folio_start_fscache()
 one time for each folio
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-nfs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3993456.1695043031.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Could you apply this please?

Thanks,
David
---
From: Dave Wysochanski <dwysocha@redhat.com>

If a network filesystem using netfs implements a clamp_length()
function, it can set subrequest lengths smaller than a page size.
When we loop through the folios in netfs_rreq_unlock_folios() to
set any folios to be written back, we need to make sure we only
call folio_start_fscache() once for each folio.  Otherwise,
this simple testcase:

  mount -o fsc,rsize=1024,wsize=1024 127.0.0.1:/export /mnt/nfs
  dd if=/dev/zero of=/mnt/nfs/file.bin bs=4096 count=1
  1+0 records in
  1+0 records out
  4096 bytes (4.1 kB, 4.0 KiB) copied, 0.0126359 s, 324 kB/s
  echo 3 > /proc/sys/vm/drop_caches
  cat /mnt/nfs/file.bin > /dev/null

will trigger an oops similar to the following:

...
 page dumped because: VM_BUG_ON_FOLIO(folio_test_private_2(folio))
 ------------[ cut here ]------------
 kernel BUG at include/linux/netfs.h:44!
...
 CPU: 5 PID: 134 Comm: kworker/u16:5 Kdump: loaded Not tainted 6.4.0-rc5
...
 RIP: 0010:netfs_rreq_unlock_folios+0x68e/0x730 [netfs]
...
 Call Trace:
  <TASK>
  netfs_rreq_assess+0x497/0x660 [netfs]
  netfs_subreq_terminated+0x32b/0x610 [netfs]
  nfs_netfs_read_completion+0x14e/0x1a0 [nfs]
  nfs_read_completion+0x2f9/0x330 [nfs]
  rpc_free_task+0x72/0xa0 [sunrpc]
  rpc_async_release+0x46/0x70 [sunrpc]
  process_one_work+0x3bd/0x710
  worker_thread+0x89/0x610
  kthread+0x181/0x1c0
  ret_from_fork+0x29/0x50

Fixes: 3d3c95046742 ("netfs: Provide readahead and readpage netfs helpers"
Link: https://bugzilla.redhat.com/show_bug.cgi?id=2210612
Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Link: https://lore.kernel.org/r/20230608214137.856006-1-dwysocha@redhat.com/ # v1
Link: https://lore.kernel.org/r/20230915185704.1082982-1-dwysocha@redhat.com/ # v2
---
 fs/netfs/buffered_read.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 3404707ddbe7..2cd3ccf4c439 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -47,12 +47,14 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 	xas_for_each(&xas, folio, last_page) {
 		loff_t pg_end;
 		bool pg_failed = false;
+		bool folio_started;
 
 		if (xas_retry(&xas, folio))
 			continue;
 
 		pg_end = folio_pos(folio) + folio_size(folio) - 1;
 
+		folio_started = false;
 		for (;;) {
 			loff_t sreq_end;
 
@@ -60,8 +62,10 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 				pg_failed = true;
 				break;
 			}
-			if (test_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags))
+			if (!folio_started && test_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags)) {
 				folio_start_fscache(folio);
+				folio_started = true;
+			}
 			pg_failed |= subreq_failed;
 			sreq_end = subreq->start + subreq->len - 1;
 			if (pg_end < sreq_end)
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

