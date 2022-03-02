Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7294CA750
	for <lists+linux-cachefs@lfdr.de>; Wed,  2 Mar 2022 15:07:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646230023;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M7klyYlMWVjpv63B0Y1Dz0KbOAJYTO/FhXb8el+qaa0=;
	b=T3tSrBe8GOYR1A5PmFYmjKSqHBgrh5dQZmciYKtrlGvxL0sFUhU+NkgeDISqyrzEuCePVX
	X74cFsiG0S6b0GCXFoH9HzBKluQjMZi5xM32WjnoPqbIdkzjqV2kGlofdEmtE7DlfWFMNu
	IsrzybGy5c754tiVNoONwATbliM7kmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18--DA621FPNYunt7BLU8ibwA-1; Wed, 02 Mar 2022 09:06:59 -0500
X-MC-Unique: -DA621FPNYunt7BLU8ibwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5577EA0C00;
	Wed,  2 Mar 2022 14:06:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 489D37C0FC;
	Wed,  2 Mar 2022 14:06:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4BD31809C98;
	Wed,  2 Mar 2022 14:06:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 222E6s6G020982 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 2 Mar 2022 09:06:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3EA148359D; Wed,  2 Mar 2022 14:06:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C6AC83785;
	Wed,  2 Mar 2022 14:06:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 02 Mar 2022 14:06:25 +0000
Message-ID: <164622998584.3564931.5052255990645723639.stgit@warthog.procyon.org.uk>
In-Reply-To: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
References: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [Linux-cachefs] [PATCH 10/19] netfs: Trace refcounting on the
 netfs_io_subrequest struct
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

Add refcount tracing for the netfs_io_subrequest structure.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/netfs/internal.h          |    2 --
 fs/netfs/objects.c           |   26 ++++++++++++++++++++------
 fs/netfs/read_helper.c       |   20 +++++++++++---------
 include/linux/netfs.h        |    8 +++++++-
 include/trace/events/netfs.h |   40 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+), 18 deletions(-)

diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index b3877e276a3a..ee2f64cde221 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -27,8 +27,6 @@ void netfs_clear_subrequests(struct netfs_io_request *rreq, bool was_async);
 void netfs_put_request(struct netfs_io_request *rreq, bool was_async,
 		       enum netfs_rreq_ref_trace what);
 struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq);
-void netfs_put_subrequest(struct netfs_io_subrequest *subreq, bool was_async);
-void netfs_get_subrequest(struct netfs_io_subrequest *subreq);
 
 static inline void netfs_see_request(struct netfs_io_request *rreq,
 				     enum netfs_rreq_ref_trace what)
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 57d53f1f6741..c46d027c1692 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -59,7 +59,8 @@ void netfs_clear_subrequests(struct netfs_io_request *rreq, bool was_async)
 		subreq = list_first_entry(&rreq->subrequests,
 					  struct netfs_io_subrequest, rreq_link);
 		list_del(&subreq->rreq_link);
-		netfs_put_subrequest(subreq, was_async);
+		netfs_put_subrequest(subreq, was_async,
+				     netfs_sreq_trace_put_clear);
 	}
 }
 
@@ -107,7 +108,7 @@ struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq
 	subreq = kzalloc(sizeof(struct netfs_io_subrequest), GFP_KERNEL);
 	if (subreq) {
 		INIT_LIST_HEAD(&subreq->rreq_link);
-		refcount_set(&subreq->usage, 2);
+		refcount_set(&subreq->ref, 2);
 		subreq->rreq = rreq;
 		netfs_get_request(rreq, netfs_rreq_trace_get_subreq);
 		netfs_stat(&netfs_n_rh_sreq);
@@ -116,9 +117,14 @@ struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq
 	return subreq;
 }
 
-void netfs_get_subrequest(struct netfs_io_subrequest *subreq)
+void netfs_get_subrequest(struct netfs_io_subrequest *subreq,
+			  enum netfs_sreq_ref_trace what)
 {
-	refcount_inc(&subreq->usage);
+	int r;
+
+	__refcount_inc(&subreq->ref, &r);
+	trace_netfs_sreq_ref(subreq->rreq->debug_id, subreq->debug_index, r + 1,
+			     what);
 }
 
 static void netfs_free_subrequest(struct netfs_io_subrequest *subreq,
@@ -132,8 +138,16 @@ static void netfs_free_subrequest(struct netfs_io_subrequest *subreq,
 	netfs_put_request(rreq, was_async, netfs_rreq_trace_put_subreq);
 }
 
-void netfs_put_subrequest(struct netfs_io_subrequest *subreq, bool was_async)
+void netfs_put_subrequest(struct netfs_io_subrequest *subreq, bool was_async,
+			  enum netfs_sreq_ref_trace what)
 {
-	if (refcount_dec_and_test(&subreq->usage))
+	unsigned int debug_index = subreq->debug_index;
+	unsigned int debug_id = subreq->rreq->debug_id;
+	bool dead;
+	int r;
+
+	dead = __refcount_dec_and_test(&subreq->ref, &r);
+	trace_netfs_sreq_ref(debug_id, debug_index, r - 1, what);
+	if (dead)
 		netfs_free_subrequest(subreq, was_async);
 }
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 535b2cbde4c8..c953a573b6b6 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -166,7 +166,7 @@ static void netfs_rreq_copy_terminated(void *priv, ssize_t transferred_or_error,
 	if (atomic_dec_and_test(&rreq->nr_copy_ops))
 		netfs_rreq_unmark_after_write(rreq, was_async);
 
-	netfs_put_subrequest(subreq, was_async);
+	netfs_put_subrequest(subreq, was_async, netfs_sreq_trace_put_terminated);
 }
 
 /*
@@ -190,7 +190,8 @@ static void netfs_rreq_do_write_to_cache(struct netfs_io_request *rreq)
 	list_for_each_entry_safe(subreq, p, &rreq->subrequests, rreq_link) {
 		if (!test_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags)) {
 			list_del_init(&subreq->rreq_link);
-			netfs_put_subrequest(subreq, false);
+			netfs_put_subrequest(subreq, false,
+					     netfs_sreq_trace_put_no_copy);
 		}
 	}
 
@@ -202,7 +203,8 @@ static void netfs_rreq_do_write_to_cache(struct netfs_io_request *rreq)
 				break;
 			subreq->len += next->len;
 			list_del_init(&next->rreq_link);
-			netfs_put_subrequest(next, false);
+			netfs_put_subrequest(next, false,
+					     netfs_sreq_trace_put_merged);
 		}
 
 		ret = cres->ops->prepare_write(cres, &subreq->start, &subreq->len,
@@ -218,7 +220,7 @@ static void netfs_rreq_do_write_to_cache(struct netfs_io_request *rreq)
 
 		atomic_inc(&rreq->nr_copy_ops);
 		netfs_stat(&netfs_n_rh_write);
-		netfs_get_subrequest(subreq);
+		netfs_get_subrequest(subreq, netfs_sreq_trace_get_copy_to_cache);
 		trace_netfs_sreq(subreq, netfs_sreq_trace_write);
 		cres->ops->write(cres, subreq->start, &iter,
 				 netfs_rreq_copy_terminated, subreq);
@@ -341,7 +343,7 @@ static void netfs_rreq_short_read(struct netfs_io_request *rreq,
 	netfs_stat(&netfs_n_rh_short_read);
 	trace_netfs_sreq(subreq, netfs_sreq_trace_resubmit_short);
 
-	netfs_get_subrequest(subreq);
+	netfs_get_subrequest(subreq, netfs_sreq_trace_get_short_read);
 	atomic_inc(&rreq->nr_outstanding);
 	if (subreq->source == NETFS_READ_FROM_CACHE)
 		netfs_read_from_cache(rreq, subreq, NETFS_READ_HOLE_CLEAR);
@@ -375,7 +377,7 @@ static bool netfs_rreq_perform_resubmissions(struct netfs_io_request *rreq)
 			subreq->error = 0;
 			netfs_stat(&netfs_n_rh_download_instead);
 			trace_netfs_sreq(subreq, netfs_sreq_trace_download_instead);
-			netfs_get_subrequest(subreq);
+			netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
 			atomic_inc(&rreq->nr_outstanding);
 			netfs_read_from_server(rreq, subreq);
 		} else if (test_bit(NETFS_SREQ_SHORT_IO, &subreq->flags)) {
@@ -537,7 +539,7 @@ void netfs_subreq_terminated(struct netfs_io_subrequest *subreq,
 	else if (u == 1)
 		wake_up_var(&rreq->nr_outstanding);
 
-	netfs_put_subrequest(subreq, was_async);
+	netfs_put_subrequest(subreq, was_async, netfs_sreq_trace_put_terminated);
 	return;
 
 incomplete:
@@ -682,7 +684,7 @@ static bool netfs_rreq_submit_slice(struct netfs_io_request *rreq,
 
 subreq_failed:
 	rreq->error = subreq->error;
-	netfs_put_subrequest(subreq, false);
+	netfs_put_subrequest(subreq, false, netfs_sreq_trace_put_failed);
 	return false;
 }
 
@@ -1024,13 +1026,13 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	 */
 	ractl._nr_pages = folio_nr_pages(folio);
 	netfs_rreq_expand(rreq, &ractl);
+	netfs_get_request(rreq, netfs_rreq_trace_get_hold);
 
 	/* We hold the folio locks, so we can drop the references */
 	folio_get(folio);
 	while (readahead_folio(&ractl))
 		;
 
-	netfs_get_request(rreq, netfs_rreq_trace_get_hold);
 	atomic_set(&rreq->nr_outstanding, 1);
 	do {
 		if (!netfs_rreq_submit_slice(rreq, &debug_index))
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index e5c049a25746..725b8fb8e4bb 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -18,6 +18,8 @@
 #include <linux/fs.h>
 #include <linux/pagemap.h>
 
+enum netfs_sreq_ref_trace;
+
 /*
  * Overload PG_private_2 to give us PG_fscache - this is used to indicate that
  * a page is currently backed by a local disk cache
@@ -146,7 +148,7 @@ struct netfs_io_subrequest {
 	loff_t			start;		/* Where to start the I/O */
 	size_t			len;		/* Size of the I/O */
 	size_t			transferred;	/* Amount of data transferred */
-	refcount_t		usage;
+	refcount_t		ref;
 	short			error;		/* 0 or error that occurred */
 	unsigned short		debug_index;	/* Index in list (for debugging output) */
 	enum netfs_io_source	source;		/* Where to read from/write to */
@@ -277,6 +279,10 @@ extern int netfs_write_begin(struct file *, struct address_space *,
 			     void **);
 
 extern void netfs_subreq_terminated(struct netfs_io_subrequest *, ssize_t, bool);
+extern void netfs_get_subrequest(struct netfs_io_subrequest *subreq,
+				 enum netfs_sreq_ref_trace what);
+extern void netfs_put_subrequest(struct netfs_io_subrequest *subreq,
+				 bool was_async, enum netfs_sreq_ref_trace what);
 extern void netfs_stats_show(struct seq_file *);
 
 /**
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 8c700e2bcd5c..507c5e612293 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -69,6 +69,17 @@
 	EM(netfs_rreq_trace_put_subreq,		"PUT SUBREQ ")	\
 	E_(netfs_rreq_trace_new,		"NEW        ")
 
+#define netfs_sreq_ref_traces					\
+	EM(netfs_sreq_trace_get_copy_to_cache,	"GET COPY2C ")	\
+	EM(netfs_sreq_trace_get_resubmit,	"GET RESUBMIT")	\
+	EM(netfs_sreq_trace_get_short_read,	"GET SHORTRD")	\
+	EM(netfs_sreq_trace_new,		"NEW        ")	\
+	EM(netfs_sreq_trace_put_clear,		"PUT CLEAR  ")	\
+	EM(netfs_sreq_trace_put_failed,		"PUT FAILED ")	\
+	EM(netfs_sreq_trace_put_merged,		"PUT MERGED ")	\
+	EM(netfs_sreq_trace_put_no_copy,	"PUT NO COPY")	\
+	E_(netfs_sreq_trace_put_terminated,	"PUT TERM   ")
+
 #ifndef __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
 #define __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
 
@@ -82,6 +93,7 @@ enum netfs_rreq_trace { netfs_rreq_traces } __mode(byte);
 enum netfs_sreq_trace { netfs_sreq_traces } __mode(byte);
 enum netfs_failure { netfs_failures } __mode(byte);
 enum netfs_rreq_ref_trace { netfs_rreq_ref_traces } __mode(byte);
+enum netfs_sreq_ref_trace { netfs_sreq_ref_traces } __mode(byte);
 
 #endif
 
@@ -100,6 +112,7 @@ netfs_sreq_sources;
 netfs_sreq_traces;
 netfs_failures;
 netfs_rreq_ref_traces;
+netfs_sreq_ref_traces;
 
 /*
  * Now redefine the EM() and E_() macros to map the enums to the strings that
@@ -273,6 +286,33 @@ TRACE_EVENT(netfs_rreq_ref,
 		      __entry->ref)
 	    );
 
+TRACE_EVENT(netfs_sreq_ref,
+	    TP_PROTO(unsigned int rreq_debug_id, unsigned int subreq_debug_index,
+		     int ref, enum netfs_sreq_ref_trace what),
+
+	    TP_ARGS(rreq_debug_id, subreq_debug_index, ref, what),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,		rreq		)
+		    __field(unsigned int,		subreq		)
+		    __field(int,			ref		)
+		    __field(enum netfs_sreq_ref_trace,	what		)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->rreq	= rreq_debug_id;
+		    __entry->subreq	= subreq_debug_index;
+		    __entry->ref	= ref;
+		    __entry->what	= what;
+			   ),
+
+	    TP_printk("W=%08x[%x] %s r=%u",
+		      __entry->rreq,
+		      __entry->subreq,
+		      __print_symbolic(__entry->what, netfs_sreq_ref_traces),
+		      __entry->ref)
+	    );
+
 #endif /* _TRACE_NETFS_H */
 
 /* This part must be outside protection */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

