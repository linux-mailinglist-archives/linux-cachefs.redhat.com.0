Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C057B4927A1
	for <lists+linux-cachefs@lfdr.de>; Tue, 18 Jan 2022 14:54:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642514076;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fSt4eCuSJ9HBVm+J8mBy0nwKlfGbVdpHivZcUe5cSdc=;
	b=dCciee0jOLf/plVi38fF5aIuufdldJVLNW6/Kv1ZBK5X612WJ3NRV9JoauyKq9keo6ofGN
	OA2TkkkQN2T0DVrGm/7gjvS146yeblKM7qYGVYF5WponkJYHpLGg2FnDaZxF/g+GmtXA2H
	WzqaynNrV7VxZUlDnB+pJYk2mPFMavU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-4KFMHSxrMvq8dw3l5_WfIg-1; Tue, 18 Jan 2022 08:54:33 -0500
X-MC-Unique: 4KFMHSxrMvq8dw3l5_WfIg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 089FF83DC7B;
	Tue, 18 Jan 2022 13:54:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD6D810589CF;
	Tue, 18 Jan 2022 13:54:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF9F61806D03;
	Tue, 18 Jan 2022 13:54:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IDsA8f014097 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 08:54:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F0C3E798A3; Tue, 18 Jan 2022 13:54:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 81BC978AB5;
	Tue, 18 Jan 2022 13:54:07 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Tue, 18 Jan 2022 13:54:06 +0000
Message-ID: <164251404666.3435901.17331742792401482190.stgit@warthog.procyon.org.uk>
In-Reply-To: <164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
References: <164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <smfrench@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	v9fs-developer@lists.sourceforge.net
Subject: [Linux-cachefs] [PATCH 05/11] cachefiles: Trace active-mark failure
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a tracepoint to log failure to apply an active mark to a file in
addition to tracing successfully setting and unsetting the mark.

Also include the backing file inode number in the message logged to dmesg.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/cachefiles/namei.c             |    4 +++-
 include/trace/events/cachefiles.h |   21 +++++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index 52c9f0864a87..f256c8aff7bb 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -25,7 +25,9 @@ static bool __cachefiles_mark_inode_in_use(struct cachefiles_object *object,
 		trace_cachefiles_mark_active(object, inode);
 		can_use = true;
 	} else {
-		pr_notice("cachefiles: Inode already in use: %pd\n", dentry);
+		trace_cachefiles_mark_failed(object, inode);
+		pr_notice("cachefiles: Inode already in use: %pd (B=%lx)\n",
+			  dentry, inode->i_ino);
 	}
 
 	return can_use;
diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index 093c4acb7a3a..c6f5aa74db89 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -573,6 +573,27 @@ TRACE_EVENT(cachefiles_mark_active,
 		      __entry->obj, __entry->inode)
 	    );
 
+TRACE_EVENT(cachefiles_mark_failed,
+	    TP_PROTO(struct cachefiles_object *obj,
+		     struct inode *inode),
+
+	    TP_ARGS(obj, inode),
+
+	    /* Note that obj may be NULL */
+	    TP_STRUCT__entry(
+		    __field(unsigned int,		obj		)
+		    __field(ino_t,			inode		)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj ? obj->debug_id : 0;
+		    __entry->inode	= inode->i_ino;
+			   ),
+
+	    TP_printk("o=%08x B=%lx",
+		      __entry->obj, __entry->inode)
+	    );
+
 TRACE_EVENT(cachefiles_mark_inactive,
 	    TP_PROTO(struct cachefiles_object *obj,
 		     struct inode *inode),


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

