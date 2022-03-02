Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8574CA76B
	for <lists+linux-cachefs@lfdr.de>; Wed,  2 Mar 2022 15:08:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646230096;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NLd1fXJ1poOcblMG3vx2iNTnTi6I9gusxWldAzhk5Ks=;
	b=Q/jG2PSJfsOAvPZcWqyhLqXfukGAYkivV1oaCP+AbZ//hu+GLd+s0k/OkaCE+qRlsOL/xd
	hHxTnTf426vPM8I1czPEqlFD8mBl/MTveZuFiW9BNjuuoZRvlqZgyohUk5+bg1OtY9y3Nn
	MCbeHEXPXGYNjGP4Jfu3lwy3yF+2hLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-yhNwOcgBMkGc7qEOac7RxA-1; Wed, 02 Mar 2022 09:08:11 -0500
X-MC-Unique: yhNwOcgBMkGc7qEOac7RxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03FC451DF;
	Wed,  2 Mar 2022 14:08:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0C9A781F1;
	Wed,  2 Mar 2022 14:08:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 811581809C98;
	Wed,  2 Mar 2022 14:08:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 222E73ma020997 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 2 Mar 2022 09:07:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5E4CA8495D; Wed,  2 Mar 2022 14:07:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F2BC8495A;
	Wed,  2 Mar 2022 14:07:00 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 02 Mar 2022 14:06:59 +0000
Message-ID: <164623001948.3564931.2353852999649380059.stgit@warthog.procyon.org.uk>
In-Reply-To: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
References: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [Linux-cachefs] [PATCH 11/19] netfs: Adjust the netfs_failure
 tracepoint to indicate non-subreq lines
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

Adjust the netfs_failure tracepoint to indicate a subrequest number of -1
when it's a full-request failure unrelated to any particular subrequest,
such as a failure to encrypt its data buffer.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 include/trace/events/netfs.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 507c5e612293..685b07573394 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -231,7 +231,7 @@ TRACE_EVENT(netfs_failure,
 
 	    TP_STRUCT__entry(
 		    __field(unsigned int,		rreq		)
-		    __field(unsigned short,		index		)
+		    __field(short,			index		)
 		    __field(short,			error		)
 		    __field(unsigned short,		flags		)
 		    __field(enum netfs_io_source,	source		)
@@ -243,17 +243,17 @@ TRACE_EVENT(netfs_failure,
 
 	    TP_fast_assign(
 		    __entry->rreq	= rreq->debug_id;
-		    __entry->index	= sreq ? sreq->debug_index : 0;
+		    __entry->index	= sreq ? sreq->debug_index : -1;
 		    __entry->error	= error;
 		    __entry->flags	= sreq ? sreq->flags : 0;
 		    __entry->source	= sreq ? sreq->source : NETFS_INVALID_READ;
 		    __entry->what	= what;
-		    __entry->len	= sreq ? sreq->len : 0;
+		    __entry->len	= sreq ? sreq->len : rreq->len;
 		    __entry->transferred = sreq ? sreq->transferred : 0;
 		    __entry->start	= sreq ? sreq->start : 0;
 			   ),
 
-	    TP_printk("R=%08x[%u] %s f=%02x s=%llx %zx/%zx %s e=%d",
+	    TP_printk("R=%08x[%d] %s f=%02x s=%llx %zx/%zx %s e=%d",
 		      __entry->rreq, __entry->index,
 		      __print_symbolic(__entry->source, netfs_sreq_sources),
 		      __entry->flags,


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

