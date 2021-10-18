Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F23B243212B
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 16:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569190;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GPpJMAo/MuWaUU2Zz/4BtI1I2fRovxvV2NHAwR/Ltp8=;
	b=MvDZLNIw1+iPQivfHCQZUJQFOE4qY11fV1rJMfBtpezKU9UNAjXzYpcqhbpa0MnSLKcnWM
	ZP36hoi4koPigT8x0sp6c6ou95P5Ce6JS2ztYgxpuENUXcW9bhYbxUT1zEtUDi7eDy2GZQ
	b9y8xahO5EtsYBKrWl7J35ZNyZ7BDZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-Kf4u0HZxPF6PqfZ35iuPPw-1; Mon, 18 Oct 2021 10:59:46 -0400
X-MC-Unique: Kf4u0HZxPF6PqfZ35iuPPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACDC68735D7;
	Mon, 18 Oct 2021 14:59:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F43870953;
	Mon, 18 Oct 2021 14:59:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A18C4EA2F;
	Mon, 18 Oct 2021 14:59:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IExhZR028952 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 10:59:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60FCF197FC; Mon, 18 Oct 2021 14:59:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3841760657;
	Mon, 18 Oct 2021 14:59:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 15:59:39 +0100
Message-ID: <163456917935.2614702.1886040219032881319.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Subject: [Linux-cachefs] [PATCH 33/67] cachefiles: Trace decisions in
 cachefiles_prepare_read()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a tracepoint to log decisions made in cachefiles_prepare_read() about
what it's going to request for the next subrequest and why.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/io.c                |   22 +++++++++++--
 fs/cachefiles/main.c              |    2 +
 include/trace/events/cachefiles.h |   64 +++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+), 3 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index e5c29c0decea..c05f64cdfd0e 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -303,6 +303,7 @@ static int cachefiles_write(struct netfs_cache_resources *cres,
 static enum netfs_read_source cachefiles_prepare_read(struct netfs_read_subrequest *subreq,
 						      loff_t i_size)
 {
+	enum cachefiles_prepare_read_trace why;
 	struct netfs_read_request *rreq = subreq->rreq;
 	struct netfs_cache_resources *cres = &rreq->cache_resources;
 	struct cachefiles_object *object;
@@ -312,26 +313,31 @@ static enum netfs_read_source cachefiles_prepare_read(struct netfs_read_subreque
 	struct file *file = cachefiles_cres_file(cres);
 	enum netfs_read_source ret = NETFS_DOWNLOAD_FROM_SERVER;
 	loff_t off, to;
+	ino_t ino = file ? file_inode(file)->i_ino : 0;
 
 	_enter("%zx @%llx/%llx", subreq->len, subreq->start, i_size);
 
 	if (subreq->start >= i_size) {
 		ret = NETFS_FILL_WITH_ZEROES;
+		why = cachefiles_trace_read_after_eof;
 		goto out_no_object;
 	}
 
 	if (test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags)) {
 		__set_bit(NETFS_SREQ_WRITE_TO_CACHE, &subreq->flags);
+		why = cachefiles_trace_read_no_data;
 		goto out_no_object;
 	}
 
 	/* The object and the file may be being created in the background. */
 	if (!file) {
+		why = cachefiles_trace_read_no_file;
 		if (!fscache_wait_for_operation(cres, FSCACHE_WANT_READ))
 			goto out_no_object;
 		file = cachefiles_cres_file(cres);
 		if (!file)
 			goto out_no_object;
+		ino = file_inode(file)->i_ino;
 	}
 
 	object = cachefiles_cres_object(cres);
@@ -340,23 +346,31 @@ static enum netfs_read_source cachefiles_prepare_read(struct netfs_read_subreque
 
 	off = vfs_llseek(file, subreq->start, SEEK_DATA);
 	if (off < 0 && off >= (loff_t)-MAX_ERRNO) {
-		if (off == (loff_t)-ENXIO)
+		if (off == (loff_t)-ENXIO) {
+			why = cachefiles_trace_read_seek_nxio;
 			goto download_and_store;
+		}
+		why = cachefiles_trace_read_seek_error;
 		goto out;
 	}
 
-	if (off >= subreq->start + subreq->len)
+	if (off >= subreq->start + subreq->len) {
+		why = cachefiles_trace_read_found_hole;
 		goto download_and_store;
+	}
 
 	if (off > subreq->start) {
 		off = round_up(off, cache->bsize);
 		subreq->len = off - subreq->start;
+		why = cachefiles_trace_read_found_part;
 		goto download_and_store;
 	}
 
 	to = vfs_llseek(file, subreq->start, SEEK_HOLE);
-	if (to < 0 && to >= (loff_t)-MAX_ERRNO)
+	if (to < 0 && to >= (loff_t)-MAX_ERRNO) {
+		why = cachefiles_trace_read_seek_error;
 		goto out;
+	}
 
 	if (to < subreq->start + subreq->len) {
 		if (subreq->start + subreq->len >= i_size)
@@ -366,6 +380,7 @@ static enum netfs_read_source cachefiles_prepare_read(struct netfs_read_subreque
 		subreq->len = to - subreq->start;
 	}
 
+	why = cachefiles_trace_read_have_data;
 	ret = NETFS_READ_FROM_CACHE;
 	goto out;
 
@@ -375,6 +390,7 @@ static enum netfs_read_source cachefiles_prepare_read(struct netfs_read_subreque
 out:
 	cachefiles_end_secure(cache, saved_cred);
 out_no_object:
+	trace_cachefiles_prep_read(subreq, ret, why, ino);
 	return ret;
 }
 
diff --git a/fs/cachefiles/main.c b/fs/cachefiles/main.c
index dc7731812b98..522fda828563 100644
--- a/fs/cachefiles/main.c
+++ b/fs/cachefiles/main.c
@@ -18,6 +18,8 @@
 #include <linux/statfs.h>
 #include <linux/sysctl.h>
 #include <linux/miscdevice.h>
+#include <linux/netfs.h>
+#include <trace/events/netfs.h>
 #define CREATE_TRACE_POINTS
 #include "internal.h"
 
diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index d98adabce92e..d63e5fb46d27 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -60,6 +60,17 @@ enum cachefiles_trunc_trace {
 	cachefiles_trunc_shrink,
 };
 
+enum cachefiles_prepare_read_trace {
+	cachefiles_trace_read_after_eof,
+	cachefiles_trace_read_found_hole,
+	cachefiles_trace_read_found_part,
+	cachefiles_trace_read_have_data,
+	cachefiles_trace_read_no_data,
+	cachefiles_trace_read_no_file,
+	cachefiles_trace_read_seek_error,
+	cachefiles_trace_read_seek_nxio,
+};
+
 #endif
 
 /*
@@ -103,6 +114,17 @@ enum cachefiles_trunc_trace {
 	EM(cachefiles_trunc_dio_adjust,		"DIOADJ")		\
 	E_(cachefiles_trunc_shrink,		"SHRINK")
 
+#define cachefiles_prepare_read_traces					\
+	EM(cachefiles_trace_read_after_eof,	"after-eof ")		\
+	EM(cachefiles_trace_read_found_hole,	"found-hole")		\
+	EM(cachefiles_trace_read_found_part,	"found-part")		\
+	EM(cachefiles_trace_read_have_data,	"have-data ")		\
+	EM(cachefiles_trace_read_no_data,	"no-data   ")		\
+	EM(cachefiles_trace_read_no_file,	"no-file   ")		\
+	EM(cachefiles_trace_read_seek_error,	"seek-error")		\
+	E_(cachefiles_trace_read_seek_nxio,	"seek-enxio")
+
+
 /*
  * Export enum symbols via userspace.
  */
@@ -115,6 +137,7 @@ cachefiles_obj_kill_traces;
 cachefiles_obj_ref_traces;
 cachefiles_coherency_traces;
 cachefiles_trunc_traces;
+cachefiles_prepare_read_traces;
 
 /*
  * Now redefine the EM() and E_() macros to map the enums to the strings that
@@ -324,6 +347,47 @@ TRACE_EVENT(cachefiles_coherency,
 		      __entry->content)
 	    );
 
+TRACE_EVENT(cachefiles_prep_read,
+	    TP_PROTO(struct netfs_read_subrequest *sreq,
+		     enum netfs_read_source source,
+		     enum cachefiles_prepare_read_trace why,
+		     ino_t cache_inode),
+
+	    TP_ARGS(sreq, source, why, cache_inode),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,		rreq		)
+		    __field(unsigned short,		index		)
+		    __field(unsigned short,		flags		)
+		    __field(enum netfs_read_source,	source		)
+		    __field(enum cachefiles_prepare_read_trace,	why	)
+		    __field(size_t,			len		)
+		    __field(loff_t,			start		)
+		    __field(unsigned int,		netfs_inode	)
+		    __field(unsigned int,		cache_inode	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->rreq	= sreq->rreq->debug_id;
+		    __entry->index	= sreq->debug_index;
+		    __entry->flags	= sreq->flags;
+		    __entry->source	= source;
+		    __entry->why	= why;
+		    __entry->len	= sreq->len;
+		    __entry->start	= sreq->start;
+		    __entry->netfs_inode = sreq->rreq->inode->i_ino;
+		    __entry->cache_inode = cache_inode;
+			   ),
+
+	    TP_printk("R=%08x[%u] %s %s f=%02x s=%llx %zx ni=%x b=%x",
+		      __entry->rreq, __entry->index,
+		      __print_symbolic(__entry->source, netfs_sreq_sources),
+		      __print_symbolic(__entry->why, cachefiles_prepare_read_traces),
+		      __entry->flags,
+		      __entry->start, __entry->len,
+		      __entry->netfs_inode, __entry->cache_inode)
+	    );
+
 TRACE_EVENT(cachefiles_read,
 	    TP_PROTO(struct cachefiles_object *obj,
 		     struct inode *backer,


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

