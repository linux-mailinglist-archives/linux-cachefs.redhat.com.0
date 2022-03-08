Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 409AB4D24D3
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 00:26:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646782010;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3rB2t9WYg/e+OC/6CKVrMfImEJjH+wOsBUK4xEN3I8A=;
	b=UPesUs9ExEM3UAIFVOdqeLl29y+t0zB3BU8k8qNPceJP8Lrnk1rS67ALxmdvVQ4rYWAp+K
	UxEBJbkaos8KKSbfKSP6XDm8V+rbovW6O00IVLX7JPozxMmBdWVtExHGR9jFxAVX6xx2TH
	RNFHQ8nbV9l7bC9Eb2EMVl+faluopdY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-WKWPg4z_PxSbmEZZv2ZpQQ-1; Tue, 08 Mar 2022 18:26:47 -0500
X-MC-Unique: WKWPg4z_PxSbmEZZv2ZpQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A965718E5280;
	Tue,  8 Mar 2022 23:26:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 68EA12166B4F;
	Tue,  8 Mar 2022 23:26:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 101B5195F407;
	Tue,  8 Mar 2022 23:26:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A4390193212A for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  8 Mar 2022 23:26:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 335563059E; Tue,  8 Mar 2022 23:26:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8953D3059F;
 Tue,  8 Mar 2022 23:26:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Tue, 08 Mar 2022 23:26:34 +0000
Message-ID: <164678199468.1200972.17275585970238114726.stgit@warthog.procyon.org.uk>
In-Reply-To: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
References: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Subject: [Linux-cachefs] [PATCH v2 06/19] netfs: Adjust the netfs_rreq
 tracepoint slightly
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 Dominique Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adjust the netfs_rreq tracepoint to include the origin of the request and
to increase the size of the "what trace" output strings by a character so
that "ENCRYPT" and "DECRYPT" will fit without abbreviation.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com

Link: https://lore.kernel.org/r/164622996715.3564931.4252319907990358129.stgit@warthog.procyon.org.uk/ # v1
---

 fs/netfs/read_helper.c       |    2 +-
 include/trace/events/netfs.h |   18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index ef23ef9889d5..181aeda32649 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -181,7 +181,7 @@ static void netfs_rreq_do_write_to_cache(struct netfs_io_request *rreq)
 	struct iov_iter iter;
 	int ret;
 
-	trace_netfs_rreq(rreq, netfs_rreq_trace_write);
+	trace_netfs_rreq(rreq, netfs_rreq_trace_copy);
 
 	/* We don't want terminating writes trying to wake us up whilst we're
 	 * still going through the list.
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 2d0665b416bf..daf171de2142 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -22,13 +22,13 @@
 	E_(netfs_read_trace_write_begin,	"WRITEBEGN")
 
 #define netfs_rreq_traces					\
-	EM(netfs_rreq_trace_assess,		"ASSESS")	\
-	EM(netfs_rreq_trace_done,		"DONE  ")	\
-	EM(netfs_rreq_trace_free,		"FREE  ")	\
-	EM(netfs_rreq_trace_resubmit,		"RESUBM")	\
-	EM(netfs_rreq_trace_unlock,		"UNLOCK")	\
-	EM(netfs_rreq_trace_unmark,		"UNMARK")	\
-	E_(netfs_rreq_trace_write,		"WRITE ")
+	EM(netfs_rreq_trace_assess,		"ASSESS ")	\
+	EM(netfs_rreq_trace_copy,		"COPY   ")	\
+	EM(netfs_rreq_trace_done,		"DONE   ")	\
+	EM(netfs_rreq_trace_free,		"FREE   ")	\
+	EM(netfs_rreq_trace_resubmit,		"RESUBMT")	\
+	EM(netfs_rreq_trace_unlock,		"UNLOCK ")	\
+	E_(netfs_rreq_trace_unmark,		"UNMARK ")
 
 #define netfs_sreq_sources					\
 	EM(NETFS_FILL_WITH_ZEROES,		"ZERO")		\
@@ -134,7 +134,7 @@ TRACE_EVENT(netfs_rreq,
 
 	    TP_STRUCT__entry(
 		    __field(unsigned int,		rreq		)
-		    __field(unsigned short,		flags		)
+		    __field(unsigned int,		flags		)
 		    __field(enum netfs_rreq_trace,	what		)
 			     ),
 
@@ -182,8 +182,8 @@ TRACE_EVENT(netfs_sreq,
 
 	    TP_printk("R=%08x[%u] %s %s f=%02x s=%llx %zx/%zx e=%d",
 		      __entry->rreq, __entry->index,
-		      __print_symbolic(__entry->what, netfs_sreq_traces),
 		      __print_symbolic(__entry->source, netfs_sreq_sources),
+		      __print_symbolic(__entry->what, netfs_sreq_traces),
 		      __entry->flags,
 		      __entry->start, __entry->transferred, __entry->len,
 		      __entry->error)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

