Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A351A21DCD8
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Jul 2020 18:35:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594658109;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3T0STzkDRoEoXbMoMeGS/1FPT+Rp8TP4X7YV+6I3vvM=;
	b=gnwqivSgCXtV73GJ3sAIvq3YRXPqcXRrVLCj99HkRKEo+ivjN9pPIXcRRp4EMmFllywosh
	HfH6n9M2Nn68e8VUUmCzVNaaKfyotql7iPaE2C400nXgZkNNKRCtp+qIl6GYdJN+m5vsbN
	dlILQ+D85Ps5P138YNuY5kUMMc/SNmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-06i1Q77NMtOR2wgpQpKR-A-1; Mon, 13 Jul 2020 12:35:08 -0400
X-MC-Unique: 06i1Q77NMtOR2wgpQpKR-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 255D21800D42;
	Mon, 13 Jul 2020 16:35:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12EEA19D61;
	Mon, 13 Jul 2020 16:35:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0BB2180954D;
	Mon, 13 Jul 2020 16:35:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DGZ3rm027928 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 12:35:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6955E100E870; Mon, 13 Jul 2020 16:35:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-113.rdu2.redhat.com
	[10.10.112.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3B7310021B3;
	Mon, 13 Jul 2020 16:34:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>
Date: Mon, 13 Jul 2020 17:34:57 +0100
Message-ID: <159465809699.1376674.8132002248953593870.stgit@warthog.procyon.org.uk>
In-Reply-To: <159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk>
References: <159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 23/32] cachefiles: Add I/O tracepoints
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


---

 fs/cachefiles/interface.c         |   16 +++--
 fs/cachefiles/io.c                |    2 +
 include/trace/events/cachefiles.h |  123 +++++++++++++++++++++++++++++++++++++
 3 files changed, 136 insertions(+), 5 deletions(-)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 054d5cc794b5..e73de62d0e73 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -160,7 +160,8 @@ static void cachefiles_update_object(struct fscache_object *_object)
 	struct cachefiles_object *object;
 	struct cachefiles_cache *cache;
 	const struct cred *saved_cred;
-	loff_t object_size;
+	struct inode *inode;
+	loff_t object_size, i_size;
 	int ret;
 
 	_enter("{OBJ%x}", _object->debug_id);
@@ -172,12 +173,15 @@ static void cachefiles_update_object(struct fscache_object *_object)
 	cachefiles_begin_secure(cache, &saved_cred);
 
 	object_size = object->fscache.cookie->object_size;
-	if (i_size_read(d_inode(object->dentry)) > object_size) {
+	inode = d_inode(object->dentry);
+	i_size = i_size_read(inode);
+	if (i_size > object_size) {
 		struct path path = {
 			.mnt	= cache->mnt,
 			.dentry	= object->dentry
 		};
-		_debug("trunc %llx -> %llx", i_size_read(d_inode(object->dentry)), object_size);
+		_debug("trunc %llx -> %llx", i_size, object_size);
+		trace_cachefiles_trunc(object, inode, i_size, object_size);
 		ret = vfs_truncate(&path, object_size);
 		if (ret < 0) {
 			cachefiles_io_error_obj(object, "Trunc-to-size failed");
@@ -186,8 +190,10 @@ static void cachefiles_update_object(struct fscache_object *_object)
 		}
 
 		object_size = round_up(object_size, CACHEFILES_DIO_BLOCK_SIZE);
-		_debug("trunc %llx -> %llx", i_size_read(d_inode(object->dentry)), object_size);
-		if (i_size_read(d_inode(object->dentry)) < object_size) {
+		i_size = i_size_read(inode);
+		_debug("trunc %llx -> %llx", i_size, object_size);
+		if (i_size < object_size) {
+			trace_cachefiles_trunc(object, inode, i_size, object_size);
 			ret = vfs_truncate(&path, object_size);
 			if (ret < 0) {
 				cachefiles_io_error_obj(object, "Trunc-to-dio-size failed");
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 42e0d620d778..268e6f69ba9c 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -88,6 +88,7 @@ int cachefiles_read(struct fscache_object *obj,
 		goto presubmission_error_free;
 
 	fscache_get_io_request(req);
+	trace_cachefiles_read(object, file_inode(file), req);
 	ret = call_read_iter(file, &ki->iocb, iter);
 	switch (ret) {
 	case -EIOCBQUEUED:
@@ -198,6 +199,7 @@ int cachefiles_write(struct fscache_object *obj,
 	__sb_writers_release(inode->i_sb, SB_FREEZE_WRITE);
 
 	fscache_get_io_request(req);
+	trace_cachefiles_write(object, inode, req);
 	ret = call_write_iter(file, &ki->iocb, iter);
 	switch (ret) {
 	case -EIOCBQUEUED:
diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index e7af1d683009..d83568e8fee8 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -351,6 +351,129 @@ TRACE_EVENT(cachefiles_coherency,
 		      __entry->content)
 	    );
 
+TRACE_EVENT(cachefiles_read,
+	    TP_PROTO(struct cachefiles_object *obj,
+		     struct inode *backer,
+		     struct fscache_io_request *req),
+
+	    TP_ARGS(obj, backer, req),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,			obj	)
+		    __field(unsigned int,			backer	)
+		    __field(unsigned int,			len	)
+		    __field(loff_t,				pos	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj->fscache.debug_id;
+		    __entry->backer	= backer->i_ino;
+		    __entry->pos	= req->pos;
+		    __entry->len	= req->len;
+			   ),
+
+	    TP_printk("o=%08x b=%08x p=%llx l=%x",
+		      __entry->obj,
+		      __entry->backer,
+		      __entry->pos,
+		      __entry->len)
+	    );
+
+TRACE_EVENT(cachefiles_write,
+	    TP_PROTO(struct cachefiles_object *obj,
+		     struct inode *backer,
+		     struct fscache_io_request *req),
+
+	    TP_ARGS(obj, backer, req),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,			obj	)
+		    __field(unsigned int,			backer	)
+		    __field(unsigned int,			len	)
+		    __field(loff_t,				pos	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj->fscache.debug_id;
+		    __entry->backer	= backer->i_ino;
+		    __entry->pos	= req->pos;
+		    __entry->len	= req->len;
+			   ),
+
+	    TP_printk("o=%08x b=%08x p=%llx l=%x",
+		      __entry->obj,
+		      __entry->backer,
+		      __entry->pos,
+		      __entry->len)
+	    );
+
+TRACE_EVENT(cachefiles_trunc,
+	    TP_PROTO(struct cachefiles_object *obj, struct inode *backer,
+		     loff_t from, loff_t to),
+
+	    TP_ARGS(obj, backer, from, to),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,			obj	)
+		    __field(unsigned int,			backer	)
+		    __field(loff_t,				from	)
+		    __field(loff_t,				to	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj->fscache.debug_id;
+		    __entry->backer	= backer->i_ino;
+		    __entry->from	= from;
+		    __entry->to		= to;
+			   ),
+
+	    TP_printk("o=%08x b=%08x l=%llx->%llx",
+		      __entry->obj,
+		      __entry->backer,
+		      __entry->from,
+		      __entry->to)
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
+		    __entry->obj	= obj->fscache.debug_id;
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
+		    __entry->obj	= obj->fscache.debug_id;
+		    __entry->backer	= backer->i_ino;
+			   ),
+
+	    TP_printk("o=%08x b=%08x",
+		      __entry->obj,
+		      __entry->backer)
+	    );
+
 #endif /* _TRACE_CACHEFILES_H */
 
 /* This part must be outside protection */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

