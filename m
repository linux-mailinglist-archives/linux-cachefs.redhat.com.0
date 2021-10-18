Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA9A4320DF
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 16:57:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569032;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rZhexsQvt8Ax1FXLewy+I7BMpjH5D9p4+mSVo1UEUds=;
	b=hd8VkbyjuGMA28jNbgv8QGlyGa5ipWMmxkBnPSPhnawkxzKF/VDTX4McToyQ8Wp4xhb5Cr
	cFa+b4YAYNShOixjHCQp+sAxzOhwsDfGtEabom8jFFhn6uLMPVMOu0PgNFTtIdI0o9HTV1
	YUb1emq5sSaCNxrn3TgtnBO+EtLPwrE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-nhSzbVZwOyegqcVCUJS1cQ-1; Mon, 18 Oct 2021 10:57:09 -0400
X-MC-Unique: nhSzbVZwOyegqcVCUJS1cQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4801D18D6A2F;
	Mon, 18 Oct 2021 14:57:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A10610246F8;
	Mon, 18 Oct 2021 14:57:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 263804EA30;
	Mon, 18 Oct 2021 14:57:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IEunPl028477 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 10:56:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0B6C1017CE5; Mon, 18 Oct 2021 14:56:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99AE7100E809;
	Mon, 18 Oct 2021 14:56:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 15:56:45 +0100
Message-ID: <163456900574.2614702.12478396115896341195.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Subject: [Linux-cachefs] [PATCH 23/67] cachefiles: trace: Improve the lookup
	tracepoint
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

Improve the cachefiles_lookup tracepoint:

 - Don't display the dentry address, since it's going to get hashed.

 - Do display any error code.

 - Work out the inode in the tracepoint rather than in the caller so that
   the logic is conditional on the tracepoint being enabled.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/namei.c             |    4 +---
 include/trace/events/cachefiles.h |   18 +++++++++---------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index 10b6d571eda8..b5a0aec529af 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -340,14 +340,12 @@ static int cachefiles_walk_to_file(struct cachefiles_cache *cache,
 	inode_lock_nested(dinode, I_MUTEX_PARENT);
 
 	dentry = lookup_one_len(object->d_name, fan, object->d_name_len);
+	trace_cachefiles_lookup(object, dentry);
 	if (IS_ERR(dentry)) {
-		trace_cachefiles_lookup(object, dentry, NULL);
 		ret = PTR_ERR(dentry);
 		goto error;
 	}
 
-	trace_cachefiles_lookup(object, dentry, d_backing_inode(dentry));
-
 	if (d_is_negative(dentry)) {
 		/* This element of the path doesn't exist, so we can release
 		 * any readers in the certain knowledge that there's nothing
diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index bd0b5bbd3889..87681dd957ec 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -98,25 +98,25 @@ TRACE_EVENT(cachefiles_ref,
 
 TRACE_EVENT(cachefiles_lookup,
 	    TP_PROTO(struct cachefiles_object *obj,
-		     struct dentry *de,
-		     struct inode *inode),
+		     struct dentry *de),
 
-	    TP_ARGS(obj, de, inode),
+	    TP_ARGS(obj, de),
 
 	    TP_STRUCT__entry(
 		    __field(unsigned int,		obj	)
-		    __field(struct dentry *,		de	)
-		    __field(struct inode *,		inode	)
+		    __field(short,			error	)
+		    __field(unsigned long,		ino	)
 			     ),
 
 	    TP_fast_assign(
 		    __entry->obj	= obj->fscache.debug_id;
-		    __entry->de		= de;
-		    __entry->inode	= inode;
+		    __entry->ino	= (!IS_ERR(de) && d_backing_inode(de) ?
+					   d_backing_inode(de)->i_ino : 0);
+		    __entry->error	= IS_ERR(de) ? PTR_ERR(de) : 0;
 			   ),
 
-	    TP_printk("o=%08x d=%p i=%p",
-		      __entry->obj, __entry->de, __entry->inode)
+	    TP_printk("o=%08x i=%lx e=%d",
+		      __entry->obj, __entry->ino, __entry->error)
 	    );
 
 TRACE_EVENT(cachefiles_create,


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

