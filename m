Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5837C432106
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 16:58:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569087;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lNI7oKnJmZgz30VUAtHJdg/eSX9WnpyvZneYuJbw15Q=;
	b=aI2wAKnYgCQxFieQF0tamaw+whzWSyt3IspCJJWWd62WdlHmdGuUr0l45LMUHfW2UgBdyT
	8ZQVoN425eRN8lvCnZjk9sgsClxVOGKNzscfNosyInxes39JraFXQ/R5oHUX2tBDqoCW4q
	JyKyEN9PobrIdO+kRCmtZt6ViMPIngw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-mtJNLnNiMK2A_gXQmkPRIA-1; Mon, 18 Oct 2021 10:58:04 -0400
X-MC-Unique: mtJNLnNiMK2A_gXQmkPRIA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 197B018D6A35;
	Mon, 18 Oct 2021 14:58:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08F5260CC4;
	Mon, 18 Oct 2021 14:58:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2EAF4EA2A;
	Mon, 18 Oct 2021 14:58:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IEvx6g028708 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 10:57:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 12D0870F63; Mon, 18 Oct 2021 14:57:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 08C63641AB;
	Mon, 18 Oct 2021 14:57:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 15:57:52 +0100
Message-ID: <163456907226.2614702.16135532021542996215.stgit@warthog.procyon.org.uk>
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
Subject: [Linux-cachefs] [PATCH 29/67] cachefiles: Trace read and write
	operations
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add tracepoints for read and write operations on cache files.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/io.c                |    6 +++-
 include/trace/events/cachefiles.h |   58 +++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 0e1fb44b5d04..f703a93e238b 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -62,6 +62,7 @@ static int cachefiles_read(struct netfs_cache_resources *cres,
 			   netfs_io_terminated_t term_func,
 			   void *term_func_priv)
 {
+	struct cachefiles_object *object = cres->cache_priv;
 	struct cachefiles_kiocb *ki;
 	struct file *file = cachefiles_cres_file(cres);
 	unsigned int old_nofs;
@@ -124,6 +125,7 @@ static int cachefiles_read(struct netfs_cache_resources *cres,
 
 	get_file(ki->iocb.ki_filp);
 
+	trace_cachefiles_read(object, file_inode(file), ki->iocb.ki_pos, len - skipped);
 	old_nofs = memalloc_nofs_save();
 	ret = vfs_iocb_iter_read(file, &ki->iocb, iter);
 	memalloc_nofs_restore(old_nofs);
@@ -188,6 +190,7 @@ static int cachefiles_write(struct netfs_cache_resources *cres,
 			    netfs_io_terminated_t term_func,
 			    void *term_func_priv)
 {
+	struct cachefiles_object *object = cres->cache_priv;
 	struct cachefiles_kiocb *ki;
 	struct inode *inode;
 	struct file *file = cachefiles_cres_file(cres);
@@ -229,6 +232,7 @@ static int cachefiles_write(struct netfs_cache_resources *cres,
 
 	get_file(ki->iocb.ki_filp);
 
+	trace_cachefiles_write(object, inode, ki->iocb.ki_pos, len);
 	old_nofs = memalloc_nofs_save();
 	ret = vfs_iocb_iter_write(file, &ki->iocb, iter);
 	memalloc_nofs_restore(old_nofs);
@@ -418,7 +422,7 @@ int cachefiles_begin_operation(struct netfs_cache_resources *cres)
 
 	_enter("");
 
-	cres->cache_priv	= op;
+	cres->cache_priv	= object;
 	cres->cache_priv2	= get_file(object->file);
 	cres->ops		= &cachefiles_netfs_cache_ops;
 	cres->debug_id		= object->cookie->debug_id;
diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index 09d76c160451..47df44550ad6 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -302,6 +302,64 @@ TRACE_EVENT(cachefiles_coherency,
 		      __entry->content)
 	    );
 
+TRACE_EVENT(cachefiles_read,
+	    TP_PROTO(struct cachefiles_object *obj,
+		     struct inode *backer,
+		     loff_t start,
+		     size_t len),
+
+	    TP_ARGS(obj, backer, start, len),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,			obj	)
+		    __field(unsigned int,			backer	)
+		    __field(size_t,				len	)
+		    __field(loff_t,				start	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj->debug_id;
+		    __entry->backer	= backer->i_ino;
+		    __entry->start	= start;
+		    __entry->len	= len;
+			   ),
+
+	    TP_printk("o=%08x b=%08x s=%llx l=%zx",
+		      __entry->obj,
+		      __entry->backer,
+		      __entry->start,
+		      __entry->len)
+	    );
+
+TRACE_EVENT(cachefiles_write,
+	    TP_PROTO(struct cachefiles_object *obj,
+		     struct inode *backer,
+		     loff_t start,
+		     size_t len),
+
+	    TP_ARGS(obj, backer, start, len),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,			obj	)
+		    __field(unsigned int,			backer	)
+		    __field(size_t,				len	)
+		    __field(loff_t,				start	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj->debug_id;
+		    __entry->backer	= backer->i_ino;
+		    __entry->start	= start;
+		    __entry->len	= len;
+			   ),
+
+	    TP_printk("o=%08x b=%08x s=%llx l=%zx",
+		      __entry->obj,
+		      __entry->backer,
+		      __entry->start,
+		      __entry->len)
+	    );
+
 TRACE_EVENT(cachefiles_trunc,
 	    TP_PROTO(struct cachefiles_object *obj, struct inode *backer,
 		     loff_t from, loff_t to, enum cachefiles_trunc_trace why),


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

