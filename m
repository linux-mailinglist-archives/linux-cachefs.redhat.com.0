Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3848F7C898A
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Oct 2023 18:04:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697213087;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x1vGsAf6ZFrpt3449dpadvBTw7Y1iQZd1hwrR1mmx0U=;
	b=dGWUkDiQ/X21rumHFhBTrJ46VVfkYYDSnLLg2uDteeIHFYpQh3AYvtDmIZh8eg52solGf/
	OJrfoj+a6YxlNEv25RE3Tl6WmlnfoMyp/QlaZuo5cwewRmq2ngBkYFXF/BLywwH64Nw+ZB
	25RyQmUbd+A/a/eqcPKvGbyBvWtM8DY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-0oOmfzHWPhOfzLpq0FiMgQ-1; Fri, 13 Oct 2023 12:04:43 -0400
X-MC-Unique: 0oOmfzHWPhOfzLpq0FiMgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E38B800162;
	Fri, 13 Oct 2023 16:04:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2353F1C06535;
	Fri, 13 Oct 2023 16:04:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D23A119465A2;
	Fri, 13 Oct 2023 16:04:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 48C601946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Oct 2023 16:04:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1ADF82157F5C; Fri, 13 Oct 2023 16:04:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90FC92157F5A;
 Fri, 13 Oct 2023 16:04:38 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Date: Fri, 13 Oct 2023 17:03:33 +0100
Message-ID: <20231013160423.2218093-5-dhowells@redhat.com>
In-Reply-To: <20231013160423.2218093-1-dhowells@redhat.com>
References: <20231013160423.2218093-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Linux-cachefs] [RFC PATCH 04/53] netfs: Allow the netfs to make
 the io (sub)request alloc larger
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Allow the network filesystem to specify extra space to be allocated on the
end of the io (sub)request.  This allows cifs, for example, to use this
space rather than allocating its own cifs_readdata struct.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/objects.c    | 7 +++++--
 include/linux/netfs.h | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index e41f9fc9bdd2..2f1865ff7cce 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -22,7 +22,8 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	struct netfs_io_request *rreq;
 	int ret;
 
-	rreq = kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
+	rreq = kzalloc(ctx->ops->io_request_size ?: sizeof(struct netfs_io_request),
+		       GFP_KERNEL);
 	if (!rreq)
 		return ERR_PTR(-ENOMEM);
 
@@ -116,7 +117,9 @@ struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq
 {
 	struct netfs_io_subrequest *subreq;
 
-	subreq = kzalloc(sizeof(struct netfs_io_subrequest), GFP_KERNEL);
+	subreq = kzalloc(rreq->netfs_ops->io_subrequest_size ?:
+			 sizeof(struct netfs_io_subrequest),
+			 GFP_KERNEL);
 	if (subreq) {
 		INIT_LIST_HEAD(&subreq->rreq_link);
 		refcount_set(&subreq->ref, 2);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index b92e982ac4a0..6942b8cf03dc 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -214,6 +214,8 @@ struct netfs_io_request {
  * Operations the network filesystem can/must provide to the helpers.
  */
 struct netfs_request_ops {
+	unsigned int	io_request_size;	/* Alloc size for netfs_io_request struct */
+	unsigned int	io_subrequest_size;	/* Alloc size for netfs_io_subrequest struct */
 	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
 	void (*free_request)(struct netfs_io_request *rreq);
 	int (*begin_cache_operation)(struct netfs_io_request *rreq);
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

