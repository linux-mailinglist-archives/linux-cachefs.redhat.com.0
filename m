Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 126157A26C4
	for <lists+linux-cachefs@lfdr.de>; Fri, 15 Sep 2023 21:00:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694804449;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+BYehNi0qapw9AwCZyRVmt6RSPZFuHkYXMNupt7q/yY=;
	b=fgrE/ujzSCBD0uQA7w5ZpKNnHYF3n4WLG7DWMCkwqDMVgSWHTu3hMmXyOo9arOGGfoW6hO
	LVy3oRnmRa+V5KWoezBYsOZYYd7D5MlxFMLaA1GXi8uluzVzBB0FE1u/nYLgTEDMz2kK5R
	v1l5SuAwpVfT56I3CbqhpkTCovYXASg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-KxRCcfbDPdyXQBLGwZ1JGw-1; Fri, 15 Sep 2023 15:00:45 -0400
X-MC-Unique: KxRCcfbDPdyXQBLGwZ1JGw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDEFB1859199;
	Fri, 15 Sep 2023 19:00:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C677340C6E7B;
	Fri, 15 Sep 2023 19:00:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9337B19466DF;
	Fri, 15 Sep 2023 19:00:34 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 22C79194658F for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 15 Sep 2023 18:57:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 10BD240C200D; Fri, 15 Sep 2023 18:57:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.32.158])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEDB240C2009;
 Fri, 15 Sep 2023 18:57:04 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: David Howells <dhowells@redhat.com>
Date: Fri, 15 Sep 2023 14:57:04 -0400
Message-Id: <20230915185704.1082982-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

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

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2210612
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
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
2.39.3

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

