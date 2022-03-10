Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9564D4E88
	for <lists+linux-cachefs@lfdr.de>; Thu, 10 Mar 2022 17:19:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646929181;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V6mWloVduRF2X5oJ/V13VnOiCEs14jM7vlsVKDxIPy8=;
	b=b3jzGFNRq1fmAYMizf6EKzB3bB3mY4psrobS6FHhsCH5kBBYkZwZKIm61EB/JCuNd9hql3
	Z/ytmsdewNwR34PPAHOWwBeihoVKelbHBkCXmb/VhlxPIgJWIceNP4b/3VUAi+OkLKMtgV
	cBhRmfIgOVi9n3/SjdtDNmQ49jYlOiA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-QF0uJPNTMkSD08rhmM9xvA-1; Thu, 10 Mar 2022 11:19:38 -0500
X-MC-Unique: QF0uJPNTMkSD08rhmM9xvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8A9A83395E;
	Thu, 10 Mar 2022 16:19:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 715F5141DEC0;
	Thu, 10 Mar 2022 16:19:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 324E4194E011;
	Thu, 10 Mar 2022 16:19:37 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E8C4B19452D2 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 10 Mar 2022 16:19:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 83D74838D3; Thu, 10 Mar 2022 16:19:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFD8B838DA;
 Thu, 10 Mar 2022 16:18:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 10 Mar 2022 16:18:47 +0000
Message-ID: <164692912709.2099075.4349905992838317797.stgit@warthog.procyon.org.uk>
In-Reply-To: <164692883658.2099075.5745824552116419504.stgit@warthog.procyon.org.uk>
References: <164692883658.2099075.5745824552116419504.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Subject: [Linux-cachefs] [PATCH v3 15/20] netfs: Prepare to split
 read_helper.c
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
 linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename netfs_rreq_unlock() to netfs_rreq_unlock_folios() to make it sound
less like it's dropping a lock on an netfs_io_request struct.

Remove the 'static' marker on netfs_rreq_unlock_folios() and declaring it
in internal.h preparatory to splitting the file.

Changes
=======
ver #2)
 - Slide this patch to after the one adding netfs_begin_read().
 - As a consequence, don't need to unstatic so many functions.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/164623002861.3564931.17340149482236413375.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/164678215208.1200972.9761906209395002182.stgit@warthog.procyon.org.uk/ # v2
---

 fs/netfs/internal.h    |    5 +++++
 fs/netfs/read_helper.c |    4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 937c2465943f..11c0c9ef9299 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -15,6 +15,11 @@
 
 #define pr_fmt(fmt) "netfs: " fmt
 
+/*
+ * buffered_read.c
+ */
+void netfs_rreq_unlock_folios(struct netfs_io_request *rreq);
+
 /*
  * objects.c
  */
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 6864716cfcac..d448dc4f1010 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -250,7 +250,7 @@ static void netfs_rreq_write_to_cache(struct netfs_io_request *rreq)
  * Unlock the folios in a read operation.  We need to set PG_fscache on any
  * folios we're going to write back before we unlock them.
  */
-static void netfs_rreq_unlock(struct netfs_io_request *rreq)
+void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 {
 	struct netfs_io_subrequest *subreq;
 	struct folio *folio;
@@ -432,7 +432,7 @@ static void netfs_rreq_assess(struct netfs_io_request *rreq, bool was_async)
 		return;
 	}
 
-	netfs_rreq_unlock(rreq);
+	netfs_rreq_unlock_folios(rreq);
 
 	clear_bit_unlock(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
 	wake_up_bit(&rreq->flags, NETFS_RREQ_IN_PROGRESS);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

