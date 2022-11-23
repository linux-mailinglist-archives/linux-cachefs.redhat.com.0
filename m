Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 92385635880
	for <lists+linux-cachefs@lfdr.de>; Wed, 23 Nov 2022 10:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669197526;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cSUF0WICXJZgk3j5it2gEpO4uWGNNx3DXGGaVtNAdYk=;
	b=PubhCf+85OIw41qVp7xve3BUQXaUgne7GAeG1DzwTs4uasKC2cM3h7jQvwiSOOPyybypA1
	xO+uAZw0NIAdQfSc7fkIlqr/MzsQr7GkoUEaB0cnx3GOfb8NUswZvOvLetdgJIwyBu6aHx
	eRVhF697+I3gmk3wAedvnwfiJOO3Pec=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-k_gfpZ5aOXa0CEdJ3R7Nxw-1; Wed, 23 Nov 2022 04:58:42 -0500
X-MC-Unique: k_gfpZ5aOXa0CEdJ3R7Nxw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5009B1C05B06;
	Wed, 23 Nov 2022 09:58:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46D6540C2086;
	Wed, 23 Nov 2022 09:58:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1C42F194658D;
	Wed, 23 Nov 2022 09:58:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A84241946587 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 23 Nov 2022 09:58:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 743E04A9256; Wed, 23 Nov 2022 09:58:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CC554A9254
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 09:58:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51B41101A56C
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 09:58:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-qoy25IHRPYSNy57C8ZOOMw-1; Wed, 23 Nov 2022 04:58:38 -0500
X-MC-Unique: qoy25IHRPYSNy57C8ZOOMw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 33CE861B44;
 Wed, 23 Nov 2022 09:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE34C433D6;
 Wed, 23 Nov 2022 09:50:33 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Date: Wed, 23 Nov 2022 09:50:25 +0100
Message-Id: <20221123084633.725996799@linuxfoundation.org>
In-Reply-To: <20221123084625.457073469@linuxfoundation.org>
References: <20221123084625.457073469@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH 6.0 180/314] netfs: Fix missing xas_retry()
 calls in xarray iteration
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
Cc: Sasha Levin <sashal@kernel.org>, George Law <glaw@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Layton <jlayton@kernel.org>, patches@lists.linux.dev,
 Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org,
 linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: David Howells <dhowells@redhat.com>

[ Upstream commit 7e043a80b5dae5c2d2cf84031501de7827fd6c00 ]

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

Changes:
========
ver #2)
 - Changed an unsigned int to a size_t to reduce the likelihood of an
   overflow as per Willy's suggestion.
 - Added an additional patch to fix the maths.

Fixes: 3d3c95046742 ("netfs: Provide readahead and readpage netfs helpers")
Reported-by: George Law <glaw@redhat.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
cc: Matthew Wilcox <willy@infradead.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
Link: https://lore.kernel.org/r/166749229733.107206.17482609105741691452.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/166757987929.950645.12595273010425381286.stgit@warthog.procyon.org.uk/ # v2
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/netfs/buffered_read.c | 9 +++++++--
 fs/netfs/io.c            | 3 +++
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
2.35.1



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

