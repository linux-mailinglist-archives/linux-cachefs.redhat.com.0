Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 972B77C8990
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Oct 2023 18:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697213101;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uflvm6whPV1BY8Io+mfB8d9oyIQQhqH1XQaPT4jsX7k=;
	b=MREgQmvjVif9EQE1nmZqhS9SsaYcN3AEmej7tqcI6VWWZCTTtPo98F5JO12Hq+vjRN1ETq
	Tb6dzqUHHI0twqJ3ij8ueOM1Vp5jRV3csD9qpErFVkiHmWCg9I4Ax7v9kG5JFKVmJoOUKB
	5wx16GpCiAcutdXL6baA4INKIuPoanc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-694-AWmZTPibNg-UQU6LJYErJQ-1; Fri, 13 Oct 2023 12:04:57 -0400
X-MC-Unique: AWmZTPibNg-UQU6LJYErJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 532AB855428;
	Fri, 13 Oct 2023 16:04:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 484FB40C6F7F;
	Fri, 13 Oct 2023 16:04:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 124BF19465A2;
	Fri, 13 Oct 2023 16:04:56 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CA66D1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Oct 2023 16:04:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BC6C61C06536; Fri, 13 Oct 2023 16:04:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 253CB1C06535;
 Fri, 13 Oct 2023 16:04:52 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Date: Fri, 13 Oct 2023 17:03:37 +0100
Message-ID: <20231013160423.2218093-9-dhowells@redhat.com>
In-Reply-To: <20231013160423.2218093-1-dhowells@redhat.com>
References: <20231013160423.2218093-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Subject: [Linux-cachefs] [RFC PATCH 08/53] netfs: Add rsize to
 netfs_io_request
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add an rsize parameter to netfs_io_request to be filled in by the network
filesystem when the request is initialised.  This indicates the maximum
size of a read request that the netfs will honour in that region.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/afs/file.c         | 1 +
 fs/ceph/addr.c        | 2 ++
 include/linux/netfs.h | 1 +
 3 files changed, 4 insertions(+)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 3fea5cd8ef13..3d2e1913ea27 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -360,6 +360,7 @@ static int afs_symlink_read_folio(struct file *file, struct folio *folio)
 static int afs_init_request(struct netfs_io_request *rreq, struct file *file)
 {
 	rreq->netfs_priv = key_get(afs_file_key(file));
+	rreq->rsize = 4 * 1024 * 1024;
 	return 0;
 }
 
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index ced19ff08988..92a5ddcd9a76 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -419,6 +419,8 @@ static int ceph_init_request(struct netfs_io_request *rreq, struct file *file)
 	struct ceph_netfs_request_data *priv;
 	int ret = 0;
 
+	rreq->rsize = 1024 * 1024;
+
 	if (rreq->origin != NETFS_READAHEAD)
 		return 0;
 
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index daa431c4148d..02e888c170da 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -188,6 +188,7 @@ struct netfs_io_request {
 	struct list_head	subrequests;	/* Contributory I/O operations */
 	void			*netfs_priv;	/* Private data for the netfs */
 	unsigned int		debug_id;
+	unsigned int		rsize;		/* Maximum read size (0 for none) */
 	atomic_t		nr_outstanding;	/* Number of ops in progress */
 	atomic_t		nr_copy_ops;	/* Number of copy-to-cache ops in progress */
 	size_t			submitted;	/* Amount submitted for I/O so far */
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

