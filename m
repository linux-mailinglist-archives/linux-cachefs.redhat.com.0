Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF5346F09C
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Dec 2021 18:06:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639069614;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wFZGPHzEWC6Cwksfxc0J1BUtCv/nXN28bSUlcQtmWEA=;
	b=hGkqI4SOCkRDZTHWoqmc56rjr3mW7K1v5DNiIh1G/ad3M1dnnT97KWsjWlRuE2Q6NbCNuT
	ikd0affCEVI4hDkRGhE2RKQEddv3iq0C8tEnwFjp4KHP40uxcdv1pEBEJ5z2QYbzggOJH/
	adYxmwl9GAJsHYoo8g+PDIY5HxrZWl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-174-AcBsJ-WxNSOV_KMcjcY4Sw-1; Thu, 09 Dec 2021 12:06:53 -0500
X-MC-Unique: AcBsJ-WxNSOV_KMcjcY4Sw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC37D10168C8;
	Thu,  9 Dec 2021 17:06:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC2606B8EF;
	Thu,  9 Dec 2021 17:06:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 451584A709;
	Thu,  9 Dec 2021 17:06:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B9H3AoA019333 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 9 Dec 2021 12:03:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 713964ABB5; Thu,  9 Dec 2021 17:03:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 17AC71B472;
	Thu,  9 Dec 2021 17:03:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 09 Dec 2021 17:03:03 +0000
Message-ID: <163906938316.143852.17227990869551737803.stgit@warthog.procyon.org.uk>
In-Reply-To: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
References: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH v2 42/67] cachefiles: Add tracepoints for
	calls to the VFS
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

Add tracepoints in cachefiles to monitor when it does various VFS
operations, such as mkdir.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819638517.215744.12773133137536579766.stgit@warthog.procyon.org.uk/ # v1
---

 include/trace/events/cachefiles.h |  176 +++++++++++++++++++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index 29fdcfddbbc2..b548dbaf85bb 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -18,6 +18,21 @@
 #ifndef __CACHEFILES_DECLARE_TRACE_ENUMS_ONCE_ONLY
 #define __CACHEFILES_DECLARE_TRACE_ENUMS_ONCE_ONLY
 
+enum fscache_why_object_killed {
+	FSCACHE_OBJECT_IS_STALE,
+	FSCACHE_OBJECT_IS_WEIRD,
+	FSCACHE_OBJECT_INVALIDATED,
+	FSCACHE_OBJECT_NO_SPACE,
+	FSCACHE_OBJECT_WAS_RETIRED,
+	FSCACHE_OBJECT_WAS_CULLED,
+};
+
+enum cachefiles_trunc_trace {
+	cachefiles_trunc_dio_adjust,
+	cachefiles_trunc_expand_tmpfile,
+	cachefiles_trunc_shrink,
+};
+
 enum cachefiles_error_trace {
 	cachefiles_trace_fallocate_error,
 	cachefiles_trace_getxattr_error,
@@ -43,6 +58,19 @@ enum cachefiles_error_trace {
 /*
  * Define enum -> string mappings for display.
  */
+#define cachefiles_obj_kill_traces				\
+	EM(FSCACHE_OBJECT_IS_STALE,	"stale")		\
+	EM(FSCACHE_OBJECT_IS_WEIRD,	"weird")		\
+	EM(FSCACHE_OBJECT_INVALIDATED,	"inval")		\
+	EM(FSCACHE_OBJECT_NO_SPACE,	"no_space")		\
+	EM(FSCACHE_OBJECT_WAS_RETIRED,	"was_retired")		\
+	E_(FSCACHE_OBJECT_WAS_CULLED,	"was_culled")
+
+#define cachefiles_trunc_traces						\
+	EM(cachefiles_trunc_dio_adjust,		"DIOADJ")		\
+	EM(cachefiles_trunc_expand_tmpfile,	"EXPTMP")		\
+	E_(cachefiles_trunc_shrink,		"SHRINK")
+
 #define cachefiles_error_traces						\
 	EM(cachefiles_trace_fallocate_error,	"fallocate")		\
 	EM(cachefiles_trace_getxattr_error,	"getxattr")		\
@@ -71,6 +99,8 @@ enum cachefiles_error_trace {
 #define EM(a, b) TRACE_DEFINE_ENUM(a);
 #define E_(a, b) TRACE_DEFINE_ENUM(a);
 
+cachefiles_obj_kill_traces;
+cachefiles_trunc_traces;
 cachefiles_error_traces;
 
 /*
@@ -83,6 +113,152 @@ cachefiles_error_traces;
 #define E_(a, b)	{ a, b }
 
 
+TRACE_EVENT(cachefiles_lookup,
+	    TP_PROTO(struct cachefiles_object *obj,
+		     struct dentry *de),
+
+	    TP_ARGS(obj, de),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,		obj	)
+		    __field(short,			error	)
+		    __field(unsigned long,		ino	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj->debug_id;
+		    __entry->ino	= (!IS_ERR(de) && d_backing_inode(de) ?
+					   d_backing_inode(de)->i_ino : 0);
+		    __entry->error	= IS_ERR(de) ? PTR_ERR(de) : 0;
+			   ),
+
+	    TP_printk("o=%08x i=%lx e=%d",
+		      __entry->obj, __entry->ino, __entry->error)
+	    );
+
+TRACE_EVENT(cachefiles_tmpfile,
+	    TP_PROTO(struct cachefiles_object *obj, struct inode *backer),
+
+	    TP_ARGS(obj, backer),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,			obj	)
+		    __field(unsigned int,			backer	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj->debug_id;
+		    __entry->backer	= backer->i_ino;
+			   ),
+
+	    TP_printk("o=%08x b=%08x",
+		      __entry->obj,
+		      __entry->backer)
+	    );
+
+TRACE_EVENT(cachefiles_link,
+	    TP_PROTO(struct cachefiles_object *obj, struct inode *backer),
+
+	    TP_ARGS(obj, backer),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,			obj	)
+		    __field(unsigned int,			backer	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj->debug_id;
+		    __entry->backer	= backer->i_ino;
+			   ),
+
+	    TP_printk("o=%08x b=%08x",
+		      __entry->obj,
+		      __entry->backer)
+	    );
+
+TRACE_EVENT(cachefiles_unlink,
+	    TP_PROTO(struct cachefiles_object *obj,
+		     struct dentry *de,
+		     enum fscache_why_object_killed why),
+
+	    TP_ARGS(obj, de, why),
+
+	    /* Note that obj may be NULL */
+	    TP_STRUCT__entry(
+		    __field(unsigned int,		obj		)
+		    __field(struct dentry *,		de		)
+		    __field(enum fscache_why_object_killed, why		)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj ? obj->debug_id : UINT_MAX;
+		    __entry->de		= de;
+		    __entry->why	= why;
+			   ),
+
+	    TP_printk("o=%08x d=%p w=%s",
+		      __entry->obj, __entry->de,
+		      __print_symbolic(__entry->why, cachefiles_obj_kill_traces))
+	    );
+
+TRACE_EVENT(cachefiles_rename,
+	    TP_PROTO(struct cachefiles_object *obj,
+		     struct dentry *de,
+		     struct dentry *to,
+		     enum fscache_why_object_killed why),
+
+	    TP_ARGS(obj, de, to, why),
+
+	    /* Note that obj may be NULL */
+	    TP_STRUCT__entry(
+		    __field(unsigned int,		obj		)
+		    __field(struct dentry *,		de		)
+		    __field(struct dentry *,		to		)
+		    __field(enum fscache_why_object_killed, why		)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj ? obj->debug_id : UINT_MAX;
+		    __entry->de		= de;
+		    __entry->to		= to;
+		    __entry->why	= why;
+			   ),
+
+	    TP_printk("o=%08x d=%p t=%p w=%s",
+		      __entry->obj, __entry->de, __entry->to,
+		      __print_symbolic(__entry->why, cachefiles_obj_kill_traces))
+	    );
+
+TRACE_EVENT(cachefiles_trunc,
+	    TP_PROTO(struct cachefiles_object *obj, struct inode *backer,
+		     loff_t from, loff_t to, enum cachefiles_trunc_trace why),
+
+	    TP_ARGS(obj, backer, from, to, why),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,			obj	)
+		    __field(unsigned int,			backer	)
+		    __field(enum cachefiles_trunc_trace,	why	)
+		    __field(loff_t,				from	)
+		    __field(loff_t,				to	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj->debug_id;
+		    __entry->backer	= backer->i_ino;
+		    __entry->from	= from;
+		    __entry->to		= to;
+		    __entry->why	= why;
+			   ),
+
+	    TP_printk("o=%08x b=%08x %s l=%llx->%llx",
+		      __entry->obj,
+		      __entry->backer,
+		      __print_symbolic(__entry->why, cachefiles_trunc_traces),
+		      __entry->from,
+		      __entry->to)
+	    );
+
 TRACE_EVENT(cachefiles_mark_active,
 	    TP_PROTO(struct cachefiles_object *obj,
 		     struct inode *inode),


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

