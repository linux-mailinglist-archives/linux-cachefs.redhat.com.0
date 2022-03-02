Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA414CA73E
	for <lists+linux-cachefs@lfdr.de>; Wed,  2 Mar 2022 15:06:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646229988;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C9pX/d3/US4sDJGZ7ByA2P9fbcFvxSowJOPfVXPaICY=;
	b=Vj5VWTDGF5FNfnxRrLljGR6f9gkMJZ4wi85znA0AmhU8j+xUAIQEyjKXdHFlk1opgz2Qcu
	IH1GefAFeXMFhKOFrtaxdfW4BoU+S8uUGi2LnOqooVqizCUmtyf8+2ln2xa4zCtlAcppCo
	QoynguHS0LC+AaupNbW0rlZ54XFPg7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-oYHKCYOlMBKRT38MI5p0tw-1; Wed, 02 Mar 2022 09:06:25 -0500
X-MC-Unique: oYHKCYOlMBKRT38MI5p0tw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E545380202C;
	Wed,  2 Mar 2022 14:06:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6BD37C0FC;
	Wed,  2 Mar 2022 14:06:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFEEC4ED79;
	Wed,  2 Mar 2022 14:06:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 222E6KQT020790 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 2 Mar 2022 09:06:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 967B4797D1; Wed,  2 Mar 2022 14:06:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 845CD76C32;
	Wed,  2 Mar 2022 14:06:17 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 02 Mar 2022 14:06:16 +0000
Message-ID: <164622997668.3564931.14456171619219324968.stgit@warthog.procyon.org.uk>
In-Reply-To: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
References: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [Linux-cachefs] [PATCH 09/19] netfs: Trace refcounting on the
	netfs_io_request struct
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add refcount tracing for the netfs_io_request structure.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/netfs/internal.h          |   11 +++++++++--
 fs/netfs/objects.c           |   24 +++++++++++++++++-------
 fs/netfs/read_helper.c       |   14 +++++++-------
 include/linux/netfs.h        |    2 +-
 include/trace/events/netfs.h |   35 +++++++++++++++++++++++++++++++++++
 5 files changed, 69 insertions(+), 17 deletions(-)

diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 1f2ad9c9d103..b3877e276a3a 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -22,13 +22,20 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 					     struct file *file,
 					     loff_t start, size_t len,
 					     enum netfs_io_origin origin);
-void netfs_get_request(struct netfs_io_request *rreq);
+void netfs_get_request(struct netfs_io_request *rreq, enum netfs_rreq_ref_trace what);
 void netfs_clear_subrequests(struct netfs_io_request *rreq, bool was_async);
-void netfs_put_request(struct netfs_io_request *rreq, bool was_async);
+void netfs_put_request(struct netfs_io_request *rreq, bool was_async,
+		       enum netfs_rreq_ref_trace what);
 struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq);
 void netfs_put_subrequest(struct netfs_io_subrequest *subreq, bool was_async);
 void netfs_get_subrequest(struct netfs_io_subrequest *subreq);
 
+static inline void netfs_see_request(struct netfs_io_request *rreq,
+				     enum netfs_rreq_ref_trace what)
+{
+	trace_netfs_rreq_ref(rreq->debug_id, refcount_read(&rreq->ref), what);
+}
+
 /*
  * read_helper.c
  */
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index b212de11ebca..57d53f1f6741 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -33,7 +33,7 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 		rreq->debug_id	= atomic_inc_return(&debug_ids);
 		INIT_LIST_HEAD(&rreq->subrequests);
 		INIT_WORK(&rreq->work, netfs_rreq_work);
-		refcount_set(&rreq->usage, 1);
+		refcount_set(&rreq->ref, 1);
 		__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
 		if (ctx->ops->init_request)
 			ctx->ops->init_request(rreq, file);
@@ -43,9 +43,12 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	return rreq;
 }
 
-void netfs_get_request(struct netfs_io_request *rreq)
+void netfs_get_request(struct netfs_io_request *rreq, enum netfs_rreq_ref_trace what)
 {
-	refcount_inc(&rreq->usage);
+	int r;
+
+	__refcount_inc(&rreq->ref, &r);
+	trace_netfs_rreq_ref(rreq->debug_id, r + 1, what);
 }
 
 void netfs_clear_subrequests(struct netfs_io_request *rreq, bool was_async)
@@ -74,9 +77,16 @@ static void netfs_free_request(struct work_struct *work)
 	netfs_stat_d(&netfs_n_rh_rreq);
 }
 
-void netfs_put_request(struct netfs_io_request *rreq, bool was_async)
+void netfs_put_request(struct netfs_io_request *rreq, bool was_async,
+		       enum netfs_rreq_ref_trace what)
 {
-	if (refcount_dec_and_test(&rreq->usage)) {
+	unsigned int debug_id = rreq->debug_id;
+	bool dead;
+	int r;
+
+	dead = __refcount_dec_and_test(&rreq->ref, &r);
+	trace_netfs_rreq_ref(debug_id, r - 1, what);
+	if (dead) {
 		if (was_async) {
 			rreq->work.func = netfs_free_request;
 			if (!queue_work(system_unbound_wq, &rreq->work))
@@ -99,7 +109,7 @@ struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq
 		INIT_LIST_HEAD(&subreq->rreq_link);
 		refcount_set(&subreq->usage, 2);
 		subreq->rreq = rreq;
-		netfs_get_request(rreq);
+		netfs_get_request(rreq, netfs_rreq_trace_get_subreq);
 		netfs_stat(&netfs_n_rh_sreq);
 	}
 
@@ -119,7 +129,7 @@ static void netfs_free_subrequest(struct netfs_io_subrequest *subreq,
 	trace_netfs_sreq(subreq, netfs_sreq_trace_free);
 	kfree(subreq);
 	netfs_stat_d(&netfs_n_rh_sreq);
-	netfs_put_request(rreq, was_async);
+	netfs_put_request(rreq, was_async, netfs_rreq_trace_put_subreq);
 }
 
 void netfs_put_subrequest(struct netfs_io_subrequest *subreq, bool was_async)
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 5e0fdf9c9772..535b2cbde4c8 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -108,7 +108,7 @@ static void netfs_rreq_completed(struct netfs_io_request *rreq, bool was_async)
 {
 	trace_netfs_rreq(rreq, netfs_rreq_trace_done);
 	netfs_clear_subrequests(rreq, was_async);
-	netfs_put_request(rreq, was_async);
+	netfs_put_request(rreq, was_async, netfs_rreq_trace_put_complete);
 }
 
 /*
@@ -794,7 +794,7 @@ void netfs_readahead(struct readahead_control *ractl)
 	return;
 
 cleanup_free:
-	netfs_put_request(rreq, false);
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_failed);
 	return;
 }
 EXPORT_SYMBOL(netfs_readahead);
@@ -840,7 +840,7 @@ int netfs_readpage(struct file *file, struct page *subpage)
 	netfs_stat(&netfs_n_rh_readpage);
 	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
 
-	netfs_get_request(rreq);
+	netfs_get_request(rreq, netfs_rreq_trace_get_hold);
 
 	atomic_set(&rreq->nr_outstanding, 1);
 	do {
@@ -865,7 +865,7 @@ int netfs_readpage(struct file *file, struct page *subpage)
 		ret = -EIO;
 	}
 out:
-	netfs_put_request(rreq, false);
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_hold);
 	return ret;
 nomem:
 	folio_unlock(folio);
@@ -1024,13 +1024,13 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	 */
 	ractl._nr_pages = folio_nr_pages(folio);
 	netfs_rreq_expand(rreq, &ractl);
-	netfs_get_request(rreq);
 
 	/* We hold the folio locks, so we can drop the references */
 	folio_get(folio);
 	while (readahead_folio(&ractl))
 		;
 
+	netfs_get_request(rreq, netfs_rreq_trace_get_hold);
 	atomic_set(&rreq->nr_outstanding, 1);
 	do {
 		if (!netfs_rreq_submit_slice(rreq, &debug_index))
@@ -1056,7 +1056,7 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 		trace_netfs_failure(rreq, NULL, ret, netfs_fail_short_write_begin);
 		ret = -EIO;
 	}
-	netfs_put_request(rreq, false);
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_hold);
 	if (ret < 0)
 		goto error;
 
@@ -1070,7 +1070,7 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	return 0;
 
 error_put:
-	netfs_put_request(rreq, false);
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_failed);
 error:
 	folio_unlock(folio);
 	folio_put(folio);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 8c33777c439e..e5c049a25746 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -185,7 +185,7 @@ struct netfs_io_request {
 	loff_t			i_size;		/* Size of the file */
 	loff_t			start;		/* Start position */
 	pgoff_t			no_unlock_folio; /* Don't unlock this folio after read */
-	refcount_t		usage;
+	refcount_t		ref;
 	unsigned long		flags;
 #define NETFS_RREQ_INCOMPLETE_IO	0	/* Some ioreqs terminated short or with error */
 #define NETFS_RREQ_COPY_TO_CACHE	1	/* Need to write to the cache */
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 8330ae8fbc0a..8c700e2bcd5c 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -60,6 +60,15 @@
 	EM(netfs_fail_short_write_begin,	"short-write-begin")	\
 	E_(netfs_fail_prepare_write,		"prep-write")
 
+#define netfs_rreq_ref_traces					\
+	EM(netfs_rreq_trace_get_hold,		"GET HOLD   ")	\
+	EM(netfs_rreq_trace_get_subreq,		"GET SUBREQ ")	\
+	EM(netfs_rreq_trace_put_complete,	"PUT COMPLT ")	\
+	EM(netfs_rreq_trace_put_failed,		"PUT FAILED ")	\
+	EM(netfs_rreq_trace_put_hold,		"PUT HOLD   ")	\
+	EM(netfs_rreq_trace_put_subreq,		"PUT SUBREQ ")	\
+	E_(netfs_rreq_trace_new,		"NEW        ")
+
 #ifndef __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
 #define __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
 
@@ -72,6 +81,7 @@ enum netfs_read_trace { netfs_read_traces } __mode(byte);
 enum netfs_rreq_trace { netfs_rreq_traces } __mode(byte);
 enum netfs_sreq_trace { netfs_sreq_traces } __mode(byte);
 enum netfs_failure { netfs_failures } __mode(byte);
+enum netfs_rreq_ref_trace { netfs_rreq_ref_traces } __mode(byte);
 
 #endif
 
@@ -89,6 +99,7 @@ netfs_rreq_traces;
 netfs_sreq_sources;
 netfs_sreq_traces;
 netfs_failures;
+netfs_rreq_ref_traces;
 
 /*
  * Now redefine the EM() and E_() macros to map the enums to the strings that
@@ -238,6 +249,30 @@ TRACE_EVENT(netfs_failure,
 		      __entry->error)
 	    );
 
+TRACE_EVENT(netfs_rreq_ref,
+	    TP_PROTO(unsigned int rreq_debug_id, int ref,
+		     enum netfs_rreq_ref_trace what),
+
+	    TP_ARGS(rreq_debug_id, ref, what),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,		rreq		)
+		    __field(int,			ref		)
+		    __field(enum netfs_rreq_ref_trace,	what		)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->rreq	= rreq_debug_id;
+		    __entry->ref	= ref;
+		    __entry->what	= what;
+			   ),
+
+	    TP_printk("W=%08x %s r=%u",
+		      __entry->rreq,
+		      __print_symbolic(__entry->what, netfs_rreq_ref_traces),
+		      __entry->ref)
+	    );
+
 #endif /* _TRACE_NETFS_H */
 
 /* This part must be outside protection */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

