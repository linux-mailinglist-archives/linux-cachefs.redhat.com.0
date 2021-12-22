Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DA347D9A0
	for <lists+linux-cachefs@lfdr.de>; Thu, 23 Dec 2021 00:14:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640214895;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NlqI8MXCtWsG+GO5XgNvmsK8U9QBuUrKX6NA2Qpqgg4=;
	b=SmbM1CfvPbhhvx2WojPbf1YaG5nZhnTFj9dGlVoblRzY8Y4FiLQj7KcU2Mi4jDw9qNl/lj
	DntkOp1fK0J1TaeBuY/BSoCphvVcu9x8PGW06KD6L0ND3gVtA382+phWBclZqxYGd4KIlU
	azaw3awe+d98qSJXeJ4UGwb1fLa3gW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-h8dTQ2LRPI6xJW6AaYRA4A-1; Wed, 22 Dec 2021 18:14:52 -0500
X-MC-Unique: h8dTQ2LRPI6xJW6AaYRA4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4175410168C6;
	Wed, 22 Dec 2021 23:14:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32CC92BE7D;
	Wed, 22 Dec 2021 23:14:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E4C9F1809CB8;
	Wed, 22 Dec 2021 23:14:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BMNEmJc031787 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 22 Dec 2021 18:14:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1C72610911BE; Wed, 22 Dec 2021 23:14:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02FF510911BA;
	Wed, 22 Dec 2021 23:14:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 22 Dec 2021 23:14:34 +0000
Message-ID: <164021487412.640689.7544388469390936443.stgit@warthog.procyon.org.uk>
In-Reply-To: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Subject: [Linux-cachefs] [PATCH v4 04/68] netfs: Display the netfs inode
 number in the netfs_read tracepoint
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Display the netfs inode number in the netfs_read tracepoint so that this
can be used to correlate with the cachefiles_prep_read tracepoint.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819581097.215744.17476611915583897051.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/163906885903.143852.12229407815154182247.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/163967078164.1823006.15286989199782861123.stgit@warthog.procyon.org.uk/ # v3
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

