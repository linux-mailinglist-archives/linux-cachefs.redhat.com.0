Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1C72BAD1D
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 16:10:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605885052;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CS4Yd6Ary3bZRNTxBueM82FhmLxPtcOQ84h6QcyDuMw=;
	b=NeHBQNnyhBdMAzIf6NyIdBLCkvKM2VK5cP5wmT5Y5pvVaS4BNPykWF9gnrYsP7IQn4Dbwo
	KkNrslvDmM3cC0B7gCT9ivUZpVLtKd8M9VqlAAFZTB5TTXAS7YZTW72402RzFWMDI2Ku4e
	Ginp1ZJpAMr3FhJIWuG5ZpdG67U7+GY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-l_Z2TlRxM7a9g-JOvdSfLg-1; Fri, 20 Nov 2020 10:10:50 -0500
X-MC-Unique: l_Z2TlRxM7a9g-JOvdSfLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E32C3C73A3;
	Fri, 20 Nov 2020 15:10:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D45E060C05;
	Fri, 20 Nov 2020 15:10:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF3AA180954D;
	Fri, 20 Nov 2020 15:10:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKFAjOK014327 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 10:10:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9FCCF60BD8; Fri, 20 Nov 2020 15:10:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-246.rdu2.redhat.com
	[10.10.112.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A435D189A4;
	Fri, 20 Nov 2020 15:10:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Fri, 20 Nov 2020 15:10:38 +0000
Message-ID: <160588503886.3465195.6396776488623638977.stgit@warthog.procyon.org.uk>
In-Reply-To: <160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk>
References: <160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [RFC PATCH 37/76] cachefiles: trace: Log coherency
	checks
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a cachefiles tracepoint that logs the result of coherency management
when the coherency data on a file in the cache is checked or committed.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/xattr.c             |   45 ++++++++++++++++++++++--------
 include/trace/events/cachefiles.h |   56 +++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+), 12 deletions(-)

diff --git a/fs/cachefiles/xattr.c b/fs/cachefiles/xattr.c
index 75a2a6b70e4a..19db19b7d7db 100644
--- a/fs/cachefiles/xattr.c
+++ b/fs/cachefiles/xattr.c
@@ -125,12 +125,21 @@ int cachefiles_set_object_xattr(struct cachefiles_object *object,
 	ret = vfs_setxattr(dentry, cachefiles_xattr_cache,
 			   buf, sizeof(struct cachefiles_xattr) + len,
 			   xattr_flags);
-	kfree(buf);
-	if (ret < 0 && ret != -ENOMEM)
-		cachefiles_io_error_obj(
-			object,
-			"Failed to set xattr with error %d", ret);
+	if (ret < 0) {
+		trace_cachefiles_coherency(object, d_inode(dentry)->i_ino,
+					   0,
+					   cachefiles_coherency_set_fail);
+		if (ret != -ENOMEM)
+			cachefiles_io_error_obj(
+				object,
+				"Failed to set xattr with error %d", ret);
+	} else {
+		trace_cachefiles_coherency(object, d_inode(dentry)->i_ino,
+					   0,
+					   cachefiles_coherency_set_ok);
+	}
 
+	kfree(buf);
 	_leave(" = %d", ret);
 	return ret;
 }
@@ -144,7 +153,9 @@ int cachefiles_check_auxdata(struct cachefiles_object *object)
 	struct dentry *dentry = object->dentry;
 	unsigned int len = object->fscache.cookie->aux_len, tlen;
 	const void *p = fscache_get_aux(object->fscache.cookie);
-	ssize_t ret;
+	enum cachefiles_coherency_trace why;
+	ssize_t xlen;
+	int ret = -ESTALE;
 
 	ASSERT(dentry);
 	ASSERT(d_backing_inode(dentry));
@@ -154,14 +165,24 @@ int cachefiles_check_auxdata(struct cachefiles_object *object)
 	if (!buf)
 		return -ENOMEM;
 
-	ret = vfs_getxattr(dentry, cachefiles_xattr_cache, buf, tlen);
-	if (ret == tlen &&
-	    buf->type == object->fscache.cookie->type &&
-	    memcmp(buf->data, p, len) == 0)
+	xlen = vfs_getxattr(dentry, cachefiles_xattr_cache, buf, tlen);
+	if (xlen != tlen) {
+		if (xlen == -EIO)
+			cachefiles_io_error_obj(
+				object,
+				"Failed to read aux with error %zd", xlen);
+		why = cachefiles_coherency_check_xattr;
+	} else if (buf->type != object->fscache.cookie->type) {
+		why = cachefiles_coherency_check_type;
+	} else if (memcmp(buf->data, p, len) != 0) {
+		why = cachefiles_coherency_check_aux;
+	} else {
+		why = cachefiles_coherency_check_ok;
 		ret = 0;
-	else
-		ret = -ESTALE;
+	}
 
+	trace_cachefiles_coherency(object, d_inode(dentry)->i_ino,
+				   0, why);
 	kfree(buf);
 	return ret;
 }
diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index 0aa3f3126f6e..bf588c3f4a07 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -24,6 +24,19 @@ enum cachefiles_obj_ref_trace {
 	cachefiles_obj_ref__nr_traces
 };
 
+enum cachefiles_coherency_trace {
+	cachefiles_coherency_check_aux,
+	cachefiles_coherency_check_content,
+	cachefiles_coherency_check_dirty,
+	cachefiles_coherency_check_len,
+	cachefiles_coherency_check_objsize,
+	cachefiles_coherency_check_ok,
+	cachefiles_coherency_check_type,
+	cachefiles_coherency_check_xattr,
+	cachefiles_coherency_set_fail,
+	cachefiles_coherency_set_ok,
+};
+
 #endif
 
 /*
@@ -56,6 +69,18 @@ enum cachefiles_obj_ref_trace {
 	EM(cachefiles_obj_put_wait_retry,	"PUT wait_retry")	\
 	E_(cachefiles_obj_put_wait_timeo,	"PUT wait_timeo")
 
+#define cachefiles_coherency_traces					\
+	EM(cachefiles_coherency_check_aux,	"BAD aux ")		\
+	EM(cachefiles_coherency_check_content,	"BAD cont")		\
+	EM(cachefiles_coherency_check_dirty,	"BAD dirt")		\
+	EM(cachefiles_coherency_check_len,	"BAD len ")		\
+	EM(cachefiles_coherency_check_objsize,	"BAD osiz")		\
+	EM(cachefiles_coherency_check_ok,	"OK      ")		\
+	EM(cachefiles_coherency_check_type,	"BAD type")		\
+	EM(cachefiles_coherency_check_xattr,	"BAD xatt")		\
+	EM(cachefiles_coherency_set_fail,	"SET fail")		\
+	E_(cachefiles_coherency_set_ok,		"SET ok  ")
+
 /*
  * Export enum symbols via userspace.
  */
@@ -66,6 +91,7 @@ enum cachefiles_obj_ref_trace {
 
 cachefiles_obj_kill_traces;
 cachefiles_obj_ref_traces;
+cachefiles_coherency_traces;
 
 /*
  * Now redefine the EM() and E_() macros to map the enums to the strings that
@@ -295,6 +321,36 @@ TRACE_EVENT(cachefiles_mark_buried,
 		      __print_symbolic(__entry->why, cachefiles_obj_kill_traces))
 	    );
 
+TRACE_EVENT(cachefiles_coherency,
+	    TP_PROTO(struct cachefiles_object *obj,
+		     ino_t ino,
+		     int content,
+		     enum cachefiles_coherency_trace why),
+
+	    TP_ARGS(obj, ino, content, why),
+
+	    /* Note that obj may be NULL */
+	    TP_STRUCT__entry(
+		    __field(unsigned int,			obj	)
+		    __field(enum cachefiles_coherency_trace,	why	)
+		    __field(int,				content	)
+		    __field(u64,				ino	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj->fscache.debug_id;
+		    __entry->why	= why;
+		    __entry->content	= content;
+		    __entry->ino	= ino;
+			   ),
+
+	    TP_printk("o=%08x %s i=%llx c=%u",
+		      __entry->obj,
+		      __print_symbolic(__entry->why, cachefiles_coherency_traces),
+		      __entry->ino,
+		      __entry->content)
+	    );
+
 #endif /* _TRACE_CACHEFILES_H */
 
 /* This part must be outside protection */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

