Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 088D743208F
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 16:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634568872;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Jm37pDZ2RLgia1QIQ4/64VRTkPPa5rYmd7D90mIN4h0=;
	b=d9TRtDyoWZ7AwQPD3JU3fByn6xlQDHVs93dZeE6+dMa/hs1iqIyRGIeLPvL7h5sdHT2agl
	6f5O/VyjF1Kjaj56ElqH2i/AkTH74l7rx0goVZb5hYf3y8Zy//HJRslr8QYGdfaCLqewA8
	r50B4+aQ4Qe69aigoOx5Y0WQaqjrkYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-15NzuHlfOkiIx6PlVp53nw-1; Mon, 18 Oct 2021 10:54:28 -0400
X-MC-Unique: 15NzuHlfOkiIx6PlVp53nw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A059C802575;
	Mon, 18 Oct 2021 14:54:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C07C6A8E5;
	Mon, 18 Oct 2021 14:54:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 766A04E58F;
	Mon, 18 Oct 2021 14:54:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IEsOgK027952 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 10:54:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9FF8962AEE; Mon, 18 Oct 2021 14:54:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5236C62A44;
	Mon, 18 Oct 2021 14:54:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 15:54:20 +0100
Message-ID: <163456886045.2614702.17032971991288240935.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH 13/67] fscache: Remove old I/O tracepoints
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove now-(mostly)-unused fscache tracepoints that have been obsoleted by
the removal of the old I/O code.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/fscache/io.c                |    2 
 fs/fscache/object.c            |    1 
 include/trace/events/fscache.h |  195 ----------------------------------------
 3 files changed, 198 deletions(-)

diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index 41f56a11b1a9..7ac34c2e45fe 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -65,8 +65,6 @@ int __fscache_begin_operation(struct netfs_cache_resources *cres,
 		(1UL << FSCACHE_OP_WAITING) |
 		(1UL << FSCACHE_OP_UNUSE_COOKIE);
 
-	trace_fscache_page_op(cookie, NULL, op, fscache_page_op_retr_multi);
-
 	spin_lock(&cookie->lock);
 
 	if (!fscache_cookie_enabled(cookie) ||
diff --git a/fs/fscache/object.c b/fs/fscache/object.c
index 3fb5a1a6c131..7aa1f90d978b 100644
--- a/fs/fscache/object.c
+++ b/fs/fscache/object.c
@@ -933,7 +933,6 @@ static const struct fscache_state *_fscache_invalidate_object(struct fscache_obj
 	op->flags = FSCACHE_OP_ASYNC |
 		(1 << FSCACHE_OP_EXCLUSIVE) |
 		(1 << FSCACHE_OP_UNUSE_COOKIE);
-	trace_fscache_page_op(cookie, NULL, op, fscache_page_op_invalidate);
 
 	spin_lock(&cookie->lock);
 	if (fscache_submit_exclusive_op(object, op) < 0)
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index ccff379db5e0..90d956ef1c6e 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -33,24 +33,6 @@ enum fscache_cookie_trace {
 	fscache_cookie_put_parent,
 };
 
-enum fscache_page_trace {
-	fscache_page_cached,
-	fscache_page_inval,
-	fscache_page_maybe_release,
-	fscache_page_radix_clear_store,
-	fscache_page_radix_delete,
-	fscache_page_radix_insert,
-	fscache_page_radix_pend2store,
-	fscache_page_radix_set_pend,
-	fscache_page_uncache,
-	fscache_page_write,
-	fscache_page_write_end,
-	fscache_page_write_end_pend,
-	fscache_page_write_end_noc,
-	fscache_page_write_wait,
-	fscache_page_trace__nr
-};
-
 enum fscache_op_trace {
 	fscache_op_cancel,
 	fscache_op_cancel_all,
@@ -69,17 +51,6 @@ enum fscache_op_trace {
 	fscache_op_trace__nr
 };
 
-enum fscache_page_op_trace {
-	fscache_page_op_alloc_one,
-	fscache_page_op_attr_changed,
-	fscache_page_op_check_consistency,
-	fscache_page_op_invalidate,
-	fscache_page_op_retr_multi,
-	fscache_page_op_retr_one,
-	fscache_page_op_write_one,
-	fscache_page_op_trace__nr
-};
-
 #endif
 
 /*
@@ -98,22 +69,6 @@ enum fscache_page_op_trace {
 	EM(fscache_cookie_put_object,		"PUT obj")		\
 	E_(fscache_cookie_put_parent,		"PUT prn")
 
-#define fscache_page_traces						\
-	EM(fscache_page_cached,			"Cached ")		\
-	EM(fscache_page_inval,			"InvalPg")		\
-	EM(fscache_page_maybe_release,		"MayRels")		\
-	EM(fscache_page_uncache,		"Uncache")		\
-	EM(fscache_page_radix_clear_store,	"RxCStr ")		\
-	EM(fscache_page_radix_delete,		"RxDel  ")		\
-	EM(fscache_page_radix_insert,		"RxIns  ")		\
-	EM(fscache_page_radix_pend2store,	"RxP2S  ")		\
-	EM(fscache_page_radix_set_pend,		"RxSPend ")		\
-	EM(fscache_page_write,			"WritePg")		\
-	EM(fscache_page_write_end,		"EndPgWr")		\
-	EM(fscache_page_write_end_pend,		"EndPgWP")		\
-	EM(fscache_page_write_end_noc,		"EndPgNC")		\
-	E_(fscache_page_write_wait,		"WtOnWrt")
-
 #define fscache_op_traces						\
 	EM(fscache_op_cancel,			"Cancel1")		\
 	EM(fscache_op_cancel_all,		"CancelA")		\
@@ -130,15 +85,6 @@ enum fscache_page_op_trace {
 	EM(fscache_op_submit_ex,		"SubmitX")		\
 	E_(fscache_op_work,			"Work   ")
 
-#define fscache_page_op_traces						\
-	EM(fscache_page_op_alloc_one,		"Alloc1 ")		\
-	EM(fscache_page_op_attr_changed,	"AttrChg")		\
-	EM(fscache_page_op_check_consistency,	"CheckCn")		\
-	EM(fscache_page_op_invalidate,		"Inval  ")		\
-	EM(fscache_page_op_retr_multi,		"RetrMul")		\
-	EM(fscache_page_op_retr_one,		"Retr1  ")		\
-	E_(fscache_page_op_write_one,		"Write1 ")
-
 /*
  * Export enum symbols via userspace.
  */
@@ -353,70 +299,6 @@ TRACE_EVENT(fscache_osm,
 		      __entry->event_num)
 	    );
 
-TRACE_EVENT(fscache_page,
-	    TP_PROTO(struct fscache_cookie *cookie, struct page *page,
-		     enum fscache_page_trace why),
-
-	    TP_ARGS(cookie, page, why),
-
-	    TP_STRUCT__entry(
-		    __field(unsigned int,		cookie		)
-		    __field(pgoff_t,			page		)
-		    __field(enum fscache_page_trace,	why		)
-			     ),
-
-	    TP_fast_assign(
-		    __entry->cookie		= cookie->debug_id;
-		    __entry->page		= page->index;
-		    __entry->why		= why;
-			   ),
-
-	    TP_printk("c=%08x %s pg=%lx",
-		      __entry->cookie,
-		      __print_symbolic(__entry->why, fscache_page_traces),
-		      __entry->page)
-	    );
-
-TRACE_EVENT(fscache_check_page,
-	    TP_PROTO(struct fscache_cookie *cookie, struct page *page,
-		     void *val, int n),
-
-	    TP_ARGS(cookie, page, val, n),
-
-	    TP_STRUCT__entry(
-		    __field(unsigned int,		cookie		)
-		    __field(void *,			page		)
-		    __field(void *,			val		)
-		    __field(int,			n		)
-			     ),
-
-	    TP_fast_assign(
-		    __entry->cookie		= cookie->debug_id;
-		    __entry->page		= page;
-		    __entry->val		= val;
-		    __entry->n			= n;
-			   ),
-
-	    TP_printk("c=%08x pg=%p val=%p n=%d",
-		      __entry->cookie, __entry->page, __entry->val, __entry->n)
-	    );
-
-TRACE_EVENT(fscache_wake_cookie,
-	    TP_PROTO(struct fscache_cookie *cookie),
-
-	    TP_ARGS(cookie),
-
-	    TP_STRUCT__entry(
-		    __field(unsigned int,		cookie		)
-			     ),
-
-	    TP_fast_assign(
-		    __entry->cookie		= cookie->debug_id;
-			   ),
-
-	    TP_printk("c=%08x", __entry->cookie)
-	    );
-
 TRACE_EVENT(fscache_op,
 	    TP_PROTO(struct fscache_cookie *cookie, struct fscache_operation *op,
 		     enum fscache_op_trace why),
@@ -440,83 +322,6 @@ TRACE_EVENT(fscache_op,
 		      __print_symbolic(__entry->why, fscache_op_traces))
 	    );
 
-TRACE_EVENT(fscache_page_op,
-	    TP_PROTO(struct fscache_cookie *cookie, struct page *page,
-		     struct fscache_operation *op, enum fscache_page_op_trace what),
-
-	    TP_ARGS(cookie, page, op, what),
-
-	    TP_STRUCT__entry(
-		    __field(unsigned int,		cookie		)
-		    __field(unsigned int,		op		)
-		    __field(pgoff_t,			page		)
-		    __field(enum fscache_page_op_trace,	what		)
-			     ),
-
-	    TP_fast_assign(
-		    __entry->cookie		= cookie->debug_id;
-		    __entry->page		= page ? page->index : 0;
-		    __entry->op			= op->debug_id;
-		    __entry->what		= what;
-			   ),
-
-	    TP_printk("c=%08x %s pg=%lx op=%08x",
-		      __entry->cookie,
-		      __print_symbolic(__entry->what, fscache_page_op_traces),
-		      __entry->page, __entry->op)
-	    );
-
-TRACE_EVENT(fscache_wrote_page,
-	    TP_PROTO(struct fscache_cookie *cookie, struct page *page,
-		     struct fscache_operation *op, int ret),
-
-	    TP_ARGS(cookie, page, op, ret),
-
-	    TP_STRUCT__entry(
-		    __field(unsigned int,		cookie		)
-		    __field(unsigned int,		op		)
-		    __field(pgoff_t,			page		)
-		    __field(int,			ret		)
-			     ),
-
-	    TP_fast_assign(
-		    __entry->cookie		= cookie->debug_id;
-		    __entry->page		= page->index;
-		    __entry->op			= op->debug_id;
-		    __entry->ret		= ret;
-			   ),
-
-	    TP_printk("c=%08x pg=%lx op=%08x ret=%d",
-		      __entry->cookie, __entry->page, __entry->op, __entry->ret)
-	    );
-
-TRACE_EVENT(fscache_gang_lookup,
-	    TP_PROTO(struct fscache_cookie *cookie, struct fscache_operation *op,
-		     void **results, int n, pgoff_t store_limit),
-
-	    TP_ARGS(cookie, op, results, n, store_limit),
-
-	    TP_STRUCT__entry(
-		    __field(unsigned int,		cookie		)
-		    __field(unsigned int,		op		)
-		    __field(pgoff_t,			results0	)
-		    __field(int,			n		)
-		    __field(pgoff_t,			store_limit	)
-			     ),
-
-	    TP_fast_assign(
-		    __entry->cookie		= cookie->debug_id;
-		    __entry->op			= op->debug_id;
-		    __entry->results0		= results[0] ? ((struct page *)results[0])->index : (pgoff_t)-1;
-		    __entry->n			= n;
-		    __entry->store_limit	= store_limit;
-			   ),
-
-	    TP_printk("c=%08x op=%08x r0=%lx n=%d sl=%lx",
-		      __entry->cookie, __entry->op, __entry->results0, __entry->n,
-		      __entry->store_limit)
-	    );
-
 #endif /* _TRACE_FSCACHE_H */
 
 /* This part must be outside protection */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

