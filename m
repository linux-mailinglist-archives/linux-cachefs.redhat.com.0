Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 873A443221C
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Oct 2021 17:08:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634569727;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ejRMl6k8GJLMn3wjaF52K4tG6s5c5Ew+XD82aytE5Rs=;
	b=bZnHbkjxEG0MBPrsw4FLpS2poQTlEZKntQZze+/wSLed0At2bN7DYO0Yqa1gwPX03iKa2R
	7/uZdWvd+14si1q+ejlQF+67hYEssiwOHFoh2Ij0rDMEWAoseFztrRVnoLiz2ZYo1LMXxB
	s9MFbc+DtTQ5hNgh1MS7Raau9DTKvv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-vX0W4JsOOL6kQcYpjWAfMQ-1; Mon, 18 Oct 2021 11:08:46 -0400
X-MC-Unique: vX0W4JsOOL6kQcYpjWAfMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 585968066F0;
	Mon, 18 Oct 2021 15:08:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A9B05C1D0;
	Mon, 18 Oct 2021 15:08:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35C971806D03;
	Mon, 18 Oct 2021 15:08:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IF8gKk030218 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 11:08:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B63D4100EBBF; Mon, 18 Oct 2021 15:08:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 134CF100E809;
	Mon, 18 Oct 2021 15:08:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 18 Oct 2021 16:08:34 +0100
Message-ID: <163456971424.2614702.1006294959423305986.stgit@warthog.procyon.org.uk>
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
Subject: [Linux-cachefs] [PATCH 64/67] netfs: Display the netfs inode number
 in the netfs_read tracepoint
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

Display the netfs inode number in the netfs_read tracepoint so that this
can be used to correlate with the cachefiles_prep_read tracepoint.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/trace/events/netfs.h |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 4d470bffd9f1..e6f4ebbb4c69 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -135,6 +135,7 @@ TRACE_EVENT(netfs_read,
 		    __field(loff_t,			start		)
 		    __field(size_t,			len		)
 		    __field(enum netfs_read_trace,	what		)
+		    __field(unsigned int,		netfs_inode	)
 			     ),
 
 	    TP_fast_assign(
@@ -143,12 +144,14 @@ TRACE_EVENT(netfs_read,
 		    __entry->start	= start;
 		    __entry->len	= len;
 		    __entry->what	= what;
+		    __entry->netfs_inode = rreq->inode->i_ino;
 			   ),
 
-	    TP_printk("R=%08x %s c=%08x s=%llx %zx",
+	    TP_printk("R=%08x %s c=%08x ni=%x s=%llx %zx",
 		      __entry->rreq,
 		      __print_symbolic(__entry->what, netfs_read_traces),
 		      __entry->cookie,
+		      __entry->netfs_inode,
 		      __entry->start, __entry->len)
 	    );
 


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

