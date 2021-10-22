Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F2E437E59
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634929977;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vIzUN0W6/JS3fsr6xrPw9b7oisJmEM7XUwZ5PHyQAbI=;
	b=BdvjY+TiyhAXEXIPKwcLaT+9FTrhkaBq8xqDkKH+2htBDxkioi3c/lY6ZRouI4GmU5fqZP
	TPA4rZ5j1qfazac/JyYDFuOIwO/ArQvY4Y+qTTgM3ExAjGutzYobyw2JiWon0Et1bY8egC
	9uyATBMvnl1aMzn+z1sIpzkl9kDCLEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-PqfmcH4DP8qwuKh9nisSqw-1; Fri, 22 Oct 2021 15:12:53 -0400
X-MC-Unique: PqfmcH4DP8qwuKh9nisSqw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 251E7806688;
	Fri, 22 Oct 2021 19:12:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 173BE17CEE;
	Fri, 22 Oct 2021 19:12:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0453D1800B9E;
	Fri, 22 Oct 2021 19:12:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJ6b3r012733 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:06:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60AE1ADFA; Fri, 22 Oct 2021 19:06:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55B7FADF9;
	Fri, 22 Oct 2021 19:06:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Fri, 22 Oct 2021 20:06:30 +0100
Message-ID: <163492959048.1038219.6773991742270553590.stgit@warthog.procyon.org.uk>
In-Reply-To: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Jeff Layton <jlayton@kernel.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH v2 32/53] cachefiles: Add a couple of
 tracepoints for logging errors
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add two trace points to log errors, one for vfs operations like mkdir or
create, and one for I/O operations, like read, write or truncate.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/cachefiles/internal.h          |    4 ++
 include/trace/events/cachefiles.h |   94 +++++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 11dcf9dbcf05..d615213a2fa1 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -68,6 +68,8 @@ struct cachefiles_object {
 	enum cachefiles_content		content_info:8;	/* Info about content presence */
 };
 
+extern struct kmem_cache *cachefiles_object_jar;
+
 /*
  * Cache files cache definition
  */
@@ -110,6 +112,8 @@ struct cachefiles_cache {
 	char				*tag;		/* cache binding tag */
 };
 
+#include <trace/events/cachefiles.h>
+
 /*
  * error_inject.c
  */
diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index 5ee0aabb20be..9bd5a8a60801 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -18,11 +18,49 @@
 #ifndef __CACHEFILES_DECLARE_TRACE_ENUMS_ONCE_ONLY
 #define __CACHEFILES_DECLARE_TRACE_ENUMS_ONCE_ONLY
 
+enum cachefiles_error_trace {
+	cachefiles_trace_fallocate_error,
+	cachefiles_trace_getxattr_error,
+	cachefiles_trace_link_error,
+	cachefiles_trace_lookup_error,
+	cachefiles_trace_mkdir_error,
+	cachefiles_trace_notify_change_error,
+	cachefiles_trace_open_error,
+	cachefiles_trace_read_error,
+	cachefiles_trace_remxattr_error,
+	cachefiles_trace_rename_error,
+	cachefiles_trace_seek_error,
+	cachefiles_trace_setxattr_error,
+	cachefiles_trace_statfs_error,
+	cachefiles_trace_tmpfile_error,
+	cachefiles_trace_trunc_error,
+	cachefiles_trace_unlink_error,
+	cachefiles_trace_write_error,
+};
+
 #endif
 
 /*
  * Define enum -> string mappings for display.
  */
+#define cachefiles_error_traces						\
+	EM(cachefiles_trace_fallocate_error,	"fallocate")		\
+	EM(cachefiles_trace_getxattr_error,	"getxattr")		\
+	EM(cachefiles_trace_link_error,		"link")			\
+	EM(cachefiles_trace_lookup_error,	"lookup")		\
+	EM(cachefiles_trace_mkdir_error,	"mkdir")		\
+	EM(cachefiles_trace_notify_change_error, "notify_change")	\
+	EM(cachefiles_trace_open_error,		"open")			\
+	EM(cachefiles_trace_read_error,		"read")			\
+	EM(cachefiles_trace_remxattr_error,	"remxattr")		\
+	EM(cachefiles_trace_rename_error,	"rename")		\
+	EM(cachefiles_trace_seek_error,		"seek")			\
+	EM(cachefiles_trace_setxattr_error,	"setxattr")		\
+	EM(cachefiles_trace_statfs_error,	"statfs")		\
+	EM(cachefiles_trace_tmpfile_error,	"tmpfile")		\
+	EM(cachefiles_trace_trunc_error,	"trunc")		\
+	EM(cachefiles_trace_unlink_error,	"unlink")		\
+	E_(cachefiles_trace_write_error,	"write")
 
 
 /*
@@ -33,6 +71,8 @@
 #define EM(a, b) TRACE_DEFINE_ENUM(a);
 #define E_(a, b) TRACE_DEFINE_ENUM(a);
 
+cachefiles_error_traces;
+
 /*
  * Now redefine the EM() and E_() macros to map the enums to the strings that
  * will be printed in the output.
@@ -43,6 +83,60 @@
 #define E_(a, b)	{ a, b }
 
 
+TRACE_EVENT(cachefiles_vfs_error,
+	    TP_PROTO(struct cachefiles_object *obj, struct inode *backer,
+		     int error, enum cachefiles_error_trace where),
+
+	    TP_ARGS(obj, backer, error, where),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,			obj	)
+		    __field(unsigned int,			backer	)
+		    __field(enum cachefiles_error_trace,	where	)
+		    __field(short,				error	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj ? obj->debug_id : 0;
+		    __entry->backer	= backer->i_ino;
+		    __entry->error	= error;
+		    __entry->where	= where;
+			   ),
+
+	    TP_printk("o=%08x b=%08x %s e=%d",
+		      __entry->obj,
+		      __entry->backer,
+		      __print_symbolic(__entry->where, cachefiles_error_traces),
+		      __entry->error)
+	    );
+
+TRACE_EVENT(cachefiles_io_error,
+	    TP_PROTO(struct cachefiles_object *obj, struct inode *backer,
+		     int error, enum cachefiles_error_trace where),
+
+	    TP_ARGS(obj, backer, error, where),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,			obj	)
+		    __field(unsigned int,			backer	)
+		    __field(enum cachefiles_error_trace,	where	)
+		    __field(short,				error	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj ? obj->debug_id : 0;
+		    __entry->backer	= backer->i_ino;
+		    __entry->error	= error;
+		    __entry->where	= where;
+			   ),
+
+	    TP_printk("o=%08x b=%08x %s e=%d",
+		      __entry->obj,
+		      __entry->backer,
+		      __print_symbolic(__entry->where, cachefiles_error_traces),
+		      __entry->error)
+	    );
+
 #endif /* _TRACE_CACHEFILES_H */
 
 /* This part must be outside protection */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

