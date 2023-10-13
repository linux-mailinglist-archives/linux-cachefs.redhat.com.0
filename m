Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1686D7C89A9
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Oct 2023 18:05:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697213122;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fjE8GG9Ieqd3Zy+jWcZNtdZVBCduzucwcSkdRARPaBI=;
	b=ahHbWkow/vuOgWON73tEGMCabSvRh74XFC+Uu6SyDQ8r+2EAdMd2hJNMz9g63/a6LKAHuv
	eE0pMP5oNyMLW4nBRgE2eJ1ar50wEYAWgQKLkq5ANBKQvPNeymgQ1tJvHFXwryeSgsZBjm
	bA8zTgkakXbPAGrt6hvq2Ufk+6ectA0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-kCHifdXKNUe5Hko6PfIXrw-1; Fri, 13 Oct 2023 12:05:19 -0400
X-MC-Unique: kCHifdXKNUe5Hko6PfIXrw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E806E3C1ACED;
	Fri, 13 Oct 2023 16:05:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD5EEC15BBC;
	Fri, 13 Oct 2023 16:05:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B0AE219465A2;
	Fri, 13 Oct 2023 16:05:18 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 69EDA1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Oct 2023 16:05:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5968C40C6F7F; Fri, 13 Oct 2023 16:05:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAF5040C6CA5;
 Fri, 13 Oct 2023 16:05:14 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Date: Fri, 13 Oct 2023 17:03:44 +0100
Message-ID: <20231013160423.2218093-16-dhowells@redhat.com>
In-Reply-To: <20231013160423.2218093-1-dhowells@redhat.com>
References: <20231013160423.2218093-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Subject: [Linux-cachefs] [RFC PATCH 15/53] netfs: Limit subrequest by size
 or number of segments
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 netdev@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com, linux-mm@kvack.org,
 Marc Dionne <marc.dionne@auristor.com>, v9fs@lists.linux.dev,
 Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
 Christian Brauner <christian@brauner.io>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Limit a subrequest to a maximum size and/or a maximum number of contiguous
physical regions.  This permits, for instance, an subreq's iterator to be
limited to the number of DMA'able segments that a large RDMA request can
handle.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/io.c                | 18 ++++++++++++++++++
 include/linux/netfs.h        |  1 +
 include/trace/events/netfs.h |  1 +
 3 files changed, 20 insertions(+)

diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index d8e9cd6ce338..c80b8eed1209 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -525,6 +525,7 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
 			struct iov_iter *io_iter)
 {
 	enum netfs_io_source source;
+	size_t lsize;
 
 	_enter("%llx-%llx,%llx", subreq->start, subreq->start + subreq->len, rreq->i_size);
 
@@ -547,13 +548,30 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
 			source = NETFS_INVALID_READ;
 			goto out;
 		}
+
+		if (subreq->max_nr_segs) {
+			lsize = netfs_limit_iter(io_iter, 0, subreq->len,
+						 subreq->max_nr_segs);
+			if (subreq->len > lsize) {
+				subreq->len = lsize;
+				trace_netfs_sreq(subreq, netfs_sreq_trace_limited);
+			}
+		}
 	}
 
+	if (subreq->len > rreq->len)
+		pr_warn("R=%08x[%u] SREQ>RREQ %zx > %zx\n",
+			rreq->debug_id, subreq->debug_index,
+			subreq->len, rreq->len);
+
 	if (WARN_ON(subreq->len == 0)) {
 		source = NETFS_INVALID_READ;
 		goto out;
 	}
 
+	subreq->source = source;
+	trace_netfs_sreq(subreq, netfs_sreq_trace_prepare);
+
 	subreq->io_iter = *io_iter;
 	iov_iter_truncate(&subreq->io_iter, subreq->len);
 	iov_iter_advance(io_iter, subreq->len);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 2b5e04ea4db2..aaf1c1d4de51 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -163,6 +163,7 @@ struct netfs_io_subrequest {
 	refcount_t		ref;
 	short			error;		/* 0 or error that occurred */
 	unsigned short		debug_index;	/* Index in list (for debugging output) */
+	unsigned int		max_nr_segs;	/* 0 or max number of segments in an iterator */
 	enum netfs_io_source	source;		/* Where to read from/write to */
 	unsigned long		flags;
 #define NETFS_SREQ_COPY_TO_CACHE	0	/* Set if should copy the data to the cache */
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index beec534cbaab..fce6d0bc78e5 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -44,6 +44,7 @@
 #define netfs_sreq_traces					\
 	EM(netfs_sreq_trace_download_instead,	"RDOWN")	\
 	EM(netfs_sreq_trace_free,		"FREE ")	\
+	EM(netfs_sreq_trace_limited,		"LIMIT")	\
 	EM(netfs_sreq_trace_prepare,		"PREP ")	\
 	EM(netfs_sreq_trace_resubmit_short,	"SHORT")	\
 	EM(netfs_sreq_trace_submit,		"SUBMT")	\
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

