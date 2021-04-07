Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 27D953570D9
	for <lists+linux-cachefs@lfdr.de>; Wed,  7 Apr 2021 17:48:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617810498;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TV2PyEL/a/Ys/Ag3HevaL7DAT3GBCTD0ISKnklEvySI=;
	b=aZSCQWfJGQd2s96nC1lkT8Rj3vNgSueh7ozKFMC723LI1m4sot+ggx1CPvoYEIVF3S1ijL
	1PU3FZ3RzpZQbzZMxLzBjeMir/+1cJKMWa+uD0t40ioCCkqduxDHY7uLa2Nj13fsDahLmc
	+/ugZD/0KqbgX6oZG3ghsd5xQJ7Fp+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-hcaIVuyMOceBnbLhn6IeLg-1; Wed, 07 Apr 2021 11:48:15 -0400
X-MC-Unique: hcaIVuyMOceBnbLhn6IeLg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F04C87A841;
	Wed,  7 Apr 2021 15:48:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CF391822A;
	Wed,  7 Apr 2021 15:48:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2AC22180B653;
	Wed,  7 Apr 2021 15:48:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 137FmBJk005330 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 7 Apr 2021 11:48:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 484BA1B528; Wed,  7 Apr 2021 15:48:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-201.rdu2.redhat.com
	[10.10.115.201])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 010496A033;
	Wed,  7 Apr 2021 15:48:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: jlayton@kernel.org
Date: Wed, 07 Apr 2021 16:48:08 +0100
Message-ID: <161781048813.463527.1557000804674707986.stgit@warthog.procyon.org.uk>
In-Reply-To: <161781041339.463527.18139104281901492882.stgit@warthog.procyon.org.uk>
References: <161781041339.463527.18139104281901492882.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 5/5] netfs: Add a tracepoint to log failures
 that would be otherwise unseen
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

Add a tracepoint to log internal failures (such as cache errors) that we
don't otherwise want to pass back to the netfs.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/netfs/read_helper.c       |   14 +++++++++-
 include/trace/events/netfs.h |   58 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index ce2f31d20250..762a15350242 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -271,6 +271,8 @@ static void netfs_rreq_copy_terminated(void *priv, ssize_t transferred_or_error,
 
 	if (IS_ERR_VALUE(transferred_or_error)) {
 		netfs_stat(&netfs_n_rh_write_failed);
+		trace_netfs_failure(rreq, subreq, transferred_or_error,
+				    netfs_fail_copy_to_cache);
 	} else {
 		netfs_stat(&netfs_n_rh_write_done);
 	}
@@ -323,6 +325,7 @@ static void netfs_rreq_do_write_to_cache(struct netfs_read_request *rreq)
 		ret = cres->ops->prepare_write(cres, &subreq->start, &subreq->len,
 					       rreq->i_size);
 		if (ret < 0) {
+			trace_netfs_failure(rreq, subreq, ret, netfs_fail_prepare_write);
 			trace_netfs_sreq(subreq, netfs_sreq_trace_write_skip);
 			continue;
 		}
@@ -627,6 +630,8 @@ void netfs_subreq_terminated(struct netfs_read_subrequest *subreq,
 
 	if (IS_ERR_VALUE(transferred_or_error)) {
 		subreq->error = transferred_or_error;
+		trace_netfs_failure(rreq, subreq, transferred_or_error,
+				    netfs_fail_read);
 		goto failed;
 	}
 
@@ -996,8 +1001,10 @@ int netfs_readpage(struct file *file,
 	} while (test_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags));
 
 	ret = rreq->error;
-	if (ret == 0 && rreq->submitted < rreq->len)
+	if (ret == 0 && rreq->submitted < rreq->len) {
+		trace_netfs_failure(rreq, NULL, ret, netfs_fail_short_readpage);
 		ret = -EIO;
+	}
 out:
 	netfs_put_read_request(rreq, false);
 	return ret;
@@ -1074,6 +1081,7 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 		/* Allow the netfs (eg. ceph) to flush conflicts. */
 		ret = ops->check_write_begin(file, pos, len, page, _fsdata);
 		if (ret < 0) {
+			trace_netfs_failure(NULL, NULL, ret, netfs_fail_check_write_begin);
 			if (ret == -EAGAIN)
 				goto retry;
 			goto error;
@@ -1150,8 +1158,10 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	}
 
 	ret = rreq->error;
-	if (ret == 0 && rreq->submitted < rreq->len)
+	if (ret == 0 && rreq->submitted < rreq->len) {
+		trace_netfs_failure(rreq, NULL, ret, netfs_fail_short_write_begin);
 		ret = -EIO;
+	}
 	netfs_put_read_request(rreq, false);
 	if (ret < 0)
 		goto error;
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index e3ebeabd3852..de1c64635e42 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -47,6 +47,15 @@ enum netfs_sreq_trace {
 	netfs_sreq_trace_write_term,
 };
 
+enum netfs_failure {
+	netfs_fail_check_write_begin,
+	netfs_fail_copy_to_cache,
+	netfs_fail_read,
+	netfs_fail_short_readpage,
+	netfs_fail_short_write_begin,
+	netfs_fail_prepare_write,
+};
+
 #endif
 
 #define netfs_read_traces					\
@@ -81,6 +90,14 @@ enum netfs_sreq_trace {
 	EM(netfs_sreq_trace_write_skip,		"SKIP ")	\
 	E_(netfs_sreq_trace_write_term,		"WTERM")
 
+#define netfs_failures							\
+	EM(netfs_fail_check_write_begin,	"check-write-begin")	\
+	EM(netfs_fail_copy_to_cache,		"copy-to-cache")	\
+	EM(netfs_fail_read,			"read")			\
+	EM(netfs_fail_short_readpage,		"short-readpage")	\
+	EM(netfs_fail_short_write_begin,	"short-write-begin")	\
+	E_(netfs_fail_prepare_write,		"prep-write")
+
 
 /*
  * Export enum symbols via userspace.
@@ -94,6 +111,7 @@ netfs_read_traces;
 netfs_rreq_traces;
 netfs_sreq_sources;
 netfs_sreq_traces;
+netfs_failures;
 
 /*
  * Now redefine the EM() and E_() macros to map the enums to the strings that
@@ -197,6 +215,46 @@ TRACE_EVENT(netfs_sreq,
 		      __entry->error)
 	    );
 
+TRACE_EVENT(netfs_failure,
+	    TP_PROTO(struct netfs_read_request *rreq,
+		     struct netfs_read_subrequest *sreq,
+		     int error, enum netfs_failure what),
+
+	    TP_ARGS(rreq, sreq, error, what),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,		rreq		)
+		    __field(unsigned short,		index		)
+		    __field(short,			error		)
+		    __field(unsigned short,		flags		)
+		    __field(enum netfs_read_source,	source		)
+		    __field(enum netfs_failure,		what		)
+		    __field(size_t,			len		)
+		    __field(size_t,			transferred	)
+		    __field(loff_t,			start		)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->rreq	= rreq->debug_id;
+		    __entry->index	= sreq ? sreq->debug_index : 0;
+		    __entry->error	= error;
+		    __entry->flags	= sreq ? sreq->flags : 0;
+		    __entry->source	= sreq ? sreq->source : NETFS_INVALID_READ;
+		    __entry->what	= what;
+		    __entry->len	= sreq ? sreq->len : 0;
+		    __entry->transferred = sreq ? sreq->transferred : 0;
+		    __entry->start	= sreq ? sreq->start : 0;
+			   ),
+
+	    TP_printk("R=%08x[%u] %s f=%02x s=%llx %zx/%zx %s e=%d",
+		      __entry->rreq, __entry->index,
+		      __print_symbolic(__entry->source, netfs_sreq_sources),
+		      __entry->flags,
+		      __entry->start, __entry->transferred, __entry->len,
+		      __print_symbolic(__entry->what, netfs_failures),
+		      __entry->error)
+	    );
+
 #endif /* _TRACE_NETFS_H */
 
 /* This part must be outside protection */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

