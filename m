Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEF47C89ED
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Oct 2023 18:07:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697213249;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b3/TLj3GJKTF5c1UC7ILSMEIODycx2rMAdYHHDDJOv4=;
	b=EMw2xYhG/aFBR657bM7nW849qkz/0vfbLy7kh9yP67BTr0aTtVt8T+fgqYEr+KrQXD4wXv
	QMtJrHOIYfkmHv3xydvsRlMFSQXG6hEJ6X40bI32hhh7HrB6YIEFl7MgMsSFasCDjKLHE1
	TVvlSeMtGw7Hf+Jrb9nF70LJg5eMQw8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-6C0OCyooPLS2-aEI7Lleuw-1; Fri, 13 Oct 2023 12:07:26 -0400
X-MC-Unique: 6C0OCyooPLS2-aEI7Lleuw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77DFE1029F53;
	Fri, 13 Oct 2023 16:07:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F81225C0;
	Fri, 13 Oct 2023 16:07:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 698441946589;
	Fri, 13 Oct 2023 15:57:51 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 55F821946587 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Oct 2023 15:57:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 28BC81C060DF; Fri, 13 Oct 2023 15:57:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63FD71C06535;
 Fri, 13 Oct 2023 15:57:46 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Date: Fri, 13 Oct 2023 16:56:38 +0100
Message-ID: <20231013155727.2217781-6-dhowells@redhat.com>
In-Reply-To: <20231013155727.2217781-1-dhowells@redhat.com>
References: <20231013155727.2217781-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Subject: [Linux-cachefs] [RFC PATCH 05/53] netfs: Add a ->free_subrequest()
 op
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
 Shyam Prasad N <sprasad@microsoft.com>, linux-kernel@vger.kernel.org,
 linux-cifs@vger.kernel.org, netdev@vger.kernel.org,
 Dominique Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-mm@kvack.org,
 Marc Dionne <marc.dionne@auristor.com>, v9fs@lists.linux.dev,
 Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
 Christian Brauner <christian@brauner.io>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a ->free_subrequest() op so that the netfs can clean up data attached
to a subrequest.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/objects.c    | 2 ++
 include/linux/netfs.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 2f1865ff7cce..8e92b8401aaa 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -147,6 +147,8 @@ static void netfs_free_subrequest(struct netfs_io_subrequest *subreq,
 	struct netfs_io_request *rreq = subreq->rreq;
 
 	trace_netfs_sreq(subreq, netfs_sreq_trace_free);
+	if (rreq->netfs_ops->free_subrequest)
+		rreq->netfs_ops->free_subrequest(subreq);
 	kfree(subreq);
 	netfs_stat_d(&netfs_n_rh_sreq);
 	netfs_put_request(rreq, was_async, netfs_rreq_trace_put_subreq);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 6942b8cf03dc..ed64d1034afa 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -218,6 +218,7 @@ struct netfs_request_ops {
 	unsigned int	io_subrequest_size;	/* Alloc size for netfs_io_subrequest struct */
 	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
 	void (*free_request)(struct netfs_io_request *rreq);
+	void (*free_subrequest)(struct netfs_io_subrequest *rreq);
 	int (*begin_cache_operation)(struct netfs_io_request *rreq);
 
 	void (*expand_readahead)(struct netfs_io_request *rreq);
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

