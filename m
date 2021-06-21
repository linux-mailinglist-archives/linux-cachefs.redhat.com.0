Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B31713AF7B0
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Jun 2021 23:45:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624311924;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RBG4i2Y33tJNTbOeqjM+IvBhrgKm3RPsLWffnCxypK0=;
	b=P5k0Xv1USxxrGS+yZhOOwI3FUZMxFMoPmXuFktTJcgIIRVk10GkG5n7CJQAqjciPuBnES4
	UYDbGuUYR63Hop59Lv86nuEGU6MaV91p33304Texs72vHw9T4viCYNpsVmPFLuw4MpxtoD
	ii+E4nXTu7WKDG44/VKKpQDay4KKCPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489--bL6zEuyMEW3VYYN9nJEaA-1; Mon, 21 Jun 2021 17:45:23 -0400
X-MC-Unique: -bL6zEuyMEW3VYYN9nJEaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79C775074D;
	Mon, 21 Jun 2021 21:45:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68E6610023B5;
	Mon, 21 Jun 2021 21:45:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50A201809C99;
	Mon, 21 Jun 2021 21:45:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15LLjInx030751 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 17:45:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C1FEE69CB4; Mon, 21 Jun 2021 21:45:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-65.rdu2.redhat.com
	[10.10.118.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A89E969FAD;
	Mon, 21 Jun 2021 21:45:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 21 Jun 2021 22:45:07 +0100
Message-ID: <162431190784.2908479.13386972676539789127.stgit@warthog.procyon.org.uk>
In-Reply-To: <162431188431.2908479.14031376932042135080.stgit@warthog.procyon.org.uk>
References: <162431188431.2908479.14031376932042135080.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH 02/12] netfs: Move cookie debug ID to struct
 netfs_cache_resources
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

Move the cookie debug ID from struct netfs_read_request to struct
netfs_cache_resources and drop the 'cookie_' prefix.  This makes it
available for things that want to use netfs_cache_resources without having
a netfs_read_request.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/io.c           |    2 +-
 include/linux/netfs.h        |    2 +-
 include/trace/events/netfs.h |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index b13fb45fc3f3..ca68bb97ca00 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -410,7 +410,7 @@ int cachefiles_begin_read_operation(struct netfs_read_request *rreq,
 	rreq->cache_resources.cache_priv = op;
 	rreq->cache_resources.cache_priv2 = file;
 	rreq->cache_resources.ops = &cachefiles_netfs_cache_ops;
-	rreq->cookie_debug_id = object->fscache.debug_id;
+	rreq->cache_resources.debug_id = object->fscache.debug_id;
 	_leave("");
 	return 0;
 
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 9062adfa2fb9..5d6a4158a9a6 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -102,6 +102,7 @@ struct netfs_cache_resources {
 	const struct netfs_cache_ops	*ops;
 	void				*cache_priv;
 	void				*cache_priv2;
+	unsigned int			debug_id;	/* Cookie debug ID */
 };
 
 /*
@@ -137,7 +138,6 @@ struct netfs_read_request {
 	struct list_head	subrequests;	/* Requests to fetch I/O from disk or net */
 	void			*netfs_priv;	/* Private data for the netfs */
 	unsigned int		debug_id;
-	unsigned int		cookie_debug_id;
 	atomic_t		nr_rd_ops;	/* Number of read ops in progress */
 	atomic_t		nr_wr_ops;	/* Number of write ops in progress */
 	size_t			submitted;	/* Amount submitted for I/O so far */
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index de1c64635e42..4d470bffd9f1 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -139,7 +139,7 @@ TRACE_EVENT(netfs_read,
 
 	    TP_fast_assign(
 		    __entry->rreq	= rreq->debug_id;
-		    __entry->cookie	= rreq->cookie_debug_id;
+		    __entry->cookie	= rreq->cache_resources.debug_id;
 		    __entry->start	= start;
 		    __entry->len	= len;
 		    __entry->what	= what;


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

