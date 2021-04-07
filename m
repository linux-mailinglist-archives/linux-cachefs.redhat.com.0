Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9223570C9
	for <lists+linux-cachefs@lfdr.de>; Wed,  7 Apr 2021 17:47:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617810462;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HbgSA2U+rpBSMDql8ir6crWPMCLP2wXLkyW6oIuIs9Y=;
	b=ISIim3snG0SZAD2F2WqIj78c69rF5siZReD/yqohIuKkbq+jNvOKLSeAYRsFXKlmhgSDgm
	pqRB97uZUCvHaeNjRc12muwmBHQW6G6sCt80uxq6pxBlKvcAWoNUafz0x65pKf2d+qWF16
	QYk00gJqNvGsrlS9OM+juBF8JQSC15c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-S85NZj_LMWW9w0VSHAkM_g-1; Wed, 07 Apr 2021 11:47:41 -0400
X-MC-Unique: S85NZj_LMWW9w0VSHAkM_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DEDF77F;
	Wed,  7 Apr 2021 15:47:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D99B5C1C4;
	Wed,  7 Apr 2021 15:47:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D77A55340;
	Wed,  7 Apr 2021 15:47:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 137FlbBt005261 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 7 Apr 2021 11:47:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 546F31822A; Wed,  7 Apr 2021 15:47:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-201.rdu2.redhat.com
	[10.10.115.201])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 097585C1C4;
	Wed,  7 Apr 2021 15:47:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: jlayton@kernel.org
Date: Wed, 07 Apr 2021 16:47:31 +0100
Message-ID: <161781045123.463527.14533348855710902201.stgit@warthog.procyon.org.uk>
In-Reply-To: <161781041339.463527.18139104281901492882.stgit@warthog.procyon.org.uk>
References: <161781041339.463527.18139104281901492882.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 2/5] netfs: Call trace_netfs_read() after
 ->begin_cache_operation()
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

Reorder the netfs library API functions slightly to log the netfs_read
tracepoint after calling out to the network filesystem to begin a caching
operation.  This sets rreq->cookie_debug_id so that it can be logged in
tracepoints.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/netfs/read_helper.c |   23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 0066db21aa11..8040b76da1b6 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -890,15 +890,16 @@ void netfs_readahead(struct readahead_control *ractl,
 	rreq->start	= readahead_pos(ractl);
 	rreq->len	= readahead_length(ractl);
 
-	netfs_stat(&netfs_n_rh_readahead);
-	trace_netfs_read(rreq, readahead_pos(ractl), readahead_length(ractl),
-			 netfs_read_trace_readahead);
-
 	if (ops->begin_cache_operation) {
 		ret = ops->begin_cache_operation(rreq);
 		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
 			goto cleanup_free;
 	}
+
+	netfs_stat(&netfs_n_rh_readahead);
+	trace_netfs_read(rreq, readahead_pos(ractl), readahead_length(ractl),
+			 netfs_read_trace_readahead);
+
 	netfs_rreq_expand(rreq, ractl);
 
 	atomic_set(&rreq->nr_rd_ops, 1);
@@ -968,9 +969,6 @@ int netfs_readpage(struct file *file,
 	rreq->start	= page_index(page) * PAGE_SIZE;
 	rreq->len	= thp_size(page);
 
-	netfs_stat(&netfs_n_rh_readpage);
-	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
-
 	if (ops->begin_cache_operation) {
 		ret = ops->begin_cache_operation(rreq);
 		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS) {
@@ -979,6 +977,9 @@ int netfs_readpage(struct file *file,
 		}
 	}
 
+	netfs_stat(&netfs_n_rh_readpage);
+	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
+
 	netfs_get_read_request(rreq);
 
 	atomic_set(&rreq->nr_rd_ops, 1);
@@ -1111,15 +1112,15 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	__set_bit(NETFS_RREQ_NO_UNLOCK_PAGE, &rreq->flags);
 	netfs_priv = NULL;
 
-	netfs_stat(&netfs_n_rh_write_begin);
-	trace_netfs_read(rreq, pos, len, netfs_read_trace_write_begin);
-
 	if (ops->begin_cache_operation) {
 		ret = ops->begin_cache_operation(rreq);
 		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
-			goto error;
+			goto error_put;
 	}
 
+	netfs_stat(&netfs_n_rh_write_begin);
+	trace_netfs_read(rreq, pos, len, netfs_read_trace_write_begin);
+
 	/* Expand the request to meet caching requirements and download
 	 * preferences.
 	 */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

