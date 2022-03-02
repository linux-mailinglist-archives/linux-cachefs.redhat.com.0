Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 804994CA73A
	for <lists+linux-cachefs@lfdr.de>; Wed,  2 Mar 2022 15:06:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646229977;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BQLCnfZSSPae+saYTQrNkbm5ZlZ9pLX7+Y2LEJCxAWE=;
	b=IfgmqCE9HeVKNbQ1O+KpZdcwumx1tpWEuv1ddYoo+SuG7kbUFE51RnM/LCCHl7kZJy24JM
	AGqY0sCMs/EOI5ITPgcAXX5jE6XcEl3PEz9BRndBCTh/3tv8Zw5Zk2l9U7YUI9kot0Gbkb
	q/pED4/QTnhXxGbZaCTUiE1pSKLCKxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-PzvBBDutNXWbc3fKGt3VQQ-1; Wed, 02 Mar 2022 09:06:14 -0500
X-MC-Unique: PzvBBDutNXWbc3fKGt3VQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ACF6835DE1;
	Wed,  2 Mar 2022 14:06:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D3E77D3CA;
	Wed,  2 Mar 2022 14:06:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D7224ED79;
	Wed,  2 Mar 2022 14:06:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 222E6BPt020601 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 2 Mar 2022 09:06:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6E8FA838D0; Wed,  2 Mar 2022 14:06:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02B24781F1;
	Wed,  2 Mar 2022 14:06:07 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 02 Mar 2022 14:06:07 +0000
Message-ID: <164622996715.3564931.4252319907990358129.stgit@warthog.procyon.org.uk>
In-Reply-To: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
References: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [Linux-cachefs] [PATCH 08/19] netfs: Adjust the netfs_rreq
	tracepoint slightly
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

Adjust the netfs_rreq tracepoint to include the origin of the request and
to increase the size of the "what trace" output strings by a character so
that "ENCRYPT" and "DECRYPT" will fit without abbreviation.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/netfs/read_helper.c       |    2 +-
 include/trace/events/netfs.h |   29 +++++++++++++++++++----------
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 68616635c5ac..5e0fdf9c9772 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -180,7 +180,7 @@ static void netfs_rreq_do_write_to_cache(struct netfs_io_request *rreq)
 	struct iov_iter iter;
 	int ret;
 
-	trace_netfs_rreq(rreq, netfs_rreq_trace_write);
+	trace_netfs_rreq(rreq, netfs_rreq_trace_copy);
 
 	/* We don't want terminating writes trying to wake us up whilst we're
 	 * still going through the list.
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 2d0665b416bf..8330ae8fbc0a 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -21,14 +21,19 @@
 	EM(netfs_read_trace_readpage,		"READPAGE ")	\
 	E_(netfs_read_trace_write_begin,	"WRITEBEGN")
 
+#define netfs_rreq_origins					\
+	EM(NETFS_READAHEAD,			"RA")		\
+	EM(NETFS_READPAGE,			"RP")		\
+	E_(NETFS_READ_FOR_WRITE,		"RW")
+
 #define netfs_rreq_traces					\
-	EM(netfs_rreq_trace_assess,		"ASSESS")	\
-	EM(netfs_rreq_trace_done,		"DONE  ")	\
-	EM(netfs_rreq_trace_free,		"FREE  ")	\
-	EM(netfs_rreq_trace_resubmit,		"RESUBM")	\
-	EM(netfs_rreq_trace_unlock,		"UNLOCK")	\
-	EM(netfs_rreq_trace_unmark,		"UNMARK")	\
-	E_(netfs_rreq_trace_write,		"WRITE ")
+	EM(netfs_rreq_trace_assess,		"ASSESS ")	\
+	EM(netfs_rreq_trace_copy,		"COPY   ")	\
+	EM(netfs_rreq_trace_done,		"DONE   ")	\
+	EM(netfs_rreq_trace_free,		"FREE   ")	\
+	EM(netfs_rreq_trace_resubmit,		"RESUBMT")	\
+	EM(netfs_rreq_trace_unlock,		"UNLOCK ")	\
+	E_(netfs_rreq_trace_unmark,		"UNMARK ")
 
 #define netfs_sreq_sources					\
 	EM(NETFS_FILL_WITH_ZEROES,		"ZERO")		\
@@ -79,6 +84,7 @@ enum netfs_failure { netfs_failures } __mode(byte);
 #define E_(a, b) TRACE_DEFINE_ENUM(a);
 
 netfs_read_traces;
+netfs_rreq_origins;
 netfs_rreq_traces;
 netfs_sreq_sources;
 netfs_sreq_traces;
@@ -134,18 +140,21 @@ TRACE_EVENT(netfs_rreq,
 
 	    TP_STRUCT__entry(
 		    __field(unsigned int,		rreq		)
-		    __field(unsigned short,		flags		)
+		    __field(unsigned int,		flags		)
+		    __field(enum netfs_io_origin,	origin		)
 		    __field(enum netfs_rreq_trace,	what		)
 			     ),
 
 	    TP_fast_assign(
 		    __entry->rreq	= rreq->debug_id;
 		    __entry->flags	= rreq->flags;
+		    __entry->origin	= rreq->origin;
 		    __entry->what	= what;
 			   ),
 
-	    TP_printk("R=%08x %s f=%02x",
+	    TP_printk("R=%08x %s %s f=%02x",
 		      __entry->rreq,
+		      __print_symbolic(__entry->origin, netfs_rreq_origins),
 		      __print_symbolic(__entry->what, netfs_rreq_traces),
 		      __entry->flags)
 	    );
@@ -182,8 +191,8 @@ TRACE_EVENT(netfs_sreq,
 
 	    TP_printk("R=%08x[%u] %s %s f=%02x s=%llx %zx/%zx e=%d",
 		      __entry->rreq, __entry->index,
-		      __print_symbolic(__entry->what, netfs_sreq_traces),
 		      __print_symbolic(__entry->source, netfs_sreq_sources),
+		      __print_symbolic(__entry->what, netfs_sreq_traces),
 		      __entry->flags,
 		      __entry->start, __entry->transferred, __entry->len,
 		      __entry->error)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

