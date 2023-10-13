Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 962727C893E
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Oct 2023 17:57:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697212665;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Yky5h0/Hk+yPPsFOe40zs5ktnX2a1TvXhLk0wM3hVBU=;
	b=HamXXZutWy2m2eP5vTXBAyp8/ZUqXjY1aZriKQznes38aUMwdudLQT1saoBEomhAODRKEX
	sn+9nkAbnGRHk94A6VzCaAQQnsM6BU1DqlW7yyNKcsvlazMLRzjmxH9XkVQhBsbFjNua+w
	BgbvtM2MW4oScYobk5kntSLDe3iMvd8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-eUeTtKTcPGmPXjhx6b9qHA-1; Fri, 13 Oct 2023 11:57:44 -0400
X-MC-Unique: eUeTtKTcPGmPXjhx6b9qHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 881EE855311;
	Fri, 13 Oct 2023 15:57:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E50525C2;
	Fri, 13 Oct 2023 15:57:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4968C1946589;
	Fri, 13 Oct 2023 15:57:43 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 782F91946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Oct 2023 15:57:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5AF4A492BE0; Fri, 13 Oct 2023 15:57:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B58C2492BD9;
 Fri, 13 Oct 2023 15:57:39 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Date: Fri, 13 Oct 2023 16:56:36 +0100
Message-ID: <20231013155727.2217781-4-dhowells@redhat.com>
In-Reply-To: <20231013155727.2217781-1-dhowells@redhat.com>
References: <20231013155727.2217781-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Subject: [Linux-cachefs] [RFC PATCH 03/53] netfs: Note nonblockingness in
 the netfs_io_request struct
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

Allow O_NONBLOCK to be noted in the netfs_io_request struct.  Also add a
flag, NETFS_RREQ_BLOCKED to record if we did block.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/objects.c    | 2 ++
 include/linux/netfs.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 85f428fc52e6..e41f9fc9bdd2 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -37,6 +37,8 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	INIT_LIST_HEAD(&rreq->subrequests);
 	refcount_set(&rreq->ref, 1);
 	__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
+	if (file && file->f_flags & O_NONBLOCK)
+		__set_bit(NETFS_RREQ_NONBLOCK, &rreq->flags);
 	if (rreq->netfs_ops->init_request) {
 		ret = rreq->netfs_ops->init_request(rreq, file);
 		if (ret < 0) {
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 282511090ead..b92e982ac4a0 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -205,6 +205,8 @@ struct netfs_io_request {
 #define NETFS_RREQ_DONT_UNLOCK_FOLIOS	3	/* Don't unlock the folios on completion */
 #define NETFS_RREQ_FAILED		4	/* The request failed */
 #define NETFS_RREQ_IN_PROGRESS		5	/* Unlocked when the request completes */
+#define NETFS_RREQ_NONBLOCK		6	/* Don't block if possible (O_NONBLOCK) */
+#define NETFS_RREQ_BLOCKED		7	/* We blocked */
 	const struct netfs_request_ops *netfs_ops;
 };
 
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

