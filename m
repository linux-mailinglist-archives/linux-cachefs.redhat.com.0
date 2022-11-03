Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDBC618A98
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Nov 2022 22:33:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667511217;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C4r58L1NDduRi3gaSDZnfjGVkWvDsgNfKIE3URDfmmI=;
	b=E+o37eOWFSIaMvgrX+WO2lkXJerilwtNeK2FNFrpCVbUREmDhedftzz4FenkGQUq0Fitek
	TrCMMxCC4xQZvX850N6JbxpI3xgFvjQhgYkge5IxojGJG9WDJp5GQTdeHwBYsQ175PbFfk
	rmYc1cq+fK5MFnQc06DEgkbGCJE0BUg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-Dbss-YyDNZOY1dqIImU9EQ-1; Thu, 03 Nov 2022 17:33:34 -0400
X-MC-Unique: Dbss-YyDNZOY1dqIImU9EQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEE45101A528;
	Thu,  3 Nov 2022 21:33:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 811AC2166B2E;
	Thu,  3 Nov 2022 21:33:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4D49C19465B2;
	Thu,  3 Nov 2022 21:33:31 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DC0881946594 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  3 Nov 2022 21:33:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CFEC91121320; Thu,  3 Nov 2022 21:33:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E94A8112131B;
 Thu,  3 Nov 2022 21:33:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: willy@infradead.org
Date: Thu, 03 Nov 2022 21:33:28 +0000
Message-ID: <166751120808.117671.15797010154703575921.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.5
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Linux-cachefs] [PATCH] netfs: Fix missing xas_retry() calls in
 xarray iteration
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
Cc: George Law <glaw@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

netfslib has a number of places in which it performs iteration of an xarray
whilst being under the RCU read lock.  It *should* call xas_retry() as the
first thing inside of the loop and do "continue" if it returns true in case
the xarray walker passed out a special value indicating that the walk needs
to be redone from the root[*].

Fix this by adding the missing retry checks.

[*] I wonder if this should be done inside xas_find(), xas_next_node() and
    suchlike, but I'm told that's not an simple change to effect.

This can cause an oops like that below.  Note the faulting address - this
is an internal value (|0x2) returned from xarray.

BUG: kernel NULL pointer dereference, address: 0000000000000402
...
RIP: 0010:netfs_rreq_unlock+0xef/0x380 [netfs]
...
Call Trace:
 netfs_rreq_assess+0xa6/0x240 [netfs]
 netfs_readpage+0x173/0x3b0 [netfs]
 ? init_wait_var_entry+0x50/0x50
 filemap_read_page+0x33/0xf0
 filemap_get_pages+0x2f2/0x3f0
 filemap_read+0xaa/0x320
 ? do_filp_open+0xb2/0x150
 ? rmqueue+0x3be/0xe10
 ceph_read_iter+0x1fe/0x680 [ceph]
 ? new_sync_read+0x115/0x1a0
 new_sync_read+0x115/0x1a0
 vfs_read+0xf3/0x180
 ksys_read+0x5f/0xe0
 do_syscall_64+0x38/0x90
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Fixes: 3d3c95046742 ("netfs: Provide readahead and readpage netfs helpers")
Reported-by: George Law <glaw@redhat.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: Matthew Wilcox <willy@infradead.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
---

 fs/netfs/buffered_read.c |    9 +++++++--
 fs/netfs/io.c            |    3 +++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 0ce535852151..baf668fb4315 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -46,10 +46,15 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 
 	rcu_read_lock();
 	xas_for_each(&xas, folio, last_page) {
-		unsigned int pgpos = (folio_index(folio) - start_page) * PAGE_SIZE;
-		unsigned int pgend = pgpos + folio_size(folio);
+		unsigned int pgpos, pgend;
 		bool pg_failed = false;
 
+		if (xas_retry(&xas, folio))
+			continue;
+
+		pgpos = (folio_index(folio) - start_page) * PAGE_SIZE;
+		pgend = pgpos + folio_size(folio);
+
 		for (;;) {
 			if (!subreq) {
 				pg_failed = true;
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 428925899282..e374767d1b68 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -121,6 +121,9 @@ static void netfs_rreq_unmark_after_write(struct netfs_io_request *rreq,
 		XA_STATE(xas, &rreq->mapping->i_pages, subreq->start / PAGE_SIZE);
 
 		xas_for_each(&xas, folio, (subreq->start + subreq->len - 1) / PAGE_SIZE) {
+			if (xas_retry(&xas, folio))
+				continue;
+
 			/* We might have multiple writes from the same huge
 			 * folio, but we mustn't unlock a folio more than once.
 			 */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

