Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3FF7C89B5
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Oct 2023 18:05:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697213147;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O4WZEFrWUfe+FhB87D5LIT3EGG1PKDHHy6iQUL+MzI8=;
	b=B1WuBR3VB5ohTxP5kpcfySw0Ya6Fj+Y3wHuvxrfbCRoRVdthXpjaNTt05xgQ0KKwk3JyeR
	AsTKOpLB4jf2HIpFVauqkS4v/v/k/f67HJbHAz2K4C+s6cEBy3nXIPMu6rNctKMxqbfJVB
	O61LzjBQO+FgB6WWKPEdK4Vh6W414ew=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-nzgNNxgePLaXXYQOLXwudA-1; Fri, 13 Oct 2023 12:05:44 -0400
X-MC-Unique: nzgNNxgePLaXXYQOLXwudA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C559285A5BE;
	Fri, 13 Oct 2023 16:05:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA206492BFA;
	Fri, 13 Oct 2023 16:05:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9B41819465A2;
	Fri, 13 Oct 2023 16:05:43 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 032A11946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Oct 2023 16:05:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E9FB11C06536; Fri, 13 Oct 2023 16:05:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C8361C060DF;
 Fri, 13 Oct 2023 16:05:39 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Date: Fri, 13 Oct 2023 17:03:50 +0100
Message-ID: <20231013160423.2218093-22-dhowells@redhat.com>
In-Reply-To: <20231013160423.2218093-1-dhowells@redhat.com>
References: <20231013160423.2218093-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Subject: [Linux-cachefs] [RFC PATCH 21/53] netfs: Make the refcounting of
 netfs_begin_read() easier to use
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 netdev@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com, linux-mm@kvack.org,
 Marc Dionne <marc.dionne@auristor.com>, v9fs@lists.linux.dev,
 Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
 Christian Brauner <christian@brauner.io>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make the refcounting of netfs_begin_read() easier to use by not eating the
caller's ref on the netfs_io_request it's given.  This makes it easier to
use when we need to look in the request struct after.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_read.c     |  6 +++++-
 fs/netfs/io.c                | 28 +++++++++++++---------------
 include/trace/events/netfs.h |  9 +++++----
 3 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 3b7eb706f2fe..05824f73cfc7 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -217,6 +217,7 @@ void netfs_readahead(struct readahead_control *ractl)
 		;
 
 	netfs_begin_read(rreq, false);
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
 	return;
 
 cleanup_free:
@@ -267,7 +268,9 @@ int netfs_read_folio(struct file *file, struct folio *folio)
 	iov_iter_xarray(&rreq->iter, ITER_DEST, &mapping->i_pages,
 			rreq->start, rreq->len);
 
-	return netfs_begin_read(rreq, true);
+	ret = netfs_begin_read(rreq, true);
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
+	return ret;
 
 discard:
 	netfs_put_request(rreq, false, netfs_rreq_trace_put_discard);
@@ -436,6 +439,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
 	ret = netfs_begin_read(rreq, true);
 	if (ret < 0)
 		goto error;
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
 
 have_folio:
 	ret = folio_wait_fscache_killable(folio);
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index c80b8eed1209..1795f8679be9 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -362,6 +362,7 @@ static void netfs_rreq_assess(struct netfs_io_request *rreq, bool was_async)
 
 	netfs_rreq_unlock_folios(rreq);
 
+	trace_netfs_rreq(rreq, netfs_rreq_trace_wake_ip);
 	clear_bit_unlock(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
 	wake_up_bit(&rreq->flags, NETFS_RREQ_IN_PROGRESS);
 
@@ -657,7 +658,6 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 
 	if (rreq->len == 0) {
 		pr_err("Zero-sized read [R=%x]\n", rreq->debug_id);
-		netfs_put_request(rreq, false, netfs_rreq_trace_put_zero_len);
 		return -EIO;
 	}
 
@@ -669,12 +669,10 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 
 	INIT_WORK(&rreq->work, netfs_rreq_work);
 
-	if (sync)
-		netfs_get_request(rreq, netfs_rreq_trace_get_hold);
-
 	/* Chop the read into slices according to what the cache and the netfs
 	 * want and submit each one.
 	 */
+	netfs_get_request(rreq, netfs_rreq_trace_get_for_outstanding);
 	atomic_set(&rreq->nr_outstanding, 1);
 	io_iter = rreq->io_iter;
 	do {
@@ -684,25 +682,25 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 	} while (rreq->submitted < rreq->len);
 
 	if (sync) {
-		/* Keep nr_outstanding incremented so that the ref always belongs to
-		 * us, and the service code isn't punted off to a random thread pool to
-		 * process.
+		/* Keep nr_outstanding incremented so that the ref always
+		 * belongs to us, and the service code isn't punted off to a
+		 * random thread pool to process.  Note that this might start
+		 * further work, such as writing to the cache.
 		 */
-		for (;;) {
-			wait_var_event(&rreq->nr_outstanding,
-				       atomic_read(&rreq->nr_outstanding) == 1);
+		wait_var_event(&rreq->nr_outstanding,
+			       atomic_read(&rreq->nr_outstanding) == 1);
+		if (atomic_dec_and_test(&rreq->nr_outstanding))
 			netfs_rreq_assess(rreq, false);
-			if (!test_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags))
-				break;
-			cond_resched();
-		}
+
+		trace_netfs_rreq(rreq, netfs_rreq_trace_wait_ip);
+		wait_on_bit(&rreq->flags, NETFS_RREQ_IN_PROGRESS,
+			    TASK_UNINTERRUPTIBLE);
 
 		ret = rreq->error;
 		if (ret == 0 && rreq->submitted < rreq->len) {
 			trace_netfs_failure(rreq, NULL, ret, netfs_fail_short_read);
 			ret = -EIO;
 		}
-		netfs_put_request(rreq, false, netfs_rreq_trace_put_hold);
 	} else {
 		/* If we decrement nr_outstanding to 0, the ref belongs to us. */
 		if (atomic_dec_and_test(&rreq->nr_outstanding))
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 4ea4e34d279f..6daadf2aac8a 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -34,7 +34,9 @@
 	EM(netfs_rreq_trace_free,		"FREE   ")	\
 	EM(netfs_rreq_trace_resubmit,		"RESUBMT")	\
 	EM(netfs_rreq_trace_unlock,		"UNLOCK ")	\
-	E_(netfs_rreq_trace_unmark,		"UNMARK ")
+	EM(netfs_rreq_trace_unmark,		"UNMARK ")	\
+	EM(netfs_rreq_trace_wait_ip,		"WAIT-IP")	\
+	E_(netfs_rreq_trace_wake_ip,		"WAKE-IP")
 
 #define netfs_sreq_sources					\
 	EM(NETFS_FILL_WITH_ZEROES,		"ZERO")		\
@@ -65,14 +67,13 @@
 	E_(netfs_fail_prepare_write,		"prep-write")
 
 #define netfs_rreq_ref_traces					\
-	EM(netfs_rreq_trace_get_hold,		"GET HOLD   ")	\
+	EM(netfs_rreq_trace_get_for_outstanding,"GET OUTSTND")	\
 	EM(netfs_rreq_trace_get_subreq,		"GET SUBREQ ")	\
 	EM(netfs_rreq_trace_put_complete,	"PUT COMPLT ")	\
 	EM(netfs_rreq_trace_put_discard,	"PUT DISCARD")	\
 	EM(netfs_rreq_trace_put_failed,		"PUT FAILED ")	\
-	EM(netfs_rreq_trace_put_hold,		"PUT HOLD   ")	\
+	EM(netfs_rreq_trace_put_return,		"PUT RETURN ")	\
 	EM(netfs_rreq_trace_put_subreq,		"PUT SUBREQ ")	\
-	EM(netfs_rreq_trace_put_zero_len,	"PUT ZEROLEN")	\
 	E_(netfs_rreq_trace_new,		"NEW        ")
 
 #define netfs_sreq_ref_traces					\
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

