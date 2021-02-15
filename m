Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 942E332284C
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Feb 2021 10:59:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614074388;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pu1i+aFyT1XyckvhHF2H8sAuqEUUSIfFp4cbRtDTaoQ=;
	b=giWplH+OD1cVgSL5dJGdO1aQmhNZJNwLPDlv2p7ZYDND5IKLQU6JsfDHsI8QbaNYzE0zJ8
	2t+E30ej1HDUVZVtbk0gc3yCCnDFuJpQALNaZMf0vdQIjFbWfrcxIvBWnrVdnBVsaqCmVR
	QFxWAwt2j95VO98BbmCnETHzqwIsu+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-a7SGdK-aPAeYxZB5VQjvzQ-1; Tue, 23 Feb 2021 04:59:46 -0500
X-MC-Unique: a7SGdK-aPAeYxZB5VQjvzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BFEA6A2B2;
	Tue, 23 Feb 2021 09:59:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06D5219C45;
	Tue, 23 Feb 2021 09:59:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E478218077C0;
	Tue, 23 Feb 2021 09:59:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11FMkWG1012049 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 15 Feb 2021 17:46:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1B2DC7048B; Mon, 15 Feb 2021 22:46:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com
	[10.10.119.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 187641F0;
	Mon, 15 Feb 2021 22:46:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
To: Trond Myklebust <trondmy@hammerspace.com>
From: David Howells <dhowells@redhat.com>
MIME-Version: 1.0
Date: Mon, 15 Feb 2021 22:46:23 +0000
Message-ID: <1376938.1613429183@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11FMkWG1012049
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 23 Feb 2021 04:59:25 -0500
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH 34/33] netfs: Use in_interrupt() not
	in_softirq()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1376937.1613429183.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The in_softirq() in netfs_rreq_terminated() works fine for the cache being
on a normal disk, as the completion handlers may get called in softirq
context, but for an NVMe drive, the completion handler may get called in
IRQ context.

Fix to use in_interrupt() instead of in_softirq() throughout the read
helpers, particularly when deciding whether to punt code that might sleep
off to a worker thread.

The symptom involves warnings like the following appearing and the kernel
hanging:

 WARNING: CPU: 0 PID: 0 at kernel/softirq.c:175 __local_bh_enable_ip+0x35/0x50
 ...
 RIP: 0010:__local_bh_enable_ip+0x35/0x50
 ...
 Call Trace:
  <IRQ>
  rxrpc_kernel_begin_call+0x7d/0x1b0 [rxrpc]
  ? afs_rx_new_call+0x40/0x40 [kafs]
  ? afs_alloc_call+0x28/0x120 [kafs]
  afs_make_call+0x120/0x510 [kafs]
  ? afs_rx_new_call+0x40/0x40 [kafs]
  ? afs_alloc_flat_call+0xba/0x100 [kafs]
  ? __kmalloc+0x167/0x2f0
  ? afs_alloc_flat_call+0x9b/0x100 [kafs]
  afs_wait_for_operation+0x2d/0x200 [kafs]
  afs_do_sync_operation+0x16/0x20 [kafs]
  afs_req_issue_op+0x8c/0xb0 [kafs]
  netfs_rreq_assess+0x125/0x7d0 [netfs]
  ? cachefiles_end_operation+0x40/0x40 [cachefiles]
  netfs_subreq_terminated+0x117/0x220 [netfs]
  cachefiles_read_complete+0x21/0x60 [cachefiles]
  iomap_dio_bio_end_io+0xdd/0x110
  blk_update_request+0x20a/0x380
  blk_mq_end_request+0x1c/0x120
  nvme_process_cq+0x159/0x1f0 [nvme]
  nvme_irq+0x10/0x20 [nvme]
  __handle_irq_event_percpu+0x37/0x150
  handle_irq_event+0x49/0xb0
  handle_edge_irq+0x7c/0x200
  asm_call_irq_on_stack+0xf/0x20
  </IRQ>
  common_interrupt+0xad/0x120
  asm_common_interrupt+0x1e/0x40
 ...

Reported-by: Marc Dionne <marc.dionne@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Matthew Wilcox <willy@infradead.org>
cc: linux-mm@kvack.org
cc: linux-cachefs@redhat.com
cc: linux-afs@lists.infradead.org
cc: linux-nfs@vger.kernel.org
cc: linux-cifs@vger.kernel.org
cc: ceph-devel@vger.kernel.org
cc: v9fs-developer@lists.sourceforge.net
cc: linux-fsdevel@vger.kernel.org
---
 read_helper.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 9191a3617d91..db582008b4bd 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -96,7 +96,7 @@ static void netfs_free_read_request(struct work_struct *work)
 static void netfs_put_read_request(struct netfs_read_request *rreq)
 {
 	if (refcount_dec_and_test(&rreq->usage)) {
-		if (in_softirq()) {
+		if (in_interrupt()) {
 			rreq->work.func = netfs_free_read_request;
 			if (!queue_work(system_unbound_wq, &rreq->work))
 				BUG();
@@ -353,7 +353,7 @@ static void netfs_rreq_write_to_cache_work(struct work_struct *work)
 
 static void netfs_rreq_write_to_cache(struct netfs_read_request *rreq)
 {
-	if (in_softirq()) {
+	if (in_interrupt()) {
 		rreq->work.func = netfs_rreq_write_to_cache_work;
 		if (!queue_work(system_unbound_wq, &rreq->work))
 			BUG();
@@ -479,7 +479,7 @@ static bool netfs_rreq_perform_resubmissions(struct netfs_read_request *rreq)
 {
 	struct netfs_read_subrequest *subreq;
 
-	WARN_ON(in_softirq());
+	WARN_ON(in_interrupt());
 
 	trace_netfs_rreq(rreq, netfs_rreq_trace_resubmit);
 
@@ -577,7 +577,7 @@ static void netfs_rreq_work(struct work_struct *work)
 static void netfs_rreq_terminated(struct netfs_read_request *rreq)
 {
 	if (test_bit(NETFS_RREQ_INCOMPLETE_IO, &rreq->flags) &&
-	    in_softirq()) {
+	    in_interrupt()) {
 		if (!queue_work(system_unbound_wq, &rreq->work))
 			BUG();
 	} else {

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

