Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F224D24E0
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 00:29:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646782152;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YEKJGmYt3ju1+aGiAj6KDQTGGLaEO4UNZ+i9NG0dwss=;
	b=M6VvQe0ysKz3AQZnQtdNjJL65G+iFuSjoh/upKRLgd4brBqtNyD6sPWDhKMyAfXQd8XxNk
	9QbuDqjm6ku7LsJjCgMR5F3uM8fMxnPtRz7Orp3TFmGsePuHUhSQaw06Ux+tCk2nJy12N0
	KPGIsj2B5Or8FAoVVjfLcdlIUb8HW3M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-KGB5RZ-dP1uzaKjlllxVzw-1; Tue, 08 Mar 2022 18:29:09 -0500
X-MC-Unique: KGB5RZ-dP1uzaKjlllxVzw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 761D2101AA45;
	Tue,  8 Mar 2022 23:29:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49C862026987;
	Tue,  8 Mar 2022 23:29:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1A43C195F420;
	Tue,  8 Mar 2022 23:29:08 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 30FDE1932129 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  8 Mar 2022 23:29:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D08F11006917; Tue,  8 Mar 2022 23:29:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B15591006914;
 Tue,  8 Mar 2022 23:29:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Tue, 08 Mar 2022 23:29:02 +0000
Message-ID: <164678214287.1200972.16734134007649832160.stgit@warthog.procyon.org.uk>
In-Reply-To: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
References: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Subject: [Linux-cachefs] [PATCH v2 13/19] netfs: Add a function to
 consolidate beginning a read
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
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 Dominique Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a function to do the steps needed to begin a read request, allowing
this code to be removed from several other functions and consolidated.

Changes
=======
ver #2)
 - Move before the unstaticking patch so that some functions can be left
   static.
 - Set uninitialised return code in netfs_begin_read()[1][2].
 - Fixed a refleak caused by non-removal of a get from netfs_write_begin()
   when the request submission code got moved to netfs_begin_read().

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com

Link: https://lore.kernel.org/r/20220303163826.1120936-1-nathan@kernel.org/ [1]
Link: https://lore.kernel.org/r/20220303235647.1297171-1-colin.i.king@gmail.com/ [2]
Link: https://lore.kernel.org/r/164623004355.3564931.7275693529042495641.stgit@warthog.procyon.org.uk/ # v1
---

 fs/netfs/internal.h          |    2 -
 fs/netfs/objects.c           |    2 -
 fs/netfs/read_helper.c       |  144 +++++++++++++++++++++---------------------
 include/trace/events/netfs.h |    5 +
 4 files changed, 77 insertions(+), 76 deletions(-)

diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 5f9719409f21..937c2465943f 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -39,7 +39,7 @@ static inline void netfs_see_request(struct netfs_io_request *rreq,
  */
 extern unsigned int netfs_debug;
 
-void netfs_rreq_work(struct work_struct *work);
+int netfs_begin_read(struct netfs_io_request *rreq, bool sync);
 
 /*
  * stats.c
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 657b19e60118..82f4d6c4f515 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -35,7 +35,7 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	rreq->i_size	= i_size_read(inode);
 	rreq->debug_id	= atomic_inc_return(&debug_ids);
 	INIT_LIST_HEAD(&rreq->subrequests);
-	INIT_WORK(&rreq->work, netfs_rreq_work);
+	INIT_WORK(&rreq->work, NULL);
 	refcount_set(&rreq->ref, 1);
 	__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
 	if (rreq->netfs_ops->init_request) {
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 73be06c409bb..19d4fe0b4987 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -443,7 +443,7 @@ static void netfs_rreq_assess(struct netfs_io_request *rreq, bool was_async)
 	netfs_rreq_completed(rreq, was_async);
 }
 
-void netfs_rreq_work(struct work_struct *work)
+static void netfs_rreq_work(struct work_struct *work)
 {
 	struct netfs_io_request *rreq =
 		container_of(work, struct netfs_io_request, work);
@@ -688,6 +688,69 @@ static bool netfs_rreq_submit_slice(struct netfs_io_request *rreq,
 	return false;
 }
 
+/*
+ * Begin the process of reading in a chunk of data, where that data may be
+ * stitched together from multiple sources, including multiple servers and the
+ * local cache.
+ */
+int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
+{
+	unsigned int debug_index = 0;
+	int ret;
+
+	_enter("R=%x %llx-%llx",
+	       rreq->debug_id, rreq->start, rreq->start + rreq->len - 1);
+
+	if (rreq->len == 0) {
+		pr_err("Zero-sized read [R=%x]\n", rreq->debug_id);
+		netfs_put_request(rreq, false, netfs_rreq_trace_put_zero_len);
+		return -EIO;
+	}
+
+	rreq->work.func = netfs_rreq_work;
+
+	if (sync)
+		netfs_get_request(rreq, netfs_rreq_trace_get_hold);
+
+	/* Chop the read into slices according to what the cache and the netfs
+	 * want and submit each one.
+	 */
+	atomic_set(&rreq->nr_outstanding, 1);
+	do {
+		if (!netfs_rreq_submit_slice(rreq, &debug_index))
+			break;
+
+	} while (rreq->submitted < rreq->len);
+
+	if (sync) {
+		/* Keep nr_outstanding incremented so that the ref always belongs to
+		 * us, and the service code isn't punted off to a random thread pool to
+		 * process.
+		 */
+		for (;;) {
+			wait_var_event(&rreq->nr_outstanding,
+				       atomic_read(&rreq->nr_outstanding) == 1);
+			netfs_rreq_assess(rreq, false);
+			if (!test_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags))
+				break;
+			cond_resched();
+		}
+
+		ret = rreq->error;
+		if (ret == 0 && rreq->submitted < rreq->len) {
+			trace_netfs_failure(rreq, NULL, ret, netfs_fail_short_read);
+			ret = -EIO;
+		}
+		netfs_put_request(rreq, false, netfs_rreq_trace_put_hold);
+	} else {
+		/* If we decrement nr_outstanding to 0, the ref belongs to us. */
+		if (atomic_dec_and_test(&rreq->nr_outstanding))
+			netfs_rreq_assess(rreq, false);
+		ret = 0;
+	}
+	return ret;
+}
+
 static void netfs_cache_expand_readahead(struct netfs_io_request *rreq,
 					 loff_t *_start, size_t *_len, loff_t i_size)
 {
@@ -750,7 +813,6 @@ void netfs_readahead(struct readahead_control *ractl)
 {
 	struct netfs_io_request *rreq;
 	struct netfs_i_context *ctx = netfs_i_context(ractl->mapping->host);
-	unsigned int debug_index = 0;
 	int ret;
 
 	_enter("%lx,%x", readahead_index(ractl), readahead_count(ractl));
@@ -777,22 +839,13 @@ void netfs_readahead(struct readahead_control *ractl)
 
 	netfs_rreq_expand(rreq, ractl);
 
-	atomic_set(&rreq->nr_outstanding, 1);
-	do {
-		if (!netfs_rreq_submit_slice(rreq, &debug_index))
-			break;
-
-	} while (rreq->submitted < rreq->len);
-
 	/* Drop the refs on the folios here rather than in the cache or
 	 * filesystem.  The locks will be dropped in netfs_rreq_unlock().
 	 */
 	while (readahead_folio(ractl))
 		;
 
-	/* If we decrement nr_outstanding to 0, the ref belongs to us. */
-	if (atomic_dec_and_test(&rreq->nr_outstanding))
-		netfs_rreq_assess(rreq, false);
+	netfs_begin_read(rreq, false);
 	return;
 
 cleanup_free:
@@ -821,7 +874,6 @@ int netfs_readpage(struct file *file, struct page *subpage)
 	struct address_space *mapping = folio->mapping;
 	struct netfs_io_request *rreq;
 	struct netfs_i_context *ctx = netfs_i_context(mapping->host);
-	unsigned int debug_index = 0;
 	int ret;
 
 	_enter("%lx", folio_index(folio));
@@ -836,42 +888,16 @@ int netfs_readpage(struct file *file, struct page *subpage)
 
 	if (ctx->ops->begin_cache_operation) {
 		ret = ctx->ops->begin_cache_operation(rreq);
-		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS) {
-			folio_unlock(folio);
-			goto out;
-		}
+		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
+			goto discard;
 	}
 
 	netfs_stat(&netfs_n_rh_readpage);
 	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
+	return netfs_begin_read(rreq, true);
 
-	netfs_get_request(rreq, netfs_rreq_trace_get_hold);
-
-	atomic_set(&rreq->nr_outstanding, 1);
-	do {
-		if (!netfs_rreq_submit_slice(rreq, &debug_index))
-			break;
-
-	} while (rreq->submitted < rreq->len);
-
-	/* Keep nr_outstanding incremented so that the ref always belongs to us, and
-	 * the service code isn't punted off to a random thread pool to
-	 * process.
-	 */
-	do {
-		wait_var_event(&rreq->nr_outstanding,
-			       atomic_read(&rreq->nr_outstanding) == 1);
-		netfs_rreq_assess(rreq, false);
-	} while (test_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags));
-
-	ret = rreq->error;
-	if (ret == 0 && rreq->submitted < rreq->len) {
-		trace_netfs_failure(rreq, NULL, ret, netfs_fail_short_readpage);
-		ret = -EIO;
-	}
-out:
-	netfs_put_request(rreq, false, netfs_rreq_trace_put_hold);
-	return ret;
+discard:
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_discard);
 alloc_error:
 	folio_unlock(folio);
 	return ret;
@@ -966,7 +992,7 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	struct netfs_io_request *rreq;
 	struct netfs_i_context *ctx = netfs_i_context(file_inode(file ));
 	struct folio *folio;
-	unsigned int debug_index = 0, fgp_flags;
+	unsigned int fgp_flags;
 	pgoff_t index = pos >> PAGE_SHIFT;
 	int ret;
 
@@ -1029,39 +1055,13 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	 */
 	ractl._nr_pages = folio_nr_pages(folio);
 	netfs_rreq_expand(rreq, &ractl);
-	netfs_get_request(rreq, netfs_rreq_trace_get_hold);
 
 	/* We hold the folio locks, so we can drop the references */
 	folio_get(folio);
 	while (readahead_folio(&ractl))
 		;
 
-	atomic_set(&rreq->nr_outstanding, 1);
-	do {
-		if (!netfs_rreq_submit_slice(rreq, &debug_index))
-			break;
-
-	} while (rreq->submitted < rreq->len);
-
-	/* Keep nr_outstanding incremented so that the ref always belongs to
-	 * us, and the service code isn't punted off to a random thread pool to
-	 * process.
-	 */
-	for (;;) {
-		wait_var_event(&rreq->nr_outstanding,
-			       atomic_read(&rreq->nr_outstanding) == 1);
-		netfs_rreq_assess(rreq, false);
-		if (!test_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags))
-			break;
-		cond_resched();
-	}
-
-	ret = rreq->error;
-	if (ret == 0 && rreq->submitted < rreq->len) {
-		trace_netfs_failure(rreq, NULL, ret, netfs_fail_short_write_begin);
-		ret = -EIO;
-	}
-	netfs_put_request(rreq, false, netfs_rreq_trace_put_hold);
+	ret = netfs_begin_read(rreq, true);
 	if (ret < 0)
 		goto error;
 
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 685b07573394..55501d044bbc 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -56,17 +56,18 @@
 	EM(netfs_fail_check_write_begin,	"check-write-begin")	\
 	EM(netfs_fail_copy_to_cache,		"copy-to-cache")	\
 	EM(netfs_fail_read,			"read")			\
-	EM(netfs_fail_short_readpage,		"short-readpage")	\
-	EM(netfs_fail_short_write_begin,	"short-write-begin")	\
+	EM(netfs_fail_short_read,		"short-read")		\
 	E_(netfs_fail_prepare_write,		"prep-write")
 
 #define netfs_rreq_ref_traces					\
 	EM(netfs_rreq_trace_get_hold,		"GET HOLD   ")	\
 	EM(netfs_rreq_trace_get_subreq,		"GET SUBREQ ")	\
 	EM(netfs_rreq_trace_put_complete,	"PUT COMPLT ")	\
+	EM(netfs_rreq_trace_put_discard,	"PUT DISCARD")	\
 	EM(netfs_rreq_trace_put_failed,		"PUT FAILED ")	\
 	EM(netfs_rreq_trace_put_hold,		"PUT HOLD   ")	\
 	EM(netfs_rreq_trace_put_subreq,		"PUT SUBREQ ")	\
+	EM(netfs_rreq_trace_put_zero_len,	"PUT ZEROLEN")	\
 	E_(netfs_rreq_trace_new,		"NEW        ")
 
 #define netfs_sreq_ref_traces					\


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

