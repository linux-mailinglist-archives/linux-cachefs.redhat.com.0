Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 219E54A49FB
	for <lists+linux-cachefs@lfdr.de>; Mon, 31 Jan 2022 16:14:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643642070;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sZnF1lSh7OXJHuNn+0xeqOSow7E4yIcW/HyX/N1FKek=;
	b=RgtWzNjJIyw9qPwJbeD1yOZ9yG9+cyMLoPTKAu9OLniWmC3d2ONYTz2yVQ2AjaRbA3Q2Wf
	IjeBODeWi5/VP+3sf98xc7St8WkhRo2MazHvIzdR85Uj5M72zTZWVRmu6z65++PcHbGsL8
	eQZLtIZKemUZu8wMFkMlrUfvfMwy9Wg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-pxrJtxQ5OLC9ZLTzWc290A-1; Mon, 31 Jan 2022 10:14:25 -0500
X-MC-Unique: pxrJtxQ5OLC9ZLTzWc290A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA5E686A8A2;
	Mon, 31 Jan 2022 15:14:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE42970F60;
	Mon, 31 Jan 2022 15:14:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9243E4BB7C;
	Mon, 31 Jan 2022 15:14:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VFEMIO007301 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 10:14:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 151D184D0A; Mon, 31 Jan 2022 15:14:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B69C84D0D;
	Mon, 31 Jan 2022 15:14:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 31 Jan 2022 15:14:08 +0000
Message-ID: <164364204859.1476539.8259104934674309990.stgit@warthog.procyon.org.uk>
In-Reply-To: <164364196407.1476539.8450117784231043601.stgit@warthog.procyon.org.uk>
References: <164364196407.1476539.8450117784231043601.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, Miklos Szeredi <miklos@szeredi.hu>,
	Jeff Layton <jlayton@kernel.org>, linux-unionfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org
Subject: [Linux-cachefs] [PATCH 5/5] cachefiles: Remove the now-unused
 mark-inode-in-use tracepoints
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

The cachefiles tracepoints that relate to marking an inode in-use with the
S_KERNEL_FILE inode flag are now unused, superseded by general tracepoints.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 include/trace/events/cachefiles.h |   63 -------------------------------------
 1 file changed, 63 deletions(-)

diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index c6f5aa74db89..1c56f9889f69 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -552,69 +552,6 @@ TRACE_EVENT(cachefiles_trunc,
 		      __entry->to)
 	    );
 
-TRACE_EVENT(cachefiles_mark_active,
-	    TP_PROTO(struct cachefiles_object *obj,
-		     struct inode *inode),
-
-	    TP_ARGS(obj, inode),
-
-	    /* Note that obj may be NULL */
-	    TP_STRUCT__entry(
-		    __field(unsigned int,		obj		)
-		    __field(ino_t,			inode		)
-			     ),
-
-	    TP_fast_assign(
-		    __entry->obj	= obj ? obj->debug_id : 0;
-		    __entry->inode	= inode->i_ino;
-			   ),
-
-	    TP_printk("o=%08x B=%lx",
-		      __entry->obj, __entry->inode)
-	    );
-
-TRACE_EVENT(cachefiles_mark_failed,
-	    TP_PROTO(struct cachefiles_object *obj,
-		     struct inode *inode),
-
-	    TP_ARGS(obj, inode),
-
-	    /* Note that obj may be NULL */
-	    TP_STRUCT__entry(
-		    __field(unsigned int,		obj		)
-		    __field(ino_t,			inode		)
-			     ),
-
-	    TP_fast_assign(
-		    __entry->obj	= obj ? obj->debug_id : 0;
-		    __entry->inode	= inode->i_ino;
-			   ),
-
-	    TP_printk("o=%08x B=%lx",
-		      __entry->obj, __entry->inode)
-	    );
-
-TRACE_EVENT(cachefiles_mark_inactive,
-	    TP_PROTO(struct cachefiles_object *obj,
-		     struct inode *inode),
-
-	    TP_ARGS(obj, inode),
-
-	    /* Note that obj may be NULL */
-	    TP_STRUCT__entry(
-		    __field(unsigned int,		obj		)
-		    __field(ino_t,			inode		)
-			     ),
-
-	    TP_fast_assign(
-		    __entry->obj	= obj ? obj->debug_id : 0;
-		    __entry->inode	= inode->i_ino;
-			   ),
-
-	    TP_printk("o=%08x B=%lx",
-		      __entry->obj, __entry->inode)
-	    );
-
 TRACE_EVENT(cachefiles_vfs_error,
 	    TP_PROTO(struct cachefiles_object *obj, struct inode *backer,
 		     int error, enum cachefiles_error_trace where),


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

